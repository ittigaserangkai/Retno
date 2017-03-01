unit uModCompany;

interface

uses
  uModApp;

type
  TModCompany = class(TModApp)

  private
    FCOMP_CODE: string;
    FCOMP_NAME: string;
  public
    class function GetTableName: String; dynamic;
    property COMP_CODE: string read FCOMP_CODE write FCOMP_CODE;
    property COMP_NAME: string read FCOMP_NAME write FCOMP_NAME;
  end;

implementation

class function TModCompany.GetTableName: String;
begin
  Result := 'COMPANY';
end;

end.
