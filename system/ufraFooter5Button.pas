unit ufraFooter5Button;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ExtCtrls, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, cxButtons;

type
  TfraFooter5Button = class(TFrame)
    pnlFooter: TPanel;
    btnClose: TcxButton;
    btnAdd: TcxButton;
    btnUpdate: TcxButton;
    btnDelete: TcxButton;
    btnRefresh: TcxButton;
    bvlSeparator: TBevel;
    pnlSortCut: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses TypInfo;

{$R *.dfm}

procedure TfraFooter5Button.btnCloseClick(Sender: TObject);
//var
//  xObject: TObject;
begin
//  if (Owner is TForm) then
//  begin
//    xObject := (Owner as TForm);
//    xObject.Free;
//  end else if (Owner is TFrame) then
//  begin
//    TForm((Owner as TFrame).Owner).Close;
//  end;
end;

end.

