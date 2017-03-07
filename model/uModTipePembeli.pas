unit uModTipePembeli;

interface

uses uModApp;

type
  TModTipePembeli = class(TModApp)
  private
    FTPBL_CODE: String;
    FTPBL_NAME: String;
  public
    class function GetTableName: String; override;
  published
    property TPBL_CODE: String read FTPBL_CODE write FTPBL_CODE;
    property TPBL_NAME: String read FTPBL_NAME write FTPBL_NAME;
  end;

implementation

class function TModTipePembeli.GetTableName: String;
begin
  Result := 'REF$TIPE_PEMBELI';
end;

end.
