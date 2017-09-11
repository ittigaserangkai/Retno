unit uNewBarang;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
//  uNewUnit,
  uTSBaseClass, unewUOM, uNewPajak, uNewMerchandize, uNewMerchandizeGroup,
  uNewKategori, uNewKonversiSatuan, uNewBarangTransaksi, uNewTipeBarang;

type
  TNewBarang = class(TSBaseClass)
  private
    FAlias: string;
    FBarangGalon: TNewBarang;
    FBarangGalonKode: string;
    FBarangTransaksi: TBarangTransaksi;
//    FSuppDefault      : TNewSupplier;
    FBrgSuppDefaultID : Integer;
    FCatalog: string;
    FDate_Create: TDateTime;
    FDate_Modify: TDateTime;
    FDefaultMarkUP: Double;
    FExpireTime: Integer;
    FHargaAverage: Double;
    FHargaLastCost: Double;
    FHargaNilaiRafaksi: Double;
    FHeight: string;
    FIsActive: Integer;
    FIsBasic: Integer;
    FIsBuild: Integer;
    FIsCS: Integer;
    FIsDecimal: Integer;
    FIsDeposit: Integer;
    FIsDiscGMC: Integer;
    FIsGalon: Integer;
    FIsPajakInclude: Integer;
    FIsStock: Integer;
    FIsValidate: Integer;
    FKategori: TKategori;
    FKategoriID: string;
    FKode: string;
    FKodePurchase: string;
    FKodeSatuanStock: TNewUOM;
    FKodeSatuanStockKode: string;
    FLength: string;
    FMerk: string;
    FNama: string;
    FNewLocationKode: string;
    FNewMerchadize: TNewMerchadize;
    FNewMerchadizeID: string;
    FNewMerchandizeGroup: TNewMerchandizeGroup;
    FNewMerchandizeGroupID: string;
    FNewPajak: TNewPajak;
    FNewPajakID: string;
    FPkmAverage: Double;
    FSafetyStock: Double;
    FSalesOutletID: string;
    FTipeBarang: TNewTipeBarang;
    FTipeBarangID: string;
    FUOMDiameter: string;
    FUOMVolume: string;
    FUOMWeight: string;
//    FValidateUserID: Integer;
//    FValidateUserUnit: TUnit;
//    FValidateUserUnitID: string;
    FWidth: string;
    function FLoadFromDB( aSQL : String ): Boolean;
    procedure FreeAndNilObjectProperty;
    function GetBarangGalon: TNewBarang;
    function GetBarangTransaksi: TBarangTransaksi;
//    function GetSuppDefault : TNewSupplier;
    function GetBrgSuppDefaultID : Integer;
    function GetKategori: TKategori;
    function GetKodeSatuanStock: TNewUOM;
    function GetNewMerchadize: TNewMerchadize;
    function GetNewMerchandizeGroup: TNewMerchandizeGroup;
    function GetNewPajak: TNewPajak;
    function GetTipeBarang: TNewTipeBarang;
//    function GetValidateUserUnit: TUnit;
    function SQLInsertBarang: string;
    function SQLUpdateBarang: string;
  public
    constructor Create(aOwner : TComponent); override;
    constructor CreateWithUpdateStatus(aOwner: TComponent);
    destructor Destroy; override;
    procedure ClearProperties;
    function CustomTableName: string;
    function ExecuteCustomSQLTask: Boolean;
    function ExecuteCustomSQLTaskPrior: Boolean;
    function ExecuteGenerateSQL(AkodeLama : String): Boolean;
    function GenerateInterbaseMetaData: Tstrings;
    function GetBrgSup_ID: Integer;
    function GetFieldNameFor_Alias: string; dynamic;
    function GetFieldNameFor_AuthorId: string;
    function GetFieldNameFor_BarangGalon: string;
    function GetFieldNameFor_Catalog: string; dynamic;
    function GetFieldNameFor_Date_Create: string;
    function GetFieldNameFor_Date_Modify: string;
    function GetFieldNameFor_DefaultMarkUP: string; dynamic;
    function GetFieldNameFor_ExpireTime: string; dynamic;
    function GetFieldNameFor_HargaAverage: string;dynamic;
    function GetFieldNameFor_HargaLastCost: string; dynamic;
    function GetFieldNameFor_HargaNilaiRafaksi: string; dynamic;
    function GetFieldNameFor_Height: string; dynamic;
    function GetFieldNameFor_IsActive: string; dynamic;
    function GetFieldNameFor_IsBasic: string; dynamic;
    function GetFieldNameFor_IsBuild: string; dynamic;
    function GetFieldNameFor_IsCS: string; dynamic;
    function GetFieldNameFor_IsDecimal: string; dynamic;
    function GetFieldNameFor_IsDeposit: string; dynamic;
    function GetFieldNameFor_IsDiscGMC: string; dynamic;
    function GetFieldNameFor_IsGalon: string; dynamic;
    function GetFieldNameFor_IsPajakInclude: string; dynamic;
    function GetFieldNameFor_IsStock: string; dynamic;
    function GetFieldNameFor_IsValidate: string; dynamic;
    function GetFieldNameFor_Kategori: string; dynamic;
    function GetFieldNameFor_Kode: string; dynamic;
    function GetFieldNameFor_KodePurchase: string; dynamic;
    function GetFieldNameFor_KodeSatuanStock: string; dynamic;
    function GetFieldNameFor_Length: string; dynamic;
    function GetFieldNameFor_Merk: string; dynamic;
    function GetFieldNameFor_Nama: string; dynamic;
    function GetFieldNameFor_NewLocation: string; dynamic;
    function GetFieldNameFor_NewMerchadize: string; dynamic;
    function GetFieldNameFor_NewMerchandizeGroup: string; dynamic;
    function GetFieldNameFor_NewPajak: string; dynamic;
    function GetFieldNameFor_PkmAverage: string; dynamic;
    function GetFieldNameFor_PubsId: string;
    function GetFieldNameFor_SafetyStock: string;
    function GetFieldNameFor_SalesOutlet: string; dynamic;
    function GetFieldNameFor_TipeBarangID: string; dynamic;
    function GetFieldNameFor_UOMDiameter: string; dynamic;
    function GetFieldNameFor_UOMVolume: string; dynamic;
    function GetFieldNameFor_UOMWeight: string; dynamic;
//    function GetFieldNameFor_ValidateUserID: string; dynamic;
//    function GetFieldNameFor_ValidateUserUnit: string; dynamic;
    function GetFieldNameFor_Width: string; dynamic;
    function GetHargaAVG(aUOM : String): Double;
    function GetHargaBeli(aSupCode : String): Double;
    function GetHeaderFlag: Integer;
    function GetKonversiSatuan(aBarangID, aSatuanStock, aSatuanOrder: String):
        TKonversiSatuan;
    procedure GetLastPurchasePrice(var aLastPurchasePrice : Double;  var aUOM :
        String);
    procedure GetPenjualan(aTglAwal : TdateTime; aTglAKhir : TdateTime; var aQty :
        Double; var aRupiah : Double);
    function GetPKMAVG: Double;
    function GetPLUPurhaseName: string;
