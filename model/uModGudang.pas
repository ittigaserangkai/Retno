unit uModGudang;

interface

uses
  uModApp, uModUnit;

type
  TModGudang = class(TModApp)
  private
    FAutUnit: TModUnit;
    FGUD_CODE: string;
    FGUD_NAME: string;
    FGUD_ADDRESS: string;
    FGUD_FAX: string;
    FGUD_CITY: string;
    FGUD_CONTACT_PERSON: string;
    FGUD_POST_CODE: string;
    FGUD_TELP: string;
  public
    class function GetTableName: string; override;
  published
    [AttributeOfForeign('AUT$UNIT_ID')]
    property AutUnit: TModUnit read FAutUnit write FAutUnit;
    [AttributeOfCode]
    property GUD_CODE: string read FGUD_CODE write FGUD_CODE;
    property GUD_NAME: string read FGUD_NAME write FGUD_NAME;
    property GUD_ADDRESS: string read FGUD_ADDRESS write FGUD_ADDRESS;
    property GUD_FAX: string read FGUD_FAX write FGUD_FAX;
    property GUD_CITY: string read FGUD_CITY write FGUD_CITY;
    property GUD_CONTACT_PERSON: string read FGUD_CONTACT_PERSON write
        FGUD_CONTACT_PERSON;
    property GUD_POST_CODE: string read FGUD_POST_CODE write FGUD_POST_CODE;
    property GUD_TELP: string read FGUD_TELP write FGUD_TELP;
  end;

implementation

class function TModGudang.GetTableName: string;
begin
  Result := 'Gudang'

end;
initialization
  TModGudang.RegisterRTTI;
end.
