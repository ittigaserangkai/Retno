unit ufrmDialogElectricRate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, Vcl.StdCtrls,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  cxMaskEdit, cxSpinEdit, cxTextEdit;

type
  TfrmDialogElectricRate = class(TfrmMasterDialog)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cxTextEdit1: TcxTextEdit;
    cxSpinEdit1: TcxSpinEdit;
    cxSpinEdit2: TcxSpinEdit;
    cxSpinEdit3: TcxSpinEdit;
    cxSpinEdit4: TcxSpinEdit;
    cxExtLookupComboBox1: TcxExtLookupComboBox;
    cxExtLookupComboBox2: TcxExtLookupComboBox;
    Label8: TLabel;
    Label9: TLabel;
    cxSpinEdit5: TcxSpinEdit;
    cxSpinEdit6: TcxSpinEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialogElectricRate: TfrmDialogElectricRate;

implementation

{$R *.dfm}

end.
