unit uModAdjustmentFaktur;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics,
  Controls, Forms, Dialogs, uModApp, uModBarang, uModRekening, uModDO, uModPO,
  uModSuplier, uModUnit, System.Generics.Collections, uModSatuan,
  Datasnap.DBClient;

type
  TModAdjustmentFakturItem = class;
  TModAdjustmentFaktur = class(TModApp)
  private
    FADJFAK_DATE_RCV: TDateTime;
    FADJFAK_DATE: TDateTime;
    FADJFAK_DATE_POSTED: TDateTime;
    FADJFAK_DO: TModDO;
    FADJFAK_IS_JURNAL: Integer;
    FADJFAK_IS_POSTED: Integer;
    FADJFAK_NO: string;
    FADJFAK_PAYMENT: Double;
    FADJFAK_PO: TModPO;
    FADJFAK_PPN: Double;
    FADJFAK_PPNBM: Double;
    FADJFAK_REF: string;
    FADJFAK_Suplier: TModSuplier;
    FADJFAK_SuplierMerchanGroup: TModSuplierMerchanGroup;
    FADJFAK_TOTAL_ADJ: Double;
    FADJFAK_PPN_ADJ: Double;
    FADJFAK_DISC_ADJ: Double;
    FADJFAK_TOTAL_AFTER_DISC: Double;
    FADJFAK_UNIT: TModUnit;
    FAdjustmentFakturItems: TObjectList<TModAdjustmentFakturItem>;
    function GetAdjustmentFakturItems: TObjectList<TModAdjustmentFakturItem>;
  public
    class function GetTableName: String; override;
    property AdjustmentFakturItems: TObjectList<TModAdjustmentFakturItem> read
        GetAdjustmentFakturItems write FAdjustmentFakturItems;
  published
    property ADJFAK_DATE_RCV: TDateTime read FADJFAK_DATE_RCV write
        FADJFAK_DATE_RCV;
    property ADJFAK_DATE: TDateTime read FADJFAK_DATE write FADJFAK_DATE;
    property ADJFAK_DATE_POSTED: TDateTime read FADJFAK_DATE_POSTED write
        FADJFAK_DATE_POSTED;
    [AttributeOfForeign('DO_ID')]
    property ADJFAK_DO: TModDO read FADJFAK_DO write FADJFAK_DO;
    property ADJFAK_IS_JURNAL: Integer read FADJFAK_IS_JURNAL write
        FADJFAK_IS_JURNAL;
    property ADJFAK_IS_POSTED: Integer read FADJFAK_IS_POSTED write
        FADJFAK_IS_POSTED;
    [AttributeOfCode]
    property ADJFAK_NO: string read FADJFAK_NO write FADJFAK_NO;
    property ADJFAK_PAYMENT: Double read FADJFAK_PAYMENT write FADJFAK_PAYMENT;
    [AttributeOfForeign('PO_ID')]
    property ADJFAK_PO: TModPO read FADJFAK_PO write FADJFAK_PO;
    property ADJFAK_PPN: Double read FADJFAK_PPN write FADJFAK_PPN;
    property ADJFAK_PPNBM: Double read FADJFAK_PPNBM write FADJFAK_PPNBM;
    property ADJFAK_REF: string read FADJFAK_REF write FADJFAK_REF;
    [AttributeOfForeign('SUPLIER_ID')]
    property ADJFAK_Suplier: TModSuplier read FADJFAK_Suplier write
        FADJFAK_Suplier;
    [AttributeOfForeign('SUPLIER_MERCHAN_GRUP_ID')]
    property ADJFAK_SuplierMerchanGroup: TModSuplierMerchanGroup read
        FADJFAK_SuplierMerchanGroup write FADJFAK_SuplierMerchanGroup;
    property ADJFAK_TOTAL_ADJ: Double read FADJFAK_TOTAL_ADJ write
        FADJFAK_TOTAL_ADJ;
    property ADJFAK_PPN_ADJ: Double read FADJFAK_PPN_ADJ write FADJFAK_PPN_ADJ;
    property ADJFAK_DISC_ADJ: Double read FADJFAK_DISC_ADJ write FADJFAK_DISC_ADJ;
    property ADJFAK_TOTAL_AFTER_DISC: Double read FADJFAK_TOTAL_AFTER_DISC
        write FADJFAK_TOTAL_AFTER_DISC;
    [AttributeOfForeign('AUT$UNIT_ID')]
    property ADJFAK_UNIT: TModUnit read FADJFAK_UNIT write FADJFAK_UNIT;
  end;

  TModAdjustmentFakturItem = class(TModApp)
  private
    FAdjustmentFaktur: TModAdjustmentFaktur;
    FAFD_Barang: TModBarang;
    FAFD_DISC: Double;
    FAFD_DOItem: TModDOItem;
    FAFD_OLD_DISC: Double;
    FAFD_OLD_PRICE: Double;
    FAFD_PPN: Double;
    FAFD_PRICE: Double;
    FAFD_QTY: Double;
    FAFD_Satuan: TModSatuan;
    FAFD_VAL_ADJ_AFTER_DISC: Double;
    FAFD_VAL_ADJ_PPN: Double;
    FAFD_VAL_ADJ_DISC: Double;
    FAFD_VAL_ADJ_PPNBM: Double;
    FAFD_VAL_ADJ_TOTAL: Double;
  public
    class function GetTableName: String; override;
  published
    [AttributeOfHeader('ADJUSTMENT_FAKTUR_ID')]
    property AdjustmentFaktur: TModAdjustmentFaktur read FAdjustmentFaktur
        write FAdjustmentFaktur;
    [AttributeOfForeign('BARANG_ID')]
    property AFD_Barang: TModBarang read FAFD_Barang write FAFD_Barang;
    property AFD_DISC: Double read FAFD_DISC write FAFD_DISC;
    [AttributeOfForeign('DO_DETAIL_ID')]
    property AFD_DOItem: TModDOItem read FAFD_DOItem write FAFD_DOItem;
    property AFD_OLD_DISC: Double read FAFD_OLD_DISC write FAFD_OLD_DISC;
    property AFD_OLD_PRICE: Double read FAFD_OLD_PRICE write FAFD_OLD_PRICE;
    property AFD_PPN: Double read FAFD_PPN write FAFD_PPN;
    property AFD_PRICE: Double read FAFD_PRICE write FAFD_PRICE;
    property AFD_QTY: Double read FAFD_QTY write FAFD_QTY;
    [AttributeOfForeign('REF$SATUAN_ID')]
    property AFD_Satuan: TModSatuan read FAFD_Satuan write FAFD_Satuan;
    property AFD_VAL_ADJ_AFTER_DISC: Double read FAFD_VAL_ADJ_AFTER_DISC write
        FAFD_VAL_ADJ_AFTER_DISC;
    property AFD_VAL_ADJ_PPN: Double read FAFD_VAL_ADJ_PPN write
        FAFD_VAL_ADJ_PPN;
    property AFD_VAL_ADJ_DISC: Double read FAFD_VAL_ADJ_DISC write
        FAFD_VAL_ADJ_DISC;
    property AFD_VAL_ADJ_PPNBM: Double read FAFD_VAL_ADJ_PPNBM write
        FAFD_VAL_ADJ_PPNBM;
    property AFD_VAL_ADJ_TOTAL: Double read FAFD_VAL_ADJ_TOTAL write
        FAFD_VAL_ADJ_TOTAL;
  end;


implementation

{
***************************** TModAdjustmentFaktur *****************************
}
function TModAdjustmentFaktur.GetAdjustmentFakturItems:
    TObjectList<TModAdjustmentFakturItem>;
begin
  if not Assigned(FAdjustmentFakturItems) then
    FAdjustmentFakturItems := TObjectList<TModAdjustmentFakturItem>.Create;
  Result := FAdjustmentFakturItems;
end;

class function TModAdjustmentFaktur.GetTableName: String;
begin
  Result := 'Adjustment_Faktur';
end;

class function TModAdjustmentFakturItem.GetTableName: String;
begin
  Result := 'Adjustment_Faktur_Detil';
end;


initialization
  TModAdjustmentFaktur.RegisterRTTI;
  TModAdjustmentFakturItem.RegisterRTTI;


end.
