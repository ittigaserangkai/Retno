unit uNewPosTransaction;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  StrUtils, uNewUnit, uTSBaseClass, uNewBarangHargaJual, uNewBeginningBalance,
  uNewVoucherLain, uNewPOSTransactionCard, uNewBarangStockSirkulasi,
  FireDAC.Comp.Client;

type
  TPOSTransactionItem = class(TCollectionItem)
  private
    FBarangCode: string;
    FBarangHargaJual: TBarangHargaJual;
    FBarangHargaJualID: string;
    FCOGS: Double;
    FDATE_CREATE: TDateTime;
    FDATE_MODIFY: TDateTime;
    FDiscMan: Double;
    FDisc_Card: Double;
    FDISC_GMC_NOMINAL: Double;
    FID: string;
    FIsBKP: Boolean;
    FIsDiscAMC: Boolean;
    FLastCost: Double;
    FNewUnit: TUnit;
    FNewUnitID: string;
//    FOPC_UNIT: TUnit;
//    FOPC_UNITID: Integer;
//    FOPM_UNIT: TUnit;
//    FOPM_UNITID: Integer;
    FOP_CREATE: string;
    FOP_MODIFY: string;
    FOto_Code: string;
    FPPN: Double;
    FPPNBM: Double;
    FQty: Double;
    FSellPrice: Double;
    FSellPriceDisc: Double;
    FTipeBarangID: string;
    FTotal: Double;
    FTotalBeforeTax: Double;
    FTotalCeil: Double;
    FTransNo: string;
    FUomCode: string;
    function GetBarangHargaJual: TBarangHargaJual;
    function GetNewUnit: TUnit;
//    function GetOPC_UNIT: TUnit;
//    function GetOPM_UNIT: TUnit;
    procedure SetNewUnit(Value: TUnit);
  public
    constructor Create(aCollection : TCollection); override;
    destructor Destroy; override;
    procedure ClearProperties;
    function CustomTableName: string;
    function GenerateRemoveSQL: TStrings; virtual;
    function GenerateSQL(AHeader_ID: string): TStrings;
    function GetFieldNameFor_BarangCode: string; dynamic;
    function GetFieldNameFor_BarangHargaJual: string; dynamic;
//    function GetFieldNameFor_BarangHargaJualUnit: string; dynamic;
    function GetFieldNameFor_COGS: string; dynamic;
    function GetFieldNameFor_DATE_CREATE: string; dynamic;
    function GetFieldNameFor_DATE_MODIFY: string; dynamic;
    function GetFieldNameFor_DISC_GMC_NOMINAL: string; dynamic;
    function GetFieldNameFor_ID: string; dynamic;
    function GetFieldNameFor_IsBKP: string; dynamic;
    function GetFieldNameFor_IsDiscAMC: string; dynamic;
    function GetFieldNameFor_LastCost: string; dynamic;
    function GetFieldNameFor_NewUnit: string; dynamic;
//    function GetFieldNameFor_OPC_UNIT: string; dynamic;
//    function GetFieldNameFor_OPM_UNIT: string; dynamic;
    function GetFieldNameFor_OP_CREATE: string; dynamic;
    function GetFieldNameFor_OP_MODIFY: string; dynamic;
    function GetFieldNameFor_PPN: string; dynamic;
    function GetFieldNameFor_PPNBM: string; dynamic;
    function GetFieldNameFor_Qty: string; dynamic;
    function GetFieldNameFor_SellPrice: string; dynamic;
    function GetFieldNameFor_SellPriceDisc: string; dynamic;
    function GetFieldNameFor_TipeBarang: string; dynamic;
    function GetFieldNameFor_Total: string; dynamic;
    function GetFieldNameFor_TotalBeforeTax: string; dynamic;
    function GetFieldNameFor_TotalCeil: string; dynamic;
    function GetFieldNameFor_TransDiscCard: string; dynamic;
    function GetFieldNameFor_TransDiscMan: string; dynamic;
    function GetFieldNameFor_TransID: string; dynamic;
    function GetFieldNameFor_TransNo: string; dynamic;
    function GetFieldNameFor_TransOtoCode: string; dynamic;
//    function GetFieldNameFor_TransUnit: string; dynamic;
    function GetFieldNameFor_UomCode: string; dynamic;
    function GetFieldPrefix: string;
    function GetGeneratorName: string; dynamic;
    function RemoveFromDB: Boolean;
    property BarangCode: string read FBarangCode write FBarangCode;
    property BarangHargaJual: TBarangHargaJual read GetBarangHargaJual write
            FBarangHargaJual;
    property COGS: Double read FCOGS write FCOGS;
    property DATE_CREATE: TDateTime read FDATE_CREATE write FDATE_CREATE;
    property DATE_MODIFY: TDateTime read FDATE_MODIFY write FDATE_MODIFY;
    property DiscMan: Double read FDiscMan write FDiscMan;
    property Disc_Card: Double read FDisc_Card write FDisc_Card;
    property DISC_GMC_NOMINAL: Double read FDISC_GMC_NOMINAL write
        FDISC_GMC_NOMINAL;
    property ID: string read FID write FID;
    property IsBKP: Boolean read FIsBKP write FIsBKP;
    property IsDiscAMC: Boolean read FIsDiscAMC write FIsDiscAMC;
    property LastCost: Double read FLastCost write FLastCost;
    property NewUnit: TUnit read GetNewUnit write SetNewUnit;
//    property OPC_UNIT: TUnit read GetOPC_UNIT write SetOPC_UNIT;
//    property OPM_UNIT: TUnit read GetOPM_UNIT write SetOPM_UNIT;
    property OP_CREATE: string read FOP_CREATE write FOP_CREATE;
    property OP_MODIFY: string read FOP_MODIFY write FOP_MODIFY;
    property Oto_Code: string read FOto_Code write FOto_Code;
    property PPN: Double read FPPN write FPPN;
    property PPNBM: Double read FPPNBM write FPPNBM;
    property Qty: Double read FQty write FQty;
    property SellPrice: Double read FSellPrice write FSellPrice;
    property SellPriceDisc: Double read FSellPriceDisc write FSellPriceDisc;
    property TipeBarangID: string read FTipeBarangID write FTipeBarangID;
    property Total: Double read FTotal write FTotal;
    property TotalBeforeTax: Double read FTotalBeforeTax write FTotalBeforeTax;
    property TotalCeil: Double read FTotalCeil write FTotalCeil;
    property TransNo: string read FTransNo write FTransNo;
    property UomCode: string read FUomCode write FUomCode;
  published
  end;
  
  TPOSTransactionItems = class(TCollection)
  private
    function GetPOSTransactionItem(Index: Integer): TPOSTransactionItem;
    procedure SetPOSTransactionItem(Index: Integer; Value: TPOSTransactionItem);
  public
    function Add: TPOSTransactionItem;
    function CustomTableName: string;
    function GetFieldNameFor_Header: string;
//    function GetFieldNameFor_HeaderUNT: string;
    procedure LoadByHeaderID(aHeader_ID: string);
    property POSTransactionItem[Index: Integer]: TPOSTransactionItem read
            GetPOSTransactionItem write SetPOSTransactionItem; default;
  end;

  TPOSTransaction = class(TSBaseClass)
  private
    FBarangStockSirkulasi: TBArangStockSirkulasiItems;
    FBayarCard: Double;
    FBayarCash: Double;
    FBeginningBalance: TBeginningBalance;
    FBeginningBalanceID: string;
    FDATE_CREATE: TDateTime;
    FDATE_MODIFY: TDateTime;
    FDiscAMCNominal: Double;
    FDiscAMCPersen: Double;
    FID: string;
    FIsActive: Boolean;
    FIsPending: Boolean;
    FKuponBotolNo: String;
    FMemberID: string;
    FNewUnit: TUnit;
    FNewUnitID: string;
    FNo: string;
//    FOPC_UNIT: TUnit;
//    FOPC_UNITID: Integer;
//    FOPM_UNIT: TUnit;
//    FOPM_UNITID: Integer;
    FOP_CREATE: string;
    FOP_MODIFY: string;
    FPembulat: Double;
    FPOSTransactionItems: TPOSTransactionItems;
    FReturNo: TStrings;
    FTanggal: TDateTime;
    FTotalBayar: Double;
    FTotalDiscAMC: Double;
    FTotalPPN: Double;
    FTotalTransaction: Double;
    FTransactionCard: TPOSTransactionCard;
    FTRANS_DISC_CARD: Double;
    FTrans_Struk: TSTrings;
    FVoucherLains: TVoucherLainItems;
    FVoucherNo: TStrings;
    Q1: TFDQuery;
    Q2: TFDQuery;
    function FLoadFromDB(aSQL : String): Boolean;
    function GetBarangStockSirkulasi: TBArangStockSirkulasiItems;
    function GetBeginningBalance: TBeginningBalance;
    function GetNewUnit: TUnit;
//    function GetOPC_UNIT: TUnit;
//    function GetOPM_UNIT: TUnit;
    function GetPOSTransactionItems: TPOSTransactionItems;
    function GetReturNo: TStrings;
    function GetTransactionCard: TPOSTransactionCard;
    function GetTrans_Struk: TSTrings;
    function GetVoucherLains: TVoucherLainItems;
    function GetVoucherNo: TStrings;
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
    function GenerateJurnal(aRumus : String; aMultiPurpose : Integer; aUnitID :
        Integer; aFlagRumus : Integer; aTipe : Integer; aRekCode : String): Double;
    function GenerateJurnalHPP(aRumus : String; aMultiPurpose : Integer; aUnitID :
        Integer; aFlagRumus : Integer; aTipe : Integer): Double;
    function GenerateSQL(ARepeatCount: Integer = 1): TStrings;
    function GenerateSQL_TransactionItems(aPOSTransactionItems:
        TPOSTransactionItems): TStrings;
    function GetFieldNameFor_BayarCard: string; dynamic;
    function GetFieldNameFor_BayarCash: string; dynamic;
    function GetFieldNameFor_BeginningBalance: string; dynamic;
//    function GetFieldNameFor_BeginningBalanceUnit: string; dynamic;
    function GetFieldNameFor_DATE_CREATE: string; dynamic;
    function GetFieldNameFor_DATE_MODIFY: string; dynamic;
    function GetFieldNameFor_DiscAMCNominal: string; dynamic;
    function GetFieldNameFor_DiscAMCPersen: string; dynamic;
    function GetFieldNameFor_ID: string; dynamic;
    function GetFieldNameFor_IsActive: string; dynamic;
    function GetFieldNameFor_IsPending: string; dynamic;
    function GetFieldNameFor_KuponBotolNo: string; dynamic;
    function GetFieldNameFor_KuponBotolStatus: string; dynamic;
    function GetFieldNameFor_KuponBotolTransPOS: string; dynamic;
    function GetFieldNameFor_KuponBotolUnit: string; dynamic;
    function GetFieldNameFor_MemberID: string; dynamic;
//    function GetFieldNameFor_MemberUnit: string; dynamic;
    function GetFieldNameFor_NewUnit: string; dynamic;
    function GetFieldNameFor_No: string; dynamic;
