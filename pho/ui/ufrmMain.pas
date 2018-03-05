unit ufrmMain;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.ComCtrls,
  System.Actions, Vcl.ActnList, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxStatusBar, Vcl.StdCtrls, uFormProperty, uGlobalProperty,
  uCompany, ufrmBank, System.UITypes, Vcl.AppEvnts, cxClasses, ufrmMerchandise,
  ufrmMerchandiseGroup, ufrmKategori, ufrmMerk, ufrmSubGroup, ufrmCostCenter,
  ufrmCompany, ufrmUnit, ufrmSupplier, ufrmSupplierGroup, ufrmTipeBonus,
  ufrmTipeCN, ufrmDocument, uModUnit, ufrmSettingApp, dxRibbonSkins,
  dxRibbonCustomizationForm, dxRibbon, dxBar, ufrmClaim, ufrmBankCashOut,
  ufrmAPCard, ufrmHistoryAP, ufrmJurnal, ufrmContrabonSales, ufrmCustomerInvoice,
  ufrmCrazyPrice, dxRibbonColorGallery, ufrmCashIn, ufrmAgingPiutang, ufrmSummaryARBalance,
  ufrmHistoryBarang, uModAuthUser;

type
  TRole = (rNobody, rAdmin, rManager, rAccounting, rMerchandise, rFinance, rCoba);
  TfrmMain = class(TForm)
    mmMainMenu: TMainMenu;
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
    actBarcodeRequest: TAction;
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
    actInvoiceTrader: TAction;
    actPaymentTrader: TAction;
    actListDoOutstanding: TAction;
    actListingAgingInvoiceTrader: TAction;
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
    actListOutstandingDOTrader: TAction;
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
    UnitOfMeasure1: TMenuItem;
    actTipePembayaran1: TMenuItem;
    CompanyType1: TMenuItem;
    actCostCenter: TAction;
    actCostCenter1: TMenuItem;
    AppEvents: TApplicationEvents;
    Merchandise1: TMenuItem;
    MasterProduct1: TMenuItem;
    LookAndFeelController: TcxLookAndFeelController;
    est1: TMenuItem;
    DialogBarang1: TMenuItem;
    actMerchandise: TAction;
    actSubGroup: TAction;
    actKategori: TAction;
    actMerk: TAction;
    Merchandise2: TMenuItem;
    MerchandiseGroup1: TMenuItem;
    SubGroup1: TMenuItem;
    Kategori1: TMenuItem;
    Merk1: TMenuItem;
    actCompany: TAction;
    Company1: TMenuItem;
    SalesOutlet1: TMenuItem;
    UnitStore1: TMenuItem;
    actQuotationMailer: TAction;
    CustomerSupport1: TMenuItem;
    MasterCustomer1: TMenuItem;
    actMembership: TAction;
    actSupplier: TAction;
    actSupplier1: TMenuItem;
    SupplierGroup1: TMenuItem;
    actListingQuotationHargaBeli: TAction;
    actListingQuotationMailer: TAction;
    actLaporanStok: TAction;
    actListingPObyMG: TAction;
    actGudang: TAction;
    Inventory1: TMenuItem;
    Gudang1: TMenuItem;
    actMataUang: TAction;
    MataUang1: TMenuItem;
    actTipeBonus: TAction;
    ipeBonus1: TMenuItem;
    actTipeCN: TAction;
    ipeCN1: TMenuItem;
    actDocument: TAction;
    Document1: TMenuItem;
    actTipePO: TAction;
    ipePO1: TMenuItem;
    actAgama: TAction;
    MasterAgama1: TMenuItem;
    test1: TMenuItem;
    actSetKoneksi: TAction;
    actCreditCard: TAction;
    CreditCard1: TMenuItem;
    actKompetitor: TAction;
    Kompetitor1: TMenuItem;
    actSettingAplikasi: TAction;
    dxbrmngrHO: TdxBarManager;
    dxrbntbReference: TdxRibbonTab;
    dxrbnHO: TdxRibbon;
    dxbrReferenceFinance: TdxBar;
    dxbrbtnBank: TdxBarButton;
    dxbrbtnTax: TdxBarButton;
    dxbrbtnCostCenter: TdxBarButton;
    dxbrReferenceInventory: TdxBar;
    dxbrbtn1: TdxBarButton;
    dxbrbtnTipePembayaran: TdxBarButton;
    dxbrbtnUOM: TdxBarButton;
    dxbrReferenceOther: TdxBar;
    dxbrbtnTipePerusahaan: TdxBarButton;
    dxbrbtnSupplierType: TdxBarButton;
    dxbrbtnCompany: TdxBarButton;
    dxbrbtnSalesOutlet: TdxBarButton;
    dxbrbtnUnitStore: TdxBarButton;
    dxrbntbMembership: TdxRibbonTab;
    dxbrMembership: TdxBar;
    dxbrbtnMembership: TdxBarButton;
    dxbrFinanceMaster: TdxBar;
    dxbrbtnCreditCard: TdxBarButton;
    dxrbntbFinance: TdxRibbonTab;
    dxrbntbMerchandize: TdxRibbonTab;
    dxrbntbSetting: TdxRibbonTab;
    dxrbntbWindow: TdxRibbonTab;
    dxbrFavourite: TdxBar;
    dxbrbtnCOA: TdxBarButton;
    dxbrMerchandize: TdxBar;
    dxbrbtnMerchandise: TdxBarButton;
    dxbrbtnMerchandiseGroup: TdxBarButton;
    dxbrbtnSubGroup: TdxBarButton;
    dxbrbtnKategori: TdxBarButton;
    dxbrbtnMerk: TdxBarButton;
    dxbrbtnProduct: TdxBarButton;
    dxbrbtnSupplierGroup: TdxBarButton;
    dxbrbtnSupplier: TdxBarButton;
    dxbrbtnKompetirot: TdxBarButton;
    dxbrSetting: TdxBar;
    dxbrbtnServerConnection: TdxBarButton;
    dxbrbtn3: TdxBarButton;
    dxbrWindow: TdxBar;
    dxbrbtnCascade: TdxBarButton;
    dxbrbtnTile: TdxBarButton;
    dxbrbtnCloseAll: TdxBarButton;
    dxrbntbSystem: TdxRibbonTab;
    dxbrSystem: TdxBar;
    dxbrbtnLogIn: TdxBarButton;
    dxbrbtnLogOut: TdxBarButton;
    dxbrbtnExit: TdxBarButton;
    dxBarButton1: TdxBarButton;
    dxbrFinanceOther: TdxBar;
    dxbrbtnBarcodeUsage: TdxBarButton;
    dxbrbtnElectricCustomer: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxbrAP: TdxBar;
    dxbrbtnAdjustmentFaktur: TdxBarButton;
    dxbrbtnClaim: TdxBarButton;
    actShift: TAction;
    dxbrmngrHOBar1: TdxBar;
    dxBarButton3: TdxBarButton;
    dxbrbtnBCO: TdxBarButton;
    dxbrbtnKartuAP: TdxBarButton;
    actAPCARD: TAction;
    dxBarButton4: TdxBarButton;
    actHistoryAP: TAction;
    dxBarButton5: TdxBarButton;
    dxbrbtnHistoryAP: TdxBarButton;
    dxbrmngrHOBarAccounting: TdxBar;
    dxbrbtnJurnal: TdxBarButton;
    dxbrbtnCustomerInvoice: TdxBarButton;
    actCustomerInvoice: TAction;
    dxbrmngrHOBar3: TdxBar;
    dxbrbtnGenerateVoucher: TdxBarButton;
    dxbrAgreement: TdxBar;
    dxrbntbMarketing: TdxRibbonTab;
    dxbrVoucher: TdxBar;
    dxRibbonColorGalleryItem1: TdxRibbonColorGalleryItem;
    actCustomerAgreement: TAction;
    actScheduleAgreement: TAction;
    actFakturPajakAgreement: TAction;
    dxbrbtnCrazy: TdxBarButton;
    actCrazyPrice: TAction;
    dxbrbAgCustomer: TdxBarButton;
    dxbAgMaster: TdxBarButton;
    dxbrbAgListDetil: TdxBarButton;
    dxbrbAgSchedule: TdxBarButton;
    dxbrbAgFakturPajak: TdxBarButton;
    dxbrbVouCustomer: TdxBarButton;
    dxbrbVouAgreement: TdxBarButton;
    dxbrbVouGenerate: TdxBarButton;
    dxbrb4: TdxBarButton;
    dxbrbVoucher: TdxBarButton;
    dxbrbElectricCustomer: TdxBarButton;
    dxbrElectric: TdxBar;
    dxbrbElectricCustomerMar: TdxBarButton;
    dxbrbElectricInvoice: TdxBarButton;
    dxbrbElectricTransaction: TdxBarButton;
    dxbrbElectricPayment: TdxBarButton;
    dxBarButton6: TdxBarButton;
    actProdukJasa: TAction;
    dxBarSubItem1: TdxBarSubItem;
    dxbrbtnProdukJasa: TdxBarButton;
    dxbrbtnCashIn: TdxBarButton;
    actCashIn: TAction;
    dxbrbtnBarcodeReq: TdxBarButton;
    dxbrbtnARAging: TdxBarButton;
    actLaporanAgingAR: TAction;
    dxbrbtnSummaryARBalance: TdxBarButton;
    actARBalance: TAction;
    dxbrbtnHistoryBarang: TdxBarButton;
    actEntryPLUExternalCode: TAction;
    dxbrbtnUser: TdxBarButton;
    procedure actAdjustmentFakturExecute(Sender: TObject);
    procedure actAPCARDExecute(Sender: TObject);
    procedure actAPPaymentExecute(Sender: TObject);
    procedure actARBalanceExecute(Sender: TObject);
    procedure actBankExecute(Sender: TObject);
    procedure actBarcodeRequestExecute(Sender: TObject);
    procedure actCancPOExecute(Sender: TObject);
    procedure actCashInExecute(Sender: TObject);
    procedure actChangeStatPOExecute(Sender: TObject);
    procedure actClaimFakturExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actOnLogoutExecute(Sender: TObject);
    procedure actCloseAllExecute(Sender: TObject);
    procedure actCompanyExecute(Sender: TObject);
    procedure actCompanyTypeExecute(Sender: TObject);
    procedure actContrabonSalesExecute(Sender: TObject);
    procedure actCostCenterExecute(Sender: TObject);
    procedure actCrazyPriceExecute(Sender: TObject);
    procedure actCreditCardExecute(Sender: TObject);
    procedure actCustomerAgreementExecute(Sender: TObject);
    procedure actCustomerInvoiceExecute(Sender: TObject);
    procedure actDataProductExecute(Sender: TObject);
    procedure actDocumentExecute(Sender: TObject);
    procedure actElectricCustomerExecute(Sender: TObject);
    procedure actEntryPLUExternalCodeExecute(Sender: TObject);
    procedure actFakturPajakAgreementExecute(Sender: TObject);
    procedure actGenPOExecute(Sender: TObject);
    procedure actHariLiburExecute(Sender: TObject);
    procedure actHistoryPOExecute(Sender: TObject);
    procedure actGudangExecute(Sender: TObject);
    procedure actHistoryAPExecute(Sender: TObject);
    procedure actJurnalEntryExecute(Sender: TObject);
    procedure actJurnalExecute(Sender: TObject);
    procedure actShiftExecute(Sender: TObject);
    procedure actMataUangExecute(Sender: TObject);
    procedure actSupplierExecute(Sender: TObject);
    procedure actKategoriExecute(Sender: TObject);
    procedure actKompetitorExecute(Sender: TObject);
    procedure actLapInvMovementQtyExecute(Sender: TObject);
    procedure actLaporanAgingARExecute(Sender: TObject);
    procedure actLaporanStokExecute(Sender: TObject);
    procedure actLapReturSupExecute(Sender: TObject);
    procedure actListingPObyMGExecute(Sender: TObject);
    procedure actListingQuotationHargaBeliExecute(Sender: TObject);
    procedure actListingQuotationMailerExecute(Sender: TObject);
    procedure actListScheduleAgreementExecute(Sender: TObject);
    procedure actLokasiExecute(Sender: TObject);
    procedure actMasterAgreementExecute(Sender: TObject);
    procedure actMasterCustomerExecute(Sender: TObject);
    procedure actMasterProductNBDExecute(Sender: TObject);
    procedure actMembershipExecute(Sender: TObject);
    procedure actMerchandiseExecute(Sender: TObject);
    procedure actMerchanGroupExecute(Sender: TObject);
    procedure actMerkExecute(Sender: TObject);
    procedure actOnCreateFormExecute(Sender: TObject);
    procedure actOnExitExecute(Sender: TObject);
    procedure actOnLoginExecute(Sender: TObject);
    procedure actPajakExecute(Sender: TObject);
    procedure actPrintHistoryPOBySupplierExecute(Sender: TObject);
    procedure actPrintPOExecute(Sender: TObject);
    procedure actProductTypeExecute(Sender: TObject);
    procedure actProductTypeNBDExecute(Sender: TObject);
    procedure actProdukJasaExecute(Sender: TObject);
    procedure actQuotationExecute(Sender: TObject);
    procedure actQuotationHargaBeliExecute(Sender: TObject);
    procedure actQuotationMailerExecute(Sender: TObject);
    procedure actQuotationPromoExecute(Sender: TObject);
    procedure actRekeningExecute(Sender: TObject);
    procedure actSalesOutletExecute(Sender: TObject);
    procedure actScheduleAgreementExecute(Sender: TObject);
    procedure actSetKoneksiExecute(Sender: TObject);
    procedure actSettingAplikasiExecute(Sender: TObject);
    procedure actSubGroupExecute(Sender: TObject);
    procedure actSupplierGroupExecute(Sender: TObject);
    procedure actSupplierTypeExecute(Sender: TObject);
    procedure actSysParmCompExecute(Sender: TObject);
    procedure actSysParmExecute(Sender: TObject);
    procedure actTipeBonusExecute(Sender: TObject);
    procedure actTipeCNExecute(Sender: TObject);
    procedure actTipePengirimanPOExecute(Sender: TObject);
    procedure actUOMExecute(Sender: TObject);
    procedure actUOMNBDExecute(Sender: TObject);
    procedure actUserExecute(Sender: TObject);
    procedure actUserGroupExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure miConnectionDatabaseClick(Sender: TObject);
    procedure actTipePembayaranExecute(Sender: TObject);
    procedure actUnitExecute(Sender: TObject);
    procedure actUnitStoreExecute(Sender: TObject);
    procedure actVoucherExecute(Sender: TObject);
    procedure AppEventsException(Sender: TObject; E: Exception);
    procedure AppEventsShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure DialogBarang1Click(Sender: TObject);
    procedure est2Click(Sender: TObject);
    procedure test1Click(Sender: TObject);
    procedure dxbrbAgListDetilClick(Sender: TObject);
    procedure dxbrbVouCustomerClick(Sender: TObject);
    procedure dxbrbVouAgreementClick(Sender: TObject);
    procedure dxbrbVouGenerateClick(Sender: TObject);
    procedure dxbrbElectricInvoiceClick(Sender: TObject);
    procedure dxbrbElectricTransactionClick(Sender: TObject);
    procedure dxbrbElectricPaymentClick(Sender: TObject);
  private
    FPanelLoading: TPanel;
    FFormProperty: TFormProperty;
    FGlobalProperty: TGlobalProperty;
    procedure EnableSubMenu(AMenu: TMenuItem; AValue: boolean);
