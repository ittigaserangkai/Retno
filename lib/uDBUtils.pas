// dipakai juga di server, karena rencana server dibebaskan dari component dx
// jangan pasang uAppUtils disini ya.

unit uDBUtils;

interface
uses
  System.Rtti, typinfo, SysUtils, StrUtils,
  Forms, Datasnap.DBClient,
  Provider, Generics.Collections, System.Classes, StdCtrls,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.PG, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSSQL, Data.DB, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDac.Dapt,
  uModApp, uTSINIFile;

type
  TCDSHelper = class helper for TClientDataSet
  private
  public
    procedure AddField(AFieldName: String; AFieldType: TFieldType; ALength: Integer
        = 256; IsCalculated: Boolean = False);
    function ClonedDataset(aOwner: TComponent; DisableSourceControl: Boolean =
        False): TClientDataSet;
    procedure LoadFromXLS(FileName: String; SheetIndex: Integer = 1);
    procedure SetFieldFrom(DestFieldName: String; SourceDataSet: TDataset;
        SourceField: String = '');
  end;

  TDBUtils = class(TObject)
  private
    class function GenerateSQLInsert(AObject : TModApp): string; overload;
    class function GenerateSQLUpdate(AObject : TModApp): string; overload;
  public
    class procedure Commit;
    class function ConnectDB(ADBEngine, AServer, ADatabase, AUser , APassword,
        APort : String): Boolean;
    class function CreateObjectDataSet(aObjectClass: TModAppClass; aOwner:
        TComponent; CreateDataSet: Boolean = True): TClientDataSet;
    class function DSToCDS(aDataset: TDataSet; aOwner: TComponent; FreeDataSet:
        Boolean = True): TClientDataset; overload;
    class procedure TemporaryForHideWarning;
    class function ExecuteSQL(ASQL: String; DoCommit: Boolean = True): LongInt;
        overload;
    class function ExecuteSQL(ASQLs: TStrings; DoCommit: Boolean = True): Boolean;
        overload;
    class procedure GenerateSQL(AObject: TModApp; SS: TStrings); overload;
    class function GenerateSQL(AObject: TModApp): TStrings; overload;
    class procedure GenerateSQLDelete(AObject: TModApp; SS: TStrings); overload;
    class function GenerateSQLDelete(AObject: TModApp): TStrings; overload;
    class function GenerateSQLSelect(AObject : TModApp): string;
    class function GetNextID(AOBject : TModApp): Integer;
    class function GetNextIDGUID: TGuid;
    class function GetNextIDGUIDToString: string;
    class function GetSQLDelete(AObject: TModApp): String; overload;
    class function GetSQLInsert(AObject: TModApp): String;
    class function GetSQLUpdate(AObject: TModApp): String;
    class procedure LoadFromDB(AOBject: TModApp; AID: String; LoadObjectList:
        Boolean = True);
    class procedure LoadByCode(AOBject: TModApp; aCode: String);
    class procedure LoadFromDataset(AOBject: TModApp; ADataSet: TDataset;
        LoadObjectList: Boolean = True);
    class function OpenDataset(ASQL: String; AOwner: TComponent = nil):
        TClientDataSet; overload;
    class function OpenMemTable(ASQL : String): TFDMemTable;
    class function OpenQuery(ASQL: String; AOwner: TComponent = nil): TFDQuery;
    class function Quot(aString : String): String;
    class function QuotD(aDate : TDateTime; aTambahJam235959 : Boolean = false):
        String;
    class function QuotDLong(aDate : TDateTime): String;
    class function QuotDt(aDate : TDateTime): String; overload;
    class function QuotDT(aDate : TDateTime; aTambahJam235959 : Boolean): String;
        overload;
    class function QuotDShort(aDate : TDateTime): String; overload;
    class function QuotF(ANumber : Double): String;
    class procedure RollBack;
  end;

var
  FDConnection  : TFDConnection;
  FDTransaction : TFDTransaction;
  DebugSS : TStrings;

const
  SQL_Insert  : String = 'Insert Into %s(%s) values(%s);';
  SQL_Update  : String = 'Update %s set %s where %s;';
  SQL_Delete  : String = 'Delete From %s where %s;';
  SQL_Select  : String = 'Select %s from %s where %s';

implementation

uses
  System.Win.ComObj;

class procedure TDBUtils.Commit;
begin
  if FDTransaction = nil then
    exit;

  if FDTransaction.Active then
    FDTransaction.Commit;
end;

class function TDBUtils.ConnectDB(ADBEngine, AServer, ADatabase, AUser ,
    APassword, APort : String): Boolean;
