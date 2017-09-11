unit uModUpdatePOS;

interface

uses
  uModApp, System.Generics.Collections;

type
  TModUpdatePOSDetail = class;

  TModUpdatePOS = class(TModApp)
  private
    FModUpdatePOSDetails: TObjectList<TModUpdatePOSDetail>;
    FPOSField: string;
    FPrimaryField: string;
    FTableName: string;
    function GetModUpdatePOSDetails: TObjectList<TModUpdatePOSDetail>;
  public
    property ModUpdatePOSDetails: TObjectList<TModUpdatePOSDetail> read
        GetModUpdatePOSDetails write FModUpdatePOSDetails;
  published
    property POSField: string read FPOSField write FPOSField;
    property PrimaryField: string read FPrimaryField write FPrimaryField;
    property TableName: string read FTableName write FTableName;
  end;

  TModUpdatePOSDetail = class(TModApp)
  private
    FPOSValue: Integer;
    FPrimaryValue: string;
  published
    property POSValue: Integer read FPOSValue write FPOSValue;
    property PrimaryValue: string read FPrimaryValue write FPrimaryValue;
  end;

implementation

function TModUpdatePOS.GetModUpdatePOSDetails: TObjectList<TModUpdatePOSDetail>;
begin
  If not Assigned(FModUpdatePOSDetails) then
    FModUpdatePOSDetails := TObjectList<TModUpdatePOSDetail>.Create;
  Result := FModUpdatePOSDetails;
end;

initialization
  TModUpdatePOS.RegisterRTTI;
  TModUpdatePOSDetail.RegisterRTTI;

end.
