unit uModSettingApp;

interface

uses
  uModApp, uModUnit, uModGudang, System.Classes, uModBank;

type
  TModSettingApp = class(TModApp)
  private
    FAUTUNIT: TModUnit;
    FDEFAULT_BANK_BCO: TModBank;
    FGUDANG_DO: TModGudang;
    FPRICE_BARCODE_REQ: Double;
    FREKENING_HUTANG: string;
    FREKENING_PENDAPATAN_LABEL: string;
    FREKENING_PENDAPATAN_LAIN: string;
    FREKENING_PIUTANG_LABEL: string;
    FREKENING_PIUTANG_LAIN: string;
  public
    function GetListRekeningHutang: TStrings;
  published
    [AttributeOfForeign('AUT$UNIT_ID')]
    property AUTUNIT: TModUnit read FAUTUNIT write FAUTUNIT;
    property DEFAULT_BANK_BCO: TModBank read FDEFAULT_BANK_BCO write
        FDEFAULT_BANK_BCO;
    [AttributeOfForeign('GUDANG_DO')]
    property GUDANG_DO: TModGudang read FGUDANG_DO write FGUDANG_DO;
    property PRICE_BARCODE_REQ: Double read FPRICE_BARCODE_REQ write
        FPRICE_BARCODE_REQ;
    property REKENING_HUTANG: string read FREKENING_HUTANG write FREKENING_HUTANG;
    property REKENING_PENDAPATAN_LABEL: string read FREKENING_PENDAPATAN_LABEL
        write FREKENING_PENDAPATAN_LABEL;
    property REKENING_PENDAPATAN_LAIN: string read FREKENING_PENDAPATAN_LAIN write
        FREKENING_PENDAPATAN_LAIN;
    property REKENING_PIUTANG_LABEL: string read FREKENING_PIUTANG_LABEL write
        FREKENING_PIUTANG_LABEL;
    property REKENING_PIUTANG_LAIN: string read FREKENING_PIUTANG_LAIN write
        FREKENING_PIUTANG_LAIN;
  end;

implementation

function TModSettingApp.GetListRekeningHutang: TStrings;
begin
  Result                  := TStringList.Create;
  Result.Delimiter        := ';';
  Result.StrictDelimiter  := True; // Requires D2006 or newer.
  Result.DelimitedText    := Self.REKENING_HUTANG
end;

initialization
  TModSettingApp.RegisterRTTI;


end.
