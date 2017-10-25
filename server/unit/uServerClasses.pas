unit uServerClasses;

interface

uses
  System.Classes, uModApp, uDBUtils, Rtti, Data.DB, SysUtils, StrUtils, uModSO,
  uModSuplier, Datasnap.DBClient, uModUnit, uModBarang, uModDO, uModSettingApp,
  uModQuotation, uModBankCashOut, System.Generics.Collections, uModClaimFaktur,
  uModContrabonSales, System.DateUtils, System.JSON, uModAR, uModRekening,
  uModOrganization, System.JSON.Types, uModCustomerInvoice, uModPO;

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
    function AfterSaveToDB(AObject: TModApp): Boolean; virtual;
    function BeforeDeleteFromDB(AObject: TModApp): Boolean; virtual;
    function BeforeSaveToDB(AObject: TModApp): Boolean; virtual;
    function DeleteFromDBTrans(AObject: TModApp; DoCommit: Boolean): Boolean;
    function GenerateCustomNo(aTableName, aFieldName: string; aCountDigit: Integer
        = 11): String; virtual;
    function Retrieve(ModAppClass: TModAppClass; AID: String; LoadObjectList:
        Boolean = True): TModApp; overload;
    function SaveToDBTrans(AObject: TModApp; DoCommit: Boolean): Boolean;
    function ValidateCode(AOBject: TModApp): Boolean;
  public
    function CreateTableSQL(AModAPP : TModApp): string; overload;
    function CreateTableSQLByClassName(AClassName : String): string; overload;
    function DeleteFromDB(AObject: TModApp): Boolean;
    function GenerateNo(aClassName: string): String; overload;
    function OpenQuery(S: string): TDataSet;
    function Retrieve(ModClassName, AID: string): TModApp; overload;
    function RetrieveByCode(ModClassName, aCode: string): TModApp; overload;
    function RetrieveSingle(ModClassName, AID: string): TModApp; overload;
    function SaveBatch(AObjectList: TObjectList<TModApp>): Boolean;
    function SaveToDB(AObject: TModApp): Boolean;
    function SaveToDBID(AObject: TModApp): String;
    function SaveToDBLog(AObject: TModApp): Boolean;
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
  private
    function ValidateCodeOnObject(AObject: TModApp): Boolean;
  public
    function BeforeSaveToDB(AObject: TModApp): Boolean; override;
  end;

  TCrudDO = class(TCrud)
  private
    function GenerateNP(AModDO: TModDO): string;
    function IsPOSudahDO(ADO : TModDO): Boolean;
    function UpdateStatusPO(AObject: TModApp): Boolean;
  protected
    function AfterSaveToDB(AObject: TModApp): Boolean; override;
    function BeforeSaveToDB(AObject: TModApp): Boolean; override;
  public
    function RetrieveByPO(APONO : String): TModDO;
  end;

  TCrudCNRecv = class(TCrud)
  protected
    function AfterSaveToDB(AObject: TModApp): Boolean; override;
    function BeforeDeleteFromDB(AObject: TModApp): Boolean; override;
    function BeforeSaveToDB(AObject: TModApp): Boolean; override;
  end;

  TCrudDNRecv = class(TCrud)
  protected
    function AfterSaveToDB(AObject: TModApp): Boolean; override;
    function BeforeDeleteFromDB(AObject: TModApp): Boolean; override;
    function BeforeSaveToDB(AObject: TModApp): Boolean; override;
  end;

  TCrudSettingApp = class(TCrud)
  public
    function RetrieveByCabang(ACabang : TModUnit): TModSettingApp;
  end;

  TCrudQuotation = class(TCrud)
  private
    function GenerateActivateSQL(AModQuotation: TModQuotation): TStrings;
  public
    function ActivateQuotation(AModQuotation: TModQuotation): Boolean;
  end;

  TCrudClaimFaktur = class(TCrud)
  private
    function GenerateUpdateIsClaim(IsClaim: Integer; AClaim: TModClaimFaktur):
        TStrings;
    procedure UpdateIsClaim(IsClaim: Integer; aClaim: TModClaimFaktur);
  protected
    function AfterSaveToDB(AObject: TModApp): Boolean; override;
    function BeforeDeleteFromDB(AObject: TModApp): Boolean; override;
    function BeforeSaveToDB(AObject: TModApp): Boolean; override;
  end;

  TCrudBankCashOut = class(TCrud)
  private
    function UpdateAPTerbayar(AModBankCashOut : TModBankCashOut; AIsTambah :
        Boolean): Boolean;
    function UpdateARTerbayar(AModBankCashOut : TModBankCashOut; AIsTambah :
        Boolean): Boolean;
  protected
    function AfterSaveToDB(AObject: TModApp): Boolean; override;
    function BeforeDeleteFromDB(AObject: TModApp): Boolean; override;
    function BeforeSaveToDB(AObject: TModApp): Boolean; override;
  end;

  TCrudUpdatePOS = class(TCrud)
  private
    function SinkronToDB(AObject: TModApp): Boolean;
  public
    function RetreiveSyncronData(ModClassName, aFilter: string): TDataSet;
    function UpdateToDB(aDS: TDataSet; ModClassName: string): Boolean;
  end;

  TCrudAdjFaktur = class(TCrud)
  protected
    function AfterSaveToDB(AObject: TModApp): Boolean; override;
    function BeforeDeleteFromDB(AObject: TModApp): Boolean; override;
    function BeforeSaveToDB(AObject: TModApp): Boolean; override;
  end;

  TCrudContrabonSales = class(TCrud)
  public
    function IsTanggalSudahDiinput(AModContrabonSales : TModContrabonSales):
        Boolean;
  end;

  TJSONCRUD = class(TBaseServerClass)
  private
    FCRUD: TCrud;
  protected
    function GetCRUD: TCrud;
    function ModToJSON(aModApp: TModApp): TJSONObject;
    property CRUD: TCrud read GetCRUD write FCRUD;
  public
    function Test: TJSONObject;
  end;

  TCrudCustomerInvoice = class(TCrud)
  protected
    function BeforeDeleteFromDB(AObject: TModApp): Boolean; override;
    function BeforeSaveToDB(AObject: TModApp): Boolean; override;
  end;

  TCrudPOTrader = class(TCrud)
  end;

  TCrudBarangHargaJual = class(TCrud)
  protected
    function AfterSaveToDB(AObject: TModApp): Boolean; override;
  end;

  TCrudKuponBotol = class(TCrud)
  protected
    function GenerateCustomNo(aTableName, aFieldName: string; aCountDigit: Integer
        = 11): String; override;
  end;

  TCrudCrazyPrice = class(TCrud)
  end;

