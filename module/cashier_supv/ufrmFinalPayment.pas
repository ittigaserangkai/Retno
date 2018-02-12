unit ufrmFinalPayment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, Mask, ActnList,
   cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,  System.Actions,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  Datasnap.DBClient, cxSpinEdit, cxTimeEdit;

type
//  TStringArray = array of string;
//  TFloatArray = array of Double;
                                          
  TfrmFinalPayment = class(TfrmMasterBrowse)
    pnl3: TPanel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl7: TcxLabel;
    lblTime: TLabel;
    pnl5: TPanel;
    lbl16: TLabel;
    edtShift: TcxTextEdit;
    edtClock: TcxTimeEdit;
    Timer1: TTimer;
    edtSupervisor: TcxTextEdit;
    edtCashierName: TcxTextEdit;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure cxGridViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
        APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
        ANewItemRecordFocusingChanged: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lbl7Click(Sender: TObject);
    procedure edtShiftKeyPress(Sender: TObject; var Key: Char);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure FormShow(Sender: TObject);
    procedure fraFooter5Button1btnUpdateClick(Sender: TObject);
    procedure dtDateKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fraFooter5Button1btnPrintClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
//    dataBeginningBlnc: TDataSet;
    FCDS: TClientDataSet;
    function IsShiftExist: Boolean;
//    dataFinPay: TResultDataSet;
    procedure ShowPopUpHistoryCashDropFinalPay();
    property CDS: TClientDataSet read FCDS write FCDS;
  public
    FShiftID: string;
    procedure RefreshData; override;
     function GetAddedValue(BalanceID, BalanceUnitID: Integer): TStrings;
    procedure ParseHeaderGrid(jmlData: Integer);
    procedure ParseDataGrid();
    procedure ParseFooterGrid;
    procedure PrintFinalPayment(BalanceID, BalanceUnitID: Integer);
  end;

var
  frmFinalPayment: TfrmFinalPayment;

implementation

uses
  ufrmDialogFinalPayment, uTSCommonDlg, ufrmPopupHistCDFP, uRetnoUnit, uDXUtils,
  uModShift, uDMClient, uAppUtils, uConstanta, uDBUtils;

{$R *.dfm}
const
{POS CODE
CASHIER ID
CURR. DROPPING
CASH BACK
PAYMENT
PHYSICAL
VOUCHER
OTHER VOUCHER
CARD
DISCOUNT CARD
LAST FINAL PAY.
}
    _KolPosCode       : Integer = 0;
    _KolCashierID     : Integer = 1;
    _KolCashDropping  : Integer = 2;
    _KolCashBack      : Integer = 3;
    _KolPaymenCash    : Integer = 4;
    _KolPhysicalCash  : Integer = 5;
    _KolAssVoucher    : Integer = 6;
    _KolOtherVoucher  : Integer = 7;
    _KolCard          : Integer = 8;
    _kolDiscCC        : Integer = 9;
    _KolFPay          : Integer = 10;
    _KolStatus        : Integer = 11;
    _KolBegBalance    : Integer = 12;
    _KolBegBalanceUnt : Integer = 13;
    _KolCashierNm     : Integer = 14;
    _KolFPayID        : Integer = 15;

    _ColCount         : Integer = 16;
    _fixedRow         : Integer = 1;


