unit uNewTipeBarang;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uTSBaseClass, uNewUnit;

type
  TNewTipeBarang = class(TSBaseClass)
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
    function GetFieldNameFor_ID: string; dynamic;
    function GetFieldNameFor_Kode: string; dynamic;
    function GetFieldNameFor_Nama: string; dynamic;
    function GetGeneratorName: string;
    function GetHeaderFlag: Integer;
    function LoadByID(aID : Integer): Boolean;
    function LoadByCode(ACode: string): Boolean;
    procedure UpdateData(aID : Integer; aKode : string; aNama : string);
    property ID: Integer read FID write FID;
    property Kode: string read FKode write FKode;
    property Nama: string read FNama write FNama;
  end;
  

implementation

uses udmMain;

{
******************************** TNewTipeBarang ********************************
}
constructor TNewTipeBarang.Create(aOwner : TComponent);
begin
  
  inherited create(aOwner);
  //FNewUnit := TUnit.Create(Self);
end;

destructor TNewTipeBarang.Destroy;
begin
   //FNewUnit.free;
   inherited Destroy;
end;

procedure TNewTipeBarang.ClearProperties;
begin
  ID := 0;
  Kode := '';
  Nama := '';
end;

function TNewTipeBarang.ExecuteCustomSQLTask: Boolean;
begin
  result := True;
end;

function TNewTipeBarang.ExecuteCustomSQLTaskPrior: Boolean;
begin
  result := True;
end;

function TNewTipeBarang.CustomTableName: string;
begin
  result := 'REF$TIPE_BARANG';
end;

function TNewTipeBarang.FLoadFromDB( aSQL : String ): Boolean;
begin
  result := false;
  State := csNone;
  ClearProperties;
  
  with cOpenQuery(aSQL) do
  Begin
      if not EOF then
      begin

         FID := FieldByName(GetFieldNameFor_ID).asInteger;
         FKode := FieldByName(GetFieldNameFor_Kode).asString;
         FNama := FieldByName(GetFieldNameFor_Nama).AsString;
             Self.State := csLoaded;
          Result := True;
      end;
      Free;
  End;
end;

function TNewTipeBarang.GenerateInterbaseMetaData: Tstrings;
begin
  result := TstringList.create;
  result.Append( '' );
  result.Append( 'Create Table TNewTipeBarang ( ' );
  result.Append( 'TRMSBaseClass_ID Integer not null, ' );
  result.Append( 'ID   Integer Not Null  Unique, ' );
  result.Append( 'Kode   Varchar(30) Not Null , ' );
  result.Append( 'Nama   Integer Not Null , ' );
  result.Append( 'NewUnit_ID Integer Not Null, ' );
  result.Append( 'Stamp TimeStamp ' );
  result.Append( ' ); ' );
end;

function TNewTipeBarang.ExecuteGenerateSQL: Boolean;
var
  S: string;
//  i: Integer;
//  SS: Tstrings;
begin
  result := True;
  
  if State = csNone then
  Begin
     raise Exception.create('Tidak bisa generate dalam Mode csNone')
  end;
  
  if not ExecuteCustomSQLTaskPrior then
  begin
    cRollbackTrans;
    Exit;
  end
  else begin

    If FID <= 0 then
    begin
      FID := cGetNextID(GetFieldNameFor_ID, CustomTableName) ;
      S := 'Insert into ' + CustomTableName + ' ( ' + GetFieldNameFor_ID + ', '
           + GetFieldNameFor_Kode + ', '
           + GetFieldNameFor_Nama
           + ') values ('
           + IntToStr( FID) + ', '
           + QuotedStr(FKode) + ','
           + QuotedStr(FNama)
           + ');'
    end else
    begin
      S := 'Update ' + CustomTableName + ' set '
          + GetFieldNameFor_Kode + ' = ' + QuotedStr(FKode)
          + ', ' + GetFieldNameFor_Nama + ' = ' + QuotedStr(FNama)
          + ' Where ' + GetFieldNameFor_ID + ' = ' + IntToStr(FID) + ';';


    end;
  end;

  if not cExecSQL(S,dbtPOS, False) then
  begin
    cRollbackTrans;
    Exit;
  end
  else begin
    Result := ExecuteCustomSQLTask;
  end;

end;

function TNewTipeBarang.GetFieldNameFor_ID: string;
begin
  Result := 'TPBRG_ID';// <<-- Rubah string ini untuk mapping
end;

function TNewTipeBarang.GetFieldNameFor_Kode: string;
begin
  Result := 'TPBRG_CODE';// <<-- Rubah string ini untuk mapping
end;

function TNewTipeBarang.GetFieldNameFor_Nama: string;
begin
  Result := 'TPBRG_NAME';// <<-- Rubah string ini untuk mapping
end;

function TNewTipeBarang.GetGeneratorName: string;
begin

  Result :='GEN_REF$TIPE_BARANG_ID' ;
end;

function TNewTipeBarang.GetHeaderFlag: Integer;
begin
  result := 4868;
end;

function TNewTipeBarang.LoadByID(aID : Integer): Boolean;
begin
  Result := FloadFromDB('Select * from '+ CustomTableName
          + ' Where ' + GetFieldNameFor_ID + ' = ' + IntToStr(aID));
end;

function TNewTipeBarang.LoadByCode(ACode: string): Boolean;
begin
  Result := FloadFromDB('Select * from '+ CustomTableName
          + ' Where ' + GetFieldNameFor_Kode + ' = ' + QuotedStr(ACode));
end;

procedure TNewTipeBarang.UpdateData(aID : Integer; aKode : string; aNama :
    string);
begin
  ClearProperties;
  
  FID :=  aID;
  FKode := trim(aKode);
  FNama := Trim(aNama);
  State := csCreated;
end;



end.