//    procedure SetStatusHOSTORE;
    //FIsStore: Integer;
    //FLoginFullname: string;
    //FLoginId: Integer;
    //FLoginRole: string;
    //FLoginUnitId: Integer;
    //FLoginUsername: string;
//    FLoginUserID : Integer;
//    FLoginUserUntID : Integer;

    procedure SettingMainMenu(AModUserApp : TModAuthUser);
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
  ufrmUserGroup, ufrmMasterCustomer, ufrmMasterProductNBD, ufrmSatuan_NBD,
  ufrmTipePembayaran, Datasnap.DSHTTPClient, ufrmProduct, ufrmDialogProduct,
  ufrmOutlet, ufrmMouselessMenu, ufrmMemberShip, ufrmQuotation,
  ufrmQuotationHargaBeli, ufrmQuotationMailer, ufrmVoucher, uFrmGenPO,
  ufrmListQuotHB, ufrmListQuotMailer, ufrmCetakPO, ufrmCancellationPO,
  ufrmChangeStatusPO, ufrmStokBarang, ufrmListingPOByMerchandisingGroup,
  ufrmHistoryPO, ufrmPrintHistoryPOBySupplier, ufrmInvMovementQTY,
  ufrmLaporanRetur, ufrmGudang, ufrmMataUang, ufrmCXLookup, uDMClient,
  ufrmSettingKoneksi, ufrmCreditCard, ufrmDaftarCompetitor,ufrmElectricCustomer,
  ufrmPemakaianBarcode, ufrmAdjustmentFaktur, ufrmBrowseQuotation, ufrmShift,
  uModSettingApp, uTSCommonDlg, ufrmScheduleAgreement, ufrmCustomerAgreement,
  ufrmFakturPajakAgreement, ufrmListAgreementDetil,
  ufrmAgreementVoucher, ufrmCustomerVoucher, ufrmGenerateVoucher,
  ufrmElectricInvoice, ufrmElectricTransaction, ufrmElectricPayment,
  ufrmProdukJasa;

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


