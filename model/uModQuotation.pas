unit uModQuotation;

interface
uses
  uModApp, uModSuplier, uModBarang, uModSatuan, System.Generics.Collections;

type
  TModQuotationDetail = class;

  TModQuotation = class(TModApp)
  private
    FQUOT_DATE: TDatetime;
    FQUOT_DATE_EFFECTIVE: TDatetime;
    FQUOT_END_DATE: TDatetime;
    FQUOT_IS_MAILER: Integer;
    FQUOT_IS_PROCESSED: Integer;
    FQUOT_REF_NO: string;
    FQUOT_REF_NO1: string;
    FQUOT_REMARK: String;
    FDetails: TObjectList<TModQuotationDetail>;
    FSUPLIER_MERCHAN_GRUP: TModSuplierMerchanGroup;
    function GetDetails: TObjectList<TModQuotationDetail>;
  public
    class function GetTableName: String; override;
    property Details: TObjectList<TModQuotationDetail> read GetDetails write
        FDetails;
  published
    property QUOT_DATE: TDatetime read FQUOT_DATE write FQUOT_DATE;
    property QUOT_DATE_EFFECTIVE: TDatetime read FQUOT_DATE_EFFECTIVE write
        FQUOT_DATE_EFFECTIVE;
    property QUOT_END_DATE: TDatetime read FQUOT_END_DATE write FQUOT_END_DATE;
    property QUOT_IS_MAILER: Integer read FQUOT_IS_MAILER write FQUOT_IS_MAILER;
    property QUOT_IS_PROCESSED: Integer read FQUOT_IS_PROCESSED write
        FQUOT_IS_PROCESSED;
    property QUOT_REF_NO: string read FQUOT_REF_NO write FQUOT_REF_NO;
    property QUOT_REF_NO1: string read FQUOT_REF_NO1 write FQUOT_REF_NO1;
    property QUOT_REMARK: String read FQUOT_REMARK write FQUOT_REMARK;
    [AttributeOfForeign('REF$TIPE_SUPLIER_ID')]
    property SUPLIER_MERCHAN_GRUP: TModSuplierMerchanGroup read
        FSUPLIER_MERCHAN_GRUP write FSUPLIER_MERCHAN_GRUP;
  end;

  TModQuotationDetail = class(TModApp)
  private
    FQUOTATION: TModQuotation;
    FBARANG: TModBarang;
    FQUOTD_BUYPRICE: Double;
    FQUOTD_PRICE: Double;
    FQUOTD_MU_PERSEN: Double;
    FQUOTD_MU_RUPIAH: Double;
    FQUOTD_MU_RUPIAH_PLUS_PPN: Double;
    FQUOTD_HARGA_AVERAGE: Double;
    FQUOTD_DISC: Double;
    FQUOTD_DISC_PERSEN: Double;
    FSATUAN: TModSatuan;
    FTipeHarga: TModTipeHarga;
  public
    class function GetTableName: String; override;
  published
    [AttributeOfHeader]
    property QUOTATION: TModQuotation read FQUOTATION write FQUOTATION;
    property BARANG: TModBarang read FBARANG write FBARANG;
    property QUOTD_BUYPRICE: Double read FQUOTD_BUYPRICE write FQUOTD_BUYPRICE;
    property QUOTD_PRICE: Double read FQUOTD_PRICE write FQUOTD_PRICE;
    property QUOTD_MU_PERSEN: Double read FQUOTD_MU_PERSEN write FQUOTD_MU_PERSEN;
    property QUOTD_MU_RUPIAH: Double read FQUOTD_MU_RUPIAH write FQUOTD_MU_RUPIAH;
    property QUOTD_MU_RUPIAH_PLUS_PPN: Double read FQUOTD_MU_RUPIAH_PLUS_PPN write
        FQUOTD_MU_RUPIAH_PLUS_PPN;
    property QUOTD_HARGA_AVERAGE: Double read FQUOTD_HARGA_AVERAGE write
        FQUOTD_HARGA_AVERAGE;
    property QUOTD_DISC: Double read FQUOTD_DISC write FQUOTD_DISC;
    property QUOTD_DISC_PERSEN: Double read FQUOTD_DISC_PERSEN write
        FQUOTD_DISC_PERSEN;
    [AttributeOfForeign('Ref$Satuan_ID')]
    property SATUAN: TModSatuan read FSATUAN write FSATUAN;
    [AttributeOfForeign('REF$TIPE_HARGA_ID')]
    property TipeHarga: TModTipeHarga read FTipeHarga write FTipeHarga;
  end;

implementation


function TModQuotation.GetDetails: TObjectList<TModQuotationDetail>;
begin
  if not assigned(FDetails) then
    FDetails := Tobjectlist<TModQuotationDetail>.create;
  Result := FDetails;
end;

class function TModQuotation.GetTableName: String;
begin
  Result := 'QUOTATION';
end;

class function TModQuotationDetail.GetTableName: String;
begin
  Result := 'QUOTATION_DETAIL';
end;

initialization
  //if error "can not instantiate type of uModel.xxxx" occured, register here
  TModQuotation.RegisterRTTI;
  TModQuotationDetail.RegisterRTTI;



end.
