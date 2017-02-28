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
    dbf_Header, dbf_ItemCode, dbf_ItemName : String;
    FHeader: TModTest;
    FItemCode: string;
    FItemName: string;
    FQTY: Double;
  public
    constructor Create;
    class function GetHeaderField: string; override;
    procedure MappingDBField; override;
  published
    property Header: TModTest read FHeader write FHeader;
    property ItemCode: string read FItemCode write FItemCode;
    property ItemName: string read FItemName write FItemName;
    property QTY: Double read FQTY write FQTY;
  end;

implementation

constructor TModTestItem.Create;
begin
  inherited;
  
end;

class function TModTestItem.GetHeaderField: string;
begin
  Result := 'Header';
end;

procedure TModTestItem.MappingDBField;
begin
  inherited;
  dbf_Header    := 'Header_ID';
  dbf_ItemCode  := 'SKU';
  dbf_ItemName  := 'NamaBarang';
end;

function TModTest.GetItems: TObjectList<TModTestItem>;
begin
  If not Assigned(FItems) then
    FItems := TObjectList<TModTestItem>.Create;
  Result := FItems;
end;

end.
