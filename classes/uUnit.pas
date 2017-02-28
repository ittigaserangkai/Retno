unit uUnit;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uCompany, uRetnoUnit, UTSBaseClass, StdCtrls, cxButtonEdit;

type

  TUnitInfo = class(TSBaseClass)
  private
    FID             : Integer;
    FUnitID         : Integer;
    FAddress        : string;
    FNpWp           : string;
    FNpwpAdr        : string;
    FNpwpNm         : string;
    FNpwpRegs       : TDateTime;
    FPrshTypeID     : Integer;
    FDATE_CREATE    : TDateTime;
    FOpc            : Integer;
    FOpcUnit        : Integer;
    FDATE_MODIFY    : TDateTime;
    FOpm            : Integer;
    FOpmUnit        : Integer;
    FPrshType : integer;//TnewTipePerusahaan;

    procedure ClearProperties;
    function FLoadFromDB(aSQL : string): Boolean;
    function GenerateSQL: TStrings;
    function GetPrshType: integer;//TnewTipePerusahaan;

    procedure UpdateData(aID : Integer; aUnitID: integer; aLoginId: Integer;
        aLoginUnitId: Integer; aPrshTypeId : integer; aAdr : string; aNpwp :
        string; aNpwpNm : string; aNpwpAdr: string; aNpwpDtRegs: TDateTime);

  public

    constructor Create(AOwner : TComponent); override;
    constructor CreateWithUser(AOwner : TComponent; AUserID: Integer);
    function GetFieldNameFor_Address: string; dynamic;
    function GetFieldNameFor_OPC_UNIT: string; dynamic;
    function GetFieldNameFor_OPM_UNIT: string; dynamic;
    function GetFieldNameFor_OP_CREATE: string; dynamic;
    function GetFieldNameFor_OP_MODIFY: string; dynamic;
    function GetFieldNameFor_DATE_CREATE: string;dynamic;
    function GetFieldNameFor_DATE_MODIFY: string; dynamic;
    function GetFieldNameFor_ID: string; dynamic;
    function GetFieldNameFor_NpWp: string; dynamic;
    function GetFieldNameFor_PrshTypeID: string; dynamic;
    function CustomTableName: string; dynamic;
    function GetFieldNameFor_NpWpAdr: string; dynamic;
    function GetFieldNameFor_NpWpNm: string; dynamic;
    function GetFieldNameFor_NpWpRegs: string; dynamic;
    function GetFieldNameFor_UnitID: string; dynamic;
    function GetGeneratorName: string; dynamic;
    function LoadByKode(aUnitID: integer): Boolean;
    property ID:Integer read FID write FID;
    property Address:string read FAddress write FAddress;
    property Npwp:string read FNpWp write FNpWp;
    property NpwpAdr:string read FNpwpAdr write FNpwpAdr;
    property NpwpNm:string read FNpwpNm write FNpwpNm;
    property NpwpRegs:TDateTime read FNpwpRegs write FNpwpRegs;
    property PrshType: integer{TnewTipePerusahaan} read GetPrshType write FPrshType;
    property PrshTypeID:Integer read FPrshTypeID write FPrshTypeID;


  end;


  TUnit = class(TSBaseClass)
  private
    FAppID          : Integer;
    FCompany        : TCompany;
    FCompanyID      : Integer;
    FDescription    : string;
    FID             : Integer;
    FKode           : string;
    FNama           : string;
    FisAllowPo: Integer;
    FUnitTypeID     : string;
    FParentID       : Integer;
    Fzip            : string;
    FPhone          : string;
    FFax            : string;
    FContact        : string;
    FEmail          : string;
    FOpc            : Integer;
    FOpcUnit        : Integer;
    FOpm            : Integer;
    FOpmUnit        : Integer;
    FPropId         : integer;
    FKabID          : string;
    FRegionID       : string;
    FDATE_CREATE    : TDateTime;
    FDATE_MODIFY    : TDateTime;
    FApp            : integer;//TApp;
    FIsActive: Integer;
    FIsGRAllowed: Integer;
    FIsHO: Integer;
    FIsSTORE: Integer;
    FProp           : integer;//TPropinsi;
    FRegn           : integer;//TRegion;
    FKab            : integer;//TKabupaten;
    FUnitInfo       : TUnitInfo;
    FUnitType       : integer;//TUnitType;


    function FLoadFromDB( aSQL : String ): Boolean;
    function GetCompany: TCompany;
    function GetApp: integer;//TApp;
    function GetKab: integer;//TKabupaten;
    function GetProp: integer;//TPropinsi;
    function GetRegn: integer;//TRegion;
    function GetUnitInfo: TUnitInfo;
    function GetUnitType: integer;//TUnitType;
  public
    constructor Create(aOwner : TComponent); override;
    constructor CreateWithUser(AOwner : TComponent; AUserID: Integer);
    destructor Destroy; override;
    procedure ClearProperties;
    function ExecuteCustomSQLTask: Boolean;
    function ExecuteCustomSQLTaskPrior: Boolean;
    function CustomTableName: string;
    function GenerateInterbaseMetaData: Tstrings;
    function GenerateSQL: TStrings;
    function GetFieldNameFor_AllowPo: string; dynamic;
    function GetFieldNameFor_AllowGR: string; dynamic;
    function GetFieldNameFor_IsHO: string; dynamic;
    function GetFieldNameFor_IsStore: string; dynamic;
    function GetFieldNameFor_AppID: string; dynamic;
    function GetFieldNameFor_Company: string; dynamic;
    function GetFieldNameFor_Contact: string; dynamic;
    function GetFieldNameFor_Description: string; dynamic;
    function GetFieldNameFor_ID: string; dynamic;
    function GetFieldNameFor_KabID: string; dynamic;
    function GetFieldNameFor_Kode: string; dynamic;
    function GetFieldNameFor_Nama: string; dynamic;
    function GetFieldNameFor_IsActive: string;

    function GetFieldNameFor_OPC_UNIT: string; dynamic;
    function GetFieldNameFor_OPM_UNIT: string; dynamic;
    function GetFieldNameFor_OP_CREATE: string; dynamic;
    function GetFieldNameFor_OP_MODIFY: string; dynamic;
    function GetFieldNameFor_PropID: string; dynamic;
    function GetFieldNameFor_Region: string; dynamic;
    function GetFieldNameFor_DATE_CREATE: string;dynamic;
    function GetFieldNameFor_DATE_MODIFY: string; dynamic;
    function GetFieldNameFor_Email: string; dynamic;
    function GetFieldNameFor_Fax: string; dynamic;
    function GetFieldNameFor_ParentID: string; dynamic;
    function GetFieldNameFor_Phone: string; dynamic;
    function GetFieldNameFor_Type: string; dynamic;
    function GetFieldNameFor_ZIP: string; dynamic;

    function GetGeneratorName: string;
    function GetHeaderFlag: Integer;
    function LoadByID( aID : Integer ): Boolean;
    function LoadByKode( aKode : string): Boolean;
