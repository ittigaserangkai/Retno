unit uModDatabase;

interface

type
  TModTable = class(TObject)
  private
    FTableName: string;
  published
    property TableName: string read FTableName write FTableName;
  end;

  TModTableItem = class(TObject)
  private
    FColumnLength: Integer;
    FColumnName: string;
    FColumnType: string;
  published
    property ColumnLength: Integer read FColumnLength write FColumnLength;
    property ColumnName: string read FColumnName write FColumnName;
    property ColumnType: string read FColumnType write FColumnType;
  end;

implementation


end.
