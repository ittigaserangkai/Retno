unit ufrmDialogBeginningBalancePOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ExtCtrls, StdCtrls, System.Actions, Vcl.ActnList,
  ufraFooterDialog3Button, cxGraphics, cxControls, cxLookAndFeels, Data.DB,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxCurrencyEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogBeginBalancePOS = class(TfrmMasterDialog)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    cbpCashierID: TcxExtLookupComboBox;
    curredtBeginBalance: TcxCurrencyEdit;
    edtDescrp: TEdit;
    cbpPosCode: TcxExtLookupComboBox;
    edtCashierName: TEdit;
    procedure actDeleteExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbpCashierIDCloseUp(Sender: TObject);
    procedure curredtBeginBalanceEnter(Sender: TObject);
  private
    { Private declarations }
    FKasirUsrNm : string;
    FIsProcessSuccessfull: boolean;
    FFormMode: TFormMode;
    dataUser,dataSetupPos: TDataSet;

    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure LoadDropDownData(ACombo: TcxExtLookupComboBox; AColsOfData: Integer; aTgl :
        TDateTime);
  public
    { Public declarations }
    Balance_ID: Integer;
    Balance_Shift_ID: Integer;
    Balance_Shift_Date: TDateTime;
    PosCode,CashierID, CashierName: string;
    Modal: Currency;
    Descrpt: string;
//    FTgl: TDateTime;

  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogBeginBalancePOS: TfrmDialogBeginBalancePOS;

implementation

uses uConstanta, uTSCommonDlg, uRetnoUnit, ufrmBeginningBalancePOS;

{$R *.dfm}

procedure TfrmDialogBeginBalancePOS.actDeleteExecute(Sender: TObject);
begin
  inherited;
  {
  if (strgGrid.Cells[_kolBegBal_ID,strgGrid.Row] = '0') or (strgGrid.Cells[_kolPosCode,strgGrid.Row] = '') then Exit;

  if IsBeginningBalanceUsed(StrToInt(strgGrid.Cells[_kolBegBal_ID,strgGrid.Row]),masternewunit.id) then
  begin
    CommonDlg.ShowMessage('Kasir sudah transaksi, tidak bisa dihapus.');
    Exit;
  end;

  if (CommonDlg.Confirm('Are you sure you wish to delete POS Beginning Balance (POS CODE: '+ strgGrid.Cells[1,strgGrid.Row] +')?') = mrYes) then
  begin
    with TBeginningBalance.Create(Self) do
    begin
      try
        if LoadByID(StrToInt(strgGrid.Cells[_kolBegBal_ID,strgGrid.Row]),masternewunit.id) then
        begin
          if RemoveFromDB then
          begin
            cCommitTrans;
            CommonDlg.ShowMessage(CONF_DELETE_SUCCESSFULLY);
            actRefreshBeginBalancePOSExecute(Self);
          end
          else
          begin
            cRollbackTrans;
            CommonDlg.ShowMessage(CONF_COULD_NOT_DELETE);
          end;
        end;
      finally
        Free;
      end;
    end;
  end;  //end confirm
  }
end;

procedure TfrmDialogBeginBalancePOS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogBeginBalancePOS.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogBeginBalancePOS := nil;
end;

procedure TfrmDialogBeginBalancePOS.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogBeginBalancePOS.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogBeginBalancePOS.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;
  //init

  if(cbpPosCode.Text = '') then
  begin
    CommonDlg.ShowErrorEmpty('POS CODE');
    cbpPosCode.SetFocus;
    Exit;
  end;

  if(cbpCashierID.Text = '') then
  begin
    CommonDlg.ShowErrorEmpty('CASHIER ID');
    cbpCashierID.SetFocus;
    Exit;
  end;
  {
  if not IsValidDateKarenaEOD(dialogunit,frmBeginningBalancePOS.dt1.Date,FMasterIsStore) then
    Exit;

  IsProcessSuccessfull := False;

  with TBeginningBalance.CreateWithUser(Self,FLoginId,dialogunit) do
  begin
    try
      UpdateData(dialogunit,
        edtDescrp.Text,
        Balance_ID,
        StrToInt(CashierID),
        dialogunit,
        curredtBeginBalance.Value,
        StrToInt(cbpPosCode.Cells[0,cbpPosCode.Row]),
        Balance_Shift_ID,
        Balance_Shift_Date,
        'OPEN'
        );

      if IsPOSIniSudahDisettingBBnya and (FormMode=fmAdd) then
      begin
        CommonDlg.ShowError('POS Ini Sudah Disetting Beginning Balance-nya');
        cbpPosCode.SetFocus;
        Exit;
      end;

      if IsKasirIniSudahDisettingBBnya  and (FormMode=fmAdd) then
      begin
        CommonDlg.ShowError('Kasir Ini Sudah Disetting Beginning Balance-nya');
        cbpCashierID.SetFocus;
        Exit;
      end;

      if IsKasirIniSudahDiShiftLain and (FormMode=fmAdd) then
      begin
        CommonDlg.ShowError('Kasir Ini Sudah Digunakan di shift lain');
        cbpPosCode.SetFocus;
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
      end;    
    finally
      Free;
    end;
  end;
   }
  Close;