{$METHODINFO OFF}

const
  CloseSession : Boolean = True;

implementation

uses
  Datasnap.DSSession, Data.DBXPlatform, uModCNRecv, uModDNRecv,
  uModAdjustmentFaktur, Variants, uModBank, uJSONUtils;

function TTestMethod.Hallo(aTanggal: TDateTime): String;
begin
  Result := 'Hello Word ' + DateToStr(aTanggal);
end;

function TCrud.AfterSaveToDB(AObject: TModApp): Boolean;
begin
  Result := True;
end;

function TCrud.BeforeDeleteFromDB(AObject: TModApp): Boolean;
begin
  Result := True;
end;

function TCrud.BeforeSaveToDB(AObject: TModApp): Boolean;
begin
  Result := True;
end;

function TCrud.CreateTableSQL(AModAPP : TModApp): string;
begin
  Result := TDBUtils.GetSQLCreate(AModAPP);
end;

function TCrud.CreateTableSQLByClassName(AClassName : String): string;
var
  AObject: TObject;
  C : TRttiContext;
begin
  AObject := (C.FindType(AClassName) as TRttiInstanceType).MetaClassType.Create;
  Result := CreateTableSQL(TModApp(AObject));
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

function TCrud.DeleteFromDBTrans(AObject: TModApp; DoCommit: Boolean): Boolean;
var
  lSS: TStrings;
begin
  Result := False;
  if not BeforeDeleteFromDB(AObject) then exit;
  lSS := TDBUtils.GenerateSQLDelete(AObject);
  Try
    Try
      TDBUtils.ExecuteSQL(lSS, False);
      if DoCommit then TDBUtils.Commit;
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
    Result := GenerateCustomNo(lObj.GetTableName, lObj.GetCodeField);
  Finally
    AfterExecuteMethod;
    lObj.Free;
  End;
end;

function TCrud.OpenQuery(S: string): TDataSet;
begin
  Result := TDBUtils.OpenQuery(S);
  AfterExecuteMethod;
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

function TCrud.Retrieve(ModAppClass: TModAppClass; AID: String; LoadObjectList:
    Boolean = True): TModApp;
begin
  Result := ModAppClass.Create;
  TDBUtils.LoadFromDB(Result, AID, LoadObjectList);
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

function TCrud.SaveBatch(AObjectList: TObjectList<TModApp>): Boolean;
var
  I: Integer;
begin
//  Result := False;

  try
    for I := 0 to AObjectList.Count - 1 do
    begin
      SaveToDBTrans(AObjectList[i], False);
    end;

    TDBUtils.Commit;
    Result := True;
  except
    raise;
  end;

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

function TCrud.SaveToDBTrans(AObject: TModApp; DoCommit: Boolean): Boolean;
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
      if DoCommit then
        TDBUtils.Commit;
      Result := True
    except
      TDBUtils.RollBack;
      raise;
    End;
  Finally
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
  if AObject.PropFromAttr(AttributeOfCode, False) = nil then exit;
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
  I: Integer;
