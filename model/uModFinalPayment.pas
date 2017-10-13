unit uModFinalPayment;

interface

uses
  uModApp, uModBeginningBalance;

type
  TModFinalPayment = class(TModApp)
  private
    FBEGINNING_BALANCE: TModBeginningBalance;
    FFINPAYMENT_TOTAL: Double;
  public
    class function GetTableName: String; override;
  published
    property BEGINNING_BALANCE: TModBeginningBalance read FBEGINNING_BALANCE write
        FBEGINNING_BALANCE;
    property FINPAYMENT_TOTAL: Double read FFINPAYMENT_TOTAL write
        FFINPAYMENT_TOTAL;
  end;

implementation

class function TModFinalPayment.GetTableName: String;
begin
  Result := 'FINAL_PAYMENT';
end;

initialization
  TModFinalPayment.RegisterRTTI;

end.
