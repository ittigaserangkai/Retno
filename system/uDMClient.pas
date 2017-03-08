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

  ERestClientError = class(Exception)
  private
    FSrcExceptClass: String;
  public
    constructor Create(E: Exception);
    property SrcExceptClass: String read FSrcExceptClass write FSrcExceptClass;
  published
  end;

var
  DMClient: TDMClient;

implementation

uses
  Datasnap.DSHTTPClient;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

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

end.
