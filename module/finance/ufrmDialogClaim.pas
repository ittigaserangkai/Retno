unit ufrmDialogClaim;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, Vcl.StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar,
  cxCurrencyEdit, cxMemo;

type
  TfrmDialogClaim = class(TfrmMasterDialog)
    pnlHeader: TPanel;
    lblSupplier: TLabel;
    cbbSupplierMG: TcxExtLookupComboBox;
    lblTTF: TLabel;
    dtTglClaim: TcxDateEdit;
    edTTFNo: TcxTextEdit;
    lblTgkClaim: TLabel;
    lblDescription: TLabel;
    lblDO: TLabel;
    lblAdj: TLabel;
    lblCN: TLabel;
    lblDN: TLabel;
    lblOther: TLabel;
    lblTotal: TLabel;
    edNomGR: TcxCurrencyEdit;
    edNomAdj: TcxCurrencyEdit;
    edCN: TcxCurrencyEdit;
    edDN: TcxCurrencyEdit;
    edOther: TcxCurrencyEdit;
    edTotal: TcxCurrencyEdit;
    memDescription: TcxMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialogClaim: TfrmDialogClaim;

implementation

{$R *.dfm}

end.
