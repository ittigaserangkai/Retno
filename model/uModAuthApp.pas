unit uModAuthApp;

interface

uses
  uModApp;

type
  TModAutApp = class(TModApp)
  private
    FAPP_NAME: string;
    FAPP_CODE: string;
    FAPP_DESCRIPTION: string;
  public
    class function GetTableName: string; override;
  published
    property APP_NAME: string read FAPP_NAME write FAPP_NAME;
    property APP_CODE: string read FAPP_CODE write FAPP_CODE;
    property APP_DESCRIPTION: string read FAPP_DESCRIPTION write FAPP_DESCRIPTION;
  end;

implementation

class function TModAutApp.GetTableName: string;
begin
  Result := 'AUT$APP';
end;

initialization
  TModAutApp.RegisterRTTI;

end.
