unit uModRefPajak;

interface
  uses uModApp;

type
  TModRefPajak = class(TModApp)
  private
    FPJK_NAME: String;
    FPJK_CODE: String;
    FPJK_PPN: Double;
    FPJK_PPNBM: Double;
    FPJK_IS_DEFAULT: integer;
  public
    class function GetTableName: String; override;
  published
    property PJK_NAME: String read FPJK_NAME write FPJK_NAME;
    property PJK_CODE: String read FPJK_CODE write FPJK_CODE;
    property PJK_PPN: Double read FPJK_PPN write FPJK_PPN;
    property PJK_PPNBM: Double read FPJK_PPNBM write FPJK_PPNBM;
    property PJK_IS_DEFAULT: integer read FPJK_IS_DEFAULT write FPJK_IS_DEFAULT;
  end;

implementation

class function TModRefPajak.GetTableName: String;
begin
  Result := 'REF$PAJAK';
end;

initialization
  //if error "can not instantiate type of uModel.xxxx" occured, register here
  TModRefPajak.RegisterRTTI;

end.
