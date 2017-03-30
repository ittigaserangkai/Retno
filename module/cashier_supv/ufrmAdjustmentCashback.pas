unit ufrmAdjustmentCashback;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter5Button, ActnList, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, System.Actions, cxCurrencyEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxGraphics;

type
  TfrmAdjustmentCashback = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    pnl1: TPanel;
    pnl2: TPanel;
    dtAdjustment: TcxDateEdit;
    lbl1: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edtMemberCode: TEdit;
    edtMemberName: TEdit;
    lbl6: TLabel;
    edtCashierCode: TEdit;
    edtCashierName: TEdit;
    lbl5: TLabel;
    edtPOSCode: TEdit;
    lbl7: TLabel;
    edtShiftCode: TEdit;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    edtCardCode: TEdit;
    edtCardNo: TEdit;
    edtCardName: TEdit;
    edtCardAuthorize: TEdit;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    dtTransact: TcxDateEdit;
    curredtTotalTransact: TcxCurrencyEdit;
    curredtPaymentCard: TcxCurrencyEdit;
    lbl15: TLabel;
    curredtCashbackBefore: TcxCurrencyEdit;
    curredtCashbackActually: TcxCurrencyEdit;
    lbl16: TLabel;
    lbl17: TLabel;
    curredtAdjustValue: TcxCurrencyEdit;
    lbl18: TLabel;
    edtNote: TEdit;
    bvl1: TBevel;
    actlst1: TActionList;
    actAddAdjustmentCashback: TAction;
    actRefreshAdjustmentCashback: TAction;
    edtNoTrans: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
//    procedure cbpTransNoKeyPress(Sender: TObject; var Key: Char);
    procedure actAddAdjustmentCashbackExecute(Sender: TObject);
    procedure actRefreshAdjustmentCashbackExecute(Sender: TObject);
    procedure dtAdjustmentKeyPress(Sender: TObject; var Key: Char);
//    procedure cbpTransNoChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FidAdj: Integer;
    procedure ClearData;
    function GetIDAdj: Integer;
    procedure LookUpData(sender:TObject; Key: Word);
//    procedure ParseDataTransNoForAdjustCashbakToComboBox;
    procedure ParseDetilTransaksiCard;
    procedure ParseDetilAdjustment;
  public
    { Public declarations }
  end;

var
  frmAdjustmentCashback: TfrmAdjustmentCashback;

implementation

uses ufrmDialogAdjustmentCashback, uTSCommonDlg, DB, uAppUtils;

{$R *.dfm}

procedure TfrmAdjustmentCashback.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmAdjustmentCashback.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'ADJUSTMENT CASHBACK';
end;

procedure TfrmAdjustmentCashback.FormDestroy(Sender: TObject);
begin
  inherited;
  frmAdjustmentCashback := nil;
end;

procedure TfrmAdjustmentCashback.FormShow(Sender: TObject);
begin
  inherited;
  dtAdjustment.Date := Now;
  dtAdjustment.SetFocus;
  dtAdjustment.SelectAll;
end;

//procedure TfrmAdjustmentCashback.cbpTransNoKeyPress(Sender: TObject;
//  var Key: Char);
//begin
//  if (Key = Chr(VK_RETURN)) then
//  begin
//    if (Trim(cbpTransNo.Text) <> '') then
//    begin
//      ParseDetilTransaksiCard;
//      ParseDetilAdjustment;
//    end;
//  end;
//end;

procedure TfrmAdjustmentCashback.actAddAdjustmentCashbackExecute(
  Sender: TObject);
begin
  if not assigned(frmDialogAdjustmentCashback) then
    Application.CreateForm(TfrmDialogAdjustmentCashback, frmDialogAdjustmentCashback);

  frmDialogAdjustmentCashback.Caption := 'Add Adjustment Cashback';
  frmDialogAdjustmentCashback.FormMode := fmAdd;
  SetFormPropertyAndShowDialog(frmDialogAdjustmentCashback);

  if (frmDialogAdjustmentCashback.IsProcessSuccessfull) then
  begin
    // put your code here
    // ...
    actRefreshAdjustmentCashbackExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atAdd);
  end;
  frmDialogAdjustmentCashback.Free;
