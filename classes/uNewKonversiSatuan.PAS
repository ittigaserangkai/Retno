unit uNewKonversiSatuan;

interface

uses
  SysUtils, Classes, uTSbaseClass, uNewUnit;

function UpdateByBrgCodeUom(aBarCode: string; aBrgCode: string; aUom: string;
    aUnit: Integer): Boolean;

type
  TKonversiSatuan = class(TSBaseClass)
  private
//    FBarangUnit: Integer;
    FBarcode: string;
    FID: string;
    FIsUpdate: Boolean;
    FIDBarang: string;
    FKodeSatuanFrom: string;
//    FKodeSatuanFromUnit: Integer;
    FKodeSatuanTo: string;
//    FKodeSatuanToUnit: Integer;
//    FNewUnit: TUnit;
    FSkalaKonversi: Double;
    function FLoadFromDB( aSQL : String ): Boolean;
  public
    constructor Create(aOwner : TComponent); override;
    destructor Destroy; override;
    procedure ClearProperties;
    class function CustomTableName: string;
    function ExecuteGenerateSQL: Boolean;
    function ExecuteSQLTask: Boolean;
    function ExecuteSQLTaskPrior: Boolean;
    function GenerateInterbaseMetaData: Tstrings;
    class function GetConversionValue(ABarangID: String; AUnitID: Integer;
        AUOMFrom, AUOMTo: String): Double;
//    class function GetFieldNameFor_BarangUnit: string; dynamic;
    function GetFieldNameFor_Barcode: string; dynamic;
    function GetFieldNameFor_ID: string; dynamic;
    class function GetFieldNameFor_IDBarang: string; dynamic;
    class function GetFieldNameFor_KodeSatuanFrom: string; dynamic;
//    class function GetFieldNameFor_KodeSatuanFromUnit: string; dynamic;
    class function GetFieldNameFor_KodeSatuanTo: string; dynamic;
//    class function GetFieldNameFor_KodeSatuanToUnit: string; dynamic;
    class function GetFieldNameFor_SkalaKonversi: string; dynamic;
//    class function GetFieldNameFor_UnitID: string; dynamic;
    function getGeneratorName: string;
    function GetHeaderFlag: Integer;
    function GetId(aBarangID, aKodeSatuanFrom, aKodeSatuanTo: String; aUnitId:
        Integer): Integer;
    function getListSatuan(aUnitId : Integer): string;
    function GetPlannedID: string;
    function IsBarcodeSudahAda: Boolean;
    function isKodeExist(aKodeBarang : String; aKodeSatuanFrom : String;
        aKodeSatuanTo : String; aExcludeId : Integer; aUnitId : Integer): Boolean;
    function LoadByID(aID: string): Boolean;
    function LoadByKodeBarangAndUOMStock(aKodeBarang : String; ABarangUnitID :
        Integer; aUOMStock : string; aUOMKonversiTo : String): Boolean;
    function RemoveFromDB: Boolean;
    procedure UpdateData(aBarangUnit: Integer; aID, aKodeBarang, aKodeSatuanFrom:
        string; aKodeSatuanFromUnit: Integer; aKodeSatuanTo: string;
        aKodeSatuanToUnit: Integer; aSkalaKonversi: Double; aUnitID, aBarcode:
        string);
    function UpdateDataAfterUpdate: Boolean;
    function UpdateValueBarangHargaJual: Boolean;
//    property BarangUnit: Integer read FBarangUnit write FBarangUnit;
    property Barcode: string read FBarcode write FBarcode;
    property ID: string read FID write FID;
    property IsUpdate: Boolean read FIsUpdate write FIsUpdate;
    property IDBarang: string read FIDBarang write FIDBarang;
    property KodeSatuanFrom: string read FKodeSatuanFrom write FKodeSatuanFrom;
//    property KodeSatuanFromUnit: Integer read FKodeSatuanFromUnit write
//        FKodeSatuanFromUnit;
    property KodeSatuanTo: string read FKodeSatuanTo write FKodeSatuanTo;
//    property KodeSatuanToUnit: Integer read FKodeSatuanToUnit write
//        FKodeSatuanToUnit;
//    property NewUnit: TUnit read FNewUnit write FNewUnit;
    property SkalaKonversi: Double read FSkalaKonversi write FSkalaKonversi;
  end;

