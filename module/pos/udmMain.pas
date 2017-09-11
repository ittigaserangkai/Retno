unit udmMain;

interface

uses
  SysUtils, Classes, DB,
  IdTCPConnection, IdTCPClient, IdBaseComponent, IdComponent, IdTCPServer,
  Windows, uConstanta, AppEvnts, ADODB, IdCustomTCPServer, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Phys.SQLite,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef, FireDAC.Phys.MSSQLDef,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL, System.UITypes, Vcl.Forms, dxmdaset,
  vcl.dialogs, Datasnap.DBClient, uModApp;

type
  TDBType = (dbtPOS, dbtStore);
  TdmMain = class(TDataModule)
    connGoro: TFDConnection;
    transGoro: TFDTransaction;
    qrMultiPurpose: TFDQuery;
    spMultiPurpose: TFDStoredProc;
    qrInsert: TFDQuery;
    qrUpdate: TFDQuery;
    qrDelete: TFDQuery;
    spInsert: TFDStoredProc;
    spUpdate: TFDStoredProc;
    spDelete: TFDStoredProc;
    tcpServerStore: TIdTCPServer;
    tcpClientStore: TIdTCPClient;
    appevnMain: TApplicationEvents;
    dbPOS: TFDConnection;
    TransPOS: TFDTransaction;
    QrPOS: TFDQuery;
    adoConn: TADOConnection;
    adoQry: TADOQuery;
    adoCmd: TADOCommand;
    FDSQLiteSecurity1: TFDSQLiteSecurity;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    {
    procedure tcpServerStorecmdPOSTransactVoucherCommand(
      ASender: TIdCommand);
    procedure tcpServerStorecmdPOSTransactKuponBotolCommand(
      ASender: TIdCommand);
    procedure tcpServerStorecmdRefreshServerUpCommand(ASender: TIdCommand);
    procedure tcpServerStorecmdRefreshServerDownCommand(
      ASender: TIdCommand);
    procedure tcpServerStorecmdRefreshResetCashierCommand(
      ASender: TIdCommand);
      }
    procedure appevnMainException(Sender: TObject; E: Exception);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  public
    FMSSQLConnectionString: string;
    FSQLiteConnectionString: string;
    function getGlobalVar(aVarString : string): string;
    procedure sendMessageToMainForm(msg: Cardinal; Wparam: WPARAM; LParam: LPARAM);
    function setConnectionString(aDriver, aServer, aDatabase, aUser, aPassword:
        string): string;
  end;

function cGetAppPath: String;
function getGlobalVar(aVarString : string): string;
function cOpenQuery(aSQL: String; aDBType: TDBType = dbtPOS; aIsUniDirect:
    Boolean = False): TFDQuery;
function cCekSqlFilterMerchandise(Assq: String): String;
function cGetServerDateTime: TDateTime;
procedure cRollbackTrans(ADBType: TDBType = dbtPOS);
function cGetNextID(aFieldID, aTableName: String): Integer;

function cExecSQL(ASQL: String; ADBType: TDBType = dbtPOS; ALangsungCommit:
    Boolean = False): boolean; overload;

function cExecSQLSelfCommit(ASQL: String; ADBType: TDBType = dbtPOS): boolean;

function cExecSQL(ASQLs : TStrings; ADBType: TDBType = dbtPOS;
    ALangsungCommint: Boolean = False; ACaption : String = 'Execute SQL'):
    Boolean; overload;

procedure cCommitTrans(ADBType: TDBType = dbtPOS);

procedure PrintStrings(aSS: TStrings);

function cOpenDataset(ASQL: String; AOwner: TComponent = nil): TClientDataSet;

function cGetNextIDDetail(aFieldID, aTableName: String): string;

function cSaveToDB(AObject: TModApp): Boolean;

function cValidateCode(AOBject: TModApp): Boolean;

function cIsExist(AOBject: TModApp): Boolean;

function cGenerateSQL(AObject: TModApp): TStrings; overload;

