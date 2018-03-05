unit uModUser;

interface

uses
  System.Generics.Collections,System.SysUtils, uModApp;

type
  TModUserMenuItem = class;

  TModUserApp = class(TModApp)
  private
    FUsr_Description: string;
    FUsr_Password: string;
    FUsr_RealName: string;
    FUserMenuItems: TObjectList<TModUserMenuItem>;
    FUsr_UserName: string;
    function GetUserMenuItems: TObjectList<TModUserMenuItem>;
  public
    destructor Destroy; override;
    property UserMenuItems: TObjectList<TModUserMenuItem> read GetUserMenuItems
        write FUserMenuItems;
  published
    [AttributeOfSize('120')]
    property Usr_Description: string read FUsr_Description write FUsr_Description;
    property Usr_Password: string read FUsr_Password write FUsr_Password;

    [AttributeOfSize('60')]
    property Usr_RealName: string read FUsr_RealName write FUsr_RealName;

    [AttributeOfCode]
    property Usr_UserName: string read FUsr_UserName write FUsr_UserName;
  end;

  TModMenu = class(TModApp)
  private
    FMenuCaption: string;
    FMenuName: string;
  published
    [AttributeOfSize('120')]
    property MenuCaption: string read FMenuCaption write FMenuCaption;

    [AttributeOfCode, AttributeOfSize('120')]
    property MenuName: string read FMenuName write FMenuName;
  end;

  TModUserMenuItem = class(TModApp)
  private
    FMenu: TModMenu;
    FUseraPP: TModUserApp;
  public
  published
    property Menu: TModMenu read FMenu write FMenu;

    [AttributeOfHeader]
    property UseraPP: TModUserApp read FUseraPP write FUseraPP;
  end;

implementation

destructor TModUserApp.Destroy;
begin
  inherited;
  FreeAndNil(FUserMenuItems);
end;

function TModUserApp.GetUserMenuItems: TObjectList<TModUserMenuItem>;
begin
  if FUserMenuItems = nil then
    FUserMenuItems := TObjectList<TModUserMenuItem>.Create;

  Result := FUserMenuItems;
end;

initialization
  TModUserApp.RegisterRTTI;
end.
