unit uNewPOSTransactionCard;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs, StrUtils,
  uNewUnit, uTSBaseClass, uConstanta, udmMain, uAppUtils;

type
  TPOSTransactionCard = class(TSBaseClass)
  private
    FCardID: string;
    FCashbackCharge: Double;
    FCashbackNilai: Double;
    FCharge: Double;
    FDATE_CREATE: TDateTime;
    FDATE_MODIFY: TDateTime;
    FID: string;
    FIsActive: Boolean;
    FNewUnit: TUnit;
    FNewUnitID: string;
    FNilai: Double;
    FNomor: string;
    FNoOtorisasi: string;
//    FOPC_UNIT: TUnit;
//    FOPC_UNITID: Integer;
//    FOPM_UNIT: TUnit;
//    FOPM_UNITID: Integer;
    FOP_CREATE: string;
    FOP_MODIFY: string;
    FTransNo: string;
    function FLoadFromDB( aSQL : String ): Boolean;
    function GetNewUnit: TUnit;
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
    function GetFieldNameFor_CardID: string; dynamic;
//    function GetFieldNameFor_CardUnit: string; dynamic;
    function GetFieldNameFor_CashbackCharge: string; dynamic;
    function GetFieldNameFor_CashbackNilai: string; dynamic;
    function GetFieldNameFor_Charge: string; dynamic;
    function GetFieldNameFor_DATE_CREATE: string; dynamic;
    function GetFieldNameFor_DATE_MODIFY: string; dynamic;
    function GetFieldNameFor_ID: string; dynamic;
    function GetFieldNameFor_IsActive: string; dynamic;
    function GetFieldNameFor_NewUnit: string; dynamic;
    function GetFieldNameFor_Nilai: string; dynamic;
    function GetFieldNameFor_Nomor: string; dynamic;
    function GetFieldNameFor_NoOtorisasi: string; dynamic;
//    function GetFieldNameFor_OPC_UNIT: string; dynamic;
//    function GetFieldNameFor_OPM_UNIT: string; dynamic;
    function GetFieldNameFor_OP_CREATE: string; dynamic;
    function GetFieldNameFor_OP_MODIFY: string; dynamic;
    function GetFieldNameFor_TransNo: string; dynamic;
//    function GetFieldNameFor_TransUnit: string; dynamic;
    function GetFieldPrefix: string;
    function GetGeneratorName: string; dynamic;
    function GetHeaderFlag: Integer;
    function GetPlannedID: string;
    function LoadByID(AID, AUnitID: string): Boolean;
    function LoadByTransNo(ATransNo, AUnitID: String): Boolean;
    function RemoveFromDB: Boolean;
    function SaveToDB: Boolean;
    procedure UpdateData(ACardID: string; ACashbackCharge, ACashbackNilai, ACharge:
        Double; AID: string; AIsActive: Boolean; ANewUnit_ID: string; ANilai:
        Double; ANomor, ANoOtorisasi, ATransNo: string);
    property CardID: string read FCardID write FCardID;
    property CashbackCharge: Double read FCashbackCharge write FCashbackCharge;
    property CashbackNilai: Double read FCashbackNilai write FCashbackNilai;
    property Charge: Double read FCharge write FCharge;
    property DATE_CREATE: TDateTime read FDATE_CREATE write FDATE_CREATE;
    property DATE_MODIFY: TDateTime read FDATE_MODIFY write FDATE_MODIFY;
    property ID: string read FID write FID;
    property IsActive: Boolean read FIsActive write FIsActive;
    property NewUnit: TUnit read GetNewUnit write SetNewUnit;
    property Nilai: Double read FNilai write FNilai;
    property Nomor: string read FNomor write FNomor;
    property NoOtorisasi: string read FNoOtorisasi write FNoOtorisasi;
//    property OPC_UNIT: TUnit read GetOPC_UNIT write SetOPC_UNIT;
//    property OPM_UNIT: TUnit read GetOPM_UNIT write SetOPM_UNIT;
    property OP_CREATE: string read FOP_CREATE write FOP_CREATE;
    property OP_MODIFY: string read FOP_MODIFY write FOP_MODIFY;
    property TransNo: string read FTransNo write FTransNo;
  end;

function Get_Price_Precision: string;

function _Price_Precision: Integer;

implementation

function Get_Price_Precision: string;
var
   i : Smallint;
