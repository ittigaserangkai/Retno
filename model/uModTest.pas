unit uModTest;

interface

uses
  uModApp, Generics.Collections;

type
  TModTestItem = class;

  TModTest = class(TModApp)
  private
    FItems: TObjectList<TModTestItem>;
    FRefNo: string;
    FRefDate: TDateTime;
    function GetItems: TObjectList<TModTestItem>;
  public
    property Items: TObjectList<TModTestItem> read GetItems write FItems;
  published
    property RefNo: string read FRefNo write FRefNo;
    property RefDate: TDateTime read FRefDate write FRefDate;
  end;

  TModTestItem = class(TModAppItem)
  private
    dbf_ItemCode, dbf_ItemName : String;
    FHeader: TModTest;
    FHeader_ID: string;
    FItemCode: string;
    FItemName: string;
    FQTY: Double;
  public
    constructor Create;
    function GetHeaderField: string; override;
    property Header: TModTest read FHeader write FHeader;
  published
    property Header_ID: string read FHeader_ID write FHeader_ID;
    property ItemCode: string read FItemCode write FItemCode;
    property ItemName: string read FItemName write FItemName;
    property QTY: Double read FQTY write FQTY;
  end;

implementation

constructor TModTestItem.Create;
begin
  inherited;
  dbf_ItemCode := 'SKU';
  dbf_ItemName := 'NamaBarang';
end;

function TModTestItem.GetHeaderField: string;
begin
  Result := 'Header_ID';
end;

function TModTest.GetItems: TObjectList<TModTestItem>;
begin
  If not Assigned(FItems) then
    FItems := TObjectList<TModTestItem>.Create;
  Result := FItems;
end;

end.
