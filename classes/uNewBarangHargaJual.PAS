unit uNewBarangHargaJual;

interface

uses
  SysUtils, Classes, uTSBaseClass, uNewUnit, uNewBarang, uNewUOM;

type
  TBarangHargaJual = class(TSBaseClass)
  private
    FAlokasiDanaSupplierID: Integer;
    FDATE_CREATE: TDateTime;
    FDATE_MODIFY: TDateTime;
    FDiscNominal: Double;
    FDiscPersen: Double;
    FID: Integer;
    FIsLimitQty: Integer;
    FIsMailer: Integer;
    FIsQtySubsidy: Integer;
    FKonversiValue: Double;
    FLimitQty: Integer;
    FLimitQtyPrice: Double;
    FMarkUp: Double;
    FMaxQtyDisc: Double;
    FNewBarang: TNewBarang;
    FNewUnit: TUnit;
    FNewUOM: TNewUOM;
    FOPC_UNIT: TUnit;
    FOPC_UNITID: Integer;
    FOPM_UNIT: TUnit;
    FOPM_UNITID: Integer;
    FQtySubsidy: Integer;
    FQtySubsidyPrice: Double;
    FRemark: string;
    FSellPrice: Double;
    FSellPriceCoret: Double;
    FSellPriceDisc: Double;
    FTipeHargaID: Integer;
    FUnitID: Integer;
    function ExecuteGenerateSQLPerLine: Boolean;
    function FLoadFromDB( aSQL : String ): Boolean;
    function GetOPC_UNIT: TUnit;
    function GetOPM_UNIT: TUnit;
  public
    constructor Create(aOwner : TComponent); override;
    destructor Destroy; override;
    procedure ClearProperties;
    function ExecuteCustomSQLTask: Boolean;
    function ExecuteCustomSQLTaskPrior: Boolean;
    function CustomTableName: string;
    function GenerateInterbaseMetaData: Tstrings;
    function ExecuteGenerateSQL: Boolean;
    function LoadBarangHargaJualTermurah(AKode: String; ATipeHargaID: Integer;
        AUnitID: Integer): Boolean;
    function GetFieldNameFor_AlokasiDanaSupplierID: string; dynamic;
    function GetFieldNameFor_DATE_CREATE: string;
    function GetFieldNameFor_DATE_MODIFY: string;
    function GetFieldNameFor_DiscNominal: string; dynamic;
    function GetFieldNameFor_DiscPersen: string; dynamic;
    function GetFieldNameFor_ID: string; dynamic;
    function GetFieldNameFor_IsLimitQty: string; dynamic;
    function GetFieldNameFor_IsMailer: string;
    function GetFieldNameFor_IsQtySubsidy: string; dynamic;
    function GetFieldNameFor_KonversiValue: string; dynamic;
    function GetFieldNameFor_LimitQty: string; dynamic;
    function GetFieldNameFor_LimitQtyPrice: string; dynamic;
    function GetFieldNameFor_MarkUp: string; dynamic;
    function GetFieldNameFor_MaxQtyDisc: string;
    function GetFieldNameFor_NewBarang: string; dynamic;
    function GetFieldNameFor_NewUnit: string; dynamic;
    function GetFieldNameFor_NewUOM: string; dynamic;
    function GetFieldNameFor_OPC_UNIT: string;
    function GetFieldNameFor_OPM_UNIT: string;
    function GetFieldNameFor_QtySubsidy: string; dynamic;
    function GetFieldNameFor_QtySubsidyPrice: string; dynamic;
    function GetFieldNameFor_Remark: string; dynamic;
    function GetFieldNameFor_SellPrice: string; dynamic;
    function GetFieldNameFor_SellPriceCoret: string; dynamic;
    function GetFieldNameFor_SellPriceDisc: string; dynamic;
    function GetFieldNameFor_TipeHargaID: string; dynamic;
    function GetFieldNameFor_TipeHargaUnit: string; dynamic;
    function GetGeneratorName: string;
    function SetHargaAverage(aKode : String; aUnitID : Integer; aUOMCode : String;
        Var aConValue : Double; Var aHargaAvg : Double): Double;
    function GetHeaderFlag: Integer;
    function GetStorePrice(aKode : String; aUnitID : Integer; aTipeHrgID : Integer;
        aTipeHrgUnitID : Integer): Double;
    function IsSettingHargaJualSudahAda(aUnitID: integer; aKodeBrg : String;
        aSatuanCOde : String; aTiPehargID : Integer; aExcluedID : Integer): Boolean;
    function LoadBarangBarcodeUom(ABarcode: String; ATipeHargaID: Integer): Boolean;
    function CountBarangHargaJual(AKode: String; ATipeHargaID: Integer; AUnitID:
        Integer): Integer;
    function ExecuteGenerateSQLByUnit: Boolean;
    function GetTipeHargaName: string;
    function LoadBarangHargaJualTermurahUOM(AKode: String; ATipeHargaID: Integer;
        AUnitID: Integer; aUoM:String): Boolean;
    function LoadByBarangKode(aBarangCode : String): Boolean; overload;
    function LoadByBarangKode(aBarangCode : String; aBarangUnitID : Integer;
        aSatCode : String; aSatUnitID : Integer): Boolean; overload;
    function LoadByBarangKodeTipeHarga(aBarangCode : String; aSatCode : String;
        aTipeHrg : Integer): Boolean;
    function LoadByID(aID : Integer): Boolean; overload;
    function LoadByID(aID : Integer; aUnitId: integer): Boolean; overload;
    function RemoveFromDB: Boolean;
    procedure UpdateData(aAlokasiDanaSupplierID : Integer; aDiscNominal : Double;
        aDiscPersen : Double; aID : Integer; aIsLimitQty : Integer; aIsQtySubsidy :
        Integer; aKonversiValue : Double; aLimitQty : Integer; aLimitQtyPrice :
        Double; aMarkUp : Double; aNewBarangKode : string; aNewUnit_ID : Integer;
        aUOM : string; aQtySubsidy : Integer; aQtySubsidyPrice : Double; aRemark :
        string; aSellPrice : Double; aSellPriceCoret : Double; aSellPriceDisc :
        Double; aTipeHargaID : Integer; aIsMailer : Integer; aMaxQtyDisc : Double);
    property AlokasiDanaSupplierID: Integer read FAlokasiDanaSupplierID write
            FAlokasiDanaSupplierID;
    property DATE_CREATE: TDateTime read FDATE_CREATE write FDATE_CREATE;
    property DATE_MODIFY: TDateTime read FDATE_MODIFY write FDATE_MODIFY;
    property DiscNominal: Double read FDiscNominal write FDiscNominal;
    property DiscPersen: Double read FDiscPersen write FDiscPersen;
    property ID: Integer read FID write FID;
    property IsLimitQty: Integer read FIsLimitQty write FIsLimitQty;
    property IsMailer: Integer read FIsMailer write FIsMailer;
    property IsQtySubsidy: Integer read FIsQtySubsidy write FIsQtySubsidy;
    property KonversiValue: Double read FKonversiValue write FKonversiValue;
    property LimitQty: Integer read FLimitQty write FLimitQty;
    property LimitQtyPrice: Double read FLimitQtyPrice write FLimitQtyPrice;
    property MarkUp: Double read FMarkUp write FMarkUp;
    property MaxQtyDisc: Double read FMaxQtyDisc write FMaxQtyDisc;
    property NewBarang: TNewBarang read FNewBarang write FNewBarang;
    property NewUnit: TUnit read FNewUnit write FNewUnit;
    property NewUOM: TNewUOM read FNewUOM write FNewUOM;
    property OPC_UNIT: TUnit read GetOPC_UNIT write FOPC_UNIT;
    property OPM_UNIT: TUnit read GetOPM_UNIT write FOPM_UNIT;
    property QtySubsidy: Integer read FQtySubsidy write FQtySubsidy;
    property QtySubsidyPrice: Double read FQtySubsidyPrice write
            FQtySubsidyPrice;
    property Remark: string read FRemark write FRemark;
    property SellPrice: Double read FSellPrice write FSellPrice;
    property SellPriceCoret: Double read FSellPriceCoret write FSellPriceCoret;
    property SellPriceDisc: Double read FSellPriceDisc write FSellPriceDisc;
    property TipeHargaID: Integer read FTipeHargaID write FTipeHargaID;
    property UnitID: Integer read FUnitID write FUnitID;
  end;

