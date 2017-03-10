unit uModCostCenter;

interface
uses
  uModApp;

type
  TModCostCenter = class(TModApp)
  private
    FCOCTER_CODE: string;
    FCOCTER_NAME: string;
  public
    class function GetTableName: String; override;
  published
    property COCTER_CODE: string read FCOCTER_CODE write FCOCTER_CODE;
    property COCTER_NAME: string read FCOCTER_NAME write FCOCTER_NAME;
  end;

implementation

class function TModCostCenter.GetTableName: String;
begin
  Result := 'COST_CENTER';
end;

initialization
  TModCostCenter.RegisterRTTI;


end.
