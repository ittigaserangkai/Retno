//
// Created by the DataSnap proxy generator.
// 07/27/17 10:07:57 AM
//

unit uClientClasses;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, uModApp, Data.FireDACJSONReflect, uModUnit, uModDO, uModSettingApp, Data.DBXJSONReflect;

type

  IDSRestCachedTModSettingApp = interface;
  IDSRestCachedTFDJSONDataSets = interface;
  IDSRestCachedTStrings = interface;
  IDSRestCachedTModApp = interface;
  IDSRestCachedTModDO = interface;

  TServerMethodsClient = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
  end;

  TTestMethodClient = class(TDSAdminRestClient)
  private
    FHalloCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Hallo(aTanggal: TDateTime; const ARequestFilter: string = ''): string;
  end;

  TCrudClient = class(TDSAdminRestClient)
  private
    FSaveToDBCommand: TDSRestCommand;
    FDeleteFromDBCommand: TDSRestCommand;
    FOpenQueryCommand: TDSRestCommand;
    FOpenQueryCommand_Cache: TDSRestCommand;
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FGenerateCustomNoCommand: TDSRestCommand;
    FGenerateNoCommand: TDSRestCommand;
    FRetrieveSingleCommand: TDSRestCommand;
    FRetrieveSingleCommand_Cache: TDSRestCommand;
    FRetrieveByCodeCommand: TDSRestCommand;
    FRetrieveByCodeCommand_Cache: TDSRestCommand;
    FSaveToDBLogCommand: TDSRestCommand;
    FSaveToDBIDCommand: TDSRestCommand;
    FTestGenerateSQLCommand: TDSRestCommand;
    FTestGenerateSQLCommand_Cache: TDSRestCommand;
    FAfterExecuteMethodCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function SaveToDB(AObject: TModApp; const ARequestFilter: string = ''): Boolean;
    function DeleteFromDB(AObject: TModApp; const ARequestFilter: string = ''): Boolean;
    function OpenQuery(S: string; const ARequestFilter: string = ''): TDataSet;
    function OpenQuery_Cache(S: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Retrieve(ModClassName: string; AID: string; const ARequestFilter: string = ''): TModApp;
    function Retrieve_Cache(ModClassName: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTModApp;
    function GenerateCustomNo(aTableName: string; aFieldName: string; aCountDigit: Integer; const ARequestFilter: string = ''): string;
    function GenerateNo(aClassName: string; const ARequestFilter: string = ''): string;
    function RetrieveSingle(ModClassName: string; AID: string; const ARequestFilter: string = ''): TModApp;
    function RetrieveSingle_Cache(ModClassName: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTModApp;
    function RetrieveByCode(ModClassName: string; aCode: string; const ARequestFilter: string = ''): TModApp;
    function RetrieveByCode_Cache(ModClassName: string; aCode: string; const ARequestFilter: string = ''): IDSRestCachedTModApp;
    function SaveToDBLog(AObject: TModApp; const ARequestFilter: string = ''): Boolean;
    function SaveToDBID(AObject: TModApp; const ARequestFilter: string = ''): string;
    function TestGenerateSQL(AObject: TModApp; const ARequestFilter: string = ''): TStrings;
    function TestGenerateSQL_Cache(AObject: TModApp; const ARequestFilter: string = ''): IDSRestCachedTStrings;
    procedure AfterExecuteMethod;
  end;

  TDSProviderClient = class(TDSAdminRestClient)
  private
    FBank_GetDSOverviewCommand: TDSRestCommand;
    FBank_GetDSOverviewCommand_Cache: TDSRestCommand;
    FRekening_GetDSLookupCommand: TDSRestCommand;
    FRekening_GetDSLookupCommand_Cache: TDSRestCommand;
    FRefPajak_GetDSOverviewCommand: TDSRestCommand;
    FRefPajak_GetDSOverviewCommand_Cache: TDSRestCommand;
    FRefTipeBarang_GetDSOverviewCommand: TDSRestCommand;
    FRefTipeBarang_GetDSOverviewCommand_Cache: TDSRestCommand;
    FGroupRekening_GetDSLookupCommand: TDSRestCommand;
    FGroupRekening_GetDSLookupCommand_Cache: TDSRestCommand;
    FRekening_GetDSOverviewCommand: TDSRestCommand;
    FRekening_GetDSOverviewCommand_Cache: TDSRestCommand;
    FMember_GetDSOverviewCommand: TDSRestCommand;
    FMember_GetDSOverviewCommand_Cache: TDSRestCommand;
    FMemberActivasi_GetDSOverviewCommand: TDSRestCommand;
    FMemberActivasi_GetDSOverviewCommand_Cache: TDSRestCommand;
    FRefDiscMember_GetDSOverviewCommand: TDSRestCommand;
    FRefDiscMember_GetDSOverviewCommand_Cache: TDSRestCommand;
    FMemberKeluarga_GetDSOverviewCommand: TDSRestCommand;
    FMemberKeluarga_GetDSOverviewCommand_Cache: TDSRestCommand;
    FRefGrupMember_GetDSOverviewCommand: TDSRestCommand;
    FRefGrupMember_GetDSOverviewCommand_Cache: TDSRestCommand;
    FSatuan_GetDSLookupCommand: TDSRestCommand;
    FSatuan_GetDSLookupCommand_Cache: TDSRestCommand;
    FCostCenter_GetDSLookupCommand: TDSRestCommand;
    FCostCenter_GetDSLookupCommand_Cache: TDSRestCommand;
    FCompany_GetDSLookupCommand: TDSRestCommand;
    FCompany_GetDSLookupCommand_Cache: TDSRestCommand;
    FCostCenter_GetDSOverviewCommand: TDSRestCommand;
    FCostCenter_GetDSOverviewCommand_Cache: TDSRestCommand;
    FCompany_GetDSOverviewCommand: TDSRestCommand;
    FCompany_GetDSOverviewCommand_Cache: TDSRestCommand;
    FTipePembayaran_GetDSOverviewCommand: TDSRestCommand;
    FTipePembayaran_GetDSOverviewCommand_Cache: TDSRestCommand;
    FTipePerusahaan_GetDSOverviewCommand: TDSRestCommand;
    FTipePerusahaan_GetDSOverviewCommand_Cache: TDSRestCommand;
    FOutlet_GetDSLookupCommand: TDSRestCommand;
    FOutlet_GetDSLookupCommand_Cache: TDSRestCommand;
    FLokasi_GetDSLookupCommand: TDSRestCommand;
    FLokasi_GetDSLookupCommand_Cache: TDSRestCommand;
    FMerchandise_GetDSLookupCommand: TDSRestCommand;
    FMerchandise_GetDSLookupCommand_Cache: TDSRestCommand;
    FMerchandiseGroup_GetDSLookupCommand: TDSRestCommand;
    FMerchandiseGroup_GetDSLookupCommand_Cache: TDSRestCommand;
    FSubGroup_GetDSLookupCommand: TDSRestCommand;
    FSubGroup_GetDSLookupCommand_Cache: TDSRestCommand;
    FSatuan_GetDSOverviewCommand: TDSRestCommand;
    FSatuan_GetDSOverviewCommand_Cache: TDSRestCommand;
    FKategori_GetDSLookupCommand: TDSRestCommand;
    FKategori_GetDSLookupCommand_Cache: TDSRestCommand;
    FMerk_GetDSLookUpCommand: TDSRestCommand;
    FMerk_GetDSLookUpCommand_Cache: TDSRestCommand;
    FRefPajak_GetDSLookupCommand: TDSRestCommand;
    FRefPajak_GetDSLookupCommand_Cache: TDSRestCommand;
    FRefTipeBarang_GetDSLookupCommand: TDSRestCommand;
    FRefTipeBarang_GetDSLookupCommand_Cache: TDSRestCommand;
    FTipeSuplier_GetDSOverviewCommand: TDSRestCommand;
    FTipeSuplier_GetDSOverviewCommand_Cache: TDSRestCommand;
    FUnit_GetDSOverviewCommand: TDSRestCommand;
    FUnit_GetDSOverviewCommand_Cache: TDSRestCommand;
    FUnit_GetDSLookUpCommand: TDSRestCommand;
    FUnit_GetDSLookUpCommand_Cache: TDSRestCommand;
    FUnitType_GetDSLookUpCommand: TDSRestCommand;
    FUnitType_GetDSLookUpCommand_Cache: TDSRestCommand;
    FUnitType_GetDSOverviewCommand: TDSRestCommand;
    FUnitType_GetDSOverviewCommand_Cache: TDSRestCommand;
    FApp_GetDSLookUpCommand: TDSRestCommand;
    FApp_GetDSLookUpCommand_Cache: TDSRestCommand;
    FApp_GetDSOverviewCommand: TDSRestCommand;
    FApp_GetDSOverviewCommand_Cache: TDSRestCommand;
    FBank_GetDSLookupCommand: TDSRestCommand;
    FBank_GetDSLookupCommand_Cache: TDSRestCommand;
    FBarang_GetDSOverviewCommand: TDSRestCommand;
    FBarang_GetDSOverviewCommand_Cache: TDSRestCommand;
    FGudang_GetDSOverviewCommand: TDSRestCommand;
    FGudang_GetDSOverviewCommand_Cache: TDSRestCommand;
    FRefTipeMember_GetDSOverviewCommand: TDSRestCommand;
    FRefTipeMember_GetDSOverviewCommand_Cache: TDSRestCommand;
    FAutAPP_GetDSLookupCommand: TDSRestCommand;
    FAutAPP_GetDSLookupCommand_Cache: TDSRestCommand;
    FTipeKirimPO_GetDSOverviewCommand: TDSRestCommand;
    FTipeKirimPO_GetDSOverviewCommand_Cache: TDSRestCommand;
    FSuplierGroup_GetDSOverview1Command: TDSRestCommand;
    FSuplierGroup_GetDSOverview1Command_Cache: TDSRestCommand;
    FSuplierGroup_GetDSLookupCommand: TDSRestCommand;
    FSuplierGroup_GetDSLookupCommand_Cache: TDSRestCommand;
    FSuplier_GetDSOverviewCommand: TDSRestCommand;
    FSuplier_GetDSOverviewCommand_Cache: TDSRestCommand;
    FTipePerusahaan_GetDSLookupCommand: TDSRestCommand;
    FTipePerusahaan_GetDSLookupCommand_Cache: TDSRestCommand;
    FTipeSuplier_GetDSLookupCommand: TDSRestCommand;
    FTipeSuplier_GetDSLookupCommand_Cache: TDSRestCommand;
    FPropinsi_GetDSLookUpCommand: TDSRestCommand;
    FPropinsi_GetDSLookUpCommand_Cache: TDSRestCommand;
    FKabupaten_GetDSLookUpCommand: TDSRestCommand;
    FKabupaten_GetDSLookUpCommand_Cache: TDSRestCommand;
    FMataUang_GetDSOverviewCommand: TDSRestCommand;
    FMataUang_GetDSOverviewCommand_Cache: TDSRestCommand;
    FAgama_GetDSLookupCommand: TDSRestCommand;
    FAgama_GetDSLookupCommand_Cache: TDSRestCommand;
    FTipeBonus_GetDSOverviewCommand: TDSRestCommand;
    FTipeBonus_GetDSOverviewCommand_Cache: TDSRestCommand;
    FDocument_GetDSOverviewCommand: TDSRestCommand;
    FDocument_GetDSOverviewCommand_Cache: TDSRestCommand;
    FAgama_GetDSOverviewCommand: TDSRestCommand;
    FAgama_GetDSOverviewCommand_Cache: TDSRestCommand;
    FAutUnit_GetDSLookupCommand: TDSRestCommand;
    FAutUnit_GetDSLookupCommand_Cache: TDSRestCommand;
    FBarangSupp_GetDSLookupCommand: TDSRestCommand;
    FBarangSupp_GetDSLookupCommand_Cache: TDSRestCommand;
    FBarangSupp_GetDSLookup2Command: TDSRestCommand;
    FBarangSupp_GetDSLookup2Command_Cache: TDSRestCommand;
    FBarang_ByPOLookUpCommand: TDSRestCommand;
    FBarang_ByPOLookUpCommand_Cache: TDSRestCommand;
    FBarang_GetDSLookupCommand: TDSRestCommand;
    FBarang_GetDSLookupCommand_Cache: TDSRestCommand;
    FGET_MEMBER_PAS_NOCommand: TDSRestCommand;
    FMerchandise_GetDSOverviewCommand: TDSRestCommand;
    FMerchandise_GetDSOverviewCommand_Cache: TDSRestCommand;
    FSupMGByOutstandingSO_GetDSLookupCommand: TDSRestCommand;
    FSupMGByOutstandingSO_GetDSLookupCommand_Cache: TDSRestCommand;
    FStatusPO_GetDSLookupCommand: TDSRestCommand;
    FStatusPO_GetDSLookupCommand_Cache: TDSRestCommand;
    FTipeHarga_GetDSLookupCommand: TDSRestCommand;
    FTipeHarga_GetDSLookupCommand_Cache: TDSRestCommand;
    FRefWilayah_GetDSLookupCommand: TDSRestCommand;
    FRefWilayah_GetDSLookupCommand_Cache: TDSRestCommand;
    FSuplier_GetDSLookupCommand: TDSRestCommand;
    FSuplier_GetDSLookupCommand_Cache: TDSRestCommand;
    FRefTipeMember_GetDSLookupCommand: TDSRestCommand;
    FRefTipeMember_GetDSLookupCommand_Cache: TDSRestCommand;
    FTipePO_GetDSOverviewCommand: TDSRestCommand;
    FTipePO_GetDSOverviewCommand_Cache: TDSRestCommand;
    FTipeCN_GetDSOverviewCommand: TDSRestCommand;
    FTipeCN_GetDSOverviewCommand_Cache: TDSRestCommand;
    FSO_GetDSOverviewCommand: TDSRestCommand;
    FSO_GetDSOverviewCommand_Cache: TDSRestCommand;
    FSO_GetDSOLookUpCommand: TDSRestCommand;
    FSO_GetDSOLookUpCommand_Cache: TDSRestCommand;
    FSubGroup_GetDSOverviewCommand: TDSRestCommand;
    FSubGroup_GetDSOverviewCommand_Cache: TDSRestCommand;
    FSuplierMerchan_GetDSLookupCommand: TDSRestCommand;
    FSuplierMerchan_GetDSLookupCommand_Cache: TDSRestCommand;
    FDO_GetDSLookUpCommand: TDSRestCommand;
    FDO_GetDSLookUpCommand_Cache: TDSRestCommand;
    FDO_GetDSOverviewCommand: TDSRestCommand;
    FDO_GetDSOverviewCommand_Cache: TDSRestCommand;
    FGudang_GetDSLookUpCommand: TDSRestCommand;
    FGudang_GetDSLookUpCommand_Cache: TDSRestCommand;
    FKompetitor_GetDSOverviewCommand: TDSRestCommand;
    FKompetitor_GetDSOverviewCommand_Cache: TDSRestCommand;
    FSO_GetDSOLookUpGeneratePOCommand: TDSRestCommand;
    FSO_GetDSOLookUpGeneratePOCommand_Cache: TDSRestCommand;
    FPO_GetDSOLookUpCommand: TDSRestCommand;
    FPO_GetDSOLookUpCommand_Cache: TDSRestCommand;
    FPORevisi_GetDSOverviewCommand: TDSRestCommand;
    FPORevisi_GetDSOverviewCommand_Cache: TDSRestCommand;
    FPO_DSLookUpDetailCommand: TDSRestCommand;
    FPO_DSLookUpDetailCommand_Cache: TDSRestCommand;
    FPO_GetDSByPeriodCommand: TDSRestCommand;
    FPO_GetDSByPeriodCommand_Cache: TDSRestCommand;
    FPO_GetDSOLookUpForGRCommand: TDSRestCommand;
    FPO_GetDSOLookUpForGRCommand_Cache: TDSRestCommand;
    FPO_SKULookUPCommand: TDSRestCommand;
    FPO_SKULookUPCommand_Cache: TDSRestCommand;
    FPO_SLIP_GetDSOverviewCommand: TDSRestCommand;
    FPO_SLIP_GetDSOverviewCommand_Cache: TDSRestCommand;
    FPO_GetDSOverviewDetilCommand: TDSRestCommand;
    FPO_GetDSOverviewDetilCommand_Cache: TDSRestCommand;
    FPO_GetDSOverviewCommand: TDSRestCommand;
    FPO_GetDSOverviewCommand_Cache: TDSRestCommand;
    FRefCreditCard_GetDSOverviewCommand: TDSRestCommand;
    FRefCreditCard_GetDSOverviewCommand_Cache: TDSRestCommand;
    FCN_RCV_GetDSOverviewCommand: TDSRestCommand;
    FCN_RCV_GetDSOverviewCommand_Cache: TDSRestCommand;
    FDN_RCV_GetDSOverviewCommand: TDSRestCommand;
    FDN_RCV_GetDSOverviewCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Bank_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function Bank_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Rekening_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function Rekening_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RefPajak_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function RefPajak_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RefTipeBarang_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function RefTipeBarang_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function GroupRekening_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function GroupRekening_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Rekening_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function Rekening_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Member_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function Member_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function MemberActivasi_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function MemberActivasi_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RefDiscMember_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function RefDiscMember_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function MemberKeluarga_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function MemberKeluarga_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RefGrupMember_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function RefGrupMember_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Satuan_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function Satuan_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function CostCenter_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function CostCenter_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Company_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function Company_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function CostCenter_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function CostCenter_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Company_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function Company_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function TipePembayaran_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function TipePembayaran_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function TipePerusahaan_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function TipePerusahaan_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Outlet_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function Outlet_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Lokasi_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function Lokasi_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Merchandise_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function Merchandise_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function MerchandiseGroup_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function MerchandiseGroup_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function SubGroup_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function SubGroup_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Satuan_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function Satuan_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Kategori_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function Kategori_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Merk_GetDSLookUp(const ARequestFilter: string = ''): TDataSet;
    function Merk_GetDSLookUp_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RefPajak_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function RefPajak_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RefTipeBarang_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function RefTipeBarang_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function TipeSuplier_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function TipeSuplier_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Unit_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function Unit_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Unit_GetDSLookUp(const ARequestFilter: string = ''): TDataSet;
    function Unit_GetDSLookUp_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function UnitType_GetDSLookUp(const ARequestFilter: string = ''): TDataSet;
    function UnitType_GetDSLookUp_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function UnitType_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function UnitType_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function App_GetDSLookUp(const ARequestFilter: string = ''): TDataSet;
    function App_GetDSLookUp_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function App_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function App_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Bank_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function Bank_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Barang_GetDSOverview(aMerchanGroupID: string; AProductCode: string; const ARequestFilter: string = ''): TDataSet;
    function Barang_GetDSOverview_Cache(aMerchanGroupID: string; AProductCode: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Gudang_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function Gudang_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RefTipeMember_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function RefTipeMember_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function AutAPP_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function AutAPP_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function TipeKirimPO_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function TipeKirimPO_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function SuplierGroup_GetDSOverview1(const ARequestFilter: string = ''): TDataSet;
    function SuplierGroup_GetDSOverview1_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function SuplierGroup_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function SuplierGroup_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Suplier_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function Suplier_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function TipePerusahaan_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function TipePerusahaan_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function TipeSuplier_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function TipeSuplier_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Propinsi_GetDSLookUp(const ARequestFilter: string = ''): TDataSet;
    function Propinsi_GetDSLookUp_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Kabupaten_GetDSLookUp(const ARequestFilter: string = ''): TDataSet;
    function Kabupaten_GetDSLookUp_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function MataUang_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function MataUang_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Agama_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function Agama_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function TipeBonus_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function TipeBonus_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Document_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function Document_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Agama_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function Agama_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function AutUnit_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function AutUnit_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function BarangSupp_GetDSLookup(aMerchandise: string; const ARequestFilter: string = ''): TDataSet;
    function BarangSupp_GetDSLookup_Cache(aMerchandise: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function BarangSupp_GetDSLookup2(aMerchandise: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function BarangSupp_GetDSLookup2_Cache(aMerchandise: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function Barang_ByPOLookUp(APONO: string; const ARequestFilter: string = ''): TDataSet;
    function Barang_ByPOLookUp_Cache(APONO: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Barang_GetDSLookup(aMerchanGroupID: string; const ARequestFilter: string = ''): TDataSet;
    function Barang_GetDSLookup_Cache(aMerchanGroupID: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function GET_MEMBER_PAS_NO(ATPMEMBER: string; const ARequestFilter: string = ''): string;
    function Merchandise_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function Merchandise_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function SupMGByOutstandingSO_GetDSLookup(ID: string; const ARequestFilter: string = ''): TDataSet;
    function SupMGByOutstandingSO_GetDSLookup_Cache(ID: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function StatusPO_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function StatusPO_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function TipeHarga_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function TipeHarga_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RefWilayah_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function RefWilayah_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Suplier_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function Suplier_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RefTipeMember_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function RefTipeMember_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function TipePO_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function TipePO_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function TipeCN_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function TipeCN_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function SO_GetDSOverview(ATglAwal: TDateTime; ATglAkhir: TDateTime; AUnit: TModUnit; const ARequestFilter: string = ''): TDataSet;
    function SO_GetDSOverview_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; AUnit: TModUnit; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function SO_GetDSOLookUp(AUnit: TModUnit; const ARequestFilter: string = ''): TDataSet;
    function SO_GetDSOLookUp_Cache(AUnit: TModUnit; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function SubGroup_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function SubGroup_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function SuplierMerchan_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function SuplierMerchan_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function DO_GetDSLookUp(const ARequestFilter: string = ''): TDataSet;
    function DO_GetDSLookUp_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function DO_GetDSOverview(ATglAwal: TDateTime; ATglAkhir: TDateTime; AUnitID: string; ASupMGCodeID: string; const ARequestFilter: string = ''): TDataSet;
    function DO_GetDSOverview_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; AUnitID: string; ASupMGCodeID: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Gudang_GetDSLookUp(const ARequestFilter: string = ''): TDataSet;
    function Gudang_GetDSLookUp_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Kompetitor_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function Kompetitor_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function SO_GetDSOLookUpGeneratePO(AUnit: TModUnit; const ARequestFilter: string = ''): TDataSet;
    function SO_GetDSOLookUpGeneratePO_Cache(AUnit: TModUnit; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function PO_GetDSOLookUp(AUnitID: string; const ARequestFilter: string = ''): TDataSet;
    function PO_GetDSOLookUp_Cache(AUnitID: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function PORevisi_GetDSOverview(ID: string; const ARequestFilter: string = ''): TDataSet;
    function PORevisi_GetDSOverview_Cache(ID: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function PO_DSLookUpDetail(ANOPO: string; const ARequestFilter: string = ''): TDataSet;
    function PO_DSLookUpDetail_Cache(ANOPO: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function PO_GetDSByPeriod(APeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): TDataSet;
    function PO_GetDSByPeriod_Cache(APeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function PO_GetDSOLookUpForGR(AUnitID: string; const ARequestFilter: string = ''): TDataSet;
    function PO_GetDSOLookUpForGR_Cache(AUnitID: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function PO_SKULookUP(APONO: string; const ARequestFilter: string = ''): TDataSet;
    function PO_SKULookUP_Cache(APONO: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function PO_SLIP_GetDSOverview(ATglAwal: TDateTime; ATglAkhir: TDateTime; AUnit: TModUnit; const ARequestFilter: string = ''): TDataSet;
    function PO_SLIP_GetDSOverview_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; AUnit: TModUnit; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function PO_GetDSOverviewDetil(ATglAwal: TDateTime; ATglAkhir: TDateTime; AUnit: TModUnit; const ARequestFilter: string = ''): TDataSet;
    function PO_GetDSOverviewDetil_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; AUnit: TModUnit; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function PO_GetDSOverview(ATglAwal: TDateTime; ATglAkhir: TDateTime; AkodeSupplierMGAwal: string; AKodeSupplierMGAkhir: string; AStatusPOID: string; AUnit: TModUnit; const ARequestFilter: string = ''): TDataSet;
    function PO_GetDSOverview_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; AkodeSupplierMGAwal: string; AKodeSupplierMGAkhir: string; AStatusPOID: string; AUnit: TModUnit; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RefCreditCard_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function RefCreditCard_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function CN_RCV_GetDSOverview(ATglAwal: TDateTime; ATglAkhir: TDateTime; AUnit: TModUnit; const ARequestFilter: string = ''): TDataSet;
    function CN_RCV_GetDSOverview_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; AUnit: TModUnit; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function DN_RCV_GetDSOverview(ATglAwal: TDateTime; ATglAkhir: TDateTime; AUnit: TModUnit; const ARequestFilter: string = ''): TDataSet;
    function DN_RCV_GetDSOverview_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; AUnit: TModUnit; const ARequestFilter: string = ''): IDSRestCachedDataSet;
  end;

  TDSReportClient = class(TDSAdminRestClient)
  private
    FDO_GetDSNPCommand: TDSRestCommand;
    FDO_GetDSNPCommand_Cache: TDSRestCommand;
    FDO_GetDS_CheckListCommand: TDSRestCommand;
    FDO_GetDS_CheckListCommand_Cache: TDSRestCommand;
    FKartuStock_GetDSCommand: TDSRestCommand;
    FKartuStock_GetDSCommand_Cache: TDSRestCommand;
    FStockProduct_GetDSCommand: TDSRestCommand;
    FStockProduct_GetDSCommand_Cache: TDSRestCommand;
    FSO_ByDateCommand: TDSRestCommand;
    FSO_ByDateCommand_Cache: TDSRestCommand;
    FSO_ByDateNoBuktiCommand: TDSRestCommand;
    FSO_ByDateNoBuktiCommand_Cache: TDSRestCommand;
    FPO_SLIP_ByDateNoBuktiCommand: TDSRestCommand;
    FPO_SLIP_ByDateNoBuktiCommand_Cache: TDSRestCommand;
    FSO_TestCommand: TDSRestCommand;
    FSO_TestCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function DO_GetDSNP(ANONP: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function DO_GetDSNP_Cache(ANONP: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function DO_GetDS_CheckList(ANONP: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function DO_GetDS_CheckList_Cache(ANONP: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function KartuStock_GetDS(aBarang_ID: string; aStartDate: TDateTime; aEndDate: TDateTime; aGudang_ID: string; const ARequestFilter: string = ''): TDataSet;
    function KartuStock_GetDS_Cache(aBarang_ID: string; aStartDate: TDateTime; aEndDate: TDateTime; aGudang_ID: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function StockProduct_GetDS(aEndDate: TDateTime; aGroup_ID: string; aSupplier_ID: string; aGudang_ID: string; const ARequestFilter: string = ''): TDataSet;
    function StockProduct_GetDS_Cache(aEndDate: TDateTime; aGroup_ID: string; aSupplier_ID: string; aGudang_ID: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function SO_ByDate(StartDate: TDateTime; EndDate: TDateTime; const ARequestFilter: string = ''): TFDJSONDataSets;
    function SO_ByDate_Cache(StartDate: TDateTime; EndDate: TDateTime; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function SO_ByDateNoBukti(StartDate: TDateTime; EndDate: TDateTime; aNoBuktiAwal: string; aNoBuktiAkhir: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function SO_ByDateNoBukti_Cache(StartDate: TDateTime; EndDate: TDateTime; aNoBuktiAwal: string; aNoBuktiAkhir: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function PO_SLIP_ByDateNoBukti(StartDate: TDateTime; EndDate: TDateTime; aNoBuktiAwal: string; aNoBuktiAkhir: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function PO_SLIP_ByDateNoBukti_Cache(StartDate: TDateTime; EndDate: TDateTime; aNoBuktiAwal: string; aNoBuktiAkhir: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function SO_Test(const ARequestFilter: string = ''): TFDJSONDataSets;
    function SO_Test_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
  end;

  TSuggestionOrderClient = class(TDSAdminRestClient)
  private
    FGenerateSOCommand: TDSRestCommand;
    FGenerateSOCommand_Cache: TDSRestCommand;
    FRetrieveDetailsCommand: TDSRestCommand;
    FRetrieveDetailsCommand_Cache: TDSRestCommand;
    FAfterExecuteMethodCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GenerateSO(aTanggal: TDateTime; aMerchan_ID: string; aSupplierMerchan_ID: string; const ARequestFilter: string = ''): TDataSet;
    function GenerateSO_Cache(aTanggal: TDateTime; aMerchan_ID: string; aSupplierMerchan_ID: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDetails(aID: string; const ARequestFilter: string = ''): TDataSet;
    function RetrieveDetails_Cache(aID: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    procedure AfterExecuteMethod;
  end;

  TCrudSupplierClient = class(TDSAdminRestClient)
  private
    FBeforeSaveToDBCommand: TDSRestCommand;
    FSaveToDBCommand: TDSRestCommand;
    FDeleteFromDBCommand: TDSRestCommand;
    FOpenQueryCommand: TDSRestCommand;
    FOpenQueryCommand_Cache: TDSRestCommand;
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FGenerateCustomNoCommand: TDSRestCommand;
    FGenerateNoCommand: TDSRestCommand;
    FRetrieveSingleCommand: TDSRestCommand;
    FRetrieveSingleCommand_Cache: TDSRestCommand;
    FRetrieveByCodeCommand: TDSRestCommand;
    FRetrieveByCodeCommand_Cache: TDSRestCommand;
    FSaveToDBLogCommand: TDSRestCommand;
    FSaveToDBIDCommand: TDSRestCommand;
    FTestGenerateSQLCommand: TDSRestCommand;
    FTestGenerateSQLCommand_Cache: TDSRestCommand;
    FAfterExecuteMethodCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function BeforeSaveToDB(AObject: TModApp; const ARequestFilter: string = ''): Boolean;
    function SaveToDB(AObject: TModApp; const ARequestFilter: string = ''): Boolean;
    function DeleteFromDB(AObject: TModApp; const ARequestFilter: string = ''): Boolean;
    function OpenQuery(S: string; const ARequestFilter: string = ''): TDataSet;
    function OpenQuery_Cache(S: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Retrieve(ModClassName: string; AID: string; const ARequestFilter: string = ''): TModApp;
    function Retrieve_Cache(ModClassName: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTModApp;
    function GenerateCustomNo(aTableName: string; aFieldName: string; aCountDigit: Integer; const ARequestFilter: string = ''): string;
    function GenerateNo(aClassName: string; const ARequestFilter: string = ''): string;
    function RetrieveSingle(ModClassName: string; AID: string; const ARequestFilter: string = ''): TModApp;
    function RetrieveSingle_Cache(ModClassName: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTModApp;
    function RetrieveByCode(ModClassName: string; aCode: string; const ARequestFilter: string = ''): TModApp;
    function RetrieveByCode_Cache(ModClassName: string; aCode: string; const ARequestFilter: string = ''): IDSRestCachedTModApp;
    function SaveToDBLog(AObject: TModApp; const ARequestFilter: string = ''): Boolean;
    function SaveToDBID(AObject: TModApp; const ARequestFilter: string = ''): string;
    function TestGenerateSQL(AObject: TModApp; const ARequestFilter: string = ''): TStrings;
    function TestGenerateSQL_Cache(AObject: TModApp; const ARequestFilter: string = ''): IDSRestCachedTStrings;
    procedure AfterExecuteMethod;
  end;

  TCrudPOClient = class(TDSAdminRestClient)
  private
    FGeneratePOCommand: TDSRestCommand;
    FSaveToDBCommand: TDSRestCommand;
    FDeleteFromDBCommand: TDSRestCommand;
    FOpenQueryCommand: TDSRestCommand;
    FOpenQueryCommand_Cache: TDSRestCommand;
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FGenerateCustomNoCommand: TDSRestCommand;
    FGenerateNoCommand: TDSRestCommand;
    FRetrieveSingleCommand: TDSRestCommand;
    FRetrieveSingleCommand_Cache: TDSRestCommand;
    FRetrieveByCodeCommand: TDSRestCommand;
    FRetrieveByCodeCommand_Cache: TDSRestCommand;
    FSaveToDBLogCommand: TDSRestCommand;
    FSaveToDBIDCommand: TDSRestCommand;
    FTestGenerateSQLCommand: TDSRestCommand;
    FTestGenerateSQLCommand_Cache: TDSRestCommand;
    FAfterExecuteMethodCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GeneratePO(ASOID: string; ASupMGID: string; const ARequestFilter: string = ''): Boolean;
    function SaveToDB(AObject: TModApp; const ARequestFilter: string = ''): Boolean;
    function DeleteFromDB(AObject: TModApp; const ARequestFilter: string = ''): Boolean;
    function OpenQuery(S: string; const ARequestFilter: string = ''): TDataSet;
    function OpenQuery_Cache(S: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Retrieve(ModClassName: string; AID: string; const ARequestFilter: string = ''): TModApp;
    function Retrieve_Cache(ModClassName: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTModApp;
    function GenerateCustomNo(aTableName: string; aFieldName: string; aCountDigit: Integer; const ARequestFilter: string = ''): string;
    function GenerateNo(aClassName: string; const ARequestFilter: string = ''): string;
    function RetrieveSingle(ModClassName: string; AID: string; const ARequestFilter: string = ''): TModApp;
    function RetrieveSingle_Cache(ModClassName: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTModApp;
    function RetrieveByCode(ModClassName: string; aCode: string; const ARequestFilter: string = ''): TModApp;
    function RetrieveByCode_Cache(ModClassName: string; aCode: string; const ARequestFilter: string = ''): IDSRestCachedTModApp;
    function SaveToDBLog(AObject: TModApp; const ARequestFilter: string = ''): Boolean;
    function SaveToDBID(AObject: TModApp; const ARequestFilter: string = ''): string;
    function TestGenerateSQL(AObject: TModApp; const ARequestFilter: string = ''): TStrings;
    function TestGenerateSQL_Cache(AObject: TModApp; const ARequestFilter: string = ''): IDSRestCachedTStrings;
    procedure AfterExecuteMethod;
  end;

  TCrudDOClient = class(TDSAdminRestClient)
  private
    FRetrieveByPOCommand: TDSRestCommand;
    FRetrieveByPOCommand_Cache: TDSRestCommand;
    FSaveToDBCommand: TDSRestCommand;
    FDeleteFromDBCommand: TDSRestCommand;
    FOpenQueryCommand: TDSRestCommand;
    FOpenQueryCommand_Cache: TDSRestCommand;
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FGenerateCustomNoCommand: TDSRestCommand;
    FGenerateNoCommand: TDSRestCommand;
    FRetrieveSingleCommand: TDSRestCommand;
    FRetrieveSingleCommand_Cache: TDSRestCommand;
    FRetrieveByCodeCommand: TDSRestCommand;
    FRetrieveByCodeCommand_Cache: TDSRestCommand;
    FSaveToDBLogCommand: TDSRestCommand;
    FSaveToDBIDCommand: TDSRestCommand;
    FTestGenerateSQLCommand: TDSRestCommand;
    FTestGenerateSQLCommand_Cache: TDSRestCommand;
    FAfterExecuteMethodCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function RetrieveByPO(APONO: string; const ARequestFilter: string = ''): TModDO;
    function RetrieveByPO_Cache(APONO: string; const ARequestFilter: string = ''): IDSRestCachedTModDO;
    function SaveToDB(AObject: TModApp; const ARequestFilter: string = ''): Boolean;
    function DeleteFromDB(AObject: TModApp; const ARequestFilter: string = ''): Boolean;
    function OpenQuery(S: string; const ARequestFilter: string = ''): TDataSet;
    function OpenQuery_Cache(S: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Retrieve(ModClassName: string; AID: string; const ARequestFilter: string = ''): TModApp;
    function Retrieve_Cache(ModClassName: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTModApp;
    function GenerateCustomNo(aTableName: string; aFieldName: string; aCountDigit: Integer; const ARequestFilter: string = ''): string;
    function GenerateNo(aClassName: string; const ARequestFilter: string = ''): string;
    function RetrieveSingle(ModClassName: string; AID: string; const ARequestFilter: string = ''): TModApp;
    function RetrieveSingle_Cache(ModClassName: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTModApp;
    function RetrieveByCode(ModClassName: string; aCode: string; const ARequestFilter: string = ''): TModApp;
    function RetrieveByCode_Cache(ModClassName: string; aCode: string; const ARequestFilter: string = ''): IDSRestCachedTModApp;
    function SaveToDBLog(AObject: TModApp; const ARequestFilter: string = ''): Boolean;
    function SaveToDBID(AObject: TModApp; const ARequestFilter: string = ''): string;
    function TestGenerateSQL(AObject: TModApp; const ARequestFilter: string = ''): TStrings;
    function TestGenerateSQL_Cache(AObject: TModApp; const ARequestFilter: string = ''): IDSRestCachedTStrings;
    procedure AfterExecuteMethod;
  end;

  TCrudCNRecvClient = class(TDSAdminRestClient)
  private
    FSaveToDBCommand: TDSRestCommand;
    FDeleteFromDBCommand: TDSRestCommand;
    FOpenQueryCommand: TDSRestCommand;
    FOpenQueryCommand_Cache: TDSRestCommand;
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FGenerateCustomNoCommand: TDSRestCommand;
    FGenerateNoCommand: TDSRestCommand;
    FRetrieveSingleCommand: TDSRestCommand;
    FRetrieveSingleCommand_Cache: TDSRestCommand;
    FRetrieveByCodeCommand: TDSRestCommand;
    FRetrieveByCodeCommand_Cache: TDSRestCommand;
    FSaveToDBLogCommand: TDSRestCommand;
    FSaveToDBIDCommand: TDSRestCommand;
    FTestGenerateSQLCommand: TDSRestCommand;
    FTestGenerateSQLCommand_Cache: TDSRestCommand;
    FAfterExecuteMethodCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function SaveToDB(AObject: TModApp; const ARequestFilter: string = ''): Boolean;
    function DeleteFromDB(AObject: TModApp; const ARequestFilter: string = ''): Boolean;
    function OpenQuery(S: string; const ARequestFilter: string = ''): TDataSet;
    function OpenQuery_Cache(S: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Retrieve(ModClassName: string; AID: string; const ARequestFilter: string = ''): TModApp;
    function Retrieve_Cache(ModClassName: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTModApp;
    function GenerateCustomNo(aTableName: string; aFieldName: string; aCountDigit: Integer; const ARequestFilter: string = ''): string;
    function GenerateNo(aClassName: string; const ARequestFilter: string = ''): string;
    function RetrieveSingle(ModClassName: string; AID: string; const ARequestFilter: string = ''): TModApp;
    function RetrieveSingle_Cache(ModClassName: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTModApp;
    function RetrieveByCode(ModClassName: string; aCode: string; const ARequestFilter: string = ''): TModApp;
    function RetrieveByCode_Cache(ModClassName: string; aCode: string; const ARequestFilter: string = ''): IDSRestCachedTModApp;
    function SaveToDBLog(AObject: TModApp; const ARequestFilter: string = ''): Boolean;
    function SaveToDBID(AObject: TModApp; const ARequestFilter: string = ''): string;
    function TestGenerateSQL(AObject: TModApp; const ARequestFilter: string = ''): TStrings;
    function TestGenerateSQL_Cache(AObject: TModApp; const ARequestFilter: string = ''): IDSRestCachedTStrings;
    procedure AfterExecuteMethod;
  end;

  TCrudDNRecvClient = class(TDSAdminRestClient)
  private
    FSaveToDBCommand: TDSRestCommand;
    FDeleteFromDBCommand: TDSRestCommand;
    FOpenQueryCommand: TDSRestCommand;
    FOpenQueryCommand_Cache: TDSRestCommand;
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FGenerateCustomNoCommand: TDSRestCommand;
    FGenerateNoCommand: TDSRestCommand;
    FRetrieveSingleCommand: TDSRestCommand;
    FRetrieveSingleCommand_Cache: TDSRestCommand;
    FRetrieveByCodeCommand: TDSRestCommand;
    FRetrieveByCodeCommand_Cache: TDSRestCommand;
    FSaveToDBLogCommand: TDSRestCommand;
    FSaveToDBIDCommand: TDSRestCommand;
    FTestGenerateSQLCommand: TDSRestCommand;
    FTestGenerateSQLCommand_Cache: TDSRestCommand;
    FAfterExecuteMethodCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function SaveToDB(AObject: TModApp; const ARequestFilter: string = ''): Boolean;
    function DeleteFromDB(AObject: TModApp; const ARequestFilter: string = ''): Boolean;
    function OpenQuery(S: string; const ARequestFilter: string = ''): TDataSet;
    function OpenQuery_Cache(S: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Retrieve(ModClassName: string; AID: string; const ARequestFilter: string = ''): TModApp;
    function Retrieve_Cache(ModClassName: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTModApp;
    function GenerateCustomNo(aTableName: string; aFieldName: string; aCountDigit: Integer; const ARequestFilter: string = ''): string;
    function GenerateNo(aClassName: string; const ARequestFilter: string = ''): string;
    function RetrieveSingle(ModClassName: string; AID: string; const ARequestFilter: string = ''): TModApp;
    function RetrieveSingle_Cache(ModClassName: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTModApp;
    function RetrieveByCode(ModClassName: string; aCode: string; const ARequestFilter: string = ''): TModApp;
    function RetrieveByCode_Cache(ModClassName: string; aCode: string; const ARequestFilter: string = ''): IDSRestCachedTModApp;
    function SaveToDBLog(AObject: TModApp; const ARequestFilter: string = ''): Boolean;
    function SaveToDBID(AObject: TModApp; const ARequestFilter: string = ''): string;
    function TestGenerateSQL(AObject: TModApp; const ARequestFilter: string = ''): TStrings;
    function TestGenerateSQL_Cache(AObject: TModApp; const ARequestFilter: string = ''): IDSRestCachedTStrings;
    procedure AfterExecuteMethod;
  end;

  TCrudSettingAppClient = class(TDSAdminRestClient)
  private
    FRetrieveByCabangCommand: TDSRestCommand;
    FRetrieveByCabangCommand_Cache: TDSRestCommand;
    FSaveToDBCommand: TDSRestCommand;
    FDeleteFromDBCommand: TDSRestCommand;
    FOpenQueryCommand: TDSRestCommand;
    FOpenQueryCommand_Cache: TDSRestCommand;
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FGenerateCustomNoCommand: TDSRestCommand;
    FGenerateNoCommand: TDSRestCommand;
    FRetrieveSingleCommand: TDSRestCommand;
    FRetrieveSingleCommand_Cache: TDSRestCommand;
    FRetrieveByCodeCommand: TDSRestCommand;
    FRetrieveByCodeCommand_Cache: TDSRestCommand;
    FSaveToDBLogCommand: TDSRestCommand;
    FSaveToDBIDCommand: TDSRestCommand;
    FTestGenerateSQLCommand: TDSRestCommand;
    FTestGenerateSQLCommand_Cache: TDSRestCommand;
    FAfterExecuteMethodCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function RetrieveByCabang(ACabang: TModUnit; const ARequestFilter: string = ''): TModSettingApp;
    function RetrieveByCabang_Cache(ACabang: TModUnit; const ARequestFilter: string = ''): IDSRestCachedTModSettingApp;
    function SaveToDB(AObject: TModApp; const ARequestFilter: string = ''): Boolean;
    function DeleteFromDB(AObject: TModApp; const ARequestFilter: string = ''): Boolean;
    function OpenQuery(S: string; const ARequestFilter: string = ''): TDataSet;
    function OpenQuery_Cache(S: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Retrieve(ModClassName: string; AID: string; const ARequestFilter: string = ''): TModApp;
    function Retrieve_Cache(ModClassName: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTModApp;
    function GenerateCustomNo(aTableName: string; aFieldName: string; aCountDigit: Integer; const ARequestFilter: string = ''): string;
    function GenerateNo(aClassName: string; const ARequestFilter: string = ''): string;
    function RetrieveSingle(ModClassName: string; AID: string; const ARequestFilter: string = ''): TModApp;
    function RetrieveSingle_Cache(ModClassName: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTModApp;
    function RetrieveByCode(ModClassName: string; aCode: string; const ARequestFilter: string = ''): TModApp;
    function RetrieveByCode_Cache(ModClassName: string; aCode: string; const ARequestFilter: string = ''): IDSRestCachedTModApp;
    function SaveToDBLog(AObject: TModApp; const ARequestFilter: string = ''): Boolean;
    function SaveToDBID(AObject: TModApp; const ARequestFilter: string = ''): string;
    function TestGenerateSQL(AObject: TModApp; const ARequestFilter: string = ''): TStrings;
    function TestGenerateSQL_Cache(AObject: TModApp; const ARequestFilter: string = ''): IDSRestCachedTStrings;
    procedure AfterExecuteMethod;
  end;

  IDSRestCachedTModSettingApp = interface(IDSRestCachedObject<TModSettingApp>)
  end;

  TDSRestCachedTModSettingApp = class(TDSRestCachedObject<TModSettingApp>, IDSRestCachedTModSettingApp, IDSRestCachedCommand)
  end;
  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;
  IDSRestCachedTStrings = interface(IDSRestCachedObject<TStrings>)
  end;

  TDSRestCachedTStrings = class(TDSRestCachedObject<TStrings>, IDSRestCachedTStrings, IDSRestCachedCommand)
  end;
  IDSRestCachedTModApp = interface(IDSRestCachedObject<TModApp>)
  end;

  TDSRestCachedTModApp = class(TDSRestCachedObject<TModApp>, IDSRestCachedTModApp, IDSRestCachedCommand)
  end;
  IDSRestCachedTModDO = interface(IDSRestCachedObject<TModDO>)
  end;

  TDSRestCachedTModDO = class(TDSRestCachedObject<TModDO>, IDSRestCachedTModDO, IDSRestCachedCommand)
  end;

const
  TServerMethods_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TTestMethod_Hallo: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'aTanggal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TCrud_SaveToDB: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrud_DeleteFromDB: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrud_OpenQuery: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'S'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TCrud_OpenQuery_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'S'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrud_Retrieve: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModApp')
  );

  TCrud_Retrieve_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrud_GenerateCustomNo: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aTableName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aFieldName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aCountDigit'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TCrud_GenerateNo: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'aClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TCrud_RetrieveSingle: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModApp')
  );

  TCrud_RetrieveSingle_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrud_RetrieveByCode: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aCode'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModApp')
  );

  TCrud_RetrieveByCode_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aCode'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrud_SaveToDBLog: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrud_SaveToDBID: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TCrud_TestGenerateSQL: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TStrings')
  );

  TCrud_TestGenerateSQL_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Bank_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Bank_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Rekening_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Rekening_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_RefPajak_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_RefPajak_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_RefTipeBarang_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_RefTipeBarang_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_GroupRekening_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_GroupRekening_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Rekening_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Rekening_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Member_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Member_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_MemberActivasi_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_MemberActivasi_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_RefDiscMember_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_RefDiscMember_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_MemberKeluarga_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_MemberKeluarga_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_RefGrupMember_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_RefGrupMember_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Satuan_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Satuan_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_CostCenter_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_CostCenter_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Company_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Company_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_CostCenter_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_CostCenter_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Company_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Company_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_TipePembayaran_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_TipePembayaran_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_TipePerusahaan_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_TipePerusahaan_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Outlet_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Outlet_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Lokasi_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Lokasi_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Merchandise_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Merchandise_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_MerchandiseGroup_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_MerchandiseGroup_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_SubGroup_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_SubGroup_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Satuan_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Satuan_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Kategori_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Kategori_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Merk_GetDSLookUp: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Merk_GetDSLookUp_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_RefPajak_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_RefPajak_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_RefTipeBarang_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_RefTipeBarang_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_TipeSuplier_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_TipeSuplier_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Unit_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Unit_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Unit_GetDSLookUp: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Unit_GetDSLookUp_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_UnitType_GetDSLookUp: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_UnitType_GetDSLookUp_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_UnitType_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_UnitType_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_App_GetDSLookUp: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_App_GetDSLookUp_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_App_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_App_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Bank_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Bank_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Barang_GetDSOverview: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aMerchanGroupID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AProductCode'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Barang_GetDSOverview_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aMerchanGroupID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AProductCode'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Gudang_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Gudang_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_RefTipeMember_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_RefTipeMember_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_AutAPP_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_AutAPP_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_TipeKirimPO_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_TipeKirimPO_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_SuplierGroup_GetDSOverview1: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_SuplierGroup_GetDSOverview1_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_SuplierGroup_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_SuplierGroup_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Suplier_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Suplier_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_TipePerusahaan_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_TipePerusahaan_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_TipeSuplier_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_TipeSuplier_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Propinsi_GetDSLookUp: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Propinsi_GetDSLookUp_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Kabupaten_GetDSLookUp: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Kabupaten_GetDSLookUp_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_MataUang_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_MataUang_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Agama_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Agama_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_TipeBonus_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_TipeBonus_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Document_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Document_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Agama_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Agama_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_AutUnit_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_AutUnit_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_BarangSupp_GetDSLookup: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'aMerchandise'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_BarangSupp_GetDSLookup_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'aMerchandise'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_BarangSupp_GetDSLookup2: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'aMerchandise'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TDSProvider_BarangSupp_GetDSLookup2_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'aMerchandise'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Barang_ByPOLookUp: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'APONO'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Barang_ByPOLookUp_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'APONO'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Barang_GetDSLookup: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'aMerchanGroupID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Barang_GetDSLookup_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'aMerchanGroupID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_GET_MEMBER_PAS_NO: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ATPMEMBER'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TDSProvider_Merchandise_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Merchandise_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_SupMGByOutstandingSO_GetDSLookup: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_SupMGByOutstandingSO_GetDSLookup_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_StatusPO_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_StatusPO_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_TipeHarga_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_TipeHarga_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_RefWilayah_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_RefWilayah_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Suplier_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Suplier_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_RefTipeMember_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_RefTipeMember_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_TipePO_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_TipePO_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_TipeCN_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_TipeCN_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_SO_GetDSOverview: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AUnit'; Direction: 1; DBXType: 37; TypeName: 'TModUnit'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_SO_GetDSOverview_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AUnit'; Direction: 1; DBXType: 37; TypeName: 'TModUnit'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_SO_GetDSOLookUp: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AUnit'; Direction: 1; DBXType: 37; TypeName: 'TModUnit'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_SO_GetDSOLookUp_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AUnit'; Direction: 1; DBXType: 37; TypeName: 'TModUnit'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_SubGroup_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_SubGroup_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_SuplierMerchan_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_SuplierMerchan_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_DO_GetDSLookUp: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_DO_GetDSLookUp_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_DO_GetDSOverview: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AUnitID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ASupMGCodeID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_DO_GetDSOverview_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AUnitID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ASupMGCodeID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Gudang_GetDSLookUp: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Gudang_GetDSLookUp_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Kompetitor_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Kompetitor_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_SO_GetDSOLookUpGeneratePO: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AUnit'; Direction: 1; DBXType: 37; TypeName: 'TModUnit'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_SO_GetDSOLookUpGeneratePO_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AUnit'; Direction: 1; DBXType: 37; TypeName: 'TModUnit'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_PO_GetDSOLookUp: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AUnitID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_PO_GetDSOLookUp_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AUnitID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_PORevisi_GetDSOverview: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_PORevisi_GetDSOverview_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_PO_DSLookUpDetail: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANOPO'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_PO_DSLookUpDetail_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANOPO'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_PO_GetDSByPeriod: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'APeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_PO_GetDSByPeriod_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'APeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_PO_GetDSOLookUpForGR: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AUnitID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_PO_GetDSOLookUpForGR_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AUnitID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_PO_SKULookUP: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'APONO'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_PO_SKULookUP_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'APONO'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_PO_SLIP_GetDSOverview: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AUnit'; Direction: 1; DBXType: 37; TypeName: 'TModUnit'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_PO_SLIP_GetDSOverview_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AUnit'; Direction: 1; DBXType: 37; TypeName: 'TModUnit'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_PO_GetDSOverviewDetil: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AUnit'; Direction: 1; DBXType: 37; TypeName: 'TModUnit'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_PO_GetDSOverviewDetil_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AUnit'; Direction: 1; DBXType: 37; TypeName: 'TModUnit'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_PO_GetDSOverview: array [0..6] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AkodeSupplierMGAwal'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AKodeSupplierMGAkhir'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AStatusPOID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AUnit'; Direction: 1; DBXType: 37; TypeName: 'TModUnit'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_PO_GetDSOverview_Cache: array [0..6] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AkodeSupplierMGAwal'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AKodeSupplierMGAkhir'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AStatusPOID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AUnit'; Direction: 1; DBXType: 37; TypeName: 'TModUnit'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_RefCreditCard_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_RefCreditCard_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_CN_RCV_GetDSOverview: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AUnit'; Direction: 1; DBXType: 37; TypeName: 'TModUnit'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_CN_RCV_GetDSOverview_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AUnit'; Direction: 1; DBXType: 37; TypeName: 'TModUnit'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_DN_RCV_GetDSOverview: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AUnit'; Direction: 1; DBXType: 37; TypeName: 'TModUnit'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_DN_RCV_GetDSOverview_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AUnit'; Direction: 1; DBXType: 37; TypeName: 'TModUnit'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSReport_DO_GetDSNP: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANONP'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TDSReport_DO_GetDSNP_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANONP'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSReport_DO_GetDS_CheckList: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANONP'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TDSReport_DO_GetDS_CheckList_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANONP'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSReport_KartuStock_GetDS: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aBarang_ID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aStartDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'aEndDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'aGudang_ID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSReport_KartuStock_GetDS_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aBarang_ID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aStartDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'aEndDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'aGudang_ID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSReport_StockProduct_GetDS: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aEndDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'aGroup_ID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aSupplier_ID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aGudang_ID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSReport_StockProduct_GetDS_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aEndDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'aGroup_ID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aSupplier_ID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aGudang_ID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSReport_SO_ByDate: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'StartDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'EndDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TDSReport_SO_ByDate_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'StartDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'EndDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSReport_SO_ByDateNoBukti: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'StartDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'EndDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'aNoBuktiAwal'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aNoBuktiAkhir'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TDSReport_SO_ByDateNoBukti_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'StartDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'EndDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'aNoBuktiAwal'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aNoBuktiAkhir'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSReport_PO_SLIP_ByDateNoBukti: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'StartDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'EndDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'aNoBuktiAwal'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aNoBuktiAkhir'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TDSReport_PO_SLIP_ByDateNoBukti_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'StartDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'EndDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'aNoBuktiAwal'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aNoBuktiAkhir'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSReport_SO_Test: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TDSReport_SO_Test_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSuggestionOrder_GenerateSO: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aTanggal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'aMerchan_ID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aSupplierMerchan_ID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TSuggestionOrder_GenerateSO_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aTanggal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'aMerchan_ID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aSupplierMerchan_ID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSuggestionOrder_RetrieveDetails: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'aID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TSuggestionOrder_RetrieveDetails_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'aID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudSupplier_BeforeSaveToDB: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrudSupplier_SaveToDB: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrudSupplier_DeleteFromDB: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrudSupplier_OpenQuery: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'S'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TCrudSupplier_OpenQuery_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'S'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudSupplier_Retrieve: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModApp')
  );

  TCrudSupplier_Retrieve_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudSupplier_GenerateCustomNo: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aTableName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aFieldName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aCountDigit'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TCrudSupplier_GenerateNo: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'aClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TCrudSupplier_RetrieveSingle: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModApp')
  );

  TCrudSupplier_RetrieveSingle_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudSupplier_RetrieveByCode: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aCode'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModApp')
  );

  TCrudSupplier_RetrieveByCode_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aCode'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudSupplier_SaveToDBLog: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrudSupplier_SaveToDBID: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TCrudSupplier_TestGenerateSQL: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TStrings')
  );

  TCrudSupplier_TestGenerateSQL_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudPO_GeneratePO: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ASOID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ASupMGID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrudPO_SaveToDB: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrudPO_DeleteFromDB: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrudPO_OpenQuery: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'S'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TCrudPO_OpenQuery_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'S'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudPO_Retrieve: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModApp')
  );

  TCrudPO_Retrieve_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudPO_GenerateCustomNo: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aTableName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aFieldName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aCountDigit'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TCrudPO_GenerateNo: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'aClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TCrudPO_RetrieveSingle: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModApp')
  );

  TCrudPO_RetrieveSingle_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudPO_RetrieveByCode: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aCode'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModApp')
  );

  TCrudPO_RetrieveByCode_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aCode'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudPO_SaveToDBLog: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrudPO_SaveToDBID: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TCrudPO_TestGenerateSQL: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TStrings')
  );

  TCrudPO_TestGenerateSQL_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudDO_RetrieveByPO: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'APONO'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModDO')
  );

  TCrudDO_RetrieveByPO_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'APONO'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudDO_SaveToDB: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrudDO_DeleteFromDB: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrudDO_OpenQuery: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'S'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TCrudDO_OpenQuery_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'S'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudDO_Retrieve: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModApp')
  );

  TCrudDO_Retrieve_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudDO_GenerateCustomNo: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aTableName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aFieldName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aCountDigit'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TCrudDO_GenerateNo: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'aClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TCrudDO_RetrieveSingle: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModApp')
  );

  TCrudDO_RetrieveSingle_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudDO_RetrieveByCode: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aCode'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModApp')
  );

  TCrudDO_RetrieveByCode_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aCode'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudDO_SaveToDBLog: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrudDO_SaveToDBID: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TCrudDO_TestGenerateSQL: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TStrings')
  );

  TCrudDO_TestGenerateSQL_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudCNRecv_SaveToDB: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrudCNRecv_DeleteFromDB: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrudCNRecv_OpenQuery: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'S'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TCrudCNRecv_OpenQuery_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'S'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudCNRecv_Retrieve: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModApp')
  );

  TCrudCNRecv_Retrieve_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudCNRecv_GenerateCustomNo: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aTableName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aFieldName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aCountDigit'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TCrudCNRecv_GenerateNo: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'aClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TCrudCNRecv_RetrieveSingle: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModApp')
  );

  TCrudCNRecv_RetrieveSingle_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudCNRecv_RetrieveByCode: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aCode'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModApp')
  );

  TCrudCNRecv_RetrieveByCode_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aCode'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudCNRecv_SaveToDBLog: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrudCNRecv_SaveToDBID: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TCrudCNRecv_TestGenerateSQL: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TStrings')
  );

  TCrudCNRecv_TestGenerateSQL_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudDNRecv_SaveToDB: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrudDNRecv_DeleteFromDB: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrudDNRecv_OpenQuery: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'S'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TCrudDNRecv_OpenQuery_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'S'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudDNRecv_Retrieve: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModApp')
  );

  TCrudDNRecv_Retrieve_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudDNRecv_GenerateCustomNo: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aTableName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aFieldName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aCountDigit'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TCrudDNRecv_GenerateNo: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'aClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TCrudDNRecv_RetrieveSingle: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModApp')
  );

  TCrudDNRecv_RetrieveSingle_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudDNRecv_RetrieveByCode: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aCode'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModApp')
  );

  TCrudDNRecv_RetrieveByCode_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aCode'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudDNRecv_SaveToDBLog: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrudDNRecv_SaveToDBID: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TCrudDNRecv_TestGenerateSQL: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TStrings')
  );

  TCrudDNRecv_TestGenerateSQL_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudSettingApp_RetrieveByCabang: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TModUnit'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModSettingApp')
  );

  TCrudSettingApp_RetrieveByCabang_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TModUnit'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudSettingApp_SaveToDB: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrudSettingApp_DeleteFromDB: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrudSettingApp_OpenQuery: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'S'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TCrudSettingApp_OpenQuery_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'S'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudSettingApp_Retrieve: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModApp')
  );

  TCrudSettingApp_Retrieve_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudSettingApp_GenerateCustomNo: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aTableName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aFieldName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aCountDigit'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TCrudSettingApp_GenerateNo: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'aClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TCrudSettingApp_RetrieveSingle: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModApp')
  );

  TCrudSettingApp_RetrieveSingle_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudSettingApp_RetrieveByCode: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aCode'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModApp')
  );

  TCrudSettingApp_RetrieveByCode_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aCode'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrudSettingApp_SaveToDBLog: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrudSettingApp_SaveToDBID: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TCrudSettingApp_TestGenerateSQL: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TStrings')
  );

  TCrudSettingApp_TestGenerateSQL_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

