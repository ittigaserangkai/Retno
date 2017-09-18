unit uNewPOS;

interface

uses
  SysUtils, Classes, StrUtils, uNewUnit, uTSBaseClass,// JclStrings,
  FireDAC.Comp.Client, udmMain, uAppUtils;

type
  TPOS = class(TSBaseClass)
  private
//    FCreatedUnitID: Integer;
    FActivationDate: TDateTime;
    FCode: string;
    FCounterNo: Integer;
    FCreatedDate: TDateTime;
    FCreatedOP: string;
    FCreatedUnit: TUnit;
    FID: string;
    FIPAddress: string;
    FIsActive: Boolean;
    FIsReset: Boolean;
    FModifiedDate: TDateTime;
    FModifiedOP: string;
    FModifiedUnit: TUnit;
//    FModifiedUnitID: Integer;
    FNewUnit: TUnit;
    FNewUnitID: string;
    FTransactionNo: string;
    function FLoadFromDB( aSQL : String ): Boolean;
//    function GetCreatedUnit: TUnit;
//    function GetModifiedUnit: TUnit;
    function GetNewUnit: TUnit;
//    procedure SetCreatedUnit(Value: TUnit);
//    procedure SetModifiedUnit(Value: TUnit);
    procedure SetNewUnit(Value: TUnit);
  public
    constructor Create(AOwner : TComponent); overload; override;
    constructor CreateWithUser(AOwner: TComponent; AUserID: string); overload;
    destructor Destroy; override;
    procedure Activate(AActivationDate: TDateTime);
    function ActivateAndSaveToDB(AActivationDate: TDateTime): Boolean;
    procedure ClearProperties;
    function CustomSQLTask: Tstrings;
    function CustomSQLTaskPrior: Tstrings;
    class function CustomTableName: string;
    function GenerateInterbaseMetaData: Tstrings;
    function GenerateSQL(aRepeatCount : Integer = 1): TStrings;
    class function GenerateTransactionNo(APOSCode: String; ADate: TDateTime):
        string;
//    function GetFieldNameFor_CreatedUnit: string; dynamic;
    function GetFieldNameFor_ActivationDate: string; dynamic;
    function GetFieldNameFor_Code: string; dynamic;
    function GetFieldNameFor_CounterNo: string; dynamic;
    function GetFieldNameFor_CreatedDate: string; dynamic;
    function GetFieldNameFor_CreatedOP: string; dynamic;
    function GetFieldNameFor_ID: string; dynamic;
    function GetFieldNameFor_IPAddress: string; dynamic;
    function GetFieldNameFor_IsActive: string; dynamic;
    function GetFieldNameFor_IsReset: string; dynamic;
    function GetFieldNameFor_ModifiedDate: string; dynamic;
    function GetFieldNameFor_ModifiedOP: string; dynamic;
//    function GetFieldNameFor_ModifiedUnit: string; dynamic;
    function GetFieldNameFor_NewUnit: string; dynamic;
    function GetFieldNameFor_TransactionNo: string; dynamic;
    function GetGeneratorName: string;
    function GetHeaderFlag: Integer;
    function GetPlannedID: string;
    function LoadByCode(ACode, AUnitID: String; aActiveDate: TDateTime): Boolean;
    function LoadByID(AID, AUnitID: string): Boolean;
    function RemoveFromDB: Boolean;
    function ResetAndSaveToDB: Boolean;
    procedure ResetPOS;
    function SaveToDB: Boolean;
    procedure UpdateData(AID, ANewUnit_ID, ACode: string; ACounterNo: Integer;
        AActivationDate: TDateTime; AIPAddress, ATransactionNo: string; AIsActive:
        Boolean = False; AIsReset: Boolean = True; AModifiedOP: string = '');
//    property CreatedUnit: TUnit read GetCreatedUnit write SetCreatedUnit;
    property ActivationDate: TDateTime read FActivationDate write FActivationDate;
    property Code: string read FCode write FCode;
    property CounterNo: Integer read FCounterNo write FCounterNo;
    property CreatedDate: TDateTime read FCreatedDate write FCreatedDate;
    property CreatedOP: string read FCreatedOP write FCreatedOP;
    property ID: string read FID write FID;
    property IPAddress: string read FIPAddress write FIPAddress;
    property IsActive: Boolean read FIsActive write FIsActive;
    property IsReset: Boolean read FIsReset write FIsReset;
    property ModifiedDate: TDateTime read FModifiedDate write FModifiedDate;
    property ModifiedOP: string read FModifiedOP write FModifiedOP;
