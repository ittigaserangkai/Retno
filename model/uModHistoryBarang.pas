unit uModHistoryBarang;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uModBarang, uModSatuan, uModApp, uModUnit;

type
  TModHistoryBarang = class(TModApp)
  private
    FHB_BARANG: TModBarang;
    FHB_NEW_CATALOG: string;
    FHB_OLD_CATALOG: string;
    FHB_TANGGAL: tdatetime;
    FHB_UNIT: TModUnit;
    FHB_UOM: TModSatuan;
  published
    property HB_BARANG: TModBarang read FHB_BARANG write FHB_BARANG;
    property HB_NEW_CATALOG: string read FHB_NEW_CATALOG write FHB_NEW_CATALOG;
    property HB_OLD_CATALOG: string read FHB_OLD_CATALOG write FHB_OLD_CATALOG;
    property HB_TANGGAL: tdatetime read FHB_TANGGAL write FHB_TANGGAL;
    property HB_UNIT: TModUnit read FHB_UNIT write FHB_UNIT;
    property HB_UOM: TModSatuan read FHB_UOM write FHB_UOM;
  end;


implementation

initialization
  TModHistoryBarang.RegisterRTTI;
end.