begin
   Result := '0.';
   for i := 1 to (_Price_Precision * -1) do
   begin
       Result := Result + '0';
   end;
end;

function _Price_Precision: Integer;
var
  iTemp: Integer;
begin
  if TryStrToInt(getGlobalVar('PRICEPRECISION'), iTemp) then
     Result := iTemp
  else
     Result := igPrice_Precision;
end;

{
***************************** TPOSTransactionCard ******************************
}
constructor TPOSTransactionCard.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
end;

constructor TPOSTransactionCard.CreateWithUser(AOwner: TComponent; AUserID:
    string);
begin
  Create(AOwner);
  OP_MODIFY := AUserID;
//  FOPM_UNITID := AUnitID;
end;

destructor TPOSTransactionCard.Destroy;
begin
  ClearProperties;
  inherited Destroy;
end;

procedure TPOSTransactionCard.ClearProperties;
begin
  TransNo := '';
  NoOtorisasi := '';
  Nomor := '';
  Nilai := 0;
  IsActive := FALSE;
  ID := '';
  Charge := 0;
  CashbackNilai := 0;
  CashbackCharge := 0;
  CardID := '';
end;

function TPOSTransactionCard.CustomSQLTask: Tstrings;
begin
  result := nil;
end;

function TPOSTransactionCard.CustomSQLTaskPrior: Tstrings;
begin
  result := nil;
end;

function TPOSTransactionCard.CustomTableName: string;
begin
  Result := 'transaksi_card';
end;

function TPOSTransactionCard.FLoadFromDB( aSQL : String ): Boolean;
begin
  Result := False;
  State := csNone;
  ClearProperties;
  with cOpenQuery(aSQL) do
  begin
    try
      if not EOF then
      begin
        FCardID := FieldByName(GetFieldNameFor_CardID).AsString;
        FCashbackCharge := FieldByName(GetFieldNameFor_CashbackCharge).AsFloat;
        FCashbackNilai := FieldByName(GetFieldNameFor_CashbackNilai).AsFloat;
        FCharge := FieldByName(GetFieldNameFor_Charge).AsFloat;
        FDATE_CREATE := FieldByName(GetFieldNameFor_DATE_CREATE).AsDateTime;
        FDATE_MODIFY := FieldByName(GetFieldNameFor_DATE_MODIFY).AsDateTime;
        FID := FieldByName(GetFieldNameFor_ID).AsString;
        FIsActive := FieldValues[GetFieldNameFor_IsActive];
        FNewUnitID := FieldByName(GetFieldNameFor_NewUnit).AsString;
        FNilai := FieldByName(GetFieldNameFor_Nilai).AsFloat;
        FNomor := FieldByName(GetFieldNameFor_Nomor).AsString;
        FNoOtorisasi := FieldByName(GetFieldNameFor_NoOtorisasi).AsString;
//        FOPC_UNITID := FieldByName(GetFieldNameFor_OPC_UNIT).AsInteger;
//        FOPM_UNITID := FieldByName(GetFieldNameFor_OPM_UNIT).AsInteger;
        FOP_CREATE := FieldByName(GetFieldNameFor_OP_CREATE).AsString;
        FOP_MODIFY := FieldByName(GetFieldNameFor_OP_MODIFY).AsString;
        FTransNo := FieldByName(GetFieldNameFor_TransNo).AsString;

        Self.State := csLoaded;
        Result := True;
      end;
    finally
      Free;
    end;
  End;
end;

function TPOSTransactionCard.GenerateInterbaseMetaData: TStrings;
begin
  Result := TStringList.Create;
  Result.Append( '' );
  Result.Append( 'Create Table ''+ CustomTableName +'' ( ' );
  Result.Append( 'TRMSBaseClass_ID Integer not null, ' );
  Result.Append( 'CardID   Integer Not Null , ' );
  Result.Append( 'CashbackCharge   double precision Not Null , ' );
  Result.Append( 'CashbackNilai   double precision Not Null , ' );
  Result.Append( 'Charge   double precision Not Null , ' );
  Result.Append( 'DATE_CREATE   Date Not Null , ' );
  Result.Append( 'DATE_MODIFY   Date Not Null , ' );
  Result.Append( 'ID   Integer Not Null  Unique, ' );
  Result.Append( 'IsActive   Boolean Not Null , ' );
  Result.Append( 'NewUnit_ID Integer Not Null, ' );
  Result.Append( 'Nilai   double precision Not Null , ' );
  Result.Append( 'Nomor   Varchar(30) Not Null , ' );
  Result.Append( 'NoOtorisasi   Varchar(30) Not Null , ' );
  Result.Append( 'OPC_UNIT_ID Integer Not Null, ' );
  Result.Append( 'OPM_UNIT_ID Integer Not Null, ' );
  Result.Append( 'OP_CREATE   Integer Not Null , ' );
  Result.Append( 'OP_MODIFY   Integer Not Null , ' );
  Result.Append( 'TransNo   Varchar(30) Not Null , ' );
  Result.Append( 'Stamp TimeStamp ' );
  Result.Append( ' ); ' );
