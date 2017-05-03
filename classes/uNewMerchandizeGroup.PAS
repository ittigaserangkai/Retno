unit uNewMerchandizeGroup;

interface

uses
  SysUtils, Classes, uTSBaseClass, uNewMerchandize, uNewUnit, uCompany, udmMain;

type
  TNewMerchandizeGroup = class(TSBaseClass)
  private
    FCompany: TCompany;
    FDefaultMarkUp: Double;
    FID: Integer;
    FKode: string;
    FKodeRekening: string;
    FMerchandizeUnit: TUnit;
    FNama: string;
    FNewMerchadize: TNewMerchadize;
    FNewUnit: TUnit;
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
    function GetFieldNameFor_Company: string; dynamic;
    function GetFieldNameFor_DefaultMarkUp: string; dynamic;
    function GetFieldNameFor_ID: string; dynamic;
    function GetFieldNameFor_Kode: string; dynamic;
    function GetFieldNameFor_KodeRekening: string; dynamic;
    function GetFieldNameFor_MerchandizeUnit: string; dynamic;
    function GetFieldNameFor_Nama: string; dynamic;
    function GetFieldNameFor_NewMerchadize: string; dynamic;
    function GetFieldNameFor_NewUnit: string; dynamic;
    function GetGeneratorName: string;
    function GetHeaderFlag: Integer;
    function LoadByID(aID: Integer): Boolean;
    function LoadByKode(aKode: string; aUnitID, aMerId, aMerUnitID: Integer):
        Boolean;
    function RemoveFromDB: Boolean;
    procedure UpdateData(aCompany_ID : Integer; aDefaultMarkUp : Double; aID :
            Integer; aKode : string; aKodeRekening : string;
            aMerchandizeUnit_ID : Integer; aNama : string; aNewMerchadize_ID :
            Integer; aNewUnit_ID : Integer);
    property Company: TCompany read FCompany write FCompany;
    property DefaultMarkUp: Double read FDefaultMarkUp write FDefaultMarkUp;
    property ID: Integer read FID write FID;
    property Kode: string read FKode write FKode;
    property KodeRekening: string read FKodeRekening write FKodeRekening;
    property MerchandizeUnit: TUnit read FMerchandizeUnit write
            FMerchandizeUnit;
    property Nama: string read FNama write FNama;
    property NewMerchadize: TNewMerchadize read FNewMerchadize write
            FNewMerchadize;
    property NewUnit: TUnit read FNewUnit write FNewUnit;
  end;
  

implementation

{
***************************** TNewMerchandizeGroup *****************************
}
constructor TNewMerchandizeGroup.Create(aOwner : TComponent);
begin  
  inherited create(aOwner);
  FCompany := TCompany.Create(Self);
  FMerchandizeUnit := TUnit.Create(Self);
  FNewMerchadize := TNewMerchadize.Create(Self);
  FNewUnit := TUnit.Create(Self);
end;

destructor TNewMerchandizeGroup.Destroy;
begin
  FCompany.free;
  FMerchandizeUnit.free;
  FNewMerchadize.free;
  FNewUnit.free;
  inherited Destroy;
end;

procedure TNewMerchandizeGroup.ClearProperties;
begin
  Company.ClearProperties;
  DefaultMarkUp := 0;
  ID := 0;
  Kode := '';
  KodeRekening := '';
  MerchandizeUnit.ClearProperties;
  Nama := '';
  NewMerchadize.ClearProperties;
  NewUnit.ClearProperties;  
end;

function TNewMerchandizeGroup.ExecuteCustomSQLTask: Boolean;
begin
  Result := True;
end;

function TNewMerchandizeGroup.ExecuteCustomSQLTaskPrior: Boolean;
begin
  Result := True;
end;

function TNewMerchandizeGroup.CustomTableName: string;
begin
  result := 'REF$MERCHANDISE_GRUP';
end;