procedure cGenerateSQL(AObject: TModApp; SS: TStrings); overload;

function cGetSQLInsert(AObject: TModApp): String;

function cGetSQLUpdate(AObject: TModApp): String;

function cGetNextIDGUIDToString: string;

function cRemoveBracket(cValue: string): string;

var
  dmMain: TdmMain;
  aListMerID  : TStrings;
  siFrtDec2: string = '0.00';
  siFrtDec3: string = '0.000';
  siFrtDec8: string = '0.00000000';
  svFrtDec2: string = '#,##0.00';
  svFrtDec3: string = '#,##0.000';

const
  SQL_Insert  : String = 'Insert Into %s(%s) values(%s);';
  SQL_Update  : String = 'Update %s set %s where %s;';
  SQL_Delete  : String = 'Delete From %s where %s;';
  SQL_Select  : String = 'Select %s from %s where %s';

implementation

uses
  Vcl.Printers, Winapi.WinSpool, uTSCommonDlg, uAppUtils, Datasnap.Provider,
  Rtti, TypInfo;

{$R *.dfm}

function cGetAppPath: String;
begin
     result := ExtractFilePath(application.ExeName);
end;

function getGlobalVar(aVarString : string): string;
var
  sSQL: string;
begin
  Result := '';
  sSQL := ' select PAR_VALUE '
          + ' from SYS$PARAMETER '
          + ' where PAR_NAME = ' + QuotedStr(aVarString) ;

  with cOpenQuery(sSQL) do
  begin
    try
    if not FieldByName('PAR_VALUE').IsNull then
      Result := fieldbyname('PAR_VALUE').AsString;
    finally
      Free;
    end;
  end;
end;

function cOpenQuery(aSQL: String; aDBType: TDBType = dbtPOS; aIsUniDirect:
    Boolean = False): TFDQuery;
var
  saveCursor: TCursor;
begin
  Result := TFDQuery.create(dmMain);

  if aDBType = dbtPOS then
  begin
    if not dmMain.dbPOS.Connected then
    begin
      dmMain.dbPOS.Open(dmMain.FSQLiteConnectionString);
    end;

    Result.Connection := dmMain.dbPOS;
    Result.Transaction := dmMain.TransPOS;
  end
  else if aDBType = dbtStore then
  begin
    if not dmMain.connGoro.Connected then
    begin
      dmMain.connGoro.Open(dmMain.FMSSQLConnectionString);
    end;

    Result.Connection := dmMain.connGoro;
    Result.Transaction := dmMain.transGoro;
  end;

  Result.FetchOptions.Unidirectional := aIsUniDirect;
  Asql := cCekSqlFilterMerchandise(Asql);

  Result.SQL.Clear;
  Result.SQL.Add(ASQL);
  try
    saveCursor := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    try
      Result.Open;
    finally
    	Screen.Cursor := saveCursor;
    end;  // try/finally
//    Application.ProcessMessages;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

function cCekSqlFilterMerchandise(Assq: String): String;
var
  sFltrAnd: string;
  iPosEx  : Integer;
  sSQL1   : string;
  sFltr   : string;
  i       : Integer;
  sSQL    : string;


begin
  if Assigned(aListMerID) then
  begin
    if  aListMerID.Count > 0 then
    begin
      if Pos(' BARANG ', uppercase(Assq)) <> 0 then
      begin

        if Pos('WHERE', UpperCase(Assq)) <> 0 then
        begin
          sFltrAnd := ' AND';
        end
        else
        begin
          sFLtr := ' WHERE';
        end;

        for i := 0 to aListMerID.Count - 1 do
        begin
            if i = 0 then
              sFltr := ' BRG_MERCHAN_ID in ( '+ QuotedStr(aListMerID.Strings[i])
            else if (i > 0) then
              sFltr := sFltr + ', ' + QuotedStr(aListMerID.Strings[i]);

            if i = (aListMerID.Count - 1) then
               sFltr := sFltr + ' )';
        END;

