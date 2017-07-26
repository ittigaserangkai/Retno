unit ufrmMasterReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMaster, Vcl.StdCtrls, Vcl.ExtCtrls,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxButtons,
  System.Actions, Vcl.ActnList;

type
  TfrmMasterReport = class(TfrmMaster)
    pnlFooter: TPanel;
    pnlShortCut: TPanel;
    actReport: TActionList;
    actClose: TAction;
    actPrint: TAction;
    actRefresh: TAction;
    actExport: TAction;
    btnClose: TcxButton;
    btnPrint: TcxButton;
    cxButton1: TcxButton;
    btnSearch: TcxButton;
    lbCTRLP: TLabel;
    lbEscape: TLabel;
    Label1: TLabel;
    procedure actCloseExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMasterReport: TfrmMasterReport;

implementation

{$R *.dfm}

procedure TfrmMasterReport.actCloseExecute(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

end.
