program ho;

uses
  Vcl.Forms,
  ufrmMain in 'ui\ufrmMain.pas' {frmMain},
  ufrmLogin in 'module\login\ufrmLogin.pas' {frmLogin},
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
  uInfo in '..\system\uInfo.pas',
  uMenuManagement in '..\system\uMenuManagement.pas',
  uConn in '..\lib\uConn.pas',
  uFormProperty in '..\system\uFormProperty.pas',
  uGlobalProperty in '..\system\uGlobalProperty.pas',
  uNetUtils in '..\system\uNetUtils.pas',
  uTSINIFile in '..\system\uTSINIFile.pas',
  uAppUtils in '..\system\uAppUtils.pas',
  uRetnoUnit in '..\system\uRetnoUnit.pas',
  ufrmPajak in 'module\references\ufrmPajak.pas' {frmPajak},
  ufrmDialogPajak in 'module\references\ufrmDialogPajak.pas' {frmDialogPajak},
  uTSCommonDlg in '..\system\uTSCommonDlg.pas',
  uCompany in '..\classes\uCompany.pas',
  uTSBaseClass in '..\classes\uTSBaseClass.pas',
  uUnit in '..\classes\uUnit.pas',
  ufrmBank in 'module\references\ufrmBank.pas' {frmBank},
  ufrmDialogBank in 'module\references\ufrmDialogBank.pas' {frmDialogBank},
  ufrmDialogHariLibur in 'module\references\ufrmDialogHariLibur.pas' {frmDialogHariLibur},
  ufrmHariLibur in 'module\references\ufrmHariLibur.pas' {frmHariLibur};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TfrmDialogHariLibur, frmDialogHariLibur);
  Application.CreateForm(TfrmHariLibur, frmHariLibur);
  Application.Run;
end.