//        sFLtr := sFLtr + sFltrAnd;

      end
      else if Pos(' REF$MERCHANDISE ', uppercase(Assq)) <> 0 then
      begin

        if Pos('WHERE', UpperCase(Assq)) <> 0 then
        begin
          sFltrAnd := ' AND';
        end
        else
        begin
          sFLtr := ' WHERE';
        end;

        for i := 0 to aListMerID.Count - 1 do
        begin
            if i = 0 then
              sFltr := ' MERCHAN_ID in ( '+ QuotedStr(aListMerID.Strings[i])
            else if (i > 0) then
              sFltr := sFltr + ', ' + QuotedStr(aListMerID.Strings[i]);

            if i = (aListMerID.Count - 1) then
               sFltr := sFltr + ' )';
        END;
      end;
      sFLtr := sFLtr + sFltrAnd;
    end;
  end;

  iPosEx := Pos('WHERE', uppercase(Assq));

  if iPosEx > 0 then
  begin
    sSQL  := Copy(Assq, 1, iPosEx - 1);
    sSQL1 := Copy(Assq, iPosEx, Length(Assq) - Length(sSQL));
    sSQL1 := Copy(sSQL1, Length('WHERE') + 1, Length(sSQL1) - Length('WHERE'));
    sSQL1 := ' WHERE '+ sFLtr + ' '+ sSQL1;
  end
  else
  begin
    iPosEx := Pos('GROUP BY', uppercase(Assq));

    if iPosEx > 0 then
    begin
      sSQL := Copy(Assq, 1, iPosEx - 1);
      sSQL1 := Copy(Assq, iPosEx, Length(Assq) - Length(sSQL));
    end
    else
    begin
      iPosEx := Pos('ORDER BY', uppercase(Assq));
      if iPosEx > 0 then
      begin
        sSQL  := Copy(Assq, 1, iPosEx - 1);
        sSQL1 := Copy(Assq, iPosEx, Length(Assq) - Length(sSQL));
      end
      else
        sSQL := Assq;
    end;
  end;

  Result := sSQL + ' ' + sSQL1;

end;

function cGetServerDateTime: TDateTime;
var
    S: string;
begin
    //interbase
    S := 'Select current_timestamp as Result from RDB$database';
    //sqlite
    S := 'SELECT datetime(''now'');';
    with cOpenQuery(S) do
    begin
      try
         Result := StrToDateTimeDef(fields[0].AsString, Now);
      finally
        Free;
      end;
    end;

end;


procedure TdmMain.sendMessageToMainForm(msg: Cardinal; Wparam: WPARAM;
  LParam: LPARAM);
var
  hwndParent: HWND;
begin
  hwndParent := FindWindow('TfrmMain', nil);

  if (hwndParent <> 0) then
    SendMessage(hwndparent, msg, wParam, LParam);
end;

procedure TdmMain.appevnMainException(Sender: TObject; E: Exception);
begin
  CommonDlg.ShowError(E.Message);
end;

procedure TdmMain.DataModuleCreate(Sender: TObject);
begin
  connGoro.Connected := False;
  connGoro.Params.Clear;
  connGoro.Params.DriverID := 'MSSQL';
  connGoro.Transaction := transGoro;

  dbPOS.Connected := False;
  dbPOS.Params.Clear;
  dbPOS.Params.DriverID := 'SQLite';
  dbPOS.Transaction := TransPOS
end;

procedure TdmMain.DataModuleDestroy(Sender: TObject);
begin
//  FConnectionGuardian.Free;
end;

function TdmMain.getGlobalVar(aVarString : string): string;
var
  sSQL: string;
begin
  Result := '';
  sSQL := ' select PAR_VALUE '
          + ' from SYS$PARAMETER '
          + ' where PAR_NAME = ' + QuotedStr(aVarString) ;

  with cOpenQuery(sSQL) do
  begin
    try
    if not FieldByName('PAR_VALUE').IsNull then
      Result := fieldbyname('PAR_VALUE').AsString;
    finally
      Free;
    end;
  end;
