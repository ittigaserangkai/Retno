unit uRegional;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uRMSUnit, uRMSBaseClass, uConstanta, JclStrings, ADODB,
  uGTINIFile, uRegion, uGTEncDec;

type
  TRegional = class(TRMSBaseClass)
  private
    FMDBPass: String;
    FRegion: TRegion;
    function GetRegion: TRegion;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function CustomTableName: string;
    function GetFieldNameFor_Created_By: string; dynamic;
    function GetFieldNameFor_Created_Date: string; dynamic;
    function GetFieldNameFor_Kepala_Regional: string; dynamic;
    function GetFieldNameFor_Kode_Regional: string; dynamic;
    function GetFieldNameFor_Nama_Wilayah: string; dynamic;
    function GetFieldNameFor_Updated_By: string; dynamic;
    function GetFieldNameFor_Updated_Date: string; dynamic;
    function ImportMDBtoIB(AMDBPath: string; AUnitID: Integer): Boolean;
    procedure LoadConfig;
    property Region: TRegion read GetRegion write FRegion;
  end;


implementation

uses
  JvProgressDlg, DB;

{
******************************* TRegional *******************************
}
constructor TRegional.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  LoadConfig;
end;

destructor TRegional.Destroy;
begin
  inherited Destroy;
end;

function TRegional.CustomTableName: string;
begin
  Result := 'TblRegional';
end;

function TRegional.GetFieldNameFor_Created_By: string;
begin
  Result := 'Created_By';
end;

function TRegional.GetFieldNameFor_Created_Date: string;
begin
  Result := 'Created_Date';
end;

function TRegional.GetFieldNameFor_Kepala_Regional: string;
begin
  Result := 'Kepala_Regional';
end;

function TRegional.GetFieldNameFor_Kode_Regional: string;
begin
  Result := 'Kode_Regional';
end;

function TRegional.GetFieldNameFor_Nama_Wilayah: string;
begin
  Result := 'Nama_Wilayah';
end;

function TRegional.GetFieldNameFor_Updated_By: string;
begin
  Result := 'Updated_By';
end;

function TRegional.GetFieldNameFor_Updated_Date: string;
begin
  Result := 'Updated_Date';
end;

function TRegional.GetRegion: TRegion;
begin
  if FRegion = nil then
  begin
    FRegion := TRegion.Create(Self);
  end;

  Result := FRegion;
end;

function TRegional.ImportMDBtoIB(AMDBPath: string; AUnitID: Integer): Boolean;
var
  iCode: Integer;
  lAQ: TADOQuery;
  LjvProgressDlg: TJvProgressDlg;
  sSQL: string;
begin
  Result := False;
  sSQL := 'SELECT * FROM ' + CustomTableName + ' ORDER BY ' + GetFieldNameFor_Kode_Regional;

  if cAdoConnect(AMDBPath, FMDBPass) then
  begin
    lAQ := cAdoOpenQuery(sSQL);
    LjvProgressDlg := TJvProgressDlg.Create(nil);
    try
      with LjvProgressDlg do
      begin
        Value := 0;
        Text := 'Importing Regional ...';
        Value := 0;
        Maximum := lAQ.RecordCount;
        Show;
        StartProgression;
      end;

      lAQ.First;
      while not lAQ.Eof do
      begin
        iCode := lAQ.FieldByName(GetFieldNameFor_Kode_Regional).AsInteger;
        Region.LoadByID(IntToStr(iCode));
        Region.UpdateData(  Region.RgnCode,
                            lAQ.FieldByName(GetFieldNameFor_Nama_Wilayah).Asstring,
                            AUnitID,
                            ''
                          );
        if Region.ExecuteGenerateSQLSyncronMDB(IntToStr(iCode)) then
        begin
          Application.ProcessMessages;
          StepProgress(LjvProgressDlg, 'Importing Regional ...');
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

procedure TRegional.LoadConfig;
begin
//  FMDBPass := _INIReadString(CONFIG_FILE, DB_POS, 'MDBPass');
  FMDBPass := _Decrypt(_MakeOriginal(_INIReadString(CONFIG_FILE,DB_POS,'MDBPass')),START_KEY,MULTI_KEY,ADD_KEY);
end;

end.