begin
  Result := False;

  FDConnection := TFDConnection.Create(Application);
  FDTransaction:= TFDTransaction.Create(Application);

  FDConnection.Transaction                := FDTransaction;
  FDTransaction.Options.Isolation         := xiReadCommitted;
  FDTransaction.Options.DisconnectAction  := xdRollback;
  FDTransaction.Options.ReadOnly          := false;

  FDConnection.DriverName := ADBEngine;
  FDConnection.LoginPrompt:= False;

  FDConnection.Params.Add('Server=' + AServer);
  FDConnection.Params.Add('Database=' + ADatabase);
  FDConnection.Params.Add('User_Name=' + AUser);
  FDConnection.Params.Add('Password=' + APassword);

  if APort <> '' then
    FDConnection.Params.Add('Port=' + APort);

  FDConnection.Connected := True;
  if FDConnection.Connected then
  begin
    TulisRegistry('Engine', ADBEngine);
    TulisRegistry('server', AServer);
    TulisRegistry('Database', ADatabase);
    TulisRegistry('User_Name', AUser);
    TulisRegistry('Password', APassword);
    TulisRegistry('Port', APort);

    Result := True;
  end;

end;

class function TDBUtils.CreateObjectDataSet(aObjectClass: TModAppClass; aOwner:
    TComponent; CreateDataSet: Boolean = True): TClientDataSet;
var
  aFieldType: TFieldType;
  ctx : TRttiContext;
  rt : TRttiType;
  prop : TRttiProperty;
begin
  Result := TClientDataSet.Create(aOwner);
  rt := ctx.GetType(aObjectClass);
  for prop in rt.GetProperties do
  begin
    If prop.Visibility <> mvPublished then continue;
    case prop.PropertyType.TypeKind of
      tkInteger : aFieldType := ftInteger;
      tkFloat :
      begin
        if CompareText('TDateTime',prop.PropertyType.Name)=0 then
          aFieldType := ftDateTime
        else
          aFieldType := ftFloat;
      end;
      tkUString, tkString, tkWideString, tkClass : aFieldType := ftString;
    else
      aFieldType := ftString;
    end;
    Result.AddField(prop.Name, aFieldType );
  end;
  if CreateDataSet then Result.CreateDataSet;
end;

class function TDBUtils.DSToCDS(aDataset: TDataSet; aOwner: TComponent;
    FreeDataSet: Boolean = True): TClientDataset;
var
  ADSP: TDataSetProvider;
begin
  Result := nil;
  if ADataSet.FieldCount <> 0 then
  begin
    Result:= TClientDataSet.Create(aOwner);
    ADSP := TDataSetProvider.Create(Result);
    ADSP.DataSet:= aDataset;
    Result.SetProvider(ADSP);
    Result.Open;

    if FreeDataSet then FreeAndNil(aDataset);
  end;
end;

class procedure TDBUtils.TemporaryForHideWarning;
begin
  //private method yg diupdate, tapi blm berani di delete
  GenerateSQLInsert(nil);
  GenerateSQLUpdate(nil);
end;

class function TDBUtils.ExecuteSQL(ASQL: String; DoCommit: Boolean = True):
    LongInt;
begin
  if not FDTransaction.Active then
    FDTransaction.StartTransaction;
  Try
    Result := FDConnection.ExecSQL(ASQL);
    if DoCommit then Self.Commit;
  except
    Self.RollBack;
    Raise;
  End;
end;

class function TDBUtils.ExecuteSQL(ASQLs: TStrings; DoCommit: Boolean = True):
    Boolean;
var
  Q: TFDQuery;
begin
  Result := false;
  Q := TFDQuery.Create(Application);
  Try
    try
      application.ProcessMessages;
      Q.Connection  := FDConnection;
      Q.Transaction := FDTransaction;
      Q.SQL.Clear;
      Q.SQL.AddStrings(aSQLS);

      Application.ProcessMessages;
      if not FDTransaction.Active then   FDTransaction.StartTransaction;
      Q.ExecSQL;
      if DoCommit then Self.Commit;
      If not Result then Result := True;
    except
      Self.RollBack;
      Q.SQL.SaveToFile(ExtractFilePath(ParamStr(0)) + '\FailedExecution.log');
      raise;
    end;
  Finally
    Q.SQL.Clear;
    FreeAndNIl(Q);
  End;
end;

class procedure TDBUtils.GenerateSQL(AObject: TModApp; SS: TStrings);
var
  a: TCustomAttribute;
  ctx : TRttiContext;
  DoUpdateDetails: Boolean;
  meth : TRttiMethod;
  prop, propItem : TRttiProperty;
  rt : TRttiType;
  i : Integer;
  IDItems: string;
  lAppClassItem: TModAppClass;
  lObj : TObject;
  lModItem : TModApp;
  lObjectList: TObject;
  rtItem: TRttiType;
  sGenericItemClassName: string;
  value : TValue;
  SSItems: TStrings;

  function ClassInFilter(aClassType: TModAppClass): Boolean;
  var n: Integer;
  begin
    Result := True; //default no filter
    if (AObject.CrudFilterKind = fckNone) or (AObject.FilterClasses = nil) then exit;
    Result := AObject.CrudFilterKind <> fckInclude; //default false jika inlucde, true jika exclude
    for n := 0 to AObject.FilterClasses.Count-1 do  //server tidak bisa baca "class of.."
    begin
      Result := AObject.FilterClasses[n].CheckClass(aClassType.ClassName);
      if AObject.CrudFilterKind = fckExclude then Result := not Result;
      If Result <>  (AObject.CrudFilterKind <> fckInclude) then exit;
    end;
  end;

