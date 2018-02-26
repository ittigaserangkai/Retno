unit uJSONUtils;

interface

uses
  System.JSON, System.JSON.Builders, System.JSON.Types, System.JSON.Writers,
  uModApp, System.TypInfo, System.StrUtils, System.SysUtils, System.Rtti,
  Data.DB;

type
  TJSONUtils = class(TObject)
  protected
  public
    class function JSONToModel(AJSON: TJSONObject; AModAppClass: TModAppClass):
        TModApp;
    class function ModelToJSON(AObject: TModApp): TJSONObject; overload;
    class function ModelToJSON(AObject: TModApp; FilterProperties: Array Of
        String): TJSONObject; overload;
    class function GetProperty(AObject: TModApp; APropName: String; ShowException:
        Boolean = True): TRttiProperty;
    class function DataSetToJSON(ADataSet: TDataSet): TJSONArray; overload;
    class function GetValue(AJSON: TJSONObject; APairName: String): TJSONValue;
  end;

implementation

uses
  System.Variants;

class function TJSONUtils.JSONToModel(AJSON: TJSONObject; AModAppClass:
    TModAppClass): TModApp;
var
  ctx: TRttiContext;
  i: Integer;
  lAppClass: TModAppClass;
  lAppObject: TModApp;
  lAppObjectItem: TModApp;
  lExtVal: Extended;
  lIntVal: Integer;
  LJSONArr: TJSONArray;
  lJSONObj: TJSONObject;
  lJSONVal: TJSONValue;
  lObjectList: TObject;
  LPair: TJSONPair;
  prop: TRttiProperty;
  meth: TRttiMethod;
  rtItem: TRttiType;
  sGenericItemClassName: string;
begin
  Result := AModAppClass.Create;
  prop := nil;

  for i := 0 to AJSON.Count-1 do
  begin
    Try
      LPair := AJSON.Pairs[i];
      if UpperCase(LPair.JsonString.Value) = 'CLASSNAME' then continue;

      prop := GetProperty(Result, LPair.JsonString.Value);
      if not prop.IsWritable then continue;

      case prop.PropertyType.TypeKind of
        tkInteger, tkInt64 :
          if LPair.JsonValue.TryGetValue<Integer>(lIntVal) then
            prop.SetValue(Result, lIntVal);

        tkFloat :
          if LPair.JsonValue.TryGetValue<Extended>(lExtVal) then
            prop.SetValue(Result, lExtVal);

        tkUString, tkString, tkWideString :
          prop.SetValue(Result, LPair.JsonValue.Value);

        tkClass :
        begin
          meth := prop.PropertyType.GetMethod('ToArray');
          if Assigned(meth) then //obj list
          begin
            lObjectList := prop.GetValue(Result).AsObject;
            if lObjectList = nil then continue;
            LJSONArr := TJSONArray(LPair.JsonValue);
            sGenericItemClassName :=  StringReplace(lObjectList.ClassName, 'TOBJECTLIST<','', [rfIgnoreCase]);
            sGenericItemClassName :=  StringReplace(sGenericItemClassName, '>','', [rfIgnoreCase]);
            rtItem := ctx.FindType(sGenericItemClassName);

            meth := prop.PropertyType.GetMethod('Add');
            if Assigned(meth) and Assigned(rtItem) then
            begin                                                                              //sayangny utk akses rtti object harus ada dulu, jadi create dulu
              if not rtItem.AsInstance.MetaclassType.InheritsFrom(TModApp) then continue;
              lAppClass       := TModAppClass( rtItem.AsInstance.MetaclassType );
              for lJSONVal in LJSONArr do
              begin
                lJSONObj := TJSONObject.ParseJSONValue(lJSONVal.ToString) as TJSONObject;
                lAppObjectItem  := JSONToModel(lJSONObj, lAppClass);
                meth.Invoke(lObjectList,[lAppObjectItem]);
                FreeAndNil(LJSONObj);
              end;
            end;
          end else
          begin
            if not prop.PropertyType.AsInstance.MetaclassType.InheritsFrom(TModApp) then continue;
            lAppClass   := TModAppClass( prop.PropertyType.AsInstance.MetaclassType );
            lJSONObj := TJSONObject.ParseJSONValue(LPair.JSONValue.ToString) as TJSONObject;
            lAppObject := JSONToModel(lJSONObj, lAppClass);
            lAppObject.ObjectState := 3;
            prop.SetValue(Result, lAppObject);
            FreeAndNil(LJSONObj);
          end;
        end;
      else
        prop.SetValue(Result, LPair.JsonValue.Value);
      end;
      Result.ObjectState := 0;
    except
      on E:Exception do
      begin
        if prop <> nil then
          E.Message := 'Error at Object ' + Result.ClassName + ' Property ' + prop.Name + #13 + E.Message;
        Raise;
      end;
    End;

  end;
end;

class function TJSONUtils.ModelToJSON(AObject: TModApp): TJSONObject;
begin
  Result := ModelToJSON(AObject, [])
end;

