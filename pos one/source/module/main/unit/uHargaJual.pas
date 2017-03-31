unit uHargaJual;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uRMSUnit, uRMSBaseClass, uConstanta, JclStrings, ADODB,
  uGTINIFile, uNewBarangHargaJual, JvProgressDlg, uMasterItemBarang,
  uNewTipeHarga, uGTEncDec;

type
  THargaJual = class(TRMSBaseClass)
  private
    FBarangHargaJual: TBarangHargaJual;
    FMDBPass: String;
    function GetBarangHargaJual: TBarangHargaJual;
    function GetTipeHargaByUnitID(AUnitID: Integer): Integer;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function CustomTableName: string;
    function GetFieldNameFor_Harga_Jual: string; dynamic;
    function GetFieldNameFor_Disc: string; dynamic;
    function GetFieldNameFor_Id_HargaJual: string; dynamic;
    function GetFieldNameFor_Kode_Sales_Zone: string; dynamic;
    function GetFieldNameFor_Margin: string; dynamic;
    function GetFieldNameFor_Plu: string; dynamic;
    function ImportMDBtoIB(AMDBPath: string; AUnitID: Integer): Boolean;
    procedure LoadConfig;
    property BarangHargaJual: TBarangHargaJual read GetBarangHargaJual write
        FBarangHargaJual;
  end;

implementation

{
******************************* THargaJual *******************************
}
constructor THargaJual.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  LoadConfig;
end;

destructor THargaJual.Destroy;
begin
  inherited Destroy;
end;

function THargaJual.CustomTableName: string;
begin
  Result := 'TblHargaJual';
end;

function THargaJual.GetBarangHargaJual: TBarangHargaJual;
begin
  if FBarangHargaJual = nil then
  begin
    FBarangHargaJual := TBarangHargaJual.Create(Self);
  end;

  Result := FBarangHargaJual;
end;

function THargaJual.GetFieldNameFor_Harga_Jual: string;
begin
  Result := 'Harga_Jual';
end;

function THargaJual.GetFieldNameFor_Disc: string;
begin
  Result := 'Disc';
end;

function THargaJual.GetFieldNameFor_Id_HargaJual: string;
begin
  Result := 'Id_HargaJual';
end;

function THargaJual.GetFieldNameFor_Kode_Sales_Zone: string;
begin
  Result := 'Nama_Divisi';
end;

function THargaJual.GetFieldNameFor_Margin: string;
begin
  Result := 'Margin';
end;

function THargaJual.GetFieldNameFor_Plu: string;
begin
  Result := 'Plu';
end;

function THargaJual.GetTipeHargaByUnitID(AUnitID: Integer): Integer;
var
  lTipeHarga: TNewTipeHarga;
begin
  lTipeHarga := TNewTipeHarga.Create(Self);
  try
    lTipeHarga.LoadByUnitID(AUnitID);
    Result := lTipeHarga.ID;
  finally
    lTipeHarga.Free;
  end;
end;

function THargaJual.ImportMDBtoIB(AMDBPath: string; AUnitID: Integer): Boolean;
var
  dDiscNominal: Double;
  dDiscPersen: Double;
  dSellPrice: Double;
  dSellPriceDisc: Double;
  iTipeHarga: Integer;
  lAQ: TADOQuery;
  LjvProgressDlg: TJvProgressDlg;
  sSQL: string;
begin
  Result := False;
  sSQL := 'SELECT A.*, B.' + TMasterItemBarang.GetFieldNameFor_Kode_CaraBayar
        + ' FROM ' + CustomTableName + ' A '
        + ' INNER JOIN ' + TMasterItemBarang.CustomTableName + ' B '
        + ' ON A.' + GetFieldNameFor_Plu + ' = B.' + TMasterItemBarang.GetFieldNameFor_Plu;

  if cAdoConnect(AMDBPath, FMDBPass) then
  begin
    lAQ := cAdoOpenQuery(sSQL);
    LjvProgressDlg := TJvProgressDlg.Create(nil);
    try
      with LjvProgressDlg do
      begin
        Value := 0;
        Text := 'Importing HargaJual ...';
        Value := 0;
        Maximum := lAQ.RecordCount;
        Show;
        StartProgression;
      end;

      iTipeHarga := GetTipeHargaByUnitID(AUnitID);

      lAQ.First;
      while not lAQ.Eof do
      begin
        dSellPrice      := 0;
        dSellPriceDisc  := 0;
        dDiscNominal    := 0;
        dDiscPersen     := 0;
        if lAQ.FieldByName(TMasterItemBarang.GetFieldNameFor_Kode_CaraBayar).AsString <> 'JB' then
        begin
          dSellPriceDisc := lAQ.FieldByName(GetFieldNameFor_Harga_Jual).AsFloat;
          dDiscNominal   := lAQ.FieldByName(GetFieldNameFor_Disc).AsFloat;
          dSellPrice     := dSellPriceDisc + dDiscNominal;
          if dSellPrice <> 0 then
            dDiscPersen  := 100 * dDiscNominal / dSellPrice;
        end;

        BarangHargaJual.LoadByBarangKode(lAQ.FieldByName(GetFieldNameFor_Plu).AsString);
        BarangHargaJual.UpdateData( BarangHargaJual.AlokasiDanaSupplierID,
                                    dDiscNominal,
                                    dDiscPersen,
                                    BarangHargaJual.ID,
                                    BarangHargaJual.IsLimitQty,
                                    BarangHargaJual.IsQtySubsidy,
                                    BarangHargaJual.KonversiValue,
                                    BarangHargaJual.LimitQty,
                                    BarangHargaJual.LimitQtyPrice,
                                    BarangHargaJual.MarkUp,
                                    lAQ.FieldByName(GetFieldNameFor_Plu).AsString,
                                    AUnitID, // unit
                                    'PCS',
                                    BarangHargaJual.QtySubsidy,
                                    BarangHargaJual.QtySubsidyPrice,
                                    'From MDB',
                                    dSellPrice,
                                    BarangHargaJual.SellPriceCoret,
                                    dSellPriceDisc,
                                    iTipeHarga, // tipe harga
                                    BarangHargaJual.IsMailer,
                                    BarangHargaJual.MaxQtyDisc
                                  );
        if BarangHargaJual.ExecuteGenerateSQL() then
        begin
          Application.ProcessMessages;
          StepProgress(LjvProgressDlg, 'Importing HargaJual ...');
          lAQ.Next;
        end
        else
          Exit;
      end;
      Result := True;
    finally
      lAQ.Free;
      LjvProgressDlg.Close;
      LjvProgressDlg.Free;
      cAdoDisconnect;
    end;
  end;
end;

procedure THargaJual.LoadConfig;
begin
//  FMDBPass := _INIReadString(CONFIG_FILE, DB_POS, 'MDBPass');
  FMDBPass := _Decrypt(_MakeOriginal(_INIReadString(CONFIG_FILE,DB_POS,'MDBPass')),START_KEY,MULTI_KEY,ADD_KEY);
end;

end.
