unit uModTipePembayaran;

interface

uses
  uModApp;

type
  TModTipePembayaran = class(TModApp)
  private
    FTPBYR_CODE: String;
    FTPBYR_NAME: string;
  public
    class function GetTableName: String; override;
  published
    property TPBYR_CODE: String read FTPBYR_CODE write FTPBYR_CODE;
    property TPBYR_NAME: string read FTPBYR_NAME write FTPBYR_NAME;
  end;

implementation

class function TModTipePembayaran.GetTableName: String;
begin
  Result := 'REF$TIPE_PEMBAYARAN';
end;

initialization
  //if error "can not instantiate type of uModel.xxxx" occured, register here
  TModTipePembayaran.RegisterRTTI;

end.
