unit ufrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.ComCtrls,
  System.Actions, Vcl.ActnList, uFormProperty, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxStatusBar, Vcl.StdCtrls, ufrmSO, ufrmMasterBrowse, uDMClient, uModUnit,
  cxClasses, Vcl.AppEvnts, ufrmCN, dxBar, System.ImageList, Vcl.ImgList,
  dxRibbonSkins, dxRibbonCustomizationForm, dxRibbon, dxRibbonMiniToolbar, ufrmSettingApp,
  ufrmInventoryMovement, ufrmDOForTrader, ufrmDOBonus;

type
  TRole = (rNobody, rAdmin, rStoreManager, rSO, rPO, rIGRA, rSupvCashier);
  TfrmMain = class(TForm)
    mmMainMenu: TMainMenu;
    mmSistem1: TMenuItem;
    miLogin1: TMenuItem;
    miLogout1: TMenuItem;
    MenuItem1: TMenuItem;
    miExit1: TMenuItem;
    mmSetting1: TMenuItem;
    miConnectionDatabase: TMenuItem;
    MenuItem2: TMenuItem;
    miGlobalParameter1: TMenuItem;
    mmWindow: TMenuItem;
    miCascade1: TMenuItem;
    miTile1: TMenuItem;
    miArrange1: TMenuItem;
    MenuItem3: TMenuItem;
    miCloseAll1: TMenuItem;
    SysParam1: TMenuItem;
    mmAbout1: TMenuItem;
    miHeadOfficeHelp1: TMenuItem;
    MenuItem4: TMenuItem;
    miAbout1: TMenuItem;
    sbMain: TdxStatusBar;
    actlstMain: TActionList;
    actOnCreateForm: TAction;
    actOnLogout: TAction;
    actOnLogin: TAction;
    actOnExit: TAction;
    actCascade: TAction;
    actTile: TAction;
    actFinalPayment: TAction;
    actArrange: TAction;
    actCloseAll: TAction;
    actInputSupplierNotForSO: TAction;
    actInputProductNotForSO: TAction;
    actCreateSO: TAction;
    actGeneratePOForAll: TAction;
    actGeneratePOBySupplier: TAction;
    actCancellingPO: TAction;
    actChangeStatusPO: TAction;
    actApprovalPO: TAction;
    actGoodsReceiving: TAction;
    actServiceLevel: TAction;
    actCNGoodReceiving: TAction;
    actReturBarang: TAction;
    actDSI: TAction;
    actWastageObral: TAction;
    actWastageReal: TAction;
    actInputProductIGRA: TAction;
    actAdjustProductTurunan: TAction;
    actAdjustProductKemasan: TAction;
    actMutasiStok: TAction;
    actGoodsReceivingBonus: TAction;
    actReprintNP: TAction;
    actCNReceiving: TAction;
    actDNReceiving: TAction;
    actReturReplace: TAction;
    actReturDamage: TAction;
    actGoodReceivingReplace: TAction;
    actActivatePOS: TAction;
    actBeginBalancePOS: TAction;
    actProductForSelling: TAction;
    actMaintenancePassword: TAction;
    actAdjustmentCashier: TAction;
    actCreditCard: TAction;
    actCashDropping: TAction;
    actResetCashier: TAction;
    actReturNota: TAction;
    actDisplayPOSTransaction: TAction;
    actDisplayPOSMonitor: TAction;
    actDisplayLastTransactionNo: TAction;
    actDisplayCCAndCashback: TAction;
    actAdjustmentCashback: TAction;
    actExportSync: TAction;
    actImportSync: TAction;
    actPOFromTrader: TAction;
    actTrader: TAction;
    actMemberShip: TAction;
    actMemberActivation: TAction;
    actPrintPO: TAction;
    actCrazyPrice: TAction;
    actDataCostumer: TAction;
    actSalesReportContrabon: TAction;
    actVoucherBotol: TAction;
    actShift: TAction;
    actCustomerAgreement: TAction;
    actGenerateVoucher: TAction;
    actEODForPOS: TAction;
    actBroadcastDownload: TAction;
    actDOForTrader: TAction;
    actDailySalesReport: TAction;
    actReprintNota: TAction;
    actCashierCollectionReport: TAction;
    actDailySalesAnalysis: TAction;
    actRekapitulasiCN: TAction;
    actPrintPurchaseOrder: TAction;
    actPrintWorksheet: TAction;
    actListingPOByMerchandisingGroup: TAction;
    actPrintRecapitulationPO: TAction;
    actPrintHistoryPOBySupplier: TAction;
    actListRecapCreditDebetCard: TAction;
    actUnpackingStok: TAction;
    actStokOpnam: TAction;
    actStockAdjustment: TAction;
    actPeriodeStokOpnam: TAction;
    actFormStokOpnam: TAction;
    actKoordinatorStokOpnam: TAction;
    actTimStokOpnam: TAction;
    actMaintenanceBarcode: TAction;
    actLokasiStokOpnam: TAction;
    actSetupProductTurunan: TAction;
    actProduct: TAction;
    actSupplier: TAction;
    actHistoryPO: TAction;
    actListingReceivingProduct: TAction;
    actListOutstandingDOTrader: TAction;
    actAdjustmentProduct: TAction;
    actListCNMerchandisePerSuplier: TAction;
    actListPODOReceive: TAction;
    actListOmzet: TAction;
    actListingProductIGRA: TAction;
    actDisplayPO: TAction;
    actListMembership: TAction;
    actBarcodeRequest: TAction;
    actListWastage: TAction;
    actListPOCancel: TAction;
    actListingRankingCNWastage: TAction;
    actListingSupplierHaveCN: TAction;
    actPriceConfirmation: TAction;
    actListAdjustmentProduct: TAction;
    actPriceConfirmationKring33: TAction;
    actListDailyTransaction: TAction;
    actPOBonus: TAction;
    actSettingJurnal: TAction;
    actretursupplier: TAction;
    actGenerateJurnal: TAction;
    actTransferBarangBonus: TAction;
    actLaporanWastage: TAction;
    actUbahQtyPO: TAction;
    actStockProduct: TAction;
    actMutasiKeluar: TAction;
    actMutasiMasuk: TAction;
    actGudang: TAction;
    actListMutasiStok: TAction;
    actOmzet: TAction;
    actAdjustmentStock: TAction;
    actListBarcodeRequest: TAction;
    actAdjustmentStockList: TAction;
    actBarcodeRequestSlip: TAction;
    actWastageRealList: TAction;
    actDiscMember: TAction;
    actChangeStatusPOS: TAction;
    actStockBarang: TAction;
    actLapReturSup: TAction;
    actLaporanKonsinyasi: TAction;
    actInvMovement: TAction;
    actLapInvMovementQty: TAction;
    actShipmentAgent: TAction;
    actShipmentTransport: TAction;
    actShipmentDocument: TAction;
    actExportDataStore: TAction;
    actImportFromPOS: TAction;
    actListProduct: TAction;
    actLaporanMutasiKeluar: TAction;
    actLaporanMutasiMasuk: TAction;
    actReconcileBti: TAction;
    actLPKAll: TAction;
    actEodLpk: TAction;
    actUser: TAction;
    actLaporanReturSupplier: TAction;
    actactListMemberTransaction: TAction;
    actRafaksiSupplier: TAction;
    actReturTrader: TAction;
    GeneratePOForAll1: TMenuItem;
    actPurchaseOrder: TAction;
    AppEvents: TApplicationEvents;
    LookAndFeelController: TcxLookAndFeelController;
    N1: TMenuItem;
    GoodReceiving1: TMenuItem;
    actSetKoneksi: TAction;
    CNReceiving1: TMenuItem;
    DNReceiving1: TMenuItem;
    dxbrmngrStore: TdxBarManager;
    dxbrPurchasing: TdxBar;
    dxbrbtnSO: TdxBarButton;
    dxbrbtnPO: TdxBarButton;
    dxbrbtnGR: TdxBarButton;
    dxbrbtnCNrecv: TdxBarButton;
    dxbrbtnDNRecv: TdxBarButton;
    dxrbntbProcureToPay: TdxRibbonTab;
    dxrbnHO: TdxRibbon;
    dxrbntbOrderToCash: TdxRibbonTab;
    dxbrProcureToPayReport: TdxBar;
    dxbrbtnSTockCasrd: TdxBarButton;
    dxbrbtnInventoryMovement: TdxBarButton;
    dxbrSetting: TdxBar;
    dxbrbtnSettingKoneksi: TdxBarButton;
    dxbrbtnSettingApp: TdxBarButton;
    dxrbntbSetting: TdxRibbonTab;
    actSettingApp: TAction;
    dxbrlrgbtnPreference: TdxBarLargeButton;
    actPreference: TAction;
    dxbrbtn1: TdxBarButton;
    dxbrbtnStockProduct: TdxBarButton;
    dxbrFavourite: TdxBar;
    dxrbntbSystem: TdxRibbonTab;
    dxrbntbWindow: TdxRibbonTab;
    dxbrSystem: TdxBar;
    dxbrbtnLogin: TdxBarButton;
    dxbrbtnLogout: TdxBarButton;
    dxbrbtnExit: TdxBarButton;
    dxbrWindows: TdxBar;
    dxbrbtnCascade: TdxBarButton;
    dxbrbtnTile: TdxBarButton;
    dxbrbtnCloseAll: TdxBarButton;
    dxbrTrader: TdxBar;
    dxbrbtnPOTrader: TdxBarButton;
    dxbrbtnResetMenu: TdxBarButton;
    actResetMenu: TAction;
    dxbrbtnReturTrader: TdxBarButton;
    dxrbntbMarketing: TdxRibbonTab;
    dxbrOrderToCashReport: TdxBar;
    dxbrbtnDSR: TdxBarButton;
    dxrbntbInventory: TdxRibbonTab;
    dxbrInventory: TdxBar;
    dxbrbtnWastageReal: TdxBarButton;
    dxbrbtnDSA: TdxBarButton;
    dxrbntbTrader: TdxRibbonTab;
    dxrbntbSupvCashier: TdxRibbonTab;
    dxbrmngrStoreBar1: TdxBar;
    dxbrbtnActivatePOS: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxbrbtnBeginningBalance: TdxBarButton;
    dxbrbtnFinalPayment: TdxBarButton;
    dxbrbtnResetCashier: TdxBarButton;
    dxBarButton1: TdxBarButton;
    dxbrbtnDOForTrader: TdxBarButton;
    dxbrMarketingAgreement: TdxBar;
    dxbrbtnCustomerAgreement: TdxBarButton;
    actMasterAgreement: TAction;
    dxbrbtn2: TdxBarButton;
    actScheduleAgreement: TAction;
    dxbrbtn3: TdxBarButton;
    actFakturPajakAgreement: TAction;
    dxbrbtn4: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarButton3: TdxBarButton;
    dxbrbtnDOBonus: TdxBarButton;
    procedure actActivatePOSExecute(Sender: TObject);
    procedure actactListMemberTransactionExecute(Sender: TObject);
    procedure actAdjustmentCashierExecute(Sender: TObject);
    procedure actArrangeExecute(Sender: TObject);
    procedure actBarcodeRequestExecute(Sender: TObject);
    procedure actBeginBalancePOSExecute(Sender: TObject);
    procedure actCancellingPOExecute(Sender: TObject);
    procedure actCascadeExecute(Sender: TObject);
    procedure actCashDroppingExecute(Sender: TObject);
    procedure actChangeStatusPOExecute(Sender: TObject);
    procedure actCloseAllExecute(Sender: TObject);
    procedure actCNGoodReceivingExecute(Sender: TObject);
    procedure actCrazyPriceExecute(Sender: TObject);
    procedure actCreateSOExecute(Sender: TObject);
    procedure actCreditCardExecute(Sender: TObject);
    procedure actDailySalesReportExecute(Sender: TObject);
    procedure actDataCostumerExecute(Sender: TObject);
    procedure actDiscMemberExecute(Sender: TObject);
    procedure actDisplayPOExecute(Sender: TObject);
    procedure actDSIExecute(Sender: TObject);
    procedure actFinalPaymentExecute(Sender: TObject);
    procedure actGeneratePOForAllExecute(Sender: TObject);
    procedure actGoodsReceivingExecute(Sender: TObject);
    procedure actHistoryPOExecute(Sender: TObject);
    procedure actInputProductNotForSOExecute(Sender: TObject);
    procedure actInputSupplierNotForSOExecute(Sender: TObject);
    procedure actLapInvMovementQtyExecute(Sender: TObject);
    procedure actLaporanReturSupplierExecute(Sender: TObject);
    procedure actListDailyTransactionExecute(Sender: TObject);
    procedure actListMembershipExecute(Sender: TObject);
    procedure actListPOCancelExecute(Sender: TObject);
    procedure actMaintenanceBarcodeExecute(Sender: TObject);
    procedure actMaintenancePasswordExecute(Sender: TObject);
    procedure actMemberActivationExecute(Sender: TObject);
    procedure actMemberShipExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actOnCreateFormExecute(Sender: TObject);
    procedure actOnLoginExecute(Sender: TObject);
    procedure actOnLogoutExecute(Sender: TObject);
    procedure actPOBonusExecute(Sender: TObject);
    procedure actPrintPOExecute(Sender: TObject);
    procedure actPrintWorksheetExecute(Sender: TObject);
    procedure actProductExecute(Sender: TObject);
    procedure actProductForSellingExecute(Sender: TObject);
    procedure actPurchaseOrderExecute(Sender: TObject);
    procedure actRafaksiSupplierExecute(Sender: TObject);
    procedure actReprintNotaExecute(Sender: TObject);
    procedure actReprintNPExecute(Sender: TObject);
    procedure actResetCashierExecute(Sender: TObject);
    procedure actReturTraderExecute(Sender: TObject);
    procedure actSalesReportContrabonExecute(Sender: TObject);
    procedure actServiceLevelExecute(Sender: TObject);
    procedure actSetKoneksiExecute(Sender: TObject);
    procedure actShiftExecute(Sender: TObject);
    procedure actSupplierExecute(Sender: TObject);
    procedure actTileExecute(Sender: TObject);
    procedure actUbahQtyPOExecute(Sender: TObject);
    procedure actWastageRealExecute(Sender: TObject);
    procedure AppEventsException(Sender: TObject; E: Exception);
    procedure AppEventsShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure miExit1Click(Sender: TObject);
    procedure actCNReceivingExecute(Sender: TObject);
    procedure actCustomerAgreementExecute(Sender: TObject);
    procedure actDailySalesAnalysisExecute(Sender: TObject);
    procedure actDNReceivingExecute(Sender: TObject);
    procedure actDOForTraderExecute(Sender: TObject);
    procedure actGoodsReceivingBonusExecute(Sender: TObject);
    procedure actOnExitExecute(Sender: TObject);
    procedure actPOFromTraderExecute(Sender: TObject);
    procedure actInvMovementExecute(Sender: TObject);
    procedure actMasterAgreementExecute(Sender: TObject);
    procedure actPreferenceExecute(Sender: TObject);
    procedure actResetMenuExecute(Sender: TObject);
    procedure actSettingAppExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actStockCardExecute(Sender: TObject);
    procedure actStockProductExecute(Sender: TObject);
    procedure actVoucherBotolExecute(Sender: TObject);
  private
