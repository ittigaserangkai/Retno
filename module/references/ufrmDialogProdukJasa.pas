unit ufrmDialogProdukJasa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uInterface, ufrmMasterDialog,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, Vcl.StdCtrls;

type
  TfrmDialogProdukJasa = class(TfrmMasterDialog)  // tambahkan , ICRUDAble yak nanti
    Panel1: TPanel;
    lblCode: TLabel;
    lblName: TLabel;
    lblOwner: TLabel;
    edtCode: TEdit;
    edtName: TEdit;
    edtOwner: TEdit;
    Panel2: TPanel;
    lblDefaultPrice: TLabel;
    lblTipeBarang: TLabel;
    edtDefaultPrice: TEdit;
    chkBKP: TCheckBox;
    cxLookUpTipeBarang: TcxExtLookupComboBox;
    lblPajak: TLabel;
    cxLookUpPajak: TcxExtLookupComboBox;
    Panel3: TPanel;
    cxLookupRekCredit: TcxExtLookupComboBox;
    cxLookupRekDebet: TcxExtLookupComboBox;
    lblRekCredit: TLabel;
    lblRekDebet: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialogProdukJasa: TfrmDialogProdukJasa;

implementation

{$R *.dfm}

end.
