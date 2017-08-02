unit ufrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ImgList, StrUtils, uTSCommonDlg,
  uTSINIFile, ExtCtrls, StdCtrls, uFormProperty, System.ImageList;

type
  TfrmMain = class(TForm)
    mnMain: TMainMenu;
    mmFile: TMenuItem;
    miLogin: TMenuItem;
    miLogout: TMenuItem;
    N1: TMenuItem;
    miExit: TMenuItem;
    miCashier: TMenuItem;
    miTransactionEndUser: TMenuItem;
    miTransactionTrader: TMenuItem;
    mnPayment: TMenuItem;
    N3: TMenuItem;
    mmTools: TMenuItem;
    Export1: TMenuItem;
    miImport1: TMenuItem;
    N2: TMenuItem;
    OpenCashDrawerF71: TMenuItem;
    mmCashierTrader: TMenuItem;
    miDeliveryOrder: TMenuItem;
    miImport: TMenuItem;
    mmHelp: TMenuItem;
    sbMain: TStatusBar;
    ilMain: TImageList;
    tmrMain: TTimer;
    PrintHeader1: TMenuItem;
    miTransactionPending1: TMenuItem;
    mmoHelp: TMemo;
    Bantuan1: TMenuItem;
    ExportDataPOS1: TMenuItem;
    ImportDataStore1: TMenuItem;
    pnlHeader: TPanel;
    UpdateMaster1: TMenuItem;
    Admin1: TMenuItem;
    miCashierSupv: TMenuItem;
    miMasterSellingProduct: TMenuItem;
    miMaintenancePassword: TMenuItem;
    miActivatePOS: TMenuItem;
    miBeginningBalancePOS: TMenuItem;
    miCashDroping: TMenuItem;
    miResetCashier: TMenuItem;
    miFinalPayment: TMenuItem;
    miReturNotaCN: TMenuItem;
    N6: TMenuItem;
    miAdjustmentCashier: TMenuItem;
    miAdjustmentCashback: TMenuItem;
    ActivatePOS2: TMenuItem;
    miReferences: TMenuItem;
    CreditCard1: TMenuItem;
    miDisplay: TMenuItem;
    DisplayCreditCardAndCashback1: TMenuItem;
    DisplayLastTransactionNo1: TMenuItem;
    DisplayPOSMonitor1: TMenuItem;
    DisplayPOSTransaction1: TMenuItem;
    N7: TMenuItem;
    miSalesReportContrabon: TMenuItem;
    miCustomerSupport: TMenuItem;
    miMemberShip1: TMenuItem;
    miMemberActivation1: TMenuItem;
    miVoucher1: TMenuItem;
    miCostumer1: TMenuItem;
    miDataCostumer1: TMenuItem;
    miCostumerAgreement1: TMenuItem;
    miGenerateVoucher1: TMenuItem;
    miVoucherBotol1: TMenuItem;
    miTrader: TMenuItem;
    ListAssgros1: TMenuItem;
    N8: TMenuItem;
    POFromAssgros1: TMenuItem;
    DOForAsGriss1: TMenuItem;
    N9: TMenuItem;
    CrazyPrice1: TMenuItem;
    miMaster: TMenuItem;
    miProduct1: TMenuItem;
    miEOD: TMenuItem;
    Synchronize1: TMenuItem;
    ImportSync1: TMenuItem;
    miLoginAdmin: TMenuItem;
    ReprintNota1: TMenuItem;
    ImportDataFromMDB: TMenuItem;
    ExportDataToMDB: TMenuItem;
    miMaintenanceBarcode: TMenuItem;
    miSalesReport: TMenuItem;
    procedure miActivatePOSClick(Sender: TObject);
    procedure miAdjustmentCashbackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miExitClick(Sender: TObject);
    procedure miTransactionEndUserClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrMainTimer(Sender: TObject);
    procedure mnPaymentClick(Sender: TObject);
    procedure PrintHeader1Click(Sender: TObject);
    procedure miTransactionTraderClick(Sender: TObject);
    procedure miLogoutClick(Sender: TObject);
    procedure miTransactionPending1Click(Sender: TObject);
    procedure miLoginClick(Sender: TObject);
    procedure Bantuan1Click(Sender: TObject);
    procedure ExportDataPOS1Click(Sender: TObject);
    procedure ExportDataToMDBClick(Sender: TObject);
    procedure ImportDataStore1Click(Sender: TObject);
    procedure ImportDataFromMDBClick(Sender: TObject);
    procedure miMasterSellingProductClick(Sender: TObject);
    procedure miProduct1Click(Sender: TObject);
    procedure UpdateMaster1Click(Sender: TObject);
  private
    FLoginUsername: string;
    FLoginUnitId: Integer;
    FTransNo: String;
    FUnitID: Integer;
    FUserID: Integer;
    FFormProperty : TFormProperty;
    FPageLogin: string;
    IsPOSConnected: Boolean;
    function Initialize: Boolean;
    procedure SetLoginUsername(const Value: string);
    procedure SetLoginUnitId(const Value: Integer);
    { Private declarations }
    procedure EnableSubMenu(AMenu: TMenuItem; AValue: boolean);
  public
    { Public declarations }
    Host, IP: string;
    Port: integer;

    FBeginningBalanceID: Integer;

    //Store DB
    FDBServerStore: String;
    FDBStore: String;
    FDBUserStore: String;
    FDBPasswordStore: String;

    //POS DB
    FDBServerPOS: String;
    FDBPOS: String;
    FDBUserPOS: String;
    FDBPasswordPOS: String;

    //POS & Cashier
    FPOSCode: String;
    FCashierCode: String;
    FCashierName: String;

    procedure EnableMenu;
    procedure DisableMenu;
    function GetTransactionNo(APOSCode: String; aActiveDate : TDateTime): String;
    procedure MDIChildCreated(const childHandle : THandle);
    procedure MDIChildDestroyed(const childHandle : THandle);
    property LoginUsername: string read FLoginUsername write SetLoginUsername;
    property LoginUnitId: Integer read FLoginUnitId write SetLoginUnitId;
    property TransNo: String read FTransNo write FTransNo;
    property UnitID: Integer read FUnitID write FUnitID;
    property UserID: Integer read FUserID write FUserID;
  end;

