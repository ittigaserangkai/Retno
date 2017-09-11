unit uModVoucher;

interface

uses
  uModApp, uModUnit, uModAgreementVoucher;

type
  TModVoucher = class(TModApp)
  private
    FAGREEMENTVOUCHER: TModAgreementVoucher;
    FVCR_EXPIRE_DATE: TDateTime;
    FVCR_ISSUED_DATE: TDateTime;
    FVCR_NOMINAL: Double;
    FVCR_QTY: Double;
    FVCR_START_DATE: TDateTime;
  published
    [AttributeOfForeign]
    property AGREEMENTVOUCHER: TModAgreementVoucher read FAGREEMENTVOUCHER write
        FAGREEMENTVOUCHER;
    property VCR_EXPIRE_DATE: TDateTime read FVCR_EXPIRE_DATE write
        FVCR_EXPIRE_DATE;
    property VCR_ISSUED_DATE: TDateTime read FVCR_ISSUED_DATE write
        FVCR_ISSUED_DATE;
    property VCR_NOMINAL: Double read FVCR_NOMINAL write FVCR_NOMINAL;
    property VCR_QTY: Double read FVCR_QTY write FVCR_QTY;
    property VCR_START_DATE: TDateTime read FVCR_START_DATE write FVCR_START_DATE;
  end;

implementation

initialization
  TModVoucher.RegisterRTTI;

end.