class function TJSONUtils.ModelToJSON(AObject: TModApp; FilterProperties: Array
    Of String): TJSONObject;
var
  ctx : TRttiContext;
  i: Integer;
//  lDate: TDatetime;
  lModItem: TModApp;
  lObj: TObject;
  lObjectList: TObject;
  lJSOArr: TJSONArray;
  lJSONItem: TJSONObject;
  lVal: Extended;
  meth: TRttiMethod;
  pairName: string;
  rt : TRttiType;
  prop : TRttiProperty;
//  sGenericItemClassName: string;
  value: TValue;

  function CheckFilter(aPropName: String): Boolean;
  var
    lFilter: string;
  begin
    Result := Length(FilterProperties) = 0;
    if Result then exit;
    for lFilter in FilterProperties do
    begin
      if LowerCase(aPropName) = LowerCase(lFilter) then
        Result := True;
    end;
  end;

begin
  AObject.ObjectState := 0;
  Result := TJSONObject.Create;
  rt := ctx.GetType(AObject.ClassType);
  for prop in rt.GetProperties do
  begin
    pairName := LowerCase(prop.Name);
    if not CheckFilter(pairName) then continue;

    If prop.Visibility = mvPublished then
    begin
      case prop.PropertyType.TypeKind of
        tkInteger, tkInt64, tkFloat :
        begin
          lVal := prop.GetValue(AObject).AsExtended;
//          if CompareText('TDateTime', prop.PropertyType.Name)=0 then
//          begin
//            lDate := lVal;
//            Result.AddPair(pairName, TJSONString.Create(DateToStr(lDate)));
//          end else
          Result.AddPair(pairName, TJSONNumber.Create(lVal));
        end;
        tkUString, tkString, tkWideString :
          Result.AddPair(pairName, TJSONString.Create(prop.GetValue(AObject).AsString));
        tkClass :
        begin
          lObj := prop.GetValue(AObject).AsObject;
          if lObj = nil then
            Result.AddPair(pairName, TJSONNull.Create)
          else if lObj.InheritsFrom(TModApp) then
            Result.AddPair(pairName, Self.ModelToJSON(TModApp(lObj), ['ID']));
        end;
      else
        Result.AddPair(pairName,
          TJSONString.Create(VarToStr(prop.GetValue(AObject).AsVariant)));
      end;
    end else
    begin
      if prop.PropertyType.TypeKind = tkClass then
      begin
        meth := prop.PropertyType.GetMethod('ToArray');
        if Assigned(meth) then
        begin
          lObjectList := prop.GetValue(AOBject).AsObject;
          if lObjectList = nil then
          begin
            Result.AddPair(pairName, TJSONNull.Create);
            continue;
          end else
          begin
            value  := meth.Invoke(prop.GetValue(AObject), []);
            Assert(value.IsArray);
            lJSOArr := TJSONArray.Create;
            Result.AddPair(pairName, lJSOArr);

            for i := 0 to value.GetArrayLength - 1 do
            begin
              lObj := value.GetArrayElement(i).AsObject;
              If not lObj.ClassType.InheritsFrom(TModApp) then continue;  //bila ada generic selain class ini
              lModItem := TModApp(lObj);
              lJSONItem := Self.ModelToJSON(lModItem);
              lJSOArr.AddElement(lJSONItem);
            end;

          end;
        end;
      end;

    end;
  end;
end;

class function TJSONUtils.GetProperty(AObject: TModApp; APropName: String;
    ShowException: Boolean = True): TRttiProperty;
var
  ctx : TRttiContext;
  rt : TRttiType;
  prop : TRttiProperty;
begin
  Result := nil;
  rt := ctx.GetType(AObject.ClassType);

  for prop in rt.GetProperties do
  begin
//    If not prop.Visibility in [mvPublished, mvPublic] then continue;
    if LowerCase(prop.Name) = LowerCase(APropName) then Result := prop;
    if Result <> nil then break;
  end;

  if (Result = nil) and (ShowException) then
    raise Exception.Create(
      'Property : ' + APropName + ' can''t be found in '  + AObject.ClassName
    );
end;

class function TJSONUtils.DataSetToJSON(ADataSet: TDataSet): TJSONArray;
var
  i: Integer;
//  lJSOArr: TJSONArray;
  lJSRow: TJSONObject;
begin
//  Result  := TJSONObject.Create;
  Result := TJSONArray.Create;
//  Result.AddPair('Data', lJSOArr);
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    lJSRow := TJSONObject.Create;
    for i := 0 to ADataSet.FieldCount-1 do
      lJSROw.AddPair(ADataSet.Fields[i].FieldName, ADataSet.Fields[i].Value);
    Result.AddElement(lJSROw);
    ADataSet.Next;
  end;
end;

class function TJSONUtils.GetValue(AJSON: TJSONObject; APairName: String):
    TJSONValue;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to AJSON.Count-1 do
  begin
    if UpperCase(AJSON.Pairs[i].JsonString.Value) = UpperCase(APairName) then
      Result := AJSON.Pairs[i].JsonValue;
  end;
end;

end.
