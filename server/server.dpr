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
  uAppUtils in '..\lib\uAppUtils.pas',
  uModBank in '..\model\uModBank.pas',
  uModTest in '..\model\uModTest.pas',
  uDSUtils in '..\lib\uDSUtils.pas',
  uServerClasses in 'unit\uServerClasses.pas',
  uModCompany in '..\model\uModCompany.pas',
  uModAuthApp in '..\model\uModAuthApp.pas',
  uModRefPajak in '..\model\uModRefPajak.pas',
  ufrmGenerateModel in 'unit\ufrmGenerateModel.pas' {frmGenerateModel},
  uModRekening in '..\model\uModRekening.pas',
  uModAppHelper in '..\model\uModAppHelper.pas',
  uModTipeBarang in '..\model\uModTipeBarang.pas',
  uModOutlet in '..\model\uModOutlet.pas',
  uDXUtils in '..\lib\uDXUtils.pas',
  uModTipePembayaran in '..\model\uModTipePembayaran.pas';

{$R *.res}


begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
