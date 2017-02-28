unit uDMClient;

interface

uses
  System.SysUtils, System.Classes, IPPeerClient, Datasnap.DSClientRest;

type
  TDMClient = class(TDataModule)
    RestConn: TDSRestConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMClient: TDMClient;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
