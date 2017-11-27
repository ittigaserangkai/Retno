unit uModTransaksi;

interface

uses
  uModApp, uModUnit, uModMember, uModBeginningBalance, uModBarang,
  System.Generics.Collections, uModCreditCard, uModAuthUser, System.SysUtils,
  uModTransKuponBotol, uModSatuan, System.Classes;

type
  TModTransaksiDetil = class;
  TModTransaksiCard = class;
  TModTransKuponBotol = class;
  TModTransKuponBotolDetil = class;

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
    FOP_CREATE: TModAuthUser;
    FKuponBotols: TobjectList<TModTransKuponBotol>;
    FTRANS_PEMBULAT: Integer;
    FTRANS_TOTAL_BAYAR: Double;
    FTRANS_TOTAL_DISC_GMC: Double;
    FTRANS_TOTAL_PPN: Double;
    FTRANS_TOTAL_TRANSACTION: Double;
    function GetTransaksiDetils: TobjectList<TModTransaksiDetil>;
    function GetKuponBotols: TobjectList<TModTransKuponBotol>;
  public
    destructor Destroy; override;
    function GetTotalBarangAMC: Double;
    function GetTotalColie: Double;
    function GetSubTotal: Double;
    function GetDPP: Double;
    function GetDiscount: Double;
    function GetKuponBotol: Double;
    function GetKuponBotolQty: Double;
    function GetNonBKP: Double;
    function GetPPN: Double;
    property TransaksiDetils: TobjectList<TModTransaksiDetil> read
        GetTransaksiDetils write FTransaksiDetils;
    property KuponBotols: TobjectList<TModTransKuponBotol> read GetKuponBotols
        write FKuponBotols;
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
    [AttributeOfForeign('OP_CREATE')]
    property OP_CREATE: TModAuthUser read FOP_CREATE write FOP_CREATE;
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
    FTRANSD_DISCOUNT: Double;
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
    destructor Destroy; override;
    class function GetTableName: String; override;
    function GetDPP: Double;
    function GetNonBKP: Double;
    function GetSubTotal: Double;
    function GetPPN: Double;
    property TRANSD_DISCOUNT: Double read FTRANSD_DISCOUNT write FTRANSD_DISCOUNT;
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

  [AttrUpdateDetails]
  TModTransKuponBotol = class(TModApp)
  private
    FAUTUNIT: TModUnit;
    FKuponBotolDetils: TobjectList<TModTransKuponBotolDetil>;
    FMEMBER: TModMember;
    FTKB_DATE: TDateTime;
    FTRANSAKSI: TModTransaksi;
    FTKB_DESCRIPTION: string;
    FTKB_INC: Integer;
    FTKB_IS_JURNAL: Integer;
    FTKB_IS_PRINTED: Integer;
    FTKB_NO: string;
    FTKB_POS_TRANS_NO: string;
    FTKB_QTY: Double;
    FTKB_SELL_PRICE_DISC: Double;
    FTKB_STATUS: string;
    function GetKuponBotolDetils: TobjectList<TModTransKuponBotolDetil>;
  public
    class function GetTableName: String; override;
    function GetTotalQTY: Double;
    function GetTotal: Double;
    function HasValidItem(aModTransaksi: TModTransaksi): Boolean;
    function IsClosed: Boolean;
    property KuponBotolDetils: TobjectList<TModTransKuponBotolDetil> read
        GetKuponBotolDetils write FKuponBotolDetils;
  published
    [AttributeOfForeign('AUT$UNIT_ID')]
    property AUTUNIT: TModUnit read FAUTUNIT write FAUTUNIT;
    [AttributeOfForeign('MEMBER_ID')]
    property MEMBER: TModMember read FMEMBER write FMEMBER;
    property TKB_DATE: TDateTime read FTKB_DATE write FTKB_DATE;
    [AttributeOfHeader]
    property TRANSAKSI: TModTransaksi read FTRANSAKSI write FTRANSAKSI;
    property TKB_DESCRIPTION: string read FTKB_DESCRIPTION write FTKB_DESCRIPTION;
    property TKB_INC: Integer read FTKB_INC write FTKB_INC;
    property TKB_IS_JURNAL: Integer read FTKB_IS_JURNAL write FTKB_IS_JURNAL;
    property TKB_IS_PRINTED: Integer read FTKB_IS_PRINTED write FTKB_IS_PRINTED;
    [AttributeOfCode]
    property TKB_NO: string read FTKB_NO write FTKB_NO;
    property TKB_POS_TRANS_NO: string read FTKB_POS_TRANS_NO write
        FTKB_POS_TRANS_NO;
    property TKB_QTY: Double read FTKB_QTY write FTKB_QTY;
    property TKB_SELL_PRICE_DISC: Double read FTKB_SELL_PRICE_DISC write
        FTKB_SELL_PRICE_DISC;
    property TKB_STATUS: string read FTKB_STATUS write FTKB_STATUS;
  end;

  TModTransKuponBotolDetil = class(TModApp)
  private
    FBARANG: TModBarang;
    FSATUAN: TModSatuan;
    FTKBD_DISC: Double;
    FTKBD_QTY: Double;
    FTKBD_SELL_PRICE: Double;
    FTKBD_SELL_PRICE_DISC: Double;
    FTKBD_TOTAL_SELL_PRICE_DISC: Double;
    FTransKuponBotol: TModTransKuponBotol;
  public
    class function GetTableName: String; override;
  published
    [AttributeOfForeign('BARANG_ID')]
    property BARANG: TModBarang read FBARANG write FBARANG;
    [AttributeOfForeign('REF$SATUAN_ID')]
    property SATUAN: TModSatuan read FSATUAN write FSATUAN;
    property TKBD_DISC: Double read FTKBD_DISC write FTKBD_DISC;
    property TKBD_QTY: Double read FTKBD_QTY write FTKBD_QTY;
    property TKBD_SELL_PRICE: Double read FTKBD_SELL_PRICE write FTKBD_SELL_PRICE;
    property TKBD_SELL_PRICE_DISC: Double read FTKBD_SELL_PRICE_DISC write
        FTKBD_SELL_PRICE_DISC;
    property TKBD_TOTAL_SELL_PRICE_DISC: Double read FTKBD_TOTAL_SELL_PRICE_DISC
        write FTKBD_TOTAL_SELL_PRICE_DISC;
    [AttributeOfHeader('TRANS_KUPON_BOTOL_ID')]
    property TransKuponBotol: TModTransKuponBotol read FTransKuponBotol write
        FTransKuponBotol;
  end;

