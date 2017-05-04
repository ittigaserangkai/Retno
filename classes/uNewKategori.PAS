unit uNewKategori;

interface

uses
  SysUtils, Classes, uTSBaseClass, uNewSubGroup;

type
  TKategori = class(TSBaseClass)
  private
    FID: Integer;
    FKode: string;
    FNama: string;
    FSubGroup: TSubGroup;
    FUnitID: Integer;
    function FLoadFromDB( aSQL : String ): Boolean;
    procedure SetUnitID(const Value: Integer);
  public
    constructor Create(aOwner : TComponent); override;
    destructor Destroy; override;
    procedure ClearProperties;
    function ExecuteCustomSQLTask: Boolean;
    function ExecuteCustomSQLTaskPrior: Boolean;
    function CustomTableName: string;
    function GenerateInterbaseMetaData: Tstrings;
    function ExecuteGenerateSQL: Boolean;
    function GetFieldNameFor_ID: string; dynamic;
    function GetFieldNameFor_Kode: string; dynamic;
    function GetFieldNameFor_Nama: string; dynamic;
    function GetFieldNameFor_SubGroup: string; dynamic;
    function GetFieldNameFor_SubGroup_UnitID: string;
    function GetFieldNameFor_UnitID: string; dynamic;
    function GetHeaderFlag: Integer;
    function LoadByID(aID: Integer): Boolean;
    function LoadByKode(aKode: string; aUnitID, aSubGrpID, aSubGrpUnitID: Integer):
        Boolean;
    function RemoveFromDB: Boolean;
    procedure UpdateData(aID : Integer; aKode : string; aNama : string;
            aSubGroup_ID : Integer; aUnitID : Integer);
    property ID: Integer read FID write FID;
    property Kode: string read FKode write FKode;
    property Nama: string read FNama write FNama;
    property SubGroup: TSubGroup read FSubGroup write FSubGroup;
    property UnitID: Integer read FUnitID write SetUnitID;
  end;
  

implementation

uses FireDAC.Comp.Client, FireDAC.Stan.Error, udmMain;

{
********************************** TKategori ***********************************
}
constructor TKategori.Create(aOwner : TComponent);
begin
  inherited create(aOwner);
  FSubGroup := TSubGroup.Create(Self);
  ClearProperties;
end;

destructor TKategori.Destroy;
begin
  
          FSubGroup.free;
   inherited Destroy;
end;

procedure TKategori.ClearProperties;
begin
  FID := 0;
  Kode := '';
  Nama := '';
  SubGroup.ClearProperties;
  FUnitID := 0; 
end;

function TKategori.ExecuteCustomSQLTask: Boolean;
begin
  result := True;
end;

function TKategori.ExecuteCustomSQLTaskPrior: Boolean;
begin
  result := True;
end;

function TKategori.CustomTableName: string;
begin
  result := 'REF$KATEGORI';
end;

function TKategori.FLoadFromDB( aSQL : String ): Boolean;
begin
  result := false;
  State := csNone;

  ClearProperties;
  with cOpenQuery(aSQL) do
  Begin
      if not EOF then
      begin
         FID := FieldByName(GetFieldNameFor_ID).asInteger;
         FKode := FieldByName(GetFieldNameFor_Kode).asString;
         FNama := FieldByName(GetFieldNameFor_Nama).asString;
         FUnitID := FieldByName(GetFieldNameFor_UnitID).asInteger;
         FSubGroup.LoadByID(FieldByName(GetFieldNameFor_SubGroup).asInteger, FUnitID);
         Self.State := csLoaded;
         Result := True;
      end;
      Free;
  End;
end;

function TKategori.GenerateInterbaseMetaData: Tstrings;
begin
  result := TstringList.create;
  result.Append( '' );
  result.Append( 'Create Table TKategori ( ' );
  result.Append( 'TRMSBaseClass_ID Integer not null, ' );
  result.Append( 'ID   Integer Not Null  Unique, ' );
  result.Append( 'Kode   Varchar(30) Not Null  Unique, ' );
  result.Append( 'Nama   Varchar(30) Not Null , ' );
  result.Append( 'SubGroup_ID Integer Not Null, ' );
  result.Append( 'UnitID   Integer Not Null , ' );
  result.Append( 'Stamp TimeStamp ' );
  result.Append( ' ); ' );
end;

