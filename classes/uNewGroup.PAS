unit uNewGroup;

interface

uses
  SysUtils, Classes, uTSBaseClass;

type
  TGroup = class(TSBaseClass)
  private
    FMerchanUnitID: Integer;
    FCompanyID: Integer;
    FDefaultMarkUp: Double;
    FID: Integer;
    FKode: string;
    FKodeRek: string;
    FMerchanID: Integer;
    FNama: string;
    FUnitID: Integer;
    function FLoadFromDB( aSQL : String ): Boolean;
  public
    constructor Create(aOwner : TComponent); override;
    destructor Destroy; override;
    procedure ClearProperties;
    function ExecuteCustomSQLTask: Boolean;
    function ExecuteCustomSQLTaskPrior: Boolean;
    function CustomTableName: string;
    function GenerateInterbaseMetaData: Tstrings;
    function ExecuteGenerateSQL: Boolean;
    function GetFieldNameFor_CompanyID: string; dynamic;
    function GetFieldNameFor_DefaultMarkUp: string; dynamic;
    function GetFieldNameFor_ID: string; dynamic;
    function GetFieldNameFor_Kode: string; dynamic;
    function GetFieldNameFor_KodeRek: string; dynamic;
    function GetFieldNameFor_MerchanID: string; dynamic;
    function GetFieldNameFor_MerchanUnitID: string;
    function GetFieldNameFor_Nama: string; dynamic;
    function GetFieldNameFor_UnitID: string; dynamic;
    function GetHeaderFlag: Integer;
    function LoadByCode(aKode : String; aUnitID, aMerId, aMerUnitID: Integer): Boolean;
    function LoadByID(aID : Integer; aUnitID : Integer): Boolean;
    function RemoveFromDB: Boolean;
    procedure UpdateData(aCompanyID : Integer; aDefaultMarkUp : Double; aID :
        Integer; aKode : string; aKodeRek : string; aMerchanID : Integer;
        aMerchanUnitID : integer; aNama : string; aUnitID : Integer);
    property MerchanUnitID: Integer read FMerchanUnitID write FMerchanUnitID;
    property CompanyID: Integer read FCompanyID write FCompanyID;
    property DefaultMarkUp: Double read FDefaultMarkUp write FDefaultMarkUp;
    property ID: Integer read FID write FID;
    property Kode: string read FKode write FKode;
    property KodeRek: string read FKodeRek write FKodeRek;
    property MerchanID: Integer read FMerchanID write FMerchanID;
    property Nama: string read FNama write FNama;
    property UnitID: Integer read FUnitID write FUnitID;
  end;
  

implementation

uses StrUtils, udmMain, FireDAC.Stan.Error;

{
************************************ TGroup ************************************
}
constructor TGroup.Create(aOwner : TComponent);
begin
  inherited create(aOwner);
  ClearProperties;
end;

destructor TGroup.Destroy;
begin
  
   inherited Destroy;
end;

procedure TGroup.ClearProperties;
begin
  ID := 0;
  Kode := '';
  Nama := '';
  UnitID := 0;
  //FreeAndNil();

  CompanyID := 0;
  DefaultMarkUp := 0;
  KodeRek := '';
  MerchanID := 0;
  MerchanUnitID := 0;
end;

function TGroup.ExecuteCustomSQLTask: Boolean;
begin
  result := True;
end;

function TGroup.ExecuteCustomSQLTaskPrior: Boolean;
begin
  result := True;
end;

function TGroup.CustomTableName: string;
begin
  result := 'REF$MERCHANDISE_GRUP';
end;

function TGroup.FLoadFromDB( aSQL : String ): Boolean;
begin
  result := false;
  State := csNone;

  ClearProperties;
  with cOpenQuery(aSQL) do
  Begin
      if not EOF then
      begin

         FCompanyID := FieldByName(GetFieldNameFor_CompanyID).asInteger;
         FDefaultMarkUp := FieldByName(GetFieldNameFor_DefaultMarkUp).asFloat;
         //ShowMessage(FieldByName(GetFieldNameFor_ID).AsString);
         FID := FieldByName(GetFieldNameFor_ID).asInteger;
         FKode := FieldByName(GetFieldNameFor_Kode).asString;
         FKodeRek := FieldByName(GetFieldNameFor_KodeRek).asString;
         FMerchanID := FieldByName(GetFieldNameFor_MerchanID).asInteger;
         FMerchanUnitID := FieldByName(GetFieldNameFor_MerchanUnitID).asInteger;
         FNama := FieldByName(GetFieldNameFor_Nama).asString;
         FUnitID := FieldByName(GetFieldNameFor_UnitID).asInteger;
             Self.State := csLoaded;
          Result := True;
      end;
      Free;
  End;