implementation

uses FireDAC.Comp.Client, FireDAC.Stan.Error, udmMain;

const
  _GetHeaderFlag : Integer = 288;

{
******************************* TKonversiSatuan ********************************
}
constructor TKonversiSatuan.Create(aOwner : TComponent);
begin
  inherited create(aOwner);
//  NewUnit := TUnit.Create(Self);
  ClearProperties;
end;

destructor TKonversiSatuan.Destroy;
begin
//   FNewUnit.Free;
   inherited Destroy;
end;

procedure TKonversiSatuan.ClearProperties;
begin
  IsUpdate := False;
//  BarangUnit := 0;
  ID := '';
  IDBarang := '';
  KodeSatuanFrom := '';
//  KodeSatuanFromUnit := 0;
  KodeSatuanTo := '';
//  KodeSatuanToUnit := 0;
  SkalaKonversi := 0;
  Barcode := '';

//  NewUnit.ClearProperties;
end;

class function TKonversiSatuan.CustomTableName: string;
begin
  result := 'REF$KONVERSI_SATUAN';
end;

function TKonversiSatuan.ExecuteGenerateSQL: Boolean;
var
//  lDecimalSeparator: Char;
  S: string;
begin
  result := False;
//  lDecimalSeparator := DecimalSeparator;
//  DecimalSeparator := '.';

  try
    if State = csNone then
    Begin
       raise Exception.create('Tidak bisa generate dalam Mode csNone');
    end;

    if not ExecuteSQLTaskPrior then
    begin
      cRollbackTrans;
      Exit;
    end else begin
//      if FID <= 0 then
      if FID = '' then
      begin
//        FID := cGetNextID(GetFieldNameFor_ID, CustomTableName);
        FID := cGetNextIDGUIDToString;
        S := 'Insert into ' + CustomTableName + ' ( '
//            + GetFieldNameFor_BarangUnit + ', '
            + GetFieldNameFor_ID + ', '
            + GetFieldNameFor_IDBarang + ', '
            + GetFieldNameFor_KodeSatuanFrom + ', '
//            + GetFieldNameFor_KodeSatuanFromUnit + ', '
            + GetFieldNameFor_KodeSatuanTo + ', '
//            + GetFieldNameFor_KodeSatuanToUnit + ', '
            + GetFieldNameFor_SkalaKonversi + ', '
//            + GetFieldNameFor_UnitID + ','
            + GetFieldNameFor_Barcode + ') values ('
//            + IntToStr( FBarangUnit) + ', '
            + QuotedStr(FID) + ', '
            + QuotedStr(FIDBarang ) + ','
            + QuotedStr(FKodeSatuanFrom ) + ','
//            + IntToStr( FKodeSatuanFromUnit) + ', '
            + QuotedStr(FKodeSatuanTo ) + ','
//            + IntToStr( FKodeSatuanToUnit) + ', '
            + FormatFloat(siFrtDec8, FSkalaKonversi) + ', '
//            + IntToStr( FNewUnit.ID)  + ','
            + QuotedStr( FBarcode)
            + ');';
      end else
      begin
        S := 'Update ' + CustomTableName + ' Set '
//            + GetFieldNameFor_BarangUnit + ' = ' + IntToStr( FBarangUnit) + ' , '
            + GetFieldNameFor_IDBarang + ' = ' + QuotedStr( FIDBarang ) + ' , '
            + GetFieldNameFor_KodeSatuanFrom + ' = ' + QuotedStr( FKodeSatuanFrom ) + ' , '
//            + GetFieldNameFor_KodeSatuanFromUnit + ' = ' + IntToStr( FKodeSatuanFromUnit) + ' , '
            + GetFieldNameFor_KodeSatuanTo + ' = ' + QuotedStr( FKodeSatuanTo ) + ' , '
            + GetFieldNameFor_Barcode + ' = ' + QuotedStr( FBarcode ) + ' , '
//            + GetFieldNameFor_KodeSatuanToUnit + ' = ' + IntToStr( FKodeSatuanToUnit) + ' , '
            + GetFieldNameFor_SkalaKonversi + ' = ' + FormatFloat(siFrtDec8, FSkalaKonversi)
            + ' where '
