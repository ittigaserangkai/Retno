unit uServerClasses;

interface

uses
  System.Classes, uModApp, uDBUtils, Rtti, Data.DB, SysUtils,
  StrUtils, uModSO, uModSuplier, Datasnap.DBClient, uModUnit, uModBarang;

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
    function ValidateCode(AOBject: TModApp): Boolean;
  protected
    function BeforeSaveToDB(AObject: TModApp): Boolean; virtual;
    function AfterSaveToDB(AObject: TModApp): Boolean; virtual;
  public
    function SaveToDB(AObject: TModApp): Boolean;
    function DeleteFromDB(AObject: TModApp): Boolean;
    function OpenQuery(S: string): TDataSet;
    function Retrieve(ModAppClass: TModAppClass; AID: String): TModApp; overload;
    function Retrieve(ModClassName, AID: string): TModApp; overload;
    function GenerateCustomNo(aTableName, aFieldName: string; aCountDigit: Integer
        = 11): String; overload;
    function GenerateNo(aClassName: string): String; overload;
    function RetrieveByCode(ModClassName, aCode: string): TModApp; overload;
    function SaveToDBLog(AObject: TModApp): Boolean;
    function SaveToDBID(AObject: TModApp): String;
    function TestGenerateSQL(AObject: TModApp): TStrings;
  end;

  TSuggestionOrder = class(TBaseServerClass)
  public
    function GenerateSO(aTanggal: TDatetime; aMerchan_ID: String;
        aSupplierMerchan_ID: String = ''): TDataSet;
  end;

  TPurchaseOrder = class(TBaseServerClass)
  public
    function GeneratePO(ASOID : String; ASupMG : TModSuplierMerchanGroup): Boolean;
  end;

  TCrudSupplier = class(TCrud)
  public
    function BeforeSaveToDB(AObject: TModApp): Boolean; override;
  end;



{$METHODINFO OFF}

const
  CloseSession : Boolean = True;

implementation

uses
  System.Generics.Collections, Datasnap.DSSession, Data.DBXPlatform, uModPO;
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

  debugSS.SaveToFile('debugRetrive.txt');
  debugSS.Clear;
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

function TPurchaseOrder.GeneratePO(ASOID : String; ASupMG :
    TModSuplierMerchanGroup): Boolean;
var
  i: Integer;
  iJmlBaris: Integer;
  lPO: TModPO;
  lPOItem: TModPOItem;
  lSO: TModSO;
  Q: TClientDataSet;
  sSQL: string;
  sSupMGID: string;
begin
//  Result := False;
//
//  TDBUtils.LoadFromDB(lSO,ASOID);
//  try
//    sSupMGID := '';
//    iJmlBaris  := 0;
//    for i := 0 to lSO.SODetails.Count - 1 do
//    begin
//      if (lSO.SODetails[i].SupplierMerchan.ID <> sSupMGID) or (iJmlBaris > 20) then
//      begin
//        sSupMGID := lSO.SODetails[i].SupplierMerchan.ID;
//        iJmlBaris:= 1;
//
//        lPO                          := TModPO.Create;
//        lPO.PO_NO_REF                := '';
//        lPO.PO_DATE                  := lSO.SO_DATE;
//        lPO.PO_IS_PO_BONUS           := 0;
//        lPO.PO_NO                    := '';
//        lPO.PO_SUPPLIER              := TModSuplier.CreateID(lSO.SODetails[i].SupplierMerchan.SUPLIER.ID);
//        lPO.PO_SUPPLIER_MERCHAN_GRUP := TModSuplierMerchanGroup.CreateID(lSO.SupplierMerchan.ID);
//        lPO.PO_TOP                   := 0;
//        lPO.PO_VALID_DATE            := lPO.PO_DATE + 7;
//        lPO.PO_UNIT                  := TModUnit.CreateID(Q.FieldByName('AUT$UNIT_ID').AsString);
//
//        lPO.POItems.Clear;
//      end;
//
//    end;

//    sSQL := 'select a.*, b.*,c.SUPMG_CODE, d.BARANG_SUPLIER_ID ' +
//            ' from SO a' +
//            ' INNER JOIN SO_DETAIL b on a.SO_ID = b.SO_ID' +
//            ' INNER JOIN SUPLIER_MERCHAN_GRUP c on b.SUPLIER_MERCHAN_GRUP_ID = c.SUPLIER_MERCHAN_GRUP_ID' +
//            ' INNER JOIN BARANG_SUPLIER d on b.BARANG_ID = d.BARANG_ID and b.REF$SATUAN_ID = d.REF$SATUAN_PURCHASE ' +
//            ' where a.so_id = ' + QuotedStr(ASOID);
//
//    if ASupMG <> nil then
//      sSQL := sSQL + ' and b.SUPLIER_MERCHAN_GRUP_ID = ' + QuotedStr(ASupMG.ID);
//
//    sSQL := sSQL + ' ORDER BY c.SUPMG_CODE';
//
//    Q := TDBUtils.OpenDataset(sSQL);
//    try
//      sSupMGCode := '';
//      iJmlBaris  := 0;
//      while not Q.Eof do
//      begin
//        if (sSupMGCode <> Q.FieldByName('supmg_sub_code').AsString) or (iJmlBaris > 20) then
//        begin
//          lPO                          := TModPO.Create;
//          lPO.PO_NO_REF                := '';
//          lPO.PO_DATE                  := lSO.SO_DATE;
//          lPO.PO_IS_PO_BONUS           := 0;
//          lPO.PO_NO                    := '';
//          lPO.PO_SUPPLIER              := TModSuplier.CreateID(lSO.SupplierMerchan.SUPLIER.ID);
//          lPO.PO_SUPPLIER_MERCHAN_GRUP := TModSuplierMerchanGroup.CreateID(lSO.SupplierMerchan.ID);
//          lPO.PO_TOP                   := 0;
//          lPO.PO_VALID_DATE            := lPO.PO_DATE + 7;
//          lPO.PO_UNIT                  := TModUnit.CreateID(Q.FieldByName('AUT$UNIT_ID').AsString);
//
//          lPO.POItems.Clear;
//        end;
//
//        lPOItem := TModPOItem.Create;
//        lPOItem.POD_DISC2  := Q.FieldByName('sod_disc2').AsFloat;
//        lPOItem.POD_DISC3  := Q.FieldByName('sod_disc3').AsFloat;
//        lPOItem.POD_BARANG := TModBarang.CreateID(Q.FieldByName('barang_id').AsString);
//        lPOItem.POD_BARANG_SUPPLIER := TModBarangSupplier.CreateID(Q.FieldByName('BARANG_SUPLIER_ID').AsString);
//        lPOItem.POD_DISC1  := Q.FieldByName('sod_disc1').AsFloat;
//        lPOItem.POD_DISC_TAMBAHAN := 0;
//        lPOItem.POD_IS_BKP := Q.FieldByName('SOD_IS_BKP').AsInteger;
//        lPOItem.POD_IS_STOCK := Q.FieldByName('SOD_IS_STOCK').AsInteger;
//        lPOItem.POD_PO := lPO;
//        lPOItem.POD_PPN:= Q.FieldByName('SOD_PPN')
//
//        lPO.POItems.Add(lPOItem);
//
//
//        Q.Next;
//      end;
//    finally
//      Q.Free;
//    end;
//  finally
//    lSO.Free;
//  end;

  Result := True;
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

end.
