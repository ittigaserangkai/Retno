unit uAppUtils;

interface
uses
  System.Classes, System.SysUtils, Graphics, Registry, StrUtils,
  ComCtrls,Math,DB, ExtCtrls, Variants, Forms, Dialogs, Controls,
  Windows,  SqlExpr, System.UITypes;

type
  TAppUtils = class(TObject)
  private
  protected
  public
    class function BacaRegistry(aNama: String; aPath : String = ''): string;
    class function BacaRegistry1(aNama: String; aPath : String = ''): string;
    class procedure BeginBusy;
    class function BoolToInt(aBool: Boolean): Integer;
    class function BytesToStr(const Bytes: TBytes): string;
    class procedure cCloseWaitWindow;
    class procedure CheckDataNumeric(AKey : Char);
    class function Confirm(const Text: string): Boolean;

    class function ConfirmBerhasilSimpanCetakReport(ANamaLaporan : String): Boolean;
    class function ConfirmHapus: Boolean;
    class function ConfirmSimpan: Boolean;
    class function ConverToFilter(ADate : TDateTime; AFormat : String =
        'dd MMM YYYY'): String;
    class procedure cShowWaitWindow(aCaption : String = 'Mohon Ditunggu ...';
        aPicture : TPicture = nil);
    class function DateToTiseraDate(aTanggal: TDateTime; aSeparator: string = ' '):
        string;
    class function DecPeriode(APeriode : Integer): Integer;
    class function DeleteFileTrace(aFileName: string): Boolean;
    class procedure EndBusy;
    class procedure Error(const Text: string);
    class procedure ErrorHapus(AErrorMessage : String = '');
    class procedure ErrorSimpan(AErrorMessage : String = '');
    class function FileToString(AFileName : String; Var ASize : Double): string;
    class procedure FinalisasiProgressBar(ANomorPB : Integer = 0);
    class function GetAppPath: string;
    class function GetAppVersion: string;
    class function GetEnvirontmentVariable(Const AVarName : String): string;
    class function HitungKarakterLooping(AStringHitung : Char; AStringSource :
        String): Integer;
    class function HitungKarakterReplace(AStringHitung : Char; AStringSource :
        String): Integer;
    class procedure IncStepProgressBar(AStep : Integer; ANomorPB : Integer = 0);
    class procedure Information(const Text: string; UsingNativeDlg: Boolean =
        False);
    class procedure InformationBerhasilHapus;
    class procedure InformationBerhasilSimpan; overload;
    class procedure InformationBerhasilSimpan(aNoBukti: string); overload;
    class procedure InisialisasiProgressBar(AParent : TWinControl; AMax : Integer;
        ANomorPB : Integer = 0);
    class function IsDeveloperMode: Boolean;


    class function LoadFromStreamToString(Stream: TStream; var myString: String;
        Encoding: TEncoding = nil): Double;
    class function NumberToLetter(aNumber: Integer): string;
    class function ParseSpace(aColName: string): string;
    class function ParseStrToArr(aStr: string; aSep: Char): TStrings;

    class function Quot(aString : String): String;
    class function QuotD(aDate : TDateTime; aTambahJam235959 : Boolean = false):
        String;
    class function QuotDLong(aDate : TDateTime): String;
    class function QuotDt(aDate : TDateTime): String; overload;
    class function QuotDT(aDate : TDateTime; aTambahJam235959 : Boolean): String;
        overload;
    class function QuotF(ANumber : Double): String;

    class procedure SetRegionalSetting_ID;
    class function TulisRegistry(aName, aValue: String; sAppName : String = ''):
        Boolean;
    class procedure Warning(const Text: string);
    //fungsi padding string
    class function StrPadLeft(const S: string; Len: Integer; C: Char): string;
    class function StrPadRight(const S: string; Len: Integer; C: Char): string;
    class function StrPadLeftCut(const S: String; Len: Integer; C: Char): String;
    class function StrRemoveChar(const S: String; const Source: Char): String;
    //fungsi enkripsi
    class function _Encrypt(const InString: string; START_KEY, MULTI_KEY, ADD_KEY: Integer): string;
    class function _Decrypt(const InString: string; START_KEY, MULTI_KEY, ADD_KEY: Integer): string;
    class function _MakeReadable(Input: string): string;
    class function _MakeOriginal(Input: string): string;

  end;

function GetAppVersionStr: string;
function GetAppVersionStrWMem: string;

function GetBuildInfo(var Version: string; AFileName: string = ''): boolean;

