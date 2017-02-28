unit uServerClasses;

interface

uses
  System.Classes, uModApp, uDBUtils, Rtti;

type
  {$METHODINFO ON}
  TTestMethod = class(TComponent)
  public
    function Hallo: String;
  end;

  TCrud = class(TComponent)
  private
  public
    function SaveToDB(AObject: TModApp): Boolean;
    function DeleteFromDB(AObject: TModApp): Boolean;
    function Retrieve(ModAppClass: TModAppClass; AID: String): TModApp;
    function TestGenerateSQL(AObject: TModApp): TStrings;
  end;

  {$METHODINFO OFF}

implementation

function TTestMethod.Hallo: String;
begin
  Result := 'Hello Word';
end;

function TCrud.SaveToDB(AObject: TModApp): Boolean;
var
  lSS: TStrings;
begin
  Result := False;
  lSS := TDBUtils.GenerateSQL(AObject);
  Try
    Try
      TDBUtils.ExecuteSQL(lSS, False);
      TDBUtils.Commit;
      Result := True;
    except
      TDBUtils.RollBack;
      raise;
    End;
  Finally
    lSS.Free;
  End;
end;

function TCrud.DeleteFromDB(AObject: TModApp): Boolean;
var
  lSS: TStrings;
begin
  Result := False;
  lSS := TDBUtils.GenerateSQLDelete(AObject);
  Try
    Try
      TDBUtils.ExecuteSQL(lSS, False);
      TDBUtils.Commit;
      Result := True;
    except
      TDBUtils.RollBack;
      raise;
    End;
  Finally
    lSS.Free;
  End;
end;

function TCrud.Retrieve(ModAppClass: TModAppClass; AID: String): TModApp;
begin
  Result := TModAppClass.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TCrud.TestGenerateSQL(AObject: TModApp): TStrings;
begin
  Result := TDBUtils.GenerateSQL(AObject);
end;

end.