procedure TfrmMain.actAdjustmentFakturExecute(Sender: TObject);
begin
  frmAdjustmentFaktur := TfrmAdjustmentFaktur.Create(Self);
end;

procedure TfrmMain.actAPCARDExecute(Sender: TObject);
begin
  frmAPCard := TfrmAPCard.Create(nil);
end;

procedure TfrmMain.actAPPaymentExecute(Sender: TObject);
begin
  frmBankCashOut := TfrmBankCashOut.Create(nil);
end;

procedure TfrmMain.actARBalanceExecute(Sender: TObject);
begin
  frmSummaryARBalance := TfrmSummaryARBalance.Create(nil);
end;

procedure TfrmMain.actBankExecute(Sender: TObject);
begin
  frmBank := tfrmBank.Create(Self);
end;

procedure TfrmMain.actBarcodeRequestExecute(Sender: TObject);
begin
  frmPemakaianBarcode := tfrmPemakaianBarcode.Create(Self);
end;

procedure TfrmMain.actCancPOExecute(Sender: TObject);
begin
  frmCancellationPO := TfrmCancellationPO.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actCashInExecute(Sender: TObject);
begin
  frmCashIn := TfrmCashIn.Create(Self);
end;

procedure TfrmMain.actChangeStatPOExecute(Sender: TObject);
begin
    frmChangeStatusPO := TfrmChangeStatusPO.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actClaimFakturExecute(Sender: TObject);