end;

function TGroup.GenerateInterbaseMetaData: Tstrings;
begin
  result := TstringList.create;
  result.Append( '' );
  result.Append( 'Create Table TGroup ( ' );
  result.Append( 'TRMSBaseClass_ID Integer not null, ' );
  result.Append( 'CompanyID   Integer Not Null , ' );
  result.Append( 'DefaultMarkUp   double precision Not Null , ' );
  result.Append( 'ID   Integer Not Null  Unique, ' );
  result.Append( 'Kode   Varchar(30) Not Null , ' );
  result.Append( 'KodeRek   Varchar(30) Not Null , ' );
  result.Append( 'MerchanID   Integer Not Null , ' );
  result.Append( 'MerchanUnitID   Integer Not Null , ' );
  result.Append( 'Nama   Varchar(30) Not Null , ' );
  result.Append( 'UnitID   Integer Not Null , ' );
  result.Append( 'Stamp TimeStamp ' );
  result.Append( ' ); ' );
end;

function TGroup.ExecuteGenerateSQL: Boolean;
var
  S: string;
  //i: Integer;
  //SS: Tstrings;
begin
  //result := TstringList.create;
  Result := False;

  if State = csNone then
  Begin
     raise Exception.create('Tidak bisa generate dalam Mode csNone')
  end;

 { SS := CustomSQLTaskPrior;
  if SS <> nil then
  Begin
        result.AddStrings(SS);
  end;
  //SS := Nil; }
  if not ExecuteCustomSQLTaskPrior then
  begin
    cRollbackTrans;
    Exit;
  end else
  begin

    If FID <= 0 then
    begin
      FID := cGetNextID(GetFieldNameFor_ID, CustomTableName);
      S := 'Insert into ' + CustomTableName + ' ( ' + GetFieldNameFor_CompanyID
      + ', ' + GetFieldNameFor_DefaultMarkUp
      + ', ' + GetFieldNameFor_ID
      + ', ' + GetFieldNameFor_Kode
      + ', ' + GetFieldNameFor_KodeRek
      + ', ' + GetFieldNameFor_MerchanID
      + ', ' + GetFieldNameFor_MerchanUnitID
      + ', ' + GetFieldNameFor_Nama
      + ', ' + GetFieldNameFor_UnitID
      + ') values ('
      + IntToStr( FCompanyID) + ', '
      + QuotedStr(FormatFloat(siFrtDec2, FDefaultMarkUp)) + ', '
      + IntToStr( FID) + ', '
      + QuotedStr(FKode ) + ','
      + IfThen(FKodeRek='', 'null,', QuotedStr(FKodeRek ) + ',')
      + IntToStr( FMerchanID) + ', '
      + IntToStr( FMerchanUnitID) + ', '
      + QuotedStr(FNama ) + ','
      + IntToStr( FUnitID) + ');'
    end else
    begin
        //generate Update SQL
      S := 'Update ' + CustomTableName + ' set ' + GetFieldNameFor_CompanyID + ' = ' + IntToStr( FCompanyID)
      + ', ' + GetFieldNameFor_DefaultMarkUp + ' = ' + QuotedStr(FormatFloat(siFrtDec2, FDefaultMarkUp))
      + ', ' + GetFieldNameFor_Kode + ' = ' + QuotedStr( FKode )
      + ', ' + GetFieldNameFor_KodeRek + ' = ' + IfThen(FKodeRek='', 'null', QuotedStr(FKodeRek))
      + ', ' + GetFieldNameFor_MerchanID + ' = ' + IntToStr( FMerchanID)
      + ', ' + GetFieldNameFor_MerchanUnitID + ' = ' + IntToStr( FMerchanUnitID)
      + ', ' + GetFieldNameFor_Nama + ' = ' + QuotedStr( FNama )
      + ' where ' + GetFieldNameFor_UnitID + ' = ' + IntToStr( FUnitID)
      + ' and ' + GetFieldNameFor_ID + '  = ' + IntToStr(FID) + ';';

  
    end;
  end;
  {result.append( S );
  //generating Collections SQL

  SS := CustomSQLTask;
  if SS <> nil then
  Begin
        result.AddStrings(SS);
  end;}

  if not cExecSQL(S, dbtPOS, False) then
  begin
    cRollbackTrans;
    Exit;
  end else
    Result := ExecuteCustomSQLTask;
end;

function TGroup.GetFieldNameFor_CompanyID: string;
begin
  Result := 'MERCHANGRUP_COMP_ID';// <<-- Rubah string ini untuk mapping
end;

function TGroup.GetFieldNameFor_DefaultMarkUp: string;
begin
  Result := 'MERCHANGRUP_DEF_MARK_UP';// <<-- Rubah string ini untuk mapping
end;

function TGroup.GetFieldNameFor_ID: string;
begin
  Result := 'MERCHANGRUP_ID';// <<-- Rubah string ini untuk mapping
end;

function TGroup.GetFieldNameFor_Kode: string;
begin
  Result := 'MERCHANGRUP_CODE';// <<-- Rubah string ini untuk mapping
end;

function TGroup.GetFieldNameFor_KodeRek: string;
begin
  Result := 'MERCHANGRUP_REK_CODE';// <<-- Rubah string ini untuk mapping
end;

function TGroup.GetFieldNameFor_MerchanID: string;
begin
  Result := 'MERCHANGRUP_MERCHAN_ID';// <<-- Rubah string ini untuk mapping
end;

function TGroup.GetFieldNameFor_MerchanUnitID: string;
begin
  // TODO -cMM: TGroup.GetFieldNameFor_MerchanUnitID default body inserted
  Result :=  'MERCHANGRUP_MERCHAN_UNT_ID' ;
end;

function TGroup.GetFieldNameFor_Nama: string;
begin
  Result := 'MERCHANGRUP_NAME';// <<-- Rubah string ini untuk mapping
end;

function TGroup.GetFieldNameFor_UnitID: string;
begin
  Result := 'MERCHANGRUP_UNT_ID';// <<-- Rubah string ini untuk mapping
end;

function TGroup.GetHeaderFlag: Integer;
begin
  result := 120;
end;

function TGroup.LoadByCode(aKode : String; aUnitID, aMerId,
          aMerUnitID: Integer): Boolean;
begin
  result := FloadFromDB('Select * from ' + CustomTableName
        + ' Where ' + GetFieldNameFor_Kode + ' = ' + QuotedStr(aKode)
        + ' and ' + GetFieldNameFor_UnitID + ' = ' + IntToStr(aUnitID)
        + ' and ' + GetFieldNameFor_MerchanID + ' = ' + IntToStr(aMerId)
        + ' and ' + GetFieldNameFor_MerchanUnitID + ' = ' + IntToStr(aMerUnitID)
    );
end;

function TGroup.LoadByID(aID : Integer; aUnitID : Integer): Boolean;
begin
  result := FloadFromDB('Select * from ' + CustomTableName
                        + ' Where ' + GetFieldNameFor_ID + ' = ' + IntToStr(aID)
                        + ' and ' + GetFieldNameFor_UnitID + ' = ' + IntToStr(aUnitID));
end;

function TGroup.RemoveFromDB: Boolean;
var
  sErr: string;
  sSQL: String;
begin
  Result := False;
  
  sSQL := 'DELETE FROM REF$MERCHANDISE_GRUP '
          + ' WHERE ' + GetFieldNameFor_ID + ' = ' + IntToStr(FID)
          + ' AND ' + GetFieldNameFor_UnitID + ' = ' + IntToStr(FUnitID) + ';';

  try
    if cExecSQL(sSQL, dbtPOS, False) then
        result :=  True;//SimpanBlob(sSQL, GetHeaderFlag);
  except
    on E: EFDDBEngineException do
    begin
      sErr := e.Message;
      if sErr <> '' then
        raise Exception.Create(sErr)
      else
        raise Exception.Create('Error Code: '+IntToStr(e.ErrorCode)+#13#10+e.SQL);
    end;
  end;
end;

procedure TGroup.UpdateData(aCompanyID : Integer; aDefaultMarkUp : Double; aID
    : Integer; aKode : string; aKodeRek : string; aMerchanID : Integer;
    aMerchanUnitID : integer; aNama : string; aUnitID : Integer);
begin
   ClearProperties;

   FCompanyID :=  aCompanyID;
   FDefaultMarkUp :=  aDefaultMarkUp;
   FID :=  aID;
   FKode := trim(aKode);
   FKodeRek := trim(aKodeRek);
   FMerchanID :=  aMerchanID;
   FMerchanUnitID := aMerchanUnitID;
   FNama := trim(aNama);
   FUnitID :=  aUnitID;
  State := csCreated;
end;



end.
