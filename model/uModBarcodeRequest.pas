unit uModBarcodeRequest;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs, uModApp,
  System.Generics.Collections, uModOrganization, uModUnit, uModBarang,
  uModSatuan, uModSuplier;

type
  TModBarcodeRequestItem = class;
  TModBarcodeRequest = class(TModApp)
  private
    FBarcodeRequestItems: TOBjectList<TModBarcodeRequestItem>;
    FBR_COLIE: Integer;
    FBR_DESCRIPTION: string;
    FBR_NO: string;
    FBR_SUPMG: TModSuplierMerchanGroup;
    FBR_DATE: tdatetime;
    FBR_IS_INVOICED: Integer;
    FBR_TOTAL: Double;
    FBR_HARGA: Double;
    FBR_UNIT: TModUnit;
    function GetBarcodeRequestItems: TOBjectList<TModBarcodeRequestItem>;
  public
    property BarcodeRequestItems: TOBjectList<TModBarcodeRequestItem> read
        GetBarcodeRequestItems write FBarcodeRequestItems;
  published
    property BR_COLIE: Integer read FBR_COLIE write FBR_COLIE;

    [AttributeOfSize('120')]
    property BR_DESCRIPTION: string read FBR_DESCRIPTION write FBR_DESCRIPTION;

    [AttributeOfCode]
    property BR_NO: string read FBR_NO write FBR_NO;
    property BR_SUPMG: TModSuplierMerchanGroup read FBR_SUPMG write FBR_SUPMG;
    property BR_DATE: tdatetime read FBR_DATE write FBR_DATE;
    property BR_IS_INVOICED: Integer read FBR_IS_INVOICED write FBR_IS_INVOICED;
    property BR_TOTAL: Double read FBR_TOTAL write FBR_TOTAL;
    property BR_HARGA: Double read FBR_HARGA write FBR_HARGA;
    property BR_UNIT: TModUnit read FBR_UNIT write FBR_UNIT;
  end;

  TModBarcodeRequestItem = class(TModApp)
  private

    FBarcodeRequest: TModBarcodeRequest;
    FBRI_BARANG: TModBarang;
    FBRI_HARGA: Double;
    FBRI_QTY: Double;
    FBRI_SATUAN: TModSatuan;
    FBRI_TOTAL: Double;
  published
    [AttributeOfHeader]
    property BarcodeRequest: TModBarcodeRequest read FBarcodeRequest write
        FBarcodeRequest;
    property BRI_BARANG: TModBarang read FBRI_BARANG write FBRI_BARANG;
    property BRI_HARGA: Double read FBRI_HARGA write FBRI_HARGA;
    property BRI_QTY: Double read FBRI_QTY write FBRI_QTY;
    property BRI_SATUAN: TModSatuan read FBRI_SATUAN write FBRI_SATUAN;
    property BRI_TOTAL: Double read FBRI_TOTAL write FBRI_TOTAL;
  end;


implementation

{
****************************** TModBarcodeRequest ******************************
}
function TModBarcodeRequest.GetBarcodeRequestItems:
    TOBjectList<TModBarcodeRequestItem>;
begin
  if FBarcodeRequestItems = nil then
    FBarcodeRequestItems := TObjectList<TModBarcodeRequestItem>.Create();

  Result := FBarcodeRequestItems;
end;

Initialization
  TModBarcodeRequest.RegisterRTTI;

end.