function IsUOMSudahAdaKonversi(aBrgCode, aUOM: String): Boolean;

implementation

uses FireDAC.Comp.Client, FireDAC.Stan.Error, udmMain, uAppUtils, StrUtils;

function IsUOMSudahAdaKonversi(aBrgCode, aUOM: String): Boolean;
var
  sSQL: string;
begin
  Result := False;
  sSQL := 'select count(KONVSAT_ID)'
          + ' from REF$KONVERSI_SATUAN'
          + ' where KONVSAT_BRG_CODE  = ' + QuotedStr(aBrgCode)
//          + ' and KONVSAT_UNT_ID = KONVSAT_BRG_UNT_ID'
//          + ' and KONVSAT_SCF_UNT_ID = KONVSAT_UNT_ID'
//          + ' and KONVSAT_UNT_ID = ' + IntToStr(aUnitID)
          + ' and KONVSAT_SAT_CODE_FROM = ' + QuotedStr(aUOM);

  with cOpenQuery(sSQL) do
  begin
    try
      if not Fields[0].IsNull then
        if Fields[0].asInteger > 0 then
          Result := True;
    finally
      Free;
    end;
  end;

end;


{
******************************* TBarangHargaJual *******************************
}
constructor TBarangHargaJual.Create(aOwner : TComponent);
begin

  inherited create(aOwner);



          FNewBarang := TNewBarang.Create(Self);

          FNewUnit := TUnit.Create(Self);

          FNewUOM := TNewUOM.Create(Self);


end;

destructor TBarangHargaJual.Destroy;
begin

          FNewBarang.free;
          FNewUnit.free;
          FNewUOM.free;
   inherited Destroy;
end;

