unit uSpell;

interface

uses
  SysUtils, Dialogs, Controls, WinProcs;

type
  TSpell = class
  private
    function ToText(Number: longint; Level: byte): string;
    function ToText2(Text: string; Number: longint): string;
    function ToText3(Text: string; Number: longint): string;
    function AddSuffix(Level: byte): string;
    //function FormatNum(Value: string): string;
    function InSpell(Text: string): string;
  public
    constructor Create;
    destructor Destroy; override;
    function Spell(Text: string): string;
  end;

var
  Level: byte;
  aHasil: array[0..17] of string;

implementation

function TSpell.ToText(Number: longint; Level: byte): string;
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
  end;  {// end case}
end;

function TSpell.ToText2(Text: string; Number: longint): string;
var
  fPuluhan: byte;
begin
  case Number of
    10: Result := 'Sepuluh ';
    11: Result := 'Sebelas ';
    else
    begin
      fPuluhan := StrToInt(Text[1]);
      case fPuluhan of
        1: Result := ToText(Number mod (fPuluhan*10),2) + 'Belas ';
        2..9:
           Result := ToText(fPuluhan,2) + 'Puluh ';
      end;  {// end case}
    end;
  end;  {// end case}
end;

function TSpell.ToText3(Text: string; Number: longint): string;
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
      fRatusan := StrToInt(Text[1]);
      case fRatusan of
        1: fTemp := 'Seratus ';
        2..9:
           fTemp := ToText(fRatusan,0) + 'Ratus ';
      end;  {// end case}

      fPuluhan := StrToInt(Text[2]);
      if fPuluhan = 0 then
        Result := fTemp
      else
      begin
        fTemp2 := Text;
        delete(fTemp2, 1, 1);
        Result := fTemp + ToText2(fTemp2, StrToInt(fTemp2));
      end;  {// end if}
    end;
  end;  {// end case}
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
  end;  {// end case}
end;

function TSpell.Spell(Text: string): string;
var
  //fJmlAll: real;
  fLen: byte;
  fHasil,
  fTemp: string;
begin
  try
    if Text <> '' then
    begin
      //fTemp := FormatNum(Text);  {// eliminate thousand separator}
      fTemp := StringReplace(Text,ThousandSeparator,'',[rfReplaceAll]);
      fLen := Length(fTemp);

      if fLen > 18 then
      begin
        Exit;
      end;  {// end if}

      fHasil := InSpell(fTemp);
    end;  {// end if}

    Result := ' ' + fHasil + 'Rupiah ';
  except
    Result := '';
  end;
end;

constructor TSpell.Create;
begin
  //DecimalSeparator := ',';
  //ThousandSeparator := '.';
end;

destructor TSpell.Destroy;
begin

end;

//function TSpell.FormatNum(Value: string): string;
//var
//  str: string;
//  i: longint;
//begin
//  str := '';
//  for i := 1 to Length(Value) do
//    if not (Value[i] in [ThousandSeparator]) then
//      str := str + Value[i];
//
//  Result := str;
//end;

function TSpell.InSpell(Text: string): string;
var
  fJml: longint;
  i, fLen: byte;
  fText,
  fHasil,
  fTemp,
  fTemp2: string;
begin
  try
    fJml := StrToInt(Text);
    fLen := Length(IntToStr(fJml));

    if (fLen mod 3) <> 0 then
      Level := (fLen div 3) + 1
    else
      Level := (fLen div 3);

    fTemp := IntToStr(fJml);
    i := 0;
    while i < Level do
    begin
      Inc(i);
      fTemp2 := Copy(fTemp, Length(fTemp)-2, 3);
      Delete(fTemp, Length(fTemp)-2, 3);
      aHasil[i] := fTemp2;
    end;  {// end while}

    i := 0;
    fHasil := '';
    while i < Level do
    begin
      Inc(i);
      fJml := StrToInt(aHasil[i]);
      fText := IntToStr(fJml);

      if fText <> '0' then
      begin
        case Length(fText) of
          1: fHasil := ToText(StrToInt(fText), i) + AddSuffix(i) + fHasil;
          2: fHasil := ToText2(fText, StrToInt(fText)) + AddSuffix(i) + fHasil;
          3: fHasil := ToText3(fText, StrToInt(fText)) + AddSuffix(i) + fHasil;
        end;  {// end case}
      end;  {// end if      }
    end;  {// end while}

    Result := fHasil;
  except
    on E: Exception do
      {ShowMessage( E.ClassName + ': ' + #13 + E.Message);}
  end;
end;

end.
