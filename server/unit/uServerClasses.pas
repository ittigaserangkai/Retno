unit uServerClasses;

interface

uses
  System.Classes, uModApp, uDBUtils, Rtti, Data.DB, SysUtils,
  StrUtils, uModSO, uModSuplier, Datasnap.DBClient, uModUnit, uModBarang,
  uModDO;

type
  {$METHODINFO ON}
  TBaseServerClass = class(TComponent)
  public
    procedure AfterExecuteMethod;
  end;

  TTestMethod = class(TComponent)
  public
    function Hallo(aTanggal: TDateTime): String;
  end;

  TCrud = class(TBaseServerClass)
  private
    function StringToClass(ModClassName: string): TModAppClass;
  protected
    function BeforeSaveToDB(AObject: TModApp): Boolean; virtual;
    function AfterSaveToDB(AObject: TModApp): Boolean; virtual;
    function BeforeDeleteFromDB(AObject: TModApp): Boolean; virtual;
    function Retrieve(ModAppClass: TModAppClass; AID: String; LoadObjectList:
        Boolean = True): TModApp; overload;
    function ValidateCode(AOBject: TModApp): Boolean;
  public
    function SaveToDB(AObject: TModApp): Boolean;
    function DeleteFromDB(AObject: TModApp): Boolean;
    function OpenQuery(S: string): TDataSet;
    function Retrieve(ModClassName, AID: string): TModApp; overload;
    function GenerateCustomNo(aTableName, aFieldName: string; aCountDigit: Integer
        = 11): String; overload;
    function GenerateNo(aClassName: string): String; overload;
    function RetrieveSingle(ModClassName, AID: string): TModApp; overload;
    function RetrieveByCode(ModClassName, aCode: string): TModApp; overload;
    function SaveToDBLog(AObject: TModApp): Boolean;
    function SaveToDBID(AObject: TModApp): String;
    function TestGenerateSQL(AObject: TModApp): TStrings;
  end;

  TSuggestionOrder = class(TBaseServerClass)
  public
    function GenerateSO(aTanggal: TDatetime; aMerchan_ID: String;
        aSupplierMerchan_ID: String = ''): TDataSet;
    function RetrieveDetails(aID: String): TDataSet;
  end;

  TCrudPO = class(TCRud)
  public
    function GeneratePO(ASOID : String; ASupMGID : String): Boolean;
  end;

  TCrudSupplier = class(TCrud)
  public
    function BeforeSaveToDB(AObject: TModApp): Boolean; override;
  end;

  TCrudDO = class(TCrud)
  private
    function GenerateNP(AModDO: TModDO): string;
    function UpdateStatusPO(AObject: TModApp): Boolean;
  protected
    function AfterSaveToDB(AObject: TModApp): Boolean; override;
    function BeforeSaveToDB(AObject: TModApp): Boolean; override;
  public
    function RetrieveByPO(APONO : String): TModDO;
  end;

  TCrudCN = class(TCrud)
  protected
    function AfterSaveToDB(AObject: TModApp): Boolean; override;
    function BeforeDeleteFromDB(AObject: TModApp): Boolean; override;
    function BeforeSaveToDB(AObject: TModApp): Boolean; override;
  public
  end;


{$METHODINFO OFF}

const
  CloseSession : Boolean = True;

implementation

uses
  System.Generics.Collections, Datasnap.DSSession, Data.DBXPlatform, uModPO,
  uModCNRecv;

function TTestMethod.Hallo(aTanggal: TDateTime): String;
begin
  Result := 'Hello Word ' + DateToStr(aTanggal);
end;

function TCrud.BeforeSaveToDB(AObject: TModApp): Boolean;
begin
  Result := True;
end;

function TCrud.AfterSaveToDB(AObject: TModApp): Boolean;
begin
  Result := True;
end;

function TCrud.BeforeDeleteFromDB(AObject: TModApp): Boolean;
begin
  Result := True;
end;

