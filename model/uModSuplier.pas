unit uModSuplier;

interface

uses
  uModApp, uModTipePerusahaan, uModBank;

type
  TModSuplierGroup = class;
  TModTipeSuplier = class;
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
  public
    class function GetTableName: String; override;
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
    [AttributeOfForeign('REF$TIPE_SUPLIER_ID')] //relasi dg tabel lain yg butuh karakter unik
    property TIPE_SUPLIER: TModTipeSuplier read FTIPE_SUPLIER write FTIPE_SUPLIER;
  end;

  TModSuplierGroup = class(TModApp)
  private
    FGROUP_NO: String;
    FGROUP_NAME: String;
    FGROUP_DESCRIPTION: String;
  public
    class function GetTableName: String; override;
  published
    property GROUP_DESCRIPTION: String read FGROUP_DESCRIPTION write
        FGROUP_DESCRIPTION;
    property GROUP_NAME: String read FGROUP_NAME write FGROUP_NAME;
    property GROUP_NO: String read FGROUP_NO write FGROUP_NO;
  end;

  TModTipeSuplier = class(TModApp)
  private
    FTPSUP_CODE: String;
    FTPSUP_NAME: String;
  public
    class function GetTableName: String; override;
  published
    property TPSUP_CODE: String read FTPSUP_CODE write FTPSUP_CODE;
    property TPSUP_NAME: String read FTPSUP_NAME write FTPSUP_NAME;
  end;

implementation

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

initialization
  //if error "can not instantiate type of uModel.xxxx" occured, register here
  TModSuplier.RegisterRTTI;
  TModSuplierGroup.RegisterRTTI;
  TModTipeSuplier.RegisterRTTI;

end.
