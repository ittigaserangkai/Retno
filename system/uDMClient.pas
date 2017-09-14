unit uDMClient;

interface

uses
  System.SysUtils, System.Classes, IPPeerClient, Datasnap.DSClientRest, uClientClasses,
  System.ImageList, Vcl.ImgList, Vcl.Controls, uDBUtils, Data.DB,
  Datasnap.DBClient, cxStyles, cxClasses;

type
  TDMClient = class(TDataModule)
    RestConn: TDSRestConnection;
    imgListButton: TImageList;
    cxStyle: TcxStyleRepository;
    cxStyleGridEven: TcxStyle;
    cxStyleGridHeader: TcxStyle;
    imgListIcon: TImageList;
    cxStyleMoneyGreen: TcxStyle;
    cxStyleInfoBK: TcxStyle;
    cxStyleSkyBlue: TcxStyle;
    ilImage24: TImageList;
    cxStyleMaroon: TcxStyle;
    cxStyleBold: TcxStyle;
    cxStyleTabGrid: TcxStyle;
    cxStyleTabGridBg: TcxStyle;
    procedure DataModuleCreate(Sender: TObject);
  private
    FCrudClient: TCrudClient;
    FCrudDOClient: TCrudDOClient;
    FCrudPOClient: TCrudPOClient;
    FCrudCNClient: TCrudCNRecvClient;
    FCrudAdjFakClient: TCrudAdjFakturClient;
    FCrudDNClient: TCrudDNRecvClient;
    FCrudSettingAppClient: TCrudSettingAppClient;
    FCrudBankCashOutClient: TCrudBankCashOutClient;
    FCrudClaimFakturClient: TCRUDClaimFakturClient;
    FCrudContrabonSalesClient: TCrudContrabonSalesClient;
    FCrudUpdatePOSClient: TCrudUpdatePOSClient;
    FCrudSupplierClient: TCrudSupplierClient;
    FDSProviderClient: TDSProviderClient;
    FInstanceOwner: Boolean;
    function GetCrudClient: TCrudClient;
    function GetCrudDOClient: TCrudDOClient;
    function GetCrudPOClient: TCrudPOClient;
    function GetCrudCNClient: TCrudCNRecvClient;
    function GetCrudAdjFakClient: TCrudAdjFakturClient;
    function GetCrudDNClient: TCrudDNRecvClient;
    function GetCrudSettingAppClient: TCrudSettingAppClient;
    function GetCrudBankCashOutClient: TCrudBankCashOutClient;
    function GetCrudClaimFakturClient: TCRUDClaimFakturClient;
    function GetCrudContrabonSalesClient: TCrudContrabonSalesClient;
    function GetCrudUpdatePOSClient: TCrudUpdatePOSClient;
    function GetCrudSupplierClient: TCrudSupplierClient;
    function GetDSProviderClient: TDSProviderClient;
    function GetInstanceOwner: Boolean;
    property InstanceOwner: Boolean read GetInstanceOwner write FInstanceOwner;
    { Private declarations }
  public
    property CrudClient: TCrudClient read GetCrudClient write FCrudClient;
    property CrudDOClient: TCrudDOClient read GetCrudDOClient write FCrudDOClient;
    property CrudPOClient: TCrudPOClient read GetCrudPOClient write FCrudPOClient;
    property CrudCNClient: TCrudCNRecvClient read GetCrudCNClient write
        FCrudCNClient;
    property CrudAdjFakClient: TCrudAdjFakturClient read GetCrudAdjFakClient write
        FCrudAdjFakClient;
    property CrudBankCashOutClient: TCrudBankCashOutClient read
        GetCrudBankCashOutClient write FCrudBankCashOutClient;
    property CrudDNClient: TCrudDNRecvClient read GetCrudDNClient write
        FCrudDNClient;
    property CrudClaimFakturClient: TCRUDClaimFakturClient read
        GetCrudClaimFakturClient write FCrudClaimFakturClient;
    property CrudContrabonSalesClient: TCrudContrabonSalesClient read
        GetCrudContrabonSalesClient write FCrudContrabonSalesClient;
    property CrudUpdatePOSClient: TCrudUpdatePOSClient read GetCrudUpdatePOSClient
        write FCrudUpdatePOSClient;
    property CrudSettingAppClient: TCrudSettingAppClient read
        GetCrudSettingAppClient write FCrudSettingAppClient;
    property CrudSupplierClient: TCrudSupplierClient read GetCrudSupplierClient
        write FCrudSupplierClient;
    property DSProviderClient: TDSProviderClient read GetDSProviderClient write
        FDSProviderClient;
    { Public declarations }
  published
  end;

  ERestClientError = class(Exception)
  private
    FSrcExceptClass: String;
  public
    constructor Create(E: Exception);
    property SrcExceptClass: String read FSrcExceptClass write FSrcExceptClass;
  end;


procedure RestClientError(E: Exception);

function ToCDS(aDataSet: TDataSet; AOwner: TComponent = nil): TClientDataSet;

var
  DMClient: TDMClient;

implementation

uses
  Datasnap.DSHTTPClient, Dialogs,uAppUtils;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure RestClientError(E: Exception);
begin
  Raise ERestClientError.Create(E);
end;

function ToCDS(aDataSet: TDataSet; AOwner: TComponent = nil): TClientDataSet;
begin
  Result := TDBUtils.DSToCDS(ADataSet, AOwner);
end;

constructor ERestClientError.Create(E: Exception);
var
  Msg: string;