end;

function TPOSTransactionCard.GenerateSQL(ARepeatCount: Integer = 1): TStrings;
var
  sPrec: string;
  sSQL: string;
  //i: Integer;
  ssSQL: TStrings;
begin
  Result := TStringList.Create;
  if State = csNone then
  begin
    raise Exception.create('Tidak bisa generate dalam Mode csNone')
  end;

  sPrec := Get_Price_Precision;

  ssSQL := CustomSQLTaskPrior;
  if ssSQL <> nil then
  begin
    Result.AddStrings(ssSQL);
  end;
  ssSQL := nil;

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
      + GetFieldNameFor_CardID + ', '
//      + GetFieldNameFor_CardUnit + ', '
      + GetFieldNameFor_CashbackCharge + ', '
      + GetFieldNameFor_CashbackNilai + ', '
      + GetFieldNameFor_Charge + ', '
      + GetFieldNameFor_DATE_CREATE + ', '
      + GetFieldNameFor_DATE_MODIFY + ', '
      + GetFieldNameFor_ID + ', '
      + GetFieldNameFor_IsActive + ', '
      + GetFieldNameFor_NewUnit + ', '
      + GetFieldNameFor_Nilai + ', '
      + GetFieldNameFor_Nomor + ', '
      + GetFieldNameFor_NoOtorisasi + ', '
//      + GetFieldNameFor_OPC_UNIT + ', '
//      + GetFieldNameFor_OPM_UNIT + ', '
      + GetFieldNameFor_OP_CREATE + ', '
      + GetFieldNameFor_OP_MODIFY + ', '
//      + GetFieldNameFor_TransUnit + ', '
      + GetFieldNameFor_TransNo +') values ('
      + QuotedStr(FCardID) + ', '
//      + QuotedStr(FNewUnitID) + ', '
      + FormatFloat(sPrec, FCashbackCharge) + ', '
      + FormatFloat(sPrec, FCashbackNilai) + ', '
      + FormatFloat(sPrec, FCharge) + ', '
      + TAppUtils.QuotDT(FDATE_CREATE) + ', '
      + TAppUtils.QuotDT(FDATE_MODIFY) + ', '
      + QuotedStr(FID) + ', '
      + IfThen(FIsActive,'1','0') + ', '
      + QuotedStr(FNewUnitID) + ', '
      + FormatFloat(sPrec, FNilai) + ', '
      + QuotedStr(FNomor) + ', '
      + QuotedStr(FNoOtorisasi) + ', '
//      + InttoStr(FOPC_UNITID) + ', '
//      + InttoStr(FOPM_UNITID) + ', '
      + QuotedStr(FOP_CREATE) + ', '
      + QuotedStr(FOP_MODIFY) + ', '
//      + QuotedStr(FNewUnitID) + ', '
      + QuotedStr(FTransNo) + ');';
  end
  else
  begin
    //generate Update SQL
    sSQL := 'update ' + CustomTableName + ' set '
      + GetFieldNameFor_CardID + ' = ' + QuotedStr(FCardID)
//      + ', ' + GetFieldNameFor_CardUnit + ' = ' + QuotedStr(FNewUnitID)
      + ', ' + GetFieldNameFor_CashbackCharge + ' = ' + FormatFloat(sPrec, FCashbackCharge)
      + ', ' + GetFieldNameFor_CashbackNilai + ' = ' + FormatFloat(sPrec, FCashbackNilai)
      + ', ' + GetFieldNameFor_Charge + ' = ' + FormatFloat(sPrec, FCharge)
      + ', ' + GetFieldNameFor_DATE_MODIFY + ' = ' + TAppUtils.QuotDT(FDATE_MODIFY)
      + ', ' + GetFieldNameFor_IsActive + ' = ' + IfThen(FIsActive,'1','0')
      + ', ' + GetFieldNameFor_NewUnit + ' = ' + QuotedStr(FNewUnitID)
      + ', ' + GetFieldNameFor_Nilai + ' = ' + FormatFloat(sPrec, FNilai)
      + ', ' + GetFieldNameFor_Nomor + ' = ' + QuotedStr(FNomor)
      + ', ' + GetFieldNameFor_NoOtorisasi + ' = ' + QuotedStr(FNoOtorisasi)
