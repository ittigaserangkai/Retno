unit ufraFooter5Button;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ExtCtrls, SUIButton;

type
  TfraFooter5Button = class(TFrame)
    pnlFooter: TPanel;
    btnClose: TsuiButton;
    btnAdd: TsuiButton;
    btnUpdate: TsuiButton;
    btnDelete: TsuiButton;
    btnRefresh: TsuiButton;
    bvlSeparator: TBevel;
    pnlSortCut: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    Label1: TLabel;
    btnPrint: TsuiButton;
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfraFooter5Button.btnCloseClick(Sender: TObject);
begin
  if (Owner is TForm) then
    TForm(Owner).Close
  else if (Owner is TFrame) then
    TForm((Owner as TFrame).Owner).Close;
end;

end.
