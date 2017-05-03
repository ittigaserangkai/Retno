unit uNewMerchandize;

interface

uses
  SysUtils, Classes, uTSBaseClass, uNewUnit;

type
  TNewMerchadize = class(TSBaseClass)
  private
    FID: Integer;
    FKode: string;
    FNama: string;
    FNewUnit: TUnit;
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
    function GetFieldNameFor_NewUnit: string; dynamic;
    function GetGeneratorName: string;
    function GetHeaderFlag: Integer;
    function LoadByID(aID: Integer): Boolean;
   // function cekdata;
    function isKodeExits(aKode : String; aUnitId : Integer; aExcludeId : Integer):
        Boolean;
    function LoadByKode(aKode: string): Boolean;
    function RemoveFromDB: Boolean;
    procedure UpdateData(aID : Integer; aKode : string; aNama : string;
            aNewUnit_ID : Integer);
    property ID: Integer read FID write FID;
    property Kode: string read FKode write FKode;
    property Nama: string read FNama write FNama;
    property NewUnit: TUnit read FNewUnit write FNewUnit;
  end;


implementation

uses FireDAC.Comp.Client, FireDAC.Stan.Error, udmMain;

{
******************************** TNewMerchadize ********************************
}
constructor TNewMerchadize.Create(aOwner : TComponent);
begin

  inherited create(aOwner);
  FNewUnit := TUnit.Create(Self);
end;

destructor TNewMerchadize.Destroy;
begin
   FNewUnit.free;
   inherited Destroy;
end;

procedure TNewMerchadize.ClearProperties;
begin
  ID := 0;
  Kode := '';
  Nama := '';
  NewUnit.ClearProperties;
end;

function TNewMerchadize.ExecuteCustomSQLTask: Boolean;
begin
  result := True;
end;

function TNewMerchadize.ExecuteCustomSQLTaskPrior: Boolean;
begin
  result := True;
end;

function TNewMerchadize.CustomTableName: string;
begin
  result := 'REF$MERCHANDISE';
end;

function TNewMerchadize.FLoadFromDB( aSQL : String ): Boolean;
var
  iQ: TFDQuery;
begin
  result := false;
  State := csNone;

  ClearProperties;

  iQ  := cOpenQuery(aSQL);
  try                     
    with iQ do
    Begin
      if not EOF then
      begin
         FID := FieldByName(GetFieldNameFor_ID).asInteger;
         FKode := FieldByName(GetFieldNameFor_Kode).asString;
         FNama := FieldByName(GetFieldNameFor_Nama).asString;
         FNewUnit.LoadByID(FieldByName(GetFieldNameFor_NewUnit).asInteger);
         Self.State := csLoaded;
         Result := True;
      end;
    End;
  finally
    FreeAndNil(iQ);
  end;
end;

function TNewMerchadize.GenerateInterbaseMetaData: Tstrings;
begin
  result := TstringList.create;
  result.Append( '' );
  result.Append( 'Create Table TNewMerchadize ( ' );
  result.Append( 'TRMSBaseClass_ID Integer not null, ' );
  result.Append( 'ID   Integer Not Null  Unique, ' );
  result.Append( 'Kode   Varchar(30) Not Null  Unique, ' );
  result.Append( 'Nama   Varchar(30) Not Null , ' );
  result.Append( 'NewUnit_ID Integer Not Null, ' );
  result.Append( 'Stamp TimeStamp ' );
  result.Append( ' ); ' );
end;

function TNewMerchadize.ExecuteGenerateSQL: Boolean;
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
    Exit
  end else begin
    If FID <= 0 then
    begin
      FID := cGetNextID(GetFieldNameFor_ID, CustomTableName) ;
      S := 'Insert into ' + CustomTableName + ' ( ' + GetFieldNameFor_ID + ', ' + GetFieldNameFor_Kode + ', ' + GetFieldNameFor_Nama + ', ' + GetFieldNameFor_NewUnit + ') values ('
           + IntToStr( FID) + ', '
           + QuotedStr(FKode ) + ','
           + QuotedStr(FNama ) + ','
           + InttoStr( FNewUnit.ID) + ');'
    end else
    begin
      S := 'Update ' + CustomTableName + ' Set ' +  GetFieldNameFor_Kode + ' = ' + QuotedStr( FKode )
           + ' , ' + GetFieldNameFor_Nama + ' = ' + QuotedStr( FNama )
           + ' where ' + GetFieldNameFor_NewUnit + ' = ' + IntToStr( FNewUnit.ID)
           + ' and ' + GetFieldNameFor_ID + ' = ' + IntToStr(FID) + ';';
    end;

    if not cExecSQL(S, dbtPOS, False) then
    begin
      cRollbackTrans;
      Exit;
    end else
      Result := ExecuteCustomSQLTask;
  end;