//            + GetFieldNameFor_UnitID + ' = ' + IntToStr( FNewUnit.ID) + ' and '
            + GetFieldNameFor_ID + ' = ' + QuotedStr(FID) + ';';
      end;

      if not cExecSQL(S, dbtPOS, False) then
      begin
        cRollbackTrans;
        Exit;
      end else begin
        Result := ExecuteSQLTask;
      end;
    end;
  finally
//    DecimalSeparator := lDecimalSeparator;

  end;
end;

function TKonversiSatuan.ExecuteSQLTask: Boolean;
var
  sSQL: string;
begin
  result := False;
  sSQL := 'update barang_harga_Jual'
        + ' set bhj_conv_value = ' + FormatFloat(siFrtDec2, FSkalaKonversi)
        + ' where bhj_brg_code = ' + QuotedStr(FIDBarang)
        + ' and bhj_sat_code = ' + QuotedStr(FKodeSatuanFrom)
//        + ' and bhj_sat_code_unt_id = ' + IntToStr(FNewUnit.ID)
        + ';';

  if cExecSQL(sSQL, dbtPOS, False) then
  begin
    Result := True
  end else begin
    cRollbackTrans;
  end;

  {if not UpdateValueBarangHargaJual then
  begin
    cRollbackTrans;
    Exit
  end else begin
    sSQL := 'select I2_INT1, I2_INT2 from SYNC$I2'
          + ' where I2_INT1 = ' + IntToStr(ID)
          + ' and I2_INT2 = ' + IntToStr(UnitID)
          + ' and I2_NAME = ' + QuotedStr('REF$KONVERSI_SATUAN');

    SS := TStringList.Create;
    with cOpenQuery(sSQL) do
    begin
      try
        while not Eof do
        begin
          if (FieldByName('I2_INT1').IsNull) and (FieldByName('I2_INT2').IsNull) then
          begin
            sSQL := 'insert into SYNC$I2 (I2_INT1, I2_INT2, I2_OP, I2_NAME)'
                    + ' values ( ' + IntToStr(ID)+ ',' + IntToStr(UnitID) + ','
                    + QuotedStr('I') + ',' + QuotedStr('REF$KONVERSI_SATUAN') + ');'
          end else begin
            sSQL := 'update SYNC$I2 set I2_OP = ' + QuotedStr('U') + ','
                    + ' I2_TIME = CURRENT_TIMESTAMP '
                    + ' where I2_INT1 = ' + FieldByName('I2_INT1').AsString
                    + ' and I2_INT2 = ' + FieldByName('I2_INT2').AsString
                    + ' and I2_NAME = ' + QuotedStr('REF$KONVERSI_SATUAN') + ';';
          end;
          SS.Add(sSQL);

        end;
      finally
        Free;
        SS.Free;
      end;
    end;
  end;
  }
end;

function TKonversiSatuan.ExecuteSQLTaskPrior: Boolean;
begin
//  if ID = 0 then
  if ID = '' then
    IsUpdate := False
  else
    IsUpdate := True;

  result := True;
end;

function TKonversiSatuan.FLoadFromDB( aSQL : String ): Boolean;
var
  iQ: TFDQuery;
begin
  result := false;
  State := csNone;

  ClearProperties;
  try
    iQ := cOpenQuery(aSQL, dbtPOS, True);
    with iQ do
    Begin
        if not EOF then
        begin
//           FBarangUnit          := FieldByName(GetFieldNameFor_BarangUnit).asInteger;
           FID                  := FieldByName(GetFieldNameFor_ID).asString;
           FIDBarang          := FieldByName(GetFieldNameFor_IDBarang).asString;
           FKodeSatuanFrom      := FieldByName(GetFieldNameFor_KodeSatuanFrom).asString;
//           FKodeSatuanFromUnit  := FieldByName(GetFieldNameFor_KodeSatuanFromUnit).asInteger;
           FKodeSatuanTo        := FieldByName(GetFieldNameFor_KodeSatuanTo).asString;
//           FKodeSatuanToUnit    := FieldByName(GetFieldNameFor_KodeSatuanToUnit).asInteger;
           FSkalaKonversi       := FieldByName(GetFieldNameFor_SkalaKonversi).asFloat;
           FBarcode             := FieldByName(GetFieldNameFor_Barcode).AsString;

