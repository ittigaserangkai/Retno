unit WebModuleRetnoUnit;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, Datasnap.DSHTTPCommon,
  Datasnap.DSHTTPWebBroker, Datasnap.DSServer,
  Web.WebFileDispatcher, Web.HTTPProd,
  DataSnap.DSAuth,
  Datasnap.DSProxyDispatcher, Datasnap.DSProxyJavaAndroid,
  Datasnap.DSProxyJavaBlackBerry, Datasnap.DSProxyObjectiveCiOS,
  Datasnap.DSProxyCsharpSilverlight,
  Datasnap.DSProxyFreePascal_iOS,
  Datasnap.DSProxyJavaScript, IPPeerServer, Datasnap.DSMetadata,
  Datasnap.DSServerMetadata, Datasnap.DSClientMetadata, Datasnap.DSCommonServer,
  Datasnap.DSHTTP, Vcl.StdCtrls;

type
  TWebModuleRetno = class(TWebModule)
    DSHTTPWebDispatcher: TDSHTTPWebDispatcher;
    ServerFunctionInvoker: TPageProducer;
    ReverseString: TPageProducer;
    WebFileDispatcher: TWebFileDispatcher;
    DSProxyGenerator1: TDSProxyGenerator;
    DSServerMetaDataProvider: TDSServerMetaDataProvider;
    DSProxyDispatcher: TDSProxyDispatcher;
    procedure ServerFunctionInvokerHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: string; TagParams: TStrings; var ReplaceText: string);
    procedure WebModuleDefaultAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModuleBeforeDispatch(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebFileDispatcherBeforeDispatch(Sender: TObject;
      const AFileName: string; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure WebModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FServerFunctionInvokerAction: TWebActionItem;
    function AllowServerFunctionInvoker: Boolean;
  public
    class procedure HTTPTraceErrorOnly(Sender: TObject; AContext: TDSHTTPContext;
        ARequest: TDSHTTPRequest; AResponse: TDSHTTPResponse);
    class procedure HTTPTraceAll(Sender: TObject; AContext: TDSHTTPContext;
        ARequest: TDSHTTPRequest; AResponse: TDSHTTPResponse);
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModuleRetno;
  WebModule : TWebModuleRetno;
  HTTPMemo : TMemo;

implementation


{$R *.dfm}

uses ServerMethodsUnit, ServerContainerUnit, Web.WebReq, ufrmMain,
  System.StrUtils;

procedure TWebModuleRetno.ServerFunctionInvokerHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: string; TagParams: TStrings; var ReplaceText: string);
begin
  if SameText(TagString, 'urlpath') then
    ReplaceText := string(Request.InternalScriptName)
  else if SameText(TagString, 'port') then
    ReplaceText := IntToStr(Request.ServerPort)
  else if SameText(TagString, 'host') then
    ReplaceText := string(Request.Host)
  else if SameText(TagString, 'classname') then
    ReplaceText := ServerMethodsUnit.TServerMethods.ClassName
  else if SameText(TagString, 'loginrequired') then
    if DSHTTPWebDispatcher.AuthenticationManager <> nil then
      ReplaceText := 'true'
    else
      ReplaceText := 'false'
  else if SameText(TagString, 'serverfunctionsjs') then
    ReplaceText := string(Request.InternalScriptName) + '/js/serverfunctions.js'
  else if SameText(TagString, 'servertime') then
    ReplaceText := DateTimeToStr(Now)
  else if SameText(TagString, 'serverfunctioninvoker') then
    if AllowServerFunctionInvoker then
      ReplaceText :=
      '<div><a href="' + string(Request.InternalScriptName) +
      '/ServerFunctionInvoker" target="_blank">Server Functions</a></div>'
    else
      ReplaceText := '';
end;

procedure TWebModuleRetno.WebModuleDefaultAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  if (Request.InternalPathInfo = '') or (Request.InternalPathInfo = '/')then
    Response.Content := ReverseString.Content
  else
    Response.SendRedirect(Request.InternalScriptName + '/');
end;

procedure TWebModuleRetno.WebModuleBeforeDispatch(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  if FServerFunctionInvokerAction <> nil then
    FServerFunctionInvokerAction.Enabled := AllowServerFunctionInvoker;
end;

function TWebModuleRetno.AllowServerFunctionInvoker: Boolean;
begin
  Result := (Request.RemoteAddr = '127.0.0.1') or
    (Request.RemoteAddr = '0:0:0:0:0:0:0:1') or (Request.RemoteAddr = '::1');
end;

class procedure TWebModuleRetno.HTTPTraceErrorOnly(Sender: TObject; AContext:
    TDSHTTPContext; ARequest: TDSHTTPRequest; AResponse: TDSHTTPResponse);
begin
  if Pos('error', LowerCase(AResponse.ResponseText)) = 0 then exit;

  HTTPTraceAll(Sender, AContext, ARequest, AResponse);
end;

class procedure TWebModuleRetno.HTTPTraceAll(Sender: TObject; AContext:
    TDSHTTPContext; ARequest: TDSHTTPRequest; AResponse: TDSHTTPResponse);
var
  Prefix: string;
begin
  Try
    if not Assigned(HTTPMemo) then exit;
    if HTTPMemo.Lines.Count > 1000 then HTTPMemo.Lines.Clear;

    Prefix := '[' + TimeToStr(Now()) + ']:' + '[' + ARequest.RemoteIP + ']';
    HTTPMemo.Lines.Add(Prefix + '-> ' + AnsiLeftStr(ARequest.URI,200));
    HTTPMemo.Lines.Add(Prefix + '<- ' + AnsiLeftStr(AResponse.ContentText,200));
  except
  End;
end;

procedure TWebModuleRetno.WebFileDispatcherBeforeDispatch(Sender: TObject;
  const AFileName: string; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  D1, D2: TDateTime;
begin
  Handled := False;
  if SameFileName(ExtractFileName(AFileName), 'serverfunctions.js') then
    if not FileExists(AFileName) or (FileAge(AFileName, D1) and FileAge(WebApplicationFileName, D2) and (D1 < D2)) then
    begin
      DSProxyGenerator1.TargetDirectory := ExtractFilePath(AFileName);
      DSProxyGenerator1.TargetUnitName := ExtractFileName(AFileName);
      DSProxyGenerator1.Write;
    end;
end;

procedure TWebModuleRetno.WebModuleCreate(Sender: TObject);
begin
  FServerFunctionInvokerAction := ActionByName('ServerFunctionInvokerAction');
  DSServerMetaDataProvider.Server := DSServer;
  DSHTTPWebDispatcher.Server := DSServer;
  if DSServer.Started then
  begin
    DSHTTPWebDispatcher.DbxContext := DSServer.DbxContext;
    DSHTTPWebDispatcher.Start;
  end;
  WebModule := Self;
end;

initialization
finalization
  Web.WebReq.FreeWebModules;

end.

