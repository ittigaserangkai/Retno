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
    class function GenerateSQLInsert(AObject : TModApp): string;
    class function GenerateSQLUpdate(AObject : TModApp): string;
  public
    class function ConnectDB(ADBEngine, AServer, ADatabase, AUser , APassword,
        APort : String): Boolean;
    class procedure DSToCDS(ADataset : TDataset; ACDS : TClientDataset);
    class function ExecuteSQL(ASQL : String): LongInt;
    class function GenerateSQL(AObject : TModApp): string;
    class function GenerateSQLDelete(AObject : TModApp; AID : String): string;
    class function GenerateSQLSelect(AObject : TModApp): string;
    class function GetNextID(AOBject : TModApp): Integer;
    class function GetNextIDGUID: TGuid;
    class function GetNextIDGUIDToString: string;
    class procedure LoadFromDB(AOBject : TModApp; AID : String);
    class function OpenDataset(ASQL : String): TClientDataSet; overload;
    class function OpenMemTable(ASQL : String): TFDMemTable;
    class function OpenQuery(ASQL : String): TFDQuery;
  end;

var
  FDConnection  : TFDConnection;
  FDTransaction : TFDTransaction;

implementation

class function TDBUtils.ConnectDB(ADBEngine, AServer, ADatabase, AUser ,
    APassword, APort : String): Boolean;
begin
  Result := False;

  FDConnection := TFDConnection.Create(Application);
  FDTransaction:= TFDTransaction.Create(Application);

  FDConnection.Transaction := FDTransaction;

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

class function TDBUtils.ExecuteSQL(ASQL : String): LongInt;
begin
//  if mmoLogs <> nil then
//    mmoLogs.Lines.Add(ASQL);
//
  Result := FDConnection.ExecSQL(ASQL);
end;

class function TDBUtils.GenerateSQL(AObject : TModApp): string;
begin
  if (AObject.ID = '') or (AObject.ObjectState = 1) then
  begin
    Result := TDBUtils.GenerateSQLInsert(AObject)
  end else
    Result := TDBUtils.GenerateSQLUpdate(AObject);

end;

class function TDBUtils.GenerateSQLDelete(AObject : TModApp; AID : String):
    string;
var
  ctx : TRttiContext;
  i: Integer;
//  lValue: TValue;
  rt : TRttiType;
  prop : TRttiProperty;
  ResultObjectList: string;
  meth : TRttiMethod;
begin
  Result := '';
  ResultObjectList := '';

  TDBUtils.LoadFromDB(AObject, AID);

  ctx := TRttiContext.Create();
  try
      rt := ctx.GetType(AObject.ClassType);

      Result := 'delete from ' + AObject.ClassName
            + ' where id =' + QuotedStr(AID) + ';';

      for prop in rt.GetProperties() do begin
        if (not prop.IsWritable) or
           (prop.PropertyType.TypeKind <> tkClass) then continue;

        meth := prop.PropertyType.GetMethod('ToArray');
        if Assigned(meth) then
        begin
          with meth.Invoke(prop.GetValue(AObject),[]) do
          begin
            for i := 0 to GetArrayLength - 1 do
            begin
//              if i = 0 then
//              begin
//                ResultObjectList := 'delete from ' + GetArrayElement(i).AsObject.ClassName
//                                    + ' where ' + TModApp(GetArrayElement(i).AsObject).GetHeaderField + ' = ' + QuotedStr(AID) + ';';
//              end;

              ResultObjectList := ResultObjectList + GenerateSQLDelete(TModApp(GetArrayElement(i).AsObject),TModApp(GetArrayElement(i).AsObject).ID );
            end;
          end;
        end;
      end;

      if ResultObjectList <> '' then
      begin
        Result := Result + ResultObjectList;
      end;
  finally
      ctx.Free();
  end;
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

class procedure TDBUtils.LoadFromDB(AOBject : TModApp; AID : String);
var
  Q: TFDQuery;
  sSQL: string;

  ctx : TRttiContext;
  lAppObject: TModApp;
//  lAppObjectList: TObjectList<TModApp>;
  lObjectList: TObject;
  rt : TRttiType;
  prop : TRttiProperty;
  meth : TRttiMethod;
  QQ: TClientDataSet;
  sGenericItemClassName: string;
//  sX: string;
begin

  sSQL := 'select * from ' + AOBject.ClassName
          + ' where id = ' + QuotedStr(AID);

  ctx := TRttiContext.Create();
  Q := TDBUtils.OpenQuery(sSQL);
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

end.
