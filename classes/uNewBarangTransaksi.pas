unit uNewBarangTransaksi;

interface

uses
  SysUtils, Classes, uNewUnit, uTSBaseClass;

type
  TBarangTransaksi = class(TSBaseClass)
  private
    FAssgrosAlloc: Double;
    FAssgrosStock: Double;
    FCOGS: Double;
    FCommonAlloc: Double;
    FCommonStock: Double;
    FDATE_CREATE: TDateTime;
    FDATE_MODIFY: TDateTime;
    FKode: string;
    FLastCost: Double;
    //FNewUnit: TUnit;
    FNewUnitID: Integer;
    //FOPC_UNIT: TUnit;
    FOPC_UNITID: Integer;
    //FOPM_UNIT: TUnit;
    FOPM_UNITID: Integer;
    FOP_CREATE: Integer;
    FOP_MODIFY: Integer;
    FSalesPerDay: Double;
    FStock: Double;
    FStockDisplay: Double;
    FStockInOrder: Double;
    FStockMax: Double;
    FStockMaxDisplay: Double;
    FStockMin: Double;
    FStockMinDisplay: Double;
    FTraderAlloc: Double;
    FTraderStock: Double;
    function FLoadFromDB( aSQL : String ): Boolean;
    function GetOPC_UNIT: TUnit;
    function GetOPM_UNIT: TUnit;
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
    function GetFieldNameFor_AssgrosAlloc: string; dynamic;
    function GetFieldNameFor_AssgrosStock: string; dynamic;
    function GetFieldNameFor_COGS: string; dynamic;
    function GetFieldNameFor_CommonAlloc: string; dynamic;
    function GetFieldNameFor_CommonStock: string; dynamic;
    function GetFieldNameFor_DATE_CREATE: string; dynamic;
    function GetFieldNameFor_DATE_MODIFY: string; dynamic;
    function GetFieldNameFor_Kode: string; dynamic;
    function GetFieldNameFor_LastCost: string; dynamic;
    function GetFieldNameFor_NewUnit: string; dynamic;
    function GetFieldNameFor_OPC_UNIT: string; dynamic;
    function GetFieldNameFor_OPM_UNIT: string; dynamic;
    function GetFieldNameFor_OP_CREATE: string; dynamic;
    function GetFieldNameFor_OP_MODIFY: string; dynamic;
    function GetFieldNameFor_SalesPerDay: string; dynamic;
    function GetFieldNameFor_Stock: string; dynamic;
    function GetFieldNameFor_StockDisplay: string; dynamic;
    function GetFieldNameFor_StockInOrder: string; dynamic;
    function GetFieldNameFor_StockMax: string; dynamic;
    function GetFieldNameFor_StockMaxDisplay: string; dynamic;
    function GetFieldNameFor_StockMin: string; dynamic;
    function GetFieldNameFor_StockMinDisplay: string; dynamic;
    function GetFieldNameFor_TraderAlloc: string; dynamic;
    function GetFieldNameFor_TraderStock: string; dynamic;
    function GetFieldPrefix: string;
    function GetGeneratorName: string; dynamic;
    function GetHeaderFlag: Integer;
    function GetPlannedID: Integer;
    function LoadByID(AID: Integer): Boolean;
    function LoadByKode(AKode: string): Boolean;
    function RemoveFromDB: Boolean;
    function SaveToDB: Boolean;
    procedure UpdateData(AAssgrosAlloc: Double; AAssgrosStock: Double; ACOGS:
            Double; ACommonAlloc: Double; ACommonStock: Double; AKode: string;
            ALastCost: Double; ANewUnit_ID: Integer; ASalesPerDay: Double;
            AStock: Double; AStockDisplay: Double; AStockInOrder: Double;
            AStockMax: Double; AStockMaxDisplay: Double; AStockMin: Double;
            AStockMinDisplay: Double; ATraderAlloc: Double; ATraderStock:
            Double);
    property AssgrosAlloc: Double read FAssgrosAlloc write FAssgrosAlloc;
    property AssgrosStock: Double read FAssgrosStock write FAssgrosStock;
    property COGS: Double read FCOGS write FCOGS;
    property CommonAlloc: Double read FCommonAlloc write FCommonAlloc;
    property CommonStock: Double read FCommonStock write FCommonStock;
    property DATE_CREATE: TDateTime read FDATE_CREATE write FDATE_CREATE;
    property DATE_MODIFY: TDateTime read FDATE_MODIFY write FDATE_MODIFY;
    property Kode: string read FKode write FKode;
    property LastCost: Double read FLastCost write FLastCost;
    property OPC_UNIT: TUnit read GetOPC_UNIT write SetOPC_UNIT;
    property OPM_UNIT: TUnit read GetOPM_UNIT write SetOPM_UNIT;
    property OP_CREATE: Integer read FOP_CREATE write FOP_CREATE;
    property OP_MODIFY: Integer read FOP_MODIFY write FOP_MODIFY;
    property SalesPerDay: Double read FSalesPerDay write FSalesPerDay;
    property Stock: Double read FStock write FStock;
    property StockDisplay: Double read FStockDisplay write FStockDisplay;
    property StockInOrder: Double read FStockInOrder write FStockInOrder;
    property StockMax: Double read FStockMax write FStockMax;
    property StockMaxDisplay: Double read FStockMaxDisplay write
            FStockMaxDisplay;
    property StockMin: Double read FStockMin write FStockMin;
    property StockMinDisplay: Double read FStockMinDisplay write
            FStockMinDisplay;
    property TraderAlloc: Double read FTraderAlloc write FTraderAlloc;
    property TraderStock: Double read FTraderStock write FTraderStock;
  end;
  

