//
// Created by the DataSnap proxy generator.
// 03/12/17 8:11:07 PM
//

unit uClientClasses;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, uModApp, Data.DBXJSONReflect;

type

  IDSRestCachedTModApp = interface;
  IDSRestCachedTStrings = interface;

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
    function Hallo(const ARequestFilter: string = ''): string;
  end;

  TCrudClient = class(TDSAdminRestClient)
  private
    FSaveToDBCommand: TDSRestCommand;
    FDeleteFromDBCommand: TDSRestCommand;
    FOpenQueryCommand: TDSRestCommand;
    FOpenQueryCommand_Cache: TDSRestCommand;
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FTestGenerateSQLCommand: TDSRestCommand;
    FTestGenerateSQLCommand_Cache: TDSRestCommand;
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
    function TestGenerateSQL(AObject: TModApp; const ARequestFilter: string = ''): TStrings;
    function TestGenerateSQL_Cache(AObject: TModApp; const ARequestFilter: string = ''): IDSRestCachedTStrings;
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
    FCostCenter_GetDSOverviewCommand: TDSRestCommand;
    FCostCenter_GetDSOverviewCommand_Cache: TDSRestCommand;
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
    FRefPajak_GetDSLookupCommand: TDSRestCommand;
    FRefPajak_GetDSLookupCommand_Cache: TDSRestCommand;
    FRefTipeBarang_GetDSLookupCommand: TDSRestCommand;
    FRefTipeBarang_GetDSLookupCommand_Cache: TDSRestCommand;
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
    function CostCenter_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function CostCenter_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
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
    function RefPajak_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function RefPajak_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RefTipeBarang_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function RefTipeBarang_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
  end;

  IDSRestCachedTModApp = interface(IDSRestCachedObject<TModApp>)
  end;

  TDSRestCachedTModApp = class(TDSRestCachedObject<TModApp>, IDSRestCachedTModApp, IDSRestCachedCommand)
  end;
  IDSRestCachedTStrings = interface(IDSRestCachedObject<TStrings>)
  end;

  TDSRestCachedTStrings = class(TDSRestCachedObject<TStrings>, IDSRestCachedTStrings, IDSRestCachedCommand)
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

  TTestMethod_Hallo: array [0..0] of TDSRestParameterMetaData =
  (
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

  TDSProvider_CostCenter_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_CostCenter_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
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

function TTestMethodClient.Hallo(const ARequestFilter: string): string;
begin
  if FHalloCommand = nil then
  begin
    FHalloCommand := FConnection.CreateCommand;
    FHalloCommand.RequestType := 'GET';
    FHalloCommand.Text := 'TTestMethod.Hallo';
    FHalloCommand.Prepare(TTestMethod_Hallo);
  end;
  FHalloCommand.Execute(ARequestFilter);
  Result := FHalloCommand.Parameters[0].Value.GetWideString;
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
  FTestGenerateSQLCommand.DisposeOf;
  FTestGenerateSQLCommand_Cache.DisposeOf;
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
  FCostCenter_GetDSOverviewCommand.DisposeOf;
  FCostCenter_GetDSOverviewCommand_Cache.DisposeOf;
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
  FRefPajak_GetDSLookupCommand.DisposeOf;
  FRefPajak_GetDSLookupCommand_Cache.DisposeOf;
  FRefTipeBarang_GetDSLookupCommand.DisposeOf;
  FRefTipeBarang_GetDSLookupCommand_Cache.DisposeOf;
  inherited;
end;

end.

