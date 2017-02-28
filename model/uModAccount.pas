unit uModAccount;

interface
uses
  uModApp;

type
  TModRekening = class(TModApp)

  private
    FRek_Code: string;
  published
    property Rek_Code: string read FRek_Code write FRek_Code;
  end;

implementation

end.
