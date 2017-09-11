unit uNewBarangStockSirkulasi;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uNewUnit, uNewBarang, uNewUOM;

type
  TBarangStockSirkulasiItem = class(TCollectionItem)
  private
    FHargaTransaksi: Double;
    FHargaLastCost: Double;
    FHEADERFLAG: Integer;
    FID: Integer;
    FISBONUSFORBONUS: Integer;
    FIsEOD: Integer;
    FITEM_ID: Integer;
    FKeterangan: string;
    FNewBarang: TNewBarang;
    FNewBarangKode: string;
    FNewUnit: TUnit;
    FNewUnitID: string;
    FNewUOM: TNewUOM;
    FNewUOMKode: string;
    FNoBukti: string;
    FQty: Double;
    FTglBukti: TDateTime;
    FTypeTransaksi: string;
    FUOMUnit: TUnit;
    function GetNewBarang: TNewBarang;
    function GetNewUnit: TUnit;
    function GetNewUOM: TNewUOM;
    function GetUOMUnit: TUnit;
  public
    constructor Create(aCollection : TCollection); override;
    destructor destroy; override;
    procedure ClearProperties;
    function CustomTableName: string;
    function ExecuteGenerateSQL(aHeaderNo : string; aID : Integer; aUnitID :
        Integer): Boolean;
    function GetFieldNameFor_HargaTransaksi: string;
    function GetFieldNameFor_HargaLastCost: string;
    function GetFieldNameFor_HeaderFlag: string; dynamic;
    function GetFieldNameFor_ID: string; dynamic;
    function GetFieldNameFor_IsBonusForBonus: string; dynamic;
    function GetFieldNameFor_IsEOD: string; dynamic;
    function GetFieldNameFor_ItemID: string; dynamic;
    function GetFieldNameFor_Keterangan: string; dynamic;
    function GetFieldNameFor_NewBarang: string; dynamic;
    function GetFieldNameFor_NewUnit: string; dynamic;
    function GetFieldNameFor_NewUOM: string; dynamic;
    function GetFieldNameFor_NoBukti: string; dynamic;
    function GetFieldNameFor_Qty: string; dynamic;
    function GetFieldNameFor_Tanggal: string; dynamic;
    function GetFieldNameFor_TypeTransaksi: string; dynamic;
    function GetGeneratorName: string;
    class function RemoveFromDB(aID : Integer; aUnitId : Integer): string;
    procedure UpdateData(aHeaderFlag, aID, aIsEOD, aItemID: Integer; aKeterangan,
        aNewBArangKode, aNewUnitID, aNewUOMKode, aNoBukti: string; aQty: Double;
        aTanggal: TDateTime; ATypeTransaksi: string; aIsBonusForBonus: Integer;
        aHargaTransaksi: Double = 0; aHargaLastCost: Double = 0);
    property HargaTransaksi: Double read FHargaTransaksi write FHargaTransaksi;
    property HargaLastCost: Double read FHargaLastCost write FHargaLastCost;
    property HEADERFLAG: Integer read FHEADERFLAG write FHEADERFLAG;
    property ID: Integer read FID write FID;
    property ISBONUSFORBONUS: Integer read FISBONUSFORBONUS write FISBONUSFORBONUS;
    property IsEOD: Integer read FIsEOD write FIsEOD;
    property ITEM_ID: Integer read FITEM_ID write FITEM_ID;
    property Keterangan: string read FKeterangan write FKeterangan;
    property NewBarang: TNewBarang read GetNewBarang write FNewBarang;
    property NewUnit: TUnit read GetNewUnit write FNewUnit;
    property NewUOM: TNewUOM read GetNewUOM write FNewUOM;
    property NoBukti: string read FNoBukti write FNoBukti;
    property Qty: Double read FQty write FQty;
    property TglBukti: TDateTime read FTglBukti write FTglBukti;
    property TypeTransaksi: string read FTypeTransaksi write FTypeTransaksi;
    property UOMUnit: TUnit read GetUOMUnit write FUOMUnit;
    property KodeBarang: string read FNewBarangKode;
    property KodeUom: string read FNewUOMKode;
    property UnitID: string read FNewUnitID;

  end;
  
  TBarangStockSirkulasiItems = class(TCollection)
  private
    function GetBarangStockSirkulasiItem(Index: Integer):
            TBarangStockSirkulasiItem;
    procedure SetBarangStockSirkulasiItem(Index: Integer; Value:
            TBarangStockSirkulasiItem);
  public
    function Add: TBarangStockSirkulasiItem;
    function CustomTableName: string;
    function CekBarangStockSirkulasi(aHeaderNo : string;aUnitID: Integer): Boolean;
    function GetHeaderFlag: Integer;
    procedure LoadByID(aID : Integer; aUnitID : Integer);
    procedure LoadByNoBukti(aNoBukti : String; aUnitID : Integer; aHeaderFlag :
        Integer);
    class function RemoveByDocNo(aDocNo : String; aUnitID : Integer; aTipe :
        String): Boolean;
    function SaveToDatabase(aHeaderNo : string; aUnitID : Integer): Boolean;
    property BarangStockSirkulasiItem[Index: Integer]:
            TBarangStockSirkulasiItem read GetBarangStockSirkulasiItem write
            SetBarangStockSirkulasiItem; default;
  end;
  

