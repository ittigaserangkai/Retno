unit ServerContainerUnit;

interface

uses
  System.SysUtils, System.Classes, Vcl.Dialogs,
  Datasnap.DSServer, Datasnap.DSCommonServer,
  Datasnap.DSClientMetadata, Datasnap.DSHTTPServiceProxyDispatcher,
  Datasnap.DSProxyJavaAndroid, Datasnap.DSProxyJavaBlackBerry,
  Datasnap.DSProxyObjectiveCiOS, Datasnap.DSProxyCsharpSilverlight,
  Datasnap.DSProxyFreePascal_iOS,
  Datasnap.DSAuth, Datasnap.DSNames, uServerDSProvider, uServerPOS;

type
  TServerContainer = class(TDataModule)
    DSServer: TDSServer;
    DSServerClass: TDSServerClass;
    procedure DataModuleCreate(Sender: TObject);
    procedure DSServerClassGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure RegisterServerClasses;
  end;

function DSServer: TDSServer;

implementation

{$R *.dfm}

uses Winapi.Windows, uDSUtils, ServerMethodsUnit, uServerClasses;

var
  FModule: TComponent;
  FDSServer: TDSServer;

function DSServer: TDSServer;
begin
  Result := FDSServer;
end;

constructor TServerContainer.Create(AOwner: TComponent);
begin
  inherited;
  FDSServer := DSServer;
end;

procedure TServerContainer.DataModuleCreate(Sender: TObject);
begin
  RegisterServerClasses;
end;

destructor TServerContainer.Destroy;
begin
  inherited;
  FDSServer := nil;
end;

procedure TServerContainer.DSServerClassGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethodsUnit.TServerMethods;
end;

procedure TServerContainer.RegisterServerClasses;
begin
  Assert(DSServer.Started = false, 'Server Active.' + #13 + 'Can''t add class to Active Server.');
  TCustServerClass.Create(Self, DSServer, TTestMethod, DSServerClass.LifeCycle);
  TCustServerClass.Create(Self, DSServer, TCrud, DSServerClass.LifeCycle);
  TCustServerClass.Create(Self, DSServer, TDSProvider, DSServerClass.LifeCycle);
  TCustServerClass.Create(Self, DSServer, TDSReport, DSServerClass.LifeCycle);
  TCustServerClass.Create(Self, DSServer, TJSONCRUD, DSServerClass.LifeCycle);
  TCustServerClass.Create(Self, DSServer, TPOS, DSServerClass.LifeCycle);
  TCustServerClass.Create(Self, DSServer, TCRUDPOS, DSServerClass.LifeCycle);

  //custom class here :
  TCustServerClass.Create(Self, DSServer, TSuggestionOrder, DSServerClass.LifeCycle);
  TCustServerClass.Create(Self, DSServer, TCrudSupplier, DSServerClass.LifeCycle);
  TCustServerClass.Create(Self, DSServer, TCrudPO, DSServerClass.LifeCycle);
  TCustServerClass.Create(Self, DSServer, TCrudDO, DSServerClass.LifeCycle);
  TCustServerClass.Create(Self, DSServer, TCrudCNRecv, DSServerClass.LifeCycle);
  TCustServerClass.Create(Self, DSServer, TCrudDNRecv, DSServerClass.LifeCycle);
  TCustServerClass.Create(Self, DSServer, TCrudSettingApp, DSServerClass.LifeCycle);
  TCustServerClass.Create(Self, DSServer, TCrudQuotation, DSServerClass.LifeCycle);
  TCustServerClass.Create(Self, DSServer, TCrudAdjFaktur, DSServerClass.LifeCycle);
  TCustServerClass.Create(Self, DSServer, TCrudBankCashOut, DSServerClass.LifeCycle);
  TCustServerClass.Create(Self, DSServer, TCRUDClaimFaktur, DSServerClass.LifeCycle);
  TCustServerClass.Create(Self, DSServer, TCrudUpdatePOS, DSServerClass.LifeCycle);
  TCustServerClass.Create(Self, DSServer, TCrudContrabonSales, DSServerClass.LifeCycle);
  TCustServerClass.Create(Self, DSServer, TCrudCustomerInvoice, DSServerClass.LifeCycle);
  TCustServerClass.Create(Self, DSServer, TCrudBarangHargaJual, DSServerClass.LifeCycle);
  TCustServerClass.Create(Self, DSServer, TCrudKuponBotol, DSServerClass.LifeCycle);
  TCustServerClass.Create(Self, DSServer, TCRUDJurnal, DSServerClass.LifeCycle);
  TCustServerClass.Create(Self, DSServer, TCrudCrazyPrice, DSServerClass.LifeCycle);
  TCustServerClass.Create(Self, DSServer, TCRUDBarang, DSServerClass.LifeCycle);
  TCustServerClass.Create(Self, DSServer, TCrudPOTrader, DSServerClass.LifeCycle);

end;


initialization
  FModule := TServerContainer.Create(nil);
finalization
  FModule.Free;
end.

