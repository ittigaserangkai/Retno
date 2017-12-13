unit uServerDSProvider;

interface
uses
  System.Classes, uModApp, uDBUtils, Rtti, Data.DB, SysUtils, StrUtils,
  uModUnit, Data.FireDACJSONReflect, FireDAC.Stan.StorageBin, uServerClasses,
  FireDAC.Comp.Client;

type
  {$METHODINFO ON}
  TDSProvider = class(TComponent)
  public
    function AdjFaktur_GetDSOverview(aStartDate, aEndDate: TDateTime): TDataSet;
    function Agama_GetDSLookup: TDataSet;
    function Agama_GetDSOverview: TDataSet;
    function App_GetDSLookUp: TDataSet;
    function App_GetDSOverview: TDataSet;
    function CrazyPrice_GetDSOverview(APeriodeAwal, APeriodeAkhir: TDatetime):
        TDataSet;
    function AP_GetDSLookUp: TDataSet;
    function AP_GetDSLookUpPerOrganization(AOrgID : String): TDataSet;
    function AR_GetDSLookUpPerOrganization(AOrgID : String): TDataSet;
    function AutAPP_GetDSLookup: TDataSet;
    function AutUnit_GetDSLookup: TDataSet;
    function AutUser_GetDSLookUp(aGroupName: string): TDataSet;
    function AutUser_GetDSOverview: TDataSet;
    function BankCashOut_GetDSByPeriod(APeriodeAwal, APeriodeAkhir: TDatetime):
        TDataset;
    function Bank_GetDSLookup: TDataSet;
    function Bank_GetDSOverview: TDataSet;
    function BarangGalon_GetDSLookup: TDataSet;
    function BarangQuotation_GetDSLookup(aSuplierMerchanID: String): TDataSet;
    function BarangSupp_GetDSLookup(aMerchandise: String): TDataSet;
    function BarangSupp_GetDSLookup2(aMerchandise: String): TFDJSONDataSets;
    function Barang_ByPOLookUp(APONO : String): TDataset;
    function Barang_GetDSLookup(aMerchanGroupID: string): TDataSet;
    function Barang_GetDSOverview(aMerchanGroupID: string; AProductCode : String):
        TDataSet;
    function Barang_HargaJualOverview(AProductCode : String): TDataSet;
    function BeginningBalance_GetDSOverview(aDate: TDatetime; aShiftName, AUnitID:
        string): TDataSet;
    function Claim_GetDSOverview(aStartDate, aEndDate: TDateTime): TDataSet;
    function Claim_Lookup_CN(aSuplierMerchanID: String): TDataSet;
    function Claim_Lookup_Contrabon(aContrabonID: String): TDataSet;
    function Claim_Lookup_CS(aOrganizationID: String): TDataSet;
    function Claim_Lookup_DN(aSuplierMerchanID: String): TDataSet;
    function Claim_Lookup_DO(aSuplierMerchanID: String): TDataSet;
    function CNDetail_GetDS(aID: string): TDataSet;
    function CN_RCV_GetDSOverview(ATglAwal , ATglAkhir : TDateTime; AUnit :
        TModUnit = nil): TDataSet;
    function Company_GetDSLookup: TDataSet;
    function Company_GetDSOverview: TDataSet;
    function Customer_GetDSOverview: TDataSet;
    function Contrabon_GetDSOverview(aStartDate, aEndDate: TDateTime): TDataSet;
    function CostCenter_GetDSLookup: TDataSet;
    function CreditCard_GetDSLookup: TDataSet;
    function CostCenter_GetDSOverview: TDataSet;
    function CustomerInvoice_Overview(APeriodeAwal, APeriodeAkhir: TDatetime):
        TDataset;
    function DNDetail_GetDS(aID: string): TDataSet;
    function DN_RCV_GetDSOverview(ATglAwal , ATglAkhir : TDateTime; AUnit :
        TModUnit = nil): TDataSet;
    function Document_GetDSOverview: TDataSet;
    function DODetail_LookupAdjFak(aDOID: string): TDataset;
    function DODetail_WithAdj(aDOID: string): TDataset;
    function DO_GetDSLookUp: TDataSet;
    function DO_GetDSOverview(ATglAwal , ATglAkhir : TDateTime;AUnitID,
        ASupMGCodeID : String): TDataSet;
    function FinalPayment_GetDSByBeginningBalance(ABeginningBalanceID: string):
        TDataSet;
    function FinalPayment_GetDSOverview(aDate: TDatetime; aShiftName, AUnitID:
        string): TDataSet;
    function GET_MEMBER_PAS_NO(ATPMEMBER: String): String;
    function GroupRekening_GetDSLookup: TDataSet;
    function Gudang_GetDSLookUp: TDataSet;
    function Gudang_GetDSOverview: TDataSet;
    function Jurnal_GetDSOverview(aStartDate, aEndDate: TDateTime): TDataSet;
    function Kabupaten_GetDSLookUp: TDataSet;
    function Kategori_GetDSLookup: TDataSet;
    function Kompetitor_GetDSOverview: TDataSet;
    function KuponBotol_GetDSLookUp(aDate: TDatetime; AUnitID: string): TDataSet;
    function Lokasi_GetDSLookup: TDataSet;
    function MataUang_GetDSOverview: TDataSet;
    function MemberActivasi_GetDSOverview: TDataSet;
    function MemberKeluarga_GetDSOverview: TDataSet;
    function Member_GetDSLookUp: TDataSet;
    function Member_GetDSOverview: TDataSet;
    function MerchandiseGroup_GetDSLookup: TDataSet;
    function Merchandise_GetDSLookup: TDataSet;
    function Merchandise_GetDSOverview: TDataSet;
    function Merk_GetDSLookUp: TDataSet;
    function Organization_GetDSLookup: TDataSet;
    function Organization_Lookup(OrgType: Integer): TDataSet;
    function Outlet_GetDSLookup: TDataSet;
    function PORevisi_GetDSOverview(ID: string): TDataset;
    function POTrader_GetDSOverview(APeriodeAwal, APeriodeAkhir: TDatetime):
        TDataSet;
    function PO_DSLookUpDetail(ANOPO : String): TDataSet;
    function PO_GetDSByPeriod(APeriodeAwal, APeriodeAkhir: TDatetime): TDataset;
    function PO_GetDSOLookUp(AUnitID : String): TDataset;
    function PO_GetDSOLookUpForAdj(aStartDate, aEndDate: TDatetime;
        aSuplierMerchanID: String): TDataset;
    function PO_GetDSOLookUpForGR(AUnitID : String): TDataset;
    function PO_GetDSOverview(ATglAwal , ATglAkhir : TDateTime;
        AkodeSupplierMGAwal, AKodeSupplierMGAkhir : String; AStatusPOID : String;
        AUnit : TModUnit = nil): TDataset;
    function PO_GetDSOverviewDetil(ATglAwal , ATglAkhir : TDateTime; AUnit :
        TModUnit = nil): TDataset;
    function PO_SKULookUP(APONO : String): TDataSet;
    function PO_SLIP_GetDSOverview(ATglAwal , ATglAkhir : TDateTime; AUnit :
        TModUnit = nil): TDataSet;
    function Propinsi_GetDSLookUp: TDataSet;
    function Quotation_GetDSOverview(aStartDate, aEndDate: TDatetime): TDataSet;
    function RefCreditCard_GetDSOverview: TDataSet;
    function RefDiscMember_GetDSOverview: TDataSet;
    function RefGrupMember_GetDSOverview: TDataSet;
    function RefPajak_GetDSLookup: TDataSet;
    function RefPajak_GetDSOverview: TDataSet;
    function RefTipeBarang_GetDSLookup: TDataSet;
    function RefTipeBarang_GetDSOverview: TDataSet;
    function RefTipeMember_GetDSLookup: TDataSet;
    function RefTipeMember_GetDSOverview: TDataSet;
    function RefWilayah_GetDSLookup: TDataSet;
    function RekeningBCOLain_GetDSLookup: TDataSet;
    function Rekening_GetDSLookup: TDataSet;
    function Rekening_GetDSLookupFilter(AFilterRekeningSettingApp : String):
        TDataSet;
    function Rekening_GetDSLookupLvl: TDataSet;
    function Rekening_GetDSOverview: TDataSet;
    function ResetCashier_GetDSOverview(aDate: TDatetime; aShiftName, AUnitID:
        string): TDataSet;
    function Satuan_GetDSLookup: TDataSet;
    function Satuan_GetDSOverview: TDataSet;
    function SetupPOS_GetDSLookUp(aDate: TDatetime; AUnitID: string): TDataSet;
    function SetupPOS_GetDSOverview(aDate: TDatetime; AUnitID: string): TDataSet;
    function Shift_GetDSOverview: TDataSet;
    function SO_GetDSOLookUp(AUnit : TModUnit = nil): TDataSet;
    function SO_GetDSOLookUpGeneratePO(AUnit : TModUnit = nil): TDataSet;
    function SO_GetDSOverview(ATglAwal , ATglAkhir : TDateTime; AUnit : TModUnit =
        nil): TDataSet;
    function StatusPO_GetDSLookup: TDataSet;
    function SubGroup_GetDSLookup: TDataSet;
    function SubGroup_GetDSOverview: TDataSet;
    function SuplierGroup_GetDSLookup: TDataSet;
    function SuplierGroup_GetDSOverview1: TDataSet;
    function SuplierMerchan_GetDSLookup: TDataSet;
    function Suplier_GetDSLookup: TDataSet;
    function Suplier_GetDSOverview: TDataSet;
    function SupMGByOutstandingSO_GetDSLookup(ID: string): TDataset;
    function TipeBonus_GetDSOverview: TDataSet;
    function TipeCN_GetDSOverview: TDataSet;
    function TipeHarga_GetDSLookup: TDataSet;
    function TipeKirimPO_GetDSOverview: TDataSet;
    function TipePembayaran_GetDSOverview: TDataSet;
    function TipePerusahaan_GetDSLookup: TDataSet;
    function TipePerusahaan_GetDSOverview: TDataSet;
    function TipePO_GetDSOverview: TDataSet;
    function TipeSuplier_GetDSLookup: TDataSet;
    function TipeSuplier_GetDSOverview: TDataSet;
    function UnitType_GetDSLookUp: TDataSet;
    function UnitType_GetDSOverview: TDataSet;
    function Unit_GetDSLookUp: TDataSet;
    function Unit_GetDSOverview: TDataSet;
    function DOTrader_GetDSOverview(APeriodeAwal, APeriodeAkhir: TDatetime):
        TDataSet;
    function Organization_Trader_GetDSLookup: TDataSet;
    function TipePembayaran_GetDSLookUp: TDataSet;
  end;

  TDSReport = class(TComponent)
  public
    function BankCashOut_GetDS_Slip(APeriodeAwal, APeriodeAkhir: TDatetime;
        ANoBukti : String): TFDJSONDataSets;
    function Claim_by_Id(id: string): TFDJSONDataSets;
    function DO_GetDSNP(ANONP : String): TFDJSONDataSets;
    function DO_GetDS_CheckList(ANONP : String): TFDJSONDataSets;
    function DSA_GetDS(aStartDate, aEndDate: TDatetime; aGroupField: string):
        TDataSet;
    function DSA_GetDSPrint(aStartDate, aEndDate: TDatetime; aGroupField: string):
        TFDJSONDataSets;
    function DSR_GetDS(aStartDate, aEndDate: TDatetime): TFDJSONDataSets;
    function KuponBotol_GetDS_Slip(ANomor: string): TFDJSONDataSets;
    function HistoryAP(ANoAP : String): TFDJSONDataSets;
    function InvMovement_GetDS(aStartDate, aEndDate: TDatetime; aGroup_ID,
        aSupplier_ID, aGudang_ID: String): TDataSet;
    function KartuAP(AOrgID : String; APeriodeAwal : TDateTime; APeriodeAkhir :
        TDateTime): TFDJSONDataSets;
    function KartuStock_GetDS(aBarang_ID: String; aStartDate, aEndDate: TDatetime;
        aGudang_ID: string): TDataSet;
    function PO_SLIP_ByDateNoBukti(StartDate, EndDate: TDateTime; aNoBuktiAwal:
        string = ''; aNoBuktiAkhir: string = ''): TFDJSONDataSets;
    function SO_ByDate(StartDate, EndDate: TDateTime): TFDJSONDataSets;
    function SO_ByDateNoBukti(StartDate, EndDate: TDateTime; aNoBuktiAwal: string =
        ''; aNoBuktiAkhir: string = ''): TFDJSONDataSets;
    function SO_Test: TFDJSONDataSets;
    function StockProduct_GetDS(aEndDate: TDatetime; aGroup_ID, aSupplier_ID,
        aGudang_ID: String): TDataSet;
    function Test: Variant;
    function Test2: OleVariant;
  end;

  {$METHODINFO OFF}