begin
  Result := False;

  if not ValidateCodeOnObject(AObject) then
    Exit;

  lModSupplier := TModSuplier(AObject);
  for I := 0 to lModSupplier.SuplierMerchanGroups.Count - 1 do
  begin
    if not ValidateCode(lModSupplier.SuplierMerchanGroups[i]) then
    Exit;

    if lModSupplier.SuplierMerchanGroups[i].SUPMG_IS_DIF_CONTACT = 0 then
    begin
      lModSupplier.SuplierMerchanGroups[i].SUPMG_ADDRESS := lModSupplier.SUP_ADDRESS;
      lModSupplier.SuplierMerchanGroups[i].SUPMG_CITY := lModSupplier.SUP_CITY;
      lModSupplier.SuplierMerchanGroups[i].SUPMG_TELP := lModSupplier.SUP_TELP;
      lModSupplier.SuplierMerchanGroups[i].SUPMG_FAX := lModSupplier.SUP_FAX;
      lModSupplier.SuplierMerchanGroups[i].SUPMG_POST_CODE := lModSupplier.SUP_POST_CODE;
      lModSupplier.SuplierMerchanGroups[i].SUPMG_CONTACT_PERSON := lModSupplier.SUP_CONTACT_PERSON;
      lModSupplier.SuplierMerchanGroups[i].SUPMG_EMAIL := lModSupplier.SUP_EMAIL;
      lModSupplier.SuplierMerchanGroups[i].SUPMG_TITLE := lModSupplier.SUP_TITLE;
      lModSupplier.SuplierMerchanGroups[i].SUPMG_BANK_ACCOUNT_NO := lModSupplier.SUP_BANK_ACCOUNT_NO;
      lModSupplier.SuplierMerchanGroups[i].BANK := lModSupplier.BANK;
      lModSupplier.SuplierMerchanGroups[i].SUPMG_BANK_ACCOUNT_NAME := lModSupplier.SUP_BANK_ACCOUNT_NAME;
    end;

    Result := True;

  end;

end;

function TCrudSupplier.ValidateCodeOnObject(AObject: TModApp): Boolean;
var
  lModSupplier: TModSuplier;
  I: Integer;
  j: Integer;
begin
  lModSupplier := TModSuplier(AObject);
  for I := 0 to lModSupplier.SuplierMerchanGroups.Count - 1 do
  begin
    for j := i + 1 to lModSupplier.SuplierMerchanGroups.Count - 1 do
    begin
      if lModSupplier.SuplierMerchanGroups[i].SUPMG_SUB_CODE = lModSupplier.SuplierMerchanGroups[j].SUPMG_SUB_CODE then
      begin
        raise Exception.Create('Kode Supplier Merchandise Group Double : ' + lModSupplier.SuplierMerchanGroups[i].SUPMG_SUB_CODE);
      end;
    end;
  end;

  Result := True;
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

  if IsPOSudahDO(TModDO(AObject)) then
  begin
    raise Exception.Create('PO Sudah diterima dengan DO yang lain');
  end;


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

function TCrudDO.IsPOSudahDO(ADO : TModDO): Boolean;
var
  sSQL: string;
begin
  Result := False;

  sSQL   := 'select COUNT(a.PO_ID) from PO a ' +
            ' inner join DO b on a.PO_ID = b.PO_ID ' +
            ' where a.PO_ID = ' + QuotedStr(ADO.PO.ID);

  if ADO.ID <> '' then
    sSQL := sSQL + ' and b.DO_ID <> ' + QuotedStr(ADO.ID);

  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      if Fields[0].AsInteger > 0 then
        Result := True;
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

function TCrudCNRecv.AfterSaveToDB(AObject: TModApp): Boolean;
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
        + ' Set DOD_QTY_ORDER_RECV_CN = DOD_QTY_ORDER_RECV_CN + '
        + FloatToStr(lCN.CNR_CNRDITEMS[i].CNRD_QTY)
        + ' Where PO_DETAIL_ID = ' + QuotedStr(lCN.CNR_CNRDITEMS[i].PO_DETAIL.ID) + ';'
      );
    end;
    TDBUtils.ExecuteSQL(lSS, False);
  Finally
    lSS.Free;
  End;
  Result := True;
end;

function TCrudCNRecv.BeforeDeleteFromDB(AObject: TModApp): Boolean;
begin
  Result := self.BeforeSaveToDB(AObject);
end;

function TCrudCNRecv.BeforeSaveToDB(AObject: TModApp): Boolean;
var
  i: Integer;
  lAppClass: TModAppClass;
  lOldCN: TModCNRecv;
  lSS: TStrings;
