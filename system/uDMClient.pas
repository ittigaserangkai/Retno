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

var
  DMClient: TDMClient;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

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