begin
  frmClaim := TfrmClaim.Create(Self)
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
  frmMain.Caption := ExtractFileName(ParamStr(0)) + ' ver ' + TAppUtils.GetAppVersionStr;

  // set menu on user nobody
  actOnLogin.Enabled := true;
  actOnLogout.Enabled := false;


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

procedure TfrmMain.actCompanyExecute(Sender: TObject);
begin
  frmCompany := TfrmCompany.Create(Application);
end;

procedure TfrmMain.actCompanyTypeExecute(Sender: TObject);
begin
  frmTipePerusahaan := TfrmTipePerusahaan.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actContrabonSalesExecute(Sender: TObject);
begin
  frmContrabonSales := TfrmContrabonSales.Create(Self);
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

procedure TfrmMain.actMasterProductNBDExecute(Sender: TObject);
begin
  //
end;

procedure TfrmMain.actCostCenterExecute(Sender: TObject);
begin
  frmCostCenter := TfrmCostCenter.Create(Application);
end;

procedure TfrmMain.actCrazyPriceExecute(Sender: TObject);
begin
  frmCrazyPrice := TfrmCrazyPrice.Create(Application);
end;

procedure TfrmMain.actCreditCardExecute(Sender: TObject);
begin
  frmCreditCard := TfrmCreditCard.Create(Application);