begin
  if AObject.ID = '' then
  begin
    Result := True;
    exit;
  end;
  lAppClass := TModAppClass(AObject.ClassType);

  lOldCN := Self.Retrieve(lAppClass, TModCNRecv(AObject).ID) as TModCNRecv;
  lSS := TStringList.Create;

  Try
    for i := 0 to lOldCN.CNR_CNRDITEMS.Count-1 do
    begin
      lSS.Append(
        'Update ' + TModDOItem.GetTableName
        + ' Set DOD_QTY_ORDER_RECV_CN = DOD_QTY_ORDER_RECV_CN - '
        + FloatToStr( lOldCN.CNR_CNRDITEMS[i].CNRD_QTY)
        + ' Where PO_DETAIL_ID = ' + QuotedStr(lOldCN.CNR_CNRDITEMS[i].PO_DETAIL.ID) + ';'
      );
    end;
    TDBUtils.ExecuteSQL(lSS, False);
  Finally
    lSS.Free;
  End;
  Result := True;
end;

function TCrudDNRecv.AfterSaveToDB(AObject: TModApp): Boolean;
var
  i: Integer;
  lDN: TModDNRecv;
  lSS: TStrings;
begin
  lDN := TModDNRecv(AObject);
  lSS := TStringList.Create;
  Try
    for i := 0 to lDN.DNR_DNRDITEMS.Count-1 do
    begin
      lSS.Append(
        'Update ' + TModDOItem.GetTableName
        + ' Set DOD_QTY_ORDER_RECV_DN = DOD_QTY_ORDER_RECV_DN + '
        + FloatToStr(lDN.DNR_DNRDITEMS[i].DNRD_QTY)
        + ' Where PO_DETAIL_ID = ' + QuotedStr(lDN.DNR_DNRDITEMS[i].PO_DETAIL.ID) + ';'
      );
    end;
    TDBUtils.ExecuteSQL(lSS, False);
  Finally
    lSS.Free;
  End;
  Result := True;
end;

function TCrudDNRecv.BeforeDeleteFromDB(AObject: TModApp): Boolean;
begin
  Result := self.BeforeSaveToDB(AObject);
end;

function TCrudDNRecv.BeforeSaveToDB(AObject: TModApp): Boolean;
var
  i: Integer;
  lAppClass: TModAppClass;
  lOldDN: TModDNRecv;
  lSS: TStrings;
begin
  if AObject.ID = '' then
  begin
    Result := True;
    exit;
  end;
  lAppClass := TModAppClass(AObject.ClassType);

  lOldDN := Self.Retrieve(lAppClass, TModDNRecv(AObject).ID) as TModDNRecv;
  lSS := TStringList.Create;

  Try
    for i := 0 to lOldDN.DNR_DNRDITEMS.Count-1 do
    begin
      lSS.Append(
        'Update ' + TModDOItem.GetTableName
        + ' Set DOD_QTY_ORDER_RECV_DN = DOD_QTY_ORDER_RECV_DN - '
        + FloatToStr( lOldDN.DNR_DNRDITEMS[i].DNRD_QTY)
        + ' Where PO_DETAIL_ID = ' + QuotedStr(lOldDN.DNR_DNRDITEMS[i].PO_DETAIL.ID) + ';'
      );
    end;
    TDBUtils.ExecuteSQL(lSS, False);
  Finally
    lSS.Free;
  End;
  Result := True;
end;

function TCrudSettingApp.RetrieveByCabang(ACabang : TModUnit): TModSettingApp;
var
  sSQL: string;
begin
  Result := TModSettingApp.Create;

  if ACabang = nil then
    Exit;

  sSQL   := 'select SETTINGAPP_ID from SETTINGAPP' +
            ' where AUT$UNIT_ID = ' + QuotedStr(ACabang.ID);

  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      if Fields[0].AsString <> '' then
      begin
        FreeAndNil(Result);
        Result := TModSettingApp(Retrieve(TModSettingApp.ClassName, Fields[0].AsString));
      end;
    finally
      Free;
    end;
  end;
end;

function TCrudQuotation.ActivateQuotation(AModQuotation: TModQuotation): Boolean;
var
  lSS: TStrings;
begin
  Result := False;
  lSS := Self.GenerateActivateSQL(AModQuotation);
  Try
    Try
      TDBUtils.ExecuteSQL(lSS, False);
      TDBUtils.Commit;
      Result := True;
      AfterExecuteMethod;
    except
      lSS.SaveToFile(AModQuotation.ClassName + '_ErrorSQL.log');
      TDBUtils.RollBack;
      raise;
    End;
  Finally
    lSS.Free;
  End;
end;

function TCrudQuotation.GenerateActivateSQL(AModQuotation: TModQuotation): TStrings;
var
  i: Integer;
  lBHJ: TModBarangHargaJual;
  lBS: TModBarangSupplier;
  lDetail: TModQuotationDetail;
