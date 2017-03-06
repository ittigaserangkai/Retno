unit uModTipeBarang;

interface

uses
  uModApp;

type
  TModTipeBarang = class(TModApp)
  private
    FTPBRG_CODE: string;
    FTPBRG_NAME: string;
  public
    class function GetTableName: String; override;
  published
    property TPBRG_CODE: string read FTPBRG_CODE write FTPBRG_CODE;
    property TPBRG_NAME: string read FTPBRG_NAME write FTPBRG_NAME;
  end;

implementation

class function TModTipeBarang.GetTableName: String;
begin
  Result := 'REF$TIPE_BARANG';
end;

Initialization
  TModTipeBarang.RegisterRTTI;

end.