//    FNewUnit: TUnit;
    //FUnitName: string;
    FFormProperty: TFormProperty;
    FIsConnectedRefreshServer: boolean;
    FIsRegisteredUserToRefreshServer: boolean;
//    FIsStore: Integer;
    FIsTesting: Boolean;
    procedure EnableSubMenu(AMenu: TMenuItem; AValue: boolean);
//    procedure SetAclstExim(aEnable : Boolean);
    procedure SetIsConnectedRefreshServer(const Value: boolean);
    procedure SetIsRegisteredUserToRefreshServer(const Value: boolean);
//    procedure SetLoginFullname(const Value: string);
//    procedure SetLoginRole(const Value: string);
    procedure SettingMainMenu(ARole: TRole);
  public
    Host, IP: string;
    Port: integer;
    class procedure ShowBorwseForm(BrowseFormClass: TMasterBrowseClass);
//    property IsStore: Integer read FIsStore write FIsStore;
    property IsTesting: Boolean read FIsTesting write FIsTesting;
  published
//    property LoginFullname: string read FLoginFullname write SetLoginFullname;
//    property LoginRole: string read FLoginRole write SetLoginRole;
//    property LoginUsername: string read FLoginUsername write SetLoginUsername;
//    property LoginId: Integer read FLoginId write SetLoginId;
//    property LoginUnitId: Integer read FUnitId write SetLoginUnitID;
//    property UnitId: Integer read FUnitId;
//    property LoginUnitName: string read FUnitName write SetUnitName;
//    property UnitName: string read FUnitName;
//
    property IsConnectedRefreshServer: boolean read FIsConnectedRefreshServer write
        SetIsConnectedRefreshServer;
    property IsRegisteredUserToRefreshServer: boolean read
        FIsRegisteredUserToRefreshServer write SetIsRegisteredUserToRefreshServer;
  end;

