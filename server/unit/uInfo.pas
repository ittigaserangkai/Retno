unit uInfo;

interface    

uses
  SysUtils, Windows;

function GetBuildInfo(var Version: string; AFileName: string = ''): boolean;

implementation

function GetBuildInfo(var Version: string; AFileName: string = ''): boolean;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
  V1, V2, V3, V4: word;
begin
  Result := True;
  if AFileName = '' then
    AFileName := ParamStr(0);
  VerInfoSize := GetFileVersionInfoSize(PChar(AFileName), Dummy);
  if VerInfoSize = 0 then
  begin
    Result := False;
    Exit;
  end;
  GetMem(VerInfo, VerInfoSize);
  try
    GetFileVersionInfo(PChar(AFileName), 0, VerInfoSize, VerInfo);
    VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);

    with VerValue^ do
    begin
      V1 := dwFileVersionMS shr 16;
      V2 := dwFileVersionMS and $FFFF;
      V3 := dwFileVersionLS shr 16;
      V4 := dwFileVersionLS and $FFFF;
    end;
    Version := IntToStr(V1) + '.' + IntToStr(V2) + '.' + IntToStr(V3) + '.' +
      IntToStr(V4);
  finally
    FreeMem(VerInfo, VerInfoSize);
  end;
end;

end.
