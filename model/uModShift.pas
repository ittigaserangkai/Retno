unit uModShift;

interface

uses
  uModApp;

type
  TModShift = class(TModApp)
  private
    FSHIFT_NAME: String;
    FSHIFT_START_TIME: TDateTime;
    FSHIFT_END_TIME: TDateTime;
  public
    class function GetTableName: String; override;
  published
    property SHIFT_END_TIME: TDateTime read FSHIFT_END_TIME write FSHIFT_END_TIME;
    property SHIFT_NAME: String read FSHIFT_NAME write FSHIFT_NAME;
    property SHIFT_START_TIME: TDateTime read FSHIFT_START_TIME write
        FSHIFT_START_TIME;
  end;

implementation

class function TModShift.GetTableName: String;
begin
  Result := 'SHIFT';
end;

initialization
  TModShift.RegisterRTTI;

end.