implementation

uses DB, dateutils, udmMain, uAppUtils;

{
************************** TBarangStockSirkulasiItem ***************************
}
constructor TBarangStockSirkulasiItem.Create(aCollection : TCollection);
begin
  inherited create(aCollection);
  
end;

destructor TBarangStockSirkulasiItem.destroy;
begin
  // FNewBarang.free;
   //FNewBarangUnit.free;
  // FNewUnit.free;
  // FNewUOM.free;
  // FUOMUnit.free;
   inherited Destroy;
end;

procedure TBarangStockSirkulasiItem.ClearProperties;
begin
  //HEADER_FLAG := '';
  ID := 0;
  IsEOD := 0;
  Keterangan := '';
  FNewBarangKode := '';
  if FNewBarang <> nil then
    FreeAndNil(FNewBarang);



  FNewUnitID := '';
  if FNewUnit <> nil then
    FreeAndNil(FNewUnit);

  FNewUOMKode := '';
  if FNewUOM <> nil then
    FreeAndNil(FNewUOM);

  NoBukti := '';
  Qty := 0;
  TglBukti := cGetServerDateTime;
  TypeTransaksi := '';

  if FUOMUnit <> nil then
    FreeAndNil(fUOMUnit);

end;

function TBarangStockSirkulasiItem.CustomTableName: string;
begin
  result := 'BARANG_STOK_SIRKULASI';
end;

function TBarangStockSirkulasiItem.ExecuteGenerateSQL(aHeaderNo : string; aID :
    Integer; aUnitID : Integer): Boolean;
var
  iMiliSecond: Word;
  iSecond: Word;
  iMinute: Word;
  iHour: Word;
  iDay: Word;
  iMonth: Word;
  iYear: Word;
  S: string;
  dLastCost : Double;