//           FNewUnit.LoadByID(FieldByName(GetFieldNameFor_UnitID).AsString);
           Self.State           := csLoaded;
           Result := True;
        end;
    End;
  finally
    FreeAndNil(iQ);
  end;
end;

function TKonversiSatuan.GenerateInterbaseMetaData: Tstrings;
begin
  result := TstringList.create;
  result.Append( '' );
  result.Append( 'Create Table TKonversiSatuan ( ' );
  result.Append( 'TRMSBaseClass_ID Integer not null, ' );
  result.Append( 'BarangUnitID   Integer Not Null , ' );
  result.Append( 'ID   Integer Not Null  Unique, ' );
  result.Append( 'IDBarang   Varchar(30) Not Null , ' );
  result.Append( 'KodeSatuanFrom   Varchar(30) Not Null , ' );
  result.Append( 'KodeSatuanFromUnitID   Integer Not Null , ' );
  result.Append( 'KodeSatuanTo   Varchar(30) Not Null , ' );
  result.Append( 'KodeSatuanToUnitID   Integer Not Null , ' );
  result.Append( 'SkalaKonversi   double precision Not Null , ' );
  result.Append( 'UnitID   Integer Not Null  Unique, ' );
  result.Append( 'Stamp TimeStamp ' );
  result.Append( ' ); ' );
end;

class function TKonversiSatuan.GetConversionValue(ABarangID: String; AUnitID:
    Integer; AUOMFrom, AUOMTo: String): Double;
var
  sSQL: string;
begin
  Result := 0;
  sSQL := 'select ' + GetFieldNameFor_SkalaKonversi
        + ' from ' + CustomTableName
        + ' where ' + GetFieldNameFor_IDBarang + ' = ' + QuotedStr(ABarangID)
//        + ' and ' + GetFieldNameFor_BarangUnit + ' = ' + IntToStr(AUnitID)
        + ' and ' + GetFieldNameFor_KodeSatuanFrom + ' = ' + QuotedStr(AUOMFrom)
        + ' and ' + GetFieldNameFor_KodeSatuanTo + ' = ' + QuotedStr(AUOMTo);

  with cOpenQuery(sSQL, dbtPOS, True) do
  begin
    try
      if not eof then
      begin
        Result := Fields[0].AsFloat;
      end;
    finally
      Free;
    end;
  end;
end;

//class function TKonversiSatuan.GetFieldNameFor_BarangUnit: string;
//begin
//  Result := 'KONVSAT_BRG_UNT_ID';// <<-- Rubah string ini untuk mapping
//end;

function TKonversiSatuan.GetFieldNameFor_Barcode: string;
begin
  Result := 'KONVSAT_BARCODE';
end;

function TKonversiSatuan.GetFieldNameFor_ID: string;
begin
//  Result := 'KONVSAT_ID';// <<-- Rubah string ini untuk mapping
  Result := 'REF$KONVERSI_SATUAN_ID'
end;

class function TKonversiSatuan.GetFieldNameFor_IDBarang: string;
begin
//  Result := 'KONVSAT_BRG_CODE';// <<-- Rubah string ini untuk mapping
  Result := 'BARANG_ID';
end;

class function TKonversiSatuan.GetFieldNameFor_KodeSatuanFrom: string;
begin
  Result := 'KONVSAT_SAT_CODE_FROM';// <<-- Rubah string ini untuk mapping
end;

//class function TKonversiSatuan.GetFieldNameFor_KodeSatuanFromUnit: string;
//begin
//  Result := 'KONVSAT_SCF_UNT_ID';// <<-- Rubah string ini untuk mapping
//end;

class function TKonversiSatuan.GetFieldNameFor_KodeSatuanTo: string;
begin
  Result := 'KONVSAT_SAT_CODE_TO';// <<-- Rubah string ini untuk mapping
end;

//class function TKonversiSatuan.GetFieldNameFor_KodeSatuanToUnit: string;
//begin
//  Result := 'KONVSAT_SCT_UNT_ID';// <<-- Rubah string ini untuk mapping
//end;

class function TKonversiSatuan.GetFieldNameFor_SkalaKonversi: string;
begin
  Result := 'KONVSAT_SCALE';// <<-- Rubah string ini untuk mapping
end;

//class function TKonversiSatuan.GetFieldNameFor_UnitID: string;
//begin
//  Result := 'KONVSAT_UNT_ID';// <<-- Rubah string ini untuk mapping
//end;

