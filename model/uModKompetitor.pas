unit uModKompetitor;

interface

uses
  uModApp;

type
  TModKompetitor = class(TModApp)
  private
    FKOMPT_CODE: string;
    FKOMPT_IS_ACTIVE: Integer;
    FKOMPT_NAME: string;
  published
    [AttributeOfCode]
    property KOMPT_CODE: string read FKOMPT_CODE write FKOMPT_CODE;
    property KOMPT_IS_ACTIVE: Integer read FKOMPT_IS_ACTIVE write FKOMPT_IS_ACTIVE;
    property KOMPT_NAME: string read FKOMPT_NAME write FKOMPT_NAME;
  end;

implementation

initialization
  TModKompetitor.RegisterRTTI;

end.
