unit ufrmDisplayCCAndCashback;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  AdvUtil, System.Actions, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, Vcl.Menus, ufraFooter4Button, cxButtons,
  cxLabel, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC, Vcl.ActnList;

type
  TfrmDisplayCCAndCashback = class(TfrmMasterBrowse)
    pnl1: TPanel;
    dtDate: TcxDateEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    edtPos1: TEdit;
    edtPos2: TEdit;
    lbl3: TLabel;
    pnl3: TPanel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    edtAuthNo: TEdit;
    edtCardNm: TEdit;
    edtCNm: TEdit;
    edtShiftNm: TEdit;
    lbl8: TLabel;
    edtTransDT: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dtDateKeyPress(Sender: TObject; var Key: Char);
    procedure edtPos1KeyPress(Sender: TObject; var Key: Char);
    procedure edtPos2KeyPress(Sender: TObject; var Key: Char);
    procedure actRefreshExecute(Sender: TObject);
    procedure strgGridCellChanging(Sender: TObject; OldRow, OldCol, NewRow,
      NewCol: Integer; var Allow: Boolean);
  private
//    FFpay : TNewFinalPayment;
    procedure ParseHeaderGrid();
    procedure ParseDataGrid();
  public
    { Public declarations }
  end;

var
  frmDisplayCCAndCashback: TfrmDisplayCCAndCashback;

implementation

uses ufrmMain;

{$R *.dfm}
const
{
NO
POS CODE
CASHIER ID
TRANSACT NO.
CARD
CARD NO.
TOT. TRANSACT.
CASHBACK
}
  _kolNo          : Integer = 0;
  _kolPos         : Integer = 1;
  _kolCid         : Integer = 2;
  _kolTransctNo   : Integer = 3;
  _kolCard        : Integer = 4;
  _kolCardNo      : Integer = 5;
  _kolTransTot    : Integer = 6;
  _kolCashB       : Integer = 7;

  _kolAuthNo      : integer = 8;
  _kolCNm         : integer = 9;
  _kolShift       : integer = 10;
  _kolDateTime    : integer = 11;

  _fixedRow       : Integer = 1;
  _ColCount       : Integer = 8;
  _rowCount       : Integer = 3;


procedure TfrmDisplayCCAndCashback.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := cafree;
end;

procedure TfrmDisplayCCAndCashback.FormCreate(Sender: TObject);
begin
  inherited;
//  FFpay := TNewFinalPayment.Create(nil);

  lblHeader.Caption := 'DISPLAY CREDIT CARD AND CASHBACK';
  ParseHeaderGrid;
  dtDate.date := now;
end;

procedure TfrmDisplayCCAndCashback.FormDestroy(Sender: TObject);
begin
  inherited;
//  FreeAndNil(FFpay);
  frmDisplayCCAndCashback := nil;
end;

procedure TfrmDisplayCCAndCashback.ParseDataGrid;
var
  i, j  : Integer;
  m, n  : Integer;
  iPos1,
  iPos2 : Integer;
  iPosT : Integer;

