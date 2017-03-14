unit uModBarang;

interface

uses
  uModApp, uModRefPajak, uModAuthApp, uModSatuan;

type
  TModMerchandise = class(TModApp)
  private
    FMERCHAN_CODE: string;
    FMERCHAN_NAME: string;
  public
    class function GetTableName: String; override;
  published
    [AttributeOfCode]
    property MERCHAN_CODE: string read FMERCHAN_CODE write FMERCHAN_CODE;
    property MERCHAN_NAME: string read FMERCHAN_NAME write FMERCHAN_NAME;
  end;

  TModMerchandiseGroup = class(TModApp)
  private
    FMerchandise: TModMerchandise;
    FMERCHANGRUP_CODE: string;
    FMERCHANGRUP_NAME: string;
  public
    class function GetTableName: String; override;
  published
    [AttributeofForeign('REF$MERCHANDISE_ID')]
    property Merchandise: TModMerchandise read FMerchandise write FMerchandise;
    [AttributeOfCode]
    property MERCHANGRUP_CODE: string read FMERCHANGRUP_CODE write
        FMERCHANGRUP_CODE;
    property MERCHANGRUP_NAME: string read FMERCHANGRUP_NAME write
        FMERCHANGRUP_NAME;
  end;

  TModSubGroup = class(TModApp)
  private
    FMerchandiseGroup: TModMerchandiseGroup;
    FSUBGRUP_CODE: string;
    FSUBGRUP_NAME: string;
  public
    class function GetTableName: String; override;
  published
    [AttributeofForeign('REF$MERCHANDISE_GRUP_ID')]
    property MerchandiseGroup: TModMerchandiseGroup read FMerchandiseGroup write
        FMerchandiseGroup;
    [AttributeOfCode]
    property SUBGRUP_CODE: string read FSUBGRUP_CODE write FSUBGRUP_CODE;
    property SUBGRUP_NAME: string read FSUBGRUP_NAME write FSUBGRUP_NAME;
  end;

  TModKategori = class(TModApp)
  private
    FSubGroup: TModSubGroup;
    FKAT_CODE: string;
    FKAT_NAME: string;
  public
    class function GetTableName: String; override;
  published
    [AttributeofForeign('REF$SUB_GRUP_ID')]
    property SubGroup: TModSubGroup read FSubGroup write FSubGroup;
    [AttributeOfCode]
    property KAT_CODE: string read FKAT_CODE write FKAT_CODE;
    property KAT_NAME: string read FKAT_NAME write FKAT_NAME;
  end;

  TModTipeBarang = class(TModApp)
  private
    FTPBRG_CODE: string;
    FTPBRG_NAME: string;
  public
    class function GetTableName: String; override;
  published
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
    property MERK_NAME: string read FMERK_NAME write FMERK_NAME;
    property MERK_DESCRIPTION: string read FMERK_DESCRIPTION write
        FMERK_DESCRIPTION;
  end;

type
  TModOutlet = class(TModApp)
  private
    FOUTLET_CODE: string;
    FOUTLET_NAME: string;
    FOUTLET_DESCRIPTION: string;
  public
    class function GetTableName: String; override;
  published
    property OUTLET_CODE: string read FOUTLET_CODE write FOUTLET_CODE;
    property OUTLET_NAME: string read FOUTLET_NAME write FOUTLET_NAME;
    property OUTLET_DESCRIPTION: string read FOUTLET_DESCRIPTION write
        FOUTLET_DESCRIPTION;
  end;

  TModBarang = class(TModApp)
  private
    FAUTHOR_ID: String;
    FPUBLISHER_ID: String;
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
    FBRG_IS_STOCK: String;
    FBRG_IS_VALIDATE: Integer;
    FBRG_LASTCOST: Double;
    FBRG_LENGTH: string;
    FBRG_LOK_CODE: string;
    FBRG_NAME5: String;
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
    FRefPajak: TModRefPajak;
    FSAFETY_STOCK: Double;
    FTipeBarang: TModTipeBarang;
    FValidate_User: TModAuthUser;
  public
    class function GetTableName: string; override;
  published
    property AUTHOR_ID: String read FAUTHOR_ID write FAUTHOR_ID;
    property PUBLISHER_ID: String read FPUBLISHER_ID write FPUBLISHER_ID;
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
    property BRG_IS_STOCK: String read FBRG_IS_STOCK write FBRG_IS_STOCK;
    property BRG_IS_VALIDATE: Integer read FBRG_IS_VALIDATE write FBRG_IS_VALIDATE;
    property BRG_LASTCOST: Double read FBRG_LASTCOST write FBRG_LASTCOST;
    property BRG_LENGTH: string read FBRG_LENGTH write FBRG_LENGTH;
    property BRG_LOK_CODE: string read FBRG_LOK_CODE write FBRG_LOK_CODE;
    property BRG_NAME5: String read FBRG_NAME5 write FBRG_NAME5;
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
    [AttributeOfForeign('REF$PAJAK_ID')]
    property RefPajak: TModRefPajak read FRefPajak write FRefPajak;
    property SAFETY_STOCK: Double read FSAFETY_STOCK write FSAFETY_STOCK;
    [AttributeOfForeign('REF$TIPE_BARANG_ID')]
    property TipeBarang: TModTipeBarang read FTipeBarang write FTipeBarang;
    [AttributeOfForeign('BRG_VALIDATE_USR_ID')]
    property Validate_User: TModAuthUser read FValidate_User write FValidate_User;
  end;

implementation


class function TModMerchandise.GetTableName: String;
begin
  Result := 'REF$MERCHANDISE';
end;

class function TModMerchandiseGroup.GetTableName: String;
begin
  Result := 'REF$MERCHANDISE_GRUP';
end;

class function TModSubGroup.GetTableName: String;
begin
  Result := 'REF$SUB_GRUP';
end;

class function TModKategori.GetTableName: String;
begin
  Result := 'REF$KATEGORI';
end;

class function TModTipeBarang.GetTableName: String;
begin
  Result := 'REF$TIPE_BARANG';
end;

class function TModMerk.GetTableName: String;
begin
  Result := 'MERK';
end;

class function TModOutlet.GetTableName: String;
begin
  Result := 'REF$OUTLET';
end;

class function TModBarang.GetTableName: string;
begin
  Result := 'BARANG';
end;

initialization
  TModMerchandise.RegisterRTTI;
  TModMerchandiseGroup.RegisterRTTI;
  TModSubGroup.RegisterRTTI;
  TModKategori.RegisterRTTI;
  TModTipeBarang.RegisterRTTI;
  TModMerk.RegisterRTTI;



end.
