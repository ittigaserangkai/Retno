unit ufrmDialogHistoryBarang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, Vcl.StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxTextEdit, uDXUtils, uAppUtils;

type
  TfrmDialogHistoryBarang = class(TfrmMasterDialog)
    lblKode: TLabel;
    lblNama: TLabel;
    lblMerkNamaBarang: TLabel;
    lblKodeNamaSupplier: TLabel;
    lblKodeExternal: TLabel;
    edKode: TcxTextEdit;
    edNama: TcxTextEdit;
    edNamaBarang: TcxTextEdit;
    edKodeNamaSupplier: TcxTextEdit;
    edExternalCode: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialogHistoryBarang: TfrmDialogHistoryBarang;

implementation

{$R *.dfm}

procedure TfrmDialogHistoryBarang.FormCreate(Sender: TObject);
begin
  inherited;
  ClearByTag([0,1]);
end;

end.