begin
  ParseHeaderGrid;
  try
    iPos1 := StrToInt(Trim(edtPos1.Text));
    iPos2 := StrToInt(Trim(edtPos2.Text));
  except
    Exit;
  end;

  {
  if strgGrid.FloatingFooter.Visible then
    j := _fixedRow + 1
  else
    j := _fixedRow;

  n := strgGrid.rowCount;
  m := 0;

  FFpay.FinalPaymentPOSItems.Clear;
  FFpay.LoadPOSTransactionItem(masternewunit.id, dtDate.Date);
  for i:= 0 to FFpay.FinalPaymentPOSItems.Count - 1 do
  begin
    with FFpay do
    begin
      iPosT := StrToInt(FinalPaymentPOSItems[i].PosCode);

      if (iPos1 <= iPosT) and (iPos2 >= iPosT) then
      begin
        if Trim(FinalPaymentPOSItems[i].CardNm) <> '' then
        begin
          if (m >= n -j) then
          strgGrid.AddRow;

          strgGrid.Cells[_kolNo, m + _fixedRow]         := IntToStr(m + 1);
          strgGrid.Cells[_kolPos, m + _fixedRow]        := FinalPaymentPOSItems[i].PosCode;
          strgGrid.Cells[_kolShift, m + _fixedRow]      := FinalPaymentPOSItems[i].ShiftID;
          strgGrid.Cells[_kolCid, m + _fixedRow]        := FinalPaymentPOSItems[i].CashierCode;
          strgGrid.Cells[_kolTransctNo, m + _fixedRow]  := FinalPaymentPOSItems[i].TransctNo;
          strgGrid.Cells[_kolCard, m + _fixedRow]       := FinalPaymentPOSItems[i].CardNm;
          strgGrid.Cells[_kolCardNo, m + _fixedRow]     := FinalPaymentPOSItems[i].TransactNomor;
          strgGrid.Cells[_kolTransTot, m + _fixedRow]   := CurrToStr(FinalPaymentPOSItems[i].CardTotal);
          strgGrid.Cells[_kolCashB, m + _fixedRow]      := CurrToStr(FinalPaymentPOSItems[i].CashBack);

          strgGrid.Cells[_kolAuthNo, m + _fixedRow]   := FinalPaymentPOSItems[i].TransactAuth;
          strgGrid.Cells[_kolCNm, m + _fixedRow]      := FinalPaymentPOSItems[i].CashierName;
          strgGrid.Cells[_kolShift, m + _fixedRow]    := FinalPaymentPOSItems[i].ShiftID;
          strgGrid.Cells[_kolDateTime, m + _fixedRow] := FormatDateTime('HH:MM:SS', FinalPaymentPOSItems[i].DtTmTransct);

          Inc(m);
        end;
      end;

    end;      

  end;

  with strgGrid do
  begin
    FloatingFooter.ColumnCalc[_kolNo]         := acNONE;
    FloatingFooter.ColumnCalc[_kolPos]        := acNONE;
    FloatingFooter.ColumnCalc[_kolShift]      := acNONE;
    FloatingFooter.ColumnCalc[_kolCid]        := acNONE;
    FloatingFooter.ColumnCalc[_kolTransctNo]  := acNONE;
    FloatingFooter.ColumnCalc[_kolCard]       := acNONE;
    FloatingFooter.ColumnCalc[_kolCardNo]     := acNONE;

    FloatingFooter.ColumnCalc[_kolTransTot] := acSUM;
    FloatingFooter.ColumnCalc[_kolCashB]    := acSUM;

    AutoSize := True;

  end;
  }
end;

procedure TfrmDisplayCCAndCashback.ParseHeaderGrid;
begin
  {
  with strgGrid do
  begin
    Clear;
    ColCount  := _ColCount;
    RowCount  := _rowCount;
    FixedRows := _fixedRow;

    Cells[_kolNo,0]         := 'NO';
    Cells[_kolPos,0]        := 'POS CODE';
    Cells[_kolCID,0]        := 'CASHIER ID';
    Cells[_kolTransctNo,0]  := 'TRANSACTION NO.';
    Cells[_kolCard,0]       := 'CARD';
    Cells[_kolCardNo,0]     := 'CARD NO.';
    Cells[_kolTransTot,0]   := 'TOTAL TRANSACTION';
    Cells[_kolCashB,0]      := 'CASHBACK';

    AutoSize := true;
  end;
  }
end;

procedure TfrmDisplayCCAndCashback.dtDateKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
    edtPos1.SetFocus;
end;

procedure TfrmDisplayCCAndCashback.edtPos1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
    edtPos2.SetFocus;
end;

procedure TfrmDisplayCCAndCashback.edtPos2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    actRefreshExecute(self);

  end;
end;

procedure TfrmDisplayCCAndCashback.actRefreshExecute(Sender: TObject);
begin
  inherited;
  ParseDataGrid;
end;

procedure TfrmDisplayCCAndCashback.strgGridCellChanging(Sender: TObject;
  OldRow, OldCol, NewRow, NewCol: Integer; var Allow: Boolean);
begin
  inherited;
  {
  edtAuthNo.Text  := strgGrid.Cells[_kolAuthNo, NewRow];
  edtCardNm.Text  := strgGrid.Cells[_kolCard, NewRow];
  edtCNm.Text     := strgGrid.Cells[_kolCNm, NewRow];
  edtShiftNm.Text := strgGrid.Cells[_kolShift, NewRow];
  edtTransDT.Text := strgGrid.Cells[_kolDateTime, NewRow];
  }
end;

end.