var
  frmMain: TfrmMain;

{$R *.dfm}
implementation
uses
  uAppUtils, uRetnoUnit, ufrmPilihUnit, ufrmActivatePOS, ufrmListMemberTransaction,
  ufrmAdjustmentCashier, ufrmBarcodeRequest, ufrmBeginningBalancePOS,
  ufrmCancellationPO, ufrmCashDropping, ufrmChangeStatusPO, ufrmCrazyPrice,
  ufrmCreditCard, ufrmDailySalesReport, ufrmDataCostumer, ufrmDiscountMember,
  ufrmDisplayPO, ufrmDSI, ufrmFinalPayment, ufrmGeneratePOForAll,
  ufrmListingReceivingProduct, ufrmHistoryPO, ufrmInputProductForNotSO,
  ufrmInputSupplierForNotSO, ufrmInvMovementQTY, ufrmLaporanRetur,
  ufrmListDailyTransaction, ufrmListMembership, ufrmListPOCancel,
  ufrmMaintenanceBarcode, ufrmMaintenancePassword, ufrmMemberActivation,
  ufrmMemberShip, ufrmLogin, ufrmGeneratePOBonus, ufrmCetakPO,
  {ufrmPurchaseOrder, }ufrmWorksheet, ufrmProduct, ufrmProductForSelling,
  ufrmRafaksi, ufrmReprintNota, ufrmReprintNP, ufrmResetCashier,
  ufrmReturTrader, ufrmSalesReportContrabon, ufrmServiceLevel, ufrmShift,
  ufrmSupplier, ufrmUbahQTYPO, ufrmWastageReal, ufrmPurchaseOrder,
  Datasnap.DSHTTPClient, ufrmMouselessMenu, ufrmSettingKoneksi, ufrmDN,
  ufrmKartuStock, ufrmPreference, ufrmStockProduct, ufrmPOFromTrader,
  ufrmDailySalesAnalysis, ufrmKuponBotol, ufrmCustomerAgreement, ufrmUser;



