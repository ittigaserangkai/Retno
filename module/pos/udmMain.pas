unit udmMain;

interface

uses
  SysUtils, Classes, IBStoredProc, DB, IBCustomDataSet, IBQuery, IBDatabase,
  IdTCPConnection, IdTCPClient, IdBaseComponent, IdComponent, IdTCPServer,
  Windows, uConstanta, AppEvnts, ADODB, IdCustomTCPServer;

type
  TdmMain = class(TDataModule)
    connGoro: TIBDatabase;
    transGoro: TIBTransaction;
    qrMultiPurpose: TIBQuery;
    spMultiPurpose: TIBStoredProc;
    qrInsert: TIBQuery;
    qrUpdate: TIBQuery;
    qrDelete: TIBQuery;
    spInsert: TIBStoredProc;
    spUpdate: TIBStoredProc;
    spDelete: TIBStoredProc;
    tcpServerStore: TIdTCPServer;
    tcpClientStore: TIdTCPClient;
    appevnMain: TApplicationEvents;
    dbPOS: TIBDatabase;
    TransPOS: TIBTransaction;
    QrPOS: TIBQuery;
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

end.