implementation

function TServerMethodsClient.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TServerMethods.EchoString';
    FEchoStringCommand.Prepare(TServerMethods_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethodsClient.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TServerMethods.ReverseString';
    FReverseStringCommand.Prepare(TServerMethods_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

constructor TServerMethodsClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerMethodsClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerMethodsClient.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  inherited;
end;

function TTestMethodClient.Hallo(aTanggal: TDateTime; const ARequestFilter: string): string;
begin
  if FHalloCommand = nil then
  begin
    FHalloCommand := FConnection.CreateCommand;
    FHalloCommand.RequestType := 'GET';
    FHalloCommand.Text := 'TTestMethod.Hallo';
    FHalloCommand.Prepare(TTestMethod_Hallo);
  end;
  FHalloCommand.Parameters[0].Value.AsDateTime := aTanggal;
  FHalloCommand.Execute(ARequestFilter);
  Result := FHalloCommand.Parameters[1].Value.GetWideString;
end;

constructor TTestMethodClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TTestMethodClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TTestMethodClient.Destroy;
begin
  FHalloCommand.DisposeOf;
  inherited;
end;

function TCrudClient.SaveToDB(AObject: TModApp; const ARequestFilter: string): Boolean;
begin
  if FSaveToDBCommand = nil then
  begin
    FSaveToDBCommand := FConnection.CreateCommand;
    FSaveToDBCommand.RequestType := 'POST';
    FSaveToDBCommand.Text := 'TCrud."SaveToDB"';
    FSaveToDBCommand.Prepare(TCrud_SaveToDB);
  end;
  if not Assigned(AObject) then
    FSaveToDBCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveToDBCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveToDBCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveToDBCommand.Execute(ARequestFilter);
  Result := FSaveToDBCommand.Parameters[1].Value.GetBoolean;
end;

function TCrudClient.DeleteFromDB(AObject: TModApp; const ARequestFilter: string): Boolean;
begin
  if FDeleteFromDBCommand = nil then
  begin
    FDeleteFromDBCommand := FConnection.CreateCommand;
    FDeleteFromDBCommand.RequestType := 'POST';
    FDeleteFromDBCommand.Text := 'TCrud."DeleteFromDB"';
    FDeleteFromDBCommand.Prepare(TCrud_DeleteFromDB);
  end;
  if not Assigned(AObject) then
    FDeleteFromDBCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteFromDBCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteFromDBCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteFromDBCommand.Execute(ARequestFilter);
  Result := FDeleteFromDBCommand.Parameters[1].Value.GetBoolean;
end;

function TCrudClient.OpenQuery(S: string; const ARequestFilter: string): TDataSet;
begin
  if FOpenQueryCommand = nil then
  begin
    FOpenQueryCommand := FConnection.CreateCommand;
    FOpenQueryCommand.RequestType := 'GET';
    FOpenQueryCommand.Text := 'TCrud.OpenQuery';
    FOpenQueryCommand.Prepare(TCrud_OpenQuery);
  end;
  FOpenQueryCommand.Parameters[0].Value.SetWideString(S);
  FOpenQueryCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FOpenQueryCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FOpenQueryCommand.FreeOnExecute(Result);
end;

function TCrudClient.OpenQuery_Cache(S: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FOpenQueryCommand_Cache = nil then
  begin
    FOpenQueryCommand_Cache := FConnection.CreateCommand;
    FOpenQueryCommand_Cache.RequestType := 'GET';
    FOpenQueryCommand_Cache.Text := 'TCrud.OpenQuery';
    FOpenQueryCommand_Cache.Prepare(TCrud_OpenQuery_Cache);
  end;
  FOpenQueryCommand_Cache.Parameters[0].Value.SetWideString(S);
  FOpenQueryCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FOpenQueryCommand_Cache.Parameters[1].Value.GetString);
end;

function TCrudClient.Retrieve(ModClassName: string; AID: string; const ARequestFilter: string): TModApp;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TCrud.Retrieve';
    FRetrieveCommand.Prepare(TCrud_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveCommand.Parameters[1].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModApp(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudClient.Retrieve_Cache(ModClassName: string; AID: string; const ARequestFilter: string): IDSRestCachedTModApp;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TCrud.Retrieve';
    FRetrieveCommand_Cache.Prepare(TCrud_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveCommand_Cache.Parameters[1].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModApp.Create(FRetrieveCommand_Cache.Parameters[2].Value.GetString);
end;

function TCrudClient.GenerateCustomNo(aTableName: string; aFieldName: string; aCountDigit: Integer; const ARequestFilter: string): string;
begin
  if FGenerateCustomNoCommand = nil then
  begin
    FGenerateCustomNoCommand := FConnection.CreateCommand;
    FGenerateCustomNoCommand.RequestType := 'GET';
    FGenerateCustomNoCommand.Text := 'TCrud.GenerateCustomNo';
    FGenerateCustomNoCommand.Prepare(TCrud_GenerateCustomNo);
  end;
  FGenerateCustomNoCommand.Parameters[0].Value.SetWideString(aTableName);
  FGenerateCustomNoCommand.Parameters[1].Value.SetWideString(aFieldName);
  FGenerateCustomNoCommand.Parameters[2].Value.SetInt32(aCountDigit);
  FGenerateCustomNoCommand.Execute(ARequestFilter);
  Result := FGenerateCustomNoCommand.Parameters[3].Value.GetWideString;
end;

function TCrudClient.GenerateNo(aClassName: string; const ARequestFilter: string): string;
begin
  if FGenerateNoCommand = nil then
  begin
    FGenerateNoCommand := FConnection.CreateCommand;
    FGenerateNoCommand.RequestType := 'GET';
    FGenerateNoCommand.Text := 'TCrud.GenerateNo';
    FGenerateNoCommand.Prepare(TCrud_GenerateNo);
  end;
  FGenerateNoCommand.Parameters[0].Value.SetWideString(aClassName);
  FGenerateNoCommand.Execute(ARequestFilter);
  Result := FGenerateNoCommand.Parameters[1].Value.GetWideString;
end;

function TCrudClient.RetrieveSingle(ModClassName: string; AID: string; const ARequestFilter: string): TModApp;
begin
  if FRetrieveSingleCommand = nil then
  begin
    FRetrieveSingleCommand := FConnection.CreateCommand;
    FRetrieveSingleCommand.RequestType := 'GET';
    FRetrieveSingleCommand.Text := 'TCrud.RetrieveSingle';
    FRetrieveSingleCommand.Prepare(TCrud_RetrieveSingle);
  end;
  FRetrieveSingleCommand.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveSingleCommand.Parameters[1].Value.SetWideString(AID);
  FRetrieveSingleCommand.Execute(ARequestFilter);
  if not FRetrieveSingleCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveSingleCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModApp(FUnMarshal.UnMarshal(FRetrieveSingleCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveSingleCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudClient.RetrieveSingle_Cache(ModClassName: string; AID: string; const ARequestFilter: string): IDSRestCachedTModApp;
begin
  if FRetrieveSingleCommand_Cache = nil then
  begin
    FRetrieveSingleCommand_Cache := FConnection.CreateCommand;
    FRetrieveSingleCommand_Cache.RequestType := 'GET';
    FRetrieveSingleCommand_Cache.Text := 'TCrud.RetrieveSingle';
    FRetrieveSingleCommand_Cache.Prepare(TCrud_RetrieveSingle_Cache);
  end;
  FRetrieveSingleCommand_Cache.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveSingleCommand_Cache.Parameters[1].Value.SetWideString(AID);
  FRetrieveSingleCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModApp.Create(FRetrieveSingleCommand_Cache.Parameters[2].Value.GetString);
end;

function TCrudClient.RetrieveByCode(ModClassName: string; aCode: string; const ARequestFilter: string): TModApp;
begin
  if FRetrieveByCodeCommand = nil then
  begin
    FRetrieveByCodeCommand := FConnection.CreateCommand;
    FRetrieveByCodeCommand.RequestType := 'GET';
    FRetrieveByCodeCommand.Text := 'TCrud.RetrieveByCode';
    FRetrieveByCodeCommand.Prepare(TCrud_RetrieveByCode);
  end;
  FRetrieveByCodeCommand.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveByCodeCommand.Parameters[1].Value.SetWideString(aCode);
  FRetrieveByCodeCommand.Execute(ARequestFilter);
  if not FRetrieveByCodeCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveByCodeCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModApp(FUnMarshal.UnMarshal(FRetrieveByCodeCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveByCodeCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudClient.RetrieveByCode_Cache(ModClassName: string; aCode: string; const ARequestFilter: string): IDSRestCachedTModApp;
begin
  if FRetrieveByCodeCommand_Cache = nil then
  begin
    FRetrieveByCodeCommand_Cache := FConnection.CreateCommand;
    FRetrieveByCodeCommand_Cache.RequestType := 'GET';
    FRetrieveByCodeCommand_Cache.Text := 'TCrud.RetrieveByCode';
    FRetrieveByCodeCommand_Cache.Prepare(TCrud_RetrieveByCode_Cache);
  end;
  FRetrieveByCodeCommand_Cache.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveByCodeCommand_Cache.Parameters[1].Value.SetWideString(aCode);
  FRetrieveByCodeCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModApp.Create(FRetrieveByCodeCommand_Cache.Parameters[2].Value.GetString);
end;

function TCrudClient.SaveToDBLog(AObject: TModApp; const ARequestFilter: string): Boolean;
begin
  if FSaveToDBLogCommand = nil then
  begin
    FSaveToDBLogCommand := FConnection.CreateCommand;
    FSaveToDBLogCommand.RequestType := 'POST';
    FSaveToDBLogCommand.Text := 'TCrud."SaveToDBLog"';
    FSaveToDBLogCommand.Prepare(TCrud_SaveToDBLog);
  end;
  if not Assigned(AObject) then
    FSaveToDBLogCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveToDBLogCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveToDBLogCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveToDBLogCommand.Execute(ARequestFilter);
  Result := FSaveToDBLogCommand.Parameters[1].Value.GetBoolean;
end;

function TCrudClient.SaveToDBID(AObject: TModApp; const ARequestFilter: string): string;
begin
  if FSaveToDBIDCommand = nil then
  begin
    FSaveToDBIDCommand := FConnection.CreateCommand;
    FSaveToDBIDCommand.RequestType := 'POST';
    FSaveToDBIDCommand.Text := 'TCrud."SaveToDBID"';
    FSaveToDBIDCommand.Prepare(TCrud_SaveToDBID);
  end;
  if not Assigned(AObject) then
    FSaveToDBIDCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveToDBIDCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveToDBIDCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveToDBIDCommand.Execute(ARequestFilter);
  Result := FSaveToDBIDCommand.Parameters[1].Value.GetWideString;
end;

function TCrudClient.TestGenerateSQL(AObject: TModApp; const ARequestFilter: string): TStrings;
begin
  if FTestGenerateSQLCommand = nil then
  begin
    FTestGenerateSQLCommand := FConnection.CreateCommand;
    FTestGenerateSQLCommand.RequestType := 'POST';
    FTestGenerateSQLCommand.Text := 'TCrud."TestGenerateSQL"';
    FTestGenerateSQLCommand.Prepare(TCrud_TestGenerateSQL);
  end;
  if not Assigned(AObject) then
    FTestGenerateSQLCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FTestGenerateSQLCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FTestGenerateSQLCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FTestGenerateSQLCommand.Execute(ARequestFilter);
  if not FTestGenerateSQLCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FTestGenerateSQLCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TStrings(FUnMarshal.UnMarshal(FTestGenerateSQLCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FTestGenerateSQLCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudClient.TestGenerateSQL_Cache(AObject: TModApp; const ARequestFilter: string): IDSRestCachedTStrings;
begin
  if FTestGenerateSQLCommand_Cache = nil then
  begin
    FTestGenerateSQLCommand_Cache := FConnection.CreateCommand;
    FTestGenerateSQLCommand_Cache.RequestType := 'POST';
    FTestGenerateSQLCommand_Cache.Text := 'TCrud."TestGenerateSQL"';
    FTestGenerateSQLCommand_Cache.Prepare(TCrud_TestGenerateSQL_Cache);
  end;
  if not Assigned(AObject) then
    FTestGenerateSQLCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FTestGenerateSQLCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FTestGenerateSQLCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FTestGenerateSQLCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTStrings.Create(FTestGenerateSQLCommand_Cache.Parameters[1].Value.GetString);
end;

procedure TCrudClient.AfterExecuteMethod;
begin
  if FAfterExecuteMethodCommand = nil then
  begin
    FAfterExecuteMethodCommand := FConnection.CreateCommand;
    FAfterExecuteMethodCommand.RequestType := 'GET';
    FAfterExecuteMethodCommand.Text := 'TCrud.AfterExecuteMethod';
  end;
  FAfterExecuteMethodCommand.Execute;
end;

constructor TCrudClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TCrudClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TCrudClient.Destroy;
begin
  FSaveToDBCommand.DisposeOf;
  FDeleteFromDBCommand.DisposeOf;
  FOpenQueryCommand.DisposeOf;
  FOpenQueryCommand_Cache.DisposeOf;
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FGenerateCustomNoCommand.DisposeOf;
  FGenerateNoCommand.DisposeOf;
  FRetrieveSingleCommand.DisposeOf;
  FRetrieveSingleCommand_Cache.DisposeOf;
  FRetrieveByCodeCommand.DisposeOf;
  FRetrieveByCodeCommand_Cache.DisposeOf;
  FSaveToDBLogCommand.DisposeOf;
  FSaveToDBIDCommand.DisposeOf;
  FTestGenerateSQLCommand.DisposeOf;
  FTestGenerateSQLCommand_Cache.DisposeOf;
  FAfterExecuteMethodCommand.DisposeOf;
  inherited;
end;

function TDSProviderClient.Bank_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FBank_GetDSOverviewCommand = nil then
  begin
    FBank_GetDSOverviewCommand := FConnection.CreateCommand;
    FBank_GetDSOverviewCommand.RequestType := 'GET';
    FBank_GetDSOverviewCommand.Text := 'TDSProvider.Bank_GetDSOverview';
    FBank_GetDSOverviewCommand.Prepare(TDSProvider_Bank_GetDSOverview);
  end;
  FBank_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FBank_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FBank_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Bank_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FBank_GetDSOverviewCommand_Cache = nil then
  begin
    FBank_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FBank_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FBank_GetDSOverviewCommand_Cache.Text := 'TDSProvider.Bank_GetDSOverview';
    FBank_GetDSOverviewCommand_Cache.Prepare(TDSProvider_Bank_GetDSOverview_Cache);
  end;
  FBank_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FBank_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Rekening_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FRekening_GetDSLookupCommand = nil then
  begin
    FRekening_GetDSLookupCommand := FConnection.CreateCommand;
    FRekening_GetDSLookupCommand.RequestType := 'GET';
    FRekening_GetDSLookupCommand.Text := 'TDSProvider.Rekening_GetDSLookup';
    FRekening_GetDSLookupCommand.Prepare(TDSProvider_Rekening_GetDSLookup);
  end;
  FRekening_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRekening_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRekening_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Rekening_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRekening_GetDSLookupCommand_Cache = nil then
  begin
    FRekening_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FRekening_GetDSLookupCommand_Cache.RequestType := 'GET';
    FRekening_GetDSLookupCommand_Cache.Text := 'TDSProvider.Rekening_GetDSLookup';
    FRekening_GetDSLookupCommand_Cache.Prepare(TDSProvider_Rekening_GetDSLookup_Cache);
  end;
  FRekening_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRekening_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.RefPajak_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FRefPajak_GetDSOverviewCommand = nil then
  begin
    FRefPajak_GetDSOverviewCommand := FConnection.CreateCommand;
    FRefPajak_GetDSOverviewCommand.RequestType := 'GET';
    FRefPajak_GetDSOverviewCommand.Text := 'TDSProvider.RefPajak_GetDSOverview';
    FRefPajak_GetDSOverviewCommand.Prepare(TDSProvider_RefPajak_GetDSOverview);
  end;
  FRefPajak_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRefPajak_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRefPajak_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.RefPajak_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRefPajak_GetDSOverviewCommand_Cache = nil then
  begin
    FRefPajak_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FRefPajak_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FRefPajak_GetDSOverviewCommand_Cache.Text := 'TDSProvider.RefPajak_GetDSOverview';
    FRefPajak_GetDSOverviewCommand_Cache.Prepare(TDSProvider_RefPajak_GetDSOverview_Cache);
  end;
  FRefPajak_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRefPajak_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.RefTipeBarang_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FRefTipeBarang_GetDSOverviewCommand = nil then
  begin
    FRefTipeBarang_GetDSOverviewCommand := FConnection.CreateCommand;
    FRefTipeBarang_GetDSOverviewCommand.RequestType := 'GET';
    FRefTipeBarang_GetDSOverviewCommand.Text := 'TDSProvider.RefTipeBarang_GetDSOverview';
    FRefTipeBarang_GetDSOverviewCommand.Prepare(TDSProvider_RefTipeBarang_GetDSOverview);
  end;
  FRefTipeBarang_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRefTipeBarang_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRefTipeBarang_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.RefTipeBarang_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRefTipeBarang_GetDSOverviewCommand_Cache = nil then
  begin
    FRefTipeBarang_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FRefTipeBarang_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FRefTipeBarang_GetDSOverviewCommand_Cache.Text := 'TDSProvider.RefTipeBarang_GetDSOverview';
    FRefTipeBarang_GetDSOverviewCommand_Cache.Prepare(TDSProvider_RefTipeBarang_GetDSOverview_Cache);
  end;
  FRefTipeBarang_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRefTipeBarang_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.GroupRekening_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FGroupRekening_GetDSLookupCommand = nil then
  begin
    FGroupRekening_GetDSLookupCommand := FConnection.CreateCommand;
    FGroupRekening_GetDSLookupCommand.RequestType := 'GET';
    FGroupRekening_GetDSLookupCommand.Text := 'TDSProvider.GroupRekening_GetDSLookup';
    FGroupRekening_GetDSLookupCommand.Prepare(TDSProvider_GroupRekening_GetDSLookup);
  end;
  FGroupRekening_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FGroupRekening_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FGroupRekening_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.GroupRekening_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FGroupRekening_GetDSLookupCommand_Cache = nil then
  begin
    FGroupRekening_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FGroupRekening_GetDSLookupCommand_Cache.RequestType := 'GET';
    FGroupRekening_GetDSLookupCommand_Cache.Text := 'TDSProvider.GroupRekening_GetDSLookup';
    FGroupRekening_GetDSLookupCommand_Cache.Prepare(TDSProvider_GroupRekening_GetDSLookup_Cache);
  end;
  FGroupRekening_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FGroupRekening_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Rekening_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FRekening_GetDSOverviewCommand = nil then
  begin
    FRekening_GetDSOverviewCommand := FConnection.CreateCommand;
    FRekening_GetDSOverviewCommand.RequestType := 'GET';
    FRekening_GetDSOverviewCommand.Text := 'TDSProvider.Rekening_GetDSOverview';
    FRekening_GetDSOverviewCommand.Prepare(TDSProvider_Rekening_GetDSOverview);
  end;
  FRekening_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRekening_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRekening_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Rekening_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRekening_GetDSOverviewCommand_Cache = nil then
  begin
    FRekening_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FRekening_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FRekening_GetDSOverviewCommand_Cache.Text := 'TDSProvider.Rekening_GetDSOverview';
    FRekening_GetDSOverviewCommand_Cache.Prepare(TDSProvider_Rekening_GetDSOverview_Cache);
  end;
  FRekening_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRekening_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Member_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FMember_GetDSOverviewCommand = nil then
  begin
    FMember_GetDSOverviewCommand := FConnection.CreateCommand;
    FMember_GetDSOverviewCommand.RequestType := 'GET';
    FMember_GetDSOverviewCommand.Text := 'TDSProvider.Member_GetDSOverview';
    FMember_GetDSOverviewCommand.Prepare(TDSProvider_Member_GetDSOverview);
  end;
  FMember_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FMember_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FMember_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Member_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FMember_GetDSOverviewCommand_Cache = nil then
  begin
    FMember_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FMember_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FMember_GetDSOverviewCommand_Cache.Text := 'TDSProvider.Member_GetDSOverview';
    FMember_GetDSOverviewCommand_Cache.Prepare(TDSProvider_Member_GetDSOverview_Cache);
  end;
  FMember_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FMember_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.MemberActivasi_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FMemberActivasi_GetDSOverviewCommand = nil then
  begin
    FMemberActivasi_GetDSOverviewCommand := FConnection.CreateCommand;
    FMemberActivasi_GetDSOverviewCommand.RequestType := 'GET';
    FMemberActivasi_GetDSOverviewCommand.Text := 'TDSProvider.MemberActivasi_GetDSOverview';
    FMemberActivasi_GetDSOverviewCommand.Prepare(TDSProvider_MemberActivasi_GetDSOverview);
  end;
  FMemberActivasi_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FMemberActivasi_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FMemberActivasi_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.MemberActivasi_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FMemberActivasi_GetDSOverviewCommand_Cache = nil then
  begin
    FMemberActivasi_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FMemberActivasi_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FMemberActivasi_GetDSOverviewCommand_Cache.Text := 'TDSProvider.MemberActivasi_GetDSOverview';
    FMemberActivasi_GetDSOverviewCommand_Cache.Prepare(TDSProvider_MemberActivasi_GetDSOverview_Cache);
  end;
  FMemberActivasi_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FMemberActivasi_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.RefDiscMember_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FRefDiscMember_GetDSOverviewCommand = nil then
  begin
    FRefDiscMember_GetDSOverviewCommand := FConnection.CreateCommand;
    FRefDiscMember_GetDSOverviewCommand.RequestType := 'GET';
    FRefDiscMember_GetDSOverviewCommand.Text := 'TDSProvider.RefDiscMember_GetDSOverview';
    FRefDiscMember_GetDSOverviewCommand.Prepare(TDSProvider_RefDiscMember_GetDSOverview);
  end;
  FRefDiscMember_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRefDiscMember_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRefDiscMember_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.RefDiscMember_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRefDiscMember_GetDSOverviewCommand_Cache = nil then
  begin
    FRefDiscMember_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FRefDiscMember_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FRefDiscMember_GetDSOverviewCommand_Cache.Text := 'TDSProvider.RefDiscMember_GetDSOverview';
    FRefDiscMember_GetDSOverviewCommand_Cache.Prepare(TDSProvider_RefDiscMember_GetDSOverview_Cache);
  end;
  FRefDiscMember_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRefDiscMember_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.MemberKeluarga_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FMemberKeluarga_GetDSOverviewCommand = nil then
  begin
    FMemberKeluarga_GetDSOverviewCommand := FConnection.CreateCommand;
    FMemberKeluarga_GetDSOverviewCommand.RequestType := 'GET';
    FMemberKeluarga_GetDSOverviewCommand.Text := 'TDSProvider.MemberKeluarga_GetDSOverview';
    FMemberKeluarga_GetDSOverviewCommand.Prepare(TDSProvider_MemberKeluarga_GetDSOverview);
  end;
  FMemberKeluarga_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FMemberKeluarga_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FMemberKeluarga_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.MemberKeluarga_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FMemberKeluarga_GetDSOverviewCommand_Cache = nil then
  begin
    FMemberKeluarga_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FMemberKeluarga_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FMemberKeluarga_GetDSOverviewCommand_Cache.Text := 'TDSProvider.MemberKeluarga_GetDSOverview';
    FMemberKeluarga_GetDSOverviewCommand_Cache.Prepare(TDSProvider_MemberKeluarga_GetDSOverview_Cache);
  end;
  FMemberKeluarga_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FMemberKeluarga_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.RefGrupMember_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FRefGrupMember_GetDSOverviewCommand = nil then
  begin
    FRefGrupMember_GetDSOverviewCommand := FConnection.CreateCommand;
    FRefGrupMember_GetDSOverviewCommand.RequestType := 'GET';
    FRefGrupMember_GetDSOverviewCommand.Text := 'TDSProvider.RefGrupMember_GetDSOverview';
    FRefGrupMember_GetDSOverviewCommand.Prepare(TDSProvider_RefGrupMember_GetDSOverview);
  end;
  FRefGrupMember_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRefGrupMember_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRefGrupMember_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.RefGrupMember_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRefGrupMember_GetDSOverviewCommand_Cache = nil then
  begin
    FRefGrupMember_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FRefGrupMember_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FRefGrupMember_GetDSOverviewCommand_Cache.Text := 'TDSProvider.RefGrupMember_GetDSOverview';
    FRefGrupMember_GetDSOverviewCommand_Cache.Prepare(TDSProvider_RefGrupMember_GetDSOverview_Cache);
  end;
  FRefGrupMember_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRefGrupMember_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Satuan_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FSatuan_GetDSLookupCommand = nil then
  begin
    FSatuan_GetDSLookupCommand := FConnection.CreateCommand;
    FSatuan_GetDSLookupCommand.RequestType := 'GET';
    FSatuan_GetDSLookupCommand.Text := 'TDSProvider.Satuan_GetDSLookup';
    FSatuan_GetDSLookupCommand.Prepare(TDSProvider_Satuan_GetDSLookup);
  end;
  FSatuan_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FSatuan_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FSatuan_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Satuan_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FSatuan_GetDSLookupCommand_Cache = nil then
  begin
    FSatuan_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FSatuan_GetDSLookupCommand_Cache.RequestType := 'GET';
    FSatuan_GetDSLookupCommand_Cache.Text := 'TDSProvider.Satuan_GetDSLookup';
    FSatuan_GetDSLookupCommand_Cache.Prepare(TDSProvider_Satuan_GetDSLookup_Cache);
  end;
  FSatuan_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FSatuan_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.CostCenter_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FCostCenter_GetDSLookupCommand = nil then
  begin
    FCostCenter_GetDSLookupCommand := FConnection.CreateCommand;
    FCostCenter_GetDSLookupCommand.RequestType := 'GET';
    FCostCenter_GetDSLookupCommand.Text := 'TDSProvider.CostCenter_GetDSLookup';
    FCostCenter_GetDSLookupCommand.Prepare(TDSProvider_CostCenter_GetDSLookup);
  end;
  FCostCenter_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FCostCenter_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FCostCenter_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.CostCenter_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FCostCenter_GetDSLookupCommand_Cache = nil then
  begin
    FCostCenter_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FCostCenter_GetDSLookupCommand_Cache.RequestType := 'GET';
    FCostCenter_GetDSLookupCommand_Cache.Text := 'TDSProvider.CostCenter_GetDSLookup';
    FCostCenter_GetDSLookupCommand_Cache.Prepare(TDSProvider_CostCenter_GetDSLookup_Cache);
  end;
  FCostCenter_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FCostCenter_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Company_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FCompany_GetDSLookupCommand = nil then
  begin
    FCompany_GetDSLookupCommand := FConnection.CreateCommand;
    FCompany_GetDSLookupCommand.RequestType := 'GET';
    FCompany_GetDSLookupCommand.Text := 'TDSProvider.Company_GetDSLookup';
    FCompany_GetDSLookupCommand.Prepare(TDSProvider_Company_GetDSLookup);
  end;
  FCompany_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FCompany_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FCompany_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Company_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FCompany_GetDSLookupCommand_Cache = nil then
  begin
    FCompany_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FCompany_GetDSLookupCommand_Cache.RequestType := 'GET';
    FCompany_GetDSLookupCommand_Cache.Text := 'TDSProvider.Company_GetDSLookup';
    FCompany_GetDSLookupCommand_Cache.Prepare(TDSProvider_Company_GetDSLookup_Cache);
  end;
  FCompany_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FCompany_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.CostCenter_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FCostCenter_GetDSOverviewCommand = nil then
  begin
    FCostCenter_GetDSOverviewCommand := FConnection.CreateCommand;
    FCostCenter_GetDSOverviewCommand.RequestType := 'GET';
    FCostCenter_GetDSOverviewCommand.Text := 'TDSProvider.CostCenter_GetDSOverview';
    FCostCenter_GetDSOverviewCommand.Prepare(TDSProvider_CostCenter_GetDSOverview);
  end;
  FCostCenter_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FCostCenter_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FCostCenter_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.CostCenter_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FCostCenter_GetDSOverviewCommand_Cache = nil then
  begin
    FCostCenter_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FCostCenter_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FCostCenter_GetDSOverviewCommand_Cache.Text := 'TDSProvider.CostCenter_GetDSOverview';
    FCostCenter_GetDSOverviewCommand_Cache.Prepare(TDSProvider_CostCenter_GetDSOverview_Cache);
  end;
  FCostCenter_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FCostCenter_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Company_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FCompany_GetDSOverviewCommand = nil then
  begin
    FCompany_GetDSOverviewCommand := FConnection.CreateCommand;
    FCompany_GetDSOverviewCommand.RequestType := 'GET';
    FCompany_GetDSOverviewCommand.Text := 'TDSProvider.Company_GetDSOverview';
    FCompany_GetDSOverviewCommand.Prepare(TDSProvider_Company_GetDSOverview);
  end;
  FCompany_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FCompany_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FCompany_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Company_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FCompany_GetDSOverviewCommand_Cache = nil then
  begin
    FCompany_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FCompany_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FCompany_GetDSOverviewCommand_Cache.Text := 'TDSProvider.Company_GetDSOverview';
    FCompany_GetDSOverviewCommand_Cache.Prepare(TDSProvider_Company_GetDSOverview_Cache);
  end;
  FCompany_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FCompany_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.TipePembayaran_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FTipePembayaran_GetDSOverviewCommand = nil then
  begin
    FTipePembayaran_GetDSOverviewCommand := FConnection.CreateCommand;
    FTipePembayaran_GetDSOverviewCommand.RequestType := 'GET';
    FTipePembayaran_GetDSOverviewCommand.Text := 'TDSProvider.TipePembayaran_GetDSOverview';
    FTipePembayaran_GetDSOverviewCommand.Prepare(TDSProvider_TipePembayaran_GetDSOverview);
  end;
  FTipePembayaran_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FTipePembayaran_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FTipePembayaran_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.TipePembayaran_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FTipePembayaran_GetDSOverviewCommand_Cache = nil then
  begin
    FTipePembayaran_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FTipePembayaran_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FTipePembayaran_GetDSOverviewCommand_Cache.Text := 'TDSProvider.TipePembayaran_GetDSOverview';
    FTipePembayaran_GetDSOverviewCommand_Cache.Prepare(TDSProvider_TipePembayaran_GetDSOverview_Cache);
  end;
  FTipePembayaran_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FTipePembayaran_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.TipePerusahaan_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FTipePerusahaan_GetDSOverviewCommand = nil then
  begin
    FTipePerusahaan_GetDSOverviewCommand := FConnection.CreateCommand;
    FTipePerusahaan_GetDSOverviewCommand.RequestType := 'GET';
    FTipePerusahaan_GetDSOverviewCommand.Text := 'TDSProvider.TipePerusahaan_GetDSOverview';
    FTipePerusahaan_GetDSOverviewCommand.Prepare(TDSProvider_TipePerusahaan_GetDSOverview);
  end;
  FTipePerusahaan_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FTipePerusahaan_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FTipePerusahaan_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.TipePerusahaan_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FTipePerusahaan_GetDSOverviewCommand_Cache = nil then
  begin
    FTipePerusahaan_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FTipePerusahaan_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FTipePerusahaan_GetDSOverviewCommand_Cache.Text := 'TDSProvider.TipePerusahaan_GetDSOverview';
    FTipePerusahaan_GetDSOverviewCommand_Cache.Prepare(TDSProvider_TipePerusahaan_GetDSOverview_Cache);
  end;
  FTipePerusahaan_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FTipePerusahaan_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Outlet_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FOutlet_GetDSLookupCommand = nil then
  begin
    FOutlet_GetDSLookupCommand := FConnection.CreateCommand;
    FOutlet_GetDSLookupCommand.RequestType := 'GET';
    FOutlet_GetDSLookupCommand.Text := 'TDSProvider.Outlet_GetDSLookup';
    FOutlet_GetDSLookupCommand.Prepare(TDSProvider_Outlet_GetDSLookup);
  end;
  FOutlet_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FOutlet_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FOutlet_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Outlet_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FOutlet_GetDSLookupCommand_Cache = nil then
  begin
    FOutlet_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FOutlet_GetDSLookupCommand_Cache.RequestType := 'GET';
    FOutlet_GetDSLookupCommand_Cache.Text := 'TDSProvider.Outlet_GetDSLookup';
    FOutlet_GetDSLookupCommand_Cache.Prepare(TDSProvider_Outlet_GetDSLookup_Cache);
  end;
  FOutlet_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FOutlet_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Lokasi_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FLokasi_GetDSLookupCommand = nil then
  begin
    FLokasi_GetDSLookupCommand := FConnection.CreateCommand;
    FLokasi_GetDSLookupCommand.RequestType := 'GET';
    FLokasi_GetDSLookupCommand.Text := 'TDSProvider.Lokasi_GetDSLookup';
    FLokasi_GetDSLookupCommand.Prepare(TDSProvider_Lokasi_GetDSLookup);
  end;
  FLokasi_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FLokasi_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FLokasi_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Lokasi_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FLokasi_GetDSLookupCommand_Cache = nil then
  begin
    FLokasi_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FLokasi_GetDSLookupCommand_Cache.RequestType := 'GET';
    FLokasi_GetDSLookupCommand_Cache.Text := 'TDSProvider.Lokasi_GetDSLookup';
    FLokasi_GetDSLookupCommand_Cache.Prepare(TDSProvider_Lokasi_GetDSLookup_Cache);
  end;
  FLokasi_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FLokasi_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Merchandise_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FMerchandise_GetDSLookupCommand = nil then
  begin
    FMerchandise_GetDSLookupCommand := FConnection.CreateCommand;
    FMerchandise_GetDSLookupCommand.RequestType := 'GET';
    FMerchandise_GetDSLookupCommand.Text := 'TDSProvider.Merchandise_GetDSLookup';
    FMerchandise_GetDSLookupCommand.Prepare(TDSProvider_Merchandise_GetDSLookup);
  end;
  FMerchandise_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FMerchandise_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FMerchandise_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Merchandise_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FMerchandise_GetDSLookupCommand_Cache = nil then
  begin
    FMerchandise_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FMerchandise_GetDSLookupCommand_Cache.RequestType := 'GET';
    FMerchandise_GetDSLookupCommand_Cache.Text := 'TDSProvider.Merchandise_GetDSLookup';
    FMerchandise_GetDSLookupCommand_Cache.Prepare(TDSProvider_Merchandise_GetDSLookup_Cache);
  end;
  FMerchandise_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FMerchandise_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.MerchandiseGroup_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FMerchandiseGroup_GetDSLookupCommand = nil then
  begin
    FMerchandiseGroup_GetDSLookupCommand := FConnection.CreateCommand;
    FMerchandiseGroup_GetDSLookupCommand.RequestType := 'GET';
    FMerchandiseGroup_GetDSLookupCommand.Text := 'TDSProvider.MerchandiseGroup_GetDSLookup';
    FMerchandiseGroup_GetDSLookupCommand.Prepare(TDSProvider_MerchandiseGroup_GetDSLookup);
  end;
  FMerchandiseGroup_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FMerchandiseGroup_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FMerchandiseGroup_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.MerchandiseGroup_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FMerchandiseGroup_GetDSLookupCommand_Cache = nil then
  begin
    FMerchandiseGroup_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FMerchandiseGroup_GetDSLookupCommand_Cache.RequestType := 'GET';
    FMerchandiseGroup_GetDSLookupCommand_Cache.Text := 'TDSProvider.MerchandiseGroup_GetDSLookup';
    FMerchandiseGroup_GetDSLookupCommand_Cache.Prepare(TDSProvider_MerchandiseGroup_GetDSLookup_Cache);
  end;
  FMerchandiseGroup_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FMerchandiseGroup_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.SubGroup_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FSubGroup_GetDSLookupCommand = nil then
  begin
    FSubGroup_GetDSLookupCommand := FConnection.CreateCommand;
    FSubGroup_GetDSLookupCommand.RequestType := 'GET';
    FSubGroup_GetDSLookupCommand.Text := 'TDSProvider.SubGroup_GetDSLookup';
    FSubGroup_GetDSLookupCommand.Prepare(TDSProvider_SubGroup_GetDSLookup);
  end;
  FSubGroup_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FSubGroup_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FSubGroup_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.SubGroup_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FSubGroup_GetDSLookupCommand_Cache = nil then
  begin
    FSubGroup_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FSubGroup_GetDSLookupCommand_Cache.RequestType := 'GET';
    FSubGroup_GetDSLookupCommand_Cache.Text := 'TDSProvider.SubGroup_GetDSLookup';
    FSubGroup_GetDSLookupCommand_Cache.Prepare(TDSProvider_SubGroup_GetDSLookup_Cache);
  end;
  FSubGroup_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FSubGroup_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Satuan_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FSatuan_GetDSOverviewCommand = nil then
  begin
    FSatuan_GetDSOverviewCommand := FConnection.CreateCommand;
    FSatuan_GetDSOverviewCommand.RequestType := 'GET';
    FSatuan_GetDSOverviewCommand.Text := 'TDSProvider.Satuan_GetDSOverview';
    FSatuan_GetDSOverviewCommand.Prepare(TDSProvider_Satuan_GetDSOverview);
  end;
  FSatuan_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FSatuan_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FSatuan_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Satuan_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FSatuan_GetDSOverviewCommand_Cache = nil then
  begin
    FSatuan_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FSatuan_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FSatuan_GetDSOverviewCommand_Cache.Text := 'TDSProvider.Satuan_GetDSOverview';
    FSatuan_GetDSOverviewCommand_Cache.Prepare(TDSProvider_Satuan_GetDSOverview_Cache);
  end;
  FSatuan_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FSatuan_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Kategori_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FKategori_GetDSLookupCommand = nil then
  begin
    FKategori_GetDSLookupCommand := FConnection.CreateCommand;
    FKategori_GetDSLookupCommand.RequestType := 'GET';
    FKategori_GetDSLookupCommand.Text := 'TDSProvider.Kategori_GetDSLookup';
    FKategori_GetDSLookupCommand.Prepare(TDSProvider_Kategori_GetDSLookup);
  end;
  FKategori_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FKategori_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FKategori_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Kategori_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FKategori_GetDSLookupCommand_Cache = nil then
  begin
    FKategori_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FKategori_GetDSLookupCommand_Cache.RequestType := 'GET';
    FKategori_GetDSLookupCommand_Cache.Text := 'TDSProvider.Kategori_GetDSLookup';
    FKategori_GetDSLookupCommand_Cache.Prepare(TDSProvider_Kategori_GetDSLookup_Cache);
  end;
  FKategori_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FKategori_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Merk_GetDSLookUp(const ARequestFilter: string): TDataSet;
begin
  if FMerk_GetDSLookUpCommand = nil then
  begin
    FMerk_GetDSLookUpCommand := FConnection.CreateCommand;
    FMerk_GetDSLookUpCommand.RequestType := 'GET';
    FMerk_GetDSLookUpCommand.Text := 'TDSProvider.Merk_GetDSLookUp';
    FMerk_GetDSLookUpCommand.Prepare(TDSProvider_Merk_GetDSLookUp);
  end;
  FMerk_GetDSLookUpCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FMerk_GetDSLookUpCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FMerk_GetDSLookUpCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Merk_GetDSLookUp_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FMerk_GetDSLookUpCommand_Cache = nil then
  begin
    FMerk_GetDSLookUpCommand_Cache := FConnection.CreateCommand;
    FMerk_GetDSLookUpCommand_Cache.RequestType := 'GET';
    FMerk_GetDSLookUpCommand_Cache.Text := 'TDSProvider.Merk_GetDSLookUp';
    FMerk_GetDSLookUpCommand_Cache.Prepare(TDSProvider_Merk_GetDSLookUp_Cache);
  end;
  FMerk_GetDSLookUpCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FMerk_GetDSLookUpCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.RefPajak_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FRefPajak_GetDSLookupCommand = nil then
  begin
    FRefPajak_GetDSLookupCommand := FConnection.CreateCommand;
    FRefPajak_GetDSLookupCommand.RequestType := 'GET';
    FRefPajak_GetDSLookupCommand.Text := 'TDSProvider.RefPajak_GetDSLookup';
    FRefPajak_GetDSLookupCommand.Prepare(TDSProvider_RefPajak_GetDSLookup);
  end;
  FRefPajak_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRefPajak_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRefPajak_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.RefPajak_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRefPajak_GetDSLookupCommand_Cache = nil then
  begin
    FRefPajak_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FRefPajak_GetDSLookupCommand_Cache.RequestType := 'GET';
    FRefPajak_GetDSLookupCommand_Cache.Text := 'TDSProvider.RefPajak_GetDSLookup';
    FRefPajak_GetDSLookupCommand_Cache.Prepare(TDSProvider_RefPajak_GetDSLookup_Cache);
  end;
  FRefPajak_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRefPajak_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.RefTipeBarang_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FRefTipeBarang_GetDSLookupCommand = nil then
  begin
    FRefTipeBarang_GetDSLookupCommand := FConnection.CreateCommand;
    FRefTipeBarang_GetDSLookupCommand.RequestType := 'GET';
    FRefTipeBarang_GetDSLookupCommand.Text := 'TDSProvider.RefTipeBarang_GetDSLookup';
    FRefTipeBarang_GetDSLookupCommand.Prepare(TDSProvider_RefTipeBarang_GetDSLookup);
  end;
  FRefTipeBarang_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRefTipeBarang_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRefTipeBarang_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.RefTipeBarang_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRefTipeBarang_GetDSLookupCommand_Cache = nil then
  begin
    FRefTipeBarang_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FRefTipeBarang_GetDSLookupCommand_Cache.RequestType := 'GET';
    FRefTipeBarang_GetDSLookupCommand_Cache.Text := 'TDSProvider.RefTipeBarang_GetDSLookup';
    FRefTipeBarang_GetDSLookupCommand_Cache.Prepare(TDSProvider_RefTipeBarang_GetDSLookup_Cache);
  end;
  FRefTipeBarang_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRefTipeBarang_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.TipeSuplier_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FTipeSuplier_GetDSOverviewCommand = nil then
  begin
    FTipeSuplier_GetDSOverviewCommand := FConnection.CreateCommand;
    FTipeSuplier_GetDSOverviewCommand.RequestType := 'GET';
    FTipeSuplier_GetDSOverviewCommand.Text := 'TDSProvider.TipeSuplier_GetDSOverview';
    FTipeSuplier_GetDSOverviewCommand.Prepare(TDSProvider_TipeSuplier_GetDSOverview);
  end;
  FTipeSuplier_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FTipeSuplier_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FTipeSuplier_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.TipeSuplier_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FTipeSuplier_GetDSOverviewCommand_Cache = nil then
  begin
    FTipeSuplier_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FTipeSuplier_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FTipeSuplier_GetDSOverviewCommand_Cache.Text := 'TDSProvider.TipeSuplier_GetDSOverview';
    FTipeSuplier_GetDSOverviewCommand_Cache.Prepare(TDSProvider_TipeSuplier_GetDSOverview_Cache);
  end;
  FTipeSuplier_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FTipeSuplier_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Unit_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FUnit_GetDSOverviewCommand = nil then
  begin
    FUnit_GetDSOverviewCommand := FConnection.CreateCommand;
    FUnit_GetDSOverviewCommand.RequestType := 'GET';
    FUnit_GetDSOverviewCommand.Text := 'TDSProvider.Unit_GetDSOverview';
    FUnit_GetDSOverviewCommand.Prepare(TDSProvider_Unit_GetDSOverview);
  end;
  FUnit_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FUnit_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FUnit_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Unit_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FUnit_GetDSOverviewCommand_Cache = nil then
  begin
    FUnit_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FUnit_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FUnit_GetDSOverviewCommand_Cache.Text := 'TDSProvider.Unit_GetDSOverview';
    FUnit_GetDSOverviewCommand_Cache.Prepare(TDSProvider_Unit_GetDSOverview_Cache);
  end;
  FUnit_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FUnit_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Unit_GetDSLookUp(const ARequestFilter: string): TDataSet;
begin
  if FUnit_GetDSLookUpCommand = nil then
  begin
    FUnit_GetDSLookUpCommand := FConnection.CreateCommand;
    FUnit_GetDSLookUpCommand.RequestType := 'GET';
    FUnit_GetDSLookUpCommand.Text := 'TDSProvider.Unit_GetDSLookUp';
    FUnit_GetDSLookUpCommand.Prepare(TDSProvider_Unit_GetDSLookUp);
  end;
  FUnit_GetDSLookUpCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FUnit_GetDSLookUpCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FUnit_GetDSLookUpCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Unit_GetDSLookUp_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FUnit_GetDSLookUpCommand_Cache = nil then
  begin
    FUnit_GetDSLookUpCommand_Cache := FConnection.CreateCommand;
    FUnit_GetDSLookUpCommand_Cache.RequestType := 'GET';
    FUnit_GetDSLookUpCommand_Cache.Text := 'TDSProvider.Unit_GetDSLookUp';
    FUnit_GetDSLookUpCommand_Cache.Prepare(TDSProvider_Unit_GetDSLookUp_Cache);
  end;
  FUnit_GetDSLookUpCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FUnit_GetDSLookUpCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.UnitType_GetDSLookUp(const ARequestFilter: string): TDataSet;
begin
  if FUnitType_GetDSLookUpCommand = nil then
  begin
    FUnitType_GetDSLookUpCommand := FConnection.CreateCommand;
    FUnitType_GetDSLookUpCommand.RequestType := 'GET';
    FUnitType_GetDSLookUpCommand.Text := 'TDSProvider.UnitType_GetDSLookUp';
    FUnitType_GetDSLookUpCommand.Prepare(TDSProvider_UnitType_GetDSLookUp);
  end;
  FUnitType_GetDSLookUpCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FUnitType_GetDSLookUpCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FUnitType_GetDSLookUpCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.UnitType_GetDSLookUp_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FUnitType_GetDSLookUpCommand_Cache = nil then
  begin
    FUnitType_GetDSLookUpCommand_Cache := FConnection.CreateCommand;
    FUnitType_GetDSLookUpCommand_Cache.RequestType := 'GET';
    FUnitType_GetDSLookUpCommand_Cache.Text := 'TDSProvider.UnitType_GetDSLookUp';
    FUnitType_GetDSLookUpCommand_Cache.Prepare(TDSProvider_UnitType_GetDSLookUp_Cache);
  end;
  FUnitType_GetDSLookUpCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FUnitType_GetDSLookUpCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.UnitType_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FUnitType_GetDSOverviewCommand = nil then
  begin
    FUnitType_GetDSOverviewCommand := FConnection.CreateCommand;
    FUnitType_GetDSOverviewCommand.RequestType := 'GET';
    FUnitType_GetDSOverviewCommand.Text := 'TDSProvider.UnitType_GetDSOverview';
    FUnitType_GetDSOverviewCommand.Prepare(TDSProvider_UnitType_GetDSOverview);
  end;
  FUnitType_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FUnitType_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FUnitType_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.UnitType_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FUnitType_GetDSOverviewCommand_Cache = nil then
  begin
    FUnitType_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FUnitType_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FUnitType_GetDSOverviewCommand_Cache.Text := 'TDSProvider.UnitType_GetDSOverview';
    FUnitType_GetDSOverviewCommand_Cache.Prepare(TDSProvider_UnitType_GetDSOverview_Cache);
  end;
  FUnitType_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FUnitType_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.App_GetDSLookUp(const ARequestFilter: string): TDataSet;
begin
  if FApp_GetDSLookUpCommand = nil then
  begin
    FApp_GetDSLookUpCommand := FConnection.CreateCommand;
    FApp_GetDSLookUpCommand.RequestType := 'GET';
    FApp_GetDSLookUpCommand.Text := 'TDSProvider.App_GetDSLookUp';
    FApp_GetDSLookUpCommand.Prepare(TDSProvider_App_GetDSLookUp);
  end;
  FApp_GetDSLookUpCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FApp_GetDSLookUpCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FApp_GetDSLookUpCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.App_GetDSLookUp_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FApp_GetDSLookUpCommand_Cache = nil then
  begin
    FApp_GetDSLookUpCommand_Cache := FConnection.CreateCommand;
    FApp_GetDSLookUpCommand_Cache.RequestType := 'GET';
    FApp_GetDSLookUpCommand_Cache.Text := 'TDSProvider.App_GetDSLookUp';
    FApp_GetDSLookUpCommand_Cache.Prepare(TDSProvider_App_GetDSLookUp_Cache);
  end;
  FApp_GetDSLookUpCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FApp_GetDSLookUpCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.App_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FApp_GetDSOverviewCommand = nil then
  begin
    FApp_GetDSOverviewCommand := FConnection.CreateCommand;
    FApp_GetDSOverviewCommand.RequestType := 'GET';
    FApp_GetDSOverviewCommand.Text := 'TDSProvider.App_GetDSOverview';
    FApp_GetDSOverviewCommand.Prepare(TDSProvider_App_GetDSOverview);
  end;
  FApp_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FApp_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FApp_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.App_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FApp_GetDSOverviewCommand_Cache = nil then
  begin
    FApp_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FApp_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FApp_GetDSOverviewCommand_Cache.Text := 'TDSProvider.App_GetDSOverview';
    FApp_GetDSOverviewCommand_Cache.Prepare(TDSProvider_App_GetDSOverview_Cache);
  end;
  FApp_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FApp_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Bank_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FBank_GetDSLookupCommand = nil then
  begin
    FBank_GetDSLookupCommand := FConnection.CreateCommand;
    FBank_GetDSLookupCommand.RequestType := 'GET';
    FBank_GetDSLookupCommand.Text := 'TDSProvider.Bank_GetDSLookup';
    FBank_GetDSLookupCommand.Prepare(TDSProvider_Bank_GetDSLookup);
  end;
  FBank_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FBank_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FBank_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Bank_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FBank_GetDSLookupCommand_Cache = nil then
  begin
    FBank_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FBank_GetDSLookupCommand_Cache.RequestType := 'GET';
    FBank_GetDSLookupCommand_Cache.Text := 'TDSProvider.Bank_GetDSLookup';
    FBank_GetDSLookupCommand_Cache.Prepare(TDSProvider_Bank_GetDSLookup_Cache);
  end;
  FBank_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FBank_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Barang_GetDSOverview(aMerchanGroupID: string; AProductCode: string; const ARequestFilter: string): TDataSet;
begin
  if FBarang_GetDSOverviewCommand = nil then
  begin
    FBarang_GetDSOverviewCommand := FConnection.CreateCommand;
    FBarang_GetDSOverviewCommand.RequestType := 'GET';
    FBarang_GetDSOverviewCommand.Text := 'TDSProvider.Barang_GetDSOverview';
    FBarang_GetDSOverviewCommand.Prepare(TDSProvider_Barang_GetDSOverview);
  end;
  FBarang_GetDSOverviewCommand.Parameters[0].Value.SetWideString(aMerchanGroupID);
  FBarang_GetDSOverviewCommand.Parameters[1].Value.SetWideString(AProductCode);
  FBarang_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FBarang_GetDSOverviewCommand.Parameters[2].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FBarang_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Barang_GetDSOverview_Cache(aMerchanGroupID: string; AProductCode: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FBarang_GetDSOverviewCommand_Cache = nil then
  begin
    FBarang_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FBarang_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FBarang_GetDSOverviewCommand_Cache.Text := 'TDSProvider.Barang_GetDSOverview';
    FBarang_GetDSOverviewCommand_Cache.Prepare(TDSProvider_Barang_GetDSOverview_Cache);
  end;
  FBarang_GetDSOverviewCommand_Cache.Parameters[0].Value.SetWideString(aMerchanGroupID);
  FBarang_GetDSOverviewCommand_Cache.Parameters[1].Value.SetWideString(AProductCode);
  FBarang_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FBarang_GetDSOverviewCommand_Cache.Parameters[2].Value.GetString);
end;

function TDSProviderClient.Gudang_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FGudang_GetDSOverviewCommand = nil then
  begin
    FGudang_GetDSOverviewCommand := FConnection.CreateCommand;
    FGudang_GetDSOverviewCommand.RequestType := 'GET';
    FGudang_GetDSOverviewCommand.Text := 'TDSProvider.Gudang_GetDSOverview';
    FGudang_GetDSOverviewCommand.Prepare(TDSProvider_Gudang_GetDSOverview);
  end;
  FGudang_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FGudang_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FGudang_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Gudang_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FGudang_GetDSOverviewCommand_Cache = nil then
  begin
    FGudang_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FGudang_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FGudang_GetDSOverviewCommand_Cache.Text := 'TDSProvider.Gudang_GetDSOverview';
    FGudang_GetDSOverviewCommand_Cache.Prepare(TDSProvider_Gudang_GetDSOverview_Cache);
  end;
  FGudang_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FGudang_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.RefTipeMember_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FRefTipeMember_GetDSOverviewCommand = nil then
  begin
    FRefTipeMember_GetDSOverviewCommand := FConnection.CreateCommand;
    FRefTipeMember_GetDSOverviewCommand.RequestType := 'GET';
    FRefTipeMember_GetDSOverviewCommand.Text := 'TDSProvider.RefTipeMember_GetDSOverview';
    FRefTipeMember_GetDSOverviewCommand.Prepare(TDSProvider_RefTipeMember_GetDSOverview);
  end;
  FRefTipeMember_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRefTipeMember_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRefTipeMember_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.RefTipeMember_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRefTipeMember_GetDSOverviewCommand_Cache = nil then
  begin
    FRefTipeMember_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FRefTipeMember_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FRefTipeMember_GetDSOverviewCommand_Cache.Text := 'TDSProvider.RefTipeMember_GetDSOverview';
    FRefTipeMember_GetDSOverviewCommand_Cache.Prepare(TDSProvider_RefTipeMember_GetDSOverview_Cache);
  end;
  FRefTipeMember_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRefTipeMember_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.AutAPP_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FAutAPP_GetDSLookupCommand = nil then
  begin
    FAutAPP_GetDSLookupCommand := FConnection.CreateCommand;
    FAutAPP_GetDSLookupCommand.RequestType := 'GET';
    FAutAPP_GetDSLookupCommand.Text := 'TDSProvider.AutAPP_GetDSLookup';
    FAutAPP_GetDSLookupCommand.Prepare(TDSProvider_AutAPP_GetDSLookup);
  end;
  FAutAPP_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FAutAPP_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FAutAPP_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.AutAPP_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FAutAPP_GetDSLookupCommand_Cache = nil then
  begin
    FAutAPP_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FAutAPP_GetDSLookupCommand_Cache.RequestType := 'GET';
    FAutAPP_GetDSLookupCommand_Cache.Text := 'TDSProvider.AutAPP_GetDSLookup';
    FAutAPP_GetDSLookupCommand_Cache.Prepare(TDSProvider_AutAPP_GetDSLookup_Cache);
  end;
  FAutAPP_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FAutAPP_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.TipeKirimPO_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FTipeKirimPO_GetDSOverviewCommand = nil then
  begin
    FTipeKirimPO_GetDSOverviewCommand := FConnection.CreateCommand;
    FTipeKirimPO_GetDSOverviewCommand.RequestType := 'GET';
    FTipeKirimPO_GetDSOverviewCommand.Text := 'TDSProvider.TipeKirimPO_GetDSOverview';
    FTipeKirimPO_GetDSOverviewCommand.Prepare(TDSProvider_TipeKirimPO_GetDSOverview);
  end;
  FTipeKirimPO_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FTipeKirimPO_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FTipeKirimPO_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.TipeKirimPO_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FTipeKirimPO_GetDSOverviewCommand_Cache = nil then
  begin
    FTipeKirimPO_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FTipeKirimPO_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FTipeKirimPO_GetDSOverviewCommand_Cache.Text := 'TDSProvider.TipeKirimPO_GetDSOverview';
    FTipeKirimPO_GetDSOverviewCommand_Cache.Prepare(TDSProvider_TipeKirimPO_GetDSOverview_Cache);
  end;
  FTipeKirimPO_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FTipeKirimPO_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.SuplierGroup_GetDSOverview1(const ARequestFilter: string): TDataSet;
begin
  if FSuplierGroup_GetDSOverview1Command = nil then
  begin
    FSuplierGroup_GetDSOverview1Command := FConnection.CreateCommand;
    FSuplierGroup_GetDSOverview1Command.RequestType := 'GET';
    FSuplierGroup_GetDSOverview1Command.Text := 'TDSProvider.SuplierGroup_GetDSOverview1';
    FSuplierGroup_GetDSOverview1Command.Prepare(TDSProvider_SuplierGroup_GetDSOverview1);
  end;
  FSuplierGroup_GetDSOverview1Command.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FSuplierGroup_GetDSOverview1Command.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FSuplierGroup_GetDSOverview1Command.FreeOnExecute(Result);
end;

function TDSProviderClient.SuplierGroup_GetDSOverview1_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FSuplierGroup_GetDSOverview1Command_Cache = nil then
  begin
    FSuplierGroup_GetDSOverview1Command_Cache := FConnection.CreateCommand;
    FSuplierGroup_GetDSOverview1Command_Cache.RequestType := 'GET';
    FSuplierGroup_GetDSOverview1Command_Cache.Text := 'TDSProvider.SuplierGroup_GetDSOverview1';
    FSuplierGroup_GetDSOverview1Command_Cache.Prepare(TDSProvider_SuplierGroup_GetDSOverview1_Cache);
  end;
  FSuplierGroup_GetDSOverview1Command_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FSuplierGroup_GetDSOverview1Command_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.SuplierGroup_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FSuplierGroup_GetDSLookupCommand = nil then
  begin
    FSuplierGroup_GetDSLookupCommand := FConnection.CreateCommand;
    FSuplierGroup_GetDSLookupCommand.RequestType := 'GET';
    FSuplierGroup_GetDSLookupCommand.Text := 'TDSProvider.SuplierGroup_GetDSLookup';
    FSuplierGroup_GetDSLookupCommand.Prepare(TDSProvider_SuplierGroup_GetDSLookup);
  end;
  FSuplierGroup_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FSuplierGroup_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FSuplierGroup_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.SuplierGroup_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FSuplierGroup_GetDSLookupCommand_Cache = nil then
  begin
    FSuplierGroup_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FSuplierGroup_GetDSLookupCommand_Cache.RequestType := 'GET';
    FSuplierGroup_GetDSLookupCommand_Cache.Text := 'TDSProvider.SuplierGroup_GetDSLookup';
    FSuplierGroup_GetDSLookupCommand_Cache.Prepare(TDSProvider_SuplierGroup_GetDSLookup_Cache);
  end;
  FSuplierGroup_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FSuplierGroup_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Suplier_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FSuplier_GetDSOverviewCommand = nil then
  begin
    FSuplier_GetDSOverviewCommand := FConnection.CreateCommand;
    FSuplier_GetDSOverviewCommand.RequestType := 'GET';
    FSuplier_GetDSOverviewCommand.Text := 'TDSProvider.Suplier_GetDSOverview';
    FSuplier_GetDSOverviewCommand.Prepare(TDSProvider_Suplier_GetDSOverview);
  end;
  FSuplier_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FSuplier_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FSuplier_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Suplier_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FSuplier_GetDSOverviewCommand_Cache = nil then
  begin
    FSuplier_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FSuplier_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FSuplier_GetDSOverviewCommand_Cache.Text := 'TDSProvider.Suplier_GetDSOverview';
    FSuplier_GetDSOverviewCommand_Cache.Prepare(TDSProvider_Suplier_GetDSOverview_Cache);
  end;
  FSuplier_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FSuplier_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.TipePerusahaan_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FTipePerusahaan_GetDSLookupCommand = nil then
  begin
    FTipePerusahaan_GetDSLookupCommand := FConnection.CreateCommand;
    FTipePerusahaan_GetDSLookupCommand.RequestType := 'GET';
    FTipePerusahaan_GetDSLookupCommand.Text := 'TDSProvider.TipePerusahaan_GetDSLookup';
    FTipePerusahaan_GetDSLookupCommand.Prepare(TDSProvider_TipePerusahaan_GetDSLookup);
  end;
  FTipePerusahaan_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FTipePerusahaan_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FTipePerusahaan_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.TipePerusahaan_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FTipePerusahaan_GetDSLookupCommand_Cache = nil then
  begin
    FTipePerusahaan_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FTipePerusahaan_GetDSLookupCommand_Cache.RequestType := 'GET';
    FTipePerusahaan_GetDSLookupCommand_Cache.Text := 'TDSProvider.TipePerusahaan_GetDSLookup';
    FTipePerusahaan_GetDSLookupCommand_Cache.Prepare(TDSProvider_TipePerusahaan_GetDSLookup_Cache);
  end;
  FTipePerusahaan_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FTipePerusahaan_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.TipeSuplier_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FTipeSuplier_GetDSLookupCommand = nil then
  begin
    FTipeSuplier_GetDSLookupCommand := FConnection.CreateCommand;
    FTipeSuplier_GetDSLookupCommand.RequestType := 'GET';
    FTipeSuplier_GetDSLookupCommand.Text := 'TDSProvider.TipeSuplier_GetDSLookup';
    FTipeSuplier_GetDSLookupCommand.Prepare(TDSProvider_TipeSuplier_GetDSLookup);
  end;
  FTipeSuplier_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FTipeSuplier_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FTipeSuplier_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.TipeSuplier_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FTipeSuplier_GetDSLookupCommand_Cache = nil then
  begin
    FTipeSuplier_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FTipeSuplier_GetDSLookupCommand_Cache.RequestType := 'GET';
    FTipeSuplier_GetDSLookupCommand_Cache.Text := 'TDSProvider.TipeSuplier_GetDSLookup';
    FTipeSuplier_GetDSLookupCommand_Cache.Prepare(TDSProvider_TipeSuplier_GetDSLookup_Cache);
  end;
  FTipeSuplier_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FTipeSuplier_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Propinsi_GetDSLookUp(const ARequestFilter: string): TDataSet;
begin
  if FPropinsi_GetDSLookUpCommand = nil then
  begin
    FPropinsi_GetDSLookUpCommand := FConnection.CreateCommand;
    FPropinsi_GetDSLookUpCommand.RequestType := 'GET';
    FPropinsi_GetDSLookUpCommand.Text := 'TDSProvider.Propinsi_GetDSLookUp';
    FPropinsi_GetDSLookUpCommand.Prepare(TDSProvider_Propinsi_GetDSLookUp);
  end;
  FPropinsi_GetDSLookUpCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FPropinsi_GetDSLookUpCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FPropinsi_GetDSLookUpCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Propinsi_GetDSLookUp_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FPropinsi_GetDSLookUpCommand_Cache = nil then
  begin
    FPropinsi_GetDSLookUpCommand_Cache := FConnection.CreateCommand;
    FPropinsi_GetDSLookUpCommand_Cache.RequestType := 'GET';
    FPropinsi_GetDSLookUpCommand_Cache.Text := 'TDSProvider.Propinsi_GetDSLookUp';
    FPropinsi_GetDSLookUpCommand_Cache.Prepare(TDSProvider_Propinsi_GetDSLookUp_Cache);
  end;
  FPropinsi_GetDSLookUpCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FPropinsi_GetDSLookUpCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Kabupaten_GetDSLookUp(const ARequestFilter: string): TDataSet;
begin
  if FKabupaten_GetDSLookUpCommand = nil then
  begin
    FKabupaten_GetDSLookUpCommand := FConnection.CreateCommand;
    FKabupaten_GetDSLookUpCommand.RequestType := 'GET';
    FKabupaten_GetDSLookUpCommand.Text := 'TDSProvider.Kabupaten_GetDSLookUp';
    FKabupaten_GetDSLookUpCommand.Prepare(TDSProvider_Kabupaten_GetDSLookUp);
  end;
  FKabupaten_GetDSLookUpCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FKabupaten_GetDSLookUpCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FKabupaten_GetDSLookUpCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Kabupaten_GetDSLookUp_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FKabupaten_GetDSLookUpCommand_Cache = nil then
  begin
    FKabupaten_GetDSLookUpCommand_Cache := FConnection.CreateCommand;
    FKabupaten_GetDSLookUpCommand_Cache.RequestType := 'GET';
    FKabupaten_GetDSLookUpCommand_Cache.Text := 'TDSProvider.Kabupaten_GetDSLookUp';
    FKabupaten_GetDSLookUpCommand_Cache.Prepare(TDSProvider_Kabupaten_GetDSLookUp_Cache);
  end;
  FKabupaten_GetDSLookUpCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FKabupaten_GetDSLookUpCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.MataUang_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FMataUang_GetDSOverviewCommand = nil then
  begin
    FMataUang_GetDSOverviewCommand := FConnection.CreateCommand;
    FMataUang_GetDSOverviewCommand.RequestType := 'GET';
    FMataUang_GetDSOverviewCommand.Text := 'TDSProvider.MataUang_GetDSOverview';
    FMataUang_GetDSOverviewCommand.Prepare(TDSProvider_MataUang_GetDSOverview);
  end;
  FMataUang_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FMataUang_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FMataUang_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.MataUang_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FMataUang_GetDSOverviewCommand_Cache = nil then
  begin
    FMataUang_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FMataUang_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FMataUang_GetDSOverviewCommand_Cache.Text := 'TDSProvider.MataUang_GetDSOverview';
    FMataUang_GetDSOverviewCommand_Cache.Prepare(TDSProvider_MataUang_GetDSOverview_Cache);
  end;
  FMataUang_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FMataUang_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Agama_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FAgama_GetDSLookupCommand = nil then
  begin
    FAgama_GetDSLookupCommand := FConnection.CreateCommand;
    FAgama_GetDSLookupCommand.RequestType := 'GET';
    FAgama_GetDSLookupCommand.Text := 'TDSProvider.Agama_GetDSLookup';
    FAgama_GetDSLookupCommand.Prepare(TDSProvider_Agama_GetDSLookup);
  end;
  FAgama_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FAgama_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FAgama_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Agama_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FAgama_GetDSLookupCommand_Cache = nil then
  begin
    FAgama_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FAgama_GetDSLookupCommand_Cache.RequestType := 'GET';
    FAgama_GetDSLookupCommand_Cache.Text := 'TDSProvider.Agama_GetDSLookup';
    FAgama_GetDSLookupCommand_Cache.Prepare(TDSProvider_Agama_GetDSLookup_Cache);
  end;
  FAgama_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FAgama_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.TipeBonus_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FTipeBonus_GetDSOverviewCommand = nil then
  begin
    FTipeBonus_GetDSOverviewCommand := FConnection.CreateCommand;
    FTipeBonus_GetDSOverviewCommand.RequestType := 'GET';
    FTipeBonus_GetDSOverviewCommand.Text := 'TDSProvider.TipeBonus_GetDSOverview';
    FTipeBonus_GetDSOverviewCommand.Prepare(TDSProvider_TipeBonus_GetDSOverview);
  end;
  FTipeBonus_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FTipeBonus_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FTipeBonus_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.TipeBonus_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FTipeBonus_GetDSOverviewCommand_Cache = nil then
  begin
    FTipeBonus_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FTipeBonus_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FTipeBonus_GetDSOverviewCommand_Cache.Text := 'TDSProvider.TipeBonus_GetDSOverview';
    FTipeBonus_GetDSOverviewCommand_Cache.Prepare(TDSProvider_TipeBonus_GetDSOverview_Cache);
  end;
  FTipeBonus_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FTipeBonus_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Document_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FDocument_GetDSOverviewCommand = nil then
  begin
    FDocument_GetDSOverviewCommand := FConnection.CreateCommand;
    FDocument_GetDSOverviewCommand.RequestType := 'GET';
    FDocument_GetDSOverviewCommand.Text := 'TDSProvider.Document_GetDSOverview';
    FDocument_GetDSOverviewCommand.Prepare(TDSProvider_Document_GetDSOverview);
  end;
  FDocument_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FDocument_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FDocument_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Document_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FDocument_GetDSOverviewCommand_Cache = nil then
  begin
    FDocument_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FDocument_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FDocument_GetDSOverviewCommand_Cache.Text := 'TDSProvider.Document_GetDSOverview';
    FDocument_GetDSOverviewCommand_Cache.Prepare(TDSProvider_Document_GetDSOverview_Cache);
  end;
  FDocument_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FDocument_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Agama_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FAgama_GetDSOverviewCommand = nil then
  begin
    FAgama_GetDSOverviewCommand := FConnection.CreateCommand;
    FAgama_GetDSOverviewCommand.RequestType := 'GET';
    FAgama_GetDSOverviewCommand.Text := 'TDSProvider.Agama_GetDSOverview';
    FAgama_GetDSOverviewCommand.Prepare(TDSProvider_Agama_GetDSOverview);
  end;
  FAgama_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FAgama_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FAgama_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Agama_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FAgama_GetDSOverviewCommand_Cache = nil then
  begin
    FAgama_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FAgama_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FAgama_GetDSOverviewCommand_Cache.Text := 'TDSProvider.Agama_GetDSOverview';
    FAgama_GetDSOverviewCommand_Cache.Prepare(TDSProvider_Agama_GetDSOverview_Cache);
  end;
  FAgama_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FAgama_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.AutUnit_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FAutUnit_GetDSLookupCommand = nil then
  begin
    FAutUnit_GetDSLookupCommand := FConnection.CreateCommand;
    FAutUnit_GetDSLookupCommand.RequestType := 'GET';
    FAutUnit_GetDSLookupCommand.Text := 'TDSProvider.AutUnit_GetDSLookup';
    FAutUnit_GetDSLookupCommand.Prepare(TDSProvider_AutUnit_GetDSLookup);
  end;
  FAutUnit_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FAutUnit_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FAutUnit_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.AutUnit_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FAutUnit_GetDSLookupCommand_Cache = nil then
  begin
    FAutUnit_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FAutUnit_GetDSLookupCommand_Cache.RequestType := 'GET';
    FAutUnit_GetDSLookupCommand_Cache.Text := 'TDSProvider.AutUnit_GetDSLookup';
    FAutUnit_GetDSLookupCommand_Cache.Prepare(TDSProvider_AutUnit_GetDSLookup_Cache);
  end;
  FAutUnit_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FAutUnit_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.BarangSupp_GetDSLookup(aMerchandise: string; const ARequestFilter: string): TDataSet;
begin
  if FBarangSupp_GetDSLookupCommand = nil then
  begin
    FBarangSupp_GetDSLookupCommand := FConnection.CreateCommand;
    FBarangSupp_GetDSLookupCommand.RequestType := 'GET';
    FBarangSupp_GetDSLookupCommand.Text := 'TDSProvider.BarangSupp_GetDSLookup';
    FBarangSupp_GetDSLookupCommand.Prepare(TDSProvider_BarangSupp_GetDSLookup);
  end;
  FBarangSupp_GetDSLookupCommand.Parameters[0].Value.SetWideString(aMerchandise);
  FBarangSupp_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FBarangSupp_GetDSLookupCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FBarangSupp_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.BarangSupp_GetDSLookup_Cache(aMerchandise: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FBarangSupp_GetDSLookupCommand_Cache = nil then
  begin
    FBarangSupp_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FBarangSupp_GetDSLookupCommand_Cache.RequestType := 'GET';
    FBarangSupp_GetDSLookupCommand_Cache.Text := 'TDSProvider.BarangSupp_GetDSLookup';
    FBarangSupp_GetDSLookupCommand_Cache.Prepare(TDSProvider_BarangSupp_GetDSLookup_Cache);
  end;
  FBarangSupp_GetDSLookupCommand_Cache.Parameters[0].Value.SetWideString(aMerchandise);
  FBarangSupp_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FBarangSupp_GetDSLookupCommand_Cache.Parameters[1].Value.GetString);
end;

function TDSProviderClient.BarangSupp_GetDSLookup2(aMerchandise: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FBarangSupp_GetDSLookup2Command = nil then
  begin
    FBarangSupp_GetDSLookup2Command := FConnection.CreateCommand;
    FBarangSupp_GetDSLookup2Command.RequestType := 'GET';
    FBarangSupp_GetDSLookup2Command.Text := 'TDSProvider.BarangSupp_GetDSLookup2';
    FBarangSupp_GetDSLookup2Command.Prepare(TDSProvider_BarangSupp_GetDSLookup2);
  end;
  FBarangSupp_GetDSLookup2Command.Parameters[0].Value.SetWideString(aMerchandise);
  FBarangSupp_GetDSLookup2Command.Execute(ARequestFilter);
  if not FBarangSupp_GetDSLookup2Command.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FBarangSupp_GetDSLookup2Command.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FBarangSupp_GetDSLookup2Command.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FBarangSupp_GetDSLookup2Command.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TDSProviderClient.BarangSupp_GetDSLookup2_Cache(aMerchandise: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FBarangSupp_GetDSLookup2Command_Cache = nil then
  begin
    FBarangSupp_GetDSLookup2Command_Cache := FConnection.CreateCommand;
    FBarangSupp_GetDSLookup2Command_Cache.RequestType := 'GET';
    FBarangSupp_GetDSLookup2Command_Cache.Text := 'TDSProvider.BarangSupp_GetDSLookup2';
    FBarangSupp_GetDSLookup2Command_Cache.Prepare(TDSProvider_BarangSupp_GetDSLookup2_Cache);
  end;
  FBarangSupp_GetDSLookup2Command_Cache.Parameters[0].Value.SetWideString(aMerchandise);
  FBarangSupp_GetDSLookup2Command_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FBarangSupp_GetDSLookup2Command_Cache.Parameters[1].Value.GetString);
end;

function TDSProviderClient.Barang_ByPOLookUp(APONO: string; const ARequestFilter: string): TDataSet;
begin
  if FBarang_ByPOLookUpCommand = nil then
  begin
    FBarang_ByPOLookUpCommand := FConnection.CreateCommand;
    FBarang_ByPOLookUpCommand.RequestType := 'GET';
    FBarang_ByPOLookUpCommand.Text := 'TDSProvider.Barang_ByPOLookUp';
    FBarang_ByPOLookUpCommand.Prepare(TDSProvider_Barang_ByPOLookUp);
  end;
  FBarang_ByPOLookUpCommand.Parameters[0].Value.SetWideString(APONO);
  FBarang_ByPOLookUpCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FBarang_ByPOLookUpCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FBarang_ByPOLookUpCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Barang_ByPOLookUp_Cache(APONO: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FBarang_ByPOLookUpCommand_Cache = nil then
  begin
    FBarang_ByPOLookUpCommand_Cache := FConnection.CreateCommand;
    FBarang_ByPOLookUpCommand_Cache.RequestType := 'GET';
    FBarang_ByPOLookUpCommand_Cache.Text := 'TDSProvider.Barang_ByPOLookUp';
    FBarang_ByPOLookUpCommand_Cache.Prepare(TDSProvider_Barang_ByPOLookUp_Cache);
  end;
  FBarang_ByPOLookUpCommand_Cache.Parameters[0].Value.SetWideString(APONO);
  FBarang_ByPOLookUpCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FBarang_ByPOLookUpCommand_Cache.Parameters[1].Value.GetString);
end;

function TDSProviderClient.Barang_GetDSLookup(aMerchanGroupID: string; const ARequestFilter: string): TDataSet;
begin
  if FBarang_GetDSLookupCommand = nil then
  begin
    FBarang_GetDSLookupCommand := FConnection.CreateCommand;
    FBarang_GetDSLookupCommand.RequestType := 'GET';
    FBarang_GetDSLookupCommand.Text := 'TDSProvider.Barang_GetDSLookup';
    FBarang_GetDSLookupCommand.Prepare(TDSProvider_Barang_GetDSLookup);
  end;
  FBarang_GetDSLookupCommand.Parameters[0].Value.SetWideString(aMerchanGroupID);
  FBarang_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FBarang_GetDSLookupCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FBarang_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Barang_GetDSLookup_Cache(aMerchanGroupID: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FBarang_GetDSLookupCommand_Cache = nil then
  begin
    FBarang_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FBarang_GetDSLookupCommand_Cache.RequestType := 'GET';
    FBarang_GetDSLookupCommand_Cache.Text := 'TDSProvider.Barang_GetDSLookup';
    FBarang_GetDSLookupCommand_Cache.Prepare(TDSProvider_Barang_GetDSLookup_Cache);
  end;
  FBarang_GetDSLookupCommand_Cache.Parameters[0].Value.SetWideString(aMerchanGroupID);
  FBarang_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FBarang_GetDSLookupCommand_Cache.Parameters[1].Value.GetString);
end;

function TDSProviderClient.GET_MEMBER_PAS_NO(ATPMEMBER: string; const ARequestFilter: string): string;
begin
  if FGET_MEMBER_PAS_NOCommand = nil then
  begin
    FGET_MEMBER_PAS_NOCommand := FConnection.CreateCommand;
    FGET_MEMBER_PAS_NOCommand.RequestType := 'GET';
    FGET_MEMBER_PAS_NOCommand.Text := 'TDSProvider.GET_MEMBER_PAS_NO';
    FGET_MEMBER_PAS_NOCommand.Prepare(TDSProvider_GET_MEMBER_PAS_NO);
  end;
  FGET_MEMBER_PAS_NOCommand.Parameters[0].Value.SetWideString(ATPMEMBER);
  FGET_MEMBER_PAS_NOCommand.Execute(ARequestFilter);
  Result := FGET_MEMBER_PAS_NOCommand.Parameters[1].Value.GetWideString;
end;

function TDSProviderClient.Merchandise_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FMerchandise_GetDSOverviewCommand = nil then
  begin
    FMerchandise_GetDSOverviewCommand := FConnection.CreateCommand;
    FMerchandise_GetDSOverviewCommand.RequestType := 'GET';
    FMerchandise_GetDSOverviewCommand.Text := 'TDSProvider.Merchandise_GetDSOverview';
    FMerchandise_GetDSOverviewCommand.Prepare(TDSProvider_Merchandise_GetDSOverview);
  end;
  FMerchandise_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FMerchandise_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FMerchandise_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Merchandise_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FMerchandise_GetDSOverviewCommand_Cache = nil then
  begin
    FMerchandise_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FMerchandise_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FMerchandise_GetDSOverviewCommand_Cache.Text := 'TDSProvider.Merchandise_GetDSOverview';
    FMerchandise_GetDSOverviewCommand_Cache.Prepare(TDSProvider_Merchandise_GetDSOverview_Cache);
  end;
  FMerchandise_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FMerchandise_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.SupMGByOutstandingSO_GetDSLookup(ID: string; const ARequestFilter: string): TDataSet;
begin
  if FSupMGByOutstandingSO_GetDSLookupCommand = nil then
  begin
    FSupMGByOutstandingSO_GetDSLookupCommand := FConnection.CreateCommand;
    FSupMGByOutstandingSO_GetDSLookupCommand.RequestType := 'GET';
    FSupMGByOutstandingSO_GetDSLookupCommand.Text := 'TDSProvider.SupMGByOutstandingSO_GetDSLookup';
    FSupMGByOutstandingSO_GetDSLookupCommand.Prepare(TDSProvider_SupMGByOutstandingSO_GetDSLookup);
  end;
  FSupMGByOutstandingSO_GetDSLookupCommand.Parameters[0].Value.SetWideString(ID);
  FSupMGByOutstandingSO_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FSupMGByOutstandingSO_GetDSLookupCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FSupMGByOutstandingSO_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.SupMGByOutstandingSO_GetDSLookup_Cache(ID: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FSupMGByOutstandingSO_GetDSLookupCommand_Cache = nil then
  begin
    FSupMGByOutstandingSO_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FSupMGByOutstandingSO_GetDSLookupCommand_Cache.RequestType := 'GET';
    FSupMGByOutstandingSO_GetDSLookupCommand_Cache.Text := 'TDSProvider.SupMGByOutstandingSO_GetDSLookup';
    FSupMGByOutstandingSO_GetDSLookupCommand_Cache.Prepare(TDSProvider_SupMGByOutstandingSO_GetDSLookup_Cache);
  end;
  FSupMGByOutstandingSO_GetDSLookupCommand_Cache.Parameters[0].Value.SetWideString(ID);
  FSupMGByOutstandingSO_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FSupMGByOutstandingSO_GetDSLookupCommand_Cache.Parameters[1].Value.GetString);
end;

function TDSProviderClient.StatusPO_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FStatusPO_GetDSLookupCommand = nil then
  begin
    FStatusPO_GetDSLookupCommand := FConnection.CreateCommand;
    FStatusPO_GetDSLookupCommand.RequestType := 'GET';
    FStatusPO_GetDSLookupCommand.Text := 'TDSProvider.StatusPO_GetDSLookup';
    FStatusPO_GetDSLookupCommand.Prepare(TDSProvider_StatusPO_GetDSLookup);
  end;
  FStatusPO_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FStatusPO_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FStatusPO_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.StatusPO_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FStatusPO_GetDSLookupCommand_Cache = nil then
  begin
    FStatusPO_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FStatusPO_GetDSLookupCommand_Cache.RequestType := 'GET';
    FStatusPO_GetDSLookupCommand_Cache.Text := 'TDSProvider.StatusPO_GetDSLookup';
    FStatusPO_GetDSLookupCommand_Cache.Prepare(TDSProvider_StatusPO_GetDSLookup_Cache);
  end;
  FStatusPO_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FStatusPO_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.TipeHarga_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FTipeHarga_GetDSLookupCommand = nil then
  begin
    FTipeHarga_GetDSLookupCommand := FConnection.CreateCommand;
    FTipeHarga_GetDSLookupCommand.RequestType := 'GET';
    FTipeHarga_GetDSLookupCommand.Text := 'TDSProvider.TipeHarga_GetDSLookup';
    FTipeHarga_GetDSLookupCommand.Prepare(TDSProvider_TipeHarga_GetDSLookup);
  end;
  FTipeHarga_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FTipeHarga_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FTipeHarga_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.TipeHarga_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FTipeHarga_GetDSLookupCommand_Cache = nil then
  begin
    FTipeHarga_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FTipeHarga_GetDSLookupCommand_Cache.RequestType := 'GET';
    FTipeHarga_GetDSLookupCommand_Cache.Text := 'TDSProvider.TipeHarga_GetDSLookup';
    FTipeHarga_GetDSLookupCommand_Cache.Prepare(TDSProvider_TipeHarga_GetDSLookup_Cache);
  end;
  FTipeHarga_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FTipeHarga_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.RefWilayah_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FRefWilayah_GetDSLookupCommand = nil then
  begin
    FRefWilayah_GetDSLookupCommand := FConnection.CreateCommand;
    FRefWilayah_GetDSLookupCommand.RequestType := 'GET';
    FRefWilayah_GetDSLookupCommand.Text := 'TDSProvider.RefWilayah_GetDSLookup';
    FRefWilayah_GetDSLookupCommand.Prepare(TDSProvider_RefWilayah_GetDSLookup);
  end;
  FRefWilayah_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRefWilayah_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRefWilayah_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.RefWilayah_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRefWilayah_GetDSLookupCommand_Cache = nil then
  begin
    FRefWilayah_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FRefWilayah_GetDSLookupCommand_Cache.RequestType := 'GET';
    FRefWilayah_GetDSLookupCommand_Cache.Text := 'TDSProvider.RefWilayah_GetDSLookup';
    FRefWilayah_GetDSLookupCommand_Cache.Prepare(TDSProvider_RefWilayah_GetDSLookup_Cache);
  end;
  FRefWilayah_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRefWilayah_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Suplier_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FSuplier_GetDSLookupCommand = nil then
  begin
    FSuplier_GetDSLookupCommand := FConnection.CreateCommand;
    FSuplier_GetDSLookupCommand.RequestType := 'GET';
    FSuplier_GetDSLookupCommand.Text := 'TDSProvider.Suplier_GetDSLookup';
    FSuplier_GetDSLookupCommand.Prepare(TDSProvider_Suplier_GetDSLookup);
  end;
  FSuplier_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FSuplier_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FSuplier_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Suplier_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FSuplier_GetDSLookupCommand_Cache = nil then
  begin
    FSuplier_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FSuplier_GetDSLookupCommand_Cache.RequestType := 'GET';
    FSuplier_GetDSLookupCommand_Cache.Text := 'TDSProvider.Suplier_GetDSLookup';
    FSuplier_GetDSLookupCommand_Cache.Prepare(TDSProvider_Suplier_GetDSLookup_Cache);
  end;
  FSuplier_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FSuplier_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.RefTipeMember_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FRefTipeMember_GetDSLookupCommand = nil then
  begin
    FRefTipeMember_GetDSLookupCommand := FConnection.CreateCommand;
    FRefTipeMember_GetDSLookupCommand.RequestType := 'GET';
    FRefTipeMember_GetDSLookupCommand.Text := 'TDSProvider.RefTipeMember_GetDSLookup';
    FRefTipeMember_GetDSLookupCommand.Prepare(TDSProvider_RefTipeMember_GetDSLookup);
  end;
  FRefTipeMember_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRefTipeMember_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRefTipeMember_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.RefTipeMember_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRefTipeMember_GetDSLookupCommand_Cache = nil then
  begin
    FRefTipeMember_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FRefTipeMember_GetDSLookupCommand_Cache.RequestType := 'GET';
    FRefTipeMember_GetDSLookupCommand_Cache.Text := 'TDSProvider.RefTipeMember_GetDSLookup';
    FRefTipeMember_GetDSLookupCommand_Cache.Prepare(TDSProvider_RefTipeMember_GetDSLookup_Cache);
  end;
  FRefTipeMember_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRefTipeMember_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.TipePO_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FTipePO_GetDSOverviewCommand = nil then
  begin
    FTipePO_GetDSOverviewCommand := FConnection.CreateCommand;
    FTipePO_GetDSOverviewCommand.RequestType := 'GET';
    FTipePO_GetDSOverviewCommand.Text := 'TDSProvider.TipePO_GetDSOverview';
    FTipePO_GetDSOverviewCommand.Prepare(TDSProvider_TipePO_GetDSOverview);
  end;
  FTipePO_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FTipePO_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FTipePO_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.TipePO_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FTipePO_GetDSOverviewCommand_Cache = nil then
  begin
    FTipePO_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FTipePO_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FTipePO_GetDSOverviewCommand_Cache.Text := 'TDSProvider.TipePO_GetDSOverview';
    FTipePO_GetDSOverviewCommand_Cache.Prepare(TDSProvider_TipePO_GetDSOverview_Cache);
  end;
  FTipePO_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FTipePO_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.TipeCN_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FTipeCN_GetDSOverviewCommand = nil then
  begin
    FTipeCN_GetDSOverviewCommand := FConnection.CreateCommand;
    FTipeCN_GetDSOverviewCommand.RequestType := 'GET';
    FTipeCN_GetDSOverviewCommand.Text := 'TDSProvider.TipeCN_GetDSOverview';
    FTipeCN_GetDSOverviewCommand.Prepare(TDSProvider_TipeCN_GetDSOverview);
  end;
  FTipeCN_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FTipeCN_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FTipeCN_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.TipeCN_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FTipeCN_GetDSOverviewCommand_Cache = nil then
  begin
    FTipeCN_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FTipeCN_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FTipeCN_GetDSOverviewCommand_Cache.Text := 'TDSProvider.TipeCN_GetDSOverview';
    FTipeCN_GetDSOverviewCommand_Cache.Prepare(TDSProvider_TipeCN_GetDSOverview_Cache);
  end;
  FTipeCN_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FTipeCN_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.SO_GetDSOverview(ATglAwal: TDateTime; ATglAkhir: TDateTime; AUnit: TModUnit; const ARequestFilter: string): TDataSet;
begin
  if FSO_GetDSOverviewCommand = nil then
  begin
    FSO_GetDSOverviewCommand := FConnection.CreateCommand;
    FSO_GetDSOverviewCommand.RequestType := 'POST';
    FSO_GetDSOverviewCommand.Text := 'TDSProvider."SO_GetDSOverview"';
    FSO_GetDSOverviewCommand.Prepare(TDSProvider_SO_GetDSOverview);
  end;
  FSO_GetDSOverviewCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FSO_GetDSOverviewCommand.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(AUnit) then
    FSO_GetDSOverviewCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSO_GetDSOverviewCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FSO_GetDSOverviewCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(AUnit), True);
      if FInstanceOwner then
        AUnit.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSO_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FSO_GetDSOverviewCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FSO_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.SO_GetDSOverview_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; AUnit: TModUnit; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FSO_GetDSOverviewCommand_Cache = nil then
  begin
    FSO_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FSO_GetDSOverviewCommand_Cache.RequestType := 'POST';
    FSO_GetDSOverviewCommand_Cache.Text := 'TDSProvider."SO_GetDSOverview"';
    FSO_GetDSOverviewCommand_Cache.Prepare(TDSProvider_SO_GetDSOverview_Cache);
  end;
  FSO_GetDSOverviewCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FSO_GetDSOverviewCommand_Cache.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(AUnit) then
    FSO_GetDSOverviewCommand_Cache.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSO_GetDSOverviewCommand_Cache.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FSO_GetDSOverviewCommand_Cache.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(AUnit), True);
      if FInstanceOwner then
        AUnit.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSO_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FSO_GetDSOverviewCommand_Cache.Parameters[3].Value.GetString);
end;

function TDSProviderClient.SO_GetDSOLookUp(AUnit: TModUnit; const ARequestFilter: string): TDataSet;
begin
  if FSO_GetDSOLookUpCommand = nil then
  begin
    FSO_GetDSOLookUpCommand := FConnection.CreateCommand;
    FSO_GetDSOLookUpCommand.RequestType := 'POST';
    FSO_GetDSOLookUpCommand.Text := 'TDSProvider."SO_GetDSOLookUp"';
    FSO_GetDSOLookUpCommand.Prepare(TDSProvider_SO_GetDSOLookUp);
  end;
  if not Assigned(AUnit) then
    FSO_GetDSOLookUpCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSO_GetDSOLookUpCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSO_GetDSOLookUpCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AUnit), True);
      if FInstanceOwner then
        AUnit.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSO_GetDSOLookUpCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FSO_GetDSOLookUpCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FSO_GetDSOLookUpCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.SO_GetDSOLookUp_Cache(AUnit: TModUnit; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FSO_GetDSOLookUpCommand_Cache = nil then
  begin
    FSO_GetDSOLookUpCommand_Cache := FConnection.CreateCommand;
    FSO_GetDSOLookUpCommand_Cache.RequestType := 'POST';
    FSO_GetDSOLookUpCommand_Cache.Text := 'TDSProvider."SO_GetDSOLookUp"';
    FSO_GetDSOLookUpCommand_Cache.Prepare(TDSProvider_SO_GetDSOLookUp_Cache);
  end;
  if not Assigned(AUnit) then
    FSO_GetDSOLookUpCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSO_GetDSOLookUpCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSO_GetDSOLookUpCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AUnit), True);
      if FInstanceOwner then
        AUnit.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSO_GetDSOLookUpCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FSO_GetDSOLookUpCommand_Cache.Parameters[1].Value.GetString);
end;

function TDSProviderClient.SubGroup_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FSubGroup_GetDSOverviewCommand = nil then
  begin
    FSubGroup_GetDSOverviewCommand := FConnection.CreateCommand;
    FSubGroup_GetDSOverviewCommand.RequestType := 'GET';
    FSubGroup_GetDSOverviewCommand.Text := 'TDSProvider.SubGroup_GetDSOverview';
    FSubGroup_GetDSOverviewCommand.Prepare(TDSProvider_SubGroup_GetDSOverview);
  end;
  FSubGroup_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FSubGroup_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FSubGroup_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.SubGroup_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FSubGroup_GetDSOverviewCommand_Cache = nil then
  begin
    FSubGroup_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FSubGroup_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FSubGroup_GetDSOverviewCommand_Cache.Text := 'TDSProvider.SubGroup_GetDSOverview';
    FSubGroup_GetDSOverviewCommand_Cache.Prepare(TDSProvider_SubGroup_GetDSOverview_Cache);
  end;
  FSubGroup_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FSubGroup_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.SuplierMerchan_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FSuplierMerchan_GetDSLookupCommand = nil then
  begin
    FSuplierMerchan_GetDSLookupCommand := FConnection.CreateCommand;
    FSuplierMerchan_GetDSLookupCommand.RequestType := 'GET';
    FSuplierMerchan_GetDSLookupCommand.Text := 'TDSProvider.SuplierMerchan_GetDSLookup';
    FSuplierMerchan_GetDSLookupCommand.Prepare(TDSProvider_SuplierMerchan_GetDSLookup);
  end;
  FSuplierMerchan_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FSuplierMerchan_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FSuplierMerchan_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.SuplierMerchan_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FSuplierMerchan_GetDSLookupCommand_Cache = nil then
  begin
    FSuplierMerchan_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FSuplierMerchan_GetDSLookupCommand_Cache.RequestType := 'GET';
    FSuplierMerchan_GetDSLookupCommand_Cache.Text := 'TDSProvider.SuplierMerchan_GetDSLookup';
    FSuplierMerchan_GetDSLookupCommand_Cache.Prepare(TDSProvider_SuplierMerchan_GetDSLookup_Cache);
  end;
  FSuplierMerchan_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FSuplierMerchan_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.DO_GetDSLookUp(const ARequestFilter: string): TDataSet;
begin
  if FDO_GetDSLookUpCommand = nil then
  begin
    FDO_GetDSLookUpCommand := FConnection.CreateCommand;
    FDO_GetDSLookUpCommand.RequestType := 'GET';
    FDO_GetDSLookUpCommand.Text := 'TDSProvider.DO_GetDSLookUp';
    FDO_GetDSLookUpCommand.Prepare(TDSProvider_DO_GetDSLookUp);
  end;
  FDO_GetDSLookUpCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FDO_GetDSLookUpCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FDO_GetDSLookUpCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.DO_GetDSLookUp_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FDO_GetDSLookUpCommand_Cache = nil then
  begin
    FDO_GetDSLookUpCommand_Cache := FConnection.CreateCommand;
    FDO_GetDSLookUpCommand_Cache.RequestType := 'GET';
    FDO_GetDSLookUpCommand_Cache.Text := 'TDSProvider.DO_GetDSLookUp';
    FDO_GetDSLookUpCommand_Cache.Prepare(TDSProvider_DO_GetDSLookUp_Cache);
  end;
  FDO_GetDSLookUpCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FDO_GetDSLookUpCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.DO_GetDSOverview(ATglAwal: TDateTime; ATglAkhir: TDateTime; AUnitID: string; ASupMGCodeID: string; const ARequestFilter: string): TDataSet;
begin
  if FDO_GetDSOverviewCommand = nil then
  begin
    FDO_GetDSOverviewCommand := FConnection.CreateCommand;
    FDO_GetDSOverviewCommand.RequestType := 'GET';
    FDO_GetDSOverviewCommand.Text := 'TDSProvider.DO_GetDSOverview';
    FDO_GetDSOverviewCommand.Prepare(TDSProvider_DO_GetDSOverview);
  end;
  FDO_GetDSOverviewCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FDO_GetDSOverviewCommand.Parameters[1].Value.AsDateTime := ATglAkhir;
  FDO_GetDSOverviewCommand.Parameters[2].Value.SetWideString(AUnitID);
  FDO_GetDSOverviewCommand.Parameters[3].Value.SetWideString(ASupMGCodeID);
  FDO_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FDO_GetDSOverviewCommand.Parameters[4].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FDO_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.DO_GetDSOverview_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; AUnitID: string; ASupMGCodeID: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FDO_GetDSOverviewCommand_Cache = nil then
  begin
    FDO_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FDO_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FDO_GetDSOverviewCommand_Cache.Text := 'TDSProvider.DO_GetDSOverview';
    FDO_GetDSOverviewCommand_Cache.Prepare(TDSProvider_DO_GetDSOverview_Cache);
  end;
  FDO_GetDSOverviewCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FDO_GetDSOverviewCommand_Cache.Parameters[1].Value.AsDateTime := ATglAkhir;
  FDO_GetDSOverviewCommand_Cache.Parameters[2].Value.SetWideString(AUnitID);
  FDO_GetDSOverviewCommand_Cache.Parameters[3].Value.SetWideString(ASupMGCodeID);
  FDO_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FDO_GetDSOverviewCommand_Cache.Parameters[4].Value.GetString);
end;

function TDSProviderClient.Gudang_GetDSLookUp(const ARequestFilter: string): TDataSet;
begin
  if FGudang_GetDSLookUpCommand = nil then
  begin
    FGudang_GetDSLookUpCommand := FConnection.CreateCommand;
    FGudang_GetDSLookUpCommand.RequestType := 'GET';
    FGudang_GetDSLookUpCommand.Text := 'TDSProvider.Gudang_GetDSLookUp';
    FGudang_GetDSLookUpCommand.Prepare(TDSProvider_Gudang_GetDSLookUp);
  end;
  FGudang_GetDSLookUpCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FGudang_GetDSLookUpCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FGudang_GetDSLookUpCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Gudang_GetDSLookUp_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FGudang_GetDSLookUpCommand_Cache = nil then
  begin
    FGudang_GetDSLookUpCommand_Cache := FConnection.CreateCommand;
    FGudang_GetDSLookUpCommand_Cache.RequestType := 'GET';
    FGudang_GetDSLookUpCommand_Cache.Text := 'TDSProvider.Gudang_GetDSLookUp';
    FGudang_GetDSLookUpCommand_Cache.Prepare(TDSProvider_Gudang_GetDSLookUp_Cache);
  end;
  FGudang_GetDSLookUpCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FGudang_GetDSLookUpCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Kompetitor_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FKompetitor_GetDSOverviewCommand = nil then
  begin
    FKompetitor_GetDSOverviewCommand := FConnection.CreateCommand;
    FKompetitor_GetDSOverviewCommand.RequestType := 'GET';
    FKompetitor_GetDSOverviewCommand.Text := 'TDSProvider.Kompetitor_GetDSOverview';
    FKompetitor_GetDSOverviewCommand.Prepare(TDSProvider_Kompetitor_GetDSOverview);
  end;
  FKompetitor_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FKompetitor_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FKompetitor_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Kompetitor_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FKompetitor_GetDSOverviewCommand_Cache = nil then
  begin
    FKompetitor_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FKompetitor_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FKompetitor_GetDSOverviewCommand_Cache.Text := 'TDSProvider.Kompetitor_GetDSOverview';
    FKompetitor_GetDSOverviewCommand_Cache.Prepare(TDSProvider_Kompetitor_GetDSOverview_Cache);
  end;
  FKompetitor_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FKompetitor_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.SO_GetDSOLookUpGeneratePO(AUnit: TModUnit; const ARequestFilter: string): TDataSet;
begin
  if FSO_GetDSOLookUpGeneratePOCommand = nil then
  begin
    FSO_GetDSOLookUpGeneratePOCommand := FConnection.CreateCommand;
    FSO_GetDSOLookUpGeneratePOCommand.RequestType := 'POST';
    FSO_GetDSOLookUpGeneratePOCommand.Text := 'TDSProvider."SO_GetDSOLookUpGeneratePO"';
    FSO_GetDSOLookUpGeneratePOCommand.Prepare(TDSProvider_SO_GetDSOLookUpGeneratePO);
  end;
  if not Assigned(AUnit) then
    FSO_GetDSOLookUpGeneratePOCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSO_GetDSOLookUpGeneratePOCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSO_GetDSOLookUpGeneratePOCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AUnit), True);
      if FInstanceOwner then
        AUnit.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSO_GetDSOLookUpGeneratePOCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FSO_GetDSOLookUpGeneratePOCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FSO_GetDSOLookUpGeneratePOCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.SO_GetDSOLookUpGeneratePO_Cache(AUnit: TModUnit; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FSO_GetDSOLookUpGeneratePOCommand_Cache = nil then
  begin
    FSO_GetDSOLookUpGeneratePOCommand_Cache := FConnection.CreateCommand;
    FSO_GetDSOLookUpGeneratePOCommand_Cache.RequestType := 'POST';
    FSO_GetDSOLookUpGeneratePOCommand_Cache.Text := 'TDSProvider."SO_GetDSOLookUpGeneratePO"';
    FSO_GetDSOLookUpGeneratePOCommand_Cache.Prepare(TDSProvider_SO_GetDSOLookUpGeneratePO_Cache);
  end;
  if not Assigned(AUnit) then
    FSO_GetDSOLookUpGeneratePOCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSO_GetDSOLookUpGeneratePOCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSO_GetDSOLookUpGeneratePOCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AUnit), True);
      if FInstanceOwner then
        AUnit.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSO_GetDSOLookUpGeneratePOCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FSO_GetDSOLookUpGeneratePOCommand_Cache.Parameters[1].Value.GetString);
