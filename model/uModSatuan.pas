unit uModSatuan;

interface
uses
  uModApp;

type
  TModSatuan = class(TModApp)
  private
    FSAT_CODE: string;
    FSAT_GROUP: string;
    FSAT_NAME: string;
  public
    class function GetTableName: String; override;
  published
    property SAT_CODE: string read FSAT_CODE write FSAT_CODE;
    property SAT_GROUP: string read FSAT_GROUP write FSAT_GROUP;
    property SAT_NAME: string read FSAT_NAME write FSAT_NAME;
  end;

implementation

class function TModSatuan.GetTableName: String;
begin
  Result := 'ref$satuan';
end;

initialization
  TModSatuan.RegisterRTTI;
end.