//    function GetLastSellPrice(BrgID: string; aUnitID: Integer): Double;
    function GetPurchasePrice: Double;
    function GetSatuanHargaBeli(aSupCode : String): string;
    function GetSellPricePrice: Double;
    function GetSellPricePriceUOM: string;
    procedure GetStock(aTglAkhir: TDateTime; aUnitID: Integer; var aQTY, aRupiah:
        Double);
    function GetTipeBarangName: string;
    function GetUOMPurchase: string;
    function GetUOMValue(aUOM : String): Double; overload;
    class function GetUOMValue(aBrgCode, aUOM: String): Double; overload;
    function IsBeliDariSupplier(aSupCode : String; aMerGroup : String): Boolean;
    function IsPunyaPrimarySupplier: Boolean;
    function IsUOMStockSudahAdaDiUOMConvertion: Boolean;
    function LoadByBarcodeNew(aCatalog : string): Boolean;
    function LoadByCatalog(aCatalog : string): Boolean;
    function LoadByKode(aKode : string): Boolean; overload;
    function LoadByKode(aKode: string; aIsAktif, aIsValid: Boolean): Boolean;
        overload;
    function RemoveFromDB: Boolean;
    procedure UpdateData(aAlias, aCatalog: string; aDefaultMarkUP: Double;
        aExpireTime: Integer; aHeight: string; aIsActive, aIsBuild, aIsCS,
        aIsDecimal, aIsDeposit, aIsDiscGMC, aIsGalon, aIsPajakInclude, aIsStock,
        aIsValidate: Integer; aKategori_ID, aKode, aKodePurchase, aUOM, aLength,
        aMerk, aNama, aNewBarangPajak_ID, aNewLocation_Kode, aNewMerchadize_ID,
        aNewMerchandizeGroup_ID, aSalesOutlet_ID, aTipeBarangID, aUOMDiameter,
        aUOMVolume, aUOMWeight, aWidth: string; aHargaVerage: Double;
        aBrgGalonCode, aAuthorId, aPubsId: String; aSafetySTStock: Double;
        aIsBasic: Integer);
    function UpdateStatusValidBarang: Boolean;
    function ValidateBarang(aBrgCode: string): Boolean;
    property Alias: string read FAlias write FAlias;
    property BarangGalon: TNewBarang read GetBarangGalon write FBarangGalon;
    property BarangTransaksi: TBarangTransaksi read GetBarangTransaksi write
        FBarangTransaksi;
    property BrgSuppDefaultID : Integer read GetBrgSuppDefaultID;
    property Catalog: string read FCatalog write FCatalog;
    property DefaultMarkUP: Double read FDefaultMarkUP write FDefaultMarkUP;
    property ExpireTime: Integer read FExpireTime write FExpireTime;
    property HargaAverage: Double read FHargaAverage;// write FHargaAverage;
    property HargaLastCost: Double read FHargaLastCost write FHargaLastCost;
    property HargaNilaiRafaksi: Double read FHargaNilaiRafaksi write
        FHargaNilaiRafaksi;
    property Height: string read FHeight write FHeight;
    property IsActive: Integer read FIsActive write FIsActive;
    property IsBasic: Integer read FIsBasic write FIsBasic;
    property IsBuild: Integer read FIsBuild write FIsBuild;
    property IsCS: Integer read FIsCS write FIsCS;
    property IsDecimal: Integer read FIsDecimal write FIsDecimal;
    property IsDeposit: Integer read FIsDeposit write FIsDeposit;
    property IsDiscGMC: Integer read FIsDiscGMC write FIsDiscGMC;
    property IsGalon: Integer read FIsGalon write FIsGalon;
    property IsPajakInclude: Integer read FIsPajakInclude write FIsPajakInclude;
    property IsStock: Integer read FIsStock write FIsStock;
    property IsValidate: Integer read FIsValidate write FIsValidate;
    property Kategori: TKategori read GetKategori write FKategori;
    property Kode: string read FKode write FKode;
    property KodePurchase: string read FKodePurchase write FKodePurchase;
    property KodeSatuanStock: TNewUOM read GetKodeSatuanStock write
        FKodeSatuanStock;
    property KodeSatuanStockKode: string read FKodeSatuanStockKode write
        FKodeSatuanStockKode;
    property Length: string read FLength write FLength;
    property Merk: string read FMerk write FMerk;
    property Nama: string read FNama write FNama;
    property NewMerchadize: TNewMerchadize read GetNewMerchadize write
        FNewMerchadize;
    property NewMerchandizeGroup: TNewMerchandizeGroup read GetNewMerchandizeGroup
        write FNewMerchandizeGroup;
    property NewPajak: TNewPajak read GetNewPajak write FNewPajak;
    property PkmAverage: Double read FPkmAverage write FPkmAverage;
    property SafetyStock: Double read FSafetyStock write FSafetyStock;
    property TipeBarang: TNewTipeBarang read GetTipeBarang write FTipeBarang;
    property TipeBarangID: string read FTipeBarangID write FTipeBarangID;
    property UOMDiameter: string read FUOMDiameter write FUOMDiameter;
    property UOMVolume: string read FUOMVolume write FUOMVolume;
    property UOMWeight: string read FUOMWeight write FUOMWeight;
//    property ValidateUserID: Integer read FValidateUserID write FValidateUserID;
//    property ValidateUserUnit: TUnit read GetValidateUserUnit write
//        FValidateUserUnit;
    property Width: string read FWidth write FWidth;
  end;

function GetSQLBarang(aUnitID: Integer; aBrgId: string = ''): string;

implementation

uses FireDAC.Comp.Client, FireDAC.Stan.Error, udmMain, uAppUtils, DateUtils, Data.DB;

{
********************************** TNewBarang **********************************
}
constructor TNewBarang.Create(aOwner : TComponent);
begin

  inherited create(aOwner);
  ClearProperties;
end;

constructor TNewBarang.CreateWithUpdateStatus(aOwner: TComponent);
begin
  Create(aOwner);
end;

destructor TNewBarang.Destroy;
begin
   ClearProperties;
   inherited Destroy;
end;

procedure TNewBarang.ClearProperties;
begin
  Alias := '';
  FHargaAverage := 0;
  FHargaLastCost := 0;
  FHargaNilaiRafaksi:=0;

  Catalog := '';
  DefaultMarkUP := 0;
  ExpireTime := 0;
//  HargaAverage := 0;
  Height := '';
  IsActive := 0;
  IsBuild := 0;
  IsCS := 0;
  IsDecimal := 0;
  IsDeposit := 0;
  IsDiscGMC := 0;
  IsGalon := 0;
  IsPajakInclude := 0;
  IsStock := 0;
  IsValidate := 0;
  Kode := '';
  KodePurchase := '';
  Length := '';
  Merk := '';
  Nama := '';
  TipeBarangID := '';
  UOMDiameter := '';
  UOMVolume := '';
  UOMWeight := '';
//  ValidateUserID := 0;
  Width := '';

  FBrgSuppDefaultID := 0;

  IsBasic     := 0;
  FPkmAverage := 0;

  FreeAndNilObjectProperty;
end;

function TNewBarang.CustomTableName: string;
begin
  result := 'Barang';
end;

function TNewBarang.ExecuteCustomSQLTask: Boolean;
begin
  Result := True;
end;

function TNewBarang.ExecuteCustomSQLTaskPrior: Boolean;
begin
  result := True;
end;

function TNewBarang.ExecuteGenerateSQL(AkodeLama : String): Boolean;
var
  S                 : string;
begin
  Result := False;





      if not ExecuteCustomSQLTaskPrior then
      begin
        cRollbackTrans;
        Exit;
      end
      else
      begin

        FDATE_MODIFY := cGetServerDateTime;

        If trim(aKodeLama) = '' then
        begin
            //Generate Insert SQL
          //FID := cGetMaxValue(   CustomTableName , 'ID') + 1 + (aRepeatCount - 1) ;

          FDATE_CREATE := FDATE_MODIFY;

          S := 'Insert into ' + CustomTableName +
               ' ( ' + GetFieldNameFor_Alias
               + ', ' + GetFieldNameFor_Catalog + ', ' +
               GetFieldNameFor_DefaultMarkUP + ', ' + GetFieldNameFor_ExpireTime + ', ' +
               GetFieldNameFor_Height + ', ' + GetFieldNameFor_IsActive + ', ' +
               GetFieldNameFor_IsBuild + ', ' + GetFieldNameFor_IsCS + ', ' +
               GetFieldNameFor_IsDecimal + ', ' + GetFieldNameFor_IsDeposit + ', ' +
               GetFieldNameFor_IsDiscGMC + ', ' + GetFieldNameFor_IsGalon + ', ' +
               GetFieldNameFor_IsPajakInclude + ', ' + GetFieldNameFor_IsStock + ', ' +
               GetFieldNameFor_IsValidate + ', ' + GetFieldNameFor_Kategori + ', ' +
               GetFieldNameFor_Kode + ', ' +
               GetFieldNameFor_KodePurchase + ', ' +
               GetFieldNameFor_KodeSatuanStock + ', ' +
               GetFieldNameFor_Length + ', ' +
               GetFieldNameFor_Merk + ', ' +
               GetFieldNameFor_Nama + ', ' + GetFieldNameFor_NewPajak + ', ' +
               GetFieldNameFor_NewLocation + ', ' + GetFieldNameFor_NewMerchadize + ', ' +
               GetFieldNameFor_NewMerchandizeGroup + ', ' +
               GetFieldNameFor_SalesOutlet + ', ' +
               GetFieldNameFor_TipeBarangID + ', ' +
               GetFieldNameFor_UOMDiameter + ', ' + GetFieldNameFor_UOMVolume + ', ' +
               GetFieldNameFor_UOMWeight + ', '
