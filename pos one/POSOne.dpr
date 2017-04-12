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
  ufraFooterDialog2Button in '..\system\ufraFooterDialog2Button.pas' {fraFooterDialog2Button: TFrame},
  ufrmMasterDialog in '..\system\ufrmMasterDialog.pas' {frmMasterDialog},
  ufrmPosDownlink in '..\module\pos\ufrmPosDownlink.pas' {frmPosDownlink},
  ufrmImportFromStore in '..\module\pos\ufrmImportFromStore.pas' {frmImportFromStore},
  ufrmExportOfflinePOS in '..\module\pos\ufrmExportOfflinePOS.pas' {frmExportOfflinePOS},
  udmMain in '..\module\pos\udmMain.pas' {dmMain: TDataModule},
  uFormProperty in '..\Classes\uFormProperty.pas',
  ufrmImportFromMDB in '..\module\pos\ufrmImportFromMDB.pas' {frmImportFromMDB},
  ufrmExportToMDB in '..\module\pos\ufrmExportToMDB.pas' {frmExportToMDB},
  uTSCommonDlg in '..\system\uTSCommonDlg.pas',
  uTSINIFile in '..\lib\uTSINIFile.pas',
  uModApp in '..\model\uModApp.pas',
  uDBUtils in '..\lib\uDBUtils.pas',
  uSpell in '..\lib\uSpell.pas',
  HPHELP in '..\lib\HPHELP.PAS',
  uAppUtils in '..\lib\uAppUtils.pas',
  ufrmProductForSelling in '..\module\cashier_supv\ufrmProductForSelling.pas' {frmProductForSelling},
  ufraFooter5Button in '..\system\ufraFooter5Button.pas' {fraFooter5Button: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmReport, dmReport);
  Application.CreateForm(TfrmProductForSelling, frmProductForSelling);
  Application.Run;
end.
