program store;

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
  uInfo in 'unit\uInfo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmSplash, frmSplash);
  Application.CreateForm(TfrmMasterDialog, frmMasterDialog);
  Application.CreateForm(TfrmMaster, frmMaster);
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.Run;
end.
