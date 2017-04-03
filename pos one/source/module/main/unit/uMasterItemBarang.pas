unit uMasterItemBarang;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uRMSUnit, uRMSBaseClass, uConstanta, JclStrings, ADODB,
  uGTINIFile, uNewBarang, uNewMerchandize, uNewMerchandizeGroup, uKategori,
  uKonversiSatuan, JvProgressDlg, uNewTipeBarang, uGTEncDec;

type
  TMasterItemBarang = class(TRMSBaseClass)
  private
    FKonversiSatuan: TKonversiSatuan;
    FMDBPass: String;
    FNewBarang: TNewBarang;
    function GetKategoriByCode(ACode: string): Integer;
    function GetKonversiSatuan: TKonversiSatuan;
    function GetMerchandizeByCode(ACode: string): Integer;
    function GetMerchandizeGroupByCode(ACode: string): Integer;
    function GetNewBarang: TNewBarang;
    function GetTipeBarangByCode(ACode: string): Integer;
    function IsUpdateBarang(AAQ: TADOQuery; AUserID, AUnitID: Integer): Boolean;
    function IsUpdateKonversiSatuan(AAQ: TADOQuery): Boolean;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    class function CustomTableName: string;
    class function GetFieldNameFor_Aktif: string; dynamic;
    class function GetFieldNameFor_Author: string; dynamic;
    class function GetFieldNameFor_Barcode: string; dynamic;
    class function GetFieldNameFor_Berat: string; dynamic;
    class function GetFieldNameFor_CetakanKe: string; dynamic;
    class function GetFieldNameFor_Created_By: string; dynamic;
    class function GetFieldNameFor_Created_Date: string; dynamic;
    class function GetFieldNameFor_Default_Harga_Beli: string; dynamic;
    class function GetFieldNameFor_Default_Harga_Jual: string; dynamic;
    class function GetFieldNameFor_Gambar: string; dynamic;
    class function GetFieldNameFor_HargaJualSama: string; dynamic;
    class function GetFieldNameFor_ISBN: string; dynamic;
    class function GetFieldNameFor_IsMemberDisc: string; dynamic;
    class function GetFieldNameFor_Is_Basic: string; dynamic;
    class function GetFieldNameFor_Is_Local_Discount: string; dynamic;
    class function GetFieldNameFor_KCB: string; dynamic;
    class function GetFieldNameFor_Kode_Brand: string; dynamic;
    class function GetFieldNameFor_Kode_CaraBayar: string; dynamic;
    class function GetFieldNameFor_Kode_Category: string; dynamic;
    class function GetFieldNameFor_Kode_Divisi: string; dynamic;
    class function GetFieldNameFor_Kode_MataUang: string; dynamic;
    class function GetFieldNameFor_Kode_Satuan: string; dynamic;
    class function GetFieldNameFor_Kode_SubCategory: string; dynamic;
    class function GetFieldNameFor_Kode_Supplier: string; dynamic;
    class function GetFieldNameFor_Lebar_Barang: string; dynamic;
    class function GetFieldNameFor_Max_Local_Discount: string; dynamic;
    class function GetFieldNameFor_Nama_Barang: string; dynamic;
    class function GetFieldNameFor_Nama_Pendek: string; dynamic;
    class function GetFieldNameFor_Non_Omzet: string; dynamic;
    class function GetFieldNameFor_Open_Price: string; dynamic;
    class function GetFieldNameFor_Panjang_Barang: string; dynamic;
    class function GetFieldNameFor_Plu: string; dynamic;
    class function GetFieldNameFor_PPN: string; dynamic;
    class function GetFieldNameFor_PPNBM: string; dynamic;
    class function GetFieldNameFor_Returnable: string; dynamic;
    class function GetFieldNameFor_Supplier_Discount: string; dynamic;
    class function GetFieldNameFor_TahunTerbit: string; dynamic;
    class function GetFieldNameFor_Tinggi_Barang: string; dynamic;
    class function GetFieldNameFor_Updated_By: string; dynamic;
    class function GetFieldNameFor_Updated_Date: string; dynamic;
    class function GetFieldNameFor_Warna: string; dynamic;
    function ImportMDBtoIB(AMDBPath: string; AUserID, AUnitID: Integer): Boolean;
    procedure LoadConfig;
    property KonversiSatuan: TKonversiSatuan read GetKonversiSatuan write
        FKonversiSatuan;
    property NewBarang: TNewBarang read GetNewBarang write FNewBarang;
  end;


