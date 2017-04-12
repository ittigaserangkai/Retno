unit uModPO;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uModApp, uModUnit, uModSO, uModSuplier, uModTipeKirimPO, System.Generics.Collections,
  uModBarang;

type
  TModPO = class;
  TModStatusPO = class(TModApp)
  private
    FSTAPO_CODE: string;
    FSTAPO_NAME: string;
  published
    property STAPO_CODE: string read FSTAPO_CODE write FSTAPO_CODE;
    property STAPO_NAME: string read FSTAPO_NAME write FSTAPO_NAME;
  end;

  TPOItem = class(TModApp)
  private
    FPOD_BARANG: TModBarang;
    FPOD_BARANG_SUPPLIER: TModBarangSupplier;
    FPOD_DISC1: Double;
    FPOD_DISC2: Double;
    FPOD_DISC3: Double;
    FPOD_DISC_TAMBAHAN: Double;
    FPOD_IS_BKP: Integer;
    FPOD_IS_STOCK: Double;
    FPOD_PO: TModPO;
    FPOD_PPN: Double;
    FPOD_PPNBM: Double;
    FPOD_PPNBM_PERSEN: Double;
    FPOD_PPN_PERSEN: Integer;
    FPOD_PRICE: Double;
    FPOD_QTY_ORDER: Double;
    FPOD_SODetil: TModSODetil;
    FPOD_TOTAL: Double;
    FPOD_TOTAL_DISC: Double;
    FPOD_TOTAL_TAX: Double;
    FPOD_TOTAL_TEMP: Double;
    FPOD_UOM: TModUnit;
  public
    property POD_DISC2: Double read FPOD_DISC2 write FPOD_DISC2;
    property POD_DISC3: Double read FPOD_DISC3 write FPOD_DISC3;
  published
    property POD_BARANG: TModBarang read FPOD_BARANG write FPOD_BARANG;
    property POD_BARANG_SUPPLIER: TModBarangSupplier read FPOD_BARANG_SUPPLIER
        write FPOD_BARANG_SUPPLIER;
    property POD_DISC1: Double read FPOD_DISC1 write FPOD_DISC1;
    property POD_DISC_TAMBAHAN: Double read FPOD_DISC_TAMBAHAN write
        FPOD_DISC_TAMBAHAN;
    property POD_IS_BKP: Integer read FPOD_IS_BKP write FPOD_IS_BKP;
    property POD_IS_STOCK: Double read FPOD_IS_STOCK write FPOD_IS_STOCK;
    property POD_PO: TModPO read FPOD_PO write FPOD_PO;
    property POD_PPN: Double read FPOD_PPN write FPOD_PPN;
    property POD_PPNBM: Double read FPOD_PPNBM write FPOD_PPNBM;
    property POD_PPNBM_PERSEN: Double read FPOD_PPNBM_PERSEN write
        FPOD_PPNBM_PERSEN;
    property POD_PPN_PERSEN: Integer read FPOD_PPN_PERSEN write FPOD_PPN_PERSEN;
    property POD_PRICE: Double read FPOD_PRICE write FPOD_PRICE;
    property POD_QTY_ORDER: Double read FPOD_QTY_ORDER write FPOD_QTY_ORDER;
    property POD_SODetil: TModSODetil read FPOD_SODetil write FPOD_SODetil;
    property POD_TOTAL: Double read FPOD_TOTAL write FPOD_TOTAL;
    property POD_TOTAL_DISC: Double read FPOD_TOTAL_DISC write FPOD_TOTAL_DISC;
    property POD_TOTAL_TAX: Double read FPOD_TOTAL_TAX write FPOD_TOTAL_TAX;
    property POD_TOTAL_TEMP: Double read FPOD_TOTAL_TEMP write FPOD_TOTAL_TEMP;
    property POD_UOM: TModUnit read FPOD_UOM write FPOD_UOM;
  end;

  TPOItems = class(TObjectList)
    TPOItem;
  private
    function GetPOItemS(Index: Integer): TPOItem;
    procedure SetPOItemS(Index: Integer; Value: TPOItem);
  public
    property POItemS[Index: Integer]: TPOItem read GetPOItemS write SetPOItemS;
  end;

  TModPO = class(TModApp)
  private
    FPOItems: TPOItems;
    FPO_COLIE: Double;
    FPO_DATE: TDateTime;
    FPO_DELIVER_DATE: TDateTime;
    FPO_DESCRIPTION: string;
    FPO_DESC_PRINT: string;
    FPO_IS_PO_BONUS: Integer;
    FPO_NO: string;
    FPO_PPNBM: Double;
    FPO_PRINTCOUNT: Integer;
    FPO_SERVICE_LEVEL: Double;
    FPO_SO: TModSO;
    FPO_STATUS_PO: TModStatusPO;
    FPO_SUPPLIER: TModSuplier;
    FPO_SUPPLIER_MERCHAN_GRUP: TModSuplierMerchanGroup;
    FPO_TIPE_PO: TModTipePo;
    FPO_UNIT: TModUnit;
    function GetPO_DISC: Double;
    function GetPO_PPN: Double;
    function GetPO_TOTAL: Double;
    procedure SetPO_DISC(Value: Double);
    procedure SetPO_PPN(Value: Double);
    procedure SetPO_TOTAL(Value: Double);
  public
    property POItems: TPOItems read FPOItems write FPOItems;
  published
    property PO_COLIE: Double read FPO_COLIE write FPO_COLIE;
    property PO_DATE: TDateTime read FPO_DATE write FPO_DATE;
    property PO_DELIVER_DATE: TDateTime read FPO_DELIVER_DATE write
        FPO_DELIVER_DATE;
    property PO_DESCRIPTION: string read FPO_DESCRIPTION write FPO_DESCRIPTION;
    property PO_DESC_PRINT: string read FPO_DESC_PRINT write FPO_DESC_PRINT;
    property PO_DISC: Double read GetPO_DISC write SetPO_DISC;
    property PO_IS_PO_BONUS: Integer read FPO_IS_PO_BONUS write FPO_IS_PO_BONUS;
    property PO_NO: string read FPO_NO write FPO_NO;
    property PO_PPN: Double read GetPO_PPN write SetPO_PPN;
    property PO_PPNBM: Double read FPO_PPNBM write FPO_PPNBM;
    property PO_PRINTCOUNT: Integer read FPO_PRINTCOUNT write FPO_PRINTCOUNT;
    property PO_SERVICE_LEVEL: Double read FPO_SERVICE_LEVEL write
        FPO_SERVICE_LEVEL;
    property PO_SO: TModSO read FPO_SO write FPO_SO;
    property PO_STATUS_PO: TModStatusPO read FPO_STATUS_PO write FPO_STATUS_PO;
    property PO_SUPPLIER: TModSuplier read FPO_SUPPLIER write FPO_SUPPLIER;
    property PO_SUPPLIER_MERCHAN_GRUP: TModSuplierMerchanGroup read
        FPO_SUPPLIER_MERCHAN_GRUP write FPO_SUPPLIER_MERCHAN_GRUP;
    property PO_TIPE_PO: TModTipePo read FPO_TIPE_PO write FPO_TIPE_PO;
    property PO_TOTAL: Double read GetPO_TOTAL write SetPO_TOTAL;
    property PO_UNIT: TModUnit read FPO_UNIT write FPO_UNIT;
  end;





implementation

{
************************************ TModPO ************************************
}
function TModPO.GetPO_DISC: Double;
begin
end;

function TModPO.GetPO_PPN: Double;
begin
end;

function TModPO.GetPO_TOTAL: Double;
begin
end;

procedure TModPO.SetPO_DISC(Value: Double);
begin
end;

procedure TModPO.SetPO_PPN(Value: Double);
begin
end;

procedure TModPO.SetPO_TOTAL(Value: Double);
begin
end;

{
*********************************** TPOItems ***********************************
}
function TPOItems.GetPOItemS(Index: Integer): TPOItem;
begin
end;

procedure TPOItems.SetPOItemS(Index: Integer; Value: TPOItem);
begin
end;



end.
