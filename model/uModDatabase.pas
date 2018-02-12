unit uModDatabase;

interface

type
  {$TYPEINFO ON}
  TModTable = class(TObject)
  {$TYPEINFO OFF}
  private
    FTableName: string;
  published
    property TableName: string read FTableName write FTableName;
  end;

  {$TYPEINFO ON}
  TModTableItem = class(TObject)
  {$TYPEINFO OFF}
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