//               + GetFieldNameFor_ValidateUserID + ', '
//               + GetFieldNameFor_ValidateUserUnit + ', '
               + GetFieldNameFor_Width + ', ' +

               GetFieldNameFor_BarangGalon + ','  +

               GetFieldNameFor_HargaAverage + ',' +
               GetFieldNameFor_SafetyStock + ', ' +
               GetFieldNameFor_AuthorId
               + ', '+ GetFieldNameFor_PubsId
               +  ', ' + GetFieldNameFor_IsBasic
               + ', ' + GetFieldNameFor_Date_Create
               + ', ' + GetFieldNameFor_Date_Modify
               + ') values ('
               + QuotedStr( FAlias) + ', '
               + QuotedStr(FCatalog ) + ','
               + FormatFloat('0.00', FDefaultMarkUP) + ', '
               + IntToStr( FExpireTime) + ', '
               + QuotedStr(FHeight ) + ','
               + IntToStr( FIsActive) + ', '
               + IntToStr( FIsBuild) + ', '
               + IntToStr( FIsCS) + ', '
               + IntToStr( FIsDecimal) + ', '
               + IntToStr( FIsDeposit) + ', '
               + IntToStr( FIsDiscGMC) + ', '
               + IntToStr( FIsGalon) + ', '
               + IntToStr( FIsPajakInclude) + ', '
               + IntToStr( FIsStock) + ', '
               + IntToStr( FIsValidate) + ', '
               + QuotedStr( FKategoriID) + ', '
               + QuotedStr(FKode ) + ','
               + QuotedStr(FKodePurchase ) + ','
               + QuotedStr( FKodeSatuanStockKode) + ', '   //
               + QuotedStr(FLength ) + ','
               + QuotedStr(FMerk ) + ','
               + QuotedStr(FNama ) + ','
               + QuotedStr( FNewPajakID) + ', '
               + QuotedStr( FNewLocationKode) + ', '   //
               + QuotedStr( FNewMerchadizeID) + ', '
               + QuotedStr( FNewMerchandizeGroupID) + ', '
               + QuotedStr( FSalesOutletID) + ', '
               + QuotedStr( TipeBarangID) + ', '
               + QuotedStr(UOMDiameter ) + ', '
               + QuotedStr(UOMVolume ) + ', '
               + QuotedStr(UOMWeight ) + ', '
//               + IntToStr( ValidateUserID) + ', '
//               + QuotedStr( FValidateUserUnitID) + ', '
               + QuotedStr(Width ) + ', '

               + SQLInsertBarang
               + FloatToStr(HargaAverage) + ','

               + FormatFloat('0.000', FSafetyStock) + ', ';

          s := s + IntToStr(FIsBasic)
//                 + ', ' + QuotDT(FDATE_CREATE)
//                 + ', ' + QuotDT(FDate_Modify)
                 + ', ' + ' CURRENT_TIMESTAMP '
                 + ', ' + ' CURRENT_TIMESTAMP '

                 + ');'

        end
        else
        begin
            //generate Update SQL
            S := 'Update ' + CustomTableName + ' set '
                 + GetFieldNameFor_Alias + ' = ' + QuotedStr( FAlias)
                 + ' , ' + GetFieldNameFor_Catalog + ' = ' + QuotedStr( Catalog )
                 + ', ' + GetFieldNameFor_DefaultMarkUP + ' = ' + FormatFloat('0.00', DefaultMarkUP)
                 + ', ' + GetFieldNameFor_SafetyStock + ' = ' + FormatFloat('0.000', SafetyStock)
                 + ', ' + GetFieldNameFor_ExpireTime + ' = ' + IntToStr( ExpireTime)
                 + ' , ' + GetFieldNameFor_Height + ' = ' + QuotedStr( Height )
                 + ', ' + GetFieldNameFor_IsActive + ' = ' + IntToStr( IsActive)
                 + ', ' + GetFieldNameFor_IsBuild + ' = ' + IntToStr( IsBuild)
                 + ', ' + GetFieldNameFor_IsCS + ' = ' + IntToStr( IsCS)
                 + ', ' + GetFieldNameFor_IsDecimal + ' = ' + IntToStr( IsDecimal)
                 + ', ' + GetFieldNameFor_IsDeposit + ' = ' + IntToStr( IsDeposit)
                 + ', ' + GetFieldNameFor_IsDiscGMC + ' = ' + IntToStr( IsDiscGMC)
                 + ', ' + GetFieldNameFor_IsGalon + ' = ' + IntToStr( IsGalon)
                 + ', ' + GetFieldNameFor_IsPajakInclude + ' = ' + IntToStr( IsPajakInclude)
                 + ', ' + GetFieldNameFor_IsStock + ' = ' + IntToStr( IsStock)
                 + ', ' + GetFieldNameFor_IsValidate + ' = ' + IntToStr( IsValidate)
                 + ', ' + GetFieldNameFor_Kategori + ' = ' + QuotedStr( FKategoriID)
                 + ' , ' + GetFieldNameFor_Kode + ' = ' + QuotedStr( Kode )
                 + ' , ' + GetFieldNameFor_KodePurchase + ' = ' + QuotedStr( KodePurchase )
                 + ', ' + GetFieldNameFor_KodeSatuanStock + ' = ' + QuotedStr(FKodeSatuanStockKode)
                 + ' , ' + GetFieldNameFor_Length + ' = ' + QuotedStr( Length )
                 + ' , ' + GetFieldNameFor_Merk + ' = ' + QuotedStr( Merk )
                 + ' , ' + GetFieldNameFor_Nama + ' = ' + QuotedStr( Nama )
                 + ', ' + GetFieldNameFor_NewPajak + ' = ' + QuotedStr( FNewPajakID)
                 + ', ' + GetFieldNameFor_NewLocation + ' = ' + QuotedStr(FNewLocationKode)
                 + ', ' + GetFieldNameFor_NewMerchadize + ' = ' + QuotedStr( FNewMerchadizeID)
                 + ', ' + GetFieldNameFor_NewMerchandizeGroup + ' = ' + QuotedStr( FNewMerchandizeGroupID)
                 + ', ' + GetFieldNameFor_SalesOutlet + ' = ' + QuotedStr( FSalesOutletID)
                 + ', ' + GetFieldNameFor_TipeBarangID + ' = ' + QuotedStr( TipeBarangID)
                 + ' , ' + GetFieldNameFor_UOMDiameter + ' = ' + QuotedStr( UOMDiameter )
                 + ' , ' + GetFieldNameFor_UOMVolume + ' = ' + QuotedStr( UOMVolume )
                 + ' , ' + GetFieldNameFor_UOMWeight + ' = ' + QuotedStr( UOMWeight )
//                 + ', ' + GetFieldNameFor_ValidateUserID + ' = ' + IntToStr( ValidateUserID)
//                 + ', ' + GetFieldNameFor_ValidateUserUnit + ' = ' + QuotedStr( FValidateUserUnitID)
                 + ' , ' + GetFieldNameFor_Width + ' = ' + QuotedStr(Width )

                 + SQLUpdateBarang

                 + ' , ' + GetFieldNameFor_HargaAverage + ' = ' + FloatToStr(HargaAverage);

          s := s
                 + ', ' + GetFieldNameFor_IsBasic + ' = ' + IntToStr(IsBasic)
//                 + ', ' + GetFieldNameFor_DATE_MODIFY + ' = ' + QuotDT(FDATE_MODIFY)
                 + ', ' + GetFieldNameFor_DATE_MODIFY + ' = ' + ' CURRENT_TIMESTAMP '
                 + ' Where ' + GetFieldNameFor_Kode + ' = ' + QuotedStr(AkodeLama)
                 + ';';
        end;
      end;

      // Remove DoubleQuote to avoid error
      S := StringReplace(S, '"', '', [rfReplaceAll]);

      if not cExecSQL(S, dbtPOS, False) then
      begin
        cRollbackTrans;
        Exit;
      end
      else
        Result := ExecuteCustomSQLTask;


end;

