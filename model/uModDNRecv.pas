unit uModDNRecv;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uModApp, System.Generics.Collections,
  uModBarang, uModSatuan, uModDO, uModPO, uModUnit, uModSuplier;

type
  TModDNRecvItem = class;
  TModDNRecv = class(TModApp)
  private
    FDNR_DNRDITEMS: TObjectList<TModDNRecvItem>;
    FDNR_DATE: TDatetime;
    FDNR_DESCRIPTION: Double;
    FDNR_DO: TModDO;
    FDNR_INV_NO: string;
    FDNR_IS_CLAIM: Integer;
    FDNR_NO: string;
    FDNR_PO: TModPO;
    FDNR_PPN: Double;
    FDNR_PPNBM: Double;
    FDNR_TOTAL: Double;
    FDNR_TOTAL_DISC: Double;
    FDNR_UNT: TModUnit;
    function GetDNR_DNRDITEMS: TObjectList<TModDNRecvItem>;
    function GetDNR_TOTAL_TAX: Double;
  public
    class function GetTableName: string; override;
    property DNR_DNRDITEMS: TObjectList<TModDNRecvItem> read GetDNR_DNRDITEMS
        write FDNR_DNRDITEMS;
  published
    property DNR_DATE: TDatetime read FDNR_DATE write FDNR_DATE;
    property DNR_DESCRIPTION: Double read FDNR_DESCRIPTION write
        FDNR_DESCRIPTION;

    [AttributeOfForeign('DO_ID')]
    property DNR_DO: TModDO read FDNR_DO write FDNR_DO;
    property DNR_INV_NO: string read FDNR_INV_NO write FDNR_INV_NO;
    property DNR_IS_CLAIM: Integer read FDNR_IS_CLAIM write FDNR_IS_CLAIM;

    [AttributeOfCode]
    property DNR_NO: string read FDNR_NO write FDNR_NO;

    [AttributeOfForeign('PO_ID')]
    property DNR_PO: TModPO read FDNR_PO write FDNR_PO;
    property DNR_PPN: Double read FDNR_PPN write FDNR_PPN;
    property DNR_PPNBM: Double read FDNR_PPNBM write FDNR_PPNBM;
    property DNR_TOTAL: Double read FDNR_TOTAL write FDNR_TOTAL;
    property DNR_TOTAL_DISC: Double read FDNR_TOTAL_DISC write FDNR_TOTAL_DISC;
    property DNR_TOTAL_TAX: Double read GetDNR_TOTAL_TAX;

    [AttributeOfForeign('AUT$UNIT_ID')]
    property DNR_UNT: TModUnit read FDNR_UNT write FDNR_UNT;
  end;

  TModDNRecvItem = class(TModApp)
  private
    FBARANG_SUPLIER: TModBarangSupplier;
    FBARANG: TModBarang;
    FDN_RECV: TModDNRecv;
    FDNRD_IS_CLAIM_TTF: Integer;
    FDNRD_IS_OUTSTANDING: Integer;
    FDNRD_IS_PROCESS: Integer;
    FPO_DETAIL: TmODPOItem;
    FDNRD_PPN: Double;
    FDISCOUNT: Double;
    FDNRD_PPNBM: Double;
    FDNRD_PPNBM_PERSEN: Double;
    FDNRD_PPN_PERSEN: Double;
    FDNRD_PRICE: Double;
    FDNRD_QTY: Double;
    FDNRD_TOTAL: Double;
    FDNRD_TOTAL_DISC: Double;
    FDNRD_UOM: TModSatuan;
  public
    class function GetTableName: string; override;
  published
    property BARANG_SUPLIER: TModBarangSupplier read FBARANG_SUPLIER write
        FBARANG_SUPLIER;
    property BARANG: TModBarang read FBARANG write FBARANG;
    [AttributeOfHeader]
    property DN_RECV: TModDNRecv read FDN_RECV write FDN_RECV;
    property DNRD_IS_CLAIM_TTF: Integer read FDNRD_IS_CLAIM_TTF write
        FDNRD_IS_CLAIM_TTF;
    property DNRD_IS_OUTSTANDING: Integer read FDNRD_IS_OUTSTANDING write
        FDNRD_IS_OUTSTANDING;
    property DNRD_IS_PROCESS: Integer read FDNRD_IS_PROCESS write
        FDNRD_IS_PROCESS;
    property PO_DETAIL: TmODPOItem read FPO_DETAIL write FPO_DETAIL;
    property DNRD_PPN: Double read FDNRD_PPN write FDNRD_PPN;
    property DISCOUNT: Double read FDISCOUNT write FDISCOUNT;
    property DNRD_PPNBM: Double read FDNRD_PPNBM write FDNRD_PPNBM;
    property DNRD_PPNBM_PERSEN: Double read FDNRD_PPNBM_PERSEN write
        FDNRD_PPNBM_PERSEN;
    property DNRD_PPN_PERSEN: Double read FDNRD_PPN_PERSEN write
        FDNRD_PPN_PERSEN;
    property DNRD_PRICE: Double read FDNRD_PRICE write FDNRD_PRICE;
    property DNRD_QTY: Double read FDNRD_QTY write FDNRD_QTY;
    property DNRD_TOTAL: Double read FDNRD_TOTAL write FDNRD_TOTAL;
    property DNRD_TOTAL_DISC: Double read FDNRD_TOTAL_DISC write
        FDNRD_TOTAL_DISC;
    [AttributeOfForeign('REF$SATUAN_ID')]
    property DNRD_UOM: TModSatuan read FDNRD_UOM write FDNRD_UOM;
  end;


implementation

{
********************************** TModDNRecv **********************************
}
function TModDNRecv.GetDNR_DNRDITEMS: TObjectList<TModDNRecvItem>;
begin
  if not Assigned(FDNR_DNRDITEMS) then
    FDNR_DNRDITEMS := TObjectList<TModDNRecvItem>.Create();
  Result := FDNR_DNRDITEMS;
end;

function TModDNRecv.GetDNR_TOTAL_TAX: Double;
begin
  Result := DNR_PPN + DNR_PPNBM;
end;

class function TModDNRecv.GetTableName: string;
begin
  Result := 'DN_RECV';
end;

class function TModDNRecvItem.GetTableName: string;
begin
  Result := 'DN_RECV_DETIL';
end;


initialization
  TModDNRecv.RegisterRTTI;
  TModDNRecvItem.RegisterRTTI;
end.