//      + ', ' + GetFieldNameFor_OPM_UNIT + ' = ' + IntToStr(FOPM_UNITID)
      + ', ' + GetFieldNameFor_OP_MODIFY + ' = ' + QuotedStr(FOP_MODIFY)
//      + ', ' + GetFieldNameFor_TransUnit + ' = ' + QuotedStr(FNewUnitID)
      + ', ' + GetFieldNameFor_TransNo + ' = ' + QuotedStr(FTransNo)
      + ' where ' + GetFieldNameFor_ID + ' = ' + QuotedStr(FID) + ';';
//      + ' and ' + GetFieldNameFor_NewUnit + ' = ' + QuotedStr(FNewUnitID) + ';';
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

function TPOSTransactionCard.GetFieldNameFor_CardID: string;
begin
//  Result := GetFieldPrefix + 'card_id';
  Result := 'REF$CREDIT_CARD_ID';
end;

//function TPOSTransactionCard.GetFieldNameFor_CardUnit: string;
//begin
//  Result := GetFieldPrefix + 'card_unt_id';
//end;

function TPOSTransactionCard.GetFieldNameFor_CashbackCharge: string;
begin
  Result := GetFieldPrefix + 'Cashback_Charge';
end;

function TPOSTransactionCard.GetFieldNameFor_CashbackNilai: string;
begin
  Result := GetFieldPrefix + 'Cashback_Nilai';
end;

function TPOSTransactionCard.GetFieldNameFor_Charge: string;
begin
  Result := GetFieldPrefix + 'Charge';
end;

function TPOSTransactionCard.GetFieldNameFor_DATE_CREATE: string;
begin
  Result := 'DATE_CREATE';
end;

function TPOSTransactionCard.GetFieldNameFor_DATE_MODIFY: string;
begin
  Result := 'DATE_MODIFY';
end;

function TPOSTransactionCard.GetFieldNameFor_ID: string;
begin
//  Result := GetFieldPrefix + 'ID';
  Result := 'TRANSAKSI_CARD_ID';
end;

function TPOSTransactionCard.GetFieldNameFor_IsActive: string;
begin
  Result := GetFieldPrefix + 'Is_Active';
end;

function TPOSTransactionCard.GetFieldNameFor_NewUnit: string;
begin
//  Result := GetFieldPrefix + 'UNT_ID';
  Result := 'AUT$UNIT_ID';
end;

function TPOSTransactionCard.GetFieldNameFor_Nilai: string;
begin
  Result := GetFieldPrefix + 'Nilai';
end;

function TPOSTransactionCard.GetFieldNameFor_Nomor: string;
begin
  Result := GetFieldPrefix + 'Nomor';
end;

function TPOSTransactionCard.GetFieldNameFor_NoOtorisasi: string;
begin
  Result := GetFieldPrefix + 'No_Otorisasi';
end;

//function TPOSTransactionCard.GetFieldNameFor_OPC_UNIT: string;
//begin
//  Result := 'OPC_UNIT';
//end;

//function TPOSTransactionCard.GetFieldNameFor_OPM_UNIT: string;
//begin
//  Result := 'OPM_UNIT';
//end;

function TPOSTransactionCard.GetFieldNameFor_OP_CREATE: string;
begin
  Result := 'OP_CREATE';
end;

function TPOSTransactionCard.GetFieldNameFor_OP_MODIFY: string;
begin
  Result := 'OP_MODIFY';
end;

function TPOSTransactionCard.GetFieldNameFor_TransNo: string;
begin
  Result := GetFieldPrefix + 'Trans_No';
end;

//function TPOSTransactionCard.GetFieldNameFor_TransUnit: string;
//begin
//  Result := GetFieldPrefix + 'Trans_unt_id';
//end;

function TPOSTransactionCard.GetFieldPrefix: string;
begin
  Result := 'transc_';
end;

function TPOSTransactionCard.GetGeneratorName: string;
begin
  Result := 'GEN_' + CustomTableName + '_ID';
