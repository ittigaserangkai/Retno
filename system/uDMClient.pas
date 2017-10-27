unit uDMClient;

interface

uses
  System.SysUtils, System.Classes, IPPeerClient, Datasnap.DSClientRest, uClientClasses,
  System.ImageList, Vcl.ImgList, Vcl.Controls, uDBUtils, Data.DB,
  Datasnap.DBClient, cxStyles, cxClasses;

type
  TDMClient = class(TDataModule)
    cxStyle: TcxStyleRepository;
    cxStyleBold: TcxStyle;
    cxStyleGridEven: TcxStyle;
    cxStyleGridHeader: TcxStyle;
    cxStyleInfoBK: TcxStyle;
    cxStyleMaroon: TcxStyle;
    cxStyleMoneyGreen: TcxStyle;
    cxStyleSkyBlue: TcxStyle;
    cxStyleTabGrid: TcxStyle;
    cxStyleTabGridBg: TcxStyle;
    ilImage24: TImageList;
    imgListButton: TImageList;
    imgListIcon: TImageList;
    RestConn: TDSRestConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    FCrudAdjFakClient: TCrudAdjFakturClient;
    FCrudBankCashOutClient: TCrudBankCashOutClient;
    FCrudBarangHargaJualClient: TCrudBarangHargaJualClient;
    FCrudClaimFakturClient: TCRUDClaimFakturClient;
    FCrudBarangClient: TCrudBarangClient;
    FCrudClient: TCrudClient;
    FCrudCNClient: TCrudCNRecvClient;
    FCrudContrabonSalesClient: TCrudContrabonSalesClient;
    FCrudCustomerInvoiceClient: TCrudCustomerInvoiceClient;
    FCrudDNClient: TCrudDNRecvClient;
    FCrudDOClient: TCrudDOClient;
    FCrudKuponBotolClient: TCrudKuponBotolClient;
    FCrudPOClient: TCrudPOClient;
    FCrudSettingAppClient: TCrudSettingAppClient;
    FCrudSupplierClient: TCrudSupplierClient;
    FCRUDJurnalClient: TCRUDJurnalClient;
    FPOSClient: TPOSClient;
    FCrudUpdatePOSClient: TCrudUpdatePOSClient;
    FDSProviderClient: TDSProviderClient;
    FInstanceOwner: Boolean;
    function GetCrudAdjFakClient: TCrudAdjFakturClient;
    function GetCrudBankCashOutClient: TCrudBankCashOutClient;
    function GetCrudBarangHargaJualClient: TCrudBarangHargaJualClient;
    function GetCrudClaimFakturClient: TCRUDClaimFakturClient;
    function GetCrudBarangClient: TCrudBarangClient;
    function GetCrudClient: TCrudClient;
    function GetCrudCNClient: TCrudCNRecvClient;
    function GetCrudContrabonSalesClient: TCrudContrabonSalesClient;
    function GetCrudCustomerInvoiceClient: TCrudCustomerInvoiceClient;
    function GetCrudDNClient: TCrudDNRecvClient;
    function GetCrudDOClient: TCrudDOClient;
    function GetCrudKuponBotolClient: TCrudKuponBotolClient;
    function GetCrudPOClient: TCrudPOClient;
    function GetCrudSettingAppClient: TCrudSettingAppClient;
    function GetCrudSupplierClient: TCrudSupplierClient;
    function GetCRUDJurnalClient: TCRUDJurnalClient;
    function GetPOSClient: TPOSClient;
    function GetCrudUpdatePOSClient: TCrudUpdatePOSClient;
    function GetDSProviderClient: TDSProviderClient;
    function GetInstanceOwner: Boolean;
    property InstanceOwner: Boolean read GetInstanceOwner write FInstanceOwner;
  public
    property CrudAdjFakClient: TCrudAdjFakturClient read GetCrudAdjFakClient write
        FCrudAdjFakClient;
    property CrudBankCashOutClient: TCrudBankCashOutClient read
        GetCrudBankCashOutClient write FCrudBankCashOutClient;
    property CrudBarangHargaJualClient: TCrudBarangHargaJualClient read
        GetCrudBarangHargaJualClient write FCrudBarangHargaJualClient;
    property CrudClaimFakturClient: TCRUDClaimFakturClient read
        GetCrudClaimFakturClient write FCrudClaimFakturClient;
    property CrudBarangClient: TCrudBarangClient read GetCrudBarangClient write
        FCrudBarangClient;
    property CrudClient: TCrudClient read GetCrudClient write FCrudClient;
    property CrudCNClient: TCrudCNRecvClient read GetCrudCNClient write
        FCrudCNClient;
    property CrudContrabonSalesClient: TCrudContrabonSalesClient read
        GetCrudContrabonSalesClient write FCrudContrabonSalesClient;
    property CrudCustomerInvoiceClient: TCrudCustomerInvoiceClient read
        GetCrudCustomerInvoiceClient write FCrudCustomerInvoiceClient;
    property CrudDNClient: TCrudDNRecvClient read GetCrudDNClient write
        FCrudDNClient;
    property CrudDOClient: TCrudDOClient read GetCrudDOClient write FCrudDOClient;
    property CrudKuponBotolClient: TCrudKuponBotolClient read
        GetCrudKuponBotolClient write FCrudKuponBotolClient;
    property CrudPOClient: TCrudPOClient read GetCrudPOClient write FCrudPOClient;
    property CrudSettingAppClient: TCrudSettingAppClient read
        GetCrudSettingAppClient write FCrudSettingAppClient;
    property CrudSupplierClient: TCrudSupplierClient read GetCrudSupplierClient
        write FCrudSupplierClient;
    property CRUDJurnalClient: TCRUDJurnalClient read GetCRUDJurnalClient write
        FCRUDJurnalClient;
    property POSClient: TPOSClient read GetPOSClient write FPOSClient;
    property CrudUpdatePOSClient: TCrudUpdatePOSClient read GetCrudUpdatePOSClient
        write FCrudUpdatePOSClient;
    property DSProviderClient: TDSProviderClient read GetDSProviderClient write
        FDSProviderClient;
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