begin
  DoUpdateDetails := False;
  rt := ctx.GetType(AObject.ClassType);

  If ClassInFilter(TModAppClass(AObject.ClassType)) then
  begin
    if (AObject.ID = '') or (AObject.ObjectState = 1) then
      SS.Add(TDBUtils.GetSQLInsert(AObject))
    else
      SS.Add(TDBUtils.GetSQLUpdate(AObject));
  end;

  for prop in rt.GetProperties do
  begin
    lModItem := nil;
    If not Assigned(prop) then continue;
    If prop.PropertyType.TypeKind = tkClass then
    begin
      meth := prop.PropertyType.GetMethod('ToArray');
      if Assigned(meth) then
      begin
        lObjectList := prop.GetValue(AOBject).AsObject;
        if lObjectList = nil then continue;

        sGenericItemClassName :=  StringReplace(lObjectList.ClassName, 'TOBJECTLIST<','', [rfIgnoreCase]);
        sGenericItemClassName :=  StringReplace(sGenericItemClassName, '>','', [rfIgnoreCase]);
        rtItem := ctx.FindType(sGenericItemClassName);

        if not rtItem.AsInstance.MetaclassType.InheritsFrom(TModApp) then continue;
        lAppClassItem := TModAppClass( rtItem.AsInstance.MetaclassType );

        //filter class
        if not ClassInFilter(lAppClassItem) then continue;

        value  := meth.Invoke(prop.GetValue(AObject), []);
        Assert(value.IsArray);
        IDItems := '';
        SSItems := TStringList.Create;
        Try
          for i := 0 to value.GetArrayLength - 1 do
          begin
            lObj := value.GetArrayElement(i).AsObject;
            If not lObj.ClassType.InheritsFrom(TModApp) then continue;  //bila ada generic selain class ini
            lModItem := TModApp(lObj);

            if i = 0 then //check operation at 1st loop
              for a in ctx.GetType(lModItem.ClassType).GetAttributes do
                if a is AttrUpdateDetails then DoUpdateDetails := True;

            //dengan method dibawah, client tidak wajib menset moditem.header := modheader
            propItem := lModItem.PropFromAttr(AttributeOfHeader);
            if propItem.PropertyType.TypeKind = tkClass then
              propItem.SetValue(lModItem, AObject);

            If DoUpdateDetails then
            begin
              lModItem.ObjectState := 3; //check if update
              if lModItem.ID <> '' then
              begin
                if IDItems <> '' then IDItems := IDItems + ',';
                IDItems := IDItems + QuotedStr(lModItem.ID);
              end;
            end else
              lModItem.ObjectState := 1; //always insert

            GenerateSQL(lModItem,SSItems);
          end;

          If Assigned(lModItem) then
          begin
            If (DoUpdateDetails) and (IDItems<>'') then
              SS.Add(Format(SQL_Delete,[lModItem.GetTableName,
                lModItem.GetHeaderField + '=' + QuotedStr(AObject.ID)
                + ' and ' + lModItem.GetPrimaryField + ' not in('+ IDItems +')'
                ]))
            else
              SS.Add(Format(SQL_Delete,[lModItem.GetTableName,
                lModItem.GetHeaderField + '=' + QuotedStr(AObject.ID)]));
          end else  //if lModItem = nil, force it
          begin
            lModitem := lAppClassItem.Create;
            Try
              SS.Add(Format(SQL_Delete,[lModItem.GetTableName,
                lModItem.GetHeaderField + '=' + QuotedStr(AObject.ID)]));
            Finally
              lModItem.Free;
            End;
          end;

          if SSItems.Text <> '' then SS.AddStrings(SSItems);
        Finally
          SSItems.Free;
        End;
      end;
    end;
  end;

end;

class function TDBUtils.GenerateSQL(AObject: TModApp): TStrings;
begin
  Result := TStringList.Create;
  Self.GenerateSQL(AObject, Result);
end;

class procedure TDBUtils.GenerateSQLDelete(AObject: TModApp; SS: TStrings);
var
  ctx : TRttiContext;
  meth : TRttiMethod;
  prop : TRttiProperty;
  rt : TRttiType;
  i : Integer;
  lObj : TObject;
  lModItem : TModApp;
  value : TValue;