begin
  Result := TStringList.Create;

  //harga beli - header
  for i := 0 to AModQuotation.Details.Count-1 do
  begin
    lDetail := AModQuotation.Details[i];
    if lDetail.IsSellingPrice = 1 then continue;
    lBS := Self.Retrieve(TModBarangSupplier, lDetail.BarangSupplier.ID) as TModBarangSupplier;
    lBHJ := TModBarangHargaJual.Create;
    Try
      lDetail.SetBarangSupplier(lBS);
      Result.Add('Update '+lBS.GetTableName + ' set BRGSUP_IS_PRIMARY = 0 where barang_id = ' + QuotedStr(lDetail.Barang.ID));
      Result.Add(TDBUtils.GetSQLUpdate(lBS));
      Result.Add(Format(SQL_Delete,[lBHJ.GetTableName, lBHJ.GetHeaderField + '=' + QuotedStr(lDetail.Barang.ID)]) );

      //PR

    Finally
      FreeAndNil(lBS);
      FreeAndNil(lBHJ);
    End;
  end;


  for i := 0 to AModQuotation.Details.Count-1 do
  begin
    lDetail := AModQuotation.Details[i];
    if lDetail.IsSellingPrice <> 1 then continue;
    lBHJ := TModBarangHargaJual.Create;
    Try
      lDetail.SetBarangHargaJual(lBHJ);
      Result.Add(TDBUtils.GetSQLInsert(lBHJ));
    Finally
      FreeAndNil(lBHJ);
    End;
  end;
  AModQuotation.IsProcessed := 1;
  Result.Add(TDBUtils.GetSQLUpdate(AModQuotation));

  Result.SaveToFile('d:\debugquot.txt');
end;

function TCrudClaimFaktur.AfterSaveToDB(AObject: TModApp): Boolean;
begin
  UpdateIsClaim(1, TModClaimFaktur(AObject));
  Result := True;
end;

function TCrudClaimFaktur.BeforeDeleteFromDB(AObject: TModApp): Boolean;
var
  lClaim: TModClaimFaktur;
  lCrud: TCrud;
begin
  lClaim := TModClaimFaktur(AObject);
  if not Assigned(lClaim.CLM_AP) then
  begin
    Result := True;
    exit;
  end;
  lCrud := TCrud.Create(Self);
  Try
    UpdateIsClaim(0, lClaim);
    Result := lCrud.DeleteFromDBTrans(lClaim.CLM_AP, False);
  Finally
    lCrud.Free;
  End;
end;

function TCrudClaimFaktur.BeforeSaveToDB(AObject: TModApp): Boolean;
var
  lClaim: TModClaimFaktur;
  lCrud: TCrud;
begin
  lClaim := TModClaimFaktur(AObject);
  lClaim.UpdateAP; //lCLAIM.CLM_AP.ID set here
  //avoid recalling BeforeSaveToDB

  lCrud := TCrud.Create(Self);
  Try
    UpdateIsClaim(0, lClaim);
    Result := lCrud.SaveToDBTrans(lClaim.CLM_AP, False);
  Finally
    lCrud.Free;
  End;
end;

function TCrudClaimFaktur.GenerateUpdateIsClaim(IsClaim: Integer; AClaim:
    TModClaimFaktur): TStrings;
var
  lStatusPO: string;
begin
  Result := TStringList.Create;

  Result.Append(
    'UPDATE C SET C.DO_IS_CLAIM = ' + IntToStr(IsClaim)
    + ' FROM CLAIMFAKTUR A'
    + ' INNER JOIN CLAIMFAKTURITEMDO B ON A.CLAIMFAKTUR_ID = B.CLMD_DO_CLAIMFAKTUR_ID'
    + ' INNER JOIN DO C ON B.CLMD_DO_ID = C.DO_ID'
    + ' WHERE A.CLAIMFAKTUR_ID=' + QuotedStr(AClaim.ID)
  );

  if (IsClaim = 1) then
    lStatusPO := PO_STATUS_CODE_CLAIM
  else
    lStatusPO := PO_STATUS_CODE_RECV;

  Result.Append(
    'UPDATE C SET C.REF$STATUS_PO_ID = '
    + ' (SELECT TOP 1 REF$STATUS_PO_ID FROM REF$STATUS_PO WHERE STAPO_CODE = '
    + QuotedStr(lStatusPO) + ')'
    + ' FROM CLAIMFAKTUR A'
    + ' INNER JOIN CLAIMFAKTURITEMDO B ON A.CLAIMFAKTUR_ID = B.CLMD_DO_CLAIMFAKTUR_ID'
    + ' INNER JOIN PO C ON B.CLMD_DO_PO_ID = C.PO_ID'
    + ' WHERE A.CLAIMFAKTUR_ID=' + QuotedStr(AClaim.ID)
  );

  Result.Append(
    'UPDATE C SET C.CNR_IS_CLAIM = ' + IntToStr(IsClaim)
    + ' FROM CLAIMFAKTUR A'
    + ' INNER JOIN CLAIMFAKTURITEMCN B ON A.CLAIMFAKTUR_ID = B.CLMD_CN_CLAIMFAKTUR_ID'
    + ' INNER JOIN CN_RECV C ON B.CLMD_CN_CNRECV_ID = C.CN_RECV_ID'
    + ' WHERE A.CLAIMFAKTUR_ID=' + QuotedStr(AClaim.ID)
  );

  Result.Append(
    'UPDATE C SET C.DNR_IS_CLAIM = ' + IntToStr(IsClaim)
    + ' FROM CLAIMFAKTUR A'
    + ' INNER JOIN CLAIMFAKTURITEMDN B ON A.CLAIMFAKTUR_ID = B.CLMD_DN_CLAIMFAKTUR_ID'
    + ' INNER JOIN DN_RECV C ON B.CLMD_DN_DNRECV_ID = C.DN_RECV_ID'
    + ' WHERE A.CLAIMFAKTUR_ID=' + QuotedStr(AClaim.ID)
  );


  Result.Append(
    'UPDATE C SET C.CONT_IS_CLAIM = ' + IntToStr(IsClaim)
    + ' FROM CLAIMFAKTUR A'
    + ' INNER JOIN CLAIMFAKTURITEMCS B ON A.CLAIMFAKTUR_ID = B.CLMD_CS_CLAIMFAKTUR_ID'
    + ' INNER JOIN CONTRABON_SALES C ON B.CLMD_CS_CONTRABON_ID = C.CONTRABON_SALES_ID'
    + ' WHERE A.CLAIMFAKTUR_ID=' + QuotedStr(AClaim.ID)
  );