function TNewBarang.FLoadFromDB( aSQL : String ): Boolean;
begin
  result := false;
  State := csNone;

  ClearProperties;
  with cOpenQuery(aSQL) do
  Begin
      if not EOF then
      begin

         FAlias := FieldByName(GetFieldNameFor_Alias).AsString;


         FCatalog := FieldByName(GetFieldNameFor_Catalog).asString;
         FDefaultMarkUP := FieldByName(GetFieldNameFor_DefaultMarkUP).asFloat;
         FSafetyStock := FieldByName(GetFieldNameFor_SafetyStock).asFloat;
         FExpireTime := FieldByName(GetFieldNameFor_ExpireTime).asInteger;
         FHeight := FieldByName(GetFieldNameFor_Height).asString;
         FIsActive := FieldByName(GetFieldNameFor_IsActive).asInteger;
         FIsBuild := FieldByName(GetFieldNameFor_IsBuild).asInteger;
         FIsCS := FieldByName(GetFieldNameFor_IsCS).asInteger;
         FIsDecimal := FieldByName(GetFieldNameFor_IsDecimal).asInteger;
         FIsDeposit := FieldByName(GetFieldNameFor_IsDeposit).asInteger;
         FIsDiscGMC := FieldByName(GetFieldNameFor_IsDiscGMC).asInteger;
         FIsGalon := FieldByName(GetFieldNameFor_IsGalon).asInteger;
         FIsPajakInclude := FieldByName(GetFieldNameFor_IsPajakInclude).asInteger;
         FIsStock := FieldByName(GetFieldNameFor_IsStock).asInteger;
         FIsValidate := FieldByName(GetFieldNameFor_IsValidate).asInteger;


         FKategoriID := FieldByName(GetFieldNameFor_Kategori).AsString;

         FKode := FieldByName(GetFieldNameFor_Kode).asString;
         FKodePurchase := FieldByName(GetFieldNameFor_KodePurchase).asString;


         FKodeSatuanStockKode := FieldByName(GetFieldNameFor_KodeSatuanStock).AsString;

         FLength := FieldByName(GetFieldNameFor_Length).asString;
         FMerk := FieldByName(GetFieldNameFor_Merk).asString;
         FNama := FieldByName(GetFieldNameFor_Nama).asString;

         FNewPajakID := FieldByName(GetFieldNameFor_NewPajak).AsString;

         FNewLocationKode := FieldByName(GetFieldNameFor_NewLocation).AsString;


         FNewMerchadizeID := FieldByName(GetFieldNameFor_NewMerchadize).AsString;


         FNewMerchandizeGroupID := FieldByName(GetFieldNameFor_NewMerchandizeGroup).AsString;



         FSalesOutletID := FieldByName(GetFieldNameFor_SalesOutlet).AsString;

         FTipeBarangID := FieldByName(GetFieldNameFor_TipeBarangID).AsString;


         FUOMDiameter := FieldByName(GetFieldNameFor_UOMDiameter).asString;
         FUOMVolume := FieldByName(GetFieldNameFor_UOMVolume).asString;
         FUOMWeight := FieldByName(GetFieldNameFor_UOMWeight).asString;

//         FValidateUserID := FieldByName(GetFieldNameFor_ValidateUserID).asInteger;

         //FValidateUserUnit.LoadByID(FieldByName(GetFieldNameFor_ValidateUserUnit).asInteger);
//         FValidateUserUnitID := FieldByName(GetFieldNameFor_ValidateUserUnit).AsString;

         FWidth := FieldByName(GetFieldNameFor_Width).asString;
         FHargaAverage := FieldByNAme(GetFieldNameFor_HargaAverage).AsFloat;
         FHargaLastCost       := FieldByNAme(GetFieldNameFor_HargaLastCost).AsFloat;
         FHargaNilaiRafaksi   := FieldByNAme(GetFieldNameFor_HargaNilaiRafaksi).AsFloat;

         FBarangGalonKode := FieldByNAme(GetFieldNameFor_BarangGalon).AsString;

         FIsBasic     := FieldByName(GetFieldNameFor_IsBasic).AsInteger;
         FPkmAverage  := FieldByName(GetFieldNameFor_PkmAverage).AsFloat;

         Self.State := csLoaded;
         Result := True;
      end;
      Free;
  End;
end;

procedure TNewBarang.FreeAndNilObjectProperty;
begin

  FKategoriID := '';
  FreeAndNil(FKategori);

  FKodeSatuanStockKode := '';
  FreeAndNil(FKodeSatuanStock);

  FNewPajakID := '';
  FreeAndNil(FNewPajak);

  FNewLocationKode := '';

  FNewMerchadizeID := '';
  FreeAndNil(FNewMerchadize);

  FNewMerchandizeGroupID := '';
  FreeAndNil(FNewMerchandizeGroup);

  FSalesOutletID := '';

//  FValidateUserUnitID := '';
//  FreeAndNil(FValidateUserUnit);

  FBarangGalonKode := '';
  FreeAndNil(FBarangGalon);

  FreeAndNil(FTipeBarang);

//  FreeAndNil(FSuppDefault);
end;

function TNewBarang.GenerateInterbaseMetaData: Tstrings;
begin
  result := TstringList.create;
  result.Append( '' );
  result.Append( 'Create Table TNewBarang ( ' );
  result.Append( 'TRMSBaseClass_ID Integer not null, ' );
  result.Append( 'Alias   Integer Not Null , ' );
  result.Append( 'BarangPajakUnit_ID Integer Not Null, ' );
  result.Append( 'Catalog   Varchar(30) Not Null , ' );
  result.Append( 'DefaultMarkUP   double precision Not Null , ' );
  result.Append( 'ExpireTime   Integer Not Null , ' );
  result.Append( 'Height   Varchar(30) Not Null , ' );
  result.Append( 'IsActive   Integer Not Null , ' );
  result.Append( 'IsBuild   Integer Not Null , ' );
  result.Append( 'IsCS   Integer Not Null , ' );
  result.Append( 'IsDecimal   Integer Not Null , ' );
  result.Append( 'IsDeposit   Integer Not Null , ' );
  result.Append( 'IsDiscGMC   Integer Not Null , ' );
  result.Append( 'IsGalon   Integer Not Null , ' );
  result.Append( 'IsPajakInclude   Integer Not Null , ' );
  result.Append( 'IsStock   Integer Not Null , ' );
  result.Append( 'IsValidate   Integer Not Null , ' );
  result.Append( 'Kategori_ID Integer Not Null, ' );
  result.Append( 'KategoriUnit_ID Integer Not Null, ' );
  result.Append( 'Kode   Varchar(30) Not Null  Unique, ' );
  result.Append( 'KodePurchase   Varchar(30) Not Null , ' );
  result.Append( 'KodePurchaseUnit_ID Integer Not Null, ' );
  result.Append( 'KodeSatuanStock_ID Integer Not Null, ' );
  result.Append( 'KodeSatuanUnit_ID Integer Not Null, ' );
  result.Append( 'Length   Varchar(30) Not Null , ' );
  result.Append( 'LokasiUnit_ID Integer Not Null, ' );
  result.Append( 'MerchanUnit_ID Integer Not Null, ' );
  result.Append( 'Merk   Varchar(30) Not Null , ' );
  result.Append( 'Nama   Varchar(30) Not Null , ' );
  result.Append( 'NewBarangPajak_ID Integer Not Null, ' );
  result.Append( 'NewLocation_ID Integer Not Null, ' );
  result.Append( 'NewMerchadize_ID Integer Not Null, ' );
  result.Append( 'NewMerchandizeGroup_ID Integer Not Null, ' );
  result.Append( 'NewUnit_ID Integer Not Null, ' );
  result.Append( 'SalesOutlet_ID Integer Not Null, ' );
  result.Append( 'SalesOutletUnit_ID Integer Not Null, ' );
  result.Append( 'TipeBarangID   Integer Not Null , ' );
  result.Append( 'TipeBarangUnit_ID Integer Not Null, ' );
  result.Append( 'UOMDiameter   Varchar(30) Not Null , ' );
  result.Append( 'UOMVolume   Varchar(30) Not Null , ' );
  result.Append( 'UOMWeight   Varchar(30) Not Null , ' );
  result.Append( 'ValidateUserID   Integer Not Null , ' );
  result.Append( 'ValidateUserUnit_ID Integer Not Null, ' );
  result.Append( 'Width   Varchar(30) Not Null , ' );
  result.Append( 'Stamp TimeStamp ' );
  result.Append( ' ); ' );
