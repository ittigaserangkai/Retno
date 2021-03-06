unit uModTransferBarang;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uModApp, uModGudang, uModBarang, uModUnit, uModSatuan,
  Datasnap.DBClient, System.Generics.Collections;

type
  TModTransferBarangItem = class;
  TModTransferBarang = class(TModApp)
  private
    FTB_COLIE: Double;
    FTB_GUDANG_ASAL: TModGudang;
    FTB_GUDANG_TUJUAN: TModGudang;
    FTB_Keterangan: string;
    FTB_NO: string;
    FTB_REFERENSI: string;
    FTB_TANGGAL: TDateTime;
    FTB_TransferBarangItems: TOBjectList<TModTransferBarangItem>;
    FTB_Unit: TModUnit;
    function GetTB_TransferBarangItems: TOBjectList<TModTransferBarangItem>;
  public
    property TB_TransferBarangItems: TOBjectList<TModTransferBarangItem> read
        GetTB_TransferBarangItems write FTB_TransferBarangItems;
  published
    property TB_COLIE: Double read FTB_COLIE write FTB_COLIE;
    property TB_GUDANG_ASAL: TModGudang read FTB_GUDANG_ASAL write
        FTB_GUDANG_ASAL;
    property TB_GUDANG_TUJUAN: TModGudang read FTB_GUDANG_TUJUAN write
        FTB_GUDANG_TUJUAN;
    [AttributeOfSize('120')]
    property TB_Keterangan: string read FTB_Keterangan write FTB_Keterangan;
    [AttributeOfCode]
    property TB_NO: string read FTB_NO write FTB_NO;
    [AttributeOfSize('60')]
    property TB_REFERENSI: string read FTB_REFERENSI write FTB_REFERENSI;
    property TB_TANGGAL: TDATEtime read FTB_TANGGAL write FTB_TANGGAL;
    property TB_Unit: TModUnit read FTB_Unit write FTB_Unit;
  end;

  TModTransferBarangItem = class(TModApp)
  private
    FTBI_Barang: TModBarang;
    FTBI_Qty: Double;
    FTBI_TransferBarang: TModTransferBarang;
    FTBI_UOM: TModSatuan;
  published
    [AttributeofForeign]
    property TBI_Barang: TModBarang read FTBI_Barang write FTBI_Barang;
    property TBI_Qty: Double read FTBI_Qty write FTBI_Qty;
    [AttributeOfHeader]
    property TBI_TransferBarang: TModTransferBarang read FTBI_TransferBarang
        write FTBI_TransferBarang;
    [AttributeofForeign]
    property TBI_UOM: TModSatuan read FTBI_UOM write FTBI_UOM;
  end;


implementation

function TModTransferBarang.GetTB_TransferBarangItems:
    TOBjectList<TModTransferBarangItem>;
begin
  if FTB_TransferBarangItems = nil then
    FTB_TransferBarangItems := TObjectList<TModTransferBarangItem>.Create();

  Result := FTB_TransferBarangItems;
end;

initialization
  TModTransferBarang.RegisterRTTI;


end.
