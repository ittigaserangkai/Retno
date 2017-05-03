unit uModOutlet;

interface

uses uModApp;

type
  TModOutlet = class(TModApp)
  private
    FOUTLET_CODE: String;
    FOUTLET_NAME: String;
    FOUTLET_DESCRIPTION: String;
  public
    class function GetTableName: String; override;
  published
    [AttributeOfCode]
    property OUTLET_CODE: String read FOUTLET_CODE write FOUTLET_CODE;
    property OUTLET_NAME: String read FOUTLET_NAME write FOUTLET_NAME;
    property OUTLET_DESCRIPTION: String read FOUTLET_DESCRIPTION write
        FOUTLET_DESCRIPTION;
  end;

implementation

class function TModOutlet.GetTableName: String;
begin
  Result := 'REF$OUTLET';
end;

Initialization

TmodOutlet.RegisterRTTI;

end.