end;

function TNewBarang.GetBarangGalon: TNewBarang;
begin
  if FBarangGalon = nil then
  begin
    FBarangGalon := TNewBarang.Create(Self);
    FBarangGalon.LoadByKode(FBarangGalonKode);
  end;

  Result := FBarangGalon;
end;

function TNewBarang.GetBarangTransaksi: TBarangTransaksi;
begin
  Result := FBarangTransaksi;
  if FBarangTransaksi = nil then
  begin
    FBarangTransaksi := TBarangTransaksi.Create(Self);
    FBarangTransaksi.LoadByKode(Kode);
    Result := FBarangTransaksi;
  end;

end;

function TNewBarang.GetBrgSuppDefaultID : Integer;
var aSQL : String;
begin
  if not (FBrgSuppDefaultID > 0) then
  begin
    aSQL := 'select '+
            '  b.brgsup_id '+
            'from '+
            '  barang_suplier b '+
            'where '+
            '  b.brgsup_brg_code='+QuotedStr(Kode)+' '+
            'order by '+
            '  b.brgsup_is_primary desc, b.brgsup_sup_code desc ';

    with cOpenQuery(aSQL) do
    begin
      if recordcount > 0 then
      begin
        FBrgSuppDefaultID := fieldByName('brgsup_id').AsInteger;
      end;
    end;
  end;

  Result := FBrgSuppDefaultID;
end;

function TNewBarang.GetBrgSup_ID: Integer;
var
  sSQL: string;
begin
  Result := 0;
  sSQL := 'select brgsup_id'
          + ' from barang_suplier'
          + ' where brgsup_brg_code = ' + QuotedStr(Kode)
          + ' and brgsup_is_primary = 1';
          //+ ' order by brgsup_is_primary desc , date_modify desc';

  with cOpenQuery(sSQL) do
  begin
    try
      if not IsEmpty then
        Result := FieldByName('brgsup_id').AsInteger;
    finally
      Free;
    end;
  end;
end;

function TNewBarang.GetFieldNameFor_Alias: string;
begin
  Result := 'BRG_ALIAS';// <<-- Rubah string ini untuk mapping
end;

function TNewBarang.GetFieldNameFor_AuthorId: string;
begin
  Result := 'AUTHOR_ID';
end;

function TNewBarang.GetFieldNameFor_BarangGalon: string;
begin
  Result := 'BRG_GALON_CODE';
end;

function TNewBarang.GetFieldNameFor_Catalog: string;
begin
  Result := 'BRG_CATALOG';// <<-- Rubah string ini untuk mapping
end;

function TNewBarang.GetFieldNameFor_Date_Create: string;
begin
  Result := 'DATE_CREATE';
end;

function TNewBarang.GetFieldNameFor_Date_Modify: string;
begin
  Result := 'DATE_MODIFY';
end;

function TNewBarang.GetFieldNameFor_DefaultMarkUP: string;
begin
  Result := 'BRG_DEFAULT_MARK_UP';// <<-- Rubah string ini untuk mapping
end;

function TNewBarang.GetFieldNameFor_ExpireTime: string;
begin
  Result := 'BRG_EXPIRE_TIME';// <<-- Rubah string ini untuk mapping
end;

function TNewBArang.GetFieldNameFor_HargaAverage: string;
begin
  Result := 'BRG_HARGA_AVERAGE';// <<-- Rubah string ini untuk mapping
end;

function TNewBarang.GetFieldNameFor_HargaLastCost: string;
begin
  Result := 'BRG_LASTCOST';// <<-- Rubah string ini untuk mapping
end;

function TNewBarang.GetFieldNameFor_HargaNilaiRafaksi: string;
begin

  Result := 'BRG_NILAI_RAFAKSI';
end;

function TNewBarang.GetFieldNameFor_Height: string;
begin
  Result := 'BRG_HEIGHT';// <<-- Rubah string ini untuk mapping
end;

function TNewBarang.GetFieldNameFor_IsActive: string;
begin
  Result := 'BRG_IS_ACTIVE';// <<-- Rubah string ini untuk mapping
end;

function TNewBarang.GetFieldNameFor_IsBasic: string;
begin
  Result := 'BRG_IS_BASIC';// <<-- Rubah string ini untuk mapping
end;

function TNewBarang.GetFieldNameFor_IsBuild: string;
begin
  Result := 'BRG_IS_BUILD';// <<-- Rubah string ini untuk mapping
end;

function TNewBarang.GetFieldNameFor_IsCS: string;
begin
  Result := 'BRG_IS_CS';// <<-- Rubah string ini untuk mapping
end;

function TNewBarang.GetFieldNameFor_IsDecimal: string;
begin
  Result := 'BRG_IS_DECIMAL';// <<-- Rubah string ini untuk mapping
end;

function TNewBarang.GetFieldNameFor_IsDeposit: string;
begin
  Result := 'BRG_IS_DEPOSIT';// <<-- Rubah string ini untuk mapping
end;

function TNewBarang.GetFieldNameFor_IsDiscGMC: string;
begin
  Result := 'BRG_IS_DISC_GMC';// <<-- Rubah string ini untuk mapping
end;

function TNewBarang.GetFieldNameFor_IsGalon: string;
begin
  Result := 'BRG_IS_GALON';// <<-- Rubah string ini untuk mapping
end;

function TNewBarang.GetFieldNameFor_IsPajakInclude: string;
begin
  Result := 'BRG_IS_PJK_INCLUDE';// <<-- Rubah string ini untuk mapping
end;

function TNewBarang.GetFieldNameFor_IsStock: string;
begin
  Result := 'BRG_IS_STOCK';// <<-- Rubah string ini untuk mapping
end;

function TNewBarang.GetFieldNameFor_IsValidate: string;
begin
  Result := 'BRG_IS_VALIDATE';// <<-- Rubah string ini untuk mapping
end;

function TNewBarang.GetFieldNameFor_Kategori: string;
begin
//  Result := 'BRG_KAT_ID';// <<-- Rubah string ini untuk mapping  //
  Result := 'REF$KATEGORI_ID'
end;

function TNewBarang.GetFieldNameFor_Kode: string;
begin
  Result := 'BRG_CODE';// <<-- Rubah string ini untuk mapping
end;

function TNewBarang.GetFieldNameFor_KodePurchase: string;
begin
//  Result := 'BRG_CODE_PURCHASE';// <<-- Rubah string ini untuk mapping
  Result := 'REF$SATUAN_PURCHASE';
end;

function TNewBarang.GetFieldNameFor_KodeSatuanStock: string;
begin
//  Result := 'BRG_SAT_CODE_STOCK';// <<-- Rubah string ini untuk mapping
  Result := 'REF$SATUAN_STOCK';
end;

function TNewBarang.GetFieldNameFor_Length: string;
begin
  Result := 'BRG_LENGTH';// <<-- Rubah string ini untuk mapping
end;

function TNewBarang.GetFieldNameFor_Merk: string;
begin
//  Result := 'BRG_MERK';// <<-- Rubah string ini untuk mapping
  Result := 'MERK_ID';
end;

function TNewBarang.GetFieldNameFor_Nama: string;
begin
  Result := 'BRG_NAME';// <<-- Rubah string ini untuk mapping
end;

function TNewBarang.GetFieldNameFor_NewLocation: string;
begin
//  Result := 'BRG_LOK_CODE';// <<-- Rubah string ini untuk mapping       //
  Result := 'REF$LOKASI_ID';
end;

function TNewBarang.GetFieldNameFor_NewMerchadize: string;
begin
//  Result := 'BRG_MERCHAN_ID';// <<-- Rubah string ini untuk mapping
  Result := 'REF$MERCHANDISE_ID';
end;

function TNewBarang.GetFieldNameFor_NewMerchandizeGroup: string;
begin
//  Result := 'BRG_MERCHANGRUP_ID';// <<-- Rubah string ini untuk mapping
  Result := 'REF$MERCHANDISE_GRUP_ID';
end;

function TNewBarang.GetFieldNameFor_NewPajak: string;
begin
//  Result := 'BRG_PJK_ID';// <<-- Rubah string ini untuk mapping
  Result := 'REF$PAJAK_ID';
