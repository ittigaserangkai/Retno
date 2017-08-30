unit uModBeginningBalance;

interface

uses
  uModApp, uModUnit;

type
  TModBeginningBalance = class(TModApp)
  private
    FBALANCE_UNIT: TModUnit;
  public
    class function GetTableName: String; override;
  published
    [AttributeOfForeign('BALANCE_UNT_ID')]
    property BALANCE_UNIT: TModUnit read FBALANCE_UNIT write FBALANCE_UNIT;
  end;

implementation

class function TModBeginningBalance.GetTableName: String;
begin
  Result := 'BEGINNING_BALANCE';
end;

initialization
  TModBeginningBalance.RegisterRTTI;

end.
