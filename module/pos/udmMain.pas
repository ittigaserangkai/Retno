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
  vcl.dialogs, Datasnap.DBClient;

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

var
  dmMain: TdmMain;
  aListMerID  : TStrings;
  siFrtDec2: string = '0.00';
  siFrtDec3: string = '0.000';
  siFrtDec8: string = '0.00000000';
  svFrtDec2: string = '#,##0.00';
  svFrtDec3: string = '#,##0.000';

implementation

uses
  Vcl.Printers, Winapi.WinSpool, uTSCommonDlg, uAppUtils, Datasnap.Provider;

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
  try
    S := 'select  max('+aFieldID+') from '+aTableName;
    Q := cOpenQuery(S);
    Result := Q.Fields[0].AsInteger + 1;
  finally
    FreeAndNIl(Q);
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

  //for i := 0 to aSS.Count-1 do
    //WritePrinter(Handle, PChar(aSS[i]), Length(aSS[i]), N);

  WritePrinter(Handle, PChar(aSS.Text), Length(aSS.Text), N);

  EndPagePrinter(Handle);
  EndDocPrinter(Handle);
  ClosePrinter(Handle);
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

end.
