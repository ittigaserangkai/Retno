unit ufrmAdjustmentCashier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls,  ActnList,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Menus, cxCurrencyEdit, System.Actions, ufraFooter4Button,
  cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC;

type
  TfrmAdjustmentCashier = class(TfrmMasterBrowse)
    pnl1: TPanel;
    edtShiftCode: TEdit;
    lbl2: TLabel;
    dtTgl: TcxDateEdit;
    lbl1: TLabel;
    lbl3: TLabel;
    edtPOSCode: TEdit;
    lbl4: TLabel;
    edtCashierCode: TEdit;
    edtCashierName: TEdit;
    pnl3: TPanel;
    pnl4: TPanel;
    lbl7: TLabel;
    curredtPhysicCash: TcxCurrencyEdit;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    curredtCash: TcxCurrencyEdit;
    curredtCredit: TcxCurrencyEdit;
    curredtDebit: TcxCurrencyEdit;
    curredtVoucher: TcxCurrencyEdit;
    curredtDeposit: TcxCurrencyEdit;
    curredtVoucherLain: TcxCurrencyEdit;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    pnl5: TPanel;
    lbl16: TLabel;
    Panel1: TPanel;
    edtCardName: TEdit;
    lbl5: TLabel;
    lbl6: TLabel;
    edtNote: TEdit;
    lbl8: TcxLabel;
    Label1: TLabel;
    curredtDiscCC: TcxCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPOSCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtShiftCodeKeyPress(Sender: TObject; var Key: Char);
    procedure actAddExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure dtTglKeyPress(Sender: TObject; var Key: Char);
    procedure strgGridKeyPress(Sender: TObject; var Key: Char);
    procedure strgGridRowMove(Sender: TObject; ARow: Integer;
      var Allow: Boolean);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
  private
    procedure ParseHeaderGrid();
    procedure ParseDataGrid();
    procedure ParseDataBeginningBalance(ADate: TDateTime; APOSCode, AShiftCode: string);
    procedure ParseInfoForFinalPayment;
  public
    BeginningBalanceId: Integer;
  end;

var
  frmAdjustmentCashier: TfrmAdjustmentCashier;

implementation

uses uTSCommonDlg,
  ufrmDialogAdjustmentCashier, uConn, uRetnoUnit, uAppUtils;

{$R *.dfm}

procedure TfrmAdjustmentCashier.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmAdjustmentCashier.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'ADJUSTMENT CASHIER';
  pnl5.Align := alClient;
  pnl5.Visible := true;
end;

procedure TfrmAdjustmentCashier.FormDestroy(Sender: TObject);
begin
  inherited;
  frmAdjustmentCashier := nil;
end;

procedure TfrmAdjustmentCashier.FormShow(Sender: TObject);
begin
  inherited;
  dtTgl.Date := now;
  dtTgl.SelectAll;
end;

procedure TfrmAdjustmentCashier.ParseDataGrid;
var
  i: Integer;
  sSQL: string;
  data: TDataSet;
