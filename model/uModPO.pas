unit uModPO;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uModApp, uModUnit, uModSO, uModSuplier, uModTipeKirimPO, System.Generics.Collections,
  uModBarang, uModSatuan;

type
  TModPO = class;
  TModTipePo = class(TModApp)
  end;

  TModStatusPO = class(TModApp)
  private
    FSTAPO_CODE: string;
    FSTAPO_NAME: string;
  public
    class function GetTableName: String; override;
  published
    property STAPO_CODE: string read FSTAPO_CODE write FSTAPO_CODE;
    property STAPO_NAME: string read FSTAPO_NAME write FSTAPO_NAME;
  end;

  TModPOItem = class(TModApp)
  private
    FPOD_BARANG: TModBarang;
    FPOD_BARANG_SUPPLIER: TModBarangSupplier;
    FPOD_DISC1: Double;
    FPOD_DISC2: Double;
    FPOD_DISC3: Double;
    FPOD_DISC_TAMBAHAN: Double;
    FPOD_IS_BKP: Integer;
    FPOD_IS_STOCK: Integer;
    FPOD_PO: TModPO;
    FPOD_PPN: Double;
    FPOD_PPNBM: Double;
    FPOD_PPNBM_PERSEN: Double;
    FPOD_PPN_PERSEN: Integer;
    FPOD_PRICE: Double;
    FPOD_QTY_ORDER: Double;
    FPOD_SODetail: TModSODetail;
    FPOD_TOTAL: Double;
    FPOD_TOTAL_DISC: Double;
    FPOD_TOTAL_TAX: Double;
    FPOD_TOTAL_TEMP: Double;
    FPOD_UOM: TModSatuan;
    procedure SetPOD_BARANG(const Value: TModBarang);
    procedure SetPOD_UOM(const Value: TModSatuan);
  public
    class function GetTableName: String; override;
  published
    [AttributeOfForeign('BARANG_ID')]
    property POD_BARANG: TModBarang read FPOD_BARANG write SetPOD_BARANG;

    [AttributeOfForeign('BARANG_SUPLIER_ID')]
    property POD_BARANG_SUPPLIER: TModBarangSupplier read FPOD_BARANG_SUPPLIER
        write FPOD_BARANG_SUPPLIER;
    property POD_DISC1: Double read FPOD_DISC1 write FPOD_DISC1;
    property POD_DISC2: Double read FPOD_DISC2 write FPOD_DISC2;
    property POD_DISC3: Double read FPOD_DISC3 write FPOD_DISC3;
    property POD_DISC_TAMBAHAN: Double read FPOD_DISC_TAMBAHAN write
        FPOD_DISC_TAMBAHAN;
    property POD_IS_BKP: Integer read FPOD_IS_BKP write FPOD_IS_BKP;
    property POD_IS_STOCK: Integer read FPOD_IS_STOCK write FPOD_IS_STOCK;

    [AttributeOfHeader('PO_ID')]
    property POD_PO: TModPO read FPOD_PO write FPOD_PO;
    property POD_PPN: Double read FPOD_PPN write FPOD_PPN;
    property POD_PPNBM: Double read FPOD_PPNBM write FPOD_PPNBM;
    property POD_PPNBM_PERSEN: Double read FPOD_PPNBM_PERSEN write
        FPOD_PPNBM_PERSEN;
    property POD_PPN_PERSEN: Integer read FPOD_PPN_PERSEN write FPOD_PPN_PERSEN;
    property POD_PRICE: Double read FPOD_PRICE write FPOD_PRICE;
    property POD_QTY_ORDER: Double read FPOD_QTY_ORDER write FPOD_QTY_ORDER;

    [AttributeOfForeign('SO_Detail_ID')]
    property POD_SODetail: TModSODetail read FPOD_SODetail write FPOD_SODetail;
    property POD_TOTAL: Double read FPOD_TOTAL write FPOD_TOTAL;
    property POD_TOTAL_DISC: Double read FPOD_TOTAL_DISC write FPOD_TOTAL_DISC;
    property POD_TOTAL_TAX: Double read FPOD_TOTAL_TAX write FPOD_TOTAL_TAX;
    property POD_TOTAL_TEMP: Double read FPOD_TOTAL_TEMP write FPOD_TOTAL_TEMP;
    [AttributeOfForeign('REF$SATUAN_ID')]
    property POD_UOM: TModSatuan read FPOD_UOM write SetPOD_UOM;
  end;

  TModPO = class(TModApp)
  private
    FPOItems: TObjectList<TModPOItem>;
    FPO_NO_REF: string;
    FPO_COLIE: Double;
    FPO_DATE: TDateTime;
    FPO_DELIVER_DATE: TDateTime;
    FPO_DESCRIPTION: string;
    FPO_DESC_PRINT: string;
    FPO_DISC: Double;
    FPO_IS_PO_BONUS: Integer;
    FPO_NO: string;
    FPO_PPN: Double;
    FPO_PPNBM: Double;
    FPO_PRINTCOUNT: Integer;
    FPO_SERVICE_LEVEL: Double;
    FPO_SO: TModSO;
    FPO_STATUS_PO: TModStatusPO;
    FPO_SUPPLIER: TModSuplier;
    FPO_SUPPLIER_MERCHAN_GRUP: TModSuplierMerchanGroup;
    FPO_TOP: Integer;
    FPO_TOTAL: Double;
    FPO_UNIT: TModUnit;
    FPO_VALID_DATE: TDatetime;
    function GetPOItems: TObjectList<TModPOItem>;
    function GetPO_SUBTOTAL: Double;
    procedure SetPO_SO(const Value: TModSO);
    procedure SetPO_SUPPLIER_MERCHAN_GRUP(const Value: TModSuplierMerchanGroup);
    procedure SetPO_STATUS_PO(const Value: TModStatusPO);
  public
    property POItems: TObjectList<TModPOItem> read GetPOItems write FPOItems;
    property PO_NO_REF: string read FPO_NO_REF write FPO_NO_REF;
    property PO_SUBTOTAL: Double read GetPO_SUBTOTAL;
  published
    property PO_COLIE: Double read FPO_COLIE write FPO_COLIE;
    property PO_DATE: TDateTime read FPO_DATE write FPO_DATE;
    property PO_DELIVER_DATE: TDateTime read FPO_DELIVER_DATE write
        FPO_DELIVER_DATE;
    property PO_DESCRIPTION: string read FPO_DESCRIPTION write FPO_DESCRIPTION;
    property PO_DESC_PRINT: string read FPO_DESC_PRINT write FPO_DESC_PRINT;
    property PO_DISC: Double read FPO_DISC write FPO_DISC;
    property PO_IS_PO_BONUS: Integer read FPO_IS_PO_BONUS write FPO_IS_PO_BONUS;

    [AttributeOfCode]
    property PO_NO: string read FPO_NO write FPO_NO;
    property PO_PPN: Double read FPO_PPN write FPO_PPN;
    property PO_PPNBM: Double read FPO_PPNBM write FPO_PPNBM;
    property PO_PRINTCOUNT: Integer read FPO_PRINTCOUNT write FPO_PRINTCOUNT;
    property PO_SERVICE_LEVEL: Double read FPO_SERVICE_LEVEL write
        FPO_SERVICE_LEVEL;
    [AttributeOfForeign('SO_ID')]
    property PO_SO: TModSO read FPO_SO write SetPO_SO;

    [AttributeOfForeign('REF$STATUS_PO_ID')]
    property PO_STATUS_PO: TModStatusPO read FPO_STATUS_PO write SetPO_STATUS_PO;

    [AttributeOfForeign('SUPLIER_ID')]
    property PO_SUPPLIER: TModSuplier read FPO_SUPPLIER write FPO_SUPPLIER;

    [AttributeOfForeign('SUPLIER_MERCHAN_GRUP_ID')]
    property PO_SUPPLIER_MERCHAN_GRUP: TModSuplierMerchanGroup read
        FPO_SUPPLIER_MERCHAN_GRUP write SetPO_SUPPLIER_MERCHAN_GRUP;
    property PO_TOP: Integer read FPO_TOP write FPO_TOP;


    property PO_TOTAL: Double read FPO_TOTAL write FPO_TOTAL;

    [AttributeOfForeign('AUT$UNIT_ID')]
    property PO_UNIT: TModUnit read FPO_UNIT write FPO_UNIT;
    property PO_VALID_DATE: TDatetime read FPO_VALID_DATE write FPO_VALID_DATE;
  end;






