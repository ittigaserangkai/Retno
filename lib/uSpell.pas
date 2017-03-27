unit uSpell;

interface

uses
  SysUtils, Dialogs;

type
  TSpell = class
  private
    function ToText(Number: int64; Level: byte = 0): string;
    function ToText2(Text: string; Number: int64): string;
    function ToText3(Text: string; Number: int64): string;
    function AddSuffix(Level: byte): string;
    function FormatNum(Value: string): string;
    function InSpell(Text: string): string;
  public
    constructor Create;
    destructor Destroy; override;       
    function Spell(Text: string): string;
  end;

var
  Level: byte;
  aHasil: array of string;

implementation

function TSpell.ToText(Number: int64; Level: byte): string;
begin
  case Number of
    1: if Level = 2 then
         Result := 'Se'
       else
         Result := 'Satu ';
    2: Result := 'Dua ';
    3: Result := 'Tiga ';
    4: Result := 'Empat ';
    5: Result := 'Lima ';
    6: Result := 'Enam ';
    7: Result := 'Tujuh ';
    8: Result := 'Delapan ';
    9: Result := 'Sembilan ';
  end;  // end case
end;

function TSpell.ToText2(Text: string; Number: int64): string;
var
  fPuluhan: byte;
begin
  case Number of
    10: Result := 'Sepuluh ';
    11: Result := 'Sebelas ';
    else
    begin
      fPuluhan := StrToInt64(Text[1]);
      case fPuluhan of
        1: Result := ToText(Number mod (fPuluhan*10)) + 'belas ';
        2..9:
           Result := ToText(fPuluhan) + 'puluh ' + ToText(Number mod (fPuluhan*10));
      end;  // end case
    end;
  end;  // end case
end;

function TSpell.ToText3(Text: string; Number: int64): string;
var
  fRatusan,
  fPuluhan: byte;
  fTemp,
  fTemp2: string;
begin
  case Number of
    100: Result := 'Seratus ';
    else
    begin
      fRatusan := StrToInt64(Text[1]);
      case fRatusan of
        1: fTemp := 'Seratus ';
        2..9:
           fTemp := ToText(fRatusan) + 'ratus ';
      end;  // end case

      fPuluhan := StrToInt64(Text[2]);
      if fPuluhan = 0 then
        Result := fTemp + ToText(Number mod (fRatusan*100))
      else
      begin
        fTemp2 := Text;
        delete(fTemp2, 1, 1);
        Result := fTemp + ToText2(fTemp2, StrToInt64(fTemp2));
      end;  // end if
    end;
  end;  // end case
end;

function TSpell.AddSuffix(Level: byte): string;
begin
  case Level of
    1: Result := '';
    2: Result := 'Ribu ';
    3: Result := 'Juta ';
    4: Result := 'Milyar ';
    5: Result := 'Trilyun ';
    6: Result := 'Bilyun ';
  end;  // end case
end;

function TSpell.Spell(Text: string): string;
var
  fJmlAll: currency;
  fJml: int64;
  fDes: real;
  fLen: byte;
  fHasil,
  fTemp: string;
begin
  try
    if Text <> '' then
    begin
      fTemp := FormatNum(Text);  // eliminate thousand separator

      if not (TryStrToCurr(fTemp, fJmlAll)) then
      begin
        ShowMessage('Angka yang Anda masukkan tidak valid dalam format.');
        Exit;
      end;  // end if

      fDes := Abs(Frac(fJmlAll));  // decimal value
      fJml := Round(Int(fJmlAll));  // int value
      fLen := Length(IntToStr(fJml));

      if fLen > 18 then
      begin
        ShowMessage('Angka yang Anda masukkan diluar jangkauan program.');
        Exit;
      end;  // end if

      fHasil := InSpell(IntToStr(fJml));

      if ((fHasil <> 'nol') and (fDes <> 0)) then
      begin
        Delete(fTemp, 1, Pos(FormatSettings.DecimalSeparator, fTemp));  // delete decimal separator
        fHasil := Trim(fHasil) + ' koma ' + InSpell(fTemp) + ' sen';
      end;  // end if
    end;  // end if

    Result := Trim(fHasil);
  except
    on E: Exception do
      ShowMessage( E.ClassName + ': ' + #13 + E.Message);
  end;
end;

constructor TSpell.Create;
begin
  FormatSettings.DecimalSeparator := ',';
  FormatSettings.ThousandSeparator := '.';
end;

destructor TSpell.Destroy;
begin

end;

function TSpell.FormatNum(Value: string): string;
var
  str: string;
  i: integer;
begin
  str := '';
  for i := 1 to Length(Value) do
//    if not (Value[i] in [FormatSettings.ThousandSeparator]) then
    if not CharInSet(Value[i], [FormatSettings.ThousandSeparator]) then
      str := str + Value[i];

  Result := str;
end; 

function TSpell.InSpell(Text: string): string;
var
  fJml: int64;
  i, fLen: byte;
  fText,
  fHasil,
  fTemp,
  fTemp2: string;
begin
  try
    fJml := StrToInt64(Text);
    fLen := Length(IntToStr(fJml));

    if (fLen mod 3) <> 0 then
      Level := (fLen div 3) + 1
    else
      Level := (fLen div 3);
    SetLength(aHasil, Level+1);

    fTemp := IntToStr(fJml);
    i := 0;
    while i < Level do
    begin
      Inc(i);
      fTemp2 := Copy(fTemp, Length(fTemp)-2, 3);
      Delete(fTemp, Length(fTemp)-2, 3);
      aHasil[i] := fTemp2;
    end;  // end while

    i := 0;
    fHasil := '';
    while i < Level do
    begin
      Inc(i);
      fJml := StrToInt(Trim(aHasil[i]));
      fText := IntToStr(fJml);

      if fText <> '0' then
      begin
        case Length(fText) of
          1: fHasil := ToText(StrToInt64(fText), i) + AddSuffix(i) + fHasil;
          2: fHasil := ToText2(fText, StrToInt64(fText)) + AddSuffix(i) + fHasil;
          3: fHasil := ToText3(fText, StrToInt64(fText)) + AddSuffix(i) + fHasil;
        end;  // end case
      end;  // end if
    end;  // end while

    Result := Trim(fHasil);
  except
    on E: Exception do
      ShowMessage( E.ClassName + ': ' + #13 + E.Message);
  end;
end;

end.