//    function GetFieldNameFor_OPC_UNIT: string; dynamic;
//    function GetFieldNameFor_OPM_UNIT: string; dynamic;
    function GetFieldNameFor_OP_CREATE: string; dynamic;
    function GetFieldNameFor_OP_MODIFY: string; dynamic;
    function GetFieldNameFor_Pembulat: string; dynamic;
    function GetFieldNameFor_POSTransactionItems: string; dynamic;
    function GetFieldNameFor_ReturNo: string; dynamic;
    function GetFieldNameFor_ReturTransPOS: string; dynamic;
    function GetFieldNameFor_ReturUnit: string; dynamic;
    function GetFieldNameFor_Tanggal: string; dynamic;
    function GetFieldNameFor_TotalBayar: string; dynamic;
    function GetFieldNameFor_TotalDiscAMC: string; dynamic;
    function GetFieldNameFor_TotalPPN: string; dynamic;
    function GetFieldNameFor_TotalTransaction: string; dynamic;
    function GetFieldNameFor_TransCardDisc: string; dynamic;
    function GetFieldNameFor_TransStruk: string; dynamic;
    function GetFieldNameFor_VoucherNo: string; dynamic;
    function GetFieldNameFor_VoucherStatus: string; dynamic;
    function GetFieldNameFor_VoucherTransPOS: string; dynamic;
    function GetFieldNameFor_VoucherUnit: string; dynamic;
    function GetFieldPrefix: string;
    function GetGeneratorName: string; dynamic;
    class function GetHeaderFlag: Integer;
    function GetHPPdanPersediaanBarang(aMerchandizeGroupID : Integer; aUnitID :
        Integer; aTipe : Integer): Double;
    procedure GetMember(var aKodeMember: String; var aNamaMember : String);
    function GetNominalCard(aRekCode : String): Double;
    function GetNominalCashBack(aRekCode : String): Double;
    function GetNominalCharge: Double;
    function GetNominalDiscountGMC(aNoBukti : String): Double;
    function GetNominalKasBank: Double;
    function GetNominalKuponBotol: Double;
    function GetNominalPembulatan: Double;
    function GetNominalPiutangVoucher: Double;
    function GetNominalPPN: Double;
    function GetNominalTransaction(aNoBukti : String): Double;
    function GetNoTransaksi: string;
    function GetPenjualanBarang(aMerchandizeGroupID : Integer; aUnitID : Integer;
        aTipe : Integer): Double;
    function GetPlannedID: string;
    function GetTableNameFor_KuponBotol: string; dynamic;
    function GetTableNameFor_Retur: string; dynamic;
    function GetTableNameFor_Voucher: string; dynamic;
    function GetTransactionDate: TDateTime;
    function IsBalanceUsed(aBalance_ID, aUnitID: string): Boolean;
    function LoadByID(AID : Integer; AUnitID: Integer): Boolean;
    function LoadByTrans_No(aTransNo, aUnitID: String): Boolean;
    function LoadDataJurnal(aDate1 : TDateTime; aDate2 : TDateTime; aUnitID :
        Integer): Boolean;
    function LoadDataJurnalByNo(aNoBukti : String; aUnitID : Integer): Boolean;
    function RemoveFromDB: Boolean;
    function SaveAllToDB: Boolean;
    function SaveKuponBotolToDB: Boolean;
    function SaveReturToDB: Boolean;
    function SaveToDB: Boolean;
    function SaveTransactionCardToDB: Boolean;
    function SaveVoucherLainToDB: Boolean;
    function SaveVoucherToDB: Boolean;
    procedure UpdateData(ABayarCard, ABayarCash: Double; ABeginningBalance_ID:
        string; ADiscAMCNominal, ADiscAMCPersen: Double; AID: string; AIsActive:
        Boolean; AMemberID, ANewUnit_ID, ANo: string; APembulat: Double; ATanggal:
        TDateTime; ATotalBayar, ATotalDiscAMC, ATotalPPN, ATotalTransaction:
        Double; AKuponBotolNo: String; AVoucherNo: TStrings; aUserID: string;
        aTransDiscCard: Double; aISJURNAL: Integer = 0; aIsPending: Boolean =
        False);
    procedure UpdatePOSTransactionItems(ABarangHargaJual_ID: string; ACOGS: Double;
        AID: string; AIsBKP, AIsDiscAMC: Boolean; ALastCost, APPN, APPNBM, AQty,
        ASellPrice, ASellPriceDisc, ATotal, ATotalBeforeTax, ATotalCeil: Double;
        ATransNo, AUnitID, ABarangCode, ATipeBarangID: string; aDISC_GMC_NOMINAL:
        Double; aUomCode: string; aDisc_Card: Double = 0; aDisc_Man: Double = 0;
        aOtoCode: String = '');
    function UpdateStatusJurnal(aStatus : Integer; aUnitID : Integer; aDate :
        TDateTime): Boolean;
    function UpdateTransStruk(lTransStruk: TStrings; IDTrans: string): Boolean;
    property BarangStockSirkulasi: TBArangStockSirkulasiItems read
        GetBarangStockSirkulasi write FBarangStockSirkulasi;
    property BayarCard: Double read FBayarCard write FBayarCard;
    property BayarCash: Double read FBayarCash write FBayarCash;
    property BeginningBalance: TBeginningBalance read GetBeginningBalance write
            FBeginningBalance;
    property DATE_CREATE: TDateTime read FDATE_CREATE write FDATE_CREATE;
    property DATE_MODIFY: TDateTime read FDATE_MODIFY write FDATE_MODIFY;
    property DiscAMCNominal: Double read FDiscAMCNominal write FDiscAMCNominal;
    property DiscAMCPersen: Double read FDiscAMCPersen write FDiscAMCPersen;
    property ID: string read FID write FID;
    property IsActive: Boolean read FIsActive write FIsActive;
    property IsPending: Boolean read FIsPending write FIsPending;
    property KuponBotolNo: String read FKuponBotolNo write FKuponBotolNo;
    property MemberID: string read FMemberID write FMemberID;
    property NewUnit: TUnit read GetNewUnit write SetNewUnit;
    property No: string read FNo write FNo;
//    property OPC_UNIT: TUnit read GetOPC_UNIT write SetOPC_UNIT;
//    property OPM_UNIT: TUnit read GetOPM_UNIT write SetOPM_UNIT;
    property OP_CREATE: string read FOP_CREATE write FOP_CREATE;
    property OP_MODIFY: string read FOP_MODIFY write FOP_MODIFY;
    property Pembulat: Double read FPembulat write FPembulat;
    property POSTransactionItems: TPOSTransactionItems read
            GetPOSTransactionItems write FPOSTransactionItems;
    property ReturNo: TStrings read GetReturNo write FReturNo;
    property Tanggal: TDateTime read FTanggal write FTanggal;
    property TotalBayar: Double read FTotalBayar write FTotalBayar;
    property TotalDiscAMC: Double read FTotalDiscAMC write FTotalDiscAMC;
    property TotalPPN: Double read FTotalPPN write FTotalPPN;
    property TotalTransaction: Double read FTotalTransaction write
            FTotalTransaction;
    property TransactionCard: TPOSTransactionCard read GetTransactionCard write
        FTransactionCard;
    property TRANS_DISC_CARD: Double read FTRANS_DISC_CARD write FTRANS_DISC_CARD;
    property Trans_Struk: TSTrings read GetTrans_Struk write FTrans_Struk;
    property VoucherLains: TVoucherLainItems read GetVoucherLains write
        FVoucherLains;
    property VoucherNo: TStrings read GetVoucherNo write FVoucherNo;
  end;

function GetListPendingTransAll: string;

function GetListPendingTransByUserID(aUserID: string): string;

function GetListPendingTransByUserIDAndDate(aUserID: string; aDate: TDateTime):
    string;

function GetListPendingTransDetailByHeaderID(aHeaderID: string): string;

implementation

uses DB, Math, udmMain, FireDAC.Stan.Error, uAppUtils;

function GetListPendingTransAll: string;
begin
//      Result :=
//        'SELECT MEMBER.MEMBER_CARD_NO as "No Kartu",  MEMBER.MEMBER_NAME as "Nama Member", '
//        + '  TRANSAKSI.TRANS_NO as "No Transaksi", TRANSAKSI.TRANS_DATE as "Tanggal Trans",  '
//        + '   TRANSAKSI.TRANS_TOTAL_TRANSACTION as "Total", '
//        + '   TRANSAKSI.TRANS_IS_ACTIVE,  TRANSAKSI.TRANS_ID, '
//        + '  TRANSAKSI.TRANS_MEMBER_ID,  TRANSAKSI.TRANS_MEMBER_UNT_ID '
//        + ' FROM MEMBER '
//        + ' INNER JOIN TRANSAKSI ON (MEMBER.MEMBER_ID = TRANSAKSI.TRANS_MEMBER_ID) '
//        + '   AND (MEMBER.MEMBER_UNT_ID = TRANSAKSI.TRANS_MEMBER_UNT_ID) '
//        + ' WHERE (TRANSAKSI.TRANS_IS_PENDING = 1) '
//        + '   AND OPC_UNIT = ' + IntToStr(aUnit_ID)
//        + ' ORDER BY MEMBER.MEMBER_CARD_NO, TRANSAKSI.TRANS_NO';

  Result := 'SELECT M.MEMBER_CARD_NO as "No Kartu", '
          + '  M.MEMBER_NAME as "Nama Member", '
          + '  T.TRANS_NO as "No Transaksi", '
          + '  T.TRANS_DATE as "Tanggal Trans",  '
          + '  T.TRANS_TOTAL_TRANSACTION as "Total", '
          + '  T.TRANS_IS_ACTIVE, '
          + '  T.TRANSAKSI_ID, '
          + '  T.MEMBER_ID '
          + ' FROM MEMBER M '
          + ' INNER JOIN TRANSAKSI T ON (M.MEMBER_ID = T.MEMBER_ID) '
          + ' WHERE (T.TRANS_IS_PENDING = 1) '
          + ' ORDER BY M.MEMBER_CARD_NO, T.TRANS_NO';
end;

function GetListPendingTransDetailByHeaderID(aHeaderID: string): string;
begin
//      Result :=
//          'SELECT transd.TRANSD_ID, transd.TRANSD_UNT_ID,TRANSD_BRG_CODE, '
//          + ' transd.TRANSD_TRANS_NO, transd.TRANSD_BHJ_ID, '
//          + ' transd.TRANSD_BHJ_UNT_ID, transd.TRANSD_QTY, '
//          + ' bhj.BHJ_SAT_CODE,  '
//          + ' transd.TRANSD_SELL_PRICE, bhj.BHJ_SELL_PRICE, '
//          + ' bhj.BHJ_TPHRG_ID, bhj.BHJ_TPHRG_UNT_ID, '
//          + ' transd.TRANSD_DISC_MAN, transd.OTO_CODE '
//          + ' FROM TRANSAKSI_DETIL transd'
//          + ' INNER JOIN BARANG_HARGA_JUAL bhj ON (transd.TRANSD_BHJ_ID = bhj.BHJ_ID) '
//          + '    AND (transd.TRANSD_BHJ_UNT_ID = bhj.BHJ_UNT_ID) '
//          + ' WHERE transd.TRANSD_TRANS_ID = ' + IntToStr(aHeaderID)
//          + '    AND transd.TRANSD_TRANS_UNT_ID = ' + IntToStr(aUnit_ID)
//          + ' ORDER BY transd.TRANSD_ID';

  Result := 'SELECT TD.TRANSAKSI_DETIL_ID, '
          + '  TD.TRANSD_BRG_CODE, '
          + '  TD.TRANSD_TRANS_NO, '
          + '  TD.BARANG_HARGA_JUAL_ID, '
          + '  TD.TRANSD_QTY, '
          + '  S.SAT_CODE, '
          + '  TD.TRANSD_SELL_PRICE, '
          + '  BHJ.BHJ_SELL_PRICE, '
          + '  BHJ.REF$TIPE_HARGA_ID, '
          + '  TD.TRANSD_DISC_MAN, '
          + '  TD.OTO_CODE '
          + ' FROM TRANSAKSI_DETIL TD'
          + ' INNER JOIN BARANG_HARGA_JUAL BHJ ON (TD.BARANG_HARGA_JUAL_ID = BHJ.BARANG_HARGA_JUAL_ID) '
          + ' INNER JOIN REF$SATUAN S ON S.REF$SATUAN_ID = BHJ.REF$SATUAN_ID '
          + ' WHERE TD.TRANSAKSI_ID = ' + QuotedStr(aHeaderID)
          + ' ORDER BY TD.TRANSAKSI_DETIL_ID';
end;

function GetListPendingTransByUserID(aUserID: string): string;
begin
//      Result :=
//        'SELECT MEMBER.MEMBER_CARD_NO as "No Kartu",  MEMBER.MEMBER_NAME as "Nama Member", '
//        + '  TRANSAKSI.TRANS_NO as "No Transaksi", TRANSAKSI.TRANS_DATE as "Tanggal Trans",  '
//        + '   TRANSAKSI.TRANS_TOTAL_TRANSACTION as "Total", '
//        + '   TRANSAKSI.TRANS_IS_ACTIVE,  TRANSAKSI.TRANS_ID, '
//        + '  TRANSAKSI.TRANS_MEMBER_ID,  TRANSAKSI.TRANS_MEMBER_UNT_ID '
//        + ' FROM MEMBER '
//        + ' INNER JOIN TRANSAKSI ON (MEMBER.MEMBER_ID = TRANSAKSI.TRANS_MEMBER_ID) '
//        + '   AND (MEMBER.MEMBER_UNT_ID = TRANSAKSI.TRANS_MEMBER_UNT_ID) '
//        + ' WHERE (TRANSAKSI.TRANS_IS_PENDING = 1) '
//        + '   AND OPC_UNIT = ' + IntToStr(aUnit_ID)
//        + '   AND OP_CREATE = ' + IntToStr(aUserID)
//        + ' ORDER BY MEMBER.MEMBER_CARD_NO, TRANSAKSI.TRANS_NO';

  Result := 'SELECT M.MEMBER_CARD_NO as "No Kartu", '
          + '  M.MEMBER_NAME as "Nama Member", '
          + '  T.TRANS_NO as "No Transaksi", '
          + '  T.TRANS_DATE as "Tanggal Trans",  '
          + '  T.TRANS_TOTAL_TRANSACTION as "Total", '
          + '  T.TRANS_IS_ACTIVE, '
          + '  T.TRANSAKSI_ID, '
          + '  T.MEMBER_ID '
          + ' FROM MEMBER M '
          + ' INNER JOIN TRANSAKSI T ON (M.MEMBER_ID = T.MEMBER_ID) '
          + ' WHERE (T.TRANS_IS_PENDING = 1) '
          + '  AND T.OP_CREATE = ' + QuotedStr(aUserID)
          + ' ORDER BY M.MEMBER_CARD_NO, T.TRANS_NO';
end;

function GetListPendingTransByUserIDAndDate(aUserID: string; aDate: TDateTime):
    string;
begin
//  Result := 'SELECT MEMBER.MEMBER_CARD_NO as "No Kartu",  MEMBER.MEMBER_NAME as "Nama Member", '
//          + '  TRANSAKSI.TRANS_NO as "No Transaksi", TRANSAKSI.TRANS_DATE as "Tanggal Trans",  '
//          + '   TRANSAKSI.TRANS_TOTAL_TRANSACTION as "Total", '
//          + '   TRANSAKSI.TRANS_IS_ACTIVE,  TRANSAKSI.TRANS_ID, '
//          + '  TRANSAKSI.TRANS_MEMBER_ID,  TRANSAKSI.TRANS_MEMBER_UNT_ID '
//          + ' FROM MEMBER '
//          + ' INNER JOIN TRANSAKSI ON (MEMBER.MEMBER_ID = TRANSAKSI.TRANS_MEMBER_ID) '
//          + '   AND (MEMBER.MEMBER_UNT_ID = TRANSAKSI.TRANS_MEMBER_UNT_ID) '
//          + ' WHERE (TRANSAKSI.TRANS_IS_PENDING = 1) '
//          + '   AND TRANSAKSI.OPC_UNIT = ' + QuotedStr(aUnit_ID)
//          + '   AND TRANSAKSI.OP_CREATE = ' + QuotedStr(aUserID)
//          + '   AND CAST(TRANSAKSI.TRANS_DATE AS DATE) = ' + TAppUtils.QuotD(aDate)
//          + ' ORDER BY MEMBER.MEMBER_CARD_NO, TRANSAKSI.TRANS_NO';

  Result := 'SELECT M.MEMBER_CARD_NO as "No Kartu", '
          + '  M.MEMBER_NAME as "Nama Member", '
          + '  T.TRANS_NO as "No Transaksi", '
          + '  T.TRANS_DATE as "Tanggal Trans",  '
          + '  T.TRANS_TOTAL_TRANSACTION as "Total", '
          + '  T.TRANS_IS_ACTIVE, '
          + '  T.TRANSAKSI_ID, '
          + '  T.MEMBER_ID '
          + ' FROM MEMBER M '
          + ' INNER JOIN TRANSAKSI T ON (M.MEMBER_ID = T.MEMBER_ID) '
          + ' WHERE (T.TRANS_IS_PENDING = 1) '
          + '  AND T.OP_CREATE = ' + QuotedStr(aUserID)
          + '  AND DATE(T.TRANS_DATE) = ' + TAppUtils.QuotD(aDate)
          + ' ORDER BY M.MEMBER_CARD_NO, T.TRANS_NO';