begin
  ctx     := TRttiContext.Create();
  rt      := ctx.GetType(AObject.ClassType);
  SS.Add(TDBUtils.GetSQLDelete(AObject));

  for prop in rt.GetProperties do
  begin
    If not Assigned(prop) then continue;
    If prop.PropertyType.TypeKind = tkClass then
    begin
      meth := prop.PropertyType.GetMethod('ToArray');
      if Assigned(meth) then
      begin
        if prop.GetValue(AOBject).AsObject = nil then continue;
        value  := meth.Invoke(prop.GetValue(AObject), []);
        Assert(value.IsArray);
        for i := 0 to value.GetArrayLength - 1 do
        begin
          lObj := value.GetArrayElement(i).AsObject;
          If not lObj.ClassType.InheritsFrom(TModApp) then continue;  //bila ada generic selain class ini
          lModItem := TModApp(lObj);
          if i = 0 then
            SS.Add(
              Format(SQL_Delete,[lModItem.GetTableName,
                lModItem.GetHeaderField + '=' + QuotedStr(AObject.ID) ])
            );
          GenerateSQLDelete(lModItem,SS);
        end;
      end;
    end;
  end;

end;

class function TDBUtils.GenerateSQLDelete(AObject: TModApp): TStrings;
begin
  Result := TStringList.Create;
  GenerateSQLDelete(AObject, Result);
end;

class function TDBUtils.GenerateSQLInsert(AObject : TModApp): string;
var
  ctx : TRttiContext;
  i: Integer;
//  lValue: TValue;
  rt : TRttiType;
  prop : TRttiProperty;
  ResultObjectList: string;
  meth : TRttiMethod;
  sNama : String;
begin
  Result := '';
  ResultObjectList := '';

  rt := ctx.GetType(AObject.ClassType);

  if AObject.ID = '' then
    AObject.ID := TDBUtils.GetNextIDGUIDToString();

  Result := 'insert into ' + AObject.ClassName + '(';
  for prop in rt.GetProperties() do begin
      meth := prop.PropertyType.GetMethod('ToArray');
      if Assigned(meth) then
        Continue;

      if prop.Name = 'ObjectState' then
        Continue;

      if not prop.IsWritable then continue;

      if Result = 'insert into ' + AObject.ClassName + '(' then
        Result := Result + prop.Name
      else
        Result := Result + ',' + prop.Name;
  end;

  Result := Result + ') values(';


  for prop in rt.GetProperties() do begin
    if not prop.IsWritable then continue;
    if prop.Name = 'ObjectState' then Continue;

    case prop.PropertyType.TypeKind of
      tkClass   : begin
                    meth := prop.PropertyType.GetMethod('ToArray');
                    if Assigned(meth) then
                    begin
                      with meth.Invoke(prop.GetValue(AObject),[]) do
                      begin
                        for i := 0 to GetArrayLength - 1 do
                        begin
                          if i = 0 then
                          begin
                            ResultObjectList := 'delete from ' + GetArrayElement(i).AsObject.ClassName
                                                + ' where ' + TModApp(GetArrayElement(i).AsObject).GetHeaderField + ' = ' + QuotedStr(AObject.ID) + ';';

                          end;

//                          TModApp(GetArrayElement(i).AsObject).SetHeaderProperty(AObject);
//                          ResultObjectList := ResultObjectList + GenerateSQLInsert(TModApp(GetArrayElement(i).AsObject));
                        end;
                      end;
                    end else begin
                      sNama := prop.Name;
                      Result := Result + QuotedStr(TModApp(prop.GetValue(AObject).AsObject).ID) + ',';
                    end;


                  end;
      tkInteger : Result := Result + FloatToStr(prop.GetValue(AObject).AsExtended) + ',';

      tkFloat   : if CompareText('TDateTime',prop.PropertyType.Name)=0 then
                    Result := Result + QuotedStr(FormatDateTime('MM/dd/yyyy hh:mm:ss',prop.GetValue(AObject).AsExtended)) + ','
                  else
                    Result := Result + FloatToStr(prop.GetValue(AObject).AsExtended) + ',' ;

      tkUString : Result := Result + QuotedStr(prop.GetValue(AObject).AsString) + ',';
    end;
  end;

  Result := LeftStr(Result, Length(Result)-1) + ');';
  if ResultObjectList <> '' then
  begin
    Result := Result + ResultObjectList;
  end;

end;

class function TDBUtils.GenerateSQLSelect(AObject : TModApp): string;
var
  ctx : TRttiContext;
//  i: Integer;
//  lValue: TValue;
  rt : TRttiType;
  prop : TRttiProperty;
  ResultObjectList: string;
  meth : TRttiMethod;
  sFieldName: string;
