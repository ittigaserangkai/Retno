program server;
{$APPTYPE GUI}



uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  ufrmMain in 'ufrmMain.pas' {frmMain},
  ServerMethodsUnit in 'ServerMethodsUnit.pas' {ServerMethods: TDataModule},
  ServerContainerUnit in 'ServerContainerUnit.pas' {ServerContainer: TDataModule},
  WebModuleRetnoUnit in 'WebModuleRetnoUnit.pas' {WebModuleRetno: TWebModule},
  uDBUtils in '..\lib\uDBUtils.pas',
  uModApp in '..\model\uModApp.pas',
  uModBank in '..\model\uModBank.pas',
  uModTest in '..\model\uModTest.pas',
  uDSUtils in '..\lib\uDSUtils.pas',
  uServerClasses in 'unit\uServerClasses.pas',
  uModAuthApp in '..\model\uModAuthApp.pas',
  uModAuthUser in '..\model\uModAuthUser.pas',
  uModMember in '..\model\uModMember.pas',
  uModOutlet in '..\model\uModOutlet.pas',
  uModSatuan in '..\model\uModSatuan.pas',
  uModTipePerusahaan in '..\model\uModTipePerusahaan.pas',
  uModCostCenter in '..\model\uModCostCenter.pas',
  uModSuplier in '..\model\uModSuplier.pas',
  uModBarang in '..\model\uModBarang.pas',
  uModCompany in '..\model\uModCompany.pas',
  uModUnit in '..\model\uModUnit.pas',
  uTSINIFile in '..\lib\uTSINIFile.pas',
  uModTipeKirimPO in '..\model\uModTipeKirimPO.pas',
  uModGudang in '..\model\uModGudang.pas',
  uModPropinsi in '..\model\uModPropinsi.pas',
  uModTipePembayaran in '..\model\uModTipePembayaran.pas',
  uModMataUang in '..\model\uModMataUang.pas',
  uModTipeBonus in '..\model\uModTipeBonus.pas',
  uServerDSProvider in 'unit\uServerDSProvider.pas',
  uModDocument in '..\model\uModDocument.pas',
  uModTipePo in '..\model\uModTipePo.pas',
  uModRefPajak in '..\model\uModRefPajak.pas',
  uModRefAgama in '..\model\uModRefAgama.pas',
  uModQuotation in '..\model\uModQuotation.pas',
  uModSO in '..\model\uModSO.pas',
  uModPO in '..\model\uModPO.pas',
  uModDO in '..\model\uModDO.pas',
  uModCreditCard in '..\model\uModCreditCard.pas',
  uModKompetitor in '..\model\uModKompetitor.pas',
  uModDNRecv in '..\model\uModDNRecv.pas',
  uModCNRecv in '..\model\uModCNRecv.pas',
  uModSettingApp in '..\model\uModSettingApp.pas',
  uModAdjustmentFaktur in '..\model\uModAdjustmentFaktur.pas',
  uModClaimFaktur in '..\model\uModClaimFaktur.pas',
  uModAP in '..\model\uModAP.pas',
  uModOrganization in '..\model\uModOrganization.pas',
  uModBankCashOut in '..\model\uModBankCashOut.pas',
  uModTransaksi in '..\model\uModTransaksi.pas',
  uModBeginningBalance in '..\model\uModBeginningBalance.pas',
  uModShift in '..\model\uModShift.pas',
  uModRekening in '..\model\uModRekening.pas',
  uModJurnal in '..\model\uModJurnal.pas',
  uModSetupPOS in '..\model\uModSetupPOS.pas',
  uModVoucherLainLain in '..\model\uModVoucherLainLain.pas',
  uModCustomerVoucher in '..\model\uModCustomerVoucher.pas',
  uModAgreementVoucher in '..\model\uModAgreementVoucher.pas',
  uModVoucher in '..\model\uModVoucher.pas',
  uModTransKuponBotol in '..\model\uModTransKuponBotol.pas',
  uModContrabonSales in '..\model\uModContrabonSales.pas',
  uModCustomerInvoice in '..\model\uModCustomerInvoice.pas',
  uModAR in '..\model\uModAR.pas',
  uJSONUtils in '..\lib\uJSONUtils.pas',
  uModPOTrader in '..\model\uModPOTrader.pas',
  uModFinalPayment in '..\model\uModFinalPayment.pas',
  uModDOTrader in '..\model\uModDOTrader.pas',
  uServerPOS in 'unit\uServerPOS.pas';
  uModCrazyPrice in '..\model\uModCrazyPrice.pas';

{$R *.res}


begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;

  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
