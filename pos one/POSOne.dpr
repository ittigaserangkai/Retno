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
  uTSCommonDlg in '..\system\uTSCommonDlg.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmReport, dmReport);
  Application.Run;
end.
