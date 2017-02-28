unit uModAccount;

interface
uses
  uModApp;

type
  TModRekening = class(TModApp)

  private
    FRek_Code: string;
    FRek_Parent: TModRekening;
    FRek_Is_Debet: Integer;
    FRek_Is_Leaf: Integer;
    FRek_Level: Integer;
    FRek_Name: string;
  published
    property Rek_Code: string read FRek_Code write FRek_Code;
    property Rek_Parent: TModRekening read FRek_Parent write FRek_Parent;
    property Rek_Is_Debet: Integer read FRek_Is_Debet write FRek_Is_Debet;
    property Rek_Is_Leaf: Integer read FRek_Is_Leaf write FRek_Is_Leaf;
    property Rek_Level: Integer read FRek_Level write FRek_Level;
    property Rek_Name: string read FRek_Name write FRek_Name;
  end;

implementation

end.
