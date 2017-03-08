unit uModRekening;

interface
uses uModApp;
type
  TModRekeningGroup = class;
  TModRekening = class(TModApp)
  private
    FRekeningGroup: TModRekeningGroup;
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
    [AttributeOfForeign('REF$GRUP_REKENING_ID')]
    property RekeningGroup: TModRekeningGroup read FRekeningGroup write
        FRekeningGroup;
    property REK_CODE: String read FREK_CODE write FREK_CODE;
    property REK_PARENT_CODE: String read FREK_PARENT_CODE write FREK_PARENT_CODE;
    property REK_DESCRIPTION: String read FREK_DESCRIPTION write FREK_DESCRIPTION;
    property REK_LEVEL: Integer read FREK_LEVEL write FREK_LEVEL;
    property REK_NAME: String read FREK_NAME write FREK_NAME;
    property REK_IS_DEBET: Integer read FREK_IS_DEBET write FREK_IS_DEBET;
    property REK_IS_GROUP: Integer read FREK_IS_GROUP write FREK_IS_GROUP;
    property REK_IS_LEAF: Integer read FREK_IS_LEAF write FREK_IS_LEAF;
  end;


  TModRekeningGroup = class(TModApp)
  private
    FGROREK_NAME: String;
    FGROREK_DESCRIPTION: String;
    FGROREK_ID: Integer;
  public
    class function GetTableName: String; override;
  published
    property GROREK_NAME: String read FGROREK_NAME write FGROREK_NAME;
    property GROREK_DESCRIPTION: String read FGROREK_DESCRIPTION write
        FGROREK_DESCRIPTION;
    property GROREK_ID: Integer read FGROREK_ID write FGROREK_ID;
  end;

implementation

class function TModRekening.GetTableName: String;
begin
  Result := 'REKENING';
end;

class function TModRekeningGroup.GetTableName: String;
begin
  Result := 'REF$GRUP_REKENING';
end;

initialization
  TModRekening.RegisterRTTI;
  TModRekeningGroup.RegisterRTTI;
end.
