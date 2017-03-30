unit ufrmDialogFinalPayment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, StdCtrls, ExtCtrls, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxMaskEdit, cxSpinEdit,
  cxTimeEdit, cxTextEdit, cxCurrencyEdit;
  // tambahan
  // Ini juga tambahan

type
//  TFormMode = (fmAdd, fmEdit);

  TfrmDialogFinalPayment = class(TfrmMasterDialog)
    lbl4: TLabel;
    edtPOSCode: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    edtCashierID: TEdit;
    lbl3: TLabel;
    edtFinPay: TcxCurrencyEdit;
    edtClock: TcxTimeEdit;
    edtFinPay1: TcxCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtFinPay1Enter(Sender: TObject);
  private
    FIsProcessSuccessfull: boolean;
//    FFormMode: TFormMode;
    FNominalEdit: Double;
    FNominalSisa: Double;
//    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
  public
    { Public declarations }
    balanceID: Integer;
    balanceUnitID: Integer;
    posCode: String;
    cashierID: String;
    totalFinalPayment: Currency;
    property NominalEdit: Double read FNominalEdit write FNominalEdit;
    property NominalSisa: Double read FNominalSisa write FNominalSisa;
  published
//    property FormMode: TFormMode read FFormMode write SetFormMode;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogFinalPayment: TfrmDialogFinalPayment;

implementation

uses uConn, uRetnoUnit, uTSCommonDlg;

{$R *.dfm}

procedure TfrmDialogFinalPayment.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogFinalPayment.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogFinalPayment := nil;
end;

//procedure TfrmDialogFinalPayment.SetFormMode(const Value: TFormMode);
//begin
//  FFormMode := Value;
//end;

procedure TfrmDialogFinalPayment.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogFinalPayment.footerDialogMasterbtnSaveClick(
  Sender: TObject);   
begin
  inherited;
  IsProcessSuccessfull := False;

  // Dihilangkan untuk pengecekkan nominal inputan final payment dari kasir
  {
  if edtFinPay.Value >  (NominalEdit + NominalSisa) then
  begin
    CommonDlg.ShowError('Nilai final payment tidak boleh melebihi payment cash!');
    exit;
  end;
  }
  {
  with TNewFinalPayment.CreateWithUser(Self,FLoginId,FLoginUnitId) do
  begin
    try
      Self.Enabled := False;

      UpdateData(0,balanceID,
        edtFinPay.Value,
        dialogunit,
        edtFinPay.Value);

      if not BeginningBalance.POS.IsActive then
      begin
        CommonDlg.ShowError('POS ' + BeginningBalance.POS.Code + ' sudah tidak Active'
                           + #13 + 'Final Payment Tidak Bisa Dilaksanakan');
        Exit;
      end;

      IsProcessSuccessfull := SaveToDB;
      if IsProcessSuccessfull then
      begin
        cCommitTrans;
      end
      else
      begin
        cRollbackTrans;
        CommonDlg.ShowError('Gagal Update Data!! Cek Total droping');
      end;    
    finally
      Free;
      Self.Enabled := True;
    end;
  end;
  Close;
  Exit;
  }
end;

procedure TfrmDialogFinalPayment.FormShow(Sender: TObject);
begin
  inherited;
  edtFinPay.Value := 0;
  edtFinPay.SelectAll;

    edtPOSCode.Text   := posCode;
    edtCashierID.Text := cashierID;
    edtFinPay.Value   := totalFinalPayment;
end;

procedure TfrmDialogFinalPayment.edtFinPay1Enter(Sender: TObject);
begin
  inherited;
  edtFinPay.SelectAll;
end;

end.





