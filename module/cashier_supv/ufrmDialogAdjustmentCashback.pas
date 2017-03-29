unit ufrmDialogAdjustmentCashback;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, StdCtrls, ComCtrls,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxCore,  DB,
  cxDateUtils, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxCurrencyEdit, cxTextEdit, cxMaskEdit, cxCalendar;

type                 
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogAdjustmentCashback = class(TfrmMasterDialog)
    pnl2: TPanel;
    lbl4: TLabel;
    edtMemberCode: TEdit;
    edtMemberName: TEdit;
    edtCashierName: TEdit;
    edtCashierId: TEdit;
    lbl6: TLabel;
    lbl5: TLabel;
    edtPOSCode: TEdit;
    edtShiftCode: TEdit;
    lbl7: TLabel;
    lbl9: TLabel;
    edtCardCode: TEdit;
    edtCardNo: TEdit;
    edtCardName: TEdit;
    lbl10: TLabel;
    lbl11: TLabel;
    edtCardAuthorize: TEdit;
    lbl12: TLabel;
    dtTransact: TcxDateEdit;
    curredtTotalTransact: TcxCurrencyEdit;
    lbl13: TLabel;
    lbl14: TLabel;
    curredtPaymentCard: TcxCurrencyEdit;
    pnl3: TPanel;
    curredtCashbackActually: TcxCurrencyEdit;
    lbl16: TLabel;
    lbl15: TLabel;
    curredtCashbackBefore: TcxCurrencyEdit;
    curredtAdjustCashback: TcxCurrencyEdit;
    lbl17: TLabel;
    lbl18: TLabel;
    edtNote: TEdit;
    pgcPage: TPageControl;
    tsSameDay: TTabSheet;
    tsOthersDay: TTabSheet;
    Panel1: TPanel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    dtAdjustCashback: TcxDateEdit;
    cbpAdjustCode: TcxExtLookupComboBox;
    edtNoTrans: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tsOthersDayShow(Sender: TObject);
    procedure dtAdjustCashbackKeyPress(Sender: TObject; var Key: Char);
    procedure cbpAdjustCodeKeyPress(Sender: TObject; var Key: Char);
//    procedure cbpTransNoKeyPress(Sender: TObject; var Key: Char);
//    procedure cbpTransNoChange(Sender: TObject);
    procedure curredtCashbackBeforeChange(Sender: TObject);
    procedure curredtCashbackActuallyKeyPress(Sender: TObject;
      var Key: Char);
//    procedure cbpAdjustCodeChange(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FIsProcessSuccessfull: boolean;
    FFormMode: TFormMode;
    procedure ClearData;
    procedure LookUpData(Sender:TObject; Key: Word);
//    procedure ParseDataComboBox();
    procedure ParseDataComboBoxAdjustCode;
    procedure ParseDetilTransactCardByTransNo;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    function SaveAdjustmentCashback: boolean;
  public
    { Public declarations }
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogAdjustmentCashback: TfrmDialogAdjustmentCashback;

implementation

uses uTSCommonDlg;

{$R *.dfm}

procedure TfrmDialogAdjustmentCashback.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogAdjustmentCashback.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogAdjustmentCashback := nil;
end;

//procedure TfrmDialogAdjustmentCashback.ParseDataComboBox;
//var
//  sSQL: string;
//  data: TDataSet;
//begin
//  with cbpTransNo do
//  begin
//    ClearGridData;
//    ColCount := 3;
//    RowCount := 3;
//    AddRow(['id', 'TRANSACTION NO.','DATE']);
//
//    sSQL := 'SELECT TRANS_NO, TRANS_DATE '
//      + 'FROM TRANSAKSI '
//      + 'WHERE TRANS_NO LIKE ' + Quot(cbpTransNo.Text + '%')
//      + 'AND TRANS_UNT_ID = ' + IntToStr(dialogunit);
//    data := cOpenQuery(sSQL);
//    
//    if (not data.Eof) then
//    begin
//      data.Last;
//      data.First;
//      RowCount := data.RecordCount + 2;
//      while not data.Eof do
//      begin
//        AddRow([data.FieldByName('TRANS_NO').AsString,data.FieldByName('TRANS_NO').AsString,
//          FormatDateTime('dd-mm-yyyy',data.FieldByName('TRANS_DATE').AsDateTime)]);
//        data.Next;
//      end;
//    end
//    else
//    begin
//      AddRow(['0','    ','   ']);
//    end;
//    
//    FixedRows := 1;
//    SizeGridToData; 
//    ShowSpeedButton := false;
//  end;
//end;

