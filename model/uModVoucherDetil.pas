unit uModVoucherDetil;

interface

uses
  uModApp, uModUnit, uModVoucher;

type
  TModVoucherDetil = class(TModApp)
  private
    FAUTUNIT: TModUnit;
    FVCRD_NO: string;
    FVCRD_NOMINAL: Double;
    FVCRD_POS_TRANS_NO: string;
    FVCRD_STATUS: string;
    FVOUCHER: TModVoucher;
  public
    class function GetTableName: String; override;
  published
    [AttributeOfForeign]
    property AUTUNIT: TModUnit read FAUTUNIT write FAUTUNIT;
    property VCRD_NO: string read FVCRD_NO write FVCRD_NO;
    property VCRD_NOMINAL: Double read FVCRD_NOMINAL write FVCRD_NOMINAL;
    property VCRD_POS_TRANS_NO: string read FVCRD_POS_TRANS_NO write
        FVCRD_POS_TRANS_NO;
    property VCRD_STATUS: string read FVCRD_STATUS write FVCRD_STATUS;
    [AttributeOfForeign]
    property VOUCHER: TModVoucher read FVOUCHER write FVOUCHER;
  end;

implementation

class function TModVoucherDetil.GetTableName: String;
begin
  Result := 'VOUCHER_DETIL';
end;

initialization
  TModVoucherDetil.RegisterRTTI;

end.