procedure TBarangHargaJual.ClearProperties;
begin
  FAlokasiDanaSupplierID :=  0;
  FDiscNominal :=  0;
  FDiscPersen :=  0;
  FID :=  0;
  FIsLimitQty :=  0;
  FIsQtySubsidy :=  0;
  FKonversiValue :=  0;
  FLimitQty :=  0;
  FLimitQtyPrice :=  0;
  FMarkUp :=  0;
  FUnitID := 0;
  FQtySubsidy :=  0;
  FQtySubsidyPrice :=  0;
  FRemark := '';
  FSellPrice :=  0;
  FSellPriceCoret :=  0;
  FSellPriceDisc :=  0;
  FTipeHargaID :=  0;
  FIsMailer := 0;
  FMaxQtyDisc := 0;

  FNewBarang.ClearProperties;
  FNewUnit.ClearProperties;
  FNewUOM.ClearProperties;
end;

function TBarangHargaJual.ExecuteCustomSQLTask: Boolean;
begin
  result := True;
end;

function TBarangHargaJual.ExecuteCustomSQLTaskPrior: Boolean;
begin
  result :=True;
end;

function TBarangHargaJual.CustomTableName: string;
begin
  Result := 'BARANG_HARGA_JUAL';
end;

function TBarangHargaJual.FLoadFromDB( aSQL : String ): Boolean;
begin
  result := false;
  State := csNone;

  ClearProperties;
  with cOpenQuery(aSQL) do
  Begin
      if not EOF then
      begin
         FAlokasiDanaSupplierID := FieldByName(GetFieldNameFor_AlokasiDanaSupplierID).asInteger;
         FDiscNominal := FieldByName(GetFieldNameFor_DiscNominal).asFloat;
         FDiscPersen := FieldByName(GetFieldNameFor_DiscPersen).asFloat;
         FID := FieldByName(GetFieldNameFor_ID).asInteger;
         FIsLimitQty := FieldByName(GetFieldNameFor_IsLimitQty).asInteger;
         FIsQtySubsidy := FieldByName(GetFieldNameFor_IsQtySubsidy).asInteger;
         FKonversiValue := FieldByName(GetFieldNameFor_KonversiValue).asFloat;
         FLimitQty := FieldByName(GetFieldNameFor_LimitQty).asInteger;
         FLimitQtyPrice := FieldByName(GetFieldNameFor_LimitQtyPrice).asFloat;
         FMarkUp := FieldByName(GetFieldNameFor_MarkUp).asFloat;

         FIsMailer := FieldByName(GetFieldNameFor_IsMailer).AsInteger;
         FMaxQtyDisc := FieldByName(GetFieldNameFor_MaxQtyDisc).asFloat;

         FNewUnit.LoadByID(FieldByName(GetFieldNameFor_NewUnit).asInteger);
         FNewBarang.LoadByKode(FieldByName(GetFieldNameFor_NewBarang).AsString);

         FNewUOM.LoadByUOM(FieldByName(GetFieldNameFor_NewUOM).AsString);
         FQtySubsidy := FieldByName(GetFieldNameFor_QtySubsidy).asInteger;
         FQtySubsidyPrice := FieldByName(GetFieldNameFor_QtySubsidyPrice).asFloat;
         FRemark := FieldByName(GetFieldNameFor_Remark).asString;
         FSellPrice := FieldByName(GetFieldNameFor_SellPrice).asFloat;
         FSellPriceCoret := FieldByName(GetFieldNameFor_SellPriceCoret).asFloat;
         FSellPriceDisc := FieldByName(GetFieldNameFor_SellPriceDisc).asFloat;
         FTipeHargaID := FieldByName(GetFieldNameFor_TipeHargaID).asInteger;

         Self.State := csLoaded;
         Result := True;
      end;
      Free;
  End;
end;

function TBarangHargaJual.GenerateInterbaseMetaData: Tstrings;
begin
  result := TstringList.create;
  result.Append( '' );
  result.Append( 'Create Table TBarangHargaJual ( ' );
  result.Append( 'TRMSBaseClass_ID Integer not null, ' );
  result.Append( 'AlokasiDanaSupplierID   Integer Not Null , ' );
  result.Append( 'AlokasiDanaSupplierUnit_ID Integer Not Null, ' );
  result.Append( 'BarangUnit_ID Integer Not Null, ' );
  result.Append( 'DiscNominal   double precision Not Null , ' );
  result.Append( 'DiscPersen   double precision Not Null , ' );
  result.Append( 'ID   Integer Not Null  Unique, ' );
  result.Append( 'IsLimitQty   Integer Not Null , ' );
  result.Append( 'IsQtySubsidy   Integer Not Null , ' );
  result.Append( 'KonversiValue   double precision Not Null , ' );
  result.Append( 'LimitQty   Integer Not Null , ' );
  result.Append( 'LimitQtyPrice   double precision Not Null , ' );
  result.Append( 'MarkUp   double precision Not Null , ' );
  result.Append( 'NewBarang_ID Integer Not Null, ' );
  result.Append( 'NewUnit_ID Integer Not Null, ' );
  result.Append( 'NewUOM_ID Integer Not Null, ' );
  result.Append( 'QtySubsidy   Integer Not Null , ' );
  result.Append( 'QtySubsidyPrice   double precision Not Null , ' );
  result.Append( 'Remark   Varchar(30) Not Null , ' );
  result.Append( 'SellPrice   double precision Not Null , ' );
  result.Append( 'SellPriceCoret   double precision Not Null , ' );
  result.Append( 'SellPriceDisc   double precision Not Null , ' );
  result.Append( 'TipeHargaID   Integer Not Null , ' );
  result.Append( 'TipeHargaUnit_ID Integer Not Null, ' );
  result.Append( 'UOMUnit_ID Integer Not Null, ' );
  result.Append( 'Stamp TimeStamp ' );
  result.Append( ' ); ' );
