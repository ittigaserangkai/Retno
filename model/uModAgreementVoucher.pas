unit uModAgreementVoucher;

interface

uses
  uModApp, uModCustomerVoucher;

type
  TModAgreementVoucher = class(TModApp)
  private
    FAGRV_DATE: TDateTime;
    FAGRV_DISC: Double;
    FAGRV_DUE_DATE: TDateTime;
    FAGRV_NO: string;
    FAGRV_STATUS: string;
    FAGRV_TOTAL: Double;
    FAGRV_TOTAL_AFTER_DISC: Double;
    FCUSTVOUCHER: TModCustomerVoucher;
  public
    class function GetTableName: String; override;
  published
    property AGRV_DATE: TDateTime read FAGRV_DATE write FAGRV_DATE;
    property AGRV_DISC: Double read FAGRV_DISC write FAGRV_DISC;
    property AGRV_DUE_DATE: TDateTime read FAGRV_DUE_DATE write FAGRV_DUE_DATE;
    property AGRV_NO: string read FAGRV_NO write FAGRV_NO;
    property AGRV_STATUS: string read FAGRV_STATUS write FAGRV_STATUS;
    property AGRV_TOTAL: Double read FAGRV_TOTAL write FAGRV_TOTAL;
    property AGRV_TOTAL_AFTER_DISC: Double read FAGRV_TOTAL_AFTER_DISC write
        FAGRV_TOTAL_AFTER_DISC;
    [AttributeOfForeign]
    property CUSTVOUCHER: TModCustomerVoucher read FCUSTVOUCHER write FCUSTVOUCHER;
  end;

implementation

class function TModAgreementVoucher.GetTableName: String;
begin
  Result := 'AGREEMENT_VOUCHER';
end;

initialization
  TModAgreementVoucher.RegisterRTTI;

end.
