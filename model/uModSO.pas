unit uModSO;

interface

uses
  uModApp, uModUnit, uModBarang;


type
  TModSO = class(TModApp)
  private
    FAUTUNIT: TModUnit;
    FREF_MERCHANDISE_GRUP: TModMerchandiseGroup;
    FSO_DATE: TDatetime;
    FSO_NO: string;
  published
    [AttributeOfForeign('AUT$UNIT_ID')]
    property AUTUNIT: TModUnit read FAUTUNIT write FAUTUNIT;

    [AttributeOfForeign('REF$MERCHANDISE_GRUP_ID')]
    property REF_MERCHANDISE_GRUP: TModMerchandiseGroup read FREF_MERCHANDISE_GRUP
        write FREF_MERCHANDISE_GRUP;
    property SO_DATE: TDatetime read FSO_DATE write FSO_DATE;
    property SO_NO: string read FSO_NO write FSO_NO;
  end;

implementation

end.
