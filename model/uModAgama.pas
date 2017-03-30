unit uModAgama;

interface

uses
  uModApp;

type
  TModAgama = class(TModApp)
  private
    FDOC_NAME: string;
  public
    class function GetTableName: string; override;
  published
    property DOC_NAME: string read FDOC_NAME write FDOC_NAME;
  end;

implementation

class function TModAgama.GetTableName: string;
begin
  Result := 'REF$AGAMA';
end;
Initialization
  TModAgama.RegisterRTTI;

end.
