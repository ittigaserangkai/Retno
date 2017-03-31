unit uSubCategory;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uRMSUnit, uRMSBaseClass, uConstanta, JclStrings, ADODB,
  uGTINIFile, uSubGroup, uNewMerchandizeGroup, uKategori, uGTEncDec;

type
  TSubCategory = class(TRMSBaseClass)
  private
    FKategori: TKategori;
    FMDBPass: String;
    FSubGroup: TSubGroup;
    function GetKategori: TKategori;
    function GetMerchandizeGroupByCode(ACode: string): Integer;
    function GetSubGroup: TSubGroup;
    function GetSubGroupByCode(ACode: string): Integer;
    function IsUpdateKategori(AAQ: TADOQuery): Boolean;
    function IsUpdateSubGroup(AAQ: TADOQuery): Boolean;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function CustomTableName: string;
    function GetFieldNameFor_Created_By: string; dynamic;
    function GetFieldNameFor_Created_Date: string; dynamic;
    function GetFieldNameFor_Kode_Category: string; dynamic;
    function GetFieldNameFor_Kode_Divisi: string; dynamic;
    function GetFieldNameFor_Kode_SubCategory: string; dynamic;
    function GetFieldNameFor_Nama_SubCategory: string; dynamic;
    function GetFieldNameFor_Updated_By: string; dynamic;
    function GetFieldNameFor_Updated_Date: string; dynamic;
    function ImportMDBtoIB(AMDBPath: string): Boolean;
    procedure LoadConfig;
    property Kategori: TKategori read GetKategori write FKategori;
    property SubGroup: TSubGroup read GetSubGroup write FSubGroup;
  end;


implementation

uses
  JvProgressDlg;

{
******************************* TSubCategory *******************************
}
constructor TSubCategory.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  LoadConfig;
end;

destructor TSubCategory.Destroy;
begin
  inherited Destroy;
end;

function TSubCategory.CustomTableName: string;
begin
  Result := 'TblSubCategory';
end;

function TSubCategory.GetFieldNameFor_Created_By: string;
begin
  Result := 'Created_By';
end;

function TSubCategory.GetFieldNameFor_Created_Date: string;
begin
  Result := 'Created_Date';
end;

function TSubCategory.GetFieldNameFor_Kode_Category: string;
begin
  Result := 'Kode_Category';
end;

function TSubCategory.GetFieldNameFor_Kode_Divisi: string;
begin
  Result := 'Kode_Divisi';
end;

function TSubCategory.GetFieldNameFor_Kode_SubCategory: string;
begin
  Result := 'Kode_SubCategory';
end;

function TSubCategory.GetFieldNameFor_Nama_SubCategory: string;
begin
  Result := 'Nama_SubCategory';
end;

function TSubCategory.GetFieldNameFor_Updated_By: string;
begin
  Result := 'Updated_By';
end;

function TSubCategory.GetFieldNameFor_Updated_Date: string;
begin
  Result := 'Updated_Date';
end;

function TSubCategory.GetKategori: TKategori;
begin
  if FKategori = nil then
  begin
    FKategori := TKategori.Create(Self);
  end;

  Result := FKategori;
end;

function TSubCategory.GetMerchandizeGroupByCode(ACode: string): Integer;
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

function TSubCategory.GetSubGroup: TSubGroup;
begin
  if FSubGroup = nil then
  begin
    FSubGroup := TSubGroup.Create(Self);
  end;

  Result := FSubGroup;
end;

function TSubCategory.GetSubGroupByCode(ACode: string): Integer;
var
  lSubGroup: TSubGroup;
begin
  lSubGroup := TSubGroup.Create(Self);
  try
    lSubGroup.LoadByKode(ACode);
    Result := lSubGroup.ID;
  finally
    lSubGroup.Free;
  end;
end;

function TSubCategory.ImportMDBtoIB(AMDBPath: string): Boolean;
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
        Text := 'Importing SubCategory ...';
        Value := 0;
        Maximum := lAQ.RecordCount;
        Show;
        StartProgression;
      end;

      lAQ.First;
      while not lAQ.Eof do
      begin
        if IsUpdateSubGroup(lAQ) and IsUpdateKategori(lAQ) then
        begin
          Application.ProcessMessages;
          StepProgress(LjvProgressDlg, 'Importing SubCategory ...');
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

function TSubCategory.IsUpdateKategori(AAQ: TADOQuery): Boolean;
var
  sCode: string;
  sKodeLama: string;
begin
  sCode := AAQ.FieldByName(GetFieldNameFor_Kode_SubCategory).AsString;
//  Delete(sCode,1,Length(AAQ.FieldByName(GetFieldNameFor_Kode_Category).AsString));

  if Kategori.LoadByKode(sCode) then
    sKodeLama := sCode
  else
    sKodeLama := '';

  Kategori.UpdateData(  Kategori.ID,
                        sCode,
                        AAQ.FieldByName(GetFieldNameFor_Nama_SubCategory).AsString,
                        GetSubGroupByCode(sCode)
                      );
  Result := Kategori.ExecuteGenerateSQL(sKodeLama)
end;

function TSubCategory.IsUpdateSubGroup(AAQ: TADOQuery): Boolean;
var
  sCode: string;
  sKodeLama: string;
begin
  sCode := AAQ.FieldByName(GetFieldNameFor_Kode_SubCategory).AsString;
//  Delete(sCode,1,Length(AAQ.FieldByName(GetFieldNameFor_Kode_Category).AsString));

  if SubGroup.LoadByKode(sCode) then
    sKodeLama := sCode
  else
    sKodeLama := '';

  SubGroup.UpdateData(  GetMerchandizeGroupByCode(AAQ.FieldByName(GetFieldNameFor_Kode_Category).AsString),
                        SubGroup.ID,
                        sCode,
                        AAQ.FieldByName(GetFieldNameFor_Nama_SubCategory).AsString,
                        SubGroup.SafetyStock,
                        SubGroup.GrsProfit
                      );
  Result := SubGroup.ExecuteGenerateSQL(sKodeLama)
end;

procedure TSubCategory.LoadConfig;
begin
//  FMDBPass := _INIReadString(CONFIG_FILE, DB_POS, 'MDBPass');
  FMDBPass := _Decrypt(_MakeOriginal(_INIReadString(CONFIG_FILE,DB_POS,'MDBPass')),START_KEY,MULTI_KEY,ADD_KEY);
end;

end.
