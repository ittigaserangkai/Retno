unit ufrmSettingKoneksi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxLabel,
  cxTextEdit, cxGroupBox, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox;

type
  TfrmMasterDialog1 = class(TfrmMasterDialog)
    cxGroupBox1: TcxGroupBox;
    cxTextEdit1: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxTextEdit2: TcxTextEdit;
    cxGroupBox2: TcxGroupBox;
    cxLabel3: TcxLabel;
    cxTextEdit3: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxTextEdit4: TcxTextEdit;
    btnPrint: TcxButton;
    cxLookupSupplierMerchan: TcxExtLookupComboBox;
    cxLabel5: TcxLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMasterDialog1: TfrmMasterDialog1;

implementation

{$R *.dfm}

end.
