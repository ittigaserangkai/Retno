unit ufrmCashDropping;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, ActnList,
  System.Actions, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, ufraFooter4Button, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, ufrmMaster;

type
  TfrmCashDropping = class(TfrmMasterBrowse)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    edtShift: TEdit;
    dt1: TcxDateEdit;
    pnl3: TPanel;
    lbl3: TLabel;
    lbl4: TLabel;
    edtCashierName: TEdit;
    edtSupervisor: TEdit;
    lbl8: TcxLabel;
    lbl5: TLabel;
    pnl5: TPanel;
    lbl16: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lbl8Click(Sender: TObject);
    procedure edtShiftKeyPress(Sender: TObject; var Key: Char);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure FormShow(Sender: TObject);
    procedure edtShiftExit(Sender: TObject);
    procedure edtShiftEnter(Sender: TObject);
    procedure dt1Change(Sender: TObject);
    procedure edtShiftChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    dataCashDropp: TDataSet;
    bufShift: String;
    procedure ParseHeaderGrid(ARecCount: Integer);
    procedure ParseDataGrid();
    procedure ShowHistoryCashDropping();
    procedure ShowPanelInfo();
    procedure HidePanelInfo();
    procedure InitForm();
  public
    { Public declarations }
  end;

var
  frmCashDropping: TfrmCashDropping;

implementation

uses ufrmDialogCashDropping, uTSCommonDlg, ufrmPopupHistCD,  uConstanta,
  uRetnoUnit;

{$R *.dfm}

const
{POS CODE
CASHIER ID
CURRENT CASH DROPPING
CASH BACK
CASH DROPPING
PAYMENT CASH
PHYSICAL CASH
ASSALAAM VOUCHER
OTHER VOUCHER
CARD
}
  _kolPosCode           : Integer = 0;
  _KolCashierNm         : Integer = 1;
  _KolCashDroppingCurr  : integer = 2;
  _KolCashBack          : Integer = 3;
  _KolCashDropping      : Integer = 4;
  _kolPaymentCash       : Integer = 5;
  _KolPhysicalCash      : Integer = 6;
  _kolVoucherAss        : Integer = 7;
  _kolVoucherAth        : Integer = 8;
  _kolCard              : Integer = 9;
  _kolBalanceID         : Integer = 10;
  _kolCashierId         : Integer = 11;
  _kolCashierFullNm     : Integer = 12;




procedure TfrmCashDropping.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ////frmMain.DestroyMenu((Sender as TForm));
  Action := caFree;
end;

procedure TfrmCashDropping.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'CASH DROPPING';
  ShowPanelInfo();
end;

procedure TfrmCashDropping.ShowPanelInfo();
begin
  pnl5.Align := alClient;
  pnl5.Visible := true;
  edtCashierName.Clear;
end;

procedure TfrmCashDropping.InitForm();
begin
  dt1.Date := Now;
  edtCashierName.Clear;
  edtSupervisor.Clear;
  edtShift.Text := '';
  edtSupervisor.Text := FLoginFullname;
end;

procedure TfrmCashDropping.FormDestroy(Sender: TObject);
begin
  inherited;
  frmCashDropping := nil;
end;

procedure TfrmCashDropping.ParseDataGrid;
var intI: Integer;
  sSQL: string;
  tempBool: Boolean;
