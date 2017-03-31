unit ufraFooter1Button;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, SUIButton, ExtCtrls, StdCtrls;

type
  TfraFooter1Button = class(TFrame)
    pnlFooter: TPanel;
    btnClose: TsuiButton;
    pnlSortCut: TPanel;
    lbl5: TLabel;
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfraFooter1Button.btnCloseClick(Sender: TObject);
begin
  if (Owner is TForm) then
    TForm(Owner).Close
  else if (Owner is TFrame) then
    TForm((Owner as TFrame).Owner).Close;
end;

end.
