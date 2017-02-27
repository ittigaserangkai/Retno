unit uGlobalProperty;

interface
uses Classes, SysUtils;

type
  TGlobalProperty = class(TObject)
  private
    FLIstMerID: TStrings;
  public
   
    constructor Create;
    destructor Destroy; override;
    property LIstMerID: TStrings read FLIstMerID write FLIstMerID;
  end;

implementation

constructor TGlobalProperty.Create;
begin
  inherited;
  FLIstMerID  := TStringList.Create;
end;

destructor TGlobalProperty.Destroy;
begin
  FreeANdNil(FLIstMerID);
  inherited;
end;

end.