begin
  Result := '';
  ResultObjectList := '';

  rt := ctx.GetType(AObject.ClassType);

  if AObject.ID = '' then
    AObject.ID := TDBUtils.GetNextIDGUIDToString();

  Result := 'select ' ;
  for prop in rt.GetProperties() do begin
      meth := prop.PropertyType.GetMethod('ToArray');
      if Assigned(meth) then
        Continue;

      if prop.Name = 'ObjectState' then
        Continue;

      if not prop.IsWritable then continue;

      sFieldName := prop.Name;
      if CompareText('TDateTime',prop.PropertyType.Name)=0 then
        sFieldName := 'cast(' + sFieldName + ' as character varying(40)) as ' + sFieldName;

      if prop.PropertyType.TypeKind = tkUString then
        sFieldName := 'cast(' + sFieldName + ' as character(140)) as ' + sFieldName;

      if Result = 'select ' then
        Result := Result + sFieldName
      else
        Result := Result + ',' + sFieldName;
  end;

  Result := 'Select a.* from ( ' + Result + ' from ' + AObject.ClassName + ') a ';


end;

class function TDBUtils.GenerateSQLUpdate(AObject : TModApp): string;
var
  ctx : TRttiContext;
  i: Integer;
  rt : TRttiType;
  prop : TRttiProperty;
  meth : TRttiMethod;
  ResultObjectList: string;
begin

  Result := '';

  rt := ctx.GetType(AObject.ClassType);
  Result := 'update ' + AObject.ClassName + ' set ';

  for prop in rt.GetProperties() do begin
    meth := prop.PropertyType.GetMethod('ToArray');
    if (not prop.IsWritable) or
       (UpperCase(prop.Name) = 'ID')  or
       (prop.Name = 'ObjectState') then continue;

    if not Assigned(meth) then
      Result := Result + prop.Name + ' = ';

    case prop.PropertyType.TypeKind of
//          tkArray     :
      tkClass     : begin
                      meth := prop.PropertyType.GetMethod('ToArray');
                      if Assigned(meth) then
                      begin
                        with meth.Invoke(prop.GetValue(AObject),[]) do
                        begin
                          for i := 0 to GetArrayLength - 1 do
                          begin
                            if i = 0 then
                            begin
                              ResultObjectList := 'delete from ' + GetArrayElement(i).AsObject.ClassName
                                                  + ' where ' + TModApp(GetArrayElement(i).AsObject).GetHeaderField + ' = ' + QuotedStr(AObject.ID) + ';';

                            end;

//                            TModApp(GetArrayElement(i).AsObject).SetHeaderProperty(AObject);
                            ResultObjectList := ResultObjectList + GenerateSQLInsert(TModApp(GetArrayElement(i).AsObject));
                          end;
                        end;
                      end else begin
                        Result := Result + QuotedStr(TModApp(prop.GetValue(AObject).AsObject).ID) + ',';
                      end;
                    end;
      tkInteger   : Result := Result + FloatToStr(prop.GetValue(AObject).AsExtended) + ',';

      tkFloat     : if CompareText('TDateTime',prop.PropertyType.Name)=0 then
                      Result := Result + QuotedStr(FormatDateTime('MM/dd/yyyy hh:mm:ss',prop.GetValue(AObject).AsExtended)) + ','
                    else
                      Result := Result + FloatToStr(prop.GetValue(AObject).AsExtended) + ',';

      tkUString   : Result := Result + QuotedStr(prop.GetValue(AObject).AsString) + ',';
    end;
  end;

  Result := LeftStr(Result, Length(Result)-1) + ' where id = ' + QuotedStr(AObject.ID) + ';';
  if ResultObjectList <> '' then
  begin
    Result := Result + ResultObjectList;
  end;

end;

class function TDBUtils.GetNextID(AOBject : TModApp): Integer;
var
  Q: TFDQuery;
  sSQL: string;
begin
  Result := 0;

  sSQL := 'select max(id) as ID from ' + AOBject.ClassName;

  Q := TDBUtils.OpenQuery(sSQL, nil);
  try
    while not Q.Eof do
    begin
      Result := Q.FieldByName('ID').AsInteger;
      Q.Next;
    end;
  finally
    Q.Free;
  end;

  Result := Result + 1;
end;

class function TDBUtils.GetNextIDGUID: TGuid;
begin
  CreateGUID(Result);
end;

class function TDBUtils.GetNextIDGUIDToString: string;
var
  lGUID: TGuid;
begin
  CreateGUID(lGUID);
  Result := GUIDToString(lGUID);
end;

class function TDBUtils.GetSQLInsert(AObject: TModApp): String;
var
  ctx : TRttiContext;
  rt : TRttiType;
  prop : TRttiProperty;
  FieldValues : string;
  FieldNames: String;
