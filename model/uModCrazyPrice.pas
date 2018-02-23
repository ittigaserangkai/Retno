unit uModCrazyPrice;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uModApp, uModOrganization,uModBarang, System.Generics.Collections,
  uModUnit, uModSatuan;


type
  TModCrazyPrice = class(TModApp)
  private
    FCRAZY_BARANG: TModBarang;
    FCRAZY_COGS: Double;
    FCRAZY_DATE: TDatetime;
    FCRAZY_DISC_NOMINAL: Double;
    FCRAZY_DISC_PERSEN: Double;
    FCRAZY_KONVERSI: Double;
    FCRAZY_MARKUP: Double;
    FCRAZY_PPN: Double;
    FCRAZY_SATUAN: TModSatuan;
    FCRAZY_SELLPRICE_DISC: Double;
    FCRAZY_SELLPRICE: Double;
    FCRAZY_END_DATE: TDatetime;
    FCRAZY_ORGANIZATION: TModOrganization;
    FCRAZY_START_DATE: TDatetime;
  public
  published
    property CRAZY_BARANG: TModBarang read FCRAZY_BARANG write FCRAZY_BARANG;
    property CRAZY_COGS: Double read FCRAZY_COGS write FCRAZY_COGS;
    property CRAZY_DATE: TDatetime read FCRAZY_DATE write FCRAZY_DATE;
    property CRAZY_DISC_NOMINAL: Double read FCRAZY_DISC_NOMINAL write
        FCRAZY_DISC_NOMINAL;
    property CRAZY_DISC_PERSEN: Double read FCRAZY_DISC_PERSEN write
        FCRAZY_DISC_PERSEN;
    property CRAZY_KONVERSI: Double read FCRAZY_KONVERSI write FCRAZY_KONVERSI;
    property CRAZY_MARKUP: Double read FCRAZY_MARKUP write FCRAZY_MARKUP;
    property CRAZY_PPN: Double read FCRAZY_PPN write FCRAZY_PPN;
    property CRAZY_SATUAN: TModSatuan read FCRAZY_SATUAN write FCRAZY_SATUAN;
    property CRAZY_SELLPRICE_DISC: Double read FCRAZY_SELLPRICE_DISC write
        FCRAZY_SELLPRICE_DISC;
    property CRAZY_SELLPRICE: Double read FCRAZY_SELLPRICE write FCRAZY_SELLPRICE;
    property CRAZY_END_DATE: TDatetime read FCRAZY_END_DATE write
        FCRAZY_END_DATE;
    property CRAZY_ORGANIZATION: TModOrganization read FCRAZY_ORGANIZATION
        write FCRAZY_ORGANIZATION;
    property CRAZY_START_DATE: TDatetime read FCRAZY_START_DATE write
        FCRAZY_START_DATE;
  end;
implementation


initialization
  TModCrazyPrice.RegisterRTTI;



end.