end;

procedure TCrudClaimFaktur.UpdateIsClaim(IsClaim: Integer; aClaim:
    TModClaimFaktur);
var
  lSS: TStrings;
begin
  if (aClaim.ID = '') then exit;
  lSS := GenerateUpdateIsClaim(IsClaim, aClaim);
  Try
    TDBUtils.ExecuteSQL(lSS, False);
  Finally
    lSS.Free;
  End;
end;

function TCrudBankCashOut.AfterSaveToDB(AObject: TModApp): Boolean;
begin
  Result := UpdateAPTerbayar(TModBankCashOut(AObject), True);
  if Result then
    Result := UpdateARTerbayar(TModBankCashOut(AObject), True);
end;

function TCrudBankCashOut.BeforeDeleteFromDB(AObject: TModApp): Boolean;
begin
  Result := UpdateAPTerbayar(TModBankCashOut(AObject), False);
  if Result then
    Result := UpdateARTerbayar(TModBankCashOut(AObject), False);
end;

function TCrudBankCashOut.BeforeSaveToDB(AObject: TModApp): Boolean;
begin
  if AObject.ID = '' then
    TModBankCashOut(AObject).BCO_NoBukti := 'BKK-' + GenerateNo(TModBankCashOut.ClassName);

  Result := UpdateAPTerbayar(TModBankCashOut(AObject), False);

  if Result then
    Result := UpdateARTerbayar(TModBankCashOut(AObject), False);
end;

function TCrudBankCashOut.UpdateAPTerbayar(AModBankCashOut : TModBankCashOut;
    AIsTambah : Boolean): Boolean;
var
  sFilterID: string;
  sOperator: string;
  sSQL: string;
begin
  if AModBankCashOut.ID = '' then
    sFilterID := 'newid()'
  else
    sFilterID := QuotedStr(AModBankCashOut.ID);

  if AIsTambah then
    sOperator := ' + '
  else
    sOperator := ' - ';


  sSQL := ' update a set a.AP_PAID = a.AP_PAID ' + sOperator + ' b.BCOAP_Nominal ' +
          ' from ap a' +
          ' INNER JOIN BankCashOutAPItem b on b.BCOAP_AP_ID = a.AP_ID ' +
          ' where b.BCOAP_BankCashOut_ID = ' + sFilterID;

  try
    TDBUtils.ExecuteSQL(sSQL);
    Result := True;
  except
    raise
  end;


end;

function TCrudBankCashOut.UpdateARTerbayar(AModBankCashOut : TModBankCashOut;
    AIsTambah : Boolean): Boolean;
var
  sFilterID: string;
  sOperator: string;
  sSQL: string;
begin
  if AModBankCashOut.ID = '' then
  begin
    Result := True;
    exit;
  end;

  sFilterID := QuotedStr(AModBankCashOut.ID);

  if AIsTambah then
    sOperator := ' + '
  else
    sOperator := ' - ';


  sSQL := ' update a set a.AR_PAID = a.AR_PAID ' + sOperator + ' b.BCOAR_Nominal ' +
          ' from aR a' +
          ' INNER JOIN BankCashOutARItem b on b.BCOAR_AR_ID = a.AR_ID ' +
          ' where b.BCOAR_BankCashOut_ID = ' + sFilterID;

  try
    TDBUtils.ExecuteSQL(sSQL);
    Result := True;
  except
    raise
  end;


