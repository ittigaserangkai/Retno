unit uServerModelHelper;

interface
uses
  uModApp,System.SysUtils, uServerClasses;

type
  TModAppHelper = class helper for TModApp
  private
    procedure CopyFrom(aModApp : TModApp);
  protected
  public
    procedure Reload(LoadObjectList: Boolean = False);
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

procedure TModAppHelper.Reload(LoadObjectList: Boolean = False);
var
  lCRUD: TCRUD;
  lModApp: TModApp;
begin
  If Self.ID = '' then exit;
  lCRUD := TCRUD.Create(nil);
  try
    if LoadObjectList then
      lModApp := lCRUD.Retrieve(Self.ClassName, Self.ID)
    else
      lModApp := lCRUD.RetrieveSingle(Self.ClassName, Self.ID);

    Try
      Self.CopyFrom(lModApp);
    Finally
      lModApp.Free;
    End;
  finally
    FreeAndNil(lCRUD);
  end;
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

class function TCRUDObj.RetrieveCode<T>(aCode: string): T;
var
  lCRUD: TCRUD;
  sClass: string;
begin
  lCRUD := TCRUD.Create(nil);
  Try
    if (T = nil) then
      Raise Exception.Create('Type can''t be nil')
    else if not TClass(T).InheritsFrom(TModApp) then
      Raise Exception.Create('Type must inherti from TObjectModel')
    else
    begin
      sClass := T.ClassName;
      Result := T(lCRUD.RetrieveByCode(sClass, aCode))
    end;
  Finally
    FreeAndNil(lCRUD);
  End;
end;

class function TCRUDObj.Retrieve<T>(aID: string; LoadObjectList: Boolean =
    True): T;
var
  lCRUD: TCrud;
  sClass: string;
begin
  lCRUD := TCRUD.Create(nil);
  Try
    if (T = nil) then
      Raise Exception.Create('Type can''t be nil')
    else if not TClass(T).InheritsFrom(TModApp) then
      Raise Exception.Create('Type must inherti from TObjectModel')
    else
    begin
      sClass := T.ClassName;
      if LoadObjectList then
        Result := T(lCRUD.Retrieve(sClass, aID))
      else
        Result := T(lCRUD.RetrieveSingle(sClass, aID));
    end;
  Finally
    FreeAndNil(lCRUD);
  End;
end;


end.