function TDMClient.GetCrudAdjFakClient: TCrudAdjFakturClient;
begin
  if FCrudAdjFakClient <> nil then
    FreeAndNil(FCrudAdjFakClient);

  FCrudAdjFakClient := TCrudAdjFakturClient.Create(DMClient.RestConn, InstanceOwner);
  Result            := FCrudAdjFakClient;
end;

function TDMClient.GetCrudBankCashOutClient: TCrudBankCashOutClient;
begin
  if FCrudBankCashOutClient <> nil then
    FreeAndNil(FCrudBankCashOutClient);

  FCrudBankCashOutClient := TCrudBankCashOutClient.Create(RestConn, InstanceOwner);
  Result := FCrudBankCashOutClient;
end;

function TDMClient.GetCrudBarangHargaJualClient: TCrudBarangHargaJualClient;
begin
  if FCrudBarangHargaJualClient <> nil then
    FreeAndNil(FCrudBarangHargaJualClient);

  FCrudBarangHargaJualClient := TCrudBarangHargaJualClient.Create(DMClient.RestConn, InstanceOwner);
  Result := FCrudBarangHargaJualClient;
end;

function TDMClient.GetCrudClaimFakturClient: TCRUDClaimFakturClient;
begin
  if FCrudClaimFakturClient <> nil then
    FreeAndNil(FCrudClaimFakturClient);

  FCrudClaimFakturClient := TCRUDClaimFakturClient.Create(DMClient.RestConn,InstanceOwner);
  Result        := FCrudClaimFakturClient;
end;

function TDMClient.GetCrudBarangClient: TCrudBarangClient;
begin
  if FCrudBarangClient <> nil then
    FreeAndNil(FCrudBarangClient);

  FCrudBarangClient := TCrudBarangClient.Create(DMClient.RestConn,InstanceOwner);
  Result        := FCrudBarangClient;
