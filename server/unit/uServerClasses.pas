unit uServerClasses;

interface

uses
  System.Classes, uModApp, uDBUtils, Rtti, Data.DB, SysUtils,
  StrUtils, uModSO, uModSuplier, Datasnap.DBClient;

type
  {$METHODINFO ON}
  TTestMethod = class(TComponent)
  public
    function Hallo(aTanggal: TDateTime): String;
  end;

  TCrud = class(TComponent)
  private
    function StringToClass(ModClassName: string): TModAppClass;
    function ValidateCode(AOBject: TModApp): Boolean;
  public
    function SaveToDB(AObject: TModApp): Boolean;
    function DeleteFromDB(AObject: TModApp): Boolean;
    function OpenQuery(S: string): TDataSet;
    function Retrieve(ModAppClass: TModAppClass; AID: String): TModApp; overload;
    function Retrieve(ModClassName, AID: string): TModApp; overload;
    function GenerateCustomNo(aTableName, aFieldName: string; aCountDigit: Integer
        = 11): String; overload;
    function GenerateNo(aClassName: string): String; overload;
    function RetrieveAll(ModClassName, AID: string): TModApp; overload;
    function RetrieveAll(ModAppClass: TModAppClass; AID: String): TModApp; overload;
    function SaveToDBLog(AObject: TModApp): Boolean;
    function SaveToDBID(AObject: TModApp): String;
    function TestGenerateSQL(AObject: TModApp): TStrings;
  end;

  TSuggestionOrder = class(TComponent)
  public
    function GenerateSO(aTanggal: TDatetime; aMerchan_ID: String;
        aSupplierMerchan_ID: String = ''): TDataSet;
  end;

  TPurchaseOrder = class(TComponent)
  public
    function GeneratePO(ANO_SO : String; ASupMG : TModSuplierMerchanGroup): Boolean;
  end;

  {$METHODINFO OFF}

implementation

uses
  System.Generics.Collections;

function TTestMethod.Hallo(aTanggal: TDateTime): String;
begin
  Result := 'Hello Word ' + DateToStr(aTanggal);
end;

function TCrud.SaveToDB(AObject: TModApp): Boolean;
var
  lSS: TStrings;
begin
  Result := False;
  if not ValidateCode(AObject) then exit;
  lSS := TDBUtils.GenerateSQL(AObject);
  Try
    Try
      TDBUtils.ExecuteSQL(lSS, False);
      TDBUtils.Commit;
      Result := True;
    except
      TDBUtils.RollBack;
      raise;
    End;
  Finally
    lSS.Free;
  End;
end;

function TCrud.DeleteFromDB(AObject: TModApp): Boolean;
var
  lSS: TStrings;
begin
  Result := False;
  lSS := TDBUtils.GenerateSQLDelete(AObject);
  Try
    Try
      TDBUtils.ExecuteSQL(lSS, False);
      TDBUtils.Commit;
      Result := True;
    except
      TDBUtils.RollBack;
      raise;
    End;
  Finally
    lSS.Free;
  End;
end;

function TCrud.OpenQuery(S: string): TDataSet;
begin
  Result := TDBUtils.OpenQuery(S);
end;

function TCrud.Retrieve(ModAppClass: TModAppClass; AID: String): TModApp;
begin
  Result := ModAppClass.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TCrud.Retrieve(ModClassName, AID: string): TModApp;
var
  lClass: TModAppClass;
begin
  lClass := Self.StringToClass(ModClassName);
  If not Assigned(lClass) then
    Raise Exception.Create('Class ' + ModClassName + ' not found');
  Result := Self.Retrieve(lClass, AID);
end;

function TCrud.GenerateCustomNo(aTableName, aFieldName: string; aCountDigit:
    Integer = 11): String;
var
  i: Integer;
  lNum: Integer;
  S: string;
begin
  lNum := 0;
  S := 'select max(' + aFieldName + ') from ' + aTableName;
  with TDBUtils.OpenQuery(S) do
  begin
    Try
      if not eof then
        TryStrToInt( RightStr(Fields[0].AsString, aCountDigit), lNum);
    Finally
      free;
    End;
  end;
  inc(lNum);
  Result := IntToStr(lNum);
  for i := 0 to aCountDigit-1 do Result := '0' + Result;
  Result := RightStr(Result, aCountDigit);
end;

function TCrud.GenerateNo(aClassName: string): String;
var
  lClass: TModAppClass;
  lObj: TModApp;
begin
  lClass := Self.StringToClass(aClassName);
  lObj := lClass.Create;
  Try
    Result := Self.GenerateCustomNo(lObj.GetTableName, lObj.GetCodeField, 11);
  Finally
    lObj.Free;
  End;