//    class function GetRec(acOMpId: Integer; aUnitID : Integer = 0): TFDQuery;
    procedure GetRecCompany(var Code: TcxButtonEdit; var Nm: TEdit);
    procedure GetRecApp(var Code: TcxButtonEdit; var Nm: TEdit);
    procedure GetRecPrshType(var Code: TcxButtonEdit; var Nm: TEdit);
    procedure GetRecKab(var Code: TcxButtonEdit; var Nm: TEdit; APropId: Integer); overload;
    procedure GetRecKab(APropId: Integer; var Code: TcxButtonEdit; var Nm: TEdit); overload;
    procedure GetRecProp(var Code: TcxButtonEdit; var Nm: TEdit);
    procedure GetRecRegn(var Code: TcxButtonEdit; var Nm: TEdit);
    procedure GetRecUnitType(var Code: TcxButtonEdit; var Nm: TEdit);

    function SaveToDB: Boolean;

    procedure UpdateData(aAppID, aCompany_ID: Integer; aDescription: String; aID:
        Integer; aKode, aNama: string; aIsAllowPO, aIsAllowGR: Boolean; aHoStWh:
        Integer; aUnitTypeId: string; aParentID: integer; aZip, aPhone, aFax,
        aContact, aEmail: string; aPropID: Integer; aKabId, aRegionID: string;
        aLoginID, aLonginUntID, aPrshTypeId: integer; aAdr, aNpwp, aNpwpNm,
        aNpwpAdr: string; aNpwpDtRegs: TDateTime; aIsActive: integer);
    property AppID: Integer read FAppID write FAppID;
    property Company: TCompany read GetCompany write FCompany;
    property Description: string read FDescription write FDescription;
    property ID: Integer read FID write FID;
    property Kode: string read FKode write FKode;
    property Nama: string read FNama write FNama;
    property isAllowPo: Integer read FisAllowPo write FisAllowPo;
    property UnitTypeID: string read FUnitTypeID write FUnitTypeID;
    property ParentID: Integer  read FParentID write FParentID;
    property Zip: string  read Fzip write Fzip;
    property Phone: string  read FPhone write FPhone;
    property Fax: string read FFax write FFax;
    property Contact: string read FContact write FContact;
    property Email: string  read FEmail write FEmail;
//    property App: TApp read GetApp write FApp;
    property IsActive: Integer read FIsActive write FIsActive;
    property IsGRAllowed: Integer read FIsGRAllowed write FIsGRAllowed;
    property IsHO: Integer read FIsHO write FIsHO;
    property IsSTORE: Integer read FIsSTORE write FIsSTORE;
    property Kab: integer{TKabupaten} read GetKab write FKab;
    property Prop: integer{TPropinsi} read GetProp write FProp;
    property Regn: integer{TRegion} read GetRegn write FRegn;
    property UnitInfo: TUnitInfo read GetUnitInfo write FUnitInfo;
    property UnitType: integer{TUnitType} read GetUnitType write FUnitType;
//    property UnitInfo: TUnitInfo read GetUntiInfo write FUnitInfo;

  end;



implementation

uses Math;


{
************************************ TUnit *************************************
}
constructor TUnit.Create(aOwner : TComponent);
begin
  inherited create(aOwner);
  ClearProperties;
end;

constructor TUnit.CreateWithUser(AOwner : TComponent; AUserID: Integer);
begin
  Create(AOwner);
  FOpm := AUserID;
end;

destructor TUnit.Destroy;
begin
   ClearProperties;
   inherited Destroy;
end;

