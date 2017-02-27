unit uAppUtils;

interface
uses
  System.Classes, System.SysUtils,
    Graphics, Registry,
  ComCtrls,Math,DB, ExtCtrls,
  Variants,StrUtils, Forms, Dialogs, Controls,
  Windows,  SqlExpr, System.UITypes;

type
  TAppUtils = class(TObject)
  public
    class function BacaRegistry(aNama: String; aPath : String = ''): string;
    class function TulisRegistry(aName, aValue: String; sAppName : String = ''):
        Boolean;
  end;

implementation

class function TAppUtils.BacaRegistry(aNama: String; aPath : String = ''):
    string;
var
  Registry: TRegistry;
  //S: string;
begin
  Registry:=TRegistry.Create;

  Registry.RootKey := HKEY_CURRENT_USER;
  {False because we do not want to create it if it doesn’t exist}
  if Trim(aPath) = '' then
    Registry.OpenKey('\Software\' + Application.Title, False)
  else
    Registry.OpenKey('\Software\' + aPath, False);

  Result := Registry.ReadString(aNama);

  Registry.Free;
end;

class function TAppUtils.TulisRegistry(aName, aValue: String; sAppName : String
    = ''): Boolean;
var
   Reg : TRegistry;
begin
    result := true;
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if sAppName = '' then
      begin
        if Reg.OpenKey('\Software\' + Application.Title, True) then
        begin
             Reg.WriteString(aName, aValue);
             Reg.CloseKey;
        end
      end else begin
        if Reg.OpenKey('\Software\' + sAppName, True) then
        begin
             Reg.WriteString(aName, aValue);
             Reg.CloseKey;
        end;
      end;
    Except
      result := false;
      Reg.Free;
      exit;
    end;
   Reg.Free;
end;

end.