end;

{
***************************** TPOSTransactionItem ******************************
}
constructor TPOSTransactionItem.Create(aCollection : TCollection);
begin
  inherited Create(ACollection);
end;

destructor TPOSTransactionItem.Destroy;
begin
  ClearProperties;
  inherited Destroy;
end;

procedure TPOSTransactionItem.ClearProperties;
begin
  TransNo := '';
  TotalCeil := 0;
  TotalBeforeTax := 0;
  Total := 0;
  SellPriceDisc := 0;
  SellPrice := 0;
  Qty := 0;
  PPNBM := 0;
  PPN := 0;
  OP_MODIFY := '';
  OP_CREATE := '';
  LastCost := 0;
  IsDiscAMC := FALSE;
  IsBKP := FALSE;
  ID := '';
  COGS := 0;
  BarangCode := '';
  TipeBarangID := '';
  FBarangHargaJualID := '';
  FNewUnitID := '';
  DISC_GMC_NOMINAL := 0;
  Disc_Card := 0;

  FreeAndNil(FBarangHargaJual);
  FreeAndNil(FNewUnit);
//  FreeAndNil(FOPC_UNIT);
//  FreeAndNil(FOPM_UNIT);
end;

function TPOSTransactionItem.CustomTableName: string;
begin
  Result := 'transaksi_detil';
end;

{
******************************** TCodeTemplate *********************************
}
function TPOSTransactionItem.GenerateRemoveSQL: TStrings;
var
  S: string;
begin
  Result := TStringList.Create;
  S:= 'DELETE FROM ' + CustomTableName +
      ' WHERE ' + GetFieldNameFor_ID + ' = ' + QuotedStr(FID);
//      ' AND ' + GetFieldNameFor_NewUnit + ' = ' + QuotedStr(FNewUnitID) + ';';
  Result.Append(S);
end;

function TPOSTransactionItem.GenerateSQL(AHeader_ID: string): TStrings;
var
  sSQL: string;
  sPrec: string;
begin
  Result := TStringList.Create;
  DATE_MODIFY := cGetServerDateTime;
//  FOPM_UNITID := FNewUnitID;
  sPrec := Get_Price_Precision;
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
      + GetFieldNameFor_BarangCode + ', '
      + GetFieldNameFor_TipeBarang + ', '
      + GetFieldNameFor_BarangHargaJual + ', '
//      + GetFieldNameFor_BarangHargaJualUnit + ', '
      + GetFieldNameFor_COGS + ', '
      + GetFieldNameFor_DATE_CREATE + ', '
      + GetFieldNameFor_ID + ', '
      + GetFieldNameFor_IsBKP + ', '
      + GetFieldNameFor_IsDiscAMC + ', '
      + GetFieldNameFor_LastCost + ', '
      + GetFieldNameFor_NewUnit + ', '
//      + GetFieldNameFor_OPC_UNIT + ', '
      + GetFieldNameFor_OP_CREATE + ', '
      + GetFieldNameFor_PPN + ', '
      + GetFieldNameFor_PPNBM + ', '
      + GetFieldNameFor_DISC_GMC_NOMINAL + ', '
      + GetFieldNameFor_Qty + ', '
      + GetFieldNameFor_SellPrice + ', '
      + GetFieldNameFor_SellPriceDisc + ', '
      + GetFieldNameFor_Total + ', '
      + GetFieldNameFor_TotalBeforeTax + ', '
      + GetFieldNameFor_TotalCeil + ', '
//      + GetFieldNameFor_TransUnit + ', '
      + GetFieldNameFor_TransID + ', '
      + GetFieldNameFor_TransDiscCard + ', '
      + GetFieldNameFor_UomCode + ', '
      + GetFieldNameFor_TransNo + ', '
      + GetFieldNameFor_TransDiscMan +', '
      + GetFieldNameFor_TransOtoCode
      + ') values ('
      + QuotedStr(BarangCode) + ', '
      + QuotedStr(TipeBarangID) + ', '
      + QuotedStr(FBarangHargaJualID) + ', '
//      + QuotedStr(FNewUnitID) + ', '
      + FormatFloat(sPrec, FCOGS) + ', '
      + TAppUtils.QuotDT(FDATE_CREATE) + ', '
      + QuotedStr(FID) + ', '
//      + cGetNextIDDetail(GetFieldNameFor_ID, CustomTableName) + ', '
      + IfThen(FIsBKP,'1','0') + ', '
      + IfThen(FIsDiscAMC,'1','0') + ', '
      + FormatFloat(sPrec, FLastCost) + ', '
      + QuotedStr(FNewUnitID) + ', '
//      + InttoStr(FOPC_UNITID) + ', '
      + QuotedStr(FOP_CREATE) + ', '
      + FormatFloat('0.00', FPPN) + ', '
      + FormatFloat('0.00', FPPNBM) + ', '
      + FormatFloat(sPrec, FDISC_GMC_NOMINAL) + ', '
      + FormatFloat('0.000', FQty) + ', '
      + FormatFloat(sPrec, FSellPrice) + ', '
      + FormatFloat(sPrec, FSellPriceDisc) + ', '
      + FormatFloat(sPrec, FTotal) + ', '
      + FormatFloat(sPrec, FTotalBeforeTax) + ', '
      + FormatFloat(sPrec, FTotalCeil) + ', '
//      + InttoStr(FNewUnitID) + ', '
      + QuotedStr(AHeader_ID) + ', '
      + FormatFloat(sPrec, FDisc_Card) + ', '
      + QuotedStr(FUomCode) + ', '
      + QuotedStr(FTransNo) + ', '
      + FormatFloat(sPrec, FDiscMan) + ', '
      + QuotedStr(FOto_Code)
      + ');';
  end
  else
  begin
    //generate Update SQL
    sSQL := 'update ' + CustomTableName + ' set '
      + GetFieldNameFor_BarangHargaJual + ' = ' + QuotedStr(FBarangHargaJualID)
      + ', ' + GetFieldNameFor_BarangCode + ' = ' + QuotedStr(BarangCode)
      + ', ' + GetFieldNameFor_TipeBarang + ' = ' + QuotedStr(TipeBarangID)
      + ', ' + GetFieldNameFor_COGS + ' = ' + FormatFloat(sPrec, FCOGS)
      + ', ' + GetFieldNameFor_DATE_MODIFY + ' = ' + TAppUtils.QuotDT(FDATE_MODIFY)
      + ', ' + GetFieldNameFor_IsBKP + ' = ' + IfThen(FIsBKP,'1','0')
      + ', ' + GetFieldNameFor_IsDiscAMC + ' = ' + IfThen(FIsDiscAMC,'1','0')
      + ', ' + GetFieldNameFor_LastCost + ' = ' + FormatFloat(sPrec, FLastCost)
      + ', ' + GetFieldNameFor_NewUnit + ' = ' + QuotedStr(FNewUnitID)
//      + ', ' + GetFieldNameFor_OPM_UNIT + ' = ' + IntToStr(FOPM_UNITID)
      + ', ' + GetFieldNameFor_OP_MODIFY + ' = ' + QuotedStr(FOP_MODIFY)
      + ', ' + GetFieldNameFor_PPN + ' = ' + FormatFloat('0.00', FPPN)
      + ', ' + GetFieldNameFor_PPNBM + ' = ' + FormatFloat('0.00', FPPNBM)
      + ', ' + GetFieldNameFor_DISC_GMC_NOMINAL + ' = ' + FormatFloat(sPrec, FDISC_GMC_NOMINAL)
      + ', ' + GetFieldNameFor_Qty + ' = ' + FormatFloat('0.000', FQty)
      + ', ' + GetFieldNameFor_SellPrice + ' = ' + FormatFloat(sPrec, FSellPrice)
      + ', ' + GetFieldNameFor_SellPriceDisc + ' = ' + FormatFloat(sPrec, FSellPriceDisc)
      + ', ' + GetFieldNameFor_Total + ' = ' + FormatFloat(sPrec, FTotal)
      + ', ' + GetFieldNameFor_TotalBeforeTax + ' = ' + FormatFloat(sPrec, FTotalBeforeTax)
      + ', ' + GetFieldNameFor_TotalCeil + ' = ' + FormatFloat(sPrec, FTotalCeil)
      + ', ' + GetFieldNameFor_TransNo + ' = ' + QuotedStr(FTransNo)
//      + ', ' + GetFieldNameFor_TransUnit + ' = ' + IntToStr(FNewUnitID)
      + ', ' + GetFieldNameFor_TransDiscCard + ' = ' + FormatFloat(sPrec, FDisc_Card)
      + ', ' + GetFieldNameFor_TransID + ' = ' + QuotedStr(AHeader_ID)
      + ', ' + GetFieldNameFor_UomCode + ' = ' + QuotedStr(FUomCode)
      + ', ' + GetFieldNameFor_TransDiscMan + ' = ' + FormatFloat(sPrec, FDiscMan)
      + ', ' + GetFieldNameFor_TransOtoCode + ' = ' + QuotedStr(FOto_Code)
      + ' where ' + GetFieldNameFor_ID + ' = ' + QuotedStr(FID);
//      + ' and ' + GetFieldNameFor_NewUnit + ' = ' + QuotedStr(FNewUnitID) + ';';
  end;
  Result.Append(sSQL);
end;

function TPOSTransactionItem.GetBarangHargaJual: TBarangHargaJual;
begin
//  Result := nil;
  if FBarangHargaJual = nil then
  begin
    FBarangHargaJual := TBarangHargaJual.Create(nil);
    FBarangHargaJual.LoadByID(FBarangHargaJualID);
  end;
  Result := FBarangHargaJual;
end;

function TPOSTransactionItem.GetFieldNameFor_BarangCode: string;
begin
  Result := GetFieldPrefix + 'brg_code';
//  Result := 'BARANG_ID';
end;

function TPOSTransactionItem.GetFieldNameFor_BarangHargaJual: string;
begin
//  Result := GetFieldPrefix + 'bhj_id';
  Result := 'BARANG_HARGA_JUAL_ID';
end;

//function TPOSTransactionItem.GetFieldNameFor_BarangHargaJualUnit: string;
//begin
//  Result := GetFieldPrefix + 'bhj_unt_id';
//end;

function TPOSTransactionItem.GetFieldNameFor_COGS: string;
begin
  Result := GetFieldPrefix + 'COGS';
end;

function TPOSTransactionItem.GetFieldNameFor_DATE_CREATE: string;
begin
  Result := 'DATE_CREATE';
end;

function TPOSTransactionItem.GetFieldNameFor_DATE_MODIFY: string;
begin
  Result := 'DATE_MODIFY';
end;

function TPOSTransactionItem.GetFieldNameFor_DISC_GMC_NOMINAL: string;
begin
  Result := GetFieldPrefix + 'DISC_GMC_NOMINAL';
end;

function TPOSTransactionItem.GetFieldNameFor_ID: string;
begin
//  Result := GetFieldPrefix + 'ID';
  Result := 'TRANSAKSI_DETIL_ID'
end;

function TPOSTransactionItem.GetFieldNameFor_IsBKP: string;
begin
  Result := GetFieldPrefix + 'Is_BKP';
end;

function TPOSTransactionItem.GetFieldNameFor_IsDiscAMC: string;
begin
  Result := GetFieldPrefix + 'brg_is_gmc';
end;

function TPOSTransactionItem.GetFieldNameFor_LastCost: string;
begin
  Result := GetFieldPrefix + 'last_cost';
end;

function TPOSTransactionItem.GetFieldNameFor_NewUnit: string;
begin
//  Result := GetFieldPrefix + 'unt_id';
  Result := 'AUT$UNIT_ID';
end;

//function TPOSTransactionItem.GetFieldNameFor_OPC_UNIT: string;
//begin
//  Result := 'OPC_UNIT';
//end;

//function TPOSTransactionItem.GetFieldNameFor_OPM_UNIT: string;
//begin
//  Result := 'OPM_UNIT';
//end;

function TPOSTransactionItem.GetFieldNameFor_OP_CREATE: string;
begin
  Result := 'OP_CREATE';
end;

function TPOSTransactionItem.GetFieldNameFor_OP_MODIFY: string;
begin
  Result := 'OP_MODIFY';
end;

function TPOSTransactionItem.GetFieldNameFor_PPN: string;
begin
  Result := GetFieldPrefix + 'PPN';
end;

function TPOSTransactionItem.GetFieldNameFor_PPNBM: string;
begin
  Result := GetFieldPrefix + 'PPNBM';
end;

function TPOSTransactionItem.GetFieldNameFor_Qty: string;
begin
  Result := GetFieldPrefix + 'qty';
end;

function TPOSTransactionItem.GetFieldNameFor_SellPrice: string;
begin
  Result := GetFieldPrefix + 'Sell_Price';
end;

function TPOSTransactionItem.GetFieldNameFor_SellPriceDisc: string;
begin
  Result := GetFieldPrefix + 'Sell_Price_Disc';
end;

function TPOSTransactionItem.GetFieldNameFor_TipeBarang: string;
begin
//  Result := GetFieldPrefix + 'tpbrg_id';
  Result := 'REF$TIPE_BARANG_ID';
end;

function TPOSTransactionItem.GetFieldNameFor_Total: string;
begin
  Result := GetFieldPrefix + 'Total';
end;

