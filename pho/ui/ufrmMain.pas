unit ufrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.ComCtrls,
  System.Actions, Vcl.ActnList, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxStatusBar, Vcl.StdCtrls, uFormProperty, uGlobalProperty,
  uCompany, ufrmBank, System.UITypes;

type
  TRole = (rNobody, rAdmin, rManager, rAccounting, rMerchandise, rFinance, rCoba);
  TfrmMain = class(TForm)
    mmMainMenu: TMainMenu;
    pnlHeader: TPanel;
    imgHeader: TImage;
    actlstMain: TActionList;
    actOnCreateForm: TAction;
    actOnLogout: TAction;
    actOnLogin: TAction;
    actOnExit: TAction;
    actModule1: TAction;
    actCascade: TAction;
    actTile: TAction;
    actArrange: TAction;
    actCloseAll: TAction;
    actAuthentikasiModul: TAction;
    actPajak: TAction;
    actSupplierType: TAction;
    actUOM: TAction;
    actGroupSubGroupCat: TAction;
    actMerchanGroup: TAction;
    actSalesOutlet: TAction;
    actUnitStore: TAction;
    actCompanyType: TAction;
    actBank: TAction;
    actProductType: TAction;
    actDataSupplier: TAction;
    actSupplierProduct: TAction;
    actDataProduct: TAction;
    actDataCompetitor: TAction;
    actCompetitorProduct: TAction;
    actTipePembayaran: TAction;
    actTipePengirimanPO: TAction;
    actHariLibur: TAction;
    actClaimFaktur: TAction;
    actAdjustmentFaktur: TAction;
    actMonitoringCekGiro: TAction;
    actPaymentFaktur: TAction;
    actIGRADesc: TAction;
    actLokasi: TAction;
    actListAPBalance: TAction;
    actClaimContrabon: TAction;
    actPaymentContrabon: TAction;
    actListARBalance: TAction;
    actImportEOD: TAction;
    actInputContrabon: TAction;
    actPotonganTagihan: TAction;
    actInvoiceSewaToko: TAction;
    actMasterAgreement: TAction;
    actMasterAdjustment: TAction;
    actAdjustmentJurnalCode: TAction;
    actListNP: TAction;
    actExportSync: TAction;
    actListDisbursement: TAction;
    actListARPayment: TAction;
    actListAgreementDetil: TAction;
    actImportSync: TAction;
    actUOMNBD: TAction;
    actProductTypeNBD: TAction;
    actMasterProductNBD: TAction;
    actUserGroup: TAction;
    actUser: TAction;
    actMasterCustomer: TAction;
    actValidateContrabon: TAction;
    actARPayment: TAction;
    actDisburstment: TAction;
    actReceipt: TAction;
    actTransferDeposit: TAction;
    actAPPayment: TAction;
    actVoucher: TAction;
    actSetupCashManagement: TAction;
    actPendingCheque: TAction;
    actStandardJournal: TAction;
    actFixAsset: TAction;
    actSetupFixAsset: TAction;
    actMasterAmortisasi: TAction;
    actSellingAsset: TAction;
    actDisplayDepreciationSchedule: TAction;
    actListingClaim: TAction;
    actADSMasuk: TAction;
    actADSKeluar: TAction;
    actMenuPrintSalesAnalys: TAction;
    actPostingDeprAmor: TAction;
    actAccountingPeriode: TAction;
    actInvoice: TAction;
    actAutomaticAccrual: TAction;
    actPrintTransferList: TAction;
    actTrialBalance: TAction;
    actGeneralLedger: TAction;
    actRekening: TAction;
    actBalanceSheet: TAction;
    actProfitLoss: TAction;
    actListingJurnal: TAction;
    actClosingFiscalYear: TAction;
    actJurnalEntry: TAction;
    actOpeningFiscalYear: TAction;
    actPemakaianBarcode: TAction;
    actListPemakaianBarcode: TAction;
    actPostingJournal: TAction;
    actUnpostingJournal: TAction;
    actJournalAutomatic: TAction;
    actGeneralLedgerCY: TAction;
    actBalanceSheetCY: TAction;
    actProfitLossCY: TAction;
    actPaymentClaimContrabon: TAction;
    actElectricCustomer: TAction;
    actElectricTransaction: TAction;
    actElectricInvoice: TAction;
    actCashFlow: TAction;
    actCashBalance: TAction;
    actDailyBalance: TAction;
    actPaymentClaimTransfer: TAction;
    actElectricPayment: TAction;
    actQuotation: TAction;
    actMarkUpSellingPrice: TAction;
    actHistoryPrice: TAction;
    actListingAgreement: TAction;
    actInvoiceAssgros: TAction;
    actPaymentAssgros: TAction;
    actListDoOutstanding: TAction;
    actListingAgingInvoiceAssgros: TAction;
    actListAPPayment: TAction;
    actListClaimFakturPajak: TAction;
    actPendingCekOutCekAPNBD: TAction;
    actListingReceipt: TAction;
    actListingGeneralLedger: TAction;
    actListCNOutstanding: TAction;
    actListMonthlyDepreciation: TAction;
    actListChequeGiroRegister: TAction;
    actCustomerVoucher: TAction;
    actAgreementVoucher: TAction;
    actGenerateVoucher: TAction;
    actListQuotation: TAction;
    actListBankDeposit: TAction;
    actJournalAutomaticFinance: TAction;
    actListScheduleAgreement: TAction;
    actDailySalesReport: TAction;
    actPrintWorksheet: TAction;
    actCashierCollectionReport: TAction;
    actListRecapCreditDebetCard: TAction;
    actPrintPurchaseOrder: TAction;
    actListingPOByMerchandisingGroup: TAction;
    actPrintRecapitulationPO: TAction;
    actHistoryPO: TAction;
    actPrintHistoryPOBySupplier: TAction;
    actListPOCancel: TAction;
    actListingReceivingProduct: TAction;
    actRekapitulasiCN: TAction;
    actListAdjustmentProduct: TAction;
    actListOutstandingDOAssgros: TAction;
    actListPODOReceive: TAction;
    actListOmzet: TAction;
    actSalesReportContrabon: TAction;
    actDailySalesAnalysis: TAction;
    actListCNDamage: TAction;
    actListCashBalance: TAction;
    actListProduct: TAction;
    actListSupplier: TAction;
    actSupplierNBD: TAction;
    actListInvoice: TAction;
    actPriceConfirmation: TAction;
    actListChangeSellingPrice: TAction;
    actAturanBonus: TAction;
    actQuotationPromo: TAction;
    actSettingJurnal: TAction;
    actGenerateJurnal: TAction;
    actQuotationHargaBeli: TAction;
    actGenerateJurnalManual: TAction;
    actTransaksiJurnal: TAction;
    actPurchaseSuggestion: TAction;
    actGenPO: TAction;
    actPrintPO: TAction;
    actApprovalPO: TAction;
    actCancPO: TAction;
    actDispPO: TAction;
    actChangeStatPO: TAction;
    actActionList: TAction;
    actSysParameter: TAction;
    actSupplierGroup: TAction;
    actReprintNP: TAction;
    actJurnal: TAction;
    actListingProductNBD: TAction;
    actRumusJurnal: TAction;
    actPkmAvg: TAction;
    actListQuotMailer: TAction;
    actListQuotHargaBeli: TAction;
    actEODHO: TAction;
    actMasterSupNBD: TAction;
    actListBankBalance: TAction;
    actBankDeposit: TAction;
    actDetilAgrment: TAction;
    actUserGroupMerchan: TAction;
    actSuplierUnitLeadTime: TAction;
    actUnitLeadTime: TAction;
    actLaporanKonsinyasi: TAction;
    actLapInvMovementQty: TAction;
    actDisplayPO: TAction;
    actUbahQtyDisk: TAction;
    actLaporanKonsinyasiAll: TAction;
    actLaporanMutasiKeluar: TAction;
    actLaporanMutasiMasuk: TAction;
    actStatusEximp: TAction;
    actLapReturSup: TAction;
    actLaporanTransaksiDetil: TAction;
    actAuthor: TAction;
    actSOconsole: TAction;
    actPOBonus: TAction;
    mmSistem: TMenuItem;
    miLogin: TMenuItem;
    miLogout: TMenuItem;
    MenuItem1: TMenuItem;
    miExit: TMenuItem;
    mmSetting1: TMenuItem;
    miConnectionDatabase: TMenuItem;
    MenuItem2: TMenuItem;
    miGlobalParameter: TMenuItem;
    mmWindow: TMenuItem;
    miCascade: TMenuItem;
    miTile: TMenuItem;
    miArrange: TMenuItem;
    MenuItem3: TMenuItem;
    miCloseAll: TMenuItem;
    SysParam: TMenuItem;
    mmAbout1: TMenuItem;
    miHeadOfficeHelp: TMenuItem;
    MenuItem4: TMenuItem;
    miAbout: TMenuItem;
    sbMain: TdxStatusBar;
    pnlUnit: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    cbbUnit: TComboBox;
    cbbCompCode: TComboBox;
    Referensi1: TMenuItem;
    Bank1: TMenuItem;
    Pajak1: TMenuItem;
    actSysParm: TAction;
    actSysParmComp: TAction;
    ProductType1: TMenuItem;
    Finance1: TMenuItem;
    Rekening1: TMenuItem;
    procedure actBankExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actOnLogoutExecute(Sender: TObject);
    procedure actCloseAllExecute(Sender: TObject);
    procedure actCompanyTypeExecute(Sender: TObject);
    procedure actHariLiburExecute(Sender: TObject);
    procedure actLokasiExecute(Sender: TObject);
    procedure actMasterCustomerExecute(Sender: TObject);
    procedure actOnCreateFormExecute(Sender: TObject);
    procedure actOnExitExecute(Sender: TObject);
    procedure actOnLoginExecute(Sender: TObject);
    procedure actPajakExecute(Sender: TObject);
    procedure actProductTypeExecute(Sender: TObject);
    procedure actProductTypeNBDExecute(Sender: TObject);
    procedure actRekeningExecute(Sender: TObject);
    procedure actSupplierTypeExecute(Sender: TObject);
    procedure actSysParmCompExecute(Sender: TObject);
    procedure actSysParmExecute(Sender: TObject);
    procedure actTipePengirimanPOExecute(Sender: TObject);
    procedure actUOMExecute(Sender: TObject);
    procedure actUOMNBDExecute(Sender: TObject);
    procedure actUserExecute(Sender: TObject);
    procedure actUserGroupExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure miConnectionDatabaseClick(Sender: TObject);
  private
    FPanelLoading: TPanel;
    FFormProperty: TFormProperty;
    FGlobalProperty: TGlobalProperty;
    procedure EnableSubMenu(AMenu: TMenuItem; AValue: boolean);
    procedure SetStatusHOSTORE;
    //FIsStore: Integer;
    //FLoginFullname: string;
    //FLoginId: Integer;
    //FLoginRole: string;
    //FLoginUnitId: Integer;
    //FLoginUsername: string;