function TKategori.ExecuteGenerateSQL: Boolean;
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

  {SS := CustomSQLTaskPrior;
  if SS <> nil then
  Begin
        result.AddStrings(SS);
  end;
  //SS := Nil;   }

  if not ExecuteCustomSQLTaskPrior then
  begin
    cRollbackTrans;
    Exit;
  end else
  begin
    If FID <= 0 then
    begin
          //Generate Insert SQL
      FID := cGetNextID(GetFieldNameFor_ID, CustomTableName) ;
      S := 'Insert into ' + CustomTableName + ' ( ' + GetFieldNameFor_ID + ', ' + GetFieldNameFor_Kode + ', ' + GetFieldNameFor_Nama + ', ' + GetFieldNameFor_SubGroup + ', ' + GetFieldNameFor_UnitID + ',' + GetFieldNameFor_SubGroup_UnitID + ') values ('
            + IntToStr( FID) + ', '
            + QuotedStr(FKode ) + ','
            + QuotedStr(FNama ) + ','
            + InttoStr( FSubGroup.ID) + ', '
            + IntToStr( FUnitID) + ', '
            + IntToStr( FSubGroup.UnitID) + ');';
      end else
      begin
          //generate Update SQL
        S := 'Update ' + CustomTableName + ' set ' + GetFieldNameFor_Kode + ' = ' + QuotedStr( FKode )
              + ' , ' + GetFieldNameFor_Nama + ' = ' + QuotedStr( FNama )
              + ', ' + GetFieldNameFor_SubGroup + ' = ' + IntToStr( FSubGroup.ID)
              + ', ' + GetFieldNameFor_UnitID + ' = ' + IntToStr( FUnitID)
              + ', ' + GetFieldNameFor_SubGroup_UnitID + ' = ' + IntToStr( FUnitID)
              + ' where ' + GetFieldNameFor_UnitID + ' = ' + IntToStr(FUnitID)
              + ' and ' + GetFieldNameFor_ID + ' = ' + IntToStr(FID) + ';';


      end;
    end;

 { result.append( S );
  //generating Collections SQL

  SS := CustomSQLTask;
  if SS <> nil then
  Begin
        result.AddStrings(SS);
  end;  }
    if not cExecSQL(S, dbtPOS, False) then
    begin
      cRollbackTrans;
      Exit;
    end else
      Result := ExecuteCustomSQLTask;
end;

function TKategori.GetFieldNameFor_ID: string;
begin
  Result := 'KAT_ID';// <<-- Rubah string ini untuk mapping
end;

function TKategori.GetFieldNameFor_Kode: string;
begin
  Result := 'KAT_CODE';// <<-- Rubah string ini untuk mapping
end;

function TKategori.GetFieldNameFor_Nama: string;
begin
  Result := 'KAT_NAME';// <<-- Rubah string ini untuk mapping
end;

function TKategori.GetFieldNameFor_SubGroup: string;
begin
  Result := 'KAT_SUBGRUP_ID';// <<-- Rubah string ini untuk mapping
end;

function TKategori.GetFieldNameFor_SubGroup_UnitID: string;
begin
  Result := 'KAT_SUBGRUP_UNT_ID';
end;

function TKategori.GetFieldNameFor_UnitID: string;
begin
  Result := 'KAT_UNT_ID';// <<-- Rubah string ini untuk mapping
end;

function TKategori.GetHeaderFlag: Integer;
begin
  result := 181;
  //result := 181;
  //result := 181;
end;

function TKategori.LoadByID(aID: Integer): Boolean;
begin
  result := FloadFromDB('Select * from ' + CustomTableName + ' Where ' + GetFieldNameFor_ID + ' = ' + IntToStr(aID));
end;

function TKategori.LoadByKode(aKode: string; aUnitID, aSubGrpID, aSubGrpUnitID:
    Integer): Boolean;
begin
  result := FloadFromDB('Select * from ' + CustomTableName
              + ' Where ' + GetFieldNameFor_Kode + ' = ' + QuotedStr(aKode)
              + ' and ' + GetFieldNameFor_UnitID + ' = ' + IntToStr(aUnitID)
              + ' and ' + GetFieldNameFor_SubGroup + ' = ' + IntToStr(aSubGrpID)
              + ' and ' + GetFieldNameFor_SubGroup_UnitID + ' = ' + IntToStr(aSubGrpUnitID)
              );
end;

function TKategori.RemoveFromDB: Boolean;
var
  sErr: string;
  sSQL: String;
begin
  Result := False;
  sSQL := 'DELETE FROM REF$KATEGORI '
          + ' WHERE KAT_ID = ' + IntToStr(FID)
          + ' AND KAT_UNT_ID = ' + IntToStr(FUnitID) +  ';' ;

  try
    if cExecSQL(sSQL, dbtPOS, False) then
        result := True; // SimpanBlob(sSQL, GetHeaderFlag);
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

procedure TKategori.SetUnitID(const Value: Integer);
begin
  if (Value <> SubGroup.UnitID) and (Value <> 0) then
  begin
    raise Exception.Create('Unit ID <> Sub Group Unit ID');
  end else
    FUnitID := Value;
end;

procedure TKategori.UpdateData(aID : Integer; aKode : string; aNama : string;
        aSubGroup_ID : Integer; aUnitID : Integer);
begin

             FID :=  aID;
             FKode := trim(aKode);
             FNama := trim(aNama);
             FSubGroup.LoadByID(aSubGroup_ID, aUnitID);
             FUnitID :=  aUnitID;
  State := csCreated;
end;



end.
