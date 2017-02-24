unit ufraFooterDialog2Button;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, StdCtrls, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, cxButtons;

type
  TfraFooterDialog2Button = class(TFrame)
    pnlFooter: TPanel;
    btnClose: TcxButton;
    btnSave: TcxButton;
    pnlSortCut: TPanel;
    lbl4: TLabel;
    lbl5: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveEnter(Sender: TObject);
    procedure btnSaveExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfraFooterDialog2Button.btnCloseClick(Sender: TObject);
begin
  if (Owner is TForm) then
    TForm(Owner).Close
  else if (Owner is TFrame) then
    TForm((Owner as TFrame).Owner).Close;
end;

procedure TfraFooterDialog2Button.btnSaveEnter(Sender: TObject);
begin
  (Sender as TcxButton).UIStyle := DeepBlue;
end;

procedure TfraFooterDialog2Button.btnSaveExit(Sender: TObject);
begin
  (Sender as TcxButton).UIStyle := BlueGlass;
end;

end.