procedure TfrmMain.actActivatePOSExecute(Sender: TObject);
begin
  frmActivatePOS := TfrmActivatePOS.CreateWithUser(Self, FFormProperty);
end;

procedure TfrmMain.actactListMemberTransactionExecute(Sender: TObject);
begin
  frmListMemberTransaction := TfrmListMemberTransaction.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actAdjustmentCashierExecute(Sender: TObject);
begin
    frmAdjustmentCashier := TfrmAdjustmentCashier.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actArrangeExecute(Sender: TObject);
begin
  ArrangeIcons;
end;

procedure TfrmMain.actBarcodeRequestExecute(Sender: TObject);
begin
    frmBarcodeRequest:= TfrmBarcodeRequest.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actBeginBalancePOSExecute(Sender: TObject);
begin
  frmBeginningBalancePOS := TfrmBeginningBalancePOS.CreateWithUser(Self, FFormProperty);
end;

procedure TfrmMain.actCancellingPOExecute(Sender: TObject);
begin
    frmCancellationPO := TfrmCancellationPO.CreateWithUser(Application,FFormProperty);
end;

procedure TfrmMain.actCascadeExecute(Sender: TObject);
begin
  Cascade;
end;

procedure TfrmMain.actCashDroppingExecute(Sender: TObject);
begin
    frmCashDropping := TfrmCashDropping.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actChangeStatusPOExecute(Sender: TObject);