function TPOSTransactionItem.GetFieldNameFor_TotalBeforeTax: string;
begin
  Result := GetFieldPrefix + 'Total_b4_Tax';
end;

function TPOSTransactionItem.GetFieldNameFor_TotalCeil: string;
begin
  Result := GetFieldPrefix + 'Total_Ceil';
end;

function TPOSTransactionItem.GetFieldNameFor_TransDiscCard: string;
begin
  Result := GetFieldPrefix + 'DISC_CARD';
end;

function TPOSTransactionItem.GetFieldNameFor_TransDiscMan: string;
begin
  Result := GetFieldPrefix + 'DISC_MAN';
end;

function TPOSTransactionItem.GetFieldNameFor_TransID: string;
begin
//  Result := GetFieldPrefix + 'trans_id';
  Result := 'TRANSAKSI_ID'
end;

function TPOSTransactionItem.GetFieldNameFor_TransNo: string;
begin
  Result := GetFieldPrefix + 'Trans_No';
end;

function TPOSTransactionItem.GetFieldNameFor_TransOtoCode: string;
begin
  Result := 'OTO_CODE';
end;

//function TPOSTransactionItem.GetFieldNameFor_TransUnit: string;
//begin
//  Result := GetFieldPrefix + 'trans_unt_id';
//end;

function TPOSTransactionItem.GetFieldNameFor_UomCode: string;
begin
  Result := GetFieldPrefix + 'sat_code';
end;

function TPOSTransactionItem.GetFieldPrefix: string;
begin
  Result := 'transd_';
end;

function TPOSTransactionItem.GetGeneratorName: string;
begin
  Result := 'GEN_' + CustomTableName + '_ID';
end;

function TPOSTransactionItem.GetNewUnit: TUnit;
begin
  if (FNewUnit = Nil) then
  begin
    FNewUnit:= TUnit.Create(Application);
    FNewUnit.LoadByID(FNewUnitID);
  end;
  Result := FNewUnit;
end;

//function TPOSTransactionItem.GetOPC_UNIT: TUnit;
//begin
//  if (FOPC_UNIT = Nil) then
//  begin
//    FOPC_UNIT:= TUnit.Create(Application);
//    FOPC_UNIT.LoadByID(IntToStr(FOPC_UNITID));
//  end;
//  Result := FOPC_UNIT;
//end;

//function TPOSTransactionItem.GetOPM_UNIT: TUnit;
//begin
//  if (FOPM_UNIT = Nil) then
//  begin
//    FOPM_UNIT:= TUnit.Create(Application);
//    FOPM_UNIT.LoadByID(IntToStr(FOPM_UNITID));
//  end;
//  Result := FOPM_UNIT;
//end;

function TPOSTransactionItem.RemoveFromDB: Boolean;
var
  sSQL: string;
begin
  Result := False;
  sSQL := 'delete from ' + CustomTableName
        + ' where ' + GetFieldNameFor_ID + ' = ' + QuotedStr(FID);
//        + ' and ' + GetFieldNameFor_NewUnit + ' = ' + QuotedStr(FNewUnitID);
  if cExecSQL(sSQL,dbtPOS, False) then
    Result := True; //SimpanBlob(sSQL,TPOSTransaction.GetHeaderFlag);
end;

procedure TPOSTransactionItem.SetNewUnit(Value: TUnit);
begin
  FNewUnitID := Value.ID;
end;

//procedure TPOSTransactionItem.SetOPC_UNIT(Value: TUnit);
//begin
//end;

//procedure TPOSTransactionItem.SetOPM_UNIT(Value: TUnit);
//begin
//end;

{
***************************** TPOSTransactionItems *****************************
}
function TPOSTransactionItems.Add: TPOSTransactionItem;
begin
  Result := (inherited Add) as TPOSTransactionItem;
end;

function TPOSTransactionItems.CustomTableName: string;
begin
  Result := 'transaksi_detil';
end;

function TPOSTransactionItems.GetFieldNameFor_Header: string;
begin
//	Result := 'transd_trans_id';
  Result := 'TRANSAKSI_ID'
end;

//function TPOSTransactionItems.GetFieldNameFor_HeaderUNT: string;
//begin
//  Result := 'TRANSD_TRANS_UNT_ID';
//end;

function TPOSTransactionItems.GetPOSTransactionItem(Index: Integer):
        TPOSTransactionItem;
begin
  Result := (Inherited Items[Index]) as TPOSTransactionItem;
end;

procedure TPOSTransactionItems.LoadByHeaderID(aHeader_ID: string);
var
  sSQL: string;
begin
  sSQL := 'Select * '
        + ' from ' + CustomTableName
        + ' where ' + GetFieldNameFor_Header + ' = ' + QuotedStr(aHeader_ID);
//        + ' and ' + GetFieldNameFor_HeaderUNT + ' = ' + IntToStr(aUnitID);
  with cOpenQuery(sSQL) do
  Begin
    self.Clear;
    while not eof do
    begin
      with Self.Add do
      begin
        FBarangHargaJualID := FieldByName(GetFieldNameFor_BarangHargaJual).AsString;
        FCOGS := FieldByName(GetFieldNameFor_COGS).AsFloat;
        FID := FieldByName(GetFieldNameFor_ID).AsString;
        FNewUnitID := FieldByName(GetFieldNameFor_NewUnit).AsString;
        FIsBKP := FieldValues[GetFieldNameFor_IsBKP];
        FIsDiscAMC := FieldValues[GetFieldNameFor_IsDiscAMC];
        FLastCost := FieldByName(GetFieldNameFor_LastCost).AsFloat;
        FPPN := FieldByName(GetFieldNameFor_PPN).AsFloat;
        FPPNBM := FieldByName(GetFieldNameFor_PPNBM).AsFloat;
        FQty := FieldByName(GetFieldNameFor_Qty).AsFloat;
        FSellPrice := FieldByName(GetFieldNameFor_SellPrice).AsFloat;
        FSellPriceDisc := FieldByName(GetFieldNameFor_SellPriceDisc).AsFloat;
        FTotal := FieldByName(GetFieldNameFor_Total).AsFloat;
        FTotalBeforeTax := FieldByName(GetFieldNameFor_TotalBeforeTax).AsFloat;
        FTotalCeil := FieldByName(GetFieldNameFor_TotalCeil).AsFloat;
        FTransNo := FieldByName(GetFieldNameFor_TransNo).AsString;
        FBarangCode := FieldByName(GetFieldNameFor_BarangCode).AsString;
        FDISC_GMC_NOMINAL := FieldByName(GetFieldNameFor_DISC_GMC_NOMINAL).AsFloat;
        FDisc_Card := FieldByName(GetFieldNameFor_TransDiscCard).AsFloat;
        FTipeBarangID := FieldByname(GetFieldNameFor_TipeBarang).AsString;
        FUomCode  := FieldByname(GetFieldNameFor_UomCode).AsString;
      end;
      Next;
    end;
    free;
  End;
end;

procedure TPOSTransactionItems.SetPOSTransactionItem(Index: Integer; Value:
        TPOSTransactionItem);
begin
  Inherited Items[Index] := Value;
end;

{
******************************* TPOSTransaction ********************************
}
constructor TPOSTransaction.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
end;

constructor TPOSTransaction.CreateWithUser(AOwner: TComponent; AUserID: string);
begin
  Create(AOwner);
  OP_MODIFY := AUserID;
end;

destructor TPOSTransaction.Destroy;
begin
  ClearProperties;
  inherited Destroy;
end;

procedure TPOSTransaction.ClearProperties;
begin
  TotalTransaction := 0;
  TotalDiscAMC     := 0;
  TotalPPN         := 0;
  TotalBayar       := 0;
  Pembulat         := 0;
  OP_MODIFY        := '';
  OP_CREATE        := '';
  No               := '';
  MemberID         := '';
  IsActive         := FALSE;
  IsPending        := FALSE;
  ID               := '';
  DiscAMCPersen    := 0;
  DiscAMCNominal   := 0;
  BayarCash        := 0;
  BayarCard        := 0;
  KuponBotolNo     := '';
  TRANS_DISC_CARD  := 0;

  FreeAndNil(FReturNo);
  FreeAndNil(FVoucherNo);
  FreeAndNil(FBeginningBalance);
  FreeAndNil(FNewUnit);
//  FreeAndNil(FOPC_UNIT);
//  FreeAndNil(FOPM_UNIT);
  FreeAndNil(FPOSTransactionItems);

  If Assigned(FTrans_Struk) then FreeAndNil(FTrans_Struk);

  if Q1 <> nil then FreeAndNil(Q1);
  if Q2 <> nil then FreeAndNil(Q2);
end;

function TPOSTransaction.CustomSQLTask: Tstrings;
begin
  result := nil;
end;

function TPOSTransaction.CustomSQLTaskPrior: Tstrings;
begin
  result := nil;
end;

function TPOSTransaction.CustomTableName: string;
begin
  result := 'transaksi';
end;

function TPOSTransaction.FLoadFromDB(aSQL : String): Boolean;
begin
  Result := False;
  State := csNone;
  ClearProperties;
  with cOpenQuery(aSQL) do
  begin
    try
      if not EOF then
      begin
        FBayarCard := FieldByName(GetFieldNameFor_BayarCard).AsFloat;
        FBayarCash := FieldByName(GetFieldNameFor_BayarCash).AsFloat;
        FBeginningBalanceID := FieldByName(GetFieldNameFor_BeginningBalance).AsString;
        FDATE_CREATE := FieldByName(GetFieldNameFor_DATE_CREATE).AsDateTime;
        FDATE_MODIFY := FieldByName(GetFieldNameFor_DATE_MODIFY).AsDateTime;
        FDiscAMCNominal := FieldByName(GetFieldNameFor_DiscAMCNominal).AsFloat;
        FDiscAMCPersen := FieldByName(GetFieldNameFor_DiscAMCPersen).AsFloat;
        FID := FieldByName(GetFieldNameFor_ID).AsString;
        FIsActive := FieldValues[GetFieldNameFor_IsActive];
        FMemberID := FieldByName(GetFieldNameFor_MemberID).AsString;
        FNewUnitID := FieldByName(GetFieldNameFor_NewUnit).AsString;
        FNo := FieldByName(GetFieldNameFor_No).AsString;
//        FOPC_UNITID := FieldByName(GetFieldNameFor_OPC_UNIT).AsInteger;
//        FOPM_UNITID := FieldByName(GetFieldNameFor_OPM_UNIT).AsInteger;
        FOP_CREATE := FieldByName(GetFieldNameFor_OP_CREATE).AsString;
        FOP_MODIFY := FieldByName(GetFieldNameFor_OP_MODIFY).AsString;
        FPembulat := FieldByName(GetFieldNameFor_Pembulat).AsFloat;
        //FPOSTransactionItems.Clear;
        //FPOSTransactionItems.LoadByID(FieldValues['ID'] );
        FTanggal := FieldByName(GetFieldNameFor_Tanggal).AsDateTime;
        FTotalBayar := FieldByName(GetFieldNameFor_TotalBayar).AsFloat;
        FTotalDiscAMC := FieldByName(GetFieldNameFor_TotalDiscAMC).AsFloat;
        FTotalPPN     := FieldByName(GetFieldNameFor_TotalPPN).AsFloat;
        FTotalTransaction := FieldByName(GetFieldNameFor_TotalTransaction).AsFloat;
        FIsPending := FieldValues[GetFieldNameFor_IsPending];
        FTRANS_DISC_CARD := FieldByName(GetFieldNameFor_TransCardDisc).AsFloat;
//        FTrans_Struk := FieldByName(GetFieldNameFor_TransStruk).AsBlob;

        Self.State := csLoaded;
        Result := True;
      end;
    finally
      Free;
    end;
  End;
end;

function TPOSTransaction.GenerateInterbaseMetaData: TStrings;
begin
  Result := TStringList.Create;
  Result.Append( '' );
  Result.Append( 'Create Table ''+ CustomTableName +'' ( ' );
  Result.Append( 'TRMSBaseClass_ID Integer not null, ' );
  Result.Append( 'BayarCard   double precision Not Null , ' );
  Result.Append( 'BayarCash   double precision Not Null , ' );
  Result.Append( 'BeginningBalance_ID Integer Not Null, ' );
  Result.Append( 'DATE_CREATE   Date Not Null , ' );
  Result.Append( 'DATE_MODIFY   Date Not Null , ' );
  Result.Append( 'DiscAMCNominal   double precision Not Null , ' );
  Result.Append( 'DiscAMCPersen   double precision Not Null , ' );
  Result.Append( 'ID   Integer Not Null  Unique, ' );
  Result.Append( 'IsActive   Boolean Not Null , ' );
  Result.Append( 'IsPending   Boolean Not Null , ' );
  Result.Append( 'MemberID   Integer Not Null , ' );
  Result.Append( 'NewUnit_ID Integer Not Null, ' );
  Result.Append( 'No   Varchar(30) Not Null , ' );
  Result.Append( 'OPC_UNIT_ID Integer Not Null, ' );
  Result.Append( 'OPM_UNIT_ID Integer Not Null, ' );
  Result.Append( 'OP_CREATE   Integer Not Null , ' );
  Result.Append( 'OP_MODIFY   Integer Not Null , ' );
  Result.Append( 'Pembulat   double precision Not Null , ' );
  Result.Append( 'Tanggal   Date Not Null , ' );
  Result.Append( 'TotalBayar   double precision Not Null , ' );
  Result.Append( 'TotalDiscAMC   double precision Not Null , ' );
  Result.Append( 'TotalTransaction   double precision Not Null , ' );
  Result.Append( 'Stamp TimeStamp ' );
  Result.Append( ' ); ' );
end;

function TPOSTransaction.GenerateJurnal(aRumus : String; aMultiPurpose :
    Integer; aUnitID : Integer; aFlagRumus : Integer; aTipe : Integer; aRekCode
    : String): Double;
