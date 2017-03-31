unit uGTEncDec;

interface

uses
  SysUtils;

const
  START_KEY = 981; {Start default key}
  MULTI_KEY = 12674; {Mult default key}
  ADD_KEY = 35891;	{Add default key}

function _Encrypt(const InString: string; START_KEY, MULTI_KEY, ADD_KEY: Integer): string;
function _Decrypt(const InString: string; START_KEY, MULTI_KEY, ADD_KEY: Integer): string;
function _MakeReadable(Input: string): string;
function _MakeOriginal(Input: string): string;

implementation

{
  @author     : Anatoly Podgoretsky
               Base alghoritm from Borland
  @modified by: Martin Djernæs, Yogatama
}
function _Encrypt(const InString: string; START_KEY, MULTI_KEY, ADD_KEY: Integer): string;
var
  i: Byte;
begin
  Result := '';
  for i := 1 to Length(InString) do
  begin
    Result := Result + Chr(Ord(InString[i]) xor (START_KEY shr 8));
    START_KEY := (Ord(Result[i]) + START_KEY) * MULTI_KEY + ADD_KEY;
  end;
end;

{
  @author     : Anatoly Podgoretsky
               Base alghoritm from Borland
  @modified by: Martin Djernæs, Yogatama
}
function _Decrypt(const InString: string; START_KEY, MULTI_KEY, ADD_KEY: Integer): string;
var
  i: Byte;
begin
  Result := '';
  for i := 1 to Length(InString) do
  begin
    Result := Result + Chr(Ord(InString[i]) xor (START_KEY shr 8));
    START_KEY := (Ord(InString[i]) + START_KEY) * MULTI_KEY + ADD_KEY;
  end;
end;

function _MakeReadable(Input: string): string;
const
  digit: array [0..15] of Char = ('0', '1', '2', '3', '4', '5', '6', '7',
                                  '8', '9', 'A', 'B', 'C', 'D', 'E', 'F');
var
  i: Byte;
begin
  Result := '';
  for i := 1 to Length(Input) do
    Result := Result + digit[Ord(Input[i]) shr 4] + digit[Ord(Input[i]) and $F];
end;

function _MakeOriginal(Input: string): string;
var
  i: Byte;
begin
  Result := '';
  i := 1;
  while (i < Length(Input)) do begin
    Result := Result + Chr(StrToInt('$' + Input[i] + Input[i + 1]));
    i := i + 2;
  end;
end;

end.
