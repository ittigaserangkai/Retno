unit uModVoucher;

interface

uses
  uModApp, uModUnit, uModAgreementVoucher, System.Generics.Collections;

type
  TmodVoucherDetil = class;
  TModVoucher = class(TModApp)
  private
    FAGREEMENTVOUCHER: TModAgreementVoucher;
    FAUTUNIT: TModUnit;
    FVCR_EXPIRE_DATE: TDateTime;
    FVCR_ISSUED_DATE: TDateTime;
    FVCR_NOMINAL: Double;
    FVCR_QTY: Double;
    FVCR_START_DATE: TDateTime;
    FVoucherDetils: TobjectList<TModVoucherDetil>;
    function GetVoucherDetils: TobjectList<TModVoucherDetil>;
  public
    property VoucherDetils: TobjectList<TModVoucherDetil> read GetVoucherDetils
        write FVoucherDetils;
  published
    [AttributeOfForeign('AGREEMENT_VOUCHER_ID')]
    property AGREEMENTVOUCHER: TModAgreementVoucher read FAGREEMENTVOUCHER write
        FAGREEMENTVOUCHER;
    [AttributeOfForeign('AUT$UNIT_ID')]
    property AUTUNIT: TModUnit read FAUTUNIT write FAUTUNIT;
    property VCR_EXPIRE_DATE: TDateTime read FVCR_EXPIRE_DATE write
        FVCR_EXPIRE_DATE;
    property VCR_ISSUED_DATE: TDateTime read FVCR_ISSUED_DATE write
        FVCR_ISSUED_DATE;
    property VCR_NOMINAL: Double read FVCR_NOMINAL write FVCR_NOMINAL;
    property VCR_QTY: Double read FVCR_QTY write FVCR_QTY;
    property VCR_START_DATE: TDateTime read FVCR_START_DATE write FVCR_START_DATE;
  end;

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
    [AttributeOfForeign('AUT$UNIT_ID')]
    property AUTUNIT: TModUnit read FAUTUNIT write FAUTUNIT;
    property VCRD_NO: string read FVCRD_NO write FVCRD_NO;
    property VCRD_NOMINAL: Double read FVCRD_NOMINAL write FVCRD_NOMINAL;
    property VCRD_POS_TRANS_NO: string read FVCRD_POS_TRANS_NO write
        FVCRD_POS_TRANS_NO;
    property VCRD_STATUS: string read FVCRD_STATUS write FVCRD_STATUS;
    [AttributeOfHeader]
    property VOUCHER: TModVoucher read FVOUCHER write FVOUCHER;
  end;

implementation

class function TModVoucherDetil.GetTableName: String;
begin
  Result := 'VOUCHER_DETIL';
end;

function TModVoucher.GetVoucherDetils: TobjectList<TModVoucherDetil>;
begin
  if FVoucherDetils = nil then
    FVoucherDetils := TObjectList<TModVoucherDetil>.Create();

  Result := FVoucherDetils;
end;

initialization
  TModVoucher.RegisterRTTI;
  TModVoucherDetil.RegisterRTTI;

end.
