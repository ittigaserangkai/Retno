unit uModPO;

interface
uses
  uModApp, System.SysUtils

type
  TModPO = class(TModApp)
  private
    FPO_NO: string;
  published
    property PO_NO: string read FPO_NO write FPO_NO;
  end;

implementation

end.
