unit uModProdukJasa;

interface

uses
  uModApp, uModBarang, uModRefPajak, uModRekening, uModSuplier;

type
  TModProdukJasa = class(TModApp)
  private
    FPROJAS_CODE: String;
    FPROJAS_NAME: String;
    FPROJAS_OWNER: String;
    FPROJAS_IS_BKP: Integer;
    FPROJAS_DEFAULT_PRICE: Double;
    FSUPLIER_ID: TModSuplier;
    FTIPE_BARANG: TModTipeBarang;
    FPAJAK: TModRefPajak;
    FREKENING_ID_DEBET: TModRekening;
    FREKENING_ID_CREDIT: TModRekening;
  public
    class function GetTableName: String; override;
  published
    property PROJAS_CODE: String read FPROJAS_CODE write FPROJAS_CODE;
    property PROJAS_NAME: String read FPROJAS_NAME write FPROJAS_NAME;
    property PROJAS_OWNER: String read FPROJAS_OWNER write FPROJAS_OWNER;
    property PROJAS_IS_BKP: Integer read FPROJAS_IS_BKP write FPROJAS_IS_BKP;
    property PROJAS_DEFAULT_PRICE: Double read FPROJAS_DEFAULT_PRICE write
        FPROJAS_DEFAULT_PRICE;
    property TIPE_BARANG: TModTipeBarang read FTIPE_BARANG write FTIPE_BARANG;
    property PAJAK: TModRefPajak read FPAJAK write FPAJAK;
    property REKENING_ID_DEBET: TModRekening read FREKENING_ID_DEBET write
        FREKENING_ID_DEBET;
    property REKENING_ID_CREDIT: TModRekening read FREKENING_ID_CREDIT write
        FREKENING_ID_CREDIT;
  end;

implementation

class function TModProdukJasa.GetTableName: String;
begin
  Result := 'PRODUK_JASA';
end;

initialization
  TModProdukJasa.RegisterRTTI;

end.