end;

function TNewBarang.GetFieldNameFor_PkmAverage: string;
begin
  Result := 'brg_PKM_AVERAGE';// <<-- Rubah string ini untuk mapping
end;

function TNewBarang.GetFieldNameFor_PubsId: string;
begin
  Result := 'PUBLISHER_ID' ;
end;

function TNewBarang.GetFieldNameFor_SafetyStock: string;
begin
  Result := 'SAFETY_STOCK';
end;

function TNewBarang.GetFieldNameFor_SalesOutlet: string;
begin
//  Result := 'BRG_OUTLET_ID';// <<-- Rubah string ini untuk mapping
  Result := 'REF$OUTLET_ID';
end;

function TNewBarang.GetFieldNameFor_TipeBarangID: string;
begin
//  Result := 'BRG_TPBRG_ID';// <<-- Rubah string ini untuk mapping
  Result := 'REF$TIPE_BARANG_ID';
end;

function TNewBarang.GetFieldNameFor_UOMDiameter: string;
begin
  Result := 'BRG_UOM_DIAMETER';// <<-- Rubah string ini untuk mapping
end;

function TNewBarang.GetFieldNameFor_UOMVolume: string;
begin
  Result := 'BRG_UOM_VOLUME';// <<-- Rubah string ini untuk mapping
end;

function TNewBarang.GetFieldNameFor_UOMWeight: string;
begin
  Result := 'BRG_UOM_WEIGHT';// <<-- Rubah string ini untuk mapping
end;

//function TNewBarang.GetFieldNameFor_ValidateUserID: string;
//begin
//  Result := 'BRG_VALIDATE_USR_ID';// <<-- Rubah string ini untuk mapping
//end;

//function TNewBarang.GetFieldNameFor_ValidateUserUnit: string;
//begin
//  Result := 'BRG_VALIDATE_USR_UNT_ID';// <<-- Rubah string ini untuk mapping
//end;

function TNewBarang.GetFieldNameFor_Width: string;
begin
  Result := 'BRG_WIDTH';// <<-- Rubah string ini untuk mapping
end;

function TNewBarang.GetHargaAVG(aUOM : String): Double;
begin
  Result := HargaAverage * GetUOMValue(aUOM);
end;

function TNewBarang.GetHargaBeli(aSupCode : String): Double;
var
  sSQL: string;
begin
  Result := 0;
  sSQL := 'select brgsup_buy_price_disc, brgsup_is_bkp '
          + ' from barang_suplier'
          + ' where brgsup_brg_code = ' + QuotedStr(Kode)
          + ' and brgsup_sup_code = ' + QuotedStr(aSupCode);

  with cOpenQuery(sSQL) do
  begin
    try
      while not Eof do
      begin
        if FieldByName('brgsup_is_bkp').AsInteger = 1 then
          Result := FieldByName('brgsup_buy_price_disc').AsFloat * 1.1
        else
          Result := FieldByName('brgsup_buy_price_disc').AsFloat;

        Next;
      end;
    finally
      Free;
    end;
  end;

end;

function TNewBarang.GetHeaderFlag: Integer;
begin
  result := 1378;
end;

function TNewBarang.GetKategori: TKategori;
begin
  if FKategori = nil then
  begin
    FKategori := TKategori.Create(Self);
    FKategori.LoadByID(StrToInt(FKategoriID));
  end;

  Result := FKategori;
end;

function TNewBarang.GetKodeSatuanStock: TNewUOM;
begin
  if FKodeSatuanStock = nil then
  begin
    FKodeSatuanStock := TNewUOM.Create(Self);
    FKodeSatuanStock.LoadByUOM(FKodeSatuanStockKode);
  end;

  Result := FKodeSatuanStock;
end;

function TNewBarang.GetKonversiSatuan(aBarangID, aSatuanStock, aSatuanOrder:
    String): TKonversiSatuan;
var
  sKonvSatID: string;
  s: string;
begin
  Result := nil;

  s := 'Select REF$KONVERSI_SATUAN_ID From REF$KONVERSI_SATUAN'
     + ' Where BARANG_ID = ' + QuotedStr(aBarangID)
     + ' And KONVSAT_SAT_CODE_FROM = ' + QuotedStr(aSatuanStock)
     + ' And KONVSAT_SAT_CODE_TO = ' + QuotedStr(aSatuanOrder);
  with cOpenQuery(s) do
  begin
    try
      if not Eof then
      begin
        sKonvSatID := Fields[0].AsString;

        Result := TKonversiSatuan.Create(Self);
        Result.LoadByID(sKonvSatID);
      end;
    finally
      Free;
    end;
  end;

end;

procedure TNewBarang.GetLastPurchasePrice(var aLastPurchasePrice : Double;  var
    aUOM : String);

var
  sSQL: string;
begin
  aLastPurchasePrice := 0;
  aUOM := '';

  sSQL := 'select b.dod_price,b.dod_sat_code_order '
          + ' from dord a,do_detil b'
          + ' where a.do_no = b.dod_do_no'
          + ' and a.do_unt_id = b.dod_do_unt_id'
          + ' and b.dod_qty_order_recv <> 0'
          + ' and b.dod_brg_code = ' + QuotedStr(Kode)
          + ' order by a.do_date desc';

  with cOpenQuery(sSQL) do
  begin
    try
      if not EOF then
      begin
        aLastPurchasePrice := FieldByName('dod_price').AsFloat;
        aUOM := FieldByName('dod_sat_code_order').AsString;
      end;
    finally
      Free;
    end;
  end;
end;

function TNewBarang.GetNewMerchadize: TNewMerchadize;
begin
  if FNewMerchadize = nil then
  begin
    FNewMerchadize := TNewMerchadize.Create(Self);
    FNewMerchadize.LoadByID(FNewMerchadizeID);
  end;

  Result := FNewMerchadize;
end;

function TNewBarang.GetNewMerchandizeGroup: TNewMerchandizeGroup;
begin
  if FNewMerchandizeGroup = nil then
  begin
    FNewMerchandizeGroup := TNewMerchandizeGroup.Create(Self);
    FNewMerchandizeGroup.LoadByID(StrToInt(FNewMerchandizeGroupID));
  end;
  Result := FNewMerchandizeGroup;
end;

function TNewBarang.GetNewPajak: TNewPajak;
begin
  if FNewPajak = nil then
  begin
    FNewPajak := TNewPajak.Create(Self);
    FNewPajak.LoadByID(FNewPajakID);
  end;
  Result := FNewPajak;
end;

procedure TNewBarang.GetPenjualan(aTglAwal : TdateTime; aTglAKhir : TdateTime;
    var aQty : Double; var aRupiah : Double);
var
  sSQL: string;
begin
  sSQL := 'select sum(-1 * a.bss_qty * b.konvsat_scale) as Qty, '
          + ' sum(-1 * a.bss_qty * a.bss_harga_transaksi) as Rupiah'
          + ' from barang_stok_sirkulasi a, ref$konversi_satuan b'
          + ' where a.bss_brg_code = b.konvsat_brg_code'
          + ' and a.bss_sat_code = b.konvsat_sat_code_from'
          + ' and a.bss_type in (' + QuotedStr('POS') + ',' + QuotedStr('KRING')+ ')'
          + ' and a.bss_brg_code = ' + QuotedStr(Kode)
          + ' and a.bss_date between '  + TAppUtils.QuotD(aTglAwal) + ' and ' + TAppUtils.QuotD(aTglAKhir, True);

  with cOpenQuery(sSQL) do
  begin
    aQty    := 0;
    aRupiah := 0;
    try
      if not Eof then
      begin
        aQty    := FieldByName('QTY').AsFloat;
        aRupiah := FieldByName('Rupiah').AsFloat;
      end;
    finally
      Free;
    end;
  end;

end;

function TNewBarang.GetPKMAVG: Double;
var
  sSQL: string;
begin
  Result := 0;
  sSQL := 'select brg_PKM_AVERAGE from barang'
          + ' where brg_code = ' + QuotedStr(Kode);

  with cOpenQuery(sSQL) do
  begin
    try
      if not Fields[0].IsNull then
        Result := Fields[0].AsFloat;
    finally
      Free;
    end;
  end;
end;

