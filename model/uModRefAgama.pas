unit uModRefAgama;

interface
  uses uModApp;

type
  TModRefAgama = class(TModApp)
  private
    FAGAMA_NAME: String;
  public
    class function GetTableName: String; override;
  published
    property AGAMA_NAME: String read FAGAMA_NAME write FAGAMA_NAME;
  end;

implementation

class function TModRefAgama.GetTableName: String;
begin
  Result := 'REF$AGAMA';
end;

initialization
  //if error "can not instantiate type of uModel.xxxx" occured, register here
  TModRefAgama.RegisterRTTI;

end.