begin
  ParseHeaderGrid;
  sSQL := 'SELECT * '
    + 'FROM ADJUSTMENT_CASHIER AC '
    + ' LEFT OUTER JOIN REF$CREDIT_CARD RCC ON RCC.CARD_ID = AC.ADJCASHIER_CARD_ID '
    + '   AND RCC.CARD_UNT_ID = AC.ADJCASHIER_CARD_UNT_ID '
    + ' WHERE AC.ADJCASHIER_BALANCE_ID = ' + IntToStr(BeginningBalanceId)
    + '   AND AC.ADJCASHIER_BALANCE_UNT_ID = ' + IntToStr(masternewunit);
  {
  data := cOpenQuery(sSQL);
  if (not data.Eof) then
  begin
    data.Last;
    strgGrid.RowCount := data.RecordCount + 2;
    data.First;
    i := 1;
    while not data.Eof do
    begin
      with strgGrid do
      begin
        Cells[0,i] := FormatFloat('#,##0.00',data.fieldByName('ADJCASHIER_CASH_VALUE').AsCurrency);
        Alignments[0,i] := taRightJustify;
        Cells[1,i] := data.fieldByName('CARD_CODE').AsString;
        Alignments[1,i] := taCenter;
        Cells[2,i] := FormatFloat('#,##0.00',data.fieldByName('ADJCASHIER_CREDIT').AsCurrency);
        Alignments[2,i] := taRightJustify;
        Cells[3,i] := FormatFloat('#,##0.00',data.fieldByName('ADJCASHIER_DEBIT').AsCurrency);
        Alignments[3,i] := taRightJustify;
        Cells[4,i] := FormatFloat('#,##0.00',data.fieldByName('ADJCASHIER_DEPOSIT_COUPON').AsCurrency);
        Alignments[4,i] := taRightJustify;
        Cells[5,i] := FormatFloat('#,##0.00',data.fieldByName('ADJCASHIER_GORO_COUPON').AsCurrency);
        Alignments[5,i] := taRightJustify;
        Cells[6,i] := FormatFloat('#,##0.00',data.fieldByName('ADJCASHIER_OTHER_COUPON').AsCurrency);
        Alignments[6,i] := taRightJustify;

        FloatingFooter.ColumnCalc[0] := acSUM;
        Alignments[0,RowCount-1] := taRightJustify;
        FloatingFooter.ColumnCalc[2] := acSUM;
        Alignments[2,RowCount-1] := taRightJustify;
        FloatingFooter.ColumnCalc[3] := acSUM;
        Alignments[3,RowCount-1] := taRightJustify;
        FloatingFooter.ColumnCalc[4] := acSUM;
        Alignments[4,RowCount-1] := taRightJustify;
        FloatingFooter.ColumnCalc[5] := acSUM;
        Alignments[5,RowCount-1] := taRightJustify;
        FloatingFooter.ColumnCalc[6] := acSUM;
        Alignments[6,RowCount-1] := taRightJustify;

        // hidden;
        Cells[10,i] := data.fieldByName('CARD_NAME').AsString;
        Cells[11,i] := data.fieldByName('ADJCASHIER_DESCRIPTION').AsString;

        //FixedRows := 1;
        AutoSize := true;
      end;

      data.Next;
      i := i+1;
    end;
  end;
  }
end;

procedure TfrmAdjustmentCashier.ParseHeaderGrid;
begin
  {with strgGrid do
  begin
    Clear;
    ColCount := 7;
    RowCount := 3;
    Cells[0,0] := 'CASH VALUE';
    Cells[1,0] := 'CARD CODE';
    Cells[2,0] := 'CREDIT CARD';
    Cells[3,0] := 'DEBIT CARD';
    Cells[4,0] := 'DEPOSIT VOUCHER';
    Cells[5,0] := 'ASSALAAM VOUCHER';
    Cells[6,0] := 'OTHER VOUCHER';

    FixedRows := 1;
    AutoSize := true;
  end;
  }
end;

procedure TfrmAdjustmentCashier.edtPOSCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = Chr(VK_RETURN)) then
    edtShiftCode.SetFocus;
end;

procedure TfrmAdjustmentCashier.edtShiftCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  {if (Key = Chr(VK_RETURN)) then
  begin
    pnl5.Visible := false;
    ParseDataBeginningBalance(dtTgl.Date,edtPOSCode.Text,edtShiftCode.Text);
    ParseDataGrid;        
    edtCardName.Text := strgGrid.Cells[10,strgGrid.row];
    edtNote.Text := strgGrid.Cells[11,strgGrid.row];
    ParseInfoForFinalPayment;
    strgGrid.SetFocus;
  end;
  }
end;

procedure TfrmAdjustmentCashier.actAddExecute(Sender: TObject);
begin
  inherited;
  if not assigned(frmDialogAdjustmentCashier) then
    Application.CreateForm(TfrmDialogAdjustmentCashier, frmDialogAdjustmentCashier);

  frmDialogAdjustmentCashier.Caption := 'Add Adjustment Cashier';
  frmDialogAdjustmentCashier.FormMode := fmAdd;
  SetFormPropertyAndShowDialog(frmDialogAdjustmentCashier);

  if (frmDialogAdjustmentCashier.IsProcessSuccessfull) then
  begin
    // put your code here
    // ...
    actRefreshExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atAdd);
  end;
  frmDialogAdjustmentCashier.Free;
end;

