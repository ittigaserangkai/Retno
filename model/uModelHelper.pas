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
    procedure LoadStatusPO;
  end;

  TModDOHelper = class helper for TModDO
  public
    procedure LoadPO;
  end;

  TModAppHelper = class helper for TModApp
  public
    procedure Reload(LoadObjectList: Boolean = False);
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

procedure TModPOHelper.LoadStatusPO;
begin
  Self.PO_STATUS_PO := TModStatusPO(DMClient.CrudClient.RetrieveSingle(TModStatusPO.ClassName, Self.PO_STATUS_PO.ID));
end;

procedure TModPOItemHelper.LoadBarang;
begin
  Self.POD_BARANG := TModBarang(DMClient.CrudClient.RetrieveSingle(TModBarang.ClassName, Self.POD_BARANG.ID));
end;

procedure TModPOItemHelper.LoadUOM;
begin
  Self.POD_UOM := TModSatuan(DMClient.CrudClient.RetrieveSingle(TModSatuan.ClassName,Self.POD_UOM.ID));
end;

procedure TModDOHelper.LoadPO;
begin
  Self.PO := TModPO(DMClient.CrudPOClient.RetrieveSingle(TModPO.ClassName, Self.PO.ID));
end;

procedure TModAppHelper.Reload(LoadObjectList: Boolean = False);
var
  aID: string;
  sClassName: string;
begin
  sClassName  := Self.ClassName;
  aID         := Self.ID;
  FreeAndNil(Self);
  if LoadObjectList then
    Self := DMClient.CrudClient.Retrieve(sClassName, aID)
  else
    Self := DMClient.CrudClient.RetrieveSingle(sClassName, aID);
end;

end.
