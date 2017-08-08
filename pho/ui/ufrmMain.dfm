object frmMain: TfrmMain
  Left = 0
  Top = 0
  ActiveControl = cbbCompCode
  Caption = 'Head Office :: ASSALAAM HYPERMARKET'
  ClientHeight = 527
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = actOnCreateFormExecute
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object sbMain: TdxStatusBar
    Left = 0
    Top = 507
    Width = 800
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = 'User login:'
        Width = 110
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = 'Role: '
        Width = 110
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = 'Database:'
        Width = 250
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object pnlUnit: TPanel
    Left = 0
    Top = 148
    Width = 800
    Height = 38
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object lbl1: TLabel
      Left = 360
      Top = 8
      Width = 127
      Height = 16
      Caption = '&Unit Store [Ctrl+Shift+U]:'
    end
    object lbl2: TLabel
      Left = 8
      Top = 8
      Width = 149
      Height = 16
      Caption = '&Company Code [Ctrl+Shift+C]:'
    end
    object cbbUnit: TComboBox
      Left = 489
      Top = 5
      Width = 216
      Height = 24
      BevelKind = bkSoft
      Style = csDropDownList
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object cbbCompCode: TComboBox
      Left = 160
      Top = 6
      Width = 194
      Height = 24
      BevelKind = bkSoft
      Style = csDropDownList
      Ctl3D = False
      ItemIndex = 0
      ParentCtl3D = False
      TabOrder = 0
      Text = '01 - [MG] MULTIGROSIR'
      Items.Strings = (
        '01 - [MG] MULTIGROSIR'
        '10 - [HO] HEAD OFFICE'
        '20 - ASGROSS')
    end
  end
  object dxrbnHO: TdxRibbon
    Left = 0
    Top = 0
    Width = 800
    Height = 120
    BarManager = dxbrmngrHO
    Style = rs2013
    ColorSchemeName = 'White'
    Fonts.ApplicationButton.Charset = DEFAULT_CHARSET
    Fonts.ApplicationButton.Color = clWindowText
    Fonts.ApplicationButton.Height = -12
    Fonts.ApplicationButton.Name = 'Verdana'
    Fonts.ApplicationButton.Style = []
    Fonts.AssignedFonts = [afTabHeader, afGroup, afGroupHeader, afApplicationButton]
    Fonts.Group.Charset = DEFAULT_CHARSET
    Fonts.Group.Color = 5978398
    Fonts.Group.Height = -12
    Fonts.Group.Name = 'Verdana'
    Fonts.Group.Style = []
    Fonts.GroupHeader.Charset = DEFAULT_CHARSET
    Fonts.GroupHeader.Color = 6710886
    Fonts.GroupHeader.Height = -12
    Fonts.GroupHeader.Name = 'Verdana'
    Fonts.GroupHeader.Style = []
    Fonts.TabHeader.Charset = DEFAULT_CHARSET
    Fonts.TabHeader.Color = clWindowText
    Fonts.TabHeader.Height = -12
    Fonts.TabHeader.Name = 'Verdana'
    Fonts.TabHeader.Style = []
    Contexts = <>
    TabOrder = 6
    TabStop = False
    object dxrbntbSystem: TdxRibbonTab
      Caption = 'System'
      Groups = <
        item
          ToolbarName = 'dxbrSystem'
        end>
      Index = 0
    end
    object dxrbntbReference: TdxRibbonTab
      Caption = 'Reference'
      Groups = <
        item
          Caption = 'Finance'
          ToolbarName = 'dxbrReferenceFinance'
        end
        item
          Caption = 'Inventory'
          ToolbarName = 'dxbrReferenceInventory'
        end
        item
          Caption = 'Other'
          ToolbarName = 'dxbrReferenceOther'
        end>
      Index = 1
    end
    object dxrbntbMembership: TdxRibbonTab
      Caption = 'Membership'
      Groups = <
        item
          Caption = 'Membership'
          ToolbarName = 'dxbrMembership'
        end>
      Index = 2
    end
    object dxrbntbFinance: TdxRibbonTab
      Caption = 'Finance & Accounting '
      Groups = <
        item
          Caption = 'Master'
          ToolbarName = 'dxbrFinanceMaster'
        end
        item
          ToolbarName = 'dxbrFinanceOther'
        end
        item
          ToolbarName = 'dxbrAP'
        end>
      Index = 3
    end
    object dxrbntbMerchandize: TdxRibbonTab
      Active = True
      Caption = 'Merchandize'
      Groups = <
        item
          ToolbarName = 'dxbrMerchandize'
        end>
      Index = 4
    end
    object dxrbntbSetting: TdxRibbonTab
      Caption = 'Setting'
      Groups = <
        item
          ToolbarName = 'dxbrSetting'
        end>
      Index = 5
    end
    object dxrbntbWindow: TdxRibbonTab
      Caption = 'Window'
      Groups = <
        item
          ToolbarName = 'dxbrWindow'
        end>
      Index = 6
    end
  end
  object mmMainMenu: TMainMenu
    Left = 176
    Top = 192
    object mmSistem: TMenuItem
      Caption = '&System'
      object miLogin: TMenuItem
        Action = actOnLogin
      end
      object miLogout: TMenuItem
        Action = actOnLogout
      end
      object MenuItem1: TMenuItem
        Caption = '-'
      end
      object miExit: TMenuItem
        Action = actOnExit
      end
    end
    object Referensi1: TMenuItem
      Caption = 'Reference'
      object Bank1: TMenuItem
        Action = actBank
      end
      object Pajak1: TMenuItem
        Action = actPajak
      end
      object ProductType1: TMenuItem
        Action = actProductType
      end
      object UnitOfMeasure1: TMenuItem
        Action = actUOM
      end
      object actTipePembayaran1: TMenuItem
        Action = actTipePembayaran
        Caption = 'Tipe Pembayaran'
      end
      object CompanyType1: TMenuItem
        Action = actCompanyType
      end
      object actCostCenter1: TMenuItem
        Action = actCostCenter
      end
      object ipeSuplier1: TMenuItem
        Action = actSupplierType
      end
      object Company1: TMenuItem
        Action = actCompany
      end
      object SalesOutlet1: TMenuItem
        Action = actSalesOutlet
      end
      object UnitStore1: TMenuItem
        Action = actUnitStore
      end
      object Document1: TMenuItem
        Action = actDocument
      end
      object ipePO1: TMenuItem
        Action = actTipePO
      end
      object MasterAgama1: TMenuItem
        Action = actAgama
      end
      object CreditCard1: TMenuItem
        Action = actCreditCard
      end
    end
    object CustomerSupport1: TMenuItem
      Caption = 'Membership'
      object MasterCustomer1: TMenuItem
        Action = actMembership
      end
    end
    object Finance1: TMenuItem
      Caption = 'Finance'
      object Rekening1: TMenuItem
        Action = actRekening
      end
    end
    object Merchandise1: TMenuItem
      Caption = 'Merchandise'
      object Merchandise2: TMenuItem
        Action = actMerchandise
      end
      object MerchandiseGroup1: TMenuItem
        Action = actMerchanGroup
      end
      object SubGroup1: TMenuItem
        Action = actSubGroup
      end
      object Kategori1: TMenuItem
        Action = actKategori
      end
      object Merk1: TMenuItem
        Action = actMerk
      end
      object MasterProduct1: TMenuItem
        Action = actDataProduct
      end
      object SupplierGroup1: TMenuItem
        Action = actSupplierGroup
      end
      object actSupplier1: TMenuItem
        Action = actSupplier
      end
      object Kompetitor1: TMenuItem
        Action = actKompetitor
      end
    end
    object mmSetting1: TMenuItem
      Caption = 'Se&tting'
      object miConnectionDatabase: TMenuItem
        Action = actSetKoneksi
      end
      object MenuItem2: TMenuItem
        Caption = '-'
      end
      object miGlobalParameter: TMenuItem
        Action = actSettingAplikasi
      end
    end
    object mmWindow: TMenuItem
      Caption = '&Window'
      object miCascade: TMenuItem
        Action = actCascade
      end
      object miTile: TMenuItem
        Action = actTile
      end
      object miArrange: TMenuItem
        Action = actArrange
      end
      object MenuItem3: TMenuItem
        Caption = '-'
      end
      object miCloseAll: TMenuItem
        Action = actCloseAll
      end
      object SysParam: TMenuItem
        Caption = 'System Parameter'
      end
    end
    object mmAbout1: TMenuItem
      Caption = '&Help'
      object miHeadOfficeHelp: TMenuItem
        Caption = 'Head Office Help'
        ShortCut = 112
      end
      object MenuItem4: TMenuItem
        Caption = '-'
      end
      object miAbout: TMenuItem
        Caption = 'About...'
      end
    end
    object est1: TMenuItem
      Caption = 'Test'
      object DialogBarang1: TMenuItem
        Caption = 'Dialog Barang'
        OnClick = DialogBarang1Click
      end
      object est2: TMenuItem
        Caption = 'Test'
        OnClick = est2Click
      end
      object MataUang1: TMenuItem
        Action = actMataUang
      end
      object ipeBonus1: TMenuItem
        Action = actTipeBonus
      end
      object ipeCN1: TMenuItem
        Action = actTipeCN
      end
      object test1: TMenuItem
        Caption = 'test'
        OnClick = test1Click
      end
    end
    object Inventory1: TMenuItem
      Caption = 'Inventory'
      object Gudang1: TMenuItem
        Action = actGudang
      end
    end
  end
  object actlstMain: TActionList
    Images = DMClient.imgListButton
    Left = 85
    Top = 186
    object actOnCreateForm: TAction
      Category = 'Sistem'
      Caption = 'actOnCreateForm'
      OnExecute = actOnCreateFormExecute
    end
    object actOnLogout: TAction
      Category = 'Sistem'
      Caption = 'Logout'
      ImageIndex = 68
      ShortCut = 24652
      OnExecute = actOnLogoutExecute
    end
    object actOnLogin: TAction
      Category = 'Sistem'
      Caption = 'Login'
      ImageIndex = 69
      ShortCut = 16460
      OnExecute = actOnLoginExecute
    end
    object actOnExit: TAction
      Category = 'Sistem'
      Caption = 'Exit'
      ImageIndex = 66
      ShortCut = 32883
      OnExecute = actOnExitExecute
    end
    object actModule1: TAction
      Category = 'Contoh'
      Caption = 'Module 1'
    end
    object actCascade: TAction
      Category = 'Window'
      Caption = '&Cascade'
      ImageIndex = 65
    end
    object actTile: TAction
      Category = 'Window'
      Caption = '&Tile'
    end
    object actArrange: TAction
      Category = 'Window'
      Caption = '&Arrange'
    end
    object actCloseAll: TAction
      Category = 'Window'
      Caption = 'Clo&se All'
      ImageIndex = 67
      OnExecute = actCloseAllExecute
    end
    object actAuthentikasiModul: TAction
      Category = 'Contoh'
      Caption = 'Module Authentication'
    end
    object actPajak: TAction
      Category = 'References'
      Caption = 'Tax'
      OnExecute = actPajakExecute
    end
    object actSupplierType: TAction
      Category = 'References'
      Caption = 'Supplier Type'
      ImageIndex = 56
      OnExecute = actSupplierTypeExecute
    end
    object actUOM: TAction
      Category = 'References'
      Caption = 'Unit Of Measure'
      ImageIndex = 52
      OnExecute = actUOMExecute
    end
    object actGroupSubGroupCat: TAction
      Category = 'References'
      Caption = 'Group/Sub Group/Category'
    end
    object actSalesOutlet: TAction
      Category = 'References'
      Caption = 'Sales Outlet'
      ImageIndex = 57
      OnExecute = actSalesOutletExecute
    end
    object actUnitStore: TAction
      Category = 'References'
      Caption = 'Unit Store'
      ImageIndex = 55
      OnExecute = actUnitStoreExecute
    end
    object actCompanyType: TAction
      Category = 'References'
      Caption = 'Company Type'
      ImageIndex = 54
      OnExecute = actCompanyTypeExecute
    end
    object actBank: TAction
      Category = 'References'
      Caption = 'Bank'
      OnExecute = actBankExecute
    end
    object actMerchanGroup: TAction
      Category = 'References'
      Caption = 'Merchandise Group'
      ImageIndex = 59
      OnExecute = actMerchanGroupExecute
    end
    object actMerchandise: TAction
      Category = 'References'
      Caption = 'Merchandise'
      ImageIndex = 60
      OnExecute = actMerchandiseExecute
    end
    object actProductType: TAction
      Category = 'References'
      Caption = 'Product Type'
      OnExecute = actProductTypeExecute
    end
    object actDataSupplier: TAction
      Category = 'Merchandise'
      Caption = 'Master &Supplier'
    end
    object actSupplierProduct: TAction
      Category = 'Merchandise'
      Caption = 'Supplier'#39's Product'
    end
    object actDataProduct: TAction
      Category = 'Merchandise'
      Caption = '&Product'
      ImageIndex = 62
      OnExecute = actDataProductExecute
    end
    object actDataCompetitor: TAction
      Category = 'Merchandise'
      Caption = 'Data Competitor'
    end
    object actCompetitorProduct: TAction
      Category = 'Merchandise'
      Caption = 'Competitor'#39's Product'
    end
    object actTipePembayaran: TAction
      Category = 'Merchandise'
      Caption = 'Payment Type'
      OnExecute = actTipePembayaranExecute
    end
    object actTipePengirimanPO: TAction
      Category = 'Merchandise'
      Caption = 'actTipePengirimanPO'
      OnExecute = actTipePengirimanPOExecute
    end
    object actHariLibur: TAction
      Category = 'References'
      Caption = 'Day Off'
      OnExecute = actHariLiburExecute
    end
    object actClaimFaktur: TAction
      Category = 'Finance'
      Caption = '&Claim Faktur'
    end
    object actAdjustmentFaktur: TAction
      Category = 'Finance'
      Caption = '&Adjustment Faktur'
      ImageIndex = 46
      OnExecute = actAdjustmentFakturExecute
    end
    object actMonitoringCekGiro: TAction
      Category = 'Finance'
      Caption = '&Monitoring Cek/Giro'
    end
    object actPaymentFaktur: TAction
      Category = 'Finance'
      Caption = '&Payment Faktur'
    end
    object actIGRADesc: TAction
      Category = 'References'
      Caption = 'IGRA Desc'
    end
    object actLokasi: TAction
      Category = 'References'
      Caption = 'Lokasi'
      OnExecute = actLokasiExecute
    end
    object actListAPBalance: TAction
      Category = 'Finance'
      Caption = 'actListAPBalance'
    end
    object actClaimContrabon: TAction
      Category = 'Finance'
      Caption = 'C&laim Contrabon'
    end
    object actPaymentContrabon: TAction
      Category = 'Finance'
      Caption = 'P&ayment Contrabon'
    end
    object actListARBalance: TAction
      Category = 'Finance'
      Caption = 'actListARBalance'
    end
    object actImportEOD: TAction
      Category = 'Finance'
      Caption = '&Import EOD'
    end
    object actInputContrabon: TAction
      Category = 'Finance'
      Caption = 'I&nput Contrabon'
    end
    object actPotonganTagihan: TAction
      Category = 'Finance'
      Caption = '&Potongan Tagihan'
    end
    object actInvoiceSewaToko: TAction
      Category = 'Finance'
      Caption = 'In&voice Sewa Toko'
    end
    object actMasterAgreement: TAction
      Category = 'Finance'
      Caption = '&Master Agreement'
    end
    object actMasterAdjustment: TAction
      Category = 'Finance'
      Caption = '&Master Adjustment'
    end
    object actAdjustmentJurnalCode: TAction
      Category = 'Finance'
      Caption = '&Adjustment Jurnal Code'
    end
    object actListNP: TAction
      Category = 'Finance'
      Caption = 'actListNP'
    end
    object actExportSync: TAction
      Category = 'EOD'
      Caption = '&Export Sync'
    end
    object actListDisbursement: TAction
      Category = 'Finance'
      Caption = 'List Disbursement'
    end
    object actListARPayment: TAction
      Category = 'Finance'
      Caption = 'actListARPayment'
    end
    object actListAgreementDetil: TAction
      Category = 'Finance'
      Caption = 'Listing Agreement Detil'
    end
    object actImportSync: TAction
      Category = 'EOD'
      Caption = '&Import Sync'
    end
    object actUOMNBD: TAction
      Category = 'References'
      Caption = 'Unit Of Measure NBD'
      OnExecute = actUOMNBDExecute
    end
    object actProductTypeNBD: TAction
      Category = 'References'
      Caption = 'Product Type NBD'
      OnExecute = actProductTypeNBDExecute
    end
    object actMasterProductNBD: TAction
      Category = 'References'
      Caption = 'Master Product NBD'
      OnExecute = actMasterProductNBDExecute
    end
    object actUserGroup: TAction
      Category = 'Management User'
      Caption = 'User &Group'
      OnExecute = actUserGroupExecute
    end
    object actUser: TAction
      Category = 'Management User'
      Caption = '&User'
      OnExecute = actUserExecute
    end
    object actMasterCustomer: TAction
      Category = 'References'
      Caption = 'Master Customer'
      OnExecute = actMasterCustomerExecute
    end
    object actValidateContrabon: TAction
      Category = 'Finance'
      Caption = 'actValidateContrabon'
    end
    object actARPayment: TAction
      Category = 'Finance'
      Caption = 'Pa&yment'
    end
    object actDisburstment: TAction
      Category = 'Finance'
      Caption = '&Disburstment'
    end
    object actReceipt: TAction
      Category = 'Finance'
      Caption = '&Receipt'
    end
    object actTransferDeposit: TAction
      Category = 'Finance'
      Caption = '&Transfer / Deposit'
    end
    object actAPPayment: TAction
      Category = 'Finance'
      Caption = '&Payment'
    end
    object actVoucher: TAction
      Category = 'Accounting'
      Caption = '&Voucher'
      OnExecute = actVoucherExecute
    end
    object actSetupCashManagement: TAction
      Category = 'Finance'
      Caption = 'actSetupCashManagement'
    end
    object actPendingCheque: TAction
      Category = 'Finance'
      Caption = 'P&ending Cheque'
    end
    object actStandardJournal: TAction
      Category = 'Accounting'
      Caption = '&Standard Journal'
    end
    object actFixAsset: TAction
      Category = 'Accounting'
      Caption = 'actFixAsset'
    end
    object actSetupFixAsset: TAction
      Category = 'Accounting'
      Caption = 'actSetupFixAsset'
    end
    object actMasterAmortisasi: TAction
      Category = 'Accounting'
      Caption = 'actMasterAmortisasi'
    end
    object actSellingAsset: TAction
      Category = 'Accounting'
      Caption = 'actSellingAsset'
    end
    object actDisplayDepreciationSchedule: TAction
      Category = 'Accounting'
      Caption = 'actDisplayDepreciationSchedule'
    end
    object actListingClaim: TAction
      Category = 'Finance'
      Caption = 'actListingClaim'
    end
    object actADSMasuk: TAction
      Category = 'Merchandise'
      Caption = 'actADSMasuk'
    end
    object actADSKeluar: TAction
      Category = 'Merchandise'
      Caption = 'actADSKeluar'
    end
    object actMenuPrintSalesAnalys: TAction
      Category = 'Finance'
      Caption = 'Print Sales Analysis'
    end
    object actPostingDeprAmor: TAction
      Category = 'Accounting'
      Caption = 'Posting Depresiasi Amortisasi'
    end
    object actAccountingPeriode: TAction
      Category = 'Accounting'
      Caption = 'Accounting Periode'
    end
    object actInvoice: TAction
      Category = 'Finance'
      Caption = 'Invoice'
    end
    object actAutomaticAccrual: TAction
      Category = 'Finance'
      Caption = 'Automatic Accrual'
    end
    object actPrintTransferList: TAction
      Category = 'Finance'
      Caption = 'Print Transfer List'
    end
    object actTrialBalance: TAction
      Category = 'Accounting'
      Caption = 'Trial Balance'
    end
    object actGeneralLedger: TAction
      Category = 'Accounting'
      Caption = '&General Ledger'
    end
    object actRekening: TAction
      Category = 'Accounting'
      Caption = 'Chart of Account'
      ImageIndex = 52
      OnExecute = actRekeningExecute
    end
    object actBalanceSheet: TAction
      Category = 'Accounting'
      Caption = '&Balance Sheet'
    end
    object actProfitLoss: TAction
      Category = 'Accounting'
      Caption = '&Profit Loss'
    end
    object actListingJurnal: TAction
      Category = 'Accounting'
      Caption = 'Listing Jurnal'
    end
    object actClosingFiscalYear: TAction
      Category = 'Accounting'
      Caption = 'Closing Fiscal Year'
    end
    object actJurnalEntry: TAction
      Category = 'Accounting'
      Caption = 'Jurnal Entry'
    end
    object actOpeningFiscalYear: TAction
      Category = 'Accounting'
      Caption = 'actOpeningFiscalYear'
    end
    object actBarcodeUsage: TAction
      Category = 'Finance'
      Caption = 'Barcode Usage'
      ImageIndex = 62
      OnExecute = actBarcodeUsageExecute
    end
    object actListPemakaianBarcode: TAction
      Category = 'Finance'
      Caption = 'actListPemakaianBarcode'
    end
    object actPostingJournal: TAction
      Category = 'Accounting'
      Caption = 'Posting Journal'
    end
    object actUnpostingJournal: TAction
      Category = 'Accounting'
      Caption = 'actUnpostingJournal'
    end
    object actJournalAutomatic: TAction
      Category = 'Accounting'
      Caption = 'Journal Automatic'
    end
    object actGeneralLedgerCY: TAction
      Category = 'Accounting'
      Caption = 'G&eneral Ledger Closing Year'
    end
    object actBalanceSheetCY: TAction
      Category = 'Accounting'
      Caption = 'B&alance Sheet'
    end
    object actProfitLossCY: TAction
      Category = 'Accounting'
      Caption = 'P&rofit Loss'
    end
    object actPaymentClaimContrabon: TAction
      Category = 'Finance'
      Caption = 'Payment Claim Contrabon'
    end
    object actElectricCustomer: TAction
      Category = 'Finance'
      Caption = 'Electric Customer'
      OnExecute = actElectricCustomerExecute
    end
    object actElectricTransaction: TAction
      Category = 'Finance'
      Caption = 'actElectricTransaction'
    end
    object actElectricInvoice: TAction
      Category = 'Finance'
      Caption = 'actElectricInvoice'
    end
    object actCashFlow: TAction
      Category = 'Accounting'
      Caption = '&Cash Flow'
    end
    object actCashBalance: TAction
      Category = 'Accounting'
      Caption = 'Cash Ba&lance'
    end
    object actDailyBalance: TAction
      Category = 'Accounting'
      Caption = '&Daily Balance'
    end
    object actPaymentClaimTransfer: TAction
      Category = 'Finance'
      Caption = 'actPaymentClaimTransfer'
    end
    object actElectricPayment: TAction
      Category = 'Finance'
      Caption = 'actElectricPayment'
    end
    object actQuotation: TAction
      Category = 'Merchandise'
      Caption = 'Quotation'
      OnExecute = actQuotationExecute
    end
    object actMarkUpSellingPrice: TAction
      Category = 'Merchandise'
      Caption = 'Markup Selling Price'
    end
    object actHistoryPrice: TAction
      Category = 'Merchandise'
      Caption = 'History Price'
    end
    object actListingAgreement: TAction
      Category = 'Finance'
      Caption = 'Listing Agreement'
    end
    object actInvoiceTrader: TAction
      Category = 'Finance'
      Caption = 'Invoice Trader'
    end
    object actPaymentTrader: TAction
      Category = 'Finance'
      Caption = 'Payment Trader'
    end
    object actListDoOutstanding: TAction
      Category = 'Finance'
      Caption = 'actListDoOutstanding'
    end
    object actListingAgingInvoiceTrader: TAction
      Category = 'Finance'
      Caption = 'Listing Aging Invoice Trader'
    end
    object actListAPPayment: TAction
      Category = 'Finance'
      Caption = 'actListAPPayment'
    end
    object actListClaimFakturPajak: TAction
      Category = 'Finance'
      Caption = 'actListClaimFakturPajak'
    end
    object actPendingCekOutCekAPNBD: TAction
      Category = 'Finance'
      Caption = 'actPendingCekOutCekAPNBD'
    end
    object actListingReceipt: TAction
      Category = 'Finance'
      Caption = 'actListingReceipt'
    end
    object actListingGeneralLedger: TAction
      Category = 'Accounting'
      Caption = 'actListingGeneralLedger'
    end
    object actListCNOutstanding: TAction
      Category = 'Finance'
      Caption = 'List CN Outstanding'
    end
    object actListMonthlyDepreciation: TAction
      Category = 'Accounting'
      Caption = 'List Monthly Depreciation'
    end
    object actListChequeGiroRegister: TAction
      Category = 'Finance'
      Caption = 'actListChequeGiroRegister'
    end
    object actCustomerVoucher: TAction
      Category = 'Marketing'
      Caption = 'Customer Voucher'
    end
    object actAgreementVoucher: TAction
      Category = 'Marketing'
      Caption = 'Agreement Voucher'
    end
    object actGenerateVoucher: TAction
      Category = 'Marketing'
      Caption = 'Generate Voucher'
    end
    object actListQuotation: TAction
      Category = 'Merchandise'
      Caption = 'actListQuotation'
    end
    object actListBankDeposit: TAction
      Category = 'Finance'
      Caption = 'actListBankDeposit'
    end
    object actJournalAutomaticFinance: TAction
      Category = 'Finance'
      Caption = 'Journal Automatic Finance'
    end
    object actListScheduleAgreement: TAction
      Category = 'Finance'
      Caption = 'actListScheduleAgreement'
    end
    object actDailySalesReport: TAction
      Category = 'Finance'
      Caption = 'actDailySalesReport'
    end
    object actPrintWorksheet: TAction
      Category = 'Finance'
      Caption = 'actPrintWorksheet'
    end
    object actCashierCollectionReport: TAction
      Category = 'Finance'
      Caption = 'actCashierCollectionReport'
    end
    object actListRecapCreditDebetCard: TAction
      Category = 'Finance'
      Caption = 'actListRecapCreditDebetCard'
    end
    object actPrintPurchaseOrder: TAction
      Category = 'Finance'
      Caption = 'actPrintPurchaseOrder'
    end
    object actListingPOByMerchandisingGroup: TAction
      Category = 'Finance'
      Caption = 'actListingPOByMerchandisingGroup'
    end
    object actPrintRecapitulationPO: TAction
      Category = 'Finance'
      Caption = 'actPrintRecapitulationPO'
    end
    object actHistoryPO: TAction
      Category = 'Finance'
      Caption = 'actHistoryPO'
      OnExecute = actHistoryPOExecute
    end
    object actPrintHistoryPOBySupplier: TAction
      Category = 'Finance'
      Caption = 'actPrintHistoryPOBySupplier'
      OnExecute = actPrintHistoryPOBySupplierExecute
    end
    object actListPOCancel: TAction
      Category = 'Finance'
      Caption = 'actListPOCancel'
    end
    object actListingReceivingProduct: TAction
      Category = 'Finance'
      Caption = 'actListingReceivingProduct'
    end
    object actRekapitulasiCN: TAction
      Category = 'Finance'
      Caption = 'actRekapitulasiCN'
    end
    object actListAdjustmentProduct: TAction
      Category = 'Finance'
      Caption = 'actListAdjustmentProduct'
    end
    object actListOutstandingDOTrader: TAction
      Category = 'Finance'
      Caption = 'List Outstanding DO Trader'
    end
    object actListPODOReceive: TAction
      Category = 'Finance'
      Caption = 'actListPODOReceive'
    end
    object actListOmzet: TAction
      Category = 'Finance'
      Caption = 'actListOmzet'
    end
    object actSalesReportContrabon: TAction
      Category = 'Finance'
      Caption = 'actSalesReportContrabon'
    end
    object actDailySalesAnalysis: TAction
      Category = 'Finance'
      Caption = 'actDailySalesAnalysis'
    end
    object actListCNDamage: TAction
      Category = 'Finance'
      Caption = 'actListCNDamage'
    end
    object actListCashBalance: TAction
      Category = 'Accounting'
      Caption = 'Listing Cash Balance'
    end
    object actListProduct: TAction
      Category = 'Merchandise'
      Caption = 'Listing Product'
    end
    object actListSupplier: TAction
      Category = 'Merchandise'
      Caption = 'Listing Supplier'
    end
    object actSupplierNBD: TAction
      Category = 'Merchandise'
      Caption = 'actSupplierNBD'
    end
    object actListInvoice: TAction
      Category = 'Finance'
      Caption = 'Listing Invoice'
    end
    object actPriceConfirmation: TAction
      Category = 'Merchandise'
      Caption = 'Price Confirmation'
    end
    object actListChangeSellingPrice: TAction
      Category = 'Merchandise'
      Caption = 'List Change Selling Price'
    end
    object actAturanBonus: TAction
      Category = 'Merchandise'
      Caption = 'actAturanBonus'
    end
    object actQuotationPromo: TAction
      Category = 'Merchandise'
      Caption = 'actQuotationPromo'
      OnExecute = actQuotationPromoExecute
    end
    object actSettingJurnal: TAction
      Category = 'EOD'
      Caption = 'actSettingJurnal'
    end
    object actGenerateJurnal: TAction
      Category = 'EOD'
      Caption = 'actGenerateJurnal'
    end
    object actQuotationHargaBeli: TAction
      Category = 'Merchandise'
      Caption = 'actQuotationHargaBeli'
      OnExecute = actQuotationHargaBeliExecute
    end
    object actGenerateJurnalManual: TAction
      Category = 'EOD'
      Caption = 'actGenerateJurnalManual'
    end
    object actTransaksiJurnal: TAction
      Category = 'Accounting'
      Caption = 'actTransaksiJurnal'
    end
    object actPurchaseSuggestion: TAction
      Category = 'Merchandise'
      Caption = 'actPurchaseSuggestion'
    end
    object actGenPO: TAction
      Category = 'Merchandise'
      Caption = 'actGenPO'
      OnExecute = actGenPOExecute
    end
    object actPrintPO: TAction
      Category = 'Merchandise'
      Caption = 'actPrintPO'
      OnExecute = actPrintPOExecute
    end
    object actApprovalPO: TAction
      Category = 'Merchandise'
      Caption = 'actApprovalPO'
    end
    object actCancPO: TAction
      Category = 'Merchandise'
      Caption = 'actCancPO'
      OnExecute = actCancPOExecute
    end
    object actDispPO: TAction
      Category = 'Merchandise'
      Caption = 'actDispPO'
    end
    object actChangeStatPO: TAction
      Category = 'Merchandise'
      Caption = 'actChangeStatPO'
      OnExecute = actChangeStatPOExecute
    end
    object actActionList: TAction
      Category = 'Management User'
      Caption = 'actActionList'
    end
    object actSysParameter: TAction
      Caption = 'actSysParameter'
    end
    object actSupplierGroup: TAction
      Category = 'Merchandise'
      Caption = 'Supplier Group'
      ImageIndex = 61
      OnExecute = actSupplierGroupExecute
    end
    object actReprintNP: TAction
      Caption = 'actReprintNP'
    end
    object actJurnal: TAction
      Category = 'Accounting'
      Caption = 'actJurnal'
    end
    object actListingProductNBD: TAction
      Caption = 'Listing Produk NBD'
    end
    object actRumusJurnal: TAction
      Caption = 'Rumus Jurnal'
    end
    object actPkmAvg: TAction
      Caption = 'PKM Average'
    end
    object actListQuotMailer: TAction
      Caption = 'Listing Quotation Mailer'
    end
    object actListQuotHargaBeli: TAction
      Caption = 'Listing Quotation Harga Beli'
    end
    object actEODHO: TAction
      Caption = 'EOD HO'
    end
    object actMasterSupNBD: TAction
      Caption = 'actMasterSupNBD'
    end
    object actListBankBalance: TAction
      Caption = 'actListBankBalance'
    end
    object actBankDeposit: TAction
      Caption = 'actBankDeposit'
    end
    object actDetilAgrment: TAction
      Caption = 'actDetilAgrment'
    end
    object actUserGroupMerchan: TAction
      Category = 'Management User'
      Caption = 'actUserGroupMerchan'
    end
    object actSuplierUnitLeadTime: TAction
      Category = 'Merchandise'
      Caption = 'actSuplierUnitLeadTime'
    end
    object actUnitLeadTime: TAction
      Category = 'Merchandise'
      Caption = 'actUnitLeadTime'
    end
    object actLaporanKonsinyasi: TAction
      Category = 'Inventory'
      Caption = 'Laporan Konsinyasi'
    end
    object actLapInvMovementQty: TAction
      Category = 'Inventory'
      Caption = 'Laporan Inventory Movement Qty'
      OnExecute = actLapInvMovementQtyExecute
    end
    object actDisplayPO: TAction
      Category = 'Merchandise'
      Caption = 'actDisplayPO'
    end
    object actUbahQtyDisk: TAction
      Category = 'Merchandise'
      Caption = 'actUbahQtyDisk'
    end
    object actLaporanKonsinyasiAll: TAction
      Category = 'Inventory'
      Caption = 'actLaporanKonsinyasiAll'
    end
    object actLaporanMutasiKeluar: TAction
      Category = 'Inventory'
      Caption = 'actLaporanMutasiKeluar'
    end
    object actLaporanMutasiMasuk: TAction
      Category = 'Inventory'
      Caption = 'actLaporanMutasiMasuk'
    end
    object actStatusEximp: TAction
      Category = 'EOD'
      Caption = 'actStatusEximp'
    end
    object actLapReturSup: TAction
      Category = 'Inventory'
      Caption = 'actLapReturSup'
      OnExecute = actLapReturSupExecute
    end
    object actLaporanTransaksiDetil: TAction
      Category = 'Finance'
      Caption = 'actLaporanTransaksiDetil'
    end
    object actAuthor: TAction
      Category = 'References'
      Caption = 'actAuthor'
    end
    object actSOconsole: TAction
      Category = 'Inventory'
      Caption = 'actSOconsole'
    end
    object actPOBonus: TAction
      Category = 'Merchandise'
      Caption = 'actPOBonus'
    end
    object actSysParm: TAction
      Category = 'Sistem'
      Caption = 'System Parameter'
      OnExecute = actSysParmExecute
    end
    object actSysParmComp: TAction
      Category = 'Sistem'
      Caption = 'System Parameter Company'
      OnExecute = actSysParmCompExecute
    end
    object actCostCenter: TAction
      Category = 'References'
      Caption = 'Cost Center'
      OnExecute = actCostCenterExecute
    end
    object actSubGroup: TAction
      Category = 'References'
      Caption = 'Sub Group'
      ImageIndex = 63
      OnExecute = actSubGroupExecute
    end
    object actKategori: TAction
      Category = 'References'
      Caption = 'Kategori'
      ImageIndex = 51
      OnExecute = actKategoriExecute
    end
    object actMerk: TAction
      Category = 'References'
      Caption = 'Merk'
      ImageIndex = 64
      OnExecute = actMerkExecute
    end
    object actCompany: TAction
      Category = 'References'
      Caption = 'Company'
      ImageIndex = 55
      OnExecute = actCompanyExecute
    end
    object actQuotationMailer: TAction
      Category = 'Merchandise'
      Caption = 'Quotation Mailer'
      OnExecute = actQuotationMailerExecute
    end
    object actMembership: TAction
      Category = 'Membership'
      Caption = 'Membership'
      ImageIndex = 58
      OnExecute = actMembershipExecute
    end
    object actSupplier: TAction
      Category = 'Merchandise'
      Caption = 'Supplier'
      ImageIndex = 57
      OnExecute = actSupplierExecute
    end
    object actListingQuotationHargaBeli: TAction
      Category = 'Merchandise'
      Caption = 'actListingQuotationHargaBeli'
      OnExecute = actListingQuotationHargaBeliExecute
    end
    object actListingQuotationMailer: TAction
      Category = 'Merchandise'
      Caption = 'actListingQuotationMailer'
      OnExecute = actListingQuotationMailerExecute
    end
    object actLaporanStok: TAction
      Category = 'Inventory'
      Caption = 'actLaporanStok'
      OnExecute = actLaporanStokExecute
    end
    object actListingPObyMG: TAction
      Category = 'Merchandise'
      Caption = 'actListingPObyMG'
      OnExecute = actListingPObyMGExecute
    end
    object actGudang: TAction
      Category = 'Inventory'
      Caption = 'Gudang'
      OnExecute = actGudangExecute
    end
    object actMataUang: TAction
      Category = 'References'
      Caption = 'Mata Uang'
      OnExecute = actMataUangExecute
    end
    object actTipeBonus: TAction
      Category = 'References'
      Caption = 'Tipe Bonus'
      OnExecute = actTipeBonusExecute
    end
    object actTipeCN: TAction
      Category = 'References'
      Caption = 'Tipe CN'
      OnExecute = actTipeCNExecute
    end
    object actDocument: TAction
      Category = 'References'
      Caption = 'Document'
      OnExecute = actDocumentExecute
    end
    object actTipePO: TAction
      Category = 'References'
      Caption = 'Tipe PO'
    end
    object actAgama: TAction
      Category = 'References'
      Caption = 'Master Agama'
    end
    object actSetKoneksi: TAction
      Category = 'Sistem'
      Caption = 'Server Connection'
      ImageIndex = 43
      OnExecute = actSetKoneksiExecute
    end
    object actCreditCard: TAction
      Category = 'References'
      Caption = 'Credit Card'
      ImageIndex = 58
      OnExecute = actCreditCardExecute
    end
    object actKompetitor: TAction
      Category = 'Merchandise'
      Caption = 'Kompetitor'
      ImageIndex = 56
      OnExecute = actKompetitorExecute
    end
    object actSettingAplikasi: TAction
      Category = 'Sistem'
      Caption = 'Setting Aplikasi'
      ImageIndex = 44
      OnExecute = actSettingAplikasiExecute
    end
  end
  object AppEvents: TApplicationEvents
    OnException = AppEventsException
    OnShortCut = AppEventsShortCut
    Left = 32
    Top = 280
  end
  object LookAndFeelController: TcxLookAndFeelController
    NativeStyle = False
    Left = 24
    Top = 224
  end
  object dxbrmngrHO: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = DMClient.imgListButton
    ImageOptions.LargeImages = DMClient.imgListButton
    IniFileName = 'homenu.ini'
    PopupMenuLinks = <>
    ShowCloseButton = True
    ShowHelpButton = True
    ShowShortCutInHint = True
    StoreInIniFile = True
    SunkenBorder = True
    UseSystemFont = False
    Left = 272
    Top = 192
    DockControlHeights = (
      0
      0
      28
      0)
    object dxbrReferenceFinance: TdxBar
      Caption = 'Reference Finance'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 834
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrbtnBank'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnTax'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnCostCenter'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnTipePembayaran'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnCreditCard'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbrReferenceInventory: TdxBar
      Caption = 'Reference Inventory'
      CaptionButtons = <>
      DockedLeft = 201
      DockedTop = 0
      FloatLeft = 834
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrbtn1'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnUOM'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbrReferenceOther: TdxBar
      Caption = 'Reference Other'
      CaptionButtons = <>
      DockedLeft = 323
      DockedTop = 0
      FloatLeft = 834
      FloatTop = 10
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrbtnTipePerusahaan'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnSupplierType'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnCompany'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnSalesOutlet'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnUnitStore'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbrMembership: TdxBar
      Caption = 'Membership'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 834
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrbtnMembership'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbrFinanceMaster: TdxBar
      Caption = 'Finance'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 834
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrbtnCostCenter'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnCOA'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbrFavourite: TdxBar
      Caption = 'Favourite'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 834
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxbrMerchandize: TdxBar
      Caption = 'Merchandize'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 834
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrbtnMerchandise'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnMerchandiseGroup'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnKategori'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnSubGroup'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnMerk'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnSupplierGroup'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnProduct'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnSupplier'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnKompetirot'
        end
        item
          Visible = True
          ItemName = 'dxBarButton2'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbrSetting: TdxBar
      Caption = 'Setting'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 834
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrbtnServerConnection'
        end
        item
          Visible = True
          ItemName = 'dxbrbtn3'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbrWindow: TdxBar
      Caption = 'Window'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 834
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrbtnCascade'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnTile'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnCloseAll'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbrSystem: TdxBar
      Caption = 'System'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 834
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrbtnLogIn'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnLogOut'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnExit'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbrFinanceOther: TdxBar
      Caption = 'Other'
      CaptionButtons = <>
      DockedLeft = 140
      DockedTop = 0
      FloatLeft = 834
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrbtnBarcodeUsage'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnElectricCustomer'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbrAP: TdxBar
      Caption = 'AP'
      CaptionButtons = <>
      DockedLeft = 285
      DockedTop = 0
      FloatLeft = 834
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrbtnAdjustmentFaktur'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbrbtnBank: TdxBarButton
      Action = actBank
      Category = 0
      ImageIndex = 49
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnTax: TdxBarButton
      Action = actPajak
      Category = 0
      ImageIndex = 47
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnCostCenter: TdxBarButton
      Action = actCostCenter
      Category = 0
      ImageIndex = 46
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtn1: TdxBarButton
      Action = actProductType
      Category = 0
      ImageIndex = 51
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnTipePembayaran: TdxBarButton
      Action = actTipePembayaran
      Category = 0
      ImageIndex = 48
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnUOM: TdxBarButton
      Action = actUOM
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnTipePerusahaan: TdxBarButton
      Action = actCompanyType
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnSupplierType: TdxBarButton
      Action = actSupplierType
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnCompany: TdxBarButton
      Action = actCompany
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnSalesOutlet: TdxBarButton
      Action = actSalesOutlet
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnUnitStore: TdxBarButton
      Action = actUnitStore
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnMembership: TdxBarButton
      Action = actMembership
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnCreditCard: TdxBarButton
      Action = actCreditCard
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnCOA: TdxBarButton
      Action = actRekening
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnMerchandise: TdxBarButton
      Action = actMerchandise
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnMerchandiseGroup: TdxBarButton
      Action = actMerchanGroup
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnSubGroup: TdxBarButton
      Action = actSubGroup
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnKategori: TdxBarButton
      Action = actKategori
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnMerk: TdxBarButton
      Action = actMerk
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnProduct: TdxBarButton
      Action = actDataProduct
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnSupplierGroup: TdxBarButton
      Action = actSupplierGroup
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnSupplier: TdxBarButton
      Action = actSupplier
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnKompetirot: TdxBarButton
      Action = actKompetitor
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnServerConnection: TdxBarButton
      Action = actSetKoneksi
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtn3: TdxBarButton
      Action = actSettingAplikasi
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnCascade: TdxBarButton
      Action = actCascade
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnTile: TdxBarButton
      Action = actTile
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnCloseAll: TdxBarButton
      Action = actCloseAll
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnLogIn: TdxBarButton
      Action = actOnLogin
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnLogOut: TdxBarButton
      Action = actOnLogout
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnExit: TdxBarButton
      Action = actOnExit
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton1: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxbrbtnBarcodeUsage: TdxBarButton
      Action = actBarcodeUsage
      Category = 0
    end
    object dxbrbtnElectricCustomer: TdxBarButton
      Action = actElectricCustomer
      Category = 0
      ImageIndex = 24
    end
    object dxBarButton2: TdxBarButton
      Action = actQuotation
      Category = 0
      ImageIndex = 44
    end
    object dxbrbtnAdjustmentFaktur: TdxBarButton
      Action = actAdjustmentFaktur
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
end
