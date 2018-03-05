unit uModAuthUser;

interface

uses uModApp, System.Generics.Collections;

type
  TModAuthGroup = class;
  TModUserMenuItem = class;

  TModAuthUser = class(TModApp)
  private
    FUserMenuItems: TObjectList<TModUserMenuItem>;
    FUSR_GROUP: TModAuthGroup;
    FUSR_FULLNAME: String;
    FUSR_USERNAME: String;
    FUSR_PASSWD: String;
    FUSR_STATUS: Integer;
    FUSR_DESCRIPTION: String;
    function GetUserMenuItems: TObjectList<TModUserMenuItem>;
  public
    class function GetPrimaryField: String; override;
    class function GetTableName: String; override;
    property UserMenuItems: TObjectList<TModUserMenuItem> read GetUserMenuItems
        write FUserMenuItems;
  published
    property USR_GROUP: TModAuthGroup read FUSR_GROUP write FUSR_GROUP;
    property USR_FULLNAME: String read FUSR_FULLNAME write FUSR_FULLNAME;

//    [AttributeOfCode]
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

  TModMenu = class(TModApp)
  private
    FAplikasi: string;
    FMenuCaption: string;
    FMenuName: string;
  published
    [AttributeOfSize('120')]
    property Aplikasi: string read FAplikasi write FAplikasi;

    [AttributeOfSize('120')]
    property MenuCaption: string read FMenuCaption write FMenuCaption;

    [AttributeOfCode, AttributeOfSize('120')]
    property MenuName: string read FMenuName write FMenuName;
  end;

  TModUserMenuItem = class(TModApp)
  private
    FMenu: TModMenu;
    FAuthUser: TModAuthUser;
  public
  published
    property Menu: TModMenu read FMenu write FMenu;

    [AttributeOfHeader]
    property AuthUser: TModAuthUser read FAuthUser write FAuthUser;
  end;


implementation

class function TModAuthUser.GetPrimaryField: String;
begin
  Result := 'AUT$USER_ID';
end;

class function TModAuthUser.GetTableName: String;
begin
  Result := 'AUT$USER';
end;

function TModAuthUser.GetUserMenuItems: TObjectList<TModUserMenuItem>;
begin
  if FUserMenuItems = nil then
    FUserMenuItems := TObjectList<TModUserMenuItem>.Create;

  Result := FUserMenuItems;
end;

class function TModAuthGroup.GetTableName: String;
begin
  Result := 'AUT$GROUP';
end;

initialization
  TModAuthUser.RegisterRTTI;
  TModAuthGroup.RegisterRTTI;
//  TModAuthUserGroup.RegisterRTTI;


end.