end;

procedure TfrmMain.actCustomerAgreementExecute(Sender: TObject);
begin
  frmCustomerAgreement := TfrmCustomerAgreement.CreateWithUser(Self, FFormProperty);
end;

procedure TfrmMain.actCustomerInvoiceExecute(Sender: TObject);
begin
  frmCustomerInvoice := TfrmCustomerInvoice.Create(Application);
end;

procedure TfrmMain.actDataProductExecute(Sender: TObject);
begin
  frmProduct := TfrmProduct.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actDocumentExecute(Sender: TObject);
begin
  frmDocument := TfrmDocument.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actElectricCustomerExecute(Sender: TObject);
begin
  frmElectricCustomer := TfrmElectricCustomer.Create(Self);
end;

procedure TfrmMain.actEntryPLUExternalCodeExecute(Sender: TObject);
begin
  frmHistoryBarang := TfrmHistoryBarang.Create(Self);
end;

procedure TfrmMain.actFakturPajakAgreementExecute(Sender: TObject);
begin
  frmFakturPajakAgreement := TfrmFakturPajakAgreement.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actGenPOExecute(Sender: TObject);
begin
  frmGenPO := TfrmGenPO.Create(Application);//, FFormProperty);
end;

procedure TfrmMain.actHistoryPOExecute(Sender: TObject);
begin
  frmHistoryPO := TfrmHistoryPO.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actGudangExecute(Sender: TObject);
