unit uNewPajak;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs, uTSBaseClass,
  uNewUnit, DB;

type
  TNewPajak = class(TSBaseClass)
  private
    FID: Integer;
    FIsDefault: Integer;
    FKode: string;
    FNama: string;
    FPPN: Double;
    FPPNBM: Double;
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
    function GetFieldNameFor_ID: string; dynamic;
    function GetFieldNameFor_IsDefault: string; dynamic;
    function GetFieldNameFor_Kode: string; dynamic;
    function GetFieldNameFor_Nama: string; dynamic;
    function GetFieldNameFor_PPN: string; dynamic;
    function GetFieldNameFor_PPNBM: string; dynamic;
    function GetGeneratorName: string;
    function GetHeaderFlag: Integer;
    function LoadByID(aID : Integer): Boolean;
    function LoadByKode(aKode: string): Boolean;
    function RemoveFromDB: Boolean;
    procedure UpdateData(aID, aIsDefault: Integer; aKode, aNama: string; aPPN,
        aPPNBM: Double);
    property ID: Integer read FID write FID;
    property IsDefault: Integer read FIsDefault write FIsDefault;
    property Kode: string read FKode write FKode;
    property Nama: string read FNama write FNama;
    property PPN: Double read FPPN write FPPN;
    property PPNBM: Double read FPPNBM write FPPNBM;
  end;

function GetDataPajak(unt:Integer): TDataSet;

function GetListPajakByUnitId(aUnit_ID: Integer=0): TDataSet;

function GetDefaultPajak(aUnit_ID: Integer=0): string;

implementation

uses FireDAC.Comp.Client, FireDAC.Stan.Error, udmMain;

function GetDataPajak(unt:Integer): TDataSet;
var
  SQL_GET_LIST_PAJAK, SQL_GET_LIST_PAJAK_BY_UNT: String;
begin
  if unt=0 then
  begin
    SQL_GET_LIST_PAJAK :=
      'SELECT PJK_ID,PJK_CODE,PJK_NAME,PJK_PPN,PJK_PPNBM ' +
      'FROM REF$PAJAK ' +
      ' ORDER BY PJK_CODE';
    Result := cOpenQuery(SQL_GET_LIST_PAJAK);
  end
  else
  begin
    SQL_GET_LIST_PAJAK_BY_UNT :=
      'SELECT PJK_ID,PJK_CODE,PJK_NAME,PJK_PPN,PJK_PPNBM ' +
      'FROM REF$PAJAK ' +
      ' ORDER BY PJK_CODE';
    Result := cOpenQuery(SQL_GET_LIST_PAJAK_BY_UNT);
  end;
end;

function GetListPajakByUnitId(aUnit_ID: Integer=0): TDataSet;
var
   sSQL: String;
begin
  sSQL :=
    'SELECT PJK_ID, PJK_CODE, PJK_NAME, PJK_PPN FROM REF$PAJAK ';
  Result := cOpenQuery(sSQL);
end;

function GetDefaultPajak(aUnit_ID: Integer=0): string;
var aSQL: String;
begin
  aSQL :=
    'SELECT PJK.PJK_NAME FROM REF$PAJAK PJK ' +
    'WHERE PJK.PJK_IS_DEFAULT = 1 ';
  Result := cOpenQuery(aSQL).FieldByName('PJK_NAME').AsString;
end;

{
******************************* TNewBarangPajak ********************************
}
constructor TNewPajak.Create(aOwner : TComponent);
begin
  inherited create(aOwner);
  ClearProperties;
end;

destructor TNewPajak.Destroy;
begin
   inherited Destroy;
end;

procedure TNewPajak.ClearProperties;
begin
  ID :=  0;
  IsDefault := 0;
  Kode := '';
  Nama := '';
  PPN := 0;
  PPNBM := 0;
end;

function TNewPajak.ExecuteCustomSQLTask: Boolean;
begin
  result := True;
end;

function TNewPajak.ExecuteCustomSQLTaskPrior: Boolean;
begin
  result := True;
end;

function TNewPajak.CustomTableName: string;
begin
  result := 'REF$PAJAK';
end;

function TNewPajak.FLoadFromDB( aSQL : String ): Boolean;
begin
  result := false;
  State := csNone;

  ClearProperties;
  with cOpenQuery(aSQL) do
  Begin
      if not EOF then
      begin
         FID := FieldByName(GetFieldNameFor_ID).asInteger;
         FIsDefault := FieldByName(GetFieldNameFor_IsDefault).asInteger;
         FKode := FieldByName(GetFieldNameFor_Kode).asString;
         FNama := FieldByName(GetFieldNameFor_Nama).asString;
         FPPN := FieldByName(GetFieldNameFor_PPN).asFloat;
         FPPNBM := FieldByName(GetFieldNameFor_PPNBM).asFloat;
         Self.State := csLoaded;
         Result := True;
      end;
      Free;
  End;
end;

