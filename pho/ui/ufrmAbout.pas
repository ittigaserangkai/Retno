unit ufrmAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, 
  StdCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxLabel, ufraFooterDialog3Button;

type
  TfrmAbout = class(TfrmMasterDialog)
    lbx2: TcxLabel;
    lbx1: TcxLabel;
    lbx5: TcxLabel;
    procedure FormShow(Sender: TObject);
  private
  public
  end;

var
  frmAbout: TfrmAbout;

implementation

uses uInfo;

{$R *.dfm}

procedure TfrmAbout.FormShow(Sender: TObject);
var
  s: string;
begin
  inherited;
  s := Application.ExeName;
  {if inf1.GetFileInfo(s) then
    lbl5.Caption := '(Build no. ' + inf1.FileVersion + ')';}

  case Win32Platform of
    VER_PLATFORM_WIN32_WINDOWS: lbx2.Caption := 'Windows 9x';
    VER_PLATFORM_WIN32_NT: lbx2.Caption := 'Windows NT Family';
  end;
  if Win32CSDVersion = '' then
    lbx1.Caption := 'ver. ' + IntToStr(Win32MajorVersion) + '.' +
      IntToStr(Win32MinorVersion) + ' build: ' +
      IntToStr(Win32BuildNumber)
  else
    lbx1.Caption := 'ver. ' + IntToStr(Win32MajorVersion) + '.' +
      IntToStr(Win32MinorVersion) + ' build: ' +
      IntToStr(Win32BuildNumber) + ' (' + Win32CSDVersion + ')';

  GetBuildInfo(s, Application.ExeName);
  lbx5.Caption := '(Build no. ' + s + ')';
end;

end.