begin
  FieldValues := '';
  FieldNames  := '';
 
  if AObject.ID = '' then AObject.ID := TDBUtils.GetNextIDGUIDToString();
  rt := ctx.GetType(AObject.ClassType);
  for prop in rt.GetProperties do
  begin
    If prop.Visibility <> mvPublished then continue;

    If FieldNames <> '' then FieldNames := FieldNames + ',';
    If FieldValues <> '' then FieldValues := FieldValues + ',';

    FieldNames  := FieldNames + AObject.FieldNameOf(prop);
    FieldValues   := FieldValues + AObject.QuotValue(prop);
  end;

  Result :=  Format(SQL_Insert,[AObject.GetTableName,FieldNames, FieldValues]);
end;

class function TDBUtils.GetSQLUpdate(AObject: TModApp): String;
var
  ctx : TRttiContext;
  rt : TRttiType;
  prop : TRttiProperty;
  UpdateVal : string;
  FieldName : String;
  sFilter : String;
begin
  UpdateVal := '';

  rt := ctx.GetType(AObject.ClassType);
  for prop in rt.GetProperties do
  begin
    if UpperCase(prop.Name) = 'ID' then continue;
    If prop.Visibility <> mvPublished then continue;

    FieldName  := AObject.FieldNameOf(prop);

    If UpdateVal <> '' then UpdateVal := UpdateVal + ',';
    UpdateVal := UpdateVal + FieldName + ' = ' + AObject.QuotValue(prop)
  end;

  sFilter   := '';

  sFilter := AObject.GetPrimaryField + ' = ' + QuotedStr(AObject.ID);
  Result := Format(SQL_Update,[AObject.GetTableName,UpdateVal,sFilter]);
end;

class function TDBUtils.GetSQLDelete(AObject: TModApp): String;
var
  sFilter : String;
begin
  sFilter := AObject.GetPrimaryField + ' = ' + QuotedStr(AObject.ID);
  Result  := Format(SQL_Delete,[AObject.GetTableName,sFilter]);
end;

class procedure TDBUtils.LoadFromDB(AOBject: TModApp; AID: String;
    LoadObjectList: Boolean = True);
var
  Q: TFDQuery;
  sSQL: string;
begin

  sSQL := Format(SQL_Select,['*', AOBject.GetTableName,
    AOBject.GetPrimaryField + ' = ' + QuotedStr(AID) ]);
  Q := TDBUtils.OpenQuery(sSQL, nil);
  Try
    LoadFromDataset(AObject, Q, LoadObjectList);
  Finally
    FreeAndNil(Q);
  End;
end;

class procedure TDBUtils.LoadByCode(AOBject: TModApp; aCode: String);
var
  Q: TFDQuery;
  sSQL: string;
begin
  sSQL := Format(SQL_Select,['*', AOBject.GetTableName,
    AOBject.GetCodeField + ' = ' + QuotedStr(aCode) ]);
  Q := TDBUtils.OpenQuery(sSQL, nil);
  Try
    LoadFromDataset(AObject, Q);
  Finally
    FreeAndNil(Q);
  End;
end;

class procedure TDBUtils.LoadFromDataset(AOBject: TModApp; ADataSet: TDataset;
    LoadObjectList: Boolean = True);
var
  sSQL: string;
  ctx : TRttiContext;
  FieldName : string;
  lAppObject : TModApp;
  lAppObjectItem : TModApp;
  lAppClass : TModAppClass;
  lObjectList: TObject;
  rt, rtItem : TRttiType;
  prop : TRttiProperty;
  meth : TRttiMethod;
  QQ: TFDQuery;
  sGenericItemClassName: string;
begin
  rt := ctx.GetType(AObject.ClassType);
  if not ADataSet.IsEmpty then
  begin
    for prop in rt.GetProperties() do
    begin
      if (not prop.IsWritable) then Continue;
      FieldName := AObject.FieldNameOf(prop);

      //published has fields on dataset
      if prop.Visibility = mvPublished then
      begin
        If (ADataSet.FieldByName(FieldName).DataType in [ftDate,ftDateTime,ftTimeStamp]) then
        begin
          prop.SetValue(
            AObject,
            TValue.From<TDateTime>(ADataSet.FieldByName(FieldName).AsDateTime)
          );
        end else
        begin
          case prop.PropertyType.TypeKind of
            tkInteger : prop.SetValue(AObject,ADataSet.FieldByName(FieldName).AsInteger );
            tkFloat   : prop.SetValue(AObject,ADataSet.FieldByName(FieldName).AsFloat );
            tkUString : prop.SetValue(AObject,ADataSet.FieldByName(FieldName).AsString );
            tkClass   :
            begin
              meth := prop.PropertyType.GetMethod('ToArray');
              if not Assigned(meth) then //bukan obj list
              begin
                if not prop.PropertyType.AsInstance.MetaclassType.InheritsFrom(TModApp) then continue;
                meth            := prop.PropertyType.GetMethod('Create');
                lAppObject      := TModApp(meth.Invoke(
                prop.PropertyType.AsInstance.MetaclassType, []).AsObject);

                lAppObject.ID := ADataSet.FieldByName(FieldName).AsString;

