unit uModAuthApp;

interface

uses
  uModApp;

type
  TModAuthUser = class(TModApp)
  private
    FUSR_USERNAME: string;
    FUSR_FULLNAME: string;
  public
    class function GetTableName: string; override;
  published
    property USR_USERNAME: string read FUSR_USERNAME write FUSR_USERNAME;
    property USR_FULLNAME: string read FUSR_FULLNAME write FUSR_FULLNAME;
  end;

implementation

class function TModAuthUser.GetTableName: string;
begin
  Result := 'AUT$USER';
end;

initialization
  TModAuthUser.RegisterRTTI;

end.