end;

procedure TfrmAdjustmentCashback.actRefreshAdjustmentCashbackExecute(
  Sender: TObject);
begin
  if (Trim(edtNoTrans.Text) <> '') then
  begin
    ParseDetilTransaksiCard;
    ParseDetilAdjustment;
  end;
end;

procedure TfrmAdjustmentCashback.dtAdjustmentKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    edtNoTrans.SetFocus;
//    ParseDataTransNoForAdjustCashbakToComboBox;
  end;
end;

//procedure TfrmAdjustmentCashback.ParseDataTransNoForAdjustCashbakToComboBox;
//var
//  sSQL: string;
//  data: TDataSet;
//begin
//  with cbpTransNo do
//  begin
//    ClearGridData;
//    RowCount := 3;
//    ColCount := 3;
//    AddRow(['id','TRANSACTION NO.','TRANSACTION DATE']);
//
//    sSQL := 'SELECT ADJCASH_TRANS_NO, TRANS_DATE, ADJCASH_ID '
//      + 'FROM ADJUSTMENT_CASHBACK '
//      + ' LEFT OUTER JOIN TRANSAKSI ON (TRANS_NO=ADJCASH_TRANS_NO) '
//      + '   AND (TRANS_UNT_ID=ADJCASH_TRANS_UNT_ID) '
//      + ' WHERE ADJCASH_DATE = ' + QuotD(dtAdjustment.Date)
//      + ' AND ADJCASH_UNT_ID = ' + IntToStr(masternewunit.id);
//    data := cOpenQuery(sSQL);
//
//    if not (data.IsEmpty) then
//    begin
//      data.Last;
//      data.First;
//      while not data.Eof do
//      begin
//        RowCount := data.RecordCount + 2;
//        AddRow([data.FieldByName('ADJCASH_ID').AsString,data.FieldByName('ADJCASH_TRANS_NO').AsString,
//          FormatDateTime('dd-mm-yyyy',data.FieldByName('TRANS_DATE').AsDateTime)]);
//
//        data.Next;
//      end;
//    end
//    else
//    begin
//      AddRow(['0','   ','   ']);
//    end;
//
//    FixedRows := 1;
//    SizeGridToData;
//    ShowSpeedButton := false;
//  end;
//end;

procedure TfrmAdjustmentCashback.ParseDetilTransaksiCard;
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
    + ' AND TRANS_UNT_ID = ' + IntToStr(masternewunit);
  {
  data := cOpenQuery(sSQL);

  if not (data.IsEmpty) then
  begin
    with data do
    begin
      First;
      edtMemberCode.Text := FieldByName('MEMBER_CARD_NO').AsString;
      edtMemberName.Text := FieldByName('MEMBER_NAME').AsString;
      edtCashierCode.Text := FieldByName('USR_USERNAME').AsString;
      edtCashierName.Text := FieldByName('USR_FULLNAME').AsString;
      edtPOSCode.Text := FieldByName('SETUPPOS_TERMINAL_CODE').AsString;
      edtShiftCode.Text := FieldByName('SHIFT_NAME').AsString;

      edtCardCode.Text := FieldByName('CARD_CODE').AsString;
      edtCardNo.Text := FieldByName('TRANSC_NOMOR').AsString;
      edtCardName.Text := FieldByName('CARD_NAME').AsString;
      edtCardAuthorize.Text := FieldByName('TRANSC_NO_OTORISASI').AsString;

      dtTransact.Date := FieldByName('TRANS_DATE').AsDateTime;
      curredtTotalTransact.Value := FieldByName('TRANS_TOTAL_TRANSACTION').AsCurrency;
      curredtPaymentCard.Value := FieldByName('TRANS_BAYAR_CARD').AsCurrency;
      curredtCashbackBefore.Value := FieldByName('TRANSC_CASHBACK_NILAI').AsCurrency;
    end;
  end;
  }
