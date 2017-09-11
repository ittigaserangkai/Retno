unit uModSettingApp;

interface

uses
  uModApp, uModUnit, uModGudang, System.Classes;

type
  TModSettingApp = class(TModApp)
  private
    FAUTUNIT: TModUnit;
    FGUDANG_DO: TModGudang;
    FREKENING_HUTANG: string;
  public
    function GetListRekeningHutang: TStrings;
  published
    [AttributeOfForeign('AUT$UNIT_ID')]
    property AUTUNIT: TModUnit read FAUTUNIT write FAUTUNIT;

    [AttributeOfForeign('GUDANG_DO')]
    property GUDANG_DO: TModGudang read FGUDANG_DO write FGUDANG_DO;
    [AttributeOfForeign('REKENING_HUTANG')]
    property REKENING_HUTANG: string read FREKENING_HUTANG write FREKENING_HUTANG;
  end;

implementation

function TModSettingApp.GetListRekeningHutang: TStrings;
begin
  Result := TStringList.Create;
  Result.Delimiter := ';';
  Result.StrictDelimiter := True; // Requires D2006 or newer.
  Result.DelimitedText   := Self.REKENING_HUTANG
end;

initialization
  TModSettingApp.RegisterRTTI;


end.