implementation
uses
  System.DateUtils, System.Variants;

function TDSProvider.AdjFaktur_GetDSOverview(aStartDate, aEndDate: TDateTime):
    TDataSet;
var
  S: string;
begin
  S := 'select * from V_ADJFAKTUR_OVERVIEW where ADJFAK_DATE between '
      + TDBUtils.QuotDt(aStartDate) + ' and ' + TDBUtils.QuotDt(aEndDate);
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Agama_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select REF$AGAMA_ID, AGAMA_NAME from REF$AGAMA';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Agama_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select AGAMA_NAME, REF$AGAMA_ID'
  +' from'
  +' REF$AGAMA';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.App_GetDSLookUp: TDataSet;
var
  S: string;
begin
  S := 'select APP_CODE, APP_NAME, APP_DESCRIPTION,AUT$APP_ID from AUT$APP';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.App_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select APP_CODE, APP_NAME, APP_DESCRIPTION,AUT$APP_ID from AUT$APP';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.CrazyPrice_GetDSOverview(APeriodeAwal, APeriodeAkhir:
    TDatetime): TDataSet;
var
  S: string;
begin
  S := ' SELECT * FROM V_CRAZYPRICE ' +
       ' where CRAZY_DATE between ' + TDBUtils.QuotDt(APeriodeAwal) +
       ' and ' + TDBUtils.QuotDt(APeriodeAkhir) +
       ' order by CRAZY_DATE desc, ORG_Code, ORG_Name';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.AP_GetDSLookUp: TDataSet;
var
  S: string;
begin
  S := 'select * from V_AP';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.AP_GetDSLookUpPerOrganization(AOrgID : String): TDataSet;
var
  S: string;
begin
  S := 'select * from V_AP ' +
       ' where  ap_organization_id = ' + QuotedStr(AOrgID);

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.AR_GetDSLookUpPerOrganization(AOrgID : String): TDataSet;
var
  S: string;
begin
  S := 'select * from V_AR ' +
       ' where  ar_organization_id = ' + QuotedStr(AOrgID);

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.AutAPP_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select APP_CODE, APP_NAME, APP_DESCRIPTION, AUT$APP_ID from aut$APP';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.AutUnit_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select AUT$UNIT_ID, UNT_NAME from AUT$UNIT';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.AutUser_GetDSLookUp(aGroupName: string): TDataSet;
var
  S: string;
begin
  S := 'SELECT U.AUT$USER_ID, U.USR_USERNAME AS CASHIER_NAME, U.USR_FULLNAME '
    + ' FROM AUT$USER U ';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.AutUser_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'SELECT * FROM AUT$USER';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.BankCashOut_GetDSByPeriod(APeriodeAwal, APeriodeAkhir:
    TDatetime): TDataset;
var
  sSQL: string;
begin
  sSQL := 'select * from V_BANKCASHOUT '
    + ' where Tanggal between ' + TDBUtils.QuotDt(APeriodeAwal)
    + ' and ' + TDBUtils.QuotDt(APeriodeAkhir)
    + ' order by Tanggal, NoBukti';

  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.Bank_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'SELECT Bank_ID, BANK_CODE, BANK_NAME, BANK_BRANCH, BANK_ADDRESS,'
      +' BANK_REK_CODE'
      +' FROM BANK';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Bank_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'SELECT * FROM V_BANK order by bank_code';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.BarangGalon_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'SELECT  * FROM V_BARANG_GALON';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.BarangQuotation_GetDSLookup(aSuplierMerchanID: String):
    TDataSet;
var
  S: string;
begin
  S := 'SELECT  * FROM V_BARANG_FOR_QUOTATION'
      +' where SUPLIER_MERCHAN_GRUP_ID = ' + QuotedStr(aSuplierMerchanID);

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.BarangSupp_GetDSLookup(aMerchandise: String): TDataSet;
var
  S: string;
begin
  S := 'SELECT  * FROM V_BARANGSUP_LOOKUP'
      +' where REF$MERCHANDISE_ID = ' + QuotedStr(aMerchandise);

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.BarangSupp_GetDSLookup2(aMerchandise: String):
    TFDJSONDataSets;
var
  S: string;
begin
  Result := TFDJSONDataSets.Create;

  S := 'SELECT  * FROM V_BARANGSUP_LOOKUP'
      +' where REF$MERCHANDISE_ID = ' + QuotedStr(aMerchandise);

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenMemTable(S));
end;

function TDSProvider.Barang_ByPOLookUp(APONO : String): TDataset;
var
  sSQL: string;
begin
  sSQL := 'select c.BARANG_ID, c.BRG_CODE, c.BRG_NAME from po a' +
          ' INNER JOIN PO_DETAIL b on a.PO_ID = b.PO_ID' +
          ' inner JOIN BARANG c on b.BARANG_ID = c.BARANG_ID' +
          ' where a.PO_NO = ' + QuotedStr(APONO);

  Result := TDBUtils.OpenDataset(sSQL);
end;

function TDSProvider.Barang_GetDSLookup(aMerchanGroupID: string): TDataSet;
var
  S: string;
begin
  S := 'SELECT A.BARANG_ID,'
      +' A.BRG_CODE, A.BRG_CATALOG,'
      +' I.MERK_NAME, A.BRG_NAME, B.MERCHAN_NAME, C.MERCHANGRUP_NAME,'
      +' E.SUBGRUP_NAME'
      +' FROM BARANG A'
      +' INNER JOIN REF$MERCHANDISE B ON A.REF$MERCHANDISE_ID = B.REF$MERCHANDISE_ID'
      +' INNER JOIN REF$MERCHANDISE_GRUP C ON C.REF$MERCHANDISE_GRUP_ID = A.REF$MERCHANDISE_GRUP_ID'
      +' LEFT JOIN REF$KATEGORI D ON D.REF$KATEGORI_ID=A.REF$KATEGORI_ID'
      +' LEFT JOIN REF$SUB_GRUP E ON E.REF$SUB_GRUP_ID=D.REF$SUB_GRUP_ID'
      +' INNER JOIN MERK I ON I.MERK_ID = A.MERK_ID';

  if aMerchanGroupID <> '' then
    S := S + ' WHERE A.REF$MERCHANDISE_GRUP_ID = ' + QuotedStr(aMerchanGroupID);

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Barang_GetDSOverview(aMerchanGroupID: string; AProductCode
    : String): TDataSet;