//    property ModifiedUnit: TUnit read GetModifiedUnit write SetModifiedUnit;
    property NewUnit: TUnit read GetNewUnit write SetNewUnit;
    property TransactionNo: string read FTransactionNo write FTransactionNo;
  end;
  

implementation

{
************************************* TPOS *************************************
}
constructor TPOS.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
end;

{
************************************* TPOS *************************************
}
constructor TPOS.CreateWithUser(AOwner: TComponent; AUserID: string);
begin
  inherited Create(AOwner);
  ModifiedOP := AUserID;
end;

destructor TPOS.Destroy;
begin
  ClearProperties;
  inherited Destroy;
end;

procedure TPOS.Activate(AActivationDate: TDateTime);
begin
  IsActive := True;
  ActivationDate := AActivationDate;
  IsReset := False;
end;

function TPOS.ActivateAndSaveToDB(AActivationDate: TDateTime): Boolean;
begin
  Result := False;
  Activate(AActivationDate);
  TransactionNo := GenerateTransactionNo(Code,AActivationDate);
  ModifiedDate := cGetServerDateTime;
  if SaveToDB then
    Result := True;
end;

procedure TPOS.ClearProperties;
begin
  Code := '';
  CounterNo := 0;
  CreatedOP := '';
  ID := '';
  IPAddress := '';
  ModifiedOP := '';
  TransactionNo := '';
  IsActive := False;
  IsReset := False;

  FreeAndNil(FCreatedUnit);
  FreeAndNil(FModifiedUnit);
  FreeAndNil(FNewUnit);
end;

function TPOS.CustomSQLTask: Tstrings;
begin
  result := nil;
end;

function TPOS.CustomSQLTaskPrior: Tstrings;
begin
  result := nil;
end;

class function TPOS.CustomTableName: string;
begin
  result := 'SETUPPOS';
end;

function TPOS.FLoadFromDB( aSQL : String ): Boolean;
begin
  result := false;
  State := csNone;
  with cOpenQuery(aSQL) do
  Begin
    try
      if not EOF then
      begin
        FCode := FieldByName(GetFieldNameFor_Code).asString;
        FCounterNo := FieldByName(GetFieldNameFor_CounterNo).asInteger;
        FCreatedDate := FieldByName(GetFieldNameFor_CreatedDate).asDateTime;
        FCreatedOP := FieldByName(GetFieldNameFor_CreatedOP).AsString;
//        FCreatedUnitID := FieldByName(GetFieldNameFor_CreatedUnit).AsInteger;
        FActivationDate := FieldByName(GetFieldNameFor_ActivationDate).asDateTime;
        FID := FieldByName(GetFieldNameFor_ID).AsString;
        FIPAddress := FieldByName(GetFieldNameFor_IPAddress).AsString;
        FIsActive := FieldValues[GetFieldNameFor_IsActive];
        FIsReset := FieldValues[GetFieldNameFor_IsReset];
        FModifiedDate := FieldByName(GetFieldNameFor_ModifiedDate).asDateTime;
        FModifiedOP := FieldByName(GetFieldNameFor_ModifiedOP).AsString;
//        FModifiedUnitID := FieldByName(GetFieldNameFor_ModifiedUnit).AsInteger;
        FNewUnitID := FieldByName(GetFieldNameFor_NewUnit).AsString;
        FTransactionNo := FieldByName(GetFieldNameFor_TransactionNo).AsString;
        Self.State := csLoaded;
        Result := True;
      end;
    finally
      Free;
    end;
  End;
end;

