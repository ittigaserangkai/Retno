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
    FTB_TANGGAL: TDATEtime;
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
    property TB_Keterangan: string read FTB_Keterangan write FTB_Keterangan;

    [AttributeOfCode]
    property TB_NO: string read FTB_NO write FTB_NO;
    property TB_TANGGAL: TDATEtime read FTB_TANGGAL write FTB_TANGGAL;
    property TB_Unit: TModUnit read FTB_Unit write FTB_Unit;
  end;

  TModTransferBarangItem = class(TModApp)
  private
    FTBI_Barang: TModBarang;
    FTBI_TransferBarang: TModTransferBarang;
    FTBI_UOM: TModSatuan;
    FTB_Qty: Double;
  published
    property TBI_Barang: TModBarang read FTBI_Barang write FTBI_Barang;

    [AttributeOfHeader]
    property TBI_TransferBarang: TModTransferBarang read FTBI_TransferBarang
        write FTBI_TransferBarang;
    property TBI_UOM: TModSatuan read FTBI_UOM write FTBI_UOM;
    property TB_Qty: Double read FTB_Qty write FTB_Qty;
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
