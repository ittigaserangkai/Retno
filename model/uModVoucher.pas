unit uModVoucher;

interface

uses
  uModApp, uModUnit, uModAgreementVoucher, System.Generics.Collections,
  uModOrganization, uModTransaksi;

type
  TmodVoucherDetil = class;
  TModVoucher = class(TModApp)
  private
    FAUTUNIT: TModUnit;
    FMODORGANIZATION: TModOrganization;
    FVCR_EXPIRE_DATE: TDateTime;
    FVCR_ISSUED_DATE: TDateTime;
    FVCR_NO: string;
    FVCR_NOMINAL: Double;
    FVCR_NOMINALBAYAR: Double;
    FVCR_QTY: Double;
    FVCR_START_DATE: TDateTime;
    FVCR_STATUS: string;
    FVoucherDetils: TobjectList<TModVoucherDetil>;
    function GetVoucherDetils: TobjectList<TModVoucherDetil>;
  public
    property VoucherDetils: TobjectList<TModVoucherDetil> read GetVoucherDetils
        write FVoucherDetils;
  published
    [AttributeOfForeign('AUT$UNIT_ID')]
    property AUTUNIT: TModUnit read FAUTUNIT write FAUTUNIT;
    property MODORGANIZATION: TModOrganization read FMODORGANIZATION write
        FMODORGANIZATION;
    property VCR_EXPIRE_DATE: TDateTime read FVCR_EXPIRE_DATE write
        FVCR_EXPIRE_DATE;
    property VCR_ISSUED_DATE: TDateTime read FVCR_ISSUED_DATE write
        FVCR_ISSUED_DATE;
    property VCR_NO: string read FVCR_NO write FVCR_NO;
    property VCR_NOMINAL: Double read FVCR_NOMINAL write FVCR_NOMINAL;
    property VCR_NOMINALBAYAR: Double read FVCR_NOMINALBAYAR write
        FVCR_NOMINALBAYAR;
    property VCR_QTY: Double read FVCR_QTY write FVCR_QTY;
    property VCR_START_DATE: TDateTime read FVCR_START_DATE write FVCR_START_DATE;
    property VCR_STATUS: string read FVCR_STATUS write FVCR_STATUS;
  end;

  TModVoucherDetil = class(TModApp)
  private
    FAUTUNIT: TModUnit;
    FMODORGANIZATION: TModOrganization;
    FMODTRANSAKSI: TModTransaksi;
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
    property MODORGANIZATION: TModOrganization read FMODORGANIZATION write
        FMODORGANIZATION;
    property MODTRANSAKSI: TModTransaksi read FMODTRANSAKSI write FMODTRANSAKSI;
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
