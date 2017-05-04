unit uNewShift;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs, StrUtils,
  uNewUnit, uTSBaseClass, uConstanta, udmMain, uAppUtils;

type
  TNewShift = class(TSBaseClass)
  private
    FDATE_CREATE: TDateTime;
    FDATE_MODIFY: TDateTime;
    FEndTime: TDateTime;
    FID: Integer;
    FName: string;
    FNewUnit: TUnit;
    FNewUnitID: Integer;
    FOPC_UNIT: TUnit;
    FOPC_UNITID: Integer;
    FOPM_UNIT: TUnit;
    FOPM_UNITID: Integer;
    FOP_CREATE: Integer;
    FOP_MODIFY: Integer;
    FStartTime: TDateTime;
    function FLoadFromDB( aSQL : String ): Boolean;
    function GetNewUnit: TUnit;
    function GetOPC_UNIT: TUnit;
    function GetOPM_UNIT: TUnit;
    procedure SetNewUnit(Value: TUnit);
    procedure SetOPC_UNIT(Value: TUnit);
    procedure SetOPM_UNIT(Value: TUnit);
  public
    constructor Create(AOwner : TComponent); override;
    constructor CreateWithUser(AOwner : TComponent; AUserID: Integer; AUnitID:
        Integer);
    destructor Destroy; override;
    procedure ClearProperties;
    function CustomSQLTask: Tstrings;
    function CustomSQLTaskPrior: Tstrings;
    function CustomTableName: string;
    function GenerateInterbaseMetaData: TStrings;
    function GenerateSQL(ARepeatCount: Integer = 1): TStrings;
    function GetFieldNameFor_DATE_CREATE: string; dynamic;
    function GetFieldNameFor_DATE_MODIFY: string; dynamic;
    function GetFieldNameFor_EndTime: string; dynamic;
    function GetFieldNameFor_ID: string; dynamic;
    function GetFieldNameFor_Name: string; dynamic;
    function GetFieldNameFor_NewUnit: string; dynamic;
    function GetFieldNameFor_OPC_UNIT: string; dynamic;
    function GetFieldNameFor_OPM_UNIT: string; dynamic;
    function GetFieldNameFor_OP_CREATE: string; dynamic;
    function GetFieldNameFor_OP_MODIFY: string; dynamic;
    function GetFieldNameFor_StartTime: string; dynamic;
    function GetFieldPrefix: String; dynamic;
    function GetGeneratorName: string; dynamic;
    function GetHeaderFlag: Integer;
    function GetPlannedID: Integer;
    function LoadByID(AID : Integer; AUnitID: Integer): Boolean;
    function LoadByName(AShiftName: String; AUnitID: Integer): Boolean;
    function RemoveFromDB: Boolean;
    function SaveToDB: Boolean;
    procedure UpdateData(ANewUnitID:Integer; AEndTime: TDateTime; AID: Integer;
        AName: string; AStartTime: TDateTime);
    property DATE_CREATE: TDateTime read FDATE_CREATE write FDATE_CREATE;
    property DATE_MODIFY: TDateTime read FDATE_MODIFY write FDATE_MODIFY;
    property EndTime: TDateTime read FEndTime write FEndTime;
    property ID: Integer read FID write FID;
    property Name: string read FName write FName;
    property NewUnit: TUnit read GetNewUnit write SetNewUnit;
    property OPC_UNIT: TUnit read GetOPC_UNIT write SetOPC_UNIT;
    property OPM_UNIT: TUnit read GetOPM_UNIT write SetOPM_UNIT;
    property OP_CREATE: Integer read FOP_CREATE write FOP_CREATE;
    property OP_MODIFY: Integer read FOP_MODIFY write FOP_MODIFY;
    property StartTime: TDateTime read FStartTime write FStartTime;
  end;
  

implementation

{
********************************** TNewShift ***********************************
}
constructor TNewShift.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
end;

constructor TNewShift.CreateWithUser(AOwner : TComponent; AUserID: Integer;
    AUnitID: Integer);
begin
  Create(AOwner);
  OP_MODIFY := AUserID;
  FOPM_UNITID := AUnitID;
end;

destructor TNewShift.Destroy;
begin
  ClearProperties;
  inherited Destroy;