procedure TUnit.ClearProperties;
begin
  AppID := 0;

  FCompanyID := 0;
  if FCompany <> nil then
    FreeAndNil(FCompany);

  if FUnitInfo <> nil then
    FreeAndNil(FunitInfo);

  FPropId := 0;
//  if FProp <> nil then
//      FreeAndNil(FProp);

  FKabID  := '0';
//  if FKab <> nil then
//    FreeAndNil(FKab);

  FRegionID := '';
//  if FRegn <> nil then
//    FreeAndNil(FRegn);

  FAppID          := 0;
//  if FApp <> nil then
//    FreeAndNil(FApp);

  FDescription    := '';
  FID             := 0;
  FKode           := '';
  FNama           := '';
  FisAllowPo      := 0;
  FIsGRAllowed    := 0;
  FIsHO           := 0;
  FIsSTORE        := 0;

  FUnitTypeID     := '';
  FParentID       := 0;
  Fzip            := '';
  FPhone          := '';
  FFax            := '';
  FContact        := '';
  FEmail          := '';
  FOpc        := 0;
  FOpcUnit     := 0;
  FOpm         := 0;
  FOpmUnit      := 0;

end;

function TUnit.ExecuteCustomSQLTask: Boolean;
begin
  result := True;
end;

function TUnit.ExecuteCustomSQLTaskPrior: Boolean;
begin
  result := True;
end;

function TUnit.CustomTableName: string;
begin
  result := 'AUT$UNIT';
end;

function TUnit.FLoadFromDB( aSQL : String ): Boolean;
begin
  result := false;
  State := csNone;

  ClearProperties;
{  with cOpenQuery(aSQL) do
  Begin
      if not EOF then
      begin
         FAppID       := FieldByName(GetFieldNameFor_AppID).asInteger;
         FCompanyID   := FieldByName(GetFieldNameFor_Company).asInteger;
         FDescription := FieldByName(GetFieldNameFor_Description).AsString;
         FID          := FieldByName(GetFieldNameFor_ID).asInteger;
         FKode        := FieldByName(GetFieldNameFor_Kode).asString;
         FNama        := FieldByName(GetFieldNameFor_Nama).asString;
         FRegionID    := FieldByName(GetFieldNameFor_Region).asString;
         FPropId      := FieldByName(GetFieldNameFor_PropID).AsInteger;
         FKabID       := FieldByName(GetFieldNameFor_KabID).AsString;

         FisAllowPo   := FieldByName(GetFieldNameFor_AllowPo).AsInteger;
         FIsGRAllowed := FieldByName(GetFieldNameFor_AllowGR).AsInteger;
         FIsHO        := FieldByName(GetFieldNameFor_IsHO).AsInteger;
         FIsSTORE     := FieldByName(GetFieldNameFor_IsStore).AsInteger;
         FIsActive    := FieldByName(GetFieldNameFor_IsActive).AsInteger;

         FUnitTypeID  := FieldByName(GetFieldNameFor_Type).AsString;
         FParentID    := FieldByName(GetFieldNameFor_ParentID).AsInteger;
         Fzip         := FieldByName(GetFieldNameFor_ZIP).AsString;
         FPhone       := FieldByName(GetFieldNameFor_Phone).AsString;
         FFax         := FieldByName(GetFieldNameFor_Fax).AsString;
         FContact     := FieldByName(GetFieldNameFor_Contact).AsString;
         FEmail       := FieldByName(GetFieldNameFor_Email).AsString;


         FOpc     := FieldByName(GetFieldNameFor_OP_CREATE).AsInteger;
         FOpcUnit  := FieldByName(GetFieldNameFor_OPC_UNIT).AsInteger;
         FOpm      := FieldByName(GetFieldNameFor_OP_MODIFY).AsInteger;
         FOpmUnit   := FieldByName(GetFieldNameFor_OPM_UNIT).AsInteger;


         Self.State := csLoaded;
         Result := True;
      end;
      Free;
  End;
  }
end;

function TUnit.GenerateInterbaseMetaData: Tstrings;
begin
  result := TstringList.create;
  result.Append( '' );
  result.Append( 'Create Table TUnit ( ' );
  result.Append( 'TSBaseClass_ID Integer not null, ' );
  result.Append( 'AppID   Integer Not Null , ' );
  result.Append( 'Company_ID Integer Not Null, ' );
  result.Append( 'Description   Integer Not Null , ' );
  result.Append( 'ID   Integer Not Null  Unique, ' );
  result.Append( 'Kode   Varchar(30) Not Null  Unique, ' );
  result.Append( 'Nama   Varchar(30) Not Null , ' );
  result.Append( 'Stamp TimeStamp ' );
  result.Append( ' ); ' );
end;

function TUnit.GenerateSQL: TStrings;
var
  S         : string;
begin
  Result := TStringList.Create;

  if State = csNone then
  Begin
     raise Exception.create('Tidak bisa generate dalam Mode csNone')
  end;

  if not ExecuteCustomSQLTaskPrior then
  begin
//    cRollbackTrans;
    Exit;
  end
  else
  begin