function GetFormByClass(AFormClass: TClass): TForm;

function ShowForm(AFormClass: TFormClass; AWindowState: TWindowState =
    wsNormal): TForm;

var
  frmMain: TfrmMain;

implementation

uses
  udmMain, ufrmTransaksi, uConstanta, HPHELP, uAppUtils, ufrmTransaksiKring,
  ufrmLogin, ufrmTransaksiPending, ufrmPaymentKring, ufrmPosDownlink,
  ufrmImportFromMDB, ufrmExportToMDB, ufrmPayment, ufrmExportOfflinePOS,
  ufrmImportFromStore, uNewPOS;

{$R *.dfm}

function GetFormByClass(AFormClass: TClass): TForm;
var
  i: Integer;
begin
  Result := nil;

  for i := 0 to frmMain.MDIChildCount - 1 do
  begin
    if frmMain.MDIChildren[i].ClassType = AFormClass then
    begin
      Result := frmMain.MDIChildren[i];
      Exit;
    end;      
  end;
end;

function ShowForm(AFormClass: TFormClass; AWindowState: TWindowState =
    wsNormal): TForm;
var
  lForm: TForm;
begin
  lForm := GetFormByClass(AFormClass);

  if lForm = nil then
  begin
    lForm := AFormClass.Create(Application);
  end;
  lForm.Show;
  lForm.WindowState := AWindowState;

  Result := lForm;
end;

procedure TfrmMain.miActivatePOSClick(Sender: TObject);
begin
//  frmActivatePOS := TfrmActivatePOS.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.miAdjustmentCashbackClick(Sender: TObject);
begin
//  frmAdjustmentCashback := TfrmAdjustmentCashback.CreateWithUser(Application, FFormProperty);
//  frmAdjustmentCashback.Show;
end;

procedure TfrmMain.EnableMenu;
begin
  miLogin.Enabled := False;
  miLogout.Enabled := True;
  miCashier.Enabled := True;
  miImport.Enabled := True;
end;

procedure TfrmMain.DisableMenu;
begin
  miLogin.Enabled := True;
  miLogout.Enabled := False;
  miCashier.Enabled := False;
  //miImport.Enabled := False;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  iTemp: Integer;