end;

procedure TNewShift.ClearProperties;
begin
  OP_MODIFY := 0;
  OP_CREATE := 0;
  Name := '';
  ID := 0;
  
  FreeAndNil(FNewUnit);
  FreeAndNil(FOPC_UNIT);
  FreeAndNil(FOPM_UNIT);
end;

function TNewShift.CustomSQLTask: Tstrings;
begin
  result := nil;
end;

function TNewShift.CustomSQLTaskPrior: Tstrings;
begin
  result := nil;
end;

function TNewShift.CustomTableName: string;
begin
  result := 'SHIFT';
end;

function TNewShift.FLoadFromDB( aSQL : String ): Boolean;
begin
  Result := False;
  State := csNone;
  ClearProperties;
  with cOpenQuery(aSQL) do 
  begin 
    try
      if not EOF then 
      begin 
        FDATE_CREATE := FieldByName(GetFieldNameFor_DATE_CREATE).AsDateTime;
        FDATE_MODIFY := FieldByName(GetFieldNameFor_DATE_MODIFY).AsDateTime;
        FEndTime := FieldByName(GetFieldNameFor_EndTime).AsDateTime;
        FID := FieldByName(GetFieldNameFor_ID).AsInteger;
        FName := FieldByName(GetFieldNameFor_Name).AsString;
        FNewUnitID := FieldByName(GetFieldNameFor_NewUnit).AsInteger;
        FOPC_UNITID := FieldByName(GetFieldNameFor_OPC_UNIT).AsInteger;
        FOPM_UNITID := FieldByName(GetFieldNameFor_OPM_UNIT).AsInteger;
        FOP_CREATE := FieldByName(GetFieldNameFor_OP_CREATE).AsInteger;
        FOP_MODIFY := FieldByName(GetFieldNameFor_OP_MODIFY).AsInteger;
        FStartTime := FieldByName(GetFieldNameFor_StartTime).AsDateTime;
        Self.State := csLoaded; 
        Result := True;
      end;
    finally
      Free;
    end;
  End;
end;

function TNewShift.GenerateInterbaseMetaData: TStrings;
begin
  Result := TStringList.Create;
  Result.Append( '' );
  Result.Append( 'Create Table ''+ CustomTableName +'' ( ' );
  Result.Append( 'TRMSBaseClass_ID Integer not null, ' );
  Result.Append( 'DATE_CREATE   Date Not Null , ' );
  Result.Append( 'DATE_MODIFY   Date Not Null , ' );
  Result.Append( 'EndTime   Date Not Null , ' );
  Result.Append( 'ID   Integer Not Null  Unique, ' );
  Result.Append( 'Name   Varchar(30) Not Null , ' );
  Result.Append( 'NewUnit_ID Integer Not Null, ' );
  Result.Append( 'OPC_UNIT_ID Integer Not Null, ' );
  Result.Append( 'OPM_UNIT_ID Integer Not Null, ' );
  Result.Append( 'OP_CREATE   Integer Not Null , ' );
  Result.Append( 'OP_MODIFY   Integer Not Null , ' );
  Result.Append( 'StartTime   Date Not Null , ' );
  Result.Append( 'Stamp TimeStamp ' );
  Result.Append( ' ); ' );
end;

function TNewShift.GenerateSQL(ARepeatCount: Integer = 1): TStrings;
var
  sSQL: string;
//  i: Integer;
  ssSQL: TStrings;