implementation

destructor TModTransaksi.Destroy;
begin
  inherited;
  if Assigned(FMEMBER) then
    FreeAndNil(FMember);
  //jangan destroy AUTUNIT karena diset dari luar
end;

function TModTransaksi.GetTotalBarangAMC: Double;
var
  lItem: TModTransaksiDetil;
begin
  Result := 0;
  for lItem in Self.TransaksiDetils do
  begin
    if lItem.TRANSD_BRG_IS_GMC <> 1 then continue;
    Result := Result + lItem.TRANSD_TOTAL;
  end;
end;

function TModTransaksi.GetTotalColie: Double;
var
  lItem: TModTransaksiDetil;
begin
  Result := 0;
  for lItem in Self.TransaksiDetils do
  begin
    Result := Result + lItem.TRANSD_QTY;
  end;
end;

function TModTransaksi.GetSubTotal: Double;
var
  lItem: TModTransaksiDetil;
begin
  Result := 0;
  for lItem in Self.TransaksiDetils do
  begin
    Result := Result + lItem.GetSubTotal;
  end;
end;

function TModTransaksi.GetDPP: Double;
begin
  Result := Self.GetSubTotal - Self.GetDiscount;
end;

function TModTransaksi.GetDiscount: Double;
var
  lItem: TModTransaksiDetil;
begin
  Result := 0;
  for lItem in Self.TransaksiDetils do
  begin
    Result := Result + lItem.TRANSD_DISCOUNT;
  end;
end;

function TModTransaksi.GetKuponBotol: Double;
var
  lKupon: TModTransKuponBotol;
begin
  Result := 0;
  for lKupon in Self.KuponBotols do
    Result := Result + lKupon.GetTotal;
end;

function TModTransaksi.GetKuponBotolQty: Double;
var
  lKupon: TModTransKuponBotol;
begin
  Result := 0;
  for lKupon in Self.KuponBotols do
    Result := Result + lKupon.GetTotalQTY;
end;

function TModTransaksi.GetNonBKP: Double;
var
  lItem: TModTransaksiDetil;
begin
  Result := 0;
  for lItem in Self.TransaksiDetils do
  begin
    Result := Result + lItem.GetNonBKP;
  end;
end;