begin
  eiMain := TAppUtils.GetEXEVersionData(Application.ExeName);
  {$IFDEF TSN}
  Self.Caption := eiMain.ProductName + ' TISERA '+ ' v ' + eiMain.FileVersion;
  {$ELSE}
  Self.Caption := eiMain.ProductName + ' ASSALAAM HYPERMARKET '+ ' v ' + eiMain.FileVersion;
  {$ENDIF}
  DisableMenu;

  //Store DB
  FDBServerStore := _INIReadString(CONFIG_FILE,DB_STORE,'DatabaseHost');
  FDBStore := _INIReadString(CONFIG_FILE,DB_STORE,'DatabasePath');
//  FDBUserStore := TAppUtils._Decrypt(TAppUtils._MakeOriginal(_INIReadString(CONFIG_FILE,DB_STORE,'UserIB')),START_KEY,MULTI_KEY,ADD_KEY);
//  FDBPasswordStore := TAppUtils._Decrypt(TAppUtils._MakeOriginal(_INIReadString(CONFIG_FILE,DB_STORE,'PasswordIB')),START_KEY,MULTI_KEY,ADD_KEY);
  FDBUserStore := _INIReadString(CONFIG_FILE,DB_STORE,'UserIB');
  FDBPasswordStore := _INIReadString(CONFIG_FILE,DB_STORE,'PasswordIB');

  //POS DB
  FDBServerPOS := _INIReadString(CONFIG_FILE,DB_POS,'DatabaseHost');
  FDBPOS       := _INIReadString(CONFIG_FILE,DB_POS,'DatabasePath');
  FDBUserPOS := _INIReadString(CONFIG_FILE,DB_POS,'UserIB');
  FDBPasswordPOS := _INIReadString(CONFIG_FILE,DB_POS,'PasswordIB');

  with dmMain do
  begin
    FMSSQLConnectionString := setConnectionString('MSSQL', FDBServerStore, FDBStore, FDBUserStore, FDBPasswordStore);
    FSQLiteConnectionString := setConnectionString('SQLite', FDBServerPOS, FDBPOS, FDBUserPOS, '');//FDBPasswordPOS);
    connGoro.Connected := False;
    dbPOS.Connected := False;
    connGoro.ConnectionString := FMSSQLConnectionString;
    dbPOS.ConnectionString    := FSQLiteConnectionString;
//    dbPOS.Params.Values['Encrypt'] := 'aes-ctr-128';
//    connGoro.Connected := True;
    dbPOS.Connected := True;
    IsPOSConnected := dmMain.dbPOS.Connected;
  end;

  // Init locale settings
  with FormatSettings do
  begin
    DateSeparator := '-';
    DecimalSeparator := '.';
    ThousandSeparator := ',';
    CurrencyString := 'Rp';
    CurrencyFormat := 2;
    CurrencyDecimals := 2;
    ShortDateFormat := 'dd-mm-yyyy';
    LongDateFormat := 'd mmmm yyyy';
  end;

  //FFilePathReport := GetFilePathReport;
  _INIWriteString(CONFIG_FILE, LOCAL_CLIENT, 'Localhost', IP);
  Host := _INIReadString(CONFIG_FILE, REFRESH_SERVER, 'RemoteHost');

  if TryStrToInt(getGlobalVar('PROD_CODE_LENGTH'), iTemp) then
     igProd_Code_Length := iTemp;
  if TryStrToInt(getGlobalVar('PRICEPRECISION'), iTemp) then
     igPrice_Precision := iTemp;
  if TryStrToInt(getGlobalVar('QTYPRECISION'), iTemp) then
     igQty_Precision := iTemp;

  FFormProperty := TFormProperty.Create;

  Initialize;

  //CommonDlg.ShowMessage(DM.dbPOS.DatabaseName);
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CommonDlg.ShowMessage('Aplikasi akan ditutup.');
  begin
    Action := caFree;
  end
end;

procedure TfrmMain.miExitClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmMain.miTransactionEndUserClick(Sender: TObject);
begin
  if Assigned(frmTransaksiKring) then
     if frmTransaksiKring.Showing then Exit;
  frmTransaksi := (ShowForm(TfrmTransaksi,wsMaximized)) as TfrmTransaksi;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
//  FreeAndNil(IBConn);
//  freeandnil(Cnn);
end;

function TfrmMain.GetTransactionNo(APOSCode: String; aActiveDate : TDateTime):
    String;
begin
  Result := '';

  if IsPOSConnected then
  begin
    with TPOS.Create(Self) do
    begin
      try
        if LoadByCode(APOSCode,UnitID, aActiveDate) then
        begin
          Result := Copy(TransactionNo,1,8) + FormatFloat('0000',CounterNo+1);
        end;
      finally
        Free;
      end;
    end;    // with
  end;