function TPOS.GenerateInterbaseMetaData: Tstrings;
begin
  result := TstringList.create;
  result.Append( '' );
  result.Append( 'Create Table ' + CustomTableName + ' ( ' );
  result.Append( 'ID Integer not null, ' );
  result.Append( 'Code   Varchar(30) Not Null , ' );
  result.Append( 'CounterNo   Integer Not Null , ' );
  result.Append( 'CreatedDate   Date Not Null , ' );
  result.Append( 'CreatedOP   Integer Not Null , ' );
  result.Append( 'CreatedUnit_ID Integer Not Null, ' );
  result.Append( 'DateActivation   Date Not Null , ' );
  result.Append( 'ID   Integer Not Null  Unique, ' );
  result.Append( 'IPAddress   Varchar(30) Not Null , ' );
  result.Append( 'IsActive   Boolean Not Null , ' );
  result.Append( 'IsReset   Boolean Not Null , ' );
  result.Append( 'ModifiedDate   Date Not Null , ' );
  result.Append( 'ModifiedOP   Integer Not Null , ' );
  result.Append( 'ModifiedUnit_ID Integer Not Null, ' );
  result.Append( 'NewUnit_ID Integer Not Null, ' );
  result.Append( 'TransactionNo   Varchar(30) Not Null , ' );
  result.Append( 'Stamp TimeStamp ' );
  result.Append( ' ); ' );
end;

function TPOS.GenerateSQL(aRepeatCount : Integer = 1): TStrings;
var
  sSQL: string;
  //i: Integer;
  ssSQL: TStrings;
begin
  result := TStringList.create;
  if State = csNone then
  Begin
     raise Exception.create('Tidak bisa generate dalam Mode csNone')
  end;

  ssSQL := CustomSQLTaskPrior;
  if ssSQL <> nil then
  Begin
    Result.AddStrings(ssSQL);
  end;
  ssSQL := nil;

//  If FID <= 0 then
  If FID = '' then
  begin
     //Generate Insert SQL
//     FID := cGetNextID(GetFieldNameFor_ID, CustomTableName);
     FID := cGetNextIDGUIDToString;
     sSQL := 'insert into ' + CustomTableName + ' ('
        + GetFieldNameFor_Code + ', '
        + GetFieldNameFor_CounterNo + ', '
        + GetFieldNameFor_CreatedDate + ', '
        + GetFieldNameFor_CreatedOP + ', '
//        + GetFieldNameFor_CreatedUnit + ', '
        + GetFieldNameFor_ActivationDate + ', '
        + GetFieldNameFor_ID + ', '
        + GetFieldNameFor_IPAddress + ', '
        + GetFieldNameFor_IsActive + ', '
        + GetFieldNameFor_IsReset + ', '
        + GetFieldNameFor_ModifiedDate + ', '
        + GetFieldNameFor_ModifiedOP + ', '
//        + GetFieldNameFor_ModifiedUnit + ', '
        + GetFieldNameFor_NewUnit + ', '
        + GetFieldNameFor_TransactionNo + ') values ('
        + QuotedStr(FCode) + ', '
        + IntToStr(FCounterNo) + ', '
        + TAppUtils.QuotDT(FCreatedDate) + ', '
        + QuotedStr(FCreatedOP) + ', '
//        + InttoStr(FCreatedUnitID) + ', '
        //+ IfThen(FIsActive,QuotDT(FCreatedDate),'NULL') + ', ' //activation date, waktu pertama bikin NULL aja deh
        + TAppUtils.QuotD(ActivationDate) + ','
        + QuotedStr(FID) + ', '
        + QuotedStr(FIPAddress) + ', '
        + IfThen(FIsActive,'1','0') + ', '
        + IfThen(FIsReset,'1','0') + ', '
        + TAppUtils.QuotDT(FModifiedDate) + ', '
        + QuotedStr(FModifiedOP) + ', '
//        + InttoStr(FModifiedUnitID) + ', '
        + QuotedStr(FNewUnitID) + ', '
        + QuotedStr(FTransactionNo) + ');'
  end
  else
  begin
     //generate Update SQL
     sSQL := 'Update ' + CustomTableName + ' set '
        + '  ' + GetFieldNameFor_Code + ' = ' + QuotedStr(FCode)
        + ', ' + GetFieldNameFor_CounterNo + ' = ' + IntToStr( FCounterNo)
        //+ ', ' + GetFieldNameFor_CreatedDate + ' = ' + Quotd(FCreatedDate)
        //+ ', ' + GetFieldNameFor_CreatedOP + ' = ' + IntToStr( FCreatedOP)
        //+ ', ' + GetFieldNameFor_CreatedUnit + ' = ' + IntToStr(FCreatedUnitID)
        + ', ' + GetFieldNameFor_ActivationDate + ' = ' + TAppUtils.QuotD(FActivationDate)
        + ', ' + GetFieldNameFor_IPAddress + ' = ' + QuotedStr(FIPAddress)
        + ', ' + GetFieldNameFor_IsActive + ' = ' + IfThen(FIsActive,'1','0')
        + ', ' + GetFieldNameFor_IsReset + ' = ' + IfThen(FIsReset,'1','0')
        + ', ' + GetFieldNameFor_ModifiedDate + ' = ' + TAppUtils.QuotDT(FModifiedDate)
        + ', ' + GetFieldNameFor_ModifiedOP + ' = ' + QuotedStr(FModifiedOP)