procedure SetIDCurrencyRegionalSetting;

procedure SetENCurrencyRegionalSetting;

var
  FWaitForm : TForm;
  BusySaveCursor: TCursor;
  BusyCount: Integer;
  PB  : TProgressBar;
  PB1 : TProgressBar;

const
  START_KEY = 981; {Start default key}
  MULTI_KEY = 12674; {Mult default key}
  ADD_KEY = 35891;	{Add default key}

  _ColorBarisGrid                 : TColor = $00E1E1E1;
  _MSG_BERHASIL_SIMPAN            : String = 'Berhasil Menyimpan Data';
  _MSG_BERHASIL_SIMPAN_NOBUKTI    : String = 'Berhasil Menyimpan Data' + #13
                                    + 'Dengan No Bukti';

  _MSG_GAGAL_SIMPAN               : String = 'Gagal Menyimpan Data';

  _MSG_BERHASIL_HAPUS             : String = 'Berhasil Menghapus Data';
  _MSG_GAGAL_HAPUS                : String = 'Gagal Menghapus Data';

  _MSG_MAU_SIMPAN                 : String = 'Anda Yakin Akan Menyimpan Data ?';
  _MSG_MAU_HAPUS                  : String = 'Anda Yakin Akan Menghapus Data ?';

  _MSG_ITEM_PUNYA_ANAK            : String = 'Item Ini Mempunyai Sub Item, Tidak Bisa Dhapus';


  _PERTANYAAN_MAU_DESIGN          : String = 'Anda Mempunyai Hak Untuk Design Report' + #13
                                    + 'Anda Akan Melakukan Design Report';

  sSpace: string = ' ';

implementation

uses
  uTSCommonDlg;

function GetAppVersionStrWMem: string;
var
  verblock:PVSFIXEDFILEINFO;
  versionMS,versionLS:cardinal;
  verlen:cardinal;
  rs:TResourceStream;
  m:TMemoryStream;
  p:pointer;
  s:cardinal;