function TNewBarang.GetPLUPurhaseName: string;
var
  sSQL: string;
begin
  Result := '';
  sSQL := 'select BRG_ALIAS from barang'
          + ' where brg_Code = ' + QuotedStr(Kode);

  with cOpenQuery(sSQL) do
  begin
    try
      while not Eof do
      begin
        if not FieldByName('BRG_ALIAS').IsNull then
          Result := FieldByName('BRG_ALIAS').AsString;

        Exit;
      end;
    finally
      Free;
    end;
  end;

end;

function TNewBarang.GetPurchasePrice: Double;
var
  sSQL: string;
begin
  Result := 0;
  sSQL := 'select brgsup_buy_price'
          + ' from barang_suplier'
          + ' where brgsup_brg_code = ' + QuotedStr(Kode)
          + ' order by date_modify desc';

  with cOpenQuery(sSQL) do
  begin
    try
      if not Fields[0].IsNull then
       Result := Fields[0].AsFloat;
    finally
      Free;
    end;
  end;

end;

function TNewBarang.GetSatuanHargaBeli(aSupCode : String): string;
var
  sSQL: string;
begin
  Result := '';
  sSQL := 'select brgsup_sat_code_buy '
          + ' from barang_suplier'
          + ' where brgsup_brg_code = ' + QuotedStr(Kode)
          + ' and brgsup_sup_code = ' + QuotedStr(aSupCode);

  with cOpenQuery(sSQL) do
  begin
    try
      while not Eof do
      begin
        Result := FieldByName('brgsup_sat_code_buy').AsString;

        Next;
      end;
    finally
      Free;
    end;
  end;

end;

function TNewBarang.GetSellPricePrice: Double;
var
  sSQL: string;
begin
  Result := 0;
  sSQL := 'select bhj_sell_price'
          + ' from barang_harga_jual'
          + ' where bhj_brg_code = ' + QuotedStr(Kode)
          + ' and bhj_tphrg_unt_id = bhj_unt_id'
          + ' and bhj_tphrg_id = 2'
          + ' order by bhj_sell_price asc rows 1'; //date_modify desc rows 1';

  with cOpenQuery(sSQL) do
  begin
    try
      if not Fields[0].IsNull then
       Result := Fields[0].AsFloat;
    finally
      Free;
    end;
  end;

end;

function TNewBarang.GetSellPricePriceUOM: string;
var
  sSQL: string;
begin
  Result := '';
  sSQL := 'select bhj_sat_code'
          + ' from barang_harga_jual'
          + ' where bhj_brg_code = ' + QuotedStr(Kode)
          + ' and bhj_tphrg_unt_id = bhj_unt_id'
          + ' and bhj_tphrg_id = 2'
          + ' order by bhj_sell_price asc rows 1'; //date_modify desc rows 1';

  with cOpenQuery(sSQL) do
  begin
    try
      if not Fields[0].IsNull then
       Result := Fields[0].AsString;
    finally
      Free;
    end;
  end;

end;

procedure TNewBarang.GetStock(aTglAkhir: TDateTime; aUnitID: Integer; var aQTY,
    aRupiah: Double);
var
  ssQL      : string;
  dtAwal    : TDateTime;
  dtAkhir   : TDateTime;
begin
  dtAwal  := StartOfTheMonth(aTglAkhir);
  dtAkhir := EndOfTheMonth(aTglAkhir);

  sSQL := 'select SUM(RUPIAH) as Rupiah, SUM(QTY) as Qty '
                  + ' from SP_KARTOK(' + QuotedStr(Kode)
                  + ',' + IntToStr(aUnitID)
                  + ',' + TAppUtils.QuotD(dtAwal) + ','
                  + TAppUtils.QuotD(dtAkhir) + ')'
                  + ' where ISBONUSFORBONUS = 0';

  with cOpenQuery(ssQL) do
  begin
    try
      aQTY    := 0;
      aRupiah := 0;
      if not eof then
      begin
        aQTY    := FieldByName('Qty').AsFloat;
        aRupiah := FieldByName('Rupiah').AsFloat;
      end;
    finally
      Free;
    end;

  end;
end;

function TNewBarang.GetTipeBarang: TNewTipeBarang;
begin
  if FTipeBarang = nil then
  begin
    FTipeBarang := TNewTipeBarang.Create(Self);
    FTipeBarang.LoadByID(FTipeBarangID);
  end;
  Result := FTipeBarang;
end;

function TNewBarang.GetTipeBarangName: string;
var
  sSQL: string;
begin
  Result := '';
  sSQL := 'select tpbrg_name from ref$tipe_barang '
          + ' where ref$tipe_barang_id = ' + QuotedStr(TipeBarangID);

  with cOpenQuery(sSQL) do
  begin
    try
      while not Eof do
      begin
        if not Fields[0].IsNull then
          Result := FieldByName('tpbrg_name').AsString;
        Next;
      end;
    finally
      Free;
    end;
  end;


end;

function TNewBarang.GetUOMPurchase: string;
var
  sSQL: string;
begin
  Result := '';
  sSQL := 'select brgsup_sat_code_buy'
          + ' from barang_suplier'
          + ' where brgsup_brg_code = ' + QuotedStr(Kode)
          + ' order by date_modify desc';

  with cOpenQuery(sSQL) do
  begin
    try
      if not Fields[0].IsNull then
       Result := Fields[0].AsString;
    finally
      Free;
    end;
  end;

end;

function TNewBarang.GetUOMValue(aUOM : String): Double;
var
  sSQL: string;
begin
  Result := 0;
  sSQL := 'select S.konvsat_scale '
          + ' from ref$konversi_satuan S '
          + ' inner join ' + CustomTableName + ' B '
          + ' on S.barang_id = B.barang_id '
          + ' where B.' + GetFieldNameFor_Kode + ' = ' + QuotedStr(Kode)
          + ' and S.konvsat_sat_code_from = ' + QuotedStr(aUOM)
          + '';

  with cOpenQuery(sSQL) do
  begin
    try
      while not Eof do
      begin
        if not Fields[0].IsNull then
          Result := Fields[0].AsFloat;

        Next;
      end;

    finally
      Free;
    end;
  end;

end;

class function TNewBarang.GetUOMValue(aBrgCode, aUOM: String): Double;
var
  sSQL: string;
begin
  Result := 0;
  sSQL := 'select konvsat_scale'
          + ' from ref$konversi_satuan'
          + ' where konvsat_brg_code = ' + QuotedStr(aBrgCode)
          + ' and konvsat_sat_code_from = ' + QuotedStr(aUOM);

  with cOpenQuery(sSQL) do
  begin
    try
//      while not Eof do
      begin
        if not Fields[0].IsNull then
          Result := Fields[0].AsFloat;
//        Next;
      end;
    finally
      Free;
    end;
  end;

end;

//function TNewBarang.GetValidateUserUnit: TUnit;
//begin
//  if FValidateUserUnit = nil then
//  begin
//    FValidateUserUnit := TUnit.Create(Self);
//    FValidateUserUnit.LoadByID(FValidateUserUnitID);
//  end;
//  Result := FValidateUserUnit;
//end;

function TNewBarang.IsBeliDariSupplier(aSupCode : String; aMerGroup : String):
    Boolean;
var
  sSQL: string;
begin
  Result := False;
  sSQL := 'select count(*)'
          + ' from barang_suplier a, suplier_merchan_grup b, REF$MERCHANDISE_GRUP c'
          + ' where a.brgsup_supmg_sub_code = b.SUPMG_SUB_CODE'
          + ' and b.SUPMG_MERCHANGRUP_ID = c.MERCHANGRUP_ID'
          + ' and a.brgsup_brg_code = ' + QuotedStr(Kode)
          + ' and b.supmg_code = ' + QuotedStr(aSupCode)
          + ' and c.MERCHANGRUP_CODE = ' + QuotedStr(aMerGroup);

  with cOpenQuery(sSQL) do
  begin
    try
      while not Eof do
      begin
        if Fields[0].AsInteger > 0 then
          Result := True;

        Next;
      end;
    finally
      Free;
    end;
  end;

end;

function TNewBarang.IsPunyaPrimarySupplier: Boolean;
var
  sSQL: string;