end;

function TNewMerchadize.GetFieldNameFor_ID: string;
begin
  Result := 'MERCHAN_ID';// <<-- Rubah string ini untuk mapping
end;

function TNewMerchadize.GetFieldNameFor_Kode: string;
begin
  Result := 'MERCHAN_CODE';// <<-- Rubah string ini untuk mapping
end;

function TNewMerchadize.GetFieldNameFor_Nama: string;
begin
  Result := 'MERCHAN_NAME';// <<-- Rubah string ini untuk mapping
end;

function TNewMerchadize.GetFieldNameFor_NewUnit: string;
begin
  Result := 'MERCHAN_UNT_ID';// <<-- Rubah string ini untuk mapping
end;

function TNewMerchadize.GetGeneratorName: string;
begin
  Result := 'gen_ref$merchandise_id';
end;

function TNewMerchadize.GetHeaderFlag: Integer;
begin
  result := 736;
end;

function TNewMerchadize.isKodeExits(aKode : String; aUnitId : Integer;
    aExcludeId : Integer): Boolean;
var
  sSQL: string;
begin
  Result := False;

  sSQL := 'select count( ' + GetFieldNameFor_ID + ' ) as Jml'
            + ' from ' + CustomTableName
            + ' where ' + GetFieldNameFor_Kode + '  = ' + QuotedStr(aKode)
            + ' AND ' + GetFieldNameFor_NewUnit + ' = ' + IntToStr(aUnitID)
            + ' AND ' + GetFieldNameFor_ID + ' <> ' + IntToStr(aExcludeId);
  with cOpenQuery(sSQL) do
  begin
    try
      while not EOF do
      begin
        if FieldByName('Jml').AsInteger > 0 then
          Result := True;
        Next;
      end;
    finally
      Free;
    end;
  end;


end;

function TNewMerchadize.LoadByID(aID: Integer): Boolean;
begin
  result := FloadFromDB('Select * '
                       + ' from ' + CustomTableName
                       + ' Where  ' + GetFieldNameFor_ID + ' = ' + IntToStr(aID)
                       );
end;

function TNewMerchadize.LoadByKode(aKode: string): Boolean;
begin
  result := FloadFromDB('Select * '
                        + ' from ' + CustomTableName
                        + ' Where ' + GetFieldNameFor_Kode + ' = ' + QuotedStr(aKode)
                        );
end;

function TNewMerchadize.RemoveFromDB: Boolean;
var
  sErr: string;
  sSQL: String;
begin
  Result := False;
  sSQL := 'delete from ' + CustomTableName
          + ' where ' + GetFieldNameFor_ID + ' = ' + IntToStr(ID)
          + ' and ' + GetFieldNameFor_NewUnit + ' = ' + IntToStr(NewUnit.ID);

  try
    if cExecSQL(sSQL, dbtPOS, False) then
        result := True;
  except
    on E: EFDDBEngineException do
    begin
      sErr := e.Message;
      if sErr <> '' then
        raise Exception.Create(sErr)
      else
        raise Exception.Create('Error Code: '+IntToStr(e.ErrorCode)+#13#10+e.SQL);
    end;
  end;
end;

procedure TNewMerchadize.UpdateData(aID : Integer; aKode : string; aNama :
        string; aNewUnit_ID : Integer);
begin

             FID :=  aID;
             FKode := trim(aKode);
             FNama := trim(aNama);
             FNewUnit.LoadByID(aNewUnit_ID);
  State := csCreated;
end;



end.
