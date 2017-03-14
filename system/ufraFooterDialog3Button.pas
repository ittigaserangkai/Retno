unit ufraFooterDialog3Button;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, StdCtrls, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, cxButtons;

type
  TfraFooterDialog3Button = class(TFrame)
    pnlFooter: TPanel;
    btnClose: TcxButton;
    btnSave: TcxButton;
    pnlSortCut: TPanel;
    lbCTRLEnter: TLabel;
    lbEscape: TLabel;
    btnDelete: TcxButton;
    lbCTRLDel: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.

