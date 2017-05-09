unit uModDO;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs, uModApp,
  System.Generics.Collections, uModSuplier, uModPO, uModSO,uModUnit,
  uModBarang,uModSatuan;

type
  TModDOItem = class;
  TModDO = class(TModApp)
  private
    FDOItems: TobjectList<TModDOItem>;
    FDO_CN: Double;
    FDO_COLIE_BONUS: Double;
    FDO_COLIE_BONUS_RECV: Double;
    FDO_COLIE_ORDER: Double;
    FDO_COLIE_ORDER_RECV: Double;
    FDO_DATE: TDateTime;
    FDO_DESCRIPTION: string;
    FDO_DISC: Double;
    FDO_DN: Double;
    FDO_DO: TModDO;
    FDO_IS_BONUS: Integer;
    FDO_IS_JURNAL: Integer;
    FDO_IS_PAID: Integer;
    FDO_NO: string;
    FDO_NP: string;
    FDO_PAYMENT: Double;
    FDO_PAYMENT_DATE: TDatetime;
    FDO_PPN: Double;
    FDO_PPNBM: Double;
    FDO_TOTAL: Double;
    FMERCHANDISE: TModMerchandise;
    FPO: TModPO;
    FSO: TModSO;
    FSUPLIER_MERCHAN_GRUP: TModSuplierMerchanGroup;
    FUNITSTORE: TModUnit;
    function GetDOItems: TobjectList<TModDOItem>;
  public
    destructor Destroy; override;
  published
    property DOItems: TobjectList<TModDOItem> read GetDOItems write FDOItems;
    property DO_CN: Double read FDO_CN write FDO_CN;
    property DO_COLIE_BONUS: Double read FDO_COLIE_BONUS write FDO_COLIE_BONUS;
    property DO_COLIE_BONUS_RECV: Double read FDO_COLIE_BONUS_RECV write
        FDO_COLIE_BONUS_RECV;
    property DO_COLIE_ORDER: Double read FDO_COLIE_ORDER write FDO_COLIE_ORDER;
    property DO_COLIE_ORDER_RECV: Double read FDO_COLIE_ORDER_RECV write
        FDO_COLIE_ORDER_RECV;
    property DO_DATE: TDateTime read FDO_DATE write FDO_DATE;
    property DO_DESCRIPTION: string read FDO_DESCRIPTION write FDO_DESCRIPTION;
    property DO_DISC: Double read FDO_DISC write FDO_DISC;
    property DO_DN: Double read FDO_DN write FDO_DN;
    property DO_DO: TModDO read FDO_DO write FDO_DO;
    property DO_IS_BONUS: Integer read FDO_IS_BONUS write FDO_IS_BONUS;
    property DO_IS_JURNAL: Integer read FDO_IS_JURNAL write FDO_IS_JURNAL;
    property DO_IS_PAID: Integer read FDO_IS_PAID write FDO_IS_PAID;
    property DO_NO: string read FDO_NO write FDO_NO;
    property DO_NP: string read FDO_NP write FDO_NP;
    property DO_PAYMENT: Double read FDO_PAYMENT write FDO_PAYMENT;
    property DO_PAYMENT_DATE: TDatetime read FDO_PAYMENT_DATE write
        FDO_PAYMENT_DATE;
    property DO_PPN: Double read FDO_PPN write FDO_PPN;
    property DO_PPNBM: Double read FDO_PPNBM write FDO_PPNBM;
    property DO_TOTAL: Double read FDO_TOTAL write FDO_TOTAL;
    property MERCHANDISE: TModMerchandise read FMERCHANDISE write FMERCHANDISE;
    property PO: TModPO read FPO write FPO;
    property SO: TModSO read FSO write FSO;
    property SUPLIER_MERCHAN_GRUP: TModSuplierMerchanGroup read
        FSUPLIER_MERCHAN_GRUP write FSUPLIER_MERCHAN_GRUP;
    property UNITSTORE: TModUnit read FUNITSTORE write FUNITSTORE;
  end;

  TModDOItem = class(TModApp)
  private
    FBARANG: TModBarang;
    FDOD_DISC1: Double;
    FDOD_DISC2: Double;
    FDOD_DISC3: Double;
    FDOD_DO: TModDO;
    FDOD_IS_BKP: Double;
    FDOD_IS_STOCK: Double;
    FDOD_PPN: Double;
    FDOD_PPNBM: Double;
    FDOD_PPNBM_PERSEN: Double;
    FDOD_PPN_PERSEN: Double;
    FDOD_PRICE: Double;
    FDOD_QTY_ORDER: Double;
    FDOD_QTY_ORDER_RECV: Double;
    FDOD_QTY_ORDER_RECV_CN: Double;
    FDOD_QTY_ORDER_RECV_DN: Double;
    FDOD_TOTAL: Double;
    FDOD_TOTAL_DISC: Double;
    FDOD_TOTAL_TAX: Double;
    FDOD_TOTAL_TEMP: Double;
    FPOITEM: TModPOItem;
    FSATUAN: TModSatuan;
  public
    destructor Destroy; override;
  published
    property BARANG: TModBarang read FBARANG write FBARANG;
    property DOD_DISC1: Double read FDOD_DISC1 write FDOD_DISC1;
    property DOD_DISC2: Double read FDOD_DISC2 write FDOD_DISC2;
    property DOD_DISC3: Double read FDOD_DISC3 write FDOD_DISC3;
    property DOD_DO: TModDO read FDOD_DO write FDOD_DO;
    property DOD_IS_BKP: Double read FDOD_IS_BKP write FDOD_IS_BKP;
    property DOD_IS_STOCK: Double read FDOD_IS_STOCK write FDOD_IS_STOCK;
    property DOD_PPN: Double read FDOD_PPN write FDOD_PPN;
    property DOD_PPNBM: Double read FDOD_PPNBM write FDOD_PPNBM;
    property DOD_PPNBM_PERSEN: Double read FDOD_PPNBM_PERSEN write
        FDOD_PPNBM_PERSEN;
    property DOD_PPN_PERSEN: Double read FDOD_PPN_PERSEN write FDOD_PPN_PERSEN;
    property DOD_PRICE: Double read FDOD_PRICE write FDOD_PRICE;
    property DOD_QTY_ORDER: Double read FDOD_QTY_ORDER write FDOD_QTY_ORDER;
    property DOD_QTY_ORDER_RECV: Double read FDOD_QTY_ORDER_RECV write
        FDOD_QTY_ORDER_RECV;
    property DOD_QTY_ORDER_RECV_CN: Double read FDOD_QTY_ORDER_RECV_CN write
        FDOD_QTY_ORDER_RECV_CN;
    property DOD_QTY_ORDER_RECV_DN: Double read FDOD_QTY_ORDER_RECV_DN write
        FDOD_QTY_ORDER_RECV_DN;
    property DOD_TOTAL: Double read FDOD_TOTAL write FDOD_TOTAL;
    property DOD_TOTAL_DISC: Double read FDOD_TOTAL_DISC write FDOD_TOTAL_DISC;
    property DOD_TOTAL_TAX: Double read FDOD_TOTAL_TAX write FDOD_TOTAL_TAX;
    property DOD_TOTAL_TEMP: Double read FDOD_TOTAL_TEMP write FDOD_TOTAL_TEMP;
    property POITEM: TModPOItem read FPOITEM write FPOITEM;
    property SATUAN: TModSatuan read FSATUAN write FSATUAN;
  end;


implementation

{
************************************ TModDO ************************************
}
destructor TModDO.Destroy;
begin
  inherited;
  DOItems.Clear;
  FreeAndNil(FDO_DO);
  FreeAndNil(FSUPLIER_MERCHAN_GRUP);
  FreeAndNil(FMERCHANDISE);
  FreeAndNil(FPO);
  FreeAndNil(FSO);
  FreeAndNil(FUNITSTORE);

end;

function TModDO.GetDOItems: TobjectList<TModDOItem>;
begin
  if FDOItems = nil then
    FDOItems := TObjectList<TModDOItem>.Create();

  Result := FDOItems;
end;

{
********************************** TModDOItem **********************************
}
destructor TModDOItem.Destroy;
begin
  inherited;
  FreeAndNil(FBARANG);

  FreeAndNil(FSATUAN);
  FreeAndNil(FPOITEM);
end;



end.