implementation

uses FireDAC.Comp.Client, FireDAC.Stan.Error, udmMain, uAppUtils;

{
******************************* TBarangTransaksi *******************************
}
constructor TBarangTransaksi.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
end;

constructor TBarangTransaksi.CreateWithUser(AOwner : TComponent; AUserID:
    Integer; AUnitID: Integer);
begin
  Create(AOwner);
  OP_MODIFY := AUserID;
  FOPM_UNITID := AUnitID;
end;

destructor TBarangTransaksi.Destroy;
begin
  ClearProperties;
  inherited Destroy;
end;

procedure TBarangTransaksi.ClearProperties;
begin
  TraderStock := 0;
  TraderAlloc := 0;
  StockMinDisplay := 0;
  StockMin := 0;
  StockMaxDisplay := 0;
  StockMax := 0;
  StockInOrder := 0;
  StockDisplay := 0;
  Stock := 0;
  SalesPerDay := 0;
  LastCost := 0;
  Kode := '';
  CommonStock := 0;
  CommonAlloc := 0;
  COGS := 0;
  AssgrosStock := 0;
  AssgrosAlloc := 0;
end;

function TBarangTransaksi.CustomSQLTask: Tstrings;
begin
  result := nil;
end;

function TBarangTransaksi.CustomSQLTaskPrior: Tstrings;
begin
  result := nil;
end;

function TBarangTransaksi.CustomTableName: string;
begin
  Result := 'barang_transaksi';
end;

function TBarangTransaksi.FLoadFromDB( aSQL : String ): Boolean;
begin
  Result := False;
  State := csNone;
  ClearProperties;
  with cOpenQuery(aSQL) do 
  begin 
    try
      if not EOF then 
      begin 
        FAssgrosAlloc := FieldByName(GetFieldNameFor_AssgrosAlloc).AsFloat;
        FAssgrosStock := FieldByName(GetFieldNameFor_AssgrosStock).AsFloat;
        FCOGS := FieldByName(GetFieldNameFor_COGS).AsFloat;
        FCommonAlloc := FieldByName(GetFieldNameFor_CommonAlloc).AsFloat;
        FCommonStock := FieldByName(GetFieldNameFor_CommonStock).AsFloat;
        FDATE_CREATE := FieldByName(GetFieldNameFor_DATE_CREATE).AsDateTime;
        FDATE_MODIFY := FieldByName(GetFieldNameFor_DATE_MODIFY).AsDateTime;
        FKode := FieldByName(GetFieldNameFor_Kode).AsString;
        FLastCost := FieldByName(GetFieldNameFor_LastCost).AsFloat;
        FNewUnitID := FieldByName(GetFieldNameFor_NewUnit).AsInteger;
        FOPC_UNITID := FieldByName(GetFieldNameFor_OPC_UNIT).AsInteger;
        FOPM_UNITID := FieldByName(GetFieldNameFor_OPM_UNIT).AsInteger;
        FOP_CREATE := FieldByName(GetFieldNameFor_OP_CREATE).AsInteger;
        FOP_MODIFY := FieldByName(GetFieldNameFor_OP_MODIFY).AsInteger;
        FSalesPerDay := FieldByName(GetFieldNameFor_SalesPerDay).AsFloat;
        FStock := FieldByName(GetFieldNameFor_Stock).AsFloat;
        FStockDisplay := FieldByName(GetFieldNameFor_StockDisplay).AsFloat;
        FStockInOrder := FieldByName(GetFieldNameFor_StockInOrder).AsFloat;
        FStockMax := FieldByName(GetFieldNameFor_StockMax).AsFloat;
        FStockMaxDisplay := FieldByName(GetFieldNameFor_StockMaxDisplay).AsFloat;
        FStockMin := FieldByName(GetFieldNameFor_StockMin).AsFloat;
        FStockMinDisplay := FieldByName(GetFieldNameFor_StockMinDisplay).AsFloat;
        FTraderAlloc := FieldByName(GetFieldNameFor_TraderAlloc).AsFloat;
        FTraderStock := FieldByName(GetFieldNameFor_TraderStock).AsFloat;
        Self.State := csLoaded; 
        Result := True;
      end;
    finally
      Free;
    end;
  End;