function TCrud.SaveToDB(AObject: TModApp): Boolean;
var
  lSS: TStrings;
begin
  Result := False;
  if not ValidateCode(AObject) then exit;
  if not BeforeSaveToDB(AObject) then exit;
  lSS := TDBUtils.GenerateSQL(AObject);
  Try
    Try
      TDBUtils.ExecuteSQL(lSS, False);
      if not AfterSaveToDB(AObject) then exit;

      TDBUtils.Commit;
      Result := True;
    except
      lSS.SaveToFile(AObject.ClassName + '_ErrorSQL.log');
      TDBUtils.RollBack;
      raise;
    End;
  Finally
//    AObject.Free;
    lSS.Free;
    AfterExecuteMethod;
  End;
end;

function TCrud.DeleteFromDB(AObject: TModApp): Boolean;
var
  lSS: TStrings;
begin
  Result := False;
  if not BeforeDeleteFromDB(AObject) then exit;
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
    AfterExecuteMethod;
  End;
end;

function TCrud.OpenQuery(S: string): TDataSet;
begin
  Result := TDBUtils.OpenQuery(S);
  AfterExecuteMethod;
end;

function TCrud.Retrieve(ModAppClass: TModAppClass; AID: String; LoadObjectList:
    Boolean = True): TModApp;
begin
  Result := ModAppClass.Create;
  TDBUtils.LoadFromDB(Result, AID, LoadObjectList);
end;

function TCrud.Retrieve(ModClassName, AID: string): TModApp;
var
  lClass: TModAppClass;
begin
  lClass := Self.StringToClass(ModClassName);
  If not Assigned(lClass) then
    Raise Exception.Create('Class ' + ModClassName + ' not found');
  Result := Self.Retrieve(lClass, AID);

  AfterExecuteMethod;
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

  AfterExecuteMethod;
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
    AfterExecuteMethod;
    lObj.Free;
  End;
end;

function TCrud.RetrieveSingle(ModClassName, AID: string): TModApp;
var
  lClass: TModAppClass;
begin
  lClass := Self.StringToClass(ModClassName);
  If not Assigned(lClass) then
    Raise Exception.Create('Class ' + ModClassName + ' not found');
  Result := Self.Retrieve(lClass, AID, False);

  AfterExecuteMethod;
end;

function TCrud.RetrieveByCode(ModClassName, aCode: string): TModApp;
var
  lClass: TModAppClass;
begin
  lClass := Self.StringToClass(ModClassName);
  If not Assigned(lClass) then
    Raise Exception.Create('Class ' + ModClassName + ' not found');
  Result := lClass.Create;
  if aCode <> '' then
    TDBUtils.LoadByCode(Result, aCode);
  AfterExecuteMethod;
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
//  Result := '';
//  If SaveToDB(AObject) then Result := AObject.ID;
var
  lSS: TStrings;
begin
  Result := '';
  if not ValidateCode(AObject) then exit;
  if not BeforeSaveToDB(AObject) then exit;
  lSS := TDBUtils.GenerateSQL(AObject);
  Try
    Try
      TDBUtils.ExecuteSQL(lSS, False);
      if not AfterSaveToDB(AObject) then exit;

      TDBUtils.Commit;
      Result := AObject.ID;
    except
      TDBUtils.RollBack;
      raise;
    End;
  Finally
//    AObject.Free;
    lSS.Free;
    AfterExecuteMethod;
  End;
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

function TSuggestionOrder.RetrieveDetails(aID: String): TDataSet;
var
  S: string;
begin
  S := 'select * from V_SO_DETAIL where SO_ID = ' + QuotedStr(Aid);
  Result := TDBUtils.OpenQuery(S);
end;

function TCrudPO.GeneratePO(ASOID : String; ASupMGID : String): Boolean;
var
  sSOID: string;
  sSQL: string;
  sSUPMMID: string;
