unit uModApp;

interface

uses
  SysUtils, System.Rtti, System.TypInfo, Datasnap.DBClient, System.Classes,
  Data.DB, System.Generics.Collections;

type

  TAttributeClass = class of TCustomAttribute;
  AttributeOfSizeCustom = class(TCustomAttribute);
  AttributeOfCustom = class(TCustomAttribute)
  private
    FCustomField: String;
  public
    constructor Create(aCustomField: string = '');
    property CustomField: String read FCustomField write FCustomField;
  end;
  AttributeOfCode = class(AttributeOfCustom)
  end;
  AttributeOfSize = class(AttributeOfSizeCustom)
  private
    FSize: string;
  public
    constructor Create(AFieldSize : string);
    property Size: string read FSize write FSize;
  published
  end;
  AttributeOfForeign = class(AttributeOfCustom)
  end;
  AttributeOfHeader = class(AttributeOfForeign)
  end;

  AttrUpdateDetails = class(TCustomAttribute)
  end;

  TFilterClassKind = (fckNone = 0, fckInclude = 1, fckExclude = 2);

{$TYPEINFO ON}
  TModApp = class;
{$TYPEINFO OFF}
  TModAppClass = class of TModApp;

  TFilterClass = class;

  TModApp = class(TObject)
  private
    FCrudFilterKind: TFilterClassKind;
    FDate_Create: TDatetime;
    FDate_Modify: TDatetime;
    FFilterClasses: TObjectList<TFilterClass>;
    FID: string;
    FObjectState: Integer;
    procedure SetCrudFilterKind(const Value: TFilterClassKind);
  public
    constructor Create; reintroduce; virtual;
    constructor CreateDefault;
    constructor CreateID(AID : String);
    destructor Destroy; override;
    procedure AddFilterCrud(aModClass: TModAppClass);
    function FieldNameOf(aprop: TRttiProperty): String;
    function FieldSizeOf(AProp: TRttiProperty): String;
    function GetCodeField: String;
    function GetCodeValue: String;
    function GetHeaderField: String;
    function GetHeaderKey: String;
    function GetHeaderProperty: String;
    class function GetPrimaryField: String; dynamic;
    class function GetTableName: String; dynamic;
    function PropFromAttr(attr: TAttributeClass; WithException: Boolean = True):
        TRttiProperty;
    function QuotValue(AProp: TRttiProperty): String;
    function GetSQLServerFieldType(AProp: TRttiProperty): String;
    function QuotValueNoBracket(AProp: TRttiProperty): String;
    class procedure RegisterRTTI;
    function RemoveBracket(cValue: string): string;
    procedure SetFromDataset(ADataSet: TDataset);
    function ToString: string; override;
    procedure UpdateToDataset(ADataSet: TDataset);
    property CrudFilterKind: TFilterClassKind read FCrudFilterKind write
        SetCrudFilterKind;
    property FilterClasses: TObjectList<TFilterClass> read FFilterClasses write
        FFilterClasses;
    property ObjectState: Integer read FObjectState write FObjectState;   // 1 Baru, 3 Edit, 5 Hapus
  published
    property Date_Create: TDatetime read FDate_Create write FDate_Create;
    property Date_Modify: TDatetime read FDate_Modify write FDate_Modify;
    property ID: string read FID write FID;
  end;

  TFilterClass = class(TObject)
  private
    FModClass: TModAppClass;
    FModClassName: String;
    FModClassQName: String;
  public
    constructor Create(aModClass: TModAppClass);
    function CheckClass(aClassName: string): Boolean;
    class procedure RegisterRTTI;
    property ModClass: TModAppClass read FModClass write FModClass;
    property ModClassName: String read FModClassName write FModClassName;
    property ModClassQName: String read FModClassQName write FModClassQName;
  end;

  TModCompItem = class(TComponent)
  end;

  TModComp = class(TComponent)
  end;

  TModApps = class(TObject)
  private
    FAPPs: TObjectList<TModApp>;
    function GetAPPs: TObjectList<TModApp>;
  public
    property APPs: TObjectList<TModApp> read GetAPPs write FAPPs;
  end;




implementation

uses
  StrUtils, uDBUtils;