implementation

{
******************************* TMasterItemBarang *******************************
}
constructor TMasterItemBarang.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  LoadConfig;
end;

destructor TMasterItemBarang.Destroy;
begin
  inherited Destroy;
end;

class function TMasterItemBarang.CustomTableName: string;
begin
  Result := 'TblMasterItemBarang';
end;

class function TMasterItemBarang.GetFieldNameFor_Aktif: string;
begin
  Result := 'Aktif';
end;

class function TMasterItemBarang.GetFieldNameFor_Author: string;
begin
  Result := 'Author';
end;

class function TMasterItemBarang.GetFieldNameFor_Barcode: string;
begin
  Result := 'Barcode';
end;

class function TMasterItemBarang.GetFieldNameFor_Berat: string;
begin
  Result := 'Berat';
end;

class function TMasterItemBarang.GetFieldNameFor_CetakanKe: string;
begin
  Result := 'CetakanKe';
end;

class function TMasterItemBarang.GetFieldNameFor_Created_By: string;
begin
  Result := 'Created_By';
end;

class function TMasterItemBarang.GetFieldNameFor_Created_Date: string;
begin
  Result := 'Created_Date';
end;

class function TMasterItemBarang.GetFieldNameFor_Default_Harga_Beli: string;
begin
  Result := 'Default_Harga_Beli';
end;

class function TMasterItemBarang.GetFieldNameFor_Default_Harga_Jual: string;
begin
  Result := 'Default_Harga_Jual';
end;

class function TMasterItemBarang.GetFieldNameFor_Gambar: string;
begin
  Result := 'Gambar';
end;

class function TMasterItemBarang.GetFieldNameFor_HargaJualSama: string;
begin
  Result := 'HargaJualSama';
end;

class function TMasterItemBarang.GetFieldNameFor_ISBN: string;
begin
  Result := 'ISBN';
end;

class function TMasterItemBarang.GetFieldNameFor_IsMemberDisc: string;
begin
  Result := 'IsMemberDisc';
end;

class function TMasterItemBarang.GetFieldNameFor_Is_Basic: string;
begin
  Result := 'Is_Basic';
end;

class function TMasterItemBarang.GetFieldNameFor_Is_Local_Discount: string;
begin
  Result := 'Is_Local_Discount';
end;

class function TMasterItemBarang.GetFieldNameFor_KCB: string;
begin
  Result := 'KCB';
end;

class function TMasterItemBarang.GetFieldNameFor_Kode_Brand: string;
begin
  Result := 'Kode_Brand';
end;

class function TMasterItemBarang.GetFieldNameFor_Kode_CaraBayar: string;
begin
  Result := 'Kode_CaraBayar';
end;

class function TMasterItemBarang.GetFieldNameFor_Kode_Category: string;
begin
  Result := 'Kode_Category';
end;

class function TMasterItemBarang.GetFieldNameFor_Kode_Divisi: string;
begin
  Result := 'Kode_Divisi';
end;

class function TMasterItemBarang.GetFieldNameFor_Kode_MataUang: string;
begin
  Result := 'Kode_MataUang';
end;

class function TMasterItemBarang.GetFieldNameFor_Kode_Satuan: string;
begin
  Result := 'Kode_Satuan';
end;

class function TMasterItemBarang.GetFieldNameFor_Kode_SubCategory: string;
begin
  Result := 'Kode_SubCategory';
end;

class function TMasterItemBarang.GetFieldNameFor_Kode_Supplier: string;
begin
  Result := 'Kode_Supplier';
end;

class function TMasterItemBarang.GetFieldNameFor_Lebar_Barang: string;
begin
  Result := 'Lebar_Barang';
end;

class function TMasterItemBarang.GetFieldNameFor_Max_Local_Discount: string;
begin
  Result := 'Max_Local_Discount';
end;

class function TMasterItemBarang.GetFieldNameFor_Nama_Barang: string;
begin
  Result := 'Nama_Barang';
end;

class function TMasterItemBarang.GetFieldNameFor_Nama_Pendek: string;
begin
  Result := 'Nama_Pendek';
end;

class function TMasterItemBarang.GetFieldNameFor_Non_Omzet: string;
begin
  Result := 'Non_Omzet';
end;

class function TMasterItemBarang.GetFieldNameFor_Open_Price: string;
begin
  Result := 'Open_Price';
end;

class function TMasterItemBarang.GetFieldNameFor_Panjang_Barang: string;
begin
  Result := 'Panjang_Barang';
