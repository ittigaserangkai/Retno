unit uModUnit;

interface

uses
  uModApp, uModCompany, System.SysUtils, uModAuthApp, uModTipePerusahaan;

type
  TModUnitType = class;
  TModUnit = class(TModApp)

  private
    FAUTAPP: TModAutApp;
    FCOMPANY: TModCompany;
    FNPWP: string;
    FNPWP_ADR: string;
    FNPWP_NAME: string;
    FNPWP_REG_DATE: TDatetime;
    FREF_TIPE_PERUSAHAAN: TModTipePerusahaan;
    FUNT_IS_HO: Integer;
    FUNT_IS_WH: Integer;
    FUNT_IS_STORE: Integer;
    FUNT_ZIP: string;
    FUNT_CODE: string;
    FUNT_CONTACT_PERSON: string;
    FUNT_DESCRIPTION: string;
    FUNT_EMAIL: string;
    FUNT_FAX: string;
    FUNT_ISGRALLOWED: Integer;
    FUNT_IS_ACTIVE: Integer;
    FUNT_IS_ALLOWPO: Integer;
    FUNT_KAB_ID: Integer;
    FUNT_NAME: string;
    FUNT_PHONE: string;
    FUNT_RGN_CODE: string;
    FUNT_TYPE: TModUnitType;
    procedure SetNPWP_ADR(const Value: string);
  public
    destructor Destroy; override;
    class function GetTableName: String; override;
  published
    [AttributeOfForeign('AUT$APP_ID')]
    property AUTAPP: TModAutApp read FAUTAPP write FAUTAPP;
    property COMPANY: TModCompany read FCOMPANY write FCOMPANY;
    property NPWP: string read FNPWP write FNPWP;
    property NPWP_ADR: string read FNPWP_ADR write SetNPWP_ADR;
    property NPWP_NAME: string read FNPWP_NAME write FNPWP_NAME;
    property NPWP_REG_DATE: TDatetime read FNPWP_REG_DATE write FNPWP_REG_DATE;
    property REF_TIPE_PERUSAHAAN: TModTipePerusahaan read FREF_TIPE_PERUSAHAAN
        write FREF_TIPE_PERUSAHAAN;
    property UNT_IS_HO: Integer read FUNT_IS_HO write FUNT_IS_HO;
    property UNT_IS_WH: Integer read FUNT_IS_WH write FUNT_IS_WH;
    property UNT_IS_STORE: Integer read FUNT_IS_STORE write FUNT_IS_STORE;
    property UNT_ZIP: string read FUNT_ZIP write FUNT_ZIP;
    property UNT_CODE: string read FUNT_CODE write FUNT_CODE;
    property UNT_CONTACT_PERSON: string read FUNT_CONTACT_PERSON write
        FUNT_CONTACT_PERSON;
    property UNT_DESCRIPTION: string read FUNT_DESCRIPTION write FUNT_DESCRIPTION;
    property UNT_EMAIL: string read FUNT_EMAIL write FUNT_EMAIL;
    property UNT_FAX: string read FUNT_FAX write FUNT_FAX;
    property UNT_ISGRALLOWED: Integer read FUNT_ISGRALLOWED write FUNT_ISGRALLOWED;
    property UNT_IS_ACTIVE: Integer read FUNT_IS_ACTIVE write FUNT_IS_ACTIVE;
    property UNT_IS_ALLOWPO: Integer read FUNT_IS_ALLOWPO write FUNT_IS_ALLOWPO;
    property UNT_KAB_ID: Integer read FUNT_KAB_ID write FUNT_KAB_ID;
    property UNT_NAME: string read FUNT_NAME write FUNT_NAME;
    property UNT_PHONE: string read FUNT_PHONE write FUNT_PHONE;
    property UNT_RGN_CODE: string read FUNT_RGN_CODE write FUNT_RGN_CODE;
    property UNT_TYPE: TModUnitType read FUNT_TYPE write FUNT_TYPE;



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

procedure TModUnit.SetNPWP_ADR(const Value: string);
begin
  FNPWP_ADR := Value;
end;

class function TModUnitType.GetTableName: String;
begin
  Result := 'UNIT_TYPE';
end;

initialization
  TModUnit.RegisterRTTI;

end.
