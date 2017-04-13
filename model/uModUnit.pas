unit uModUnit;

interface

uses
  uModApp, uModCompany, System.SysUtils, uModAuthApp, uModTipePerusahaan,
  uModPropinsi;

type
  TModUnitType = class;
  TModUnit = class(TModApp)

  private
    FAUTAPP: TModAutApp;
    FCOMPANY: TModCompany;
    FUNT_NPWP: string;
    FUNT_NPWP_ADR: string;
    FUNT_NPWP_NAME: string;
    FUNT_NPWP_REG_DATE: TDatetime;
    FREF_TIPE_PERUSAHAAN: TModTipePerusahaan;
    FUNT_IS_HO: Integer;
    FUNT_IS_WH: Integer;
    FUNT_IS_STORE: Integer;
    FUNT_ZIP: string;
    FUNT_CODE: string;
    FUNT_CONTACT_PERSON: string;
    FUNT_DESCRIPTION: string;
    FUNT_EMAIL: string;
    FUNT_ADR: string;
    FUNT_FAX: string;
    FUNT_ISGRALLOWED: Integer;
    FUNT_IS_ACTIVE: Integer;
    FUNT_IS_ALLOWPO: Integer;
    FKABUPATEN: TModKabupaten;
    FUNT_NAME: string;
    FUNT_PARENT: TModUnit;
    FUNT_PHONE: string;
    FUNT_RGN_CODE: string;
    procedure SetUNT_NPWP_ADR(const Value: string);
  public
    destructor Destroy; override;
    class function GetTableName: String; override;
  published
    [AttributeOfForeign('AUT$APP_ID')]
    property AUTAPP: TModAutApp read FAUTAPP write FAUTAPP;
    property COMPANY: TModCompany read FCOMPANY write FCOMPANY;
    property UNT_NPWP: string read FUNT_NPWP write FUNT_NPWP;
    property UNT_NPWP_ADR: string read FUNT_NPWP_ADR write SetUNT_NPWP_ADR;
    property UNT_NPWP_NAME: string read FUNT_NPWP_NAME write FUNT_NPWP_NAME;
    property UNT_NPWP_REG_DATE: TDatetime read FUNT_NPWP_REG_DATE write
        FUNT_NPWP_REG_DATE;
        [AttributeOfForeign('REF$TIPE_PERUSAHAAN_ID')]
    property REF_TIPE_PERUSAHAAN: TModTipePerusahaan read FREF_TIPE_PERUSAHAAN
        write FREF_TIPE_PERUSAHAAN;
    property UNT_IS_HO: Integer read FUNT_IS_HO write FUNT_IS_HO;
    property UNT_IS_WH: Integer read FUNT_IS_WH write FUNT_IS_WH;
    property UNT_IS_STORE: Integer read FUNT_IS_STORE write FUNT_IS_STORE;
    property UNT_ZIP: string read FUNT_ZIP write FUNT_ZIP;
    [AttributeOfCode]
    property UNT_CODE: string read FUNT_CODE write FUNT_CODE;
    property UNT_CONTACT_PERSON: string read FUNT_CONTACT_PERSON write
        FUNT_CONTACT_PERSON;
    property UNT_DESCRIPTION: string read FUNT_DESCRIPTION write FUNT_DESCRIPTION;
    property UNT_EMAIL: string read FUNT_EMAIL write FUNT_EMAIL;
    property UNT_ADR: string read FUNT_ADR write FUNT_ADR;
    property UNT_FAX: string read FUNT_FAX write FUNT_FAX;
    property UNT_ISGRALLOWED: Integer read FUNT_ISGRALLOWED write FUNT_ISGRALLOWED;
    property UNT_IS_ACTIVE: Integer read FUNT_IS_ACTIVE write FUNT_IS_ACTIVE;
    property UNT_IS_ALLOWPO: Integer read FUNT_IS_ALLOWPO write FUNT_IS_ALLOWPO;
    property KABUPATEN: TModKabupaten read FKABUPATEN write FKABUPATEN;
    property UNT_NAME: string read FUNT_NAME write FUNT_NAME;
    property UNT_PARENT: TModUnit read FUNT_PARENT write FUNT_PARENT;
    property UNT_PHONE: string read FUNT_PHONE write FUNT_PHONE;
    property UNT_RGN_CODE: string read FUNT_RGN_CODE write FUNT_RGN_CODE;



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
  FreeAndNil(FREF_TIPE_PERUSAHAAN);
  FreeAndNil(FAUTAPP);
  FreeAndNil(FKABUPATEN);

end;

class function TModUnit.GetTableName: String;
begin
  Result := 'AUT$UNIT';
end;

procedure TModUnit.SetUNT_NPWP_ADR(const Value: string);
begin
  FUNT_NPWP_ADR := Value;
end;

class function TModUnitType.GetTableName: String;
begin
  Result := 'UNIT_TYPE';
end;

initialization
  TModUnit.RegisterRTTI;

end.
