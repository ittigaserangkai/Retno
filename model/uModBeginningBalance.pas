unit uModBeginningBalance;

interface

uses
  uModApp, uModUnit, uModAuthUser, uModSetupPOS, uModShift;

type
  TModBeginningBalance = class(TModApp)
  private
    FAUTUNIT: TModUnit;
    FAUTUSER: TModAuthUser;
    FBALANCE_DESCRIPTION: string;
    FBALANCE_MODAL: Double;
    FBALANCE_SHIFT_DATE: TDateTime;
    FBALANCE_STATUS: string;
    FISJOURNALIZED: Integer;
    FSETUPPOS: TModSetupPOS;
    FSHIFT: TModShift;
  public
    class function GetTableName: String; override;
  published
    [AttributeOfForeign('AUT$UNIT_ID')]
    property AUTUNIT: TModUnit read FAUTUNIT write FAUTUNIT;
    [AttributeOfForeign('AUT$USER_ID')]
    property AUTUSER: TModAuthUser read FAUTUSER write FAUTUSER;
    property BALANCE_DESCRIPTION: string read FBALANCE_DESCRIPTION write
        FBALANCE_DESCRIPTION;
    property BALANCE_MODAL: Double read FBALANCE_MODAL write FBALANCE_MODAL;
    property BALANCE_SHIFT_DATE: TDateTime read FBALANCE_SHIFT_DATE write
        FBALANCE_SHIFT_DATE;
    property BALANCE_STATUS: string read FBALANCE_STATUS write FBALANCE_STATUS;
    property ISJOURNALIZED: Integer read FISJOURNALIZED write FISJOURNALIZED;
    [AttributeOfForeign]
    property SETUPPOS: TModSetupPOS read FSETUPPOS write FSETUPPOS;
    [AttributeOfForeign]
    property SHIFT: TModShift read FSHIFT write FSHIFT;
  end;

implementation

class function TModBeginningBalance.GetTableName: String;
begin
  Result := 'BEGINNING_BALANCE';
end;

initialization
  TModBeginningBalance.RegisterRTTI;

end.
