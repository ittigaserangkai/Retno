unit ufrmDialogShift;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ExtCtrls,
  ComCtrls, StdCtrls, System.Actions, Vcl.ActnList, ufraFooterDialog3Button;

type
  TFormMode = (fmAdd, fmEdit);
  TfrmDialogShift = class(TfrmMasterDialog)
    edtNameShift: TLabeledEdit;
    dtpStart: TDateTimePicker;
    dtpEnd: TDateTimePicker;
    Label1: TLabel;
    lbl1: TLabel;
  private
  public
  end;

var
  frmDialogShift: TfrmDialogShift;

implementation

uses ufrmShift, uTSCommonDlg, uRetnoUnit, uDMClient;

{$R *.dfm}


end.




