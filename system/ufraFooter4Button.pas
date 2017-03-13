unit ufraFooter4Button;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ExtCtrls, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, cxButtons;

type
  TfraFooter4Button = class(TFrame)
    pnlFooter: TPanel;
    pnlShortCut: TPanel;
    lbCTRLC: TLabel;
    lbCTRLE: TLabel;
    lbEscape: TLabel;
    btnAdd: TcxButton;
    btnUpdate: TcxButton;
    btnPrint: TcxButton;
    btnClose: TcxButton;
    bvlSeparator: TBevel;
    cxButton1: TcxButton;
    lbCTRLP: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses TypInfo;

{$R *.dfm}

end.

