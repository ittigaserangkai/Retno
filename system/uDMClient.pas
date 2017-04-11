unit uDMClient;

interface

uses
  System.SysUtils, System.Classes, IPPeerClient, Datasnap.DSClientRest, uClientClasses,
  System.ImageList, Vcl.ImgList, Vcl.Controls, uDBUtils, Data.DB,
  Datasnap.DBClient, cxStyles, cxClasses, uModUnit;

type
  TDMClient = class(TDataModule)
    RestConn: TDSRestConnection;
    imgListButton: TImageList;
    cxStyle: TcxStyleRepository;
    cxStyleGridEven: TcxStyle;
    cxStyleGridHeader: TcxStyle;
    imgListIcon: TImageList;
    procedure DataModuleCreate(Sender: TObject);
  private
    FCrudClient: TCrudClient;
    FDSProviderClient: TDSProviderClient;
    FInstanceOwner: Boolean;
    FUnitStore: TModUnit;
    function GetCrudClient: TCrudClient;
    function GetDSProviderClient: TDSProviderClient;
    function GetInstanceOwner: Boolean;
    procedure SetUnitStore(const Value: TModUnit);
    property InstanceOwner: Boolean read GetInstanceOwner write FInstanceOwner;
    { Private declarations }
  public
    property CrudClient: TCrudClient read GetCrudClient write FCrudClient;
    property DSProviderClient: TDSProviderClient read GetDSProviderClient write
        FDSProviderClient;
    property UnitStore: TModUnit read FUnitStore write SetUnitStore;
    { Public declarations }
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
  sIDUnit: string;
begin
  RestConn.PreserveSessionID := False;
  //set true akan menyebabkan ada expired time di client

  sIDUnit   := TAppUtils.BacaRegistry('UnitStore');
  if sIDUnit <> '' then
    UnitStore := TModUnit(DMClient.CrudClient.Retrieve(TModUnit.ClassName, sIDUnit));

end;

function TDMClient.GetCrudClient: TCrudClient;
begin
  if FCrudClient <> nil then
    FreeAndNil(FCrudClient);

  FCrudClient := TCrudClient.Create(RestConn, InstanceOwner);
  Result := FCrudClient;
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

procedure TDMClient.SetUnitStore(const Value: TModUnit);
begin
  FreeAndNil(FUnitStore);
  FUnitStore := Value;
end;

end.