end;

function TDMClient.GetCrudClient: TCrudClient;
begin
  if FCrudClient <> nil then
    FreeAndNil(FCrudClient);

  FCrudClient := TCrudClient.Create(RestConn, InstanceOwner);
  Result := FCrudClient;
end;

function TDMClient.GetCrudCNClient: TCrudCNRecvClient;
begin
  if FCrudCNClient <> nil then
    FreeAndNil(FCrudCNClient);

  FCrudCNClient := TCrudCNRecvClient.Create(DMClient.RestConn, InstanceOwner);
  Result        := FCrudCNClient;
end;

function TDMClient.GetCrudContrabonSalesClient: TCrudContrabonSalesClient;
begin
  if FCrudContrabonSalesClient <> nil then
    FreeAndNil(FCrudContrabonSalesClient);

  FCrudContrabonSalesClient := TCrudContrabonSalesClient.Create(DMClient.RestConn, InstanceOwner);
  Result := FCrudContrabonSalesClient;
end;

function TDMClient.GetCrudCustomerInvoiceClient: TCrudCustomerInvoiceClient;
begin
  if FCrudCustomerInvoiceClient = nil then
    FreeAndNil(FCrudCustomerInvoiceClient);

  FCrudCustomerInvoiceClient := TCrudCustomerInvoiceClient.Create(DMClient.RestConn, InstanceOwner);
  Result := FCrudCustomerInvoiceClient;
end;

function TDMClient.GetCrudDNClient: TCrudDNRecvClient;
begin
  if FCrudDNClient <> nil then
    FreeAndNil(FCrudDNClient);

  FCrudDNClient := TCrudDNRecvClient.Create(DMClient.RestConn, InstanceOwner);
  Result        := FCrudDNClient;
end;

function TDMClient.GetCrudDOClient: TCrudDOClient;
begin
  if FCrudDOClient <> nil then
    FreeAndNil(FCrudDOClient);

  FCrudDOClient := TCrudDOClient.Create(DMClient.RestConn, InstanceOwner);
  Result := FCrudDOClient;
end;

function TDMClient.GetCrudKuponBotolClient: TCrudKuponBotolClient;
begin
  if FCrudKuponBotolClient <> nil then
    FreeAndNil(FCrudKuponBotolClient);

  FCrudKuponBotolClient := TCrudKuponBotolClient.Create(DMClient.RestConn, InstanceOwner);
  Result := FCrudKuponBotolClient;
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

function TDMClient.GetCrudSupplierClient: TCrudSupplierClient;
begin
  if FCrudSupplierClient <> nil then
    FreeAndNil(FCrudSupplierClient);

  FCrudSupplierClient := TCrudSupplierClient.Create(RestConn, InstanceOwner);
  Result := FCrudSupplierClient;
end;

function TDMClient.GetCRUDJurnalClient: TCRUDJurnalClient;
begin
  if FCRUDJurnalClient <> nil then
    FreeAndNil(FCRUDJurnalClient);

  FCRUDJurnalClient := TCRUDJurnalClient.Create(RestConn, InstanceOwner);
  Result := FCRUDJurnalClient;
end;

function TDMClient.GetPOSClient: TPOSClient;
begin
  if FPOSClient <> nil then
    FreeAndNil(FPOSClient);

  FPOSClient := TPOSCLient.Create(RestConn, InstanceOwner);
  Result := FPOSClient;
end;

function TDMClient.GetCrudUpdatePOSClient: TCrudUpdatePOSClient;
begin
  if FCrudUpdatePOSClient <> nil then
    FreeAndNil(FCrudUpdatePOSClient);

  FCrudUpdatePOSClient := TCrudUpdatePOSClient.Create(DMClient.RestConn, InstanceOwner);
  Result := FCrudUpdatePOSClient;
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