begin
  Result := False;

  sSOID := 'null';
  if ASOID <> '' then
    sSOID := QuotedStr(ASOID);

  sSUPMMID := 'null';
  if ASupMGID <> '' then
    sSUPMMID := QuotedStr(ASupMGID);

  sSQL   := 'exec dbo.SP_GENERATE_PO ' + sSOID + ',' + sSUPMMID;
  try
    TDBUtils.ExecuteSQL(sSQL, False);
    TDBUtils.Commit;
    Result := False;
  except
    TDBUtils.RollBack;
  end;
end;

function TCrudSupplier.BeforeSaveToDB(AObject: TModApp): Boolean;
var
  lModSupplier: TModSuplier;
//  lSS: TStrings;
  I: Integer;
begin
  Result := True;

  lModSupplier := TModSuplier(AObject);
  for I := 0 to lModSupplier.SuplierMerchanGroups.Count - 1 do
  begin
    if lModSupplier.SuplierMerchanGroups[i].SUPMG_IS_DIF_CONTACT = 0 then
    begin
      lModSupplier.SuplierMerchanGroups[i].SUPMG_ADDRESS := lModSupplier.SUP_ADDRESS;
      lModSupplier.SuplierMerchanGroups[i].SUPMG_CITY := lModSupplier.SUP_CITY;
      lModSupplier.SuplierMerchanGroups[i].SUPMG_TELP := lModSupplier.SUP_TELP;
      lModSupplier.SuplierMerchanGroups[i].SUPMG_FAX := lModSupplier.SUP_FAX;
      lModSupplier.SuplierMerchanGroups[i].SUPMG_POST_CODE := lModSupplier.SUP_POST_CODE;
      lModSupplier.SuplierMerchanGroups[i].SUPMG_CONTACT_PERSON := lModSupplier.SUP_CONTACT_PERSON;
      lModSupplier.SuplierMerchanGroups[i].SUPMG_TITLE := lModSupplier.SUP_TITLE;
      lModSupplier.SuplierMerchanGroups[i].SUPMG_BANK_ACCOUNT_NO := lModSupplier.SUP_BANK_ACCOUNT_NO;
      lModSupplier.SuplierMerchanGroups[i].BANK := lModSupplier.BANK;
      lModSupplier.SuplierMerchanGroups[i].SUPMG_BANK_ACCOUNT_NAME := lModSupplier.SUP_BANK_ACCOUNT_NAME;
    end;

    Result := True;

  end;

end;

procedure TBaseServerClass.AfterExecuteMethod;
begin
  if CloseSession then
    GetInvocationMetaData.CloseSession := True;
end;

function TCrudDO.AfterSaveToDB(AObject: TModApp): Boolean;
begin
  inherited;

  Result := False;

  if UpdateStatusPO(AObject) then
    Result := True;

end;

function TCrudDO.BeforeSaveToDB(AObject: TModApp): Boolean;
begin
  Result := False;

  with AObject as TModDO do
  begin
    if (AObject.ID = '') then
    begin
      DO_NP := GenerateNP(TModDO(AObject));
      if DO_NP = '' then
        Exit;
    end;
  end;

  Result := True;
end;

function TCrudDO.GenerateNP(AModDO: TModDO): string;
var
  iCounter: Integer;
  sSQL: string;
begin
  Result := 'M' + FormatDateTime('YYMMDD', AModDO.DO_DATE);

  sSQL   := 'select right(MAX(DO_NP),3) as NP from DO ' +
            ' where DO_NP like ' + QuotedStr(Result + '%');

  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      if Fields[0].IsNull then
        iCounter := 0
      else
        iCounter := StrToIntDef(Fields[0].AsString,0);

      iCounter := iCounter + 1;
      Result   := Result + RightStr('000' + IntToStr(iCounter),3);
    finally
      Free;
    end;
  end;
end;

function TCrudDO.RetrieveByPO(APONO : String): TModDO;
var
  sIDDO: string;
  sSQL: string;
