unit uModQuotation;

interface
uses
  uModApp, uModSuplier, uModBarang, uModSatuan, System.Generics.Collections;

type
  TModQuotationDetail = class;

  TModQuotation = class(TModApp)
  private
    FTransDate: TDatetime;
    FEffectiveDate: TDatetime;
    FEndDate: TDatetime;
    FIsMailer: Integer;
    FIsProcessed: Integer;
    FRefNo: string;
    FRemark: String;
    FDetails: TObjectList<TModQuotationDetail>;
    FSupplierMerchanGroup: TModSuplierMerchanGroup;
    FMerchandise: TModMerchandise;
    function GetDetails: TObjectList<TModQuotationDetail>;
  public
    class function GetTableName: String; override;
    property Details: TObjectList<TModQuotationDetail> read GetDetails write
        FDetails;
  published
    property TransDate: TDatetime read FTransDate write FTransDate;
    property EffectiveDate: TDatetime read FEffectiveDate write FEffectiveDate;
    property EndDate: TDatetime read FEndDate write FEndDate;
    property IsMailer: Integer read FIsMailer write FIsMailer;
    property IsProcessed: Integer read FIsProcessed write FIsProcessed;
    [AttributeOfCode]
    property RefNo: string read FRefNo write FRefNo;
    property Remark: String read FRemark write FRemark;
    [AttributeOfForeign('SUPLIER_MERCHAN_GRUP_ID')]
    property SupplierMerchanGroup: TModSuplierMerchanGroup read
        FSupplierMerchanGroup write FSupplierMerchanGroup;
    [AttributeOfForeign('MERCHANDISE_ID')]
    property Merchandise: TModMerchandise read FMerchandise write FMerchandise;
  end;

  TModQuotationDetail = class(TModApp)
  private
    FBuyDisc1: Double;
    FBarang: TModBarang;
    FBarangSupplier: TModBarangSupplier;
    FBuyNetPrice: Double;
    FSellDiscPercent: Double;
    FMargin: Double;
    FSellPrice: Double;
    FQuotation: TModQuotation;
    FBuyDisc2: Double;
    FBuyDisc3: Double;
    FBuyPrice: Double;
    FIsUpdateSellPrice: Integer;
    FSatuan: TModSatuan;
    FSellDiscRp: Double;
    FKonversi: Double;
    FTax: Double;
    FIsBKP: Integer;
    FIsSellingPrice: Integer;
    FTipeHarga: TModTipeHarga;
  public
    class function GetTableName: String; override;
  published
    [AttributeOfHeader]
    property Quotation: TModQuotation read FQuotation write FQuotation;
    property BuyDisc1: Double read FBuyDisc1 write FBuyDisc1;
    property Barang: TModBarang read FBarang write FBarang;
    property BarangSupplier: TModBarangSupplier read FBarangSupplier write
        FBarangSupplier;
    property BuyNetPrice: Double read FBuyNetPrice write FBuyNetPrice;
    property SellDiscPercent: Double read FSellDiscPercent write FSellDiscPercent;
    property Margin: Double read FMargin write FMargin;
    property SellPrice: Double read FSellPrice write FSellPrice;
    property BuyDisc2: Double read FBuyDisc2 write FBuyDisc2;
    property BuyDisc3: Double read FBuyDisc3 write FBuyDisc3;
    property BuyPrice: Double read FBuyPrice write FBuyPrice;
    property IsUpdateSellPrice: Integer read FIsUpdateSellPrice write
        FIsUpdateSellPrice;
    [AttributeOfForeign('SATUAN_ID')]
    property Satuan: TModSatuan read FSatuan write FSatuan;
    property SellDiscRp: Double read FSellDiscRp write FSellDiscRp;
    property Konversi: Double read FKonversi write FKonversi;
    property Tax: Double read FTax write FTax;
    property IsBKP: Integer read FIsBKP write FIsBKP;
    property IsSellingPrice: Integer read FIsSellingPrice write FIsSellingPrice;
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
  Result := 'Quotation';
end;

class function TModQuotationDetail.GetTableName: String;
begin
  Result := 'Quotation_Detail';
end;

initialization
  //if error "can not instantiate type of uModel.xxxx" occured, register here
  TModQuotation.RegisterRTTI;
  TModQuotationDetail.RegisterRTTI;



end.
