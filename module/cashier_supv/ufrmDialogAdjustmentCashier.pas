unit ufrmDialogAdjustmentCashier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ExtCtrls, StdCtrls, Mask,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxCurrencyEdit, cxTextEdit, cxMaskEdit, cxCalendar;

type             
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogAdjustmentCashier = class(TfrmMasterDialog)
    pnl1: TPanel;
    pnl2: TPanel;
    lbl1: TLabel;
    dtTgl: TcxDateEdit;
    lbl3: TLabel;
    edtPOSCode: TEdit;
    lbl2: TLabel;
    edtShift: TEdit;
    lbl4: TLabel;
    edtCashierId: TEdit;
    edtCashierName: TEdit;
    lbl5: TLabel;
    lbl6: TLabel;
    curredtCash: TcxCurrencyEdit;
    cbpCard: TcxExtLookupComboBox;
    lbl7: TLabel;
    lbl8: TLabel;
    curredtCredit: TcxCurrencyEdit;
    lbl9: TLabel;
    curredtDeposit: TcxCurrencyEdit;
    lbl10: TLabel;
    curredtVoucher: TcxCurrencyEdit;
    lbl11: TLabel;
    curredtVoucherLain: TcxCurrencyEdit;
    lbl12: TLabel;
    edtNote: TEdit;
    curredtDebit: TcxCurrencyEdit;
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure curredtCashKeyPress(Sender: TObject; var Key: Char);
    procedure cbpCardKeyPress(Sender: TObject; var Key: Char);
    procedure curredtCreditKeyPress(Sender: TObject; var Key: Char);
    procedure curredtDebitKeyPress(Sender: TObject; var Key: Char);
    procedure curredtDepositKeyPress(Sender: TObject; var Key: Char);
    procedure curredtVoucherKeyPress(Sender: TObject; var Key: Char);
    procedure curredtVoucherLainKeyPress(Sender: TObject; var Key: Char);
    procedure curredtDepositEnter(Sender: TObject);
    procedure curredtDepositExit(Sender: TObject);
    procedure cbpCardChange(Sender: TObject);
  private
    FIsProcessSuccessfull: boolean;
    FFormMode: TFormMode;
    FBeginningBalanceId: integer;
    FStrCash,
    FStrCredit,
    FStrDebit,
    FStrDeposit,
    FStrGoroCoupon,
    FStrOtherCoupon : string;  
    procedure ClrCcAtribut;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure ParseDataComboBox();
    procedure SetBeginningBalanceId(const Value: integer);
    function SaveAdjustmentCashier: boolean;

    procedure SaveValueCurrencyEdit(ACurrencyEdit: TcxCurrencyEdit);
    procedure LoadValueCurrencyEdit( ACurrencyEdit: TcxCurrencyEdit);
    procedure PrintSlip(aAdjID: integer; aUnitID: integer);
  public
    { Public declarations }
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
    property BeginningBalanceId: integer read FBeginningBalanceId write SetBeginningBalanceId;
  end;

var
  frmDialogAdjustmentCashier: TfrmDialogAdjustmentCashier;

implementation

uses ufrmAdjustmentCashier, uTSCommonDlg, uRetnoUnit, udmReport, Math, DB;

{$R *.dfm}


procedure TfrmDialogAdjustmentCashier.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogAdjustmentCashier := nil;
end;

procedure TfrmDialogAdjustmentCashier.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogAdjustmentCashier.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogAdjustmentCashier.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;
  if (curredtCash.Value = 0)
    and (curredtCredit.Value = 0)
    and (curredtDebit.Value = 0)
    and (curredtDeposit.Value = 0)
    and (curredtVoucher.Value = 0)
    and (curredtVoucherLain.Value = 0) then
  begin
    CommonDlg.ShowError('You cannot save an empty data');
    Exit;
  end;
  if (curredtCash.Value <> 0)
    and ((curredtCredit.Value <> 0)
    or (curredtDebit.Value <> 0)
    or (curredtDeposit.Value <> 0)
    or (curredtVoucher.Value <> 0)
    or (curredtVoucherLain.Value <> 0)) then
  begin
     CommonDlg.ShowError('Gagal simpan , Harus isi salah satu Cash atau Card');
     Exit;
  end;

  if (Floor(dtTgl.Date) <= Floor(GetLastEODDate(DialogUnit))) then
  begin
    CommonDlg.ShowError('Tanggal ' + FormatDateTime('DD MMM YYYY', dtTgl.Date) + ' Sudah EOD, Transaksi tidak bisa dilanjutkan..');
    dtTgl.SetFocus;
    Exit;
  end;

  if (SaveAdjustmentCashier) then
  begin
    IsProcessSuccessfull := true;
  end;
end;

procedure TfrmDialogAdjustmentCashier.ParseDataComboBox;
var
  data: TDataSet;
  sCreditDebet: string;