//                if prop.Name <> lAppObject.GetHeaderProperty then
//                  if (ARetrieveProp) and (lAppObject.ID  <> '') then
//                    Self.LoadFromDB(lAppObject, lAppObject.ID );

                prop.SetValue(AOBject, lAppObject);
              end;
            end;
          else
            prop.SetValue(AObject,TValue.FromVariant(ADataSet.FieldValues[FieldName]) );
          end;
        end;
      end else If LoadObjectList then //public object list
      begin
        if prop.PropertyType.TypeKind = tkClass then
        begin
          meth := prop.PropertyType.GetMethod('ToArray');
          if Assigned(meth) then
          begin
            lObjectList := prop.GetValue(AOBject).AsObject;
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
              lAppObjectItem  := lAppClass.Create;
              sSQL := 'select * from ' + lAppObjectItem.GetTableName
                    + ' where ' + lAppObjectItem.GetHeaderField
                    + ' = ' + QuotedStr(ADataSet.FieldByName(AOBject.GetPrimaryField).AsString);
              lAppObjectItem.Free;
              QQ := TDBUtils.OpenQuery(sSQL, nil);

              try
                while not QQ.Eof do
                begin
                  lAppObjectItem := lAppClass.Create;
                  LoadFromDataset(lAppObjectItem, QQ);
//                  LoadFromDataset(lAppObjectItem, QQ, ARetrieveProp);
                  meth.Invoke(lObjectList,[lAppObjectItem]);
                  QQ.Next;
                end;
              finally
                QQ.Free;
              end;
            end;
          end;
        end;  //object list assignment
      end;  //prop.visibility check
    end;
  end;

  AOBject.ObjectState := 3;

end;

class function TDBUtils.OpenDataset(ASQL: String; AOwner: TComponent = nil):
    TClientDataSet;
var
  LDSP: TDataSetProvider;
  LSQLQuery: TFDQuery;
begin
  if AOwner = nil then
    Result := TClientDataSet.Create(Application)
  else
    Result := TClientDataSet.Create(AOwner);

  LDSP        := TDataSetProvider.Create(Result);
  LSQLQuery   := TFDQuery.Create(LDSP);
  LSQLQuery.FetchOptions.Unidirectional := False;

  LSQLQuery.Connection := FDConnection;
  LSQLQuery.SQL.Append(ASQL);

  LDSP.DataSet            := LSQLQuery;
  Result.SetProvider(LDSP);
  Result.Open;

end;

class function TDBUtils.OpenMemTable(ASQL : String): TFDMemTable;
var
  Q: TFDQuery;
begin
  Result := TFDMemTable.Create(nil);

  Q := TDBUtils.OpenQuery(ASQL, nil);
  try
    Q.FetchAll;
    Result.Data := Q.Data;
    Result.First;
  finally
    Q.Free;
  end;
end;

class function TDBUtils.OpenQuery(ASQL: String; AOwner: TComponent = nil):
    TFDQuery;
begin
  Result := TFDQuery.Create(AOwner);
  Result.Connection := FDConnection;
  Result.SQL.Text := ASQL;
  Result.Open;
end;

class function TDBUtils.Quot(aString : String): String;
begin
    result := QuotedSTr(trim(Astring));
end;

class function TDBUtils.QuotD(aDate : TDateTime; aTambahJam235959 : Boolean =
    false): String;
begin
    if not aTambahJam235959 then
    begin
      Result := Quot(FormatDateTime('mm/dd/yyyy', aDate));
    end else
    begin
      Result := Quot(FormatDateTime('mm/dd/yyyy 23:59:59', aDate));
    end;
end;

class function TDBUtils.QuotDLong(aDate : TDateTime): String;
begin
    result := Quot(FormatDateTime('dd mmm yyyy', aDate));
end;

class function TDBUtils.QuotDt(aDate : TDateTime): String;
begin
    result := Quot(FormatDateTime('mm/dd/yyyy hh:mm:ss', aDate));
end;

class function TDBUtils.QuotDT(aDate : TDateTime; aTambahJam235959 : Boolean):
    String;
begin
    if not aTambahJam235959 then
    begin
      Result := Quot(FormatDateTime('mm/dd/yyyy hh:mm:ss', aDate));
    end else
    begin
      Result := Quot(FormatDateTime('mm/dd/yyyy 23:59:59', aDate));
    end;
end;

class function TDBUtils.QuotDShort(aDate : TDateTime): String;
begin
    result := Quot(FormatDateTime('mm/dd/yyyy', aDate));
end;

class function TDBUtils.QuotF(ANumber : Double): String;
begin
  Result := QuotedSTr(trim(FloatToStr(ANumber)));
end;

