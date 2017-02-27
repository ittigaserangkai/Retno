unit uCompany;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, EditBtn, uTSBaseClass;

type
  TCompany = class(TSBaseClass)
  private
    FID: Integer;
    FKode: string;
    FNama: string;
    function FLoadFromDB( aSQL : String ): Boolean;
  public
    constructor Create(aOwner : TComponent); override;
    destructor Destroy; override;
    procedure ClearProperties;
    function ExecuteCustomSQLTask: Boolean;
    function ExecuteCustomSQLTaskPrior: Boolean;
    function CustomTableName: string;
    function GenerateInterbaseMetaData: Tstrings;
    function ExecuteGenerateSQL: Boolean;
    procedure GetCurCompany(var Code: TEditBtn; var Nm: TEdit);
    function GetFieldNameFor_ID: string; dynamic;
    function GetFieldNameFor_Kode: string; dynamic;
    function GetFieldNameFor_Nama: string; dynamic;
    function GetGeneratorName: string;
    function GetHeaderFlag: Integer;
    function LoadByID( aID : Integer ): Boolean;
    function LoadByKode(aKode : String): Boolean;
    procedure UpdateData(aID : Integer; aKode : string; aNama : string);
    property ID: Integer read FID write FID;
    property Kode: string read FKode write FKode;
    property Nama: string read FNama write FNama;
  end;


implementation

{
*********************************** TCompany ***********************************
}
constructor TCompany.Create(aOwner : TComponent);
begin

  inherited create(aOwner);
end;

destructor TCompany.Destroy;
begin

   inherited Destroy;
end;

procedure TCompany.ClearProperties;
begin
  ID := 0;
  Kode := '';
  Nama := '';
end;

function TCompany.ExecuteCustomSQLTask: Boolean;
begin
  result := True;
end;

function TCompany.ExecuteCustomSQLTaskPrior: Boolean;
begin
  result := True;
end;

function TCompany.CustomTableName: string;
begin
  result := 'COMPANY';
end;

function TCompany.FLoadFromDB( aSQL : String ): Boolean;
begin
  result := false;
  State := csNone;

  ClearProperties;
//  with cOpenQuery(aSQL) do
//  Begin
//      if not EOF then
//      begin
//         FID := FieldByName(GetFieldNameFor_ID).asInteger;
//         FKode := FieldByName(GetFieldNameFor_Kode).asString;
//         FNama := FieldByName(GetFieldNameFor_Nama).asString;
//         Self.State := csLoaded;
//         Result := True;
//      end;
//      Free;
//  end;
end;

function TCompany.GenerateInterbaseMetaData: Tstrings;
begin
  result := TstringList.create;
  result.Append( '' );
  result.Append( 'Create Table TCompany ( ' );
  result.Append( 'TSBaseClass_ID Integer not null, ' );
  result.Append( 'ID   Integer Not Null  Unique, ' );
  result.Append( 'Kode   Varchar(30) Not Null  Unique, ' );
  result.Append( 'Nama   Varchar(30) Not Null , ' );
  result.Append( 'Stamp TimeStamp ' );
  result.Append( ' ); ' );
end;

function TCompany.ExecuteGenerateSQL: Boolean;
var
  S: string;
begin
  result := False;
  if State = csNone then
  Begin
     raise Exception.create('Tidak bisa generate dalam Mode csNone')
  end;

  if not ExecuteCustomSQLTaskPrior then
  Begin
//    cRollbackTrans;
    Exit;
  end else begin
//    if FID <= 0 then
//    begin
//      FID := cGetNextID(GetGeneratorName) ;
//      S := 'Insert into ' + CustomTableName + ' ( ' + GetFieldNameFor_ID + ', ' + GetFieldNameFor_Kode + ', ' + GetFieldNameFor_Nama + ') values ('
//            + IntToStr( FID) + ', '
//            + Quot(FKode ) + ','
//            + Quot(FNama ) + ');'
//    end else
//    begin
//      S := 'Update ' + CustomTableName + ' set ' + GetFieldNameFor_Kode + ' = ' + Quot(FKode)
//            + ' , ' + GetFieldNameFor_Nama + ' = ' + Quot( FNama )
//            + ' Where  ' + GetFieldNameFor_ID + ' = ' + IntToStr(FID) + ';';
//    end;
//
//    if not cExecSQL(S, False , GetHeaderFlag) then
//    begin
//      cRollbackTrans;
//      Exit;
//    end else if not SimpanBlob(S,GetHeaderFlag) then
//    begin
//      cRollbackTrans;
//      Exit;
//    end else begin
//      Result := ExecuteCustomSQLTask;
//    end;
  end;
end;

procedure TCompany.GetCurCompany(var Code: TEditBtn; var Nm: TEdit);
var
  sSQL  : string;
begin
  sSQL := 'SELECT '+ GetFieldNameFor_ID +' AS CODE,'
        + GetFieldNameFor_Nama +' AS NAME'
        + ' FROM COMPANY';

//  GetdataIdNm('Company',  sSQL, Code, Nm);
end;

function TCompany.GetFieldNameFor_ID: string;
begin
  Result := 'COMP_ID';// <<-- Rubah string ini untuk mapping
end;

function TCompany.GetFieldNameFor_Kode: string;
begin
  Result := 'COMP_CODE';// <<-- Rubah string ini untuk mapping
end;

function TCompany.GetFieldNameFor_Nama: string;
begin
  Result := 'COMP_NAME';// <<-- Rubah string ini untuk mapping
end;

function TCompany.GetGeneratorName: string;
begin
  Result := 'GEN_COMPANY_ID';
end;

function TCompany.GetHeaderFlag: Integer;
begin
  result := 497;
end;

function TCompany.LoadByID( aID : Integer ): Boolean;
begin
  result := FloadFromDB('Select * from ' + CustomTableName + ' Where '
            + GetFieldNameFor_ID + ' = ' + IntToStr(aID) );
end;

function TCompany.LoadByKode(aKode : String): Boolean;
begin
  result := FloadFromDB('Select * from ' + CustomTableName + ' Where '
            + GetFieldNameFor_Kode + ' = ' + QuotedStr(aKode));
end;

procedure TCompany.UpdateData(aID : Integer; aKode : string; aNama : string);
begin

   FID :=  aID;
   FKode := trim(aKode);
   FNama := trim(aNama);
  State := csCreated;
end;



end.
