unit uModTipeBonus;

interface

uses
  uModApp;

type
  TModTipeBonus = class(TModApp)
  private
    FTPBNS_CODE: String;
    FTPBNS_NAME: String;
  public
    class function GetTableName: String; override;
  published
    property TPBNS_CODE: String read FTPBNS_CODE write FTPBNS_CODE;
    property TPBNS_NAME: String read FTPBNS_NAME write FTPBNS_NAME;
  end;

implementation

class function TModTipeBonus.GetTableName: String;
begin
  Result := 'REF$TIPE_BONUS';
end;
initialization
  //if error "can not instantiate type of uModel.xxxx" occured, register here
  TModTipeBonus.RegisterRTTI;
end.
