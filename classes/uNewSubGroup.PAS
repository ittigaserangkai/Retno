unit uNewSubGroup;

interface

uses
  SysUtils, Classes, uTSBaseClass, uNewGroup;

type
  TSubGroup = class(TSBaseClass)
  private
    FGroup: TGroup;
    FID: Integer;
    FKode: string;
    FNama: string;
    FSafetyStock: Double;
    FUnitID: Integer;
    function FLoadFromDB( aSQL : String ): Boolean;
    procedure SetUnitID(const Value: Integer);
  public
    constructor Create(aOwner : TComponent); override;
    destructor Destroy; override;
    procedure ClearProperties;
    function ExecuteCustomSQLTask: Boolean;
    function ExecuteCustomSQLTaskPrior: Boolean;
    function CustomTableName: string;
    function GenerateInterbaseMetaData: Tstrings;
    function ExecuteGenerateSQL: Boolean;
    function GetFieldNameFor_Group: string; dynamic;
    function GetFieldNameFor_ID: string; dynamic;
    function GetFieldNameFor_Kode: string; dynamic;
    function GetFieldNameFor_Nama: string; dynamic;
    function GetFieldNameFor_SafetyStock: string; dynamic;
    function GetFieldNameFor_SUBGRUP_MERCHANGRUP_UNT_ID: string;
    function GetFieldNameFor_UnitID: string;
    function GetHeaderFlag: Integer;
    function LoadByID(aID : Integer; aUnitID : Integer): Boolean;
    function LoadByKode(aKode: string; aUnitID, aGrpId, aGrpUnitID: Integer):
        Boolean;
    function RemoveFromDB: Boolean;
    procedure UpdateData(aGroup_ID : Integer; aID : Integer; aKode : string; aNama
        : string; aSafetyStock : Double; aUnitID : Integer);
    property Group: TGroup read FGroup write FGroup;
    property ID: Integer read FID write FID;
    property Kode: string read FKode write FKode;
    property Nama: string read FNama write FNama;
    property SafetyStock: Double read FSafetyStock write FSafetyStock;
    property UnitID: Integer read FUnitID write SetUnitID;
  end;
  

implementation

uses FireDAC.Comp.Client, FireDAC.Stan.Error, udmMain;

{
********************************** TSubGroup ***********************************
}
constructor TSubGroup.Create(aOwner : TComponent);
begin
  
  inherited create(aOwner);
  FGroup := TGroup.Create(Self);
  ClearProperties;
end;

destructor TSubGroup.Destroy;
begin
  
          FGroup.free;
   inherited Destroy;
end;

procedure TSubGroup.ClearProperties;
begin
  ID := 0;
  FGroup.ClearProperties;
  Kode := '';
  Nama := '';
  UnitID := 0;
  SafetyStock := 0;
end;

function TSubGroup.ExecuteCustomSQLTask: Boolean;
begin
  result := True;
end;

function TSubGroup.ExecuteCustomSQLTaskPrior: Boolean;
begin
  result := True;
end;

function TSubGroup.CustomTableName: string;
begin
  result := 'REF$SUB_GRUP';
end;

function TSubGroup.FLoadFromDB( aSQL : String ): Boolean;
begin
  result := false;
  State := csNone;

  ClearProperties;
  with cOpenQuery(aSQL) do 
  Begin 
      if not EOF then 
      begin        
         FGroup.LoadByID(FieldByName(GetFieldNameFor_Group).asInteger, FieldByName(GetFieldNameFor_UnitID).asInteger);
         FID := FieldByName(GetFieldNameFor_ID).asInteger;
         FKode := FieldByName(GetFieldNameFor_Kode).asString;
         FNama := FieldByName(GetFieldNameFor_Nama).asString;
         FSafetyStock := FieldByName(GetFieldNameFor_SafetyStock).AsFloat;
         FUnitID := FieldByName(GetFieldNameFor_UnitID).asInteger;
         Self.State := csLoaded;
         Result := True;
      end;
      Free;
  End;
end;

function TSubGroup.GenerateInterbaseMetaData: Tstrings;
begin
  result := TstringList.create;
  result.Append( '' );
  result.Append( 'Create Table TSubGroup ( ' );
  result.Append( 'TRMSBaseClass_ID Integer not null, ' );
  result.Append( 'Group_ID Integer Not Null, ' );
  result.Append( 'ID   Integer Not Null  Unique, ' );
  result.Append( 'Kode   Varchar(30) Not Null  Unique, ' );
  result.Append( 'Nama   Varchar(30) Not Null , ' );
  result.Append( 'SafetyStock   Integer Not Null , ' );
  result.Append( 'Stamp TimeStamp ' );
  result.Append( ' ); ' );
end;

function TSubGroup.ExecuteGenerateSQL: Boolean;
var
  S: string;
 // i: Integer;
 // SS: Tstrings;