procedure TfrmFinalPayment.actAddExecute(Sender: TObject);
//var BalanceID ,BalanceUntID : Integer;
begin
  inherited;
  {TryStrToInt(strgGrid.cells[_KolBegBalance,strgGrid.Row], BalanceID);
  TryStrToInt(strgGrid.cells[_KolBegBalanceUnt,strgGrid.Row], BalanceUntID);

  if (strgGrid.cells[_KolBegBalance,strgGrid.Row] = '0') or
     (strgGrid.Cells[_KolStatus,strgGrid.Row] = 'OPEN') then
  begin
    CommonDlg.ShowMessage('Status masih OPEN!' + #13
            + 'Lakukan RESET CASHIER terlebih dahulu');
    Exit;
  end;

  if (strgGrid.cells[_KolFPayID,strgGrid.Row] <> '0') then
  begin
    CommonDlg.ShowMessage('Sudah pernah dilakukan Final Payment');
    Exit;
  end;

  if not assigned(frmDialogFinalPayment) then
    Application.CreateForm(TfrmDialogFinalPayment, frmDialogFinalPayment);

  frmDialogFinalPayment.Caption := 'Add Final Payment';
  frmDialogFinalPayment.FormMode          := fmAdd;
  frmDialogFinalPayment.balanceID         := BalanceID; //StrToInt(strgGrid.cells[_KolBegBalance,strgGrid.Row]);
  frmDialogFinalPayment.balanceUnitID     := BalanceUntID; //StrToInt(strgGrid.cells[_KolBegBalanceUnt,strgGrid.Row]);
  frmDialogFinalPayment.posCode           := strgGrid.cells[_KolPosCode,strgGrid.Row];
  frmDialogFinalPayment.cashierID         := strgGrid.cells[_KolCashierID,strgGrid.Row];
  frmDialogFinalPayment.totalFinalPayment := StrToCurr(strgGrid.cells[_KolPhysicalCash, strgGrid.Row]);
  frmDialogFinalPayment.NominalSisa       := StrToCurr(strgGrid.Cells[_KolPhysicalCash, strgGrid.Row]);
  frmDialogFinalPayment.NominalEdit       := 0;
  SetFormPropertyAndShowDialog(frmDialogFinalPayment);

  if (frmDialogFinalPayment.IsProcessSuccessfull) then
  begin
    actRefreshExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atAdd);
    PrintFinalPayment(BalanceID, BalanceUntID);
  end;
  frmDialogFinalPayment.Free;
  }
  if VarIsNull(edtShift.EditValue) then
  begin
    CommonDlg.ShowMessage('Shift harap di isi dulu');
    edtShift.SetFocus;
    Exit;
  end;
  if CDS.FieldByName('BALANCE_STATUS').AsString = 'OPEN' then
  begin
    CommonDlg.ShowMessage('Status masih OPEN!'+ #13+'Lakukan RESET CASHIER terlebih dahulu');
    Exit;
  end;
  if not VarIsNull(CDS.FieldByName('FINAL_PAYMENT_ID').Value) then
  begin
    CommonDlg.ShowMessage('Sudah pernah dilakukan Final Payment');
    Exit;
  end;

  ShowDialogForm(TfrmDialogFinalPayment, CDS.FieldByName('BEGINNING_BALANCE_ID').AsString);
end;

procedure TfrmFinalPayment.actEditExecute(Sender: TObject);
begin
  inherited;
  if VarIsNull(CDS.FieldByName('FINAL_PAYMENT_ID').Value) then
  begin
    CommonDlg.ShowMessage('Belum pernah dilakukan Final Payment');
    Exit;
  end;

  ShowDialogForm(TfrmDialogFinalPayment, CDS.FieldByName('BEGINNING_BALANCE_ID').AsString);
end;

procedure TfrmFinalPayment.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'FINAL PAYMENT';
  ClearByTag([0]);
  AutoRefreshData := true;

//  dtDate.Date := now;
//  edtSupervisor.Text := FLoginFullname;
//  pnl5.Align := alClient;
//  pnl5.Visible := true;
//  ParseHeaderGrid(0);
end;

procedure TfrmFinalPayment.FormDestroy(Sender: TObject);
begin
  inherited;
  frmFinalPayment := nil;
end;

procedure TfrmFinalPayment.ParseDataGrid;
//var
//  i: Integer;
//    tempBool: Boolean;
begin
  {with TNewFinalPayment.Create(Self) do
  begin
  	try
    	LoadPOSTransaction(masternewunit.id,dtDate.Date,edtShift.Text);
      ParseHeaderGrid(FinalPaymentPOSItems.Count);
      pnl5.Visible := False;
      for i := 0 to FinalPaymentPOSItems.Count - 1 do    // Iterate
      begin
        with strgGrid do
        begin

          Cells[_KolPosCode,i+1]        := FinalPaymentPOSItems[i].BeginningBalance.POS.Code;
          Cells[_KolCashierID,i+1]      := FinalPaymentPOSItems[i].CashierCode;
          Cells[_KolCashDropping,i+1]   := CurrToStr(FinalPaymentPOSItems[i].CashDropping);
          Cells[_KolCashBack,i+1]       := CurrToStr(FinalPaymentPOSItems[i].CashBack);
          Cells[_KolPaymenCash,i+1]     := CurrToStr(FinalPaymentPOSItems[i].CashPayment);
          Cells[_KolPhysicalCash,i+1]   := CurrToStr(
                                                FinalPaymentPOSItems[i].CashPhysical
                                              - FinalPaymentPOSItems[i].FinalPay
                                            );
          Cells[_KolAssVoucher,i+1]     := CurrToStr(FinalPaymentPOSItems[i].VoucherGoro);
          Cells[_KolOtherVoucher,i+1]   := CurrToStr(FinalPaymentPOSItems[i].VoucherLain +
                                                      FinalPaymentPOSItems[i].VoucherBotol);
          Cells[_KolCard,i+1]           := CurrToStr(FinalPaymentPOSItems[i].CardTotal);
          Cells[_kolDiscCC,i+1]           := CurrToStr(FinalPaymentPOSItems[i].TotalDiscCard);
          Cells[_KolFPay,i+1]           := CurrToStr(FinalPaymentPOSItems[i].FinalPay);
          Cells[_KolStatus,i+1]         := FinalPaymentPOSItems[i].BeginningBalance.Status;
          Cells[_KolBegBalance,i+1]     := IntToStr(FinalPaymentPOSItems[i].BeginningBalance.ID);
          Cells[_KolBegBalanceUnt,i+1]  := IntToStr(FinalPaymentPOSItems[i].BeginningBalance.NewUnit.ID);
          Cells[_KolCashierNm,i+1]      := FinalPaymentPOSItems[i].CashierName;
          Cells[_KolFPayID,i+1]         := IntToStr(FinalPaymentPOSItems[i].FinalPayID);
        end;
      end;
    finally
      Free;
    end;
  end;

  ParseFooterGrid;
  tempBool := True;
  strgGridRowChanging(Self,0,1,tempBool);
  }
end;

procedure TfrmFinalPayment.ParseHeaderGrid(jmlData: Integer);
begin
  {with strgGrid do
  begin
    Clear;
    RowCount := jmlData + 2;
    ColCount := _ColCount;

    Cells[_KolPosCode,0]      := 'POS CODE';
    Cells[_KolCashierID,0]    := 'CASHIER ID';
    Cells[_KolCashDropping,0] := 'CURR. DROPPING';
    Cells[_KolCashBack,0]     := 'CASH BACK';
    Cells[_KolPaymenCash,0]   := 'PAYMENT';
    Cells[_KolPhysicalCash,0] := 'PHYSICAL';
    Cells[_KolAssVoucher,0]   := 'ASSALAM VOUCHER';
    Cells[_KolOtherVoucher,0] := 'OTHER VOUCHER & BOTOL VOUCHER';
    Cells[_KolCard,0]         := 'CARD';
    Cells[_kolDiscCC,0]       := 'DISC CARD';
    Cells[_KolFPay,0]         := 'LAST FINAL PAY.';
    Cells[_KolStatus,0]       := 'Status';
    Cells[_KolBegBalance,0]   := 'BegBalance';
    Cells[_KolBegBalanceUnt,0]:= 'BegBalanceUnt';
    Cells[_KolCashierNm,0]    := 'CashierNm';
    Cells[_KolFPayID,0]       := 'FinPayID';

    if jmlData < 1 then
    begin
      RowCount := 3;
      Cells[_KolPosCode,1]        := '';
      Cells[_KolCashierID,1]      := '';
      Cells[_KolCashDropping,1]   := '';
      Cells[_KolCashBack,1]       := '';
      Cells[_KolPaymenCash,1]     := '';
      Cells[_KolPhysicalCash,1]   := '';
      Cells[_KolAssVoucher,1]     := '';
      Cells[_KolOtherVoucher,1]   := '';
      Cells[_KolCard,1]           := '';
      Cells[_kolDiscCC,1]         := '';
      Cells[_KolFPay,1]           := '';
      Cells[_KolStatus,1]         := '';
      Cells[_KolBegBalance,1]     := '0';  //BALANCE ID
      Cells[_KolBegBalanceUnt,1]  := '0';  //UNIT ID
      Cells[_KolCashierNm,1]      := '';  //CASHIER NAME
      Cells[_KolFPayID,1]         := '0';
    end;

    FixedRows := _fixedRow;
    AutoSize := true;
  end;
  }
end;

procedure TfrmFinalPayment.actRefreshExecute(Sender: TObject);
begin
  inherited;
//  ParseDataGrid();
end;

procedure TfrmFinalPayment.cxGridViewFocusedRecordChanged(Sender:
    TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord:
    TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  if Assigned(CDS) then
    if CDS.RecordCount > 0 then
      edtCashierName.EditValue := CDS.FieldByName('CASHIER').Value;
end;

procedure TfrmFinalPayment.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F7) then
    ShowPopUpHistoryCashDropFinalPay;
end;

procedure TfrmFinalPayment.ShowPopUpHistoryCashDropFinalPay;
begin
  if not assigned(frmPopupHistCDFP) then
    frmPopupHistCDFP := TfrmPopupHistCDFP.Create(Application);

//  frmPopupHistCDFP.balanceID := StrToInt(strgGrid.cells[_KolBegBalance,strgGrid.Row]);
//  frmPopupHistCDFP.UnitID := StrToInt(strgGrid.cells[_KolBegBalanceUnt,strgGrid.Row]);

  frmPopupHistCDFP.ShowModal;
  frmPopupHistCDFP.Free;
end;

procedure TfrmFinalPayment.lbl7Click(Sender: TObject);
begin
  inherited;
  ShowPopUpHistoryCashDropFinalPay;
end;

procedure TfrmFinalPayment.edtShiftKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    pnl5.Visible := false;
//    ParseDataGrid;
    cxGrid.SetFocus;
  end;
end;

procedure TfrmFinalPayment.strgGridRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  inherited;
//  edtCashierName.Text := strgGrid.Cells[_KolCashierNm,NewRow];
end;

procedure TfrmFinalPayment.FormShow(Sender: TObject);
begin
  inherited;
  edtShift.SetFocus;
end;

procedure TfrmFinalPayment.fraFooter5Button1btnUpdateClick(
  Sender: TObject);
begin
  inherited;
  {if (strgGrid.cells[_KolBegBalance,strgGrid.Row] = '0') or
     (strgGrid.Cells[_KolStatus,strgGrid.Row] = 'OPEN')
  then
  begin
    CommonDlg.ShowMessage('Status masih OPEN!' + #13
            + 'Lakukan RESET CASHIER terlebih dahulu');
    Exit;
  end;

  if (strgGrid.cells[_KolFPayID,strgGrid.Row] = '0') then
  begin
    CommonDlg.ShowMessage('Belum pernah dilakukan Final Payment');
    Exit;
  end;

  if not assigned(frmDialogFinalPayment) then
    Application.CreateForm(TfrmDialogFinalPayment, frmDialogFinalPayment);

  frmDialogFinalPayment.Caption  := 'Edit Final Payment';
  frmDialogFinalPayment.FormMode                    := fmEdit;
  frmDialogFinalPayment.balanceID                   := StrToInt(strgGrid.cells[_KolBegBalance,strgGrid.Row]);
  frmDialogFinalPayment.posCode                     := strgGrid.Cells[_KolPosCode, strgGrid.Row];
  frmDialogFinalPayment.cashierID                   := strgGrid.Cells[_KolCashierID, strgGrid.Row];
  frmDialogFinalPayment.totalFinalPayment           := StrToCurr(strgGrid.Cells[_KolFPay, strgGrid.Row]);
  frmDialogFinalPayment.NominalEdit                 := frmDialogFinalPayment.totalFinalPayment;
  frmDialogFinalPayment.NominalSisa                 := StrToCurr(strgGrid.Cells[_KolPhysicalCash, strgGrid.Row]);

  SetFormPropertyAndShowDialog(frmDialogFinalPayment);

  if (frmDialogFinalPayment.IsProcessSuccessfull) then
  begin
    actRefreshExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atEdit);
  end;
  frmDialogFinalPayment.Free;
  }