//    FLoginUserID : Integer;
//    FLoginUserUntID : Integer;

    procedure SettingMainMenu(ARole: TRole);
    { Private declarations }
  public
    Host, IP: string;
    Port: integer;
    procedure LoginExecute;
    { Public declarations }
  end;

procedure OpenLoading(AMessage: string);

procedure CloseLoading;

var
  frmMain: TfrmMain;

implementation

uses
    uMenuManagement, uNetUtils, uTSINIFile, uConstanta, uAppUtils, uRetnoUnit,
    ufrmLogin, ufraLoading, ufrmPajak, ufrmRekening, ufrmTipePerusahaan,
  ufrmHariLibur, ufrmLokasi, ufrmProductType, ufrmProductTypeNBD,
  ufrmSupplierType, ufrmSysParm, ufrmTipePengirimanPO, ufrmSatuan, ufrmUser,
  ufrmUserGroup, ufrmMasterCustomer;

{$R *.dfm}

procedure OpenLoading(AMessage: string);
var
  FfraLoading: TfraLoading;
begin
  Application.ProcessMessages;
  // if not assigned(frmMain.FPanelLoading) then
    frmMain.FPanelLoading := TPanel.Create(Application);
  with frmMain.FPanelLoading do
  begin
    AutoSize := true;
    BorderStyle := bsNone;
    BorderWidth := 10;
    Parent := Application.MainForm;

    FfraLoading := TfraLoading.Create(frmMain.FPanelLoading);
    FfraLoading.LoadingMessage := AMessage;
    FfraLoading.Parent := frmMain.FPanelLoading;
    Top := (frmMain.Height-frmMain.FPanelLoading.Height) div 2;
    Left := (frmMain.Width-frmMain.FPanelLoading.Width) div 2;
  end;

  frmMain.FPanelLoading.Align := alNone;
  Application.ProcessMessages;
