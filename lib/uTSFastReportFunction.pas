unit uTSFastReportFunction;

interface
uses SysUtils, Classes, fs_iinterpreter, DateUtils, Math;

type
  TTSFastReportFunction = class(TfsRTTIModule)
  private
    function CallMethod(Instance: TObject; ClassType: TClass; const MethodName:
        String; var Params: Variant): Variant;
  public
    constructor Create(AScript: TfsScript); override;
    function Quot(AString : String): String;
    function QuotDTAwal(ATgl : TDateTime): string;
    function QuotDTAkhir(ATgl : TDateTime): string;
    function StartOfTheMonth(ATgl : TDateTime): TDateTime;
    function EndOfTheMonth(ATgl : TDateTime): TDateTime;

    Function Num2Words:String;
    Function Num2Let(N:Double; aRpType:Integer):String;
    Function Num2LetEnglish(N:Double; aRpType:Integer):String;
    function Num2LetEnglishDef(const ARupiah: Double): string;
  end;

const
  _Kategori : string = 'TS Functions';

  Ltr: array [0..19] of String =
    ('NOL ', 'SATU ', 'DUA ', 'TIGA ', 'EMPAT ', 'LIMA ', 'ENAM ', 'TUJUH ',
    'DELAPAN ', 'SEMBILAN ', 'SEN ', 'BELAS ', 'PULUH ', 'RATUS ', 'RIBU ', 'JUTA ',
    'MILYAR ', 'TRILYUN ', 'KOMA ', 'SE');
  LtrEnglish: array [0..19] of String =
    ('Zero ', 'One ', 'Two ', 'three ', 'Four ', 'Five ', 'Six ', 'Seven ',
    'Eight ', 'Nine ', 'Cent ', 'Teen ', 'Tens ', 'Hundred ', 'Thousand ', 'Million ',
    'Billion ', 'Quintillion ', 'Comma ', 'ty');
  SEN     = 10;
  BELAS   = 11;
  PULUH   = 12;
  RATUS   = 13;
  RIBU    = 14;
  JUTA    = 15;
  MILYAR  = 16;
  TRILYUN = 17;
  KOMA    = 18;
  SATU    = 19;

implementation


{ TTSFastReportFunction }



constructor TTSFastReportFunction.Create;
begin
  inherited Create(AScript);
  with AScript do
  begin
    AddMethod('function Quot(s: String) : String', CallMethod, _Kategori, ' Quoted Str in FR');
    AddMethod('function QuotDTAwal(ATgl : TDateTime): string', CallMethod, _Kategori, ' Quoted Tanggal Awal');
    AddMethod('function QuotDTAkhir(ATgl : TDateTime): string', CallMethod, _Kategori, ' Quoted Tanggal Akhir');
    AddMethod('function StartOfTheMonth(ATgl : TDateTime): TDateTime', CallMethod, _Kategori, 'Start Of The Month');
    AddMethod('function EndOfTheMonth(ATgl : TDateTime): TDateTime', CallMethod, _Kategori, ' End Of The Month');
    AddMethod('function Num2Words : String', CallMethod, _Kategori, ' Numeric to kata2');
    AddMethod('Function Num2Let(N:Double; aRpType:Integer):String', CallMethod, _Kategori, ' Numeric to Letters (ID)');
    AddMethod('Function Num2LetEnglish(N:Double; aRpType:Integer):String', CallMethod, _Kategori, ' Numeric to Letters (EN)');
    AddMethod('function Num2LetEnglishDef(const ARupiah: Double): string', CallMethod, _Kategori, ' Numeric to Letters (Def)');
  end;

end;


function TTSFastReportFunction.CallMethod(Instance: TObject; ClassType: TClass;
    const MethodName: String; var Params: Variant): Variant;