begin
  // cek if shift name exist
  {with TNewShift.Create(Self) do
  begin
    try
      if not LoadByName(edtShift.Text,masternewunit.id) then
      begin
        CommonDlg.ShowError(ER_SHIFT_NOT_FOUND);
        ShowPanelInfo();
        edtShift.Text:= bufShift;
        edtShift.SelectAll;
        Exit;
      end;
    finally
      Free;
    end;
  end;    // with

  HidePanelInfo();

  sSQL := 'SELECT BB.BALANCE_ID AS BALANCE_ID, '
    + 'SP.SETUPPOS_TERMINAL_CODE AS POS_CODE, '
    + 'BB.BALANCE_USR_ID AS CASHIER_ID, '
    + 'SUM (CD.CASHDROP_TOTAL) AS TOTAL_CASHDROP, '
    + 'USR_CASHIER.USR_FULLNAME AS CASHIER_FULLNAME, '
    + 'USR_CASHIER.USR_USERNAME AS CASHIER_NAME '
    + 'FROM BEGINNING_BALANCE BB '
    + ' LEFT OUTER JOIN CASH_DROPPING CD ON CD.CASHDROP_BALANCE_ID = BB.BALANCE_ID '
    + ' INNER JOIN SETUPPOS SP ON SP.SETUPPOS_ID = BB.BALANCE_SETUPPOS_ID '
    + ' INNER JOIN AUT$USER USR_CASHIER ON USR_CASHIER.USR_ID = BB.BALANCE_USR_ID '
    + ' INNER JOIN SHIFT SHFT ON SHFT.SHIFT_ID = BB.BALANCE_SHIFT_ID '
    + 'WHERE BB.BALANCE_SHIFT_DATE = ' + QuotD(dt1.Date)
    + ' AND SHFT.SHIFT_NAME = ' + Quot(edtShift.Text)
    + ' AND SP.SETUPPOS_IS_ACTIVE = 1 '
    + ' AND BB.BALANCE_STATUS = ' + Quot('OPEN')
    + 'GROUP BY BB.BALANCE_ID,BB.BALANCE_USR_ID, '
    + 'SP.SETUPPOS_TERMINAL_CODE, USR_CASHIER.USR_FULLNAME, BB.BALANCE_SHIFT_ID, '
    + 'USR_CASHIER.USR_USERNAME '
    + 'ORDER BY SETUPPOS_TERMINAL_CODE';
  dataCashDropp := cOpenQuery(sSQL);
  if not dataCashDropp.Eof then
  begin
    dataCashDropp.Last;
    dataCashDropp.First;
  end;

  ParseHeaderGrid(dataCashDropp.RecordCount);
  with strgGrid do begin
    if dataCashDropp.RecordCount > 0 then
    begin
      FloatingFooter.Visible := True;
      intI := 1;
      dataCashDropp.First;
      while not(dataCashDropp.Eof) do
      begin  
        Cells[_kolPosCode,intI] := dataCashDropp.FieldByName('POS_CODE').AsString;
        Cells[_KolCashierNm,intI] := dataCashDropp.FieldByName('CASHIER_NAME').AsString;
        Cells[_KolCashDroppingCurr,intI] := CurrToStr(dataCashDropp.FieldByName('TOTAL_CASHDROP').AsFloat);

        Cells[_kolBalanceID,intI] := dataCashDropp.FieldByName('BALANCE_ID').AsString;
        Cells[_kolCashierId,intI] := dataCashDropp.FieldByName('CASHIER_ID').AsString;
        Cells[_kolCashierFullNm,intI] := dataCashDropp.FieldByName('CASHIER_FULLNAME').AsString;

        with TNewFinalPayment.Create(Self) do
        begin
          try
            LoadPOSTransaction(masternewunit.id,dt1.Date,edtShift.Text,Cells[_kolPosCode,intI]);

            if FinalPaymentPOSItems.Count > 0 then
            begin
              Cells[_KolCashBack,intI]      := CurrToStr(FinalPaymentPOSItems[0].CashBack);
              Cells[_kolPaymentCash,intI]   := CurrToStr(FinalPaymentPOSItems[0].CashPayment);
              Cells[_KolCashDropping,intI]  := CurrToStr(FinalPaymentPOSItems[0].CashDropping);
              Cells[_kolVoucherAss,intI]    := CurrToStr(FinalPaymentPOSItems[0].VoucherGoro);
              Cells[_KolPhysicalCash,intI]  := CurrToStr(FinalPaymentPOSItems[0].CashPhysical);
              Cells[_kolVoucherAth,intI]    := CurrToStr(FinalPaymentPOSItems[0].VoucherLain);
              Cells[_KolCard,intI]          := CurrToStr(FinalPaymentPOSItems[0].CardCredit +
                                                  FinalPaymentPOSItems[0].CardDebit);
            end;
          finally
            Free;
          end;
        end;

        Inc(intI);
        dataCashDropp.Next;
      end;

      // sum the grid column
      FloatingFooter.ColumnCalc[_kolPosCode]          := acNONE;
      FloatingFooter.ColumnCalc[_KolCashierNm]        := acNONE;
      FloatingFooter.ColumnCalc[_KolCashDroppingCurr] := acSUM;
      FloatingFooter.ColumnCalc[_KolCashBack]         := acSUM;
      FloatingFooter.ColumnCalc[_KolCashDropping]     := acSUM;
      FloatingFooter.ColumnCalc[_kolPaymentCash]      := acSUM;
      FloatingFooter.ColumnCalc[_KolPhysicalCash]     := acSUM;
      FloatingFooter.ColumnCalc[_kolVoucherAss]       := acSUM;
      FloatingFooter.ColumnCalc[_kolVoucherAth]       := acSUM;
      FloatingFooter.ColumnCalc[_KolCard]             := acSUM;


      tempBool := True;
      strgGridRowChanging(Self,0,1,tempBool);
    end
    else
    begin
      FloatingFooter.Visible := False;
    end;
    FixedRows := 1;
    AutoSize := True;
  end;
  }
