unit uModReturTrader;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uModAPP, uModPOTrader, uModBarang, uModSatuan, uModOrganization,
  System.Generics.Collections, uModUnit, uModGudang, uModDOTrader, uModAR;

type
  TModReturTraderItem = class;
  TModReturTrader = class(TModApp)
  private
    FReturTraderItems: TObjectList<TModReturTraderItem>;
    FRET_DATE: TDatetime;
    FRET_DESCRIPTION: string;
    FRET_DISC: Double;
    FRET_AR: TModAR;
    FRET_DISC_MEMBER: Double;
    FRET_DOTrader: TModDOTrader;
    FRET_GUDANG: TModGudang;
    FRET_LEAD_TIME: Double;
    FRET_NO: string;
    FRET_Organization: TModOrganization;
    FRET_PPN: Double;
    FRET_PPNBM: Double;
    FRET_STATUS: string;
    FRET_SUBTOTAL: Double;
    FRET_TOP: Integer;
    FRET_TOTAL: Double;
    FRET_UNIT: TModUnit;
    FRET_VALID_DATE: TDatetime;
  public
    property ReturTraderItems: TObjectList<TModReturTraderItem> read
        FReturTraderItems write FReturTraderItems;
  published
    property RET_DATE: TDatetime read FRET_DATE write FRET_DATE;
    [AttributeofSize('120')]
    property RET_DESCRIPTION: string read FRET_DESCRIPTION write
        FRET_DESCRIPTION;
    property RET_DISC: Double read FRET_DISC write FRET_DISC;
    property RET_AR: TModAR read FRET_AR write FRET_AR;
    property RET_DISC_MEMBER: Double read FRET_DISC_MEMBER write
        FRET_DISC_MEMBER;
    property RET_DOTrader: TModDOTrader read FRET_DOTrader write FRET_DOTrader;
    property RET_GUDANG: TModGudang read FRET_GUDANG write FRET_GUDANG;
    property RET_LEAD_TIME: Double read FRET_LEAD_TIME write FRET_LEAD_TIME;
    [AttributeofCode]
    property RET_NO: string read FRET_NO write FRET_NO;
    property RET_Organization: TModOrganization read FRET_Organization write
        FRET_Organization;
    property RET_PPN: Double read FRET_PPN write FRET_PPN;
    property RET_PPNBM: Double read FRET_PPNBM write FRET_PPNBM;
    property RET_STATUS: string read FRET_STATUS write FRET_STATUS;
    property RET_SUBTOTAL: Double read FRET_SUBTOTAL write FRET_SUBTOTAL;
    property RET_TOP: Integer read FRET_TOP write FRET_TOP;
    property RET_TOTAL: Double read FRET_TOTAL write FRET_TOTAL;
    property RET_UNIT: TModUnit read FRET_UNIT write FRET_UNIT;
    property RET_VALID_DATE: TDatetime read FRET_VALID_DATE write
        FRET_VALID_DATE;
  end;

  TModReturTraderItem = class(TModApp)
  private
    FRETITEM_BARANG: TModBarang;
    FRETITEM_COGS: Double;
    FRETITEM_DISC: Double;
    FRETITEM_DISCRP: Double;
    FRETITEM_NETSALE: Double;
    FRETITEM_PPN: Double;
    FRETITEM_PPNRP: Double;
    FRETITEM_QTY: Double;
    FRETITEM_RETURTRADER: TModReturTrader;
    FRETITEM_SATUAN: TModSatuan;
    FRETITEM_SELLPRICE: Double;
    FRETITEM_TOTAL: Double;
  published
    property RETITEM_BARANG: TModBarang read FRETITEM_BARANG write
        FRETITEM_BARANG;
    property RETITEM_COGS: Double read FRETITEM_COGS write FRETITEM_COGS;
    property RETITEM_DISC: Double read FRETITEM_DISC write FRETITEM_DISC;
    property RETITEM_DISCRP: Double read FRETITEM_DISCRP write FRETITEM_DISCRP;
    property RETITEM_NETSALE: Double read FRETITEM_NETSALE write
        FRETITEM_NETSALE;
    property RETITEM_PPN: Double read FRETITEM_PPN write FRETITEM_PPN;
    property RETITEM_PPNRP: Double read FRETITEM_PPNRP write FRETITEM_PPNRP;
    property RETITEM_QTY: Double read FRETITEM_QTY write FRETITEM_QTY;
    [AttributeOfHeader]
    property RETITEM_RETURTRADER: TModReturTrader read FRETITEM_RETURTRADER
        write FRETITEM_RETURTRADER;
    property RETITEM_SATUAN: TModSatuan read FRETITEM_SATUAN write
        FRETITEM_SATUAN;
    property RETITEM_SELLPRICE: Double read FRETITEM_SELLPRICE write
        FRETITEM_SELLPRICE;
    property RETITEM_TOTAL: Double read FRETITEM_TOTAL write FRETITEM_TOTAL;
  end;

implementation

initialization

  TModReturTrader.RegisterRTTI;
  TModReturTraderItem.RegisterRTTI;



end.