begin
  Result := nil;

  sSQL   := 'select a.DO_ID from DO a ' +
            ' inner join PO b on a.PO_ID = b.PO_ID' +
            ' where b.PO_NO = ' + QuotedStr(APONO);

  sIDDO := '';
  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      while not Eof do
      begin
        sIDDO := FieldByName('DO_ID').AsString;
        Next;
      end;
    finally
      Free;
    end;
  end;

  if sIDDO = '' then
    Exit;

  Result := TModDO(Retrieve(TModDO.ClassName, sIDDO));
end;

function TCrudDO.UpdateStatusPO(AObject: TModApp): Boolean;
var
  sSQL: string;
begin
  try
    sSQL := 'update a set a.REF$STATUS_PO_ID = (select REF$STATUS_PO_ID from REF$STATUS_PO' +
            ' where STAPO_NAME = ''GENERATED'') from PO a' +
            ' left join DO b on a.PO_ID = b.PO_ID' +
            ' left join REF$STATUS_PO c on a.REF$STATUS_PO_ID = c.REF$STATUS_PO_ID' +
            ' where b.PO_ID is null' +
            ' and c.STAPO_NAME not in (''CANCEL'',''CLOSE'')';

    TDBUtils.ExecuteSQL(sSQL, False);

    sSQL := 'update a set a.REF$STATUS_PO_ID = (select REF$STATUS_PO_ID from REF$STATUS_PO' +
            ' where STAPO_NAME = ''RECEIVED'') from PO a' +
            ' inner join DO b on a.PO_ID = b.PO_ID' +
            ' where b.do_id = ' + QuotedStr(AObject.ID);

    TDBUtils.ExecuteSQL(sSQL, False);
    Result := True;
  except
    Result := False;
  end;


end;

function TCrudCN.AfterSaveToDB(AObject: TModApp): Boolean;
var
  i: Integer;
  lCN: TModCNRecv;
  lSS: TStrings;
begin
  lCN := TModCNRecv(AObject);
  lSS := TStringList.Create;
  Try
    for i := 0 to lCN.CNR_CNRDITEMS.Count-1 do
    begin
      lSS.Append(
        'Update ' + TModDOItem.GetTableName
        + ' Set DOD_QTY_ORDER_RECV_CN = DOD_QTY_ORDER_RECV_CN + '  + FloatToStr(lCN.CNR_CNRDITEMS[i].CNRD_QTY)
        + ' Where PO_DETAIL_ID = ' + QuotedStr(lCN.CNR_CNRDITEMS[i].PO_DETAIL.ID) + ';'
      );
    end;
    TDBUtils.ExecuteSQL(lSS, False);
  Finally
    lSS.Free;
  End;
  Result := True;
end;

function TCrudCN.BeforeDeleteFromDB(AObject: TModApp): Boolean;
begin
  Result := self.BeforeSaveToDB(AObject);
end;

function TCrudCN.BeforeSaveToDB(AObject: TModApp): Boolean;
var
  i: Integer;
  lOldCN: TModCNRecv;
  lSS: TStrings;
begin
  if AObject.ID = '' then
  begin
    Result := True;
    exit;
  end;

  lOldCN := Self.Retrieve(TModCNRecv, TModCNRecv(AObject).ID) as TModCNRecv;
  lSS := TStringList.Create;
  Try
    for i := 0 to lOldCN.CNR_CNRDITEMS.Count-1 do
    begin
      lSS.Append(
        'Update ' + TModDOItem.GetTableName
        + ' Set DOD_QTY_ORDER_RECV_CN = DOD_QTY_ORDER_RECV_CN - '  + FloatToStr( lOldCN.CNR_CNRDITEMS[i].CNRD_QTY)
        + ' Where PO_DETAIL_ID = ' + QuotedStr(lOldCN.CNR_CNRDITEMS[i].PO_DETAIL.ID) + ';'
      );
    end;
    TDBUtils.ExecuteSQL(lSS, False);
  Finally
    lSS.Free;
  End;
  Result := True;
end;

end.