end;

procedure TfrmFinalPayment.dtDateKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    edtShift.SetFocus;
end;

procedure TfrmFinalPayment.fraFooter5Button1btnPrintClick(Sender: TObject);
//  var BalanceID,BalanceUntID : Integer;
begin
  inherited;
//  TryStrToInt(strgGrid.cells[_KolBegBalance,strgGrid.Row], BalanceID);
//  TryStrToInt(strgGrid.cells[_KolBegBalanceUnt,strgGrid.Row], BalanceUntID);
//  PrintFinalPayment(BalanceID, BalanceUntID);
end;

function TfrmFinalPayment.GetAddedValue(BalanceID, BalanceUnitID: Integer):
    TStrings;
//var i, RecNO:Integer;
//    CurrDropping,CashBack,Payment,Physical,Voucher,OtherVoucher,Card,DiscCard : Double;
begin
  {Result := TStringList.Create;
  RecNo := 0;
  for i:=strgGrid.FixedRows to strgGrid.Rowcount-1 do
  begin
    If (strgGrid.Cells[_KolBegBalance, i] = IntToStr(BalanceID) )
    and (strgGrid.Cells[_KolBegBalanceUnt, i] = IntToStr(BalanceUnitID) )  then
    begin
      RecNo := i;
      Break;
    end;
  end;
  TryStrToFloat(strgGrid.Cells[_KolCashDropping, RecNo] , CurrDropping);
  TryStrToFloat(strgGrid.Cells[_KolCashBack, RecNo] , CashBack);
  TryStrToFloat(strgGrid.Cells[_KolPaymenCash, RecNo] , Payment);
  TryStrToFloat(strgGrid.Cells[_KolPhysicalCash, RecNo] , Physical);
  TryStrToFloat(strgGrid.Cells[_KolAssVoucher, RecNo] , Voucher);
  TryStrToFloat(strgGrid.Cells[_KolOtherVoucher, RecNo] , OtherVoucher);
  TryStrToFloat(strgGrid.Cells[_KolCard, RecNo] , Card);
  TryStrToFloat(strgGrid.Cells[_kolDiscCC, RecNo] , DiscCard);

  Result.Append(FloatToStr(CurrDropping) + ' as  CurrDropping ,');
  Result.Append(FloatToStr(CashBack) + ' as  CashBack ,');
  Result.Append(FloatToStr(Payment) + ' as  Payment ,');
  Result.Append(FloatToStr(Physical) + ' as  Physical ,');
  Result.Append(FloatToStr(Voucher) + ' as  Voucher ,');
  Result.Append(FloatToStr(OtherVoucher) + ' as  OtherVoucher ,');
  Result.Append(FloatToStr(Card) + ' as  Card ,');
  Result.Append(FloatToStr(DiscCard) + ' as  DiscCard ,');
  Result.Append(QuotedStr(FLoginUsername) + ' as  LoginUserName ,');
  }
  Result := nil;
