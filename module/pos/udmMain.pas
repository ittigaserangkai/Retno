unit udmMain;

interface

uses
  SysUtils, Classes, DB,
  IdTCPConnection, IdTCPClient, IdBaseComponent, IdComponent, IdTCPServer,
  Windows, uConstanta, AppEvnts, ADODB, IdCustomTCPServer, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet;

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
    function getGlobalVar(aVarString : string): string;
    procedure sendMessageToMainForm(msg: Cardinal; Wparam: WPARAM; LParam: LPARAM);
  end;

var
  dmMain: TdmMain;

implementation

uses
  uTSCommonDlg;

{$R *.dfm}

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
//  FConnectionGuardian := TIBConnectionGuardian.Create;
//  FConnectionGuardian.Database := connGoro;
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

end.
