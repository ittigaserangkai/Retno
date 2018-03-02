unit uModUser;

interface

uses
  System.Generics.Collections,System.SysUtils, uModApp;

type
  TModUserMenuItem = class;

  TModUserApp = class(TModApp)
  private
    FPassword: string;
    FUserMenuItems: TObjectList<TModUserMenuItem>;
    FUserName: string;
    function GetUserMenuItems: TObjectList<TModUserMenuItem>;
  public
    destructor Destroy; override;
  published
    property Password: string read FPassword write FPassword;
    property UserMenuItems: TObjectList<TModUserMenuItem> read GetUserMenuItems write
        FUserMenuItems;

    [AttributeOfCode]
    property UserName: string read FUserName write FUserName;
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
