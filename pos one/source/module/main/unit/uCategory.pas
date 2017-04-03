unit uCategory;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uRMSUnit, uRMSBaseClass, uConstanta, JclStrings, ADODB,
  uGTINIFile, uNewMerchandizeGroup, uNewMerchandize, uGTEncDec;

type
  TCategory = class(TRMSBaseClass)
  private
    FMDBPass: String;
    FNewMerchandizeGroup: TNewMerchandizeGroup;
    function GetMerchandizeByCode(ACode: string): Integer;
    function GetNewMerchandizeGroup: TNewMerchandizeGroup;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function CustomTableName: string;
    function GetFieldNameFor_Created_By: string; dynamic;
    function GetFieldNameFor_Created_Date: string; dynamic;
    function GetFieldNameFor_Kode_Category: string; dynamic;
    function GetFieldNameFor_Kode_Divisi: string; dynamic;
    function GetFieldNameFor_Nama_Category: string; dynamic;
    function GetFieldNameFor_Updated_By: string; dynamic;
    function GetFieldNameFor_Updated_Date: string; dynamic;
    function ImportMDBtoIB(AMDBPath: string; ACompID: Integer): Boolean;
    procedure LoadConfig;
    property NewMerchandizeGroup: TNewMerchandizeGroup read GetNewMerchandizeGroup
        write FNewMerchandizeGroup;
  end;


implementation

uses
  JvProgressDlg;

{
******************************* TCategory *******************************
}
constructor TCategory.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  LoadConfig;
end;

destructor TCategory.Destroy;
begin
  inherited Destroy;
end;

function TCategory.CustomTableName: string;
begin
  Result := 'TblCategory';
end;

function TCategory.GetFieldNameFor_Created_By: string;
begin
  Result := 'Created_By';
end;

function TCategory.GetFieldNameFor_Created_Date: string;
begin
  Result := 'Created_Date';
end;

function TCategory.GetFieldNameFor_Kode_Category: string;
begin
  Result := 'Kode_Category';
end;

function TCategory.GetFieldNameFor_Kode_Divisi: string;
begin
  Result := 'Kode_Divisi';
end;

function TCategory.GetFieldNameFor_Nama_Category: string;
begin
  Result := 'Nama_Category';
end;

function TCategory.GetFieldNameFor_Updated_By: string;
begin
  Result := 'Updated_By';
end;

function TCategory.GetFieldNameFor_Updated_Date: string;
begin
  Result := 'Updated_Date';
end;

function TCategory.GetMerchandizeByCode(ACode: string): Integer;
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

function TCategory.GetNewMerchandizeGroup: TNewMerchandizeGroup;
begin
  if FNewMerchandizeGroup = nil then
  begin
    FNewMerchandizeGroup := TNewMerchandizeGroup.Create(Self);
  end;

  Result := FNewMerchandizeGroup;
end;

function TCategory.ImportMDBtoIB(AMDBPath: string; ACompID: Integer): Boolean;
var
  lAQ: TADOQuery;
  LjvProgressDlg: TJvProgressDlg;
  sCode: string;
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
        Text := 'Importing Category ...';
        Value := 0;
        Maximum := lAQ.RecordCount;
        Show;
        StartProgression;
      end;

      lAQ.First;
      while not lAQ.Eof do
      begin
        sCode := lAQ.FieldByName(GetFieldNameFor_Kode_Category).AsString;
//        Delete(sCode,1,Length(lAQ.FieldByName(GetFieldNameFor_Kode_Divisi).AsString));
        NewMerchandizeGroup.LoadByKode(sCode);
        NewMerchandizeGroup.UpdateData( ACompID,
                                        NewMerchandizeGroup.DefaultMarkUp,
                                        NewMerchandizeGroup.ID,
                                        sCode,
                                        '0',
                                        lAQ.FieldByName(GetFieldNameFor_Nama_Category).Asstring,
                                        GetMerchandizeByCode(lAQ.FieldByName(GetFieldNameFor_Kode_Divisi).Asstring)
                                      );
        if NewMerchandizeGroup.ExecuteGenerateSQL() then
        begin
          Application.ProcessMessages;
          StepProgress(LjvProgressDlg, 'Importing Category ...');
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

procedure TCategory.LoadConfig;
begin
//  FMDBPass := _INIReadString(CONFIG_FILE, DB_POS, 'MDBPass');
  FMDBPass := _Decrypt(_MakeOriginal(_INIReadString(CONFIG_FILE,DB_POS,'MDBPass')),START_KEY,MULTI_KEY,ADD_KEY);
end;

end.
