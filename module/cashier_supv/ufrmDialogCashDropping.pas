unit ufrmDialogCashDropping;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ExtCtrls, StdCtrls,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxCurrencyEdit, cxMaskEdit, cxSpinEdit, cxTimeEdit;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogCashDropping = class(TfrmMasterDialog)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edtPOSCode: TEdit;
    edtCashierID: TEdit;
    edtCashDrop1: TcxCurrencyEdit;
    lbl4: TLabel;
    edtCashDrop: TcxCurrencyEdit;
    edtTime: TcxTimeEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
//    cDesSep : char;
//    cThSep  : char;
    FIsProcessSuccessfull: boolean;
    FFormMode: TFormMode;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    { Private declarations }
  public
    { Public declarations }
    balanceID,
    supervisorID  : Integer;
    ShiftID       : string;
    ShiftDate     : TDateTime;
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogCashDropping: TfrmDialogCashDropping;

implementation

uses  uTSCommonDlg;

{$R *.dfm}

procedure TfrmDialogCashDropping.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogCashDropping.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogCashDropping := nil;
end;

procedure TfrmDialogCashDropping.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogCashDropping.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogCashDropping.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;
  {
  with TNewCashDropping.CreateWithUser(Self,FLoginId,dialogunit) do
  begin
    try
      UpdateData(balanceID,
        cGetServerTime,
        0,dialogunit,
        edtCashDrop.Value,
        supervisorID,
        edtPOSCode.Text,
        ShiftID,
        ShiftDate);
      IsProcessSuccessfull := SaveToDB;
      if IsProcessSuccessfull then
      begin
        cCommitTrans;
        CommonDlg.ShowMessage('Sukses Update Data!!');
      end
      else
      begin
        cRollbackTrans;
        CommonDlg.ShowMessage('Gagal Update Data!! Cek Total droping');
      end;
    finally
      Free;
    end;
  end;
  Close;
  }
end;

procedure TfrmDialogCashDropping.FormShow(Sender: TObject);
begin
  inherited;
  edtCashDrop.Value := 0;
end;

end.




