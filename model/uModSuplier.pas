unit uModSuplier;

interface

uses
  uModApp, uModTipePerusahaan, uModBank, uModTipePembayaran,  uModTipeKirimPO,
  System.Generics.Collections, uModRefPajak;

type
  TModSuplierGroup = class;
  TModTipeSuplier = class;
  TModSuplierMerchanGroup = class;

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

  TModSuplier = class(TModApp)
  private
    FSUP_CODE: String;
    FSUP_NAME: String;
    FSUP_ADDRESS: String;
    FSUP_POST_CODE: String;
    FSUP_CITY: String;
    FSUP_TELP: String;
    FSUP_FAX: String;
    FSUP_CONTACT_PERSON: String;
    FSUP_TITLE: String;
    FTIPE_PERUSAHAAN: TModTipePerusahaan;
    FBANK: TModBank;
    FSuplierMerchanGroups: tobjectlist<TModSuplierMerchanGroup>;
    FSUP_BANK_ACCOUNT_NO: String;
    FSUP_BANK_ACCOUNT_NAME: String;
    FSUP_SERVICE_LEVEL: Double;
    FSUPLIER_GROUP: TModSuplierGroup;
    FSUP_NPWP_ALAMAT: String;
    FSUP_NPWP: String;
    FSUP_LR_TAX: String;
    FSUP_IS_PKP: Integer;
    FSUP_IS_ACTIVE: Integer;
    FSUP_BANK_BRANCH: String;
    FSUP_BANK_ADDRESS: String;
    FTIPE_SUPLIER: TModTipeSuplier;
    function GetSuplierMerchanGroups: tobjectlist<TModSuplierMerchanGroup>;
  public
    class function GetTableName: String; override;
    property SuplierMerchanGroups: tobjectlist<TModSuplierMerchanGroup> read
        GetSuplierMerchanGroups write FSuplierMerchanGroups;
  published
    property BANK: TModBank read FBANK write FBANK;
    property SUPLIER_GROUP: TModSuplierGroup read FSUPLIER_GROUP write
        FSUPLIER_GROUP;
    property SUP_ADDRESS: String read FSUP_ADDRESS write FSUP_ADDRESS;
    property SUP_BANK_ACCOUNT_NAME: String read FSUP_BANK_ACCOUNT_NAME write
        FSUP_BANK_ACCOUNT_NAME;
    property SUP_BANK_ACCOUNT_NO: String read FSUP_BANK_ACCOUNT_NO write
        FSUP_BANK_ACCOUNT_NO;
    property SUP_CITY: String read FSUP_CITY write FSUP_CITY;
    property SUP_NPWP: String read FSUP_NPWP write FSUP_NPWP;
    [AttributeOfCode] //sebagai unique, penjegahan level progam sebelum direcord db
    property SUP_CODE: String read FSUP_CODE write FSUP_CODE;
    property SUP_CONTACT_PERSON: String read FSUP_CONTACT_PERSON write
        FSUP_CONTACT_PERSON;
    property SUP_FAX: String read FSUP_FAX write FSUP_FAX;
    property SUP_NPWP_ALAMAT: String read FSUP_NPWP_ALAMAT write FSUP_NPWP_ALAMAT;
    property SUP_LR_TAX: String read FSUP_LR_TAX write FSUP_LR_TAX;
    property SUP_IS_PKP: Integer read FSUP_IS_PKP write FSUP_IS_PKP;
    property SUP_IS_ACTIVE: Integer read FSUP_IS_ACTIVE write FSUP_IS_ACTIVE;
    property SUP_NAME: String read FSUP_NAME write FSUP_NAME;
    property SUP_BANK_BRANCH: String read FSUP_BANK_BRANCH write FSUP_BANK_BRANCH;
    property SUP_BANK_ADDRESS: String read FSUP_BANK_ADDRESS write
        FSUP_BANK_ADDRESS;
    property SUP_POST_CODE: String read FSUP_POST_CODE write FSUP_POST_CODE;
    property SUP_SERVICE_LEVEL: Double read FSUP_SERVICE_LEVEL write
        FSUP_SERVICE_LEVEL;
    property SUP_TELP: String read FSUP_TELP write FSUP_TELP;
    property SUP_TITLE: String read FSUP_TITLE write FSUP_TITLE;
    [AttributeOfForeign('REF$TIPE_PERUSAHAAN_ID')] //relasi dg tabel lain yg butuh karakter unik
    property TIPE_PERUSAHAAN: TModTipePerusahaan read FTIPE_PERUSAHAAN write
        FTIPE_PERUSAHAAN;
    [AttributeOfForeign('REF$TIPE_SUPLIER_ID')]    //relasi dg tabel lain yg butuh karakter unik
    property TIPE_SUPLIER: TModTipeSuplier read FTIPE_SUPLIER write FTIPE_SUPLIER;
  end;

  TModSuplierGroup = class(TModApp)
  private
    FGROUP_CODE: String;
    FGROUP_NAME: String;
    FGROUP_DESCRIPTION: String;
  public
    class function GetTableName: String; override;
  published
    property GROUP_DESCRIPTION: String read FGROUP_DESCRIPTION write
        FGROUP_DESCRIPTION;
    property GROUP_NAME: String read FGROUP_NAME write FGROUP_NAME;
    [AttributeOfCode]
    property GROUP_CODE: String read FGROUP_CODE write FGROUP_CODE;
  end;

  TModTipeSuplier = class(TModApp)
  private
    FTPSUP_CODE: String;
    FTPSUP_NAME: String;
  public
    class function GetTableName: String; override;
  published
    [AttributeOfCode]
    property TPSUP_CODE: String read FTPSUP_CODE write FTPSUP_CODE;
    property TPSUP_NAME: String read FTPSUP_NAME write FTPSUP_NAME;
  end;


  [AttrUpdateDetails]
  TModSuplierMerchanGroup = class(TModApp)
  private
    FSUPLIER: TModSuplier;
    FMERCHANDISE_GRUP: TModMerchandiseGroup;
    FSUPMG_IS_ENABLE_CN: Integer;
    FSUPMG_CREDIT_LIMIT: Double;
    FTIPE_PEMBAYARAN: TModTipePembayaran;
    FSUPMG_TOP: Integer;
    FSUPMG_LEAD_TIME: Integer;
    FSUPMG_AP_ENDING_BALANCE: Double;
    FSUPMG_CN_BALANCE: Double;
    FSUPMG_LAST_PAYMENT: Double;
    FSUPMG_OUTSTANDING_PAYMENT: Double;
    FSUPMG_LAST_PURCHASE: TDateTime;
    FSUPMG_NO_OF_PO: Integer;
    FSUPMG_DESCRIPTION: string;
    FSUPMG_IS_MON: Integer;
    FSUPMG_IS_TUE: Integer;
    FSUPMG_IS_WED: Integer;
    FSUPMG_IS_THU: Integer;
    FSUPMG_IS_FRI: Integer;
    FSUPMG_IS_SAT: Integer;
    FSUPMG_IS_SUN: Integer;
    FTIPE_KIRIM_PO: TModTipeKirimPO;
    FSUPMG_ADDRESS: string;
    FSUPMG_CITY: string;
    FSUPMG_POST_CODE: string;
    FSUPMG_TELP: string;
    FSUPMG_FAX: string;
    FSUPMG_CONTACT_PERSON: string;
    FSUPMG_TITLE: string;
    FBANK: TModBank;
    FSUPMG_BANK_ACCOUNT_NO: string;
    FSUPMG_BANK_ACCOUNT_NAME: string;
    FSUPMG_SUB_CODE: string;
    FSUPMG_FEE: Double;
    FSUPMG_IS_PKP: Integer;
    FSUPMG_IS_ID_DIFF: Integer;
    FSUPMG_IS_FEE_4ALL: Integer;
    FSUPMG_HO_AUTHORIZE: Integer;
    FSUPMG_PAJAK: TModRefPajak;
    FSUPMG_DISC: Double;
    FSUPMG_NAME: string;
    FSUPMG_IS_DIF_CONTACT: Integer;
  public
    class function GetTableName: String; override;
  published
    [AttributeOfHeader]
    property SUPLIER: TModSuplier read FSUPLIER write FSUPLIER;
    [AttributeOfForeign('REF$MERCHANDISE_GRUP_ID')]    //relasi dg tabel lain yg butuh karakter unik
    property MERCHANDISE_GRUP: TModMerchandiseGroup read FMERCHANDISE_GRUP write
        FMERCHANDISE_GRUP;
    property SUPMG_IS_ENABLE_CN: Integer read FSUPMG_IS_ENABLE_CN write
        FSUPMG_IS_ENABLE_CN;
    property SUPMG_CREDIT_LIMIT: Double read FSUPMG_CREDIT_LIMIT write
        FSUPMG_CREDIT_LIMIT;
    [AttributeOfForeign('REF$TIPE_PEMBAYARAN_ID')]    //relasi dg tabel lain yg butuh karakter unik
    property TIPE_PEMBAYARAN: TModTipePembayaran read FTIPE_PEMBAYARAN write
        FTIPE_PEMBAYARAN;
    property SUPMG_TOP: Integer read FSUPMG_TOP write FSUPMG_TOP;
    property SUPMG_LEAD_TIME: Integer read FSUPMG_LEAD_TIME write FSUPMG_LEAD_TIME;
    property SUPMG_AP_ENDING_BALANCE: Double read FSUPMG_AP_ENDING_BALANCE write
        FSUPMG_AP_ENDING_BALANCE;
    property SUPMG_CN_BALANCE: Double read FSUPMG_CN_BALANCE write
        FSUPMG_CN_BALANCE;
    property SUPMG_LAST_PAYMENT: Double read FSUPMG_LAST_PAYMENT write
        FSUPMG_LAST_PAYMENT;
    property SUPMG_OUTSTANDING_PAYMENT: Double read FSUPMG_OUTSTANDING_PAYMENT
        write FSUPMG_OUTSTANDING_PAYMENT;
    property SUPMG_LAST_PURCHASE: TDateTime read FSUPMG_LAST_PURCHASE write
        FSUPMG_LAST_PURCHASE;
    property SUPMG_NO_OF_PO: Integer read FSUPMG_NO_OF_PO write FSUPMG_NO_OF_PO;
    property SUPMG_DESCRIPTION: string read FSUPMG_DESCRIPTION write
        FSUPMG_DESCRIPTION;
    property SUPMG_IS_MON: Integer read FSUPMG_IS_MON write FSUPMG_IS_MON;
    property SUPMG_IS_TUE: Integer read FSUPMG_IS_TUE write FSUPMG_IS_TUE;
    property SUPMG_IS_WED: Integer read FSUPMG_IS_WED write FSUPMG_IS_WED;
    property SUPMG_IS_THU: Integer read FSUPMG_IS_THU write FSUPMG_IS_THU;
    property SUPMG_IS_FRI: Integer read FSUPMG_IS_FRI write FSUPMG_IS_FRI;
    property SUPMG_IS_SAT: Integer read FSUPMG_IS_SAT write FSUPMG_IS_SAT;
    property SUPMG_IS_SUN: Integer read FSUPMG_IS_SUN write FSUPMG_IS_SUN;
    [AttributeOfForeign('REF$TIPE_KIRIM_PO_ID')]    //relasi dg tabel lain yg butuh karakter unik
    property TIPE_KIRIM_PO: TModTipeKirimPO read FTIPE_KIRIM_PO write
        FTIPE_KIRIM_PO;
    property SUPMG_ADDRESS: string read FSUPMG_ADDRESS write FSUPMG_ADDRESS;
    property SUPMG_CITY: string read FSUPMG_CITY write FSUPMG_CITY;
    property SUPMG_POST_CODE: string read FSUPMG_POST_CODE write FSUPMG_POST_CODE;
    property SUPMG_TELP: string read FSUPMG_TELP write FSUPMG_TELP;
    property SUPMG_FAX: string read FSUPMG_FAX write FSUPMG_FAX;
    property SUPMG_CONTACT_PERSON: string read FSUPMG_CONTACT_PERSON write
        FSUPMG_CONTACT_PERSON;
    property SUPMG_TITLE: string read FSUPMG_TITLE write FSUPMG_TITLE;
    property BANK: TModBank read FBANK write FBANK;
    property SUPMG_BANK_ACCOUNT_NO: string read FSUPMG_BANK_ACCOUNT_NO write
        FSUPMG_BANK_ACCOUNT_NO;
    property SUPMG_BANK_ACCOUNT_NAME: string read FSUPMG_BANK_ACCOUNT_NAME write
        FSUPMG_BANK_ACCOUNT_NAME;
    property SUPMG_SUB_CODE: string read FSUPMG_SUB_CODE write FSUPMG_SUB_CODE;
    property SUPMG_FEE: Double read FSUPMG_FEE write FSUPMG_FEE;
    property SUPMG_IS_PKP: Integer read FSUPMG_IS_PKP write FSUPMG_IS_PKP;
    property SUPMG_IS_ID_DIFF: Integer read FSUPMG_IS_ID_DIFF write
        FSUPMG_IS_ID_DIFF;
    property SUPMG_IS_FEE_4ALL: Integer read FSUPMG_IS_FEE_4ALL write
        FSUPMG_IS_FEE_4ALL;
    property SUPMG_HO_AUTHORIZE: Integer read FSUPMG_HO_AUTHORIZE write
        FSUPMG_HO_AUTHORIZE;
    [AttributeOfForeign('REF$PAJAK_ID')]
    property SUPMG_PAJAK: TModRefPajak read FSUPMG_PAJAK write FSUPMG_PAJAK;
    property SUPMG_DISC: Double read FSUPMG_DISC write FSUPMG_DISC;
    property SUPMG_NAME: string read FSUPMG_NAME write FSUPMG_NAME;
    property SUPMG_IS_DIF_CONTACT: Integer read FSUPMG_IS_DIF_CONTACT write
        FSUPMG_IS_DIF_CONTACT;
  end;