{    FDATE_MODIFY  := cGetServerTime;

    If FID <= 0 then
    begin
      FDATE_CREATE  := FDATE_MODIFY;
      FID           := cGetNextID(GetGeneratorName);
      FOpc          := FOpm;
      FOpcUnit      := FOpmUnit;
      FUnitInfo.FUnitID := FID;

      S := 'Insert into ' + CustomTableName
          + ' ( '+ GetFieldNameFor_AppID + ', ' + GetFieldNameFor_Company
          + ', ' + GetFieldNameFor_Description + ', '+ GetFieldNameFor_ID
          + ', ' + GetFieldNameFor_Kode + ', ' + GetFieldNameFor_Nama

          + ', ' + GetFieldNameFor_AllowPo
          + ', ' + GetFieldNameFor_AllowGR
          + ', ' + GetFieldNameFor_IsHO
          + ', ' + GetFieldNameFor_IsStore
          + ', ' + GetFieldNameFor_Type
          + ', ' + GetFieldNameFor_ParentID
          + ', ' + GetFieldNameFor_ZIP + ', ' + GetFieldNameFor_Phone
          + ', ' + GetFieldNameFor_Fax + ', ' + GetFieldNameFor_Contact
          + ', ' + GetFieldNameFor_Email

          + ', ' + GetFieldNameFor_DATE_CREATE
          + ', ' + GetFieldNameFor_OP_CREATE + ', '+ GetFieldNameFor_OPC_UNIT
          + ', ' + GetFieldNameFor_DATE_MODIFY + ', ' + GetFieldNameFor_OP_MODIFY
          + ', ' + GetFieldNameFor_OPM_UNIT
          + ', ' + GetFieldNameFor_Region + ', ' + GetFieldNameFor_PropID
          + ', ' + GetFieldNameFor_KabID + ', '+ GetFieldNameFor_IsActive

          + ') values ('
          + IntToStr( FAppID) + ', '
          + InttoStr(FCompanyID) + ', '
          + Quot( FDescription) + ', '
          + IntToStr( FID) + ', '
          + Quot(FKode ) + ', '
          + Quot(FNama ) + ', '

          + IntToStr(FisAllowPo) + ', '
          + IntToStr(FIsGRAllowed) + ', '
          + IntToStr(FIsHO) + ', '
          + IntToStr(FIsSTORE) + ', '
        + Quot(FUnitTypeID) + ', '
        + IntToStr(FParentID) + ', '
        + Quot(Fzip) + ', '+ Quot(FPhone) + ', '+ Quot(FFax) + ', '
        + Quot(FContact) + ', '+ Quot(FEmail) + ', '


          + QuotDT(FDATE_CREATE) + ', '
          + IntToStr(FOpc) + ', '
          + IntToStr(FOpcUnit) + ', '
          + QuotDT(FDATE_MODIFY) + ', '
          + IntToStr(FOpm) + ', '
          + IntToStr(FOpmUnit) + ', '
          + Quot(FRegionID)  + ', '
          + IntToStr(FPropId)  + ', '
          + Quot(FKabID)  + ', '
          + IntToStr(FIsActive)

          + ');'
    end
    else
    begin
      S := 'Update ' + CustomTableName
           + ' set '+ GetFieldNameFor_AppID + ' = ' + IntToStr( FAppID)
           + ', ' + GetFieldNameFor_Company + ' = ' + IntToStr( FCompanyID)
           + ', ' + GetFieldNameFor_Description + ' = ' + Quot( FDescription)
           + ', ' + GetFieldNameFor_Kode + ' = ' + Quot( FKode )
           + ', ' + GetFieldNameFor_Nama + ' = ' + Quot( FNama )

          + ', ' + GetFieldNameFor_AllowPo + ' = ' + IntToStr(FisAllowPo)
          + ', ' + GetFieldNameFor_AllowGR + ' = ' + IntToStr(FIsGRAllowed)
          + ', ' + GetFieldNameFor_IsHO + ' = ' + IntToStr(FIsHO)
          + ', ' + GetFieldNameFor_IsStore + ' = ' + IntToStr(FIsSTORE)
          + ', ' + GetFieldNameFor_Type + ' = ' + Quot(FUnitTypeID)
          + ', ' + GetFieldNameFor_ParentID + ' = ' + IntToStr(FParentID)
          + ', ' + GetFieldNameFor_ZIP + ' = ' + Quot(Fzip)
          + ', ' + GetFieldNameFor_Phone + ' = ' + Quot(FPhone)
          + ', ' + GetFieldNameFor_Fax + ' = ' + Quot(FFax)
          + ', ' + GetFieldNameFor_Contact + ' = ' + Quot(FContact)
          + ', ' + GetFieldNameFor_Email + ' = ' + Quot(FEmail)

           + ', ' + GetFieldNameFor_DATE_MODIFY + ' = ' + QuotDT(FDATE_MODIFY)
           + ', ' + GetFieldNameFor_OP_MODIFY + ' = ' + IntToStr(FOpm)
           + ', ' + GetFieldNameFor_OPM_UNIT + ' = ' + IntToStr(FOpmUnit)
           + ', ' + GetFieldNameFor_Region + ' = ' + Quot( FRegionID )
           + ', ' + GetFieldNameFor_PropID + ' = ' + IntToStr(FPropId)
           + ', ' + GetFieldNameFor_KabID + ' = ' +  quot(FKabID)
           + ', ' + GetFieldNameFor_IsActive + ' = '+ IntToStr(FIsActive)

           + ' Where  ' + GetFieldNameFor_ID + ' = ' + IntToStr(FID) + ';';
    end;
}
//    if not cExecSQL(S, False) then
//    begin
//      cRollbackTrans;
//      Exit;
//    end
//    else
//      Result := ExecuteGenerateSQL;

  end;

  Result.Append(S);