end;

function TBarangTransaksi.GenerateInterbaseMetaData: TStrings;
begin
  Result := TStringList.Create;
  Result.Append( '' );
  Result.Append( 'Create Table ''+ CustomTableName +'' ( ' );
  Result.Append( 'TRMSBaseClass_ID Integer not null, ' );
  Result.Append( 'AssgrosAlloc   double precision Not Null , ' );
  Result.Append( 'AssgrosStock   double precision Not Null , ' );
  Result.Append( 'COGS   double precision Not Null , ' );
  Result.Append( 'CommonAlloc   double precision Not Null , ' );
  Result.Append( 'CommonStock   double precision Not Null , ' );
  Result.Append( 'DATE_CREATE   Date Not Null , ' );
  Result.Append( 'DATE_MODIFY   Date Not Null , ' );
  Result.Append( 'Kode   Varchar(30) Not Null  Unique, ' );
  Result.Append( 'LastCost   double precision Not Null , ' );
  Result.Append( 'NewUnit_ID Integer Not Null, ' );
  Result.Append( 'OPC_UNIT_ID Integer Not Null, ' );
  Result.Append( 'OPM_UNIT_ID Integer Not Null, ' );
  Result.Append( 'OP_CREATE   Integer Not Null , ' );
  Result.Append( 'OP_MODIFY   Integer Not Null , ' );
  Result.Append( 'SalesPerDay   double precision Not Null , ' );
  Result.Append( 'Stock   double precision Not Null , ' );
  Result.Append( 'StockDisplay   double precision Not Null , ' );
  Result.Append( 'StockInOrder   double precision Not Null , ' );
  Result.Append( 'StockMax   double precision Not Null , ' );
  Result.Append( 'StockMaxDisplay   double precision Not Null , ' );
  Result.Append( 'StockMin   double precision Not Null , ' );
  Result.Append( 'StockMinDisplay   double precision Not Null , ' );
  Result.Append( 'TraderAlloc   double precision Not Null , ' );
  Result.Append( 'TraderStock   double precision Not Null , ' );
  Result.Append( 'Stamp TimeStamp ' );
  Result.Append( ' ); ' );
end;

function TBarangTransaksi.GenerateSQL(ARepeatCount: Integer = 1): TStrings;
var
//  lDecimalSeparator: Char;
  sSQL: string;
  //i: Integer;
  ssSQL: TStrings;
begin
  Result := TStringList.Create;
  if State = csNone then
  begin
    raise Exception.create('Tidak bisa generate dalam Mode csNone')
  end;