end;

procedure CloseLoading;
begin
  if assigned(frmMain.FPanelLoading) then
  begin
    frmMain.FPanelLoading.Free;
    frmMain.FPanelLoading := nil;
  end;
end;

procedure TfrmMain.actBankExecute(Sender: TObject);
begin
  frmBank := tfrmBank.Create(Self);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  iTemp: Integer;
  erMsg: string;
begin
  FFormProperty   := TFormProperty.Create;
  FGlobalProperty := TGlobalProperty.Create;

  // Init locale settings
  with FormatSettings do
  begin
    DateSeparator     := '-';
    DecimalSeparator  := '.';
    ThousandSeparator := ',';
    CurrencyString    := 'Rp';
    CurrencyFormat    := 2;
    CurrencyDecimals  := 2;
    ShortDateFormat   := 'dd-MM-yyyy';
    LongDateFormat    := 'd MMMM yyyy';
  end;
  GetIPFromHost(Host,IP,erMsg);
  _INIWriteString(CONFIG_FILE, LOCAL_CLIENT, 'Localhost', IP);
  Port := _INIReadInteger(CONFIG_FILE, LOCAL_CLIENT, 'LocalPort'); // must: 49515

//  FFilePathReport := GetFilePathReport;

  frmMain.Height  := 640;
  frmMain.Width   := 800;
  frmMain.Caption := ExtractFileName(ParamStr(0)) + ' ver ' + GetAppVersionStr;

  // set menu on user nobody
  actOnLogin.Enabled := true;
  actOnLogout.Enabled := false;
  SettingMainMenu(rNobody);

  //Get global Variable
  if TryStrToInt(getGlobalVar('PROD_CODE_LENGTH'), iTemp) then
     igProd_Code_Length := iTemp;
  if TryStrToInt(getGlobalVar('PRICEPRECISION'), iTemp) then
     igPrice_Precision := iTemp;

  // setting invisible panel unit
  pnlUnit.Visible := false;