begin
  //Result := False;

  DecodeDateTime(cGetServerDateTime, iYear,iMonth,iDay,iHour,iMinute,iSecond,iMiliSecond);
  FTglBukti := EncodeDateTime(YearOf(FTglBukti), MonthOf(FTglBukti), DayOf(FTglBukti),iHour,iMinute,iSecond,iMiliSecond);

  IF Qty <> 0 then
  begin
    FID := aID;
    FNoBukti := aHeaderNo;
    if FID <= 0 then
    begin
      if FHargaLastCost = 0 then
         dLastCost := NewBarang.HargaLastCost * TNewBarang.GetUOMValue(FNewBarangKode, FNewUOMKode)
      else
         dLastCost := FHargaLastCost;
      ID := cGetNextID(GetFieldNameFor_ID, CustomTableName);
      S := 'Insert into ' + CustomTableName + ' ( '
       + GetFieldNameFor_ID + ', '
       + GetFieldNameFor_IsEOD + ', '
       + GetFieldNameFor_Keterangan + ', '
       + GetFieldNameFor_NewBarang + ', '
       + GetFieldNameFor_NewUnit + ', '
       + GetFieldNameFor_NewUOM + ', '
       + GetFieldNameFor_NoBukti + ', '
       + GetFieldNameFor_Qty + ', '
       + GetFieldNameFor_Tanggal + ', '
       + GetFieldNameFor_TypeTransaksi + ', '
       + GetFieldNameFor_HeaderFlag +  ' , '
       + GetFieldNameFor_ItemID + ', '
       + GetFieldNameFor_IsBonusForBonus + ','
       + GetFieldNameFor_HargaTransaksi 
       + ', ' + GetFieldNameFor_HargaLastCost +
            ') values ('
       + IntToStr( FID) + ', '
       + IntToStr( FIsEOD) + ', '
       + QuotedStr(FKeterangan ) + ','
       + QuotedStr(FNewBarangKode) + ', '
       + QuotedStr(FNewUnitID) + ', '
       + QuotedStr(FNewUOMKode) + ', '
       + QuotedStr(aHeaderNo ) + ','
       + FormatFloat('0.000', FQty) + ', '
       + TAppUtils.Quotdt( FTglBukti ) + ', '
       + QuotedStr(FTypeTransaksi ) + ','
       + IntToStr(FHEADERFLAG) + ', '
       + IntToStr(FITEM_ID) + ', '
       + IntToStr(FISBONUSFORBONUS) + ','
       + FormatFloat('0.00', FHargaTransaksi)
       + ', ' + FormatFloat('0.00', dLastCost)
       + ');';
    end
    else begin
      //FID := aID;
      S := 'Update ' + CustomTableName
       + ' set ' + GetFieldNameFor_NewBarang + ' = ' + QuotedStr(FNewBarangKode) + ', '
       + GetFieldNameFor_IsBonusForBonus + ' = ' + IntToStr(FISBONUSFORBONUS) + ', '
       + GetFieldNameFor_NewUOM + ' = ' + QuotedStr(FNewUOMKode) + ', '
       + GetFieldNameFor_NewUnit + ' = ' + QuotedStr(FNewUnitID) + ', '
       + GetFieldNameFor_IsEOD + ' = ' + IntToStr(FIsEOD)+ ', '
       + GetFieldNameFor_ItemID + ' = ' + IntToStr(FITEM_ID) + ', '
       + GetFieldNameFor_Keterangan + ' = ' + QuotedStr(FKeterangan) + ', '
       + GetFieldNameFor_Qty + ' = ' + FormatFloat('0.000', FQty) + ', '
       + GetFieldNameFor_HargaTransaksi + ' = ' + FormatFloat('0.00', FHargaTransaksi) + ', '
       + GetFieldNameFor_Tanggal + ' = ' + TAppUtils.QuotDt(FTglBukti) + ', '
       + GetFieldNameFor_TypeTransaksi + ' = ' + QuotedStr(FTypeTransaksi)
       + ' where '+ GetFieldNameFor_NoBukti +' = ' + QuotedStr(aHeaderNo)
       + ' and ' + GetFieldNameFor_NewUnit + ' = ' + QuotedStr(FNewUnitID)
       + ' and ' + GetFieldNameFor_HeaderFlag + ' = ' + IntToStr(FHeaderflag)
       + ' and ' + GetFieldNameFor_ID + ' = ' + IntToStr(FID)
       + ';';
    end;

     if not cExecSQL(s,dbtPOS, False) then
     begin
        cRollbackTrans;
        raise Exception.Create('ATTENTION ' + s + ' is not valid SQL statement ');
     end else
       Result := True;
  end else
    Result := True;
end;

function TBarangStockSirkulasiItem.GetFieldNameFor_HargaTransaksi: string;
begin
  // TODO -cMM: TBarangStockSirkulasiItem.GetFieldNameFor_HargaTransaksi default body inserted
  Result := 'BSS_HARGA_TRANSAKSI';
end;

function TBarangStockSirkulasiItem.GetFieldNameFor_HargaLastCost: string;
begin
  // TODO -cMM: TBarangStockSirkulasiItem.GetFieldNameFor_HargaTransaksi default body inserted
  Result := 'BSS_LASTCOST';
end;

function TBarangStockSirkulasiItem.GetFieldNameFor_HeaderFlag: string;
begin
  Result :='HEADERFLAG' ;
end;

function TBarangStockSirkulasiItem.GetFieldNameFor_ID: string;
begin
  Result := 'BSS_ID';// <<-- Rubah string ini untuk mapping
end;

