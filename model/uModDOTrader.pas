unit uModDOTrader;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uModAPP, uModPOTrader, uModBarang, uModSatuan, uModOrganization,
  System.Generics.Collections, uModUnit, uModGudang;

type
  TModDOTraderItem = class;
  TModDOTrader = class(TModApp)
  private
    FDOTraderItems: TObjectList<TModDOTraderItem>;
    FDOT_DATE: TDatetime;
    FDOT_DESCRIPTION: string;
    FDOT_DISC: Double;
    FDOT_DISC_MEMBER: Double;
    FDOT_GUDANG: TModGudang;
    FDOT_LEAD_TIME: Double;
    FDOT_NO: string;
    FDOT_Organization: TModOrganization;
    FDOT_POTrader: TModPOTrader;
    FDOT_PPN: Double;
    FDOT_PPNBM: Double;
    FDOT_STATUS: string;
    FDOT_SUBTOTAL: Double;
    FDOT_TOP: Integer;
    FDOT_TOTAL: Double;
    FDOT_UNIT: TModUnit;
    FDOT_VALID_DATE: TDatetime;
    function GetDOTraderItems: TObjectList<TModDOTraderItem>;
  public
    property DOTraderItems: TObjectList<TModDOTraderItem> read GetDOTraderItems
        write FDOTraderItems;
  published
    property DOT_DATE: TDatetime read FDOT_DATE write FDOT_DATE;
    property DOT_DESCRIPTION: string read FDOT_DESCRIPTION write
        FDOT_DESCRIPTION;
    property DOT_DISC: Double read FDOT_DISC write FDOT_DISC;
    property DOT_DISC_MEMBER: Double read FDOT_DISC_MEMBER write
        FDOT_DISC_MEMBER;
    property DOT_GUDANG: TModGudang read FDOT_GUDANG write FDOT_GUDANG;
    property DOT_LEAD_TIME: Double read FDOT_LEAD_TIME write FDOT_LEAD_TIME;
    [AttributeOfCode]
    property DOT_NO: string read FDOT_NO write FDOT_NO;
    property DOT_Organization: TModOrganization read FDOT_Organization write
        FDOT_Organization;
    property DOT_POTrader: TModPOTrader read FDOT_POTrader write FDOT_POTrader;
    property DOT_PPN: Double read FDOT_PPN write FDOT_PPN;
    property DOT_PPNBM: Double read FDOT_PPNBM write FDOT_PPNBM;
    property DOT_STATUS: string read FDOT_STATUS write FDOT_STATUS;
    property DOT_SUBTOTAL: Double read FDOT_SUBTOTAL write FDOT_SUBTOTAL;
    property DOT_TOP: Integer read FDOT_TOP write FDOT_TOP;
    property DOT_TOTAL: Double read FDOT_TOTAL write FDOT_TOTAL;
    property DOT_UNIT: TModUnit read FDOT_UNIT write FDOT_UNIT;
    property DOT_VALID_DATE: TDatetime read FDOT_VALID_DATE write
        FDOT_VALID_DATE;
  end;

  TModDOTraderItem = class(TModApp)
  private
    FDOTITEM_BARANG: TModBarang;
    FDOTITEM_COGS: Double;
    FDOTITEM_DISC: Double;
    FDOTITEM_DISCRP: Double;
    FDOTITEM_DOTRADER: TModDOTrader;
    FDOTITEM_NETSALE: Double;
    FDOTITEM_PPN: Double;
    FDOTITEM_PPNRP: Double;
    FDOTITEM_QTY: Double;
    FDOTITEM_SATUAN: TModSatuan;
    FDOTITEM_SELLPRICE: Double;
    FDOTITEM_TOTAL: Double;
  public
    destructor Destroy; override;
  published
    property DOTITEM_BARANG: TModBarang read FDOTITEM_BARANG write
        FDOTITEM_BARANG;
    property DOTITEM_COGS: Double read FDOTITEM_COGS write FDOTITEM_COGS;
    property DOTITEM_DISC: Double read FDOTITEM_DISC write FDOTITEM_DISC;
    property DOTITEM_DISCRP: Double read FDOTITEM_DISCRP write FDOTITEM_DISCRP;
    [AttributeOfHeader]
    property DOTITEM_DOTRADER: TModDOTrader read FDOTITEM_DOTRADER write
        FDOTITEM_DOTRADER;
    property DOTITEM_NETSALE: Double read FDOTITEM_NETSALE write
        FDOTITEM_NETSALE;
    property DOTITEM_PPN: Double read FDOTITEM_PPN write FDOTITEM_PPN;
    property DOTITEM_PPNRP: Double read FDOTITEM_PPNRP write FDOTITEM_PPNRP;
    property DOTITEM_QTY: Double read FDOTITEM_QTY write FDOTITEM_QTY;
    property DOTITEM_SATUAN: TModSatuan read FDOTITEM_SATUAN write
        FDOTITEM_SATUAN;
    property DOTITEM_SELLPRICE: Double read FDOTITEM_SELLPRICE write
        FDOTITEM_SELLPRICE;
    property DOTITEM_TOTAL: Double read FDOTITEM_TOTAL write FDOTITEM_TOTAL;
  end;

implementation

destructor TModDOTraderItem.Destroy;
begin
  inherited;
  if FDOTITEM_BARANG <> nil then
    FreeAndNil(FDOTITEM_BARANG);
  if FDOTITEM_SATUAN <> nil then
    FreeAndNil(FDOTITEM_SATUAN);
end;

function TModDOTrader.GetDOTraderItems: TObjectList<TModDOTraderItem>;
begin
  if not Assigned(FDOTraderItems) then
    FDOTraderItems := TObjectList<TModDOTraderItem>.Create;
  Result := FDOTraderItems;
end;

initialization
  TModDOTrader.RegisterRTTI;



end.
