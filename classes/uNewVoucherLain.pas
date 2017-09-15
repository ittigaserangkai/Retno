unit uNewVoucherLain;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs, StrUtils,
  uNewUnit, uTSBaseClass, uConstanta;

type
  TVoucherLain = class(TSBaseClass)
  private
    FDATE_CREATE: TDateTime;
    FDATE_MODIFY: TDateTime;
    FID: string;
    FIsActive: Boolean;
    FNewUnit: TUnit;
    FNewUnitID: string;
//    FOPC_UNIT: TUnit;
//    FOPC_UNITID: Integer;
//    FOPM_UNIT: TUnit;
//    FOPM_UNITID: Integer;
    FOP_CREATE: string;
    FOP_MODIFY: string;
    FQty: Integer;
    FTotalValue: Double;
    FTransNo: string;
    FValue: Double;
    function FLoadFromDB(ASQL : String ): Boolean;
    function GetNewUnit: TUnit;
//    function GetOPC_UNIT: TUnit;
//    function GetOPM_UNIT: TUnit;
    procedure SetNewUnit(Value: TUnit);
  public
    constructor Create(AOwner : TComponent); override;
    constructor CreateWithUser(AOwner: TComponent; AUserID: string);
    destructor Destroy; override;
    procedure ClearProperties;
    function CustomSQLTask: Tstrings;
    function CustomSQLTaskPrior: Tstrings;
    function CustomTableName: string;
    function GenerateInterbaseMetaData: TStrings;
    function GenerateSQL(ARepeatCount: Integer = 1): TStrings;
    function GetFieldNameFor_DATE_CREATE: string; dynamic;
    function GetFieldNameFor_DATE_MODIFY: string; dynamic;
    function GetFieldNameFor_ID: string; dynamic;
    function GetFieldNameFor_IsActive: string; dynamic;
    function GetFieldNameFor_NewUnit: string; dynamic;
//    function GetFieldNameFor_OPC_UNIT: string; dynamic;
//    function GetFieldNameFor_OPM_UNIT: string; dynamic;
    function GetFieldNameFor_OP_CREATE: string; dynamic;
    function GetFieldNameFor_OP_MODIFY: string; dynamic;
    function GetFieldNameFor_Qty: string; dynamic;
    function GetFieldNameFor_TotalValue: string; dynamic;
    function GetFieldNameFor_TransNo: string; dynamic;
//    function GetFieldNameFor_TransUnit: string; dynamic;
    function GetFieldNameFor_Value: string; dynamic;
    function GetFieldPrefix: string;
    function GetGeneratorName: string; dynamic;
    function GetHeaderFlag: Integer;
    function GetPlannedID: string;
    function LoadByID(AID, AUnitID: string): Boolean;
    function RemoveFromDB: Boolean;
    function SaveToDB: Boolean;
    procedure UpdateData(AID: string; AIsActive: Boolean; ANewUnit_ID: string;
        AQty: Integer; ATotalValue: Double; ATransNo: string; AValue: Double);
    property DATE_CREATE: TDateTime read FDATE_CREATE write FDATE_CREATE;
    property DATE_MODIFY: TDateTime read FDATE_MODIFY write FDATE_MODIFY;
    property ID: string read FID write FID;
    property IsActive: Boolean read FIsActive write FIsActive;
    property NewUnit: TUnit read GetNewUnit write SetNewUnit;
//    property OPC_UNIT: TUnit read GetOPC_UNIT write SetOPC_UNIT;
//    property OPM_UNIT: TUnit read GetOPM_UNIT write SetOPM_UNIT;
    property OP_CREATE: string read FOP_CREATE write FOP_CREATE;
    property OP_MODIFY: string read FOP_MODIFY write FOP_MODIFY;
    property Qty: Integer read FQty write FQty;
    property TotalValue: Double read FTotalValue write FTotalValue;
    property TransNo: string read FTransNo write FTransNo;
    property Value: Double read FValue write FValue;
  end;

  TVoucherLainItem = class(TCollectionItem)
  private
    FVoucherLain: TVoucherLain;
    FVoucherLainID: string;
    FVoucherLainUnit: string;
    function GetVoucherLain: TVoucherLain;
  public
    constructor Create(aCollection : TCollection); override;
    destructor Destroy; override;
    property VoucherLain: TVoucherLain read GetVoucherLain write FVoucherLain;
    property VoucherLainID: string read FVoucherLainID write FVoucherLainID;
    property VoucherLainUnit: string read FVoucherLainUnit write FVoucherLainUnit;
  end;

  TVoucherLainItems = class(TCollection)
  private
    function GetVoucherLain(Index: Integer): TVoucherLainItem;
    procedure SetVoucherLain(Index: Integer; const Value: TVoucherLainItem);
  public
    function Add: TVoucherLainItem;
    property VoucherLain[Index: Integer]: TVoucherLainItem read GetVoucherLain write
        SetVoucherLain; default;
  end;


