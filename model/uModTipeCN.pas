unit uModTipeCN;

interface

uses
  uModApp;

type
  TModTipeCN = class(TModApp)
  private
    FTPCN_CODE: String;
    FTPCN_NAME: String;
  public
    class function GetTableName: String; override;
  published
    property TPCN_CODE: String read FTPCN_CODE write FTPCN_CODE;
    property TPCN_NAME: String read FTPCN_NAME write FTPCN_NAME;
  end;

implementation

class function TModTipeCN.GetTableName: String;
begin
  Result := 'REF$TIPE_CN';
end;
initialization
  //if error "can not instantiate type of uModel.xxxx" occured, register here
  TModTipeCN.RegisterRTTI;

end.
