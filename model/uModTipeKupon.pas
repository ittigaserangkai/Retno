unit uModTipeKupon;

interface

uses uModApp;

type
  TModTipeKupon = class(TModApp)
  private
    FTPKUPON_ID: integer;
    FTPKUPON_NAMA: String;
  public
    class function GetTableName: String; override;
  published
    property TPKUPON_ID: integer read FTPKUPON_ID write FTPKUPON_ID;
    property TPKUPON_NAMA: String read FTPKUPON_NAMA write FTPKUPON_NAMA;
  end;

implementation

class function TModTipeKupon.GetTableName: String;
begin
  Result := 'REF$TIPE_KUPON';
end;

end.
