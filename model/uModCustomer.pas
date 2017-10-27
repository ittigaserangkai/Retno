unit uModCustomer;

interface

uses
  uModApp, uModSuplier, uModTipePembayaran;

type
  TModCustomer = class(TModApp)
  private
    FCUST_ADDRESS: string;
    FCUST_CITY: string;
    FCUST_CODE: string;
    FCUST_CONTACT_PERSON: string;
    FCUST_DESCRIPTION: string;
    FCUST_FAX: Integer;
    FCUST_IS_PKP: Integer;
    FCUST_IS_PPH23: Integer;
    FCUST_IS_PRINCIPAL: Integer;
    FCUST_LR_TAX: string;
    FCUST_NAME: string;
    FCUST_NPWP: string;
    FCUST_POST_CODE: string;
    FCUST_TELP: string;
    FCUST_TITLE: string;
    FCUST_TOP: Integer;
    FMODMERCHANDISE_GRUP: TModMerchandiseGroup;
    FMODTIPE_PEMBAYARAN: TModTipePembayaran;
  published
    property CUST_ADDRESS: string read FCUST_ADDRESS write FCUST_ADDRESS;
    property CUST_CITY: string read FCUST_CITY write FCUST_CITY;
    property CUST_CODE: string read FCUST_CODE write FCUST_CODE;
    property CUST_CONTACT_PERSON: string read FCUST_CONTACT_PERSON write
        FCUST_CONTACT_PERSON;
    property CUST_DESCRIPTION: string read FCUST_DESCRIPTION write
        FCUST_DESCRIPTION;
    property CUST_FAX: Integer read FCUST_FAX write FCUST_FAX;
    property CUST_IS_PKP: Integer read FCUST_IS_PKP write FCUST_IS_PKP;
    property CUST_IS_PPH23: Integer read FCUST_IS_PPH23 write FCUST_IS_PPH23;
    property CUST_IS_PRINCIPAL: Integer read FCUST_IS_PRINCIPAL write
        FCUST_IS_PRINCIPAL;
    property CUST_LR_TAX: string read FCUST_LR_TAX write FCUST_LR_TAX;
    property CUST_NAME: string read FCUST_NAME write FCUST_NAME;
    property CUST_NPWP: string read FCUST_NPWP write FCUST_NPWP;
    property CUST_POST_CODE: string read FCUST_POST_CODE write FCUST_POST_CODE;
    property CUST_TELP: string read FCUST_TELP write FCUST_TELP;
    property CUST_TITLE: string read FCUST_TITLE write FCUST_TITLE;
    property CUST_TOP: Integer read FCUST_TOP write FCUST_TOP;
    property MODMERCHANDISE_GRUP: TModMerchandiseGroup read FMODMERCHANDISE_GRUP
        write FMODMERCHANDISE_GRUP;
    property MODTIPE_PEMBAYARAN: TModTipePembayaran read FMODTIPE_PEMBAYARAN write
        FMODTIPE_PEMBAYARAN;
  end;

implementation

initialization
  TModCustomer.RegisterRTTI;

end.