implementation

uses udmMain, uAppUtils;

{
********************************* TVoucherLain *********************************
}
constructor TVoucherLain.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
end;

constructor TVoucherLain.CreateWithUser(AOwner: TComponent; AUserID: string);
begin
  Create(AOwner);
  OP_MODIFY := AUserID;
//  FOPM_UNITID := AUnitID;
end;

destructor TVoucherLain.Destroy;
begin
  ClearProperties;
  inherited Destroy;
end;

procedure TVoucherLain.ClearProperties;
begin
  Value := 0;
  TransNo := '';
  TotalValue := 0;
  Qty := 0;
  IsActive := FALSE;
  ID := '';
end;

function TVoucherLain.CustomSQLTask: Tstrings;
begin
  result := nil;
end;

function TVoucherLain.CustomSQLTaskPrior: Tstrings;
begin
  result := nil;
end;

function TVoucherLain.CustomTableName: string;
begin
  Result := 'voucher_lain_lain';
end;

function TVoucherLain.FLoadFromDB(ASQL : String): Boolean;
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
        FID := FieldByName(GetFieldNameFor_ID).AsString;
        FIsActive := FieldValues[GetFieldNameFor_IsActive];
        FNewUnitID := FieldByName(GetFieldNameFor_NewUnit).AsString;
//        FOPC_UNITID := FieldByName(GetFieldNameFor_OPC_UNIT).AsInteger;
//        FOPM_UNITID := FieldByName(GetFieldNameFor_OPM_UNIT).AsInteger;
        FOP_CREATE := FieldByName(GetFieldNameFor_OP_CREATE).AsString;
        FOP_MODIFY := FieldByName(GetFieldNameFor_OP_MODIFY).AsString;
        FQty := FieldByName(GetFieldNameFor_Qty).AsInteger;
        FTotalValue := FieldByName(GetFieldNameFor_TotalValue).AsFloat;
        FTransNo := FieldByName(GetFieldNameFor_TransNo).AsString;
        FValue := FieldByName(GetFieldNameFor_Value).AsFloat;
        Self.State := csLoaded;
        Result := True;
      end;
    finally
      Free;
    end;
  End;
end;

function TVoucherLain.GenerateInterbaseMetaData: TStrings;
begin
  Result := TStringList.Create;
  Result.Append( '' );
  Result.Append( 'Create Table ''+ CustomTableName +'' ( ' );
  Result.Append( 'TRMSBaseClass_ID Integer not null, ' );
  Result.Append( 'DATE_CREATE   Date Not Null , ' );
  Result.Append( 'DATE_MODIFY   Date Not Null , ' );
  Result.Append( 'ID   Integer Not Null  Unique, ' );
  Result.Append( 'IsActive   Boolean Not Null , ' );
  Result.Append( 'NewUnit_ID Integer Not Null, ' );
  Result.Append( 'OPC_UNIT_ID Integer Not Null, ' );
  Result.Append( 'OPM_UNIT_ID Integer Not Null, ' );
  Result.Append( 'OP_CREATE   Integer Not Null , ' );
  Result.Append( 'OP_MODIFY   Integer Not Null , ' );
  Result.Append( 'Qty   Integer Not Null , ' );
  Result.Append( 'TotalValue   double precision Not Null , ' );
  Result.Append( 'TransNo   Varchar(30) Not Null , ' );
  Result.Append( 'TransUnit   Integer Not Null , ' );
  Result.Append( 'Value   double precision Not Null , ' );
  Result.Append( 'Stamp TimeStamp ' );
  Result.Append( ' ); ' );
end;

function TVoucherLain.GenerateSQL(ARepeatCount: Integer = 1): TStrings;
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
  //ssSQL := nil;

  DATE_MODIFY := cGetServerDateTime;
//  FOPM_UNITID := FNewUnitID;

//  If FID <= 0 then
  if FID = '' then
  begin
    //Generate Insert SQL
    OP_CREATE := OP_MODIFY;
    DATE_CREATE := DATE_MODIFY;
//    FOPC_UNITID := FOPM_UNITID;
//    FID := cGetNextID(GetFieldNameFor_ID, CustomTableName);
    FID := cGetNextIDGUIDToString;
    sSQL := 'insert into ' + CustomTableName + ' ('
      + GetFieldNameFor_DATE_CREATE + ', '
      + GetFieldNameFor_DATE_MODIFY + ', '
      + GetFieldNameFor_ID + ', '
      + GetFieldNameFor_IsActive + ', '
      + GetFieldNameFor_NewUnit + ', '
