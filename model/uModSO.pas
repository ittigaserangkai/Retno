unit uModSO;

interface

uses
  uModApp, uModSatuan, uModUnit, uModBarang, uModSuplier,
  System.Generics.Collections, System.SysUtils;


type
  TModSODetail = class;

  TModSO = class(TModApp)
  private
    FAUTUNIT: TModUnit;
    FSODetails: TObjectList<TModSODetail>;
    FMerchandise: TModMerchandise;
    FMerchandise2: TModMerchandise;
    FSO_DATE: TDatetime;
    FSO_NO: string;
    FSupplierMerchan: TModSuplierMerchanGroup;
    function GetSODetails: TObjectList<TModSODetail>;
  public
    property SODetails: TObjectList<TModSODetail> read GetSODetails write
        FSODetails;
  published
    [AttributeOfForeign('AUT$UNIT_ID')]
    property AUTUNIT: TModUnit read FAUTUNIT write FAUTUNIT;
    [AttributeOfForeign('REF$MERCHANDISE_ID')]
    property Merchandise: TModMerchandise read FMerchandise write FMerchandise;
    property SO_DATE: TDatetime read FSO_DATE write FSO_DATE;
    property SO_NO: string read FSO_NO write FSO_NO;
    [AttributeOfForeign('SUPLIER_MERCHAN_GRUP_ID')]
    property SupplierMerchan: TModSuplierMerchanGroup read FSupplierMerchan write
        FSupplierMerchan;
  end;

  TModSODetail = class(TModApp)
  private
    FBARANG: TModBarang;
    FSO: TModSO;
    FSOD_DISC1: Double;
    FSOD_DISC2: Double;
    FSOD_DISC3: Double;
    FSOD_IS_BKP: Integer;
    FSOD_IS_ORDERED: Integer;
    FSOD_IS_REGULAR: Integer;
    FSOD_PRICE: Double;
    FSOD_QTY: Double;
    FSOD_QTY_ORDER: Integer;
    FSOD_TOTAL: Double;
    FSOD_TOTAL_DISC: Double;
    FSUPPLIER: TModSuplier;
    FSatuan: TModSatuan;
  published
    property BARANG: TModBarang read FBARANG write FBARANG;
    [AttributeOfHeader('SO_ID')]
    property SO: TModSO read FSO write FSO;
    property SOD_DISC1: Double read FSOD_DISC1 write FSOD_DISC1;
    property SOD_DISC2: Double read FSOD_DISC2 write FSOD_DISC2;
    property SOD_DISC3: Double read FSOD_DISC3 write FSOD_DISC3;
    property SOD_IS_BKP: Integer read FSOD_IS_BKP write FSOD_IS_BKP;
    property SOD_IS_ORDERED: Integer read FSOD_IS_ORDERED write FSOD_IS_ORDERED;
    property SOD_IS_REGULAR: Integer read FSOD_IS_REGULAR write FSOD_IS_REGULAR;
    property SOD_PRICE: Double read FSOD_PRICE write FSOD_PRICE;
    property SOD_QTY: Double read FSOD_QTY write FSOD_QTY;
    property SOD_QTY_ORDER: Integer read FSOD_QTY_ORDER write FSOD_QTY_ORDER;
    //1 soD_PRICE * SOD_QTY
    property SOD_TOTAL: Double read FSOD_TOTAL write FSOD_TOTAL;
    property SOD_TOTAL_DISC: Double read FSOD_TOTAL_DISC write FSOD_TOTAL_DISC;
    property SUPPLIER: TModSuplier read FSUPPLIER write FSUPPLIER;
    [AttributeOfForeign('Ref$Satuan_ID')]
    property Satuan: TModSatuan read FSatuan write FSatuan;
  end;

implementation

function TModSO.GetSODetails: TObjectList<TModSODetail>;
begin
  If not Assigned(FSODetails) then
    FSODetails := TObjectList<TModSODetail>.Create;
  Result := FSODetails;
end;

initialization
  TModSO.RegisterRTTI;
  TModSODetail.RegisterRTTI;


end.
