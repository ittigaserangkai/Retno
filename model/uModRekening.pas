unit uModRekening;

interface
uses uModApp;
type
  TModRekening = class(TModApp)
  private
    FREK_CODE: String;
    FREK_PARENT_CODE: String;
    FREK_DESCRIPTION: String;
    FREK_LEVEL: Integer;
    FREK_NAME: String;
  public
    class function GetTableName: String; override;
  published
    property REK_CODE: String read FREK_CODE write FREK_CODE;
    property REK_PARENT_CODE: String read FREK_PARENT_CODE write FREK_PARENT_CODE;
    property REK_DESCRIPTION: String read FREK_DESCRIPTION write FREK_DESCRIPTION;
    property REK_LEVEL: Integer read FREK_LEVEL write FREK_LEVEL;
    property REK_NAME: String read FREK_NAME write FREK_NAME;
  end;

implementation

class function TModRekening.GetTableName: String;
begin
  Result := 'rekening';
end;

initialization
  TModRekening.RegisterRTTI;

end.