function TNewMerchandizeGroup.FLoadFromDB( aSQL : String ): Boolean;
begin
  Result := false;
  State := csNone;

  ClearProperties;
  with cOpenQuery(aSQL) do 
  Begin 
      if not EOF then 
      begin 

          FCompany.LoadByID(FieldByName(GetFieldNameFor_Company).asInteger);
          FNewUnit.LoadByID(FieldByName(GetFieldNameFor_NewUnit).asInteger);
          FDefaultMarkUp := FieldByName(GetFieldNameFor_DefaultMarkUp).asFloat;
          FID := FieldByName(GetFieldNameFor_ID).asInteger;
          FKode := FieldByName(GetFieldNameFor_Kode).asString;
          FKodeRekening := FieldByName(GetFieldNameFor_KodeRekening).asString;
          FMerchandizeUnit.LoadByID(FieldByName(GetFieldNameFor_MerchandizeUnit).asInteger);
          FNama := FieldByName(GetFieldNameFor_Nama).asString;
          FNewMerchadize.LoadByID(FieldByName(GetFieldNameFor_NewMerchadize).asInteger);
          Self.State := csLoaded;
          Result := True;
      end;
      Free;
  End;
end;

function TNewMerchandizeGroup.GenerateInterbaseMetaData: Tstrings;
begin
  result := TstringList.create;
  result.Append( '' );
  result.Append( 'Create Table TNewMerchandizeGroup ( ' );
  result.Append( 'TRMSBaseClass_ID Integer not null, ' );
  result.Append( 'Company_ID Integer Not Null, ' );
  result.Append( 'DefaultMarkUp   double precision Not Null , ' );
  result.Append( 'ID   Integer Not Null  Unique, ' );
  result.Append( 'Kode   Varchar(30) Not Null  Unique, ' );
  result.Append( 'KodeRekening   Varchar(30) Not Null , ' );
  result.Append( 'MerchandizeUnit_ID Integer Not Null, ' );
  result.Append( 'Nama   Varchar(30) Not Null , ' );
  result.Append( 'NewMerchadize_ID Integer Not Null, ' );
  result.Append( 'NewUnit_ID Integer Not Null, ' );
  result.Append( 'Stamp TimeStamp ' );
  result.Append( ' ); ' );
end;

function TNewMerchandizeGroup.ExecuteGenerateSQL: Boolean;
var
  S: string;
begin
  Result := True;
  if State = csNone then
  Begin
     raise Exception.create('Tidak bisa generate dalam Mode csNone')
  end;

  if not ExecuteCustomSQLTaskPrior then
  begin
    cRollbackTrans;
    Exit;
  end else begin
    If FID <= 0 then
    begin
      FID := cGetNextID(GetFieldNameFor_ID, CustomTableName);
      S := 'Insert into ' + CustomTableName + ' ( ' + GetFieldNameFor_Company + ', ' + GetFieldNameFor_DefaultMarkUp + ', ' + GetFieldNameFor_ID + ', ' + GetFieldNameFor_Kode + ', ' + GetFieldNameFor_KodeRekening + ', ' + GetFieldNameFor_MerchandizeUnit + ', ' + GetFieldNameFor_Nama + ', ' + GetFieldNameFor_NewMerchadize + ', ' + GetFieldNameFor_NewUnit + ') values ('
           + InttoStr( FCompany.ID) + ', '
           + FormatFloat('0.00', FDefaultMarkUp) + ', '
           + IntToStr( FID) + ', '
           + QuotedStr(FKode ) + ','
           + QuotedStr(FKodeRekening ) + ','
           + InttoStr( FMerchandizeUnit.ID) + ', '
           + QuotedStr(FNama ) + ','
           + InttoStr( FNewMerchadize.ID) + ', '
           + InttoStr( FNewUnit.ID) + ');'
    end else
    begin
      S := 'Update ' + CustomTableName + ' set ' + GetFieldNameFor_Company + ' = ' + IntToStr( FCompany.ID)
           + ' , ' + GetFieldNameFor_DefaultMarkUp + ' = ' + FormatFloat('0.00', FDefaultMarkUp)
           + ' , ' + GetFieldNameFor_Kode + ' = ' + QuotedStr( FKode )
           + ' , ' + GetFieldNameFor_KodeRekening + ' = ' + QuotedStr( FKodeRekening )
           + ' , ' + GetFieldNameFor_MerchandizeUnit + ' = ' + IntToStr( FMerchandizeUnit.ID)
           + ' , ' + GetFieldNameFor_Nama + ' = ' + QuotedStr( FNama )
           + ' , ' + GetFieldNameFor_NewMerchadize + ' = ' + IntToStr( FNewMerchadize.ID)
           + ' where ' + GetFieldNameFor_NewUnit + ' = ' + IntToStr( FNewUnit.ID)
           + ' and ' + GetFieldNameFor_ID + ' = ' + IntToStr(FID) + ';';


    end;
    if cExecSQL(S, dbtPOS, False) then
    begin
      cRollbackTrans;
      Exit;
    end else
      Result := ExecuteCustomSQLTask;
  end;