begin
  //result := TstringList.create;
  Result := False;

  if State = csNone then
  Begin
     raise Exception.create('Tidak bisa generate dalam Mode csNone')
  end;

  {SS := CustomSQLTaskPrior;
  if SS <> nil then
  Begin
        result.AddStrings(SS);
  end;
  //SS := Nil;
  }
  if not ExecuteCustomSQLTaskPrior then
  begin
    cRollbackTrans;
    Exit;
  end else
  begin
    If FID <= 0 then
    begin
        //Generate Insert SQL
      FID := cGetNextID(GetFieldNameFor_ID, CustomTableName);
      S := 'Insert into ' + CustomTableName + ' ( ' + GetFieldNameFor_Group + ', ' + GetFieldNameFor_ID + ', ' + GetFieldNameFor_Kode + ', ' + GetFieldNameFor_Nama + ', ' + GetFieldNameFor_SafetyStock + ',' + GetFieldNameFor_UnitID + ',' + GetFieldNameFor_SUBGRUP_MERCHANGRUP_UNT_ID + ' ) values ('
           + InttoStr( FGroup.ID) + ', '
           + IntToStr( FID) + ', '
           + QuotedStr(FKode ) + ','
           + QuotedStr(FNama ) + ','
           + QuotedStr(FloatToStr(FSafetyStock)) + ', '
           + IntToStr( FUnitID) + ','
           + IntToStr( FUnitID) + ');'
    end else
    begin
        //generate Update SQL
      S := 'Update ' + CustomTableName + ' set ' + GetFieldNameFor_Group + ' = ' + IntToStr( FGroup.ID)
        + ', ' + GetFieldNameFor_Kode + ' = ' + QuotedStr( FKode )
        + ', ' + GetFieldNameFor_Nama + ' = ' + QuotedStr( FNama )
        + ', ' + GetFieldNameFor_SafetyStock + ' = ' + QuotedStr(FloatToStr(FSafetyStock))
        + ', ' + GetFieldNameFor_SUBGRUP_MERCHANGRUP_UNT_ID + ' = ' + IntToStr(FUnitID)
        + ' where ' + GetFieldNameFor_UnitID + ' = ' + IntToStr( FUnitID)
        + ' and ' + GetFieldNameFor_ID + ' = ' + IntToStr(FID) + ';';
    end;
  end;
  {result.append( S );
  //generating Collections SQL

  SS := CustomSQLTask;
  if SS <> nil then
  Begin
        result.AddStrings(SS);
  end; }

  if not cExecSQL(S, dbtPOS, False) then
  begin
    cRollbackTrans;
    Exit;
  end else
    Result := ExecuteCustomSQLTask;
end;

function TSubGroup.GetFieldNameFor_Group: string;
begin
  Result := 'SUBGRUP_MERCHANGRUP_ID';// <<-- Rubah string ini untuk mapping
end;

function TSubGroup.GetFieldNameFor_ID: string;
begin
  Result := 'SUBGRUP_ID';// <<-- Rubah string ini untuk mapping
end;

function TSubGroup.GetFieldNameFor_Kode: string;
begin
  Result := 'SUBGRUP_CODE';// <<-- Rubah string ini untuk mapping
end;

function TSubGroup.GetFieldNameFor_Nama: string;
begin
  Result := 'SUBGRUP_NAME';// <<-- Rubah string ini untuk mapping
end;

function TSubGroup.GetFieldNameFor_SafetyStock: string;
begin
  Result := 'SafetyStock';// <<-- Rubah string ini untuk mapping
end;

function TSubGroup.GetFieldNameFor_SUBGRUP_MERCHANGRUP_UNT_ID: string;
begin
  Result := 'SUBGRUP_MERCHANGRUP_UNT_ID';
end;

function TSubGroup.GetFieldNameFor_UnitID: string;
begin
  Result := 'SUBGRUP_UNT_ID';
end;

function TSubGroup.GetHeaderFlag: Integer;
begin
  result := 84;
end;

function TSubGroup.LoadByID(aID : Integer; aUnitID : Integer): Boolean;
begin
  result := FloadFromDB('Select * from ' + CustomTableName + ' Where ' + GetFieldNameFor_ID + ' = ' + IntToStr(aID) + ' and ' + GetFieldNameFor_UnitID + ' = ' + IntToStr(aUnitID));
end;

function TSubGroup.LoadByKode(aKode: string; aUnitID, aGrpId, aGrpUnitID:
    Integer): Boolean;
begin
  result := FloadFromDB('Select * from '
            + CustomTableName + ' Where '
            + GetFieldNameFor_Kode + ' = ' + QuotedStr(aKode)
            + ' and ' + GetFieldNameFor_UnitID + ' = ' + IntToStr(aUnitID)
            + ' and ' + GetFieldNameFor_Group + ' = ' + IntToStr(aGrpId)
            + ' and ' + GetFieldNameFor_SUBGRUP_MERCHANGRUP_UNT_ID
            + ' = ' + IntToStr(aGrpUnitID)
            );
end;

function TSubGroup.RemoveFromDB: Boolean;
var
  sErr: string;
  sSQL: String;
begin
  Result := False;

  sSQL := 'DELETE FROM REF$SUB_GRUP WHERE (SUBGRUP_ID = ' + IntToStr(FID) + ') AND SUBGRUP_UNT_ID = ' + IntToStr(FUnitID) + ';';

  try
    if cExecSQL(sSQL, dbtPOS, False) then
        result := True;//SimpanBlob(sSQL, GetHeaderFlag);
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

procedure TSubGroup.SetUnitID(const Value: Integer);
begin
  if (Value <> Group.UnitID) and (Value <> 0) then
  begin
    raise Exception.Create('Unit ID <> Group Unit ID');
  end else
    FUnitID := Value;

end;

procedure TSubGroup.UpdateData(aGroup_ID : Integer; aID : Integer; aKode :
    string; aNama : string; aSafetyStock : Double; aUnitID : Integer);
begin
  FGroup.LoadByID(aGroup_ID, aUnitID);
  FID :=  aID;
  FKode := trim(aKode);
  FNama := trim(aNama);
  FSafetyStock :=  aSafetyStock;
  FUnitID := aUnitID;
  State := csCreated;
end;



end.