end;

function TDSProviderClient.PO_GetDSOLookUp(AUnitID: string; const ARequestFilter: string): TDataSet;
begin
  if FPO_GetDSOLookUpCommand = nil then
  begin
    FPO_GetDSOLookUpCommand := FConnection.CreateCommand;
    FPO_GetDSOLookUpCommand.RequestType := 'GET';
    FPO_GetDSOLookUpCommand.Text := 'TDSProvider.PO_GetDSOLookUp';
    FPO_GetDSOLookUpCommand.Prepare(TDSProvider_PO_GetDSOLookUp);
  end;
  FPO_GetDSOLookUpCommand.Parameters[0].Value.SetWideString(AUnitID);
  FPO_GetDSOLookUpCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FPO_GetDSOLookUpCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FPO_GetDSOLookUpCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.PO_GetDSOLookUp_Cache(AUnitID: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FPO_GetDSOLookUpCommand_Cache = nil then
  begin
    FPO_GetDSOLookUpCommand_Cache := FConnection.CreateCommand;
    FPO_GetDSOLookUpCommand_Cache.RequestType := 'GET';
    FPO_GetDSOLookUpCommand_Cache.Text := 'TDSProvider.PO_GetDSOLookUp';
    FPO_GetDSOLookUpCommand_Cache.Prepare(TDSProvider_PO_GetDSOLookUp_Cache);
  end;
  FPO_GetDSOLookUpCommand_Cache.Parameters[0].Value.SetWideString(AUnitID);
  FPO_GetDSOLookUpCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FPO_GetDSOLookUpCommand_Cache.Parameters[1].Value.GetString);