end;

function TUnit.GetCompany: TCompany;
begin
  if FCompany = nil then
  begin
    FCompany := TCompany.Create(Self);
    FCompany.LoadByID(FCompanyID);
  end;
  Result := FCompany;
end;

function TUnit.GetApp: integer;//TApp;
begin
//  if FApp = nil then
  begin
//    FApp  := TApp.Create(nil);
//    FApp.LoadByID(FAppID);
  end;
  Result := FApp;
end;

function TUnit.GetFieldNameFor_AllowPo: string;
begin
  Result := 'UNT_IS_ALLOWPO';
end;

function TUnit.GetFieldNameFor_AllowGR: string;
begin
  Result := 'UNT_ISGRALLOWED';
end;

function TUnit.GetFieldNameFor_IsHO: string;
begin
  Result := 'UNT_IS_HO';
end;

function TUnit.GetFieldNameFor_IsStore: string;
begin
  Result := 'UNT_IS_STORE';
end;

function TUnit.GetFieldNameFor_AppID: string;
begin
  Result := 'UNT_APP_ID';// <<-- Rubah string ini untuk mapping
end;

function TUnit.GetFieldNameFor_Company: string;
begin
  Result := 'UNT_COMP_ID';// <<-- Rubah string ini untuk mapping
end;

function TUnit.GetFieldNameFor_Contact: string;
begin
  Result := 'UNT_CONTACT_PERSON';
end;

function TUnit.GetFieldNameFor_Description: string;
begin
  Result := 'UNT_DESCRIPTION';// <<-- Rubah string ini untuk mapping
end;

function TUnit.GetFieldNameFor_ID: string;
begin
  Result := 'UNT_ID';// <<-- Rubah string ini untuk mapping
end;

function TUnit.GetFieldNameFor_KabID: string;
begin
  result := 'UNT_KAB_ID'
end;

function TUnit.GetFieldNameFor_Kode: string;
begin
  Result := 'UNT_CODE';// <<-- Rubah string ini untuk mapping
end;

function TUnit.GetFieldNameFor_Nama: string;
begin
  Result := 'UNT_NAME';// <<-- Rubah string ini untuk mapping
end;

function TUnit.GetFieldNameFor_IsActive: string;
begin
  Result := 'UNT_IS_ACTIVE';
end;


function TUnit.GetFieldNameFor_OPC_UNIT: string;
begin
  Result := 'OPC_UNIT';
end;

function TUnit.GetFieldNameFor_OPM_UNIT: string;
begin
  Result := 'OPM_UNIT';
end;

function TUnit.GetFieldNameFor_OP_CREATE: string;
begin
  Result := 'OP_CREATE';
end;

function TUnit.GetFieldNameFor_OP_MODIFY: string;
begin
  Result := 'OP_MODIFY';
end;

function TUnit.GetFieldNameFor_PropID: string;
begin
  result := 'UNT_PROP_ID';
end;

function TUnit.GetFieldNameFor_Region: string;
begin
  result := 'UNT_RGN_CODE';
end;

function TUnit.GetFieldNameFor_DATE_CREATE: string;
begin
  Result := 'DATE_CREATE';
end;

function TUnit.GetFieldNameFor_DATE_MODIFY: string;
begin
  Result := 'DATE_MODIFY';
end;

function TUnit.GetFieldNameFor_Email: string;
begin
  Result := 'UNT_EMAIL';
end;

function TUnit.GetFieldNameFor_Fax: string;
begin
  Result := 'UNT_FAX';
end;

function TUnit.GetFieldNameFor_ParentID: string;
begin
  Result := 'UNT_PARENT_ID';
end;

function TUnit.GetFieldNameFor_Phone: string;
begin
  Result := 'UNT_PHONE';
end;

function TUnit.GetFieldNameFor_Type: string;
begin
  Result := 'UNT_TYPE';
end;

function TUnit.GetFieldNameFor_ZIP: string;
begin
  Result := 'UNT_ZIP';
end;

function TUnit.GetGeneratorName: string;
begin
  Result := 'gen_aut$unit_id';
end;

function TUnit.GetHeaderFlag: Integer;
begin
  result := 504;
end;

//function TUnit.GetKab: TKabupaten;
//begin
//  // TODO -cMM: TUnit.GetKab default body inserted
//  Result := ;
//end;

//function TUnit.GetProp: TPropinsi;
//begin
//  Result := FProp;
//end;

function TUnit.LoadByID( aID : Integer ): Boolean;
begin
  result := FloadFromDB('Select * from ' + CustomTableName + ' Where ' + GetFieldNameFor_ID + ' = ' + IntToStr(aID) );
end;

function TUnit.LoadByKode( aKode : string): Boolean;
begin
  result := FloadFromDB('Select * from ' + CustomTableName + ' Where ' + GetFieldNameFor_Kode + ' = ' + QuotedStr(aKode));
end;