end;

function TBarangHargaJual.ExecuteGenerateSQL: Boolean;
var
  S: string;

begin
  result := False;


  try
    if State = csNone then
    Begin
       raise Exception.create('Tidak bisa generate dalam Mode csNone')
    end;

    if not ExecuteCustomSQLTaskPrior then
    begin
      cRollbackTrans;
      Exit
    end
    else
    begin

      DATE_MODIFY := cGetServerDateTime;
      FOPM_UNITID := FNewUnit.ID;

      if FID <= 0 then
      begin
          //Generate Insert SQL
        DATE_CREATE := DATE_MODIFY;
        FOPC_UNITID := FOPM_UNITID;

        FID := cGetNextID(GetFieldNameFor_ID, CustomTableName);
        S := 'Insert into ' + CustomTableName + ' ( '
        + GetFieldNameFor_DATE_CREATE + ', '
        + GetFieldNameFor_DATE_MODIFY + ', '
        + GetFieldNameFor_OPC_UNIT + ', '
        + GetFieldNameFor_OPM_UNIT + ', '
        + GetFieldNameFor_AlokasiDanaSupplierID  + ', '
        + GetFieldNameFor_DiscNominal + ', ' + GetFieldNameFor_DiscPersen + ', '
        + GetFieldNameFor_ID + ', ' + GetFieldNameFor_IsLimitQty + ', '
        + GetFieldNameFor_IsQtySubsidy + ', ' + GetFieldNameFor_KonversiValue + ', '
        + GetFieldNameFor_LimitQty + ', ' + GetFieldNameFor_LimitQtyPrice + ', '
        + GetFieldNameFor_MarkUp + ', ' + GetFieldNameFor_NewBarang + ', '
        + GetFieldNameFor_NewUnit + ', ' + GetFieldNameFor_NewUOM + ', '
        + GetFieldNameFor_QtySubsidy + ', ' + GetFieldNameFor_QtySubsidyPrice + ', '
        + GetFieldNameFor_Remark + ', ' + GetFieldNameFor_SellPrice + ', '
        + GetFieldNameFor_SellPriceCoret + ', ' + GetFieldNameFor_SellPriceDisc + ','
        + GetFieldNameFor_TipeHargaID + ', ' + GetFieldNameFor_TipeHargaUnit + ','

        + GetFieldNameFor_IsMailer + ', '
        + GetFieldNameFor_MaxQtyDisc

        + ') values ('
        + TAppUtils.QuotDT(FDATE_CREATE) + ', '
        + TAppUtils.QuotDT(FDATE_MODIFY) + ', '
        + InttoStr(FOPC_UNITID) + ', '
        + InttoStr(FOPM_UNITID) + ', '
       + IfThen(FAlokasiDanaSupplierID = 0, 'null, ', IntToStr(FAlokasiDanaSupplierID) + ', ')
       + FormatFloat('0.00', FDiscNominal) + ', '
       + FormatFloat('0.00', FDiscPersen) + ', '
       + IntToStr( FID) + ', '
       + IntToStr( FIsLimitQty) + ', '
       + IntToStr( FIsQtySubsidy) + ', '
       + FormatFloat('0.00000000', FKonversiValue) + ', '
       + IntToStr( FLimitQty) + ', '
       + FormatFloat('0.00', FLimitQtyPrice) + ', '
       + FormatFloat('0.00', FMarkUp) + ', '
       + QuotedStr( FNewBarang.Kode) + ', '
       + InttoStr( FUnitID) + ', '
       + QuotedStr( FNewUOM.UOM) + ', '
       + IntToStr( FQtySubsidy) + ', '
       + FormatFloat('0.00', FQtySubsidyPrice) + ', '
       + QuotedStr(FRemark ) + ','
       + FormatFloat('0.00', FSellPrice) + ', '
       + FormatFloat('0.00', FSellPriceCoret) + ', '
       + FormatFloat('0.00', FSellPriceDisc) + ', '
       + IntToStr( FTipeHargaID) + ', '
       + InttoStr( FUnitID) + ', '
       + InttoStr( FIsMailer) + ', '
       + FormatFloat('0.00', FMaxQtyDisc)
       + ');'
      end
      else
      begin
        S := 'Update ' + CustomTableName + ' set  '
        + GetFieldNameFor_DATE_MODIFY + ' = ' + TAppUtils.QuotDT(FDATE_MODIFY)
        + ', ' + GetFieldNameFor_OPM_UNIT + ' = ' + IntToStr(FOPM_UNITID)
        + ', ' + GetFieldNameFor_AlokasiDanaSupplierID + ' = ' + IfThen(FAlokasiDanaSupplierID = 0, 'null', IntToStr(FAlokasiDanaSupplierID) + '')
        + ', ' + GetFieldNameFor_DiscNominal + ' = ' + FormatFloat('0.00', FDiscNominal)
        + ', ' + GetFieldNameFor_DiscPersen + ' = ' + FormatFloat('0.00', FDiscPersen)
        + ', ' + GetFieldNameFor_IsLimitQty + ' = ' + IntToStr( FIsLimitQty)
        + ', ' + GetFieldNameFor_IsQtySubsidy + ' = ' + IntToStr( FIsQtySubsidy)
        + ', ' + GetFieldNameFor_KonversiValue + ' = ' + FormatFloat('0.00000000', FKonversiValue)
        + ', ' + GetFieldNameFor_LimitQty + ' = ' + IntToStr( FLimitQty)
        + ', ' + GetFieldNameFor_LimitQtyPrice + ' = ' + FormatFloat('0.00', FLimitQtyPrice)
        + ', ' + GetFieldNameFor_MarkUp + ' = ' + FormatFloat('0.00', FMarkUp)
        + ', ' + GetFieldNameFor_NewBarang + ' = ' + QuotedStr( FNewBarang.Kode)
        + ', ' + GetFieldNameFor_NewUnit + ' = ' + IntToStr( FUnitID)
        + ', ' + GetFieldNameFor_NewUOM + ' = ' + QuotedStr( FNewUOM.UOM)
        + ', ' + GetFieldNameFor_QtySubsidy + ' = ' + IntToStr( FQtySubsidy)
        + ', ' + GetFieldNameFor_QtySubsidyPrice + ' = ' + FormatFloat('0.00', FQtySubsidyPrice)
        + ' , ' + GetFieldNameFor_Remark + ' = ' + QuotedStr( FRemark )
        + ', ' + GetFieldNameFor_SellPrice + ' = ' + FormatFloat('0.00', FSellPrice)
        + ', ' + GetFieldNameFor_SellPriceCoret + ' = ' + FormatFloat('0.00', FSellPriceCoret)
        + ', ' + GetFieldNameFor_SellPriceDisc + ' = ' + FormatFloat('0.00', FSellPriceDisc)
        + ', ' + GetFieldNameFor_TipeHargaID + ' = ' + IntToStr( FTipeHargaID)
        + ', ' + GetFieldNameFor_TipeHargaUnit + ' = ' + IntToStr(FUnitID)

        + ', ' + GetFieldNameFor_IsMailer + ' = ' + IntToStr( IsMailer)
        + ', ' + GetFieldNameFor_MaxQtyDisc + ' = ' + FormatFloat('0.00', FMaxQtyDisc)

        + ' Where '+ GetFieldNameFor_NewUnit +' = ' + IntToStr(FUnitID)
        + ' and '+ GetFieldNameFor_ID +' = ' + IntToStr(FID) + ';';
      end;
    end;
    if not cExecSQL(S, dbtPOS, False) then
    begin
      cRollbackTrans;
      Exit;
    end else
      Result := ExecuteCustomSQLTask;
  finally