begin
  {with cbpCard do
  begin
    ClearGridData;
    ColCount := 4;
    RowCount := 3;
    AddRow(['Id', 'CARD CODE.','CARD NAME','CREDIT/DEBET']);

    if not assigned(CreditCard) then
      CreditCard := TCreditCard.Create;
    data := CreditCard.GetListDataCreditCard(dialogunit,1);

    if (data.RecordCount > 0) then
    begin
      RowCount := data.RecordCount + 2;
      while not data.Eof do
      begin
        if (data.FieldByName('CARD_IS_CREDIT').AsInteger = 1) then
          sCreditDebet := 'CREDIT'
        else
          sCreditDebet := 'DEBIT';
        AddRow([data.FieldByName('CARD_ID').AsString,data.FieldByName('CARD_CODE').AsString,
          data.FieldByName('CARD_NAME').AsString,sCreditDebet]);
        data.Next;
      end;
    end
    else
    begin
      AddRow(['0',' ',' ',' '])
    end;

    FixedRows := 1;
    SizeGridToData;
    Text := '';
  end;
  }
end;

procedure TfrmDialogAdjustmentCashier.FormShow(Sender: TObject);
begin
  inherited;
  // parse info read only
  dtTgl.Date := frmAdjustmentCashier.dtTgl.Date;
  edtPOSCode.Text := frmAdjustmentCashier.edtPOSCode.Text;
  edtShift.Text := frmAdjustmentCashier.edtShiftCode.Text;
  edtCashierId.Text := frmAdjustmentCashier.edtCashierCode.Text;
  edtCashierName.Text := frmAdjustmentCashier.edtCashierName.Text;
  BeginningBalanceId := frmAdjustmentCashier.BeginningBalanceId;
  
  FStrCash := '0'+FormatSettings.DecimalSeparator+'00';
  FStrCredit := '0'+FormatSettings.DecimalSeparator+'00';
  FStrDebit := '0'+FormatSettings.DecimalSeparator+'00';
  FStrDeposit := '0'+FormatSettings.DecimalSeparator+'00';
  FStrGoroCoupon := '0'+FormatSettings.DecimalSeparator+'00';
  FStrOtherCoupon := '0'+FormatSettings.DecimalSeparator+'00';
  
  curredtCash.Value := 0;

  ClrCcAtribut;


  ParseDataComboBox;
  curredtCash.SetFocus;
  curredtCash.SelectAll;

end;

procedure TfrmDialogAdjustmentCashier.curredtCashKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    cbpCard.SetFocus;
    cbpCard.SelectAll;
  end;
end;

procedure TfrmDialogAdjustmentCashier.cbpCardKeyPress(Sender: TObject;
  var Key: Char);
begin
  {if (Key = Chr(VK_RETURN)) then
  begin
    ClrCcAtribut;
    if (trim(cbpCard.Text) <> '') and (UpperCase(Trim(cbpCard.Cells[3,cbpCard.Row])) = 'CREDIT') then
    begin
      curredtCredit.SetFocus;
      curredtCredit.SelectAll;
      curredtCredit.Properties.ReadOnly  := False;
      curredtDebit.Properties.ReadOnly   := true;
    end
    else
    begin
      curredtDebit.SetFocus;
      curredtDebit.SelectAll;
      curredtDebit.Properties.ReadOnly   := False;
      curredtCredit.Properties.ReadOnly  := true;
    end;
  end;
  }
end;

procedure TfrmDialogAdjustmentCashier.curredtCreditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    curredtDeposit.SetFocus;
    curredtDeposit.SelectAll;
  end;
end;

procedure TfrmDialogAdjustmentCashier.curredtDebitKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    curredtDeposit.SetFocus;
    curredtDeposit.SelectAll;
  end;
end;