end;

procedure TfrmCashDropping.ParseHeaderGrid(ARecCount: Integer);
begin
  {with strgGrid do
  begin
    Clear;
    ColCount := 10;
    RowCount := ARecCount + 2;
    Cells[_kolPosCode,0]          := 'POS CODE';
    Cells[_KolCashierNm,0]        := 'CASHIER ID';
    Cells[_KolCashDroppingCurr,0] := 'CURRENT DROPPING';
    Cells[_KolCashBack ,0]        := 'CASH BACK';
    Cells[_KolCashDropping,0]     := 'DROPPING';
    Cells[_kolPaymentCash,0]      := 'PAYMENT';
    Cells[_KolPhysicalCash,0]     := 'PHYSICAL';
    Cells[_kolVoucherAss,0]       := 'ASSALAAM VOUCHER';
    Cells[_kolVoucherAth,0]       := 'OTHER VOUCHER';
    Cells[_KolCard,0]             := 'CARD';

    if(ARecCount < 1) then
    begin
      RowCount := 2;

      Cells[_kolPosCode,1]          := '';
      Cells[_KolCashierNm,1]        := '';
      Cells[_KolCashDroppingCurr,1] := '';
      Cells[_KolCashBack ,1]        := '';
      Cells[_KolCashDropping,1]     := '';
      Cells[_kolPaymentCash,1]      := '';
      Cells[_KolPhysicalCash,1]     := '';
      Cells[_kolVoucherAss,1]       := '';
      Cells[_kolVoucherAth,1]       := '';
      Cells[_KolCard,1]             := '';
      Cells[_kolBalanceID,1]        := '0';
      Cells[_kolCashierId,1]        := '0';
      Cells[_kolCashierFullNm,1]    := '';
    end;
  end;
  }
end;