end;

class function TMasterItemBarang.GetFieldNameFor_Plu: string;
begin
  Result := 'Plu';
end;

class function TMasterItemBarang.GetFieldNameFor_PPN: string;
begin
  Result := 'PPN';
end;

class function TMasterItemBarang.GetFieldNameFor_PPNBM: string;
begin
  Result := 'PPNBM';
end;

class function TMasterItemBarang.GetFieldNameFor_Returnable: string;
begin
  Result := 'Returnable';
end;

class function TMasterItemBarang.GetFieldNameFor_Supplier_Discount: string;
begin
  Result := 'Supplier_Discount';
end;

class function TMasterItemBarang.GetFieldNameFor_TahunTerbit: string;
begin
  Result := 'TahunTerbit';
end;

class function TMasterItemBarang.GetFieldNameFor_Tinggi_Barang: string;
begin
  Result := 'Tinggi_Barang';
end;

class function TMasterItemBarang.GetFieldNameFor_Updated_By: string;
begin
  Result := 'Updated_By';
end;

class function TMasterItemBarang.GetFieldNameFor_Updated_Date: string;
begin
  Result := 'Updated_Date';
end;

class function TMasterItemBarang.GetFieldNameFor_Warna: string;
begin
  Result := 'Warna';
end;

function TMasterItemBarang.GetKategoriByCode(ACode: string): Integer;
var
  lKategori: TKategori;
begin
  lKategori := TKategori.Create(Self);
  try
    lKategori.LoadByKode(ACode);
    Result := lKategori.ID;
  finally
    lKategori.Free;
  end;
end;

function TMasterItemBarang.GetKonversiSatuan: TKonversiSatuan;
begin
  if FKonversiSatuan = nil then
  begin
    FKonversiSatuan := TKonversiSatuan.Create(Self);
  end;

  Result := FKonversiSatuan;
end;

function TMasterItemBarang.GetMerchandizeByCode(ACode: string): Integer;
var
  lMerchandize: TNewMerchadize;
begin
  lMerchandize := TNewMerchadize.Create(Self);
  try
    lMerchandize.LoadByKode(ACode);
    Result := lMerchandize.ID;
  finally
    lMerchandize.Free;
  end;
end;

function TMasterItemBarang.GetMerchandizeGroupByCode(ACode: string): Integer;
var
  lMerchandizeGroup: TNewMerchandizeGroup;
begin
  lMerchandizeGroup := TNewMerchandizeGroup.Create(Self);
  try
    lMerchandizeGroup.LoadByKode(ACode);
    Result := lMerchandizeGroup.ID;
  finally
    lMerchandizeGroup.Free;
  end;
end;

function TMasterItemBarang.GetNewBarang: TNewBarang;
begin
  if FNewBarang = nil then
  begin
    FNewBarang := TNewBarang.Create(Self);
  end;

  Result := FNewBarang;
end;

function TMasterItemBarang.GetTipeBarangByCode(ACode: string): Integer;
var
  lTipeBarang: TNewTipeBarang;
begin
  lTipeBarang := TNewTipeBarang.Create(Self);
  try
    lTipeBarang.LoadByCode(ACode);
    Result := lTipeBarang.ID;
  finally
    lTipeBarang.Free;
  end;
end;

function TMasterItemBarang.ImportMDBtoIB(AMDBPath: string; AUserID, AUnitID:
    Integer): Boolean;
var
  lAQ: TADOQuery;
  LjvProgressDlg: TJvProgressDlg;
  sSQL: string;
begin
  Result := False;
  sSQL := 'SELECT * FROM ' + CustomTableName;

  if cAdoConnect(AMDBPath, FMDBPass) then
  begin
    LjvProgressDlg := TJvProgressDlg.Create(nil);
    lAQ := cAdoOpenQuery(sSQL);
    try
      with LjvProgressDlg do
      begin
        Value := 0;
        Text := 'Importing MasterItemBarang ...';
        Value := 0;
        Maximum := lAQ.RecordCount;
        Show;
        StartProgression;
      end;

      lAQ.First;
      while not lAQ.Eof do
      begin
        if IsUpdateBarang(lAQ, AUserID, AUnitID) and IsUpdateKonversiSatuan(lAQ) then
        begin
          Application.ProcessMessages;
          StepProgress(LjvProgressDlg, 'Importing MasterItemBarang ...');
          lAQ.Next;
        end
        else
        begin
          ShowMessage('Error di PLU = ' + lAQ.FieldByName(GetFieldNameFor_Plu).AsString);
          Exit;
        end;

      end;
      Result := True;
    finally
      lAQ.Free;
      LjvProgressDlg.Close;
      LjvProgressDlg.Free;
      cAdoDisconnect;
    end
  end;
