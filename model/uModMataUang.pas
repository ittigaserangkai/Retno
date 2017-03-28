unit uModMataUang;

interface

uses
  uModApp;

type
  TModMataUang = class(TModApp)
  private
    FUANG_CODE: String;
    FUANG_SYMBOL: String;
    FUANG_NAME: String;
    FUANG_SCALE: Double;
  public
    class function GetTableName: String; override;
  published
    property UANG_CODE: String read FUANG_CODE write FUANG_CODE;
    property UANG_SYMBOL: String read FUANG_SYMBOL write FUANG_SYMBOL;
    property UANG_NAME: String read FUANG_NAME write FUANG_NAME;
    property UANG_SCALE: Double read FUANG_SCALE write FUANG_SCALE;
  end;

implementation

class function TModMataUang.GetTableName: String;
begin
  Result := 'REF$MATAUANG';
end;
initialization
  //if error "can not instantiate type of uModel.xxxx" occured, register here
  TModMatauang.RegisterRTTI;

end.