begin

  Result := 0;

  if aFlagRumus = 0 then
    Result := GetNominalKasBank

  else if aFlagRumus = 1 then
    Result := 0

  else if aFlagRumus = 2 then
    Result := GetNominalPiutangVoucher

  else if aFlagRumus = 3 then
    Result := 0

  else if aFlagRumus = 4 then
  begin
    if aRekCode = '1120206000' then
      Result := GetNominalCashBack(aRekCode)
    else
      Result := GetNominalCard(aRekCode)
  end

  else if aFlagRumus = 5 then
    Result := GetNominalKuponBotol

  else if aFlagRumus = 6 then
    Result := GetNominalDiscountGMC('')

  else if aFlagRumus = 7 then
    Result := GetNominalPembulatan

  else if aFlagRumus = 8 then
    Result := GetNominalPPN

  else if aFlagRumus = 9 then
    Result := GetPenjualanBarang(aMultiPurpose, aUnitID, aTipe)

  else if aFlagRumus = 10 then
    Result := GetPenjualanBarang(aMultiPurpose, aUnitID, aTipe)

  else if aFlagRumus = 11 then
    Result := GetNominalCharge;

end;

function TPOSTransaction.GenerateJurnalHPP(aRumus : String; aMultiPurpose :
    Integer; aUnitID : Integer; aFlagRumus : Integer; aTipe : Integer): Double;
begin
  Result := 0;
  if (aFlagRumus = 0) then
    Result := GetPenjualanBarang(aMultiPurpose, aUnitID, aTipe)
  else if (aFlagRumus = 1) then
    Result := GetHPPdanPersediaanBarang(aMultiPurpose, aUnitID, aTipe);
end;

function TPOSTransaction.GenerateSQL(ARepeatCount: Integer = 1): TStrings;
var
  sSQL: string;
//  i: Integer;
  ssSQL: TStrings;
  sPrec : String;
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
  If FID = '' then
  begin
    //Generate Insert SQL
    OP_CREATE := OP_MODIFY;
    DATE_CREATE := DATE_MODIFY;
//    FOPC_UNITID := FOPM_UNITID;
//    FID := cGetNextID(GetFieldNameFor_ID, CustomTableName);
    FID := cGetNextIDGUIDToString;
    sSQL := 'insert into ' + CustomTableName + ' ('
      + GetFieldNameFor_BayarCard + ', '
      + GetFieldNameFor_BayarCash + ', '
      + GetFieldNameFor_BeginningBalance + ', '
//      + GetFieldNameFor_BeginningBalanceUnit + ', '
//      + GetFieldNameFor_DATE_CREATE + ', '
      + GetFieldNameFor_DiscAMCNominal + ', '
      + GetFieldNameFor_DiscAMCPersen + ', '
      + GetFieldNameFor_ID + ', '
      + GetFieldNameFor_IsActive + ', '
      + GetFieldNameFor_IsPending + ', '
      + GetFieldNameFor_MemberID + ', '
//      + GetFieldNameFor_MemberUnit + ', '
      + GetFieldNameFor_NewUnit + ', '
      + GetFieldNameFor_No + ', '
//      + GetFieldNameFor_OPC_UNIT + ', '
      + GetFieldNameFor_OP_CREATE + ', '
      + GetFieldNameFor_Pembulat + ', '
      + GetFieldNameFor_Tanggal + ', '
      + GetFieldNameFor_TotalBayar + ', '
      + GetFieldNameFor_TotalDiscAMC + ', '
      + GetFieldNameFor_TotalPPN + ', '
      + GetFieldNameFor_TransCardDisc + ', '
      + GetFieldNameFor_TotalTransaction + ') values ('
      + FormatFloat(sPrec, FBayarCard) + ', '
      + FormatFloat(sPrec, FBayarCash) + ', '
      + QuotedStr(FBeginningBalanceID) + ', '
//      + QuotedStr(FNewUnitID) + ', '
//      + QuotDT(FDATE_CREATE) + ', '
      + FormatFloat(sPrec, FDiscAMCNominal) + ', '
      + FormatFloat('0.00', FDiscAMCPersen) + ', '
      + QuotedStr(FID) + ', '
      + IfThen(FIsActive,'1','0') + ', '
      + IfThen(FIsPending,'1','0') + ', '
      + QuotedStr(FMemberID) + ', '
//      + QuotedStr(FNewUnitID) + ', '
      + QuotedStr(FNewUnitID) + ', '
      + QuotedStr(FNo) + ', '
//      + InttoStr(FOPC_UNITID) + ', '
      + QuotedStr(FOP_CREATE) + ', '
      + FormatFloat(sPrec, FPembulat) + ', '
      + TAppUtils.QuotDT(FTanggal) + ', '
      + FormatFloat(sPrec, FTotalBayar) + ', '
      + FormatFloat(sPrec, FTotalDiscAMC) + ', '
      + FormatFloat(sPrec, FTotalPPN) + ', '
      + FormatFloat(sPrec, FTRANS_DISC_CARD) + ', '
      + FormatFloat(sPrec, FTotalTransaction) + ');';
    Result.Append(sSQL);

    sSQL := 'update setuppos '
      + ' set setuppos_counter_no = ' + IntToStr(BeginningBalance.POS.CounterNo + 1)
      + ' where setuppos_id = ' + QuotedStr(BeginningBalance.POS.ID)
      + ' and AUT$UNIT_ID = ' + QuotedStr(FNewUnitID) + ';';
    Result.Append(sSQL);
  end
  else
  begin
    //generate Update SQL
    sSQL := 'update ' + CustomTableName + ' set '
      + GetFieldNameFor_BayarCard + ' = ' + FormatFloat(sPrec, FBayarCard)
      + ', ' + GetFieldNameFor_BayarCash + ' = ' + FormatFloat(sPrec, FBayarCash)
      + ', ' + GetFieldNameFor_BeginningBalance + ' = ' + QuotedStr(FBeginningBalanceID)
//      + ', ' + GetFieldNameFor_BeginningBalanceUnit + ' = ' + QuotedStr(FNewUnitID)
      + ', ' + GetFieldNameFor_DATE_MODIFY + ' = ' + TAppUtils.QuotDT(FDATE_MODIFY)
      + ', ' + GetFieldNameFor_DiscAMCNominal + ' = ' + FormatFloat(sPrec, FDiscAMCNominal)
      + ', ' + GetFieldNameFor_DiscAMCPersen + ' = ' + FormatFloat('0.00', FDiscAMCPersen)
      + ', ' + GetFieldNameFor_IsActive + ' = ' + IfThen(FIsActive,'1','0')
      + ', ' + GetFieldNameFor_IsPending + ' = ' + IfThen(FIsPending,'1','0')
      + ', ' + GetFieldNameFor_MemberID + ' = ' + QuotedStr(FMemberID)
//      + ', ' + GetFieldNameFor_MemberUnit + ' = ' + QuotedStr(FNewUnitID)
      + ', ' + GetFieldNameFor_NewUnit + ' = ' + QuotedStr(FNewUnitID)
      + ', ' + GetFieldNameFor_No + ' = ' + QuotedStr(FNo)
//      + ', ' + GetFieldNameFor_OPM_UNIT + ' = ' + IntToStr(FOPM_UNITID)
      + ', ' + GetFieldNameFor_OP_MODIFY + ' = ' + QuotedStr(FOP_MODIFY)
      + ', ' + GetFieldNameFor_Pembulat + ' = ' + FormatFloat(sPrec, FPembulat)
      + ', ' + GetFieldNameFor_Tanggal + ' = ' + TAppUtils.QuotDT(FTanggal)
      + ', ' + GetFieldNameFor_TotalBayar + ' = ' + FormatFloat(sPrec, FTotalBayar)
      + ', ' + GetFieldNameFor_TotalDiscAMC + ' = ' + FormatFloat(sPrec, FTotalDiscAMC)
      + ', ' + GetFieldNameFor_TotalPPN + ' = ' + FormatFloat(sPrec, FTotalPPN)
      + ', ' + GetFieldNameFor_TotalTransaction + ' = ' + FormatFloat(sPrec, FTotalTransaction)
      + ', ' + GetFieldNameFor_TransCardDisc + ' = ' + FormatFloat(sPrec, FTRANS_DISC_CARD)
      + ' where ' + GetFieldNameFor_ID + ' = ' + QuotedStr(FID)
      + ' and ' + GetFieldNameFor_NewUnit + ' = ' + QuotedStr(FNewUnitID) + ';';

    Result.Append(sSQL);
  end;

  //generating Collections SQL
  Result.AddStrings(GenerateSQL_TransactionItems(POSTransactionItems));
//  for i := 0 to POSTransactionItems.Count - 1 do
//  begin
//    Result.AddStrings(POSTransactionItems[i].GenerateSQL(FID));
//  end;

  ssSQL := CustomSQLTask;
  if ssSQL <> nil then
  begin
    Result.AddStrings(ssSQL);
  end;

  FreeAndNil(ssSQL)
end;

{
******************************** TCodeTemplate *********************************
}
function TPOSTransaction.GenerateSQL_TransactionItems(aPOSTransactionItems:
    TPOSTransactionItems): TStrings;
var
  isRemove: Boolean;
  h: Integer;
  i: Integer;
  aTempPOSTransactionItems: TPOSTransactionItems;
begin
  Result := TStringList.Create;
  aTempPOSTransactionItems:= TPOSTransactionItems.Create(TPOSTransactionItem);
  Try
    if (aPOSTransactionItems = nil) then exit;

    if (aPOSTransactionItems.Count = 0) then
    Begin
      exit;
    end;
    aTempPOSTransactionItems.Clear;
    aTempPOSTransactionItems.LoadByHeaderID(ID); //
    for h:= 0 to aTempPOSTransactionItems.Count - 1 do
    begin
      isRemove:= True;
      for i:= 0 to aPOSTransactionItems.Count - 1 do
      begin
        if (aTempPOSTransactionItems[h].ID = aPOSTransactionItems[i].ID) then
        begin
          isRemove:= False;
          Break;
        end;
      end;
      if isRemove then
      begin
        Result.AddStrings(aTempPOSTransactionItems[h].GenerateRemoveSQL);
      end;
    end;

    for i := 0 to aPOSTransactionItems.Count - 1 do
    begin
      Result.AddStrings(aPOSTransactionItems[i].GenerateSQL(ID));
    end;
  finally
    aTempPOSTransactionItems.Free;
  end;
end;

function TPOSTransaction.GetBarangStockSirkulasi: TBArangStockSirkulasiItems;
begin
  try
    if FBarangStockSirkulasi = nil then
    begin
      FBarangStockSirkulasi := TBarangStockSirkulasiItems.Create(TBarangStockSirkulasiItem);
      FBarangStockSirkulasi.Clear;
      FBarangStockSirkulasi.LoadByNoBukti(FNo, StrToInt(FNewUnitID), GetHeaderFlag);
    end;
  finally
    Result := FBarangStockSirkulasi;
  end;
end;

function TPOSTransaction.GetBeginningBalance: TBeginningBalance;
begin
//  Result := nil;
  if FBeginningBalance = nil then
  begin
    FBeginningBalance := TBeginningBalance.Create(Self);
    FBeginningBalance.LoadByID(FBeginningBalanceID,FNewUnitID);
  end;
  Result := FBeginningBalance;
end;

function TPOSTransaction.GetFieldNameFor_BayarCard: string;
begin
  Result := GetFieldPrefix + 'bayar_card';
end;

function TPOSTransaction.GetFieldNameFor_BayarCash: string;
begin
  Result := GetFieldPrefix + 'bayar_cash';
end;

function TPOSTransaction.GetFieldNameFor_BeginningBalance: string;
begin
//  Result := GetFieldPrefix + 'balance_id';
  Result := 'BEGINNING_BALANCE_ID';
end;

//function TPOSTransaction.GetFieldNameFor_BeginningBalanceUnit: string;
//begin
//  Result := GetFieldPrefix + 'balance_unt_id';
//end;

function TPOSTransaction.GetFieldNameFor_DATE_CREATE: string;
begin
  Result := 'DATE_CREATE';
end;

function TPOSTransaction.GetFieldNameFor_DATE_MODIFY: string;
begin
  Result := 'DATE_MODIFY';
end;

function TPOSTransaction.GetFieldNameFor_DiscAMCNominal: string;
begin
  Result := GetFieldPrefix + 'disc_gmc_nominal';
end;

function TPOSTransaction.GetFieldNameFor_DiscAMCPersen: string;
begin
  Result := GetFieldPrefix + 'disc_gmc_persen';
end;

function TPOSTransaction.GetFieldNameFor_ID: string;
begin
//  Result := GetFieldPrefix + 'ID';
  Result := 'TRANSAKSI_ID';
end;

function TPOSTransaction.GetFieldNameFor_IsActive: string;
begin
  Result := GetFieldPrefix + 'is_active';
end;

function TPOSTransaction.GetFieldNameFor_IsPending: string;
begin
  Result := GetFieldPrefix + 'is_pending';
end;

function TPOSTransaction.GetFieldNameFor_KuponBotolNo: string;
begin
  Result := 'tkb_no';
end;

function TPOSTransaction.GetFieldNameFor_KuponBotolStatus: string;
begin
  Result := 'tkb_status';
end;

function TPOSTransaction.GetFieldNameFor_KuponBotolTransPOS: string;
begin
  Result := 'tkb_pos_trans_no';
end;

function TPOSTransaction.GetFieldNameFor_KuponBotolUnit: string;
begin
  Result := 'tkb_unt_id';
end;

function TPOSTransaction.GetFieldNameFor_MemberID: string;
begin
//  Result := GetFieldPrefix + 'member_id';
  Result := 'MEMBER_ID';
end;

//function TPOSTransaction.GetFieldNameFor_MemberUnit: string;
//begin
//  Result := GetFieldPrefix + 'member_unt_id';
//end;

function TPOSTransaction.GetFieldNameFor_NewUnit: string;
begin
//  Result := GetFieldPrefix + 'UNT_ID';
  Result := 'AUT$UNIT_ID';
end;

