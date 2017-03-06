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
    FREK_IS_DEBET: Integer;
    FREK_IS_GROUP: Integer;
    FREK_IS_LEAF: Integer;
  public
    class function GetTableName: String; override;
  published
    property REK_CODE: String read FREK_CODE write FREK_CODE;
    property REK_PARENT_CODE: String read FREK_PARENT_CODE write FREK_PARENT_CODE;
    property REK_DESCRIPTION: String read FREK_DESCRIPTION write FREK_DESCRIPTION;
    property REK_LEVEL: Integer read FREK_LEVEL write FREK_LEVEL;
    property REK_NAME: String read FREK_NAME write FREK_NAME;
    property REK_IS_DEBET: Integer read FREK_IS_DEBET write FREK_IS_DEBET;
    property REK_IS_GROUP: Integer read FREK_IS_GROUP write FREK_IS_GROUP;
    property REK_IS_LEAF: Integer read FREK_IS_LEAF write FREK_IS_LEAF;
  end;

implementation

class function TModRekening.GetTableName: String;
begin
  Result := 'rekening';
end;

initialization
  TModRekening.RegisterRTTI;

end.
