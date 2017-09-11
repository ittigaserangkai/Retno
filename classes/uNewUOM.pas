unit uNewUOM;

interface

uses
  SysUtils, Classes, UTSbaseClass, uNewUnit;

type
  TNewUOM = class(TSBaseClass)
  private
    FGroup: string;
    FNama: string;
    FUOM: string;
    FUrutan: Integer;
    function FLoadFromDB( aSQL : String ): Boolean;

  public
    constructor Create(aOwner : TComponent); override;
    destructor Destroy; override;
    function GetUrutanTerakhir(aUnitID : Integer): Integer;
    procedure ClearProperties;
    function ExecuteCustomSQLTask: Boolean;
    function ExecuteCustomSQLTaskPrior: Boolean;
    function CustomTableName: string;
    function GenerateInterbaseMetaData: Tstrings;
    function ExecuteGenerateSQL(aUOMLama : String): Boolean;
    function GetFieldNameFor_Group: string; dynamic;
    function GetFieldNameFor_Nama: string; dynamic;
    function GetFieldNameFor_UOM: string; dynamic;
    function GetFieldNameFor_Urutan: string; dynamic;
    function GetFieldNameFor_ID: string; dynamic;
    function GetHeaderFlag: Integer;
    function LoadByUOM(aUOM: string): Boolean;
    function LoadByID(aID: string): Boolean;
    function RemoveFromDB: Boolean;
    procedure UpdateData(aGroup : string; aNama : string; aNewUnit_ID : Integer;
        aUOM : string; aUrutan : Integer);
    property Group: string read FGroup write FGroup;
    property Nama: string read FNama write FNama;
    property UOM: string read FUOM write FUOM;
    property Urutan: Integer read FUrutan write FUrutan;
    //property UrutanTerakhir: Integer read GetUrutanTerakhir(aUnitID : Integer);
  end;
  

implementation

uses FireDAC.Comp.Client, FireDAC.Stan.Error, udmMain;

{
*********************************** TNewUOM ************************************
}
constructor TNewUOM.Create(aOwner : TComponent);
begin
  
  inherited create(aOwner);
end;

destructor TNewUOM.Destroy;
begin
   inherited Destroy;
end;

procedure TNewUOM.ClearProperties;
begin
  Group := '';
  Nama := '';
  UOM := '';
  Urutan := 0;
end;

function TNewUOM.ExecuteCustomSQLTask: Boolean;
begin
  result := True;
end;

function TNewUOM.ExecuteCustomSQLTaskPrior: Boolean;
begin
  result := True;
end;

function TNewUOM.CustomTableName: string;
begin
  result := 'REF$SATUAN';
end;

function TNewUOM.FLoadFromDB( aSQL : String ): Boolean;
var
  iQ: TFDQuery;
begin
  Result := false;
  State := csNone;

  ClearProperties;
  iQ := cOpenQuery(aSQL, dbtPOS, True);
  try
    with iQ do
    Begin
      if not EOF then
      begin
       FGroup := FieldByName(GetFieldNameFor_Group).asString;
       FNama := FieldByName(GetFieldNameFor_Nama).asString;
       FUOM := FieldByName(GetFieldNameFor_UOM).asString;
       FUrutan := FieldByName(GetFieldNameFor_Urutan).asInteger;
       Self.State := csLoaded;
       Result := True;
      end;
    End;
  finally
    FreeAndNil(iQ);
  end;
end;

function TNewUOM.GenerateInterbaseMetaData: Tstrings;
begin
  result := TstringList.create;
  result.Append( '' );
  result.Append( 'Create Table TNewUOM ( ' );
  result.Append( 'TRMSBaseClass_ID Integer not null, ' );
  result.Append( 'Group   Varchar(30) Not Null , ' );
  result.Append( 'ID   Integer Not Null  Unique, ' );
  result.Append( 'Nama   Varchar(30) Not Null , ' );
  result.Append( 'NewUnit_ID Integer Not Null, ' );
  result.Append( 'UOM   Varchar(30) Not Null  Unique, ' );
  result.Append( 'Urutan   Integer Not Null , ' );
  result.Append( 'Stamp TimeStamp ' );
  result.Append( ' ); ' );
