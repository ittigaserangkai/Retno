unit uModelHelper;

interface
uses
  uModApp, uModPO, uModSO,uModSuplier,uModBarang, uModSatuan,
  System.SysUtils, uDMClient, uModDO;

type
  TModPOItemHelper = class helper for  TModPOItem
  public
    procedure LoadBarang;
    procedure LoadUOM;
  end;

  TModPOHelper = class helper for  TModPO
  public
    procedure LoadPO_SUPPLIER_MERCHAN_GRUP;
    procedure LoadSO;
  end;

  TModDOHelper = class helper for TModDO
  public
    procedure LoadPO;

  end;
implementation

procedure TModPOHelper.LoadPO_SUPPLIER_MERCHAN_GRUP;
begin
  Self.PO_SUPPLIER_MERCHAN_GRUP := TModSuplierMerchanGroup(DMClient.CrudClient.Retrieve(TModSuplierMerchanGroup.ClassName, Self.PO_SUPPLIER_MERCHAN_GRUP.ID));
end;

procedure TModPOHelper.LoadSO;
begin
  Self.PO_SO := TModSO(DMClient.CrudClient.RetrieveSingle(TModSO.ClassName, Self.PO_SO.ID));
end;

procedure TModPOItemHelper.LoadBarang;
begin
  Self.POD_BARANG := TModBarang(DMClient.CrudClient.Retrieve(TModBarang.ClassName, Self.POD_BARANG.ID));
end;

procedure TModPOItemHelper.LoadUOM;
begin
  Self.POD_UOM := TModSatuan(DMClient.CrudClient.Retrieve(TModSatuan.ClassName,Self.POD_UOM.ID));
end;

procedure TModDOHelper.LoadPO;
begin
  Self.PO := TModPO(DMClient.CrudPOClient.RetrieveSingle(TModPO.ClassName, Self.PO.ID));
end;

end.
