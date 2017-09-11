unit uModTransaksi;

interface

uses
  uModApp, uModUnit, uModMember, uModBeginningBalance, uModBarang;

type
  TModTransaksi = class(TModApp)
  private
    FBALANCE: TModBeginningBalance;
    FBALANCE_UNIT: TModUnit;
    FMEMBER: TModMember;
    FMEMBER_UNIT: TModUnit;
    FTRANS_BAYAR_CARD: Double;
    FTRANS_BAYAR_CASH: Double;
    FTRANS_DATE: TDateTime;
    FTRANS_DISC_CARD: Double;
    FTRANS_DISC_GMC_NOMINAL: Double;
    FTRANS_DISC_GMC_PERSEN: Double;
    FTRANS_ID: Integer;
    FTRANS_IS_ACTIVE: Integer;
    FTRANS_IS_JURNAL: Integer;
    FTRANS_IS_PENDING: Integer;
    FTRANS_NO: string;
    FTRANS_PEMBULAT: Integer;
    FTRANS_TOTAL_BAYAR: Double;
    FTRANS_TOTAL_DISC_GMC: Double;
    FTRANS_TOTAL_PPN: Double;
    FTRANS_TOTAL_TRANSACTION: Double;
    FTRANS_UNIT: TModUnit;
  published
    [AttributeOfForeign('TRANS_BALANCE_ID')]
    property BALANCE: TModBeginningBalance read FBALANCE write FBALANCE;
    [AttributeOfForeign('TRANS_BALANCE_UNT_ID')]
    property BALANCE_UNIT: TModUnit read FBALANCE_UNIT write FBALANCE_UNIT;
    [AttributeOfForeign('TRANS_MEMBER_ID')]
    property MEMBER: TModMember read FMEMBER write FMEMBER;
    [AttributeOfForeign('TRANS_MEMBER_UNT_ID')]
    property MEMBER_UNIT: TModUnit read FMEMBER_UNIT write FMEMBER_UNIT;
    property TRANS_BAYAR_CARD: Double read FTRANS_BAYAR_CARD write
        FTRANS_BAYAR_CARD;
    property TRANS_BAYAR_CASH: Double read FTRANS_BAYAR_CASH write
        FTRANS_BAYAR_CASH;
    property TRANS_DATE: TDateTime read FTRANS_DATE write FTRANS_DATE;
    property TRANS_DISC_CARD: Double read FTRANS_DISC_CARD write FTRANS_DISC_CARD;
    property TRANS_DISC_GMC_NOMINAL: Double read FTRANS_DISC_GMC_NOMINAL write
        FTRANS_DISC_GMC_NOMINAL;
    property TRANS_DISC_GMC_PERSEN: Double read FTRANS_DISC_GMC_PERSEN write
        FTRANS_DISC_GMC_PERSEN;
    property TRANS_ID: Integer read FTRANS_ID write FTRANS_ID;
    property TRANS_IS_ACTIVE: Integer read FTRANS_IS_ACTIVE write FTRANS_IS_ACTIVE;
    property TRANS_IS_JURNAL: Integer read FTRANS_IS_JURNAL write FTRANS_IS_JURNAL;
    property TRANS_IS_PENDING: Integer read FTRANS_IS_PENDING write
        FTRANS_IS_PENDING;
    property TRANS_NO: string read FTRANS_NO write FTRANS_NO;
    property TRANS_PEMBULAT: Integer read FTRANS_PEMBULAT write FTRANS_PEMBULAT;
    property TRANS_TOTAL_BAYAR: Double read FTRANS_TOTAL_BAYAR write
        FTRANS_TOTAL_BAYAR;
    property TRANS_TOTAL_DISC_GMC: Double read FTRANS_TOTAL_DISC_GMC write
        FTRANS_TOTAL_DISC_GMC;
    property TRANS_TOTAL_PPN: Double read FTRANS_TOTAL_PPN write FTRANS_TOTAL_PPN;
    property TRANS_TOTAL_TRANSACTION: Double read FTRANS_TOTAL_TRANSACTION write
        FTRANS_TOTAL_TRANSACTION;
    [AttributeOfForeign('TRANS_UNT_ID')]
    property TRANS_UNIT: TModUnit read FTRANS_UNIT write FTRANS_UNIT;
  end;

  TModTransaksi_Detil = class(TModApp)
  private
    FOTO_CODE: string;
    FBARANG_HARGA_JUAL: TModBarangHargaJual;
    FTRANSD_BRG_CODE: string;
    FTRANSD_BRG_IS_GMC: Integer;
    FTRANSD_BRG_IS_PJK_INCLUDE: Integer;
    FTRANSD_COGS: double;
    FTRANSD_DISC_CARD: Double;
    FTRANSD_DISC_GMC_NOMINAL: Double;
    FTRANSD_DISC_MAN: Double;
    FTRANSD_ID: Integer;
    FTRANSD_IS_BKP: Integer;
    FTRANSD_LAST_COST: Double;
    FTRANSD_PPN: Double;
    FTRANSD_PPNBM: Double;
    FTRANSD_QTY: Double;
    FTRANSD_SAT_CODE: string;
    FTRANSD_SELL_PRICE: double;
    FTRANSD_SELL_PRICE_DISC: Double;
    FTRANSD_TOTAL: double;
    FTRANSD_TOTAL_B4_TAX: double;
    FTRANSD_TOTAL_CEIL: Integer;
    FTRANSD_TPBRG_ID: Integer;
    FTRANSD_TRANS_ID: Integer;
    FTRANSD_TRANS_NO: string;
    FTRANSD_TRANS_UNT_ID: Integer;
    FTRANSD_UNT_ID: Integer;
  published
    property OTO_CODE: string read FOTO_CODE write FOTO_CODE;
    property BARANG_HARGA_JUAL: TModBarangHargaJual read FBARANG_HARGA_JUAL write
        FBARANG_HARGA_JUAL;
    property TRANSD_BRG_CODE: string read FTRANSD_BRG_CODE write FTRANSD_BRG_CODE;
    property TRANSD_BRG_IS_GMC: Integer read FTRANSD_BRG_IS_GMC write
        FTRANSD_BRG_IS_GMC;
    property TRANSD_BRG_IS_PJK_INCLUDE: Integer read FTRANSD_BRG_IS_PJK_INCLUDE
        write FTRANSD_BRG_IS_PJK_INCLUDE;
    property TRANSD_COGS: double read FTRANSD_COGS write FTRANSD_COGS;
    property TRANSD_DISC_CARD: Double read FTRANSD_DISC_CARD write
        FTRANSD_DISC_CARD;
    property TRANSD_DISC_GMC_NOMINAL: Double read FTRANSD_DISC_GMC_NOMINAL write
        FTRANSD_DISC_GMC_NOMINAL;
    property TRANSD_DISC_MAN: Double read FTRANSD_DISC_MAN write FTRANSD_DISC_MAN;
    property TRANSD_ID: Integer read FTRANSD_ID write FTRANSD_ID;
    property TRANSD_IS_BKP: Integer read FTRANSD_IS_BKP write FTRANSD_IS_BKP;
    property TRANSD_LAST_COST: Double read FTRANSD_LAST_COST write
        FTRANSD_LAST_COST;
    property TRANSD_PPN: Double read FTRANSD_PPN write FTRANSD_PPN;
    property TRANSD_PPNBM: Double read FTRANSD_PPNBM write FTRANSD_PPNBM;
    property TRANSD_QTY: Double read FTRANSD_QTY write FTRANSD_QTY;
    property TRANSD_SAT_CODE: string read FTRANSD_SAT_CODE write FTRANSD_SAT_CODE;
    property TRANSD_SELL_PRICE: double read FTRANSD_SELL_PRICE write
        FTRANSD_SELL_PRICE;
    property TRANSD_SELL_PRICE_DISC: Double read FTRANSD_SELL_PRICE_DISC write
        FTRANSD_SELL_PRICE_DISC;
    property TRANSD_TOTAL: double read FTRANSD_TOTAL write FTRANSD_TOTAL;
    property TRANSD_TOTAL_B4_TAX: double read FTRANSD_TOTAL_B4_TAX write
        FTRANSD_TOTAL_B4_TAX;
    property TRANSD_TOTAL_CEIL: Integer read FTRANSD_TOTAL_CEIL write
        FTRANSD_TOTAL_CEIL;
    property TRANSD_TPBRG_ID: Integer read FTRANSD_TPBRG_ID write FTRANSD_TPBRG_ID;
    property TRANSD_TRANS_ID: Integer read FTRANSD_TRANS_ID write FTRANSD_TRANS_ID;
    property TRANSD_TRANS_NO: string read FTRANSD_TRANS_NO write FTRANSD_TRANS_NO;
    property TRANSD_TRANS_UNT_ID: Integer read FTRANSD_TRANS_UNT_ID write
        FTRANSD_TRANS_UNT_ID;
    property TRANSD_UNT_ID: Integer read FTRANSD_UNT_ID write FTRANSD_UNT_ID;
  end;

implementation

initialization
  TModTransaksi.RegisterRTTI;
  TModTransaksi_Detil.RegisterRTTI;
end.