begin
  if MethodName = 'QUOT' then
    Result := Quot(Params[0])
  else if MethodName = 'QUOTDTAWAL' then
    Result := QuotDTAwal(Params[0])
  else if MethodName = 'QUOTDTAKHIR' then
    Result := QuotDTAkhir(Params[0])
  else if MethodName = 'STARTOFTHEMONTH' then
    Result := StartOfTheMonth(Params[0])
  else if MethodName = 'ENDOFTHEMONTH' then
    Result := EndOfTheMonth(Params[0])
  else if MethodName = 'NUM2WORDS' then
    Result := Num2Words
  else if MethodName = 'NUM2LET' then
    Result := Num2Let(Params[0], Params[1])
  else if MethodName = 'NUM2LETENGLISH' then
    Result := Num2LetEnglish(Params[0], Params[1])
  else if MethodName = 'NUM2LETENGLISHDEF' then
    Result := Num2LetEnglishDef(Params[0])
  ;
end;

function TTSFastReportFunction.Quot(AString : String): String;
begin
  Result := QuotedStr(AString);
end;

function TTSFastReportFunction.QuotDTAkhir(ATgl : TDateTime): string;
begin
  Result := Quot(FormatDateTime('MM/dd/yyyy 23:59:59', ATgl));
end;

function TTSFastReportFunction.QuotDTAwal(ATgl : TDateTime): string;
begin
  Result := Quot(FormatDateTime('MM/dd/yyyy 00:00:00', ATgl));
end;

function TTSFastReportFunction.StartOfTheMonth(ATgl : TDateTime): TDateTime;
begin
  Result := DateUtils.StartOfTheMonth(ATgl);
end;

function TTSFastReportFunction.EndOfTheMonth(ATgl : TDateTime): TDateTime;
begin
  Result := DateUtils.EndOfTheMonth(ATgl);
end;

Function TTSFastReportFunction.Num2Words : String;
begin
  Result := 'satu dua tiga empat';
end;

Function SE(n:integer):String;
Begin
  If n = 1 then SE := Ltr[SATU]
  else SE := Ltr[N];
End;

Function u1000(n:integer):String;
Var
  rs:String;
  m: Integer;
Begin
  rs := '';
  If n > 0 then
  Begin
    m := n div 100;
    If (m>0) then rs := SE(m)+Ltr[RATUS];
    m := n mod 100;
    case m of
      0: ;
      1..9: rs := rs+Ltr[m];
      10: rs := rs+Ltr[SATU]+Ltr[PULUH];
      11..19: rs := rs+SE(m mod 10)+Ltr[BELAS];
      20..99:
        Begin
          rs := rs+Ltr[m div 10]+Ltr[PULUH];
          If (m mod 10) > 0 then rs := rs + Ltr[m mod 10];
        End;
    End;
  End;
  u1000 := rs;
End;

Function TTSFastReportFunction.Num2Let(N:Double; aRpType:Integer):String;
Var
  strN, Letter, X: String;
  i, j, nX: integer;
Begin
  j := 0; Letter := '';
  strN := format('%.2n', [N]);
  i := Length(strN);
  While (i >= 1) do
  Begin
    X := '';
    While not ((strN[i] in [',', '.'])) and (i>=1) do
    Begin
      X := strN[i]+X;
      dec(i);
    End;
    dec(i);
    nX := StrToInt(X);
    if (nX > 0) or (j = 0) then
    Case j of
      0:case aRpType of
        0:
          Letter := Ltr[KOMA]+Ltr[ord(X[1])-ord('0')]+Ltr[ord(X[2])-ord('0')];
        1:
          Begin
            If (nX > 0) then
              letter := Letter + u1000(nX)+Ltr[SEN];
          End;
       End;
      1:Letter := u1000(nX)+Letter;
      2:Begin
          If nX = 1 then Letter := 'SE'+Ltr[RIBU]+Letter
          Else Letter := u1000(nX)+Ltr[RIBU]+Letter;
        End;
      3:Letter := u1000(nX)+Ltr[JUTA]+Letter;
      4:Letter := u1000(nX)+Ltr[MILYAR]+Letter;
      5:Letter := u1000(nX)+Ltr[TRILYUN]+Letter;
    End;
    inc(j);
  End;
  Num2Let := Letter;
End;

Function TTSFastReportFunction.Num2LetEnglish(N:Double; aRpType:Integer):String;
Var
  strN, Letter, X: String;
  i, j, nX: integer;
