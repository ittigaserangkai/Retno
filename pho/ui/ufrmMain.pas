unit ufrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.ComCtrls,
  System.Actions, Vcl.ActnList, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxStatusBar, Vcl.StdCtrls, uFormProperty, uGlobalProperty;

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
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actOnLogoutExecute(Sender: TObject);
    procedure actCloseAllExecute(Sender: TObject);
    procedure actOnCreateFormExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FFormProperty: TFormProperty;
    FGlobalProperty: TGlobalProperty;
    procedure EnableSubMenu(AMenu: TMenuItem; AValue: boolean);
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
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
    uMenuManagement, uNetUtils, uTSINIFile, uConstanta, uAppUtils;

{$R *.dfm}

procedure TfrmMain.actCloseAllExecute(Sender: TObject);
var i: integer;
begin
  for i := Self.MDIChildCount-1 downto 0 do
    MDIChildren[i].Close;
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