//  lDecimalSeparator := DecimalSeparator;
//  DecimalSeparator := '.';

  ssSQL := CustomSQLTaskPrior;
  if ssSQL <> nil then
  begin
    Result.AddStrings(ssSQL);
  end;
  ssSQL := nil;

  DATE_MODIFY := cGetServerDateTime;
  FOPM_UNITID := FNewUnitID;
  If Kode = '' then
  begin 
    //Generate Insert SQL 
    OP_CREATE := OP_MODIFY;
    DATE_CREATE := DATE_MODIFY;
    FOPC_UNITID := FOPM_UNITID;
    //FID := cGetNextID(GetGeneratorName);
    sSQL := 'insert into ' + CustomTableName + ' ('
      + GetFieldNameFor_AssgrosAlloc + ', '
      + GetFieldNameFor_AssgrosStock + ', '
      + GetFieldNameFor_COGS + ', '
      + GetFieldNameFor_CommonAlloc + ', '
      + GetFieldNameFor_CommonStock + ', '
      + GetFieldNameFor_DATE_CREATE + ', '
      + GetFieldNameFor_DATE_MODIFY + ', '
      + GetFieldNameFor_Kode + ', '
      + GetFieldNameFor_LastCost + ', '
      + GetFieldNameFor_NewUnit + ', '
      + GetFieldNameFor_OPC_UNIT + ', '
      + GetFieldNameFor_OPM_UNIT + ', '
      + GetFieldNameFor_OP_CREATE + ', '
      + GetFieldNameFor_OP_MODIFY + ', '
      + GetFieldNameFor_SalesPerDay + ', '
      + GetFieldNameFor_Stock + ', '
      + GetFieldNameFor_StockDisplay + ', '
      + GetFieldNameFor_StockInOrder + ', '
      + GetFieldNameFor_StockMax + ', '
      + GetFieldNameFor_StockMaxDisplay + ', '
      + GetFieldNameFor_StockMin + ', '
      + GetFieldNameFor_StockMinDisplay + ', '
      + GetFieldNameFor_TraderAlloc + ', '
      + GetFieldNameFor_TraderStock +') values ('
      + FormatFloat('0.00', FAssgrosAlloc) + ', ' 
      + FormatFloat('0.00', FAssgrosStock) + ', ' 
      + FormatFloat('0.00', FCOGS) + ', ' 
      + FormatFloat('0.00', FCommonAlloc) + ', ' 
      + FormatFloat('0.00', FCommonStock) + ', ' 
      + TAppUtils.QuotDT(FDATE_CREATE) + ', '
      + TAppUtils.QuotDT(FDATE_MODIFY) + ', '
      + QuotedStr(FKode) + ', '
      + FormatFloat('0.00', FLastCost) + ', ' 
      + InttoStr(FNewUnitID) + ', '
      + InttoStr(FOPC_UNITID) + ', '
      + InttoStr(FOPM_UNITID) + ', '
      + IntToStr(FOP_CREATE) + ', '
      + IntToStr(FOP_MODIFY) + ', '
      + FormatFloat('0.00', FSalesPerDay) + ', ' 
      + FormatFloat('0.00', FStock) + ', ' 
      + FormatFloat('0.00', FStockDisplay) + ', ' 
      + FormatFloat('0.00', FStockInOrder) + ', ' 
      + FormatFloat('0.00', FStockMax) + ', ' 
      + FormatFloat('0.00', FStockMaxDisplay) + ', ' 
      + FormatFloat('0.00', FStockMin) + ', ' 
      + FormatFloat('0.00', FStockMinDisplay) + ', ' 
      + FormatFloat('0.00', FTraderAlloc) + ', ' 
      + FormatFloat('0.00', FTraderStock) + ');';
  end 
  else 
  begin 
    //generate Update SQL 
    sSQL := 'update ' + CustomTableName + ' set '
      + GetFieldNameFor_AssgrosAlloc + ' = ' + FormatFloat('0.00', FAssgrosAlloc) 
      + ', ' + GetFieldNameFor_AssgrosStock + ' = ' + FormatFloat('0.00', FAssgrosStock) 
      + ', ' + GetFieldNameFor_COGS + ' = ' + FormatFloat('0.00', FCOGS) 
      + ', ' + GetFieldNameFor_CommonAlloc + ' = ' + FormatFloat('0.00', FCommonAlloc) 
      + ', ' + GetFieldNameFor_CommonStock + ' = ' + FormatFloat('0.00', FCommonStock) 
      + ', ' + GetFieldNameFor_DATE_MODIFY + ' = ' + TAppUtils.QuotDT(FDATE_MODIFY)
      + ', ' + GetFieldNameFor_Kode + ' = ' + QuotedStr(FKode)
      + ', ' + GetFieldNameFor_LastCost + ' = ' + FormatFloat('0.00', FLastCost) 
      + ', ' + GetFieldNameFor_NewUnit + ' = ' + IntToStr(FNewUnitID) 
      + ', ' + GetFieldNameFor_OPM_UNIT + ' = ' + IntToStr(FOPM_UNITID) 
      + ', ' + GetFieldNameFor_OP_MODIFY + ' = ' + IntToStr(FOP_MODIFY) 
      + ', ' + GetFieldNameFor_SalesPerDay + ' = ' + FormatFloat('0.00', FSalesPerDay) 
      + ', ' + GetFieldNameFor_Stock + ' = ' + FormatFloat('0.00', FStock) 
      + ', ' + GetFieldNameFor_StockDisplay + ' = ' + FormatFloat('0.00', FStockDisplay) 
      + ', ' + GetFieldNameFor_StockInOrder + ' = ' + FormatFloat('0.00', FStockInOrder) 
      + ', ' + GetFieldNameFor_StockMax + ' = ' + FormatFloat('0.00', FStockMax) 
      + ', ' + GetFieldNameFor_StockMaxDisplay + ' = ' + FormatFloat('0.00', FStockMaxDisplay) 
      + ', ' + GetFieldNameFor_StockMin + ' = ' + FormatFloat('0.00', FStockMin) 
      + ', ' + GetFieldNameFor_StockMinDisplay + ' = ' + FormatFloat('0.00', FStockMinDisplay) 
      + ', ' + GetFieldNameFor_TraderAlloc + ' = ' + FormatFloat('0.00', FTraderAlloc) 
      + ', ' + GetFieldNameFor_TraderStock + ' = ' + FormatFloat('0.00', FTraderStock)
      + ' where ' + GetFieldNameFor_Kode + ' = ' + QuotedStr(Kode)
      + ' and ' + GetFieldNameFor_NewUnit + ' = ' + IntToStr(FNewUnitID) + ';';
  end;
  Result.Append(sSQL);
  //generating Collections SQL
  
  ssSQL := CustomSQLTask; 
  if ssSQL <> nil then 
  begin 
    Result.AddStrings(ssSQL);
  end; 