function TBarangStockSirkulasiItem.GetFieldNameFor_IsBonusForBonus: string;
begin
  // TODO -cMM: TBarangStockSirkulasiItem.GetFieldNameFor_IsBonusForBonus default body inserted
  Result := 'ISBONUSFORBONUS';
end;

function TBarangStockSirkulasiItem.GetFieldNameFor_IsEOD: string;
begin
  Result := 'BSS_IS_EOD';// <<-- Rubah string ini untuk mapping
end;

function TBarangStockSirkulasiItem.GetFieldNameFor_ItemID: string;
begin
  // TODO -cMM: TBarangStockSirkulasiItem.GetFieldNameFor_ItemID default body inserted
  Result := 'ITEM_ID';
end;

function TBarangStockSirkulasiItem.GetFieldNameFor_Keterangan: string;
begin
  Result := 'BSS_DESCRIPTION';// <<-- Rubah string ini untuk mapping
end;

function TBarangStockSirkulasiItem.GetFieldNameFor_NewBarang: string;
begin
  Result := 'BSS_BRG_CODE';// <<-- Rubah string ini untuk mapping
end;

function TBarangStockSirkulasiItem.GetFieldNameFor_NewUnit: string;
begin
  Result := 'BSS_UNT_ID';// <<-- Rubah string ini untuk mapping
end;

function TBarangStockSirkulasiItem.GetFieldNameFor_NewUOM: string;
begin
  Result := 'BSS_SAT_CODE';// <<-- Rubah string ini untuk mapping
end;

function TBarangStockSirkulasiItem.GetFieldNameFor_NoBukti: string;
begin
  Result := 'BSS_DOC_NO';// <<-- Rubah string ini untuk mapping
end;

function TBarangStockSirkulasiItem.GetFieldNameFor_Qty: string;
begin
  Result := 'BSS_QTY';// <<-- Rubah string ini untuk mapping
end;

function TBarangStockSirkulasiItem.GetFieldNameFor_Tanggal: string;
begin
  Result := 'BSS_DATE';// <<-- Rubah string ini untuk mapping
end;

function TBarangStockSirkulasiItem.GetFieldNameFor_TypeTransaksi: string;
begin
  Result := 'BSS_TYPE';// <<-- Rubah string ini untuk mapping
end;

function TBarangStockSirkulasiItem.GetGeneratorName: string;
begin
  Result := 'GEN_BARANG_STOK_SIRKULASI_ID';
end;

function TBarangStockSirkulasiItem.GetNewBarang: TNewBarang;
begin
  if FNewBarang = nil then
  begin
    FNewBarang := TNewBarang.Create(Application);
    FNewBarang.LoadByKode(FNewBarangKode);
  end;
  Result := FNewBarang;
end;

function TBarangStockSirkulasiItem.GetNewUnit: TUnit;
begin
  if FNewUnit = nil then
  begin
    FNewUnit := TUnit.Create(Application) ;
    FNewUnit.loadByID(FNewUnitID);
  end;
  Result := FNewUnit;
end;

function TBarangStockSirkulasiItem.GetNewUOM: TNewUOM;
begin
  if FNewUOM = nil then
  begin
    FNewUOM :=TNewUOM.Create(Application);
    FNewUOM.LoadByUOM(FNewUOMKode);
  end;
  Result := FNewUOM;
end;

function TBarangStockSirkulasiItem.GetUOMUnit: TUnit;
begin
  if FUOMUnit = nil then
  begin
    FUOMUnit :=TUnit.Create(Application);
    FUOMUnit.LoadByID(FNewUnitID);
  end;
  Result := FUOMUnit;
end;

class function TBarangStockSirkulasiItem.RemoveFromDB(aID : Integer; aUnitId :
    Integer): string;
begin
   Result := 'delete '
          + ' from BARANG_STOK_SIRKULASI'
          + ' where BSS_ID = ' + IntToStr(aID)
          + ' and BSS_UNT_ID = ' + IntToStr(aUnitID);

end;

procedure TBarangStockSirkulasiItem.UpdateData(aHeaderFlag, aID, aIsEOD,
    aItemID: Integer; aKeterangan, aNewBArangKode, aNewUnitID, aNewUOMKode,
    aNoBukti: string; aQty: Double; aTanggal: TDateTime; ATypeTransaksi:
    string; aIsBonusForBonus: Integer; aHargaTransaksi: Double = 0;
    aHargaLastCost: Double = 0);
