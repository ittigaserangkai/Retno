unit uModAuthUser;

interface

uses uModApp, System.Generics.Collections;

type
  TModAuthGroup = class;
  TModAuthUserGroup = class;

  TModAuthUser = class(TModApp)
  private
    FGroups: TObjectList<TModAuthUserGroup>;
    FMaxUbahPO: Integer;
    FOTOQTYSO: Integer;
    FUSR_FULLNAME: String;
    FUSR_USERNAME: String;
    FUSR_PASSWD: String;
    FUSR_STATUS: Integer;
    FUSR_DESCRIPTION: String;
    function GetGroups: TObjectList<TModAuthUserGroup>;
  public
    class function GetTableName: String; override;
    property Groups: TObjectList<TModAuthUserGroup> read GetGroups write FGroups;
  published
    property MaxUbahPO: Integer read FMaxUbahPO write FMaxUbahPO;
    property OTOQTYSO: Integer read FOTOQTYSO write FOTOQTYSO;
    property USR_FULLNAME: String read FUSR_FULLNAME write FUSR_FULLNAME;
    [AttributeOfCode]
    property USR_USERNAME: String read FUSR_USERNAME write FUSR_USERNAME;
    property USR_PASSWD: String read FUSR_PASSWD write FUSR_PASSWD;
    property USR_STATUS: Integer read FUSR_STATUS write FUSR_STATUS;
    property USR_DESCRIPTION: String read FUSR_DESCRIPTION write FUSR_DESCRIPTION;
  end;


  TModAuthGroup = class(TModApp)
  private
    FGRO_NAME: String;
    FGRO_DESCRIPTION: String;
  public
    class function GetTableName: String; override;
  published
    [AttributeOfCode]
    property GRO_NAME: String read FGRO_NAME write FGRO_NAME;
    property GRO_DESCRIPTION: String read FGRO_DESCRIPTION write FGRO_DESCRIPTION;
  end;

  TModAuthUserGroup = class(TModApp)
  private
    FGROUP: TModAuthGroup;
    FUSER: TModAuthUser;
  public
    class function GetTableName: String; override;
  published
    [AttributeOfForeign('AUT$GROUP_ID')]
    property GROUP: TModAuthGroup read FGROUP write FGROUP;
    [AttributeOfHeader('AUT$USER_ID')]
    property USER: TModAuthUser read FUSER write FUSER;
  end;


implementation

function TModAuthUser.GetGroups: TObjectList<TModAuthUserGroup>;
begin
  if not Assigned(FGroups) then
    FGroups := TObjectList<TModAuthUserGroup>.Create;
  Result := FGroups;
end;

class function TModAuthUser.GetTableName: String;
begin
  Result := 'AUT$USER';
end;

class function TModAuthGroup.GetTableName: String;
begin
  Result := 'AUT$GROUP';
end;

class function TModAuthUserGroup.GetTableName: String;
begin
  Result := 'AUT$USER_GROUP';
end;

initialization
  TModAuthUser.RegisterRTTI;
  TModAuthGroup.RegisterRTTI;
  TModAuthUserGroup.RegisterRTTI;


end.