begin
  frmGudang := TfrmGudang.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actHistoryAPExecute(Sender: TObject);
begin
  frmHistoryAP := TfrmHistoryAP.Create(nil);
end;

procedure TfrmMain.actJurnalEntryExecute(Sender: TObject);
begin
  frmJurnal := TfrmJurnal.Create(nil);
end;

procedure TfrmMain.actJurnalExecute(Sender: TObject);
begin
  frmJurnal := TfrmJurnal.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actShiftExecute(Sender: TObject);
begin
  frmShift := TfrmShift.Create(self);
end;

procedure TfrmMain.actMataUangExecute(Sender: TObject);
begin
  frmMataUang := TfrmMataUang.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actSupplierExecute(Sender: TObject);
begin
  frmSupplier := TfrmSupplier.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actKategoriExecute(Sender: TObject);
begin
  frmKategori := TfrmKategori.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actKompetitorExecute(Sender: TObject);
begin
  frmDaftarCompetitor := TfrmDaftarCompetitor.Create(Application);
end;

procedure TfrmMain.actLapInvMovementQtyExecute(Sender: TObject);
begin
  frmInvMovementQTY := TfrmInvMovementQTY.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actLaporanAgingARExecute(Sender: TObject);
begin
  frmAgingPiutang := TfrmAgingPiutang.Create(nil);
end;

procedure TfrmMain.actLaporanStokExecute(Sender: TObject);
begin
  frmStokBarang := TfrmStokBarang.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actLapReturSupExecute(Sender: TObject);
begin
  frmLaporanRetur := TfrmLaporanRetur.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actListingPObyMGExecute(Sender: TObject);
begin
  frmListingPOByMerchandisingGroup := TfrmListingPOByMerchandisingGroup.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actListingQuotationHargaBeliExecute(Sender: TObject);
begin
  frmListQuotHB := TfrmListQuotHB.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actListingQuotationMailerExecute(Sender: TObject);
begin
  frmListQuotMailer := TfrmListQuotMailer.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actListScheduleAgreementExecute(Sender: TObject);
begin
  frmScheduleAgreement := TfrmScheduleAgreement.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actMasterAgreementExecute(Sender: TObject);
begin
//    frmMasterAgreement := TfrmMasterAgreement.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actMembershipExecute(Sender: TObject);
begin
  frmMembership := TfrmMembership.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actMerchandiseExecute(Sender: TObject);
begin
  frmMerchandise := TfrmMerchandise.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actMerchanGroupExecute(Sender: TObject);
begin
  frmMerchandiseGroup := TfrmMerchandiseGroup.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actMerkExecute(Sender: TObject);
begin
  frmMerk := TfrmMerk.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actOnCreateFormExecute(Sender: TObject);
var
  iTemp: Integer;
  erMsg: string;