procedure TUnit.UpdateData(aAppID, aCompany_ID: Integer; aDescription: String;
    aID: Integer; aKode, aNama: string; aIsAllowPO, aIsAllowGR: Boolean;
    aHoStWh: Integer; aUnitTypeId: string; aParentID: integer; aZip, aPhone,
    aFax, aContact, aEmail: string; aPropID: Integer; aKabId, aRegionID:
    string; aLoginID, aLonginUntID, aPrshTypeId: integer; aAdr, aNpwp, aNpwpNm,
    aNpwpAdr: string; aNpwpDtRegs: TDateTime; aIsActive: integer);
var
  aUnitInfo : Integer;

begin
  FAppID        := aAppID;
  FCompanyID    := aCompany_ID;
  FDescription  := aDescription;
  FID           := aID;
  FKode         := trim(aKode);
  FNama         := trim(aNama);

  FisAllowPo      := IfThen(aIsAllowPo, 1, 0);
  FIsGRAllowed    := IfThen(aIsAllowGR, 1, 0);

  if aHoStWh = 0 then
  begin
    FIsHO     := 1;
    FIsSTORE  := 0;
  end
  else if aHoStWh = 1 then
  begin
    FIsHO     := 0;
    FIsSTORE  := 1;
  end
  else if aHoStWh = 2 then
  begin
    FIsHO     := 1;
    FIsSTORE  := 1;
  end;

  FUnitTypeID     := Trim(aUnitTypeId);
  FParentID       := aParentID;
  Fzip            := Trim(aZip);
  FPhone          := Trim(aPhone);
  FFax            := Trim(aFax);
  FContact        := Trim(aContact);
  FEmail          := Trim(aEmail);
  FPropId         := aPropID;
  FKabID          := Trim(aKabId);
  FRegionID       := Trim(aRegionID);
  FOpm            := aLoginID;
  FOpmUnit        := aLonginUntID;

  //cek update // insert data
  if aID > 0 then
  begin
    FUnitInfo.LoadByKode(FID);
    aUnitInfo := FUnitInfo.FID;
  end
  else
    aUnitInfo := 0;

  FIsActive := aIsActive;

  FUnitInfo.UpdateData(aUnitInfo, aID, FOpm, aLonginUntID, aPrshTypeId, aAdr, aNpwp, aNpwpNm,
                      aNpwpAdr, aNpwpDtRegs);

  State := csCreated;
end;

{class function TUnit.GetRec(acOMpId: Integer; aUnitID : Integer = 0): TFDQuery;
var
  sSQL  : string;
begin
  sSQL := ' select u.unt_id, u.unt_code, u.unt_name,u.unt_phone, u.unt_description, u.UNT_IS_ACTIVE,'
        + ' ui.uti_address, ui.uti_npwp, tp.tppersh_id, tp.tppersh_code,'
        + ' tp.tppersh_name'
        + ' from aut$unit u'
        + ' left join unit_info ui on u.unt_id=ui.uti_unt_id'
        + ' left join ref$tipe_perusahaan tp on ui.uti_tppersh_id=tp.tppersh_id'
        + ' left join company c on u.unt_comp_id=c.comp_id';

  if acOMpId > 0 then
    sSQL := sSQL + ' AND c.comp_id = ' + IntToStr(acOMpId) ;

  if aUnitID > 0 then
    sSQL := sSQL + ' AND u.unt_id = '+ IntToStr(aUnitID);

  Result  := cOpenQuery(sSQL);
end;
}

function TUnit.GetKab: integer;//TKabupaten;
begin
//  if FKab = nil then
  begin
//    FKab  := TKabupaten.Create(nil);
//    FKab.LoadByID(FPropId, FKabID);
  end;
  Result := FKab;
end;

function TUnit.GetProp: integer;//TPropinsi;
begin
//  if FProp = nil then
  begin
//    FProp := TPropinsi.Create(nil);
//    FProp.LoadByID(FPropId);
  end;
  Result := FProp;
end;

function TUnit.GetRegn: integer;//TRegion;
begin
//  if FRegn = nil then
  begin
//    FRegn := TRegion.Create(nil);
//    FRegn.LoadByID(FRegionID);
  end;
  Result := FRegn;
end;


procedure TUnit.GetRecCompany(var Code: TcxButtonEdit; var Nm: TEdit);
begin
  Company.GetCurCompany(Code, Nm);
end;

procedure TUnit.GetRecApp(var Code: TcxButtonEdit; var Nm: TEdit);
begin
//  App.GetCurApp(Code, Nm);
end;

procedure TUnit.GetRecRegn(var Code: TcxButtonEdit; var Nm: TEdit);
begin
//  Regn.GetCurRegn(Code, Nm);
end;

procedure TUnit.GetRecProp(var Code: TcxButtonEdit; var Nm: TEdit);
begin
//  Prop.GetCurProp(Code, Nm);
end;

procedure TUnit.GetRecKab(var Code: TcxButtonEdit; var Nm: TEdit; APropId: Integer);
begin
//  Kab.GetCurKab(Code, Nm, APropId);
end;

procedure TUnit.GetRecKab(APropId: Integer; var Code: TcxButtonEdit; var Nm: TEdit);
begin
  inherited;
//    Kab.GetCurKab(APropId, Code, Nm);
end;

procedure TUnit.GetRecPrshType(var Code: TcxButtonEdit; var Nm: TEdit);
begin
//  UnitInfo.PrshType.GetCurPrshTipe(Code, Nm);
end;

