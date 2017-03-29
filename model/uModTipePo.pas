unit uModTipePo;

interface

uses
  uModApp;

type
  TModTipePo = class(TModApp)
  private
    FDOC_NAME: string;
  public
    class function GetTableName: string; override;
  published
    property DOC_NAME: string read FDOC_NAME write FDOC_NAME;
  end;

implementation

class function TModTipePo.GetTableName: string;
begin
  Result := 'REF$TIPE_PO';
end;
Initialization
  TModTipePo.RegisterRTTI;
end.