procedure TfrmCashDropping.actAddExecute(Sender: TObject);
begin
  inherited;
 // check if balance ID found?
  {
  if(strgGrid.cells[_kolBalanceID,strgGrid.Row]='0')or(strgGrid.cells[_kolBalanceID,strgGrid.Row]='')
  then Exit;

  if not assigned(frmDialogCashDropping) then
    Application.CreateForm(TfrmDialogCashDropping, frmDialogCashDropping);

  frmDialogCashDropping.Caption := 'Add Cash Dropping';
  frmDialogCashDropping.FormMode := fmAdd;
  frmDialogCashDropping.balanceID := StrToInt(strgGrid.cells[_kolBalanceID,strgGrid.Row]);
  frmDialogCashDropping.supervisorID := FLoginId;
  frmDialogCashDropping.edtPOSCode.Text := strgGrid.cells[0,strgGrid.Row];
  frmDialogCashDropping.edtCashierID.Text := strgGrid.cells[_KolCashierNm,strgGrid.Row];
  frmDialogCashDropping.ShiftID := edtShift.Text;
  frmDialogCashDropping.ShiftDate := dt1.Date;
  SetFormPropertyAndShowDialog(frmDialogCashDropping);

  if (frmDialogCashDropping.IsProcessSuccessfull) then
  begin
    actRefreshCashDroppingExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atAdd);
  end;

  frmDialogCashDropping.Free;
  }
end;

procedure TfrmCashDropping.actRefreshExecute(Sender: TObject);
begin
  inherited;
  ParseDataGrid();
end;

procedure TfrmCashDropping.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F7) then
  begin
    ShowHistoryCashDropping;
  end;
end;

procedure TfrmCashDropping.ShowHistoryCashDropping;
begin
  {
  // check if row selected
  if(strgGrid.cells[_kolBalanceID,strgGrid.Row] = '0') then Exit;

  if not assigned(frmPopupHistCD) then
    frmPopupHistCD := TfrmPopupHistCD.Create(Application);

  //writing data
  frmPopupHistCD.Unit_ID := masternewunit.id;
  frmPopupHistCD.balanceID := StrToInt(strgGrid.cells[_kolBalanceID,strgGrid.Row]);
  frmPopupHistCD.balanceDate := dt1.Date;
  frmPopupHistCD.balancePOSCode := strgGrid.cells[0,strgGrid.Row];
  frmPopupHistCD.balanceShiftName := edtShift.Text;
  frmPopupHistCD.balanceCashierName := strgGrid.cells[_KolCashierNm, strgGrid.Row];
  frmPopupHistCD.balanceCashierFullName := edtCashierName.Text;

  frmPopupHistCD.ShowModal;
  frmPopupHistCD.Free;
  }
end;

procedure TfrmCashDropping.lbl8Click(Sender: TObject);
begin
  inherited;
  ShowHistoryCashDropping;
end;

procedure TfrmCashDropping.edtShiftKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    bufShift := edtShift.Text;
    if edtShift.Text <> '' then
      edtShiftExit(Self);
  end;
end;

procedure TfrmCashDropping.strgGridRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  inherited;
//  edtCashierName.Text := strgGrid.Cells[_kolCashierFullNm,NewRow];
end;

procedure TfrmCashDropping.FormShow(Sender: TObject);
begin
  inherited;
  InitForm();
end;

procedure TfrmCashDropping.HidePanelInfo();
begin
  pnl5.Visible := False;
end;

procedure TfrmCashDropping.edtShiftExit(Sender: TObject);
begin
  inherited;
  if edtShift.Text <> '' then
  begin
    ParseDataGrid();
  end;
end;

procedure TfrmCashDropping.edtShiftEnter(Sender: TObject);
begin
  inherited;
  bufShift := edtShift.Text;
end;

procedure TfrmCashDropping.dt1Change(Sender: TObject);
begin
  inherited;
  // try to parse data
  edtShiftExit(Self);
end;

procedure TfrmCashDropping.edtShiftChange(Sender: TObject);
begin
  inherited;
  ShowPanelInfo;
end;

procedure TfrmCashDropping.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
  if(Key = Ord('C')) and (ssctrl in Shift) then
    actAddExecute(Self)
  else if(Key = VK_F5) and (ssctrl in Shift) then
    actRefreshExecute(Self)
  else if(Key = VK_F7) then
    ShowHistoryCashDropping
  else if(Key = VK_Escape) then
    Close;
end;

end.