begin
  Result := TStringList.Create;
  if State = csNone then 
  begin
    raise Exception.create('Tidak bisa generate dalam Mode csNone')
  end;
  
  ssSQL := CustomSQLTaskPrior; 
  if ssSQL <> nil then 
  begin 
    Result.AddStrings(ssSQL);
  end; 
  ssSQL := nil; 
  
  DATE_MODIFY := cGetServerDateTime;
  FOPM_UNITID := FNewUnitID;
  
  If FID <= 0 then 
  begin 
    //Generate Insert SQL 
    OP_CREATE := OP_MODIFY;
    DATE_CREATE := DATE_MODIFY;
    FOPC_UNITID := FOPM_UNITID;
    FID := cGetNextID(GetFieldNameFor_ID, CustomTableName);
    sSQL := 'insert into ' + CustomTableName + ' ('
      + GetFieldNameFor_DATE_CREATE + ', '
      + GetFieldNameFor_DATE_MODIFY + ', '
      + GetFieldNameFor_EndTime + ', '
      + GetFieldNameFor_ID + ', '
      + GetFieldNameFor_Name + ', '
      + GetFieldNameFor_NewUnit + ', '
      + GetFieldNameFor_OPC_UNIT + ', '
      + GetFieldNameFor_OPM_UNIT + ', '
      + GetFieldNameFor_OP_CREATE + ', '
      + GetFieldNameFor_OP_MODIFY + ', '
      + GetFieldNameFor_StartTime +') values ('
      + TAppUtils.QuotDT(FDATE_CREATE) + ', '
      + TAppUtils.QuotDT(FDATE_MODIFY) + ', '
      + TAppUtils.QuotDT(FEndTime) + ', '
      + IntToStr(FID) + ', '
      + QuotedStr(FName) + ', '
      + InttoStr(FNewUnitID) + ', '
      + InttoStr(FOPC_UNITID) + ', '
      + InttoStr(FOPM_UNITID) + ', '
      + IntToStr(FOP_CREATE) + ', '
      + IntToStr(FOP_MODIFY) + ', '
      + TAppUtils.QuotDT(FStartTime) + ');'
  end 
  else 
  begin 
    //generate Update SQL 
    sSQL := 'update ' + CustomTableName + ' set '
      + GetFieldNameFor_DATE_MODIFY + ' = ' + TAppUtils.QuotDT(FDATE_MODIFY)
      + ', ' + GetFieldNameFor_EndTime + ' = ' + TAppUtils.QuotDT(FEndTime)
      + ', ' + GetFieldNameFor_Name + ' = ' + QuotedStr(FName)
      + ', ' + GetFieldNameFor_NewUnit + ' = ' + IntToStr(FNewUnitID)
      + ', ' + GetFieldNameFor_OPM_UNIT + ' = ' + IntToStr(FOPM_UNITID)
      + ', ' + GetFieldNameFor_OP_MODIFY + ' = ' + IntToStr(FOP_MODIFY)
      + ', ' + GetFieldNameFor_StartTime + ' = ' + TAppUtils.QuotDT(FStartTime)
      + ' where ' + GetFieldNameFor_ID + ' = ' + IntToStr(FID)
      + ' and ' + GetFieldNameFor_NewUnit + ' = ' + IntToStr(FNewUnitID) + ';';
  end;
  Result.Append(sSQL);
  //generating Collections SQL
  
  ssSQL := CustomSQLTask; 
  if ssSQL <> nil then 
  begin 
    Result.AddStrings(ssSQL);
  end; 
  
  FreeAndNil(ssSQL)
end;

function TNewShift.GetFieldNameFor_DATE_CREATE: string;
begin
  Result := 'DATE_CREATE';
end;

function TNewShift.GetFieldNameFor_DATE_MODIFY: string;
begin
  Result := 'DATE_MODIFY';
end;

function TNewShift.GetFieldNameFor_EndTime: string;
begin
  Result := GetFieldPrefix + 'End_Time';
end;

function TNewShift.GetFieldNameFor_ID: string;
begin
  Result := GetFieldPrefix + 'ID';
end;

function TNewShift.GetFieldNameFor_Name: string;
begin
  Result := GetFieldPrefix + 'Name';
end;

function TNewShift.GetFieldNameFor_NewUnit: string;
begin
  Result := GetFieldPrefix + 'UNT_ID';
end;

function TNewShift.GetFieldNameFor_OPC_UNIT: string;
begin
  Result := 'OPC_UNIT';
end;

function TNewShift.GetFieldNameFor_OPM_UNIT: string;
begin
  Result := 'OPM_UNIT';
end;

function TNewShift.GetFieldNameFor_OP_CREATE: string;
begin
  Result := 'OP_CREATE';
end;

function TNewShift.GetFieldNameFor_OP_MODIFY: string;
begin
  Result := 'OP_MODIFY';
end;

function TNewShift.GetFieldNameFor_StartTime: string;
begin
  Result := GetFieldPrefix + 'Start_Time';
