unit uDMClient;

interface

uses
  System.SysUtils, System.Classes, IPPeerClient, Datasnap.DSClientRest, uClientClasses;

type
  TDMClient = class(TDataModule)
    RestConn: TDSRestConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    FCrudClient: TCrudClient;
    FDSProviderClient: TDSProviderClient;
    FInstanceOwner: Boolean;
    function GetCrudClient: TCrudClient;
    function GetDSProviderClient: TDSProviderClient;
    function GetInstanceOwner: Boolean;
    property InstanceOwner: Boolean read GetInstanceOwner write FInstanceOwner;
    { Private declarations }
  public
    property CrudClient: TCrudClient read GetCrudClient write FCrudClient;
    property DSProviderClient: TDSProviderClient read GetDSProviderClient write
        FDSProviderClient;
    { Public declarations }
  end;

  ERestClientError = class(Exception)
  private
    FSrcExceptClass: String;
  public
    constructor Create(E: Exception);
    property SrcExceptClass: String read FSrcExceptClass write FSrcExceptClass;
  published
  end;

procedure RestClientError(E: Exception);

var
  DMClient: TDMClient;

implementation

uses
  Datasnap.DSHTTPClient;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure RestClientError(E: Exception);
begin
  Raise ERestClientError.Create(E);
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
begin
  //
end;

function TDMClient.GetCrudClient: TCrudClient;
begin
  if not Assigned(FCrudClient) then
    FCrudClient := TCrudClient.Create(RestConn, InstanceOwner);

  Result := FCrudClient;
end;

function TDMClient.GetDSProviderClient: TDSProviderClient;
begin
  if not Assigned(FDSProviderClient) then
    FDSProviderClient := TDSProviderClient.Create(RestConn, InstanceOwner);

  Result := FDSProviderClient;
end;

function TDMClient.GetInstanceOwner: Boolean;
begin
  FInstanceOwner := False;
  Result := FInstanceOwner;
end;

end.