function TPOSTransaction.GetFieldNameFor_No: string;
begin
  Result := GetFieldPrefix + 'No';
end;

//function TPOSTransaction.GetFieldNameFor_OPC_UNIT: string;
//begin
//  Result := 'OPC_UNIT';
//end;

//function TPOSTransaction.GetFieldNameFor_OPM_UNIT: string;
//begin
//  Result := 'OPM_UNIT';
//end;

function TPOSTransaction.GetFieldNameFor_OP_CREATE: string;
begin
  Result := 'OP_CREATE';
end;

function TPOSTransaction.GetFieldNameFor_OP_MODIFY: string;
begin
  Result := 'OP_MODIFY';
end;

function TPOSTransaction.GetFieldNameFor_Pembulat: string;
begin
  Result := GetFieldPrefix + 'pembulat';
end;

function TPOSTransaction.GetFieldNameFor_POSTransactionItems: string;
begin
  Result := GetFieldPrefix + 'POSTransactionItems_ID';
end;

function TPOSTransaction.GetFieldNameFor_ReturNo: string;
begin
  Result := 'TRANSRET_NO';
end;

function TPOSTransaction.GetFieldNameFor_ReturTransPOS: string;
begin
  Result := 'TRANSRET_POS_TRANS_NO';
end;

function TPOSTransaction.GetFieldNameFor_ReturUnit: string;
begin
  Result := 'TRANSRET_UNT_ID';
end;

function TPOSTransaction.GetFieldNameFor_Tanggal: string;
begin
  Result := GetFieldPrefix + 'date';
end;

function TPOSTransaction.GetFieldNameFor_TotalBayar: string;
begin
  Result := GetFieldPrefix + 'total_bayar';
end;

function TPOSTransaction.GetFieldNameFor_TotalDiscAMC: string;
begin
  Result := GetFieldPrefix + 'total_disc_gmc';
end;

function TPOSTransaction.GetFieldNameFor_TotalPPN: string;
begin
  Result := GetFieldPrefix + 'TOTAL_PPN';
end;

function TPOSTransaction.GetFieldNameFor_TotalTransaction: string;
begin
  Result := GetFieldPrefix + 'total_transaction';
end;

function TPOSTransaction.GetFieldNameFor_TransCardDisc: string;
begin
  Result := GetFieldPrefix + 'DISC_CARD';
end;

function TPOSTransaction.GetFieldNameFor_TransStruk: string;
begin
  Result := GetFieldPrefix + 'STRUK';;
end;

function TPOSTransaction.GetFieldNameFor_VoucherNo: string;
begin
  Result := 'vcrd_no';
end;

function TPOSTransaction.GetFieldNameFor_VoucherStatus: string;
begin
  Result := 'vcrd_status';
end;

function TPOSTransaction.GetFieldNameFor_VoucherTransPOS: string;
begin
  Result := 'vcrd_pos_trans_no';
end;

function TPOSTransaction.GetFieldNameFor_VoucherUnit: string;
begin
//  Result := 'vcrd_vcr_unt_id';
  Result := 'AUT$UNIT_ID';
end;

function TPOSTransaction.GetFieldPrefix: string;
begin
  Result := 'trans_';
end;

function TPOSTransaction.GetGeneratorName: string;
begin
  Result := 'GEN_' + CustomTableName + '_ID';
end;

class function TPOSTransaction.GetHeaderFlag: Integer;
begin
  result := 4930;
end;

function TPOSTransaction.GetHPPdanPersediaanBarang(aMerchandizeGroupID :
    Integer; aUnitID : Integer; aTipe : Integer): Double;
begin
  Result := 0;

  Q1.First;
  while not Q1.Eof do
  begin
    if (Q1.FieldByName('MERCHANGRUP_ID').AsInteger = aMerchandizeGroupID) and
       (Q1.FieldByName('TRANSD_UNT_ID').AsInteger = aUnitID) then
    begin
      if (aTipe = 1) then
      begin
        if (Q1.FieldByName('TRANSD_TPBRG_ID').AsInteger in [1, 4, 6, 7]) then
        begin
          Result := Result + (Q1.FieldByName('BSS_HARGA_TRANSAKSI').AsFloat * Q1.FieldByName('TRANSD_QTY').AsFloat);
        end;
      end
      else
      begin
        if aMerchandizeGroupID = 33 then
        begin
          if (Q1.FieldByName('TRANSD_TPBRG_ID').AsInteger = aTipe) then
          begin
            Result := Result + (Q1.FieldByName('BSS_HARGA_TRANSAKSI').AsFloat * Q1.FieldByName('TRANSD_QTY').AsFloat);
          end;
        end
        else
        begin
          if (Q1.FieldByName('TRANSD_TPBRG_ID').AsInteger in [2, 3])  then
          begin
            Result := Result + (Q1.FieldByName('BSS_HARGA_TRANSAKSI').AsFloat * Q1.FieldByName('TRANSD_QTY').AsFloat);
          end;
        end;
      end;
      Result := RoundTo(Result, -2);

    end;
    Q1.Next;
  end;
end;

procedure TPOSTransaction.GetMember(var aKodeMember: String; var aNamaMember :
    String);
var
  sSQL: string;
begin
  sSQL := 'select member_card_no, member_name '
          + ' from member'
          + ' where member_id = ' + QuotedStr(MemberID);
//          + ' and member_unt_id = ' + IntToStr(FNewUnitID);

  with cOpenQuery(sSQL) do
  begin
    try
      while not eof do
      begin
        aKodeMember := FieldByName('member_card_no').AsString;
        aNamaMember := FieldByName('member_name').AsString;

        Next;
      end;
    finally
      Free;
    end;
  end;

end;

function TPOSTransaction.GetNewUnit: TUnit;
begin
  if FNewUnit = nil then
  begin
    FNewUnit := TUnit.Create(Self);
    FNewUnit.LoadByID(FNewUnitID);
  end;
  Result := FNewUnit;
end;

function TPOSTransaction.GetNominalCard(aRekCode : String): Double;
begin
  Result := 0;
  Q2.First;
  while not Q2.eof do
  begin
    if Q2.FieldByName('CARD_REK_CODE').AsString = aRekCode then
    begin
      Result := Result + Q2.FieldByName('TRANS_BAYAR_CARD').AsFloat + Q2.FieldByName('TRANS_DISC_CARD').AsFloat;
    end;

    Q2.Next;
  end;
end;

function TPOSTransaction.GetNominalCashBack(aRekCode : String): Double;
begin
  Result := 0;
  Q2.First;
  while not Q2.eof do
  begin
    if Q2.FieldByName('CARD_REK_CASH_BACK').AsString = aRekCode then
    begin
      Result := Result + Q2.FieldByName('TRANSC_CASHBACK_NILAI').AsFloat;
    end;

    Q2.Next;
  end;
end;

function TPOSTransaction.GetNominalCharge: Double;
begin
  Result := 0;
  Q2.First;
  while not Q2.eof do
  begin
    Result := Result + Q2.FieldByName('TRANSC_CHARGE').AsFloat;
    Q2.Next;
  end;
end;

function TPOSTransaction.GetNominalDiscountGMC(aNoBukti : String): Double;
begin
  Result := 0;
  Q1.First;
  while not Q1.eof do
  begin
    if aNoBukti = '' then
      Result := Result + (Q1.FieldByName('TRANSD_DISC_GMC_NOMINAL').AsFloat * Q1.FieldByName('TRANSD_QTY').AsFloat)
    else
    begin
      if aNoBukti = Q1.FieldByName('TRANS_NO').AsString then
        Result := Result + (Q1.FieldByName('TRANSD_DISC_GMC_NOMINAL').AsFloat * Q1.FieldByName('TRANSD_QTY').AsFloat)
    end;

    Q1.Next;
  end;
end;

function TPOSTransaction.GetNominalKasBank: Double;
begin
  Result := 0;

  Q2.First;
  while not Q2.Eof do
  begin
    Result := Result + (Q2.FieldByName('TRANS_BAYAR_CASH').AsFloat - Q2.FieldByName('TRANSC_CASHBACK_NILAI').AsFloat);

    Q2.Next;
  end;
end;

function TPOSTransaction.GetNominalKuponBotol: Double;
begin
  Result := 0;
  Q2.First;
  while not Q2.eof do
  begin
    Result := Result + Q2.FieldByName('TKB_SELL_PRICE_DISC').AsFloat;

    Q2.Next;
  end;
end;

function TPOSTransaction.GetNominalPembulatan: Double;
var
  dPembulatan1: Double;
  dPembulatan2: Double;
  dSubTotal: Double;
begin
  Result := 0;
  Q2.First;
  while not Q2.eof do
  begin
    dSubTotal    := Q2.FieldByName('TRANS_TOTAL_TRANSACTION').AsFloat;
    dPembulatan1 := RoundTo(dSubTotal - GetNominalTransaction(Q2.FieldByName('TRANS_NO').AsString), -2);
    dPembulatan1 := dPembulatan1 + dSubTotal - Ceil(dSubTotal);

    dPembulatan2 := GetNominalDiscountGMC(Q2.FieldByName('TRANS_NO').AsString) - Q2.FieldByName('TRANS_DISC_GMC_NOMINAL').AsFloat;
    Result       := Result + (dPembulatan2 - dPembulatan1) + Q2.FieldByName('TRANS_PEMBULAT').AsFloat;
    //Result := Result + Q2.FieldByName('TRANS_PEMBULAT').AsFloat;

    Q2.Next;
  end;
end;

function TPOSTransaction.GetNominalPiutangVoucher: Double;
begin
  Result := 0;
  Q2.First;
  while not Q2.eof do
  begin
    Result := Result + Q2.FieldByName('VCRD_NOMINAL').AsFloat;

    Q2.Next;
  end;
end;

function TPOSTransaction.GetNominalPPN: Double;
var
  dNominal: Double;
begin
  Result := 0;

  {Q2.First;
  while not Q2.Eof do
  begin
    Result := Result + Q2.FieldByName('TRANS_TOTAL_PPN').AsFloat;

    Q2.Next;
  end;}

  Q1.First;
  while not Q1.Eof do
  begin
    dNominal := Q1.FieldByName('TRANSD_SELL_PRICE_DISC').AsFloat * Q1.FieldByName('TRANSD_QTY').AsFloat;
    dNominal := (dNominal * Q1.FieldByName('TRANSD_PPN').AsFloat) / (Q1.FieldByName('TRANSD_PPN').AsFloat + 100);
    Result := Result + RoundTo(dNominal, -2);
    Q1.Next;
  end;

end;

function TPOSTransaction.GetNominalTransaction(aNoBukti : String): Double;
begin
  Result := 0;
  Q1.First;
  while not Q1.eof do
  begin
    if aNoBukti = '' then
      Result := Result + (Q1.FieldByName('TRANSD_SELL_PRICE_DISC').AsFloat * Q1.FieldByName('TRANSD_QTY').AsFloat)
    else
    begin
      if aNoBukti = Q1.FieldByName('TRANS_NO').AsString then
        Result := Result + (Q1.FieldByName('TRANSD_SELL_PRICE_DISC').AsFloat * Q1.FieldByName('TRANSD_QTY').AsFloat);
    end;

    Q1.Next;
  end;
end;

function TPOSTransaction.GetNoTransaksi: string;
begin
  Result := '';
  Q2.First;
  if not Q2.Eof then Result := Q2.FieldByName('TRANS_NO').AsString;

end;

//function TPOSTransaction.GetOPC_UNIT: TUnit;
//begin
//  if FOPC_UNIT = nil then
//  begin
//    FOPC_UNIT := TUnit.Create(Self);
//    FOPC_UNIT.LoadByID(FOPC_UNITID);
//  end;
//  Result := FOPC_UNIT;
//end;

//function TPOSTransaction.GetOPM_UNIT: TUnit;
//begin
//  if FOPM_UNIT = nil then
//  begin
//    FOPM_UNIT := TUnit.Create(Self);
//    FOPM_UNIT.LoadByID(FOPM_UNITID);
//  end;
//  Result := FOPM_UNIT;
//end;

function TPOSTransaction.GetPenjualanBarang(aMerchandizeGroupID : Integer;
    aUnitID : Integer; aTipe : Integer): Double;
var
  dPPn: Double;
  //dNominalStlhDisc: Double;
  dNominal: Double;
begin
  Result := 0;

  Q1.First;
  while not Q1.Eof do
  begin
    dNominal := 0;
    dPPn     := 0;
    if (Q1.FieldByName('MERCHANGRUP_ID').AsInteger = aMerchandizeGroupID) and
       (Q1.FieldByName('TRANSD_UNT_ID').AsInteger = aUnitID) then
    begin
      if (aTipe = 1) then
      begin
        if (Q1.FieldByName('TRANSD_TPBRG_ID').AsInteger in [1, 4, 6, 7]) then
        begin
          dNominal := Q1.FieldByName('TRANSD_SELL_PRICE_DISC').AsFloat * Q1.FieldByName('TRANSD_QTY').AsFloat;
          //dNominalStlhDisc := (Q1.FieldByName('TRANSD_SELL_PRICE_DISC').AsFloat - Q1.FieldByName('TRANSD_DISC_GMC_NOMINAL').AsFloat) * Q1.FieldByName('TRANSD_QTY').AsFloat;
          dPPn := (dNominal * Q1.FieldByName('TRANSD_PPN').AsFloat) / (100 + Q1.FieldByName('TRANSD_PPN').AsFloat);
        end;
      end
      else
      begin
        if aMerchandizeGroupID = 33 then
        begin
          if (Q1.FieldByName('TRANSD_TPBRG_ID').AsInteger = aTipe) then
          begin
            dNominal := Q1.FieldByName('TRANSD_SELL_PRICE_DISC').AsFloat * Q1.FieldByName('TRANSD_QTY').AsFloat;
            //dNominalStlhDisc := (Q1.FieldByName('TRANSD_SELL_PRICE_DISC').AsFloat - Q1.FieldByName('TRANSD_DISC_GMC_NOMINAL').AsFloat) * Q1.FieldByName('TRANSD_QTY').AsFloat;
            dPPn := (dNominal * Q1.FieldByName('TRANSD_PPN').AsFloat) / (100 + Q1.FieldByName('TRANSD_PPN').AsFloat);
          end;
        end
        else
        begin
          if (Q1.FieldByName('TRANSD_TPBRG_ID').AsInteger in [2, 3]) then
          begin
            dNominal := Q1.FieldByName('TRANSD_SELL_PRICE_DISC').AsFloat * Q1.FieldByName('TRANSD_QTY').AsFloat;
            //dNominalStlhDisc := (Q1.FieldByName('TRANSD_SELL_PRICE_DISC').AsFloat - Q1.FieldByName('TRANSD_DISC_GMC_NOMINAL').AsFloat) * Q1.FieldByName('TRANSD_QTY').AsFloat;
            dPPn := (dNominal * Q1.FieldByName('TRANSD_PPN').AsFloat) / (100 + Q1.FieldByName('TRANSD_PPN').AsFloat);
          end;

        end;
      end;
      dPPn := RoundTo(dPPn, -2);

      dNominal := dNominal - dPPn;
      Result := Result + dNominal;
    end;

    Q1.Next;
  end;