function TKonversiSatuan.getGeneratorName: string;
begin
  Result := 'gen_ref$konversi_satuan_id';
end;

function TKonversiSatuan.GetHeaderFlag: Integer;
begin
  result := 288;
end;

function TKonversiSatuan.GetId(aBarangID, aKodeSatuanFrom, aKodeSatuanTo:
    String; aUnitId: Integer): Integer;
var
  iQ: TFDQuery;
 sSQL : string;
begin
  Result := 0;

  sSQL := 'select ' + GetFieldNameFor_ID
          + ' from ' + CustomTableName
          + ' where ' + GetFieldNameFor_IDBarang + ' = ' + QuotedStr(aBarangID)
          + ' AND ' + GetFieldNameFor_KodeSatuanFrom + ' = ' + QuotedStr(aKodeSatuanFrom)
          + ' AND ' + GetFieldNameFor_KodeSatuanTo + ' = ' + QuotedStr(aKodeSatuanTo);
//          + ' AND ' + GetFieldNameFor_UnitID + ' = ' + IntToStr(aUnitId);

 try
   iQ := cOpenQuery(sSQL, dbtPOS, True);
    with iQ do
    begin
        if not Fields[0].IsNull then
        begin
          result := Fields[0].AsInteger;
        end;
    end;
 finally
  FreeAndNil(iQ);
 end;
end;

function TKonversiSatuan.getListSatuan(aUnitId : Integer): string;
var sSQL : string;
begin

  Result := '';

  sSQL := 'select a.SAT_CODE from REF$SATUAN a where a.SAT_UNT_ID = ' + IntToStr(aUnitId);

  with cOpenQuery(sSQL, dbtPOS, True) do
  begin
    try
      if not Fields[0].IsNull then
      begin
        result := Fields[0].AsString;
      end;
    finally
    free;
    end;
  end;

end;

function TKonversiSatuan.GetPlannedID: string;
begin
//  result := -1;
  Result := '';
  if State = csNone then
  begin
    Raise exception.create('Tidak bisa GetPlannedID di Mode csNone');
    exit;
  end else
  if state = csCreated then
  begin
//    result := cGetNextID(GetFieldNameFor_ID, CustomTableName);
    Result := cGetNextIDGUIDToString;
  end else
  if State = csLoaded then
  begin
    Result := FID;
  end;
end;

function TKonversiSatuan.IsBarcodeSudahAda: Boolean;
var
  sSQL: string;
begin
  Result := False;
  sSQL := 'select count(1)'
          + ' from ' + CustomTableName + ' where '
//          + ' konvsat_unt_id = ' + IntToStr(NewUnit.ID) + ' and '
          + GetFieldNameFor_Barcode + ' = ' + QuotedStr(FBarcode) + ' and '
          + GetFieldNameFor_ID + ' <> ' + QuotedStr(FID);

  with cOpenQuery(sSQL, dbtPOS, True) do
  begin
    try
      if Fields[0].AsInteger > 0 then
        Result := True

    finally
      Free;
    end;
  end;

end;

function TKonversiSatuan.isKodeExist(aKodeBarang : String; aKodeSatuanFrom :
    String; aKodeSatuanTo : String; aExcludeId : Integer; aUnitId : Integer): Boolean;
var sSQL : string;
begin
  Result := false ;

  sSQL := 'select count ( ' + GetFieldNameFor_ID + ') as jumlah '
           + ' from '+ CustomTableName
           + ' where ' + GetFieldNameFor_IDBarang + ' = ' + QuotedStr(aKodeBarang)
           + ' AND ' + GetFieldNameFor_KodeSatuanFrom + ' = ' + QuotedStr(aKodeSatuanFrom)
           + ' AND ' + GetFieldNameFor_KodeSatuanTo + ' = ' + QuotedStr(aKodeSatuanTo)
           + ' AND ' + GetFieldNameFor_ID + ' <> ' + IntToStr(aExcludeId);
//           + ' AND ' + GetFieldNameFor_UnitID + ' = ' + IntToStr(aUnitId);

    with cOpenQuery(sSQL, dbtPOS, True) do
  begin
    try
      while not EOF do
      begin
        if FieldByName('Jumlah').AsInteger > 0 then
          Result := True;
        Next;
      end;
    finally
      Free;
    end;
  end;
