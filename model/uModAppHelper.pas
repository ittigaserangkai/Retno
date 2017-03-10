unit uModAppHelper;


interface

uses
  uModAPP, System.SysUtils, System.Rtti, System.TypInfo;

type
  TModAppHelper = class helper for TModAPP

  private
  public
    function GetHeaderKey: String;
    function PropFromAttr(attr: TAttributeClass; WithException: Boolean = True):
        TRttiProperty;
    function FieldNameOf(aprop: TRttiProperty): String;
    function GetHeaderField: String;
    function GetCodeField: String;
    function GetCodeValue: String;
    function GetHeaderProperty: String;
    function QuotValue(AProp: TRttiProperty): String;
  end;

implementation

function TModAppHelper.GetHeaderKey: String;
begin
  Result := PropFromAttr(AttributeOfHeader).GetValue(Self).AsString;
end;

function TModAppHelper.PropFromAttr(attr: TAttributeClass; WithException:
    Boolean = True): TRttiProperty;
var
  a: TCustomAttribute;
  ctx : TRttiContext;
  rt : TRttiType;
  prop : TRttiProperty;
begin
  Result := nil;
  rt := ctx.GetType(Self.ClassType);
  for prop in rt.GetProperties do
  begin
    If prop.Visibility <> mvPublished then continue;
    for a in prop.GetAttributes do
    begin
      if a is attr then
      begin
        Result := prop;
        break;
      end;
    end;
    if Result <> nil then break;
  end;

  if Result = nil then
    raise Exception.Create(
      'Attribute : ' + attr.ClassName + ' can''t be found in '
      + Self.ClassName
    );
end;

function TModAppHelper.FieldNameOf(aprop: TRttiProperty): String;
var
  a: TCustomAttribute;
begin
  Result := '';
  if  UpperCase(aProp.Name) = 'ID' then
    Result := Self.GetPrimaryField
  else begin
    for a in aprop.GetAttributes do
    begin
      if a.InheritsFrom(AttributeOfCustom) then
      begin
        if AttributeOfCustom(a).CustomField <> '' then
          Result := AttributeOfCustom(a).CustomField;
        Break;
      end;
    end;
    if (Result = '') and (aProp.PropertyType.TypeKind = tkClass) then
      Result := aProp.Name + '_ID';
    if Result = '' then Result := aProp.Name;
  end;
end;

function TModAppHelper.GetHeaderField: String;
begin
  Result := FieldNameOf( PropFromAttr(AttributeOfHeader) );
end;

function TModAppHelper.GetCodeField: String;
begin
  Result := FieldNameOf( PropFromAttr(AttributeOfCode) );
end;

function TModAppHelper.GetCodeValue: String;
begin
  Result := PropFromAttr(AttributeOfCode).GetValue(Self).AsString;
end;

function TModAppHelper.GetHeaderProperty: String;
begin
  Result := PropFromAttr(AttributeOfHeader).Name;
end;

function TModAppHelper.QuotValue(AProp: TRttiProperty): String;
var
  lDate: TDateTime;
  lObj: TObject;
begin
  If LowerCase(AProp.PropertyType.Name) = LowerCase('TDateTime') then
  begin
    lDate := AProp.GetValue(Self).AsExtended;
    Result := QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss',lDate));
  end else begin
    case AProp.PropertyType.TypeKind of
      tkInteger, tkInt64:
        Result := InttoStr(AProp.GetValue(Self).AsInteger);
      tkFloat:
        Result := FloatToStr(AProp.GetValue(Self).AsExtended);
      tkString, tkLString, tkUString, tkChar, tkWString, tkVariant:
        Result := QuotedStr(AProp.GetValue(Self).AsString);
      tkEnumeration:
        Result := BoolToStr(AProp.GetValue(Self).AsBoolean);
      tkClass:
        begin
          Result := 'NULL';
          lObj := AProp.GetValue(Self).AsObject;
          if (lObj.InheritsFrom(TModApp)) and (lObj <> nil) then
            if TModApp(lObj).ID <> '' then
              Result := QuotedStr(TModApp(lObj).ID);
        end
    else
      Raise Exception.Create(
        'Property Type tidak terdaftar atas ' + Self.ClassName + ',' + AProp.Name);
    end;
  end;
end;

end.
