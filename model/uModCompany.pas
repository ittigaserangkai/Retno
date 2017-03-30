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
    class function GetTableName: String; override;
  published
    [AttributeOfCode]
    property COMP_CODE: string read FCOMP_CODE write FCOMP_CODE;
    property COMP_NAME: string read FCOMP_NAME write FCOMP_NAME;
  end;

implementation

class function TModCompany.GetTableName: String;
begin
  Result := 'COMPANY';
end;

initialization
  //if error "can not instantiate type of uModel.xxxx" occured, register here
  TModCompany.RegisterRTTI;
end.
