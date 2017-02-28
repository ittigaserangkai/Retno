unit uModApp;

interface

type

{$TYPEINFO ON}
  TModApp = class;
{$TYPEINFO OFF}

  TModApp = class(TObject)
  private
    FDate_Create: TDatetime;
    FDate_Modify: Integer;
    FID: string;

    FObjectState: Integer;
  protected
  public
    constructor Create; reintroduce;
    constructor CreateID(AID : String);
    class function GetTableName: String; dynamic;

    property ObjectState: Integer read FObjectState write FObjectState;   // 1 Baru, 3 Edit, 5 Hapus
  published
    property Date_Create: TDatetime read FDate_Create write FDate_Create;
    property Date_Modify: Integer read FDate_Modify write FDate_Modify;
    property ID: string read FID write FID;
  end;

  TModAppItem = class(TModApp)
  public
    function GetHeaderField: string; dynamic; abstract;
    procedure SetHeaderProperty(AHeaderProperty : TModApp); dynamic; abstract;
  end;

  TModAppClass = class of TModApp;

implementation

uses
  StrUtils;

constructor TModApp.Create;
begin
  inherited;
  ObjectState := 1;
end;


constructor TModApp.CreateID(AID: String);
begin
  Self    := inherited Create;
  Self.ID := AID;

end;

class function TModApp.GetTableName: String;
begin
  Result := 'T' + AnsiRightStr( Self.ClassName , Length(Self.ClassName)-4);
end;

end.
