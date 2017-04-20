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
  FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL;

type
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
  private
  public
    FMSSQLConnectionString: string;
    FSQLiteConnectionString: string;
    function getGlobalVar(aVarString : string): string;
    procedure sendMessageToMainForm(msg: Cardinal; Wparam: WPARAM; LParam: LPARAM);
    function setConnectionString(aDriver, aServer, aDatabase, aUser, aPassword:
        string): string;
  end;

function getGlobalVar(aVarString : string): string;

function cOpenQuery(aSQL : String): TFDQuery;

function cCekSqlFilterMerchandise(Assq: String): String;

function cGetServerDateTime: TDateTime;

var
  dmMain: TdmMain;
  aListMerID  : TStrings;
implementation

uses
  uTSCommonDlg, uAppUtils;

{$R *.dfm}

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

function cOpenQuery(aSQL : String): TFDQuery;
begin
    Result := TFDQuery.create(dmMain);

    if not dmMain.connGoro.Connected then
    begin
      dmMain.connGoro.Open(dmMain.FMSSQLConnectionString);
    end;

    if not dmMain.dbPOS.Connected then
    begin
      dmMain.dbPOS.Open(dmMain.FSQLiteConnectionString);
    end;

    if not Assigned(Result.Connection) then
    begin
      Result.Connection := dmMain.dbPOS;
    end;

    if not Assigned(Result.Transaction) then
    begin
      Result.Transaction := dmMain.TransPOS;
    end;

    Asql := cCekSqlFilterMerchandise(Asql);

    Result.SQL.Clear;
    Result.SQL.add(Asql);
    try
      Result.open;
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
    S := 'Select current_timestamp as Result from RDB$database';

    with cOpenQuery(S) do
    begin
      try
         Result := fields[0].AsDateTime;
      finally
        Free;
      end;
    end;

end;

{
procedure TdmMain.tcpServerStorecmdPOSTransactVoucherCommand(
  ASender: TIdCommand);
begin
  sendMessageToMainForm(WM_REFRESH_SERVER_MESSAGE, STORE_POS_TRANS_VOUCHER, 0);
end;

procedure TdmMain.tcpServerStorecmdPOSTransactKuponBotolCommand(
  ASender: TIdCommand);
begin
  sendMessageToMainForm(WM_REFRESH_SERVER_MESSAGE, STORE_POS_TRANS_BOTOL, 0);
end;
}
procedure TdmMain.sendMessageToMainForm(msg: Cardinal; Wparam: WPARAM;
  LParam: LPARAM);
var
  hwndParent: HWND;
begin
  hwndParent := FindWindow('TfrmMain', nil);

  if (hwndParent <> 0) then
    SendMessage(hwndparent, msg, wParam, LParam);
end;
{
procedure TdmMain.tcpServerStorecmdRefreshServerUpCommand(
  ASender: TIdCommand);
begin
  sendMessageToMainForm(WM_REFRESH_SERVER_MESSAGE, REFRESH_SERVER_UP, 0);
end;

procedure TdmMain.tcpServerStorecmdRefreshServerDownCommand(
  ASender: TIdCommand);
begin
  sendMessageToMainForm(WM_REFRESH_SERVER_MESSAGE, REFRESH_SERVER_DOWN, 0);
end;

procedure TdmMain.tcpServerStorecmdRefreshResetCashierCommand(
  ASender: TIdCommand);
begin
  sendMessageToMainForm(WM_REFRESH_SERVER_MESSAGE, STORE_POS_RESET_CASHIER, 0);
end;
}
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
//  sSQL := ' select PAR_VALUE '
//          + ' from SYS$PARAMETER '
//          + ' where PAR_NAME = ' + QuotedStr(aVarString) ;
//
//  with cOpenQuery(sSQL) do
//  begin
//    try
//    if not FieldByName('PAR_VALUE').IsNull then
//      Result := fieldbyname('PAR_VALUE').AsString;
//    finally
//      Free;
//    end;
//  end;
end;

function TdmMain.setConnectionString(aDriver, aServer, aDatabase, aUser,
    aPassword: string): string;
begin
  Result := 'DriverID=' + aDriver
         +  ';Server=' + aServer
         +  ';Database=' + aDatabase
         +  ';User_name=' + aUser
         +  ';Password=' + aPassword;
  // TODO -cMM: TdmMain.setConnectionString default body inserted
  if (aPassword<>'') and (aDriver='SQLite') then
    Result := Result + ';Encrypt=aes-ctr-128';

end;

end.
