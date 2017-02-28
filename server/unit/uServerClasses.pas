unit uServerClasses;

interface

uses
  System.Classes, uModApp, uDBUtils, Rtti, Data.DB, SysUtils;

type
  {$METHODINFO ON}
  TTestMethod = class(TComponent)
  public
    function Hallo: String;
  end;

  TCrud = class(TComponent)
  private
    function StringToClass(ModClassName: string): TModAppClass;
  public
    function SaveToDB(AObject: TModApp): Boolean;
    function DeleteFromDB(AObject: TModApp): Boolean;
    function OpenQuery(S: string): TDataSet;
    function Retrieve(ModAppClass: TModAppClass; AID: String): TModApp; overload;
    function Retrieve(ModClassName, AID: string): TModApp; overload;
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

function TCrud.OpenQuery(S: string): TDataSet;
begin
  Result := TDBUtils.OpenQuery(S);
end;

function TCrud.Retrieve(ModAppClass: TModAppClass; AID: String): TModApp;
begin
  Result := TModAppClass.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TCrud.Retrieve(ModClassName, AID: string): TModApp;
var
  lClass: TModAppClass;
begin
  lClass := Self.StringToClass(ModClassName);
  If not Assigned(lClass) then
    Raise Exception.Create('Class ' + ModClassName + ' not found');
  Result := Self.Retrieve(lClass, AID);
end;

function TCrud.StringToClass(ModClassName: string): TModAppClass;
var
  ctx: TRttiContext;
  rt: TRttiType;
begin
  Result  := nil;
  ctx     := TRttiContext.Create;
  Try
    rt    := ctx.FindType(ModClassName);
    If Assigned(rt) and (rt.IsInstance) then
    begin
      Result  := TModAppClass( rt.AsInstance.MetaclassType );
    end;
  Finally
    ctx.Free;
  End;
end;

function TCrud.TestGenerateSQL(AObject: TModApp): TStrings;
begin
  Result := TDBUtils.GenerateSQL(AObject);
end;

end.