//  DecimalSeparator := lDecimalSeparator;
  FreeAndNil(ssSQL)
end;

function TBarangTransaksi.GetFieldNameFor_AssgrosAlloc: string;
begin
  Result := GetFieldPrefix + 'Assgros_Alloc';
end;

function TBarangTransaksi.GetFieldNameFor_AssgrosStock: string;
begin
  Result := GetFieldPrefix + 'Assgros_Stock';
end;

function TBarangTransaksi.GetFieldNameFor_COGS: string;
begin
  Result := GetFieldPrefix + 'COGS';
end;

function TBarangTransaksi.GetFieldNameFor_CommonAlloc: string;
begin
  Result := GetFieldPrefix + 'Common_Alloc';
end;

function TBarangTransaksi.GetFieldNameFor_CommonStock: string;
begin
  Result := GetFieldPrefix + 'Common_Stock';
end;

function TBarangTransaksi.GetFieldNameFor_DATE_CREATE: string;
begin
  Result := 'DATE_CREATE';
end;

function TBarangTransaksi.GetFieldNameFor_DATE_MODIFY: string;
begin
  Result := 'DATE_MODIFY';
end;

function TBarangTransaksi.GetFieldNameFor_Kode: string;
begin
  Result := GetFieldPrefix + 'brg_code';
end;

function TBarangTransaksi.GetFieldNameFor_LastCost: string;
begin
  Result := GetFieldPrefix + 'Last_Cost';
end;

function TBarangTransaksi.GetFieldNameFor_NewUnit: string;
begin
  Result := GetFieldPrefix + 'BRG_UNT_ID';
end;

function TBarangTransaksi.GetFieldNameFor_OPC_UNIT: string;
begin
  Result := 'OPC_UNIT';
end;

function TBarangTransaksi.GetFieldNameFor_OPM_UNIT: string;
begin
  Result := 'OPM_UNIT';
end;

function TBarangTransaksi.GetFieldNameFor_OP_CREATE: string;
begin
  Result := 'OP_CREATE';
end;

function TBarangTransaksi.GetFieldNameFor_OP_MODIFY: string;
begin
  Result := 'OP_MODIFY';
end;

function TBarangTransaksi.GetFieldNameFor_SalesPerDay: string;
begin
  Result := GetFieldPrefix + 'Sales_Per_Day';
end;

function TBarangTransaksi.GetFieldNameFor_Stock: string;
begin
  Result := GetFieldPrefix + 'Stock';
end;

function TBarangTransaksi.GetFieldNameFor_StockDisplay: string;
begin
  Result := GetFieldPrefix + 'Stock_Disp';
end;

function TBarangTransaksi.GetFieldNameFor_StockInOrder: string;
begin
  Result := GetFieldPrefix + 'Stock_In_Order';
end;

function TBarangTransaksi.GetFieldNameFor_StockMax: string;
begin
  Result := GetFieldPrefix + 'Stock_Max';
end;

