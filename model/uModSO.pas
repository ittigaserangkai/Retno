unit uModSO;

interface

uses
  uModApp, uModUnit, uModBarang, uModSupplier;


type
  TModSO = class(TModApp)
  private
    FAUTUNIT: TModUnit;
    FMERCHANDISEGROUP: TModMerchandiseGroup;
    FSO_DATE: TDatetime;
    FSO_NO: string;
    FSUPPLIER: TModSuplier;
    function GetSODetil(Index: Integer): TSODetil;
    procedure SetSODetil(Index: Integer; Value: TSODetil);
  public
    AttributeOfForeign;
    property SODetil[Index: Integer]: TSODetil read GetSODetil write SetSODetil;
  published
    property AUTUNIT: TModUnit read FAUTUNIT write FAUTUNIT;
    property MERCHANDISEGROUP: TModMerchandiseGroup read FMERCHANDISEGROUP
        write FMERCHANDISEGROUP;
    property SO_DATE: TDatetime read FSO_DATE write FSO_DATE;
    property SO_NO: string read FSO_NO write FSO_NO;
    property SUPPLIER: TModSuplier read FSUPPLIER write FSUPPLIER;
  end;

implementation

{
************************************ TModSO ************************************
}
function TModSO.GetSODetil(Index: Integer): TSODetil;
begin
end;

procedure TModSO.SetSODetil(Index: Integer; Value: TSODetil);
begin
end;

end.
