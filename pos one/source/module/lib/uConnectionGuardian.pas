unit uConnectionGuardian;

interface

uses
  SysUtils,
  IBDatabase;

type
  EIBConnectionGuardianError = class(Exception);

  TIBConnectionGuardian = class
  private
    FAllowConnect: Boolean;
    FDenyConnectMessage: string;
    FDatabase: TIBDatabase;
    procedure SetDatabase(const Value: TIBDatabase);
    procedure DatabaseOnBeforeConnection(Sender: TObject);
  public
    constructor Create;

    procedure SetDenyConnect(AForceDisconnect: Boolean; AMessage: string);
    procedure SetAllowConnect(AOpenDb: Boolean);
    property Database: TIBDatabase read FDatabase write SetDatabase;
    property AllowConnect: Boolean read FAllowConnect write FAllowConnect;
    // alasan mengapa tidak boleh konek
    property DenyConnectMessage: string read FDenyConnectMessage write FDenyConnectMessage;
  end;

implementation

{ TConnectionGuardian }

constructor TIBConnectionGuardian.Create;
begin
  FAllowConnect := True;
end;

procedure TIBConnectionGuardian.DatabaseOnBeforeConnection(
  Sender: TObject);
var
  errMsg: string;
begin
  if not FAllowConnect then
  begin
    errMsg := 'Connection to database is not allowed';
    if FDenyConnectMessage <> '' then
      errMsg := errMsg + #13#10#13#10 + FDenyConnectMessage;

    raise EIBConnectionGuardianError.Create(errMsg);
  end;
end;

procedure TIBConnectionGuardian.SetAllowConnect(AOpenDb: Boolean);
begin
  FAllowConnect := True;
  FDenyConnectMessage := '';

  if AOpenDb and (FDatabase <> nil) then
    FDatabase.Open;
end;

procedure TIBConnectionGuardian.SetDatabase(const Value: TIBDatabase);
begin
  if FDatabase = Value then
    exit;

  if Value <> nil then
  begin
    Value.BeforeConnect := DatabaseOnBeforeConnection;
  end;

  FDatabase := Value;
end;

procedure TIBConnectionGuardian.SetDenyConnect(AForceDisconnect: Boolean;
  AMessage: string);
begin
  if AForceDisconnect and (FDatabase <> nil) then
    FDatabase.Close;

  FAllowConnect := False;
  FDenyConnectMessage := AMessage;
end;

end.
