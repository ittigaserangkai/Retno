unit uModAgreement;

interface

uses
  uModApp, uModRefPajak, uModTipePembayaran, uModCustomer, uModProdukJasa,
  uModBank;

type
  TModAgreement = class(TModApp)
  private
    FAGR_DATE_END: TDatetime;
    FAGR_DATE_INV: TDateTime;
    FAGR_DATE_START: TDatetime;
    FAGR_DESCRIPTION: string;
    FAGR_INV_CNT: Integer;
    FAGR_IS_BKP: Integer;
    FAGR_IS_PPH23: Integer;
    FAGR_IS_PPN: Integer;
    FAGR_NO: string;
    FAGR_PER_CNT: Integer;
    FMODABANK: TModBank;
    FMODCUSTOMER: TModCustomer;
    FMODPAJAK: TModRefPajak;
    FMODTIPEBAYAR: TModTipePembayaran;
  published
    property AGR_DATE_END: TDatetime read FAGR_DATE_END write FAGR_DATE_END;
    property AGR_DATE_INV: TDateTime read FAGR_DATE_INV write FAGR_DATE_INV;
    property AGR_DATE_START: TDatetime read FAGR_DATE_START write
        FAGR_DATE_START;
    property AGR_DESCRIPTION: string read FAGR_DESCRIPTION write
        FAGR_DESCRIPTION;
    property AGR_INV_CNT: Integer read FAGR_INV_CNT write FAGR_INV_CNT;
    property AGR_IS_BKP: Integer read FAGR_IS_BKP write FAGR_IS_BKP;
    property AGR_IS_PPH23: Integer read FAGR_IS_PPH23 write FAGR_IS_PPH23;
    property AGR_IS_PPN: Integer read FAGR_IS_PPN write FAGR_IS_PPN;
    property AGR_NO: string read FAGR_NO write FAGR_NO;
    property AGR_PER_CNT: Integer read FAGR_PER_CNT write FAGR_PER_CNT;
    property MODABANK: TModBank read FMODABANK write FMODABANK;
    property MODCUSTOMER: TModCustomer read FMODCUSTOMER write FMODCUSTOMER;
    property MODPAJAK: TModRefPajak read FMODPAJAK write FMODPAJAK;
    property MODTIPEBAYAR: TModTipePembayaran read FMODTIPEBAYAR write
        FMODTIPEBAYAR;
  end;

  TModAgreementDetil = class(TModApp)
  private
    FAGRD_PRICE: Double;
    FAGRD_PRICE_PPN: Double;
    FAGRD_QTY: Double;
    FAGRD_SUBTOTAL: Double;
    FAGRD_TOTAL: Double;
    FMODAGREEMENT: TModAgreement;
    FMODPRODUKJASA: TModProdukJasa;
  published
    property AGRD_PRICE: Double read FAGRD_PRICE write FAGRD_PRICE;
    property AGRD_PRICE_PPN: Double read FAGRD_PRICE_PPN write FAGRD_PRICE_PPN;
    property AGRD_QTY: Double read FAGRD_QTY write FAGRD_QTY;
    property AGRD_SUBTOTAL: Double read FAGRD_SUBTOTAL write FAGRD_SUBTOTAL;
    property AGRD_TOTAL: Double read FAGRD_TOTAL write FAGRD_TOTAL;
    property MODAGREEMENT: TModAgreement read FMODAGREEMENT write FMODAGREEMENT;
    property MODPRODUKJASA: TModProdukJasa read FMODPRODUKJASA write
        FMODPRODUKJASA;
  end;

  TModAgreementJadwal = class(TModApp)
  private
    FAGRJDWL_DESCRIPTION: string;
    FAGRJDWL_DUE_DATE: Integer;
    FAGRJDWL_NOINVOICE: string;
    FAGRJDWL_TERM_NO: Integer;
    FAGRJDWL_TRANSDATE: TDateTime;
    FMODAGREEMENT: TModAgreement;
    FMODCUSTOMER: TModCustomer;
  published
    property AGRJDWL_DESCRIPTION: string read FAGRJDWL_DESCRIPTION write
        FAGRJDWL_DESCRIPTION;
    property AGRJDWL_DUE_DATE: Integer read FAGRJDWL_DUE_DATE write
        FAGRJDWL_DUE_DATE;
    property AGRJDWL_NOINVOICE: string read FAGRJDWL_NOINVOICE write
        FAGRJDWL_NOINVOICE;
    property AGRJDWL_TERM_NO: Integer read FAGRJDWL_TERM_NO write
        FAGRJDWL_TERM_NO;
    property AGRJDWL_TRANSDATE: TDateTime read FAGRJDWL_TRANSDATE write
        FAGRJDWL_TRANSDATE;
    property MODAGREEMENT: TModAgreement read FMODAGREEMENT write FMODAGREEMENT;
    property MODCUSTOMER: TModCustomer read FMODCUSTOMER write FMODCUSTOMER;
  end;

implementation

initialization
  TModAgreement.RegisterRTTI;
  TModAgreementDetil.RegisterRTTI;
  TModAgreementJadwal.RegisterRTTI;
end.
