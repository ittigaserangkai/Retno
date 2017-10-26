unit uModProdukJasa;

interface

uses
  uModApp, uModBarang, uModRefPajak, uModRekening;

type
  TModProdukJasa = class(TModApp)
  private
    FMODPAJAK: TModRefPajak;
    FMODTIPEBARANG: TModTipeBarang;
    FPROJAS_CODE: string;
    FPROJAS_DEFAULT_PRICE: Double;
    FPROJAS_IS_BKP: Integer;
    FPROJAS_NAME: string;
    FPROJAS_OWNER: string;
    FREKENING_ID_CREDIT: TModRekening;
    FREKENING_ID_DEBET: TModRekening;
  public
    class function GetTableName: String; override;
  published
    property MODPAJAK: TModRefPajak read FMODPAJAK write FMODPAJAK;
    property MODTIPEBARANG: TModTipeBarang read FMODTIPEBARANG write FMODTIPEBARANG;
    property PROJAS_CODE: string read FPROJAS_CODE write FPROJAS_CODE;
    property PROJAS_DEFAULT_PRICE: Double read FPROJAS_DEFAULT_PRICE write
        FPROJAS_DEFAULT_PRICE;
    property PROJAS_IS_BKP: Integer read FPROJAS_IS_BKP write FPROJAS_IS_BKP;
    property PROJAS_NAME: string read FPROJAS_NAME write FPROJAS_NAME;
    property PROJAS_OWNER: string read FPROJAS_OWNER write FPROJAS_OWNER;
    property REKENING_ID_CREDIT: TModRekening read FREKENING_ID_CREDIT write
        FREKENING_ID_CREDIT;
    property REKENING_ID_DEBET: TModRekening read FREKENING_ID_DEBET write
        FREKENING_ID_DEBET;
  end;

implementation

class function TModProdukJasa.GetTableName: String;
begin
  Result := 'PRODUK_JASA';
end;

initialization
  TModProdukJasa.RegisterRTTI;

end.
