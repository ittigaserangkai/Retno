unit uServerModelHelper;

interface
uses
  uModApp,System.SysUtils, uServerClasses;

type
  TCRUDObj = class
  private
  public
    class function RetrieveCode<T: class>(aCode: string): T;
    class function Retrieve<T: class>(aID: string; LoadObjectList: Boolean =
        True): T;
  end;

function GetModAppRestID(aObject: TModApp): String;

implementation

uses
  System.Rtti, System.TypInfo, Vcl.Dialogs;

function GetModAppRestID(aObject: TModApp): String;
begin
  Result := 'null';
  if aObject <> nil then
    Result := aObject.ID;
end;


class function TCRUDObj.RetrieveCode<T>(aCode: string): T;
var
  lCRUD: TCRUD;
  sClass: string;
begin
  lCRUD := TCRUD.Create(nil);
  Try
    if (T = nil) then
      Raise Exception.Create('Type can''t be nil')
    else if not TClass(T).InheritsFrom(TModApp) then
      Raise Exception.Create('Type must inherti from TObjectModel')
    else
    begin
      sClass := T.ClassName;
      Result := T(lCRUD.RetrieveByCode(sClass, aCode))
    end;
  Finally
    FreeAndNil(lCRUD);
  End;
end;

class function TCRUDObj.Retrieve<T>(aID: string; LoadObjectList: Boolean =
    True): T;
var
  lCRUD: TCrud;
  sClass: string;
begin
  lCRUD := TCRUD.Create(nil);
  Try
    if (T = nil) then
      Raise Exception.Create('Type can''t be nil')
    else if not TClass(T).InheritsFrom(TModApp) then
      Raise Exception.Create('Type must inherti from TObjectModel')
    else
    begin
      sClass := T.ClassName;
      if LoadObjectList then
        Result := T(lCRUD.Retrieve(sClass, aID))
      else
        Result := T(lCRUD.RetrieveSingle(sClass, aID));
    end;
  Finally
    FreeAndNil(lCRUD);
  End;
end;


end.
