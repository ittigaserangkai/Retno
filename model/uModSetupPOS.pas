unit uModSetupPOS;

interface

uses
  uModApp, uModUnit;

type
  TModSetupPOS = class(TModApp)
  private
    FAUTUNIT: TModUnit;
    FSETUPPOS_COUNTER_NO: Integer;
    FSETUPPOS_DATE: TDateTime;
    FSETUPPOS_IP: string;
    FSETUPPOS_IS_ACTIVE: Integer;
    FSETUPPOS_IS_RESET: Integer;
    FSETUPPOS_NO_TRANSAKSI: string;
    FSETUPPOS_TERMINAL_CODE: string;
  published
    [AttributeOfForeign('AUT$UNIT_ID')]
    property AUTUNIT: TModUnit read FAUTUNIT write FAUTUNIT;
    property SETUPPOS_COUNTER_NO: Integer read FSETUPPOS_COUNTER_NO write
        FSETUPPOS_COUNTER_NO;
    property SETUPPOS_DATE: TDateTime read FSETUPPOS_DATE write FSETUPPOS_DATE;
    property SETUPPOS_IP: string read FSETUPPOS_IP write FSETUPPOS_IP;
    property SETUPPOS_IS_ACTIVE: Integer read FSETUPPOS_IS_ACTIVE write
        FSETUPPOS_IS_ACTIVE;
    property SETUPPOS_IS_RESET: Integer read FSETUPPOS_IS_RESET write
        FSETUPPOS_IS_RESET;
    property SETUPPOS_NO_TRANSAKSI: string read FSETUPPOS_NO_TRANSAKSI write
        FSETUPPOS_NO_TRANSAKSI;
    property SETUPPOS_TERMINAL_CODE: string read FSETUPPOS_TERMINAL_CODE write
        FSETUPPOS_TERMINAL_CODE;
  end;

implementation

initialization
  TModSetupPOS.RegisterRTTI;

end.