end;

function TCrudAdjFaktur.AfterSaveToDB(AObject: TModApp): Boolean;
var
  lAdj: TModAdjustmentFaktur;
  lSS: TStrings;
begin
  lAdj := TModAdjustmentFaktur(AObject);
  lSS := TStringList.Create;
  Try
    lSS.Append(
        'Update ' + TModDO.GetTableName
        + ' Set DO_ADJUSTMENT = ' + FloatToStr(lAdj.ADJFAK_TOTAL_ADJ)
        + ' , DO_ADJUSTMENT_PPN = ' + FloatToStr(lAdj.ADJFAK_PPN_ADJ)
        + ' , DO_ADJUSTMENT_DISC = ' + FloatToStr(lAdj.ADJFAK_DISC_ADJ)
        + ' Where DO_ID = ' + QuotedStr(lAdj.ADJFAK_DO.ID) + ';'
      );
    TDBUtils.ExecuteSQL(lSS, False);
  Finally
    lSS.Free;
  End;
  Result := True;
end;

function TCrudAdjFaktur.BeforeDeleteFromDB(AObject: TModApp): Boolean;
var
  lAdj: TModAdjustmentFaktur;
  lSS: TStrings;
begin
  if AObject.ID = '' then
  begin
    Result := True;
    exit;
  end;

  lAdj := TModAdjustmentFaktur(AObject);
  lSS := TStringList.Create;
  Try
    lSS.Append(
        'Update B Set B.DO_ADJUSTMENT = 0'
        + ' , B.DO_ADJUSTMENT_PPN = 0'
        + ' , B.DO_ADJUSTMENT_DISC = 0'
        + ' FROM ADJUSTMENT_FAKTUR A'
        + ' INNER JOIN DO B ON A.DO_ID=B.DO_ID'
        + ' Where A.ADJUSTMENT_FAKTUR_ID = ' + QuotedStr(lAdj.ID) + ';'
      );
    TDBUtils.ExecuteSQL(lSS, False);
  Finally
    lSS.Free;
  End;
  Result := True;
end;

function TCrudAdjFaktur.BeforeSaveToDB(AObject: TModApp): Boolean;
begin
  Result := BeforeDeleteFromDB(AObject);
end;

function TCrudUpdatePOS.RetreiveSyncronData(ModClassName, aFilter: string):
    TDataSet;
var
  lClass: TModAppClass;
  sSQL: string;
begin
  lClass := Self.StringToClass(ModClassName);
  If not Assigned(lClass) then
    Raise Exception.Create('Class ' + ModClassName + ' not found');

  sSQL := ' select * from ' + lClass.GetTableName;
  if aFilter <> '' then
    sSQL := sSQL + ' where ' + aFilter;

  Result := TDBUtils.OpenQuery(sSQL);
  AfterExecuteMethod;
end;

function TCrudUpdatePOS.SinkronToDB(AObject: TModApp): Boolean;
var
  lSS: TStrings;
begin
  Result := False;
  if not ValidateCode(AObject) then exit;
  lSS := TDBUtils.GenerateSQL(AObject, True);
  Try
    Try
      TDBUtils.ExecuteSQL(lSS, False);

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

function TCrudUpdatePOS.UpdateToDB(aDS: TDataSet; ModClassName: string):
    Boolean;
var
  lMod: TModApp;
begin
  Result := False;
  lMod   := Retrieve(ModClassName, '00000000-0000-0000-0000-000000000000');

  try
    while not aDS.Eof do
    begin
      TDBUtils.LoadFromDataset(lMod, aDS, False);
      if not SinkronToDB(lMod) then
        Exit;

      aDS.Next
    end;
    Result := True;
  finally
    lMod.Free;
    AfterExecuteMethod;
  end;
end;

function TCrudContrabonSales.IsTanggalSudahDiinput(AModContrabonSales :
    TModContrabonSales): Boolean;
var
  sID: string;
  sSQL: string;
begin
  Result := False;

  if AModContrabonSales = nil then
    Exit;

  if AModContrabonSales.ID = '' then
    sID := 'newid()'
  else
    sID := QuotedStr(AModContrabonSales.ID);

  sSQL := 'select count(CONTRABON_SALES_ID) ' +
          ' from CONTRABON_SALES ' +
          ' where CONT_ORGANIZATION_ID = ' + QuotedStr(AModContrabonSales.CONT_ORGANIZATION.ID) +
          ' and CONTRABON_SALES_ID <> ' + sID +
          ' and CONT_DATE_SALES between ' + TDBUtils.QuotDt(StartOfTheDay(AModContrabonSales.CONT_DATE_SALES))  +
          ' and ' + TDBUtils.QuotDt(EndOfTheDay(AModContrabonSales.CONT_DATE_SALES));

  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      if Fields[0].AsInteger > 0 then
        Result := True;
    finally
      Free;
    end;
  end;