end;

procedure TfrmMain.actCloseAllExecute(Sender: TObject);
var i: integer;
begin
  for i := Self.MDIChildCount-1 downto 0 do
    MDIChildren[i].Close;
end;

procedure TfrmMain.actCompanyTypeExecute(Sender: TObject);
begin
    frmTipePerusahaan := TfrmTipePerusahaan.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actHariLiburExecute(Sender: TObject);
begin
    frmHariLibur := TfrmHariLibur.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actLokasiExecute(Sender: TObject);
begin
    frmLokasi := TfrmLokasi.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actMasterCustomerExecute(Sender: TObject);
begin
    frmMasterCustomer := TfrmMasterCustomer.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actOnCreateFormExecute(Sender: TObject);
var
  iTemp: Integer;
  erMsg: string;
begin
  FFormProperty   := TFormProperty.Create;
  FGlobalProperty := TGlobalProperty.Create;

  // Init locale settings
  with FormatSettings do
  begin
    DateSeparator := '-';
    DecimalSeparator := '.';
    ThousandSeparator := ',';
    CurrencyString := 'Rp';
    CurrencyFormat := 2;
    CurrencyDecimals := 2;
    ShortDateFormat := 'dd-MM-yyyy';
    LongDateFormat := 'd MMMM yyyy';
  end;
  GetIPFromHost(Host,IP,erMsg);
  _INIWriteString(CONFIG_FILE, LOCAL_CLIENT, 'Localhost', IP);
  Port := _INIReadInteger(CONFIG_FILE, LOCAL_CLIENT, 'LocalPort'); // must: 49515