class procedure TDBUtils.RollBack;
begin
  if FDTransaction = nil then
    exit;

  if FDTransaction.Active then
    FDTransaction.RollBack;
end;

procedure TCDSHelper.AddField(AFieldName: String; AFieldType: TFieldType;
    ALength: Integer = 256; IsCalculated: Boolean = False);
var
  DTF: TDateTimeField;
  SF: TStringField;
  BF: TBlobField;
  BL: TBooleanField;
  FF: TFloatField;
  MF: TMemoField;
  F: TField;
begin
  Case aFieldType of
    ftDateTime:
      begin
        DTF           := TDateTimeField.Create(Self);
        DTF.Name      := Self.Name + 'col' + AFieldName + IntToStr(Integer(DTF));
        DTF.FieldName := AFieldName;
        DTF.DataSet   := Self;
      end;
    ftDate:
      begin
        DTF := TDateField.Create(Self);
        DTF.Name      := Self.Name + 'col' + AFieldName + IntToStr(Integer(DTF));
        DTF.FieldName := AFieldName;
        DTF.DataSet   := Self;
      end;
    ftString:
      begin
        SF            := TStringField.Create(Self);
        SF.Name       := Self.Name + 'col' + AFieldName + IntToStr(Integer(SF));
        SF.FieldName  := AFieldName;
        SF.Size       := aLength;
        SF.DataSet    := Self;
      end;
    ftBlob:
      begin
        BF            := TBlobField.Create(Self);
        BF.Name       := Self.Name + 'col' + AFieldName + IntToStr(Integer(BF));
        BF.FieldName  := AFieldName;
        BF.DataSet    := Self;
        BF.Calculated := IsCalculated;
      end;
    ftFloat:
      begin
        FF            := TFloatField.Create(Self);
        FF.Name       := Self.Name + 'col' + AFieldName + IntToStr(Integer(FF));
        FF.FieldName  := AFieldName;
        FF.DataSet    := Self;
      end;
    ftMemo:
      begin
        MF            := TMemoField.Create(Self);
        MF.Name       := Self.Name + 'col' + AFieldName + IntToStr(Integer(MF));
        MF.FieldName  := AFieldName;
        MF.Size       := aLength;
        MF.DataSet    := Self;
      end;
    ftSmallInt, ftInteger:
      begin
        F := TIntegerField.Create(Self);
        TIntegerField(F).Name       := Self.Name + 'col' + AFieldName + IntToStr(Integer(F));
        TIntegerField(F).FieldName  := AFieldName;
        TIntegerField(F).DataSet    := Self;
      end;
    ftBoolean:
      begin
        BL            := TBooleanField.Create(Self);
        BL.Name       := Self.Name + 'col' + AFieldName + IntToStr(Integer(BL));
        BL.FieldName  := AFieldName;
        BL.DataSet    := Self;
      end;
  end;

end;

function TCDSHelper.ClonedDataset(aOwner: TComponent; DisableSourceControl:
    Boolean = False): TClientDataSet;
begin
  Result := TClientDataSet.Create(aOwner);
  Result.CloneCursor(Self, True);
  if DisableSourceControl then Self.DisableControls;
end;

procedure TCDSHelper.LoadFromXLS(FileName: String; SheetIndex: Integer = 1);
Var
  XLApp, Sheet:Variant ;
  MaxRow, MaxCol,i, j:integer ;
  arrData:Variant;
  sCol: string;
begin

  XLApp := CreateOleObject('excel.application');
  XLApp.Workbooks.open(Trim(FileName)) ;
  Try
    Sheet  := XLApp.WorkSheets[SheetIndex] ;
    MaxRow := Sheet.Usedrange.EntireRow.count ;
    MaxCol := sheet.Usedrange.EntireColumn.count;
    arrData:= Sheet.UsedRange.Value;
    Self.FieldDefs.Clear;

    for i := 1 to MaxCol do
    begin
      sCol := arrData[1,i];
      sCol := StringReplace(sCol, ' ', '_', [rfReplaceAll]);
      Self.AddField(sCol , ftString);
    end;

    Self.CreateDataSet;

    for i:=2 to maxRow do
    begin
      Self.Append;
      for j:=1 to maxCol do
      begin
        Try
          Self.Fields[j-1].Value := arrData[i,j];
        except
          Raise Exception.Create('Error Baris : ' + inttostr(i)
            +' Kolom  : ' + Self.Fields[j-1].FieldName
          );
        End;
      end;
      Self.Post;
    end;
  Finally
    XLApp.Workbooks.close;
  End;
end;

procedure TCDSHelper.SetFieldFrom(DestFieldName: String; SourceDataSet:
    TDataset; SourceField: String = '');
begin
  if SourceField = '' then SourceField := DestFieldName;
  Self.FieldValues[DestFieldName] := SourceDataSet.FieldValues[SourceField];
end;

initialization
  DebugSS := TStringList.Create;

end.