var
  S: string;
begin
  S := 'SELECT A.BARANG_ID,'
      +' A.BRG_CODE, A.BRG_CATALOG,'
      +' I.MERK_NAME, A.BRG_NAME, B.MERCHAN_NAME, C.MERCHANGRUP_NAME,'
      +' E.SUBGRUP_NAME, D.KAT_NAME, F.TPBRG_NAME, G.SAT_NAME, H.OUTLET_NAME'
      +' FROM BARANG A'
      +' INNER JOIN REF$MERCHANDISE B ON A.REF$MERCHANDISE_ID = B.REF$MERCHANDISE_ID'
      +' INNER JOIN REF$MERCHANDISE_GRUP C ON C.REF$MERCHANDISE_GRUP_ID = A.REF$MERCHANDISE_GRUP_ID'
      +' LEFT JOIN REF$KATEGORI D ON D.REF$KATEGORI_ID=A.REF$KATEGORI_ID'
      +' LEFT JOIN REF$SUB_GRUP E ON E.REF$SUB_GRUP_ID=D.REF$SUB_GRUP_ID'
      +' LEFT JOIN REF$TIPE_BARANG F ON A.REF$TIPE_BARANG_ID=F.REF$TIPE_BARANG_ID '
      +' LEFT JOIN REF$SATUAN G ON G.REF$SATUAN_ID = A.REF$SATUAN_STOCK'
      +' LEFT JOIN REF$OUTLET H ON H.REF$OUTLET_ID = A.REF$OUTLET_ID'
      +' INNER JOIN MERK I ON I.MERK_ID = A.MERK_ID '
      +' where 1 = 1';

  if (aMerchanGroupID <> '') and (aMerchanGroupID <> 'XXX') then
    S := S + ' and A.REF$MERCHANDISE_GRUP_ID = ' + QuotedStr(aMerchanGroupID);

  if (AProductCode <> '') and (AProductCode <> 'XXX') then
    S := S + ' and A.BRG_CODE like ' + QuotedStr('%' + AProductCode + '%');

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Barang_HargaJualOverview(AProductCode : String): TDataSet;
var
  S: string;
begin
  S := 'select * from V_BARANG_HARGA_JUAL ' +
       ' where 1 = 1 ';

  if (AProductCode <> '') and (AProductCode <> 'XXX') then
    S := S + ' and BRG_CODE like ' + QuotedStr('%' + AProductCode + '%');

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.BeginningBalance_GetDSOverview(aDate: TDatetime;
    aShiftName, AUnitID: string): TDataSet;
var
  sSQL: string;
begin
  sSQL := 'SELECT * FROM V_BEGINNINGBALANCE '
        + ' where cast(BALANCE_SHIFT_DATE as date) = ' + TDBUtils.QuotD(StartOfTheDay(aDate))
        + ' and AUT$UNIT_ID = ' + TDBUtils.Quot(AUnitID)
        + ' and SHIFT_NAME = ' + TDBUtils.Quot(aShiftName);
  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.Claim_GetDSOverview(aStartDate, aEndDate: TDateTime):
    TDataSet;
var
  S: string;
begin
  S := 'SELECT * FROM V_CLAIMFAKTUR_OVERVIEW '
    + ' where CLM_DATE between ' + TDBUtils.QuotD(aStartDate)
    + ' and ' + TDBUtils.QuotD(aEndDate);

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Claim_Lookup_CN(aSuplierMerchanID: String): TDataSet;
var
  S: string;
begin
  S := 'SELECT * FROM V_CN_FOR_CLAIM';
  if aSuplierMerchanID <> '' then
    S := S + ' where SUPLIER_MERCHAN_GRUP_ID = '+ QuotedStr(aSuplierMerchanID);
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Claim_Lookup_Contrabon(aContrabonID: String): TDataSet;
var
  S: string;
begin
  S := 'SELECT * FROM V_CONTRABONSALES';
  S := S + 'where isnull(CONT_IS_CLAIM,0) = 0';
  if aContrabonID <> '' then
    S := S + ' and CONTRABON_SALES_ID = '+ QuotedStr(aContrabonID) ;

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Claim_Lookup_CS(aOrganizationID: String): TDataSet;
var
  S: string;
begin
  S := 'SELECT * FROM V_CONTRABON_FOR_CLAIM';
  if aOrganizationID <> '' then
    S := S + ' where CONT_ORGANIZATION_ID = '+ QuotedStr(aOrganizationID);
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Claim_Lookup_DN(aSuplierMerchanID: String): TDataSet;
var
  S: string;
begin
  S := 'SELECT * FROM V_DN_FOR_CLAIM';
  if aSuplierMerchanID <> '' then
    S := S + ' where SUPLIER_MERCHAN_GRUP_ID = '+ QuotedStr(aSuplierMerchanID);
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Claim_Lookup_DO(aSuplierMerchanID: String): TDataSet;
var
  S: string;
begin
  S := 'SELECT * FROM V_DO_FOR_CLAIM';
  if aSuplierMerchanID <> '' then
    S := S + ' where SUPLIER_MERCHAN_GRUP_ID = '+ QuotedStr(aSuplierMerchanID);

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.CNDetail_GetDS(aID: string): TDataSet;
var
  sSQL: string;
begin
  sSQL := 'select * from V_CN_RECV_DETAIL ' +
          ' where CN_RECV_ID = ' + QuotedStr(aID);

  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.CN_RCV_GetDSOverview(ATglAwal , ATglAkhir : TDateTime;
    AUnit : TModUnit = nil): TDataSet;
var
  sSQL: string;
begin
  sSQL := 'select * from V_CN_RECV ' +
          ' where CNR_DATE between ' + TDBUtils.QuotDt(StartOfTheDay(ATglAwal)) +
          ' and ' + TDBUtils.QuotDt(EndOfTheDay(ATglAkhir));

  if AUnit <> nil then
    sSQL := sSQL + ' and AUT$UNIT_ID = ' + QuotedStr(AUnit.ID);


  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.Company_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select COMP_CODE, COMP_NAME, COMPANY_ID from COMPANY';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Company_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select COMP_CODE, COMP_NAME, COMPANY_ID from COMPANY';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Customer_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select * from CUSTOMER';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Contrabon_GetDSOverview(aStartDate, aEndDate: TDateTime):
    TDataSet;
var
  S: string;
begin
  S := 'select * from V_CONTRABON_SALES where CONT_DATE_SALES between '
      + TDBUtils.QuotDt(aStartDate) + ' and ' + TDBUtils.QuotDt(aEndDate)
      + ' ORDER BY CONT_DATE_SALES DESC ';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.CostCenter_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select * from V_COST_CENTER';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.CreditCard_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select CARD_CODE, CARD_NAME, CARD_LIMIT from REF$CREDIT_CARD';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.CostCenter_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select COCTER_CODE, COCTER_NAME, COST_CENTER_ID from COST_CENTER';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.CustomerInvoice_Overview(APeriodeAwal, APeriodeAkhir:
    TDatetime): TDataset;
var
  sSQL: string;
begin
  sSQL := 'select * from V_CUSTOMERINVOICE '
    + ' where CI_TRANSDATE between ' + TDBUtils.QuotDt(APeriodeAwal)
    + ' and ' + TDBUtils.QuotDt(APeriodeAkhir)
    + ' order by CI_TRANSDATE desc, CI_NOBUKTI desc';

  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.DNDetail_GetDS(aID: string): TDataSet;
var
  sSQL: string;
begin
  sSQL := 'select * from V_DN_RECV_DETAIL ' +
          ' where DN_RECV_ID = ' + QuotedStr(aID);

  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.DN_RCV_GetDSOverview(ATglAwal , ATglAkhir : TDateTime;
    AUnit : TModUnit = nil): TDataSet;
var
  sSQL: string;
begin
  sSQL := 'select * from V_DN_RECV ' +
          ' where DNR_DATE between ' + TDBUtils.QuotDt(StartOfTheDay(ATglAwal)) +
          ' and ' + TDBUtils.QuotDt(EndOfTheDay(ATglAkhir));

  if AUnit <> nil then
    sSQL := sSQL + ' and AUT$UNIT_ID = ' + QuotedStr(AUnit.ID);


  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.Document_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select DOC_NAME, REF$DOCUMENT_ID'
  +' from'
  +' REF$DOCUMENT';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.DODetail_LookupAdjFak(aDOID: string): TDataset;
var
  S: string;
begin
  S := 'SELECT A.DO_DETAIL_ID, A.BARANG_ID, A.REF$SATUAN_ID,'
    + ' C.BRG_CODE, C.BRG_NAME, D.SAT_CODE, A.DOD_QTY_ORDER_RECV, A.DOD_PRICE,'
    + ' A.DOD_TOTAL_DISC AS DISC,'
