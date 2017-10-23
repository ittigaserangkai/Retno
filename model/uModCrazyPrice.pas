unit uModCrazyPrice;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uModApp, uModOrganization,uModBarang, uModSatuan, System.Generics.Collections;

type
  TModCrazyPriceItem = class;
  TModCrazyPrice = class(TModApp)
  private
    FCRAZY_CrazyPriceItemS: TObjectList<TModCrazyPriceItem>;
    FCRAZY_END_DATE: TDatetime;
    FCRAZY_ORGANIZATION: TModOrganization;
    FCRAZY_START_DATE: TDatetime;
  public
    property CRAZY_CrazyPriceItemS: TObjectList<TModCrazyPriceItem> read
        FCRAZY_CrazyPriceItemS write FCRAZY_CrazyPriceItemS;
  published
    property CRAZY_END_DATE: TDatetime read FCRAZY_END_DATE write
        FCRAZY_END_DATE;
    property CRAZY_ORGANIZATION: TModOrganization read FCRAZY_ORGANIZATION
        write FCRAZY_ORGANIZATION;
    property CRAZY_START_DATE: TDatetime read FCRAZY_START_DATE write
        FCRAZY_START_DATE;
  end;

  TModCrazyPriceItem = class(TModApp)
  private
    FCRAZYT_BARANG: TModBarang;
    FCRAZYT_COGS: Double;
    FCRAZYT_CrazyPrice: TModCrazyPrice;
    FCRAZYT_DATE: TDatetime;
    FCRAZYT_DISC_NOMINAL: Double;
    FCRAZYT_DISC_PERSEN: Double;
    FCRAZYT_KONVERSI: Double;
    FCRAZYT_MARKUP: Double;
    FCRAZYT_PPN: Double;
    FCRAZYT_SATUAN: TModSatuan;
    FCRAZYT_SELLPRICE_DISC: Double;
    FCRAZYT_SELLPRICE_PPN: Double;
  published
    property CRAZYT_BARANG: TModBarang read FCRAZYT_BARANG write FCRAZYT_BARANG;
    property CRAZYT_COGS: Double read FCRAZYT_COGS write FCRAZYT_COGS;
    property CRAZYT_CrazyPrice: TModCrazyPrice read FCRAZYT_CrazyPrice write
        FCRAZYT_CrazyPrice;
    property CRAZYT_DATE: TDatetime read FCRAZYT_DATE write FCRAZYT_DATE;
    property CRAZYT_DISC_NOMINAL: Double read FCRAZYT_DISC_NOMINAL write
        FCRAZYT_DISC_NOMINAL;
    property CRAZYT_DISC_PERSEN: Double read FCRAZYT_DISC_PERSEN write
        FCRAZYT_DISC_PERSEN;
    property CRAZYT_KONVERSI: Double read FCRAZYT_KONVERSI write
        FCRAZYT_KONVERSI;
    property CRAZYT_MARKUP: Double read FCRAZYT_MARKUP write FCRAZYT_MARKUP;
    property CRAZYT_PPN: Double read FCRAZYT_PPN write FCRAZYT_PPN;
    property CRAZYT_SATUAN: TModSatuan read FCRAZYT_SATUAN write FCRAZYT_SATUAN;
    property CRAZYT_SELLPRICE_DISC: Double read FCRAZYT_SELLPRICE_DISC write
        FCRAZYT_SELLPRICE_DISC;
    property CRAZYT_SELLPRICE_PPN: Double read FCRAZYT_SELLPRICE_PPN write
        FCRAZYT_SELLPRICE_PPN;
  end;


implementation



end.