constructor AttributeOfCustom.Create(aCustomField: string = '');
begin
  Self.CustomField := aCustomField;
end;

constructor TModApp.Create;
begin
  inherited;
//  MappingDBField;
  ObjectState := 1;
  Date_Create := Now();
  Date_Modify := Now();
end;

constructor TModApp.CreateDefault;
var
  ctx : TRttiContext;
  rt,rtItem : TRttiType;
  prop : TRttiProperty;
  FieldValues : string;
  FieldNames: String;
  lAppObject: TModApp;
  meth : TRttiMethod;
  lObjectList: TObject;
  lAppObjectItem : TModApp;
  lAppClass : TModAppClass;
  sGenericItemClassName: string;
//  sSQL: string;
begin
  Self := inherited Create;

  FieldValues := '';
  FieldNames  := '';

  Self.Date_Create := Now;

  rt := ctx.GetType(Self.ClassType);
  for prop in rt.GetProperties() do
  begin
    if (not prop.IsWritable) then Continue;
    if Prop.Name = 'ID' then Continue;

    if prop.Visibility = mvPublished then
    begin
      Randomize;

      if LowerCase(Prop.PropertyType.Name) = LowerCase('TDateTime') then
      begin
        prop.SetValue(Self,TValue.From<TDateTime>(Now));
      end else
      begin
        case prop.PropertyType.TypeKind of
          tkInteger : prop.SetValue(Self, Random(1000));
          tkFloat   : prop.SetValue(Self, Random(1000000));
          tkUString : prop.SetValue(Self, FormatDateTime('yyyyNNddhhmmdd', Now + Random(1000)));
          tkClass   :
          begin
            meth := prop.PropertyType.GetMethod('ToArray');
            if not Assigned(meth) then //bukan obj list
            begin
              if not prop.PropertyType.AsInstance.MetaclassType.InheritsFrom(TModApp) then continue;
              meth            := prop.PropertyType.GetMethod('Create');
              lAppObject      := TModApp(meth.Invoke(prop.PropertyType.AsInstance.MetaclassType, []).AsObject);

              lAppObject.ID          := TDBUtils.GetNextIDGUIDToString;
              prop.SetValue(Self, lAppObject);
            end;
          end;
        end;
      end;
    end else
    begin
      if prop.PropertyType.TypeKind = tkClass then
      begin
        meth := prop.PropertyType.GetMethod('ToArray');
        if Assigned(meth) then
        begin
          lObjectList := prop.GetValue(Self).AsObject;
          if lObjectList = nil then continue;

          sGenericItemClassName :=  StringReplace(lObjectList.ClassName, 'TOBJECTLIST<','', [rfIgnoreCase]);
          sGenericItemClassName :=  StringReplace(sGenericItemClassName, '>','', [rfIgnoreCase]);
          rtItem := ctx.FindType(sGenericItemClassName);

          meth := prop.PropertyType.GetMethod('Add');
          if Assigned(meth) and Assigned(rtItem) then
          begin
            //sayangny utk akses rtti object harus ada dulu, jadi create dulu
            if not rtItem.AsInstance.MetaclassType.InheritsFrom(TModApp) then continue;
            lAppClass       := TModAppClass( rtItem.AsInstance.MetaclassType );
            lAppObjectItem  := lAppClass.CreateDefault;
            meth.Invoke(lObjectList,[lAppObjectItem]);
          end;
        end;
      end;  //object list assignment
    end;  //prop.visibility check
  end;
end;

constructor TModApp.CreateID(AID: String);
begin
  Self    := inherited Create;
  Self.ID := AID;
end;

destructor TModApp.Destroy;
begin
  inherited;
  if Assigned(FFilterClasses) then
    FreeAndNil(FFilterClasses);
end;

procedure TModApp.AddFilterCrud(aModClass: TModAppClass);
begin
  if Self.CrudFilterKind = fckNone then
    Raise Exception.Create('Can''t set filter when CrudFilterKind = fckNone');

  Self.FilterClasses.Add( TFilterClass.Create(aModClass) );
end;

function TModApp.FieldNameOf(aprop: TRttiProperty): String;
var
  a: TCustomAttribute;
