unit uNewUnit;

interface

uses
  SysUtils, Classes, uCompany, UTSbaseClass, FireDAC.Comp.Client, udmMain;

type
  TUnit = class(TSBaseClass)
  private
    FAppID: Integer;
    FCompany: TCompany;
    FCompanyID: Integer;
    FDescription: string;
    FID: Integer;
    FKode: string;
    FNama: string;
    function FLoadFromDB( aSQL : String ): Boolean;
    function GetCompany: TCompany;
  public
    constructor Create(aOwner : TComponent); override;
    destructor Destroy; override;
    procedure ClearProperties;
    function ExecuteCustomSQLTask: Boolean;
    function ExecuteCustomSQLTaskPrior: Boolean;
    function CustomTableName: string;
    function GenerateInterbaseMetaData: Tstrings;
    function ExecuteGenerateSQL: Boolean;
    function GetFieldNameFor_AppID: string; dynamic;
    function GetFieldNameFor_Company: string; dynamic;
    function GetFieldNameFor_Description: string; dynamic;
    function GetFieldNameFor_ID: string; dynamic;
    function GetFieldNameFor_Kode: string; dynamic;
    function GetFieldNameFor_Nama: string; dynamic;
    function GetGeneratorName: string;
    function GetHeaderFlag: Integer;
    function LoadByID( aID : Integer ): Boolean;
    function LoadByKode( aKode : string): Boolean;
    procedure UpdateData(aAppID : Integer; aCompany_ID : Integer; aDescription :
        String; aID : Integer; aKode : string; aNama : string);
    property AppID: Integer read FAppID write FAppID;
    property Company: TCompany read GetCompany write FCompany;
    property Description: string read FDescription write FDescription;
    property ID: Integer read FID write FID;
    property Kode: string read FKode write FKode;
    property Nama: string read FNama write FNama;
  end;
  

implementation

uses DB;

{
************************************ TUnit *************************************
}
constructor TUnit.Create(aOwner : TComponent);
begin
  inherited create(aOwner);
  ClearProperties;
end;

destructor TUnit.Destroy;
begin    
   ClearProperties;
   inherited Destroy;
end;

procedure TUnit.ClearProperties;
begin
  AppID := 0;

  FCompanyID := 0;
  if FCompany <> nil then
    FreeAndNil(FCompany);

  Description := '';
  ID := 0;
  Kode := '';
  Nama := '';  
end;

function TUnit.ExecuteCustomSQLTask: Boolean;
begin
  result := True;
end;

function TUnit.ExecuteCustomSQLTaskPrior: Boolean;
begin
  result := True;
end;

function TUnit.CustomTableName: string;
begin
  result := 'AUT$UNIT';
end;

function TUnit.FLoadFromDB( aSQL : String ): Boolean;
var
  iQ: TFDQuery;
begin
  result := false;
  State := csNone;

  ClearProperties;

  iQ := cOpenQuery(aSQL);
  try                          
    with iQ do
    Begin
        if not EOF then
        begin
           FAppID := FieldByName(GetFieldNameFor_AppID).asInteger;
           FCompanyID := FieldByName(GetFieldNameFor_Company).asInteger;
           FDescription := FieldByName(GetFieldNameFor_Description).AsString;
           FID := FieldByName(GetFieldNameFor_ID).asInteger;
           FKode := FieldByName(GetFieldNameFor_Kode).asString;
           FNama := FieldByName(GetFieldNameFor_Nama).asString;
           Self.State := csLoaded;
           Result := True;
        end;
    End;
  finally
    FreeAndNil(iQ);
  end;
end;

function TUnit.GenerateInterbaseMetaData: Tstrings;
begin
  result := TstringList.create;
  result.Append( '' );
  result.Append( 'Create Table TUnit ( ' );
  result.Append( 'TRMSBaseClass_ID Integer not null, ' );
  result.Append( 'AppID   Integer Not Null , ' );
  result.Append( 'Company_ID Integer Not Null, ' );
  result.Append( 'Description   Integer Not Null , ' );
  result.Append( 'ID   Integer Not Null  Unique, ' );
  result.Append( 'Kode   Varchar(30) Not Null  Unique, ' );
  result.Append( 'Nama   Varchar(30) Not Null , ' );
  result.Append( 'Stamp TimeStamp ' );
  result.Append( ' ); ' );
