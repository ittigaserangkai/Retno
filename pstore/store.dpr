program store;

uses
  Vcl.Forms,
  ufrmMain in 'ui\ufrmMain.pas' {frmMain},
  ufrmLogin in 'module\login\ufrmLogin.pas' {frmLogin},
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
  uFormProperty in '..\system\uFormProperty.pas',
  uConn in '..\lib\uConn.pas',
  uDBUtils in '..\lib\uDBUtils.pas',
  uDSUtils in '..\lib\uDSUtils.pas',
  uDXUtils in '..\lib\uDXUtils.pas',
  uNetUtils in '..\lib\uNetUtils.pas',
  uTSINIFile in '..\lib\uTSINIFile.pas',
  uConstanta in 'unit\uConstanta.pas',
  uRetnoUnit in '..\system\uRetnoUnit.pas',
  uTSCommonDlg in '..\system\uTSCommonDlg.pas',
  ufraFooter4Button in '..\system\ufraFooter4Button.pas' {fraFooter4Button: TFrame},
  ufraFooterDialog3Button in '..\system\ufraFooterDialog3Button.pas' {fraFooterDialog3Button: TFrame},
  uCompany in '..\classes\uCompany.pas',
  uTSBaseClass in '..\classes\uTSBaseClass.pas',
  uModApp in '..\model\uModApp.pas',
  uModAuthApp in '..\model\uModAuthApp.pas',
  uModCompany in '..\model\uModCompany.pas',
  uModOutlet in '..\model\uModOutlet.pas',
  uModTest in '..\model\uModTest.pas',
  uModBank in '..\model\uModBank.pas',
  uModRekening in '..\model\uModRekening.pas',
  ufrmCreateSO in 'module\so\ufrmCreateSO.pas' {frmCreateSO},
  ufrmHistorySO in 'module\so\ufrmHistorySO.pas' {frmHistorySO},
  ufrmMasterBrowse in '..\system\ufrmMasterBrowse.pas' {frmMasterBrowse},
  ufrmDialogDetailSO in 'module\so\ufrmDialogDetailSO.pas' {frmDialogDetailSO},
  ufrmSearchSO in 'module\so\ufrmSearchSO.pas' {frmDialogSearchSO},
  ufrmMasterDialogBrowse in '..\system\ufrmMasterDialogBrowse.pas' {frmMasterDialogBrowse},
  uAppUtils in '..\lib\uAppUtils.pas',
  ufrmDialogAddProductForSO in 'module\so\ufrmDialogAddProductForSO.pas' {frmDialogAddProductForSO},
  ufrmSearchProduct in '..\pho\module\product\ufrmSearchProduct.pas' {frmDialogSearchProduct},
  ufrmMemberShip in 'module\customer_support\ufrmMemberShip.pas' {frmMemberShip},
  ufrmDialogMemberShip in 'module\customer_support\ufrmDialogMemberShip.pas' {frmDialogMemberShip},
  ufrmSearchCompanyMember in 'module\customer_support\ufrmSearchCompanyMember.pas' {frmDialogSearchCompanyMember},
  ufrmDialogFamilyMember in 'module\customer_support\ufrmDialogFamilyMember.pas' {frmDialogFamilyMember},
  ufrmSearchStatusKlrg in 'module\customer_support\ufrmSearchStatusKlrg.pas' {frmDialogSearchStatusKlrg},
  ufrmDialogPersonalMember in 'module\customer_support\ufrmDialogPersonalMember.pas' {frmDialogPersonalMember},
  ufrmSearchTypeMember in 'module\customer_support\ufrmSearchTypeMember.pas' {frmDialogSearchTypeMember},
  ufrmPopupFamilyMember in 'module\customer_support\ufrmPopupFamilyMember.pas' {frmPopupFamilyMember},
  ufrmPopupPersonalMember in 'module\customer_support\ufrmPopupPersonalMember.pas' {frmPopupPersonalMember},
  ufrmGudang in 'module\inventory\ufrmGudang.pas' {frmGudang},
  ufrmDialogGudang in 'module\inventory\ufrmDialogGudang.pas' {frmDialogGudang},
  uInterface in '..\system\uInterface.pas',
  ufrmTrader in 'module\trader\ufrmTrader.pas' {frmTrader},
  ufrmDialogTrader in 'module\trader\ufrmDialogTrader.pas' {frmDialogTrader},
  ufrmDialogPlafonTrader in 'module\trader\ufrmDialogPlafonTrader.pas' {frmDialogPlafonTrader},
  ufrmSearchPO in 'module\merchandise\ufrmSearchPO.pas' {frmDialogSearchPO},
  ufrmCrazyPrice in 'module\trader\ufrmCrazyPrice.pas' {frmCrazyPrice},
  ufrmCrazyPriceDialog in 'module\trader\ufrmCrazyPriceDialog.pas' {frmCrazyPriceDialog};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmMain, dmMain);
  Application.Run;
end.
