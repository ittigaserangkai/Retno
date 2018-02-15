unit uModelHelper;

interface
uses
  uModApp, uModPO, uModSO,uModSuplier,uModBarang, uModSatuan,
  System.SysUtils, uDMClient, uModDO, uClientClasses, Datasnap.DBClient,
  uDBUtils, System.Classes;

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

  TCRUDObj = class
  private
  public
    class function RetrieveCode<T: class>(aCode: string): T;
    class function Retrieve<T: class>(aID: string; LoadObjectList: Boolean =
        True): T;
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
  i: Integer;
  lAppClass: TModAppClass;
  lNewItem: TModApp;
  lNewObjList: TObject;
  lSrcItem: TModApp;
  lSrcObjList: TObject;
  meth: TRttiMethod;
  RttiType: TRttiType;
  Prop: TRttiProperty;
  rtItem: TRttiType;
  sGenericItemClassName: string;
  value: TValue;

  function SetPropertyFrom(AProp: TRttiProperty; ASource: TModApp): TModApp;
  var
    lSrcObj: TObject;
  begin
    Result := nil;
    lSrcObj := Prop.GetValue(ASource).AsObject;
    if not prop.PropertyType.AsInstance.MetaclassType.InheritsFrom(TModApp) then exit;;
    meth    := prop.PropertyType.GetMethod('Create');
    Result  := TModApp(meth.Invoke(prop.PropertyType.AsInstance.MetaclassType, []).AsObject);
    if lSrcObj <> nil then
      TModApp(Result).CopyFrom(TModApp(lSrcObj));
  end;

begin
  RttiType := ctx.GetType(Self.ClassType);
  Try
    for Prop in RttiType.GetProperties do
    begin
      if not (Prop.IsReadable and Prop.IsWritable) then continue;
//      if prop.Visibility <> mvPublished then continue;

      If prop.PropertyType.TypeKind = tkClass then
      begin
        meth := prop.PropertyType.GetMethod('ToArray');
        if Assigned(meth) then  //object list
        begin
          lSrcObjList := prop.GetValue(aModApp).AsObject;
          lNewObjList := prop.GetValue(Self).AsObject;
          if lSrcObjList = nil then continue;

          value  := meth.Invoke(prop.GetValue(aModApp), []);
          Assert(value.IsArray);
          sGenericItemClassName := StringReplace(lSrcObjList.ClassName, 'TOBJECTLIST<','', [rfIgnoreCase]);
          sGenericItemClassName := StringReplace(sGenericItemClassName, '>','', [rfIgnoreCase]);
          rtItem := ctx.FindType(sGenericItemClassName);

          meth := prop.PropertyType.GetMethod('Add');
          if Assigned(meth) and Assigned(rtItem) then
          begin
            if not rtItem.AsInstance.MetaclassType.InheritsFrom(TModApp) then continue;
            lAppClass := TModAppClass( rtItem.AsInstance.MetaclassType );
            for i := 0 to value.GetArrayLength - 1 do
            begin
              lSrcItem := TModApp(value.GetArrayElement(i).AsObject);
              lNewItem := lAppClass.Create;
              lNewItem.CopyFrom(lSrcItem);
              meth.Invoke(lNewObjList,[lNewItem]);
            end;
          end;
          prop.SetValue(Self, lNewObjList);
        end
        else
        begin
          prop.SetValue(Self, SetPropertyFrom(prop, aModApp));
        end;
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

class function TCRUDObj.RetrieveCode<T>(aCode: string): T;
var
  sClass: string;
begin
  if (T = nil) then
    Raise Exception.Create('Type can''t be nil')
  else if not TClass(T).InheritsFrom(TModApp) then
    Raise Exception.Create('Type must inherti from TObjectModel')
  else
  begin
    sClass := T.ClassName;
    Result := T(DMClient.CrudClient.RetrieveByCode(sClass, aCode))
  end;
end;

class function TCRUDObj.Retrieve<T>(aID: string; LoadObjectList: Boolean =
    True): T;
var
  sClass: string;
begin
  if (T = nil) then
    Raise Exception.Create('Type can''t be nil')
  else if not TClass(T).InheritsFrom(TModApp) then
    Raise Exception.Create('Type must inherti from TObjectModel')
  else
  begin
    sClass := T.ClassName;
    if LoadObjectList then
      Result := T(DMClient.CrudClient.Retrieve(sClass, aID))
    else
      Result := T(DMClient.CrudClient.RetrieveSingle(sClass, aID));
  end;
end;


end.
