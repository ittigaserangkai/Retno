unit uModCustomer;

interface

uses
  uModApp, uModSuplier, uModTipePembayaran;

type
  TModCustomer = class(TModApp)
  private
    FCUST_CODE: String;
    FCUST_NAME: String;
    FCUST_ADDRESS: String;
    FCUST_CITY: String;
    FCUST_POST_CODE: String;
    FCUST_TELP: String;
    FCUST_FAX: String;
    FCUST_CONTACT_PERSON: String;
    FCUST_TITLE: String;
    FCUST_IS_PRINCIPAL: Integer;
    FCUST_DESCRIPTION: String;
    FCUST_TOP: Integer;
    FCUST_NPWP: String;
    FCUST_IS_PPH23: Integer;
    FCUST_LR_TAX: String;
    FCUST_IS_PKP: Integer;
    FSUPLIER_MERCHAN_GRUP_ID: String;
    FTIPE_PEMBAYARAN: String;
  public
    class function GetTableName: String; override;
  published
    [AttributeOfCode] //sebagai unique, penjegahan level progam sebelum direcord db
    property CUST_CODE: String read FCUST_CODE write FCUST_CODE;
    property CUST_NAME: String read FCUST_NAME write FCUST_NAME;
    property CUST_ADDRESS: String read FCUST_ADDRESS write FCUST_ADDRESS;
    property CUST_CITY: String read FCUST_CITY write FCUST_CITY;
    property CUST_POST_CODE: String read FCUST_POST_CODE write FCUST_POST_CODE;
    property CUST_TELP: String read FCUST_TELP write FCUST_TELP;
    property CUST_FAX: String read FCUST_FAX write FCUST_FAX;
    property CUST_CONTACT_PERSON: String read FCUST_CONTACT_PERSON write
        FCUST_CONTACT_PERSON;
    property CUST_TITLE: String read FCUST_TITLE write FCUST_TITLE;
    property CUST_IS_PRINCIPAL: Integer read FCUST_IS_PRINCIPAL write
        FCUST_IS_PRINCIPAL;
    property CUST_DESCRIPTION: String read FCUST_DESCRIPTION write
        FCUST_DESCRIPTION;
    property CUST_TOP: Integer read FCUST_TOP write FCUST_TOP;
    property CUST_NPWP: String read FCUST_NPWP write FCUST_NPWP;
    property CUST_IS_PPH23: Integer read FCUST_IS_PPH23 write FCUST_IS_PPH23;
    property CUST_LR_TAX: String read FCUST_LR_TAX write FCUST_LR_TAX;
    property CUST_IS_PKP: Integer read FCUST_IS_PKP write FCUST_IS_PKP;
    property SUPLIER_MERCHAN_GRUP_ID: String read FSUPLIER_MERCHAN_GRUP_ID write
        FSUPLIER_MERCHAN_GRUP_ID;
    [AttributeOfForeign('REF$TIPE_PEMBAYARAN_ID')]    //relasi dg tabel lain yg butuh karakter unik
    property TIPE_PEMBAYARAN: String read FTIPE_PEMBAYARAN write FTIPE_PEMBAYARAN;
  end;

implementation

class function TModCustomer.GetTableName: String;
begin
  Result := 'CUSTOMER';
end;

initialization
  TModCustomer.RegisterRTTI;

end.
