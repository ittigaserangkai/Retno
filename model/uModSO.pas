unit uModSO;

interface

uses
  uModApp, uModUnit, uModBarang, uModSuplier;


type
  TModSO = class(TModApp)
  private
    FAUTUNIT: TModUnit;
    FMERCHANDISEGROUP: TModMerchandiseGroup;
    FSO_DATE: TDatetime;
    FSO_NO: string;
  public
    AttributeOfForeign;
  published
    property AUTUNIT: TModUnit read FAUTUNIT write FAUTUNIT;
    property MERCHANDISEGROUP: TModMerchandiseGroup read FMERCHANDISEGROUP
        write FMERCHANDISEGROUP;
    property SO_DATE: TDatetime read FSO_DATE write FSO_DATE;
    property SO_NO: string read FSO_NO write FSO_NO;
  end;

implementation

end.