//    + ' CASE WHEN (A.DOD_QTY_ORDER_RECV <> 0)'
//    + ' 	THEN (A.DOD_TOTAL_DISC / A.DOD_QTY_ORDER_RECV) ELSE 0 END AS DISC,'
    + ' A.DOD_PPN_PERSEN, A.DOD_TOTAL'
    + ' FROM DO_DETAIL A'
    + ' INNER JOIN DO B ON A.DO_ID = B.DO_ID'
    + ' INNER JOIN BARANG C ON A.BARANG_ID = C.BARANG_ID'
    + ' LEFT JOIN REF$SATUAN D ON D.REF$SATUAN_ID = A.REF$SATUAN_ID'
    + ' WHERE A.DO_ID = ' + QuotedStr(aDOID);
  Result := TDBUtils.OpenQuery(s);
end;

function TDSProvider.DODetail_WithAdj(aDOID: string): TDataset;
var
  S: string;
begin
  S := 'SELECT * from FN_DETAIL_DO_ADJ(' + QuotedStr(aDOID) +')';
  Result := TDBUtils.OpenQuery(s);
end;

function TDSProvider.DO_GetDSLookUp: TDataSet;
var
  S: string;
begin
  S := 'SELECT * FROM V_DO';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.DO_GetDSOverview(ATglAwal , ATglAkhir : TDateTime;AUnitID,
    ASupMGCodeID : String): TDataSet;
var
  sSQL: string;
begin
  sSQL := 'SELECT * FROM V_DO' +
       ' where DO_DATE BETWEEN ' + TDBUtils.QuotDt(StartOfTheDay(ATglAwal)) +
       ' and ' + TDBUtils.QuotDt(EndOfTheDay(ATglAkhir));

  if AUnitID <> '' then
    sSQL := sSQL + ' and AUT$UNIT_ID = ' + QuotedStr(AUnitID);

  if ASupMGCodeID <> '' then
    sSQL := sSQL + ' and SUPLIER_MERCHAN_GRUP_ID = ' + QuotedStr(ASupMGCodeID);

  sSQL := sSQL + ' order by DO_DATE desc';

  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.FinalPayment_GetDSByBeginningBalance(ABeginningBalanceID:
    string): TDataSet;
var
  sSQL: string;
begin
  sSQL := 'SELECT * FROM V_FINALPAYMENT '
        + ' where BEGINNING_BALANCE_ID = ' + TDBUtils.Quot(ABeginningBalanceID);
  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.FinalPayment_GetDSOverview(aDate: TDatetime; aShiftName,
    AUnitID: string): TDataSet;
var
  sSQL: string;
begin
  sSQL := 'SELECT * FROM V_FINALPAYMENT '
        + ' where dbo.DateOnly(BALANCE_SHIFT_DATE) = ' + TDBUtils.QuotD(StartOfTheDay(aDate))
        + ' and AUT$UNIT_ID = ' + TDBUtils.Quot(AUnitID)
        + ' and SHIFT_NAME = ' + TDBUtils.Quot(aShiftName);
  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.GET_MEMBER_PAS_NO(ATPMEMBER: String): String;
var
  S: String;
begin
  S := 'SELECT DBO.FN_NOMEMBER (' + quotedSTR( ATPMEMBER ) + ')';
  Result := '';
  with TDBUtils.OpenQuery(S) DO
    Begin
      try
        Result := Fields[0].AsString;
      finally
        free;
      end;
    End;
end;

function TDSProvider.GroupRekening_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select REF$GRUP_REKENING_ID, GROREK_NAME, GROREK_DESCRIPTION from REF$GRUP_REKENING';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Gudang_GetDSLookUp: TDataSet;
var
  S: string;
begin
  S:= 'select GUDANG_ID, GUD_CODE , GUD_NAME'
      + ' from GUDANG'  ;
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Gudang_GetDSOverview: TDataSet;
var
  S: string;
begin
  S:= 'select GUDANG_ID, GUD_CODE as KODE, GUD_NAME as NAMA, GUD_ADDRESS as ALAMAT, GUD_TELP as TELEPON,'
      + ' GUD_FAX as FAX, GUD_CITY as KOTA, GUD_POST_CODE as [KODE POS], GUD_CONTACT_PERSON as KONTAK'
      + ' from GUDANG'  ;
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Jurnal_GetDSOverview(aStartDate, aEndDate: TDateTime):
    TDataSet;
var
  S: string;
begin
  S := 'SELECT * FROM JURNAL where cast (JUR_DATE as date) between '
      + TDBUtils.QuotDt(aStartDate) + ' and ' + TDBUtils.QuotDt(aEndDate);
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Kabupaten_GetDSLookUp: TDataSet;
var
  S: string;
begin
  S := 'select KAB_NAME as NAME,PROPINSI_ID, KABUPATEN_ID from KABUPATEN';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Kategori_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'Select A.KAT_NAME, A.KAT_CODE, B.SUBGRUP_NAME, A.REF$KATEGORI_ID, A.REF$SUB_GRUP_ID'
      +' from REF$KATEGORI A'
      +' INNER JOIN REF$SUB_GRUP B ON A.REF$SUB_GRUP_ID=B.REF$SUB_GRUP_ID'
      +' ORDER BY KAT_CODE';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Kompetitor_GetDSOverview: TDataSet;
var
  sSQL: string;
begin
  sSQL   := 'SELECT * FROM V_KOMPETITOR';
  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.KuponBotol_GetDSLookUp(aDate: TDatetime; AUnitID: string):
    TDataSet;
var
  sSQL: string;
begin
  sSQL := 'SELECT '
        + ' TKB_NO as NO_VOUCHER, TKB_DATE as TANGGAL, '
        + ' TKB_QTY as QTY, TKB_SELL_PRICE_DISC as TOTAL '
        + ' FROM TRANS_KUPON_BOTOL '
        + ' WHERE dbo.DateOnly(TKB_DATE) = ' + TDBUtils.QuotD(aDate)
        + ' AND AUT$UNIT_ID = ' + TDBUtils.Quot(AUnitID)
        + ' ORDER BY TKB_NO';
  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.Lokasi_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select REF$LOKASI_ID, LOK_NAME, LOK_CODE, LOK_DESCRIPTION,'
      +' LOK_RACK, LOK_BAY, LOK_SHELVE, LOK_POSITION, LOK_TYPE'
      +' from REF$LOKASI ORDER BY LOK_CODE';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.MataUang_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select REF$MATAUANG_ID, UANG_CODE, UANG_SYMBOL, UANG_NAME, UANG_SCALE'
  +' from'
  +' REF$MATAUANG';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.MemberActivasi_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select * from MEMBER_ACTIVASI';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.MemberKeluarga_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select * from MEMBER_KELUARGA';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Member_GetDSLookUp: TDataSet;
var
  S: string;
begin
  S := 'select MEMBER_ID, MEMBER_CARD_NO AS NOMOR_KARTU, '
    + ' MEMBER_KTP_NO AS NO_IDENTITAS, MEMBER_NAME AS NAMA, MEMBER_ADDRESS'
    +' FROM MEMBER ';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Member_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select A.MEMBER_ID, A.MEMBER_CARD_NO AS NOMOR_KARTU, A.MEMBER_POIN, A.MEMBER_KTP_NO AS NO_IDENTITAS, A.MEMBER_NAME AS NAMA, '
    +' A.MEMBER_ADDRESS+'', ''+A.MEMBER_KELURAHAN+'', ''+A.MEMBER_KECAMATAN AS ALAMAT, A.MEMBER_KOTA AS KOTA,'
    +' A.MEMBER_POST_CODE AS POST_CODE, A.MEMBER_TELP, '
    +' A.MEMBER_PLACE_OF_BIRTH AS TEMPAT_LAHIR, A.MEMBER_DATE_OF_BIRTH AS TANGGAL_LAHIR,'
    +' B.AGAMA_NAME AS AGAMA,'
    +' CASE WHEN A.MEMBER_SEX = 0 THEN ''L'' ELSE ''P'' END AS JK, '
    +' CASE WHEN A.IS_TRADER = 0 THEN ''END USER'' ELSE ''TRADER'' END AS KELOMPOK,'
    +' F.TPMEMBER_NAME AS TIPE_MEMBER, '
    +' CASE WHEN F.IS_POIN = 0 THEN ''TIDAK DAPAT'' ELSE ''DAPAT'' END AS POIN,'
    +' CASE WHEN F.IS_UNDIAN = 0 THEN ''TIDAK DAPAT'' ELSE ''DAPAT'' END AS UNDIAN,'
    +' A.REF$GRUP_MEMBER_ID, A.REF$DISC_MEMBER_ID, A.MEMBER_ACTIVASI_ID, A.MEMBER_KELUARGA_ID'
    +' FROM MEMBER A'
    +' LEFT JOIN REF$TIPE_MEMBER F ON A.REF$TIPE_MEMBER_ID = F.REF$TIPE_MEMBER_ID'
    +' LEFT JOIN REF$AGAMA B ON A.REF$AGAMA_id = B.REF$AGAMA_ID';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.MerchandiseGroup_GetDSLookup: TDataSet;
var
  S: string;