begin
  Result := '';
  if UpperCase(aProp.Name) = 'ID' then
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

function TModApp.FieldSizeOf(AProp: TRttiProperty): String;
var
  a: TCustomAttribute;
begin
  Result := '';

  for a in aprop.GetAttributes do
  begin
    if a.InheritsFrom(AttributeOfSize) then
    begin
//      if AttributeOfSize(a).CustomField <> '' then
//        Result := AttributeOfCustom(a).CustomField;
      Break;
    end;
  end;

  if (Result = '') and (aProp.PropertyType.TypeKind = tkClass) then
    Result := aProp.Name + '_ID';
  if Result = '' then Result := aProp.Name;
end;

function TModApp.GetCodeField: String;
begin
  Result := FieldNameOf( PropFromAttr(AttributeOfCode) );
end;

function TModApp.GetCodeValue: String;
begin
  Result := PropFromAttr(AttributeOfCode).GetValue(Self).AsString;
end;

function TModApp.GetHeaderField: String;
begin
  Result := FieldNameOf( PropFromAttr(AttributeOfHeader) );
end;

function TModApp.GetHeaderKey: String;
begin
  Result := PropFromAttr(AttributeOfHeader).GetValue(Self).AsString;
end;

function TModApp.GetHeaderProperty: String;
var
  lProp: TRttiProperty;
begin
  Result := '';
  lProp := PropFromAttr(AttributeOfHeader);
  if Assigned(lProp) then Result := lProp.Name;
end;

class function TModApp.GetPrimaryField: String;
begin
  Result := Self.GetTableName + '_ID';
end;

class function TModApp.GetTableName: String;
begin
  Result := AnsiRightStr( Self.ClassName , Length(Self.ClassName)-4);
end;

function TModApp.PropFromAttr(attr: TAttributeClass; WithException: Boolean =
    True): TRttiProperty;
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

  if (Result = nil) and (WithException) then
    raise Exception.Create(
      'Attribute : ' + attr.ClassName + ' can''t be found in '
      + Self.ClassName
    );
end;

function TModApp.QuotValue(AProp: TRttiProperty): String;
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
          if lObj <> nil then
            if lObj.InheritsFrom(TModApp) then
              if TModApp(lObj).ID <> '' then
                Result := QuotedStr(TModApp(lObj).ID);
        end
    else
      Raise Exception.Create(
        'Property Type tidak terdaftar atas ' + Self.ClassName + ',' + AProp.Name);
    end;
  end;
end;

function TModApp.GetSQLServerFieldType(AProp: TRttiProperty): String;
var
  a: TCustomAttribute;
begin
  if AProp.Name = 'ID' then
    Result := ' uniqueidentifier primary key nonclustered '
  else If LowerCase(AProp.PropertyType.Name) = LowerCase('TDateTime') then
  begin
    Result := ' datetime2 '
  end else begin
    case AProp.PropertyType.TypeKind of
      tkInteger, tkInt64:
        Result := ' integer ';
      tkFloat:
        Result := ' double precision ';
      tkString, tkLString, tkUString, tkChar, tkWString, tkVariant:
      begin
        Result := ' varchar(20) ';

        for a in aprop.GetAttributes do
        begin
          if a.InheritsFrom(AttributeOfSizeCustom) then
          begin
            Result := ' varchar( ' + AttributeOfSize(a).Size + ') ';
          end;
        end;
      end;
      tkEnumeration:
        Result := ' ineter ';
      tkClass:
        Result := ' uniqueidentifier ';
    else
      Raise Exception.Create(
        'Property Type tidak terdaftar atas ' + Self.ClassName + ',' + AProp.Name);
    end;
  end;
end;

function TModApp.QuotValueNoBracket(AProp: TRttiProperty): String;
var
  lDate: TDateTime;
  lObj: TObject;
begin
  If LowerCase(AProp.PropertyType.Name) = LowerCase('TDateTime') then
  begin
    lDate := AProp.GetValue(Self).AsExtended;
    Result := QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss',lDate));
  end
  else
  begin
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
          if lObj <> nil then
            if lObj.InheritsFrom(TModApp) then
              if TModApp(lObj).ID <> '' then
                Result := QuotedStr(RemoveBracket(TModApp(lObj).ID));
        end
    else
      Raise Exception.Create(
        'Property Type tidak terdaftar atas ' + Self.ClassName + ',' + AProp.Name);
    end;
  end;
