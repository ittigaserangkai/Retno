unit ufraFooter4Button;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ExtCtrls, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, cxButtons;

type
  TfraFooter4Button = class(TFrame)
    pnlFooter: TPanel;
    btnClose: TcxButton;
    btnAdd: TcxButton;
    btnUpdate: TcxButton;
    btnPrint: TcxButton;
    bvlSeparator: TBevel;
    pnlSortCut: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses TypInfo;

{$R *.dfm}

end.