end;

function TPOSTransactionCard.GetHeaderFlag: Integer;
begin
  result := 5658;
end;

function TPOSTransactionCard.GetNewUnit: TUnit;
begin
  if FNewUnit = nil then
  begin
    FNewUnit := TUnit.Create(Self);
    FNewUnit.LoadByID(FNewUnitID);
  end;
  Result := FNewUnit;
end;

//function TPOSTransactionCard.GetOPC_UNIT: TUnit;
//begin
//  //Result := nil;
//  if FOPC_UNIT = nil then
//  begin
//    FOPC_UNIT := TUnit.Create(Self);
//    FOPC_UNIT.LoadByID(FOPC_UNITID);
//  end;
//  Result := FOPC_UNIT;
//end;

//function TPOSTransactionCard.GetOPM_UNIT: TUnit;
//begin
//  //Result := nil;
//  if FOPM_UNIT = nil then
//  begin
//    FOPM_UNIT := TUnit.Create(Self);
//    FOPM_UNIT.LoadByID(FOPM_UNITID);
//  end;
//  Result := FOPM_UNIT;
//end;

function TPOSTransactionCard.GetPlannedID: string;
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

function TPOSTransactionCard.LoadByID(AID, AUnitID: string): Boolean;
var
  sSQL: string;
begin
  sSQL := 'select * from ' + CustomTableName
    + ' where ' + GetFieldNameFor_ID + ' = ' + QuotedStr(AID);
//    + ' and ' + GetFieldNameFor_NewUnit + ' = ' + QuotedStr(AUnitID);
  Result := FloadFromDB(sSQL);
end;

function TPOSTransactionCard.LoadByTransNo(ATransNo, AUnitID: String): Boolean;
var
  sSQL: string;
begin
  sSQL := 'select * from ' + CustomTableName
    + ' where ' + GetFieldNameFor_TransNo + ' = ' + QuotedStr(ATransNo);
//    + ' and ' + GetFieldNameFor_TransUnit + ' = ' + QuotedStr(AUnitID);
  Result := FloadFromDB(sSQL);
end;

function TPOSTransactionCard.RemoveFromDB: Boolean;
var
  sSQL: string;
begin
  Result := False;
  sSQL := 'delete from ' + CustomTableName
    + ' where ' + GetFieldNameFor_ID + ' = ' + QuotedStr(FID);
//    + ' and ' + GetFieldNameFor_NewUnit + ' = ' + QuotedStr(FNewUnitID);
  if cExecSQL(sSQL, dbtPOS, False) then
    Result := True;  //SimpanBlob(sSQL,GetHeaderFlag);
end;

function TPOSTransactionCard.SaveToDB: Boolean;
var
  ssSQL: TStrings;
begin
  Result := False;
  try
    ssSQL := GenerateSQL();
    ssSQL.SaveToFile(cGetAppPath + 'POS_TransactionCard.SQL');
    //try
      if cExecSQL(ssSQL) then
//        if SimpanBlob(ssSQL,GetHeaderFlag) then
          Result := True;
    //except
    //end;
  finally
    FreeAndNil(ssSQL);
  end;
end;

procedure TPOSTransactionCard.SetNewUnit(Value: TUnit);
begin
  FNewUnitID := Value.ID;
end;

//procedure TPOSTransactionCard.SetOPC_UNIT(Value: TUnit);
//begin
//  FOPC_UNITID := Value.ID;
//end;

//procedure TPOSTransactionCard.SetOPM_UNIT(Value: TUnit);
//begin
//  FOPM_UNITID := Value.ID;
//end;

procedure TPOSTransactionCard.UpdateData(ACardID: string; ACashbackCharge,
    ACashbackNilai, ACharge: Double; AID: string; AIsActive: Boolean;
    ANewUnit_ID: string; ANilai: Double; ANomor, ANoOtorisasi, ATransNo:
    string);
begin
  FCardID := ACardID;
  FCashbackCharge := ACashbackCharge;
  FCashbackNilai := ACashbackNilai;
  FCharge := ACharge;
  FID := AID;
  FIsActive := AIsActive;
  FNewUnitID := ANewUnit_ID;
  FNilai := ANilai;
  FNomor := Trim(ANomor);
  FNoOtorisasi := Trim(ANoOtorisasi);
  FTransNo := Trim(ATransNo);

  State := csCreated;
end;


end.