end;

class procedure TModApp.RegisterRTTI;
begin
  //dummy method agar rtti diregister secara full
  //akan error "delphi cannot instantiate type" pada datasnapserver kalau ini tidak dilakukan
  //jalankan di initialization section
end;

function TModApp.RemoveBracket(cValue: string): string;
begin
  Result := Copy(cValue,2,cValue.Length-2);
end;

procedure TModApp.SetCrudFilterKind(const Value: TFilterClassKind);
begin
  FCrudFilterKind := Value;
  If Value <> fckNone then
  begin
    if not Assigned(FFilterClasses) then
      FFilterClasses := TObjectList<TFilterClass>.Create
  end else begin
    if Assigned(FFilterClasses) then FFilterClasses.Clear;
  end;
end;

procedure TModApp.SetFromDataset(ADataSet: TDataset);
var
  ctx : TRttiContext;
  FieldName : string;
  lAppObject : TModApp;
//  lAppClass : TModAppClass;
  rt : TRttiType;
  prop : TRttiProperty;
  meth : TRttiMethod;
//  sGenericItemClassName: string;
begin
  rt := ctx.GetType(Self.ClassType);
  if not ADataSet.IsEmpty then
  begin
    for prop in rt.GetProperties() do
    begin
      if (not prop.IsWritable) then Continue;

//      If UsingFieldName then
//        FieldName := Self.FieldNameOf(prop)
//      else
        FieldName := prop.Name;

      //published has fields on dataset
      if prop.Visibility <> mvPublished then continue;
      If (ADataSet.FieldByName(FieldName).DataType in [ftDate,ftDateTime,ftTimeStamp]) then
      begin
        prop.SetValue(Self,TValue.From<TDateTime>(ADataSet.FieldByName(FieldName).AsDateTime));
      end else
      begin
        case prop.PropertyType.TypeKind of
          tkInteger : prop.SetValue(Self,ADataSet.FieldByName(FieldName).AsInteger );
          tkFloat   : prop.SetValue(Self,ADataSet.FieldByName(FieldName).AsFloat );
          tkUString : prop.SetValue(Self,ADataSet.FieldByName(FieldName).AsString );
          tkClass   : begin
                        meth := prop.PropertyType.GetMethod('ToArray');
                        if not Assigned(meth) then
                        begin
                          meth          := prop.PropertyType.GetMethod('Create');
                          lAppObject    := TModApp(meth.Invoke(
                            prop.PropertyType.AsInstance.MetaclassType, []).AsObject);
                          lAppObject.ID := ADataSet.FieldByName(FieldName).AsString;
                          prop.SetValue(Self, lAppObject);
                        end;
                      end;
        else
          prop.SetValue(Self,TValue.FromVariant(ADataSet.FieldValues[FieldName]) );
        end;
      end;
    end;
  end;

end;

function TModApp.ToString: string;
var
  rt,rtItem : TRttiType;
  prop : TRttiProperty;
  ctx : TRttiContext;
  i: Integer;
  lDate: TDateTime;
  meth : TRttiMethod;
  lObjectList: TObject;
//  lAppObjectItem : TModApp;
//  lAppClass : TModAppClass;
//  lAppClassItem: TModAppClass;
  lModItem: TModApp;
  lObj: tobject;
  sGenericItemClassName: string;
  value : TValue;
