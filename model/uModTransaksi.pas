unit uModTransaksi;

interface

uses
  uModApp, uModUnit, uModMember, uModBeginningBalance, uModBarang,
  System.Generics.Collections, uModCreditCard;

type
  TModTransaksiDetil = class;
  TModTransaksiCard = class;
  TModTransaksi = class(TModApp)
  private
    FAUTUNIT: TModUnit;
    FBALANCE: TModBeginningBalance;
    FMEMBER: TModMember;
    FTransaksiDetils: TobjectList<TModTransaksiDetil>;
    FTRANS_BAYAR_CARD: Double;
    FTRANS_BAYAR_CASH: Double;
    FTRANS_DATE: TDateTime;
    FTRANS_DISC_CARD: Double;
    FTRANS_DISC_GMC_NOMINAL: Double;
    FTRANS_DISC_GMC_PERSEN: Double;
    FTRANS_IS_ACTIVE: Integer;
    FTRANS_IS_JURNAL: Integer;
    FTRANS_IS_PENDING: Integer;
    FTRANS_NO: string;
    FTRANS_PEMBULAT: Integer;
    FTRANS_TOTAL_BAYAR: Double;
    FTRANS_TOTAL_DISC_GMC: Double;
    FTRANS_TOTAL_PPN: Double;
    FTRANS_TOTAL_TRANSACTION: Double;
    function GetTransaksiDetils: TobjectList<TModTransaksiDetil>;
  public
    property TransaksiDetils: TobjectList<TModTransaksiDetil> read
        GetTransaksiDetils write FTransaksiDetils;
  published
    [AttributeOfForeign('AUT$UNIT_ID')]
    property AUTUNIT: TModUnit read FAUTUNIT write FAUTUNIT;
    [AttributeOfForeign('BEGINNING_BALANCE_ID')]
    property BALANCE: TModBeginningBalance read FBALANCE write FBALANCE;
    [AttributeOfForeign('MEMBER_ID')]
    property MEMBER: TModMember read FMEMBER write FMEMBER;
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
  end;

  TModTransaksiDetil = class(TModApp)
  private
    FBARANG_HARGA_JUAL: TModBarangHargaJual;
    FOTO_CODE: string;
    FTIPEBARANG: TModTipeBarang;
    FTRANSAKSI: TModTransaksi;
    FTRANSD_BRG_CODE: string;
    FTRANSD_BRG_IS_GMC: Integer;
    FTRANSD_BRG_IS_PJK_INCLUDE: Integer;
    FTRANSD_COGS: double;
    FTRANSD_DISC_CARD: Double;
    FTRANSD_DISC_GMC_NOMINAL: Double;
    FTRANSD_DISC_MAN: Double;
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
    FTRANSD_TRANS_NO: string;
  public
    class function GetTableName: String; override;
  published
    property BARANG_HARGA_JUAL: TModBarangHargaJual read FBARANG_HARGA_JUAL write
        FBARANG_HARGA_JUAL;
    property OTO_CODE: string read FOTO_CODE write FOTO_CODE;
    [AttributeOfForeign('REF$TIPE_BARANG_ID')]
    property TIPEBARANG: TModTipeBarang read FTIPEBARANG write FTIPEBARANG;
   [AttributeOfHeader]
    property TRANSAKSI: TModTransaksi read FTRANSAKSI write FTRANSAKSI;
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
    property TRANSD_TRANS_NO: string read FTRANSD_TRANS_NO write FTRANSD_TRANS_NO;
  end;

  TModTransaksiCard = class(TModApp)
  private
    FAUTUNIT: TModUnit;
    FCREDITCARD: TModCreditCard;
    FTRANSC_CASHBACK_CHARGE: Double;
    FTRANSC_CASHBACK_NILAI: Double;
    FTRANSC_CHARGE: Double;
    FTRANSC_IS_ACTIVE: Integer;
    FTRANSC_NILAI: Double;
    FTRANSC_NOMOR: string;
    FTRANSC_NO_OTORISASI: string;
    FTRANSC_TRANS_NO: string;
  public
    class function GetTableName: String; override;
  published
    [AttributeOfForeign('AUT$UNIT_ID')]
    property AUTUNIT: TModUnit read FAUTUNIT write FAUTUNIT;
    [AttributeOfForeign('REF$CREDIT_CARD_ID')]
    property CREDITCARD: TModCreditCard read FCREDITCARD write FCREDITCARD;
    property TRANSC_CASHBACK_CHARGE: Double read FTRANSC_CASHBACK_CHARGE write
        FTRANSC_CASHBACK_CHARGE;
    property TRANSC_CASHBACK_NILAI: Double read FTRANSC_CASHBACK_NILAI write
        FTRANSC_CASHBACK_NILAI;
    property TRANSC_CHARGE: Double read FTRANSC_CHARGE write FTRANSC_CHARGE;
    property TRANSC_IS_ACTIVE: Integer read FTRANSC_IS_ACTIVE write
        FTRANSC_IS_ACTIVE;
    property TRANSC_NILAI: Double read FTRANSC_NILAI write FTRANSC_NILAI;
    property TRANSC_NOMOR: string read FTRANSC_NOMOR write FTRANSC_NOMOR;
    property TRANSC_NO_OTORISASI: string read FTRANSC_NO_OTORISASI write
        FTRANSC_NO_OTORISASI;
    property TRANSC_TRANS_NO: string read FTRANSC_TRANS_NO write FTRANSC_TRANS_NO;
  end;

implementation

function TModTransaksi.GetTransaksiDetils: TobjectList<TModTransaksiDetil>;
begin
  if FTransaksiDetils = nil then
    FTransaksiDetils := TObjectList<TModTransaksiDetil>.Create();

  Result := FTransaksiDetils;
end;

class function TModTransaksiDetil.GetTableName: String;
begin
  Result := 'TRANSAKSI_DETIL';
end;

class function TModTransaksiCard.GetTableName: String;
begin
  Result := 'TRANSAKSI_CARD';
end;

initialization
  TModTransaksi.RegisterRTTI;
  TModTransaksiDetil.RegisterRTTI;
  TModTransaksiCard.RegisterRTTI;

end.