end;

function TdmMain.setConnectionString(aDriver, aServer, aDatabase, aUser,
    aPassword: string): string;
begin
  Result := 'DriverID=' + aDriver
         +  ';Server=' + aServer
         +  ';Database=' + aDatabase
         +  ';User_name=' + aUser
         +  ';Password=' + aPassword;

  if (aDriver='SQLite') then
  begin
    Result := Result + ';DateTimeFormat=DateTime'
           + ';GUIDFormat=Binary';
    if (aPassword<>'') then
      Result := Result + ';Encrypt=aes-ctr-128';
  end;
end;

procedure cCommitTrans(ADBType: TDBType = dbtPOS);
begin
  if ADBType = dbtPOS then
  begin
    if dmMain.TransPOS = nil then exit;

    if dmMain.TransPOS.Active then
    begin
      dmMain.TransPOS.Commit;
    end;
    dmMain.dbPOS.Connected := False;
  end
  else if ADBType = dbtStore then
  begin
    if dmMain.transGoro = nil then exit;

    if dmMain.transGoro.Active then
    begin
      dmMain.transGoro.Commit;
    end;
  end;
end;

procedure cRollbackTrans(ADBType: TDBType = dbtPOS);
begin
  if ADBType = dbtPOS then
  begin
    if dmMain.TransPOS = nil then exit;

    if dmMain.TransPOS.Active then
    begin
      dmMain.TransPOS.Rollback;
    end;
    dmMain.dbPOS.Connected := False;
  end
  else if ADBType = dbtStore then
  begin
    if dmMain.transGoro = nil then exit;

    if dmMain.transGoro.Active then
    begin
      dmMain.transGoro.Rollback;
    end;
  end;
end;

function cGetNextID(aFieldID, aTableName: String): Integer;
var
  Q : TFDQuery;
  S : String;
begin
  Result := 1;
  S := 'select  max('+aFieldID+') from ' + aTableName;
  Q := cOpenQuery(S);
  try
    if not Q.Eof then
      Result := StrToIntDef(Q.Fields[0].AsString,0) + 1;
  finally
    FreeAndNil(Q);
  end;
end;

function cExecSQLSelfCommit(ASQL: String; ADBType: TDBType = dbtPOS): boolean;
var
  saveCursor: TCursor;
  lIBTransaction: TFDTransaction;
  Query1 : TFDQuery;
begin
  Result := False;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if UpperCase(Copy(Trim(ASQL),1,6)) = 'SELECT' then
    begin
      Exit;
    end;

    lIBTransaction := TFDTransaction.Create(Application);
    with lIBTransaction do
    begin
      if ADBType = dbtPOS then
        Connection := dmMain.dbPOS
      else if ADBType = dbtStore then
        Connection := dmMain.connGoro;
      Options.Isolation := xiReadCommitted;
      Options.DisconnectAction := xdRollback;
    end;    // with

    Query1 := TFDQuery.Create(Application);
    Application.ProcessMessages;

    if ADBType = dbtPOS then
    begin
      Query1.Connection := dmMain.dbPOS;
    end
    else if ADBType = dbtStore then
    begin
      Query1.Connection := dmMain.connGoro;
    end;
    Query1.Transaction := lIBTransaction;

    Query1.Params.Clear;
    Query1.SQL.Clear;
    query1.SQL.Text := ASQL;
    try
      Application.ProcessMessages;
      if not lIBTransaction.Active then
      begin
        lIBTransaction.StartTransaction;
      end;

      Query1.ExecSQL;
      lIBTransaction.Commit;
      Result := True;
    except
      lIBTransaction.Rollback;
      //raise;
    end;
  finally
    Screen.Cursor := saveCursor;
    FreeAndNil(Query1);
    FreeAndNil(lIBTransaction);
  end;  // try/finally
end;