begin
  frmChangeStatusPO := TfrmChangeStatusPO.CreateWithUser(Self, FFormProperty);
end;

procedure TfrmMain.actCloseAllExecute(Sender: TObject);
var i: integer;
begin
  for i := Self.MDIChildCount-1 downto 0 do
    MDIChildren[i].Close;
end;

procedure TfrmMain.actCNGoodReceivingExecute(Sender: TObject);
begin
  //
end;

procedure TfrmMain.actCNReceivingExecute(Sender: TObject);
begin
  frmCN := TfrmCN.Create(Application);
end;

procedure TfrmMain.actCrazyPriceExecute(Sender: TObject);
begin
  frmCrazyPrice := TfrmCrazyPrice.CreateWithUser(Application,FFormProperty);
end;

procedure TfrmMain.actCreateSOExecute(Sender: TObject);
begin
  ShowBorwseForm(TfrmSO);
end;

procedure TfrmMain.actCreditCardExecute(Sender: TObject);
begin
    frmCreditCard := TfrmCreditCard.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actCustomerAgreementExecute(Sender: TObject);
begin
  frmCustomerAgreement := TfrmCustomerAgreement.CreateWithUser(Self, FFormProperty);
end;

procedure TfrmMain.actDailySalesAnalysisExecute(Sender: TObject);
begin
  frmDailySalesAnalysis := TfrmDailySalesAnalysis.CreateWithUser(Self, FFormProperty);
end;

procedure TfrmMain.actDailySalesReportExecute(Sender: TObject);
begin
  frmDailySalesReport := TfrmDailySalesReport.CreateWithUser(Self, FFormProperty);
end;

procedure TfrmMain.actDataCostumerExecute(Sender: TObject);
begin
  frmDataCostumer := TfrmDataCostumer.CreateWithUser(Application,FFormProperty);
  frmDataCostumer.Show;