end;

function TfrmMain.Initialize: Boolean;
begin
//  Result := False;

  //sementara manual dulu
  Try
      UnitID       := _INIReadInteger(CONFIG_FILE,DB_POS,'UnitID');
      FPOSCode     := _INIReadString(CONFIG_FILE,DB_POS,'POSCode');
      FCashierCode := '';
      FCashierName := '';
      FBeginningBalanceID := -1; //95;

      TransNo := '';

      with sbMain do
      begin
        Panels[0].Text := 'Store DB : ' + FDBServerStore;  //IfThen(IsStoreConnected,'','Not') + ' Connected';
        Panels[1].Text := 'POS DB : ' + FDBServerPOS;  //IfThen(IsPOSConnected,'','Not') + ' Connected';
        Panels[2].Text := 'POS Code : ' + FPOSCode;
        Panels[3].Text := 'Cashier : ' + FCashierCode + ' - ' + FCashierName;
      end;    // with

    {
    Cnn := TConnection.create(frmMain.FIBServerStore,frmMain.FIBUserStore,
            frmMain.FIBPasswordStore, UnitID);
    try
         cnn.Connected := True;
    except
      on E: EIBInterBaseError do
      begin
        CommonDlg.ShowError('Connection failed!.' + #13
          + 'Please check your configuration again.' + #13
          +  E.Message);
      end;
    end;

      TransNo := GetTransactionNo(FPOSCode, cGetServerDateTime);
      Result := True;
      }
  except
      Result := False;
  end;
end;

procedure TfrmMain.tmrMainTimer(Sender: TObject);
begin
  if tmrMain.Enabled then
  begin
    sbMain.Panels[4].Text := FormatDateTime('dd-MM-yyyy',Now);
    sbMain.Panels[5].Text := FormatDateTime('hh:nn:ss',Now);
  end
  else
  begin
    sbMain.Panels[4].Text := '';
    sbMain.Panels[5].Text := '';
  end;
end;

procedure TfrmMain.mnPaymentClick(Sender: TObject);
var
  fQtyAir : Double;
  i, j    : Integer;
  isValid : boolean;
begin
  frmTransaksi := GetFormByClass(TfrmTransaksi) as TfrmTransaksi;
  frmTransaksiKring := GetFormByClass(TfrmTransaksiKring) as TfrmTransaksiKring;
  if frmTransaksi <> nil then
  begin
    //Try Checking Transaction
    isValid := True;
    with frmTransaksi.sgTransaksi.DataController do
    begin
      i := 0;
      while i < RecordCount do
      begin
        if Values[i, _KolPairCode] <> '' then
        begin
            isValid := False;
            fQtyAir := Values[i, _KolJumlah];
            j := 0;
            while j < RecordCount do
            begin
                if Values[j, _KolPLU] = Values[i, _KolPairCode] then
                begin
                    if fQtyAir<=Values[j, _KolJumlah] then
                       isValid := True;
                end;
                j := j + 1;
            end;
        end;
        i := i + 1;
      end;
    end;

    if not isValid then
    begin
       frmTransaksi.ShowInfo('Transaksi Tidak Valid, Cek Jumlah Air dan Galon');
       exit;
    end;

    frmTransaksi.ShowPayment;

  end
  else if frmTransaksiKring <> nil then
  begin
    frmTransaksiKring.ShowPayment;

  end;

end;

procedure TfrmMain.PrintHeader1Click(Sender: TObject);
var
  SS : TStrings;