//    DecimalSeparator := lDecimalSeparator;
  end;
end;

function TBarangHargaJual.LoadBarangHargaJualTermurah(AKode: String;
    ATipeHargaID: Integer; AUnitID: Integer): Boolean;
var
  sSQL: string;
begin
  Result := False;
  sSQL := 'select * '
    + 'from ' + CustomTableName
    + ' where bhj_tphrg_id = ' + IntToStr(ATipeHargaID)
//    + ' and bhj_tphrg_unt_id = ' + IntToStr(AUnitID)
    + ' and bhj_brg_code = ' + QuotedStr(AKode)
    + ' order by bhj_sell_price asc';

  if FLoadFromDB(sSQL) then
    Result := True;
end;

function TBarangHargaJual.GetFieldNameFor_AlokasiDanaSupplierID: string;
begin
  Result := 'BHJ_ADSO_ID';// <<-- Rubah string ini untuk mapping
end;

function TBarangHargaJual.GetFieldNameFor_DATE_CREATE: string;
begin
  // TODO -cMM: TBarangHargaJual.GetFieldNameFor_DATE_CREATE default body inserted
  Result := 'DATE_CREATE';
end;

function TBarangHargaJual.GetFieldNameFor_DATE_MODIFY: string;
begin
  // TODO -cMM: TBarangHargaJual.GetFieldNameFor_DATE_MODIFY default body inserted
  Result := 'DATE_MODIFY';
end;

function TBarangHargaJual.GetFieldNameFor_DiscNominal: string;
begin
  Result := 'BHJ_DISC_NOMINAL';// <<-- Rubah string ini untuk mapping
end;

function TBarangHargaJual.GetFieldNameFor_DiscPersen: string;
begin
  Result := 'BHJ_DISC_PERSEN';// <<-- Rubah string ini untuk mapping
end;

function TBarangHargaJual.GetFieldNameFor_ID: string;
begin
  Result := 'BHJ_ID';// <<-- Rubah string ini untuk mapping
end;

function TBarangHargaJual.GetFieldNameFor_IsLimitQty: string;
begin
  Result := 'BHJ_IS_LIMIT_QTY';// <<-- Rubah string ini untuk mapping
end;

function TBarangHargaJual.GetFieldNameFor_IsMailer: string;
begin
  Result := 'BHJ_IS_MAILER';
end;

function TBarangHargaJual.GetFieldNameFor_IsQtySubsidy: string;
begin
  Result := 'BHJ_IS_QTY_SUBSIDY';// <<-- Rubah string ini untuk mapping
