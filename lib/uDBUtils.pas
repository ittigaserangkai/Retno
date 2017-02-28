unit uDBUtils;

interface
uses
  Rtti, typinfo, SysUtils, StrUtils,
  Forms, DBClient,
  Provider, uAppUtils, Generics.Collections, Classes, StdCtrls,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.PG, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSSQL, Data.DB, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, uModApp;

type
  TDBUtils = class(TObject)
  private
    class function GenerateSQLInsert(AObject : TModApp): string; overload;
    class function GenerateSQLUpdate(AObject : TModApp): string; overload;
    class function GetSQLInsert(AObject: TModApp): String;
    class function GetSQLUpdate(AObject: TModApp): String;
    class function GetSQLDelete(AObject: TModApp): String; overload;
    class function QuotValue(AObject: TModApp; AProp: TRttiProperty): String;
  public
    class procedure Commit;
    class function ConnectDB(ADBEngine, AServer, ADatabase, AUser , APassword,
        APort : String): Boolean;
    class procedure DSToCDS(ADataset : TDataset; ACDS : TClientDataset);
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
    class procedure LoadFromDB(AOBject : TModApp; AID : String);
    class procedure SetFromDatast(AOBject: TModApp; ADataSet: TDataset);
    class function OpenDataset(ASQL : String): TClientDataSet; overload;
    class function OpenMemTable(ASQL : String): TFDMemTable;
    class function OpenQuery(ASQL : String): TFDQuery;
    class procedure RollBack;
  end;

var
  FDConnection  : TFDConnection;
  FDTransaction : TFDTransaction;

const
  SQL_Insert  : String = 'Insert Into %s(%s) values(%s);';
  SQL_Update  : String = 'Update %s set %s where %s;';
  SQL_Delete  : String = 'Delete From %s where %s;';
  SQL_Select  : String = 'Select %s from %s where %s';

implementation


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
    TAppUtils.TulisRegistry('Engine', ADBEngine);
    TAppUtils.TulisRegistry('server', AServer);
    TAppUtils.TulisRegistry('Database', ADatabase);
    TAppUtils.TulisRegistry('User_Name', AUser);
    TAppUtils.TulisRegistry('Password', APassword);
    TAppUtils.TulisRegistry('Port', APort);

    Result := True;
  end;

end;

class procedure TDBUtils.DSToCDS(ADataset : TDataset; ACDS : TClientDataset);
var
  i: Integer;
begin
  ACDS.Open;
  ACDS.EmptyDataSet;

  while not ADataset.Eof do
  begin
    for i := 0 to ACDS.Fields.Count - 1 do
    begin
      ACDS.Append;
      ACDS.Fields[i] := ADataset.FieldByName(ACDS.FieldDefs[i].Name);
    end;
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
    Q.SQL.SaveToFile(TAppUtils.GetAppPath + '\FailedExecution.log');
    raise;
  end;
  FreeAndNIl(Q);
end;

class procedure TDBUtils.GenerateSQL(AObject: TModApp; SS: TStrings);
var
  ctx : TRttiContext;
  meth : TRttiMethod;
  prop, propItem : TRttiProperty;
  rt, rtItem : TRttiType;
  i : Integer;
  lObj : TObject;
  lModItem : TModAppItem;
  value : TValue;
begin
  ctx     := TRttiContext.Create();
  rt      := ctx.GetType(AObject.ClassType);

  if (AObject.ID = '') or (AObject.ObjectState = 1) then
    SS.Add(TDBUtils.GetSQLInsert(AObject))
  else
    SS.Add(TDBUtils.GetSQLUpdate(AObject));

  for prop in rt.GetDeclaredProperties do
  begin
    If not Assigned(prop) then continue;
    If prop.PropertyType.TypeKind = tkClass then
    begin
      meth := prop.PropertyType.GetMethod('ToArray');
      if Assigned(meth) then
      begin
        value  := meth.Invoke(prop.GetValue(AObject), []);
        Assert(value.IsArray);
        for i := 0 to value.GetArrayLength - 1 do
        begin
          lObj := value.GetArrayElement(i).AsObject;
          If not lObj.ClassType.InheritsFrom(TModAppItem) then continue;  //bila ada generic selain class ini
          lModItem := TModAppItem(lObj);

          if i = 0 then
            SS.Add( Format(SQL_Delete,[lModItem.GetTableName,lModItem.GetHeaderField + '=' + QuotedStr(AObject.ID) ]) );

          //dengan method dibawah, client tidak wajib menset moditem.header := modheader
          rtItem := ctx.GetType(lModItem.ClassType);
          propItem := rtItem.GetProperty(lModItem.GetHeaderField);
          if propItem = nil then
            raise Exception.Create(lObj.ClassName + ' tidak memiliki property ' +lModItem.GetHeaderField );
          propItem.SetValue(lModItem, AObject.ID);


          GenerateSQL(lModItem,SS);
        end;
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
  lModItem : TModAppItem;
  value : TValue;