end;

function TPOSTransaction.GetPlannedID: string;
begin
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

function TPOSTransaction.GetPOSTransactionItems: TPOSTransactionItems;
begin
  if FPOSTransactionItems = nil then
  begin
    FPOSTransactionItems := TPOSTransactionItems.Create(TPOSTransactionItem);
    FPOSTransactionItems.clear;
    FPOSTransactionItems.LoadByHeaderID(ID);
  end;
  Result := FPOSTransactionItems;
end;

function TPOSTransaction.GetReturNo: TStrings;
begin
  if FReturNo = nil then
  begin
    FReturNo := TStringList.Create;
  end;

  Result := FReturNo;
end;

function TPOSTransaction.GetTableNameFor_KuponBotol: string;
begin
  Result := 'trans_kupon_botol';
end;

function TPOSTransaction.GetTableNameFor_Retur: string;
begin
  Result := 'TRANSAKSI_RETUR_NOTA';
end;

function TPOSTransaction.GetTableNameFor_Voucher: string;
begin
  Result := 'voucher_detil';
end;

function TPOSTransaction.GetTransactionCard: TPOSTransactionCard;
begin
  if FTransactionCard = nil then
  begin
    FTransactionCard := TPOSTransactionCard.Create(Self);
    FTransactionCard.LoadByTransNo(No,FNewUnitID);
  end;
  Result := FTransactionCard;
end;

function TPOSTransaction.GetTransactionDate: TDateTime;
begin
  Result := 0;
  Q2.First;
  if not Q2.Eof then Result := Q2.FieldByName('TRANS_DATE').AsDateTime;
end;

function TPOSTransaction.GetTrans_Struk: TSTrings;
var
  lStream: TStream;
  S: string;
begin
  If not Assigned(FTrans_Struk) then
  begin
    S := 'Select ' + GetFieldNameFor_TransStruk + ' from '
        + CustomTableName + ' where ' + GetFieldNameFor_ID
        + ' = ' + QuotedStr(Self.ID);

    with cOpenQuery(s) do
    begin
      Try
        If not eof then
        begin
          If not Fields[0].IsNull then
          begin
            FTrans_Struk := TStringList.Create;
            lStream := CreateBlobStream(Fields[0], bmRead);
            Try
              FTrans_Struk.LoadFromStream(lStream);
            Finally
              lStream.Free;
            end;
          end;
        end;
      Finally
        free;
      end;

    end;
  end;

  Result := FTrans_Struk;
end;

function TPOSTransaction.GetVoucherLains: TVoucherLainItems;
begin
  if FVoucherLains = nil then
  begin
    FVoucherLains := TVoucherLainItems.Create(TVoucherLainItem);
  end;

  Result := FVoucherLains;
end;

function TPOSTransaction.GetVoucherNo: TStrings;
begin
  if FVoucherNo = nil then
  begin
    FVoucherNo := TStringList.Create;
  end;

  Result := FVoucherNo;
end;

function TPOSTransaction.IsBalanceUsed(aBalance_ID, aUnitID: string): Boolean;
var
  sSQL: string;
begin
  Result := False;
  sSQL := 'select count(' + GetFieldNameFor_BeginningBalance + ') as jml '
        + ' from ' + CustomTableName
        + ' where ' + GetFieldNameFor_BeginningBalance + ' = ' + QuotedStr(aBalance_ID) + ';';
//        + ' and ' + GetFieldNameFor_BeginningBalanceUnit + ' = ' + QuotedStr(AUnitID) + ';';

  with cOpenQuery(sSQL) do
  begin
    try
      if not EOF then
      begin
        if FieldByName('jml').AsInteger > 0 then
          Result := True;
      end;
    finally
      Free;
    end;
  End;
end;

function TPOSTransaction.LoadByID(AID : Integer; AUnitID: Integer): Boolean;
var
  sSQL: string;
begin
  sSQL := 'select * from ' + CustomTableName
    + ' where ' + GetFieldNameFor_ID + ' = ' + IntToStr(AID)
    + ' and ' + GetFieldNameFor_NewUnit + ' = ' + IntToStr(AUnitID);
  Result := FloadFromDB(sSQL);
end;

function TPOSTransaction.LoadByTrans_No(aTransNo, aUnitID: String): Boolean;
var
  sSQL: string;
begin
  sSQL := 'select * from ' + CustomTableName
    + ' where ' + GetFieldNameFor_No + ' = ' + QuotedStr(aTransNo)
    + ' and ' + GetFieldNameFor_NewUnit + ' = ' + QuotedStr(AUnitID) + ';';
  Result := FloadFromDB(sSQL);
end;

function TPOSTransaction.LoadDataJurnal(aDate1 : TDateTime; aDate2 : TDateTime;
    aUnitID : Integer): Boolean;
var
  s: string;
begin
  Result := False;

  Q1 := TFDQuery.Create(nil);

  s := 'Select a.TRANS_NO, d.MERCHANGRUP_ID, b.TRANSD_UNT_ID, b.TRANSD_TPBRG_ID, '
     + ' b.TRANSD_SELL_PRICE_DISC, b.TRANSD_QTY, b.TRANSD_PPN, g.BSS_HARGA_TRANSAKSI, b.TRANSD_DISC_GMC_NOMINAL,'
     + ' b.TRANSD_TOTAL, b.TRANSD_TOTAL_B4_TAX'
     + ' FROM TRANSAKSI a'
     + ' INNER JOIN TRANSAKSI_DETIL b ON a.TRANS_NO = b.TRANSD_TRANS_NO AND a.TRANS_UNT_ID = b.TRANSD_TRANS_UNT_ID'
     + ' INNER JOIN BARANG_HARGA_JUAL f ON b.TRANSD_BHJ_ID = f.BHJ_ID AND b.TRANSD_BHJ_UNT_ID = f.BHJ_UNT_ID'
     + ' INNER JOIN BARANG_STOK_SIRKULASI g ON f.BHJ_BRG_CODE = g.BSS_BRG_CODE'
     + ' AND f.BHJ_SAT_CODE = g.BSS_SAT_CODE '
     + ' AND a.TRANS_NO = g.BSS_DOC_NO'
     + ' LEFT JOIN BARANG c ON b.TRANSD_BRG_CODE = c.BRG_CODE'
     + ' LEFT JOIN REF$KATEGORI e ON e.KAT_ID = c.BRG_KAT_ID '
     + ' LEFT JOIN REF$SUB_GRUP h ON h.SUBGRUP_ID = e.KAT_SUBGRUP_ID '
     + ' LEFT JOIN REF$MERCHANDISE_GRUP d ON h.SUBGRUP_MERCHANGRUP_ID = d.MERCHANGRUP_ID'
     + ' WHERE a.TRANS_DATE BETWEEN ' + TAppUtils.QuotD(aDate1)
     + ' AND ' + TAppUtils.QuotD(aDate2, TRUE)
     + ' AND a.TRANS_UNT_ID = ' + IntToStr(aUnitID)
     + ' AND (a.TRANS_IS_PENDING = 0 OR a.TRANS_IS_PENDING is NULL)'
     + ' AND (TRANS_IS_JURNAL = 0 OR TRANS_IS_JURNAL IS NULL)'
     + ' ORDER BY a.TRANS_NO';

  Q1 := cOpenQuery(s);

  s := 'Select a.TRANS_NO, a.TRANS_DATE, a.TRANS_TOTAL_TRANSACTION, a.TRANS_DISC_GMC_NOMINAL, a.TRANS_PEMBULAT, a.TRANS_DISC_CARD,'
     + ' a.TRANS_BAYAR_CARD, a.TRANS_BAYAR_CASH, a.TRANS_TOTAL_PPN, sum(b.TKB_SELL_PRICE_DISC) as TKB_SELL_PRICE_DISC,'
     + ' SUM(c.TRANSC_CASHBACK_NILAI) as TRANSC_CASHBACK_NILAI, d.CARD_REK_CODE, d.CARD_REK_CASH_BACK,'
     + ' SUM(e.VCRD_NOMINAL) as VCRD_NOMINAL, SUM(c.TRANSC_CHARGE) as TRANSC_CHARGE'
     + ' FROM TRANSAKSI a LEFT JOIN TRANS_KUPON_BOTOL b On a.TRANS_NO = b.TKB_POS_TRANS_NO And a.TRANS_UNT_ID = b.TKB_UNT_ID'
     + ' LEFT JOIN VOUCHER_DETIL e ON a.TRANS_NO = e.VCRD_POS_TRANS_NO And a.TRANS_UNT_ID = e.VCRD_UNT_ID'
     + ' LEFT JOIN TRANSAKSI_CARD c ON a.TRANS_NO = c.TRANSC_TRANS_NO'
     + ' AND a.TRANS_UNT_ID = c.TRANSC_TRANS_UNT_ID'
     + ' LEFT JOIN REF$CREDIT_CARD d ON c.TRANSC_CARD_ID = d.CARD_ID'
     + ' AND c.TRANSC_CARD_UNT_ID = d.CARD_UNT_ID'
     + ' WHERE a.TRANS_DATE BETWEEN ' + TAppUtils.QuotD(aDate1)
     + ' AND ' + TAppUtils.QuotD(aDate2, TRUE)
     + ' AND a.TRANS_UNT_ID = ' + IntToStr(aUnitID)
     + ' AND (a.TRANS_IS_JURNAL = 0 OR a.TRANS_IS_JURNAL IS NULL)'
     + ' AND (a.TRANS_IS_PENDING = 0 OR a.TRANS_IS_PENDING is NULL)'
     + ' GROUP BY a.TRANS_NO, a.TRANS_DATE, a.TRANS_TOTAL_TRANSACTION, a.TRANS_DISC_GMC_NOMINAL, a.TRANS_PEMBULAT,'
     + ' a.TRANS_BAYAR_CARD, a.TRANS_BAYAR_CASH, a.TRANS_TOTAL_PPN, d.CARD_REK_CODE, d.CARD_REK_CASH_BACK, a.TRANS_DISC_CARD';
  Q2 := cOpenQuery(s);

  if not Q1.Eof then Result := True;
end;

function TPOSTransaction.LoadDataJurnalByNo(aNoBukti : String; aUnitID :
    Integer): Boolean;
var
  s: string;
