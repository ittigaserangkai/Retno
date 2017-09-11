unit uModAuthUser;

interface
uses uModApp;
type
  TModAuthUser = class(TModApp)
  private
    FMaxUbahPO: Integer;
    FOTOQTYSO: Integer;
    FUSR_FULLNAME: String;
    FUSR_USERNAME: String;
    FUSR_PASSWD: String;
    FUSR_STATUS: Integer;
    FUSR_DESCRIPTION: String;
  public
    class function GetTableName: String; override;
  published
    property MaxUbahPO: Integer read FMaxUbahPO write FMaxUbahPO;
    property OTOQTYSO: Integer read FOTOQTYSO write FOTOQTYSO;
    property USR_FULLNAME: String read FUSR_FULLNAME write FUSR_FULLNAME;
    property USR_USERNAME: String read FUSR_USERNAME write FUSR_USERNAME;
    property USR_PASSWD: String read FUSR_PASSWD write FUSR_PASSWD;
    property USR_STATUS: Integer read FUSR_STATUS write FUSR_STATUS;
    property USR_DESCRIPTION: String read FUSR_DESCRIPTION write FUSR_DESCRIPTION;
  end;


implementation

class function TModAuthUser.GetTableName: String;
begin
  Result := 'AUT$USER';
end;

initialization
  TModAuthUser.RegisterRTTI;
end.