end;

procedure TfrmMain.actDiscMemberExecute(Sender: TObject);
begin
    frmDiscountMember := TfrmDiscountMember.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actDisplayPOExecute(Sender: TObject);
begin
    frmDisplayPO:= TfrmDisplayPO.CreateWithUser(Application,FFormProperty);
end;

procedure TfrmMain.actDNReceivingExecute(Sender: TObject);
begin
  frmDN := TfrmDN.Create(Application);
end;

procedure TfrmMain.actDOForTraderExecute(Sender: TObject);
begin
  frmDOForTrader := TfrmDOForTrader.Create(Application);
end;

procedure TfrmMain.actDSIExecute(Sender: TObject);
begin
  frmDSI := TfrmDSI.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actFinalPaymentExecute(Sender: TObject);
begin
  frmFinalPayment := TfrmFinalPayment.CreateWithUser(Self, FFormProperty);
end;

procedure TfrmMain.actGeneratePOForAllExecute(Sender: TObject);
begin
//  frmGeneratePOforAll := TfrmGeneratePOforAll.CreateWithUser(Application,FFormProperty)
end;

procedure TfrmMain.actGoodsReceivingBonusExecute(Sender: TObject);
begin
  frmDOBonus := TfrmDOBonus.Create(Self);
end;

procedure TfrmMain.actGoodsReceivingExecute(Sender: TObject);
begin
  frmListingReceivingProduct := TfrmListingReceivingProduct.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actHistoryPOExecute(Sender: TObject);
begin
  frmHistoryPO := TfrmHistoryPO.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actInputProductNotForSOExecute(Sender: TObject);
begin
  frmInputProductForNotSO := TfrmInputProductForNotSO.CreateWithUser(Self, FFormProperty);
end;

procedure TfrmMain.actInputSupplierNotForSOExecute(Sender: TObject);
begin
  frmInputSupplierForNotSO := TfrmInputSupplierForNotSO.CreateWithUser(Self, FFormProperty);
end;

procedure TfrmMain.actInvMovementExecute(Sender: TObject);
begin
  frmInventoryMovement := TfrmInventoryMovement.Create(Self);
end;

procedure TfrmMain.actLapInvMovementQtyExecute(Sender: TObject);
begin
     frmInvMovementQTY := TfrmInvMovementQTY.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actLaporanReturSupplierExecute(Sender: TObject);
begin
     frmLaporanRetur := TfrmLaporanRetur.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actListDailyTransactionExecute(Sender: TObject);
begin
    frmListDailyTransaction := TfrmListDailyTransaction.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actListMembershipExecute(Sender: TObject);
begin
    frmListMembership := TfrmListMembership.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actListPOCancelExecute(Sender: TObject);
begin
    frmListPOCancel:= TfrmListPOCancel.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actMaintenanceBarcodeExecute(Sender: TObject);
begin
    frmMaintenanceBarcode := TfrmMaintenanceBarcode.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actMaintenancePasswordExecute(Sender: TObject);
begin
    frmMaintenancePassword := TfrmMaintenancePassword.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actMasterAgreementExecute(Sender: TObject);
begin
  //frmMasterAgreement := TfrmMasterAgreement.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actMemberActivationExecute(Sender: TObject);
begin
  frmMemberActivation := TfrmMemberActivation.CreateWithUser(Application,FFormProperty);
  frmMemberActivation.Show;
end;

procedure TfrmMain.actMemberShipExecute(Sender: TObject);
begin
  frmMemberShip := TfrmMemberShip.CreateWithUser(Application,FFormProperty);
  frmMemberShip.Show;

end;

procedure TfrmMain.actOnCreateFormExecute(Sender: TObject);
var
//  iTemp: Integer;
//  erMsg: string;
  sIDUnit: string;
begin
  //setting unit toko
  sIDUnit   := TAppUtils.BacaRegistry('UnitStore');
  if sIDUnit <> '' then
    TRetno.UnitStore := TModUnit(DMClient.CrudClient.Retrieve(TModUnit.ClassName, sIDUnit));

  Caption := 'ASSALAAM HYPERMARKET : ' + TRetno.UnitStore.UNT_NAME;

  IsTesting := False;
  if ParamStr(1) = 'TESTING' then
  begin
    IsTesting := True;
  end;
  {
  ConLog:= TConLOg.Create(self);
  fWriteInLog:= True;
  try
    ConLog.DefaultConfig;
    ConLog.Connected:= True;
    ConLog.CanMonitor:= True;
    stbMain.Panels[4].Text:= 'Log : Yes';
  except
    stbMain.Panels[4].Text:= 'Log : No';
    ConLog.CanMonitor:= False;
  end;
   }
  FFormProperty := TFormProperty.Create;
