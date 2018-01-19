unit uModDOBonus;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uModApp, uModPO, uModSuplier, uModGudang, System.Generics.Collections,
  uModTipeBonus, uModUnit, uModBarang, uModSatuan;

type
  TModDOBonusItem = class;
  TModDOBonus = class(TModApp)
  private
    FDOB_COLIE: Double;
    FDOB_DATE: TDATEtime;
    FDOB_DESCRIPTION: string;
    FDOB_DISC: Double;
    FDOB_DOBonusItems: TOBjectList<TModDOBonusItem>;
    FDOB_GUDANG: TModGudang;
    FDOB_NO: string;
    FDOB_PO: TModPO;
    FDOB_PPN: Double;
    FDOB_SUPPLIERMERCHANGRUP: TModSuplierMerchanGroup;
    FDOB_TIPEBONUS: TModTipeBonus;
    FDOB_TOTAL: Double;
    FDOB_UNIT: TModUnit;
    function GetDOB_DOBonusItems: TOBjectList<TModDOBonusItem>;
  public
    property DOB_DOBonusItems: TOBjectList<TModDOBonusItem> read
        GetDOB_DOBonusItems write FDOB_DOBonusItems;
  published
    property DOB_COLIE: Double read FDOB_COLIE write FDOB_COLIE;
    property DOB_DATE: TDATEtime read FDOB_DATE write FDOB_DATE;
    property DOB_DESCRIPTION: string read FDOB_DESCRIPTION write FDOB_DESCRIPTION;
    property DOB_DISC: Double read FDOB_DISC write FDOB_DISC;
    property DOB_GUDANG: TModGudang read FDOB_GUDANG write FDOB_GUDANG;

    [AttributeOfCode]
    property DOB_NO: string read FDOB_NO write FDOB_NO;
    property DOB_PO: TModPO read FDOB_PO write FDOB_PO;
    property DOB_PPN: Double read FDOB_PPN write FDOB_PPN;
    property DOB_SUPPLIERMERCHANGRUP: TModSuplierMerchanGroup read
        FDOB_SUPPLIERMERCHANGRUP write FDOB_SUPPLIERMERCHANGRUP;
    property DOB_TIPEBONUS: TModTipeBonus read FDOB_TIPEBONUS write
        FDOB_TIPEBONUS;
    property DOB_TOTAL: Double read FDOB_TOTAL write FDOB_TOTAL;
    property DOB_UNIT: TModUnit read FDOB_UNIT write FDOB_UNIT;
  end;

  TModDOBonusItem = class(TModApp)
  private
    FDOBI_BARANG: TModBarang;
    FDOBI_DISC1: Double;
    FDOBI_DISC2: Double;
    FDOBI_DISC3: Double;
    FDOBI_DOBonus: TModDOBonus;
    FDOBI_PPN: Double;
    FDOBI_PPNBM: Double;
    FDOBI_PPNBM_PERSEN: Double;
    FDOBI_PPN_PERSEN: Double;
    FDOBI_PRICE: Double;
    FDOBI_QTY: Double;
    FDOBI_TOTAL: Double;
    FDOBI_TOTAL_DISC: Double;
    FDOBI_TOTAL_TAX: Double;
    FDOBI_TOTAL_TEMP: Double;
    FDOBI_UOM: TModSatuan;
  published
    property DOBI_BARANG: TModBarang read FDOBI_BARANG write FDOBI_BARANG;
    property DOBI_DISC1: Double read FDOBI_DISC1 write FDOBI_DISC1;
    property DOBI_DISC2: Double read FDOBI_DISC2 write FDOBI_DISC2;
    property DOBI_DISC3: Double read FDOBI_DISC3 write FDOBI_DISC3;

    [AttributeOfHeader]
    property DOBI_DOBonus: TModDOBonus read FDOBI_DOBonus write FDOBI_DOBonus;
    property DOBI_PPN: Double read FDOBI_PPN write FDOBI_PPN;
    property DOBI_PPNBM: Double read FDOBI_PPNBM write FDOBI_PPNBM;
    property DOBI_PPNBM_PERSEN: Double read FDOBI_PPNBM_PERSEN write
        FDOBI_PPNBM_PERSEN;
    property DOBI_PPN_PERSEN: Double read FDOBI_PPN_PERSEN write
        FDOBI_PPN_PERSEN;
    property DOBI_PRICE: Double read FDOBI_PRICE write FDOBI_PRICE;
    property DOBI_QTY: Double read FDOBI_QTY write FDOBI_QTY;
    property DOBI_TOTAL: Double read FDOBI_TOTAL write FDOBI_TOTAL;
    property DOBI_TOTAL_DISC: Double read FDOBI_TOTAL_DISC write
        FDOBI_TOTAL_DISC;
    property DOBI_TOTAL_TAX: Double read FDOBI_TOTAL_TAX write FDOBI_TOTAL_TAX;
    property DOBI_TOTAL_TEMP: Double read FDOBI_TOTAL_TEMP write
        FDOBI_TOTAL_TEMP;
    property DOBI_UOM: TModSatuan read FDOBI_UOM write FDOBI_UOM;
  end;


implementation

function TModDOBonus.GetDOB_DOBonusItems: TOBjectList<TModDOBonusItem>;
begin
  if FDOB_DOBonusItems = nil then
    FDOB_DOBonusItems := TObjectList<TModDOBonusItem>.Create();

  Result := FDOB_DOBonusItems;

end;

initialization
  TModDOBonus.RegisterRTTI;

end.