end;

function TBarangHargaJual.GetFieldNameFor_KonversiValue: string;
begin
  Result := 'BHJ_CONV_VALUE';// <<-- Rubah string ini untuk mapping
end;

function TBarangHargaJual.GetFieldNameFor_LimitQty: string;
begin
  Result := 'BHJ_LIMIT_QTY';// <<-- Rubah string ini untuk mapping
end;

function TBarangHargaJual.GetFieldNameFor_LimitQtyPrice: string;
begin
  Result := 'BHJ_LIMIT_QTY_PRICE';// <<-- Rubah string ini untuk mapping
end;

function TBarangHargaJual.GetFieldNameFor_MarkUp: string;
begin
  Result := 'BHJ_MARK_UP';// <<-- Rubah string ini untuk mapping
end;

function TBarangHargaJual.GetFieldNameFor_MaxQtyDisc: string;
begin
  Result := 'BHJ_Max_Qty_Disc';
end;

function TBarangHargaJual.GetFieldNameFor_NewBarang: string;
begin
  Result := 'BHJ_BRG_CODE';// <<-- Rubah string ini untuk mapping
end;

function TBarangHargaJual.GetFieldNameFor_NewUnit: string;
begin
  Result := 'BHJ_UNT_ID';// <<-- Rubah string ini untuk mapping
end;

function TBarangHargaJual.GetFieldNameFor_NewUOM: string;
begin
  Result := 'BHJ_SAT_CODE';// <<-- Rubah string ini untuk mapping
end;

function TBarangHargaJual.GetFieldNameFor_OPC_UNIT: string;
begin
  // TODO -cMM: TBarangHargaJual.GetFieldNameFor_OPC_UNIT default body inserted
  Result := 'OPC_UNIT';
end;

function TBarangHargaJual.GetFieldNameFor_OPM_UNIT: string;
begin
  // TODO -cMM: TBarangHargaJual.GetFieldNameFor_OPM_UNIT default body inserted
  Result := 'OPM_UNIT';
end;

function TBarangHargaJual.GetFieldNameFor_QtySubsidy: string;
begin
  Result := 'BHJ_QTY_SUBSIDY';// <<-- Rubah string ini untuk mapping
end;

function TBarangHargaJual.GetFieldNameFor_QtySubsidyPrice: string;
begin
  Result := 'BHJ_QTY_SUBSIDY_PRICE';// <<-- Rubah string ini untuk mapping
end;

function TBarangHargaJual.GetFieldNameFor_Remark: string;
begin
  Result := 'BHJ_REMARK';// <<-- Rubah string ini untuk mapping
end;

function TBarangHargaJual.GetFieldNameFor_SellPrice: string;
begin
  Result := 'BHJ_SELL_PRICE';// <<-- Rubah string ini untuk mapping
end;

function TBarangHargaJual.GetFieldNameFor_SellPriceCoret: string;
begin
  Result := 'BHJ_SELL_PRICE_CORET';// <<-- Rubah string ini untuk mapping
end;

function TBarangHargaJual.GetFieldNameFor_SellPriceDisc: string;
begin
  Result := 'BHJ_SELL_PRICE_DISC';// <<-- Rubah string ini untuk mapping
end;

function TBarangHargaJual.GetFieldNameFor_TipeHargaID: string;
begin
  Result := 'BHJ_TPHRG_ID';// <<-- Rubah string ini untuk mapping
end;

function TBarangHargaJual.GetFieldNameFor_TipeHargaUnit: string;
begin
  Result := 'BHJ_TPHRG_UNT_ID';// <<-- Rubah string ini untuk mapping
end;

function TBarangHargaJual.GetGeneratorName: string;
begin

  Result := 'gen_barang_harga_jual_id' ;

end;

function TBarangHargaJual.SetHargaAverage(aKode : String; aUnitID : Integer;
    aUOMCode : String; Var aConValue : Double; Var aHargaAvg : Double): Double;
var
  s: string;
begin
  Result := 0;

  aConValue   := 0;
  aHargaAvg   := 0;

  s := 'SELECT b.KONVSAT_SCALE, (a.BRG_HARGA_AVERAGE * b.KONVSAT_SCALE) as HargaAverage'
     + ' FROM BARANG a, REF$KONVERSI_SATUAN b WHERE a.BRG_CODE = b.KONVSAT_BRG_CODE'
     + ' AND a.BRG_SAT_CODE_STOCK = b.KONVSAT_SAT_CODE_TO'
     + ' AND b.KONVSAT_SAT_CODE_FROM = ' + QuotedStr(aUOMCode)
     + ' AND a.BRG_CODE = ' + QuotedStr(aKode);
  with cOpenQuery(s) do
  begin
    try
      if not eof then
      begin
        aConValue   := Fields[0].AsFloat;
        aHargaAvg   := Fields[1].AsFloat;
      end;
    finally
      Free;
    end;

  end;

end;

function TBarangHargaJual.GetHeaderFlag: Integer;
begin
  result := 1678;
end;

function TBarangHargaJual.GetOPC_UNIT: TUnit;
begin
  try
    if FOPC_UNIT = nil then
    begin
      FOPC_UNIT := TUnit.Create(nil);
      FOPC_UNIT.LoadByID(FOPC_UNITID);
    end;

  finally
    Result := FOPC_UNIT;
  end;