//  FDbEventListener := TDbEventListener.Create;
//  FDbEventListener.OnEvent := DbEventListenerOnEvent;

  IsConnectedRefreshServer := false;
  IsRegisteredUserToRefreshServer := false;

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

  frmMain.Height := 600;
  frmMain.Width := 800;

  // set menu on user nobody
  actOnLogin.Enabled := true;
  actOnLogout.Enabled := false;
  SettingMainMenu(rNobody);

end;

procedure TfrmMain.actOnExitExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.actOnLoginExecute(Sender: TObject);
//var
//  FdefUnitId: Integer;
begin
  frmLogin := TfrmLogin.Create(Application);
  frmLogin.ShowFormLogin(LOGIN_PAGE);

  if (LoginSuccessfull) then
  begin

//           FdefUnitId  := StrToInt(getGlobalVar('UNITID')); //unit dan db untuk wh dan ho dijadikan 1

//    FFormProperty.FMasterIsStore := GetIsStoreUnitID(FdefUnitId);

//    FGlobalProperty.LIstMerID     := GetListMerchanID(frmLogin.LoginID, frmLogin.LoginUntID);
//    aListMerID                    := FGlobalProperty.LIstMerID;
    FFormProperty.FLoginId        := frmLogin.LoginID;
    FFormProperty.FLoginUnitId    := frmLogin.LoginUntID;
    FFormProperty.FLoginRole      := frmLogin.LoginUserName;
    FFormProperty.FLoginUsername  := frmLogin.LoginUserName;
//    FFormProperty.FFilePathReport := GetFilePathReport;
//    FFormProperty.FSelfUnitId     := FdefUnitId;
    FFormProperty.FIpClient       := IP;
    FFormProperty.FHostClient     := Host;
    FFormProperty.FTipeApp        := THO;
    {
    with cOpenQuery(GetSQLisHOisStore(frmLogin.LoginUntID)) do
    begin
      try
        FFormProperty.FLoginIsStore   := FieldByName('UNT_IS_STORE').AsInteger;
      finally
        Free;
      end;
    end;
    }
//    SetStatusHOSTORE;

//    lUnitId := FFormProperty.FSelfUnitId;

//    OpenLoading(USER_LOGIN_LOADING);
//    LoginExecute;
//    CloseLoading;
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
//    if not assigned(MenuManagement) then
//      MenuManagement := TMenuManagement.Create;
//    MenuManagement.dropMenuUser;
  except
  end;

//  SettingMainMenu(rNobody);
//  SetAclstExim(True);
//  with sbMain do
//  begin
//    Panels[0].Text := 'User Login: ';
//    Panels[1].Text := 'Role: ';
//    Panels[2].Text := 'Database: ';
//    Panels[3].Text := 'EOD : ' + FormatDateTime('DD/MM/YYYY', GetLastEODDate(FFormProperty.FSelfUnitId));
//  end; // end with
end;

procedure TfrmMain.actPOBonusExecute(Sender: TObject);
begin
  frmGeneratePOBonus := TfrmGeneratePOBonus.Create(Self);
end;

procedure TfrmMain.actPOFromTraderExecute(Sender: TObject);
begin
  frmPOFromTrader := TfrmPOFromTrader.Create(Self);
end;

procedure TfrmMain.actPreferenceExecute(Sender: TObject);
begin
  frmPreference := TfrmPreference.Create(Self);
end;

procedure TfrmMain.actPrintPOExecute(Sender: TObject);
begin
  frmCetakPO := TfrmCetakPO.CreateWithUser(Application,FFormProperty);
end;

procedure TfrmMain.actPrintWorksheetExecute(Sender: TObject);
begin
  frmWorksheet := TfrmWorksheet.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actProductExecute(Sender: TObject);
begin
  frmProduct := TfrmProduct.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actProductForSellingExecute(Sender: TObject);
begin
  frmProductForSelling := TfrmProductForSelling.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actPurchaseOrderExecute(Sender: TObject);
begin
  frmPurchaseOrder := TfrmPurchaseOrder.Create(Application);
end;

procedure TfrmMain.actRafaksiSupplierExecute(Sender: TObject);
begin
    frmRafaksi := TfrmRafaksi.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actReprintNotaExecute(Sender: TObject);
begin
  frmReprintNota := TfrmReprintNota.Create(Self);
end;

