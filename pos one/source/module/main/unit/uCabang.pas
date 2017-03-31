unit uCabang;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uNewUnit, uRMSUnit, uRMSBaseClass, uConstanta, JclStrings, ADODB,
  uGTINIFile, JvProgressDlg, DB, uNewTipeHarga, uGTEncDec;

type
  TCabang = class(TRMSBaseClass)
  private
    FMDBPass: String;
    FNewUnit: TUnit;
    FTipeHarga: TNewTipeHarga;
    function GetNewUnit: TUnit;
    function GetTipeHarga: TNewTipeHarga;
    function IsUpdateTipeHarga(AAQ: TADOQuery; AUserID, aUnitID, ACompID: Integer):
        Boolean;
    function IsUpdateUnit(AAQ: TADOQuery; AUserID, aUnitID, ACompID: Integer):
        Boolean;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function CustomTableName: string;
    function GetFieldNameFor_Active: string; dynamic;
    function GetFieldNameFor_Alamat: string; dynamic;
    function GetFieldNameFor_Alamat_NPWP: string; dynamic;
    function GetFieldNameFor_Created_By: string; dynamic;
    function GetFieldNameFor_Created_Date: string; dynamic;
    function GetFieldNameFor_Default_Kode_Kirim_PO: string; dynamic;
    function GetFieldNameFor_EDP: string; dynamic;
    function GetFieldNameFor_email: string; dynamic;
    function GetFieldNameFor_ftp: string; dynamic;
    function GetFieldNameFor_JenisEntitas: string; dynamic;
    function GetFieldNameFor_Kepala_Adm: string; dynamic;
    function GetFieldNameFor_Kode_Cabang: string; dynamic;
    function GetFieldNameFor_Kode_Pos: string; dynamic;
    function GetFieldNameFor_Kode_Regional: string; dynamic;
    function GetFieldNameFor_Kode_Sales_Zone: string; dynamic;
    function GetFieldNameFor_Nama_Cabang: string; dynamic;
    function GetFieldNameFor_No_Fax: string; dynamic;
    function GetFieldNameFor_No_Telpon: string; dynamic;
    function GetFieldNameFor_NPWP: string; dynamic;
    function GetFieldNameFor_PasswordEmail: string; dynamic;
    function GetFieldNameFor_PasswordFtp: string; dynamic;
    function GetFieldNameFor_Propinsi: string; dynamic;
    function GetFieldNameFor_Store_Manager: string; dynamic;
    function GetFieldNameFor_Tanggal_Pembukaan: string; dynamic;
    function GetFieldNameFor_Updated_By: string; dynamic;
    function GetFieldNameFor_Updated_Date: string; dynamic;
    function GetFieldNameFor_Wakil_Store_Manager: string; dynamic;
    function ImportMDBtoIB(AMDBPath: string; AUserID, AUnitID, ACompID: Integer):
        Boolean;
    procedure LoadConfig;
    property NewUnit: TUnit read GetNewUnit write FNewUnit;
    property TipeHarga: TNewTipeHarga read GetTipeHarga write FTipeHarga;
  end;


implementation

{
******************************* TCabang *******************************
}
constructor TCabang.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  LoadConfig;
end;

destructor TCabang.Destroy;
begin
  inherited Destroy;
end;

function TCabang.CustomTableName: string;
begin
  Result := 'TblCabang';
end;

function TCabang.GetFieldNameFor_Active: string;
begin
  Result := 'Active';
end;

function TCabang.GetFieldNameFor_Alamat: string;
begin
  Result := 'Alamat';
end;

function TCabang.GetFieldNameFor_Alamat_NPWP: string;
begin
  Result := 'Alamat_NPWP';
end;

function TCabang.GetFieldNameFor_Created_By: string;
begin
  Result := 'Created_By';
end;

function TCabang.GetFieldNameFor_Created_Date: string;
begin
  Result := 'Created_Date';
end;

function TCabang.GetFieldNameFor_Default_Kode_Kirim_PO: string;
begin
  Result := 'Default_Kode_Kirim_PO';
end;

function TCabang.GetFieldNameFor_EDP: string;
begin
  Result := 'EDP';
end;

function TCabang.GetFieldNameFor_email: string;
begin
  Result := 'email';
end;

function TCabang.GetFieldNameFor_ftp: string;
begin
  Result := 'ftp';
end;

function TCabang.GetFieldNameFor_JenisEntitas: string;
begin
  Result := 'JenisEntitas';
end;

function TCabang.GetFieldNameFor_Kepala_Adm: string;
begin
  Result := 'Kepala_Adm';
end;

function TCabang.GetFieldNameFor_Kode_Cabang: string;
begin
  Result := 'Kode_Cabang';
end;

function TCabang.GetFieldNameFor_Kode_Pos: string;
begin
  Result := 'Kode_Pos';
end;

function TCabang.GetFieldNameFor_Kode_Regional: string;
begin
  Result := 'Kode_Regional';
end;

function TCabang.GetFieldNameFor_Kode_Sales_Zone: string;
begin
  Result := 'Kode_Sales_Zone';
end;

function TCabang.GetFieldNameFor_Nama_Cabang: string;
begin
  Result := 'Nama_Cabang';
end;

function TCabang.GetFieldNameFor_No_Fax: string;
begin
  Result := 'No_Fax';
end;

function TCabang.GetFieldNameFor_No_Telpon: string;
begin
  Result := 'No_Telpon';
