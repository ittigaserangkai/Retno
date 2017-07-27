object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'ASSALAAM HYPERMARKET'
  ClientHeight = 488
  ClientWidth = 923
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmMainMenu
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = actOnCreateFormExecute
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object sbMain: TdxStatusBar
    Left = 0
    Top = 468
    Width = 923
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
  object dxrbnHO: TdxRibbon
    Left = 0
    Top = 0
    Width = 923
    Height = 155
    BarManager = dxbrmngrStore
    Style = rs2013
    ColorSchemeName = 'White'
    Fonts.ApplicationButton.Charset = DEFAULT_CHARSET
    Fonts.ApplicationButton.Color = clWindowText
    Fonts.ApplicationButton.Height = -12
    Fonts.ApplicationButton.Name = 'Segoe UI'
    Fonts.ApplicationButton.Style = []
    Fonts.AssignedFonts = [afGroup, afGroupHeader, afApplicationButton]
    Fonts.Group.Charset = DEFAULT_CHARSET
    Fonts.Group.Color = 9126421
    Fonts.Group.Height = -12
    Fonts.Group.Name = 'Segoe UI'
    Fonts.Group.Style = []
    Fonts.GroupHeader.Charset = DEFAULT_CHARSET
    Fonts.GroupHeader.Color = 11168318
    Fonts.GroupHeader.Height = -12
    Fonts.GroupHeader.Name = 'Segoe UI'
    Fonts.GroupHeader.Style = [fsBold]
    QuickAccessToolbar.Toolbar = dxbrFavourite
    ShowMinimizeButton = False
    Contexts = <>
    TabOrder = 5
    TabStop = False
    object dxrbntbProcureToPay: TdxRibbonTab
      Caption = 'Procure To Pay'
      Groups = <
        item
          Caption = 'Transaction'
          ToolbarName = 'dxbrPurchasing'
        end
        item
          Caption = 'Report'
          ToolbarName = 'dxbrProcureToPayReport'
        end>
      Index = 0
    end
    object dxrbntbOrderToCash: TdxRibbonTab
      Caption = 'Order To Cash'
      Groups = <>
      Index = 1
    end
    object dxrbntbSetting: TdxRibbonTab
      Active = True
      Caption = 'Setting'
      Groups = <
        item
          ToolbarName = 'dxbrSetting'
        end>
      Index = 2
    end
  end
  object mmMainMenu: TMainMenu
    Left = 168
    Top = 160
    object mmSistem1: TMenuItem
      Caption = '&System'
      object miLogin1: TMenuItem
        Caption = 'Login'
        ShortCut = 16460
      end
      object miLogout1: TMenuItem
        Caption = 'Logout'
        ShortCut = 24652
      end
      object MenuItem1: TMenuItem
        Caption = '-'
      end
      object miExit1: TMenuItem
        Caption = 'Exit'
        ShortCut = 32883
        OnClick = miExit1Click
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
      object miGlobalParameter1: TMenuItem
        Caption = 'Global Parameter'
      end
    end
    object SuggestionOrder1: TMenuItem
      Caption = 'Procure To Pay'
      object CreateSuggestionOrder1: TMenuItem
        Action = actCreateSO
      end
      object GeneratePOForAll1: TMenuItem
        Action = actPurchaseOrder
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object GoodReceiving1: TMenuItem
        Action = actGoodsReceiving
      end
      object CNReceiving1: TMenuItem
        Action = actCNReceiving
      end
      object DNReceiving1: TMenuItem
        Action = actDNReceiving
      end
    end
    object mmWindow: TMenuItem
      Caption = '&Window'
      object miCascade1: TMenuItem
        Caption = '&Cascade'
      end
      object miTile1: TMenuItem
        Caption = '&Tile'
      end
      object miArrange1: TMenuItem
        Caption = '&Arrange'
      end
      object MenuItem3: TMenuItem
        Caption = '-'
      end
      object miCloseAll1: TMenuItem
        Caption = 'Clo&se All'
      end
      object SysParam1: TMenuItem
        Caption = 'System Parameter'
      end
    end
    object mmAbout1: TMenuItem
      Caption = '&Help'
      object miHeadOfficeHelp1: TMenuItem
        Caption = 'Head Office Help'
        ShortCut = 112
      end
      object MenuItem4: TMenuItem
        Caption = '-'
      end
      object miAbout1: TMenuItem
        Caption = 'About...'
      end
    end
  end
  object actlstMain: TActionList
    Left = 16
    Top = 176
    object actOnCreateForm: TAction
      Caption = 'actOnCreateForm'
      OnExecute = actOnCreateFormExecute
    end
    object actOnLogout: TAction
      Category = 'Sistem'
      Caption = 'Logout'
      ShortCut = 24652
      OnExecute = actOnLogoutExecute
    end
    object actOnLogin: TAction
      Category = 'Sistem'
      Caption = 'Login'
      ShortCut = 16460
      OnExecute = actOnLoginExecute
    end
    object actOnExit: TAction
      Category = 'Sistem'
      Caption = 'Exit'
      ShortCut = 32883
    end
    object actCascade: TAction
      Category = 'Window'
      Caption = '&Cascade'
      OnExecute = actCascadeExecute
    end
    object actTile: TAction
      Category = 'Window'
      Caption = '&Tile'
      OnExecute = actTileExecute
    end
    object actFinalPayment: TAction
      Category = 'SupvCashier'
      Caption = '&Final Payment'
      OnExecute = actFinalPaymentExecute
    end
    object actArrange: TAction
      Category = 'Window'
      Caption = '&Arrange'
      OnExecute = actArrangeExecute
    end
    object actCloseAll: TAction
      Category = 'Window'
      Caption = 'Clo&se All'
      OnExecute = actCloseAllExecute
    end
    object actInputSupplierNotForSO: TAction
      Category = 'SO'
      Caption = 'Input &Supplier Not For SO'
      OnExecute = actInputSupplierNotForSOExecute
    end
    object actInputProductNotForSO: TAction
      Category = 'SO'
      Caption = 'Input &Product Not For SO'
      OnExecute = actInputProductNotForSOExecute
    end
    object actCreateSO: TAction
      Category = 'SO'
      Caption = '&Create Suggestion Order'
      OnExecute = actCreateSOExecute
    end
    object actGeneratePOForAll: TAction
      Category = 'PO'
      Caption = 'Generate PO For &All'
      OnExecute = actPrintPOExecute
    end
    object actGeneratePOBySupplier: TAction
      Category = 'PO'
      Caption = 'Generate &PO By Supplier'
    end
    object actCancellingPO: TAction
      Category = 'PO'
      Caption = '&Cancellation PO'
      OnExecute = actCancellingPOExecute
    end
    object actChangeStatusPO: TAction
      Category = 'PO'
      Caption = 'Change &Status PO'
      OnExecute = actChangeStatusPOExecute
    end
    object actApprovalPO: TAction
      Category = 'PO'
      Caption = 'Appro&val Purchasing Order'
    end
    object actGoodsReceiving: TAction
      Category = 'Inventory'
      Caption = '&Good Receiving'
      OnExecute = actGoodsReceivingExecute
    end
    object actServiceLevel: TAction
      Category = 'Inventory'
      Caption = 'Monitoring &Service Level'
      OnExecute = actServiceLevelExecute
    end
    object actCNGoodReceiving: TAction
      Category = 'Inventory'
      Caption = '&CN Receiving'
      OnExecute = actCNGoodReceivingExecute
    end
    object actReturBarang: TAction
      Category = 'Inventory'
      Caption = '&Retur Barang (Credit Note)'
      Visible = False
    end
    object actDSI: TAction
      Category = 'Inventory'
      Caption = '&Kartu Stock (DSI)'
      OnExecute = actDSIExecute
    end
    object actWastageObral: TAction
      Category = 'Inventory'
      Caption = 'Wastage &Obral'
    end
    object actWastageReal: TAction
      Category = 'Inventory'
      Caption = 'Wastage &Real / Damage'
      OnExecute = actWastageRealExecute
    end
    object actInputProductIGRA: TAction
      Category = 'Inventory'
      Caption = '&Input Product IGRA/Wastage'
    end
    object actAdjustProductTurunan: TAction
      Category = 'Inventory'
      Caption = 'Adjustment Product &Turunan'
    end
    object actAdjustProductKemasan: TAction
      Category = 'Inventory'
      Caption = 'Adjustment Product &Kemasan'
      Visible = False
    end
    object actMutasiStok: TAction
      Category = 'Inventory'
      Caption = '&Mutasi Alokasi Stok'
    end
    object actBonusForSales: TAction
      Category = 'Inventory'
      Caption = '&Bonus For Sales'
      Visible = False
    end
    object actReprintNP: TAction
      Category = 'Inventory'
      Caption = '&Reprint / Check List NP'
      OnExecute = actReprintNPExecute
    end
    object actCNReceiving: TAction
      Category = 'Inventory'
      Caption = '&CN Receiving'
      OnExecute = actCNReceivingExecute
    end
    object actDNReceiving: TAction
      Category = 'Inventory'
      Caption = '&DN Receiving'
      OnExecute = actDNReceivingExecute
    end
    object actReturReplace: TAction
      Category = 'Inventory'
      Caption = 'Retur &Replace'
    end
    object actReturDamage: TAction
      Category = 'Inventory'
      Caption = 'Retur &Damage'
    end
    object actGoodReceivingReplace: TAction
      Category = 'Inventory'
      Caption = 'Good Receiving For &Replace'
    end
    object actActivatePOS: TAction
      Category = 'SupvCashier'
      Caption = '&Activate POS'
      OnExecute = actActivatePOSExecute
    end
    object actBeginBalancePOS: TAction
      Category = 'SupvCashier'
      Caption = '&Beginning Balance POS'
      OnExecute = actBeginBalancePOSExecute
    end
    object actProductForSelling: TAction
      Category = 'SupvCashier'
      Caption = 'Master &Product For Selling'
      OnExecute = actProductForSellingExecute
    end
    object actMaintenancePassword: TAction
      Category = 'SupvCashier'
      Caption = 'Maintenance &User And Password'
      OnExecute = actMaintenancePasswordExecute
    end
    object actAdjustmentCashier: TAction
      Category = 'SupvCashier'
      Caption = 'Ad&justment Cashier'
      OnExecute = actAdjustmentCashierExecute
    end
    object actCreditCard: TAction
      Category = 'SupvCashier'
      Caption = '&Credit Card And Discount Card'
      OnExecute = actCreditCardExecute
    end
    object actCashDropping: TAction
      Category = 'SupvCashier'
      Caption = 'Cash &Dropping'
      OnExecute = actCashDroppingExecute
    end
    object actResetCashier: TAction
      Category = 'SupvCashier'
      Caption = '&Reset Cashier'
      OnExecute = actResetCashierExecute
    end
    object actReturNota: TAction
      Category = 'SupvCashier'
      Caption = 'Retur &Nota (CN)'
    end
    object actDisplayPOSTransaction: TAction
      Category = 'SupvCashier'
      Caption = 'Display POS &Transaction'
    end
    object actDisplayPOSMonitor: TAction
      Category = 'SupvCashier'
      Caption = 'Display POS &Monitor'
    end
    object actDisplayLastTransactionNo: TAction
      Category = 'SupvCashier'
      Caption = 'Display &Last Transaction No.'
    end
    object actDisplayCCAndCashback: TAction
      Category = 'SupvCashier'
      Caption = 'Display Credit &Card And Cashback'
    end
    object actAdjustmentCashback: TAction
      Category = 'SupvCashier'
      Caption = 'Adjustment Cashbac&k'
    end
    object actExportSync: TAction
      Category = 'EOD'
      Caption = '&Export Sync'
    end
    object actImportSync: TAction
      Category = 'EOD'
      Caption = '&Import Sync'
    end
    object actPOFromTrader: TAction
      Category = 'Trader'
      Caption = '&PO From Trader'
    end
    object actTrader: TAction
      Category = 'Trader'
      Caption = 'Master &Trader'
    end
    object actMemberShip: TAction
      Category = 'CustomerSupport'
      Caption = 'MemberShip'
      OnExecute = actMemberShipExecute
    end
    object actMemberActivation: TAction
      Category = 'CustomerSupport'
      Caption = 'Member Activation'
      OnExecute = actMemberActivationExecute
    end
    object actPrintPO: TAction
      Category = 'PO'
      Caption = 'Prin&t PO'
      OnExecute = actPrintPOExecute
    end
    object actCrazyPrice: TAction
      Category = 'Trader'
      Caption = 'Crazy Price'
      OnExecute = actCrazyPriceExecute
    end
    object actDataCostumer: TAction
      Category = 'CustomerSupport'
      Caption = 'Data Costumer'
      OnExecute = actDataCostumerExecute
    end
    object actSalesReportContrabon: TAction
      Category = 'CustomerSupport'
      Caption = '&Sales Report Contrabon'
      OnExecute = actSalesReportContrabonExecute
    end
    object actVoucherBotol: TAction
      Category = 'CustomerSupport'
      Caption = 'Voucher Botol'
    end
    object actShift: TAction
      Category = 'SupvCashier'
      Caption = 'actShift'
      OnExecute = actShiftExecute
    end
    object actCustomerAgreement: TAction
      Category = 'CustomerSupport'
      Caption = 'actCustomerAgreement'
    end
    object actGenerateVoucher: TAction
      Category = 'CustomerSupport'
      Caption = 'actGenerateVoucher'
    end
    object actEODForPOS: TAction
      Category = 'SupvCashier'
      Caption = 'EOD For POS'
    end
    object actBroadcastDownload: TAction
      Category = 'SupvCashier'
      Caption = 'Broadcast Download'
    end
    object actDOForTrader: TAction
      Category = 'Trader'
      Caption = 'actDOForTrader'
    end
    object actDailySalesReport: TAction
      Category = 'SupvCashier'
      Caption = 'Daily Sales Report'
      OnExecute = actDailySalesReportExecute
    end
    object actReprintNota: TAction
      Category = 'SupvCashier'
      Caption = 'actReprintNota'
      OnExecute = actReprintNotaExecute
    end
    object actCashierCollectionReport: TAction
      Category = 'SupvCashier'
      Caption = 'actCashierCollectionReport'
    end
    object actDailySalesAnalysis: TAction
      Category = 'SupvCashier'
      Caption = 'Daily Sales Analysis'
    end
    object actRekapitulasiCN: TAction
      Category = 'Inventory'
      Caption = 'actRekapitulasiCN'
    end
    object actPrintPurchaseOrder: TAction
      Category = 'PO'
      Caption = 'actPrintPurchaseOrder'
    end
    object actPrintWorksheet: TAction
      Category = 'SupvCashier'
      Caption = 'actPrintWorksheet'
      OnExecute = actPrintWorksheetExecute
    end
    object actListingPOByMerchandisingGroup: TAction
      Category = 'PO'
      Caption = 'actListingPOByMerchandisingGroup'
    end
    object actPrintRecapitulationPO: TAction
      Category = 'PO'
      Caption = 'actPrintRecapitulationPO'
    end
    object actPrintHistoryPOBySupplier: TAction
      Category = 'PO'
      Caption = 'actPrintHistoryPOBySupplier'
    end
    object actListRecapCreditDebetCard: TAction
      Category = 'SupvCashier'
      Caption = 'actListRecapCreditDebetCard'
    end
    object actUnpackingStok: TAction
      Category = 'Inventory'
      Caption = 'actUnpackingStok'
    end
    object actStokOpnam: TAction
      Category = 'Inventory'
      Caption = 'actStokOpnam'
    end
    object actStockAdjustment: TAction
      Category = 'Inventory'
      Caption = 'actStockAdjustment'
    end
    object actPeriodeStokOpnam: TAction
      Category = 'Inventory'
      Caption = 'actPeriodeStokOpnam'
    end
    object actFormStokOpnam: TAction
      Category = 'Inventory'
      Caption = 'actFormStokOpnam'
    end
    object actKoordinatorStokOpnam: TAction
      Category = 'Inventory'
      Caption = 'actKoordinatorStokOpnam'
    end
    object actTimStokOpnam: TAction
      Category = 'Inventory'
      Caption = 'actTimStokOpnam'
    end
    object actMaintenanceBarcode: TAction
      Category = 'Inventory'
      Caption = 'actMaintenanceBarcode'
      OnExecute = actMaintenanceBarcodeExecute
    end
    object actLokasiStokOpnam: TAction
      Category = 'Inventory'
      Caption = 'actLokasiStokOpnam'
    end
    object actSetupProductTurunan: TAction
      Category = 'Inventory'
      Caption = 'actSetupProductTurunan'
    end
    object actProduct: TAction
      Category = 'Merchandise'
      Caption = '&Product'
      OnExecute = actProductExecute
    end
    object actSupplier: TAction
      Category = 'Merchandise'
      Caption = '&Supplier'
      OnExecute = actSupplierExecute
    end
    object actHistoryPO: TAction
      Category = 'PO'
      Caption = 'actHistoryPO'
      OnExecute = actHistoryPOExecute
    end
    object actListingReceivingProduct: TAction
      Category = 'Inventory'
      Caption = 'actListingReceivingProduct'
    end
    object actListOutstandingDOTrader: TAction
      Category = 'Trader'
      Caption = 'List Outstanding DO Trader'
    end
    object actAdjustmentProduct: TAction
      Category = 'Inventory'
      Caption = 'actAdjustmentProduct'
    end
    object actListCNMerchandisePerSuplier: TAction
      Category = 'Inventory'
      Caption = 'List CN Merchandise Per Supplier'
    end
    object actListPODOReceive: TAction
      Category = 'Trader'
      Caption = 'Listing PO/DO Receive'
    end
    object actListOmzet: TAction
      Category = 'Trader'
      Caption = 'List Omzet'
    end
    object actListingProductIGRA: TAction
      Category = 'Inventory'
      Caption = 'Print Product IGRA'
    end
    object actDisplayPO: TAction
      Category = 'PO'
      Caption = 'actDisplayPO'
      OnExecute = actDisplayPOExecute
    end
    object actListMembership: TAction
      Category = 'CustomerSupport'
      Caption = 'List Membership'
      OnExecute = actListMembershipExecute
    end
    object actBarcodeRequest: TAction
      Category = 'Merchandise'
      Caption = 'actBarcodeRequest'
      OnExecute = actBarcodeRequestExecute
    end
    object actListWastage: TAction
      Category = 'Inventory'
      Caption = 'actListWastage'
    end
    object actListPOCancel: TAction
      Category = 'PO'
      Caption = 'List PO Cancel'
      OnExecute = actListPOCancelExecute
    end
    object actListingRankingCNWastage: TAction
      Category = 'Inventory'
      Caption = 'List Ranking CN / Wastage'
    end
    object actListingSupplierHaveCN: TAction
      Category = 'Inventory'
      Caption = 'Listing Supplier Have CN'
    end
    object actPriceConfirmation: TAction
      Category = 'Trader'
      Caption = 'Price Confirmation'
    end
    object actListAdjustmentProduct: TAction
      Category = 'Inventory'
      Caption = 'List Adjustment Product'
    end
    object actPriceConfirmationKring33: TAction
      Category = 'Trader'
      Caption = 'Price Confirmation Kring33'
    end
    object actListDailyTransaction: TAction
      Category = 'SupvCashier'
      Caption = 'Listing Daily Transaction'
      OnExecute = actListDailyTransactionExecute
    end
    object actPOBonus: TAction
      Category = 'PO'
      Caption = 'actPOBonus'
      OnExecute = actPOBonusExecute
    end
    object actSettingJurnal: TAction
      Category = 'Inventory'
      Caption = 'actSettingJurnal'
    end
    object actretursupplier: TAction
      Category = 'Inventory'
      Caption = 'actretursupplier'
    end
    object actGenerateJurnal: TAction
      Category = 'EOD'
      Caption = 'actGenerateJurnal'
    end
    object actTransferBarangBonus: TAction
      Category = 'Inventory'
      Caption = 'actTransferBarangBonus'
    end
    object actLaporanWastage: TAction
      Category = 'Inventory'
      Caption = 'actLaporanWastage'
    end
    object actUbahQtyPO: TAction
      Category = 'PO'
      Caption = 'actUbahQtyPO'
      OnExecute = actUbahQtyPOExecute
    end
    object actStokBarang: TAction
      Category = 'Inventory'
      Caption = 'actStokBarang'
    end
    object actMutasiKeluar: TAction
      Category = 'Inventory'
      Caption = 'Mutasi Keluar'
    end
    object actMutasiMasuk: TAction
      Category = 'Inventory'
      Caption = 'Mutasi Masuk'
    end
    object actGudang: TAction
      Category = 'Inventory'
      Caption = 'Gudang'
    end
    object actListMutasiStok: TAction
      Caption = 'actListMutasiStok'
    end
    object actOmzet: TAction
      Caption = 'actOmzet'
    end
    object actAdjustmentStock: TAction
      Caption = 'actAdjustmentStock'
    end
    object actListBarcodeRequest: TAction
      Caption = 'actListBarcodeRequest'
    end
    object actAdjustmentStockList: TAction
      Caption = 'actAdjustmentStockList'
    end
    object actBarcodeRequestSlip: TAction
      Caption = 'actBarcodeRequestSlip'
    end
    object actWastageRealList: TAction
      Caption = 'actWastageRealList'
    end
    object actDiscMember: TAction
      Category = 'CustomerSupport'
      Caption = 'actDiscMember'
      OnExecute = actDiscMemberExecute
    end
    object actChangeStatusPOS: TAction
      Caption = 'actChangeStatusPOS'
    end
    object actStockBarang: TAction
      Caption = 'actStockBarang'
    end
    object actLapReturSup: TAction
      Category = 'Inventory'
      Caption = 'actLapReturSup'
    end
    object actLaporanKonsinyasi: TAction
      Category = 'Inventory'
      Caption = 'actLaporanKonsinyasi'
    end
    object actLapInvMovement: TAction
      Category = 'Inventory'
      Caption = 'actLapInvMovement'
    end
    object actLapInvMovementQty: TAction
      Category = 'Inventory'
      Caption = 'actLapInvMovementQty'
      OnExecute = actLapInvMovementQtyExecute
    end
    object actShipmentAgent: TAction
      Category = 'Inventory'
      Caption = 'actShipmentAgent'
    end
    object actShipmentTransport: TAction
      Category = 'Inventory'
      Caption = 'actShipmentTransport'
    end
    object actShipmentDocument: TAction
      Category = 'Inventory'
      Caption = 'actShipmentDocument'
    end
    object actExportDataStore: TAction
      Category = 'EOD'
      Caption = 'actExportDataStore'
    end
    object actImportFromPOS: TAction
      Category = 'EOD'
      Caption = 'actImportFromPOS'
    end
    object actListProduct: TAction
      Category = 'Merchandise'
      Caption = 'actListProduct'
    end
    object actLaporanMutasiKeluar: TAction
      Category = 'Inventory'
      Caption = 'actLaporanMutasiKeluar'
    end
    object actLaporanMutasiMasuk: TAction
      Category = 'Inventory'
      Caption = 'actLaporanMutasiMasuk'
    end
    object actReconcileBti: TAction
      Category = 'Inventory'
      Caption = 'Reconcile Bti'
    end
    object actLPKAll: TAction
      Category = 'Inventory'
      Caption = 'actLPKAll'
    end
    object actEodLpk: TAction
      Category = 'EOD'
      Caption = 'actEodLpk'
    end
    object actUser: TAction
      Category = 'EOD'
      Caption = 'actUser'
    end
    object actLaporanReturSupplier: TAction
      Category = 'Inventory'
      Caption = 'actLaporanReturSupplier'
      OnExecute = actLaporanReturSupplierExecute
    end
    object actactListMemberTransaction: TAction
      Category = 'SupvCashier'
      Caption = 'actactListMemberTransaction'
      OnExecute = actactListMemberTransactionExecute
    end
    object actRafaksiSupplier: TAction
      Category = 'Inventory'
      Caption = 'actRafaksiSupplier'
      OnExecute = actRafaksiSupplierExecute
    end
    object actReturTrader: TAction
      Category = 'Trader'
      Caption = 'actReturTrader'
      OnExecute = actReturTraderExecute
    end
    object actPurchaseOrder: TAction
      Category = 'PO'
      Caption = 'Purchase Order'
      OnExecute = actPurchaseOrderExecute
    end
    object actSetKoneksi: TAction
      Category = 'Sistem'
      Caption = 'Server Connection'
      OnExecute = actSetKoneksiExecute
    end
    object actSettingApp: TAction
      Category = 'Sistem'
      Caption = 'Aplication Setting'
      OnExecute = actSettingAppExecute
    end
    object actPreference: TAction
      Category = 'Sistem'
      Caption = 'Preference'
      OnExecute = actPreferenceExecute
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
  object dxbrmngrStore: TdxBarManager
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
    ImageOptions.LargeImages = DMClient.ilImage24
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 264
    Top = 160
    DockControlHeights = (
      0
      0
      0
      0)
    object dxbrPurchasing: TdxBar
      Caption = 'Procure To Pay'
      CaptionButtons = <
        item
        end>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 957
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrbtnSO'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnPO'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnGR'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnCNrecv'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnDNRecv'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = True
      Visible = True
      WholeRow = False
    end
    object dxbrProcureToPayReport: TdxBar
      Caption = 'Procure To Pay Report'
      CaptionButtons = <>
      DockedLeft = 263
      DockedTop = 0
      FloatLeft = 957
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrbtn8'
        end
        item
          Visible = True
          ItemName = 'dxbrbtn9'
        end>
      OneOnRow = False
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
      FloatLeft = 957
      FloatTop = 8
      FloatClientWidth = 124
      FloatClientHeight = 44
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrbtnSettingKoneksi'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnSettingApp'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbrFavourite: TdxBar
      Caption = 'Favourite'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 957
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      Images = DMClient.imgListIcon
      ItemLinks = <>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbrbtnSO: TdxBarButton
      Action = actCreateSO
      Category = 0
      ImageIndex = 39
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnPO: TdxBarButton
      Action = actPurchaseOrder
      Category = 0
      ImageIndex = 30
      PaintStyle = psCaptionGlyph
    end
    object dxbrlrgbtn1: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton1: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxbrlrgbtn2: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxbrbtn3: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxbrbtn4: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxbrbtnGR: TdxBarButton
      Action = actGoodsReceiving
      Category = 0
      ImageIndex = 40
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnCNrecv: TdxBarButton
      Action = actCNReceiving
      Category = 0
      ImageIndex = 42
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnDNRecv: TdxBarButton
      Action = actDNReceiving
      Category = 0
      ImageIndex = 41
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtn8: TdxBarButton
      Caption = 'Stock Card'
      Category = 0
      Hint = 'Stock Card'
      Visible = ivAlways
    end
    object dxbrbtn9: TdxBarButton
      Caption = 'Inventory Movement'
      Category = 0
      Hint = 'Inventory Movement'
      Visible = ivAlways
    end
    object dxbrbtnSettingKoneksi: TdxBarButton
      Action = actSetKoneksi
      Category = 0
      ImageIndex = 43
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtnSettingApp: TdxBarButton
      Action = actSettingApp
      Category = 0
      ImageIndex = 44
    end
    object dxbrlrgbtnPreference: TdxBarLargeButton
      Action = actPreference
      Category = 0
      LargeImageIndex = 59
    end
    object dxbrbtn1: TdxBarButton
      Action = actCreateSO
      Category = 0
      ImageIndex = 41
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtn2: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtn5: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
      PaintStyle = psCaptionGlyph
    end
    object dxbrbtn6: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
      PaintStyle = psCaptionGlyph
    end
    object dxbrlrgbtn3: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxbrlrgbtn4: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxbrbtn7: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxbrbtnSaveLayout: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
      ImageIndex = 32
      LargeImageIndex = 4
    end
    object dxrbnqckcsgrpbtn1: TdxRibbonQuickAccessGroupButton
      Category = 0
      Visible = ivAlways
    end
    object dxbrbtn10: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
  end
end