begin
  ctx     := TRttiContext.Create();
  rt      := ctx.GetType(AObject.ClassType);
  SS.Add(TDBUtils.GetSQLDelete(AObject));

  for prop in rt.GetDeclaredProperties do
  begin
    If not Assigned(prop) then continue;
    If prop.PropertyType.TypeKind = tkClass then
    begin
      meth := prop.PropertyType.GetMethod('ToArray');
      if Assigned(meth) then
      begin
        value  := meth.Invoke(prop.GetValue(AObject), []);
        Assert(value.IsArray);
        for i := 0 to value.GetArrayLength - 1 do
        begin
          lObj := value.GetArrayElement(i).AsObject;
          If not lObj.ClassType.InheritsFrom(TModAppItem) then continue;  //bila ada generic selain class ini
          lModItem := TModAppItem(lObj);
          if i = 0 then
            SS.Add(
              Format(SQL_Delete,[lModItem.GetTableName,lModItem.GetHeaderField
               + '=' + QuotedStr(AObject.ID) ])
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

  ctx := TRttiContext.Create();
  try
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
                                                    + ' where ' + TModAppItem(GetArrayElement(i).AsObject).GetHeaderField + ' = ' + QuotedStr(AObject.ID) + ';';

                              end;

                              TModAppItem(GetArrayElement(i).AsObject).SetHeaderProperty(AObject);
                              ResultObjectList := ResultObjectList + GenerateSQLInsert(TModApp(GetArrayElement(i).AsObject));
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
  finally
      ctx.Free();
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

  ctx := TRttiContext.Create();
  try
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


  finally
      ctx.Free();
  end;
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
  ctx := TRttiContext.Create();
  try
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
                                                      + ' where ' + TModAppItem(GetArrayElement(i).AsObject).GetHeaderField + ' = ' + QuotedStr(AObject.ID) + ';';

                                end;

                                TModAppItem(GetArrayElement(i).AsObject).SetHeaderProperty(AObject);
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
  finally
      ctx.Free();
  end;
end;

class function TDBUtils.GetNextID(AOBject : TModApp): Integer;
var
  Q: TFDQuery;
  sSQL: string;
begin
  Result := 0;

  sSQL := 'select max(id) as ID from ' + AOBject.ClassName;

  Q := TDBUtils.OpenQuery(sSQL);
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
  Field : TRttiField;
  FieldValues : string;
  FieldNames: String;
begin
  FieldValues := '';
  FieldNames  := '';
  ctx := TRttiContext.Create();
  try
    rt := ctx.GetType(AObject.ClassType);
    for prop in rt.GetDeclaredProperties do
    begin
      If prop.Visibility <> mvPublished then continue;
      Field := rt.GetField('dbf_' + prop.Name);
      If FieldNames <> '' then FieldNames := FieldNames + ',';
      If FieldValues <> '' then FieldValues := FieldValues + ',';
      if Field <> nil then
        FieldNames  := FieldNames + Field.GetValue(AObject).AsString
      else
        FieldNames  := FieldNames + prop.Name;
      FieldValues   := FieldValues + QuotValue(AObject, prop);
    end;
  finally
    ctx.Free();
  end;
  Result :=  Format(SQL_Insert,[AObject.GetTableName,FieldNames, FieldValues]);
end;

class function TDBUtils.GetSQLUpdate(AObject: TModApp): String;
var
  ctx : TRttiContext;
  rt : TRttiType;
  prop : TRttiProperty;
  Field : TRttiField;
  UpdateVal : string;
  FieldName : String;
  sFilter : String;
begin
  UpdateVal := '';
  ctx       := TRttiContext.Create();
  try
    rt := ctx.GetType(AObject.ClassType);
    for prop in rt.GetDeclaredProperties do
    begin
      if UpperCase(prop.Name) = 'ID' then continue;
      If prop.Visibility <> mvPublished then continue;
      Field := rt.GetField('dbf_' + prop.Name);

      if Field <> nil then
        FieldName := Field.GetValue(AObject).AsString
      else
        FieldName := prop.Name;

      If UpdateVal <> '' then UpdateVal := UpdateVal + ',';
      UpdateVal := UpdateVal + FieldName + ' = ' + QuotValue(AObject,prop)
    end;

    sFilter   := '';
  finally
    ctx.Free();
  end;
  sFilter := 'ID = ' + QuotedStr(AObject.ID);
  Result := Format(SQL_Update,[AObject.GetTableName,UpdateVal,sFilter]);
end;

class function TDBUtils.GetSQLDelete(AObject: TModApp): String;
var
  sFilter : String;
begin
  sFilter := 'ID = ' + QuotedStr(AObject.ID);
  Result  := Format(SQL_Delete,[AObject.GetTableName,sFilter]);
end;

class procedure TDBUtils.LoadFromDB(AOBject : TModApp; AID : String);
var
  Q: TFDQuery;
  sSQL: string;
//  ctx : TRttiContext;
//  lAppObject: TModApp;
//  lAppObjectList: TObjectList<TModApp>;
//  lObjectList: TObject;
//  rt : TRttiType;
//  prop : TRttiProperty;
//  meth : TRttiMethod;
//  QQ: TClientDataSet;
//  sGenericItemClassName: string;
////  sX: string;
begin
  sSQL := 'select * from ' + AOBject.ClassName + ' where id = ' + QuotedStr(AID);
  Q := TDBUtils.OpenQuery(sSQL);
  SetFromDatast(AObject, Q);

  {
  ctx := TRttiContext.Create();
  try
    rt := ctx.GetType(AObject.ClassType);

    if not Q.IsEmpty then
    begin
      for prop in rt.GetProperties() do begin
        if prop.Name = 'ObjectState' then
          Continue;

        if (not prop.IsWritable) then
          Continue;

        if AOBject is TModAppItem then
        begin
          if (UpperCase(prop.Name)=UpperCase((AOBject as TModAppItem).GetHeaderField)) then
            continue;
        end;

        case prop.PropertyType.TypeKind of
          tkInteger : prop.SetValue(AObject,Q.FieldByName(prop.Name).AsInteger );
          tkFloat   : prop.SetValue(AObject,Q.FieldByName(prop.Name).AsFloat );
          tkUString : prop.SetValue(AObject,Q.FieldByName(prop.Name).AsString );
          tkClass   : begin
                        meth := prop.PropertyType.GetMethod('ToArray');
                        if Assigned(meth) then
                        begin
                          lObjectList := prop.GetValue(AOBject).AsObject;
                          sGenericItemClassName :=  StringReplace(lObjectList.ClassName, 'TOBJECTLIST<','', [rfIgnoreCase]);
                          sGenericItemClassName :=  StringReplace(sGenericItemClassName, '>','', [rfIgnoreCase]);
//                          sGenericItemClassName :=  StringReplace(sGenericItemClassName, 'UMODEL.','', [rfIgnoreCase]);

                          lAppObject := TModApp((ctx.FindType(sGenericItemClassName) as TRttiInstanceType).MetaClassType.Create);
                          meth := prop.PropertyType.GetMethod('Add');

                          if Assigned(meth) then
                          begin
                            sSQL := 'select id from ' + lAppObject.ClassName
                                    + ' where ' + TModAppItem(lAppObject).GetHeaderField + ' = ' + QuotedStr(AID);

                            QQ := TDBUtils.OpenDataset(sSQL);
                            try
                              while not QQ.Eof do
                              begin
                                lAppObject.ID := QQ.FieldByName('ID').AsString;
                                TModAppItem(lAppObject).SetHeaderProperty(AOBject);
                                LoadFromDB(lAppObject, lAppObject.ID);
                                meth.Invoke(lObjectList,[lAppObject]);

                                QQ.Next;
                                if not QQ.Eof then
                                  lAppObject := TModApp((ctx.FindType(sGenericItemClassName) as TRttiInstanceType).MetaClassType.Create);



                              end;
                            finally
                              QQ.Free;
                            end;


                          end;
                        end else begin
                          meth          := prop.PropertyType.GetMethod('Create');
                          lAppObject    := TModApp(meth.Invoke(prop.PropertyType.AsInstance.MetaclassType, []).AsObject);
                          lAppObject.ID := Q.FieldByName(prop.Name).AsString;

                          prop.SetValue(AOBject, lAppObject);
                        end;
                      end;
        end;
      end;
    end;
  finally
    AOBject.ObjectState := 3;
    Q.Free;
  end;
  }
end;

class procedure TDBUtils.SetFromDatast(AOBject: TModApp; ADataSet: TDataset);
var
  sSQL: string;
  ctx : TRttiContext;
  Field : TRttiField;
  FieldName : string;
  lAppObject : TModApp;
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
      Field := rt.GetField('dbf_' + prop.Name);

      if Field <> nil then
        FieldName := Field.GetValue(AObject).AsString
      else
        FieldName := prop.Name;

      case prop.PropertyType.TypeKind of
        tkInteger : prop.SetValue(AObject,ADataSet.FieldByName(FieldName).AsInteger );
        tkFloat   : prop.SetValue(AObject,ADataSet.FieldByName(FieldName).AsFloat );
        tkUString : prop.SetValue(AObject,ADataSet.FieldByName(FieldName).AsString );
        tkClass   :
        begin
          meth := prop.PropertyType.GetMethod('ToArray');
          if Assigned(meth) then
          begin
            lObjectList := prop.GetValue(AOBject).AsObject;
            sGenericItemClassName :=  StringReplace(lObjectList.ClassName, 'TOBJECTLIST<','', [rfIgnoreCase]);
            sGenericItemClassName :=  StringReplace(sGenericItemClassName, '>','', [rfIgnoreCase]);

            rtItem := ctx.FindType(sGenericItemClassName);
            meth := prop.PropertyType.GetMethod('Add');

            if Assigned(meth) and Assigned(rtItem) then
            begin
              lAppClass      := TModAppClass( rtItem.AsInstance.MetaclassType );
              sSQL := 'select * from ' + lAppClass.ClassName
                      + ' where ' + TModAppItem(lAppClass).GetHeaderField
                      + ' = ' + QuotedStr(ADataSet.FieldByName('ID').AsString);

              QQ := TDBUtils.OpenQuery(sSQL);
              try
                while not QQ.Eof do
                begin
                  lAppObject := TModApp((ctx.FindType(sGenericItemClassName) as TRttiInstanceType).MetaClassType.Create);
                  SetFromDatast(lAppObject, QQ);
                  meth.Invoke(lObjectList,[lAppObject]);
                  QQ.Next;
                end;
              finally
                QQ.Free;
              end;

            end;
          end else begin

            meth          := prop.PropertyType.GetMethod('Create');
            lAppObject    := TModApp(meth.Invoke(prop.PropertyType.AsInstance.MetaclassType, []).AsObject);
            lAppObject.ID := ADataSet.FieldByName(prop.Name).AsString;

            prop.SetValue(AOBject, lAppObject);
          end;
        end;
      else
        prop.SetValue(AObject,TValue.FromVariant(ADataSet.FieldValues[FieldName]) );
      end;
    end;
  end;

  AOBject.ObjectState := 3;

end;

class function TDBUtils.OpenDataset(ASQL : String): TClientDataSet;
var
  LDSP: TDataSetProvider;
  LSQLQuery: TFDQuery;
begin
  Result      := TClientDataSet.Create(Application);
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

  Q := TDBUtils.OpenQuery(ASQL);
  try
    Q.FetchAll;
    Result.Data := Q.Data;
    Result.First;
  finally
    Q.Free;
  end;
end;

class function TDBUtils.OpenQuery(ASQL : String): TFDQuery;
begin
//  if mmoLogs <> nil then
//    mmoLogs.Lines.Add(ASQL);

  Result := TFDQuery.Create(nil);
  Result.Connection := FDConnection;
  Result.Open(ASQL);
end;

class function TDBUtils.QuotValue(AObject: TModApp; AProp: TRttiProperty):
    String;
var
  lDate: TDateTime;
begin
  If LowerCase(AProp.PropertyType.Name) = LowerCase('TDateTime') then
  begin
    lDate := AProp.GetValue(AObject).AsExtended;
    Result := QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss',lDate));
  end else begin
    case AProp.PropertyType.TypeKind of
      tkInteger, tkInt64:
        Result := InttoStr(AProp.GetValue(AObject).AsInteger);
      tkFloat:
        Result := FloatToStr(AProp.GetValue(AObject).AsExtended);
      tkString, tkLString, tkUString, tkChar, tkWString, tkVariant:
        Result := QuotedStr(AProp.GetValue(AObject).AsString);
      tkEnumeration:
        Result := BoolToStr(AProp.GetValue(AObject).AsBoolean);
    else
      Raise Exception.Create(
        'Property Type tidak terdaftar atas ' + AObject.ClassName + ',' + AProp.Name);
    end;
  end;
end;

class procedure TDBUtils.RollBack;
begin
  if FDTransaction = nil then
    exit;

  if FDTransaction.Active then
    FDTransaction.RollBack;
end;

end.