end;

function TCabang.GetFieldNameFor_NPWP: string;
begin
  Result := 'NPWP';
end;

function TCabang.GetFieldNameFor_PasswordEmail: string;
begin
  Result := 'PasswordEmail';
end;

function TCabang.GetFieldNameFor_PasswordFtp: string;
begin
  Result := 'PasswordFtp';
end;

function TCabang.GetFieldNameFor_Propinsi: string;
begin
  Result := 'Propinsi';
end;

function TCabang.GetFieldNameFor_Store_Manager: string;
begin
  Result := 'Store_Manager';
end;

function TCabang.GetFieldNameFor_Tanggal_Pembukaan: string;
begin
  Result := 'Tanggal_Pembukaan';
end;

function TCabang.GetFieldNameFor_Updated_By: string;
begin
  Result := 'Updated_By';
end;

function TCabang.GetFieldNameFor_Updated_Date: string;
begin
  Result := 'Updated_Date';
end;

function TCabang.GetFieldNameFor_Wakil_Store_Manager: string;
begin
  Result := 'Wakil_Store_Manager';
end;

function TCabang.GetNewUnit: TUnit;
begin
  if FNewUnit = nil then
  begin
    FNewUnit := TUnit.Create(Self);
  end;

  Result := FNewUnit;
end;

function TCabang.GetTipeHarga: TNewTipeHarga;
begin
  if FTipeHarga = nil then
  begin
    FTipeHarga := TNewTipeHarga.Create(Self);
  end;

  Result := FTipeHarga;
end;

function TCabang.ImportMDBtoIB(AMDBPath: string; AUserID, AUnitID, ACompID:
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
    lAQ := cAdoOpenQuery(sSQL);
    LjvProgressDlg := TJvProgressDlg.Create(nil);
    try
      with LjvProgressDlg do
      begin
        Value := 0;
        Text := 'Importing Cabang ...';
        Value := 0;
        Maximum := lAQ.RecordCount;
        Show;
        StartProgression;
      end;

      lAQ.First;
      while not lAQ.Eof do
      begin
        if IsUpdateUnit(lAQ, AUserID, AUnitID, ACompID) and IsUpdateTipeHarga(lAQ, AUserID, AUnitID, ACompID) then
        begin
          Application.ProcessMessages;
          StepProgress(LjvProgressDlg, 'Importing Cabang ...');
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

function TCabang.IsUpdateTipeHarga(AAQ: TADOQuery; AUserID, aUnitID, ACompID:
    Integer): Boolean;
begin
  TipeHarga.LoadByUnitID(NewUnit.ID);
  TipeHarga.UpdateData( TipeHarga.ID,
                        'H' + AAQ.FieldByName(GetFieldNameFor_Kode_Cabang).Asstring,
                        'Harga ' + AAQ.FieldByName(GetFieldNameFor_Kode_Cabang).Asstring,
                        NewUnit.ID);
  Result := TipeHarga.ExecuteGenerateSQL;
end;

function TCabang.IsUpdateUnit(AAQ: TADOQuery; AUserID, aUnitID, ACompID:
    Integer): Boolean;
begin
  NewUnit.LoadByKode(AAQ.FieldByName(GetFieldNameFor_Kode_Cabang).Asstring);
  NewUnit.UpdateData( 2, //NewUnit.AppID = Store,
                      ACompID,
                      AAQ.FieldByName(GetFieldNameFor_Nama_Cabang).Asstring,
                      NewUnit.ID,
                      AAQ.FieldByName(GetFieldNameFor_Kode_Cabang).Asstring,
                      AAQ.FieldByName(GetFieldNameFor_Nama_Cabang).Asstring,
                      NewUnit.isAllowPo = 1,
                      NewUnit.IsGRAllowed = 1,
                      1, // IsStore = True
                      NewUnit.UnitType.UnitTypeID,
                      NewUnit.ParentID,
                      AAQ.FieldByName(GetFieldNameFor_Kode_Pos).Asstring,
                      AAQ.FieldByName(GetFieldNameFor_No_Telpon).Asstring,
                      AAQ.FieldByName(GetFieldNameFor_No_Fax).Asstring,
                      NewUnit.Contact,
                      AAQ.FieldByName(GetFieldNameFor_email).Asstring,
                      NewUnit.Prop.Prop_ID,
                      NewUnit.Kab.Kab_ID,
                      IntToStr(AAQ.FieldByName(GetFieldNameFor_Kode_Regional).AsInteger),
                      AUserID,
                      AUnitID,
                      11,
                      AAQ.FieldByName(GetFieldNameFor_Alamat).Asstring,
                      AAQ.FieldByName(GetFieldNameFor_NPWP).Asstring,
                      NewUnit.UnitInfo.NpwpNm,
                      AAQ.FieldByName(GetFieldNameFor_Alamat_NPWP).Asstring,
                      NewUnit.UnitInfo.NpwpRegs,
                      AAQ.FieldByName(GetFieldNameFor_Active).AsInteger
                    );
  Result := NewUnit.SaveToDB;
end;

procedure TCabang.LoadConfig;
begin
//  FMDBPass := _INIReadString(CONFIG_FILE, DB_POS, 'MDBPass');
  FMDBPass := _Decrypt(_MakeOriginal(_INIReadString(CONFIG_FILE,DB_POS,'MDBPass')),START_KEY,MULTI_KEY,ADD_KEY);
end;

end.