procedure TfrmAdjustmentCashier.actRefreshExecute(Sender: TObject);
begin
  inherited;
  {
  ParseDataBeginningBalance(dtTgl.Date,edtPOSCode.Text,edtShiftCode.Text);
  ParseDataGrid;
  edtCardName.Text := strgGrid.Cells[10,strgGrid.row];
  edtNote.Text := strgGrid.Cells[11,strgGrid.row];
  ParseInfoForFinalPayment;
  strgGrid.SetFocus;  }
end;

procedure TfrmAdjustmentCashier.dtTglKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = Chr(VK_RETURN)) then
  begin
    edtPOSCode.SetFocus;
    edtPOSCode.SelectAll;
  end;
end;

procedure TfrmAdjustmentCashier.ParseDataBeginningBalance(ADate: TDateTime;
  APOSCode, AShiftCode: string);
var
  sSQL: string;
  data: TDataSet;
begin
  sSQL := 'select balance_id, usr_username, usr_fullname '
    + 'from beginning_balance bb '
    + ' inner join shift s on (s.shift_id = bb.balance_shift_id) '
    + '   and (s.shift_unt_id = bb.balance_shift_unt_id) '
    + '   and (bb.balance_shift_date = ' + TAppUtils.QuotD(dtTgl.Date) + ') '
    + '   and (s.shift_name = ' + QuotedStr(AShiftCode) + ') '
    + '   and (bb.balance_unt_id = ' + IntToStr(masternewunit) + ') '
    + ' inner join setuppos sp on (sp.setuppos_id = bb.balance_setuppos_id) '
    + '   and (sp.setuppos_unt_id = bb.balance_setuppos_unt_id) '
    + '   and (sp.setuppos_terminal_code = ' + QuotedStr(APOSCode) + ') '
    + ' inner join aut$user au on (au.usr_id = bb.balance_usr_id) ' //kasir
    + '   and (au.usr_unt_id = bb.balance_usr_unt_id) ';
  {
  data := cOpenQuery(sSQL);

  if (data.RecordCount > 0) then
  begin
    edtCashierCode.Text := data.fieldByName('USR_USERNAME').AsString;
    edtCashierName.Text := data.fieldByName('USR_FULLNAME').AsString;
    BeginningBalanceId := data.fieldByName('BALANCE_ID').AsInteger;
  end
  else
  begin
    edtCashierCode.Text := '';
    edtCashierName.Text := '';
    BeginningBalanceId := 0;
  end;
  }
end;

procedure TfrmAdjustmentCashier.strgGridKeyPress(Sender: TObject;
  var Key: Char);
begin
  {
  if (Key = Chr(VK_UP)) then
    if (strgGrid.Row = 1) then
    begin
      dtTgl.SetFocus;
      dtTgl.SelectAll;
    end;
    }
end;

procedure TfrmAdjustmentCashier.ParseInfoForFinalPayment;
begin
  {
  with TNewFinalPayment.Create(Self) do
  begin
  	try
    	LoadPOSTransaction(masternewunit.id,dtTgl.Date,edtShiftCode.Text,edtPOSCode.Text);

      if FinalPaymentPOSItems.Count > 0 then
      begin
        curredtCash.Value := FinalPaymentPOSItems[0].CashPayment;
        curredtCredit.Value := FinalPaymentPOSItems[0].CardCredit;
        curredtDebit.Value := FinalPaymentPOSItems[0].CardDebit;
        curredtDiscCC.Value := FinalPaymentPOSItems[0].TotalDiscCard;
        curredtVoucher.Value := FinalPaymentPOSItems[0].VoucherGoro;
        curredtVoucherLain.Value := FinalPaymentPOSItems[0].VoucherLain;
        curredtDeposit.Value := 0.00;
        curredtPhysicCash.Value := FinalPaymentPOSItems[0].CashPhysical;
      end;
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmAdjustmentCashier.strgGridRowMove(Sender: TObject;
  ARow: Integer; var Allow: Boolean);
begin
//  edtCardName.Text := strgGrid.Cells[10,ARow];
//  edtNote.Text := strgGrid.Cells[11,ARow];
end;

procedure TfrmAdjustmentCashier.strgGridRowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
begin
  inherited;
//  edtCardName.Text := strgGrid.Cells[10, NewRow];
//  edtNote.Text := strgGrid.Cells[11,NewRow];
end;

end.