begin
  Msg := E.Message;
  if E is EHTTPProtocolException then
    Msg := Msg + #13 + EHTTPProtocolException(E).ErrorMessage;
  SrcExceptClass := E.ClassName;
  inherited Create(Msg);
end;

procedure TDMClient.DataModuleCreate(Sender: TObject);
var
  lPort: Integer;
begin
  //set true akan menyebabkan ada expired time di client
  //kecuali butuh _cache
  lPort := 8080;
  TryStrToInt(TAppUtils.BacaRegistry('port'), lPort);
  RestConn.Host     := TAppUtils.BacaRegistry('server');
  RestConn.Port     := lPort;
  RestConn.UserName := TAppUtils.BacaRegistry('user');
  RestConn.Password := TAppUtils.BacaRegistry('password');

  RestConn.PreserveSessionID := False;
end;

function TDMClient.GetCrudClient: TCrudClient;
begin
  if FCrudClient <> nil then
    FreeAndNil(FCrudClient);

  FCrudClient := TCrudClient.Create(RestConn, InstanceOwner);
  Result := FCrudClient;
end;

function TDMClient.GetCrudDOClient: TCrudDOClient;
begin
  if FCrudDOClient <> nil then
    FreeAndNil(FCrudDOClient);

  FCrudDOClient := TCrudDOClient.Create(DMClient.RestConn, InstanceOwner);
  Result := FCrudDOClient;
end;

function TDMClient.GetCrudPOClient: TCrudPOClient;
begin
  if FCrudPOClient <> nil then
    FreeAndNil(FCrudPOClient);

  FCrudPOClient := TCrudPOClient.Create(DMClient.RestConn, InstanceOwner);
  Result        := FCrudPOClient;
end;

function TDMClient.GetCrudSettingAppClient: TCrudSettingAppClient;
begin
  if FCrudSettingAppClient <> nil then
    FreeAndNil(FCrudSettingAppClient);

  FCrudSettingAppClient := TCrudSettingAppClient.Create(RestConn, InstanceOwner);
  Result := FCrudSettingAppClient;
end;


function TDMClient.GetCrudCNClient: TCrudCNRecvClient;
begin
  if FCrudCNClient <> nil then
    FreeAndNil(FCrudCNClient);

  FCrudCNClient := TCrudCNRecvClient.Create(DMClient.RestConn, InstanceOwner);
  Result        := FCrudCNClient;
end;

function TDMClient.GetCrudAdjFakClient: TCrudAdjFakturClient;
begin
  if FCrudAdjFakClient <> nil then
    FreeAndNil(FCrudAdjFakClient);

  FCrudAdjFakClient := TCrudAdjFakturClient.Create(DMClient.RestConn, InstanceOwner);
  Result            := FCrudAdjFakClient;
end;

function TDMClient.GetCrudDNClient: TCrudDNRecvClient;
begin
  if FCrudDNClient <> nil then
    FreeAndNil(FCrudDNClient);

  FCrudDNClient := TCrudDNRecvClient.Create(DMClient.RestConn, InstanceOwner);
  Result        := FCrudDNClient;
end;

function TDMClient.GetCrudBankCashOutClient: TCrudBankCashOutClient;
begin
  if FCrudBankCashOutClient <> nil then
    FreeAndNil(FCrudBankCashOutClient);

  FCrudBankCashOutClient := TCrudBankCashOutClient.Create(RestConn, InstanceOwner);
  Result := FCrudBankCashOutClient;
end;

function TDMClient.GetCrudClaimFakturClient: TCRUDClaimFakturClient;
begin
  if FCrudClaimFakturClient <> nil then
    FreeAndNil(FCrudClaimFakturClient);

  FCrudClaimFakturClient := TCRUDClaimFakturClient.Create(
    DMClient.RestConn, InstanceOwner);
  Result        := FCrudClaimFakturClient;
end;

function TDMClient.GetCrudContrabonSalesClient: TCrudContrabonSalesClient;
begin
  if FCrudContrabonSalesClient <> nil then
    FreeAndNil(FCrudContrabonSalesClient);

  FCrudContrabonSalesClient := TCrudContrabonSalesClient.Create(DMClient.RestConn, InstanceOwner);
  Result := FCrudContrabonSalesClient;
end;

function TDMClient.GetCrudUpdatePOSClient: TCrudUpdatePOSClient;
begin
  if FCrudUpdatePOSClient <> nil then
    FreeAndNil(FCrudUpdatePOSClient);

  FCrudUpdatePOSClient := TCrudUpdatePOSClient.Create(DMClient.RestConn, InstanceOwner);
  Result := FCrudUpdatePOSClient;
end;

function TDMClient.GetCrudSupplierClient: TCrudSupplierClient;
begin
  if FCrudSupplierClient <> nil then
    FreeAndNil(FCrudSupplierClient);

  FCrudSupplierClient := TCrudSupplierClient.Create(RestConn, InstanceOwner);
  Result := FCrudSupplierClient;
end;

function TDMClient.GetDSProviderClient: TDSProviderClient;
begin
  if FDSProviderClient <> nil then
    FreeAndNil(FDSProviderClient);

  FDSProviderClient := TDSProviderClient.Create(RestConn, InstanceOwner);
  Result := FDSProviderClient;
end;

function TDMClient.GetInstanceOwner: Boolean;
begin
  FInstanceOwner := False;
  Result := FInstanceOwner;
end;

end.
