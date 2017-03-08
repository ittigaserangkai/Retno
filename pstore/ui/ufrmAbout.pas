unit ufrmAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls,
  StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxLabel, ufraFooterDialog3Button;

type
  TfrmAbout = class(TfrmMasterDialog)
    bvl1: TBevel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbx1: TcxLabel;
    lbx2: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveEnter(Sender: TObject);
    procedure footerDialogMasterbtnSaveExit(Sender: TObject);
    procedure footerDialogMasterbtnCloseEnter(Sender: TObject);
    procedure footerDialogMasterbtnCloseExit(Sender: TObject);
  private
  public
  end;

var
  frmAbout: TfrmAbout;

implementation

uses uAppUtils;

{$R *.dfm}

procedure TfrmAbout.FormShow(Sender: TObject);
var
  s: string;
begin
  inherited;
  s := Application.ExeName;

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
  lbl5.Caption := '(Build no. ' + s + ')';
end;

procedure TfrmAbout.FormDestroy(Sender: TObject);
begin
  inherited;

  frmAbout:= nil;
end;

procedure TfrmAbout.footerDialogMasterbtnSaveEnter(Sender: TObject);
begin
  inherited;
  //(Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmAbout.footerDialogMasterbtnSaveExit(Sender: TObject);
begin
  inherited;
//  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmAbout.footerDialogMasterbtnCloseEnter(Sender: TObject);
begin
  inherited;
//  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmAbout.footerDialogMasterbtnCloseExit(Sender: TObject);
begin
  inherited;
//  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

end.