end;

procedure TfrmAdjustmentCashback.ParseDetilAdjustment;
begin
  {
  with TAdjustmentCashback.CreateWithUser(Self,FLoginId,masternewunit.id) do
  begin
    try
      if LoadByID(FidAdj,masternewunit.id) then
      begin
        curredtAdjustValue.Value := Value;
        edtNote.Text := Note;
        curredtCashbackActually.Value := Actually;
      end;
    finally
      Free;
    end;   
  end;    // with
  }
end;

procedure TfrmAdjustmentCashback.ClearData;
begin
  edtMemberCode.Clear;
  edtMemberName.Clear;
  edtCashierCode.Clear;
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
  curredtCashbackBefore.Clear;

  curredtAdjustValue.Clear;
  edtNote.Clear;
  curredtCashbackActually.Clear;
end;

procedure TfrmAdjustmentCashback.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Key = vk_F5) or (Key = vk_return))  then
    LookUpData(ActiveControl, Key);
end;

function TfrmAdjustmentCashback.GetIDAdj: Integer;
//var
//  iAid: Integer;
//  sSQL: string;
begin
  Result := 0;
//  sSQL := 'SELECT ADJCASH_ID, ADJCASH_TRANS_NO, TRANS_DATE '
//        + 'FROM ADJUSTMENT_CASHBACK '
//        + ' LEFT OUTER JOIN TRANSAKSI ON (TRANS_NO=ADJCASH_TRANS_NO) '
//        + '   AND (TRANS_UNT_ID=ADJCASH_TRANS_UNT_ID) '
//        + ' WHERE ADJCASH_DATE = ' + TApputils.QuotD(dtAdjustment.Date)
//        + ' AND ADJCASH_UNT_ID = ' + IntToStr(masternewunit)
//        + ' and ADJCASH_TRANS_NO = '+ QuotedStr(edtNoTrans.Text);
  {
  with cOpenQuery(sSQL) do
  begin
    try
      if not Eof then
      begin
        iAid := Fields[0].AsInteger;
      end
      else
        iAid  := 0;
    finally
      Free;
    end;
  end;

  Result := iAid;
  }
end;

procedure TfrmAdjustmentCashback.LookUpData(sender:TObject; Key: Word);
var
  sSQL: string;
begin
  if sender = edtNoTrans then
  begin
    if Key = vk_F5 then
    begin
      FidAdj  := 0;
      sSQL := 'SELECT ADJCASH_TRANS_NO, TRANS_DATE, ADJCASH_ID '
            + 'FROM ADJUSTMENT_CASHBACK '
            + ' LEFT OUTER JOIN TRANSAKSI ON (TRANS_NO=ADJCASH_TRANS_NO) '
            + '   AND (TRANS_UNT_ID=ADJCASH_TRANS_UNT_ID) '
            + ' WHERE ADJCASH_DATE = ' + TApputils.QuotD(dtAdjustment.Date)
            + ' AND ADJCASH_UNT_ID = ' + IntToStr(masternewunit);
      {
      with cLookUp('Data Adjustment Cashback', sSQL, 200, 2,True) do
      begin
        if Strings[0] <> '' then
        begin
          edtNoTrans.Text := Strings[0];
          FidAdj          := StrToInt(Strings[2]);
          LookUpData(Sender, VK_RETURN);
        end
        else
          ClearData;
          
      end;
      }
    end
    else if Key = vk_Return then
    begin
      ParseDetilTransaksiCard;
      ParseDetilAdjustment;

      if FidAdj = 0  then
        FidAdj  := GetIDAdj;
        
    end;    
  end;  
end;

end.


