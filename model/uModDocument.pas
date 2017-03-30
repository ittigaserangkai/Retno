unit uModDocument;

interface

uses
  uModApp;

type
  TModDocument = class(TModApp)
  private
    FDOC_NAME: string;
  public
    class function GetTableName: string; override;
  published
    property DOC_NAME: string read FDOC_NAME write FDOC_NAME;
  end;

implementation

class function TModDocument.GetTableName: string;
begin
  Result := 'REF$DOCUMENT';
end;
Initialization
  TModDocument.RegisterRTTI;

end.
