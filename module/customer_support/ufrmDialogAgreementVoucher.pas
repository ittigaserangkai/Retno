unit ufrmDialogAgreementVoucher;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls,
  StdCtrls, uRetnoUnit, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCurrencyEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, System.Actions, Vcl.ActnList,
  ufraFooterDialog3Button;

type
  TFormMode = (fmAdd, fmEdit);
  TfrmDialogAgreementVoucher = class(TfrmMasterDialog)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edtNo: TEdit;
    dtDate: TcxDateEdit;
    dtDueDate: TcxDateEdit;
    jvcuredtTotal: TcxCurrencyEdit;
    curredtTotAfterDisc: TcxCurrencyEdit;
    lbl5: TLabel;
    lbl6: TLabel;
    curredtDisc: TcxCurrencyEdit;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtNoKeyPress(Sender: TObject; var Key: Char);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure curredtDiscExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FFormMode: TFormMode;
    FCustAgreementId: Integer;
    FIsProcessSuccessfull: boolean;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetCustAgreementId(const Value: Integer);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure showDataEdit(aId: Integer);
    procedure prepareAddData;
    function  SaveData: boolean;
    function  UpdateData: boolean;
  public
    { Public declarations }
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property CustAgreementId: Integer read FCustAgreementId write SetCustAgreementId;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogAgreementVoucher: TfrmDialogAgreementVoucher;

implementation

uses uTSCommonDlg, ufrmAgreementVoucher, DB;

{$R *.dfm}

procedure TfrmDialogAgreementVoucher.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogAgreementVoucher.SetCustAgreementId(const Value: Integer);
begin
  FCustAgreementId:=Value;
end;

procedure TfrmDialogAgreementVoucher.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogAgreementVoucher.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogAgreementVoucher.prepareAddData;
begin
//  edtNo.Text          := FDialogUnitCOde + '/AGV/' + FormatDateTime('YYYYMMDD/hhmmss',cGetServerTime);
//  dtDate.Date         := cGetServerTime;
//  jvcuredtTotal.Value := 0;
//  dtDueDate.Date      := cGetServerTime;
end;

procedure TfrmDialogAgreementVoucher.showDataEdit(aId: Integer);
begin
//  with TAgreementVoucher.Create(self) do
//  try
//    if not LoadByID(aId,DialogUnit) then
//    begin
//      CommonDlg.ShowError('Data tdk ditemukan...');
//      Exit;
//    end;
//    edtNo.Text:= NO;
//    dtDate.Date:= DATE;
//    jvcuredtTotal.Value:=TOTAL;
//    curredtDisc.Value :=DISC;
//    curredtTotAfterDisc.Value :=TOTAL_AFTER_DISC;
//    dtDueDate.Date:=DUE_DATE;
//  finally
//    Free;
//  end;

end;

procedure TfrmDialogAgreementVoucher.FormShow(Sender: TObject);
begin
  inherited;
  
  if (FFormMode = fmEdit) then
    showDataEdit(FCustAgreementId)
  else
    prepareAddData();
  edtNo.SetFocus;
//  curredtDisc.Alignment := taRightJustify;
end;

procedure TfrmDialogAgreementVoucher.edtNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
  if Key = Chr(VK_RETURN) then
  begin
    if(Sender.ClassType=TEdit)and((Sender as TEdit).Name='edtNo') then
      dtDate.SetFocus
    else
    if(Sender.ClassType=TcxDateEdit)and((Sender as TcxDateEdit).Name='dtDate')then
      jvcuredtTotal.SetFocus
    else
    if(Sender.ClassType=TcxCurrencyEdit)and((Sender as TcxCurrencyEdit).Name='edtTotal')then
      dtDueDate.SetFocus
    else
      footerDialogMaster.btnSave.SetFocus;
  end;
end;

function TfrmDialogAgreementVoucher.SaveData: boolean;
begin
//  with TAgreementVoucher.CreateWithUser(self,FLoginId) do
//  try
//    UpdateData(DialogUnit,frmAgreementVoucher.edtCode.Text,dtDate.Date,
//      curredtDisc.Value,dtDueDate.Date,0,DialogUnit,edtNo.Text,'OPEN',
//      jvcuredtTotal.Value,curredtTotAfterDisc.Value);
//    if SaveToDB then
//    begin
//      cCommitTrans;
//      CommonDlg.ShowConfirmGlobal('Simpan sukses...');
//      Result:=True;
//    end
//    else
//    begin
//      cRollbackTrans;
//      CommonDlg.ShowError('Error Simpan...');
//      Result:=False;
//    end;
//  finally
//    cRollbackTrans;
//    Free;
//  end;

end;

function TfrmDialogAgreementVoucher.UpdateData: boolean;
begin
//  with TAgreementVoucher.CreateWithUser(self,FLoginId) do
//  try
//    if not LoadByID(CustAgreementId,DialogUnit) then
//    begin
//      CommonDlg.ShowError('Data tdk ditemukan...');
//      Result:=False;
//      Exit;
//    end;
//    UpdateData(CUSTV.NewUnit.ID,CUSTV.CODE,dtDate.Date,
//      curredtDisc.Value,dtDueDate.Date,ID,DialogUnit,edtNo.Text,STATUS,
//      jvcuredtTotal.Value,curredtTotAfterDisc.Value);
//    if SaveToDB then
//    begin
//      cCommitTrans;
//      CommonDlg.ShowConfirmGlobal('Simpan sukses...');
//      Result:=True;
//    end
//    else
//    begin
//      cRollbackTrans;
//      CommonDlg.ShowError('Error Simpan...');
//      Result:=False;
//    end;
//  finally
//    Free;
//    cRollbackTrans;
//  end;

end;

procedure TfrmDialogAgreementVoucher.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;
  if edtNo.Text='' then
  begin
    CommonDlg.ShowErrorEmpty(lbl1.Caption);
    edtNo.SetFocus;
    Exit;
  end;

  if curredtTotAfterDisc.Value <= 0 then
  begin
    CommonDlg.ShowError('Total Setelah Diskon <= 0');
    jvcuredtTotal.SetFocus;
    Exit;
  end;


  if (FormMode = fmAdd) then
  begin
    FIsProcessSuccessfull := SaveData;
    if FIsProcessSuccessfull then
      Close;
  end
  else
  begin
    FIsProcessSuccessfull := UpdateData;
    if FIsProcessSuccessfull then
      Close;
  end; // end if
end;

procedure TfrmDialogAgreementVoucher.curredtDiscExit(Sender: TObject);
begin
  inherited;
  curredtTotAfterDisc.Value := jvcuredtTotal.Value - ((curredtDisc.Value * jvcuredtTotal.Value) / 100);
end;

procedure TfrmDialogAgreementVoucher.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
 if (Key = VK_RETURN) and (ActiveControl <> footerDialogMaster.btnClose) and (ActiveControl <> footerDialogMaster.btnSave) and not (ssCtrl in Shift)then
    SelectNext(ActiveControl,True,True);
end;

procedure TfrmDialogAgreementVoucher.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  // ini u/ close
end;

end.