procedure TUnit.GetRecUnitType(var Code: TcxButtonEdit; var Nm: TEdit);
begin
//  UnitType.GetCurUnitType(Code, Nm);
end;

function TUnit.GetUnitInfo: TUnitInfo;
begin
  if FUnitInfo = nil then
  begin
    FUnitInfo := TUnitInfo.CreateWithUser(nil, FOpm);
    FUnitInfo.LoadByKode(FID);
  end;
  Result := FUnitInfo;
end;

function TUnit.GetUnitType: integer;//TUnitType;
begin
//  if FUnitType = nil then
  begin
//    FUnitType := TUnitType.Create(nil);
//    FUnitType.LoadByID(FUnitTypeID);
  end;
  Result := FUnitType;
end;



function TUnit.SaveToDB: Boolean;
var
  ssSQL : TStrings;
  i     : Integer;
begin
  Result := False;
  try
    ssSQL := GenerateSQL();
//    for i := FUnitInfo.
    with FUnitInfo.GenerateSQL do
    begin
      try
        for i := 0 to Count - 1 do
        begin
          ssSQL.Append(Strings[i]);
        end;
      finally
        Free;
      end;
    end;

    try
//      if kExecuteSQLs( GetHeaderFlag ,ssSQL) then
//        if SimpanBlob(ssSQL,GetHeaderFlag) then
          Result := True;
    except
    end;
  finally
    FreeAndNil(ssSQL);
  end;
end;

constructor TUnitInfo.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  ClearProperties;
end;

constructor TUnitInfo.CreateWithUser(AOwner : TComponent; AUserID: Integer);
begin
  Create(AOwner);
  FOpm := AUserID;
end;

procedure TUnitInfo.ClearProperties;
begin
  FID           := 0;
  FUnitID       := 0;
  FAddress      := '';
  FNpWp         := '';

  FPrshTypeID   := 0;
//  if FPrshType <> nil then
//    FreeAndNil(FPrshType);

  FDATE_CREATE  := 0;
  FDATE_MODIFY  := 0;
  FOpc          := 0;
  FOpcUnit      := 0;
  FOpm          := 0;
  FOpmUnit      := 0;
end;

function TUnitInfo.FLoadFromDB(aSQL : string): Boolean;
begin
  Result := False;
  State := csNone;

  ClearProperties;
{  with cOpenQuery(aSQL) do
  Begin
      if not EOF then
      begin
         FID          := FieldByName(GetFieldNameFor_ID).asInteger;
         FUnitID      := FieldByName(GetFieldNameFor_UnitID).asInteger;
         FPrshTypeID  := FieldByName(GetFieldNameFor_PrshTypeID).AsInteger;
         FAddress     := FieldByName(GetFieldNameFor_Address).AsString;
         FNpWp        := FieldByName(GetFieldNameFor_NpWp).asString;
         FNpwpNm      := FieldByName(GetFieldNameFor_NpWpNm).asString;
         FNpwpAdr     := FieldByName(GetFieldNameFor_NpWpAdr).asString;
         FNpwpRegs    := FieldByName(GetFieldNameFor_NpWpRegs).AsDateTime;
         FOpc         := FieldByName(GetFieldNameFor_OP_CREATE).asInteger;
         FOpm         := FieldByName(GetFieldNameFor_OP_MODIFY).AsInteger;
         FOpcUnit     := FieldByName(GetFieldNameFor_OPC_UNIT).AsInteger;
         FOpmUnit     := FieldByName(GetFieldNameFor_OPM_UNIT).AsInteger;

         Self.State := csLoaded;
         Result := True;
      end;
      Free;
  End;
}

end;

function TUnitInfo.GenerateSQL: TStrings;
var
  S : string;
begin

  Result := TStringList.Create;
  if State = csNone then
  Begin
     raise Exception.create('Tidak bisa generate dalam Mode csNone')

  end
  else
  begin

