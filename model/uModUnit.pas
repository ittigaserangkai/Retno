unit uModUnit;

interface

uses
  uModApp;

type
  TModCompany = class(TModApp)

  private
    FCOMPANY: TModCompany;
    FUNT_APP_ID: Integer;
    FUNT_CODE: string;
    FUNT_CONTACT_PERSON: string;
    FUNT_DESCRIPTION: string;
    FUNT_EMAIL: string;
    FUNT_FAX: string;
    FUNT_KAB_ID: Integer;
    FUNT_NAME: string;
  public
    class function GetTableName: String; override;
  published
    property COMPANY: TModCompany read FCOMPANY write FCOMPANY;
    property UNT_APP_ID: Integer read FUNT_APP_ID write FUNT_APP_ID;
    property UNT_CODE: string read FUNT_CODE write FUNT_CODE;
    property UNT_CONTACT_PERSON: string read FUNT_CONTACT_PERSON write
        FUNT_CONTACT_PERSON;
    property UNT_DESCRIPTION: string read FUNT_DESCRIPTION write FUNT_DESCRIPTION;
    property UNT_EMAIL: string read FUNT_EMAIL write FUNT_EMAIL;
    property UNT_FAX: string read FUNT_FAX write FUNT_FAX;
    property UNT_KAB_ID: Integer read FUNT_KAB_ID write FUNT_KAB_ID;
    property UNT_NAME: string read FUNT_NAME write FUNT_NAME;
  end;

implementation

class function TModCompany.GetTableName: String;
begin
  Result := 'AUT$UNIT';
end;

end.