end;

function TDSProviderClient.PORevisi_GetDSOverview(ID: string; const ARequestFilter: string): TDataSet;
begin
  if FPORevisi_GetDSOverviewCommand = nil then
  begin
    FPORevisi_GetDSOverviewCommand := FConnection.CreateCommand;
    FPORevisi_GetDSOverviewCommand.RequestType := 'GET';
    FPORevisi_GetDSOverviewCommand.Text := 'TDSProvider.PORevisi_GetDSOverview';
    FPORevisi_GetDSOverviewCommand.Prepare(TDSProvider_PORevisi_GetDSOverview);
  end;
  FPORevisi_GetDSOverviewCommand.Parameters[0].Value.SetWideString(ID);
  FPORevisi_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FPORevisi_GetDSOverviewCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FPORevisi_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.PORevisi_GetDSOverview_Cache(ID: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FPORevisi_GetDSOverviewCommand_Cache = nil then
  begin
    FPORevisi_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FPORevisi_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FPORevisi_GetDSOverviewCommand_Cache.Text := 'TDSProvider.PORevisi_GetDSOverview';
    FPORevisi_GetDSOverviewCommand_Cache.Prepare(TDSProvider_PORevisi_GetDSOverview_Cache);
  end;
  FPORevisi_GetDSOverviewCommand_Cache.Parameters[0].Value.SetWideString(ID);
  FPORevisi_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FPORevisi_GetDSOverviewCommand_Cache.Parameters[1].Value.GetString);
