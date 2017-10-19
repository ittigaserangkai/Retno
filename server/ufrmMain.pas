unit ufrmMain;
//testsfasdf

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants,DB,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.AppEvnts, Vcl.StdCtrls, IdHTTPWebBrokerBridge, Web.HTTPApp,
  System.ImageList, Vcl.ImgList, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, Vcl.Menus,
  System.Actions, Vcl.ActnList, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Samples.Spin,
  uModDO, uServerClasses, uModOrganization, uModAP, uModBankCashOut,
  uModJurnal, uModContrabonSales, uModCustomerInvoice, cxButtons,System.Win.Registry,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue;

type
  TfrmMain = class(TForm)
    AE: TApplicationEvents;
    ImageList1: TImageList;
    grpRestServer: TGroupBox;
    Label1: TLabel;
    ButtonStart: TButton;
    ButtonStop: TButton;
    EditPort: TEdit;
    ButtonOpenBrowser: TButton;
    grpDB: TGroupBox;
    lblServer: TLabel;
    lblUser: TLabel;
    lblPassword: TLabel;
    lblEngine: TLabel;
    lblDatabase: TLabel;
    lblPort: TLabel;
    edServer: TcxTextEdit;
    edUser: TcxTextEdit;
    edPassword: TcxTextEdit;
    cbbEngine: TComboBox;
    edDatabase: TcxTextEdit;
    edPort: TcxTextEdit;
    btnKonekDB: TButton;
    mmMainMenu: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    ools1: TMenuItem;
    ModelGenerator1: TMenuItem;
    actlstMenu: TActionList;
    actFileExit: TAction;
    actToolsGenerateModel: TAction;
    mmLog: TMemo;
    rbTrace: TRadioGroup;
    StatusBar1: TStatusBar;
    spSession: TSpinEdit;
    Label2: TLabel;
    btnTest: TButton;
    lblGenerateSQL: TLabel;
    bGenerateSQLCreateTable: TcxButton;
    procedure actToolsGenerateModelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AEIdle(Sender: TObject; var Done: Boolean);
    procedure btnKonekDBClick(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure ButtonOpenBrowserClick(Sender: TObject);
    procedure mmLogChange(Sender: TObject);
    procedure rbTraceClick(Sender: TObject);
    procedure bGenerateSQLCreateTableClick(Sender: TObject);
    procedure grpDBDblClick(Sender: TObject);
  private
    FServer: TIdHTTPWebBrokerBridge;
    procedure StartServer;
    { Private declarations }
  public
    class function BacaRegistry(aNama: String; aPath : String = ''): string;
    class function TulisRegistry(aName, aValue: String; sAppName : String = ''):
        Boolean;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
//  test : TDataSEt;

implementation
{$R *.dfm}

uses
  WinApi.Windows, Winapi.ShellApi, Datasnap.DSSession, uDBUtils,
  ServerContainerUnit, uModTest, uModBank, WebModuleRetnoUnit, uTSINIFile,
  Datasnap.DSHTTP;

procedure TfrmMain.AEIdle(Sender: TObject; var Done: Boolean);
begin
  ButtonStart.Enabled := not FServer.Active;
  ButtonStop.Enabled  := FServer.Active;
  EditPort.Enabled    := not FServer.Active;
end;

procedure TfrmMain.ButtonOpenBrowserClick(Sender: TObject);
var
  LURL: string;
begin
  StartServer;
  LURL := Format('http://localhost:%s', [EditPort.Text]);
  ShellExecute(0,
        nil,
        PChar(LURL), nil, nil, SW_SHOWNOACTIVATE);
end;

procedure TfrmMain.ButtonStartClick(Sender: TObject);
begin
  StartServer; //test
end;

procedure TerminateThreads;
begin
  if TDSSessionManager.Instance <> nil then
    TDSSessionManager.Instance.TerminateAllSessions;
end;

procedure TfrmMain.actToolsGenerateModelExecute(Sender: TObject);
begin
//  frmGenerateModel := TfrmGenerateModel.Create(Self);
//  frmGenerateModel.ShowModal;
end;

class function TfrmMain.BacaRegistry(aNama: String; aPath : String = ''):
    string;
var
  Registry: TRegistry;
  //S: string;
begin
  Registry:=TRegistry.Create;

  Registry.RootKey := HKEY_CURRENT_USER;
  {False because we do not want to create it if it doesn�t exist}
  if Trim(aPath) = '' then
    Registry.OpenKey('\Software\' + Application.Title, False)
  else
    Registry.OpenKey('\Software\' + aPath, False);

  Result := Registry.ReadString(aNama);

  Registry.Free;
end;

procedure TfrmMain.bGenerateSQLCreateTableClick(Sender: TObject);
var
  sClassName: string;
begin
  sClassName := InputBox('Nama Kelas','Nama Kelas', TfrmMain.BacaRegistry('last_sql_create_table'));
  try

    HTTPMemo.Lines.Add(TCrud.Create(Self).CreateTableSQLByClassName(sClassName));
    TfrmMain.TulisRegistry('last_sql_create_table',sClassName)
  except
    ShowMessage('Error generate SQL');
  end;
end;

procedure TfrmMain.btnKonekDBClick(Sender: TObject);
begin
  if btnKonekDB.Caption = 'Connect' then
  begin
    if TDBUtils.ConnectDB(cbbEngine.Text, edServer.Text, edDatabase.Text, edUser.Text, edPassword.Text, edPort.Text) then
    begin
      btnKonekDB.Caption := 'Disconect';
      grpRestServer.Enabled := True;
//      mmoLogs.Lines.Add('Menambungkan DB ke ' + edServer.Text);
    end;
  end else begin
    FDConnection.Close;
    btnKonekDB.Caption := 'Connect';
    grpRestServer.Enabled := False;
//    mmoLogs.Lines.Add('Memutus DB dari ' + edServer.Text);
  end;
end;

procedure TfrmMain.btnTestClick(Sender: TObject);
begin
  with TCrud.Create(nil) do
  begin
    try
      with Retrieve(TModCustomerInvoice.ClassName, InputBox('ID','ID','BD8CF8B0-4415-4822-8706-3AE1AA59A8A9')) as TModCustomerInvoice do
      begin
        try
          ShowMessage(CreateTableSQLByClassName('uModCustomerInvoice.TModCustomerInvoice'));
          ShowMessage(CI_NOBUKTI);
          ShowMessage('Jml ARNew : ' + IntToStr(CustomerInvoiceARNewItems.Count));
          ShowMessage('Jml CustomerInvoiceAPMinus : ' + IntToStr(CustomerInvoiceAPMinusItems.Count));
          ShowMessage('Jml CustomerInvoiceARNewItems : ' + IntToStr(CustomerInvoiceARNewItems.Count));
          ShowMessage('Jml CustomerInvoiceDOTraderItems : ' + IntToStr(CustomerInvoiceDOTraderItems.Count));
          ShowMessage('Jml CustomerInvoicePotongAPItems : ' + IntToStr(CustomerInvoicePotongAPItems.Count));
          ShowMessage(DateTimeToStr(CI_TRANSDATE));
//          ShowMessage(DateTimeToStr(JUR_POSTED_DATE));
//          ShowMessage(IntToStr(JUR_JURNALITEMS.Count));



        finally
          Free;
        end;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TfrmMain.ButtonStopClick(Sender: TObject);
begin
  TerminateThreads;
  FServer.Active := False;
  DSServer.Stop;
  FServer.Bindings.Clear;
  HTTPMemo.Lines.Add('Server Stopped');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  HTTPMemo  := mmLog;
  FServer   := TIdHTTPWebBrokerBridge.Create(Self);

  if BacaRegistry('Server') <> '' then
  begin
    cbbEngine.ItemIndex := cbbEngine.Items.IndexOf(BacaRegistry('Engine'));
    edServer.Text       := BacaRegistry('Server');
    edDatabase.Text     := BacaRegistry('Database');
    edUser.Text         := BacaRegistry('User_Name');
    edPassword.Text     := BacaRegistry('Password');
    edPort.Text         := BacaRegistry('Port');

    if BacaRegistry('PortRest') <> '' then
      EditPort.Text     := BacaRegistry('PortRest');
  end;

  FormatSettings.DecimalSeparator := '.';
  FormatSettings.ThousandSeparator := ',';

  StartServer;
end;

procedure TfrmMain.grpDBDblClick(Sender: TObject);
begin
  btnTest.Visible := not btnTest.Visible;
end;

procedure TfrmMain.mmLogChange(Sender: TObject);
begin
  spSession.Value := TDSSessionManager.Instance.GetSessionCount
end;

procedure TfrmMain.rbTraceClick(Sender: TObject);
begin
  if not Assigned(WebModule) then   //no client yet, can't access the webmodule
    TraceInitialState := rbTrace.ItemIndex
  else
    WebModule.SetTraceOption(rbTrace.ItemIndex);
end;

procedure TfrmMain.StartServer;
begin
  btnKonekDB.Click;
  if not FServer.Active then
  begin
    FServer.Bindings.Clear;

    FServer.DefaultPort     := StrToInt(EditPort.Text);
    FServer.Active          := True;

    DSServer.Start;
    HTTPMemo.Lines.Add('Server Started');
    TulisRegistry('PortRest', EditPort.Text);
  end;
end;

class function TfrmMain.TulisRegistry(aName, aValue: String; sAppName : String
    = ''): Boolean;
var
   Reg : TRegistry;
begin
    result := true;
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if sAppName = '' then
      begin
        if Reg.OpenKey('\Software\' + Application.Title, True) then
        begin
             Reg.WriteString(aName, aValue);
             Reg.CloseKey;
        end
      end else begin
        if Reg.OpenKey('\Software\' + sAppName, True) then
        begin
             Reg.WriteString(aName, aValue);
             Reg.CloseKey;
        end;
      end;
    Except
      result := false;
      Reg.Free;
      exit;
    end;
   Reg.Free;
end;

end.