begin
   FHEADERFLAG        := aHeaderFlag;
   FID                := aID;
   FIsEOD             := aIsEOD;
   FITEM_ID           := aItemID;
   FKeterangan        := aKeterangan;
   FNewBarangKode     := aNewBArangKode;
   FNewUnitID         := aNewUnitID;
   FNewUOMKode        := aNewUOMKode;
   FNoBukti           := aNoBukti;
   FQty               := aQty;
   FTglBukti          := aTanggal;
   FTypeTransaksi     := ATypeTransaksi;
   FISBONUSFORBONUS   := aIsBonusForBonus;
   HargaTransaksi     := aHargaTransaksi;
   FHargaLastCost     := aHargaLastCost
end;

function TBarangStockSirkulasiItems.Add: TBarangStockSirkulasiItem;
begin
Result := (inherited Add) as TBarangStockSirkulasiItem;
end;

{
************************** TBarangStockSirkulasiItems **************************
}
function TBarangStockSirkulasiItems.CustomTableName: string;
begin
  result := 'BARANG_STOK_SIRKULASI';
end;

function TBarangStockSirkulasiItems.CekBarangStockSirkulasi(aHeaderNo : string;
    aUnitID: Integer): Boolean;
var
  IsAda: Boolean;
  SS: TStrings;
  i: Integer;
  sSQL: String;
begin
  result := False;
  sSQL := 'select BSS_ID, BSS_UNT_ID'
          + ' from BARANG_STOK_SIRKULASI '
          + ' where BSS_DOC_NO = ' + QuotedStr(aHeaderNo)
          + ' and BSS_UNT_ID = '+ IntToStr(aUnitID);


  with cOpenQuery(sSQL) do
  begin
    SS := TStringList.Create;
    try
      if Fields[0].IsNull then
      begin
        Result := True // kalo null berarti insert baru
      end else begin
        while not Eof do
        begin
          IsAda := False;
          for i := 0 to Self.Count - 1 do
          begin
            if (Self[i].FNewUnitID = FieldByName('BSS_UNT_ID').AsString) and
               (Self[i].ID = FieldByName('BSS_ID').AsInteger) then
            begin
              IsAda := True;
              Break;
            end;
          end;

          if not IsAda then
            SS.Add(TBarangStockSirkulasiItem.RemoveFromDB(FieldByName('BSS_ID').AsInteger, FieldByName('BSS_UNT_ID').AsInteger));

          Next;
        end;

        SS.SaveToFile(cGetAppPath + 'DeleteBarangStockSirkulasi.txt');
        if not cExecSQL(SS) then
        begin
          cRollbackTrans;
          raise Exception.Create('Gagal Menghapus Data Di Barang Stock Sirkulasi');
          Result := False;
          Exit;
        end;

      end;
    finally
      Free;
      SS.Free;
    end;
  end;
end;

function TBarangStockSirkulasiItems.GetBarangStockSirkulasiItem(Index:
        Integer): TBarangStockSirkulasiItem;
begin
  Result := (inherited Items[index]) as TBarangStockSirkulasiItem;
end;

function TBarangStockSirkulasiItems.GetHeaderFlag: Integer;
begin
  Result := 9696;
end;

procedure TBarangStockSirkulasiItems.LoadByID(aID : Integer; aUnitID : Integer);
var
  S: string;
begin
  S := 'Select * from ' + CustomTableName + '  Where BSS_ID = ' + IntToStr(aID)
       + ' and BSS_UNT_ID = ' + IntToStr(aUnitID);
  with cOpenQuery(S) do
  Begin
    while not eof do
    begin
      with self.add do
      begin
        FID := FieldByName(GetFieldNameFor_ID).asInteger;
        FIsEOD := FieldByName(GetFieldNameFor_IsEOD).asInteger;
        FKeterangan := FieldByName(GetFieldNameFor_Keterangan).asString;
        FNewBarangKode := FieldByName(GetFieldNameFor_NewBarang).AsString;
        FNewUnitID := FieldByName(GetFieldNameFor_NewUnit).AsString;
        FNewUOMKode := FieldByName(GetFieldNameFor_NewUOM).AsString;
        FNoBukti := FieldByName(GetFieldNameFor_NoBukti).asString;
        FQty := FieldByName(GetFieldNameFor_Qty).asFloat;
        FHargaTransaksi := FieldByName(GetFieldNameFor_HargaTransaksi).asFloat;
        FHargaLastCost := FieldByName(GetFieldNameFor_HargaLastCost).asFloat;
        FTglBukti := FieldByName(GetFieldNameFor_Tanggal).asDateTime;
        FTypeTransaksi := FieldByName(GetFieldNameFor_TypeTransaksi).asString;
        FISBONUSFORBONUS := FieldByName(GetFieldNameFor_IsBonusForBonus).AsInteger;
      end;
      next;
    end;
    free;
  End;