begin
  inherited;
  Result := '';

  rt := ctx.GetType(Self.ClassType);
  for prop in rt.GetProperties do
  begin
    if (not prop.IsWritable) then Continue;
    if Prop.Name = 'ID' then Continue;
    If LowerCase(Prop.Name) = LowerCase('objectstate') then
      Continue;

    if prop.Visibility = mvPublished then
    begin
      If LowerCase(Prop.PropertyType.Name) = LowerCase('TDateTime') then
      begin
        lDate  := prop.GetValue(Self).AsExtended;
        Result := Result + QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss',lDate));
      end else begin
        case prop.PropertyType.TypeKind of
          tkUString         : Result := Result + prop.GetValue(Self).AsString;
          tkInteger,tkFloat : Result := Result + FloatToStr(prop.GetValue(Self).AsExtended);
    //      tkClass   :
        end;
      end;
    end else if prop.PropertyType.TypeKind = tkClass then
      begin
        meth := prop.PropertyType.GetMethod('ToArray');
        if Assigned(meth) then
        begin
          lObjectList := prop.GetValue(Self).AsObject;
          if lObjectList = nil then continue;

          sGenericItemClassName :=  StringReplace(lObjectList.ClassName, 'TOBJECTLIST<','', [rfIgnoreCase]);
          sGenericItemClassName :=  StringReplace(sGenericItemClassName, '>','', [rfIgnoreCase]);
          rtItem := ctx.FindType(sGenericItemClassName);

          if Assigned(meth) and Assigned(rtItem) then
          begin
            //sayangny utk akses rtti object harus ada dulu, jadi create dulu
            if not rtItem.AsInstance.MetaclassType.InheritsFrom(TModApp) then continue;

//            lAppClass       := TModAppClass( rtItem.AsInstance.MetaclassType );
//            lAppClassItem := TModAppClass( rtItem.AsInstance.MetaclassType );
            value  := meth.Invoke(prop.GetValue(Self), []);
            Assert(value.IsArray);

            Try
              for i := 0 to value.GetArrayLength - 1 do
              begin
                lObj := value.GetArrayElement(i).AsObject;
                If not lObj.ClassType.InheritsFrom(TModApp) then continue;  //bila ada generic selain class ini
                lModItem := TModApp(lObj);
                Result := Result + ';' + lModItem.ToString;
              end;
            Finally

            End;
          end;
        end;
      end;

  end;

end;

procedure TModApp.UpdateToDataset(ADataSet: TDataset);
var
//  a: TCustomAttribute;
//  aFieldType: TFieldType;
  ctx : TRttiContext;
  lObj: TObject;
  rt : TRttiType;
  prop : TRttiProperty;
begin
  rt := ctx.GetType(Self.ClassType);
  for prop in rt.GetProperties do
  begin
    If prop.Visibility <> mvPublished then continue;
    case prop.PropertyType.TypeKind of
      tkInteger, tkInt64 :
        ADataSet.FieldByName(prop.Name).AsInteger := prop.GetValue(Self).AsInteger;
      tkFloat :
        ADataSet.FieldByName(prop.Name).AsFloat := prop.GetValue(Self).AsExtended;
      tkUString :
        ADataSet.FieldByName(prop.Name).AsString := prop.GetValue(Self).AsString;
      tkClass :
      begin
        lObj := prop.GetValue(Self).AsObject;
        if lObj = nil then continue;
        if lObj.InheritsFrom(TModApp) then
          ADataSet.FieldByName(prop.Name).AsString := TModApp(lObj).ID;
      end
    else
      ADataSet.FieldByName(prop.Name).AsVariant := prop.GetValue(Self).AsVariant
    end;
  end;
end;

constructor TFilterClass.Create(aModClass: TModAppClass);
begin
  inherited Create;
  Self.ModClass := aModClass;
  //server tidak mengenali TModAppClass.. lol
  Self.ModClassName := aModClass.ClassName;
  Self.ModClassQName := aModClass.QualifiedClassName;
end;

function TFilterClass.CheckClass(aClassName: string): Boolean;
begin
  Result := (UpperCase(aClassName) = UpperCase(Self.ModClassName))
    or (UpperCase(aClassName) = UpperCase(Self.ModClassQName))
end;

class procedure TFilterClass.RegisterRTTI;
begin
  //dummy method agar rtti diregister secara full
  //akan error "delphi cannot instantiate type" pada datasnapserver kalau ini tidak dilakukan
  //jalankan di initialization section
end;

function TModApps.GetAPPs: TObjectList<TModApp>;
begin
  if FAPPs = nil then
    FAPPs := TObjectList<TModApp>.Create();

  Result := FAPPs;
end;

constructor AttributeOfSize.Create(AFieldSize : string);
begin
  Self.Size := AFieldSize;
end;

initialization
  TFilterClass.RegisterRTTI;

end.