end;

function TNewUOM.ExecuteGenerateSQL(aUOMLama : String): Boolean;
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
    cRollbackTrans;
    Exit;
  end else begin
    If Trim(aUOMLama) = '' then
    begin
      S := 'Insert into ' + CustomTableName + ' ( ' + GetFieldNameFor_Group + ', ' + GetFieldNameFor_Nama + ', ' + GetFieldNameFor_UOM + ', ' + GetFieldNameFor_Urutan + ') values ('
            + QuotedStr(FGroup ) + ','
            + QuotedStr(FNama ) + ','
            + QuotedStr(FUOM ) + ','
            + IntToStr( FUrutan) + ');'
    end else
    begin
      S := 'Update ' + CustomTableName + ' set ' + GetFieldNameFor_Group + ' = ' + QuotedStr( FGroup )
            + ', ' + GetFieldNameFor_Nama + ' = ' + QuotedStr( FNama )
            + ', ' + GetFieldNameFor_UOM + ' = ' + QuotedStr( FUOM )
            + ', ' + GetFieldNameFor_Urutan + ' = ' + IntToStr( FUrutan)
            + ' where ' + GetFieldNameFor_UOM + ' = ' + QuotedStr(aUOMLama) + ';';
    end;

    if not cExecSQL(S, dbtPOS, False) then
    begin
      cRollbackTrans;
      Exit;
    end else
      Result := ExecuteCustomSQLTask;
  end;
end;

function TNewUOM.GetFieldNameFor_Group: string;
begin
  Result := 'SAT_GROUP';// <<-- Rubah string ini untuk mapping
end;

function TNewUOM.GetFieldNameFor_Nama: string;
begin
  Result := 'SAT_NAME';// <<-- Rubah string ini untuk mapping
end;

function TNewUOM.GetFieldNameFor_UOM: string;
begin
  Result := 'SAT_CODE';// <<-- Rubah string ini untuk mapping
end;

function TNewUOM.GetFieldNameFor_Urutan: string;
begin
  Result := 'SAT_URUTAN';// <<-- Rubah string ini untuk mapping
end;

function TNewUOM.GetFieldNameFor_ID: string;
begin
  Result := 'REF$SATUAN_ID';// <<-- Rubah string ini untuk mapping
end;

function TNewUOM.GetHeaderFlag: Integer;
begin
  result := 579;
end;

function TNewUOM.GetUrutanTerakhir(aUnitID : Integer): Integer;
var
  sSQL: String;
begin
  Result := 0;
  sSQL := 'select max(sat_urutan) '
           + ' from ref$satuan '
           + ' where sat_unt_id = ' + IntToStr(aUnitID);

  with cOpenQuery(sSQL, dbtPOS, True) do
  begin
    try
      if not Fields[0].IsNull then
      begin
        Result := Fields[0].AsInteger;
      end;
    finally
      Free;
    end;   
  end;
end;

function TNewUOM.LoadByUOM(aUOM: string): Boolean;
begin
  Result := FloadFromDB('Select * from ' + CustomTableName
                        + ' Where ' + GetFieldNameFor_UOM + ' = ' + QuotedStr(aUOM));
end;

function TNewUOM.LoadByID(aID: string): Boolean;
begin
  Result := FloadFromDB('Select * from ' + CustomTableName
                        + ' Where ' + GetFieldNameFor_ID + ' = ' + QuotedStr(aID));
end;

function TNewUOM.RemoveFromDB: Boolean;
var
  sErr  : string;
  sSQL  : string;
begin
  Result := False;
  sSQL := ' delete from ' + CustomTableName
          + ' where ' + GetFieldNameFor_UOM + ' = ' + QuotedStr(UOM);

  try
    if cExecSQL(sSQL, dbtPOS, False) then
        result := True;// SimpanBlob(sSQL, GetHeaderFlag);
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

procedure TNewUOM.UpdateData(aGroup : string; aNama : string; aNewUnit_ID :
    Integer; aUOM : string; aUrutan : Integer);
begin
  FGroup := trim(aGroup);
  FNama := trim(aNama);
  FUOM := trim(aUOM);
  FUrutan :=  aUrutan;
  State := csCreated;
end;



end.
