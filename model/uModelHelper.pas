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
  private
    procedure CopyFrom(aModApp : TModApp);
  protected
  public
    procedure Reload(LoadObjectList: Boolean = False);
    function ReloadByCode(aCode: String): Boolean;
  end;

function GetModAppRestID(aObject: TModApp): String;

implementation

uses
  System.Rtti, System.TypInfo, Vcl.Dialogs;

function GetModAppRestID(aObject: TModApp): String;
begin
  Result := 'null';
  if aObject <> nil then
    Result := aObject.ID;
end;

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
  lModApp: TModApp;
begin
  If Self.ID = '' then exit;

  if LoadObjectList then
    lModApp := DMClient.CrudClient.Retrieve(Self.ClassName, Self.ID)
  else
    lModApp := DMClient.CrudClient.RetrieveSingle(Self.ClassName, Self.ID);

  Try
    Self.CopyFrom(lModApp);
  Finally
    lModApp.Free;
  End;
end;


procedure TModAppHelper.CopyFrom(aModApp : TModApp);
var
  ctx: TRttiContext;
  lNewObj: TModApp;
  lSrcObj: TObject;
  meth: TRttiMethod;
  RttiType: TRttiType;
  Prop: TRttiProperty;
begin
  RttiType := ctx.GetType(Self.ClassType);
  Try
    for Prop in RttiType.GetProperties do
    begin
      if not (Prop.IsReadable and Prop.IsWritable) then continue;

      //revisi : published saja
      if prop.Visibility <> mvPublished then continue;

      If prop.PropertyType.TypeKind = tkClass then
      begin
        lSrcObj := Prop.GetValue(aModApp).AsObject;


        if not prop.PropertyType.AsInstance.MetaclassType.InheritsFrom(TModApp) then continue;
        meth    := prop.PropertyType.GetMethod('Create');
        lNewObj := TModApp(meth.Invoke(prop.PropertyType.AsInstance.MetaclassType, []).AsObject);

        if lSrcObj <> nil then
          TModApp(lNewObj).CopyFrom(TModApp(lSrcObj));

        prop.SetValue(Self, lNewObj);
      end else
        Prop.SetValue(Self, Prop.GetValue(aModApp));
    end;
  except
    ShowMessage(Self.ClassName  + '.' + Prop.Name);
    raise;
  End;
end;

function TModAppHelper.ReloadByCode(aCode: String): Boolean;
var
  lModApp: TModApp;
begin
  lModApp := DMClient.CrudClient.RetrieveByCode(Self.ClassName, aCode);
  Try
    Self.CopyFrom(lModApp);
    Result := Self.ID <> ''; //not found
  Finally
    lModApp.Free;
  End;
end;


end.