procedure TfrmDialogAdjustmentCashier.curredtDepositKeyPress(
  Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    curredtVoucher.SetFocus;
    curredtVoucher.SelectAll;
  end;
end;

procedure TfrmDialogAdjustmentCashier.curredtVoucherKeyPress(
  Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    curredtVoucherLain.SetFocus;
    curredtVoucherLain.SelectAll;
  end;
end;

procedure TfrmDialogAdjustmentCashier.curredtVoucherLainKeyPress(
  Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    edtNote.SetFocus;
    edtNote.SelectAll;
  end;
end;

procedure TfrmDialogAdjustmentCashier.SetBeginningBalanceId(
  const Value: integer);
begin
  FBeginningBalanceId := Value;
end;

function TfrmDialogAdjustmentCashier.SaveAdjustmentCashier: boolean;
var
  idCard  : integer;
begin
  {with TAdjustmentCashier.CreateWithUser(Self,FLoginId,dialogunit) do
  begin
    try
      if (Trim(cbpCard.Text) <> '') then
        idCard := strtoint(cbpCard.Cells[0,cbpCard.Row])
      else
        idCard := 0;

      UpdateData(BeginningBalanceId,
        idCard,
        curredtCash.Value,
        curredtCredit.Value,
        curredtDebit.Value,
        curredtDeposit.Value,
        edtNote.Text,
        curredtVoucher.Value,
        0,dialogunit,
        curredtVoucherLain.Value);
      Result := SaveToDB;
      if Result then
      begin
        cCommitTrans;
        PrintSlip(ID, dialogunit);
        Close;
      end
      else
      begin
        cRollbackTrans;
      end;
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmDialogAdjustmentCashier.curredtDepositEnter(Sender: TObject);
begin
  inherited;
  LoadValueCurrencyEdit(Sender as TcxCurrencyEdit);
end;

procedure TfrmDialogAdjustmentCashier.curredtDepositExit(Sender: TObject);
begin
  inherited;
  SaveValueCurrencyEdit(Sender as TcxCurrencyEdit);
end;

procedure TfrmDialogAdjustmentCashier.LoadValueCurrencyEdit(
  ACurrencyEdit: TcxCurrencyEdit);
var
  AStringLoader: string;
begin

  if ACurrencyEdit = curredtCash then
    AStringLoader := FStrCash
  else if ACurrencyEdit = curredtCredit then
    AStringLoader := FStrCredit
  else if ACurrencyEdit = curredtDebit then
    AStringLoader := FStrDebit
  else if ACurrencyEdit = curredtDeposit then
    AStringLoader := FStrDeposit
  else if ACurrencyEdit = curredtVoucher then
    AStringLoader := FStrGoroCoupon
  else if ACurrencyEdit = curredtVoucherLain then
    AStringLoader := FStrOtherCoupon;

  ACurrencyEdit.SelectAll;

  if StrToFloat(AStringLoader) <> 0 then
    ACurrencyEdit.SelText := AStringLoader;
    
end;

procedure TfrmDialogAdjustmentCashier.SaveValueCurrencyEdit(
  ACurrencyEdit: TcxCurrencyEdit);
var
  AStringSaver: string;
begin

  ACurrencyEdit.SelectAll;
  AStringSaver := ACurrencyEdit.SelText;
  ACurrencyEdit.Value := StrToCurr(AStringSaver);

  if ACurrencyEdit = curredtCash then
    FStrCash := AStringSaver
  else if ACurrencyEdit = curredtCredit then
    FStrCredit := AStringSaver
  else if ACurrencyEdit = curredtDebit then
    FStrDebit := AStringSaver
  else if ACurrencyEdit = curredtDeposit then
    FStrDeposit := AStringSaver
  else if ACurrencyEdit = curredtVoucher then
    FStrGoroCoupon := AStringSaver
  else if ACurrencyEdit = curredtVoucherLain then
    FStrOtherCoupon := AStringSaver;

end;

procedure TfrmDialogAdjustmentCashier.cbpCardChange(Sender: TObject);
begin
  inherited;
//  cbpCard.Text := cbpCard.Cells[2, cbpCard.Row];

end;

procedure TfrmDialogAdjustmentCashier.ClrCcAtribut;
begin
  curredtCredit.Value := 0;
  curredtDebit.Value := 0;
  curredtDeposit.Value := 0;
  curredtVoucher.Value := 0;
  curredtVoucherLain.Value := 0;
  edtNote.Clear;
end;

procedure TfrmDialogAdjustmentCashier.PrintSlip(aAdjID: integer; aUnitID:
    integer);
var
  sSQL  : string;
begin
  sSQL  := 'SELECT '
        + QuotedStr(Trim(edtPOSCode.Text)) +' as PosCode, '
        + QuotedStr(Trim(edtShift.Text)) +' as Shift, '
        + QuotedStr(Trim(edtCashierId.Text)) +' as CId, '
        + QuotedStr(Trim(edtCashierName.Text)) +' as CNm, '
        + ' AC.ADJCASHIER_CASH_VALUE as Cash, AC.ADJCASHIER_CREDIT AS CREDIT,'
        + ' AC.ADJCASHIER_DEBIT AS DEBET, AC.ADJCASHIER_DEPOSIT_COUPON AS DEPOSIT,'
        + ' AC.ADJCASHIER_GORO_COUPON AS VGORO, AC.ADJCASHIER_OTHER_COUPON AS VOTHER,'
        + ' AC.ADJCASHIER_DESCRIPTION AS DESCR, CC.CARD_NAME'
        + ' FROM ADJUSTMENT_CASHIER AC'
        + ' LEFT join ref$credit_card cc on cc.card_id = AC.ADJCASHIER_CARD_ID'
        + ' AND CC.CARD_UNT_ID = AC.ADJCASHIER_CARD_UNT_ID'
        + ' WHERE ADJCASHIER_ID = '+ IntToStr(aAdjID)
        + ' AND ADJCASHIER_UNT_ID = '+ IntToStr(aUnitID);

//  dmReportNew.EksekusiReport('frAdjCashier', sSQL,'',True);


end;

end.