//  Msg: string;
  sIDUnit: string;
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

  frmMain.Height  := 640;
  frmMain.Width   := 800;
  frmMain.Caption := ParamStr(0) + ' ver ' + TAppUtils.GetAppVersionStr;

  // set menu on user nobody
  actOnLogin.Enabled := true;
  actOnLogout.Enabled := false;
  SettingMainMenu(nil);

  //Get global Variable
  if TryStrToInt(getGlobalVar('PROD_CODE_LENGTH'), iTemp) then
     igProd_Code_Length := iTemp;
  if TryStrToInt(getGlobalVar('PRICEPRECISION'), iTemp) then
     igPrice_Precision := iTemp;

  // setting invisible panel unit
  pnlUnit.Visible := false;
  //setting unit toko
  sIDUnit   := TAppUtils.BacaRegistry('UnitStore');
  if sIDUnit <> '' then
  begin
    try
      TRetno.UnitStore := TModUnit(DMClient.CrudClient.Retrieve(TModUnit.ClassName, sIDUnit));
      TRetno.SettingApp := TModSettingApp(DMClient.CrudSettingAppClient.RetrieveByCabang(
      TRetno.UnitStore, TRetno.UnitStore.ID));
      TAppUtils.SimpanMenu(actlstMain);
      SettingMainMenu(nil);
    except
      on E:Exception do TAppUtils.NotifException(E);
    end;
  end;
end;

procedure TfrmMain.actOnExitExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.actOnLoginExecute(Sender: TObject);
begin
  if not assigned(frmLogin) then
  frmLogin := TfrmLogin.Create(Application);
  frmLogin.ShowModal;

  SettingMainMenu(Tretno.UserApp);
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

//  SettingMainMenu(rNobody);

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

procedure TfrmMain.actPrintHistoryPOBySupplierExecute(Sender: TObject);
begin
    frmPrintHistoryPOBySupplier := TfrmPrintHistoryPOBySupplier.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actPrintPOExecute(Sender: TObject);
begin
    frmCetakPO := TfrmCetakPO.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actProductTypeExecute(Sender: TObject);
begin
    frmProductType := TfrmProductType.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actProductTypeNBDExecute(Sender: TObject);
begin
    frmProductTypeNBD := TfrmProductTypeNBD.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actProdukJasaExecute(Sender: TObject);
begin
  frmProdukJasa := TfrmProdukJasa.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actQuotationExecute(Sender: TObject);
begin
  frmBrowseQuotation := TfrmBrowseQuotation.Create(Self);
end;

procedure TfrmMain.actQuotationHargaBeliExecute(Sender: TObject);
begin
  frmQuotationHargaBeli := TfrmQuotationHargaBeli.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actQuotationMailerExecute(Sender: TObject);
begin
    frmQuotationMailer := TfrmQuotationMailer.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actQuotationPromoExecute(Sender: TObject);
begin
    frmQuotationMailer := TfrmQuotationMailer.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actRekeningExecute(Sender: TObject);
begin
    frmRekening := TfrmRekening.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actSalesOutletExecute(Sender: TObject);
begin
  frmOutlet := TfrmOutlet.Create(Application);
end;

procedure TfrmMain.actScheduleAgreementExecute(Sender: TObject);
begin
  frmScheduleAgreement:= TfrmScheduleAgreement.CreateWithUser(Application, FFormProperty);
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

procedure TfrmMain.actSettingAplikasiExecute(Sender: TObject);
begin
  frmSettingApp := TfrmSettingApp.Create(Self);
end;

procedure TfrmMain.actSubGroupExecute(Sender: TObject);
begin
  frmSubGroup := TfrmSubGroup.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actSupplierGroupExecute(Sender: TObject);
begin
  frmSupplierGroup := TfrmSupplierGroup.CreateWithUser(Application, FFormProperty);
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

procedure TfrmMain.actTipeBonusExecute(Sender: TObject);
begin
  frmTipeBonus := TfrmTipeBonus.CreateWithUser (Application, FFormProperty);
end;

procedure TfrmMain.actTipeCNExecute(Sender: TObject);
begin
  frmTipeCN := TfrmTipeCN.CreateWithUser (Application, FFormProperty);
end;

procedure TfrmMain.actTipePembayaranExecute(Sender: TObject);
begin
  frmTipePembayaran := TfrmTipePembayaran.CreateWithUser (Application, FFormProperty);
end;