end;

procedure TfrmDialogBeginBalancePOS.FormShow(Sender: TObject);
begin
  inherited;
  {if not Assigned(BeginningBalancePOS) then
    BeginningBalancePOS := TBeginningBalancePOS.Create;

  dataSetupPos := BeginningBalancePOS.GetListDataSetupPos(dialogunit);
  LoadDropDownData(cbpPosCode,dataSetupPos.RecordCount, Balance_Shift_Date);

  dataUser := BeginningBalancePOS.GetListDataUser(dialogunit);
  LoadDropDownData(cbpCashierID,dataUser.RecordCount, Balance_Shift_Date);

  if FormMode = fmEdit then
  begin
    cbpPosCode.Value    := PosCode;
    cbpPosCode.Enabled  := False;

    cbpCashierID.Text         := FKasirUsrNm;
    cbpCashierID.Enabled      := False;
    edtCashierName.Text       := CashierName;
    curredtBeginBalance.Value := Modal;
    edtDescrp.Text            := Descrpt;
  end
  else
  begin
    cbpCashierID.Enabled      := True;
    cbpPosCode.Enabled        := True;
    curredtBeginBalance.Value := BEGINNING_BALANCE_MODAL;
    edtDescrp.Text := '';
  end;
   }
end;

procedure TfrmDialogBeginBalancePOS.LoadDropDownData(ACombo: TcxExtLookupComboBox;
    AColsOfData: Integer; aTgl : TDateTime);
var
  sSQL: string;
begin
  {ACombo.ClearGridData;

  ACombo.RowCount := 2;
  ACombo.ColCount := 2;

  if ACombo = cbpCashierID then
  begin
    ACombo.AddRow(['ID','CASHIER ID', 'CASHIER NAME']);

    if dataUser.RecordCount > 0 then
    begin
      ACombo.RowCount := dataUser.RecordCount + 1;
      dataUser.First;
      while not dataUser.Eof do
      begin
        try
          ACombo.AddRow([dataUser.FieldByName('USR_ID').AsString,
                         dataUser.FieldByName('USR_USERNAME').AsString,
                         dataUser.FieldByName('USR_FULLNAME').AsString]);

          if (LowerCase(TcxExtLookupComboBox(ACombo).Name) = LowerCase('cbpCashierID'))
              and (FormMode = fmEdit) then
            if dataUser.FieldByName('USR_ID').AsInteger = StrToInt(CashierID) then
              FKasirUsrNm := dataUser.FieldByName('USR_USERNAME').AsString;

        except
        end;

        dataUser.Next;
      end;// end while
    end// if comptt
    else
    begin
      ACombo.RowCount := 2;
      ACombo.AddRow(['','']);
    end;

  end; //end if acombo

  if ACombo = cbpPosCode then
  begin
    ACombo.AddRow(['ID','POS CODE']);
    sSQL := 'SELECT SETUPPOS_ID, SETUPPOS_TERMINAL_CODE '
            + 'FROM SETUPPOS '
            + 'WHERE SETUPPOS_IS_ACTIVE = 1 '
            + ' and SETUPPOS_UNT_ID = ' + IntToStr(dialogunit)
            + ' and setuppos_date = ' + QuotD(aTgl)
            + ' ORDER BY SETUPPOS_TERMINAL_CODE';

    with cOpenQuery(sSQL) do
    begin
      try
        LAST;
        FIRST;
        if RecordCount > 0 then
        begin
          ACombo.RowCount := RecordCount + 1;
          dataSetupPos.First;
          while not Eof do
          begin
            try
              ACombo.AddRow([FieldByName('SETUPPOS_ID').AsString,
                             FieldByName('SETUPPOS_TERMINAL_CODE').AsString]);
            except
            end;

            Next;
          end;// end while
        end// if comptt
        else
        begin
          ACombo.RowCount := 2;
          ACombo.AddRow(['','']);
        end;

      finally
        Free;
      end;
    end;




  end; //end if acombo

  ACombo.SizeGridToData;
  ACombo.FixedRows:= 1;
  }
end;

procedure TfrmDialogBeginBalancePOS.cbpCashierIDCloseUp(Sender: TObject);
begin
  inherited;
//  CashierID := cbpCashierID.Cells[0,cbpCashierID.Row];
end;

procedure TfrmDialogBeginBalancePOS.curredtBeginBalanceEnter(
  Sender: TObject);
begin
  inherited;
  curredtBeginBalance.SelectAll;
end;

end.





