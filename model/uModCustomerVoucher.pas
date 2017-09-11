unit uModCustomerVoucher;

interface

uses
  uModApp;

type
  TModCustomerVoucher = class(TModApp)
  private
    FCUSTV_ADDRESS: string;
    FCUSTV_CODE: string;
    FCUSTV_CONTACT_PERSON: string;
    FCUSTV_COUNTER: Integer;
    FCUSTV_NAME: string;
    FCUSTV_TELP: string;
  public
    class function GetTableName: String; override;
  published
    property CUSTV_ADDRESS: string read FCUSTV_ADDRESS write FCUSTV_ADDRESS;
    property CUSTV_CODE: string read FCUSTV_CODE write FCUSTV_CODE;
    property CUSTV_CONTACT_PERSON: string read FCUSTV_CONTACT_PERSON write
        FCUSTV_CONTACT_PERSON;
    property CUSTV_COUNTER: Integer read FCUSTV_COUNTER write FCUSTV_COUNTER;
    property CUSTV_NAME: string read FCUSTV_NAME write FCUSTV_NAME;
    property CUSTV_TELP: string read FCUSTV_TELP write FCUSTV_TELP;
  end;

implementation

class function TModCustomerVoucher.GetTableName: String;
begin
  Result := 'CUSTOMER_VOUCHER';
end;

initialization
  TModCustomerVoucher.RegisterRTTI;

end.