end;

function TNewShift.GetFieldPrefix: String;
begin
  Result := 'SHIFT_';
end;

function TNewShift.GetGeneratorName: string;
begin
  Result := 'GEN_' + CustomTableName + '_ID';
end;

function TNewShift.GetHeaderFlag: Integer;
begin
  result := 4727;
end;

function TNewShift.GetNewUnit: TUnit;
begin
  //Result := nil;
  if FNewUnit = nil then
  begin
    FNewUnit := TUnit.Create(Self);
    FNewUnit.LoadByID(FNewUnitID);
  end;
  Result := FNewUnit;
end;

function TNewShift.GetOPC_UNIT: TUnit;
begin
  //Result := nil;
  if FOPC_UNIT = nil then
  begin
    FOPC_UNIT := TUnit.Create(Self);
    FOPC_UNIT.LoadByID(FOPC_UNITID);
  end;
  Result := FOPC_UNIT;
end;

function TNewShift.GetOPM_UNIT: TUnit;
begin
  //Result := nil;
  if FOPM_UNIT = nil then
  begin
    FOPM_UNIT := TUnit.Create(Self);
    FOPM_UNIT.LoadByID(FOPM_UNITID);
  end;
  Result := FOPM_UNIT;
end;

function TNewShift.GetPlannedID: Integer;
begin
  result := -1;
  if State = csNone then
  begin
     Raise exception.create('Tidak bisa GetPlannedID di Mode csNone');
     exit;
  end
  else if state = csCreated then
  begin
     result := cGetNextID(GetFieldNameFor_ID, CustomTableName);
  end
  else if State = csLoaded then
  begin
     result := FID;
  end;
end;

function TNewShift.LoadByID(AID : Integer; AUnitID: Integer): Boolean;
var
  sSQL: string;
begin
  sSQL := 'select * from ' + CustomTableName
    + ' where ' + GetFieldNameFor_ID + ' = ' + IntToStr(AID) 
    + ' and ' + GetFieldNameFor_NewUnit + ' = ' + IntToStr(AUnitID);
  Result := FloadFromDB(sSQL);
end;

function TNewShift.LoadByName(AShiftName: String; AUnitID: Integer): Boolean;
var
  sSQL: string;
begin
  sSQL := 'select * from ' + CustomTableName
    + ' where ' + GetFieldNameFor_Name + ' = ' + QuotedStr(AShiftName)
    + ' and ' + GetFieldNameFor_NewUnit + ' = ' + IntToStr(AUnitID);
  Result := FloadFromDB(sSQL);
end;

function TNewShift.RemoveFromDB: Boolean;
var
  sSQL: string;
begin
  sSQL := 'delete from ' + CustomTableName 
    + ' where ' + GetFieldNameFor_ID + ' = ' + IntToStr(FID) 
    + ' and ' + GetFieldNameFor_NewUnit + ' = ' + IntToStr(FNewUnitID);
  Result := cExecSQL(sSQL, dbtPOS, False);
end;

function TNewShift.SaveToDB: Boolean;
var
  ssSQL: TStrings;
begin
  Result := False;
  try
    ssSQL := GenerateSQL();
    try
      if cExecSQL(ssSQL) then
//        if SimpanBlob(ssSQL,GetHeaderFlag) then
          Result := True;
    except
    end;
  finally
    FreeAndNil(ssSQL);
  end;
end;

procedure TNewShift.SetNewUnit(Value: TUnit);
begin
  FNewUnitID := Value.ID;
end;

procedure TNewShift.SetOPC_UNIT(Value: TUnit);
begin
  FOPC_UNITID := Value.ID;
end;

procedure TNewShift.SetOPM_UNIT(Value: TUnit);
begin
  FOPM_UNITID := Value.ID;
end;

procedure TNewShift.UpdateData(ANewUnitID:Integer; AEndTime: TDateTime; AID:
    Integer; AName: string; AStartTime: TDateTime);
begin
  FNewUnitID :=  ANewUnitID;
  FEndTime :=  AEndTime;
  FID :=  AID;
  FName := Trim(AName);
  FStartTime :=  AStartTime;
  
  State := csCreated;
end;



end.