{    FDATE_MODIFY  := cGetServerTime;
    If FID <= 0 then
    begin
      FDATE_CREATE  := FDATE_MODIFY;
      FID           := cGetNextID(GetGeneratorName);
      FOpc          := FOpm;
      FOpcUnit      := FOpmUnit;

      S := 'Insert into ' + CustomTableName
          + ' ( ' + GetFieldNameFor_ID + ', ' + GetFieldNameFor_UnitID
          + ', ' + GetFieldNameFor_PrshTypeID+ ', ' + GetFieldNameFor_Address
          + ', ' + GetFieldNameFor_NpWp + ', ' + GetFieldNameFor_NpWpNm
          + ', ' + GetFieldNameFor_NpWpAdr + ', '+ GetFieldNameFor_NpWpRegs
          + ', ' + GetFieldNameFor_DATE_CREATE
          + ', ' + GetFieldNameFor_OP_CREATE + ', '+ GetFieldNameFor_OPC_UNIT
          + ', ' + GetFieldNameFor_DATE_MODIFY + ', ' + GetFieldNameFor_OP_MODIFY
          + ', ' + GetFieldNameFor_OPM_UNIT
          + ') values ('
          + IntToStr(FID) + ', '
          + InttoStr(FUnitID) + ', '
          + IntToStr(FPrshTypeID) + ', '
          + Quot(FAddress) + ', '
          + Quot(FNpWp ) + ', '
          + Quot(FNpwpNm) + ', '
          + Quot(FNpwpAdr) + ', '
          + QuotD(FNpwpRegs)+ ', '
          + QuotDT(FDATE_CREATE) + ', '
          + IntToStr(FOpc) + ', '
          + IntToStr(FOpcUnit) + ', '
          + QuotDT(FDATE_MODIFY) + ', '
          + IntToStr(FOpm) + ', '
          + IntToStr(FOpmUnit)
          + ');'
    end
    else
    begin
      S := 'Update ' + CustomTableName + ' set '
            + GetFieldNameFor_UnitID + ' = ' + IntToStr(FUnitID)
            + ', ' + GetFieldNameFor_PrshTypeID + ' = ' + IntToStr(FPrshTypeID)
            + ', ' + GetFieldNameFor_Address + ' = ' + Quot(FAddress)
            + ', ' + GetFieldNameFor_NpWp + ' = ' + Quot(FNpWp )
            + ', ' + GetFieldNameFor_NpWpNm + ' = ' + Quot(FNpwpNm )
            + ', ' + GetFieldNameFor_NpWpAdr + ' = ' + Quot(FNpwpAdr )
            + ', ' + GetFieldNameFor_NpWpRegs + ' = ' + QuotD(FNpwpRegs)
            + ', ' + GetFieldNameFor_DATE_MODIFY + ' = ' + QuotDT(FDATE_MODIFY)
            + ', ' + GetFieldNameFor_OP_MODIFY + ' = ' + IntToStr(FOpm)
            + ', ' + GetFieldNameFor_OPM_UNIT + ' = ' + IntToStr(FOpmUnit)
           + ' Where  ' + GetFieldNameFor_ID + ' = ' + IntToStr(FID) + ';';
    end;
}  end;
  Result.Append(S);

end;

function TUnitInfo.CustomTableName: string;
begin
  Result := 'UNIT_INFO';
end;

function TUnitInfo.GetFieldNameFor_Address: string;
begin
  Result := 'UTI_ADDRESS';
end;

function TUnitInfo.GetFieldNameFor_OPC_UNIT: string;
begin
  Result := 'OPC_UNIT';
end;

function TUnitInfo.GetFieldNameFor_OPM_UNIT: string;
begin
  Result := 'OPM_UNIT';
end;

function TUnitInfo.GetFieldNameFor_OP_CREATE: string;
begin
  Result := 'OP_CREATE';
end;

function TUnitInfo.GetFieldNameFor_OP_MODIFY: string;
begin
  Result := 'OP_MODIFY';
end;

function TUnitInfo.GetFieldNameFor_DATE_CREATE: string;
begin
  Result := 'DATE_CREATE';
end;

function TUnitInfo.GetFieldNameFor_DATE_MODIFY: string;
begin
  Result := 'DATE_MODIFY';
end;

function TUnitInfo.GetFieldNameFor_ID: string;
begin
    Result := 'UTI_ID';
end;

function TUnitInfo.GetFieldNameFor_NpWp: string;
begin
  Result := 'UTI_NPWP';
end;

function TUnitInfo.GetFieldNameFor_NpWpAdr: string;
begin
  Result := 'UTI_NPWP_Adr';
end;

function TUnitInfo.GetFieldNameFor_NpWpNm: string;
begin
  result := 'UTI_NPWP_Name';
end;

function TUnitInfo.GetFieldNameFor_NpWpRegs: string;
begin
  Result := 'UTI_NPWP_Regs';
end;

function TUnitInfo.GetFieldNameFor_PrshTypeID: string;
begin
  Result := 'UTI_TPPERSH_ID'
end;

function TUnitInfo.GetFieldNameFor_UnitID: string;
begin
 Result := 'UTI_UNT_ID'
end;


function TUnitInfo.GetGeneratorName: string;
begin
  Result := 'gen_' + CustomTableName + '_id';
end;

function TUnitInfo.GetPrshType: integer;//TnewTipePerusahaan;
begin
//  if FPrshType = nil then
  begin
//    FPrshType := TnewTipePerusahaan.Create(nil);
//    FPrshType.LoadByID(FPrshTypeID, FUnitID);
  end;
  Result := FPrshType;
end;

function TUnitInfo.LoadByKode(aUnitID: Integer): Boolean;
var
  sSQL : string;
begin
  sSQL    := 'SELECT * FROM '+ CustomTableName
          + ' WHERE '+ GetFieldNameFor_UnitID + ' = ' + IntToStr(aUnitID);

  Result := FloadFromDB(sSQL);

end;

procedure TUnitInfo.UpdateData(aID : Integer; aUnitID: integer; aLoginId:
    Integer; aLoginUnitId: Integer; aPrshTypeId : integer; aAdr : string; aNpwp
    : string; aNpwpNm : string; aNpwpAdr: string; aNpwpDtRegs: TDateTime);
begin
  FID           := aID;
  FUnitID       := aUnitID;
  FOpm          := aLoginId;
  FOpmUnit      := aLoginUnitId;
  FPrshTypeID   := aPrshTypeId;
  FAddress      := aAdr;
  FNpWp         := aNpwp;
  FNpwpAdr      := aNpwpAdr;
  FNpwpNm       := aNpwpNm;
  FNpwpRegs     := aNpwpDtRegs;



  State := csCreated;
end;

end.