implementation

function TModSuplier.GetSuplierMerchanGroups:
    Tobjectlist<TModSuplierMerchanGroup>;

begin
  if not assigned(FSuplierMerchanGroups) then
    FSuplierMerchanGroups := Tobjectlist<TModSuplierMerchanGroup>.create;
  Result := FSuplierMerchanGroups;
end;

class function TModSuplier.GetTableName: String;
begin
  Result := 'SUPLIER';
end;

class function TModSuplierGroup.GetTableName: String;
begin
  Result := 'SUPLIER_GROUP';
end;

class function TModTipeSuplier.GetTableName: String;
begin
  Result := 'REF$TIPE_SUPLIER';
end;

class function TModSuplierMerchanGroup.GetTableName: String;
begin
  Result := 'SUPLIER_MERCHAN_GRUP';
end;

class function TModMerchandiseGroup.GetTableName: String;
begin
  Result := 'REF$MERCHANDISE_GRUP';
end;

class function TModMerchandise.GetTableName: String;
begin
  Result := 'REF$MERCHANDISE';
end;

class function TModSubGroup.GetTableName: String;
begin
  Result := 'REF$SUB_GRUP';
end;

class function TModKategori.GetTableName: String;
begin
  Result := 'REF$KATEGORI';
end;

initialization
  //if error "can not instantiate type of uModel.xxxx" occured, register here
  TModSuplier.RegisterRTTI;
  TModSuplierGroup.RegisterRTTI;
  TModTipeSuplier.RegisterRTTI;
  TModSuplierMerchanGroup.RegisterRTTI;
end.
