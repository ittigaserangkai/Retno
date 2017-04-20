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
    [AttributeOfCode]
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
    FSOD_TOTAL: Double;
    FSOD_TOTAL_DISC: Double;
    FSatuan: TModSatuan;
    FSOD_ADS: Double;
    FSOD_QTYSO: Double;
    FSOD_STOCK: Double;
    FSOD_ROP: Double;
    FSupplierMerchan: TModSuplierMerchanGroup;
  public
    class function GetTableName: String; override;
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
    //1 soD_PRICE * SOD_QTY
    property SOD_TOTAL: Double read FSOD_TOTAL write FSOD_TOTAL;
    property SOD_TOTAL_DISC: Double read FSOD_TOTAL_DISC write FSOD_TOTAL_DISC;
    [AttributeOfForeign('Ref$Satuan_ID')]
    property Satuan: TModSatuan read FSatuan write FSatuan;
    property SOD_ADS: Double read FSOD_ADS write FSOD_ADS;
    property SOD_QTYSO: Double read FSOD_QTYSO write FSOD_QTYSO;
    property SOD_STOCK: Double read FSOD_STOCK write FSOD_STOCK;
    property SOD_ROP: Double read FSOD_ROP write FSOD_ROP;
    [AttributeOfForeign('SUPLIER_MERCHAN_GRUP_ID')]
    property SupplierMerchan: TModSuplierMerchanGroup read FSupplierMerchan write
        FSupplierMerchan;
  end;

implementation

function TModSO.GetSODetails: TObjectList<TModSODetail>;
begin
  If not Assigned(FSODetails) then
    FSODetails := TObjectList<TModSODetail>.Create;
  Result := FSODetails;
end;

class function TModSODetail.GetTableName: String;
begin
  Result := 'SO_DETAIL';
end;

initialization
  TModSO.RegisterRTTI;
  TModSODetail.RegisterRTTI;


end.