//      + GetFieldNameFor_OPC_UNIT + ', '
//      + GetFieldNameFor_OPM_UNIT + ', '
      + GetFieldNameFor_OP_CREATE + ', '
      + GetFieldNameFor_OP_MODIFY + ', '
      + GetFieldNameFor_Qty + ', '
      + GetFieldNameFor_TotalValue + ', '
      + GetFieldNameFor_TransNo + ', '
//      + GetFieldNameFor_TransUnit + ', '
      + GetFieldNameFor_Value +') values ('
      + TAppUtils.QuotDT(FDATE_CREATE) + ', '
      + TAppUtils.QuotDT(FDATE_MODIFY) + ', '
      + QuotedStr(FID) + ', '
      + IfThen(FIsActive,'1','0') + ', '
      + QuotedStr(FNewUnitID) + ', '
//      + InttoStr(FOPC_UNITID) + ', '
//      + InttoStr(FOPM_UNITID) + ', '
      + QuotedStr(FOP_CREATE) + ', '
      + QuotedStr(FOP_MODIFY) + ', '
      + IntToStr(FQty) + ', '
      + FormatFloat('0.00', FTotalValue) + ', '
      + QuotedStr(FTransNo) + ', '
//      + QuotedStr(FNewUnitID) + ', '
      + FormatFloat('0.00', FValue) + ');';
  end
  else
  begin
    //generate Update SQL
    sSQL := 'update ' + CustomTableName + ' set '
      + GetFieldNameFor_DATE_MODIFY + ' = ' + TAppUtils.QuotDT(FDATE_MODIFY)
      + ', ' + GetFieldNameFor_IsActive + ' = ' + IfThen(FIsActive,'1','0')
      + ', ' + GetFieldNameFor_NewUnit + ' = ' + QuotedStr(FNewUnitID)
//      + ', ' + GetFieldNameFor_OPM_UNIT + ' = ' + IntToStr(FOPM_UNITID)
      + ', ' + GetFieldNameFor_OP_MODIFY + ' = ' + QuotedStr(FOP_MODIFY)
      + ', ' + GetFieldNameFor_Qty + ' = ' + IntToStr(FQty)
      + ', ' + GetFieldNameFor_TotalValue + ' = ' + FormatFloat('0.00', FTotalValue)
      + ', ' + GetFieldNameFor_TransNo + ' = ' + QuotedStr(FTransNo)
//      + ', ' + GetFieldNameFor_TransUnit + ' = ' + QuotedStr(FNewUnitID)
      + ', ' + GetFieldNameFor_Value + ' = ' + FormatFloat('0.00', FValue)
      + ' where ' + GetFieldNameFor_ID + ' = ' + QuotedStr(FID)
      + ' and ' + GetFieldNameFor_NewUnit + ' = ' + QuotedStr(FNewUnitID) + ';';
  end;
  Result.Append(sSQL);
  //generating Collections SQL

  ssSQL := CustomSQLTask;
  if ssSQL <> nil then
  begin
    Result.AddStrings(ssSQL);
  end;

  //FreeAndNil(ssSQL);
end;

function TVoucherLain.GetFieldNameFor_DATE_CREATE: string;
begin
  Result := 'DATE_CREATE';
end;

function TVoucherLain.GetFieldNameFor_DATE_MODIFY: string;
begin
  Result := 'DATE_MODIFY';
end;

function TVoucherLain.GetFieldNameFor_ID: string;
begin
//  Result := GetFieldPrefix + 'ID';
  Result := 'VOUCHER_LAIN_LAIN_ID';
end;

function TVoucherLain.GetFieldNameFor_IsActive: string;
begin
  Result := GetFieldPrefix + 'Is_Active';
end;

function TVoucherLain.GetFieldNameFor_NewUnit: string;
begin
//  Result := GetFieldPrefix + 'UNT_ID';
  Result := 'AUT$UNIT_ID'
end;

//function TVoucherLain.GetFieldNameFor_OPC_UNIT: string;
//begin
//  Result := 'OPC_UNIT';
//end;

//function TVoucherLain.GetFieldNameFor_OPM_UNIT: string;
//begin
//  Result := 'OPM_UNIT';
//end;

function TVoucherLain.GetFieldNameFor_OP_CREATE: string;
begin
  Result := 'OP_CREATE';
end;

function TVoucherLain.GetFieldNameFor_OP_MODIFY: string;
begin
  Result := 'OP_MODIFY';
end;

function TVoucherLain.GetFieldNameFor_Qty: string;
begin
  Result := GetFieldPrefix + 'Qty';
end;

function TVoucherLain.GetFieldNameFor_TotalValue: string;
begin
  Result := GetFieldPrefix + 'Total_Value';
end;

function TVoucherLain.GetFieldNameFor_TransNo: string;
begin
  Result := GetFieldPrefix + 'Trans_No';