function TBarangTransaksi.GetFieldNameFor_StockMaxDisplay: string;
begin
  Result := GetFieldPrefix + 'Stock_Max_Disp';
end;

function TBarangTransaksi.GetFieldNameFor_StockMin: string;
begin
  Result := GetFieldPrefix + 'Stock_Min';
end;

function TBarangTransaksi.GetFieldNameFor_StockMinDisplay: string;
begin
  Result := GetFieldPrefix + 'Stock_Min_Disp';
end;

function TBarangTransaksi.GetFieldNameFor_TraderAlloc: string;
begin
  Result := GetFieldPrefix + 'Trader_Alloc';
end;

function TBarangTransaksi.GetFieldNameFor_TraderStock: string;
begin
  Result := GetFieldPrefix + 'Trader_Stock';
end;

function TBarangTransaksi.GetFieldPrefix: string;
begin
  Result := 'brgt_';
end;

function TBarangTransaksi.GetGeneratorName: string;
begin
  Result := 'GEN_' + CustomTableName + '_ID';
end;

function TBarangTransaksi.GetHeaderFlag: Integer;
begin
  result := 5416;
end;

function TBarangTransaksi.GetOPC_UNIT: TUnit;
begin
  Result := OPC_UNIT;
end;

function TBarangTransaksi.GetOPM_UNIT: TUnit;
begin
  Result := OPM_UNIT;
end;

function TBarangTransaksi.GetPlannedID: Integer;
begin
  result := -1;
  if State = csNone then
  begin
     Raise exception.create('Tidak bisa GetPlannedID di Mode csNone');
     exit;
  end
  else if state = csCreated then
  begin
     //result := cGetNextID(GetGeneratorName);
  end
  else if State = csLoaded then
  begin
     result := -1;
  end;
end;

function TBarangTransaksi.LoadByID(AID: Integer): Boolean;
//var
//  sSQL: string;
begin
  Result := False;
end;

function TBarangTransaksi.LoadByKode(AKode: string): Boolean;
var
  sSQL: string;
begin
  sSQL := 'select * from ' + CustomTableName
    + ' where ' + GetFieldNameFor_Kode + ' = ' + QuotedStr(AKode);
  Result := FloadFromDB(sSQL);
end;

function TBarangTransaksi.RemoveFromDB: Boolean;
var
  sSQL: string;
begin
  Result := False;
  sSQL := 'delete from ' + CustomTableName 
    + ' where ' + GetFieldNameFor_Kode + ' = ' + QuotedStr(Kode)
    + ' and ' + GetFieldNameFor_NewUnit + ' = ' + IntToStr(FNewUnitID);
  if cExecSQL(sSQL, dbtPOS, False) then
    Result := True; //SimpanBlob(sSQL,GetHeaderFlag);
end;

function TBarangTransaksi.SaveToDB: Boolean;
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

procedure TBarangTransaksi.SetOPC_UNIT(Value: TUnit);
begin
end;

procedure TBarangTransaksi.SetOPM_UNIT(Value: TUnit);
begin
end;

procedure TBarangTransaksi.UpdateData(AAssgrosAlloc: Double; AAssgrosStock:
        Double; ACOGS: Double; ACommonAlloc: Double; ACommonStock: Double;
        AKode: string; ALastCost: Double; ANewUnit_ID: Integer; ASalesPerDay:
        Double; AStock: Double; AStockDisplay: Double; AStockInOrder: Double;
        AStockMax: Double; AStockMaxDisplay: Double; AStockMin: Double;
        AStockMinDisplay: Double; ATraderAlloc: Double; ATraderStock: Double);
begin
  FAssgrosAlloc :=  AAssgrosAlloc;
  FAssgrosStock :=  AAssgrosStock;
  FCOGS :=  ACOGS;
  FCommonAlloc :=  ACommonAlloc;
  FCommonStock :=  ACommonStock;
  FKode := Trim(AKode);
  FLastCost :=  ALastCost;
  FNewUnitID := ANewUnit_ID;
  FSalesPerDay :=  ASalesPerDay;
  FStock :=  AStock;
  FStockDisplay :=  AStockDisplay;
  FStockInOrder :=  AStockInOrder;
  FStockMax :=  AStockMax;
  FStockMaxDisplay :=  AStockMaxDisplay;
  FStockMin :=  AStockMin;
  FStockMinDisplay :=  AStockMinDisplay;
  FTraderAlloc :=  ATraderAlloc;
  FTraderStock :=  ATraderStock;
  
  State := csCreated;
end;



end.