begin
  {SS := TStringList.Create;
  Try
    SS.LoadFromFile(cGetAppPath + 'utils\' + FILE_HEADER);
    PrintStrings(SS);
  Finally
    SS.Free;
  end;
  }
end;

procedure TfrmMain.miTransactionTraderClick(Sender: TObject);
begin
  if Assigned(frmTransaksi) then
  Try
     if frmTransaksi.Showing then
     begin
        frmTransaksi.btnResetClick(Sender);
     end;
  Except
  end;
  ShowForm(TfrmTransaksiKring,wsMaximized);
end;

procedure TfrmMain.miLogoutClick(Sender: TObject);
var
   i: integer;
begin
  for i := Self.MDIChildCount-1 downto 0 do
    MDIChildren[i].Close;
  DisableMenu;
  Initialize;
  if not assigned(frmLogin) then
    frmLogin := TfrmLogin.Create(Application);
end;

procedure TfrmMain.miTransactionPending1Click(Sender: TObject);
begin
  frmTransaksiPending := (ShowForm(TfrmTransaksiPending,wsMaximized)) as TfrmTransaksiPending;
end;

procedure TfrmMain.miLoginClick(Sender: TObject);
begin
  frmLogin := (ShowForm(TfrmLogin,wsNormal)) as TfrmLogin;
  {
  FFormProperty.FLoginId        := FUserID;
  FFormProperty.FLoginUnitId    := FLoginUnitId;
  FFormProperty.FLoginRole      := 'operator';
  FFormProperty.FLoginUsername  := FCashierName;
  FFormProperty.FFilePathReport := '.\UTILS\';
  FFormProperty.FSelfUnitId     := FUnitID;
  FFormProperty.FIpClient       := IP;
  FFormProperty.FHostClient     := Host;
  FFormProperty.FTipeApp        := TSTORE;

  FFormProperty.FSelfCompanyID := 3;

  FFormProperty.FMasterIsStore := 0; //pos=0
  FFormProperty.FMasterIsHo    := 0;
  }
end;

procedure TfrmMain.Bantuan1Click(Sender: TObject);
begin
  mmoHelp.Visible := not mmoHelp.Visible;
end;

procedure TfrmMain.ExportDataPOS1Click(Sender: TObject);
begin
  frmExportOfflinePOS := (ShowForm(TfrmExportOfflinePOS,wsMaximized)) as TfrmExportOfflinePOS;
  frmExportOfflinePOS.UnitID := frmMain.UnitID;
end;

procedure TfrmMain.ImportDataStore1Click(Sender: TObject);
begin
  frmImportFromStore := (ShowForm(TfrmImportFromStore,wsMaximized)) as TfrmImportFromStore;
  frmImportFromStore.UnitID := frmMain.UnitID;
end;

procedure TfrmMain.miMasterSellingProductClick(Sender: TObject);
begin
//  frmProductForSelling := TfrmProductForSelling.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.MDIChildCreated(const childHandle : THandle);
begin
//nothing
end;

procedure TfrmMain.MDIChildDestroyed(const childHandle : THandle);
begin
// nothing
end;

procedure TfrmMain.SetLoginUsername(const Value: string);
begin
  if FLoginUsername <> Value then
  begin
    FLoginUsername := Value;
  end;
end;

procedure TfrmMain.SetLoginUnitId(const Value: Integer);
begin
  if FLoginUnitId <> Value then
  begin
    FLoginUnitId := Value;
  end;
end;

procedure TfrmMain.EnableSubMenu(AMenu: TMenuItem; AValue: boolean);
var
  i: integer;
begin
  for i:=0 to AMenu.Count-1 do
    AMenu.Items[i].Enabled := AValue;

  // set invisible to menu
  AMenu.Visible := AValue;
end;

procedure TfrmMain.ExportDataToMDBClick(Sender: TObject);
begin
  frmExportToMDB := TfrmExportToMDB.CreateWithUser(Application, FFormProperty);
  {
  frmExportToMDB.UserID   := FFormProperty.FLoginId;
  frmExportToMDB.UnitID   := FFormProperty.FLoginUnitId;
  frmExportToMDB.CompID   := FFormProperty.FSelfCompanyID;
  frmExportToMDB.PosCode  := FPOSCode;
  }
end;

procedure TfrmMain.ImportDataFromMDBClick(Sender: TObject);
begin
  frmImportFromMDB := TfrmImportFromMDB.CreateWithUser(Application, FFormProperty);
  {frmImportFromMDB.UserID   := FFormProperty.FLoginId;
  frmImportFromMDB.UnitID   := FFormProperty.FLoginUnitId;
  frmImportFromMDB.CompID   := FFormProperty.FSelfCompanyID;
  frmImportFromMDB.PosCode  := FPOSCode;
  }
end;

procedure TfrmMain.miProduct1Click(Sender: TObject);
begin
//  frmProductForSelling := TfrmProductForSelling.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.UpdateMaster1Click(Sender: TObject);
begin
  frmPosDownlink := (ShowForm(TfrmPosDownlink,wsMaximized)) as TfrmPosDownlink;
end;

end.
