program POSOne;

uses
  Forms,
  ufrmMain in 'ufrmMain.pas' {frmMain},
  ufrmTransaksi in '..\module\pos\ufrmTransaksi.pas' {frmTransaksi},
  udmReport in '..\module\pos\udmReport.pas' {dmReport: TDataModule},
  ufrmPayment in '..\module\pos\ufrmPayment.pas' {frmPayment},
  ufraLookupBarang in '..\module\pos\ufraLookupBarang.pas' {fraLookupBarang: TFrame},
  ufrmTransaksiPending in '..\module\pos\ufrmTransaksiPending.pas' {frmTransaksiPending},
  ufraMember in '..\module\pos\ufraMember.pas' {fraMember: TFrame},
  ufraLookUpCC in '..\module\pos\ufraLookUpCC.pas' {fraLookUpCC: TFrame},
  ufrmTransaksiKring in '..\module\pos\ufrmTransaksiKring.pas' {frmTransaksiKring},
  ufrmPaymentKring in '..\module\pos\ufrmPaymentKring.pas' {frmPaymentKring},
  ufraDOKring in '..\module\pos\ufraDOKring.pas' {fraDOKring: TFrame},
  ufrmLogin in '..\module\pos\ufrmLogin.pas' {frmLogin},
  ufrmLookupBarang in '..\module\pos\ufrmLookupBarang.pas' {frmLookupBarang},
  ufrmMaster in '..\system\ufrmMaster.pas' {frmMaster},
  ufrmPosDownlink in '..\module\pos\ufrmPosDownlink.pas' {frmPosDownlink},
  ufrmImportFromStore in '..\module\pos\ufrmImportFromStore.pas' {frmImportFromStore},
  ufrmExportOfflinePOS in '..\module\pos\ufrmExportOfflinePOS.pas' {frmExportOfflinePOS},
  udmMain in '..\module\pos\udmMain.pas' {dmMain: TDataModule},
  ufrmImportFromMDB in '..\module\pos\ufrmImportFromMDB.pas' {frmImportFromMDB},
  ufrmExportToMDB in '..\module\pos\ufrmExportToMDB.pas' {frmExportToMDB},
  uTSINIFile in '..\lib\uTSINIFile.pas',
  uSpell in '..\lib\uSpell.pas',
  HPHELP in '..\lib\HPHELP.PAS',
  ufraFooter5Button in '..\system\ufraFooter5Button.pas' {fraFooter5Button: TFrame},
  uFormProperty in '..\system\uFormProperty.pas',
  uAppUtils in '..\lib\uAppUtils.pas',
  uConstanta in 'uConstanta.pas',
  uTSCommonDlg in '..\system\uTSCommonDlg.pas',
  uNewPOS in '..\classes\uNewPOS.pas',
  uNewBarang in '..\classes\uNewBarang.PAS',
  uNewBarangHargaJual in '..\classes\uNewBarangHargaJual.PAS',
  uNewPOSTransactionCard in '..\classes\uNewPOSTransactionCard.pas',
  uNewPosTransaction in '..\classes\uNewPosTransaction.pas',
  uDXUtils in '..\lib\uDXUtils.pas',
  uModDO in '..\model\uModDO.pas',
  uModSuplier in '..\model\uModSuplier.pas',
  uModBank in '..\model\uModBank.pas',
  uModRekening in '..\model\uModRekening.pas',
  uModTipePembayaran in '..\model\uModTipePembayaran.pas',
  uModTipeKirimPO in '..\model\uModTipeKirimPO.pas',
  uModRefPajak in '..\model\uModRefPajak.pas',
  uModPO in '..\model\uModPO.pas',
  uModSO in '..\model\uModSO.pas',
  uModSatuan in '..\model\uModSatuan.pas',
  uModBarang in '..\model\uModBarang.pas',
  uModOutlet in '..\model\uModOutlet.pas',
  uModApp in '..\model\uModApp.pas',
  uDBUtils in '..\lib\uDBUtils.pas',
  uModUnit in '..\model\uModUnit.pas',
  uModCompany in '..\model\uModCompany.pas',
  uModAuthApp in '..\model\uModAuthApp.pas',
  uModTipePerusahaan in '..\model\uModTipePerusahaan.pas',
  uModPropinsi in '..\model\uModPropinsi.pas',
  uModSettingApp in '..\model\uModSettingApp.pas',
  uModGudang in '..\model\uModGudang.pas',
  uModQuotation in '..\model\uModQuotation.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmReport, dmReport);
  Application.Run;
end.
