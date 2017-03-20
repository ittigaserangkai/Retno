unit uModTipeKirimPO;

interface

uses
  uModApp;

type
  TModTipeKirimPO = class(TModApp)
  private
    FTPKRMPO_NAME: String;
    FTPKRMPO_CODE: String;
  public
    class function GetTableName: String; override;
  published
    property TPKRMPO_NAME: String read FTPKRMPO_NAME write FTPKRMPO_NAME;
    property TPKRMPO_CODE: String read FTPKRMPO_CODE write FTPKRMPO_CODE;
  end;

implementation

class function TModTipeKirimPO.GetTableName: String;
begin
  Result := 'REF$TIPE_KIRIM_PO';
end;

initialization
  TModTipeKirimPO.RegisterRTTI;
end.