end;

function TUnit.ExecuteGenerateSQL: Boolean;
var
  S: string;
begin
  result := False;
  if State = csNone then
  Begin
     raise Exception.create('Tidak bisa generate dalam Mode csNone')
  end;

  if not ExecuteCustomSQLTaskPrior then
  begin
    cRollbackTrans;
    Exit;
  end else begin
    If FID <= 0 then
    begin
      FID := cGetNextID(GetFieldNameFor_AppID, CustomTableName);
      S := 'Insert into ' + CustomTableName + ' ( ' + GetFieldNameFor_AppID + ', ' + GetFieldNameFor_Company + ', ' + GetFieldNameFor_Description + ', ' + GetFieldNameFor_ID + ', ' + GetFieldNameFor_Kode + ', ' + GetFieldNameFor_Nama + ') values ('
      + IntToStr( FAppID) + ', '
      + InttoStr( Company.ID) + ', '
      + QuotedStr( FDescription) + ', '
      + IntToStr( FID) + ', '
      + QuotedStr(FKode ) + ','
      + QuotedStr(FNama ) + ');'
    end else
    begin
      S := 'Update ' + CustomTableName + ' set Stamp = Null '
           + ', ' + GetFieldNameFor_AppID + ' = ' + IntToStr( FAppID)
           + ', ' + GetFieldNameFor_Company + ' = ' + IntToStr( Company.ID)
           + ', ' + GetFieldNameFor_Description + ' = ' + QuotedStr( FDescription)
           + ', ' + GetFieldNameFor_Kode + ' = ' + QuotedStr( FKode )
           + ', ' + GetFieldNameFor_Nama + ' = ' + QuotedStr( FNama )
           + ' Where  ' + GetFieldNameFor_ID + ' = ' + IntToStr(FID) + ';';
    end;

    if not cExecSQL(S, dbtStore, False) then
    begin
      cRollbackTrans;
      Exit;
    end else
      Result := ExecuteGenerateSQL;
  end;
end;

function TUnit.GetCompany: TCompany;
begin
  if FCompany = nil then
  begin
    FCompany := TCompany.Create(Self);
    FCompany.LoadByID(FCompanyID);
  end;
  Result := FCompany;
end;

function TUnit.GetFieldNameFor_AppID: string;
begin
  Result := 'UNT_APP_ID';// <<-- Rubah string ini untuk mapping
end;

function TUnit.GetFieldNameFor_Company: string;
begin
  Result := 'UNT_COMP_ID';// <<-- Rubah string ini untuk mapping
end;

function TUnit.GetFieldNameFor_Description: string;
begin
  Result := 'UNT_DESCRIPTION';// <<-- Rubah string ini untuk mapping
end;

function TUnit.GetFieldNameFor_ID: string;
begin
  Result := 'UNT_ID';// <<-- Rubah string ini untuk mapping
end;

function TUnit.GetFieldNameFor_Kode: string;
begin
  Result := 'UNT_CODE';// <<-- Rubah string ini untuk mapping
end;

function TUnit.GetFieldNameFor_Nama: string;
begin
  Result := 'UNT_NAME';// <<-- Rubah string ini untuk mapping
end;

function TUnit.GetGeneratorName: string;
begin
  Result := 'gen_aut$unit_id';
end;

function TUnit.GetHeaderFlag: Integer;
begin
  result := 504;
end;

function TUnit.LoadByID( aID : Integer ): Boolean;
begin
  result := FloadFromDB('Select * from ' + CustomTableName + ' Where ' + GetFieldNameFor_ID + ' = ' + IntToStr(aID) );
end;

function TUnit.LoadByKode( aKode : string): Boolean;
begin
  result := FloadFromDB('Select * from ' + CustomTableName + ' Where ' + GetFieldNameFor_Kode + ' = ' + QuotedStr(aKode));
end;

procedure TUnit.UpdateData(aAppID : Integer; aCompany_ID : Integer;
    aDescription : String; aID : Integer; aKode : string; aNama : string);
begin
  FAppID :=  aAppID;
  FCompanyID := aCompany_ID;
  FDescription :=  aDescription;
  FID :=  aID;
  FKode := trim(aKode);
  FNama := trim(aNama);
  State := csCreated;
end;



end.