end;

//function TVoucherLain.GetFieldNameFor_TransUnit: string;
//begin
//  Result := GetFieldPrefix + 'Trans_Unt_id';
//end;

function TVoucherLain.GetFieldNameFor_Value: string;
begin
  Result := GetFieldPrefix + 'Value';
end;

function TVoucherLain.GetFieldPrefix: string;
begin
  Result := 'vcrl_';
end;

function TVoucherLain.GetGeneratorName: string;
begin
  Result := 'GEN_' + CustomTableName + '_ID';
end;

function TVoucherLain.GetHeaderFlag: Integer;
begin
  result := 5521;
end;

function TVoucherLain.GetNewUnit: TUnit;
begin
//  Result := nil;
  if FNewUnit = nil then
  begin
    FNewUnit := TUnit.Create(Self);
    FNewUnit.LoadByID(FNewUnitID);
  end;
  Result := FNewUnit;
end;

//function TVoucherLain.GetOPC_UNIT: TUnit;
//begin
////  Result := nil;
//  if FOPC_UNIT = nil then
//  begin
//    FOPC_UNIT := TUnit.Create(Self);
//    FOPC_UNIT.LoadByID(FOPC_UNITID);
//  end;
//  Result := FOPC_UNIT;
//end;

//function TVoucherLain.GetOPM_UNIT: TUnit;
//begin
////  Result := nil;
//  if FOPM_UNIT = nil then
//  begin
//    FOPM_UNIT := TUnit.Create(Self);
//    FOPM_UNIT.LoadByID(FOPM_UNITID);
//  end;
//  Result := FOPM_UNIT;
//end;

function TVoucherLain.GetPlannedID: string;
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

function TVoucherLain.LoadByID(AID, AUnitID: string): Boolean;
var
  sSQL: string;
begin
  sSQL := 'select * from ' + CustomTableName
    + ' where ' + GetFieldNameFor_ID + ' = ' + QuotedStr(AID)
    + ' and ' + GetFieldNameFor_NewUnit + ' = ' + QuotedStr(AUnitID);
  Result := FloadFromDB(sSQL);
end;

function TVoucherLain.RemoveFromDB: Boolean;
var
  sSQL: string;
begin
  Result := False;

  sSQL := 'delete from ' + CustomTableName
    + ' where ' + GetFieldNameFor_ID + ' = ' + QuotedStr(FID)
    + ' and ' + GetFieldNameFor_NewUnit + ' = ' + QuotedStr(FNewUnitID);
  if cExecSQL(sSQL, dbtPOS, False) then
    Result := True; //SimpanBlob(sSQL,GetHeaderFlag);
end;

function TVoucherLain.SaveToDB: Boolean;
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

procedure TVoucherLain.SetNewUnit(Value: TUnit);
begin
  FNewUnitID := Value.ID;
end;

//procedure TVoucherLain.SetOPC_UNIT(Value: TUnit);
//begin
//  FOPC_UNITID := Value.ID;
//end;

//procedure TVoucherLain.SetOPM_UNIT(Value: TUnit);
//begin
//  FOPM_UNITID := Value.ID;
//end;

procedure TVoucherLain.UpdateData(AID: string; AIsActive: Boolean; ANewUnit_ID:
    string; AQty: Integer; ATotalValue: Double; ATransNo: string; AValue:
    Double);
begin
  FID :=  ID;
  FIsActive := AIsActive;
  FNewUnitID := ANewUnit_ID;
  FQty := AQty;
  FTotalValue := ATotalValue;
  FTransNo := Trim(ATransNo);
  FValue := AValue;

  State := csCreated;
end;

{
***************************** TPOSTransactionItems *****************************
}
function TVoucherLainItems.Add: TVoucherLainItem;
begin
  Result := (inherited Add) as TVoucherLainItem;
end;

function TVoucherLainItems.GetVoucherLain(Index: Integer): TVoucherLainItem;
begin
  Result := (Inherited Items[Index]) as TVoucherLainItem;
end;

procedure TVoucherLainItems.SetVoucherLain(Index: Integer; const Value:
    TVoucherLainItem);
begin
  Inherited Items[Index] := Value;
end;

{
***************************** TPOSTransactionItem ******************************
}
constructor TVoucherLainItem.Create(aCollection : TCollection);
begin
  inherited Create(ACollection);
end;

destructor TVoucherLainItem.Destroy;
begin
  inherited Destroy;
end;

function TVoucherLainItem.GetVoucherLain: TVoucherLain;
begin
//  Result := nil;
  if FVoucherLain = nil then
  begin
    FVoucherLain := TVoucherLain.Create(Application);
    FVoucherLain.LoadByID(VoucherLainID,VoucherLainUnit);
  end;
  Result := FVoucherLain;
end;

end.