end;

function TBarangHargaJual.GetOPM_UNIT: TUnit;
begin
  try
    if FOPM_UNIT = nil then
    begin
      FOPM_UNIT := TUnit.Create(nil);
      FOPM_UNIT.LoadByID(FOPM_UNITID);
    end;

  finally
    Result := FOPM_UNIT;
  end;
end;

function TBarangHargaJual.GetStorePrice(aKode : String; aUnitID : Integer;
    aTipeHrgID : Integer; aTipeHrgUnitID : Integer): Double;
var
  s: string;
begin
  // TODO -cMM: TBarangHargaJual.GetStorePrice default body inserted
  Result := 0;

  s := 'SELECT BHJ_SELL_PRICE_DISC FROM BARANG_HARGA_JUAL BHJ'
     + ' WHERE BHJ_BRG_CODE = ' + QuotedStr(aKode)
     + ' AND BHJ_TPHRG_ID = ' + IntToStr(aTipeHrgID)
     + ' AND BHJ_UNT_ID = ' + IntToStr(aUnitID)
     + ' AND BHJ_TPHRG_UNT_ID = ' + IntToStr(aTipeHrgUnitID);
  with cOpenQuery(s) do
  begin
    try
      if not eof then
      begin
        Result := Fields[0].AsFloat;
      end;

    finally
      Free;
    end;

  end;

end;

function TBarangHargaJual.IsSettingHargaJualSudahAda(aUnitID: integer; aKodeBrg
    : String; aSatuanCOde : String; aTiPehargID : Integer; aExcluedID :
    Integer): Boolean;
var
  sSQL: string;
begin
  Result := False;
  sSQL := 'select count(bhj_id) from barang_harga_jual'
          + ' where bhj_unt_id = ' + IntToStr(aUnitID)
          + ' and bhj_brg_code = ' + QuotedStr(aKodeBrg)
          + ' and bhj_sat_code = ' + QuotedStr(aSatuanCOde)
          + ' and bhj_tphrg_id = ' + IntToStr(aTiPehargID)
          + ' and bhj_id <> ' + IntToStr(aExcluedID);

  with cOpenQuery(sSQL) do
  begin
    try
      if Fields[0].AsInteger > 0 then
        Result := True;
    finally
      Free;
    end;
  end;

end;

function TBarangHargaJual.LoadBarangBarcodeUom(ABarcode: String; ATipeHargaID:
    Integer): Boolean;
var
  sSQL: string;
begin
  Result := False;
  sSQL := 'select bhj.* '
    + ' FROM REF$KONVERSI_SATUAN ks INNER JOIN '
    + CustomTableName + ' bhj ON (ks.KONVSAT_BRG_CODE = bhj.BHJ_BRG_CODE) '
    + '  AND (ks.KONVSAT_SAT_CODE_FROM = bhj.BHJ_SAT_CODE)'
    + ' WHERE bhj.bhj_tphrg_id     = ' + IntToStr(ATipeHargaID)
    + ' and   ks.KONVSAT_BARCODE   = ' + QuotedStr(ABarcode)
    + ' order by bhj.bhj_sell_price asc';

  if FLoadFromDB(sSQL) then
    Result := True;
end;

function TBarangHargaJual.CountBarangHargaJual(AKode: String; ATipeHargaID:
    Integer; AUnitID: Integer): Integer;
var
  sSQL: string;
begin
  //Result := 0;
  sSQL := 'select count(*) '
    + 'from ' + CustomTableName
    + ' where bhj_tphrg_id = ' + IntToStr(ATipeHargaID)
    + ' and bhj_tphrg_unt_id = ' + IntToStr(AUnitID)
    + ' and bhj_brg_code = ' + QuotedStr(AKode);

  with cOpenQuery(sSQL) do
  begin
      Try
         Result := Fields[0].AsInteger;
      Finally
        Free;
      end;
  end;
end;

function TBarangHargaJual.ExecuteGenerateSQLByUnit: Boolean;

begin
  Result := ExecuteGenerateSQLPerLine;
end;

function TBarangHargaJual.ExecuteGenerateSQLPerLine: Boolean;
begin
  try
    Result  := ExecuteGenerateSQL;
    if not IsUOMSudahAdaKonversi(fnewBarang.Kode, FNewUOM.UOM) then
    begin
      Result  := False;
    end;
  except
    Result  := False;
  end;
end;

function TBarangHargaJual.GetTipeHargaName: string;
var
  sSQL: string;
begin
  Result := '';
  sSQL := 'select tphrg_name'
          + ' from ref$tipe_harga'
          + ' where tphrg_id = ' + IntToStr(TipeHargaID);

  with cOpenQuery(sSQL) do
  begin
    try
      while not Eof do
      begin
        Result := FieldByName('tphrg_name').AsString;
        Next;
      end;
    finally
      Free;
    end;
  end;

end;

function TBarangHargaJual.LoadBarangHargaJualTermurahUOM(AKode: String;
    ATipeHargaID: Integer; AUnitID: Integer; aUoM:String): Boolean;
var
  sSQL: string;
