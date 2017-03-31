unit uDivisi;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uRMSUnit, uRMSBaseClass, uConstanta, JclStrings, ADODB,
  uGTINIFile, uNewMerchandize, uNewPajak, uGTEncDec;

type
  TDivisi = class(TRMSBaseClass)
  private
    FMDBPass: String;
    FNewMerchandize: TNewMerchadize;
    function GetNewMerchandize: TNewMerchadize;
    function GetPajakByCode(ACode: string): Integer;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function CustomTableName: string;
    function GetFieldNameFor_Created_By: string; dynamic;
    function GetFieldNameFor_Created_Date: string; dynamic;
    function GetFieldNameFor_Jenis: string; dynamic;
    function GetFieldNameFor_Kode_Divisi: string; dynamic;
    function GetFieldNameFor_Manager_Divisi: string; dynamic;
    function GetFieldNameFor_Nama_Divisi: string; dynamic;
    function GetFieldNameFor_Updated_By: string; dynamic;
    function GetFieldNameFor_Updated_Date: string; dynamic;
    function ImportMDBtoIB(AMDBPath: string): Boolean;
    procedure LoadConfig;
    property NewMerchandize: TNewMerchadize read GetNewMerchandize write
        FNewMerchandize;
  end;


implementation

uses
  JvProgressDlg, DB;

{
******************************* TDivisi *******************************
}
constructor TDivisi.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  LoadConfig;
end;

destructor TDivisi.Destroy;
begin
  inherited Destroy;
end;

function TDivisi.CustomTableName: string;
begin
  Result := 'TblDivisi';
end;

function TDivisi.GetFieldNameFor_Created_By: string;
begin
  Result := 'Created_By';
end;

function TDivisi.GetFieldNameFor_Created_Date: string;
begin
  Result := 'Created_Date';
end;

function TDivisi.GetFieldNameFor_Jenis: string;
begin
  Result := 'Jenis';
end;

function TDivisi.GetFieldNameFor_Kode_Divisi: string;
begin
  Result := 'Kode_Divisi';
end;

function TDivisi.GetFieldNameFor_Manager_Divisi: string;
begin
  Result := 'Manager_Divisi';
end;

function TDivisi.GetFieldNameFor_Nama_Divisi: string;
begin
  Result := 'Nama_Divisi';
end;

function TDivisi.GetFieldNameFor_Updated_By: string;
begin
  Result := 'Updated_By';
end;

function TDivisi.GetFieldNameFor_Updated_Date: string;
begin
  Result := 'Updated_Date';
end;

function TDivisi.GetNewMerchandize: TNewMerchadize;
begin
  if FNewMerchandize = nil then
  begin
    FNewMerchandize := TNewMerchadize.Create(Self);
  end;

  Result := FNewMerchandize;
end;

function TDivisi.GetPajakByCode(ACode: string): Integer;
var
  lPajak: TNewPajak;
begin
  lPajak := TNewPajak.Create(Self);
  try
    lPajak.LoadByKode(ACode);
    Result := lPajak.ID;
  finally
    lPajak.Free;
  end;
end;

function TDivisi.ImportMDBtoIB(AMDBPath: string): Boolean;
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
        Text := 'Importing Divisi ...';
        Value := 0;
        Maximum := lAQ.RecordCount;
        Show;
        StartProgression;
      end;

      lAQ.First;
      while not lAQ.Eof do
      begin
        NewMerchandize.LoadByKode(lAQ.FieldByName(GetFieldNameFor_Kode_Divisi).Asstring);
        NewMerchandize.UpdateData(  NewMerchandize.ID,
                                    lAQ.FieldByName(GetFieldNameFor_Kode_Divisi).Asstring,
                                    lAQ.FieldByName(GetFieldNameFor_Nama_Divisi).Asstring,
                                    GetPajakByCode('0')
                                  );
        if NewMerchandize.ExecuteGenerateSQL() then
        begin
          Application.ProcessMessages;
          StepProgress(LjvProgressDlg, 'Importing Divisi ...');
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

procedure TDivisi.LoadConfig;
begin
//  FMDBPass := _INIReadString(CONFIG_FILE, DB_POS, 'MDBPass');
  FMDBPass := _Decrypt(_MakeOriginal(_INIReadString(CONFIG_FILE,DB_POS,'MDBPass')),START_KEY,MULTI_KEY,ADD_KEY);
end;

end.
