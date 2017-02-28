unit uDSUtils;

interface

uses
  Classes, DSCommonServer, DSReflect, DSServer, Provider,
  Datasnap.DSProviderDataModuleAdapter;

type
  TCustServerClass = class(TDSServerClass)
  private
    FPersistentClass: TPersistentClass;
  protected
    function GetDSClass: TDSClass; override;
  public
    constructor Create(AOwner: TComponent; AServer: TDSCustomServer; AClass:
        TPersistentClass; ALifeCycle: String); reintroduce; overload;
  end;

  TCustServerModule = class(TDSServerModule)
  private
  protected
  public
    constructor Create(AOwner: TComponent; AProvider: TCustomProvider);
        reintroduce; overload;
  end;

implementation

constructor TCustServerClass.Create(AOwner: TComponent; AServer:
    TDSCustomServer; AClass: TPersistentClass; ALifeCycle: String);
begin
  inherited Create(AOwner);
  FPersistentClass:= AClass;
  Self.Server:= AServer;
  Self.LifeCycle:= ALifeCycle;
end;

function TCustServerClass.GetDSClass: TDSClass;
begin
  Result := TDSClass.Create(FPersistentClass, False);
end;

constructor TCustServerModule.Create(AOwner: TComponent; AProvider:
    TCustomProvider);
begin
  inherited Create(AOwner);
  RegisterProvider(AProvider);
end;

end.