begin
  Result := False;
  sSQL := 'select * '
    + 'from ' + CustomTableName
    + ' where bhj_tphrg_id = ' + IntToStr(ATipeHargaID)
    + ' and bhj_tphrg_unt_id = ' + IntToStr(AUnitID)
    + ' and bhj_brg_code = ' + QuotedStr(AKode)
    + IfThen(aUoM='', '', ' and BHJ_SAT_CODE = ' + QuotedStr(aUoM))
    + ' order by bhj_sell_price asc';

  if FLoadFromDB(sSQL) then
    Result := True;
end;

function TBarangHargaJual.LoadByBarangKode(aBarangCode : String): Boolean;
var
  s: string;
begin
  // TODO -cMM: TBarangHargaJual.LoadByBarangKode default body inserted

  s := 'SELECT * FROM ' + CustomTableName
     + ' WHERE BHJ_BRG_CODE =' + QuotedStr(aBarangCode);

  Result := FLoadFromDB(s);
end;

function TBarangHargaJual.LoadByBarangKode(aBarangCode : String; aBarangUnitID
    : Integer; aSatCode : String; aSatUnitID : Integer): Boolean;
var
  s: string;
begin

  s := 'SELECT * FROM ' + CustomTableName
     + ' WHERE BHJ_SAT_CODE = ' + QuotedStr(aSatCode)
     + ' AND BHJ_BRG_CODE =' + QuotedStr(aBarangCode);

  Result := FLoadFromDB(s);
end;

function TBarangHargaJual.LoadByBarangKodeTipeHarga(aBarangCode : String;
    aSatCode : String; aTipeHrg : Integer): Boolean;
var
  s: string;
begin
  Result := False;

  s := 'SELECT * FROM ' + CustomTableName
     + ' WHERE BHJ_SAT_CODE = ' + QuotedStr(aSatCode)
     + ' AND BHJ_BRG_CODE =' + QuotedStr(aBarangCode)
     + ' AND BHJ_TPHRG_ID = ' + IntToStr(aTipeHrg);

  if FLoadFromDB(s) then
    Result := True;
end;

function TBarangHargaJual.LoadByID(aID : Integer): Boolean;
begin
  result := FloadFromDB('Select * from ' + CustomTableName + ' Where ' + GetFieldNameFor_ID +' = ' + IntToStr(aID) );
end;

function TBarangHargaJual.LoadByID(aID : Integer; aUnitId: integer): Boolean;
begin
  result := FloadFromDB('Select * from ' + CustomTableName + ' Where '
          + GetFieldNameFor_ID + ' = ' + IntToStr(aID)
          + ' and ' + GetFieldNameFor_NewUnit + ' = ' + IntToStr(aUnitId));
end;

function TBarangHargaJual.RemoveFromDB: Boolean;
var
  sSQL: string;
begin
  Result := False;
   sSQL := 'delete from ' + CustomTableName
            + ' where ' + GetFieldNameFor_ID + ' = ' + IntToStr(ID)
            + ' and ' + GetFieldNameFor_NewUnit + ' = ' + IntToStr(NewUnit.ID) ;

   if cExecSQL(sSQL, dbtPOS, False) then
        Result := True; //SimpanBlob(sSQL,GetHeaderFlag);
end;

procedure TBarangHargaJual.UpdateData(aAlokasiDanaSupplierID : Integer;
    aDiscNominal : Double; aDiscPersen : Double; aID : Integer; aIsLimitQty :
    Integer; aIsQtySubsidy : Integer; aKonversiValue : Double; aLimitQty :
    Integer; aLimitQtyPrice : Double; aMarkUp : Double; aNewBarangKode :
    string; aNewUnit_ID : Integer; aUOM : string; aQtySubsidy : Integer;
    aQtySubsidyPrice : Double; aRemark : string; aSellPrice : Double;
    aSellPriceCoret : Double; aSellPriceDisc : Double; aTipeHargaID : Integer;
    aIsMailer : Integer; aMaxQtyDisc : Double);
begin
  FAlokasiDanaSupplierID :=  aAlokasiDanaSupplierID;
  FDiscNominal :=  aDiscNominal;
  FDiscPersen :=  aDiscPersen;
  FID :=  aID;
  FIsLimitQty :=  aIsLimitQty;
  FIsQtySubsidy :=  aIsQtySubsidy;
  FKonversiValue :=  aKonversiValue;
  FLimitQty :=  aLimitQty;
  FLimitQtyPrice :=  aLimitQtyPrice;
  FMarkUp :=  aMarkUp;
  FUnitID := aNewUnit_ID;
  FNewUnit.LoadByID(aNewUnit_ID);
  FNewBarang.LoadByKode(aNewBarangKode);
  FNewUOM.LoadByUOM(aUOM);
  FQtySubsidy :=  aQtySubsidy;
  FQtySubsidyPrice :=  aQtySubsidyPrice;
  FRemark := trim(aRemark);
  FSellPrice :=  aSellPrice;
  FSellPriceCoret :=  aSellPriceCoret;
  FSellPriceDisc :=  aSellPriceDisc;
  FTipeHargaID :=  aTipeHargaID;
  FIsMailer := aIsMailer;
  FMaxQtyDisc := aMaxQtyDisc;
  state := csCreated;
end;



end.
