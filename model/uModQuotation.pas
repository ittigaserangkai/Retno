//BuyPrice = Exclude, SellPrice = Include PPN

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
    FBUYDISC1: Double;
    FBarang: TModBarang;
    FBarangSupplier: TModBarangSupplier;
    FBUYNETPRICE: Double;
    FSELLDISCPERCENT: Double;
    FMargin: Double;
    FSELLPRICE: Double;
    FQuotation: TModQuotation;
    FBUYDISC2: Double;
    FBUYDISC3: Double;
    FBUYPRICE: Double;
    FIsUpdateSellPrice: Integer;
    FSatuan: TModSatuan;
    FSELLDISCRP: Double;
    FKonversi: Double;
    FPPN: Double;
    FIsBKP: Integer;
    FIsSellingPrice: Integer;
    FTipeHarga: TModTipeHarga;
  public
    destructor Destroy; override;
    class function GetTableName: String; override;
    procedure SetBarangHargaJual(aBarangHrgJual: TModBarangHargaJual);
    procedure SetBarangSupplier(aBarangSupp: TModBarangSupplier);
  published
    [AttributeOfHeader]
    property Quotation: TModQuotation read FQuotation write FQuotation;
    property BUYDISC1: Double read FBUYDISC1 write FBUYDISC1;
    property Barang: TModBarang read FBarang write FBarang;
    property BarangSupplier: TModBarangSupplier read FBarangSupplier write
        FBarangSupplier;
    property BUYNETPRICE: Double read FBUYNETPRICE write FBUYNETPRICE;
    property SELLDISCPERCENT: Double read FSELLDISCPERCENT write FSELLDISCPERCENT;
    property Margin: Double read FMargin write FMargin;
    property SELLPRICE: Double read FSELLPRICE write FSELLPRICE;
    property BUYDISC2: Double read FBUYDISC2 write FBUYDISC2;
    property BUYDISC3: Double read FBUYDISC3 write FBUYDISC3;
    property BUYPRICE: Double read FBUYPRICE write FBUYPRICE;
    property IsUpdateSellPrice: Integer read FIsUpdateSellPrice write
        FIsUpdateSellPrice;
    [AttributeOfForeign('SATUAN_ID')]
    property Satuan: TModSatuan read FSatuan write FSatuan;
    property SELLDISCRP: Double read FSELLDISCRP write FSELLDISCRP;
    property Konversi: Double read FKonversi write FKonversi;
    property PPN: Double read FPPN write FPPN;
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

destructor TModQuotationDetail.Destroy;
begin
  inherited;
end;

class function TModQuotationDetail.GetTableName: String;
begin
  Result := 'Quotation_Detail';
end;

procedure TModQuotationDetail.SetBarangSupplier(aBarangSupp:
    TModBarangSupplier);
begin
  aBarangSupp.BRGSUP_IS_PRIMARY := 1;
  aBarangSupp.BRGSUP_IS_ACTIVE  := 1;
  aBarangSupp.BRGSUP_BUY_PRICE  := Self.BUYPRICE;
  aBarangSupp.BRGSUP_DISC1      := Self.BUYDISC1;
  aBarangSupp.BRGSUP_DISC2      := Self.BUYDISC2;
  aBarangSupp.BRGSUP_DISC3      := Self.BUYDISC3;
end;

procedure TModQuotationDetail.SetBarangHargaJual(aBarangHrgJual:
    TModBarangHargaJual);
begin
  aBarangHrgJual.Barang := TModBarang.CreateID(Self.Barang.ID);
  aBarangHrgJual.BHJ_SELL_PRICE     := Self.SELLPRICE;
  aBarangHrgJual.BHJ_DISC_PERSEN    := Self.SELLDISCPERCENT;
  aBarangHrgJual.BHJ_DISC_NOMINAL   := Self.SELLDISCRP;
  aBarangHrgJual.BHJ_MARK_UP        := Self.Margin;
  aBarangHrgJual.BHJ_CONV_VALUE     := Self.Konversi;
  aBarangHrgJual.TipeHarga          := TModTipeHarga.CreateID(Self.TipeHarga.ID);
  aBarangHrgJual.Satuan             := TModSatuan.CreateID(Self.Satuan.ID);

  if Self.IsBKP = 1 then
    aBarangHrgJual.BHJ_PPN          := Self.PPN
  else
    aBarangHrgJual.BHJ_PPN          := 0;

end;

initialization
  //if error "can not instantiate type of uModel.xxxx" occured, register here
  TModQuotation.RegisterRTTI;
  TModQuotationDetail.RegisterRTTI;



end.
