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
    lbl4: TLabel;
    lbl5: TLabel;
    btnDelete: TcxButton;
    lbl3: TLabel;
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfraFooterDialog3Button.btnCloseClick(Sender: TObject);
begin
  if (Owner is TForm) then
    TForm(Owner).Close
  else if (Owner is TFrame) then
    TForm((Owner as TFrame).Owner).Close;
end;

end.