function TNewPajak.GenerateInterbaseMetaData: Tstrings;
begin
  result := TstringList.create;
  result.Append( '' );
  result.Append( 'Create Table TNewBarangPajak ( ' );
  result.Append( 'TRMSBaseClass_ID Integer not null, ' );
  result.Append( 'ID   Integer Not Null  Unique, ' );
  result.Append( 'IsDefault   Integer Not Null , ' );
  result.Append( 'Kode   Varchar(30) Not Null  Unique, ' );
  result.Append( 'Nama   Varchar(30) Not Null , ' );
  result.Append( 'NewUnit_ID Integer Not Null, ' );
  result.Append( 'PPN   double precision Not Null , ' );
  result.Append( 'PPNBM   double precision Not Null , ' );
  result.Append( 'Stamp TimeStamp ' );
  result.Append( ' ); ' );
end;

function TNewPajak.ExecuteGenerateSQL: Boolean;
var
  S: string;
begin
  result := False;
//  DecimalSeparator := '.';
  if State = csNone then
  Begin
     raise Exception.create('Tidak bisa generate dalam Mode csNone')
  end;

  if not ExecuteCustomSQLTaskPrior then
  begin
    cRollbackTrans;
    Exit;
  end
  else begin
    If FID <= 0 then
    begin
      FID := cGetNextID(GetFieldNameFor_ID, CustomTableName);
      S := 'Insert into ' + CustomTableName
        + ' ( ' + GetFieldNameFor_ID
        + ', ' + GetFieldNameFor_IsDefault
        + ', ' + GetFieldNameFor_Kode
        + ', ' + GetFieldNameFor_Nama
        + ', ' + GetFieldNameFor_PPN
        + ', ' + GetFieldNameFor_PPNBM
        + ') values ('
            + IntToStr( FID) + ', '
            + IntToStr( FIsDefault) + ', '
            + QuotedStr(FKode ) + ','
            + QuotedStr(FNama ) + ','
            + FormatFloat('0.00', FPPN) + ', '
            + FormatFloat('0.00', FPPNBM) + ');'
    end else
    begin
      S := 'Update ' + CustomTableName + ' set  ' + GetFieldNameFor_Kode + ' = ' + QuotedStr(FKode)
            + ' , ' + GetFieldNameFor_IsDefault + ' = ' + IntToStr( FIsDefault)
            + ' , ' + GetFieldNameFor_Kode + ' = ' + QuotedStr( FKode )
            + ' , ' + GetFieldNameFor_Nama + ' = ' + QuotedStr( FNama )
            + ' , ' + GetFieldNameFor_PPN + ' = ' + FormatFloat('0.00', FPPN)
            + ' , ' + GetFieldNameFor_PPNBM + ' = ' + FormatFloat('0.00', FPPNBM)
            + ' Where ' + GetFieldNameFor_ID + ' = ' + IntToStr(FID)
            + ';';
    end;

    if not cExecSQL(S, dbtPOS, False) then
    begin
      cRollbackTrans;
      Exit;
    end
    else
      Result := ExecuteCustomSQLTask;
  end;
end;

function TNewPajak.GetFieldNameFor_ID: string;
begin
  Result := 'PJK_ID';// <<-- Rubah string ini untuk mapping
end;

function TNewPajak.GetFieldNameFor_IsDefault: string;
begin
  Result := 'PJK_IS_DEFAULT';// <<-- Rubah string ini untuk mapping
end;

function TNewPajak.GetFieldNameFor_Kode: string;
begin
  Result := 'PJK_CODE';// <<-- Rubah string ini untuk mapping
end;

function TNewPajak.GetFieldNameFor_Nama: string;
begin
  Result := 'PJK_NAME';// <<-- Rubah string ini untuk mapping
end;

function TNewPajak.GetFieldNameFor_PPN: string;
begin
  Result := 'PJK_PPN';// <<-- Rubah string ini untuk mapping
end;

function TNewPajak.GetFieldNameFor_PPNBM: string;
begin
  Result := 'PJK_PPNBM';// <<-- Rubah string ini untuk mapping
end;

function TNewPajak.GetGeneratorName: string;
begin
  Result := 'gen_ref$pajak_id ';
end;

function TNewPajak.GetHeaderFlag: Integer;
begin
  result := 1425;
end;

function TNewPajak.LoadByID(aID : Integer): Boolean;
begin
  result := FloadFromDB('Select * from ' + CustomTableName
                        + ' Where ' + GetFieldNameFor_ID + ' = ' + IntToStr(aID));
end;

function TNewPajak.LoadByKode(aKode: string): Boolean;
begin
  result := FloadFromDB('Select * from ' + CustomTableName
                        + ' Where ' + GetFieldNameFor_Kode + ' = ' + QuotedStr(aKode));
end;

function TNewPajak.RemoveFromDB: Boolean;
var
  sSQL: string;
begin
  Result := False ;

  sSQL := ' delete from ' + CustomTableName
          + ' where ' + GetFieldNameFor_ID + ' = ' + IntToStr(ID);

  if cExecSQL(sSQL,dbtPOS, False) then
      Result := True; //SimpanBlob(sSQL,GetHeaderFlag);
      
end;

procedure TNewPajak.UpdateData(aID, aIsDefault: Integer; aKode, aNama: string;
    aPPN, aPPNBM: Double);
begin
  FID :=  aID;
  FIsDefault :=  aIsDefault;
  FKode := trim(aKode);
  FNama := trim(aNama);
  FPPN :=  aPPN;
  FPPNBM :=  aPPNBM;
  State := csCreated;
end;



end.