//  FFilePathReport := GetFilePathReport;

  frmMain.Height := 640;
  frmMain.Width := 800;
  frmMain.Caption := ParamStr(0) + ' ver ' + GetAppVersionStr;

  // set menu on user nobody
  actOnLogin.Enabled := true;
  actOnLogout.Enabled := false;
  SettingMainMenu(rNobody);

  //Get global Variable
  if TryStrToInt(getGlobalVar('PROD_CODE_LENGTH'), iTemp) then
     igProd_Code_Length := iTemp;
  if TryStrToInt(getGlobalVar('PRICEPRECISION'), iTemp) then
     igPrice_Precision := iTemp;

  // setting invisible panel unit
  pnlUnit.Visible := false;
end;

procedure TfrmMain.actOnExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.actOnLoginExecute(Sender: TObject);
var
  FdefUnitId: Integer;
begin
  // if not assigned(frmLogin) then
  frmLogin := TfrmLogin.Create(Application);
  frmLogin.ShowFormLogin(LOGIN_PAGE);

  if (LoginSuccessfull) then
  begin

//    FdefUnitId  := GetHOUnitID;  //khusus HO, mengakomodir jika DB HO &WH di jadikan 1.
//    if FdefUnitId = 0 then
           FdefUnitId  := StrToInt(getGlobalVar('UNITID')); //unit dan db untuk wh dan ho dijadikan 1

    FFormProperty.FMasterIsStore := GetIsStoreUnitID(FdefUnitId);

//    FGlobalProperty.LIstMerID     := GetListMerchanID(frmLogin.LoginID, frmLogin.LoginUntID);
//    aListMerID                    := FGlobalProperty.LIstMerID;
    FFormProperty.FLoginId        := frmLogin.LoginID;
    FFormProperty.FLoginUnitId    := frmLogin.LoginUntID;
    FFormProperty.FLoginRole      := frmLogin.LoginUserName;
    FFormProperty.FLoginUsername  := frmLogin.LoginUserName;
    FFormProperty.FFilePathReport := GetReportPath;
    FFormProperty.FSelfUnitId     := FdefUnitId;
    FFormProperty.FIpClient       := IP;
    FFormProperty.FHostClient     := Host;
    FFormProperty.FTipeApp        := THO;

//    with cOpenQuery(GetSQLisHOisStore(frmLogin.LoginUntID)) do
//    begin
//      try
//        FFormProperty.FLoginIsStore   := FieldByName('UNT_IS_STORE').AsInteger;
//      finally
//        Free;
//      end;
//    end;

    SetStatusHOSTORE;

    lUnitId := FFormProperty.FSelfUnitId;

    OpenLoading(USER_LOGIN_LOADING);
    LoginExecute;
    CloseLoading;
  end; // end if

  frmLogin := nil;
  frmLogin.Free;
end;

procedure TfrmMain.actOnLogoutExecute(Sender: TObject);
begin
  actCloseAllExecute(self);

  actOnLogin.Enabled := true;
  actOnLogout.Enabled := false;

  //drop menu user
  try
    if not assigned(MenuManagement) then
      MenuManagement := TMenuManagement.Create;
    MenuManagement.dropMenuUser;
  except
  end;

  SettingMainMenu(rNobody);

  // setting invisible panel unit
  pnlUnit.Visible := false;

  with sbMain do
  begin
    Panels[0].Text := 'User Login: ';
    Panels[1].Text := 'Role: ';
    Panels[2].Text := 'Database: ';
  end; // end with

  // send message to refresh server: user_online on HO
//  SendRefreshServerMessage(Format('UNREGISTER$HO$%s:%d$%s$as$%s', [IP,Port,FFormProperty.FLoginFullname,FFormProperty.FLoginRole]));
end;

procedure TfrmMain.actPajakExecute(Sender: TObject);
begin
  frmPajak := TfrmPajak.Create(Self) //WithUser(Application, FFormProperty);
end;

procedure TfrmMain.actProductTypeExecute(Sender: TObject);
begin
    frmProductType := TfrmProductType.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actProductTypeNBDExecute(Sender: TObject);
begin
    frmProductTypeNBD := TfrmProductTypeNBD.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actRekeningExecute(Sender: TObject);