//        + ', ' + GetFieldNameFor_ModifiedUnit + ' = ' + IntToStr(FModifiedUnitID)
        + ', ' + GetFieldNameFor_TransactionNo + ' = ' + QuotedStr(FTransactionNo)
        + ' Where ' + GetFieldNameFor_ID + ' = ' + QuotedStr(FID)
        + ' and ' + GetFieldNameFor_NewUnit + ' = ' + QuotedStr(FNewUnitID) + ';';

  end;
  result.append(sSQL);
  //generating Collections SQL

  ssSQL := CustomSQLTask;
  if ssSQL <> nil then
  Begin
    result.AddStrings(ssSQL);
  end;

  FreeAndNil(ssSQL);
end;

class function TPOS.GenerateTransactionNo(APOSCode: String; ADate: TDateTime):
    string;
begin
  Result := APOSCode + FormatDateTime('ddmmyy',ADate);
//  Result := StrPadRight(Result,12,'0');
  Result := Result.PadRight(12,'0');
end;

//function TPOS.GetFieldNameFor_CreatedUnit: string;
//begin
//  Result := 'OPC_UNIT';
//end;

function TPOS.GetFieldNameFor_ActivationDate: string;
begin
  Result := 'SETUPPOS_DATE';
end;

//function TPOS.GetCreatedUnit: TUnit;
//begin
//  //Result := nil;
//  if FCreatedUnit = nil then
//  begin
//    FCreatedUnit := TUnit.Create(Self);
//    FCreatedUnit.LoadByID(FCreatedUnitID);
//  end;
//  Result := FCreatedUnit;
//end;

function TPOS.GetFieldNameFor_Code: string;
begin
  Result := 'SETUPPOS_TERMINAL_CODE';
end;

function TPOS.GetFieldNameFor_CounterNo: string;
begin
  Result := 'SETUPPOS_COUNTER_NO';
end;

function TPOS.GetFieldNameFor_CreatedDate: string;
begin
  Result := 'DATE_CREATE';
end;

function TPOS.GetFieldNameFor_CreatedOP: string;
begin
  Result := 'OP_CREATE';
end;

function TPOS.GetFieldNameFor_ID: string;
begin
  Result := 'SETUPPOS_ID';
end;

function TPOS.GetFieldNameFor_IPAddress: string;
begin
  Result := 'SETUPPOS_IP';
end;

function TPOS.GetFieldNameFor_IsActive: string;
begin
  Result := 'SETUPPOS_IS_ACTIVE';
end;

function TPOS.GetFieldNameFor_IsReset: string;
begin
  Result := 'SETUPPOS_IS_RESET';
end;

function TPOS.GetFieldNameFor_ModifiedDate: string;
begin
  Result := 'DATE_MODIFY';
end;

function TPOS.GetFieldNameFor_ModifiedOP: string;
begin
  Result := 'OP_MODIFY';
end;

//function TPOS.GetFieldNameFor_ModifiedUnit: string;
//begin
//  Result := 'OPM_UNIT';
//end;

function TPOS.GetFieldNameFor_NewUnit: string;
begin
//  Result := 'SETUPPOS_UNT_ID';
  Result := 'AUT$UNIT_ID';
end;

function TPOS.GetFieldNameFor_TransactionNo: string;
begin
  Result := 'SETUPPOS_NO_TRANSAKSI';
end;

function TPOS.GetGeneratorName: string;
begin
  Result := 'GEN_SETUPPOS_ID';
end;

function TPOS.GetHeaderFlag: Integer;
begin
  result := 4622;
end;

//function TPOS.GetModifiedUnit: TUnit;
//begin
//  //Result := nil;
//  if FModifiedUnit = nil then
//  begin
//    FModifiedUnit := TUnit.Create(Self);
//    FModifiedUnit.LoadByID(FModifiedUnitID);
//  end;
//  Result := FModifiedUnit;
//end;

