unit uModPOTrader;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uModApp, System.Generics.Collections, uModOrganization, uModUnit, uModBarang,
  uModSatuan;

type
  TModPOTraderItem = class;

  TModPOTrader = class(TModApp)
  private
    FPOTraderItems: TObjectList<TModPOTraderItem>;
    FPOT_DATE: TDatetime;
    FPOT_DELIVER_DATE: TDatetime;
    FPOT_DESCRIPTION: string;
    FPOT_DISC: Double;
    FPOT_DISC_MEMBER: Double;
    FPOT_LEAD_TIME: Double;
    FPOT_NO: string;
    FPOT_Organization: TModOrganization;
    FPOT_PPN: Double;
    FPOT_PPNBM: Double;
    FPOT_STATUS: string;
    FPOT_SUBTOTAL: Double;
    FPOT_TOP: Integer;
    FPOT_TOTAL: Double;
    FPOT_UNIT: TModUnit;
    FPOT_VALID_DATE: TDatetime;
    function GetPOTraderItems: TObjectList<TModPOTraderItem>;
  public
    property POTraderItems: TObjectList<TModPOTraderItem> read GetPOTraderItems
        write FPOTraderItems;
  published
    property POT_DATE: TDatetime read FPOT_DATE write FPOT_DATE;
    property POT_DELIVER_DATE: TDatetime read FPOT_DELIVER_DATE write
        FPOT_DELIVER_DATE;
    property POT_DESCRIPTION: string read FPOT_DESCRIPTION write
        FPOT_DESCRIPTION;
    property POT_DISC: Double read FPOT_DISC write FPOT_DISC;
    property POT_DISC_MEMBER: Double read FPOT_DISC_MEMBER write
        FPOT_DISC_MEMBER;
    property POT_LEAD_TIME: Double read FPOT_LEAD_TIME write FPOT_LEAD_TIME;
    [AttributeOfCode]
    property POT_NO: string read FPOT_NO write FPOT_NO;
    [AttributeOfForeign]
    property POT_Organization: TModOrganization read FPOT_Organization write
        FPOT_Organization;
    property POT_PPN: Double read FPOT_PPN write FPOT_PPN;
    property POT_PPNBM: Double read FPOT_PPNBM write FPOT_PPNBM;
    property POT_STATUS: string read FPOT_STATUS write FPOT_STATUS;
    property POT_SUBTOTAL: Double read FPOT_SUBTOTAL write FPOT_SUBTOTAL;
    property POT_TOP: Integer read FPOT_TOP write FPOT_TOP;
    property POT_TOTAL: Double read FPOT_TOTAL write FPOT_TOTAL;
    [AttributeOfForeign]
    property POT_UNIT: TModUnit read FPOT_UNIT write FPOT_UNIT;
    property POT_VALID_DATE: TDatetime read FPOT_VALID_DATE write
        FPOT_VALID_DATE;
  end;

  TModPOTraderItem = class(TModApp)
  private
    FPOTITEM_BARANG: TModBarang;
    FPOTITEM_COGS: Double;
    FPOTITEM_DISC: Double;
    FPOTITEM_DISCRP: Double;
    FPOTITEM_NETSALE: Double;
    FPOTITEM_POTRADER: TModPOTrader;
    FPOTITEM_PPN: Double;
    FPOTITEM_PPNRP: Double;
    FPOTITEM_QTY: Double;
    FPOTITEM_SATUAN: TModSatuan;
    FPOTITEM_SELLPRICE: Double;
    FPOTITEM_TOTAL: Double;
  public
    destructor Destroy; override;
  published
    [AttributeOfForeign]
    property POTITEM_BARANG: TModBarang read FPOTITEM_BARANG write
        FPOTITEM_BARANG;
    property POTITEM_COGS: Double read FPOTITEM_COGS write FPOTITEM_COGS;
    property POTITEM_DISC: Double read FPOTITEM_DISC write FPOTITEM_DISC;
    property POTITEM_DISCRP: Double read FPOTITEM_DISCRP write FPOTITEM_DISCRP;
    property POTITEM_NETSALE: Double read FPOTITEM_NETSALE write
        FPOTITEM_NETSALE;
    [AttributeOfHeader]
    property POTITEM_POTRADER: TModPOTrader read FPOTITEM_POTRADER write
        FPOTITEM_POTRADER;
    property POTITEM_PPN: Double read FPOTITEM_PPN write FPOTITEM_PPN;
    property POTITEM_PPNRP: Double read FPOTITEM_PPNRP write FPOTITEM_PPNRP;
    property POTITEM_QTY: Double read FPOTITEM_QTY write FPOTITEM_QTY;
    [AttributeOfForeign]
    property POTITEM_SATUAN: TModSatuan read FPOTITEM_SATUAN write
        FPOTITEM_SATUAN;
    property POTITEM_SELLPRICE: Double read FPOTITEM_SELLPRICE write
        FPOTITEM_SELLPRICE;
    property POTITEM_TOTAL: Double read FPOTITEM_TOTAL write FPOTITEM_TOTAL;
  end;


implementation

function TModPOTrader.GetPOTraderItems: TObjectList<TModPOTraderItem>;
begin
  if not Assigned(FPOTraderItems) then
    FPOTraderItems := TObjectList<TModPOTraderItem>.Create();

  Result := FPOTraderItems;
end;

destructor TModPOTraderItem.Destroy;
begin
  inherited;
  if FPOTITEM_BARANG <> nil then
    FreeAndNil(FPOTITEM_BARANG);
  if FPOTITEM_SATUAN <> nil then
    FreeAndNil(FPOTITEM_SATUAN);
end;

Initialization

TModPOTrader.RegisterRTTI;
TModPOTraderItem.RegisterRTTI;

end.