implementation

function TModPO.GetPOItems: TObjectList<TModPOItem>;
begin
  if FPOItems = nil then
    FPOItems := TObjectList<TModPOItem>.Create();

  Result := FPOItems;
end;

function TModPO.GetPO_SUBTOTAL: Double;
begin
  Result := PO_TOTAL + PO_DISC - PO_PPN - PO_PPNBM;
end;

procedure TModPO.SetPO_SO(const Value: TModSO);
begin
  if FPO_SO <> Value then
    FreeAndNil(FPO_SO);

  FPO_SO := Value;
end;

procedure TModPO.SetPO_STATUS_PO(const Value: TModStatusPO);
begin
  if Self.FPO_STATUS_PO <> Value then
  begin
    FreeAndNil(Self.FPO_STATUS_PO);
    FPO_STATUS_PO := Value;
  end;
end;

procedure TModPO.SetPO_SUPPLIER_MERCHAN_GRUP(const Value:
    TModSuplierMerchanGroup);
begin
  if FPO_SUPPLIER_MERCHAN_GRUP <> Value then
  begin
    FreeAndNil(FPO_SUPPLIER_MERCHAN_GRUP);
    FPO_SUPPLIER_MERCHAN_GRUP := Value;
  end;
end;

class function TModPOItem.GetTableName: String;
begin
  Result := 'PO_DETAIL'
end;

procedure TModPOItem.SetPOD_BARANG(const Value: TModBarang);
begin
  if FPOD_BARANG <> Value then
    FreeAndNil(FPOD_BARANG);

  FPOD_BARANG := Value;
end;

procedure TModPOItem.SetPOD_UOM(const Value: TModSatuan);
begin
  if FPOD_UOM <> Value then
    FreeAndNil(FPOD_UOM);

  FPOD_UOM := Value;
end;


{ TModStatusPO }

class function TModStatusPO.GetTableName: String;
begin
  Result := 'REF$STATUS_PO';
end;

initialization
  TModPO.RegisterRTTI;
end.
