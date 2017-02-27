program ho;

uses
  Vcl.Forms,
  ufrmMain in 'ui\ufrmMain.pas' {frmMain},
  ufrmLogin in 'module\login\ufrmLogin.pas' {frmLogin},
  uConstanta in 'unit\uConstanta.pas',
  ufraFooter1Button in 'ui\ufraFooter1Button.pas' {fraFooter1Button: TFrame},
  ufraFooter5Button in 'ui\ufraFooter5Button.pas' {fraFooter5Button: TFrame},
  ufraLoading in 'ui\ufraLoading.pas' {fraLoading: TFrame},
  ufraProgressBar in 'ui\ufraProgressBar.pas' {fraProgressBar: TFrame},
  ufrmSplash in 'ui\ufrmSplash.pas' {frmSplash},
  ufraFooterDialog2Button in 'ui\ufraFooterDialog2Button.pas' {fraFooterDialog2Button: TFrame},
  ufrmMasterDialog in 'ui\ufrmMasterDialog.pas' {frmMasterDialog},
  ufrmMaster in 'ui\ufrmMaster.pas' {frmMaster},
  udmMain in 'ui\udmMain.pas' {dmMain: TDataModule},
  ufrmAbout in 'ui\ufrmAbout.pas' {frmAbout},
  uInfo in 'unit\uInfo.pas',
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
  uUnit in '..\classes\uUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TfrmPajak, frmPajak);
  Application.CreateForm(TfrmDialogPajak, frmDialogPajak);
  Application.Run;
end.