function TPOS.GetNewUnit: TUnit;
begin
  //Result := nil;
  if FNewUnit = nil then
  begin
    FNewUnit := TUnit.Create(Self);
    FNewUnit.LoadByID(FNewUnitID);
  end;
  Result := FNewUnit;
end;

function TPOS.GetPlannedID: string;
begin
//  result := -1;
  Result := '';
  if State = csNone then
  begin
     Raise exception.create('Tidak bisa GetPlannedID di Mode csNone');
     exit;
  end
  else if state = csCreated then
  begin
//     Result := cGetNextID(GetFieldNameFor_ID, CustomTableName);
     Result := cGetNextIDGUIDToString;
  end
  else if State = csLoaded then
  begin
     Result := FID;
  end;
end;

function TPOS.LoadByCode(ACode, AUnitID: String; aActiveDate: TDateTime):
    Boolean;
var
  sSQL: string;
begin
  sSQL := 'select * from ' + CustomTableName
    + ' Where ' + GetFieldNameFor_Code + ' = ' + QuotedStr(ACode)
    + ' and date(' + GetFieldNameFor_ActivationDate + ') = ' + TAppUtils.QuotD(aActiveDate)
    + ' and ' + GetFieldNameFor_NewUnit + ' = ' + QuotedStr(AUnitID);
  result := FloadFromDB(sSQL);
end;

function TPOS.LoadByID(AID, AUnitID: string): Boolean;
var
  sSQL: string;
begin
  sSQL := 'select * from ' + CustomTableName
    + ' Where ' + GetFieldNameFor_ID + ' = ' + QuotedStr(AID)
    + ' and ' + GetFieldNameFor_NewUnit + ' = ' + QuotedStr(AUnitID);
  result := FloadFromDB(sSQL);
end;

function TPOS.RemoveFromDB: Boolean;
var
  sSQL: string;
begin
  sSQL := 'delete from ' + CustomTableName
        + ' where ' + GetFieldNameFor_ID + ' = ' + QuotedStr(FID)
        + ' and ' + GetFieldNameFor_NewUnit + ' = ' + QuotedStr(FNewUnitID);
  Result := cExecSQL(sSQL, dbtPOS, False);
end;

function TPOS.ResetAndSaveToDB: Boolean;
begin
  Result := False;
  ResetPOS;
  ModifiedDate := cGetServerDateTime;
  if SaveToDB then
    Result := True;
end;

procedure TPOS.ResetPOS;
begin
  CounterNo := 0;
  IsReset := True;
  IsActive := False;
end;

function TPOS.SaveToDB: Boolean;
var
  sSQL: TStrings;
begin
  Result := False;
  try
    sSQL := GenerateSQL();
    try
      if cExecSQL(sSQL, dbtPOS) then
          Result := True;
    except
    end;
  finally
    FreeAndNil(sSQL);
   end;
end;

//procedure TPOS.SetCreatedUnit(Value: TUnit);
//begin
//  FCreatedUnitID := Value.ID
//end;

//procedure TPOS.SetModifiedUnit(Value: TUnit);
//begin
//  FModifiedUnitID := Value.ID;
//end;

procedure TPOS.SetNewUnit(Value: TUnit);
begin
  FNewUnitID := Value.ID;
end;

procedure TPOS.UpdateData(AID, ANewUnit_ID, ACode: string; ACounterNo: Integer;
    AActivationDate: TDateTime; AIPAddress, ATransactionNo: string; AIsActive:
    Boolean = False; AIsReset: Boolean = True; AModifiedOP: string = '');
begin
  FCode := Trim(aCode);
  FCounterNo := aCounterNo;
  FActivationDate := AActivationDate;
  FID := AID;
  FIPAddress := Trim(aIPAddress);
  FIsActive := AIsActive;
  FIsReset := AIsReset;
  FNewUnitID := ANewUnit_ID;
  FTransactionNo := Trim(aTransactionNo);

  FCreatedDate := cGetServerDateTime;
  FCreatedOP := AModifiedOP;
//  FCreatedUnitID := ANewUnit_ID;
  FModifiedDate := FCreatedDate;
  FModifiedOP := aModifiedOP;
//  FModifiedUnitID := ANewUnit_ID;

  State := csCreated;
end;


end.
