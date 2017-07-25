unit uModSettingApp;

interface

uses
  uModApp, uModUnit, uModGudang;

type
  TModSettingApp = class(TModApp)
  private
    FAUTUNIT: TModUnit;
    FGUDANG_DO: TModGudang;
  published
    [AttributeOfForeign('AUT$UNIT_ID')]
    property AUTUNIT: TModUnit read FAUTUNIT write FAUTUNIT;

    [AttributeOfForeign('GUDANG_DO')]
    property GUDANG_DO: TModGudang read FGUDANG_DO write FGUDANG_DO;
  end;

implementation
initialization
  TModSettingApp.RegisterRTTI;


end.
