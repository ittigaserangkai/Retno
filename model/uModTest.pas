unit uModTest;

interface

uses
  uModApp, uModBank, Generics.Collections;

type
  TModTestItem = class;

  TModTest = class(TModApp)
  private
    FBank: TModBank;
    FItems: TObjectList<TModTestItem>;
    FRefNo: string;
    FRefDate: TDateTime;
    function GetItems: TObjectList<TModTestItem>;
  public
    property Items: TObjectList<TModTestItem> read GetItems write FItems;
  published
    property Bank: TModBank read FBank write FBank;
    property RefNo: string read FRefNo write FRefNo;
    property RefDate: TDateTime read FRefDate write FRefDate;
  end;

  TModTestItem = class(TModApp)
  private
    FHeader: TModTest;
    FItemCode: string;
    FItemName: string;
    FQTY: Double;
  public
  published
    [AttributeOfHeader]
    property Header: TModTest read FHeader write FHeader;
    [AttributeOfCustom('SKU')]
    property ItemCode: string read FItemCode write FItemCode;
    [AttributeOfCustom('NamaBarang')]
    property ItemName: string read FItemName write FItemName;
    property QTY: Double read FQTY write FQTY;
  end;

implementation

function TModTest.GetItems: TObjectList<TModTestItem>;
begin
  If not Assigned(FItems) then
    FItems := TObjectList<TModTestItem>.Create;
  Result := FItems;
end;

end.
