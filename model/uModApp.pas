unit uModApp;

interface

type
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

    property ObjectState: Integer read FObjectState write FObjectState;   // 1 Baru, 3 Edit, 5 Hapus
  published
    property Date_Create: TDatetime read FDate_Create write FDate_Create;
    property Date_Modify: Integer read FDate_Modify write FDate_Modify;
    property ID: string read FID write FID;
  end;

  TModAppItem = class(TModApp)
  public
    function GetHeaderField: string; virtual; abstract;
    procedure SetHeaderProperty(AHeaderProperty : TModApp); virtual; abstract;
  end;

implementation

constructor TModApp.Create;
begin
  inherited;
  ObjectState := 1;
end;

//initialization
//  RegisterClass(TBarangSatuanItem);


constructor TModApp.CreateID(AID: String);
begin
  Self    := inherited Create;
  Self.ID := AID;

end;

end.