Begin
  j := 0; Letter := '';
  strN := format('%.2n', [N]);
  i := Length(strN);
  While (i >= 1) do
  Begin
    X := '';
    While not ((strN[i] in [',', '.'])) and (i>=1) do
    Begin
      X := strN[i]+X;
      dec(i);
    End;
    dec(i);
    nX := StrToInt(X);
    if (nX > 0) or (j = 0) then
    Case j of
      0:case aRpType of
        0:
          Letter := LtrEnglish[KOMA]+LtrEnglish[ord(X[1])-ord('0')]+LtrEnglish[ord(X[2])-ord('0')];
        1:
          Begin
            If (nX > 0) then
              letter := Letter + u1000(nX)+LtrEnglish[SEN];
          End;
       End;
      1:Letter := u1000(nX)+Letter;
      2:Begin
          If nX = 1 then Letter := 'SE'+LtrEnglish[RIBU]+Letter
          Else Letter := u1000(nX)+LtrEnglish[RIBU]+Letter;
        End;
      3:Letter := u1000(nX)+LtrEnglish[JUTA]+Letter;
      4:Letter := u1000(nX)+LtrEnglish[MILYAR]+Letter;
      5:Letter := u1000(nX)+LtrEnglish[TRILYUN]+Letter;
    End;
    inc(j);
  End;
  Num2LetEnglish := Letter;
End;

function TTSFastReportFunction.Num2LetEnglishDef(const ARupiah: Double): string;
var
  A, P: extended;
  N,I : integer;
  T   : longint;
  NSen: integer;
  Str : string;

const
  Thousands : array[0..5] of string =
    ('', 'Thousand ', 'Million ', 'Billion ', 'Trillion ', 'Quadrillion ');
  Tens : array[0..9] of string =
             ('', '', 'Twenty', 'Thirty', 'Forty', 'Fifty',
              'Sixty', 'Seventy', 'Eighty', 'Ninety');
  Ones : array[0..19] of string =
             ('', 'One', 'Two', 'Three', 'Four', 'Five',
              'Six', 'Seven', 'Eight', 'Nine', 'Ten',
              'Eleven', 'Twelve', 'Thirteen', 'Fourteen', 'Fifteen',
              'Sixteen', 'Seventeen', 'Eighteen', 'Nineteen');

  function ParseRatusan(ANum: Longint): string;
  var
    I, J: integer;
    A,T : Longint;
    S   : string;

  begin
    S := '';
    I := 0;
    J := 0;
    Result := S;
    if (ANum <> 0) then
    begin
      A := ANum;
      T := A div 100;
      if (T > 0) then
      begin
        I := T;
        A := A - (T * 100);
      end;
      T := A div 10;
      if (T > 1) then
      begin
        J := T;
        A := A - (T * 10);
      end;
      if (I > 0) then
        S := Ones[I] + ' Hundred';
      if (J > 0) then
      begin
        if (I > 0) then
          S := S + ' ' + Tens[J]
        else
          S := S + Tens[J];
      end;
      if (A > 0) then
      begin
        if (J > 0) then
          S := S + '-';
        if (I > 0) and (J = 0) then
          S := S + ' ' + Ones[A]
        else
          S := S + Ones[A];
      end;
      Result := S;
    end;
  end;
begin
  Result := '';
  if (ARupiah < 0) then
    raise Exception.Create('Nilai ndak boleh < 0');
  if (ARupiah > 0) then
  begin
    N := Trunc(Log10(ARupiah));
    if (N > 17) then
      raise Exception.Create('Nilai yang akan dikonversi terlalu besar');
    A := ARupiah;
    for I := N downto 0 do
    begin
      P := Int(Power(10.0, I*3));
      T := Trunc(A/P);
      if (T > 0) then
      begin
        Str := ParseRatusan(T) + ' ' + Thousands[I];
        if Result = '' then
          Result := Str
        else
          Result := Result + ' ' + Str;
      end;
      A := A - (T * P);
    end;
    NSen := Round(Frac(ARupiah) * 1000);
    if NSen > 0 then
    begin
      Str := 'And '+ ParseRatusan(NSen);
      Result := Result +  Str;
    end;
  end;
  if (Result = '') then
    Result := 'Zero ';
end;

initialization
  fsRTTIModules.Add(TTSFastReportFunction);

end.