function TModTransaksi.GetPPN: Double;
var
  lItem: TModTransaksiDetil;
begin
  Result := 0;
  for lItem in Self.TransaksiDetils do
  begin
    Result := Result + lItem.GetPPN;
  end;
end;

function TModTransaksi.GetTransaksiDetils: TobjectList<TModTransaksiDetil>;
begin
  if FTransaksiDetils = nil then
    FTransaksiDetils := TObjectList<TModTransaksiDetil>.Create();

  Result := FTransaksiDetils;
end;

function TModTransaksi.GetKuponBotols: TobjectList<TModTransKuponBotol>;
begin
  if FKuponBotols = nil then
    FKuponBotols := TObjectList<TModTransKuponBotol>.Create();

  Result := FKuponBotols;
end;

destructor TModTransaksiDetil.Destroy;
begin
  inherited;
  if Assigned(FBARANG_HARGA_JUAL) then FreeAndNil(FBARANG_HARGA_JUAL);
  //jangan destroy AUTUNIT karena diset dari luar
end;

class function TModTransaksiDetil.GetTableName: String;
begin
  Result := 'TRANSAKSI_DETIL';
end;

function TModTransaksiDetil.GetDPP: Double;
begin
  Result := Self.TRANSD_TOTAL;
  if Self.TRANSD_PPN <> 0 then
    Result := Result / ((100+Self.TRANSD_PPN)/100);
end;

function TModTransaksiDetil.GetNonBKP: Double;
begin
  if Self.TRANSD_PPN = 0 then
    Result := Self.TRANSD_QTY * Self.TRANSD_SELL_PRICE
  else
    Result := 0;
end;

function TModTransaksiDetil.GetSubTotal: Double;
begin
  Result := Self.TRANSD_QTY * Self.TRANSD_SELL_PRICE;
  if Self.TRANSD_PPN <> 0 then
    Result := Result / ((100+Self.TRANSD_PPN)/100);
end;

function TModTransaksiDetil.GetPPN: Double;
begin
  Result := Self.TRANSD_TOTAL - Self.GetDPP;
end;

class function TModTransaksiCard.GetTableName: String;
begin
  Result := 'TRANSAKSI_CARD';
end;

function TModTransKuponBotol.GetKuponBotolDetils:
    TobjectList<TModTransKuponBotolDetil>;
begin
  if FKuponBotolDetils = nil then
    FKuponBotolDetils := TObjectList<TModTransKuponBotolDetil>.Create();

  Result := FKuponBotolDetils;
end;

class function TModTransKuponBotol.GetTableName: String;
begin
  Result := 'TRANS_KUPON_BOTOL';
end;

function TModTransKuponBotol.GetTotalQTY: Double;
var
  lDetail: TModTransKuponBotolDetil;
begin
  Result := 0;
  for lDetail in Self.KuponBotolDetils do
    Result := Result + lDetail.TKBD_QTY;
end;

function TModTransKuponBotol.GetTotal: Double;
var
  lDetail: TModTransKuponBotolDetil;
begin
  Result := 0;
  for lDetail in Self.KuponBotolDetils do
    Result := Result + lDetail.TKBD_TOTAL_SELL_PRICE_DISC;
end;

function TModTransKuponBotol.HasValidItem(aModTransaksi: TModTransaksi):
    Boolean;
var
  lDetail: TModTransKuponBotolDetil;
  lItem: TModTransaksiDetil;
begin
  for lDetail in Self.KuponBotolDetils do
  begin
    Result := False;
    for lItem in aModTransaksi.TransaksiDetils do
    begin
      if lDetail.BARANG.BRG_CODE = lItem.TRANSD_BRG_CODE then
        Result := True;
    end;

    if not Result then exit; //semua item di kupon wajib ada di transaksi
    //jika salah 1 tidak ditemukan maka tidak valid
  end;
end;

function TModTransKuponBotol.IsClosed: Boolean;
begin
  Result := UpperCase(Self.TKB_STATUS) = 'CLOSE'
end;

class function TModTransKuponBotolDetil.GetTableName: String;
begin
  Result := 'TRANS_KUPON_BOTOL_DETIL';
end;

initialization
  TModTransaksi.RegisterRTTI;
  TModTransaksiDetil.RegisterRTTI;
  TModTransaksiCard.RegisterRTTI;
  TModTransKuponBotol.RegisterRTTI;
  TModTransKuponBotolDetil.RegisterRTTI;

end.
