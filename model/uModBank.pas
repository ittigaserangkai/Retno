unit uModBank;

interface
uses
  uModApp, uModRekening;

type
  TModBank = class(TModApp)
  private
    FBANK_ADDRESS: string;
    FBANK_BRANCH: string;
    FBANK_CODE: string;
    FBANK_DESCRIPTION: string;
    FBANK_NAME: string;
    FREKENING: TModRekening;
  public
    class function GetTableName: String; override;
  published
    property BANK_ADDRESS: string read FBANK_ADDRESS write FBANK_ADDRESS;
    property BANK_BRANCH: string read FBANK_BRANCH write FBANK_BRANCH;
    property BANK_CODE: string read FBANK_CODE write FBANK_CODE;
    property BANK_DESCRIPTION: string read FBANK_DESCRIPTION write
        FBANK_DESCRIPTION;
    property BANK_NAME: string read FBANK_NAME write FBANK_NAME;
    property REKENING: TModRekening read FREKENING write FREKENING;
  end;

implementation

class function TModBank.GetTableName: String;
begin
  Result := 'Bank';
end;

initialization
  //if error "can not instantiate type of uModel.xxxx" occured, register here
  TModBank.RegisterRTTI;



end.
