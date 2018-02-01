unit uServerDatabase;

interface
uses
  System.Classes, System.StrUtils, System.SysUtils, uDBUtils, uModApp, System.Rtti,
  System.TypInfo;

type
  TServerDatabase = class(TObject)
  protected
    function GenerateCreateTable(AModAPP : TModApp): string; virtual; abstract;
    function GenerateAlterTable(AModAPP : TModApp): string; virtual; abstract;
  public
    function CreateTableSQLByClassName(AClassName : String): string; overload;
    function CreateTableSQLByUnitName(AUnitName : String): string; overload;
    function GenerateSQLCreateTable(AModAPP : TModApp): string;
    function IsFieldNameExist(ATableName : String; AFieldName : String): Boolean;
        virtual; abstract;
    function IsTableExist(ATableName : String): Boolean; virtual; abstract;
  end;

  TServerDatabaseSQLServer = class(TServerDatabase)
  protected
    function GenerateAlterTable(AModAPP : TModApp): string; override;
    function GenerateCreateTable(AModAPP : TModApp): string; override;
  public
    function IsFieldNameExist(ATableName : String; AFieldName : String): Boolean;
        override;
    function IsTableExist(ATableName : String): Boolean; override;
  end;

implementation

function TServerDatabaseSQLServer.GenerateAlterTable(AModAPP : TModApp): string;
var
  ctx : TRttiContext;
  rt : TRttiType;
  prop : TRttiProperty;
  UpdateVal : string;
  FieldName : String;
begin
  UpdateVal := '';

  rt := ctx.GetType(AModAPP.ClassType);
  for prop in rt.GetProperties do
  begin
    If prop.Visibility <> mvPublished then continue;

    FieldName  := AModAPP.FieldNameOf(prop);
    if IsFieldNameExist(AModAPP.GetTableName, FieldName) then
      Continue
    else begin
      If UpdateVal <> '' then UpdateVal := UpdateVal + ',';
      UpdateVal := UpdateVal + FieldName + ' ' + AModAPP.GetSQLServerFieldType(prop)
    end;
  end;

  if UpdateVal <> '' then
  begin
    Result := Format(SQL_Alter,[AModAPP.GetTableName,UpdateVal]);
    Result := UpperCase(Result);
  end;
end;

function TServerDatabaseSQLServer.GenerateCreateTable(AModAPP : TModApp):
    string;
var
  ctx : TRttiContext;
  rt : TRttiType;
  prop : TRttiProperty;
  UpdateVal : string;
  FieldName : String;
begin
  UpdateVal := '';

  rt := ctx.GetType(AModAPP.ClassType);
  for prop in rt.GetProperties do
  begin
//    if UpperCase(prop.Name) = 'ID' then continue;
    If prop.Visibility <> mvPublished then continue;

    FieldName  := AModAPP.FieldNameOf(prop);

    If UpdateVal <> '' then UpdateVal := UpdateVal + ',';
    UpdateVal := UpdateVal + FieldName + ' ' + AModAPP.GetSQLServerFieldType(prop)
  end;

  Result := Format(SQL_Create,[AModAPP.GetTableName,UpdateVal]);
  Result := UpperCase(Result);
end;

function TServerDatabaseSQLServer.IsFieldNameExist(ATableName : String;
    AFieldName : String): Boolean;
var
  sSQL: string;
begin
  Result := False;

  sSQL := 'SELECT count(tbl.name) as Jml from sys.tables as tbl ' +
          ' INNER JOIN sys.columns col ON col.object_id=tbl.object_id' +
          ' inner join sys.types typ on col.system_type_id = typ.system_type_id' +
          ' WHERE tbl.Name= ' + QuotedStr(ATableName) +
          ' and col.name = ' + QuotedStr(AFieldName);

  with TDBUtils.OpenQuery(sSQL) do
  begin
    try
      if FieldByName('Jml').AsInteger > 0 then
        Result := True;
    finally
      Free;
    end;
  end;
end;

function TServerDatabaseSQLServer.IsTableExist(ATableName : String): Boolean;
var
  sSQL: string;
begin
  Result := False;

  sSQL := 'select COUNT(a.name) as Jml' +
          ' from sys.tables a ' +
          ' where a.name = ' + QuotedStr(ATableName);

  with TDBUtils.OpenQuery(sSQL) do
  begin
    try
      if FieldByName('Jml').AsInteger > 0 then
        Result := True;
    finally
      Free;
    end;
  end;
end;

function TServerDatabase.CreateTableSQLByClassName(AClassName : String): string;
var
  AObject: TObject;
  C : TRttiContext;
begin
  AObject := (C.FindType(AClassName) as TRttiInstanceType).MetaClassType.Create;
  Result := GenerateSQLCreateTable(TModApp(AObject));
end;

function TServerDatabase.CreateTableSQLByUnitName(AUnitName : String): string;
var
  AObject: tobject;
  C: TRttiContext;
  t: TRttiType;
  DeclaringUnitName: string;
//  sClassName: string;
begin
  Result := '';
  for t in C.GetTypes do
  begin
    if t.IsInstance then
    begin
      DeclaringUnitName := t.AsInstance.DeclaringUnitName;
      if SameText(DeclaringUnitName, AUnitName) then
      begin
        AObject := (C.FindType(AUnitName + '.' + t.ToString) as TRttiInstanceType).MetaClassType.Create;
        if Result = '' then
          Result := GenerateSQLCreateTable(TModApp(AObject))
        else
          Result := Result + GenerateSQLCreateTable(TModApp(AObject));
      end;
    end;
  end;
end;

function TServerDatabase.GenerateSQLCreateTable(AModAPP : TModApp): string;
begin
  if not IsTableExist(AModAPP.GetTableName) then
    Result := GenerateCreateTable(AModAPP)
  else
    Result := GenerateAlterTable(AModAPP);
end;

end.
