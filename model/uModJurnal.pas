unit uModJurnal;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uModApp, uModCostCenter, uModUnit, uModRekening, System.Generics.Collections;

type
  TModJurnalItem = class;
  TModJurnal = class(TModApp)
  private
    FJUR_CLASSREF: string;
    FJUR_CREDIT: Double;
    FJUR_DATE: TDatetime;
    FJUR_DEBET: Double;
    FJUR_DESCRIPTION: string;
    FJUR_FISCAL_YEAR: string;
    FJUR_IS_POSTED: Integer;
    FJUR_JURNALITEMS: TObjectList<TModJurnalItem>;
    FJUR_NO: string;
    FJUR_PERIOD: string;
    FJUR_POSTED_DATE: Double;
    FJUR_REF_NO: string;
    FJUR_UNIT: TModUnit;
    function GetJUR_JURNALITEMS: TObjectList<TModJurnalItem>;
  public
    property JUR_JURNALITEMS: TObjectList<TModJurnalItem> read GetJUR_JURNALITEMS
        write FJUR_JURNALITEMS;
  published
    property JUR_CLASSREF: string read FJUR_CLASSREF write FJUR_CLASSREF;
    property JUR_CREDIT: Double read FJUR_CREDIT write FJUR_CREDIT;
    property JUR_DATE: TDatetime read FJUR_DATE write FJUR_DATE;
    property JUR_DEBET: Double read FJUR_DEBET write FJUR_DEBET;
    property JUR_DESCRIPTION: string read FJUR_DESCRIPTION write FJUR_DESCRIPTION;
    property JUR_FISCAL_YEAR: string read FJUR_FISCAL_YEAR write
        FJUR_FISCAL_YEAR;
    property JUR_IS_POSTED: Integer read FJUR_IS_POSTED write FJUR_IS_POSTED;

    [AttributeOfCode]
    property JUR_NO: string read FJUR_NO write FJUR_NO;
    property JUR_PERIOD: string read FJUR_PERIOD write FJUR_PERIOD;
    property JUR_POSTED_DATE: Double read FJUR_POSTED_DATE write
        FJUR_POSTED_DATE;
    property JUR_REF_NO: string read FJUR_REF_NO write FJUR_REF_NO;

    [AttributeOfForeign('AUT$UNIT_ID')]
    property JUR_UNIT: TModUnit read FJUR_UNIT write FJUR_UNIT;
  end;

  TModJurnalItem = class(TModApp)
  private
    FJURD_COSTCENTER: TModCostCenter;
    FJURD_CREDIT: Double;
    FJURD_DEBET: Double;
    FJURD_DESCRIPTION: string;
    FJURD_JURNAL: TModJurnal;
    FJURD_REKENING: TModRekening;
  public
    class function GetTableName: String; override;
  published
    [AttributeOfForeign('COST_CENTER_ID')]
    property JURD_COSTCENTER: TModCostCenter read FJURD_COSTCENTER write
        FJURD_COSTCENTER;
    property JURD_CREDIT: Double read FJURD_CREDIT write FJURD_CREDIT;
    property JURD_DEBET: Double read FJURD_DEBET write FJURD_DEBET;
    property JURD_DESCRIPTION: string read FJURD_DESCRIPTION write
        FJURD_DESCRIPTION;

    [AttributeOfHeader('JURNAL_ID')]
    property JURD_JURNAL: TModJurnal read FJURD_JURNAL write FJURD_JURNAL;

    [AttributeOfForeign('REKENING_ID')]
    property JURD_REKENING: TModRekening read FJURD_REKENING write
        FJURD_REKENING;
  end;


implementation

function TModJurnal.GetJUR_JURNALITEMS: TObjectList<TModJurnalItem>;
begin
  if FJUR_JURNALITEMS = nil then
    FJUR_JURNALITEMS := TObjectList<TModJurnalItem>.Create();

  Result := FJUR_JURNALITEMS;
end;

class function TModJurnalItem.GetTableName: String;
begin
  Result := 'JURNAL_DETIL';
end;



end.
