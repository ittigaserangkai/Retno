unit uModUnit;

interface

uses
  uModApp, uModCompany, System.SysUtils, uModAuthApp;

type
  TModUnit = class(TModApp)

  private
    FAUTAPP: TModAutApp;
    FCOMPANY: TModCompany;
    FFUNT_IS_HO: Integer;
    FFUNT_IS_WH: Integer;
    FFUNT_IS_STORE: Integer;
    FFUNT_ZIP: string;
    FUNT_APP_ID: Integer;
    FUNT_CODE: string;
    FUNT_CONTACT_PERSON: string;
    FUNT_DESCRIPTION: string;
    FUNT_EMAIL: string;
    FUNT_FAX: string;
    FUNT_ISGRALLOW: Integer;
    FUNT_IS_ACTIVE: Integer;
    FUNT_IS_ALLOWPO: Integer;
    FUNT_KAB_ID: Integer;
    FUNT_NAME: string;
    FUNT_PHONE: string;
    FUNT_REGION_CODE: string;
    FUNT_TYPE: Integer;
  public
    destructor Destroy; override;
    class function GetTableName: String; override;
  published
    [AttributeOfForeign('AUT$APP_ID')]
    property AUTAPP: TModAutApp read FAUTAPP write FAUTAPP;
    property COMPANY: TModCompany read FCOMPANY write FCOMPANY;
    property FUNT_IS_HO: Integer read FFUNT_IS_HO write FFUNT_IS_HO;
    property FUNT_IS_WH: Integer read FFUNT_IS_WH write FFUNT_IS_WH;
    property FUNT_IS_STORE: Integer read FFUNT_IS_STORE write FFUNT_IS_STORE;
    property FUNT_ZIP: string read FFUNT_ZIP write FFUNT_ZIP;
    property UNT_APP_ID: Integer read FUNT_APP_ID write FUNT_APP_ID;
    property UNT_CODE: string read FUNT_CODE write FUNT_CODE;
    property UNT_CONTACT_PERSON: string read FUNT_CONTACT_PERSON write
        FUNT_CONTACT_PERSON;
    property UNT_DESCRIPTION: string read FUNT_DESCRIPTION write FUNT_DESCRIPTION;
    property UNT_EMAIL: string read FUNT_EMAIL write FUNT_EMAIL;
    property UNT_FAX: string read FUNT_FAX write FUNT_FAX;
    property UNT_ISGRALLOW: Integer read FUNT_ISGRALLOW write FUNT_ISGRALLOW;
    property UNT_IS_ACTIVE: Integer read FUNT_IS_ACTIVE write FUNT_IS_ACTIVE;
    property UNT_IS_ALLOWPO: Integer read FUNT_IS_ALLOWPO write FUNT_IS_ALLOWPO;
    property UNT_KAB_ID: Integer read FUNT_KAB_ID write FUNT_KAB_ID;
    property UNT_NAME: string read FUNT_NAME write FUNT_NAME;
    property UNT_PHONE: string read FUNT_PHONE write FUNT_PHONE;
    property UNT_REGION_CODE: string read FUNT_REGION_CODE write FUNT_REGION_CODE;
    property UNT_TYPE: Integer read FUNT_TYPE write FUNT_TYPE;



  end;

  TModUnitType = class(TModApp)
  private
    FType_Desc: string;
    FType_Name: string;
  public
    class function GetTableName: String; override;
  published
    property Type_Desc: string read FType_Desc write FType_Desc;
    property Type_Name: string read FType_Name write FType_Name;
  end;

implementation


destructor TModUnit.Destroy;
begin
  inherited;
  FreeAndNil(FCOMPANY);

end;

class function TModUnit.GetTableName: String;
begin
  Result := 'AUT$UNIT';
end;

class function TModUnitType.GetTableName: String;
begin
  Result := 'UNIT_TYPE';
end;

end.