end;

function TfrmFinalPayment.IsShiftExist: Boolean;
var
  lModShift: TModShift;
begin
  Result := False;
  lModShift := TModShift.Create;
  try
    lModShift := DMClient.CrudClient.RetrieveByCode(TModShift.ClassName, edtShift.EditValue) as TModShift;

    if lModShift.ID = '' then
    begin
      TAppUtils.Error(ER_SHIFT_NOT_FOUND);
      edtShift.SetFocus;
    end else
    begin
      FShiftID := lModShift.ID;
      Result   := True;
    end;
  finally
    lModShift.Free;
  end;
end;

procedure TfrmFinalPayment.ParseFooterGrid;
begin
  {with strgGrid do
  begin
    FloatingFooter.ColumnCalc[_KolPhysicalCash] := acSUM;
    FloatingFooter.ColumnCalc[_KolPaymenCash]   := acSUM;
    FloatingFooter.ColumnCalc[_KolCashBack]     := acSUM;
    FloatingFooter.ColumnCalc[_KolAssVoucher]   := acSUM;
    FloatingFooter.ColumnCalc[_KolOtherVoucher] := acSUM;
    FloatingFooter.ColumnCalc[_KolCard]         := acSUM;
    FloatingFooter.ColumnCalc[_kolDiscCC]       := acSUM;
    FloatingFooter.ColumnCalc[_KolFPay]         := acSUM;

    AutoSize  := true;

    ColWidths[_KolPhysicalCash] := 110;
    ColWidths[_KolCashDropping] := 110;
    ColWidths[_KolPaymenCash]   := 110;
    ColWidths[_KolCashBack]     := 110;
    ColWidths[_KolAssVoucher]   := 120;
    ColWidths[_KolOtherVoucher] := 100;
    ColWidths[_KolCard]         := 100;
    ColWidths[_kolDiscCC]       := 100;
    ColWidths[_KolFPay]         := 110;

    ColWidths[_KolStatus]       := 0;
    ColWidths[_KolBegBalance]   := 0;
    ColWidths[_KolBegBalanceUnt]:= 0;
    ColWidths[_KolCashierNm]    := 0;
    ColWidths[_KolFPayID]       := 0;
  end;
  }