begin
  Result := False;

  Q1 := TFDQuery.Create(nil);

  s := 'Select a.TRANS_NO, d.MERCHANGRUP_ID, b.TRANSD_UNT_ID, b.TRANSD_TPBRG_ID, '
     + ' b.TRANSD_SELL_PRICE_DISC, b.TRANSD_QTY, b.TRANSD_PPN, g.BSS_HARGA_TRANSAKSI, b.TRANSD_DISC_GMC_NOMINAL,'
     + ' b.TRANSD_TOTAL, b.TRANSD_TOTAL_B4_TAX'
     + ' FROM TRANSAKSI a'
     + ' INNER JOIN TRANSAKSI_DETIL b ON a.TRANS_NO = b.TRANSD_TRANS_NO AND a.TRANS_UNT_ID = b.TRANSD_TRANS_UNT_ID'
     + ' INNER JOIN BARANG_HARGA_JUAL f ON b.TRANSD_BHJ_ID = f.BHJ_ID AND b.TRANSD_BHJ_UNT_ID = f.BHJ_UNT_ID'
     + ' INNER JOIN BARANG_STOK_SIRKULASI g ON f.BHJ_BRG_CODE = g.BSS_BRG_CODE'
     + ' AND f.BHJ_SAT_CODE = g.BSS_SAT_CODE '
     + ' AND a.TRANS_NO = g.BSS_DOC_NO'
     + ' LEFT JOIN BARANG c ON b.TRANSD_BRG_CODE = c.BRG_CODE'
     + ' LEFT JOIN REF$KATEGORI e ON e.KAT_ID = c.BRG_KAT_ID '
     + ' LEFT JOIN REF$SUB_GRUP h ON h.SUBGRUP_ID = e.KAT_SUBGRUP_ID '
     + ' LEFT JOIN REF$MERCHANDISE_GRUP d ON h.SUBGRUP_MERCHANGRUP_ID = d.MERCHANGRUP_ID'
     + ' WHERE a.TRANS_NO = ' + QuotedStr(aNoBukti)
     + ' AND a.TRANS_UNT_ID = ' + IntToStr(aUnitID)
     + ' AND (a.TRANS_IS_PENDING = 0 OR a.TRANS_IS_PENDING is NULL)'
     + ' AND (TRANS_IS_JURNAL = 0 OR TRANS_IS_JURNAL IS NULL)'
     + ' ORDER BY a.TRANS_NO';

  Q1 := cOpenQuery(s);

  s := 'Select a.TRANS_NO, a.TRANS_DATE, a.TRANS_TOTAL_TRANSACTION, a.TRANS_DISC_GMC_NOMINAL, a.TRANS_PEMBULAT, a.TRANS_DISC_CARD,'
     + ' a.TRANS_BAYAR_CARD, a.TRANS_BAYAR_CASH, a.TRANS_TOTAL_PPN, sum(b.TKB_SELL_PRICE_DISC) as TKB_SELL_PRICE_DISC,'
     + ' SUM(c.TRANSC_CASHBACK_NILAI) as TRANSC_CASHBACK_NILAI, d.CARD_REK_CODE, d.CARD_REK_CASH_BACK,'
     + ' SUM(e.VCRD_NOMINAL) as VCRD_NOMINAL, SUM(c.TRANSC_CHARGE) as TRANSC_CHARGE'
     + ' FROM TRANSAKSI a LEFT JOIN TRANS_KUPON_BOTOL b On a.TRANS_NO = b.TKB_POS_TRANS_NO And a.TRANS_UNT_ID = b.TKB_UNT_ID'
     + ' LEFT JOIN VOUCHER_DETIL e ON a.TRANS_NO = e.VCRD_POS_TRANS_NO And a.TRANS_UNT_ID = e.VCRD_UNT_ID'
     + ' LEFT JOIN TRANSAKSI_CARD c ON a.TRANS_NO = c.TRANSC_TRANS_NO'
     + ' AND a.TRANS_UNT_ID = c.TRANSC_TRANS_UNT_ID'
     + ' LEFT JOIN REF$CREDIT_CARD d ON c.TRANSC_CARD_ID = d.CARD_ID'
     + ' AND c.TRANSC_CARD_UNT_ID = d.CARD_UNT_ID'
     + ' WHERE a.TRANS_NO = ' + QuotedStr(aNoBukti)
     + ' AND a.TRANS_UNT_ID = ' + IntToStr(aUnitID)
     + ' AND (a.TRANS_IS_JURNAL = 0 OR a.TRANS_IS_JURNAL IS NULL)'
     + ' AND (a.TRANS_IS_PENDING = 0 OR a.TRANS_IS_PENDING is NULL)'
     + ' GROUP BY a.TRANS_NO, a.TRANS_DATE, a.TRANS_TOTAL_TRANSACTION, a.TRANS_DISC_GMC_NOMINAL, a.TRANS_PEMBULAT,'
     + ' a.TRANS_BAYAR_CARD, a.TRANS_BAYAR_CASH, a.TRANS_TOTAL_PPN, d.CARD_REK_CODE, d.CARD_REK_CASH_BACK, a.TRANS_DISC_CARD';
  Q2 := cOpenQuery(s);

  if not Q1.Eof then Result := True;
end;

function TPOSTransaction.RemoveFromDB: Boolean;
var
  sSQL: string;
begin
  Result := False;
  sSQL := 'delete from ' + CustomTableName
    + ' where ' + GetFieldNameFor_ID + ' = ' + QuotedStr(FID)
    + ' and ' + GetFieldNameFor_NewUnit + ' = ' + QuotedStr(FNewUnitID);
  if cExecSQL(sSQL,dbtPOS, False) then
    Result := True; //SimpanBlob(sSQL,GetHeaderFlag);
end;

function TPOSTransaction.SaveAllToDB: Boolean;
begin
  Result := False;
  if SaveToDB then
    if SaveTransactionCardToDB then
      if SaveKuponBotolToDB then
        if SaveVoucherToDB then
          if SaveReturToDB then
            if SaveVoucherLainToDB then
              Result := True;
end;

function TPOSTransaction.SaveKuponBotolToDB: Boolean;
var
  ssSQL: TStrings;
  sSQL: string;
begin
  Result := False;
  sSQL := 'update ' + GetTableNameFor_KuponBotol
    + ' set ' + GetFieldNameFor_KuponBotolStatus + ' = ' + QuotedStr('CLOSE')
    + ', ' + GetFieldNameFor_KuponBotolTransPOS + ' = ' + QuotedStr(No)
    + ' where ' + GetFieldNameFor_KuponBotolNo + ' = ' + QuotedStr(KuponBotolNo)
//    + ' and ' + GetFieldNameFor_KuponBotolUnit + ' = ' + QuotedStr(FNewUnitID)
    + ';';

  ssSQL := TStringList.Create;
  ssSQL.Add(sSQL);
  //ssSQL.SaveToFile(cGetAppPath + 'POS_KuponBotol.SQL');
  FreeAndNil(ssSQL);

  if cExecSQL(sSQL, dbtPOS, False) then
//    if SimpanBlob(sSQL,GetHeaderFlag) then
      Result := True;
end;

function TPOSTransaction.SaveReturToDB: Boolean;
var
  i: Integer;
  sSQL: string;
  ssSQL: TStrings;
begin
  Result := False;
  if ReturNo.Count = 0 then
  begin
    Result := True;
    Exit;
  end;

  ssSQL := TStringList.Create;
  for i := 0 to ReturNo.Count - 1 do // Iterate
  begin
    sSQL := 'update ' + GetTableNameFor_Retur
      + ' set ' + GetFieldNameFor_ReturTransPOS + ' = ' + QuotedStr(No)
      + ' , ' + GetFieldNameFor_DATE_MODIFY + ' = ' + TAppUtils.QuotDT(DATE_MODIFY)
      + ' where ' + GetFieldNameFor_ReturNo + ' = ' + QuotedStr(ReturNo[i])
      + ' and ' + GetFieldNameFor_ReturUnit + ' = ' + QuotedStr(FNewUnitID) + ';';
    ssSQL.Add(sSQL);
  end;    // for

  //ssSQL.SaveToFile(cGetAppPath + 'POS_TransRetur.SQL');
  try
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

function TPOSTransaction.SaveToDB: Boolean;
var
  ssSQL: TStrings;
begin
  Result := False;
  try
    ssSQL := GenerateSQL;
    //ssSQL.SaveToFile(cGetAppPath + 'POS_Transaction.SQL');
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

function TPOSTransaction.SaveTransactionCardToDB: Boolean;
begin
//  Result := False;
  if FTransactionCard = nil then
  begin
    Result := True;
    Exit;
  end;
  Result := TransactionCard.SaveToDB;
end;

function TPOSTransaction.SaveVoucherLainToDB: Boolean;
var
  i: Integer;
  ssSQL: TStrings;
begin
  Result := False;
  if VoucherLains.Count = 0 then
  begin
    Result := True;
    Exit;
  end;

  ssSQL := TStringList.Create;
  for i := 0 to VoucherLains.Count - 1 do // Iterate
  begin
    ssSQL.AddStrings(VoucherLains[i].VoucherLain.GenerateSQL);
  end;    // for

  //ssSQL.SaveToFile(cGetAppPath + 'POS_VoucherLain.SQL');
  try
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

function TPOSTransaction.SaveVoucherToDB: Boolean;
var
  i: Integer;
  sSQL: string;
  ssSQL: TStrings;
begin
  Result := False;
  if VoucherNo.Count = 0 then
  begin
    Result := True;
    Exit;
  end;

  ssSQL := TStringList.Create;
  for i := 0 to VoucherNo.Count - 1 do // Iterate
  begin
    sSQL := 'update ' + GetTableNameFor_Voucher
      + ' set ' + GetFieldNameFor_VoucherStatus + ' = ' + QuotedStr('CLOSE')
      + ', ' + GetFieldNameFor_VoucherTransPOS + ' = ' + QuotedStr(No)
      + ' where ' + GetFieldNameFor_VoucherNo + ' = ' + QuotedStr(VoucherNo[i])
      + ' and ' + GetFieldNameFor_VoucherUnit + ' = ' + QuotedStr(FNewUnitID) + ';';
    ssSQL.Add(sSQL);
  end;    // for

  //ssSQL.SaveToFile(cGetAppPath + 'POS_Voucher.SQL');
  try
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

procedure TPOSTransaction.SetNewUnit(Value: TUnit);
begin
  FNewUnitID := Value.ID;
end;

//procedure TPOSTransaction.SetOPC_UNIT(Value: TUnit);
//begin
//  FOPC_UNITID := Value.ID;
//end;

//procedure TPOSTransaction.SetOPM_UNIT(Value: TUnit);
//begin
//  FOPM_UNITID := Value.ID;
//end;

procedure TPOSTransaction.UpdateData(ABayarCard, ABayarCash: Double;
    ABeginningBalance_ID: string; ADiscAMCNominal, ADiscAMCPersen: Double; AID:
    string; AIsActive: Boolean; AMemberID, ANewUnit_ID, ANo: string; APembulat:
    Double; ATanggal: TDateTime; ATotalBayar, ATotalDiscAMC, ATotalPPN,
    ATotalTransaction: Double; AKuponBotolNo: String; AVoucherNo: TStrings;
    aUserID: string; aTransDiscCard: Double; aISJURNAL: Integer = 0;
    aIsPending: Boolean = False);
var
  i: integer;
begin
  FBayarCard          := ABayarCard;
  FBayarCash          := ABayarCash;
  FBeginningBalanceID := ABeginningBalance_ID;
  FDiscAMCNominal     := ADiscAMCNominal;
  FDiscAMCPersen      := ADiscAMCPersen;
  FID                 := AID;
  FIsActive           := AIsActive;
  FMemberID           := AMemberID;
  FNewUnitID          := ANewUnit_ID;
  FNo                 := Trim(ANo);
  FPembulat           := APembulat;
  FTanggal            := ATanggal;
  FTotalBayar         := ATotalBayar;
  FTotalDiscAMC       := ATotalDiscAMC;
  FTotalPPN           := ATotalPPN;
  FTotalTransaction   := ATotalTransaction;
  FKuponBotolNo       := AKuponBotolNo;
  FIsPending          := aIsPending;
  FOP_MODIFY          := aUserID;
  FTRANS_DISC_CARD    := aTransDiscCard;

  if AVoucherNo <> nil then
  begin
//    VoucherNo.AddStrings(AVoucherNo);
    for i := 0 to AVoucherNo.Count - 1 do
    begin
      if LeftStr(AVoucherNo[i],3) = 'RN/' then
        ReturNo.Add(AVoucherNo[i])
      else
        VoucherNo.Add(AVoucherNo[i]);
    end;
  end;

  State := csCreated;
end;

procedure TPOSTransaction.UpdatePOSTransactionItems(ABarangHargaJual_ID:
    string; ACOGS: Double; AID: string; AIsBKP, AIsDiscAMC: Boolean; ALastCost,
    APPN, APPNBM, AQty, ASellPrice, ASellPriceDisc, ATotal, ATotalBeforeTax,
    ATotalCeil: Double; ATransNo, AUnitID, ABarangCode, ATipeBarangID: string;
    aDISC_GMC_NOMINAL: Double; aUomCode: string; aDisc_Card: Double = 0;
    aDisc_Man: Double = 0; aOtoCode: String = '');
begin
  //Generate penambahan detail
  with POSTransactionItems.Add do
  Begin
    BarangCode := ABarangCode;
    TipeBarangID := ATipeBarangID;
    FBarangHargaJualID := ABarangHargaJual_ID;
    FCOGS :=  ACOGS;
    FID :=  AID;
    FIsBKP :=  AIsBKP;
    FIsDiscAMC :=  AIsDiscAMC;
    FLastCost :=  ALastCost;
    FPPN :=  APPN;
    FPPNBM :=  APPNBM;
    FQty :=  AQty;
    FSellPrice :=  ASellPrice;
    FSellPriceDisc :=  ASellPriceDisc;
    FTotal :=  ATotal;
    FTotalBeforeTax :=  ATotalBeforeTax;
    FTotalCeil :=  ATotalCeil;
    FDISC_GMC_NOMINAL := aDISC_GMC_NOMINAL;
    FTransNo := Trim(ATransNo);
    FNewUnitID := AUnitID;
    FDisc_Card := aDisc_Card;
    FUomCode  := aUomCode;
    FDiscMan  := aDisc_Man;
    FOto_Code := aOtoCode;
  end
end;

function TPOSTransaction.UpdateStatusJurnal(aStatus : Integer; aUnitID :
    Integer; aDate : TDateTime): Boolean;
var
  s: string;
begin
  Result := False;

  s := 'Update TRANSAKSI set TRANS_IS_JURNAL = ' + IntToStr(aStatus)
     + ' Where DATE(TRANS_DATE) BETWEEN ' + TAppUtils.QuotD(aDate)
     + ' AND ' + TAppUtils.QuotD(aDate, True)
//     + ' AND TRANS_UNT_ID = ' + IntToStr(aUnitID)
     + ';';

  if cExecSQL(s, dbtPOS, False) then
    Result := True; //SimpanBlob(s, GetHeaderFlag);
end;

function TPOSTransaction.UpdateTransStruk(lTransStruk: TStrings; IDTrans:
    string): Boolean;
var
  lQ: TFDQuery;
  lStream: TMemoryStream;
begin
  Result := True;
  If not Assigned(lTransStruk) then exit;

  lStream := TMemoryStream.Create;
  lTransStruk.SaveToStream(lStream);

  lQ := TFDQuery.Create(Self);
  lQ.Connection :=  dmMain.dbPOS;
  lQ.Transaction := dmMain.TransPOS;

  Try
    Try
      If not lQ.Transaction.Active then lQ.Transaction.StartTransaction;

      lQ.SQL.Add('Update ' + CustomTableName + ' set '
                + GetFieldNameFor_TransStruk + '= :lBlob '
                //+ ',' + GetFieldNameFor_OP_MODIFY + ' = :lModify '
                + ' where ' + GetFieldNameFor_ID + ' = :lID');

      lQ.ParamByName('lBlob').LoadFromStream(lStream, ftBlob);
      lQ.ParamByName('lID').AsString := IDTrans;
      lQ.ExecSQL;

      If lQ.Transaction.Active then lQ.Transaction.Commit;

    except
      If lQ.Transaction.Active then lQ.Transaction.Rollback;

      Result := False;
    end;

  finally
    lStream.Free;
    lQ.Free;
  end;
end;

end.
