unit uModCreditCard;

interface

uses
  uModApp, uModRekening;

type
  TModCreditCard = class(TModApp)
  private
    FCARD_CHARGE: Double;
    FCARD_CODE: string;
    FCARD_DISCOUNT: Double;
    FCARD_IS_ACTIVE: Integer;
    FCARD_IS_CASHBACK: Integer;
    FCARD_IS_CREDIT: Integer;
    FCARD_IS_KRING: Integer;
    FCARD_LIMIT: Double;
    FCARD_NAME: string;
    FREKENING: TModRekening;
    FREKENING_CASH_BACK: TModRekening;
  public
    class function GetTableName: string; override;
  published
    property CARD_CHARGE: Double read FCARD_CHARGE write FCARD_CHARGE;
    [AttributeOfCode]
    property CARD_CODE: string read FCARD_CODE write FCARD_CODE;
    property CARD_DISCOUNT: Double read FCARD_DISCOUNT write FCARD_DISCOUNT;
    property CARD_IS_ACTIVE: Integer read FCARD_IS_ACTIVE write FCARD_IS_ACTIVE;
    property CARD_IS_CASHBACK: Integer read FCARD_IS_CASHBACK write
        FCARD_IS_CASHBACK;
    property CARD_IS_CREDIT: Integer read FCARD_IS_CREDIT write FCARD_IS_CREDIT;
    property CARD_IS_KRING: Integer read FCARD_IS_KRING write FCARD_IS_KRING;
    property CARD_LIMIT: Double read FCARD_LIMIT write FCARD_LIMIT;
    [AttributeOfCode]
    property CARD_NAME: string read FCARD_NAME write FCARD_NAME;
    property REKENING: TModRekening read FREKENING write FREKENING;
//    [AttributeOfForeign('REKENING_CASH_BACK_ID')]
    property REKENING_CASH_BACK: TModRekening read FREKENING_CASH_BACK write
        FREKENING_CASH_BACK;
  end;

implementation

class function TModCreditCard.GetTableName: string;
begin
  inherited;
  Result := 'REF$CREDIT_CARD';
end;

initialization
  TModCreditCard.RegisterRTTI;

end.