end;

function TDSProviderClient.PO_DSLookUpDetail(ANOPO: string; const ARequestFilter: string): TDataSet;
begin
  if FPO_DSLookUpDetailCommand = nil then
  begin
    FPO_DSLookUpDetailCommand := FConnection.CreateCommand;
    FPO_DSLookUpDetailCommand.RequestType := 'GET';
    FPO_DSLookUpDetailCommand.Text := 'TDSProvider.PO_DSLookUpDetail';
    FPO_DSLookUpDetailCommand.Prepare(TDSProvider_PO_DSLookUpDetail);
  end;
  FPO_DSLookUpDetailCommand.Parameters[0].Value.SetWideString(ANOPO);
  FPO_DSLookUpDetailCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FPO_DSLookUpDetailCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FPO_DSLookUpDetailCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.PO_DSLookUpDetail_Cache(ANOPO: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FPO_DSLookUpDetailCommand_Cache = nil then
  begin
    FPO_DSLookUpDetailCommand_Cache := FConnection.CreateCommand;
    FPO_DSLookUpDetailCommand_Cache.RequestType := 'GET';
    FPO_DSLookUpDetailCommand_Cache.Text := 'TDSProvider.PO_DSLookUpDetail';
    FPO_DSLookUpDetailCommand_Cache.Prepare(TDSProvider_PO_DSLookUpDetail_Cache);
  end;
  FPO_DSLookUpDetailCommand_Cache.Parameters[0].Value.SetWideString(ANOPO);
  FPO_DSLookUpDetailCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FPO_DSLookUpDetailCommand_Cache.Parameters[1].Value.GetString);
end;

function TDSProviderClient.PO_GetDSByPeriod(APeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): TDataSet;
begin
  if FPO_GetDSByPeriodCommand = nil then
  begin
    FPO_GetDSByPeriodCommand := FConnection.CreateCommand;
    FPO_GetDSByPeriodCommand.RequestType := 'GET';
    FPO_GetDSByPeriodCommand.Text := 'TDSProvider.PO_GetDSByPeriod';
    FPO_GetDSByPeriodCommand.Prepare(TDSProvider_PO_GetDSByPeriod);
  end;
  FPO_GetDSByPeriodCommand.Parameters[0].Value.AsDateTime := APeriodeAwal;
  FPO_GetDSByPeriodCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FPO_GetDSByPeriodCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FPO_GetDSByPeriodCommand.Parameters[2].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FPO_GetDSByPeriodCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.PO_GetDSByPeriod_Cache(APeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FPO_GetDSByPeriodCommand_Cache = nil then
  begin
    FPO_GetDSByPeriodCommand_Cache := FConnection.CreateCommand;
    FPO_GetDSByPeriodCommand_Cache.RequestType := 'GET';
    FPO_GetDSByPeriodCommand_Cache.Text := 'TDSProvider.PO_GetDSByPeriod';
    FPO_GetDSByPeriodCommand_Cache.Prepare(TDSProvider_PO_GetDSByPeriod_Cache);
  end;
  FPO_GetDSByPeriodCommand_Cache.Parameters[0].Value.AsDateTime := APeriodeAwal;
  FPO_GetDSByPeriodCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FPO_GetDSByPeriodCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FPO_GetDSByPeriodCommand_Cache.Parameters[2].Value.GetString);
end;

function TDSProviderClient.PO_GetDSOLookUpForGR(AUnitID: string; const ARequestFilter: string): TDataSet;
begin
  if FPO_GetDSOLookUpForGRCommand = nil then
  begin
    FPO_GetDSOLookUpForGRCommand := FConnection.CreateCommand;
    FPO_GetDSOLookUpForGRCommand.RequestType := 'GET';
    FPO_GetDSOLookUpForGRCommand.Text := 'TDSProvider.PO_GetDSOLookUpForGR';
    FPO_GetDSOLookUpForGRCommand.Prepare(TDSProvider_PO_GetDSOLookUpForGR);
  end;
  FPO_GetDSOLookUpForGRCommand.Parameters[0].Value.SetWideString(AUnitID);
  FPO_GetDSOLookUpForGRCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FPO_GetDSOLookUpForGRCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FPO_GetDSOLookUpForGRCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.PO_GetDSOLookUpForGR_Cache(AUnitID: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FPO_GetDSOLookUpForGRCommand_Cache = nil then
  begin
    FPO_GetDSOLookUpForGRCommand_Cache := FConnection.CreateCommand;
    FPO_GetDSOLookUpForGRCommand_Cache.RequestType := 'GET';
    FPO_GetDSOLookUpForGRCommand_Cache.Text := 'TDSProvider.PO_GetDSOLookUpForGR';
    FPO_GetDSOLookUpForGRCommand_Cache.Prepare(TDSProvider_PO_GetDSOLookUpForGR_Cache);
  end;
  FPO_GetDSOLookUpForGRCommand_Cache.Parameters[0].Value.SetWideString(AUnitID);
  FPO_GetDSOLookUpForGRCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FPO_GetDSOLookUpForGRCommand_Cache.Parameters[1].Value.GetString);
end;

function TDSProviderClient.PO_SKULookUP(APONO: string; const ARequestFilter: string): TDataSet;
begin
  if FPO_SKULookUPCommand = nil then
  begin
    FPO_SKULookUPCommand := FConnection.CreateCommand;
    FPO_SKULookUPCommand.RequestType := 'GET';
    FPO_SKULookUPCommand.Text := 'TDSProvider.PO_SKULookUP';
    FPO_SKULookUPCommand.Prepare(TDSProvider_PO_SKULookUP);
  end;
  FPO_SKULookUPCommand.Parameters[0].Value.SetWideString(APONO);
  FPO_SKULookUPCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FPO_SKULookUPCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FPO_SKULookUPCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.PO_SKULookUP_Cache(APONO: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FPO_SKULookUPCommand_Cache = nil then
  begin
    FPO_SKULookUPCommand_Cache := FConnection.CreateCommand;
    FPO_SKULookUPCommand_Cache.RequestType := 'GET';
    FPO_SKULookUPCommand_Cache.Text := 'TDSProvider.PO_SKULookUP';
    FPO_SKULookUPCommand_Cache.Prepare(TDSProvider_PO_SKULookUP_Cache);
  end;
  FPO_SKULookUPCommand_Cache.Parameters[0].Value.SetWideString(APONO);
  FPO_SKULookUPCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FPO_SKULookUPCommand_Cache.Parameters[1].Value.GetString);
end;

function TDSProviderClient.PO_SLIP_GetDSOverview(ATglAwal: TDateTime; ATglAkhir: TDateTime; AUnit: TModUnit; const ARequestFilter: string): TDataSet;
begin
  if FPO_SLIP_GetDSOverviewCommand = nil then
  begin
    FPO_SLIP_GetDSOverviewCommand := FConnection.CreateCommand;
    FPO_SLIP_GetDSOverviewCommand.RequestType := 'POST';
    FPO_SLIP_GetDSOverviewCommand.Text := 'TDSProvider."PO_SLIP_GetDSOverview"';
    FPO_SLIP_GetDSOverviewCommand.Prepare(TDSProvider_PO_SLIP_GetDSOverview);
  end;
  FPO_SLIP_GetDSOverviewCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FPO_SLIP_GetDSOverviewCommand.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(AUnit) then
    FPO_SLIP_GetDSOverviewCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FPO_SLIP_GetDSOverviewCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FPO_SLIP_GetDSOverviewCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(AUnit), True);
      if FInstanceOwner then
        AUnit.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FPO_SLIP_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FPO_SLIP_GetDSOverviewCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FPO_SLIP_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.PO_SLIP_GetDSOverview_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; AUnit: TModUnit; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FPO_SLIP_GetDSOverviewCommand_Cache = nil then
  begin
    FPO_SLIP_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FPO_SLIP_GetDSOverviewCommand_Cache.RequestType := 'POST';
    FPO_SLIP_GetDSOverviewCommand_Cache.Text := 'TDSProvider."PO_SLIP_GetDSOverview"';
    FPO_SLIP_GetDSOverviewCommand_Cache.Prepare(TDSProvider_PO_SLIP_GetDSOverview_Cache);
  end;
  FPO_SLIP_GetDSOverviewCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FPO_SLIP_GetDSOverviewCommand_Cache.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(AUnit) then
    FPO_SLIP_GetDSOverviewCommand_Cache.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FPO_SLIP_GetDSOverviewCommand_Cache.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FPO_SLIP_GetDSOverviewCommand_Cache.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(AUnit), True);
      if FInstanceOwner then
        AUnit.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FPO_SLIP_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FPO_SLIP_GetDSOverviewCommand_Cache.Parameters[3].Value.GetString);
end;

function TDSProviderClient.PO_GetDSOverviewDetil(ATglAwal: TDateTime; ATglAkhir: TDateTime; AUnit: TModUnit; const ARequestFilter: string): TDataSet;
begin
  if FPO_GetDSOverviewDetilCommand = nil then
  begin
    FPO_GetDSOverviewDetilCommand := FConnection.CreateCommand;
    FPO_GetDSOverviewDetilCommand.RequestType := 'POST';
    FPO_GetDSOverviewDetilCommand.Text := 'TDSProvider."PO_GetDSOverviewDetil"';
    FPO_GetDSOverviewDetilCommand.Prepare(TDSProvider_PO_GetDSOverviewDetil);
  end;
  FPO_GetDSOverviewDetilCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FPO_GetDSOverviewDetilCommand.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(AUnit) then
    FPO_GetDSOverviewDetilCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FPO_GetDSOverviewDetilCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FPO_GetDSOverviewDetilCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(AUnit), True);
      if FInstanceOwner then
        AUnit.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FPO_GetDSOverviewDetilCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FPO_GetDSOverviewDetilCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FPO_GetDSOverviewDetilCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.PO_GetDSOverviewDetil_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; AUnit: TModUnit; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FPO_GetDSOverviewDetilCommand_Cache = nil then
  begin
    FPO_GetDSOverviewDetilCommand_Cache := FConnection.CreateCommand;
    FPO_GetDSOverviewDetilCommand_Cache.RequestType := 'POST';
    FPO_GetDSOverviewDetilCommand_Cache.Text := 'TDSProvider."PO_GetDSOverviewDetil"';
    FPO_GetDSOverviewDetilCommand_Cache.Prepare(TDSProvider_PO_GetDSOverviewDetil_Cache);
  end;
  FPO_GetDSOverviewDetilCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FPO_GetDSOverviewDetilCommand_Cache.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(AUnit) then
    FPO_GetDSOverviewDetilCommand_Cache.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FPO_GetDSOverviewDetilCommand_Cache.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FPO_GetDSOverviewDetilCommand_Cache.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(AUnit), True);
      if FInstanceOwner then
        AUnit.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FPO_GetDSOverviewDetilCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FPO_GetDSOverviewDetilCommand_Cache.Parameters[3].Value.GetString);
end;

function TDSProviderClient.PO_GetDSOverview(ATglAwal: TDateTime; ATglAkhir: TDateTime; AkodeSupplierMGAwal: string; AKodeSupplierMGAkhir: string; AStatusPOID: string; AUnit: TModUnit; const ARequestFilter: string): TDataSet;
begin
  if FPO_GetDSOverviewCommand = nil then
  begin
    FPO_GetDSOverviewCommand := FConnection.CreateCommand;
    FPO_GetDSOverviewCommand.RequestType := 'POST';
    FPO_GetDSOverviewCommand.Text := 'TDSProvider."PO_GetDSOverview"';
    FPO_GetDSOverviewCommand.Prepare(TDSProvider_PO_GetDSOverview);
  end;
  FPO_GetDSOverviewCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FPO_GetDSOverviewCommand.Parameters[1].Value.AsDateTime := ATglAkhir;
  FPO_GetDSOverviewCommand.Parameters[2].Value.SetWideString(AkodeSupplierMGAwal);
  FPO_GetDSOverviewCommand.Parameters[3].Value.SetWideString(AKodeSupplierMGAkhir);
  FPO_GetDSOverviewCommand.Parameters[4].Value.SetWideString(AStatusPOID);
  if not Assigned(AUnit) then
    FPO_GetDSOverviewCommand.Parameters[5].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FPO_GetDSOverviewCommand.Parameters[5].ConnectionHandler).GetJSONMarshaler;
    try
      FPO_GetDSOverviewCommand.Parameters[5].Value.SetJSONValue(FMarshal.Marshal(AUnit), True);
      if FInstanceOwner then
        AUnit.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FPO_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FPO_GetDSOverviewCommand.Parameters[6].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FPO_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.PO_GetDSOverview_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; AkodeSupplierMGAwal: string; AKodeSupplierMGAkhir: string; AStatusPOID: string; AUnit: TModUnit; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FPO_GetDSOverviewCommand_Cache = nil then
  begin
    FPO_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FPO_GetDSOverviewCommand_Cache.RequestType := 'POST';
    FPO_GetDSOverviewCommand_Cache.Text := 'TDSProvider."PO_GetDSOverview"';
    FPO_GetDSOverviewCommand_Cache.Prepare(TDSProvider_PO_GetDSOverview_Cache);
  end;
  FPO_GetDSOverviewCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FPO_GetDSOverviewCommand_Cache.Parameters[1].Value.AsDateTime := ATglAkhir;
  FPO_GetDSOverviewCommand_Cache.Parameters[2].Value.SetWideString(AkodeSupplierMGAwal);
  FPO_GetDSOverviewCommand_Cache.Parameters[3].Value.SetWideString(AKodeSupplierMGAkhir);
  FPO_GetDSOverviewCommand_Cache.Parameters[4].Value.SetWideString(AStatusPOID);
  if not Assigned(AUnit) then
    FPO_GetDSOverviewCommand_Cache.Parameters[5].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FPO_GetDSOverviewCommand_Cache.Parameters[5].ConnectionHandler).GetJSONMarshaler;
    try
      FPO_GetDSOverviewCommand_Cache.Parameters[5].Value.SetJSONValue(FMarshal.Marshal(AUnit), True);
      if FInstanceOwner then
        AUnit.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FPO_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FPO_GetDSOverviewCommand_Cache.Parameters[6].Value.GetString);
end;

function TDSProviderClient.RefCreditCard_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FRefCreditCard_GetDSOverviewCommand = nil then
  begin
    FRefCreditCard_GetDSOverviewCommand := FConnection.CreateCommand;
    FRefCreditCard_GetDSOverviewCommand.RequestType := 'GET';
    FRefCreditCard_GetDSOverviewCommand.Text := 'TDSProvider.RefCreditCard_GetDSOverview';
    FRefCreditCard_GetDSOverviewCommand.Prepare(TDSProvider_RefCreditCard_GetDSOverview);
  end;
  FRefCreditCard_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRefCreditCard_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRefCreditCard_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.RefCreditCard_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRefCreditCard_GetDSOverviewCommand_Cache = nil then
  begin
    FRefCreditCard_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FRefCreditCard_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FRefCreditCard_GetDSOverviewCommand_Cache.Text := 'TDSProvider.RefCreditCard_GetDSOverview';
    FRefCreditCard_GetDSOverviewCommand_Cache.Prepare(TDSProvider_RefCreditCard_GetDSOverview_Cache);
  end;
  FRefCreditCard_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRefCreditCard_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.CN_RCV_GetDSOverview(ATglAwal: TDateTime; ATglAkhir: TDateTime; AUnit: TModUnit; const ARequestFilter: string): TDataSet;
begin
  if FCN_RCV_GetDSOverviewCommand = nil then
  begin
    FCN_RCV_GetDSOverviewCommand := FConnection.CreateCommand;
    FCN_RCV_GetDSOverviewCommand.RequestType := 'POST';
    FCN_RCV_GetDSOverviewCommand.Text := 'TDSProvider."CN_RCV_GetDSOverview"';
    FCN_RCV_GetDSOverviewCommand.Prepare(TDSProvider_CN_RCV_GetDSOverview);
  end;
  FCN_RCV_GetDSOverviewCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FCN_RCV_GetDSOverviewCommand.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(AUnit) then
    FCN_RCV_GetDSOverviewCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FCN_RCV_GetDSOverviewCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FCN_RCV_GetDSOverviewCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(AUnit), True);
      if FInstanceOwner then
        AUnit.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FCN_RCV_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FCN_RCV_GetDSOverviewCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FCN_RCV_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.CN_RCV_GetDSOverview_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; AUnit: TModUnit; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FCN_RCV_GetDSOverviewCommand_Cache = nil then
  begin
    FCN_RCV_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FCN_RCV_GetDSOverviewCommand_Cache.RequestType := 'POST';
    FCN_RCV_GetDSOverviewCommand_Cache.Text := 'TDSProvider."CN_RCV_GetDSOverview"';
    FCN_RCV_GetDSOverviewCommand_Cache.Prepare(TDSProvider_CN_RCV_GetDSOverview_Cache);
  end;
  FCN_RCV_GetDSOverviewCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FCN_RCV_GetDSOverviewCommand_Cache.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(AUnit) then
    FCN_RCV_GetDSOverviewCommand_Cache.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FCN_RCV_GetDSOverviewCommand_Cache.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FCN_RCV_GetDSOverviewCommand_Cache.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(AUnit), True);
      if FInstanceOwner then
        AUnit.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FCN_RCV_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FCN_RCV_GetDSOverviewCommand_Cache.Parameters[3].Value.GetString);
end;

function TDSProviderClient.DN_RCV_GetDSOverview(ATglAwal: TDateTime; ATglAkhir: TDateTime; AUnit: TModUnit; const ARequestFilter: string): TDataSet;
begin
  if FDN_RCV_GetDSOverviewCommand = nil then
  begin
    FDN_RCV_GetDSOverviewCommand := FConnection.CreateCommand;
    FDN_RCV_GetDSOverviewCommand.RequestType := 'POST';
    FDN_RCV_GetDSOverviewCommand.Text := 'TDSProvider."DN_RCV_GetDSOverview"';
    FDN_RCV_GetDSOverviewCommand.Prepare(TDSProvider_DN_RCV_GetDSOverview);
  end;
  FDN_RCV_GetDSOverviewCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FDN_RCV_GetDSOverviewCommand.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(AUnit) then
    FDN_RCV_GetDSOverviewCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDN_RCV_GetDSOverviewCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FDN_RCV_GetDSOverviewCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(AUnit), True);
      if FInstanceOwner then
        AUnit.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDN_RCV_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FDN_RCV_GetDSOverviewCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FDN_RCV_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.DN_RCV_GetDSOverview_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; AUnit: TModUnit; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FDN_RCV_GetDSOverviewCommand_Cache = nil then
  begin
    FDN_RCV_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FDN_RCV_GetDSOverviewCommand_Cache.RequestType := 'POST';
    FDN_RCV_GetDSOverviewCommand_Cache.Text := 'TDSProvider."DN_RCV_GetDSOverview"';
    FDN_RCV_GetDSOverviewCommand_Cache.Prepare(TDSProvider_DN_RCV_GetDSOverview_Cache);
  end;
  FDN_RCV_GetDSOverviewCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FDN_RCV_GetDSOverviewCommand_Cache.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(AUnit) then
    FDN_RCV_GetDSOverviewCommand_Cache.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDN_RCV_GetDSOverviewCommand_Cache.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FDN_RCV_GetDSOverviewCommand_Cache.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(AUnit), True);
      if FInstanceOwner then
        AUnit.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDN_RCV_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FDN_RCV_GetDSOverviewCommand_Cache.Parameters[3].Value.GetString);
end;