begin
    frmRekening := TfrmRekening.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actSupplierTypeExecute(Sender: TObject);
begin
    frmSupplierType := TfrmSupplierType.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actSysParmCompExecute(Sender: TObject);
begin
    frmSysParm := TfrmSysParm.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actSysParmExecute(Sender: TObject);
begin
  if not Assigned(frmSysParm) then
    frmSysParm := TfrmSysParm.Create(Application);

  frmSysParm.Show;
end;

procedure TfrmMain.actTipePengirimanPOExecute(Sender: TObject);
begin
    frmTipePengirimanPO := TfrmTipePengirimanPO.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actUOMExecute(Sender: TObject);
begin
    frmSatuan := TfrmSatuan.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actUOMNBDExecute(Sender: TObject);
begin
    //frmSatuan_NBD := TfrmSatuan_NBD.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actUserExecute(Sender: TObject);
begin
    frmUser := TfrmUser.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actUserGroupExecute(Sender: TObject);
begin
    frmUserGroup := TfrmUserGroup.CreateWithUser(Application, FFormProperty);
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

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FFormProperty);
  FreeAndNil(FGlobalProperty);
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (MessageDlg('Are you sure you wish to quit ' + Application.Title +' ?', mtConfirmation, mbYesNo,0) = mrYes) then
  begin
    if (actOnLogout.Enabled) then
      actOnLogoutExecute(self);
    CanClose := true;
  end
  else
    CanClose := false;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  if IsHODeveloperMode then
  begin
    if _INIReadString(CONFIG_FILE, 'LOGIN', 'islangsung') = '1' then
      actOnLoginExecute(nil);
  end;
end;

procedure TfrmMain.LoginExecute;
begin
    with sbMain do
    begin
      Panels[0].Text := 'User Login: ' + FFormProperty.FLoginFullname;
      Panels[1].Text := 'Role: ' + FFormProperty.FLoginRole;
      Panels[2].Text := 'Database: ';// + ADConn.DBHost + ':' + ADConn.DBPath;
    end; // end with

    actOnLogin.Enabled := false;
    actOnLogout.Enabled := true;
    EnableSubMenu(mmWindow, true);
    if not assigned(MenuManagement) then
      MenuManagement := TMenuManagement.Create;

    with MenuManagement do
    begin
      UserId   := FFormProperty.FLoginId;
      UserUnt  := FFormProperty.FLoginUnitId;
      try
        setMenuUser;
      except
      end;
    end;

    // setting visible panel unit
    pnlUnit.Visible := true;
//    ParseCompanyToCombo;
//    ParseUnitToCombo;

    // send message to refresh server: user_online on HO
//    SendRefreshServerMessage(Format('REGISTER$HO$%s:%d$%s$as$%s', [IP,Port,FFormProperty.FLoginFullname,FFormProperty.FLoginRole]));

end;

procedure TfrmMain.miConnectionDatabaseClick(Sender: TObject);
begin
  frmLogin := TfrmLogin.Create(Application);
  frmLogin.IsForSetting := true;
  frmLogin.Caption := 'Setting Connection';
  frmLogin.ShowFormLogin(CONNECTION_PAGE);
end;

procedure TfrmMain.SetStatusHOSTORE;
begin
//  with cOpenQuery(GetSQLisHOisStore(StrToInt(getGlobalVar('UNITID')))) do
//  with cOpenQuery(GetSQLisHOisStore(FFormProperty.FSelfUnitId)) do
//  begin
//    try
//      FFormProperty.FMasterIsStore := FieldByName('UNT_IS_STORE').AsInteger;
//      FFormProperty.FMasterIsHo    := FieldByName('UNT_IS_HO').AsInteger;
//    finally
//      Free;
//    end;
//  end;
end;

procedure TfrmMain.SettingMainMenu(ARole: TRole);
begin
  EnableSubMenu(mmWindow, false);
  EnableSubMenu(miConnectionDatabase, true);
  EnableSubMenu(miGlobalParameter, false);
  if ARole = rCoba then
  Begin
    EnableSubMenu(mmWindow, false);
    EnableSubMenu(miConnectionDatabase, true);
    EnableSubMenu(miGlobalParameter, false);
  End;
end;

end.