begin
   S := 'select A.REF$MERCHANDISE_ID, A.REF$MERCHANDISE_GRUP_ID,'
      +' A.MERCHANGRUP_CODE, A.MERCHANGRUP_NAME, B.MERCHAN_NAME'
      +' from REF$MERCHANDISE_GRUP A'
      +' INNER JOIN REF$MERCHANDISE B ON A.REF$MERCHANDISE_ID = B.REF$MERCHANDISE_ID';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Merchandise_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select MERCHAN_NAME, MERCHAN_CODE, REF$MERCHANDISE_ID'
      +' FROM REF$MERCHANDISE ORDER BY MERCHAN_CODE';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Merchandise_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select MERCHAN_CODE, MERCHAN_NAME, REF$MERCHANDISE_ID'
      +' FROM REF$MERCHANDISE ORDER BY MERCHAN_CODE';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Merk_GetDSLookUp: TDataSet;
var
  S: string;
begin
  S := 'select Merk_Name,Merk_Description, Merk_ID from Merk';
//  if Test <> nil then
//    Test.fields[0].AsString;
  Result := TDBUtils.OpenQuery(S);
//  Test := Result;
end;

function TDSProvider.Organization_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select * from V_ORGANIZATION';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Organization_Lookup(OrgType: Integer): TDataSet;
var
  S: string;
begin
  S := 'SELECT * FROM V_ORGANIZATION ';

  case OrgType of
    1 : S := S + 'where ORG_IsSupplierMG = 1';
    2 : S := S + 'where ORG_IsMember = 1';
    3 : S := S + 'where ORG_IsKaryawan = 1';
  end;

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Outlet_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select OUTLET_NAME, OUTLET_CODE, OUTLET_DESCRIPTION, REF$OUTLET_ID'
      +' from REF$OUTLET';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.PORevisi_GetDSOverview(ID: string): TDataset;
var
  sSQL: string;
begin
  sSQL := 'select* from PO_DETAIL where PO_ID = ' + TDBUtils.Quot(ID);
  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.POTrader_GetDSOverview(APeriodeAwal, APeriodeAkhir:
    TDatetime): TDataSet;
var
  sSQL: string;
begin
  sSQL := 'select * from V_POTRADER '
    + ' where POT_DATE between ' + TDBUtils.QuotDt(APeriodeAwal)
    + ' and ' + TDBUtils.QuotDt(APeriodeAkhir)
    + ' order by POT_DATE desc, POT_NO desc';

  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.PO_DSLookUpDetail(ANOPO : String): TDataSet;
var
  sSQL: string;
begin
  sSQL := ' select * from V_PO_DETIL_LOOKUP' +
          ' where po_no = ' + QuotedStr(ANOPO);

  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.PO_GetDSByPeriod(APeriodeAwal, APeriodeAkhir: TDatetime):
    TDataset;
var
  sSQL: string;
begin
  sSQL := 'select * from V_POBTB '
    + ' where PO_Date between ' + TDBUtils.QuotDt(APeriodeAwal)
    + ' and ' + TDBUtils.QuotDt(APeriodeAkhir);

  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.PO_GetDSOLookUp(AUnitID : String): TDataset;
var
  sSQL: string;
begin
  sSQL := 'select * from V_PO ' +
          ' where 1 = 1';

  if AUnitID <> '' then
    sSQL := sSQL + ' and AUT$UNIT_ID = ' + QuotedStr(AUnitID);

  sSQL :=sSQL + ' order by PO_NO';


  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.PO_GetDSOLookUpForAdj(aStartDate, aEndDate: TDatetime;
    aSuplierMerchanID: String): TDataset;
var
  sSQL: string;
begin
  sSQL := 'SELECT * FROM V_PO_FOR_ADJ WHERE PO_DATE BETWEEN '
        + TDBUtils.QuotD(aStartDate) + ' and ' + TDBUtils.QuotD(aEndDate);

  if aSuplierMerchanID <> '' then
    sSQL := sSQL + ' AND SUPLIER_MERCHAN_GRUP_ID = ' + QuotedStr(aSuplierMerchanID);

  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.PO_GetDSOLookUpForGR(AUnitID : String): TDataset;
var
  sSQL: string;
begin
  sSQL := 'select * from V_PO_FOR_GR ' +
          ' where 1 = 1';

  if AUnitID <> '' then
    sSQL := sSQL + ' and AUT$UNIT_ID = ' + QuotedStr(AUnitID);

  sSQL := sSQL + ' order by PO_NO';


  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.PO_GetDSOverview(ATglAwal , ATglAkhir : TDateTime;
    AkodeSupplierMGAwal, AKodeSupplierMGAkhir : String; AStatusPOID : String;
    AUnit : TModUnit = nil): TDataset;
var
  sSQL: string;
begin
  sSQL := 'SELECT * from V_PO ' +
          ' WHERE PO_DATE BETWEEN ' + TDBUtils.QuotDt(StartOfTheDay(ATglAwal)) +
          ' AND ' + TDBUtils.QuotDt(EndOfTheDay(ATglAkhir));

  if AUnit <> nil then
    sSQL := sSQL + ' and AUT$UNIT_ID = ' + QuotedStr(AUnit.ID);

  if (Trim(AkodeSupplierMGAwal) <> 'xyz') and (Trim(AkodeSupplierMGAkhir) <> 'xyz') then
    sSQL := sSQL + ' and KODE_SUPPLIER_MERCHANDISE_GROUP BETWEEN ' + QuotedStr(AkodeSupplierMGAwal)
            + ' AND ' + QuotedStr(AKodeSupplierMGAkhir);

  if (Trim(AStatusPOID) <> 'xyz') then
    sSQL := sSQL + ' AND REF$STATUS_PO_ID = ' + QuotedStr(AStatusPOID);

  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.PO_GetDSOverviewDetil(ATglAwal , ATglAkhir : TDateTime;
    AUnit : TModUnit = nil): TDataset;
var
  sSQL: string;
begin
  sSQL := 'select * from V_PO_DETIL ' +
          ' where PO_DATE between ' + TDBUtils.QuotDt(StartOfTheDay(ATglAwal)) +
          ' and ' + TDBUtils.QuotDt(EndOfTheDay(ATglAkhir));

  if AUnit <> nil then
    sSQL := sSQL + ' and AUT$UNIT_ID = ' + QuotedStr(AUnit.ID);

  sSQL := sSQL + ' ORDER BY PO_ID';

  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.PO_SKULookUP(APONO : String): TDataSet;
begin
  Result := nil;
end;

function TDSProvider.PO_SLIP_GetDSOverview(ATglAwal , ATglAkhir : TDateTime;
    AUnit : TModUnit = nil): TDataSet;
var
  sSQL: string;
begin
  sSQL := 'select * from V_PO_SLIP ' +
          ' where PO_DATE between ' + TDBUtils.QuotDt(StartOfTheDay(ATglAwal)) +
          ' and ' + TDBUtils.QuotDt(EndOfTheDay(ATglAkhir));

  if AUnit <> nil then
    sSQL := sSQL + ' and AUT$UNIT_ID = ' + QuotedStr(AUnit.ID);


  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.Propinsi_GetDSLookUp: TDataSet;
var
  S: string;
begin
  S := 'select PROP_NAME as NAME, PROPINSI_ID from PROPINSI';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Quotation_GetDSOverview(aStartDate, aEndDate: TDatetime):
    TDataSet;
var
  S: string;
begin
  S := 'SELECT A.QUOTATION_ID, A.REFNO, A.EFFECTIVEDATE, A.ENDDATE, A.ISMAILER,'
      +' B.MERCHAN_NAME, C.SUPMG_NAME, A.ISPROCESSED'
      +' FROM QUOTATION A'
      +' INNER JOIN REF$MERCHANDISE B ON A.MERCHANDISE_ID=B.REF$MERCHANDISE_ID'
      +' INNER JOIN SUPLIER_MERCHAN_GRUP C ON A.SUPLIER_MERCHAN_GRUP_ID=C.SUPLIER_MERCHAN_GRUP_ID'
      +' WHERE (A.EFFECTIVEDATE BETWEEN ' + TDBUtils.QuotD(aStartDate)
      +' and '+ TDBUtils.QuotD(aEndDate) +')';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.RefCreditCard_GetDSOverview: TDataSet;
var
  sSQL: string;
begin
  sSQL   := 'SELECT * FROM V_CREDIT$CARD';
  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.RefDiscMember_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select * from REF$DISC_MEMBER';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.RefGrupMember_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select * from REF$GRUP_MEMBER';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.RefPajak_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'Select PJK_NAME, PJK_CODE, Ref$Pajak_ID FROM REF$PAJAK';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.RefPajak_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'SELECT * from REF$PAJAK';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.RefTipeBarang_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'Select TPBRG_NAME, TPBRG_CODE, REF$TIPE_BARANG_ID FROM REF$TIPE_BARANG';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.RefTipeBarang_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'SELECT TPBRG_CODE, TPBRG_NAME, REF$TIPE_BARANG_ID from REF$TIPE_BARANG';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.RefTipeMember_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'SELECT REF$TIPE_MEMBER_ID, TPMEMBER_NAME from REF$TIPE_MEMBER';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.RefTipeMember_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'SELECT * from REF$TIPE_MEMBER';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.RefWilayah_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'Select * FROM REF$WILAYAH';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.RekeningBCOLain_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select * from V_REKENING_BCO_LAINLAIN';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Rekening_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select REKENING_ID, REK_CODE, REK_NAME, REK_DESCRIPTION, REF$GRUP_REKENING_ID from REKENING';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Rekening_GetDSLookupFilter(AFilterRekeningSettingApp :
    String): TDataSet;