end;

function TMasterItemBarang.IsUpdateBarang(AAQ: TADOQuery; AUserID, AUnitID:
    Integer): Boolean;
var
  iPajak: Integer;
  sKodeLama: string;
begin
  if NewBarang.LoadByKode(AAQ.FieldByName(GetFieldNameFor_Plu).Asstring) then
    sKodeLama := AAQ.FieldByName(GetFieldNameFor_Plu).Asstring
  else
    sKodeLama := '';

  iPajak := 2;
  if AAQ.FieldByName(GetFieldNameFor_PPN).AsInteger <> 1 then
    iPajak := 1;

  NewBarang.UpdateData( AAQ.FieldByName(GetFieldNameFor_Nama_Pendek).Asstring,
                        NewBarang.Catalog,
                        NewBarang.DefaultMarkUP,
                        NewBarang.ExpireTime,
                        AAQ.FieldByName(GetFieldNameFor_Tinggi_Barang).AsString,
                        AAQ.FieldByName(GetFieldNameFor_Aktif).AsInteger,
                        NewBarang.IsBuild,
                        NewBarang.IsCS,
                        NewBarang.IsDecimal,
                        NewBarang.IsDeposit,
                        NewBarang.IsDiscGMC,
                        NewBarang.IsGalon,
                        NewBarang.IsPajakInclude,
                        NewBarang.IsStock,
                        1,
                        GetKategoriByCode(AAQ.FieldByName(GetFieldNameFor_Kode_SubCategory).Asstring),  //kategori
                        AAQ.FieldByName(GetFieldNameFor_Plu).Asstring,
                        AAQ.FieldByName(GetFieldNameFor_Plu).Asstring,
                        'PCS',  //UOM
                        AAQ.FieldByName(GetFieldNameFor_Panjang_Barang).AsString,
                        NewBarang.Merk,
                        AAQ.FieldByName(GetFieldNameFor_Nama_Barang).Asstring,
                        iPajak,
                        NewBarang.NewLocation.Kode,
                        GetMerchandizeByCode(AAQ.FieldByName(GetFieldNameFor_Kode_Divisi).Asstring),  //merchandise
                        GetMerchandizeGroupByCode(AAQ.FieldByName(GetFieldNameFor_Kode_Category).Asstring),  //merchandise grup
                        NewBarang.SalesOutlet.ID,
                        GetTipeBarangByCode(AAQ.FieldByName(GetFieldNameFor_Kode_CaraBayar).Asstring),  //tipe
                        NewBarang.UOMDiameter,
                        NewBarang.UOMVolume,
                        NewBarang.UOMWeight,
                        AUserID,  //user
                        AUnitID,  //unit
                        AAQ.FieldByName(GetFieldNameFor_Lebar_Barang).AsString,
                        NewBarang.HargaAverage,
                        NewBarang.BarangGalon.Kode,
                        NewBarang.AuthorId,
                        NewBarang.PubsId,
                        NewBarang.SafetyStock,
                        AAQ.FieldByName(GetFieldNameFor_Is_Basic).AsInteger
                      );
  Result := NewBarang.ExecuteGenerateSQL(sKodeLama)
end;

function TMasterItemBarang.IsUpdateKonversiSatuan(AAQ: TADOQuery): Boolean;
var
  sCode: string;
begin
  sCode := AAQ.FieldByName(GetFieldNameFor_Plu).AsString;
  KonversiSatuan.LoadByKodeBarangAndUOMStock(sCode,'PCS','PCS');
  KonversiSatuan.UpdateData(  KonversiSatuan.ID,
                              sCode,
                              'PCS',
                              'PCS',
                              1,
                              AAQ.FieldByName(GetFieldNameFor_Barcode).AsString
                            );
  Result := KonversiSatuan.ExecuteGenerateSQL;
end;

procedure TMasterItemBarang.LoadConfig;
begin
//  FMDBPass := _INIReadString(CONFIG_FILE, DB_POS, 'MDBPass');
  FMDBPass := _Decrypt(_MakeOriginal(_INIReadString(CONFIG_FILE,DB_POS,'MDBPass')),START_KEY,MULTI_KEY,ADD_KEY);
end;

end.