end;

function TJSONCRUD.GetCRUD: TCrud;
begin
  if not Assigned(FCRUD) then
    FCRUD := TCrud.Create(Self);
  Result := FCRUD;
end;

function TJSONCRUD.ModToJSON(aModApp: TModApp): TJSONObject;
begin
  Result := TJSONObject.Create;
end;

function TJSONCRUD.Test: TJSONObject;
var
  lModCNR : TModCNRecv;
  sID: string;
begin
  sID := 'D21144E2-31DF-4995-BECC-4D0E5DD1DB48';
  lModCNR := Self.CRUD.Retrieve(TModCNRecv.ClassName, sID) as TModCNRecv;
  try
    Result := TJSONUtils.ModelToJSON(lModCNR);
  finally
    lModCNR.Free;
  end;
end;

function TCrudCustomerInvoice.BeforeDeleteFromDB(AObject: TModApp): Boolean;
var
  lCI: TModCustomerInvoice;
  lcrud: TCrud;
begin
  Result := False;

  if AObject = nil then
    Exit;

  lCI := TModCustomerInvoice(AObject);

  lcrud := TCrud.Create(nil);
  try
    if not lcrud.DeleteFromDBTrans(lCI.CI_AR, False) then
      Exit;
  finally
    lcrud.Free;
  end;

  Result := True;
end;

function TCrudCustomerInvoice.BeforeSaveToDB(AObject: TModApp): Boolean;
var
  lCI: TModCustomerInvoice;
  lcrud: TCrud;
begin

  Result := False;

  if AObject = nil then
    Exit;

  lCI := TModCustomerInvoice(AObject);

  if lCI.ID = '' then
    lCI.CI_NOBUKTI := 'CI-' + GenerateNo(TModCustomerInvoice.ClassName);

  if lCI.CI_AR = nil then
  begin
    lCI.CI_AR := TModAR.Create;
  end;

  lCI.CI_AR.AR_ClassRef     := TModCustomerInvoice.ClassName;
  lCI.CI_AR.AR_Description  := lCI.CI_Description;
  lCI.CI_AR.AR_DueDate      := lCI.CI_TRANSDATE + 7;
  lCI.CI_AR.AR_ORGANIZATION := TModOrganization.CreateID(lCI.CI_ORGANIZATION.ID);
  lCI.CI_AR.AR_REFNUM       := lCI.CI_NOBUKTI;
  lCI.CI_AR.AR_REKENING     := TModRekening.CreateID(lCI.CI_REKENING.ID);
  lCI.CI_AR.AR_TRANSDATE    := lCI.CI_TRANSDATE;
  lCI.CI_AR.AR_TOTAL        := lCI.CI_TOTAL;

  if lCI.CI_AR.AR_PAID > 0then
    raise Exception.Create('Invoice Sudah Terbayar, Tidak Bisa Diedit');


  lcrud := TCrud.Create(nil);
  try
    if lcrud.SaveToDBTrans(lCI.CI_AR, False) then
      Result := True;
  finally
    lcrud.Free;
  end;
end;

function TCrudBarangHargaJual.AfterSaveToDB(AObject: TModApp): Boolean;
var
  sSQL: string;
begin
  sSQL := ' update BHJ set BHJ.BHJ_BRG_ID = B.BRG_ID '+
          ' from ' + TModBarangHargaJual.GetTableName + ' BHJ ' +
          ' INNER JOIN ' + TModBarang.GetTableName + ' B on B.BARANG_ID = BHJ.BARANG_ID ' +
          ' where BHJ.BARANG_HARGA_JUAL_ID = ' + TModBarangHargaJual(AObject).ID;
  try
    TDBUtils.ExecuteSQL(sSQL);
    Result := True;
  except
    raise
  end;
end;

function TCrudKuponBotol.GenerateCustomNo(aTableName, aFieldName: string;
    aCountDigit: Integer = 11): String;
var
  i: Integer;
  lNum: Integer;
  S: string;
begin
  aCountDigit := 3;
  lNum := 0;
  S := 'select max(' + aFieldName + ') from ' + aTableName
    + ' where dbo.DateOnly(TKB_DATE) = dbo.DateOnly(GETDATE())';
  with TDBUtils.OpenQuery(S) do
  begin
    Try
      if not eof then
        TryStrToInt(RightStr(Fields[0].AsString, aCountDigit), lNum);
    Finally
      Free;
    End;
  end;
  inc(lNum);
  Result := IntToStr(lNum);
  for i := 0 to aCountDigit-1 do Result := '0' + Result;
  Result := 'RB' + FormatDateTime('yyMMdd',Now) + RightStr(Result, aCountDigit);

  AfterExecuteMethod;
end;

end.