constructor TDSProviderClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TDSProviderClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TDSProviderClient.Destroy;
begin
  FBank_GetDSOverviewCommand.DisposeOf;
  FBank_GetDSOverviewCommand_Cache.DisposeOf;
  FRekening_GetDSLookupCommand.DisposeOf;
  FRekening_GetDSLookupCommand_Cache.DisposeOf;
  FRefPajak_GetDSOverviewCommand.DisposeOf;
  FRefPajak_GetDSOverviewCommand_Cache.DisposeOf;
  FRefTipeBarang_GetDSOverviewCommand.DisposeOf;
  FRefTipeBarang_GetDSOverviewCommand_Cache.DisposeOf;
  FGroupRekening_GetDSLookupCommand.DisposeOf;
  FGroupRekening_GetDSLookupCommand_Cache.DisposeOf;
  FRekening_GetDSOverviewCommand.DisposeOf;
  FRekening_GetDSOverviewCommand_Cache.DisposeOf;
  FMember_GetDSOverviewCommand.DisposeOf;
  FMember_GetDSOverviewCommand_Cache.DisposeOf;
  FMemberActivasi_GetDSOverviewCommand.DisposeOf;
  FMemberActivasi_GetDSOverviewCommand_Cache.DisposeOf;
  FRefDiscMember_GetDSOverviewCommand.DisposeOf;
  FRefDiscMember_GetDSOverviewCommand_Cache.DisposeOf;
  FMemberKeluarga_GetDSOverviewCommand.DisposeOf;
  FMemberKeluarga_GetDSOverviewCommand_Cache.DisposeOf;
  FRefGrupMember_GetDSOverviewCommand.DisposeOf;
  FRefGrupMember_GetDSOverviewCommand_Cache.DisposeOf;
  FSatuan_GetDSLookupCommand.DisposeOf;
  FSatuan_GetDSLookupCommand_Cache.DisposeOf;
  FCostCenter_GetDSLookupCommand.DisposeOf;
  FCostCenter_GetDSLookupCommand_Cache.DisposeOf;
  FCompany_GetDSLookupCommand.DisposeOf;
  FCompany_GetDSLookupCommand_Cache.DisposeOf;
  FCostCenter_GetDSOverviewCommand.DisposeOf;
  FCostCenter_GetDSOverviewCommand_Cache.DisposeOf;
  FCompany_GetDSOverviewCommand.DisposeOf;
  FCompany_GetDSOverviewCommand_Cache.DisposeOf;
  FTipePembayaran_GetDSOverviewCommand.DisposeOf;
  FTipePembayaran_GetDSOverviewCommand_Cache.DisposeOf;
  FTipePerusahaan_GetDSOverviewCommand.DisposeOf;
  FTipePerusahaan_GetDSOverviewCommand_Cache.DisposeOf;
  FOutlet_GetDSLookupCommand.DisposeOf;
  FOutlet_GetDSLookupCommand_Cache.DisposeOf;
  FLokasi_GetDSLookupCommand.DisposeOf;
  FLokasi_GetDSLookupCommand_Cache.DisposeOf;
  FMerchandise_GetDSLookupCommand.DisposeOf;
  FMerchandise_GetDSLookupCommand_Cache.DisposeOf;
  FMerchandiseGroup_GetDSLookupCommand.DisposeOf;
  FMerchandiseGroup_GetDSLookupCommand_Cache.DisposeOf;
  FSubGroup_GetDSLookupCommand.DisposeOf;
  FSubGroup_GetDSLookupCommand_Cache.DisposeOf;
  FSatuan_GetDSOverviewCommand.DisposeOf;
  FSatuan_GetDSOverviewCommand_Cache.DisposeOf;
  FKategori_GetDSLookupCommand.DisposeOf;
  FKategori_GetDSLookupCommand_Cache.DisposeOf;
  FMerk_GetDSLookUpCommand.DisposeOf;
  FMerk_GetDSLookUpCommand_Cache.DisposeOf;
  FRefPajak_GetDSLookupCommand.DisposeOf;
  FRefPajak_GetDSLookupCommand_Cache.DisposeOf;
  FRefTipeBarang_GetDSLookupCommand.DisposeOf;
  FRefTipeBarang_GetDSLookupCommand_Cache.DisposeOf;
  FTipeSuplier_GetDSOverviewCommand.DisposeOf;
  FTipeSuplier_GetDSOverviewCommand_Cache.DisposeOf;
  FUnit_GetDSOverviewCommand.DisposeOf;
  FUnit_GetDSOverviewCommand_Cache.DisposeOf;
  FUnit_GetDSLookUpCommand.DisposeOf;
  FUnit_GetDSLookUpCommand_Cache.DisposeOf;
  FUnitType_GetDSLookUpCommand.DisposeOf;
  FUnitType_GetDSLookUpCommand_Cache.DisposeOf;
  FUnitType_GetDSOverviewCommand.DisposeOf;
  FUnitType_GetDSOverviewCommand_Cache.DisposeOf;
  FApp_GetDSLookUpCommand.DisposeOf;
  FApp_GetDSLookUpCommand_Cache.DisposeOf;
  FApp_GetDSOverviewCommand.DisposeOf;
  FApp_GetDSOverviewCommand_Cache.DisposeOf;
  FBank_GetDSLookupCommand.DisposeOf;
  FBank_GetDSLookupCommand_Cache.DisposeOf;
  FBarang_GetDSOverviewCommand.DisposeOf;
  FBarang_GetDSOverviewCommand_Cache.DisposeOf;
  FGudang_GetDSOverviewCommand.DisposeOf;
  FGudang_GetDSOverviewCommand_Cache.DisposeOf;
  FRefTipeMember_GetDSOverviewCommand.DisposeOf;
  FRefTipeMember_GetDSOverviewCommand_Cache.DisposeOf;
  FAutAPP_GetDSLookupCommand.DisposeOf;
  FAutAPP_GetDSLookupCommand_Cache.DisposeOf;
  FTipeKirimPO_GetDSOverviewCommand.DisposeOf;
  FTipeKirimPO_GetDSOverviewCommand_Cache.DisposeOf;
  FSuplierGroup_GetDSOverview1Command.DisposeOf;
  FSuplierGroup_GetDSOverview1Command_Cache.DisposeOf;
  FSuplierGroup_GetDSLookupCommand.DisposeOf;
  FSuplierGroup_GetDSLookupCommand_Cache.DisposeOf;
  FSuplier_GetDSOverviewCommand.DisposeOf;
  FSuplier_GetDSOverviewCommand_Cache.DisposeOf;
  FTipePerusahaan_GetDSLookupCommand.DisposeOf;
  FTipePerusahaan_GetDSLookupCommand_Cache.DisposeOf;
  FTipeSuplier_GetDSLookupCommand.DisposeOf;
  FTipeSuplier_GetDSLookupCommand_Cache.DisposeOf;
  FPropinsi_GetDSLookUpCommand.DisposeOf;
  FPropinsi_GetDSLookUpCommand_Cache.DisposeOf;
  FKabupaten_GetDSLookUpCommand.DisposeOf;
  FKabupaten_GetDSLookUpCommand_Cache.DisposeOf;
  FMataUang_GetDSOverviewCommand.DisposeOf;
  FMataUang_GetDSOverviewCommand_Cache.DisposeOf;
  FAgama_GetDSLookupCommand.DisposeOf;
  FAgama_GetDSLookupCommand_Cache.DisposeOf;
  FTipeBonus_GetDSOverviewCommand.DisposeOf;
  FTipeBonus_GetDSOverviewCommand_Cache.DisposeOf;
  FDocument_GetDSOverviewCommand.DisposeOf;
  FDocument_GetDSOverviewCommand_Cache.DisposeOf;
  FAgama_GetDSOverviewCommand.DisposeOf;
  FAgama_GetDSOverviewCommand_Cache.DisposeOf;
  FAutUnit_GetDSLookupCommand.DisposeOf;
  FAutUnit_GetDSLookupCommand_Cache.DisposeOf;
  FBarangSupp_GetDSLookupCommand.DisposeOf;
  FBarangSupp_GetDSLookupCommand_Cache.DisposeOf;
  FBarangSupp_GetDSLookup2Command.DisposeOf;
  FBarangSupp_GetDSLookup2Command_Cache.DisposeOf;
  FBarang_ByPOLookUpCommand.DisposeOf;
  FBarang_ByPOLookUpCommand_Cache.DisposeOf;
  FBarang_GetDSLookupCommand.DisposeOf;
  FBarang_GetDSLookupCommand_Cache.DisposeOf;
  FGET_MEMBER_PAS_NOCommand.DisposeOf;
  FMerchandise_GetDSOverviewCommand.DisposeOf;
  FMerchandise_GetDSOverviewCommand_Cache.DisposeOf;
  FSupMGByOutstandingSO_GetDSLookupCommand.DisposeOf;
  FSupMGByOutstandingSO_GetDSLookupCommand_Cache.DisposeOf;
  FStatusPO_GetDSLookupCommand.DisposeOf;
  FStatusPO_GetDSLookupCommand_Cache.DisposeOf;
  FTipeHarga_GetDSLookupCommand.DisposeOf;
  FTipeHarga_GetDSLookupCommand_Cache.DisposeOf;
  FRefWilayah_GetDSLookupCommand.DisposeOf;
  FRefWilayah_GetDSLookupCommand_Cache.DisposeOf;
  FSuplier_GetDSLookupCommand.DisposeOf;
  FSuplier_GetDSLookupCommand_Cache.DisposeOf;
  FRefTipeMember_GetDSLookupCommand.DisposeOf;
  FRefTipeMember_GetDSLookupCommand_Cache.DisposeOf;
  FTipePO_GetDSOverviewCommand.DisposeOf;
  FTipePO_GetDSOverviewCommand_Cache.DisposeOf;
  FTipeCN_GetDSOverviewCommand.DisposeOf;
  FTipeCN_GetDSOverviewCommand_Cache.DisposeOf;
  FSO_GetDSOverviewCommand.DisposeOf;
  FSO_GetDSOverviewCommand_Cache.DisposeOf;
  FSO_GetDSOLookUpCommand.DisposeOf;
  FSO_GetDSOLookUpCommand_Cache.DisposeOf;
  FSubGroup_GetDSOverviewCommand.DisposeOf;
  FSubGroup_GetDSOverviewCommand_Cache.DisposeOf;
  FSuplierMerchan_GetDSLookupCommand.DisposeOf;
  FSuplierMerchan_GetDSLookupCommand_Cache.DisposeOf;
  FDO_GetDSLookUpCommand.DisposeOf;
  FDO_GetDSLookUpCommand_Cache.DisposeOf;
  FDO_GetDSOverviewCommand.DisposeOf;
  FDO_GetDSOverviewCommand_Cache.DisposeOf;
  FGudang_GetDSLookUpCommand.DisposeOf;
  FGudang_GetDSLookUpCommand_Cache.DisposeOf;
  FKompetitor_GetDSOverviewCommand.DisposeOf;
  FKompetitor_GetDSOverviewCommand_Cache.DisposeOf;
  FSO_GetDSOLookUpGeneratePOCommand.DisposeOf;
  FSO_GetDSOLookUpGeneratePOCommand_Cache.DisposeOf;
  FPO_GetDSOLookUpCommand.DisposeOf;
  FPO_GetDSOLookUpCommand_Cache.DisposeOf;
  FPORevisi_GetDSOverviewCommand.DisposeOf;
  FPORevisi_GetDSOverviewCommand_Cache.DisposeOf;
  FPO_DSLookUpDetailCommand.DisposeOf;
  FPO_DSLookUpDetailCommand_Cache.DisposeOf;
  FPO_GetDSByPeriodCommand.DisposeOf;
  FPO_GetDSByPeriodCommand_Cache.DisposeOf;
  FPO_GetDSOLookUpForGRCommand.DisposeOf;
  FPO_GetDSOLookUpForGRCommand_Cache.DisposeOf;
  FPO_SKULookUPCommand.DisposeOf;
  FPO_SKULookUPCommand_Cache.DisposeOf;
  FPO_SLIP_GetDSOverviewCommand.DisposeOf;
  FPO_SLIP_GetDSOverviewCommand_Cache.DisposeOf;
  FPO_GetDSOverviewDetilCommand.DisposeOf;
  FPO_GetDSOverviewDetilCommand_Cache.DisposeOf;
  FPO_GetDSOverviewCommand.DisposeOf;
  FPO_GetDSOverviewCommand_Cache.DisposeOf;
  FRefCreditCard_GetDSOverviewCommand.DisposeOf;
  FRefCreditCard_GetDSOverviewCommand_Cache.DisposeOf;
  FCN_RCV_GetDSOverviewCommand.DisposeOf;
  FCN_RCV_GetDSOverviewCommand_Cache.DisposeOf;
  FDN_RCV_GetDSOverviewCommand.DisposeOf;
  FDN_RCV_GetDSOverviewCommand_Cache.DisposeOf;
  inherited;
end;

