unit uModBarang;

interface

uses
  uModApp, uModRefPajak, uModAuthApp, uModSatuan, uModOutlet, uModSuplier;

type
  TModTipeBarang = class(TModApp)
  private
    FTPBRG_CODE: string;
    FTPBRG_NAME: string;
  public
    class function GetTableName: String; override;
  published
    [AttributeOfCode]
    property TPBRG_CODE: string read FTPBRG_CODE write FTPBRG_CODE;
    property TPBRG_NAME: string read FTPBRG_NAME write FTPBRG_NAME;
  end;

type
  TModMerk = class(TModApp)
  private
    FMERK_NAME: string;
    FMERK_DESCRIPTION: string;
  public
    class function GetTableName: String; override;
  published
    [AttributeOfCode]
    property MERK_NAME: string read FMERK_NAME write FMERK_NAME;
    property MERK_DESCRIPTION: string read FMERK_DESCRIPTION write
        FMERK_DESCRIPTION;
  end;

  TModLokasi = class(TModApp)
  private
    FLOK_CODE: string;
    FLOK_RACK: string;
    FLOK_BAY: string;
    FLOK_NAME: string;
    FLOK_TYPE: string;
    FLOK_SHELVE: string;
    FLOK_POSITION: string;
    FLOK_IS_ACTIVE: Integer;
    FLOK_CAPACITY: Double;
    FLOK_DESCRIPTION: string;
  protected
  public
    class function GetTableName: string; override;
  published
    property LOK_CODE: string read FLOK_CODE write FLOK_CODE;
    property LOK_RACK: string read FLOK_RACK write FLOK_RACK;
    property LOK_BAY: string read FLOK_BAY write FLOK_BAY;
    property LOK_NAME: string read FLOK_NAME write FLOK_NAME;
    property LOK_TYPE: string read FLOK_TYPE write FLOK_TYPE;
    property LOK_SHELVE: string read FLOK_SHELVE write FLOK_SHELVE;
    property LOK_POSITION: string read FLOK_POSITION write FLOK_POSITION;
    property LOK_IS_ACTIVE: Integer read FLOK_IS_ACTIVE write FLOK_IS_ACTIVE;
    property LOK_CAPACITY: Double read FLOK_CAPACITY write FLOK_CAPACITY;
    property LOK_DESCRIPTION: string read FLOK_DESCRIPTION write FLOK_DESCRIPTION;
  end;

  TModBarang = class(TModApp)
  private
    FBRG_CODE: String;
    FBRG_NAME: String;
    FBRG_ALIAS: String;
    FBRG_CATALOG: String;
    FBRG_CODE_PURCHASE: String;
    FBRG_DEFAULT_MARK_UP: Double;
    FBRG_EXPIRE_TIME: Integer;
    FBRG_GALON_CODE: String;
    FBRG_HARGA_AVERAGE: Double;
    FBRG_HEIGHT: string;
    FBRG_HO_AUTHORIZE: Integer;
    FBRG_IS_ACTIVE: Integer;
    FBRG_IS_BASIC: Integer;
    FBRG_IS_BUILD: Integer;
    FBRG_IS_CS: Integer;
    FBRG_IS_DECIMAL: Integer;
    FBRG_IS_DEPOSIT: Integer;
    FBRG_IS_DISC_GMC: Integer;
    FBRG_IS_GALON: Integer;
    FBRG_IS_PJK_INCLUDE: Integer;
    FBRG_IS_STOCK: Integer;
    FBRG_IS_VALIDATE: Integer;
    FBRG_LASTCOST: Double;
    FBRG_LENGTH: string;
    FBRG_NILAI_RAFAKSI: Double;
    FBRG_PKM_AVERAGE: String;
    FBRG_QTY_RAFAKSI: Double;
    FSATUAN_STOCK: TModSatuan;
    FBRG_UOM_DIAMETER: string;
    FBRG_UOM_VOLUME: Integer;
    FBRG_UOM_WEIGHT: string;
    FBRG_WIDTH: string;
    FMerchandise: TModMerchandise;
    FMerchandiseGroup: TModMerchandiseGroup;
    FKategori: TModKategori;
    FMerk: TModMerk;
    FOutlet: TModOutlet;
    FLokasi: TModLokasi;
    FRefPajak: TModRefPajak;
    FSAFETY_STOCK: Double;
    FSATUAN_PURCHASE: TModSatuan;
    FTipeBarang: TModTipeBarang;
  public
    class function GetTableName: string; override;
  published
    property BRG_CODE: String read FBRG_CODE write FBRG_CODE;
    property BRG_NAME: String read FBRG_NAME write FBRG_NAME;
    property BRG_ALIAS: String read FBRG_ALIAS write FBRG_ALIAS;
    property BRG_CATALOG: String read FBRG_CATALOG write FBRG_CATALOG;
    property BRG_CODE_PURCHASE: String read FBRG_CODE_PURCHASE write
        FBRG_CODE_PURCHASE;
    property BRG_DEFAULT_MARK_UP: Double read FBRG_DEFAULT_MARK_UP write
        FBRG_DEFAULT_MARK_UP;
    property BRG_EXPIRE_TIME: Integer read FBRG_EXPIRE_TIME write FBRG_EXPIRE_TIME;
    property BRG_GALON_CODE: String read FBRG_GALON_CODE write FBRG_GALON_CODE;
    property BRG_HARGA_AVERAGE: Double read FBRG_HARGA_AVERAGE write
        FBRG_HARGA_AVERAGE;
    property BRG_HEIGHT: string read FBRG_HEIGHT write FBRG_HEIGHT;
    property BRG_HO_AUTHORIZE: Integer read FBRG_HO_AUTHORIZE write
        FBRG_HO_AUTHORIZE;
    property BRG_IS_ACTIVE: Integer read FBRG_IS_ACTIVE write FBRG_IS_ACTIVE;
    property BRG_IS_BASIC: Integer read FBRG_IS_BASIC write FBRG_IS_BASIC;
    property BRG_IS_BUILD: Integer read FBRG_IS_BUILD write FBRG_IS_BUILD;
    property BRG_IS_CS: Integer read FBRG_IS_CS write FBRG_IS_CS;
    property BRG_IS_DECIMAL: Integer read FBRG_IS_DECIMAL write FBRG_IS_DECIMAL;
    property BRG_IS_DEPOSIT: Integer read FBRG_IS_DEPOSIT write FBRG_IS_DEPOSIT;
    property BRG_IS_DISC_GMC: Integer read FBRG_IS_DISC_GMC write FBRG_IS_DISC_GMC;
    property BRG_IS_GALON: Integer read FBRG_IS_GALON write FBRG_IS_GALON;
    property BRG_IS_PJK_INCLUDE: Integer read FBRG_IS_PJK_INCLUDE write
        FBRG_IS_PJK_INCLUDE;
    property BRG_IS_STOCK: Integer read FBRG_IS_STOCK write FBRG_IS_STOCK;
    property BRG_IS_VALIDATE: Integer read FBRG_IS_VALIDATE write FBRG_IS_VALIDATE;
    property BRG_LASTCOST: Double read FBRG_LASTCOST write FBRG_LASTCOST;
    property BRG_LENGTH: string read FBRG_LENGTH write FBRG_LENGTH;
    property BRG_NILAI_RAFAKSI: Double read FBRG_NILAI_RAFAKSI write
        FBRG_NILAI_RAFAKSI;
    property BRG_PKM_AVERAGE: String read FBRG_PKM_AVERAGE write FBRG_PKM_AVERAGE;
    property BRG_QTY_RAFAKSI: Double read FBRG_QTY_RAFAKSI write FBRG_QTY_RAFAKSI;
    [AttributeOfForeign('REF$SATUAN_STOCK')]
    property SATUAN_STOCK: TModSatuan read FSATUAN_STOCK write FSATUAN_STOCK;
    property BRG_UOM_DIAMETER: string read FBRG_UOM_DIAMETER write
        FBRG_UOM_DIAMETER;
    property BRG_UOM_VOLUME: Integer read FBRG_UOM_VOLUME write FBRG_UOM_VOLUME;
    property BRG_UOM_WEIGHT: string read FBRG_UOM_WEIGHT write FBRG_UOM_WEIGHT;
    property BRG_WIDTH: string read FBRG_WIDTH write FBRG_WIDTH;
    [AttributeOfForeign('REF$MERCHANDISE_ID')]
    property Merchandise: TModMerchandise read FMerchandise write FMerchandise;
    [AttributeOfForeign('REF$MERCHANDISE_GRUP_ID')]
    property MerchandiseGroup: TModMerchandiseGroup read FMerchandiseGroup write
        FMerchandiseGroup;
    [AttributeOfForeign('REF$KATEGORI_ID')]
    property Kategori: TModKategori read FKategori write FKategori;
    [AttributeOfForeign('MERK_ID')]
    property Merk: TModMerk read FMerk write FMerk;
    [AttributeOfForeign('REF$OUTLET_ID')]
    property Outlet: TModOutlet read FOutlet write FOutlet;
    [AttributeOfForeign('REF$Lokasi_ID')]
    property Lokasi: TModLokasi read FLokasi write FLokasi;
    [AttributeOfForeign('REF$PAJAK_ID')]
    property RefPajak: TModRefPajak read FRefPajak write FRefPajak;
    property SAFETY_STOCK: Double read FSAFETY_STOCK write FSAFETY_STOCK;
    [AttributeOfForeign('REF$SATUAN_PURCHASE')]
    property SATUAN_PURCHASE: TModSatuan read FSATUAN_PURCHASE write
        FSATUAN_PURCHASE;
    [AttributeOfForeign('REF$TIPE_BARANG_ID')]
    property TipeBarang: TModTipeBarang read FTipeBarang write FTipeBarang;
  end;

  TModBarangSupplier = class(TModApp)
  private
    FBRGSUP_BUY_PRICE: Double;
    FBRGSUP_DISC1: Double;
    FBRGSUP_DISC2: Double;
    FBRGSUP_DISC3: Double;
    FBRGSUP_BUY_PRICE_TEMP: Double;
    FBRGSUP_BUY_PRICE_DISC: Double;
    FBRGSUP_DELIVERY_TIME: Integer;
    FBRGSUP_IS_ENABLE_CN: Integer;
    FBRGSUP_EXPIRE_TIME: Integer;
    FBRGSUP_EXPIRE_TIME1: Integer;
    FBRGSUP_STOCK_IN_ORDER: Double;
    FBRGSUP_MIN_ORDER: Double;
    FBRGSUP_MAX_ORDER: Double;
    FBRGSUP_IS_PRIMARY: Integer;
    FBRGSUP_IS_BKP: Integer;
    FBRGSUP_IS_ACTIVE: Integer;
    FBRGSUP_FEE: Integer;
    FBRGSUP_MARK_UP: Integer;
    FSATUAN_PURCHASE: TModSatuan;
    FSupplier: TModSuplier;
  public
    class function GetTableName: string; override;
  published
    property BRGSUP_BUY_PRICE: Double read FBRGSUP_BUY_PRICE write
        FBRGSUP_BUY_PRICE;
    property BRGSUP_DISC1: Double read FBRGSUP_DISC1 write FBRGSUP_DISC1;
    property BRGSUP_DISC2: Double read FBRGSUP_DISC2 write FBRGSUP_DISC2;
    property BRGSUP_DISC3: Double read FBRGSUP_DISC3 write FBRGSUP_DISC3;
    property BRGSUP_BUY_PRICE_TEMP: Double read FBRGSUP_BUY_PRICE_TEMP write
        FBRGSUP_BUY_PRICE_TEMP;
    property BRGSUP_BUY_PRICE_DISC: Double read FBRGSUP_BUY_PRICE_DISC write
        FBRGSUP_BUY_PRICE_DISC;
    property BRGSUP_DELIVERY_TIME: Integer read FBRGSUP_DELIVERY_TIME write
        FBRGSUP_DELIVERY_TIME;
    property BRGSUP_IS_ENABLE_CN: Integer read FBRGSUP_IS_ENABLE_CN write
        FBRGSUP_IS_ENABLE_CN;
    property BRGSUP_EXPIRE_TIME: Integer read FBRGSUP_EXPIRE_TIME write
        FBRGSUP_EXPIRE_TIME;
    property BRGSUP_EXPIRE_TIME1: Integer read FBRGSUP_EXPIRE_TIME1 write
        FBRGSUP_EXPIRE_TIME1;
    property BRGSUP_STOCK_IN_ORDER: Double read FBRGSUP_STOCK_IN_ORDER write
        FBRGSUP_STOCK_IN_ORDER;
    property BRGSUP_MIN_ORDER: Double read FBRGSUP_MIN_ORDER write
        FBRGSUP_MIN_ORDER;
    property BRGSUP_MAX_ORDER: Double read FBRGSUP_MAX_ORDER write
        FBRGSUP_MAX_ORDER;
    property BRGSUP_IS_PRIMARY: Integer read FBRGSUP_IS_PRIMARY write
        FBRGSUP_IS_PRIMARY;
    property BRGSUP_IS_BKP: Integer read FBRGSUP_IS_BKP write FBRGSUP_IS_BKP;
    property BRGSUP_IS_ACTIVE: Integer read FBRGSUP_IS_ACTIVE write
        FBRGSUP_IS_ACTIVE;
    property BRGSUP_FEE: Integer read FBRGSUP_FEE write FBRGSUP_FEE;
    property BRGSUP_MARK_UP: Integer read FBRGSUP_MARK_UP write FBRGSUP_MARK_UP;
    [AttributeOfForeign('REF$SATUAN_PURCHASE')]
    property SATUAN_PURCHASE: TModSatuan read FSATUAN_PURCHASE write
        FSATUAN_PURCHASE;
    [AttributeOfForeign('SUPLIER_ID')]
    property Supplier: TModSuplier read FSupplier write FSupplier;
  end;



implementation


class function TModTipeBarang.GetTableName: String;
begin
  Result := 'REF$TIPE_BARANG';
end;

class function TModMerk.GetTableName: String;
begin
  Result := 'MERK';
end;

class function TModBarang.GetTableName: string;
begin
  Result := 'BARANG';
end;

class function TModLokasi.GetTableName: string;
begin
  Result := 'REF$LOKASI';
end;

class function TModBarangSupplier.GetTableName: string;
begin
  Result := 'BARANG_SUPLIER';
end;

initialization
  TModMerchandise.RegisterRTTI;
  TModMerchandiseGroup.RegisterRTTI;
  TModSubGroup.RegisterRTTI;
  TModKategori.RegisterRTTI;
  TModTipeBarang.RegisterRTTI;
  TModMerk.RegisterRTTI;
  TModLokasi.RegisterRTTI;
  TModBarang.RegisterRTTI;
  TModBarangSupplier.RegisterRTTI;

end.
