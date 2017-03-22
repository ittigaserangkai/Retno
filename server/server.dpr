program server;
{$APPTYPE GUI}

{$R *.dres}

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
  uModAccount in '..\model\uModAccount.pas',
  uModBank in '..\model\uModBank.pas',
  uModTest in '..\model\uModTest.pas',
  uDSUtils in '..\lib\uDSUtils.pas',
  uServerClasses in 'unit\uServerClasses.pas',
  uModAuthApp in '..\model\uModAuthApp.pas',
  uModRefPajak in '..\model\uModRefPajak.pas',
  uModRekening in '..\model\uModRekening.pas',
  uModMember in '..\model\uModMember.pas',
  uModOutlet in '..\model\uModOutlet.pas',
  uModSatuan in '..\model\uModSatuan.pas',
  uModTipePerusahaan in '..\model\uModTipePerusahaan.pas',
  uModCostCenter in '..\model\uModCostCenter.pas',
  uModSuplier in '..\model\uModSuplier.pas',
  uModBarang in '..\model\uModBarang.pas',
  uServerDSProvider in 'unit\uServerDSProvider.pas',
  uModCompany in '..\model\uModCompany.pas',
  uTSINIFile in '..\lib\uTSINIFile.pas',
  uModTipeKirimPO in '..\model\uModTipeKirimPO.pas',
  uModUnit in '..\model\uModUnit.pas';

{$R *.res}


begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;

  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