procedure TfrmMain.actReprintNPExecute(Sender: TObject);
begin
  frmReprintNP := TfrmReprintNP.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actResetCashierExecute(Sender: TObject);
begin
  frmResetCashier := TfrmResetCashier.CreateWithUser(Self, FFormProperty);
end;

procedure TfrmMain.actResetMenuExecute(Sender: TObject);
begin
  dxbrmngrStore.LoadFromIniFile('config.ini');
end;

procedure TfrmMain.actReturTraderExecute(Sender: TObject);
begin
  frmReturTrader := TfrmReturTrader.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actSalesReportContrabonExecute(Sender: TObject);
begin
  frmSalesReportContrabon := TfrmSalesReportContrabon.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actServiceLevelExecute(Sender: TObject);
begin
  frmServiceLevel := TfrmServiceLevel.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actSetKoneksiExecute(Sender: TObject);
begin
  With TfrmSettingKoneksi.Create(Self) do
  begin
    Try
      ShowModal;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmMain.actSettingAppExecute(Sender: TObject);
begin
  frmSettingApp := tfrmSettingApp.Create(nil);
end;

procedure TfrmMain.actShiftExecute(Sender: TObject);
begin
    frmShift := TfrmShift.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actStockCardExecute(Sender: TObject);
begin
  frmKartuStock := TfrmKartuStock.Create(Self);
end;

procedure TfrmMain.actStockProductExecute(Sender: TObject);
begin
  frmStockProduct := TfrmStockProduct.Create(Self);
end;

procedure TfrmMain.actSupplierExecute(Sender: TObject);
begin
  frmSupplier := TfrmSupplier.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actTileExecute(Sender: TObject);
begin
  TileMode := tbVertical;
  Tile;
end;

procedure TfrmMain.actUbahQtyPOExecute(Sender: TObject);
begin
  frmUbahQTYPO := TfrmUbahQTYPO.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actVoucherBotolExecute(Sender: TObject);
begin
  frmKuponBotol := TfrmKuponBotol.CreateWithUser(Self, FFormProperty);
end;

procedure TfrmMain.actWastageRealExecute(Sender: TObject);
begin
  frmWastageReal := TfrmWastageReal.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.AppEventsException(Sender: TObject; E: Exception);
begin
  TAppUtils.ShowException(E);
end;

procedure TfrmMain.AppEventsShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if Msg.CharCode = 192 then
  begin
    with TfrmMouselesMenu.Create(Application) do
    begin
      ShowModal;
    end;
    Handled := True;
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

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
//  if (CommonDlg.Confirm('Are you sure you wish to quit ' + Application.Title +' ?') = mrYes) then
//  begin
//    if (actOnLogout.Enabled) then
//      actOnLogoutExecute(self);
//    CanClose := true;
//  end
//  else
//    CanClose := false;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
//  CommonDlg.ShowInformationAlert('Aplikasi Store', 'test Selamat Datang', mtCustom);
  sbMain.Panels[0].Text := 'Server : ' + DMClient.RestConn.Host;
  sbMain.Panels[1].Text := 'Port : ' + IntToStr(DMClient.RestConn.Port);

end;

procedure TfrmMain.miExit1Click(Sender: TObject);
begin
  Application.Terminate;
end;

//procedure TfrmMain.SetAclstExim(aEnable : Boolean);
//begin
//  actImportSync.Enabled       := aEnable;
//  actExportSync.Enabled       := aEnable;
//  actExportDataStore.Enabled  := aEnable;
//  actImportFromPOS.Enabled    := aEnable;
//end;

procedure TfrmMain.SetIsConnectedRefreshServer(const Value: boolean);
begin
  FIsConnectedRefreshServer := Value;
end;

procedure TfrmMain.SetIsRegisteredUserToRefreshServer(const Value: boolean);
begin
  FIsRegisteredUserToRefreshServer := Value;
end;

procedure TfrmMain.SettingMainMenu(ARole: TRole);
begin
  EnableSubMenu(mmWindow, false);
  EnableSubMenu(miConnectionDatabase, true);

end;

class procedure TfrmMain.ShowBorwseForm(BrowseFormClass: TMasterBrowseClass);
//var
//  frm: TfrmMasterBrowse;
begin
  if (TRetno.UnitStore = nil) then
  begin
    TAppUtils.Warning('Unit Store Belum Dipilih');
    frmPilihCabang := TfrmPilihCabang.Create(Application);
    frmPilihCabang.ShowModal;

    Exit;
  end;

  BrowseFormClass.Create(Application);
end;

end.