end;

procedure TfrmFinalPayment.PrintFinalPayment(BalanceID, BalanceUnitID: Integer);
begin
  {If BalanceID <=0 then
  begin
    CommonDlg.ShowMessage('Tidak ada data yang dipilih');
    exit;
  end;
  With TNewFinalPayment.Create(Self) do
  begin
    Try
      If not LoadByBalanceID(BalanceID) then
      begin
        CommonDlg.ShowMessage(
          'Tidak Bisa Mencetak Slip Final Payment' + #13 +
          'Transaksi Beginning Balance Belum Diproses Final Payment'
          );
        exit;
      end
      else
        DoSlipFinalPayment(BalanceID,BalanceUnitID,GetAddedValue(BalanceID,BalanceUnitID ));
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmFinalPayment.RefreshData;
begin
  inherited;
  if edtShift.Text = '' then
    Exit
  else if not IsShiftExist then
    Exit;

  edtCashierName.Clear;
  edtSupervisor.Clear;

  if Assigned(FCDS) then FreeAndNil(FCDS);
  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.FinalPayment_GetDSOverview(dtAkhirFilter.Date, edtShift.EditValue, TRetno.UnitStore.ID) ,Self );
  cxGridView.LoadFromCDS(CDS);
  cxGridView.SetVisibleColumns(['BEGINNING_BALANCE_ID','FINAL_PAYMENT_ID','SHIFT_NAME','BALANCE_SHIFT_DATE','AUT$UNIT_ID'],False);
  cxGridView.SetReadOnlyAllColumns(True);
end;

procedure TfrmFinalPayment.Timer1Timer(Sender: TObject);
begin
  inherited;
  edtClock.Time := Now;
end;

end.




