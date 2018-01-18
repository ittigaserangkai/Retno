program ho;

uses
  Vcl.Forms,
  ufrmMain in 'ui\ufrmMain.pas' {frmMain},
  ufrmLogin in '..\module\login\ufrmLogin.pas' {frmLogin},
  uConstanta in 'unit\uConstanta.pas',
  ufraFooter1Button in '..\system\ufraFooter1Button.pas' {fraFooter1Button: TFrame},
  ufraFooter5Button in '..\system\ufraFooter5Button.pas' {fraFooter5Button: TFrame},
  ufraLoading in '..\system\ufraLoading.pas' {fraLoading: TFrame},
  ufraProgressBar in '..\system\ufraProgressBar.pas' {fraProgressBar: TFrame},
  ufrmSplash in 'ui\ufrmSplash.pas' {frmSplash},
  ufraFooterDialog2Button in '..\system\ufraFooterDialog2Button.pas' {fraFooterDialog2Button: TFrame},
  ufrmMasterDialog in '..\system\ufrmMasterDialog.pas' {frmMasterDialog},
  ufrmMaster in '..\system\ufrmMaster.pas' {frmMaster},
  udmMain in 'ui\udmMain.pas' {dmMain: TDataModule},
  ufrmAbout in 'ui\ufrmAbout.pas' {frmAbout},
  uMenuManagement in '..\system\uMenuManagement.pas',
  uFormProperty in '..\system\uFormProperty.pas',
  uGlobalProperty in '..\system\uGlobalProperty.pas',
  ufrmPajak in '..\module\references\ufrmPajak.pas' {frmPajak},
  ufrmDialogPajak in '..\module\references\ufrmDialogPajak.pas' {frmDialogPajak},
  uTSCommonDlg in '..\system\uTSCommonDlg.pas',
  uCompany in '..\classes\uCompany.pas',
  uTSBaseClass in '..\classes\uTSBaseClass.pas',
  uUnit in '..\classes\uUnit.pas',
  ufrmBank in '..\module\references\ufrmBank.pas' {frmBank},
  ufrmDialogBank in '..\module\references\ufrmDialogBank.pas' {frmDialogBank},
  ufrmDialogHariLibur in '..\module\references\ufrmDialogHariLibur.pas' {frmDialogHariLibur},
  ufrmHariLibur in '..\module\references\ufrmHariLibur.pas' {frmHariLibur},
  ufrmDialogLokasi in '..\module\references\ufrmDialogLokasi.pas' {frmDialogLokasi},
  ufrmLokasi in '..\module\references\ufrmLokasi.pas' {frmLokasi},
  ufrmSatuan in '..\module\references\ufrmSatuan.pas' {frmSatuan},
  ufrmDialogSatuan in '..\module\references\ufrmDialogSatuan.pas' {frmDialogSatuan},
  ufrmDialogSysParm in '..\module\references\ufrmDialogSysParm.pas' {frmDialogSysParm},
  ufrmDialogSysParmCompTemp in '..\module\references\ufrmDialogSysParmCompTemp.pas' {frmDialogSysParmCompTemp},
  ufrmSysParm in '..\module\references\ufrmSysParm.pas' {frmSysParm},
  ufrmSysParmCompTemp1 in '..\module\references\ufrmSysParmCompTemp1.pas' {frmSysParmCompTemp1},
  ufrmTipePerusahaan in '..\module\references\ufrmTipePerusahaan.pas' {frmTipePerusahaan},
  ufrmDialogTipePerusahaan in '..\module\references\ufrmDialogTipePerusahaan.pas' {frmDialogTipePerusahaan},
  ufrmDialogTipePembayaran in '..\module\references\ufrmDialogTipePembayaran.pas' {frmDialogTipePembayaran},
  ufrmTipePembayaran in '..\module\references\ufrmTipePembayaran.pas' {frmTipePembayaran},
  ufrmTipePengirimanPO in '..\module\references\ufrmTipePengirimanPO.pas' {frmTipePengirimanPO},
  ufrmDialogTipePengirimanPO in '..\module\references\ufrmDialogTipePengirimanPO.pas' {frmDialogTipePengirimanPO},
  ufrmDialogProductType in '..\module\references\ufrmDialogProductType.pas' {frmDialogProductType},
  ufrmDialogSupplierType in '..\module\references\ufrmDialogSupplierType.pas' {frmDialogSupplierType},
  ufrmProductType in '..\module\references\ufrmProductType.pas' {frmProductType},
  ufrmSupplierType in '..\module\references\ufrmSupplierType.pas' {frmSupplierType},
  ufrmSearchRekening in '..\module\references\ufrmSearchRekening.pas' {frmDialogSearchRekening},
  uDMClient in '..\system\uDMClient.pas' {DMClient: TDataModule},
  ufrmTest in 'ui\ufrmTest.pas' {frmTest},
  ufrmDialogRekening in '..\module\accounting\ufrmDialogRekening.pas' {frmDialogRekening},
  ufrmRekening in '..\module\accounting\ufrmRekening.pas' {frmRekening},
  ufrmUser in '..\module\management user\ufrmUser.pas' {frmUser},
  ufrmUserGroup in '..\module\management user\ufrmUserGroup.pas' {frmUserGroup},
  ufrmDialogUser in '..\module\management user\ufrmDialogUser.pas' {frmDialogUser},
  ufrmDialogUserGroup in '..\module\management user\ufrmDialogUserGroup.pas' {frmDialogUserGroup},
  ufrmAddNewMenu in '..\module\management user\ufrmAddNewMenu.pas' {frmAddNewMenu},
  ufrmDialogMenu in '..\module\management user\ufrmDialogMenu.pas' {frmDialogMenu},
  ufrmModule in '..\module\management user\ufrmModule.pas' {frmModule},
  ufrmDialogModule in '..\module\management user\ufrmDialogModule.pas' {frmDialogModule},
  ufrmDialogAddNewMenu in '..\module\management user\ufrmDialogAddNewMenu.pas' {frmDialogAddNewMenu},
  ufrmMasterCustomer in '..\module\references\ufrmMasterCustomer.pas' {frmMasterCustomer},
  ufrmDialogMasterCustomer in '..\module\references\ufrmDialogMasterCustomer.pas' {frmDialogMasterCustomer},
  ufraAlokasiStock in '..\module\product\ufraAlokasiStock.pas' {fraAlokasiStock: TFrame},
  ufraBonusProduct in '..\module\product\ufraBonusProduct.pas' {fraBonusProduct: TFrame},
  ufraProductSupplier in '..\module\product\ufraProductSupplier.pas' {fraProductSupplier: TFrame},
  ufraProductTurunan in '..\module\product\ufraProductTurunan.pas' {fraProductTurunan: TFrame},
  ufraSellingPrice in '..\module\product\ufraSellingPrice.pas' {fraSellingPrice: TFrame},
  ufraStockCard in '..\module\product\ufraStockCard.pas' {fraStockCard: TFrame},
  ufraUOMConvertion in '..\module\product\ufraUOMConvertion.pas' {fraUOMConvertion: TFrame},
  ufrmDialogProdSupplier in '..\module\product\ufrmDialogProdSupplier.pas' {frmDialogProdSupplier},
  ufrmDialogProduct in '..\module\product\ufrmDialogProduct.pas' {frmDialogProduct},
  ufrmProduct in '..\module\product\ufrmProduct.pas' {frmProduct},
  uSpecialKey in '..\classes\uSpecialKey.pas',
  ufrmSearchProduct in '..\module\product\ufrmSearchProduct.pas' {frmDialogSearchProduct},
  ufrmSearchSupplier in '..\module\merchandise\ufrmSearchSupplier.pas' {frmDialogSearchSupplier},
  uConn in '..\lib\uConn.pas',
  uDBUtils in '..\lib\uDBUtils.pas',
  uDSUtils in '..\lib\uDSUtils.pas',
  uDXUtils in '..\lib\uDXUtils.pas',
  uNetUtils in '..\lib\uNetUtils.pas',
  uTSINIFile in '..\lib\uTSINIFile.pas',
  ufraHistoriPOByProduct in '..\module\merchandise\ufraHistoriPOByProduct.pas' {fraHistoriPOByProduct: TFrame},
  ufrmMasterBrowse in '..\system\ufrmMasterBrowse.pas' {frmMasterBrowse},
  ufraFooter4Button in '..\system\ufraFooter4Button.pas' {fraFooter4Button: TFrame},
  uModApp in '..\model\uModApp.pas',
  uModAuthApp in '..\model\uModAuthApp.pas',
  uModBank in '..\model\uModBank.pas',
  uModCompany in '..\model\uModCompany.pas',
  uModOutlet in '..\model\uModOutlet.pas',
  uModAuthUser in '..\model\uModAuthUser.pas',
  uModTest in '..\model\uModTest.pas',
  uModTipeKupon in '..\model\uModTipeKupon.pas',
  uModTipePembeli in '..\model\uModTipePembeli.pas',
  ufraFooterDialog3Button in '..\system\ufraFooterDialog3Button.pas' {fraFooterDialog3Button: TFrame},
  ufrmProductTypeNBD in '..\module\references\ufrmProductTypeNBD.pas' {frmProductTypeNBD},
  ufrmDialogProductTypeNBD in '..\module\references\ufrmDialogProductTypeNBD.pas' {frmDialogProductTypeNBD},
  ufrmMasterProductNBD in '..\module\references\ufrmMasterProductNBD.pas' {frmMasterProductNBD},
  ufrmDialogMasterProductNBD in '..\module\references\ufrmDialogMasterProductNBD.pas' {frmDialogMasterProductNBD},
  ufrmDialogSatuan_NBD in '..\module\references\ufrmDialogSatuan_NBD.pas' {frmDialogSatuan_NBD},
  ufrmSatuan_NBD in '..\module\references\ufrmSatuan_NBD.pas' {frmSatuan_NBD},
  uModTipePerusahaan in '..\model\uModTipePerusahaan.pas',
  uModSatuan in '..\model\uModSatuan.pas',
  uModTipePembayaran in '..\model\uModTipePembayaran.pas',
  uModCostCenter in '..\model\uModCostCenter.pas',
  ufrmCostCenter in '..\module\references\ufrmCostCenter.pas' {frmCostCenter},
  ufrmDialogCostCenter in '..\module\references\ufrmDialogCostCenter.pas' {frmDialogCostCenter},
  uInterface in '..\system\uInterface.pas',
  ufrmSupplier in '..\module\merchandise\ufrmSupplier.pas' {frmSupplier},
  ufrmDialogSupplier in '..\module\merchandise\ufrmDialogSupplier.pas' {frmDialogSupplier},
  ufrmOutstandingPO in '..\module\merchandise\ufrmOutstandingPO.pas' {frmOutstandingPO},
  ufrmDayOfPO in '..\module\merchandise\ufrmDayOfPO.pas' {frmDayofPO},
  ufrmDisplayPO in '..\module\merchandise\ufrmDisplayPO.pas' {frmDisplayPO},
  ufrmSearchPO in '..\module\merchandise\ufrmSearchPO.pas' {frmDialogSearchPO},
  ufrmMasterDialogBrowse in '..\system\ufrmMasterDialogBrowse.pas' {frmMasterDialogBrowse},
  uModSuplier in '..\model\uModSuplier.pas',
  uModBarang in '..\model\uModBarang.pas',
  ufrmDialogKategori in '..\module\product\ufrmDialogKategori.pas' {frmDialogKategori},
  ufrmDialogMerchandise in '..\module\product\ufrmDialogMerchandise.pas' {frmDialogMerchandise},
  ufrmDialogMerchandiseGroup in '..\module\product\ufrmDialogMerchandiseGroup.pas' {frmDialogMerchandiseGroup},
  ufrmDialogMerk in '..\module\product\ufrmDialogMerk.pas' {frmDialogMerk},
  ufrmDialogSubGroup in '..\module\product\ufrmDialogSubGroup.pas' {frmDialogSubGroup},
  ufrmKategori in '..\module\product\ufrmKategori.pas' {frmKategori},
  ufrmMerchandise in '..\module\product\ufrmMerchandise.pas' {frmMerchandise},
  ufrmMerchandiseGroup in '..\module\product\ufrmMerchandiseGroup.pas' {frmMerchandiseGroup},
  ufrmMerk in '..\module\product\ufrmMerk.pas' {frmMerk},
  ufrmSubGroup in '..\module\product\ufrmSubGroup.pas' {frmSubGroup},
  ufrmQuotation in '..\module\merchandise\ufrmQuotation.pas' {frmQuotation},
  ufrmDialogQuotation in '..\module\merchandise\ufrmDialogQuotation.pas' {frmDialogQuotation},
  ufrmDialogOutlet in '..\module\references\ufrmDialogOutlet.pas' {frmDialogOutlet},
  ufrmUnit in '..\module\references\ufrmUnit.pas' {frmUnit},
  ufrmDialogUnit in '..\module\references\ufrmDialogUnit.pas' {frmDialogUnit},
  ufrmDaftarCompetitor in '..\module\merchandise\ufrmDaftarCompetitor.pas' {frmDaftarCompetitor},
  ufrmDialogDaftarKompetitor in '..\module\merchandise\ufrmDialogDaftarKompetitor.pas' {frmDialogDaftarKompetitor},
  ufrmDialogBarangCompetitor in '..\module\merchandise\ufrmDialogBarangCompetitor.pas' {frmDialogBarangCompetitor},
  ufrmListBigTrader in '..\module\inventory\ufrmListBigTrader.pas' {frmListBigTrader},
  ufrmListBigSupplier in '..\module\inventory\ufrmListBigSupplier.pas' {frmListBigSupplier},
  ufrmCompany in '..\module\references\ufrmCompany.pas' {frmCompany},
  ufrmDialogCompany in '..\module\references\ufrmDialogCompany.pas' {frmDialogCompany},
  uModUnit in '..\model\uModUnit.pas',
  ufrmOutlet in '..\module\references\ufrmOutlet.pas' {frmOutlet},
  ufrmSetupCashManagement in '..\module\accounting\ufrmSetupCashManagement.pas' {frmSetupCashManagement},
  ufrmPemakaianBarcode in '..\module\finance\ufrmPemakaianBarcode.pas' {frmPemakaianBarcode},
  ufrmElectricCustomer in '..\module\finance\ufrmElectricCustomer.pas' {frmElectricCustomer},
  ufrmQuotationHargaBeli in '..\module\merchandise\ufrmQuotationHargaBeli.pas' {frmQuotationHargaBeli},
  ufrmDialogQuotationHargaBeli in '..\module\merchandise\ufrmDialogQuotationHargaBeli.pas' {frmDialogQuotationHargaBeli},
  ufrmDialogQuotationMailerNeo in '..\module\merchandise\ufrmDialogQuotationMailerNeo.pas' {frmDialogQuotationMailerNeo},
  ufrmQuotationMailer in '..\module\merchandise\ufrmQuotationMailer.pas' {frmQuotationMailer},
  uModTipeKirimPO in '..\model\uModTipeKirimPO.pas',
  ufrmMemberShip in '..\module\customer_support\ufrmMemberShip.pas' {frmMemberShip},
  ufrmDialogMemberShip in '..\module\customer_support\ufrmDialogMemberShip.pas' {frmDialogMemberShip},
  uModMember in '..\model\uModMember.pas',
  ufrmSupplierGroup in '..\module\merchandise\ufrmSupplierGroup.pas' {frmSupplierGroup},
  ufrmDialogSupplierGroup in '..\module\merchandise\ufrmDialogSupplierGroup.pas' {frmDialogSupplierGroup},
  ufrmMouselessMenu in '..\client\ui\ufrmMouselessMenu.pas' {frmMouselesMenu},
  uFrmGenPO in '..\module\merchandise\uFrmGenPO.pas' {frmGenPO},
  uFrmPODisp in '..\module\merchandise\uFrmPODisp.pas' {frmPODisp},
  ufrmListQuotation in '..\module\merchandise\ufrmListQuotation.pas' {frmListQuotation},
  ufrmDialogPrintPreview in '..\system\ufrmDialogPrintPreview.pas' {frmDialogPrintPreview},
  HPHELP in '..\lib\HPHELP.PAS',
  ufrmListQuotHB in '..\module\merchandise\ufrmListQuotHB.pas' {frmListQuotHB},
  ufrmListQuotMailer in '..\module\merchandise\ufrmListQuotMailer.pas' {frmListQuotMailer},
  ufrmCetakPO in '..\module\merchandise\ufrmCetakPO.pas' {frmCetakPO},
  ufrmChangeStatusPO in '..\module\merchandise\ufrmChangeStatusPO.pas' {frmChangeStatusPO},
  ufrmStokBarang in '..\module\inventory\ufrmStokBarang.pas' {frmStokBarang},
  ufrmListingPOByMerchandisingGroup in '..\module\merchandise\ufrmListingPOByMerchandisingGroup.pas' {frmListingPOByMerchandisingGroup},
  ufrmHistoryPO in '..\module\merchandise\ufrmHistoryPO.pas' {frmHistoryPO},
  ufrmPrintHistoryPOBySupplier in '..\module\merchandise\ufrmPrintHistoryPOBySupplier.pas' {frmPrintHistoryPOBySupplier},
  ufrmInvMovementQTY in '..\module\inventory\ufrmInvMovementQTY.pas' {frmInvMovementQTY},
  ufrmRetur in '..\module\inventory\ufrmRetur.pas' {frmRetur},
  ufrmDialogRetur in '..\module\inventory\ufrmDialogRetur.pas' {frmDialogRetur},
  ufrmLaporanRetur in '..\module\inventory\ufrmLaporanRetur.pas' {frmLaporanRetur},
  ufrmCancellationPO in '..\module\po\ufrmCancellationPO.pas' {frmCancellationPO},
  uModPropinsi in '..\model\uModPropinsi.pas',
  ufrmDSI in '..\module\inventory\ufrmDSI.pas' {frmDSI},
  ufrmGudang in '..\module\inventory\ufrmGudang.pas' {frmGudang},
  ufrmDialogGudang in '..\module\inventory\ufrmDialogGudang.pas' {frmDialogGudang},
  uModGudang in '..\model\uModGudang.pas',
  ufrmReprintNP in '..\module\inventory\ufrmReprintNP.pas' {frmReprintNP},
  ufrmGoodsReceiving in '..\module\inventory\ufrmGoodsReceiving.pas' {frmGoodsReceiving},
  uModMataUang in '..\model\uModMataUang.pas',
  ufrmMataUang in '..\module\references\ufrmMataUang.pas' {frmMataUang},
  uModTipeBonus in '..\model\uModTipeBonus.pas',
  ufrmTipeBonus in '..\module\references\ufrmTipeBonus.pas' {frmTipeBonus},
  uModTipeCN in '..\model\uModTipeCN.pas',
  ufrmTipeCN in '..\module\references\ufrmTipeCN.pas' {frmTipeCN},
  ufrmDialogPersonalMember in '..\module\customer_support\ufrmDialogPersonalMember.pas' {frmDialogPersonalMember},
  ufrmDocument in '..\module\references\ufrmDocument.pas' {frmDocument},
  uModRefPajak in '..\model\uModRefPajak.pas',
  uModRefAgama in '..\model\uModRefAgama.pas',
  ufrmCXLookup in '..\system\ufrmCXLookup.pas' {frmCXLookup},
  uAppUtils in '..\lib\uAppUtils.pas',
  uDMReport in '..\system\uDMReport.pas' {DMReport},
  ufrmSettingKoneksi in '..\system\ufrmSettingKoneksi.pas' {frmSettingKoneksi},
  uModPO in '..\model\uModPO.pas',
  uModSO in '..\model\uModSO.pas',
  uModDO in '..\model\uModDO.pas',
  ufrmCreditCard in '..\module\cashier_supv\ufrmCreditCard.pas' {frmCreditCard},
  ufrmDialogCreditCard in '..\module\cashier_supv\ufrmDialogCreditCard.pas' {frmDialogCreditCard},
  uModCreditCard in '..\model\uModCreditCard.pas',
  uModKompetitor in '..\model\uModKompetitor.pas',
  uModSettingApp in '..\model\uModSettingApp.pas',
  ufrmSettingApp in '..\system\ufrmSettingApp.pas' {frmSettingApp},
  ufrmAdjustmentFaktur in '..\module\finance\ufrmAdjustmentFaktur.pas' {frmAdjustmentFaktur},
  ufrmDialogAdjustmentFaktur in '..\module\finance\ufrmDialogAdjustmentFaktur.pas' {frmDialogAdjustmentFaktur},
  ufrmBrowseQuotation in '..\module\merchandise\ufrmBrowseQuotation.pas' {frmBrowseQuotation},
  uModAdjustmentFaktur in '..\model\uModAdjustmentFaktur.pas',
  ufrmClaim in '..\module\finance\ufrmClaim.pas' {frmClaim},
  ufrmDialogClaim in '..\module\finance\ufrmDialogClaim.pas' {frmDialogClaim},
  uModQuotation in '..\model\uModQuotation.pas',
  uModClaimFaktur in '..\model\uModClaimFaktur.pas',
  uModAP in '..\model\uModAP.pas',
  uModCNRecv in '..\model\uModCNRecv.pas',
  uModDNRecv in '..\model\uModDNRecv.pas',
  uModOrganization in '..\model\uModOrganization.pas',
  ufrmBankCashOut in '..\module\finance\ufrmBankCashOut.pas' {frmBankCashOut},
  ufrmDialogBankCashOut in '..\module\finance\ufrmDialogBankCashOut.pas' {frmDialogBankCashOut},
  ufrmShift in '..\module\cashier_supv\ufrmShift.pas' {frmShift},
  ufrmDialogShift in '..\module\cashier_supv\ufrmDialogShift.pas' {frmDialogShift},
  uModBankCashOut in '..\model\uModBankCashOut.pas',
  uTSFastReportFunction in '..\lib\uTSFastReportFunction.pas',
  uModShift in '..\model\uModShift.pas',
  uModRekening in '..\model\uModRekening.pas',
  ufrmAPCard in '..\module\finance\ufrmAPCard.pas' {frmAPCard},
  ufrmMasterReport in '..\system\ufrmMasterReport.pas' {frmMasterReport},
  ufrmHistoryAP in '..\module\finance\ufrmHistoryAP.pas' {frmHistoryAP},
  ufrmJurnal in '..\module\accounting\ufrmJurnal.pas' {frmJurnal},
  ufrmDialogJurnal in '..\module\accounting\ufrmDialogJurnal.pas' {frmDialogJurnal},
  ufrmCXMsgInfo in '..\system\ufrmCXMsgInfo.pas' {frmCXMsgInfo},
  uRetnoUnit in '..\system\uRetnoUnit.pas',
  ufrmContrabonSales in '..\module\finance\ufrmContrabonSales.pas' {frmContrabonSales},
  ufrmDialogContrabonSales in '..\module\finance\ufrmDialogContrabonSales.pas' {frmDialogContrabonSales},
  uModContrabonSales in '..\model\uModContrabonSales.pas',
  ufrmLookupOrganization in '..\module\references\ufrmLookupOrganization.pas' {frmLookupOrganization},
  uModJurnal in '..\model\uModJurnal.pas',
  ufrmCustomerInvoice in '..\module\finance\ufrmCustomerInvoice.pas' {frmCustomerInvoice},
  ufrmDialogCustomerInvoice in '..\module\finance\ufrmDialogCustomerInvoice.pas' {frmDialogCustomerInvoice},
  uModCustomerInvoice in '..\model\uModCustomerInvoice.pas',
  uModPOTrader in '..\model\uModPOTrader.pas',
  uModDOTrader in '..\model\uModDOTrader.pas',
  uModAR in '..\model\uModAR.pas',
  uModBeginningBalance in '..\model\uModBeginningBalance.pas',
  uModSetupPOS in '..\model\uModSetupPOS.pas',
  ufrmCustomerAgreement in '..\module\customer_support\ufrmCustomerAgreement.pas' {frmCustomerAgreement},
  ufrmDialogViewInvoice in '..\module\finance\ufrmDialogViewInvoice.pas' {frmDialogViewInvoice},
  ufrmScheduleAgreement in '..\module\finance\ufrmScheduleAgreement.pas' {frmScheduleAgreement},
  ufrmPopupSelectCustomer in '..\module\customer_support\ufrmPopupSelectCustomer.pas' {frmPopUpSelectCustomer},
  ufrmSearchDataCustomer in '..\module\customer_support\ufrmSearchDataCustomer.pas' {frmSearchDataCustomer},
  ufrmVoucher in '..\module\accounting\ufrmVoucher.pas' {frmVoucher},
  ufrmDialogVoucher in '..\module\accounting\ufrmDialogVoucher.pas' {frmDialogVoucher},
  ufrmDialogCustomerAgreement in '..\module\customer_support\ufrmDialogCustomerAgreement.pas' {frmDialogCustomerAgreement},
  ufrmDialogScheduleAgreement in '..\module\marketing\ufrmDialogScheduleAgreement.pas' {frmDialogScheduleAgreement},
  ufrmDialogMasterAgreement in '..\module\marketing\ufrmDialogMasterAgreement.pas' {frmDialogMasterAgreement},
  ufrmFakturPajakAgreement in '..\module\finance\ufrmFakturPajakAgreement.pas' {frmFakturPajakAgreement},
  ufrmInvoice in '..\module\finance\ufrmInvoice.pas' {frmInvoice},
  uModCrazyPrice in '..\model\uModCrazyPrice.pas',
  ufrmCrazyPrice in '..\module\trader\ufrmCrazyPrice.pas' {frmCrazyPrice},
  ufrmDialogCrazyPrice in '..\module\trader\ufrmDialogCrazyPrice.pas' {frmDialogCrazyPrice},
  ufrmListAgreementDetil in '..\module\marketing\ufrmListAgreementDetil.pas' {frmListAgreementDetil},
  ufrmAgreementVoucher in '..\module\customer_support\ufrmAgreementVoucher.pas' {frmAgreementVoucher},
  ufrmGenerateVoucher in '..\module\customer_support\ufrmGenerateVoucher.pas' {frmGenerateVoucher},
  ufrmCustomerVoucher in '..\module\customer_support\ufrmCustomerVoucher.pas' {frmCustomerVoucher},
  ufrmDialogAgreementVoucher in '..\module\customer_support\ufrmDialogAgreementVoucher.pas' {frmDialogAgreementVoucher},
  ufrmDialogCustomerVoucher in '..\module\customer_support\ufrmDialogCustomerVoucher.pas' {frmDialogCostumerVoucher},
  ufrmPopupDetailVoucher in '..\module\customer_support\ufrmPopupDetailVoucher.pas' {frmPopupDetailVoucher},
  ufrmDialogGenerateVoucher in '..\module\customer_support\ufrmDialogGenerateVoucher.pas' {frmDialogGenerateVoucher},
  ufrmElectricInvoice in '..\module\marketing\ufrmElectricInvoice.pas' {frmElectricInvoice},
  ufrmElectricTransaction in '..\module\marketing\ufrmElectricTransaction.pas' {frmElectricTransaction},
  ufrmElectricPayment in '..\module\finance\ufrmElectricPayment.pas' {frmElectricPayment},
  uClientClasses in '..\classes\uClientClasses.pas',
  uModelHelper in '..\model\uModelHelper.pas',
  uModCustomer in '..\model\uModCustomer.pas',
  ufrmProdukJasa in '..\module\references\ufrmProdukJasa.pas' {frmProdukJasa},
  uModProdukJasa in '..\model\uModProdukJasa.pas',
  ufrmDialogProdukJasa in '..\module\references\ufrmDialogProdukJasa.pas' {frmDialogProdukJasa},
  uModBankCashIn in '..\model\uModBankCashIn.pas',
  ufrmCashIn in '..\module\finance\ufrmCashIn.pas' {frmCashIn},
  ufrmDialogCashIn in '..\module\finance\ufrmDialogCashIn.pas' {frmDialogCashIn},
  uModDOBonus in '..\model\uModDOBonus.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMClient, DMClient);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TDMReport, DMReport);
  //  Application.CreateForm(TfrmMasterDialog1, frmMasterDialog1);
  Application.Run;
end.