end;

function TNewMerchandizeGroup.GetFieldNameFor_Company: string;
begin
  Result := 'MERCHANGRUP_COMP_ID';// <<-- Rubah string ini untuk mapping
end;

function TNewMerchandizeGroup.GetFieldNameFor_DefaultMarkUp: string;
begin
  Result := 'MERCHANGRUP_DEF_MARK_UP';// <<-- Rubah string ini untuk mapping
end;

function TNewMerchandizeGroup.GetFieldNameFor_ID: string;
begin
  Result := 'MERCHANGRUP_ID';// <<-- Rubah string ini untuk mapping
end;

function TNewMerchandizeGroup.GetFieldNameFor_Kode: string;
begin
  Result := 'MERCHANGRUP_CODE';// <<-- Rubah string ini untuk mapping
end;

function TNewMerchandizeGroup.GetFieldNameFor_KodeRekening: string;
begin
  Result := 'MERCHANGRUP_REK_CODE';// <<-- Rubah string ini untuk mapping
end;

function TNewMerchandizeGroup.GetFieldNameFor_MerchandizeUnit: string;
begin
  Result := 'MERCHANGRUP_MERCHAN_UNT_ID';// <<-- Rubah string ini untuk mapping
end;

function TNewMerchandizeGroup.GetFieldNameFor_Nama: string;
begin
  Result := 'MERCHANGRUP_NAME';// <<-- Rubah string ini untuk mapping
end;

function TNewMerchandizeGroup.GetFieldNameFor_NewMerchadize: string;
begin
  Result := 'MERCHANGRUP_MERCHAN_ID';// <<-- Rubah string ini untuk mapping
end;

function TNewMerchandizeGroup.GetFieldNameFor_NewUnit: string;
begin
  Result := 'MERCHANGRUP_UNT_ID';// <<-- Rubah string ini untuk mapping
end;

function TNewMerchandizeGroup.GetGeneratorName: string;
begin
  Result := 'gen_ref$merchandise_grup_id';
end;

function TNewMerchandizeGroup.GetHeaderFlag: Integer;
begin
  result := 1498;
end;

function TNewMerchandizeGroup.LoadByID(aID: Integer): Boolean;
begin
  result := FloadFromDB('Select * from ' + CustomTableName
                      + ' Where ' + GetFieldNameFor_ID + ' = ' + IntToStr(aID)
                      );
end;

function TNewMerchandizeGroup.LoadByKode(aKode: string; aUnitID, aMerId,
    aMerUnitID: Integer): Boolean;
begin
  result := FloadFromDB('Select * from ' + CustomTableName
         + ' Where ' + GetFieldNameFor_Kode + ' = ' + QuotedStr(aKode)
         + ' and ' + GetFieldNameFor_NewUnit + ' = ' + IntToStr(aUnitID)
         + ' and ' + GetFieldNameFor_NewMerchadize + ' = ' + IntToStr(aMerId)
         + ' and ' + GetFieldNameFor_MerchandizeUnit + ' = ' + IntToStr(aMerUnitID)
      );
end;

function TNewMerchandizeGroup.RemoveFromDB: Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'delete from ' + CustomTableName
            + ' where ' + GetFieldNameFor_ID + ' = ' + IntToStr(ID)
            + ' and ' + GetFieldNameFor_NewUnit + ' = ' + IntToStr(NewUnit.ID) ;

  if not cExecSQL(sSQL, dbtPOS, False) then
  begin
    cRollbackTrans;
    Exit;
  end else
    Result := True;
end;

procedure TNewMerchandizeGroup.UpdateData(aCompany_ID : Integer; aDefaultMarkUp
        : Double; aID : Integer; aKode : string; aKodeRekening : string;
        aMerchandizeUnit_ID : Integer; aNama : string; aNewMerchadize_ID :
        Integer; aNewUnit_ID : Integer);
begin
  FCompany.LoadByID(aCompany_ID);
  FDefaultMarkUp :=  aDefaultMarkUp;
  FID :=  aID;
  FKode := trim(aKode);
  FKodeRekening := trim(aKodeRekening);
  FMerchandizeUnit.LoadByID(aMerchandizeUnit_ID);
  FNama := trim(aNama);
  FNewMerchadize.LoadByID(aNewMerchadize_ID);
  FNewUnit.LoadByID(aNewUnit_ID);
  State := csCreated;
end;



end.