//-----------cExecSQL Try------------------------------------------------//
function cExecSQL(ASQL: String; ADBType: TDBType = dbtPOS; ALangsungCommit:
    Boolean = False): boolean;
var
  saveCursor: TCursor;
  Query1 : TFDQuery;
begin
  Result := False;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if UpperCase(Copy(ASQL,1,6)) = 'SELECT' then
    begin
      Exit;
    end;

    Query1 := TFDQuery.Create(Application);
    Application.ProcessMessages;

    if ADBType = dbtPOS then
    begin
      Query1.Connection := dmMain.dbPOS;
      Query1.Transaction := dmMain.transPOS;
    end
    else if ADBType = dbtStore then
    begin
      Query1.Connection := dmMain.connGoro;
      Query1.Transaction := dmMain.transGoro;
    end;

    Query1.Params.Clear;
    Query1.SQL.Clear;
    query1.SQL.Text := ASQL;
    try
      Application.ProcessMessages;
      if not Query1.Transaction.Active then
      begin
        Query1.Transaction.StartTransaction;
      end;

      Query1.ExecSQL;

      if ALangsungCommit then
      begin
        cCommitTrans;
      end;
      Result := True;
    except
      cRollbackTrans;
      raise;
    end;
    FreeAndNil(Query1);
  finally
    Screen.Cursor := saveCursor;
  end;  // try/finally
end;

function cExecSQL(ASQLs : TStrings; ADBType: TDBType = dbtPOS;
    ALangsungCommint: Boolean = False; ACaption : String = 'Execute SQL'):
    Boolean;
var
  i: Integer;
begin
  Result := False;
  try
    for i := 0 to ASQLs.count - 1 do
    begin
       if not cExecSQL(ASQLs[i], ADBType, ALangsungCommint) then
       begin
           cRollbackTrans;
           Exit;
       end;
       Application.ProcessMessages;
//       StepProgress(LjvProgressDlg, aCaption);
    end;
  finally
  end;

  Result := True;
end;

function cOpenDataset(ASQL: String; AOwner: TComponent = nil): TClientDataSet;
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

  LSQLQuery.Connection := dmMain.dbPOS;
  LSQLQuery.SQL.Append(ASQL);

  LDSP.DataSet            := LSQLQuery;
  Result.SetProvider(LDSP);
  Result.Open;
end;

procedure PrintStrings(aSS: TStrings);
var
  Handle: THandle;
  N: DWORD;
  DocInfo1: TDocInfo1;
  DriverName: array [0..255] of char;
  DeviceName: array [0..255] of char;
  OutPut: array [0..255] of char;
  DeviceMode: Thandle;
//  i: Integer;
begin
  Printer.GetPrinter(DeviceName, DriverName, Output, DeviceMode);

  if not OpenPrinter(DeviceName, Handle, nil) then
  begin
    ShowMessage('error ' + IntToStr(GetLastError));
    Exit;
  end;

  with DocInfo1 do
  begin
    pDocName := PChar('test doc');
    pOutputFile := nil;
    pDataType := 'RAW';
  end;

  StartDocPrinter(Handle, 1, @DocInfo1);
  StartPagePrinter(Handle);

//  for i := 0 to aSS.Count-1 do
//    WritePrinter(Handle, PChar(aSS[i]), Length(aSS[i]), N);

  WritePrinter(Handle, PChar(aSS.Text), Length(aSS.Text)*SizeOf(Char), N);

  EndPagePrinter(Handle);
  EndDocPrinter(Handle);
  ClosePrinter(Handle);
end;

function cGetNextIDDetail(aFieldID, aTableName: String): string;
begin
  Result := '(select ifnull(max('+aFieldID+'),0)+1 from ' + aTableName + ' ) ';
end;

function cSaveToDB(AObject: TModApp): Boolean;
var
  lSS: TStrings;
  sID: string;