end;

function TCrud.RetrieveAll(ModClassName, AID: string): TModApp;
var
  lClass: TModAppClass;
begin
  lClass := Self.StringToClass(ModClassName);
  If not Assigned(lClass) then
    Raise Exception.Create('Class ' + ModClassName + ' not found');
  Result := Self.RetrieveAll(lClass, AID);
end;

function TCrud.RetrieveAll(ModAppClass: TModAppClass; AID: String): TModApp;
begin
  Result := ModAppClass.Create;
  TDBUtils.LoadFromDB(Result, AID, True);
end;

function TCrud.SaveToDBLog(AObject: TModApp): Boolean;
var
  lSS: TStrings;
begin
  Result := False;
  if not ValidateCode(AObject) then exit;
  lSS := TDBUtils.GenerateSQL(AObject);
  Try
    Try
      lSS.SaveToFile(ExtractFilePath(ParamStr(0)) + '\SaveToDB.log');
      TDBUtils.ExecuteSQL(lSS, False);
      TDBUtils.Commit;
      Result := True;
    except
      TDBUtils.RollBack;
      raise;
    End;
  Finally
    lSS.Free;
  End;
end;

function TCrud.SaveToDBID(AObject: TModApp): String;
begin
  Result := '';
  If SaveToDB(AObject) then Result := AObject.ID;
end;

function TCrud.StringToClass(ModClassName: string): TModAppClass;
var
  ctx: TRttiContext;
  typ: TRttiType;
  list: TArray<TRttiType>;
begin
  Result := nil;
  ctx := TRttiContext.Create;
  list := ctx.GetTypes;
  for typ in list do
  begin
    if typ.IsInstance and (EndsText(ModClassName, typ.Name)) then
    begin
      Result := TModAppClass(typ.AsInstance.MetaClassType);
      break;
    end;
  end;
  ctx.Free;
end;

function TCrud.TestGenerateSQL(AObject: TModApp): TStrings;
begin
  Result := TDBUtils.GenerateSQL(AObject);
end;

function TCrud.ValidateCode(AOBject: TModApp): Boolean;
var
  S: string;
  sFilter: string;
begin
  Result  := True;
  if AObject.PropFromAttr(AttributeOfCode, False) = nil then
    exit;
  sFilter := AOBject.GetCodeField + ' = ' + QuotedStr(AObject.GetCodeValue);
  if AOBject.ID <> '' then
    sFilter := sFilter + ' And ' + AOBject.GetPrimaryField + ' <> ' + QuotedStr(AOBject.ID);
  S := Format(SQL_Select,['*', AOBject.GetTableName, sFilter]);
  with TDBUtils.OpenQuery(S) do
  begin
    Try
      Result := EOF;
    Finally
      Free;
    End;
  end;
  if not Result then
    raise Exception.Create(AOBject.GetTableName + '.' + AOBject.GetCodeField
      + ' : ' + AOBject.GetCodeValue + ' sudah ada di Database'
    );
end;

function TSuggestionOrder.GenerateSO(aTanggal: TDatetime; aMerchan_ID: String;
    aSupplierMerchan_ID: String = ''): TDataSet;
var
  S: string;
begin
  S := 'select * from FN_GENERATESO(' + QuotedStr(aMerchan_ID) + ','
    + TDBUtils.QuotD(aTanggal)  +')';
  if aSupplierMerchan_ID <> '' then
    S := S + ' where SUPLIER_MERCHAN_ID = ' + QuotedStr(aSupplierMerchan_ID);
  Result := TDBUtils.OpenQuery(S);
end;

function TPurchaseOrder.GeneratePO(ANO_SO : String; ASupMG :
    TModSuplierMerchanGroup): Boolean;
var
  Q: TClientDataSet;
  sSQL: string;
begin
  Result := False;

  sSQL := 'select a.* from SO a' +
          ' INNER JOIN SO_DETAIL b on a.SO_ID = b.SO_ID' +
          ' INNER JOIN SUPLIER_MERCHAN_GRUP c on b.SUPLIER_MERCHAN_GRUP_ID = c.SUPLIER_MERCHAN_GRUP_ID' +
          ' where a.so_no = ' + QuotedStr(ANO_SO);

  if ASupMG <> nil then
    sSQL := sSQL + ' and b.SUPLIER_MERCHAN_GRUP_ID = ' + QuotedStr(ASupMG.ID);

  sSQL := sSQL + ' ORDER BY c.SUPMG_CODE';

  Q := TDBUtils.OpenDataset(sSQL);
  try

  finally
    Q.Free;
  end;

  Result := True;
end;

end.