end;

function TKonversiSatuan.LoadByID(aID: string): Boolean;
begin
  result := FloadFromDB('Select * from ' + CustomTableName
                       + ' Where ' + GetFieldNameFor_ID + '  = ' + QuotedStr(aID)
                       );
end;

function TKonversiSatuan.LoadByKodeBarangAndUOMStock(aKodeBarang : String;
    ABarangUnitID : Integer; aUOMStock : string; aUOMKonversiTo : String):
    Boolean;
var
  sSQL: string;
begin
  sSQL := ' select * '
          + ' from ref$konversi_satuan '
          + ' where konvsat_brg_code = ' + QuotedStr(aKodeBarang)
          + ' and konvsat_brg_unt_id = ' + IntToStr(ABarangUnitID)
          + ' and konvsat_sat_code_from = ' + QuotedStr(aUOMStock)
          + ' and konvsat_sat_code_to = ' + QuotedStr(aUOMKonversiTo);

  Result := FLoadFromDB(sSQL);

end;

function TKonversiSatuan.RemoveFromDB: Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'delete from ' + CustomTableName
          + ' where ' + GetFieldNameFor_ID + ' = ' + QuotedStr(ID);
//          + ' and ' + GetFieldNameFor_UnitID + ' = ' + IntToStr(NewUnit.ID);

  if not cExecSQL(sSQL, dbtPOS, False) then
  begin
    cRollbackTrans;
    Exit;
  end
  else begin
//    sSQL := 'delete from barang_harga_Jual'
//            + ' where bhj_brg_code = ' + QuotedStr(FIDBarang)
//            + ' and bhj_sat_code = ' + QuotedStr(FKodeSatuanFrom);
//            + ' and bhj_sat_code_unt_id = ' + IntToStr(FNewUnit.ID);
//
//    if cExecSQL(sSQL, dbtPOS, False) then
//    begin
//      Result := True
//    end else begin
//      cRollbackTrans;
//    end;
  end;
end;

procedure TKonversiSatuan.UpdateData(aBarangUnit: Integer; aID, aKodeBarang,
    aKodeSatuanFrom: string; aKodeSatuanFromUnit: Integer; aKodeSatuanTo:
    string; aKodeSatuanToUnit: Integer; aSkalaKonversi: Double; aUnitID,
    aBarcode: string);
begin
//  FBarangUnit         := aBarangUnit;
  FID                 := aID;
  FIDBarang           := Trim(aKodeBarang);
  FKodeSatuanFrom     := Trim(aKodeSatuanFrom);
//  FKodeSatuanFromUnit := aKodeSatuanFromUnit;
  KodeSatuanTo        := Trim(aKodeSatuanTo);
//  FKodeSatuanToUnit   := aKodeSatuanToUnit;
  FSkalaKonversi      := aSkalaKonversi;

//  FNewUnit.LoadByID(aUnitID);
  Barcode := aBarcode;
  State := csCreated;
end;

function TKonversiSatuan.UpdateDataAfterUpdate: Boolean;
//var
  //SS: TStrings;
  //sSQL: String;
