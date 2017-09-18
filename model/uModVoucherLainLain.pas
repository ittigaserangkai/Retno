unit uModVoucherLainLain;

interface

uses
  uModApp, uModUnit;

type
  TModVoucherLainLain = class(TModApp)
  private
    FAutUnit: TModUnit;
    FVCRL_IS_ACTIVE: Integer;
    FVCRL_QTY: Double;
    FVCRL_TOTAL_VALUE: Double;
    FVCRL_TRANS_NO: string;
    FVCRL_VALUE: Double;
  public
    class function GetTableName: String; override;
  published
    [AttributeOfForeign('AUT$UNIT_ID')]
    property AutUnit: TModUnit read FAutUnit write FAutUnit;
    property VCRL_IS_ACTIVE: Integer read FVCRL_IS_ACTIVE write FVCRL_IS_ACTIVE;
    property VCRL_QTY: Double read FVCRL_QTY write FVCRL_QTY;
    property VCRL_TOTAL_VALUE: Double read FVCRL_TOTAL_VALUE write
        FVCRL_TOTAL_VALUE;
    property VCRL_TRANS_NO: string read FVCRL_TRANS_NO write FVCRL_TRANS_NO;
    property VCRL_VALUE: Double read FVCRL_VALUE write FVCRL_VALUE;
  end;

implementation

class function TModVoucherLainLain.GetTableName: String;
begin
  Result := 'VOUCHER_LAIN_LAIN';
end;

initialization
  TModVoucherLainLain.RegisterRTTI;

end.