procedure TfrmDialogAdjustmentCashback.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogAdjustmentCashback.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogAdjustmentCashback.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
//  if (Trim(cbpTransNo.Text) = '') then
  if (Trim(edtNoTrans.Text) = '') then
  begin
    CommonDlg.ShowErrorEmpty('Transaction No.');
    edtNoTrans.SetFocus;
    exit;
  end;

  if (SaveAdjustmentCashback) then
  begin
    IsProcessSuccessfull := true;
    Close;
  end;
end;

procedure TfrmDialogAdjustmentCashback.FormShow(Sender: TObject);
begin
  inherited;
  pgcPage.ActivePageIndex := 1;
end;

procedure TfrmDialogAdjustmentCashback.tsOthersDayShow(Sender: TObject);
begin
  dtAdjustCashback.Date := now;
  dtAdjustCashback.SetFocus;
  dtAdjustCashback.SelectAll;
  ParseDataComboBoxAdjustCode;
//  ParseDataComboBox;
end;

procedure TfrmDialogAdjustmentCashback.dtAdjustCashbackKeyPress(
  Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    cbpAdjustCode.SetFocus;
    cbpAdjustCode.SelectAll;
  end;
end;

procedure TfrmDialogAdjustmentCashback.ParseDataComboBoxAdjustCode;
begin
  {with cbpAdjustCode do
  begin
    ClearGridData;
    RowCount := 4;
    ColCount := 3;
    AddRow(['id','CODE','DESCRIPTION']);
    AddRow(['1','1=Kekurangan input','Kekurangan input']);
    AddRow(['2','2=Kelebihan input','Kelebihan input']);
    AddRow(['3','3=Kelupaan input','Kelupaan input']);

    FixedRows := 1;
    AutoSize := true;
  end;
  }
end;

procedure TfrmDialogAdjustmentCashback.cbpAdjustCodeKeyPress(
  Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    edtNoTrans.SetFocus;
//    edtNote.Text := cbpAdjustCode.Cells[2,cbpAdjustCode.Row] + ' ';
  end;
end;

procedure TfrmDialogAdjustmentCashback.ParseDetilTransactCardByTransNo;
var
  sSQL: string;
  data: TDataSet;
begin
  sSQL := 'SELECT * '
    + 'FROM TRANSAKSI '
    + ' INNER JOIN MEMBER ON (MEMBER_ID=TRANS_MEMBER_ID) '
    + '   AND (MEMBER_UNT_ID=TRANS_MEMBER_UNT_ID) '
    + ' INNER JOIN BEGINNING_BALANCE ON (BALANCE_ID=TRANS_BALANCE_ID) '
    + '   AND (BALANCE_UNT_ID=TRANS_BALANCE_UNT_ID) '
    + ' INNER JOIN AUT$USER ON (USR_ID=BALANCE_USR_ID) '
    + '   AND (USR_UNT_ID=BALANCE_USR_UNT_ID) '
    + ' INNER JOIN SETUPPOS ON (SETUPPOS_ID=BALANCE_SETUPPOS_ID) '
    + '   AND (SETUPPOS_UNT_ID=BALANCE_SETUPPOS_UNT_ID) '
    + ' INNER JOIN SHIFT ON (SHIFT_ID=BALANCE_SHIFT_ID) '
    + '   AND (SHIFT_UNT_ID=BALANCE_SHIFT_UNT_ID) '
    + ' LEFT OUTER JOIN TRANSAKSI_CARD ON (TRANSC_TRANS_NO=TRANS_NO) '
    + '   AND (TRANSC_TRANS_UNT_ID=TRANS_UNT_ID) '
    + ' LEFT OUTER JOIN REF$CREDIT_CARD ON (CARD_ID=TRANSC_CARD_ID) '
    + '   AND (CARD_UNT_ID=TRANSC_CARD_UNT_ID) '
    + ' WHERE TRANS_NO = ' + QuotedStr(edtNoTrans.Text)
    + ' AND TRANS_UNT_ID = ' + IntToStr(dialogunit);
  {
  data := cOpenQuery(sSQL);

  if not (data.IsEmpty) then
  begin
    with data do
    begin
      First;
      edtMemberCode.Text := FieldByName('MEMBER_CARD_NO').AsString;
      edtMemberName.Text := FieldByName('MEMBER_NAME').AsString;
      edtCashierId.Text := FieldByName('USR_USERNAME').AsString;
      edtCashierName.Text := FieldByName('USR_FULLNAME').AsString;
      edtPOSCode.Text := FieldByName('SETUPPOS_TERMINAL_CODE').AsString;
      edtShiftCode.Text := FieldByName('SHIFT_NAME').AsString;

      edtCardCode.Text := FieldByName('CARD_CODE').AsString;
      edtCardNo.Text := FieldByName('TRANSC_NOMOR').AsString;
      edtCardName.Text := FieldByName('CARD_NAME').AsString;
      edtCardAuthorize.Text := FieldByName('TRANSC_NO_OTORISASI').AsString;

      dtTransact.Date := FieldByName('TRANS_DATE').AsDateTime;

      curredtTotalTransact.Value := FieldByName('TRANS_TOTAL_BAYAR').AsCurrency;
      curredtPaymentCard.Value := FieldByName('TRANS_BAYAR_CARD').AsCurrency;
      curredtCashbackActually.Value := 0;
      curredtCashbackBefore.Value := FieldByName('TRANSC_CASHBACK_NILAI').AsCurrency;
    end;
  end;

  curredtCashbackActually.SetFocus;
  curredtCashbackActually.SelectAll;
  }
end;

procedure TfrmDialogAdjustmentCashback.curredtCashbackBeforeChange(
  Sender: TObject);
begin
  curredtAdjustCashback.Value := curredtCashbackActually.Value - curredtCashbackBefore.Value;
end;

procedure TfrmDialogAdjustmentCashback.curredtCashbackActuallyKeyPress(
  Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    edtNote.SetFocus;
    edtNote.SelectAll;
  end;
end;

function TfrmDialogAdjustmentCashback.SaveAdjustmentCashback: boolean;
begin
//  Result := false;
  {
  with TAdjustmentCashback.CreateWithUser(Self,FLoginId,dialogunit) do
  begin
    try
      UpdateData(curredtCashbackActually.Value,
        curredtCashbackBefore.Value,
        dtAdjustCashback.Date,
        0,dialogunit,
        edtNote.Text,
        edtNoTrans.Text,
        curredtAdjustCashback.Value);
      Result := SaveToDB;
      if Result then
      begin
        cCommitTrans;
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

procedure TfrmDialogAdjustmentCashback.ClearData;
begin
  edtMemberCode.Clear;
  edtMemberName.Clear;
  edtCashierId.Clear;
  edtCashierName.Clear;
  edtPOSCode.Clear;
  edtShiftCode.Clear;
  edtCardCode.Clear;
  edtCardNo.Clear;
  edtCardName.Clear;
  edtCardAuthorize.Clear;
  dtTransact.Clear;
  curredtTotalTransact.Clear;
  curredtPaymentCard.Clear;
  curredtCashbackActually.Clear;
  curredtCashbackBefore.Clear;
end;

procedure TfrmDialogAdjustmentCashback.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Key = vk_F5) or (Key = vk_return)) and (not (ssCtrl in Shift)) then
    LookUpData(ActiveControl, Key);
end;

procedure TfrmDialogAdjustmentCashback.LookUpData(Sender:TObject; Key: Word);
var
  sSQL: string;
begin
  if Sender = edtNoTrans then
  begin
    if Key = vk_F5 then
    begin
      sSQL := 'SELECT TRANS_NO as "NO TRANSAKSI", TRANS_DATE AS "TANGGAL" '
            + 'FROM TRANSAKSI '
            + 'WHERE TRANS_UNT_ID = ' + IntToStr(dialogunit);
      {
      with cLookUp('Data transaksi', sSQL, 200, 2,True) do
      begin
        if Strings[0] <> '' then
        begin
          edtNoTrans.Text := Strings[0];
          LookUpData(Sender, VK_RETURN);
        end
        else
          ClearData;
      end;
      }
    end
    else if Key = vk_Return then
    begin
      ParseDetilTransactCardByTransNo;
    end;    
  end;  
end;

end.