function TDSReportClient.DO_GetDSNP(ANONP: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FDO_GetDSNPCommand = nil then
  begin
    FDO_GetDSNPCommand := FConnection.CreateCommand;
    FDO_GetDSNPCommand.RequestType := 'GET';
    FDO_GetDSNPCommand.Text := 'TDSReport.DO_GetDSNP';
    FDO_GetDSNPCommand.Prepare(TDSReport_DO_GetDSNP);
  end;
  FDO_GetDSNPCommand.Parameters[0].Value.SetWideString(ANONP);
  FDO_GetDSNPCommand.Execute(ARequestFilter);
  if not FDO_GetDSNPCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FDO_GetDSNPCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FDO_GetDSNPCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FDO_GetDSNPCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TDSReportClient.DO_GetDSNP_Cache(ANONP: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FDO_GetDSNPCommand_Cache = nil then
  begin
    FDO_GetDSNPCommand_Cache := FConnection.CreateCommand;
    FDO_GetDSNPCommand_Cache.RequestType := 'GET';
    FDO_GetDSNPCommand_Cache.Text := 'TDSReport.DO_GetDSNP';
    FDO_GetDSNPCommand_Cache.Prepare(TDSReport_DO_GetDSNP_Cache);
  end;
  FDO_GetDSNPCommand_Cache.Parameters[0].Value.SetWideString(ANONP);
  FDO_GetDSNPCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FDO_GetDSNPCommand_Cache.Parameters[1].Value.GetString);
end;

function TDSReportClient.DO_GetDS_CheckList(ANONP: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FDO_GetDS_CheckListCommand = nil then
  begin
    FDO_GetDS_CheckListCommand := FConnection.CreateCommand;
    FDO_GetDS_CheckListCommand.RequestType := 'GET';
    FDO_GetDS_CheckListCommand.Text := 'TDSReport.DO_GetDS_CheckList';
    FDO_GetDS_CheckListCommand.Prepare(TDSReport_DO_GetDS_CheckList);
  end;
  FDO_GetDS_CheckListCommand.Parameters[0].Value.SetWideString(ANONP);
  FDO_GetDS_CheckListCommand.Execute(ARequestFilter);
  if not FDO_GetDS_CheckListCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FDO_GetDS_CheckListCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FDO_GetDS_CheckListCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FDO_GetDS_CheckListCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TDSReportClient.DO_GetDS_CheckList_Cache(ANONP: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FDO_GetDS_CheckListCommand_Cache = nil then
  begin
    FDO_GetDS_CheckListCommand_Cache := FConnection.CreateCommand;
    FDO_GetDS_CheckListCommand_Cache.RequestType := 'GET';
    FDO_GetDS_CheckListCommand_Cache.Text := 'TDSReport.DO_GetDS_CheckList';
    FDO_GetDS_CheckListCommand_Cache.Prepare(TDSReport_DO_GetDS_CheckList_Cache);
  end;
  FDO_GetDS_CheckListCommand_Cache.Parameters[0].Value.SetWideString(ANONP);
  FDO_GetDS_CheckListCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FDO_GetDS_CheckListCommand_Cache.Parameters[1].Value.GetString);
end;

function TDSReportClient.KartuStock_GetDS(aBarang_ID: string; aStartDate: TDateTime; aEndDate: TDateTime; aGudang_ID: string; const ARequestFilter: string): TDataSet;
begin
  if FKartuStock_GetDSCommand = nil then
  begin
    FKartuStock_GetDSCommand := FConnection.CreateCommand;
    FKartuStock_GetDSCommand.RequestType := 'GET';
    FKartuStock_GetDSCommand.Text := 'TDSReport.KartuStock_GetDS';
    FKartuStock_GetDSCommand.Prepare(TDSReport_KartuStock_GetDS);
  end;
  FKartuStock_GetDSCommand.Parameters[0].Value.SetWideString(aBarang_ID);
  FKartuStock_GetDSCommand.Parameters[1].Value.AsDateTime := aStartDate;
  FKartuStock_GetDSCommand.Parameters[2].Value.AsDateTime := aEndDate;
  FKartuStock_GetDSCommand.Parameters[3].Value.SetWideString(aGudang_ID);
  FKartuStock_GetDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FKartuStock_GetDSCommand.Parameters[4].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FKartuStock_GetDSCommand.FreeOnExecute(Result);
end;

function TDSReportClient.KartuStock_GetDS_Cache(aBarang_ID: string; aStartDate: TDateTime; aEndDate: TDateTime; aGudang_ID: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FKartuStock_GetDSCommand_Cache = nil then
  begin
    FKartuStock_GetDSCommand_Cache := FConnection.CreateCommand;
    FKartuStock_GetDSCommand_Cache.RequestType := 'GET';
    FKartuStock_GetDSCommand_Cache.Text := 'TDSReport.KartuStock_GetDS';
    FKartuStock_GetDSCommand_Cache.Prepare(TDSReport_KartuStock_GetDS_Cache);
  end;
  FKartuStock_GetDSCommand_Cache.Parameters[0].Value.SetWideString(aBarang_ID);
  FKartuStock_GetDSCommand_Cache.Parameters[1].Value.AsDateTime := aStartDate;
  FKartuStock_GetDSCommand_Cache.Parameters[2].Value.AsDateTime := aEndDate;
  FKartuStock_GetDSCommand_Cache.Parameters[3].Value.SetWideString(aGudang_ID);
  FKartuStock_GetDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FKartuStock_GetDSCommand_Cache.Parameters[4].Value.GetString);
end;

function TDSReportClient.StockProduct_GetDS(aEndDate: TDateTime; aGroup_ID: string; aSupplier_ID: string; aGudang_ID: string; const ARequestFilter: string): TDataSet;
begin
  if FStockProduct_GetDSCommand = nil then
  begin
    FStockProduct_GetDSCommand := FConnection.CreateCommand;
    FStockProduct_GetDSCommand.RequestType := 'GET';
    FStockProduct_GetDSCommand.Text := 'TDSReport.StockProduct_GetDS';
    FStockProduct_GetDSCommand.Prepare(TDSReport_StockProduct_GetDS);
  end;
  FStockProduct_GetDSCommand.Parameters[0].Value.AsDateTime := aEndDate;
  FStockProduct_GetDSCommand.Parameters[1].Value.SetWideString(aGroup_ID);
  FStockProduct_GetDSCommand.Parameters[2].Value.SetWideString(aSupplier_ID);
  FStockProduct_GetDSCommand.Parameters[3].Value.SetWideString(aGudang_ID);
  FStockProduct_GetDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FStockProduct_GetDSCommand.Parameters[4].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FStockProduct_GetDSCommand.FreeOnExecute(Result);
end;

function TDSReportClient.StockProduct_GetDS_Cache(aEndDate: TDateTime; aGroup_ID: string; aSupplier_ID: string; aGudang_ID: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FStockProduct_GetDSCommand_Cache = nil then
  begin
    FStockProduct_GetDSCommand_Cache := FConnection.CreateCommand;
    FStockProduct_GetDSCommand_Cache.RequestType := 'GET';
    FStockProduct_GetDSCommand_Cache.Text := 'TDSReport.StockProduct_GetDS';
    FStockProduct_GetDSCommand_Cache.Prepare(TDSReport_StockProduct_GetDS_Cache);
  end;
  FStockProduct_GetDSCommand_Cache.Parameters[0].Value.AsDateTime := aEndDate;
  FStockProduct_GetDSCommand_Cache.Parameters[1].Value.SetWideString(aGroup_ID);
  FStockProduct_GetDSCommand_Cache.Parameters[2].Value.SetWideString(aSupplier_ID);
  FStockProduct_GetDSCommand_Cache.Parameters[3].Value.SetWideString(aGudang_ID);
  FStockProduct_GetDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FStockProduct_GetDSCommand_Cache.Parameters[4].Value.GetString);
end;

function TDSReportClient.SO_ByDate(StartDate: TDateTime; EndDate: TDateTime; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FSO_ByDateCommand = nil then
  begin
    FSO_ByDateCommand := FConnection.CreateCommand;
    FSO_ByDateCommand.RequestType := 'GET';
    FSO_ByDateCommand.Text := 'TDSReport.SO_ByDate';
    FSO_ByDateCommand.Prepare(TDSReport_SO_ByDate);
  end;
  FSO_ByDateCommand.Parameters[0].Value.AsDateTime := StartDate;
  FSO_ByDateCommand.Parameters[1].Value.AsDateTime := EndDate;
  FSO_ByDateCommand.Execute(ARequestFilter);
  if not FSO_ByDateCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FSO_ByDateCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FSO_ByDateCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FSO_ByDateCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TDSReportClient.SO_ByDate_Cache(StartDate: TDateTime; EndDate: TDateTime; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FSO_ByDateCommand_Cache = nil then
  begin
    FSO_ByDateCommand_Cache := FConnection.CreateCommand;
    FSO_ByDateCommand_Cache.RequestType := 'GET';
    FSO_ByDateCommand_Cache.Text := 'TDSReport.SO_ByDate';
    FSO_ByDateCommand_Cache.Prepare(TDSReport_SO_ByDate_Cache);
  end;
  FSO_ByDateCommand_Cache.Parameters[0].Value.AsDateTime := StartDate;
  FSO_ByDateCommand_Cache.Parameters[1].Value.AsDateTime := EndDate;
  FSO_ByDateCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FSO_ByDateCommand_Cache.Parameters[2].Value.GetString);
end;

function TDSReportClient.SO_ByDateNoBukti(StartDate: TDateTime; EndDate: TDateTime; aNoBuktiAwal: string; aNoBuktiAkhir: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FSO_ByDateNoBuktiCommand = nil then
  begin
    FSO_ByDateNoBuktiCommand := FConnection.CreateCommand;
    FSO_ByDateNoBuktiCommand.RequestType := 'GET';
    FSO_ByDateNoBuktiCommand.Text := 'TDSReport.SO_ByDateNoBukti';
    FSO_ByDateNoBuktiCommand.Prepare(TDSReport_SO_ByDateNoBukti);
  end;
  FSO_ByDateNoBuktiCommand.Parameters[0].Value.AsDateTime := StartDate;
  FSO_ByDateNoBuktiCommand.Parameters[1].Value.AsDateTime := EndDate;
  FSO_ByDateNoBuktiCommand.Parameters[2].Value.SetWideString(aNoBuktiAwal);
  FSO_ByDateNoBuktiCommand.Parameters[3].Value.SetWideString(aNoBuktiAkhir);
  FSO_ByDateNoBuktiCommand.Execute(ARequestFilter);
  if not FSO_ByDateNoBuktiCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FSO_ByDateNoBuktiCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FSO_ByDateNoBuktiCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FSO_ByDateNoBuktiCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TDSReportClient.SO_ByDateNoBukti_Cache(StartDate: TDateTime; EndDate: TDateTime; aNoBuktiAwal: string; aNoBuktiAkhir: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FSO_ByDateNoBuktiCommand_Cache = nil then
  begin
    FSO_ByDateNoBuktiCommand_Cache := FConnection.CreateCommand;
    FSO_ByDateNoBuktiCommand_Cache.RequestType := 'GET';
    FSO_ByDateNoBuktiCommand_Cache.Text := 'TDSReport.SO_ByDateNoBukti';
    FSO_ByDateNoBuktiCommand_Cache.Prepare(TDSReport_SO_ByDateNoBukti_Cache);
  end;
  FSO_ByDateNoBuktiCommand_Cache.Parameters[0].Value.AsDateTime := StartDate;
  FSO_ByDateNoBuktiCommand_Cache.Parameters[1].Value.AsDateTime := EndDate;
  FSO_ByDateNoBuktiCommand_Cache.Parameters[2].Value.SetWideString(aNoBuktiAwal);
  FSO_ByDateNoBuktiCommand_Cache.Parameters[3].Value.SetWideString(aNoBuktiAkhir);
  FSO_ByDateNoBuktiCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FSO_ByDateNoBuktiCommand_Cache.Parameters[4].Value.GetString);
end;

function TDSReportClient.PO_SLIP_ByDateNoBukti(StartDate: TDateTime; EndDate: TDateTime; aNoBuktiAwal: string; aNoBuktiAkhir: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FPO_SLIP_ByDateNoBuktiCommand = nil then
  begin
    FPO_SLIP_ByDateNoBuktiCommand := FConnection.CreateCommand;
    FPO_SLIP_ByDateNoBuktiCommand.RequestType := 'GET';
    FPO_SLIP_ByDateNoBuktiCommand.Text := 'TDSReport.PO_SLIP_ByDateNoBukti';
    FPO_SLIP_ByDateNoBuktiCommand.Prepare(TDSReport_PO_SLIP_ByDateNoBukti);
  end;
  FPO_SLIP_ByDateNoBuktiCommand.Parameters[0].Value.AsDateTime := StartDate;
  FPO_SLIP_ByDateNoBuktiCommand.Parameters[1].Value.AsDateTime := EndDate;
  FPO_SLIP_ByDateNoBuktiCommand.Parameters[2].Value.SetWideString(aNoBuktiAwal);
  FPO_SLIP_ByDateNoBuktiCommand.Parameters[3].Value.SetWideString(aNoBuktiAkhir);
  FPO_SLIP_ByDateNoBuktiCommand.Execute(ARequestFilter);
  if not FPO_SLIP_ByDateNoBuktiCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FPO_SLIP_ByDateNoBuktiCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FPO_SLIP_ByDateNoBuktiCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FPO_SLIP_ByDateNoBuktiCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TDSReportClient.PO_SLIP_ByDateNoBukti_Cache(StartDate: TDateTime; EndDate: TDateTime; aNoBuktiAwal: string; aNoBuktiAkhir: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FPO_SLIP_ByDateNoBuktiCommand_Cache = nil then
  begin
    FPO_SLIP_ByDateNoBuktiCommand_Cache := FConnection.CreateCommand;
    FPO_SLIP_ByDateNoBuktiCommand_Cache.RequestType := 'GET';
    FPO_SLIP_ByDateNoBuktiCommand_Cache.Text := 'TDSReport.PO_SLIP_ByDateNoBukti';
    FPO_SLIP_ByDateNoBuktiCommand_Cache.Prepare(TDSReport_PO_SLIP_ByDateNoBukti_Cache);
  end;
  FPO_SLIP_ByDateNoBuktiCommand_Cache.Parameters[0].Value.AsDateTime := StartDate;
  FPO_SLIP_ByDateNoBuktiCommand_Cache.Parameters[1].Value.AsDateTime := EndDate;
  FPO_SLIP_ByDateNoBuktiCommand_Cache.Parameters[2].Value.SetWideString(aNoBuktiAwal);
  FPO_SLIP_ByDateNoBuktiCommand_Cache.Parameters[3].Value.SetWideString(aNoBuktiAkhir);
  FPO_SLIP_ByDateNoBuktiCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FPO_SLIP_ByDateNoBuktiCommand_Cache.Parameters[4].Value.GetString);
end;

function TDSReportClient.SO_Test(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FSO_TestCommand = nil then
  begin
    FSO_TestCommand := FConnection.CreateCommand;
    FSO_TestCommand.RequestType := 'GET';
    FSO_TestCommand.Text := 'TDSReport.SO_Test';
    FSO_TestCommand.Prepare(TDSReport_SO_Test);
  end;
  FSO_TestCommand.Execute(ARequestFilter);
  if not FSO_TestCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FSO_TestCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FSO_TestCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FSO_TestCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TDSReportClient.SO_Test_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FSO_TestCommand_Cache = nil then
  begin
    FSO_TestCommand_Cache := FConnection.CreateCommand;
    FSO_TestCommand_Cache.RequestType := 'GET';
    FSO_TestCommand_Cache.Text := 'TDSReport.SO_Test';
    FSO_TestCommand_Cache.Prepare(TDSReport_SO_Test_Cache);
  end;
  FSO_TestCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FSO_TestCommand_Cache.Parameters[0].Value.GetString);
end;

constructor TDSReportClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TDSReportClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TDSReportClient.Destroy;
begin
  FDO_GetDSNPCommand.DisposeOf;
  FDO_GetDSNPCommand_Cache.DisposeOf;
  FDO_GetDS_CheckListCommand.DisposeOf;
  FDO_GetDS_CheckListCommand_Cache.DisposeOf;
  FKartuStock_GetDSCommand.DisposeOf;
  FKartuStock_GetDSCommand_Cache.DisposeOf;
  FStockProduct_GetDSCommand.DisposeOf;
  FStockProduct_GetDSCommand_Cache.DisposeOf;
  FSO_ByDateCommand.DisposeOf;
  FSO_ByDateCommand_Cache.DisposeOf;
  FSO_ByDateNoBuktiCommand.DisposeOf;
  FSO_ByDateNoBuktiCommand_Cache.DisposeOf;
  FPO_SLIP_ByDateNoBuktiCommand.DisposeOf;
  FPO_SLIP_ByDateNoBuktiCommand_Cache.DisposeOf;
  FSO_TestCommand.DisposeOf;
  FSO_TestCommand_Cache.DisposeOf;
  inherited;
end;

function TSuggestionOrderClient.GenerateSO(aTanggal: TDateTime; aMerchan_ID: string; aSupplierMerchan_ID: string; const ARequestFilter: string): TDataSet;
begin
  if FGenerateSOCommand = nil then
  begin
    FGenerateSOCommand := FConnection.CreateCommand;
    FGenerateSOCommand.RequestType := 'GET';
    FGenerateSOCommand.Text := 'TSuggestionOrder.GenerateSO';
    FGenerateSOCommand.Prepare(TSuggestionOrder_GenerateSO);
  end;
  FGenerateSOCommand.Parameters[0].Value.AsDateTime := aTanggal;
  FGenerateSOCommand.Parameters[1].Value.SetWideString(aMerchan_ID);
  FGenerateSOCommand.Parameters[2].Value.SetWideString(aSupplierMerchan_ID);
  FGenerateSOCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FGenerateSOCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FGenerateSOCommand.FreeOnExecute(Result);
end;

function TSuggestionOrderClient.GenerateSO_Cache(aTanggal: TDateTime; aMerchan_ID: string; aSupplierMerchan_ID: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FGenerateSOCommand_Cache = nil then
  begin
    FGenerateSOCommand_Cache := FConnection.CreateCommand;
    FGenerateSOCommand_Cache.RequestType := 'GET';
    FGenerateSOCommand_Cache.Text := 'TSuggestionOrder.GenerateSO';
    FGenerateSOCommand_Cache.Prepare(TSuggestionOrder_GenerateSO_Cache);
  end;
  FGenerateSOCommand_Cache.Parameters[0].Value.AsDateTime := aTanggal;
  FGenerateSOCommand_Cache.Parameters[1].Value.SetWideString(aMerchan_ID);
  FGenerateSOCommand_Cache.Parameters[2].Value.SetWideString(aSupplierMerchan_ID);
  FGenerateSOCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FGenerateSOCommand_Cache.Parameters[3].Value.GetString);
end;

function TSuggestionOrderClient.RetrieveDetails(aID: string; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDetailsCommand = nil then
  begin
    FRetrieveDetailsCommand := FConnection.CreateCommand;
    FRetrieveDetailsCommand.RequestType := 'GET';
    FRetrieveDetailsCommand.Text := 'TSuggestionOrder.RetrieveDetails';
    FRetrieveDetailsCommand.Prepare(TSuggestionOrder_RetrieveDetails);
  end;
  FRetrieveDetailsCommand.Parameters[0].Value.SetWideString(aID);
  FRetrieveDetailsCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDetailsCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDetailsCommand.FreeOnExecute(Result);
end;

function TSuggestionOrderClient.RetrieveDetails_Cache(aID: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDetailsCommand_Cache = nil then
  begin
    FRetrieveDetailsCommand_Cache := FConnection.CreateCommand;
    FRetrieveDetailsCommand_Cache.RequestType := 'GET';
    FRetrieveDetailsCommand_Cache.Text := 'TSuggestionOrder.RetrieveDetails';
    FRetrieveDetailsCommand_Cache.Prepare(TSuggestionOrder_RetrieveDetails_Cache);
  end;
  FRetrieveDetailsCommand_Cache.Parameters[0].Value.SetWideString(aID);
  FRetrieveDetailsCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDetailsCommand_Cache.Parameters[1].Value.GetString);
end;

procedure TSuggestionOrderClient.AfterExecuteMethod;
begin
  if FAfterExecuteMethodCommand = nil then
  begin
    FAfterExecuteMethodCommand := FConnection.CreateCommand;
    FAfterExecuteMethodCommand.RequestType := 'GET';
    FAfterExecuteMethodCommand.Text := 'TSuggestionOrder.AfterExecuteMethod';
  end;
  FAfterExecuteMethodCommand.Execute;
end;

constructor TSuggestionOrderClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TSuggestionOrderClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TSuggestionOrderClient.Destroy;
begin
  FGenerateSOCommand.DisposeOf;
  FGenerateSOCommand_Cache.DisposeOf;
  FRetrieveDetailsCommand.DisposeOf;
  FRetrieveDetailsCommand_Cache.DisposeOf;
  FAfterExecuteMethodCommand.DisposeOf;
  inherited;
end;

function TCrudSupplierClient.BeforeSaveToDB(AObject: TModApp; const ARequestFilter: string): Boolean;
begin
  if FBeforeSaveToDBCommand = nil then
  begin
    FBeforeSaveToDBCommand := FConnection.CreateCommand;
    FBeforeSaveToDBCommand.RequestType := 'POST';
    FBeforeSaveToDBCommand.Text := 'TCrudSupplier."BeforeSaveToDB"';
    FBeforeSaveToDBCommand.Prepare(TCrudSupplier_BeforeSaveToDB);
  end;
  if not Assigned(AObject) then
    FBeforeSaveToDBCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FBeforeSaveToDBCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FBeforeSaveToDBCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FBeforeSaveToDBCommand.Execute(ARequestFilter);
  Result := FBeforeSaveToDBCommand.Parameters[1].Value.GetBoolean;
end;

function TCrudSupplierClient.SaveToDB(AObject: TModApp; const ARequestFilter: string): Boolean;
begin
  if FSaveToDBCommand = nil then
  begin
    FSaveToDBCommand := FConnection.CreateCommand;
    FSaveToDBCommand.RequestType := 'POST';
    FSaveToDBCommand.Text := 'TCrudSupplier."SaveToDB"';
    FSaveToDBCommand.Prepare(TCrudSupplier_SaveToDB);
  end;
  if not Assigned(AObject) then
    FSaveToDBCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveToDBCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveToDBCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveToDBCommand.Execute(ARequestFilter);
  Result := FSaveToDBCommand.Parameters[1].Value.GetBoolean;
end;

function TCrudSupplierClient.DeleteFromDB(AObject: TModApp; const ARequestFilter: string): Boolean;
begin
  if FDeleteFromDBCommand = nil then
  begin
    FDeleteFromDBCommand := FConnection.CreateCommand;
    FDeleteFromDBCommand.RequestType := 'POST';
    FDeleteFromDBCommand.Text := 'TCrudSupplier."DeleteFromDB"';
    FDeleteFromDBCommand.Prepare(TCrudSupplier_DeleteFromDB);
  end;
  if not Assigned(AObject) then
    FDeleteFromDBCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteFromDBCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteFromDBCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteFromDBCommand.Execute(ARequestFilter);
  Result := FDeleteFromDBCommand.Parameters[1].Value.GetBoolean;
end;

function TCrudSupplierClient.OpenQuery(S: string; const ARequestFilter: string): TDataSet;
begin
  if FOpenQueryCommand = nil then
  begin
    FOpenQueryCommand := FConnection.CreateCommand;
    FOpenQueryCommand.RequestType := 'GET';
    FOpenQueryCommand.Text := 'TCrudSupplier.OpenQuery';
    FOpenQueryCommand.Prepare(TCrudSupplier_OpenQuery);
  end;
  FOpenQueryCommand.Parameters[0].Value.SetWideString(S);
  FOpenQueryCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FOpenQueryCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FOpenQueryCommand.FreeOnExecute(Result);
end;

function TCrudSupplierClient.OpenQuery_Cache(S: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FOpenQueryCommand_Cache = nil then
  begin
    FOpenQueryCommand_Cache := FConnection.CreateCommand;
    FOpenQueryCommand_Cache.RequestType := 'GET';
    FOpenQueryCommand_Cache.Text := 'TCrudSupplier.OpenQuery';
    FOpenQueryCommand_Cache.Prepare(TCrudSupplier_OpenQuery_Cache);
  end;
  FOpenQueryCommand_Cache.Parameters[0].Value.SetWideString(S);
  FOpenQueryCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FOpenQueryCommand_Cache.Parameters[1].Value.GetString);
end;

function TCrudSupplierClient.Retrieve(ModClassName: string; AID: string; const ARequestFilter: string): TModApp;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TCrudSupplier.Retrieve';
    FRetrieveCommand.Prepare(TCrudSupplier_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveCommand.Parameters[1].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModApp(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudSupplierClient.Retrieve_Cache(ModClassName: string; AID: string; const ARequestFilter: string): IDSRestCachedTModApp;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TCrudSupplier.Retrieve';
    FRetrieveCommand_Cache.Prepare(TCrudSupplier_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveCommand_Cache.Parameters[1].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModApp.Create(FRetrieveCommand_Cache.Parameters[2].Value.GetString);
end;

function TCrudSupplierClient.GenerateCustomNo(aTableName: string; aFieldName: string; aCountDigit: Integer; const ARequestFilter: string): string;
begin
  if FGenerateCustomNoCommand = nil then
  begin
    FGenerateCustomNoCommand := FConnection.CreateCommand;
    FGenerateCustomNoCommand.RequestType := 'GET';
    FGenerateCustomNoCommand.Text := 'TCrudSupplier.GenerateCustomNo';
    FGenerateCustomNoCommand.Prepare(TCrudSupplier_GenerateCustomNo);
  end;
  FGenerateCustomNoCommand.Parameters[0].Value.SetWideString(aTableName);
  FGenerateCustomNoCommand.Parameters[1].Value.SetWideString(aFieldName);
  FGenerateCustomNoCommand.Parameters[2].Value.SetInt32(aCountDigit);
  FGenerateCustomNoCommand.Execute(ARequestFilter);
  Result := FGenerateCustomNoCommand.Parameters[3].Value.GetWideString;
end;

function TCrudSupplierClient.GenerateNo(aClassName: string; const ARequestFilter: string): string;
begin
  if FGenerateNoCommand = nil then
  begin
    FGenerateNoCommand := FConnection.CreateCommand;
    FGenerateNoCommand.RequestType := 'GET';
    FGenerateNoCommand.Text := 'TCrudSupplier.GenerateNo';
    FGenerateNoCommand.Prepare(TCrudSupplier_GenerateNo);
  end;
  FGenerateNoCommand.Parameters[0].Value.SetWideString(aClassName);
  FGenerateNoCommand.Execute(ARequestFilter);
  Result := FGenerateNoCommand.Parameters[1].Value.GetWideString;
end;

function TCrudSupplierClient.RetrieveSingle(ModClassName: string; AID: string; const ARequestFilter: string): TModApp;
begin
  if FRetrieveSingleCommand = nil then
  begin
    FRetrieveSingleCommand := FConnection.CreateCommand;
    FRetrieveSingleCommand.RequestType := 'GET';
    FRetrieveSingleCommand.Text := 'TCrudSupplier.RetrieveSingle';
    FRetrieveSingleCommand.Prepare(TCrudSupplier_RetrieveSingle);
  end;
  FRetrieveSingleCommand.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveSingleCommand.Parameters[1].Value.SetWideString(AID);
  FRetrieveSingleCommand.Execute(ARequestFilter);
  if not FRetrieveSingleCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveSingleCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModApp(FUnMarshal.UnMarshal(FRetrieveSingleCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveSingleCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudSupplierClient.RetrieveSingle_Cache(ModClassName: string; AID: string; const ARequestFilter: string): IDSRestCachedTModApp;
begin
  if FRetrieveSingleCommand_Cache = nil then
  begin
    FRetrieveSingleCommand_Cache := FConnection.CreateCommand;
    FRetrieveSingleCommand_Cache.RequestType := 'GET';
    FRetrieveSingleCommand_Cache.Text := 'TCrudSupplier.RetrieveSingle';
    FRetrieveSingleCommand_Cache.Prepare(TCrudSupplier_RetrieveSingle_Cache);
  end;
  FRetrieveSingleCommand_Cache.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveSingleCommand_Cache.Parameters[1].Value.SetWideString(AID);
  FRetrieveSingleCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModApp.Create(FRetrieveSingleCommand_Cache.Parameters[2].Value.GetString);
end;

function TCrudSupplierClient.RetrieveByCode(ModClassName: string; aCode: string; const ARequestFilter: string): TModApp;
begin
  if FRetrieveByCodeCommand = nil then
  begin
    FRetrieveByCodeCommand := FConnection.CreateCommand;
    FRetrieveByCodeCommand.RequestType := 'GET';
    FRetrieveByCodeCommand.Text := 'TCrudSupplier.RetrieveByCode';
    FRetrieveByCodeCommand.Prepare(TCrudSupplier_RetrieveByCode);
  end;
  FRetrieveByCodeCommand.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveByCodeCommand.Parameters[1].Value.SetWideString(aCode);
  FRetrieveByCodeCommand.Execute(ARequestFilter);
  if not FRetrieveByCodeCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveByCodeCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModApp(FUnMarshal.UnMarshal(FRetrieveByCodeCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveByCodeCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudSupplierClient.RetrieveByCode_Cache(ModClassName: string; aCode: string; const ARequestFilter: string): IDSRestCachedTModApp;
begin
  if FRetrieveByCodeCommand_Cache = nil then
  begin
    FRetrieveByCodeCommand_Cache := FConnection.CreateCommand;
    FRetrieveByCodeCommand_Cache.RequestType := 'GET';
    FRetrieveByCodeCommand_Cache.Text := 'TCrudSupplier.RetrieveByCode';
    FRetrieveByCodeCommand_Cache.Prepare(TCrudSupplier_RetrieveByCode_Cache);
  end;
  FRetrieveByCodeCommand_Cache.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveByCodeCommand_Cache.Parameters[1].Value.SetWideString(aCode);
  FRetrieveByCodeCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModApp.Create(FRetrieveByCodeCommand_Cache.Parameters[2].Value.GetString);
end;

function TCrudSupplierClient.SaveToDBLog(AObject: TModApp; const ARequestFilter: string): Boolean;
begin
  if FSaveToDBLogCommand = nil then
  begin
    FSaveToDBLogCommand := FConnection.CreateCommand;
    FSaveToDBLogCommand.RequestType := 'POST';
    FSaveToDBLogCommand.Text := 'TCrudSupplier."SaveToDBLog"';
    FSaveToDBLogCommand.Prepare(TCrudSupplier_SaveToDBLog);
  end;
  if not Assigned(AObject) then
    FSaveToDBLogCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveToDBLogCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveToDBLogCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveToDBLogCommand.Execute(ARequestFilter);
  Result := FSaveToDBLogCommand.Parameters[1].Value.GetBoolean;
end;

function TCrudSupplierClient.SaveToDBID(AObject: TModApp; const ARequestFilter: string): string;
begin
  if FSaveToDBIDCommand = nil then
  begin
    FSaveToDBIDCommand := FConnection.CreateCommand;
    FSaveToDBIDCommand.RequestType := 'POST';
    FSaveToDBIDCommand.Text := 'TCrudSupplier."SaveToDBID"';
    FSaveToDBIDCommand.Prepare(TCrudSupplier_SaveToDBID);
  end;
  if not Assigned(AObject) then
    FSaveToDBIDCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveToDBIDCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveToDBIDCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveToDBIDCommand.Execute(ARequestFilter);
  Result := FSaveToDBIDCommand.Parameters[1].Value.GetWideString;
end;

function TCrudSupplierClient.TestGenerateSQL(AObject: TModApp; const ARequestFilter: string): TStrings;
begin
  if FTestGenerateSQLCommand = nil then
  begin
    FTestGenerateSQLCommand := FConnection.CreateCommand;
    FTestGenerateSQLCommand.RequestType := 'POST';
    FTestGenerateSQLCommand.Text := 'TCrudSupplier."TestGenerateSQL"';
    FTestGenerateSQLCommand.Prepare(TCrudSupplier_TestGenerateSQL);
  end;
  if not Assigned(AObject) then
    FTestGenerateSQLCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FTestGenerateSQLCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FTestGenerateSQLCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FTestGenerateSQLCommand.Execute(ARequestFilter);
  if not FTestGenerateSQLCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FTestGenerateSQLCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TStrings(FUnMarshal.UnMarshal(FTestGenerateSQLCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FTestGenerateSQLCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudSupplierClient.TestGenerateSQL_Cache(AObject: TModApp; const ARequestFilter: string): IDSRestCachedTStrings;
begin
  if FTestGenerateSQLCommand_Cache = nil then
  begin
    FTestGenerateSQLCommand_Cache := FConnection.CreateCommand;
    FTestGenerateSQLCommand_Cache.RequestType := 'POST';
    FTestGenerateSQLCommand_Cache.Text := 'TCrudSupplier."TestGenerateSQL"';
    FTestGenerateSQLCommand_Cache.Prepare(TCrudSupplier_TestGenerateSQL_Cache);
  end;
  if not Assigned(AObject) then
    FTestGenerateSQLCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FTestGenerateSQLCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FTestGenerateSQLCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FTestGenerateSQLCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTStrings.Create(FTestGenerateSQLCommand_Cache.Parameters[1].Value.GetString);
end;

procedure TCrudSupplierClient.AfterExecuteMethod;
begin
  if FAfterExecuteMethodCommand = nil then
  begin
    FAfterExecuteMethodCommand := FConnection.CreateCommand;
    FAfterExecuteMethodCommand.RequestType := 'GET';
    FAfterExecuteMethodCommand.Text := 'TCrudSupplier.AfterExecuteMethod';
  end;
  FAfterExecuteMethodCommand.Execute;
end;

constructor TCrudSupplierClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TCrudSupplierClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TCrudSupplierClient.Destroy;
begin
  FBeforeSaveToDBCommand.DisposeOf;
  FSaveToDBCommand.DisposeOf;
  FDeleteFromDBCommand.DisposeOf;
  FOpenQueryCommand.DisposeOf;
  FOpenQueryCommand_Cache.DisposeOf;
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FGenerateCustomNoCommand.DisposeOf;
  FGenerateNoCommand.DisposeOf;
  FRetrieveSingleCommand.DisposeOf;
  FRetrieveSingleCommand_Cache.DisposeOf;
  FRetrieveByCodeCommand.DisposeOf;
  FRetrieveByCodeCommand_Cache.DisposeOf;
  FSaveToDBLogCommand.DisposeOf;
  FSaveToDBIDCommand.DisposeOf;
  FTestGenerateSQLCommand.DisposeOf;
  FTestGenerateSQLCommand_Cache.DisposeOf;
  FAfterExecuteMethodCommand.DisposeOf;
  inherited;
end;

function TCrudPOClient.GeneratePO(ASOID: string; ASupMGID: string; const ARequestFilter: string): Boolean;
begin
  if FGeneratePOCommand = nil then
  begin
    FGeneratePOCommand := FConnection.CreateCommand;
    FGeneratePOCommand.RequestType := 'GET';
    FGeneratePOCommand.Text := 'TCrudPO.GeneratePO';
    FGeneratePOCommand.Prepare(TCrudPO_GeneratePO);
  end;
  FGeneratePOCommand.Parameters[0].Value.SetWideString(ASOID);
  FGeneratePOCommand.Parameters[1].Value.SetWideString(ASupMGID);
  FGeneratePOCommand.Execute(ARequestFilter);
  Result := FGeneratePOCommand.Parameters[2].Value.GetBoolean;
end;

function TCrudPOClient.SaveToDB(AObject: TModApp; const ARequestFilter: string): Boolean;
begin
  if FSaveToDBCommand = nil then
  begin
    FSaveToDBCommand := FConnection.CreateCommand;
    FSaveToDBCommand.RequestType := 'POST';
    FSaveToDBCommand.Text := 'TCrudPO."SaveToDB"';
    FSaveToDBCommand.Prepare(TCrudPO_SaveToDB);
  end;
  if not Assigned(AObject) then
    FSaveToDBCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveToDBCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveToDBCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveToDBCommand.Execute(ARequestFilter);
  Result := FSaveToDBCommand.Parameters[1].Value.GetBoolean;
end;

function TCrudPOClient.DeleteFromDB(AObject: TModApp; const ARequestFilter: string): Boolean;
begin
  if FDeleteFromDBCommand = nil then
  begin
    FDeleteFromDBCommand := FConnection.CreateCommand;
    FDeleteFromDBCommand.RequestType := 'POST';
    FDeleteFromDBCommand.Text := 'TCrudPO."DeleteFromDB"';
    FDeleteFromDBCommand.Prepare(TCrudPO_DeleteFromDB);
  end;
  if not Assigned(AObject) then
    FDeleteFromDBCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteFromDBCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteFromDBCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteFromDBCommand.Execute(ARequestFilter);
  Result := FDeleteFromDBCommand.Parameters[1].Value.GetBoolean;
end;

function TCrudPOClient.OpenQuery(S: string; const ARequestFilter: string): TDataSet;
begin
  if FOpenQueryCommand = nil then
  begin
    FOpenQueryCommand := FConnection.CreateCommand;
    FOpenQueryCommand.RequestType := 'GET';
    FOpenQueryCommand.Text := 'TCrudPO.OpenQuery';
    FOpenQueryCommand.Prepare(TCrudPO_OpenQuery);
  end;
  FOpenQueryCommand.Parameters[0].Value.SetWideString(S);
  FOpenQueryCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FOpenQueryCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FOpenQueryCommand.FreeOnExecute(Result);
end;

function TCrudPOClient.OpenQuery_Cache(S: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FOpenQueryCommand_Cache = nil then
  begin
    FOpenQueryCommand_Cache := FConnection.CreateCommand;
    FOpenQueryCommand_Cache.RequestType := 'GET';
    FOpenQueryCommand_Cache.Text := 'TCrudPO.OpenQuery';
    FOpenQueryCommand_Cache.Prepare(TCrudPO_OpenQuery_Cache);
  end;
  FOpenQueryCommand_Cache.Parameters[0].Value.SetWideString(S);
  FOpenQueryCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FOpenQueryCommand_Cache.Parameters[1].Value.GetString);
end;

function TCrudPOClient.Retrieve(ModClassName: string; AID: string; const ARequestFilter: string): TModApp;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TCrudPO.Retrieve';
    FRetrieveCommand.Prepare(TCrudPO_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveCommand.Parameters[1].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModApp(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudPOClient.Retrieve_Cache(ModClassName: string; AID: string; const ARequestFilter: string): IDSRestCachedTModApp;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TCrudPO.Retrieve';
    FRetrieveCommand_Cache.Prepare(TCrudPO_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveCommand_Cache.Parameters[1].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModApp.Create(FRetrieveCommand_Cache.Parameters[2].Value.GetString);
end;

function TCrudPOClient.GenerateCustomNo(aTableName: string; aFieldName: string; aCountDigit: Integer; const ARequestFilter: string): string;
begin
  if FGenerateCustomNoCommand = nil then
  begin
    FGenerateCustomNoCommand := FConnection.CreateCommand;
    FGenerateCustomNoCommand.RequestType := 'GET';
    FGenerateCustomNoCommand.Text := 'TCrudPO.GenerateCustomNo';
    FGenerateCustomNoCommand.Prepare(TCrudPO_GenerateCustomNo);
  end;
  FGenerateCustomNoCommand.Parameters[0].Value.SetWideString(aTableName);
  FGenerateCustomNoCommand.Parameters[1].Value.SetWideString(aFieldName);
  FGenerateCustomNoCommand.Parameters[2].Value.SetInt32(aCountDigit);
  FGenerateCustomNoCommand.Execute(ARequestFilter);
  Result := FGenerateCustomNoCommand.Parameters[3].Value.GetWideString;
end;

function TCrudPOClient.GenerateNo(aClassName: string; const ARequestFilter: string): string;
begin
  if FGenerateNoCommand = nil then
  begin
    FGenerateNoCommand := FConnection.CreateCommand;
    FGenerateNoCommand.RequestType := 'GET';
    FGenerateNoCommand.Text := 'TCrudPO.GenerateNo';
    FGenerateNoCommand.Prepare(TCrudPO_GenerateNo);
  end;
  FGenerateNoCommand.Parameters[0].Value.SetWideString(aClassName);
  FGenerateNoCommand.Execute(ARequestFilter);
  Result := FGenerateNoCommand.Parameters[1].Value.GetWideString;
end;

function TCrudPOClient.RetrieveSingle(ModClassName: string; AID: string; const ARequestFilter: string): TModApp;
begin
  if FRetrieveSingleCommand = nil then
  begin
    FRetrieveSingleCommand := FConnection.CreateCommand;
    FRetrieveSingleCommand.RequestType := 'GET';
    FRetrieveSingleCommand.Text := 'TCrudPO.RetrieveSingle';
    FRetrieveSingleCommand.Prepare(TCrudPO_RetrieveSingle);
  end;
  FRetrieveSingleCommand.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveSingleCommand.Parameters[1].Value.SetWideString(AID);
  FRetrieveSingleCommand.Execute(ARequestFilter);
  if not FRetrieveSingleCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveSingleCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModApp(FUnMarshal.UnMarshal(FRetrieveSingleCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveSingleCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudPOClient.RetrieveSingle_Cache(ModClassName: string; AID: string; const ARequestFilter: string): IDSRestCachedTModApp;
begin
  if FRetrieveSingleCommand_Cache = nil then
  begin
    FRetrieveSingleCommand_Cache := FConnection.CreateCommand;
    FRetrieveSingleCommand_Cache.RequestType := 'GET';
    FRetrieveSingleCommand_Cache.Text := 'TCrudPO.RetrieveSingle';
    FRetrieveSingleCommand_Cache.Prepare(TCrudPO_RetrieveSingle_Cache);
  end;
  FRetrieveSingleCommand_Cache.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveSingleCommand_Cache.Parameters[1].Value.SetWideString(AID);
  FRetrieveSingleCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModApp.Create(FRetrieveSingleCommand_Cache.Parameters[2].Value.GetString);
end;

function TCrudPOClient.RetrieveByCode(ModClassName: string; aCode: string; const ARequestFilter: string): TModApp;
begin
  if FRetrieveByCodeCommand = nil then
  begin
    FRetrieveByCodeCommand := FConnection.CreateCommand;
    FRetrieveByCodeCommand.RequestType := 'GET';
    FRetrieveByCodeCommand.Text := 'TCrudPO.RetrieveByCode';
    FRetrieveByCodeCommand.Prepare(TCrudPO_RetrieveByCode);
  end;
  FRetrieveByCodeCommand.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveByCodeCommand.Parameters[1].Value.SetWideString(aCode);
  FRetrieveByCodeCommand.Execute(ARequestFilter);
  if not FRetrieveByCodeCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveByCodeCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModApp(FUnMarshal.UnMarshal(FRetrieveByCodeCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveByCodeCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudPOClient.RetrieveByCode_Cache(ModClassName: string; aCode: string; const ARequestFilter: string): IDSRestCachedTModApp;
begin
  if FRetrieveByCodeCommand_Cache = nil then
  begin
    FRetrieveByCodeCommand_Cache := FConnection.CreateCommand;
    FRetrieveByCodeCommand_Cache.RequestType := 'GET';
    FRetrieveByCodeCommand_Cache.Text := 'TCrudPO.RetrieveByCode';
    FRetrieveByCodeCommand_Cache.Prepare(TCrudPO_RetrieveByCode_Cache);
  end;
  FRetrieveByCodeCommand_Cache.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveByCodeCommand_Cache.Parameters[1].Value.SetWideString(aCode);
  FRetrieveByCodeCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModApp.Create(FRetrieveByCodeCommand_Cache.Parameters[2].Value.GetString);
end;

function TCrudPOClient.SaveToDBLog(AObject: TModApp; const ARequestFilter: string): Boolean;
begin
  if FSaveToDBLogCommand = nil then
  begin
    FSaveToDBLogCommand := FConnection.CreateCommand;
    FSaveToDBLogCommand.RequestType := 'POST';
    FSaveToDBLogCommand.Text := 'TCrudPO."SaveToDBLog"';
    FSaveToDBLogCommand.Prepare(TCrudPO_SaveToDBLog);
  end;
  if not Assigned(AObject) then
    FSaveToDBLogCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveToDBLogCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveToDBLogCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveToDBLogCommand.Execute(ARequestFilter);
  Result := FSaveToDBLogCommand.Parameters[1].Value.GetBoolean;
end;

function TCrudPOClient.SaveToDBID(AObject: TModApp; const ARequestFilter: string): string;
begin
  if FSaveToDBIDCommand = nil then
  begin
    FSaveToDBIDCommand := FConnection.CreateCommand;
    FSaveToDBIDCommand.RequestType := 'POST';
    FSaveToDBIDCommand.Text := 'TCrudPO."SaveToDBID"';
    FSaveToDBIDCommand.Prepare(TCrudPO_SaveToDBID);
  end;
  if not Assigned(AObject) then
    FSaveToDBIDCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveToDBIDCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveToDBIDCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveToDBIDCommand.Execute(ARequestFilter);
  Result := FSaveToDBIDCommand.Parameters[1].Value.GetWideString;
end;

function TCrudPOClient.TestGenerateSQL(AObject: TModApp; const ARequestFilter: string): TStrings;
begin
  if FTestGenerateSQLCommand = nil then
  begin
    FTestGenerateSQLCommand := FConnection.CreateCommand;
    FTestGenerateSQLCommand.RequestType := 'POST';
    FTestGenerateSQLCommand.Text := 'TCrudPO."TestGenerateSQL"';
    FTestGenerateSQLCommand.Prepare(TCrudPO_TestGenerateSQL);
  end;
  if not Assigned(AObject) then
    FTestGenerateSQLCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FTestGenerateSQLCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FTestGenerateSQLCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FTestGenerateSQLCommand.Execute(ARequestFilter);
  if not FTestGenerateSQLCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FTestGenerateSQLCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TStrings(FUnMarshal.UnMarshal(FTestGenerateSQLCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FTestGenerateSQLCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudPOClient.TestGenerateSQL_Cache(AObject: TModApp; const ARequestFilter: string): IDSRestCachedTStrings;
begin
  if FTestGenerateSQLCommand_Cache = nil then
  begin
    FTestGenerateSQLCommand_Cache := FConnection.CreateCommand;
    FTestGenerateSQLCommand_Cache.RequestType := 'POST';
    FTestGenerateSQLCommand_Cache.Text := 'TCrudPO."TestGenerateSQL"';
    FTestGenerateSQLCommand_Cache.Prepare(TCrudPO_TestGenerateSQL_Cache);
  end;
  if not Assigned(AObject) then
    FTestGenerateSQLCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FTestGenerateSQLCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FTestGenerateSQLCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FTestGenerateSQLCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTStrings.Create(FTestGenerateSQLCommand_Cache.Parameters[1].Value.GetString);
end;

procedure TCrudPOClient.AfterExecuteMethod;
begin
  if FAfterExecuteMethodCommand = nil then
  begin
    FAfterExecuteMethodCommand := FConnection.CreateCommand;
    FAfterExecuteMethodCommand.RequestType := 'GET';
    FAfterExecuteMethodCommand.Text := 'TCrudPO.AfterExecuteMethod';
  end;
  FAfterExecuteMethodCommand.Execute;
end;

constructor TCrudPOClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TCrudPOClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TCrudPOClient.Destroy;
begin
  FGeneratePOCommand.DisposeOf;
  FSaveToDBCommand.DisposeOf;
  FDeleteFromDBCommand.DisposeOf;
  FOpenQueryCommand.DisposeOf;
  FOpenQueryCommand_Cache.DisposeOf;
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FGenerateCustomNoCommand.DisposeOf;
  FGenerateNoCommand.DisposeOf;
  FRetrieveSingleCommand.DisposeOf;
  FRetrieveSingleCommand_Cache.DisposeOf;
  FRetrieveByCodeCommand.DisposeOf;
  FRetrieveByCodeCommand_Cache.DisposeOf;
  FSaveToDBLogCommand.DisposeOf;
  FSaveToDBIDCommand.DisposeOf;
  FTestGenerateSQLCommand.DisposeOf;
  FTestGenerateSQLCommand_Cache.DisposeOf;
  FAfterExecuteMethodCommand.DisposeOf;
  inherited;
end;

function TCrudDOClient.RetrieveByPO(APONO: string; const ARequestFilter: string): TModDO;
begin
  if FRetrieveByPOCommand = nil then
  begin
    FRetrieveByPOCommand := FConnection.CreateCommand;
    FRetrieveByPOCommand.RequestType := 'GET';
    FRetrieveByPOCommand.Text := 'TCrudDO.RetrieveByPO';
    FRetrieveByPOCommand.Prepare(TCrudDO_RetrieveByPO);
  end;
  FRetrieveByPOCommand.Parameters[0].Value.SetWideString(APONO);
  FRetrieveByPOCommand.Execute(ARequestFilter);
  if not FRetrieveByPOCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveByPOCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModDO(FUnMarshal.UnMarshal(FRetrieveByPOCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveByPOCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudDOClient.RetrieveByPO_Cache(APONO: string; const ARequestFilter: string): IDSRestCachedTModDO;
begin
  if FRetrieveByPOCommand_Cache = nil then
  begin
    FRetrieveByPOCommand_Cache := FConnection.CreateCommand;
    FRetrieveByPOCommand_Cache.RequestType := 'GET';
    FRetrieveByPOCommand_Cache.Text := 'TCrudDO.RetrieveByPO';
    FRetrieveByPOCommand_Cache.Prepare(TCrudDO_RetrieveByPO_Cache);
  end;
  FRetrieveByPOCommand_Cache.Parameters[0].Value.SetWideString(APONO);
  FRetrieveByPOCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModDO.Create(FRetrieveByPOCommand_Cache.Parameters[1].Value.GetString);
end;

function TCrudDOClient.SaveToDB(AObject: TModApp; const ARequestFilter: string): Boolean;
begin
  if FSaveToDBCommand = nil then
  begin
    FSaveToDBCommand := FConnection.CreateCommand;
    FSaveToDBCommand.RequestType := 'POST';
    FSaveToDBCommand.Text := 'TCrudDO."SaveToDB"';
    FSaveToDBCommand.Prepare(TCrudDO_SaveToDB);
  end;
  if not Assigned(AObject) then
    FSaveToDBCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveToDBCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveToDBCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveToDBCommand.Execute(ARequestFilter);
  Result := FSaveToDBCommand.Parameters[1].Value.GetBoolean;
end;

function TCrudDOClient.DeleteFromDB(AObject: TModApp; const ARequestFilter: string): Boolean;
begin
  if FDeleteFromDBCommand = nil then
  begin
    FDeleteFromDBCommand := FConnection.CreateCommand;
    FDeleteFromDBCommand.RequestType := 'POST';
    FDeleteFromDBCommand.Text := 'TCrudDO."DeleteFromDB"';
    FDeleteFromDBCommand.Prepare(TCrudDO_DeleteFromDB);
  end;
  if not Assigned(AObject) then
    FDeleteFromDBCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteFromDBCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteFromDBCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteFromDBCommand.Execute(ARequestFilter);
  Result := FDeleteFromDBCommand.Parameters[1].Value.GetBoolean;
end;

function TCrudDOClient.OpenQuery(S: string; const ARequestFilter: string): TDataSet;
begin
  if FOpenQueryCommand = nil then
  begin
    FOpenQueryCommand := FConnection.CreateCommand;
    FOpenQueryCommand.RequestType := 'GET';
    FOpenQueryCommand.Text := 'TCrudDO.OpenQuery';
    FOpenQueryCommand.Prepare(TCrudDO_OpenQuery);
  end;
  FOpenQueryCommand.Parameters[0].Value.SetWideString(S);
  FOpenQueryCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FOpenQueryCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FOpenQueryCommand.FreeOnExecute(Result);
end;

function TCrudDOClient.OpenQuery_Cache(S: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FOpenQueryCommand_Cache = nil then
  begin
    FOpenQueryCommand_Cache := FConnection.CreateCommand;
    FOpenQueryCommand_Cache.RequestType := 'GET';
    FOpenQueryCommand_Cache.Text := 'TCrudDO.OpenQuery';
    FOpenQueryCommand_Cache.Prepare(TCrudDO_OpenQuery_Cache);
  end;
  FOpenQueryCommand_Cache.Parameters[0].Value.SetWideString(S);
  FOpenQueryCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FOpenQueryCommand_Cache.Parameters[1].Value.GetString);
end;

function TCrudDOClient.Retrieve(ModClassName: string; AID: string; const ARequestFilter: string): TModApp;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TCrudDO.Retrieve';
    FRetrieveCommand.Prepare(TCrudDO_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveCommand.Parameters[1].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModApp(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudDOClient.Retrieve_Cache(ModClassName: string; AID: string; const ARequestFilter: string): IDSRestCachedTModApp;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TCrudDO.Retrieve';
    FRetrieveCommand_Cache.Prepare(TCrudDO_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveCommand_Cache.Parameters[1].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModApp.Create(FRetrieveCommand_Cache.Parameters[2].Value.GetString);
end;

function TCrudDOClient.GenerateCustomNo(aTableName: string; aFieldName: string; aCountDigit: Integer; const ARequestFilter: string): string;
begin
  if FGenerateCustomNoCommand = nil then
  begin
    FGenerateCustomNoCommand := FConnection.CreateCommand;
    FGenerateCustomNoCommand.RequestType := 'GET';
    FGenerateCustomNoCommand.Text := 'TCrudDO.GenerateCustomNo';
    FGenerateCustomNoCommand.Prepare(TCrudDO_GenerateCustomNo);
  end;
  FGenerateCustomNoCommand.Parameters[0].Value.SetWideString(aTableName);
  FGenerateCustomNoCommand.Parameters[1].Value.SetWideString(aFieldName);
  FGenerateCustomNoCommand.Parameters[2].Value.SetInt32(aCountDigit);
  FGenerateCustomNoCommand.Execute(ARequestFilter);
  Result := FGenerateCustomNoCommand.Parameters[3].Value.GetWideString;
end;

function TCrudDOClient.GenerateNo(aClassName: string; const ARequestFilter: string): string;
begin
  if FGenerateNoCommand = nil then
  begin
    FGenerateNoCommand := FConnection.CreateCommand;
    FGenerateNoCommand.RequestType := 'GET';
    FGenerateNoCommand.Text := 'TCrudDO.GenerateNo';
    FGenerateNoCommand.Prepare(TCrudDO_GenerateNo);
  end;
  FGenerateNoCommand.Parameters[0].Value.SetWideString(aClassName);
  FGenerateNoCommand.Execute(ARequestFilter);
  Result := FGenerateNoCommand.Parameters[1].Value.GetWideString;
end;

function TCrudDOClient.RetrieveSingle(ModClassName: string; AID: string; const ARequestFilter: string): TModApp;
begin
  if FRetrieveSingleCommand = nil then
  begin
    FRetrieveSingleCommand := FConnection.CreateCommand;
    FRetrieveSingleCommand.RequestType := 'GET';
    FRetrieveSingleCommand.Text := 'TCrudDO.RetrieveSingle';
    FRetrieveSingleCommand.Prepare(TCrudDO_RetrieveSingle);
  end;
  FRetrieveSingleCommand.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveSingleCommand.Parameters[1].Value.SetWideString(AID);
  FRetrieveSingleCommand.Execute(ARequestFilter);
  if not FRetrieveSingleCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveSingleCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModApp(FUnMarshal.UnMarshal(FRetrieveSingleCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveSingleCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudDOClient.RetrieveSingle_Cache(ModClassName: string; AID: string; const ARequestFilter: string): IDSRestCachedTModApp;
begin
  if FRetrieveSingleCommand_Cache = nil then
  begin
    FRetrieveSingleCommand_Cache := FConnection.CreateCommand;
    FRetrieveSingleCommand_Cache.RequestType := 'GET';
    FRetrieveSingleCommand_Cache.Text := 'TCrudDO.RetrieveSingle';
    FRetrieveSingleCommand_Cache.Prepare(TCrudDO_RetrieveSingle_Cache);
  end;
  FRetrieveSingleCommand_Cache.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveSingleCommand_Cache.Parameters[1].Value.SetWideString(AID);
  FRetrieveSingleCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModApp.Create(FRetrieveSingleCommand_Cache.Parameters[2].Value.GetString);
end;

function TCrudDOClient.RetrieveByCode(ModClassName: string; aCode: string; const ARequestFilter: string): TModApp;
begin
  if FRetrieveByCodeCommand = nil then
  begin
    FRetrieveByCodeCommand := FConnection.CreateCommand;
    FRetrieveByCodeCommand.RequestType := 'GET';
    FRetrieveByCodeCommand.Text := 'TCrudDO.RetrieveByCode';
    FRetrieveByCodeCommand.Prepare(TCrudDO_RetrieveByCode);
  end;
  FRetrieveByCodeCommand.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveByCodeCommand.Parameters[1].Value.SetWideString(aCode);
  FRetrieveByCodeCommand.Execute(ARequestFilter);
  if not FRetrieveByCodeCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveByCodeCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModApp(FUnMarshal.UnMarshal(FRetrieveByCodeCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveByCodeCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudDOClient.RetrieveByCode_Cache(ModClassName: string; aCode: string; const ARequestFilter: string): IDSRestCachedTModApp;
begin
  if FRetrieveByCodeCommand_Cache = nil then
  begin
    FRetrieveByCodeCommand_Cache := FConnection.CreateCommand;
    FRetrieveByCodeCommand_Cache.RequestType := 'GET';
    FRetrieveByCodeCommand_Cache.Text := 'TCrudDO.RetrieveByCode';
    FRetrieveByCodeCommand_Cache.Prepare(TCrudDO_RetrieveByCode_Cache);
  end;
  FRetrieveByCodeCommand_Cache.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveByCodeCommand_Cache.Parameters[1].Value.SetWideString(aCode);
  FRetrieveByCodeCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModApp.Create(FRetrieveByCodeCommand_Cache.Parameters[2].Value.GetString);
end;

function TCrudDOClient.SaveToDBLog(AObject: TModApp; const ARequestFilter: string): Boolean;
begin
  if FSaveToDBLogCommand = nil then
  begin
    FSaveToDBLogCommand := FConnection.CreateCommand;
    FSaveToDBLogCommand.RequestType := 'POST';
    FSaveToDBLogCommand.Text := 'TCrudDO."SaveToDBLog"';
    FSaveToDBLogCommand.Prepare(TCrudDO_SaveToDBLog);
  end;
  if not Assigned(AObject) then
    FSaveToDBLogCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveToDBLogCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveToDBLogCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveToDBLogCommand.Execute(ARequestFilter);
  Result := FSaveToDBLogCommand.Parameters[1].Value.GetBoolean;
end;

function TCrudDOClient.SaveToDBID(AObject: TModApp; const ARequestFilter: string): string;
begin
  if FSaveToDBIDCommand = nil then
  begin
    FSaveToDBIDCommand := FConnection.CreateCommand;
    FSaveToDBIDCommand.RequestType := 'POST';
    FSaveToDBIDCommand.Text := 'TCrudDO."SaveToDBID"';
    FSaveToDBIDCommand.Prepare(TCrudDO_SaveToDBID);
  end;
  if not Assigned(AObject) then
    FSaveToDBIDCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveToDBIDCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveToDBIDCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveToDBIDCommand.Execute(ARequestFilter);
  Result := FSaveToDBIDCommand.Parameters[1].Value.GetWideString;
end;

function TCrudDOClient.TestGenerateSQL(AObject: TModApp; const ARequestFilter: string): TStrings;
begin
  if FTestGenerateSQLCommand = nil then
  begin
    FTestGenerateSQLCommand := FConnection.CreateCommand;
    FTestGenerateSQLCommand.RequestType := 'POST';
    FTestGenerateSQLCommand.Text := 'TCrudDO."TestGenerateSQL"';
    FTestGenerateSQLCommand.Prepare(TCrudDO_TestGenerateSQL);
  end;
  if not Assigned(AObject) then
    FTestGenerateSQLCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FTestGenerateSQLCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FTestGenerateSQLCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FTestGenerateSQLCommand.Execute(ARequestFilter);
  if not FTestGenerateSQLCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FTestGenerateSQLCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TStrings(FUnMarshal.UnMarshal(FTestGenerateSQLCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FTestGenerateSQLCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudDOClient.TestGenerateSQL_Cache(AObject: TModApp; const ARequestFilter: string): IDSRestCachedTStrings;
begin
  if FTestGenerateSQLCommand_Cache = nil then
  begin
    FTestGenerateSQLCommand_Cache := FConnection.CreateCommand;
    FTestGenerateSQLCommand_Cache.RequestType := 'POST';
    FTestGenerateSQLCommand_Cache.Text := 'TCrudDO."TestGenerateSQL"';
    FTestGenerateSQLCommand_Cache.Prepare(TCrudDO_TestGenerateSQL_Cache);
  end;
  if not Assigned(AObject) then
    FTestGenerateSQLCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FTestGenerateSQLCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FTestGenerateSQLCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FTestGenerateSQLCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTStrings.Create(FTestGenerateSQLCommand_Cache.Parameters[1].Value.GetString);
end;

procedure TCrudDOClient.AfterExecuteMethod;
begin
  if FAfterExecuteMethodCommand = nil then
  begin
    FAfterExecuteMethodCommand := FConnection.CreateCommand;
    FAfterExecuteMethodCommand.RequestType := 'GET';
    FAfterExecuteMethodCommand.Text := 'TCrudDO.AfterExecuteMethod';
  end;
  FAfterExecuteMethodCommand.Execute;
end;

constructor TCrudDOClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TCrudDOClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TCrudDOClient.Destroy;
begin
  FRetrieveByPOCommand.DisposeOf;
  FRetrieveByPOCommand_Cache.DisposeOf;
  FSaveToDBCommand.DisposeOf;
  FDeleteFromDBCommand.DisposeOf;
  FOpenQueryCommand.DisposeOf;
  FOpenQueryCommand_Cache.DisposeOf;
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FGenerateCustomNoCommand.DisposeOf;
  FGenerateNoCommand.DisposeOf;
  FRetrieveSingleCommand.DisposeOf;
  FRetrieveSingleCommand_Cache.DisposeOf;
  FRetrieveByCodeCommand.DisposeOf;
  FRetrieveByCodeCommand_Cache.DisposeOf;
  FSaveToDBLogCommand.DisposeOf;
  FSaveToDBIDCommand.DisposeOf;
  FTestGenerateSQLCommand.DisposeOf;
  FTestGenerateSQLCommand_Cache.DisposeOf;
  FAfterExecuteMethodCommand.DisposeOf;
  inherited;
end;

function TCrudCNRecvClient.SaveToDB(AObject: TModApp; const ARequestFilter: string): Boolean;
begin
  if FSaveToDBCommand = nil then
  begin
    FSaveToDBCommand := FConnection.CreateCommand;
    FSaveToDBCommand.RequestType := 'POST';
    FSaveToDBCommand.Text := 'TCrudCNRecv."SaveToDB"';
    FSaveToDBCommand.Prepare(TCrudCNRecv_SaveToDB);
  end;
  if not Assigned(AObject) then
    FSaveToDBCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveToDBCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveToDBCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveToDBCommand.Execute(ARequestFilter);
  Result := FSaveToDBCommand.Parameters[1].Value.GetBoolean;
end;

function TCrudCNRecvClient.DeleteFromDB(AObject: TModApp; const ARequestFilter: string): Boolean;
begin
  if FDeleteFromDBCommand = nil then
  begin
    FDeleteFromDBCommand := FConnection.CreateCommand;
    FDeleteFromDBCommand.RequestType := 'POST';
    FDeleteFromDBCommand.Text := 'TCrudCNRecv."DeleteFromDB"';
    FDeleteFromDBCommand.Prepare(TCrudCNRecv_DeleteFromDB);
  end;
  if not Assigned(AObject) then
    FDeleteFromDBCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteFromDBCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteFromDBCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteFromDBCommand.Execute(ARequestFilter);
  Result := FDeleteFromDBCommand.Parameters[1].Value.GetBoolean;
end;

function TCrudCNRecvClient.OpenQuery(S: string; const ARequestFilter: string): TDataSet;
begin
  if FOpenQueryCommand = nil then
  begin
    FOpenQueryCommand := FConnection.CreateCommand;
    FOpenQueryCommand.RequestType := 'GET';
    FOpenQueryCommand.Text := 'TCrudCNRecv.OpenQuery';
    FOpenQueryCommand.Prepare(TCrudCNRecv_OpenQuery);
  end;
  FOpenQueryCommand.Parameters[0].Value.SetWideString(S);
  FOpenQueryCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FOpenQueryCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FOpenQueryCommand.FreeOnExecute(Result);
end;

function TCrudCNRecvClient.OpenQuery_Cache(S: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FOpenQueryCommand_Cache = nil then
  begin
    FOpenQueryCommand_Cache := FConnection.CreateCommand;
    FOpenQueryCommand_Cache.RequestType := 'GET';
    FOpenQueryCommand_Cache.Text := 'TCrudCNRecv.OpenQuery';
    FOpenQueryCommand_Cache.Prepare(TCrudCNRecv_OpenQuery_Cache);
  end;
  FOpenQueryCommand_Cache.Parameters[0].Value.SetWideString(S);
  FOpenQueryCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FOpenQueryCommand_Cache.Parameters[1].Value.GetString);
end;

function TCrudCNRecvClient.Retrieve(ModClassName: string; AID: string; const ARequestFilter: string): TModApp;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TCrudCNRecv.Retrieve';
    FRetrieveCommand.Prepare(TCrudCNRecv_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveCommand.Parameters[1].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModApp(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudCNRecvClient.Retrieve_Cache(ModClassName: string; AID: string; const ARequestFilter: string): IDSRestCachedTModApp;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TCrudCNRecv.Retrieve';
    FRetrieveCommand_Cache.Prepare(TCrudCNRecv_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveCommand_Cache.Parameters[1].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModApp.Create(FRetrieveCommand_Cache.Parameters[2].Value.GetString);
end;

function TCrudCNRecvClient.GenerateCustomNo(aTableName: string; aFieldName: string; aCountDigit: Integer; const ARequestFilter: string): string;
begin
  if FGenerateCustomNoCommand = nil then
  begin
    FGenerateCustomNoCommand := FConnection.CreateCommand;
    FGenerateCustomNoCommand.RequestType := 'GET';
    FGenerateCustomNoCommand.Text := 'TCrudCNRecv.GenerateCustomNo';
    FGenerateCustomNoCommand.Prepare(TCrudCNRecv_GenerateCustomNo);
  end;
  FGenerateCustomNoCommand.Parameters[0].Value.SetWideString(aTableName);
  FGenerateCustomNoCommand.Parameters[1].Value.SetWideString(aFieldName);
  FGenerateCustomNoCommand.Parameters[2].Value.SetInt32(aCountDigit);
  FGenerateCustomNoCommand.Execute(ARequestFilter);
  Result := FGenerateCustomNoCommand.Parameters[3].Value.GetWideString;
end;

function TCrudCNRecvClient.GenerateNo(aClassName: string; const ARequestFilter: string): string;
begin
  if FGenerateNoCommand = nil then
  begin
    FGenerateNoCommand := FConnection.CreateCommand;
    FGenerateNoCommand.RequestType := 'GET';
    FGenerateNoCommand.Text := 'TCrudCNRecv.GenerateNo';
    FGenerateNoCommand.Prepare(TCrudCNRecv_GenerateNo);
  end;
  FGenerateNoCommand.Parameters[0].Value.SetWideString(aClassName);
  FGenerateNoCommand.Execute(ARequestFilter);
  Result := FGenerateNoCommand.Parameters[1].Value.GetWideString;
end;

function TCrudCNRecvClient.RetrieveSingle(ModClassName: string; AID: string; const ARequestFilter: string): TModApp;
begin
  if FRetrieveSingleCommand = nil then
  begin
    FRetrieveSingleCommand := FConnection.CreateCommand;
    FRetrieveSingleCommand.RequestType := 'GET';
    FRetrieveSingleCommand.Text := 'TCrudCNRecv.RetrieveSingle';
    FRetrieveSingleCommand.Prepare(TCrudCNRecv_RetrieveSingle);
  end;
  FRetrieveSingleCommand.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveSingleCommand.Parameters[1].Value.SetWideString(AID);
  FRetrieveSingleCommand.Execute(ARequestFilter);
  if not FRetrieveSingleCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveSingleCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModApp(FUnMarshal.UnMarshal(FRetrieveSingleCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveSingleCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudCNRecvClient.RetrieveSingle_Cache(ModClassName: string; AID: string; const ARequestFilter: string): IDSRestCachedTModApp;
begin
  if FRetrieveSingleCommand_Cache = nil then
  begin
    FRetrieveSingleCommand_Cache := FConnection.CreateCommand;
    FRetrieveSingleCommand_Cache.RequestType := 'GET';
    FRetrieveSingleCommand_Cache.Text := 'TCrudCNRecv.RetrieveSingle';
    FRetrieveSingleCommand_Cache.Prepare(TCrudCNRecv_RetrieveSingle_Cache);
  end;
  FRetrieveSingleCommand_Cache.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveSingleCommand_Cache.Parameters[1].Value.SetWideString(AID);
  FRetrieveSingleCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModApp.Create(FRetrieveSingleCommand_Cache.Parameters[2].Value.GetString);
end;

function TCrudCNRecvClient.RetrieveByCode(ModClassName: string; aCode: string; const ARequestFilter: string): TModApp;
begin
  if FRetrieveByCodeCommand = nil then
  begin
    FRetrieveByCodeCommand := FConnection.CreateCommand;
    FRetrieveByCodeCommand.RequestType := 'GET';
    FRetrieveByCodeCommand.Text := 'TCrudCNRecv.RetrieveByCode';
    FRetrieveByCodeCommand.Prepare(TCrudCNRecv_RetrieveByCode);
  end;
  FRetrieveByCodeCommand.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveByCodeCommand.Parameters[1].Value.SetWideString(aCode);
  FRetrieveByCodeCommand.Execute(ARequestFilter);
  if not FRetrieveByCodeCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveByCodeCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModApp(FUnMarshal.UnMarshal(FRetrieveByCodeCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveByCodeCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudCNRecvClient.RetrieveByCode_Cache(ModClassName: string; aCode: string; const ARequestFilter: string): IDSRestCachedTModApp;
begin
  if FRetrieveByCodeCommand_Cache = nil then
  begin
    FRetrieveByCodeCommand_Cache := FConnection.CreateCommand;
    FRetrieveByCodeCommand_Cache.RequestType := 'GET';
    FRetrieveByCodeCommand_Cache.Text := 'TCrudCNRecv.RetrieveByCode';
    FRetrieveByCodeCommand_Cache.Prepare(TCrudCNRecv_RetrieveByCode_Cache);
  end;
  FRetrieveByCodeCommand_Cache.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveByCodeCommand_Cache.Parameters[1].Value.SetWideString(aCode);
  FRetrieveByCodeCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModApp.Create(FRetrieveByCodeCommand_Cache.Parameters[2].Value.GetString);
end;

function TCrudCNRecvClient.SaveToDBLog(AObject: TModApp; const ARequestFilter: string): Boolean;
begin
  if FSaveToDBLogCommand = nil then
  begin
    FSaveToDBLogCommand := FConnection.CreateCommand;
    FSaveToDBLogCommand.RequestType := 'POST';
    FSaveToDBLogCommand.Text := 'TCrudCNRecv."SaveToDBLog"';
    FSaveToDBLogCommand.Prepare(TCrudCNRecv_SaveToDBLog);
  end;
  if not Assigned(AObject) then
    FSaveToDBLogCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveToDBLogCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveToDBLogCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveToDBLogCommand.Execute(ARequestFilter);
  Result := FSaveToDBLogCommand.Parameters[1].Value.GetBoolean;
end;

function TCrudCNRecvClient.SaveToDBID(AObject: TModApp; const ARequestFilter: string): string;
begin
  if FSaveToDBIDCommand = nil then
  begin
    FSaveToDBIDCommand := FConnection.CreateCommand;
    FSaveToDBIDCommand.RequestType := 'POST';
    FSaveToDBIDCommand.Text := 'TCrudCNRecv."SaveToDBID"';
    FSaveToDBIDCommand.Prepare(TCrudCNRecv_SaveToDBID);
  end;
  if not Assigned(AObject) then
    FSaveToDBIDCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveToDBIDCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveToDBIDCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveToDBIDCommand.Execute(ARequestFilter);
  Result := FSaveToDBIDCommand.Parameters[1].Value.GetWideString;
end;

function TCrudCNRecvClient.TestGenerateSQL(AObject: TModApp; const ARequestFilter: string): TStrings;
begin
  if FTestGenerateSQLCommand = nil then
  begin
    FTestGenerateSQLCommand := FConnection.CreateCommand;
    FTestGenerateSQLCommand.RequestType := 'POST';
    FTestGenerateSQLCommand.Text := 'TCrudCNRecv."TestGenerateSQL"';
    FTestGenerateSQLCommand.Prepare(TCrudCNRecv_TestGenerateSQL);
  end;
  if not Assigned(AObject) then
    FTestGenerateSQLCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FTestGenerateSQLCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FTestGenerateSQLCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FTestGenerateSQLCommand.Execute(ARequestFilter);
  if not FTestGenerateSQLCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FTestGenerateSQLCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TStrings(FUnMarshal.UnMarshal(FTestGenerateSQLCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FTestGenerateSQLCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudCNRecvClient.TestGenerateSQL_Cache(AObject: TModApp; const ARequestFilter: string): IDSRestCachedTStrings;
begin
  if FTestGenerateSQLCommand_Cache = nil then
  begin
    FTestGenerateSQLCommand_Cache := FConnection.CreateCommand;
    FTestGenerateSQLCommand_Cache.RequestType := 'POST';
    FTestGenerateSQLCommand_Cache.Text := 'TCrudCNRecv."TestGenerateSQL"';
    FTestGenerateSQLCommand_Cache.Prepare(TCrudCNRecv_TestGenerateSQL_Cache);
  end;
  if not Assigned(AObject) then
    FTestGenerateSQLCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FTestGenerateSQLCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FTestGenerateSQLCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FTestGenerateSQLCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTStrings.Create(FTestGenerateSQLCommand_Cache.Parameters[1].Value.GetString);
end;

procedure TCrudCNRecvClient.AfterExecuteMethod;
begin
  if FAfterExecuteMethodCommand = nil then
  begin
    FAfterExecuteMethodCommand := FConnection.CreateCommand;
    FAfterExecuteMethodCommand.RequestType := 'GET';
    FAfterExecuteMethodCommand.Text := 'TCrudCNRecv.AfterExecuteMethod';
  end;
  FAfterExecuteMethodCommand.Execute;
end;

constructor TCrudCNRecvClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TCrudCNRecvClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TCrudCNRecvClient.Destroy;
begin
  FSaveToDBCommand.DisposeOf;
  FDeleteFromDBCommand.DisposeOf;
  FOpenQueryCommand.DisposeOf;
  FOpenQueryCommand_Cache.DisposeOf;
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FGenerateCustomNoCommand.DisposeOf;
  FGenerateNoCommand.DisposeOf;
  FRetrieveSingleCommand.DisposeOf;
  FRetrieveSingleCommand_Cache.DisposeOf;
  FRetrieveByCodeCommand.DisposeOf;
  FRetrieveByCodeCommand_Cache.DisposeOf;
  FSaveToDBLogCommand.DisposeOf;
  FSaveToDBIDCommand.DisposeOf;
  FTestGenerateSQLCommand.DisposeOf;
  FTestGenerateSQLCommand_Cache.DisposeOf;
  FAfterExecuteMethodCommand.DisposeOf;
  inherited;
end;

function TCrudDNRecvClient.SaveToDB(AObject: TModApp; const ARequestFilter: string): Boolean;
begin
  if FSaveToDBCommand = nil then
  begin
    FSaveToDBCommand := FConnection.CreateCommand;
    FSaveToDBCommand.RequestType := 'POST';
    FSaveToDBCommand.Text := 'TCrudDNRecv."SaveToDB"';
    FSaveToDBCommand.Prepare(TCrudDNRecv_SaveToDB);
  end;
  if not Assigned(AObject) then
    FSaveToDBCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveToDBCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveToDBCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveToDBCommand.Execute(ARequestFilter);
  Result := FSaveToDBCommand.Parameters[1].Value.GetBoolean;
end;

function TCrudDNRecvClient.DeleteFromDB(AObject: TModApp; const ARequestFilter: string): Boolean;
begin
  if FDeleteFromDBCommand = nil then
  begin
    FDeleteFromDBCommand := FConnection.CreateCommand;
    FDeleteFromDBCommand.RequestType := 'POST';
    FDeleteFromDBCommand.Text := 'TCrudDNRecv."DeleteFromDB"';
    FDeleteFromDBCommand.Prepare(TCrudDNRecv_DeleteFromDB);
  end;
  if not Assigned(AObject) then
    FDeleteFromDBCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteFromDBCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteFromDBCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteFromDBCommand.Execute(ARequestFilter);
  Result := FDeleteFromDBCommand.Parameters[1].Value.GetBoolean;
end;

function TCrudDNRecvClient.OpenQuery(S: string; const ARequestFilter: string): TDataSet;
begin
  if FOpenQueryCommand = nil then
  begin
    FOpenQueryCommand := FConnection.CreateCommand;
    FOpenQueryCommand.RequestType := 'GET';
    FOpenQueryCommand.Text := 'TCrudDNRecv.OpenQuery';
    FOpenQueryCommand.Prepare(TCrudDNRecv_OpenQuery);
  end;
  FOpenQueryCommand.Parameters[0].Value.SetWideString(S);
  FOpenQueryCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FOpenQueryCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FOpenQueryCommand.FreeOnExecute(Result);
end;

function TCrudDNRecvClient.OpenQuery_Cache(S: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FOpenQueryCommand_Cache = nil then
  begin
    FOpenQueryCommand_Cache := FConnection.CreateCommand;
    FOpenQueryCommand_Cache.RequestType := 'GET';
    FOpenQueryCommand_Cache.Text := 'TCrudDNRecv.OpenQuery';
    FOpenQueryCommand_Cache.Prepare(TCrudDNRecv_OpenQuery_Cache);
  end;
  FOpenQueryCommand_Cache.Parameters[0].Value.SetWideString(S);
  FOpenQueryCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FOpenQueryCommand_Cache.Parameters[1].Value.GetString);
end;

function TCrudDNRecvClient.Retrieve(ModClassName: string; AID: string; const ARequestFilter: string): TModApp;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TCrudDNRecv.Retrieve';
    FRetrieveCommand.Prepare(TCrudDNRecv_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveCommand.Parameters[1].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModApp(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudDNRecvClient.Retrieve_Cache(ModClassName: string; AID: string; const ARequestFilter: string): IDSRestCachedTModApp;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TCrudDNRecv.Retrieve';
    FRetrieveCommand_Cache.Prepare(TCrudDNRecv_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveCommand_Cache.Parameters[1].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModApp.Create(FRetrieveCommand_Cache.Parameters[2].Value.GetString);
end;

function TCrudDNRecvClient.GenerateCustomNo(aTableName: string; aFieldName: string; aCountDigit: Integer; const ARequestFilter: string): string;
begin
  if FGenerateCustomNoCommand = nil then
  begin
    FGenerateCustomNoCommand := FConnection.CreateCommand;
    FGenerateCustomNoCommand.RequestType := 'GET';
    FGenerateCustomNoCommand.Text := 'TCrudDNRecv.GenerateCustomNo';
    FGenerateCustomNoCommand.Prepare(TCrudDNRecv_GenerateCustomNo);
  end;
  FGenerateCustomNoCommand.Parameters[0].Value.SetWideString(aTableName);
  FGenerateCustomNoCommand.Parameters[1].Value.SetWideString(aFieldName);
  FGenerateCustomNoCommand.Parameters[2].Value.SetInt32(aCountDigit);
  FGenerateCustomNoCommand.Execute(ARequestFilter);
  Result := FGenerateCustomNoCommand.Parameters[3].Value.GetWideString;
end;

function TCrudDNRecvClient.GenerateNo(aClassName: string; const ARequestFilter: string): string;
begin
  if FGenerateNoCommand = nil then
  begin
    FGenerateNoCommand := FConnection.CreateCommand;
    FGenerateNoCommand.RequestType := 'GET';
    FGenerateNoCommand.Text := 'TCrudDNRecv.GenerateNo';
    FGenerateNoCommand.Prepare(TCrudDNRecv_GenerateNo);
  end;
  FGenerateNoCommand.Parameters[0].Value.SetWideString(aClassName);
  FGenerateNoCommand.Execute(ARequestFilter);
  Result := FGenerateNoCommand.Parameters[1].Value.GetWideString;
end;

function TCrudDNRecvClient.RetrieveSingle(ModClassName: string; AID: string; const ARequestFilter: string): TModApp;
begin
  if FRetrieveSingleCommand = nil then
  begin
    FRetrieveSingleCommand := FConnection.CreateCommand;
    FRetrieveSingleCommand.RequestType := 'GET';
    FRetrieveSingleCommand.Text := 'TCrudDNRecv.RetrieveSingle';
    FRetrieveSingleCommand.Prepare(TCrudDNRecv_RetrieveSingle);
  end;
  FRetrieveSingleCommand.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveSingleCommand.Parameters[1].Value.SetWideString(AID);
  FRetrieveSingleCommand.Execute(ARequestFilter);
  if not FRetrieveSingleCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveSingleCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModApp(FUnMarshal.UnMarshal(FRetrieveSingleCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveSingleCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudDNRecvClient.RetrieveSingle_Cache(ModClassName: string; AID: string; const ARequestFilter: string): IDSRestCachedTModApp;
begin
  if FRetrieveSingleCommand_Cache = nil then
  begin
    FRetrieveSingleCommand_Cache := FConnection.CreateCommand;
    FRetrieveSingleCommand_Cache.RequestType := 'GET';
    FRetrieveSingleCommand_Cache.Text := 'TCrudDNRecv.RetrieveSingle';
    FRetrieveSingleCommand_Cache.Prepare(TCrudDNRecv_RetrieveSingle_Cache);
  end;
  FRetrieveSingleCommand_Cache.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveSingleCommand_Cache.Parameters[1].Value.SetWideString(AID);
  FRetrieveSingleCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModApp.Create(FRetrieveSingleCommand_Cache.Parameters[2].Value.GetString);
end;

function TCrudDNRecvClient.RetrieveByCode(ModClassName: string; aCode: string; const ARequestFilter: string): TModApp;
begin
  if FRetrieveByCodeCommand = nil then
  begin
    FRetrieveByCodeCommand := FConnection.CreateCommand;
    FRetrieveByCodeCommand.RequestType := 'GET';
    FRetrieveByCodeCommand.Text := 'TCrudDNRecv.RetrieveByCode';
    FRetrieveByCodeCommand.Prepare(TCrudDNRecv_RetrieveByCode);
  end;
  FRetrieveByCodeCommand.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveByCodeCommand.Parameters[1].Value.SetWideString(aCode);
  FRetrieveByCodeCommand.Execute(ARequestFilter);
  if not FRetrieveByCodeCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveByCodeCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModApp(FUnMarshal.UnMarshal(FRetrieveByCodeCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveByCodeCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudDNRecvClient.RetrieveByCode_Cache(ModClassName: string; aCode: string; const ARequestFilter: string): IDSRestCachedTModApp;
begin
  if FRetrieveByCodeCommand_Cache = nil then
  begin
    FRetrieveByCodeCommand_Cache := FConnection.CreateCommand;
    FRetrieveByCodeCommand_Cache.RequestType := 'GET';
    FRetrieveByCodeCommand_Cache.Text := 'TCrudDNRecv.RetrieveByCode';
    FRetrieveByCodeCommand_Cache.Prepare(TCrudDNRecv_RetrieveByCode_Cache);
  end;
  FRetrieveByCodeCommand_Cache.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveByCodeCommand_Cache.Parameters[1].Value.SetWideString(aCode);
  FRetrieveByCodeCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModApp.Create(FRetrieveByCodeCommand_Cache.Parameters[2].Value.GetString);
end;

function TCrudDNRecvClient.SaveToDBLog(AObject: TModApp; const ARequestFilter: string): Boolean;
begin
  if FSaveToDBLogCommand = nil then
  begin
    FSaveToDBLogCommand := FConnection.CreateCommand;
    FSaveToDBLogCommand.RequestType := 'POST';
    FSaveToDBLogCommand.Text := 'TCrudDNRecv."SaveToDBLog"';
    FSaveToDBLogCommand.Prepare(TCrudDNRecv_SaveToDBLog);
  end;
  if not Assigned(AObject) then
    FSaveToDBLogCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveToDBLogCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveToDBLogCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveToDBLogCommand.Execute(ARequestFilter);
  Result := FSaveToDBLogCommand.Parameters[1].Value.GetBoolean;
end;

function TCrudDNRecvClient.SaveToDBID(AObject: TModApp; const ARequestFilter: string): string;
begin
  if FSaveToDBIDCommand = nil then
  begin
    FSaveToDBIDCommand := FConnection.CreateCommand;
    FSaveToDBIDCommand.RequestType := 'POST';
    FSaveToDBIDCommand.Text := 'TCrudDNRecv."SaveToDBID"';
    FSaveToDBIDCommand.Prepare(TCrudDNRecv_SaveToDBID);
  end;
  if not Assigned(AObject) then
    FSaveToDBIDCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveToDBIDCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveToDBIDCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveToDBIDCommand.Execute(ARequestFilter);
  Result := FSaveToDBIDCommand.Parameters[1].Value.GetWideString;
end;

function TCrudDNRecvClient.TestGenerateSQL(AObject: TModApp; const ARequestFilter: string): TStrings;
begin
  if FTestGenerateSQLCommand = nil then
  begin
    FTestGenerateSQLCommand := FConnection.CreateCommand;
    FTestGenerateSQLCommand.RequestType := 'POST';
    FTestGenerateSQLCommand.Text := 'TCrudDNRecv."TestGenerateSQL"';
    FTestGenerateSQLCommand.Prepare(TCrudDNRecv_TestGenerateSQL);
  end;
  if not Assigned(AObject) then
    FTestGenerateSQLCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FTestGenerateSQLCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FTestGenerateSQLCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FTestGenerateSQLCommand.Execute(ARequestFilter);
  if not FTestGenerateSQLCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FTestGenerateSQLCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TStrings(FUnMarshal.UnMarshal(FTestGenerateSQLCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FTestGenerateSQLCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudDNRecvClient.TestGenerateSQL_Cache(AObject: TModApp; const ARequestFilter: string): IDSRestCachedTStrings;
begin
  if FTestGenerateSQLCommand_Cache = nil then
  begin
    FTestGenerateSQLCommand_Cache := FConnection.CreateCommand;
    FTestGenerateSQLCommand_Cache.RequestType := 'POST';
    FTestGenerateSQLCommand_Cache.Text := 'TCrudDNRecv."TestGenerateSQL"';
    FTestGenerateSQLCommand_Cache.Prepare(TCrudDNRecv_TestGenerateSQL_Cache);
  end;
  if not Assigned(AObject) then
    FTestGenerateSQLCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FTestGenerateSQLCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FTestGenerateSQLCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FTestGenerateSQLCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTStrings.Create(FTestGenerateSQLCommand_Cache.Parameters[1].Value.GetString);
end;

procedure TCrudDNRecvClient.AfterExecuteMethod;
begin
  if FAfterExecuteMethodCommand = nil then
  begin
    FAfterExecuteMethodCommand := FConnection.CreateCommand;
    FAfterExecuteMethodCommand.RequestType := 'GET';
    FAfterExecuteMethodCommand.Text := 'TCrudDNRecv.AfterExecuteMethod';
  end;
  FAfterExecuteMethodCommand.Execute;
end;

constructor TCrudDNRecvClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TCrudDNRecvClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TCrudDNRecvClient.Destroy;
begin
  FSaveToDBCommand.DisposeOf;
  FDeleteFromDBCommand.DisposeOf;
  FOpenQueryCommand.DisposeOf;
  FOpenQueryCommand_Cache.DisposeOf;
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FGenerateCustomNoCommand.DisposeOf;
  FGenerateNoCommand.DisposeOf;
  FRetrieveSingleCommand.DisposeOf;
  FRetrieveSingleCommand_Cache.DisposeOf;
  FRetrieveByCodeCommand.DisposeOf;
  FRetrieveByCodeCommand_Cache.DisposeOf;
  FSaveToDBLogCommand.DisposeOf;
  FSaveToDBIDCommand.DisposeOf;
  FTestGenerateSQLCommand.DisposeOf;
  FTestGenerateSQLCommand_Cache.DisposeOf;
  FAfterExecuteMethodCommand.DisposeOf;
  inherited;
end;

function TCrudSettingAppClient.RetrieveByCabang(ACabang: TModUnit; const ARequestFilter: string): TModSettingApp;
begin
  if FRetrieveByCabangCommand = nil then
  begin
    FRetrieveByCabangCommand := FConnection.CreateCommand;
    FRetrieveByCabangCommand.RequestType := 'POST';
    FRetrieveByCabangCommand.Text := 'TCrudSettingApp."RetrieveByCabang"';
    FRetrieveByCabangCommand.Prepare(TCrudSettingApp_RetrieveByCabang);
  end;
  if not Assigned(ACabang) then
    FRetrieveByCabangCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveByCabangCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveByCabangCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveByCabangCommand.Execute(ARequestFilter);
  if not FRetrieveByCabangCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveByCabangCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModSettingApp(FUnMarshal.UnMarshal(FRetrieveByCabangCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveByCabangCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudSettingAppClient.RetrieveByCabang_Cache(ACabang: TModUnit; const ARequestFilter: string): IDSRestCachedTModSettingApp;
begin
  if FRetrieveByCabangCommand_Cache = nil then
  begin
    FRetrieveByCabangCommand_Cache := FConnection.CreateCommand;
    FRetrieveByCabangCommand_Cache.RequestType := 'POST';
    FRetrieveByCabangCommand_Cache.Text := 'TCrudSettingApp."RetrieveByCabang"';
    FRetrieveByCabangCommand_Cache.Prepare(TCrudSettingApp_RetrieveByCabang_Cache);
  end;
  if not Assigned(ACabang) then
    FRetrieveByCabangCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveByCabangCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveByCabangCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveByCabangCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModSettingApp.Create(FRetrieveByCabangCommand_Cache.Parameters[1].Value.GetString);
end;

function TCrudSettingAppClient.SaveToDB(AObject: TModApp; const ARequestFilter: string): Boolean;
begin
  if FSaveToDBCommand = nil then
  begin
    FSaveToDBCommand := FConnection.CreateCommand;
    FSaveToDBCommand.RequestType := 'POST';
    FSaveToDBCommand.Text := 'TCrudSettingApp."SaveToDB"';
    FSaveToDBCommand.Prepare(TCrudSettingApp_SaveToDB);
  end;
  if not Assigned(AObject) then
    FSaveToDBCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveToDBCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveToDBCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveToDBCommand.Execute(ARequestFilter);
  Result := FSaveToDBCommand.Parameters[1].Value.GetBoolean;
end;

function TCrudSettingAppClient.DeleteFromDB(AObject: TModApp; const ARequestFilter: string): Boolean;
begin
  if FDeleteFromDBCommand = nil then
  begin
    FDeleteFromDBCommand := FConnection.CreateCommand;
    FDeleteFromDBCommand.RequestType := 'POST';
    FDeleteFromDBCommand.Text := 'TCrudSettingApp."DeleteFromDB"';
    FDeleteFromDBCommand.Prepare(TCrudSettingApp_DeleteFromDB);
  end;
  if not Assigned(AObject) then
    FDeleteFromDBCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteFromDBCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteFromDBCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteFromDBCommand.Execute(ARequestFilter);
  Result := FDeleteFromDBCommand.Parameters[1].Value.GetBoolean;
end;

function TCrudSettingAppClient.OpenQuery(S: string; const ARequestFilter: string): TDataSet;
begin
  if FOpenQueryCommand = nil then
  begin
    FOpenQueryCommand := FConnection.CreateCommand;
    FOpenQueryCommand.RequestType := 'GET';
    FOpenQueryCommand.Text := 'TCrudSettingApp.OpenQuery';
    FOpenQueryCommand.Prepare(TCrudSettingApp_OpenQuery);
  end;
  FOpenQueryCommand.Parameters[0].Value.SetWideString(S);
  FOpenQueryCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FOpenQueryCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FOpenQueryCommand.FreeOnExecute(Result);
end;

function TCrudSettingAppClient.OpenQuery_Cache(S: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FOpenQueryCommand_Cache = nil then
  begin
    FOpenQueryCommand_Cache := FConnection.CreateCommand;
    FOpenQueryCommand_Cache.RequestType := 'GET';
    FOpenQueryCommand_Cache.Text := 'TCrudSettingApp.OpenQuery';
    FOpenQueryCommand_Cache.Prepare(TCrudSettingApp_OpenQuery_Cache);
  end;
  FOpenQueryCommand_Cache.Parameters[0].Value.SetWideString(S);
  FOpenQueryCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FOpenQueryCommand_Cache.Parameters[1].Value.GetString);
end;

function TCrudSettingAppClient.Retrieve(ModClassName: string; AID: string; const ARequestFilter: string): TModApp;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TCrudSettingApp.Retrieve';
    FRetrieveCommand.Prepare(TCrudSettingApp_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveCommand.Parameters[1].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModApp(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudSettingAppClient.Retrieve_Cache(ModClassName: string; AID: string; const ARequestFilter: string): IDSRestCachedTModApp;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TCrudSettingApp.Retrieve';
    FRetrieveCommand_Cache.Prepare(TCrudSettingApp_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveCommand_Cache.Parameters[1].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModApp.Create(FRetrieveCommand_Cache.Parameters[2].Value.GetString);
end;

function TCrudSettingAppClient.GenerateCustomNo(aTableName: string; aFieldName: string; aCountDigit: Integer; const ARequestFilter: string): string;
begin
  if FGenerateCustomNoCommand = nil then
  begin
    FGenerateCustomNoCommand := FConnection.CreateCommand;
    FGenerateCustomNoCommand.RequestType := 'GET';
    FGenerateCustomNoCommand.Text := 'TCrudSettingApp.GenerateCustomNo';
    FGenerateCustomNoCommand.Prepare(TCrudSettingApp_GenerateCustomNo);
  end;
  FGenerateCustomNoCommand.Parameters[0].Value.SetWideString(aTableName);
  FGenerateCustomNoCommand.Parameters[1].Value.SetWideString(aFieldName);
  FGenerateCustomNoCommand.Parameters[2].Value.SetInt32(aCountDigit);
  FGenerateCustomNoCommand.Execute(ARequestFilter);
  Result := FGenerateCustomNoCommand.Parameters[3].Value.GetWideString;
end;

function TCrudSettingAppClient.GenerateNo(aClassName: string; const ARequestFilter: string): string;
begin
  if FGenerateNoCommand = nil then
  begin
    FGenerateNoCommand := FConnection.CreateCommand;
    FGenerateNoCommand.RequestType := 'GET';
    FGenerateNoCommand.Text := 'TCrudSettingApp.GenerateNo';
    FGenerateNoCommand.Prepare(TCrudSettingApp_GenerateNo);
  end;
  FGenerateNoCommand.Parameters[0].Value.SetWideString(aClassName);
  FGenerateNoCommand.Execute(ARequestFilter);
  Result := FGenerateNoCommand.Parameters[1].Value.GetWideString;
end;

function TCrudSettingAppClient.RetrieveSingle(ModClassName: string; AID: string; const ARequestFilter: string): TModApp;
begin
  if FRetrieveSingleCommand = nil then
  begin
    FRetrieveSingleCommand := FConnection.CreateCommand;
    FRetrieveSingleCommand.RequestType := 'GET';
    FRetrieveSingleCommand.Text := 'TCrudSettingApp.RetrieveSingle';
    FRetrieveSingleCommand.Prepare(TCrudSettingApp_RetrieveSingle);
  end;
  FRetrieveSingleCommand.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveSingleCommand.Parameters[1].Value.SetWideString(AID);
  FRetrieveSingleCommand.Execute(ARequestFilter);
  if not FRetrieveSingleCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveSingleCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModApp(FUnMarshal.UnMarshal(FRetrieveSingleCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveSingleCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudSettingAppClient.RetrieveSingle_Cache(ModClassName: string; AID: string; const ARequestFilter: string): IDSRestCachedTModApp;
begin
  if FRetrieveSingleCommand_Cache = nil then
  begin
    FRetrieveSingleCommand_Cache := FConnection.CreateCommand;
    FRetrieveSingleCommand_Cache.RequestType := 'GET';
    FRetrieveSingleCommand_Cache.Text := 'TCrudSettingApp.RetrieveSingle';
    FRetrieveSingleCommand_Cache.Prepare(TCrudSettingApp_RetrieveSingle_Cache);
  end;
  FRetrieveSingleCommand_Cache.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveSingleCommand_Cache.Parameters[1].Value.SetWideString(AID);
  FRetrieveSingleCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModApp.Create(FRetrieveSingleCommand_Cache.Parameters[2].Value.GetString);
end;

function TCrudSettingAppClient.RetrieveByCode(ModClassName: string; aCode: string; const ARequestFilter: string): TModApp;
begin
  if FRetrieveByCodeCommand = nil then
  begin
    FRetrieveByCodeCommand := FConnection.CreateCommand;
    FRetrieveByCodeCommand.RequestType := 'GET';
    FRetrieveByCodeCommand.Text := 'TCrudSettingApp.RetrieveByCode';
    FRetrieveByCodeCommand.Prepare(TCrudSettingApp_RetrieveByCode);
  end;
  FRetrieveByCodeCommand.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveByCodeCommand.Parameters[1].Value.SetWideString(aCode);
  FRetrieveByCodeCommand.Execute(ARequestFilter);
  if not FRetrieveByCodeCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveByCodeCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModApp(FUnMarshal.UnMarshal(FRetrieveByCodeCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveByCodeCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudSettingAppClient.RetrieveByCode_Cache(ModClassName: string; aCode: string; const ARequestFilter: string): IDSRestCachedTModApp;
begin
  if FRetrieveByCodeCommand_Cache = nil then
  begin
    FRetrieveByCodeCommand_Cache := FConnection.CreateCommand;
    FRetrieveByCodeCommand_Cache.RequestType := 'GET';
    FRetrieveByCodeCommand_Cache.Text := 'TCrudSettingApp.RetrieveByCode';
    FRetrieveByCodeCommand_Cache.Prepare(TCrudSettingApp_RetrieveByCode_Cache);
  end;
  FRetrieveByCodeCommand_Cache.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveByCodeCommand_Cache.Parameters[1].Value.SetWideString(aCode);
  FRetrieveByCodeCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModApp.Create(FRetrieveByCodeCommand_Cache.Parameters[2].Value.GetString);
end;

function TCrudSettingAppClient.SaveToDBLog(AObject: TModApp; const ARequestFilter: string): Boolean;
begin
  if FSaveToDBLogCommand = nil then
  begin
    FSaveToDBLogCommand := FConnection.CreateCommand;
    FSaveToDBLogCommand.RequestType := 'POST';
    FSaveToDBLogCommand.Text := 'TCrudSettingApp."SaveToDBLog"';
    FSaveToDBLogCommand.Prepare(TCrudSettingApp_SaveToDBLog);
  end;
  if not Assigned(AObject) then
    FSaveToDBLogCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveToDBLogCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveToDBLogCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveToDBLogCommand.Execute(ARequestFilter);
  Result := FSaveToDBLogCommand.Parameters[1].Value.GetBoolean;
end;

function TCrudSettingAppClient.SaveToDBID(AObject: TModApp; const ARequestFilter: string): string;
begin
  if FSaveToDBIDCommand = nil then
  begin
    FSaveToDBIDCommand := FConnection.CreateCommand;
    FSaveToDBIDCommand.RequestType := 'POST';
    FSaveToDBIDCommand.Text := 'TCrudSettingApp."SaveToDBID"';
    FSaveToDBIDCommand.Prepare(TCrudSettingApp_SaveToDBID);
  end;
  if not Assigned(AObject) then
    FSaveToDBIDCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveToDBIDCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveToDBIDCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveToDBIDCommand.Execute(ARequestFilter);
  Result := FSaveToDBIDCommand.Parameters[1].Value.GetWideString;
end;

function TCrudSettingAppClient.TestGenerateSQL(AObject: TModApp; const ARequestFilter: string): TStrings;
begin
  if FTestGenerateSQLCommand = nil then
  begin
    FTestGenerateSQLCommand := FConnection.CreateCommand;
    FTestGenerateSQLCommand.RequestType := 'POST';
    FTestGenerateSQLCommand.Text := 'TCrudSettingApp."TestGenerateSQL"';
    FTestGenerateSQLCommand.Prepare(TCrudSettingApp_TestGenerateSQL);
  end;
  if not Assigned(AObject) then
    FTestGenerateSQLCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FTestGenerateSQLCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FTestGenerateSQLCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FTestGenerateSQLCommand.Execute(ARequestFilter);
  if not FTestGenerateSQLCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FTestGenerateSQLCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TStrings(FUnMarshal.UnMarshal(FTestGenerateSQLCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FTestGenerateSQLCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudSettingAppClient.TestGenerateSQL_Cache(AObject: TModApp; const ARequestFilter: string): IDSRestCachedTStrings;
begin
  if FTestGenerateSQLCommand_Cache = nil then
  begin
    FTestGenerateSQLCommand_Cache := FConnection.CreateCommand;
    FTestGenerateSQLCommand_Cache.RequestType := 'POST';
    FTestGenerateSQLCommand_Cache.Text := 'TCrudSettingApp."TestGenerateSQL"';
    FTestGenerateSQLCommand_Cache.Prepare(TCrudSettingApp_TestGenerateSQL_Cache);
  end;
  if not Assigned(AObject) then
    FTestGenerateSQLCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FTestGenerateSQLCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FTestGenerateSQLCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FTestGenerateSQLCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTStrings.Create(FTestGenerateSQLCommand_Cache.Parameters[1].Value.GetString);
end;

procedure TCrudSettingAppClient.AfterExecuteMethod;
begin
  if FAfterExecuteMethodCommand = nil then
  begin
    FAfterExecuteMethodCommand := FConnection.CreateCommand;
    FAfterExecuteMethodCommand.RequestType := 'GET';
    FAfterExecuteMethodCommand.Text := 'TCrudSettingApp.AfterExecuteMethod';
  end;
  FAfterExecuteMethodCommand.Execute;
end;

constructor TCrudSettingAppClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TCrudSettingAppClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TCrudSettingAppClient.Destroy;
begin
  FRetrieveByCabangCommand.DisposeOf;
  FRetrieveByCabangCommand_Cache.DisposeOf;
  FSaveToDBCommand.DisposeOf;
  FDeleteFromDBCommand.DisposeOf;
  FOpenQueryCommand.DisposeOf;
  FOpenQueryCommand_Cache.DisposeOf;
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FGenerateCustomNoCommand.DisposeOf;
  FGenerateNoCommand.DisposeOf;
  FRetrieveSingleCommand.DisposeOf;
  FRetrieveSingleCommand_Cache.DisposeOf;
  FRetrieveByCodeCommand.DisposeOf;
  FRetrieveByCodeCommand_Cache.DisposeOf;
  FSaveToDBLogCommand.DisposeOf;
  FSaveToDBIDCommand.DisposeOf;
  FTestGenerateSQLCommand.DisposeOf;
  FTestGenerateSQLCommand_Cache.DisposeOf;
  FAfterExecuteMethodCommand.DisposeOf;
  inherited;
end;

end.

