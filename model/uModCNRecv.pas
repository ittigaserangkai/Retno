unit uModCNRecv;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uModApp, System.Generics.Collections,
  uModBarang, uModSatuan, uModDO, uModPO, uModUnit, uModSuplier;

type
  TModCNRecvItem = class;
  TModCNRecv = class(TModApp)
  private
    FCNR_CNRDITEMS: TObjectList<TModCNRecvItem>;
    FCNR_DATE: TDatetime;
    FCNR_DESCRIPTION: Double;
    FCNR_DO: TModDO;
    FCNR_INV_NO: string;
    FCNR_IS_CLAIM: Integer;
    FCNR_NO: string;
    FCNR_PO: TModPO;
    FCNR_PPN: Double;
    FCNR_PPNBM: Double;
    FCNR_TOTAL: Double;
    FCNR_TOTAL_DISC: Double;
    FCNR_UNT: TModUnit;
    function GetCNR_CNRDITEMS: TObjectList<TModCNRecvItem>;
    function GetCNR_TOTAL_TAX: Double;
  public
    class function GetTableName: string; override;
    property CNR_CNRDITEMS: TObjectList<TModCNRecvItem> read GetCNR_CNRDITEMS
        write FCNR_CNRDITEMS;
  published
    property CNR_DATE: TDatetime read FCNR_DATE write FCNR_DATE;
    property CNR_DESCRIPTION: Double read FCNR_DESCRIPTION write
        FCNR_DESCRIPTION;

    [AttributeOfForeign('DO_ID')]
    property CNR_DO: TModDO read FCNR_DO write FCNR_DO;
    property CNR_INV_NO: string read FCNR_INV_NO write FCNR_INV_NO;
    property CNR_IS_CLAIM: Integer read FCNR_IS_CLAIM write FCNR_IS_CLAIM;

    [AttributeOfCode]
    property CNR_NO: string read FCNR_NO write FCNR_NO;

    [AttributeOfForeign('PO_ID')]
    property CNR_PO: TModPO read FCNR_PO write FCNR_PO;
    property CNR_PPN: Double read FCNR_PPN write FCNR_PPN;
    property CNR_PPNBM: Double read FCNR_PPNBM write FCNR_PPNBM;
    property CNR_TOTAL: Double read FCNR_TOTAL write FCNR_TOTAL;
    property CNR_TOTAL_DISC: Double read FCNR_TOTAL_DISC write FCNR_TOTAL_DISC;
    property CNR_TOTAL_TAX: Double read GetCNR_TOTAL_TAX;

    [AttributeOfForeign('AUT$UNIT_ID')]
    property CNR_UNT: TModUnit read FCNR_UNT write FCNR_UNT;
  end;

  TModCNRecvItem = class(TModApp)
  private
    FBARANG_SUPLIER: TModBarangSupplier;
    FBARANG: TModBarang;
    FCN_RECV: TModCNRecv;
    FCNRD_IS_CLAIM_TTF: Integer;
    FCNRD_IS_OUTSTANDING: Integer;
    FCNRD_IS_PROCESS: Integer;
    FPO_DETAIL: TmODPOItem;
    FCNRD_PPN: Double;
    FDISCOUNT: Double;
    FCNRD_PPNBM: Double;
    FCNRD_PPNBM_PERSEN: Double;
    FCNRD_PPN_PERSEN: Double;
    FCNRD_PRICE: Double;
    FCNRD_QTY: Double;
    FCNRD_TOTAL: Double;
    FCNRD_TOTAL_DISC: Double;
    FCNRD_UOM: TModSatuan;
  public
    class function GetTableName: string; override;
  published
    property BARANG_SUPLIER: TModBarangSupplier read FBARANG_SUPLIER write
        FBARANG_SUPLIER;
    property BARANG: TModBarang read FBARANG write FBARANG;
    [AttributeOfHeader]
    property CN_RECV: TModCNRecv read FCN_RECV write FCN_RECV;
    property CNRD_IS_CLAIM_TTF: Integer read FCNRD_IS_CLAIM_TTF write
        FCNRD_IS_CLAIM_TTF;
    property CNRD_IS_OUTSTANDING: Integer read FCNRD_IS_OUTSTANDING write
        FCNRD_IS_OUTSTANDING;
    property CNRD_IS_PROCESS: Integer read FCNRD_IS_PROCESS write
        FCNRD_IS_PROCESS;
    property PO_DETAIL: TmODPOItem read FPO_DETAIL write FPO_DETAIL;
    property CNRD_PPN: Double read FCNRD_PPN write FCNRD_PPN;
    property DISCOUNT: Double read FDISCOUNT write FDISCOUNT;
    property CNRD_PPNBM: Double read FCNRD_PPNBM write FCNRD_PPNBM;
    property CNRD_PPNBM_PERSEN: Double read FCNRD_PPNBM_PERSEN write
        FCNRD_PPNBM_PERSEN;
    property CNRD_PPN_PERSEN: Double read FCNRD_PPN_PERSEN write
        FCNRD_PPN_PERSEN;
    property CNRD_PRICE: Double read FCNRD_PRICE write FCNRD_PRICE;
    property CNRD_QTY: Double read FCNRD_QTY write FCNRD_QTY;
    property CNRD_TOTAL: Double read FCNRD_TOTAL write FCNRD_TOTAL;
    property CNRD_TOTAL_DISC: Double read FCNRD_TOTAL_DISC write
        FCNRD_TOTAL_DISC;
    [AttributeOfForeign('REF$SATUAN_ID')]
    property CNRD_UOM: TModSatuan read FCNRD_UOM write FCNRD_UOM;
  end;


implementation

{
********************************** TModCNRecv **********************************
}
function TModCNRecv.GetCNR_CNRDITEMS: TObjectList<TModCNRecvItem>;
begin
  if not Assigned(FCNR_CNRDITEMS) then
    FCNR_CNRDITEMS := TObjectList<TModCNRecvItem>.Create();
  Result := FCNR_CNRDITEMS;
end;

function TModCNRecv.GetCNR_TOTAL_TAX: Double;
begin
  Result := CNR_PPN + CNR_PPNBM;
end;

class function TModCNRecv.GetTableName: string;
begin
  Result := 'CN_RECV';
end;

class function TModCNRecvItem.GetTableName: string;
begin
  Result := 'CN_RECV_DETIL';
end;


initialization
  TModCNRecv.RegisterRTTI;
  TModCNRecvItem.RegisterRTTI;
end.