var
  S: string;
  sFilter: string;
begin
  sFilter := ' where 1 = 1 and REK_CODE in (''';
  if Trim(AFilterRekeningSettingApp) <> '' then
  begin
    sFilter := sFilter + AFilterRekeningSettingApp;
    sFilter := StringReplace(sFilter, ';', ',', [rfReplaceAll]);
    sFilter := StringReplace(sFilter, ',', QuotedStr(',') , [rfReplaceAll]);
  end;

  sFilter := sFilter + ''')';

  S := 'select REKENING_ID, REK_CODE, REK_NAME, REK_DESCRIPTION,' +
       ' REF$GRUP_REKENING_ID from REKENING' +
       sFilter +
       ' order by REK_CODE';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Rekening_GetDSLookupLvl: TDataSet;
var
  S: string;
begin
  S := 'select REKENING_ID, REK_CODE, REK_NAME, REK_LEVEL, REK_DESCRIPTION, REF$GRUP_REKENING_ID from REKENING ';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Rekening_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select REKENING_ID, (REK_CODE + '' - ''+ REK_NAME) as REKENING, REK_CODE, REK_NAME, REK_DESCRIPTION, REKENING_PARENT_ID, REF$GRUP_REKENING_ID from REKENING ORDER BY REK_CODE ASC';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.ResetCashier_GetDSOverview(aDate: TDatetime; aShiftName,
    AUnitID: string): TDataSet;
var
  sSQL: string;
begin
  sSQL := 'SELECT * FROM V_RESETCASHIER '
        + ' where dbo.DateOnly(BALANCE_SHIFT_DATE) = ' + TDBUtils.QuotD(StartOfTheDay(aDate))
        + ' and AUT$UNIT_ID = ' + TDBUtils.Quot(AUnitID)
        + ' and SHIFT_NAME = ' + TDBUtils.Quot(aShiftName);
  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.Satuan_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select sat_name, sat_code, sat_group, ref$satuan_id' +
       ' from ref$satuan' +
       ' ORDER by sat_code';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Satuan_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select sat_code, sat_name,sat_group, ref$satuan_id' +
       ' from ref$satuan' +
       ' ORDER by sat_code';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.SetupPOS_GetDSLookUp(aDate: TDatetime; AUnitID: string):
    TDataSet;
var
  sSQL: string;
begin
  sSQL := 'SELECT SETUPPOS_ID, SETUPPOS_TERMINAL_CODE AS POS_CODE '
        + ' FROM SETUPPOS '
        + ' WHERE dbo.DateOnly(SETUPPOS_DATE) = ' + TDBUtils.QuotD(aDate)
        + ' AND SETUPPOS_IS_ACTIVE = 1 '
        + ' AND AUT$UNIT_ID = ' + TDBUtils.Quot(AUnitID)
        + ' ORDER BY SETUPPOS_TERMINAL_CODE';
  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.SetupPOS_GetDSOverview(aDate: TDatetime; AUnitID: string):
    TDataSet;
var
  sSQL: string;
begin
  sSQL  := 'SELECT * FROM V_SETUPPOS WHERE dbo.DateOnly(SETUPPOS_DATE) '
        + ' = ' + TDBUtils.QuotD(aDate)
        + ' AND AUT$UNIT_ID = ' + TDBUtils.Quot(AUnitID);
  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.Shift_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select *'
  +' from'
  +' SHIFT';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.SO_GetDSOLookUp(AUnit : TModUnit = nil): TDataSet;
var
  sSQL: string;
begin
  sSQL := 'select distinct SO_ID,SO_NO, SO_DATE from SO where 1 = 1 ' ;

  if AUnit <> nil then
    sSQL := sSQL + ' and AUT$UNIT_ID = ' + QuotedStr(AUnit.ID);


  sSQL := sSQL + ' order by SO_NO';
  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.SO_GetDSOLookUpGeneratePO(AUnit : TModUnit = nil):
    TDataSet;
var
  sSQL: string;
begin
  sSQL := 'select distinct SO_ID,SO_NO, SO_DATE from V_SO_FOR_GENERATE_PO where 1 = 1 ' ;

  if AUnit <> nil then
    sSQL := sSQL + ' and AUT$UNIT_ID = ' + QuotedStr(AUnit.ID);


  sSQL := sSQL + ' order by SO_NO';
  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.SO_GetDSOverview(ATglAwal , ATglAkhir : TDateTime; AUnit :
    TModUnit = nil): TDataSet;
var
  sSQL: string;
begin
  sSQL := 'select * from V_SO ' +
          ' where SO_DATE between ' + TDBUtils.QuotDt(StartOfTheDay(ATglAwal)) +
          ' and ' + TDBUtils.QuotDt(EndOfTheDay(ATglAkhir));

  if AUnit <> nil then
    sSQL := sSQL + ' and AUT$UNIT_ID = ' + QuotedStr(AUnit.ID);


  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.StatusPO_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select ref$status_po_id, STAPO_NAME, STAPO_CODE' +
       ' from V_STATUSPO ' +
       ' ORDER BY URUTAN ';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.SubGroup_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'SELECT A.SUBGRUP_NAME, A.SUBGRUP_CODE, B.MERCHANGRUP_NAME,'
      +' A.REF$SUB_GRUP_ID , A.REF$MERCHANDISE_GRUP_ID'
      +' FROM REF$SUB_GRUP A'
      +' INNER JOIN REF$MERCHANDISE_GRUP B'
      +' ON A.REF$MERCHANDISE_GRUP_ID = B.REF$MERCHANDISE_GRUP_ID';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.SubGroup_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'SELECT A.SUBGRUP_CODE, A.SUBGRUP_NAME, B.MERCHANGRUP_NAME,'
      +' A.REF$SUB_GRUP_ID , A.REF$MERCHANDISE_GRUP_ID'
      +' FROM REF$SUB_GRUP A'
      +' INNER JOIN REF$MERCHANDISE_GRUP B'
      +' ON A.REF$MERCHANDISE_GRUP_ID = B.REF$MERCHANDISE_GRUP_ID';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.SuplierGroup_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select GROUP_CODE, GROUP_NAME, GROUP_DESCRIPTION, SUPLIER_GROUP_ID'
  +' from SUPLIER_GROUP';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.SuplierGroup_GetDSOverview1: TDataSet;
var
  S: string;
begin
  S := 'select GROUP_CODE,GROUP_NAME, GROUP_DESCRIPTION, SUPLIER_GROUP_ID'
  +' from SUPLIER_GROUP';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.SuplierMerchan_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select * from V_SUPPLIER_MERCHANDISE_GROUP ORDER BY SUPMG_SUB_CODE';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Suplier_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'SELECT SUPLIER_ID, SUP_NAME, SUP_CODE, SUP_ADDRESS FROM SUPLIER'
      +' WHERE SUP_IS_ACTIVE=1';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Suplier_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select SUPLIER_ID, SUP_CODE, SUP_NAME, SUP_CITY, SUP_TELP, SUP_FAX'
  +' from'
  +' SUPLIER';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.SupMGByOutstandingSO_GetDSLookup(ID: string): TDataset;
var
  sSQL: string;
begin
  sSQL := 'SELECT DISTINCT SO_ID,SUPLIER_MERCHAN_GRUP_ID,SUPMG_SUB_CODE,SUPMG_NAME'
         +' FROM V_SO_FOR_GENERATE_PO WHERE SO_ID = ' + TDBUtils.Quot(ID);
  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.TipeBonus_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select REF$TIPE_BONUS_ID, TPBNS_CODE, TPBNS_NAME'
  +' from'
  +' REF$TIPE_BONUS';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.TipeCN_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select REF$TIPE_CN_ID, TPCN_CODE, TPCN_NAME'
  +' from'
  +' REF$TIPE_CN';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.TipeHarga_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select REF$TIPE_HARGA_ID, TPHRG_NAME ,TPHRG_MARKUP, TPHRG_IS_CALC from Ref$Tipe_harga';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.TipeKirimPO_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select TPKRMPO_CODE, TPKRMPO_NAME, REF$TIPE_KIRIM_PO_ID'
      +' from REF$TIPE_KIRIM_PO';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.TipePembayaran_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select REF$TIPE_PEMBAYARAN_ID, TPBYR_CODE, TPBYR_NAME from REF$TIPE_PEMBAYARAN';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.TipePerusahaan_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select TPPERSH_CODE, TPPERSH_NAME, REF$TIPE_PERUSAHAAN_ID'
        +' from REF$TIPE_PERUSAHAAN';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.TipePerusahaan_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select TPPERSH_CODE, TPPERSH_NAME, REF$TIPE_PERUSAHAAN_ID'
        +' from REF$TIPE_PERUSAHAAN';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.TipePO_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select TPPO_CODE, TPPO_NAME, REF$TIPE_PO_ID'
  +' from'
  +' REF$TIPE_PO';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.TipeSuplier_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select TPSUP_CODE, TPSUP_NAME, REF$TIPE_SUPLIER_ID from REF$TIPE_SUPLIER';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.TipeSuplier_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select TPSUP_CODE, TPSUP_NAME, REF$TIPE_SUPLIER_ID from REF$TIPE_SUPLIER';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.UnitType_GetDSLookUp: TDataSet;
var
  S: string;
begin
  S := 'SELECT TYPE_NAME, TYPE_DESC, UNIT_TYPE_ID from UNIT_TYPE';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.UnitType_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'SELECT TYPE_NAME, TYPE_DESC, UNIT_TYPE_ID from UNIT_TYPE';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Unit_GetDSLookUp: TDataSet;
var
  S: string;
begin
  S := 'SELECT UNT_NAME, UNT_CODE, AUT$UNIT_ID FROM AUT$UNIT';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Unit_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'SELECT * FROM V_AUT$UNIT';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.DOTrader_GetDSOverview(APeriodeAwal, APeriodeAkhir:
    TDatetime): TDataSet;
var
  S: string;
begin
  S := 'SELECT * FROM V_DOTRADER' +
       ' where DOT_DATE between ' + TDBUtils.QuotDt(StartOfTheDay(APeriodeAwal)) +
       ' and ' + TDBUtils.QuotDt(EndOfTheDay(APeriodeAkhir));

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Organization_Trader_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select * from V_ORGANIZATION ' +
       ' where ORG_IsMember = 1';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.TipePembayaran_GetDSLookUp: TDataSet;
var
  S: string;
begin
  S := 'select REF$TIPE_PEMBAYARAN_ID, TPBYR_CODE, TPBYR_NAME from REF$TIPE_PEMBAYARAN';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSReport.BankCashOut_GetDS_Slip(APeriodeAwal, APeriodeAkhir:
    TDatetime; ANoBukti : String): TFDJSONDataSets;
var
  sSQL: string;
begin
  Result := TFDJSONDataSets.Create;

  sSQL := 'select * from V_BANKCASHOUT_SLIP '
    + ' where BCO_Tanggal between ' + TDBUtils.QuotDt(StartOfTheDay(APeriodeAwal))
    + ' and ' + TDBUtils.QuotDt(EndOfTheDay(APeriodeAkhir));

  if Trim(ANoBukti) <> '' then
    sSQL := sSQL + ' and bco_nobukti = ' + QuotedStr(ANoBukti);

  sSQL := sSQL + ' order by bco_nobukti';

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(sSQL));

  sSQL := 'select * from V_BANKCASHOUT_SLIP_APDANOTHER '
    + ' where BCO_Tanggal between ' + TDBUtils.QuotDt(StartOfTheDay(APeriodeAwal))
    + ' and ' + TDBUtils.QuotDt(EndOfTheDay(APeriodeAkhir));

  if Trim(ANoBukti) <> '' then
    sSQL := sSQL + ' and bco_nobukti = ' + QuotedStr(ANoBukti);

  sSQL := sSQL + ' order by bco_nobukti';

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(sSQL));

  sSQL := 'select * from V_BANKCASHOUT_SLIP_CHEQUE '
    + ' where BCO_Tanggal between ' + TDBUtils.QuotDt(StartOfTheDay(APeriodeAwal))
    + ' and ' + TDBUtils.QuotDt(EndOfTheDay(APeriodeAkhir));

  if Trim(ANoBukti) <> '' then
    sSQL := sSQL + ' and bco_nobukti = ' + QuotedStr(ANoBukti);

  sSQL := sSQL + ' order by bco_nobukti';

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(sSQL));
end;

function TDSReport.Claim_by_Id(id: string): TFDJSONDataSets;
var
  S: string;
begin
  Result := TFDJSONDataSets.Create;

  S := 'SELECT *'
  + ' from CLAIMFAKTUR A'
  + ' INNER JOIN V_ORGANIZATION B ON A.CLM_ORGANIZATION_ID = B.V_ORGANIZATION_ID'
  + ' where CLAIMFAKTUR_ID='+ QuotedStr(id);

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(S));

  S := 'SELECT B.DO_NO, B.DO_NO AS DO_NP, B.DO_DATE, B.DO_TOTAL FROM CLAIMFAKTURITEMDO A'
  + ' INNER JOIN DO B on A.CLMD_DO_ID = B.DO_ID'
  + ' WHERE CLMD_DO_CLAIMFAKTUR_ID ='+ QuotedStr(id)
  + ' UNION ALL'
  + ' SELECT B.CNR_NO, B.CNR_NO, B.CNR_DATE, B.CNR_TOTAL  * -1'
  + ' FROM CLAIMFAKTURITEMCN A'
  + ' INNER JOIN CN_RECV B ON A.CLMD_CN_CNRECV_ID = B.CN_RECV_ID'
  + ' WHERE CLMD_CN_CLAIMFAKTUR_ID ='+ QuotedStr(id)
  + ' UNION ALL'
  + ' SELECT B.DNR_NO, B.DNR_NO, B.DNR_DATE, B.DNR_TOTAL'
  + ' FROM CLAIMFAKTURITEMDN A'
  + ' INNER JOIN DN_RECV B ON A.CLMD_DN_DNRECV_ID = B.DN_RECV_ID'
  + ' WHERE CLMD_DN_CLAIMFAKTUR_ID ='+ QuotedStr(id)
  + ' UNION ALL'
  + ' SELECT ''CONTRABON'', ''CONTRABON'', B.CONT_DATE_SALES, B.CONT_NET_SALES'
  + ' FROM CLAIMFAKTURITEMCS A'
  + ' INNER JOIN CONTRABON_SALES B ON A.CLMD_CS_CONTRABON_ID = B.CONTRABON_SALES_ID'
  + ' WHERE CLMD_CS_CLAIMFAKTUR_ID ='+ QuotedStr(id);




  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(S));

end;

function TDSReport.DO_GetDSNP(ANONP : String): TFDJSONDataSets;
var
  S: string;
begin
  Result := TFDJSONDataSets.Create;

  S := 'SELECT * FROM V_DO_NP where DO_NP = ' + QuotedStr(ANONP);

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(S));
end;

function TDSReport.DO_GetDS_CheckList(ANONP: String): TFDJSONDataSets;
var
  s : string;
begin
  Result := TFDJSONDataSets.Create;

  S := 'SELECT * FROM V_CHECKLIST_DO where DO_NP = ' + QuotedStr(ANONP);

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(S));
end;

function TDSReport.DSA_GetDS(aStartDate, aEndDate: TDatetime; aGroupField:
    string): TDataSet;
var
  S: string;
begin
  S := 'SELECT ' + aGroupField + ' AS GROUPNAME, '
      + ' SUM(LastSales) AS LastSales, '
      + ' SUM(LastSalesProcent) AS LastSalesProcent, '
      + ' SUM(LastProfit) AS LastProfit, '
      + ' SUM(LastProfitProcent) AS LastProfitProcent, '
      + ' SUM(AllSales) AS AllSales, '
      + ' SUM(AllSalesProcent) AS AllSalesProcent, '
      + ' SUM(AllProfit) AS AllProfit, '
      + ' SUM(AllProfitProcent) AS AllProfitProcent '
      + ' FROM FN_DAILY_SALES_ANALYSIS('+ TDBUtils.QuotD(aStartDate)
      + ' ,' + TDBUtils.QuotD(aEndDate) + ') '
      + ' GROUP BY ' + aGroupField;

  Result := TDBUtils.OpenQuery(S);
end;

function TDSReport.DSA_GetDSPrint(aStartDate, aEndDate: TDatetime; aGroupField:
    string): TFDJSONDataSets;
var
  S: string;
begin
  Result := TFDJSONDataSets.Create;

  S := 'SELECT ' + aGroupField + ' AS GROUPNAME, '
    + ' SUM(LastSales) AS LastSales, '
    + ' SUM(LastSalesProcent) AS LastSalesProcent, '
    + ' SUM(LastProfit) AS LastProfit, '
    + ' SUM(LastProfitProcent) AS LastProfitProcent, '
    + ' SUM(AllSales) AS AllSales, '
    + ' SUM(AllSalesProcent) AS AllSalesProcent, '
    + ' SUM(AllProfit) AS AllProfit, '
    + ' SUM(AllProfitProcent) AS AllProfitProcent '
    + ' FROM FN_DAILY_SALES_ANALYSIS('+ TDBUtils.QuotD(aStartDate)
    + ' ,' + TDBUtils.QuotD(aEndDate) + ') '
    + ' GROUP BY ' + aGroupField;

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(S));
end;

function TDSReport.DSR_GetDS(aStartDate, aEndDate: TDatetime): TFDJSONDataSets;
var
  S: string;
begin
  Result := TFDJSONDataSets.Create;

  S := 'SELECT * '
      +' FROM FN_DAILY_SALES_REPORT('+ TDBUtils.QuotD(aStartDate)
      +' ,' + TDBUtils.QuotD(aEndDate) + ') ';

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(S));
end;

function TDSReport.KuponBotol_GetDS_Slip(ANomor: string): TFDJSONDataSets;
var
  S: string;
begin
  Result := TFDJSONDataSets.Create;

  S := 'SELECT * FROM V_KUPONBOTOL_SLIP '
     + ' WHERE TKB_NO = ' + TDBUtils.Quot(ANomor);

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(S));
end;

function TDSReport.HistoryAP(ANoAP : String): TFDJSONDataSets;
var
  sSQL: string;
begin
  Result := TFDJSONDataSets.Create;

  sSQL   := 'select * from V_AP' +
            ' where ap_refnum = ' + QuotedStr(ANoAP);

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(sSQL));

  sSQL   := 'select * from V_AP_SETTLEMEN ' +
            ' where NO_AP = ' + QuotedStr(ANoAP) +
            ' order by tanggal';

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(sSQL));
end;

function TDSReport.InvMovement_GetDS(aStartDate, aEndDate: TDatetime;
    aGroup_ID, aSupplier_ID, aGudang_ID: String): TDataSet;
var
  S: string;
begin
  S := 'SELECT B.BRG_CODE, B.BRG_NAME, A.GUD_NAME, A.SAT_CODE,'
      +' A.SALDOAWAL, A.DO, A.CN_RECEIVING, A.DN_RECEIVING, A.POS, A.TAG_KIRIM, A.TAG_TERIMA,'
      +' A.TAC_KIRIM, A.TAC_TERIMA, A.SALDOAKHIR'
      +' FROM FN_INVENTORY_MOVEMENT('+ TDBUtils.QuotD(aStartDate)
      +' ,' + TDBUtils.QuotD(aEndDate) + ') A'
      +' INNER JOIN BARANG B ON A.BARANG_ID=B.BARANG_ID'
      +' INNER JOIN REF$MERCHANDISE_GRUP C ON C.REF$MERCHANDISE_GRUP_ID=B.REF$MERCHANDISE_GRUP_ID'
      +' INNER JOIN REF$MERCHANDISE D ON D.REF$MERCHANDISE_ID=C.REF$MERCHANDISE_ID';

  if aSupplier_ID <> '' then
    S := S +' INNER JOIN ('
        +' 	SELECT X.BARANG_ID FROM BARANG_SUPLIER X'
        +' 	INNER JOIN SUPLIER_MERCHAN_GRUP Y ON X.SUPLIER_MERCHAN_GRUP_ID = Y.SUPLIER_MERCHAN_GRUP_ID'
        +' 	INNER JOIN SUPLIER Z ON Z.SUPLIER_ID = Y.SUPLIER_ID WHERE Z.SUPLIER_ID = '
        + QuotedStr(aSupplier_ID)
        +' ) S ON S.BARANG_ID = A.BARANG_ID';

  S := S + ' where 1 = 1';

  if aGroup_ID <> '' then
    S := S + ' AND C.REF$MERCHANDISE_GRUP_ID = ' + QuotedStr(aGroup_ID);
  if aGudang_ID <> '' then
    S := S + ' AND A.GUDANG_ID = ' + QuotedStr(aGudang_ID);

  Result := TDBUtils.OpenQuery(S);
end;

function TDSReport.KartuAP(AOrgID : String; APeriodeAwal : TDateTime;
    APeriodeAkhir : TDateTime): TFDJSONDataSets;
var
  sSQL: string;
begin
  Result := TFDJSONDataSets.Create;

  sSQL   := 'select * from FN_KARTU_AP (' + QuotedStr(AOrgID) + ', ' + TDBUtils.QuotDt(StartOfTheDay(APeriodeAwal)) + ',' + TDBUtils.QuotDt(EndOfTheDay(APeriodeAkhir)) + ') order by tanggal';
  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(sSQL));

end;

function TDSReport.KartuStock_GetDS(aBarang_ID: String; aStartDate, aEndDate:
    TDatetime; aGudang_ID: string): TDataSet;
var
  S: string;
begin
  S := 'SELECT B.BARANG_ID, B.BRG_CODE, B.BRG_NAME,'
      +' A.ID, A.TGLBUKTI, A.TRANSAKSI, A.NOBUKTI,  A.QTYIN, A.QTYOUT, A.KONVERSI'
      +' FROM FN_KARTU_STOCK(' + QuotedStr(aBarang_ID) + ','
      + TDBUtils.QuotD(aStartDate) + ',' + TDBUtils.QuotD(aEndDate)
      +') a INNER JOIN BARANG B ON A.BARANG_ID = B.BARANG_ID';

  if aGudang_ID <> '' then
    S := S + ' WHERE A.GUDANG_ID = ' + QuotedStr(aGudang_ID);

  Result := TDBUtils.OpenQuery(S);
end;

function TDSReport.PO_SLIP_ByDateNoBukti(StartDate, EndDate: TDateTime;
    aNoBuktiAwal: string = ''; aNoBuktiAkhir: string = ''): TFDJSONDataSets;
var
  S: string;
begin
  Result := TFDJSONDataSets.Create;

  S := 'SELECT * FROM V_PO_SLIP WHERE PO_DATE BETWEEN '
      + TDBUtils.QuotDShort(StartDate) + ' and ' + TDBUtils.QuotDShort(EndDate);

  if aNoBuktiAwal <> '' then
    S := S + ' AND PO_NO between ' + QuotedStr(aNoBuktiAwal) + ' and '
        + QuotedStr(aNoBuktiAkhir);

  S := S + ' order by PO_NO';

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(S));

end;

function TDSReport.SO_ByDate(StartDate, EndDate: TDateTime): TFDJSONDataSets;
var
  S: string;
begin
  Result := TFDJSONDataSets.Create;

  S := 'SELECT * FROM V_SO_REPORT WHERE SO_DATE BETWEEN '
  + TDBUtils.QuotDt(StartDate) + ' and ' + TDBUtils.QuotDt(EndDate);
  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(S));

  S := 'SELECT * FROM SUPLIER';
  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(S));
end;

function TDSReport.SO_ByDateNoBukti(StartDate, EndDate: TDateTime;
    aNoBuktiAwal: string = ''; aNoBuktiAkhir: string = ''): TFDJSONDataSets;
var
  S: string;
begin
  Result := TFDJSONDataSets.Create;

  S := 'SELECT * FROM V_SO_REPORT WHERE SO_DATE BETWEEN '
      + TDBUtils.QuotDt(StartDate) + ' and ' + TDBUtils.QuotDt(EndDate);

  if aNoBuktiAwal <> '' then
    S := S + ' AND SO_NO between ' + QuotedStr(aNoBuktiAwal) + ' and '
        + QuotedStr(aNoBuktiAkhir);

  S := S + ' order by so_no, sup_code';

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(S));

end;

function TDSReport.SO_Test: TFDJSONDataSets;
var
  S: string;
begin
  Result := TFDJSONDataSets.Create;

//  S := 'SELECT * FROM V_SO_REPORT';
//  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenMemTable(S));

  S := 'SELECT 1 AS CONTOH';
  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(S));
end;

function TDSReport.StockProduct_GetDS(aEndDate: TDatetime; aGroup_ID,
    aSupplier_ID, aGudang_ID: String): TDataSet;
var
  S: string;
begin
  S := 'select B.BRG_CODE, B.BRG_NAME, E.MERK_NAME, D.MERCHAN_NAME,C.MERCHANGRUP_NAME,'
      +' SUM((A.QTYIN-A.QTYOUT)*A.KONVERSI) * G.KONVSAT_SCALE AS STOCK,  F.SAT_CODE '
      +' from FN_MUTASI_STOCK(''2017-01-01'',' + TDBUtils.QuotD(aEndDate) + ') A'
      +' inner join BARANG B ON A.BARANG_ID=B.BARANG_ID'
      +' INNER JOIN REF$MERCHANDISE_GRUP C ON B.REF$MERCHANDISE_GRUP_ID = C.REF$MERCHANDISE_GRUP_ID'
      +' INNER JOIN REF$MERCHANDISE D ON D.REF$MERCHANDISE_ID = C.REF$MERCHANDISE_ID'
      +' INNER JOIN MERK E ON E.MERK_ID=B.MERK_ID'
      +' INNER JOIN REF$SATUAN F ON F.REF$SATUAN_ID=B.REF$SATUAN_STOCK'
      +' INNER JOIN REF$KONVERSI_SATUAN G ON G.BARANG_ID = B.BARANG_ID AND G.REF$SATUAN_ID=F.REF$SATUAN_ID';

  if aSupplier_ID <> '' then
    S := S +' INNER JOIN ('
        +' 	SELECT X.BARANG_ID FROM BARANG_SUPLIER X'
        +' 	INNER JOIN SUPLIER_MERCHAN_GRUP Y ON X.SUPLIER_MERCHAN_GRUP_ID = Y.SUPLIER_MERCHAN_GRUP_ID'
        +' 	INNER JOIN SUPLIER Z ON Z.SUPLIER_ID = Y.SUPLIER_ID WHERE Z.SUPLIER_ID = '
        + QuotedStr(aSupplier_ID)
        +' ) S ON S.BARANG_ID = B.BARANG_ID';

  S := S + ' WHERE 1 = 1';

  if aGroup_ID <> '' then
    S := S + ' AND C.REF$MERCHANDISE_GRUP_ID = ' + QuotedStr(aGroup_ID);

  if aGudang_ID <> '' then
    S := S + ' AND A.GUDANG_ID = ' + QuotedStr(aGudang_ID);

  S := S + ' GROUP BY B.BARANG_ID, B.BRG_CODE, B.BRG_NAME, E.MERK_NAME,'
    +' D.MERCHAN_NAME,C.MERCHANGRUP_NAME, F.SAT_CODE , G.KONVSAT_SCALE';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSReport.Test: Variant;
begin
  Result := 'Wtf';
end;

function TDSReport.Test2: OleVariant;
begin
  Result := VarArrayCreate([0, 2], varVariant);
end;

end.