begin
  Result := False;
  sID := AObject.ID;
  if sID <> '' then
    AObject.ID := cRemoveBracket(sID);

  if not cValidateCode(AObject) then exit;

  lSS := cGenerateSQL(AObject);
  Try
    Try
      cExecSQL(lSS);
      cCommitTrans();

      Result := True;
    except
      cRollbackTrans();
      raise;
    End;
  Finally
    lSS.Free;
  End;
end;

function cValidateCode(AOBject: TModApp): Boolean;
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
  with cOpenQuery(S) do
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

function cGenerateSQL(AObject: TModApp): TStrings;
begin
  Result := TStringList.Create;
  cGenerateSQL(AObject, Result);
end;

procedure cGenerateSQL(AObject: TModApp; SS: TStrings);
//var
//  a: TCustomAttribute;
//  ctx : TRttiContext;
//  DoUpdateDetails: Boolean;
//  meth : TRttiMethod;
//  prop, propItem : TRttiProperty;
//  rt : TRttiType;
//  i : Integer;
//  IDItems: string;
//  lAppClassItem: TModAppClass;
//  lObj : TObject;
//  lModItem : TModApp;
//  lObjectList: TObject;
//  rtItem: TRttiType;
//  sGenericItemClassName: string;
//  value : TValue;
//  SSItems: TStrings;

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
//  DoUpdateDetails := False;
//  rt := ctx.GetType(AObject.ClassType);

  If ClassInFilter(TModAppClass(AObject.ClassType)) then
  begin
    if cIsExist(AObject) then
      SS.Add(cGetSQLUpdate(AObject))
    else
      SS.Add(cGetSQLInsert(AObject));
  end;

  {
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

            cGenerateSQL(lModItem, SSItems, AUnitID);
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
  }
end;

function cGetSQLInsert(AObject: TModApp): String;
var
  ctx : TRttiContext;
  rt : TRttiType;
  prop : TRttiProperty;
  FieldValues : string;
  FieldNames: String;
begin
  FieldValues := '';
  FieldNames  := '';

  if AObject.ID = '' then AObject.ID := cGetNextIDGUIDToString();
  rt := ctx.GetType(AObject.ClassType);
  for prop in rt.GetProperties do
  begin
    if prop.Visibility = mvPublished then
    begin
      if AObject.QuotValueNoBracket(prop) = 'NULL' then
        Continue;

      If FieldNames <> '' then FieldNames := FieldNames + ',';
      If FieldValues <> '' then FieldValues := FieldValues + ',';

      FieldNames  := FieldNames + AObject.FieldNameOf(prop);
      FieldValues := FieldValues + AObject.QuotValueNoBracket(prop);
    end;
  end;

  Result :=  Format(SQL_Insert,[AObject.GetTableName, FieldNames, FieldValues]);
end;

function cGetSQLUpdate(AObject: TModApp): String;
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
    UpdateVal := UpdateVal + FieldName + ' = ' + AObject.QuotValueNoBracket(prop)
  end;

  sFilter   := '';

  sFilter := AObject.GetPrimaryField + ' = ' + QuotedStr(AObject.ID);
  Result := Format(SQL_Update,[AObject.GetTableName,UpdateVal,sFilter]);
end;

function cGetNextIDGUIDToString: string;
var
  lGUID: TGuid;
begin
  CreateGUID(lGUID);
  Result := cremoveBracket(GUIDToString(lGUID));
end;

function cIsExist(AOBject: TModApp): Boolean;
var
  S: string;
  sFilter: string;
begin
//  Result := False;

  if AOBject.ID <> '' then
    sFilter := AOBject.GetPrimaryField + ' = ' + QuotedStr(AOBject.ID);

  S := Format(SQL_Select,['1', AOBject.GetTableName, sFilter]);
  with cOpenQuery(S) do
  begin
    Try
      Result := not EOF;
    Finally
      Free;
    End;
  end;
end;

function cRemoveBracket(cValue: string): string;
begin
  Result := Copy(cValue,2,cValue.Length-2);
end;

end.
