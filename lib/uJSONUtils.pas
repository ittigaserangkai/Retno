unit uJSONUtils;

interface

uses
  System.JSON, System.JSON.Builders, System.JSON.Types, System.JSON.Writers,
  uModApp, System.TypInfo, System.StrUtils, System.SysUtils;

type
  TJSONUtils = class(TObject)
  protected
  public
    class function ModelToJSON(AObject: TModApp): TJSONObject;
  end;

implementation

uses
  System.Rtti, System.Variants;

class function TJSONUtils.ModelToJSON(AObject: TModApp): TJSONObject;
var
  ctx : TRttiContext;
  i: Integer;
//  lDate: TDatetime;
  lModItem: TModApp;
  lObj: TObject;
  lObjectList: TObject;
  lVal: Extended;
  meth: TRttiMethod;
  pairName: string;
  rt : TRttiType;
  prop : TRttiProperty;
//  sGenericItemClassName: string;
  value: TValue;
begin
  Result := TJSONObject.Create;
  rt := ctx.GetType(AObject.ClassType);
  for prop in rt.GetProperties do
  begin
    pairName := LowerCase(prop.Name);
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
            Result.AddPair(pairName, Self.ModelToJSON(TModApp(lObj)));
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
            for i := 0 to value.GetArrayLength - 1 do
            begin
              lObj := value.GetArrayElement(i).AsObject;
              If not lObj.ClassType.InheritsFrom(TModApp) then continue;  //bila ada generic selain class ini
              lModItem := TModApp(lObj);
              Result.AddPair(pairName, Self.ModelToJSON(lModItem));
            end;
          end;
        end;
      end;

    end;
  end;
end;

end.