end;

procedure TBarangStockSirkulasiItems.LoadByNoBukti(aNoBukti : String; aUnitID :
    Integer; aHeaderFlag : Integer);
var
  S: string;
begin
  S := 'Select * from ' + CustomTableName + '  Where BSS_DOC_NO = ' + QuotedStr(aNoBukti)
       + ' and BSS_UNT_ID = ' + IntToStr(aUnitID);
       //+ ' and HEADERFLAG = ' + IntToStr(aHeaderFlag);
  with cOpenQuery(S) do
  Begin
    try
      while not eof do
      begin
        with self.add do
        begin
          FID := FieldByName(GetFieldNameFor_ID).asInteger;
          FIsEOD := FieldByName(GetFieldNameFor_IsEOD).asInteger;
          FKeterangan := FieldByName(GetFieldNameFor_Keterangan).asString;
          FNewBarangKode := FieldByName(GetFieldNameFor_NewBarang).AsString;
          FNewUnitID := FieldByName(GetFieldNameFor_NewUnit).AsString;
          FNewUOMKode := FieldByName(GetFieldNameFor_NewUOM).AsString;
          FNoBukti := FieldByName(GetFieldNameFor_NoBukti).asString;
          FQty := FieldByName(GetFieldNameFor_Qty).asFloat;
          FTglBukti := FieldByName(GetFieldNameFor_Tanggal).asDateTime;
          FTypeTransaksi := FieldByName(GetFieldNameFor_TypeTransaksi).asString;
          FISBONUSFORBONUS := FieldByName(GetFieldNameFor_IsBonusForBonus).AsInteger;
          FHargaTransaksi := FieldByName(GetFieldNameFor_HargaTransaksi).asFloat;
          FHargaLastCost := FieldByName(GetFieldNameFor_HargaLastCost).asFloat;
        end;
        next;
      end;
    finally
      free;
    end;
  End;
end;

class function TBarangStockSirkulasiItems.RemoveByDocNo(aDocNo : String;
    aUnitID : Integer; aTipe : String): Boolean;
var
  sSQL: string;
begin
  Result := False;
  sSQL := ' delete '
          + ' from barang_stok_sirkulasi '
          + ' where bss_doc_no = ' + QuotedStr(aDocNo)
          + ' and BSS_UNT_ID = ' + IntToStr(aUnitID)
          + ' and BSS_TYPE = ' + QuotedStr(aTipe);

  if cExecSQL(sSQL,dbtPOS,False) then
    Result := True; // SimpanBlob(sSQL, 1);

end;

function TBarangStockSirkulasiItems.SaveToDatabase(aHeaderNo : string; aUnitID
    : Integer): Boolean;
var
  x: Integer;
  i: Integer;
begin
  Result := False;
  x := Count - 1;
  for i := 0 to x do
  begin
    if not BarangStockSirkulasiItem[i].ExecuteGenerateSQL(aHeaderNo,BarangStockSirkulasiItem[i].ID,aUnitID) then
    begin
      cRollbackTrans;
      Exit;
    end;

  end;

  if not CekBarangStockSirkulasi(aHeaderNo, aUnitID) then
  begin
    cRollbackTrans;
    raise Exception.Create('Cek Fungsi CekBarangStockSirkulasi');
    Exit;
  end;
  
  Result := True;
end;

procedure TBarangStockSirkulasiItems.SetBarangStockSirkulasiItem(Index: Integer;
        Value: TBarangStockSirkulasiItem);
begin
  inherited Items[Index] := Value
end;



end.