procedure TfrmMain.actTipePengirimanPOExecute(Sender: TObject);
begin
    frmTipePengirimanPO := TfrmTipePengirimanPO.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actUnitExecute(Sender: TObject);
begin
  frmUnit := TfrmUnit.Create(Application);
end;

procedure TfrmMain.actUnitStoreExecute(Sender: TObject);
begin
  frmUnit := TfrmUnit.Create(Application);
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
  frmUser := TfrmUser.Create(Self);
end;

procedure TfrmMain.actUserGroupExecute(Sender: TObject);
begin
    frmUserGroup := TfrmUserGroup.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.actVoucherExecute(Sender: TObject);
begin
//  frmVoucher := TfrmVoucher.CreateWithUser(Application, FFormProperty);
  frmVoucher := TfrmVoucher.Create(Self);
end;

procedure TfrmMain.AppEventsException(Sender: TObject; E: Exception);
begin
  TAppUtils.ShowException(E);
end;

procedure TfrmMain.AppEventsShortCut(var Msg: TWMKey; var Handled:
    Boolean);
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

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  raise Exception.Create('Error Message');
end;

procedure TfrmMain.DialogBarang1Click(Sender: TObject);
begin
  with TfrmDialogProduct.Create(Self) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmMain.dxbrbAgListDetilClick(Sender: TObject);
begin
  frmListAgreementDetil := TfrmListAgreementDetil.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.dxbrbElectricInvoiceClick(Sender: TObject);
begin
  frmElectricInvoice := TfrmElectricInvoice.Create(Self);
end;

procedure TfrmMain.dxbrbElectricPaymentClick(Sender: TObject);
begin
  frmElectricPayment := TfrmElectricPayment.Create(Self);
end;

procedure TfrmMain.dxbrbElectricTransactionClick(Sender: TObject);
begin
  frmElectricTransaction := TfrmElectricTransaction.Create(Self);
end;

procedure TfrmMain.dxbrbVouAgreementClick(Sender: TObject);
begin
  frmAgreementVoucher := TfrmAgreementVoucher.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.dxbrbVouCustomerClick(Sender: TObject);
begin
  frmCustomerVoucher := TfrmCustomerVoucher.CreateWithUser(Application, FFormProperty);
end;

procedure TfrmMain.dxbrbVouGenerateClick(Sender: TObject);
begin
  frmGenerateVoucher := TfrmGenerateVoucher.CreateWithUser(Application, FFormProperty);
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

procedure TfrmMain.est2Click(Sender: TObject);
begin
  TfrmOutlet.Create(Application);
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

  sbMain.Panels[0].Text := 'Server : ' + DMClient.RestConn.Host;
  sbMain.Panels[1].Text := 'Port : ' + IntToStr(DMClient.RestConn.Port);
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
//  frmLogin := TfrmLogin.Create(Application);
//  frmLogin.IsForSetting := true;
//  frmLogin.Caption := 'Setting Connection';
//  frmLogin.ShowFormLogin(CONNECTION_PAGE);
end;

//procedure TfrmMain.SetStatusHOSTORE;
//begin
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
//end;

procedure TfrmMain.SettingMainMenu(AModUserApp : TModAuthUser);
var
  I: Integer;
  j: Integer;
begin
  if AModUserApp = nil then
    Exit;

  for I := 0 to actlstMain.ActionCount - 1 do
  begin
    begin
      if AModUserApp.Usr_UserName = 'admin' then
      begin
        actlstMain.Actions[i].Enabled := True
      end else begin
        for j := 0 to AModUserApp.UserMenuItems.Count - 1 do
        begin
          if actlstMain.Actions[i].Name = AModUserApp.UserMenuItems[i].Menu.MenuCaption then
            actlstMain.Actions[i].Enabled := True;

        end;

      end;
    end;
  end;

end;

procedure TfrmMain.test1Click(Sender: TObject);
begin
  With TfrmCXLookup.Execute('Contoh lookup','TDSProvider.Suplier_GetDSLookup')  do
  begin
    Try
      HideFields(['Suplier_ID']);
      if ShowModal = mrOk then
        showmessage(Data.FieldByName('Suplier_ID').AsString);
    Finally
      Free;
    End;
  end;
end;

end.