begin
  Result := True;
  {sSQL := 'select I2_INT1_OLD, I2_INT2_OLD, I2_OP '
          + ' from SYNC$I2'
          + ' where I2_INT1_OLD = ' + IntToStr(ID)
          + ' and I2_INT2_OLD = ' + IntToStr(NewUnit.ID)
          + ' and I2_NAME = ' + QuotedStr('REF$KONVERSI_SATUAN');

  SS := TStringList.Create;
  with cOpenQuery(sSQL) do
  begin
    try
      if  (FieldByName('I2_INT1_OLD').IsNull and FieldByName('I2_INT2_OLD').IsNull) then
      begin
        sSQL := 'select I2_INT1, I2_INT2, I2_OP '
                + ' from SYNC$I2 '
                + ' where I2_INT1 = ' + IntToStr(ID)
                + ' and I2_INT2 = ' + IntToStr(NewUnit.ID)
                + ' and I2_NAME = ' + QuotedStr('REF$KONVERSI_SATUAN');

        with cOpenQuery(sSQL) do
        begin
          if  (FieldByName('I2_INT1').IsNull and FieldByName('I2_INT2').IsNull) then
          begin
            sSQL := 'insert into SYNC$I2 (I2_INT1, I2_INT2, I2_INT1_OLD, I2_INT2_OLD, I2_OP, I2_NAME)'
                    + ' values ('
                    + IntToStr(ID) + ','
                    + IntToStr(NewUnit.ID) + ','
                    + IntToStr(ID) + ','
                    + IntToStr(NewUnit.ID) + ','
                    + QuotedStr('U') + ','
                    + QuotedStr('REF$KONVERSI_SATUAN') + ')';
            SS.Add(sSQL);
          end else begin
            sSQL := ' update SYNC$I2'
                    + ' set I2_INT1 = ' + IntToStr(ID)
                    + ' I2_INT2 = '  + IntToStr(NewUnit.ID)
                    + ' where I2_INT1 = ' + IntToStr(ID)
                    + ' and I2_INT2 = ' + IntToStr(NewUnit.ID)
                    + ' and I2_NAME = ' + QuotedStr('REF$KONVERSI_SATUAN');
          end;
        end;
      end else begin
        if (FieldByName('I2_OP').AsString <> 'I') then
        begin
          sSQL := 'update SYNC$I2 set I2_OP = ' + QuotedStr('U') + ','
                  + ' I2_INT1 = ' + IntToStr(ID) + ','
                  + ' I2_INT2 = ' + IntToStr(NewUnit.ID) + ','
                  + ' I2_TIME = CURRENT_TIMESTAMP '
                  + ' where I2_INT1_OLD =  ' + FieldByName('I2_INT1_OLD').AsString
                  + ' and I2_INT2_OLD = ' + FieldByName('I2_INT2_OLD').AsString
                  + ' and I2_NAME = ' + QuotedStr('REF$KONVERSI_SATUAN') ;
          SS.Add(sSQL);
        end;
      end;
    finally
      Free;
      SS.Free;
    end;
  end;
  }
end;

function TKonversiSatuan.UpdateValueBarangHargaJual: Boolean;
var
  sSQL: String;
  SS: TStrings;
begin
  sSQL := 'select a.bhj_id, a.bhj_unt_id'
          + ' from barang_harga_jual a'
          + ' left join barang b on a.bhj_brg_code = b.brg_code and a.bhj_brg_code_unt_id = b.brg_unt_id'
          + ' where a.bhj_brg_code = ' + QuotedStr(IDBarang)
//          + ' and a.bhj_brg_code_unt_id = ' + IntToStr(NewUnit.ID)
          + ' and a.bhj_sat_code = ' + QuotedStr(KodeSatuanTo)
//          + ' and a.bhj_sat_code_unt_id = ' + IntToStr(KodeSatuanToUnit)
          + ' and b.brg_sat_code_stock = ' + QuotedStr(KodeSatuanFrom);
//          + ' and b.brg_sat_unt_id = ' + IntToStr(KodeSatuanFromUnit);

  SS := TStringList.Create;
  with cOpenQuery(sSQL, dbtPOS, True) do
  begin
    try
      while not Eof do
      begin
        sSQL := ' update barang_harga_jual '
                + ' set bhj_conv_value = '
                + ' where bhj_id = ' + FieldByName('bhj_id').AsString
                + ' and bhj_unt_id = ' + FieldByName('bhj_unt_id').AsString
                + ';';
        SS.Add(sSQL);
      end;

      Result := cExecSQL(SS);
    finally
      Free;
      SS.Free;
    end;
  end;
end;

function UpdateByBrgCodeUom(aBarCode: string; aBrgCode: string; aUom: string;
    aUnit: Integer): Boolean;
var
  sSQL : string;
begin
  sSQL  := 'UPDATE REF$KONVERSI_SATUAN set KONVSAT_BARCODE = '+ QuotedStr(aBarCode)
    + ' WHERE KONVSAT_BRG_CODE = '+ QuotedStr(aBrgCode)
    + ' AND KONVSAT_SAT_CODE_FROM = '+ QuotedStr(aUom)
    + ' AND KONVSAT_BRG_UNT_ID = '+ IntToStr(aUnit)
    + ';';

  if cExecSQL(sSQL,dbtStore, False) then //and SimpanBlob(sSQL,_GetHeaderFlag) then
  begin
    Result  := True;
    cRollbackTrans;
  end
  else
    Result  := False;

end;



end.