begin
  Result := False;
  sSQL := 'select count(brgsup_id) '
          + ' from barang_suplier'
          + ' where brgsup_brg_code = ' + QuotedStr(Kode)
          + ' and brgsup_is_primary = 1'  ;

  with cOpenQuery(sSQL) do
  begin
    try
      if Fields[0].asInteger > 0 then
        Result := True;
    finally
      Free;
    end;
  end;

end;

function TNewBarang.IsUOMStockSudahAdaDiUOMConvertion: Boolean;
var
  sSQL: string;
begin
  Result := False;
  sSQL := 'select count(konvsat_id) from REF$KONVERSI_SATUAN'
          + ' where konvsat_brg_code = ' + QuotedStr(Kode)
          + ' and konvsat_sat_code_from = ' + QuotedStr(FKodeSatuanStockKode);
  with cOpenQuery(sSQL) do
  begin
    try
      if not Fields[0].IsNull then
        if Fields[0].AsInteger > 0 then
          Result := True;
    finally
      Free;
    end;
  end;

end;

function TNewBarang.LoadByBarcodeNew(aCatalog : string): Boolean;
begin
  result := FloadFromDB('Select brg.* from REF$KONVERSI_SATUAN ks inner join '
    + CustomTableName +  ' brg on ks.KONVSAT_BRG_CODE=brg.BRG_CODE'
    + ' Where ks.KONVSAT_BARCODE = ' + QuotedStr(aCatalog));


end;

function TNewBarang.LoadByCatalog(aCatalog : string): Boolean;
begin
  result := FloadFromDB('Select * from ' + CustomTableName
    + ' Where ' + GetFieldNameFor_Catalog + ' = ' + QuotedStr(aCatalog));
end;

function TNewBarang.LoadByKode(aKode : string): Boolean;
begin
  result := FloadFromDB('Select * from ' + CustomTableName
                        + ' Where ' + GetFieldNameFor_Kode + ' = ' + QuotedStr(aKode));
end;

function TNewBarang.LoadByKode(aKode: string; aIsAktif, aIsValid: Boolean):
    Boolean;
var
  sValid: string;
  sAktif: string;
begin
  if aIsAktif then
    sAktif  := '1'
  else
    sAktif  := '0';

  if aIsValid then
    sValid  := '1'
  else
    sValid := '0';

  result := FloadFromDB('Select * from ' + CustomTableName
                        + ' Where ' + GetFieldNameFor_Kode + ' = ' + QuotedStr(aKode)
                        + ' and ' + GetFieldNameFor_IsActive + ' = ' + sAktif
                        + ' and ' + GetFieldNameFor_IsValidate + ' = ' + sValid)
                        ;
end;

function TNewBarang.RemoveFromDB: Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'delete from REF$KONVERSI_SATUAN where KONVSAT_BRG_CODE = ' + QuotedStr(Kode)
        + ' and KONVSAT_SAT_CODE_TO = ' + QuotedStr(FKodeSatuanStockKode);
  if cExecSQL(sSQL, dbtPOS, False) then
//    if SimpanBlob(sSQL, GetHeaderFlag) then
    begin
      sSQL := 'delete from ' + CustomTableName
                + ' where ' + GetFieldNameFor_Kode + ' = ' + QuotedStr(Kode) ;
      if cExecSQL(sSQL, dbtPOS, False) then
        Result := True;//SimpanBlob(sSQL, GetHeaderFlag);
    end;
end;

function TNewBarang.SQLInsertBarang: string;
begin
  if IsGalon = 1 then
    Result :=  QuotedStr(FBarangGalonKode) + ','
  else
    Result :=  'null,';

end;

function TNewBarang.SQLUpdateBarang: string;
begin
  if BarangGalon.Kode <> '' then
    Result := ' , ' + GetFieldNameFor_BarangGalon + ' = ' + QuotedStr(FBarangGalonKode)
  else
    Result :=  ' , ' + GetFieldNameFor_BarangGalon + ' = null';

end;

procedure TNewBarang.UpdateData(aAlias, aCatalog: string; aDefaultMarkUP:
    Double; aExpireTime: Integer; aHeight: string; aIsActive, aIsBuild, aIsCS,
    aIsDecimal, aIsDeposit, aIsDiscGMC, aIsGalon, aIsPajakInclude, aIsStock,
    aIsValidate: Integer; aKategori_ID, aKode, aKodePurchase, aUOM, aLength,
    aMerk, aNama, aNewBarangPajak_ID, aNewLocation_Kode, aNewMerchadize_ID,
    aNewMerchandizeGroup_ID, aSalesOutlet_ID, aTipeBarangID, aUOMDiameter,
    aUOMVolume, aUOMWeight, aWidth: string; aHargaVerage: Double;
    aBrgGalonCode, aAuthorId, aPubsId: String; aSafetySTStock: Double;
    aIsBasic: Integer);
begin
  FreeAndNilObjectProperty;

  FAlias :=  aAlias;
  FCatalog := trim(aCatalog);
  FDefaultMarkUP :=  aDefaultMarkUP;
  FExpireTime :=  aExpireTime;
  FHeight := trim(aHeight);
  FIsActive :=  aIsActive;
  FIsBuild :=  aIsBuild;
  FIsCS :=  aIsCS;
  FIsDecimal :=  aIsDecimal;
  FIsDeposit :=  aIsDeposit;
  FIsDiscGMC :=  aIsDiscGMC;
  FIsGalon :=  aIsGalon;
  FIsPajakInclude :=  aIsPajakInclude;
  FIsStock :=  aIsStock;
  FIsValidate :=  aIsValidate;
  FKategoriID := aKategori_ID;
  FKode := trim(aKode);
  KodePurchase := trim(aKodePurchase);
  FKodeSatuanStockKode := aUOM;
  Length := trim(aLength);
  FMerk := trim(aMerk);
  FNama := trim(aNama);
  FNewPajakID := aNewBarangPajak_ID;
  FNewLocationKode := aNewLocation_Kode;
  FNewMerchadizeID := aNewMerchadize_ID;
  FNewMerchandizeGroupID := aNewMerchandizeGroup_ID;
//  FNewUnitID := aNewUnit_ID;
  FSalesOutletID := aSalesOutlet_ID;
  FTipeBarangID :=  aTipeBarangID;
  FUOMDiameter := trim(aUOMDiameter);
  FUOMVolume := trim(aUOMVolume);
  FUOMWeight := trim(aUOMWeight);
//  FValidateUserID :=  aValidateUserID;
//  FValidateUserUnitID := aValidateUserUnit_ID;
  FWidth := trim(aWidth);
  FHargaAverage := aHargaVerage;
  FSafetyStock := aSafetySTStock;

  FBarangGalonKode    := aBrgGalonCode;

  FIsBasic            := aIsBasic;

  State := csCreated;
end;

function TNewBarang.UpdateStatusValidBarang: Boolean;
var
  sSQL: string;
begin
  Result := False;
  sSQL := 'UPDATE BARANG SET BRG_IS_VALIDATE = 1 '+
          'WHERE (BRG_CODE = ' + QuotedStr(Kode) + ' );';
  if cExecSQL(sSQL,dbtPOS, False) then
    Result := True; //SimpanBlob(sSQL, GetHeaderFlag);

end;

function TNewBarang.ValidateBarang(aBrgCode: string): Boolean;
var
  isCommit: Boolean;
begin



    isCommit  := False;

      if LoadByKode(aBrgCode) then
      begin
        if UpdateStatusValidBarang then
          isCommit := True
        else
        begin
          isCommit := False;
        end;

      end;

  Result := isCommit;
end;








function GetSQLBarang(aUnitID: Integer; aBrgId: string = ''): string;
var
  ssQL  : string;
begin
  ssQL  := 'SELECT BRG_CODE AS CODE, BRG_ALIAS AS NAME,'
        + ' BRG_SAT_CODE_STOCK as "UOM STOCK", BRG_IS_DECIMAL as "IS DECIMAL"'
        + ' FROM BARANG'
//        + ' and brg_is_active = 1'
        + ' where BRG_IS_STOCK = 1';

  if aBrgId <> '' then
    ssQL  := ssQL + ' AND BRG_CODE = '+ QuotedStr(aBrgId);

  sSQL  := sSQL  + ' group by brg_code, brg_alias, BRG_SAT_CODE_STOCK,'
                 + ' BRG_IS_DECIMAL';

  Result  := ssQL;
end;



end.