begin
  m:=TMemoryStream.Create;
  try
    rs:=TResourceStream.CreateFromID(HInstance,1,RT_VERSION);
    try
      m.CopyFrom(rs,rs.Size);
    finally
      rs.Free;
    end;
    m.Position:=0;
    if VerQueryValue(m.Memory,'\',pointer(verblock),verlen) then
      begin
        VersionMS:=verblock.dwFileVersionMS;
        VersionLS:=verblock.dwFileVersionLS;
        GetAppVersionStrWMem:=Application.Title+' '+
          IntToStr(versionMS shr 16)+'.'+
          IntToStr(versionMS and $FFFF)+'.'+
          IntToStr(VersionLS shr 16)+'.'+
          IntToStr(VersionLS and $FFFF);
      end;
    if VerQueryValue(m.Memory,PChar('\\StringFileInfo\\'+
      IntToHex(GetThreadLocale,4)+IntToHex(GetACP,4)+'\\FileDescription'),p,s) or
        VerQueryValue(m.Memory,'\\StringFileInfo\\040904E4\\FileDescription',p,s) then //en-us
          GetAppVersionStrWMem:=PChar(p)+' '+GetAppVersionStrWMem;
  finally
    m.Free;
  end;
end;

function GetAppVersionStr: string;
var
  Exe: string;
  Size, Handle: DWORD;
  Buffer: TBytes;
  FixedPtr: PVSFixedFileInfo;
begin
  Exe := ParamStr(0);
  Size := GetFileVersionInfoSize(PChar(Exe), Handle);
  if Size = 0 then
    RaiseLastOSError;
  SetLength(Buffer, Size);
  if not GetFileVersionInfo(PChar(Exe), Handle, Size, Buffer) then
    RaiseLastOSError;
  if not VerQueryValue(Buffer, '\', Pointer(FixedPtr), Size) then
    RaiseLastOSError;
  Result := Format('%d.%d.%d.%d',
    [LongRec(FixedPtr.dwFileVersionMS).Hi,  //major
     LongRec(FixedPtr.dwFileVersionMS).Lo,  //minor
     LongRec(FixedPtr.dwFileVersionLS).Hi,  //release
     LongRec(FixedPtr.dwFileVersionLS).Lo]) //build
end;

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

procedure SetIDCurrencyRegionalSetting;
begin
  with FormatSettings do
  begin
  //  DecimalSeparator := ',';
  //  ThousandSeparator := '.';
    CurrencyString := 'Rp.';
    CurrencyFormat := 2;
    CurrencyDecimals := 2;
  end;
end;

procedure SetENCurrencyRegionalSetting;
begin
  with FormatSettings do
  begin
  //  DecimalSeparator := '.';
  //  ThousandSeparator := ',';
    CurrencyString := '$';
    CurrencyFormat := 2;
    CurrencyDecimals := 2;
  end;
end;

class function TAppUtils.BacaRegistry(aNama: String; aPath : String = ''):
    string;
var
  Registry: TRegistry;
  //S: string;
begin
  Registry:=TRegistry.Create;

  Registry.RootKey := HKEY_CURRENT_USER;
  {False because we do not want to create it if it doesn’t exist}
  if Trim(aPath) = '' then
    Registry.OpenKey('\Software\' + Application.Title, False)
  else
    Registry.OpenKey('\Software\' + aPath, False);

  Result := Registry.ReadString(aNama);

  Registry.Free;
end;

class function TAppUtils.BacaRegistry1(aNama: String; aPath : String = ''):
    string;
var
  Registry: TRegistry;
  //S: string;
begin
  Registry:=TRegistry.Create;

  Registry.RootKey := HKEY_CURRENT_USER;
  {False because we do not want to create it if it doesn’t exist}
  if Trim(aPath) = '' then
    Registry.OpenKey('\Software\' + Application.Title, False)
  else
    Registry.OpenKey('\Software\' + aPath, False);

  Result := Registry.ReadString(aNama);

  Registry.Free;
end;

class procedure TAppUtils.BeginBusy;
begin
  if BusyCount = 0 then
  begin
    BusySaveCursor := Screen.Cursor;
    Screen.Cursor := crHourglass;
  end;
  Inc(BusyCount);
end;

class function TAppUtils.BoolToInt(aBool: Boolean): Integer;
begin
  if aBool then Result := 1 else Result := 0;
end;

class function TAppUtils.BytesToStr(const Bytes: TBytes): string;
var
  I: Integer;
begin
  Result := '';
  for I := Low(Bytes) to High(Bytes) do
    Result := Result + LowerCase(IntToHex(Bytes[I], 2));
end;

class procedure TAppUtils.cCloseWaitWindow;
begin
  FreeAndNil(FWaitForm);
  Screen.Cursor := crDefault;
end;

//class function TAppUtils.cGetIDfromCombo(AComboBox :TComboBox; itemIndex :
//    integer = -1): string;
//begin
//  Result := '';
//
//  if AComboBox.Items.Count = 0 then
//  begin
//    Exit;
//  end;
//
//  if itemIndex = -1 then
//    itemIndex := AComboBox.ItemIndex;
//
//  if itemIndex = -1 then
//    Exit;
//
//  Result := TComboObject(AComboBox.Items.Objects[itemIndex]).cmbID;
//end;
//
//class function TAppUtils.cGetIDfromCombo(AComboBox :TcxComboBox; itemIndex :
//    integer = -1): string;
//begin
//  if AComboBox.Properties.Items.Count = 0 then
//  begin
//    Result := '';
//    Exit;
//  end;
//
//  if itemIndex = -1 then itemIndex := AComboBox.ItemIndex;
//  Result := TComboObject(AComboBox.Properties.Items.Objects[itemIndex]).cmbID;
//end;

class procedure TAppUtils.CheckDataNumeric(AKey : Char);
begin
  if not (CharInSet(AKey,['0'..'9',#8,#9]))  then
  begin
    TAppUtils.Warning('Data Yang Anda Masukkan Salah, Data Harus Numeric');
    Abort;
  end;
end;

class function TAppUtils.Confirm(const Text: string): Boolean;
begin
  Result := MessageDlg(Text, mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;

class function TAppUtils.ConfirmBerhasilSimpanCetakReport(ANamaLaporan :
    String): Boolean;
begin
  Result := TAppUtils.Confirm(_MSG_BERHASIL_SIMPAN + #13
                              + 'Apakah Anda Akan Cetak Laporan/Slip ' + ANamaLaporan);
end;

class function TAppUtils.ConfirmHapus: Boolean;
begin
  Result := TAppUtils.Confirm(_MSG_MAU_HAPUS);
end;

class function TAppUtils.ConfirmSimpan: Boolean;
begin
  Result := TAppUtils.Confirm(_MSG_MAU_SIMPAN);
end;

class function TAppUtils.ConverToFilter(ADate : TDateTime; AFormat : String =
    'dd MMM YYYY'): String;
begin
  Result := FormatDateTime(AFormat, ADate);
end;

class procedure TAppUtils.cShowWaitWindow(aCaption : String =
    'Mohon Ditunggu ...'; aPicture : TPicture = nil);
begin
    if FWaitForm = nil then
    begin
        FWaitForm             := TForm.Create(application);
        FWaitForm.BorderStyle := bsNone;
        FWaitForm.Width       := Screen.Width div 3;
        FWaitForm.Height      := (Screen.Height div 10) + 10;
        FWaitForm.Position    := poScreenCenter;
        FWaitForm.FormStyle   := fsStayOnTop;

        if aPicture <> nil then
        begin
          with TImage.Create(FWaitForm) do
          begin
            Parent  := FWaitForm;
            Align   := alTop;
            Picture := aPicture;
            Height  := 10;
            Stretch := True;
          end;
        end;

        with TPanel.Create(FWaitForm) do
        begin
            Parent      := FWaitForm;
            Align       := alClient;
            Font.Name   := 'Verdana';
            Font.Size   := 10;
            Font.Style  := [fsBold];
            Font.Color  := clBlue;
            Caption     := aCaption;
            BevelInner  := bvLowered;
            Color       := clMoneyGreen;
        end;

        with TTimer.Create(FWaitForm) do
        begin
          Interval := 1000;
          Enabled := False;
        end;
    end else
    begin
      (FWaitForm.Components[0] as TPanel).Caption := aCaption;
    end;
    FWaitForm.Show;
    screen.Cursor := crDefault;
end;

class function TAppUtils.DateToTiseraDate(aTanggal: TDateTime; aSeparator:
    string = ' '): string;
var
  iYear, iMonth, iDay : Word;
begin
  DecodeDate(aTanggal, iYear, iMonth, iDay);
  Result := RightStr(IntToStr(iYear), 1) + aSeparator
         +  NumberToLetter(iMonth) + aSeparator
         +  IntToStr(iDay);
end;

class function TAppUtils.DecPeriode(APeriode : Integer): Integer;
begin
  case APeriode of
    201101 : Result := 201012;
    201201 : Result := 201112;
    201301 : Result := 201212;
    201401 : Result := 201312;
    201501 : Result := 201412;
    201601 : Result := 201512;
    201701 : Result := 201612;
    201801 : Result := 201712;
    201901 : Result := 201812;
    202001 : Result := 201912;
    202101 : Result := 202012;
    202201 : Result := 202112;
    202301 : Result := 202212;
    202401 : Result := 202312;
  else
    Result := APeriode + 1;
  end;
end;

class function TAppUtils.DeleteFileTrace(aFileName: string): Boolean;
begin
  // TODO -cMM: TAppUtils.DeleteFileTrace default body inserted
   Result := True;
   try
     if FileExists(aFileName) then
       Result := DeleteFile(PWideChar(aFileName));
   finally
   end;
   try
//     if FileExists(ChangeFileExt(aFileName, EFILE_EXTDATA)) then
//       Result := Result and DeleteFile(ChangeFileExt(aFileName, EFILE_EXTDATA));
   finally
   end;
   try
//     if FileExists(ChangeFileExt(aFileName, EFILE_EXTZIP)) then
//       Result := Result and DeleteFile(ChangeFileExt(aFileName, EFILE_EXTZIP));
   finally
   end;
end;

class procedure TAppUtils.EndBusy;
begin
  if BusyCount > 0 then
  begin
    Dec(BusyCount);
    if BusyCount = 0 then
      Screen.Cursor := BusySaveCursor;
  end;
end;

class procedure TAppUtils.Error(const Text: string);
begin
  MessageDlg(Text, mtError, [mbYes], 0);
end;

class procedure TAppUtils.ErrorHapus(AErrorMessage : String = '');
begin
  if Trim(AErrorMessage) = '' then
    MessageDlg(_MSG_GAGAL_HAPUS, mtError, [mbYes], 0)
  else
    MessageDlg(_MSG_GAGAL_HAPUS + #13 + 'Dengan Error : ' + AErrorMessage , mtError, [mbYes], 0);
end;

class procedure TAppUtils.ErrorSimpan(AErrorMessage : String = '');
begin
  if Trim(AErrorMessage) = '' then
    MessageDlg(_MSG_GAGAL_SIMPAN, mtError, [mbYes], 0)
  else
    MessageDlg(_MSG_GAGAL_SIMPAN + #13 + 'Dengan Error : ' + AErrorMessage , mtError, [mbYes], 0)

end;

class function TAppUtils.FileToString(AFileName : String; Var ASize : Double):
    string;
var
  fs: TfileStream;
begin
  fs := TFileStream.Create(AFileName, fmOpenRead);
  try
    ASize := LoadFromStreamToString(fs, Result);
  finally
    fs.Free;
  end;
end;

class procedure TAppUtils.FinalisasiProgressBar(ANomorPB : Integer = 0);
begin
  if AnomorPB = 0 then
  begin
    if PB <> nil then
    begin
      PB.Parent.Free;
      PB := nil;
    end;
  end else begin
    if PB1 <> nil then
    begin
      PB1.Parent.Free;
      PB1 := nil;
    end;
  end;
end;

class function TAppUtils.GetAppPath: string;
begin
  Result := ExtractFilePath(application.ExeName);//ParamStr(0));
end;

class function TAppUtils.GetAppVersion: string;
var
  Size, Size2: DWord;
  Pt, Pt2: Pointer;
begin
 Size := GetFileVersionInfoSize(PChar (ParamStr(0)), Size2);
 if Size > 0 then
 begin
   GetMem (Pt, Size);
   try
      GetFileVersionInfo (PChar (ParamStr (0)), 0, Size, Pt);
      VerQueryValue (Pt, '\', Pt2, Size2);
      with TVSFixedFileInfo (Pt2^) do
      begin
        Result:= ' Ver '+
                 IntToStr (HiWord (dwFileVersionMS)) + '.' +
                 IntToStr (LoWord (dwFileVersionMS)) + '.' +
                 IntToStr (HiWord (dwFileVersionLS)) + '.' +
                 IntToStr (LoWord (dwFileVersionLS));
     end;
   finally
     FreeMem (Pt);
   end;
 end;
end;

class function TAppUtils.GetEnvirontmentVariable(Const AVarName : String):
    string;
var
   c: array[0..1023] of Char;
begin
   if ExpandEnvironmentStrings(PChar(AVarName), c, 1024) = 0 then
     Result := AVarName
   else
     Result := Trim(c);
end;

class function TAppUtils.HitungKarakterLooping(AStringHitung : Char;
    AStringSource : String): Integer;
var
  i: Integer;
begin
   Result := 0;

   for i := 1 to Length(AStringSource) do
    if AStringSource[i] = AStringHitung then
      Result := Result + 1;
end;

class function TAppUtils.HitungKarakterReplace(AStringHitung : Char;
    AStringSource : String): Integer;
begin
  Result := Length(AStringSource) - Length(StringReplace(AStringSource, AStringHitung, '', [rfReplaceAll, rfIgnoreCase])) + 1;
end;

class procedure TAppUtils.IncStepProgressBar(AStep : Integer; ANomorPB :
    Integer = 0);
var
  lPB: TProgressBar;
begin
  lPB := PB;
  if AnomorPB <> 0 then
    lPB := PB1;

  if lPB <> nil then
  begin
    lPB.StepBy(AStep);
  end;

  TPanel(lPB.Parent).Caption := 'Data ' +  IntToStr(lPB.Position) + ' / ' + IntToStr(lPB.Max);


end;

class procedure TAppUtils.Information(const Text: string; UsingNativeDlg:
    Boolean = False);
begin
  If UsingNativeDlg then
    MessageDlg(Text, mtInformation, [mbYes], 0)
  else
    CommonDlg.ShowInformationAlert('Informasi',Text,mtInformation);
end;

class procedure TAppUtils.InformationBerhasilHapus;
begin
  //MessageDlg(_MSG_BERHASIL_HAPUS, mtInformation, [mbYes], 0);;
end;

class procedure TAppUtils.InformationBerhasilSimpan;
begin
  //MessageDlg(_MSG_BERHASIL_SIMPAN, mtInformation, [mbYes], 0);;
end;

class procedure TAppUtils.InformationBerhasilSimpan(aNoBukti: string);
begin
  MessageDlg(_MSG_BERHASIL_SIMPAN_NOBUKTI + ' ->  '+ aNoBukti + '  <- ',
              mtInformation, [mbYes], 0);;
end;

class procedure TAppUtils.InisialisasiProgressBar(AParent : TWinControl; AMax :
    Integer; ANomorPB : Integer = 0);
var
  lPanel: TPanel;
  lPB: TProgressBar;
begin
  if AnomorPB = 0 then
  begin
    if PB = nil then
    begin
      lPanel                   := TPanel.Create(AParent);
      lPanel.VerticalAlignment := taAlignBottom;
      lPanel.Parent            := AParent;
      lPanel.Align             := alBottom;
      lPanel.Height            := 30;
      lPanel.Visible           := True;
      PB                       := TProgressBar.Create(lPanel);
      PB.Parent                := lPanel;
    end;

    lPB := PB;
  end else begin
    if PB1 = nil then
    begin
      lPanel                   := TPanel.Create(AParent);
      lPanel.VerticalAlignment := taAlignBottom;
      lPanel.Parent            := AParent;
      lPanel.Align             := alBottom;
      lPanel.Height            := 30;
      lPanel.Visible           := True;
      PB1                      := TProgressBar.Create(lPanel);
      PB1.Parent               := lPanel;
    end;

    lPB := PB1;
  end;

//  lPB.Parent  := lPanel;
  lPB.Visible := True;
  lPB.Width   := Floor(AParent.Width / 2);
  lPB.Left    := Floor(lPB.Width/2);
  lPB.Top     := AParent.Top + 10;
  lPB.Step    := 0;
  lPB.Max     := AMax;
  lPB.Align   := alTop;

//  lPB.BringToFront;
end;

class function TAppUtils.IsDeveloperMode: Boolean;
begin
  {$WARN SYMBOL_PLATFORM OFF}
  Result := DebugHook <> 0;
  {$WARN SYMBOL_PLATFORM OFF}
end;

class function TAppUtils.LoadFromStreamToString(Stream: TStream; var myString:
    String; Encoding: TEncoding = nil): Double;
var
  Size: Integer;
  Buffer: TBytes;
begin
  Result := Stream.Size / 1024;
  try
    Stream.Position := 0;
    Size := Stream.Size;

    SetLength(Buffer, Size);

    Stream.ReadBuffer(Pointer(Buffer)^, Size);

    Size := TEncoding.GetBufferEncoding(Buffer, Encoding);
    myString := Encoding.GetString(Buffer, Size, Length(Buffer) - Size);
  except
    on E : Exception do
    begin
      TAppUtils.Error('Ada Kesalahan ' + E.Message);
    end;
  end;
end;

class function TAppUtils.NumberToLetter(aNumber: Integer): string;
var
  iStartAlpha, isumAlpha, iAlphabet : Integer;
begin
  iStartAlpha := 64;
  isumAlpha   := 26;
  Result := '';
  iAlphabet := aNumber mod isumAlpha;
  Result := Chr(iAlphabet+iStartAlpha);
end;

class function TAppUtils.ParseSpace(aColName: string): string;
var
  iPos: Integer;
  s: string;
begin
  aColName:= Trim(aColName);

  iPos:= PosEx(sSpace, aColName) ;
  if iPos > 0 then
    s:= UpperCase(Trim(Copy(aColName, iPos + 1, Length(aColName) - iPos)))
  else
    s := UpperCase(Trim(aColName));

  Result:= s;
end;

class function TAppUtils.ParseStrToArr(aStr: string; aSep: Char): TStrings;
const
  sCres : Char = '#';
  sAs   : string = ' as ';
var
  i: Integer;
  iPos1: Integer;
  nDelimeter: Integer;
  s: string;
  sKol: string;
  iPos2: Integer;
  sKolAs: string;
  aFld: string;
//  sS: TStrings;
begin

    S:= aStr;
    nDelimeter:= 0;
    while Pos(aSep, s) > 0 do
    begin
      S[Pos(aSep, S)] := sCres;
      Inc(nDelimeter);
    end;

  Result:= TStringList.Create;
    for i:= 0 to nDelimeter do
    begin
      iPos1 := PosEx(sCres, s);

      if iPos1 > 0 then
      begin
        sKolAs  := Copy(s, 1, iPos1 - 1);

        s := Trim(Copy(s, iPos1 + 1, Length(s)- iPos1));

        iPos2 := PosEx(sAs, sKolAs);
        if iPos2 > 0 then
          sKol:= Trim(Copy(sKolAs, 1, iPos2 - 1))
        else
          sKol:= Trim(sKolAs);


        aFld:= ParseSpace(sKol);

      end
      else
      begin
        aFld:= Trim(UpperCase(s));

      end;
      Result.Append(aFld);

    end;


end;

class function TAppUtils.Quot(aString : String): String;
begin
    result := QuotedSTr(trim(Astring));
end;

class function TAppUtils.QuotD(aDate : TDateTime; aTambahJam235959 : Boolean =
    false): String;
begin
    if not aTambahJam235959 then
    begin
      Result := Quot(FormatDateTime('mm/dd/yyyy', aDate));
    end else
    begin
      Result := Quot(FormatDateTime('mm/dd/yyyy 23:59:59', aDate));
    end;
end;

class function TAppUtils.QuotDLong(aDate : TDateTime): String;
begin
    result := Quot(FormatDateTime('dd mmm yyyy', aDate));
end;

class function TAppUtils.QuotDt(aDate : TDateTime): String;
begin
    result := Quot(FormatDateTime('mm/dd/yyyy hh:mm:ss', aDate));
end;

class function TAppUtils.QuotDT(aDate : TDateTime; aTambahJam235959 : Boolean):
    String;
begin
    if not aTambahJam235959 then
    begin
      Result := Quot(FormatDateTime('mm/dd/yyyy hh:mm:ss', aDate));
    end else
    begin
      Result := Quot(FormatDateTime('mm/dd/yyyy 23:59:59', aDate));
    end;
end;

class function TAppUtils.QuotF(ANumber : Double): String;
begin
  Result := QuotedSTr(trim(FloatToStr(ANumber)));
end;

class procedure TAppUtils.SetRegionalSetting_ID;
begin
  {$IF CompilerVersion >= 22}
   with FormatSettings do
   begin
     CurrencyString := 'Rp.';
     CurrencyFormat := 2; {Contoh: 'Rp. 1'}
     NegCurrFormat := 14; {Contoh: '(Rp. 1)'}
     CurrencyDecimals := 2;
     TimeAMString := 'AM';
     TimePMString := 'PM';
     ThousandSeparator := '.';
     DecimalSeparator := ',';
     DateSeparator := '/';
     TimeSeparator := ':';
     LongTimeFormat := 'hh:mm:ss';
     ShortTimeFormat := 'hh:mm';
     ShortDateFormat := 'dd/mm/yyyy';
     LongDateFormat := 'dd mmmm yyyy';

     LongDayNames[1] := 'Senin';
     LongDayNames[2] := 'Selasa';
     LongDayNames[3] := 'Rabu';
     LongDayNames[4] := 'Kamis';
     LongDayNames[5] := 'Jumat';
     LongDayNames[6] := 'Sabtu';
     LongDayNames[7] := 'Minggu';

     ShortDayNames[1] := 'Sen';
     ShortDayNames[2] := 'Sel';
     ShortDayNames[3] := 'Rab';
     ShortDayNames[4] := 'Kam';
     ShortDayNames[5] := 'Jum';
     ShortDayNames[6] := 'Sab';
     ShortDayNames[7] := 'Ming';

     ShortMonthNames[1] := 'Jan';
     ShortMonthNames[2] := 'Feb';
     ShortMonthNames[3] := 'Mar';
     ShortMonthNames[4] := 'Apr';
     ShortMonthNames[5] := 'Mei';
     ShortMonthNames[6] := 'Jun';
     ShortMonthNames[7] := 'Jul';
     ShortMonthNames[8] := 'Agt';
     ShortMonthNames[9] := 'Sep';
     ShortMonthNames[10] := 'Okt';
     ShortMonthNames[11] := 'Nov';
     ShortMonthNames[12] := 'Des';

     LongMonthNames[1] := 'Januari';
     LongMonthNames[2] := 'Februari';
     LongMonthNames[3] := 'Maret';
     LongMonthNames[4] := 'April';
     LongMonthNames[5] := 'Mei';
     LongMonthNames[6] := 'Juni';
     LongMonthNames[7] := 'Juli';
     LongMonthNames[8] := 'Agustus';
     LongMonthNames[9] := 'September';
     LongMonthNames[10] := 'Oktober';
     LongMonthNames[11] := 'November';
     LongMonthNames[12] := 'Desember';
   end;
  {$ELSE}
    CurrencyString := 'Rp.';
     CurrencyFormat := 2; {Contoh: 'Rp. 1'}
     NegCurrFormat := 14; {Contoh: '(Rp. 1)'}
     CurrencyDecimals := 2;
     TimeAMString := 'AM';
     TimePMString := 'PM';
     ThousandSeparator := '.';
     DecimalSeparator := ',';
     DateSeparator := '/';
     TimeSeparator := ':';
     LongTimeFormat := 'hh:mm:ss';
     ShortTimeFormat := 'hh:mm';
     ShortDateFormat := 'dd/mm/yyyy';
     LongDateFormat := 'dd mmmm yyyy';

     LongDayNames[1] := 'Senin';
     LongDayNames[2] := 'Selasa';
     LongDayNames[3] := 'Rabu';
     LongDayNames[4] := 'Kamis';
     LongDayNames[5] := 'Jumat';
     LongDayNames[6] := 'Sabtu';
     LongDayNames[7] := 'Minggu';

     ShortDayNames[1] := 'Sen';
     ShortDayNames[2] := 'Sel';
     ShortDayNames[3] := 'Rab';
     ShortDayNames[4] := 'Kam';
     ShortDayNames[5] := 'Jum';
     ShortDayNames[6] := 'Sab';
     ShortDayNames[7] := 'Ming';

     ShortMonthNames[1] := 'Jan';
     ShortMonthNames[2] := 'Feb';
     ShortMonthNames[3] := 'Mar';
     ShortMonthNames[4] := 'Apr';
     ShortMonthNames[5] := 'Mei';
     ShortMonthNames[6] := 'Jun';
     ShortMonthNames[7] := 'Jul';
     ShortMonthNames[8] := 'Agt';
     ShortMonthNames[9] := 'Sep';
     ShortMonthNames[10] := 'Okt';
     ShortMonthNames[11] := 'Nov';
     ShortMonthNames[12] := 'Des';

     LongMonthNames[1] := 'Januari';
     LongMonthNames[2] := 'Februari';
     LongMonthNames[3] := 'Maret';
     LongMonthNames[4] := 'April';
     LongMonthNames[5] := 'Mei';
     LongMonthNames[6] := 'Juni';
     LongMonthNames[7] := 'Juli';
     LongMonthNames[8] := 'Agustus';
     LongMonthNames[9] := 'September';
     LongMonthNames[10] := 'Oktober';
     LongMonthNames[11] := 'November';
     LongMonthNames[12] := 'Desember';

  {$IFEND}
end;

class function TAppUtils.TulisRegistry(aName, aValue: String; sAppName : String
    = ''): Boolean;
var
   Reg : TRegistry;
begin
    result := true;
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if sAppName = '' then
      begin
        if Reg.OpenKey('\Software\' + Application.Title, True) then
        begin
             Reg.WriteString(aName, aValue);
             Reg.CloseKey;
        end
      end else begin
        if Reg.OpenKey('\Software\' + sAppName, True) then
        begin
             Reg.WriteString(aName, aValue);
             Reg.CloseKey;
        end;
      end;
    Except
      result := false;
      Reg.Free;
      exit;
    end;
   Reg.Free;
end;

class procedure TAppUtils.Warning(const Text: string);
begin
  MessageDlg(Text, mtWarning, [mbYes], 0);
end;


class function TAppUtils.StrPadLeft(const S: string; Len: Integer; C: Char): string;
var
  L: Integer;
begin
  L := Length(S);
  if L < Len then
    Result := StringOfChar(C, Len - L) + S
  else
    Result := S;
end;

class function TAppUtils.StrPadRight(const S: string; Len: Integer; C: Char): string;
var
  L: Integer;
begin
  L := Length(S);
  if L < Len then
    Result := S + StringOfChar(C, Len - L)
  else
    Result := S;
end;

class function TAppUtils.StrPadLeftCut(const S: String; Len: Integer; C: Char): String;
var
  L, i: Integer;
  tmp : string;
begin
  L := Length(S);
  if L < Len then
  begin
    tmp:= S;
    for i:= 1 to (Len-L) do
    begin
      tmp:= C + tmp;
    end;
    Result:= tmp;
  end
  else

  if (L = Len) then
  begin
    Result := S;
  end
  else
  begin
    tmp:= '';
    for i:=1 to Len do
      tmp := tmp + S[i];
    Result := tmp;
  end;
end;

class function TAppUtils.StrRemoveChar(const S: String; const Source: Char): String;
var
  I: Integer;
begin
  Result := '';

  for I := 1 to Length(S) do
    if S[I] <> Source then
      Result := Result + S[I];
end;

{
  @author     : Anatoly Podgoretsky
               Base alghoritm from Borland
  @modified by: Martin Djernæs, Yogatama
}
class function TAppUtils._Encrypt(const InString: string; START_KEY, MULTI_KEY, ADD_KEY: Integer): string;
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
class function TAppUtils._Decrypt(const InString: string; START_KEY, MULTI_KEY, ADD_KEY: Integer): string;
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

class function TAppUtils._MakeReadable(Input: string): string;
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

class function TAppUtils._MakeOriginal(Input: string): string;
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
