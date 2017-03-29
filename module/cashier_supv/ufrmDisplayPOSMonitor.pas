unit ufrmDisplayPOSMonitor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, Mask, ActnList, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  System.Actions, ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC;

type
  TfrmDisplayPOSMonitor = class(TfrmMasterBrowse)
    pnl1: TPanel;
    lbl1: TLabel;
    dtNow: TcxDateEdit;
    lbl3: TLabel;
    edtShift: TEdit;
    pnl3: TPanel;
    lbl11: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dtNowKeyPress(Sender: TObject; var Key: Char);
    procedure lbl10Click(Sender: TObject);
    procedure lbl11Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure edtShiftKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
//    FFinalPayment : TNewFinalPayment;
    FUnitId       : Integer;
    iY, FLeftMain : Integer;
    FtopMain      : Integer;
    procedure ParseHeaderGrid();
    procedure ParseDataGrid();
    procedure ShowDetailCashback();
    procedure ShowGrandTotalCashback();
  public
    { Public declarations }
    procedure ShowWithId(aUnitId: Integer; aTop: integer; aLeft : integer);
  end;

var
  frmDisplayPOSMonitor: TfrmDisplayPOSMonitor;

implementation

uses ufrmPopupDetailCashback;

{$R *.dfm}

const
{POS CODE
CASHIER ID
CASHIER NAME
CASH PAYMENT
ASSALAM COUPON
BOTTLE COUPON
LAIN - LAIN
DEBET CARD
CREDIT CARD
DISCOUNT CARD
TOT. CASH BACH
TOT. CASH GRAND
}
      _kolPosCode       : Integer = 0;
      _kolCashierId     : Integer = 1;
      _kolCashierNm     : Integer = 2;
      _kolCashPayment   : Integer = 3;
      _kolKuponGoro     : Integer = 4;
      _kolKuponBottle   : Integer = 5;
      _kolKuponLain     : Integer = 6;
      _kolCredit        : Integer = 7;
      _kolDebet         : Integer = 8;
      _kolDiscCC        : Integer = 9;
      _kolCashBackTot   : Integer = 10;
      _kolCashGrandTot  : Integer = 11;
      _kolBegBalance    : Integer = 12;

      _fixedRow         : Integer = 2;
      _colCount         : Integer = 12;



procedure TfrmDisplayPOSMonitor.ShowWithId(aUnitId: Integer; aTop: integer;
    aLeft : integer);
begin
  FUnitId   := aUnitId;
  FtopMain  := aTop;
  FLeftMain := aLeft;
  Self.Show;
end;


procedure TfrmDisplayPOSMonitor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDisplayPOSMonitor.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'DISPLAY POS MONITOR';
//  FFinalPayment     := TNewFinalPayment.Create(nil);
  dtNow.Date        := now;
  ParseHeaderGrid;

//  iY  := strgGrid.FixedRows;

end;

procedure TfrmDisplayPOSMonitor.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDisplayPOSMonitor := nil;
//  FreeAndNil(FFinalPayment);
end;

procedure TfrmDisplayPOSMonitor.dtNowKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) and (edtShift.Text <> '' ) then
  begin
    ParseDataGrid;
  end;  

end;

procedure TfrmDisplayPOSMonitor.ParseDataGrid;
var
  i : Integer;
  n : Integer;
begin
  {
  ParseHeaderGrid;
  FFinalPayment.FinalPaymentPOSItems.Clear;
  FFinalPayment.LoadPOSTransaction(FUnitId, dtNow.Date, edtShift.Text);
  n := strgGrid.FixedRows ;
  with FFinalPayment do
  begin
    for i := 0 to FinalPaymentPOSItems.Count - 1 do
    begin

      if i > 0 then
        strgGrid.AddRow;

      strgGrid.Cells[_kolPosCode, n]      := FinalPaymentPOSItems[i].BeginningBalance.POS.Code;
      strgGrid.Cells[_kolCashierId, n]    := FinalPaymentPOSItems[i].CashierCode;
      strgGrid.Cells[_kolCashierNm, n]    := FinalPaymentPOSItems[i].CashierName;
      strgGrid.Cells[_kolCashPayment, n]  := CurrToStr(FinalPaymentPOSItems[i].CashPayment);
      strgGrid.Cells[_kolKuponGoro, n]    := CurrToStr(FinalPaymentPOSItems[i].VoucherGoro);
      strgGrid.Cells[_kolKuponBottle, n]  := CurrToStr(FinalPaymentPOSItems[i].VoucherBotol);
      strgGrid.Cells[_kolKuponLain, n]    := CurrToStr(FinalPaymentPOSItems[i].VoucherLain);
      strgGrid.Cells[_kolDebet, n]        := CurrToStr(FinalPaymentPOSItems[i].CardDebit);
      strgGrid.Cells[_kolCredit, n]       := CurrToStr(FinalPaymentPOSItems[i].CardCredit);
      strgGrid.Cells[_kolDiscCC, n]       := CurrToStr(FinalPaymentPOSItems[i].TotalDiscCard);
      strgGrid.Cells[_kolCashBackTot, n]  := CurrToStr(FinalPaymentPOSItems[i].CashBack);
      strgGrid.Cells[_kolCashGrandTot, n] := CurrToStr(FinalPaymentPOSItems[i].GrandTotal);
      strgGrid.Cells[_kolBegBalance, n]   := CurrToStr(FinalPaymentPOSItems[i].BeginningBalance.ID);

      Inc(n)
    end;
    strgGrid.FloatingFooter.ColumnCalc[_kolCashPayment] := acSUM;
    strgGrid.FloatingFooter.ColumnCalc[_kolKuponGoro]   := acSUM;
    strgGrid.FloatingFooter.ColumnCalc[_kolKuponBottle] := acSUM;
    strgGrid.FloatingFooter.ColumnCalc[_kolKuponLain]   := acSUM;
    strgGrid.FloatingFooter.ColumnCalc[_kolDebet]       := acSUM;
    strgGrid.FloatingFooter.ColumnCalc[_kolCredit]      := acSUM;
    strgGrid.FloatingFooter.ColumnCalc[_kolDiscCC]      := acSUM;
    strgGrid.FloatingFooter.ColumnCalc[_kolCashBackTot] := acSUM;
    strgGrid.FloatingFooter.ColumnCalc[_kolCashGrandTot]:= acSUM;


  end;
  AutoSize := true;
   }

end;

procedure TfrmDisplayPOSMonitor.ParseHeaderGrid;
begin
  {
  with strgGrid do
  begin

    ColCount := _colCount;

    if FloatingFooter.Visible then
      RowCount := _fixedRow + 2
    else
      RowCount := _fixedRow + 1;

    FixedRows := _fixedRow;

    MergeCells(_kolPosCode,0,1,2);
    Cells[_kolPosCode,0]      := 'POS CODE';

    MergeCells(_kolCashierId,0,2,1);
    Cells[_kolCashierId,0]    := 'CASHIER';
    Cells[_kolCashierId,1]    := 'ID';
    Cells[_kolCashierNm,1]    := 'NAME';

    MergeCells(_kolCashPayment,0,1,2);
    Cells[_kolCashPayment,0]  := 'CASH PAYMENT';

    MergeCells(_kolKuponGoro,0,3,1);
    Cells[_kolKuponGoro,0]    := 'VOUCHER';
    Cells[_kolKuponGoro,1]    := 'ASSALAM';
    Cells[_kolKuponBottle,1]  := 'BOTTLE';
    Cells[_kolKuponLain,1]    := 'OTHER';


    MergeCells(_kolCredit,0,3,1);
    Cells[_kolCredit,0]       := 'CARD';
    Cells[_kolCredit,1]       := 'CREDIT';
    Cells[_kolDebet,1]        := 'DEBET';
    Cells[_kolDiscCC,1]       := 'DISCOUNT';


    MergeCells(_kolCashBackTot,0,1,2);
    Cells[_kolCashBackTot,0]  := 'TOT. CASHBACK';

    MergeCells(_kolCashGrandTot,0,1,2);
    Cells[_kolCashGrandTot,0]  := 'TOT. CASHGRAND';

    
    Cells[_kolPosCode, _fixedRow]      := '-';
    Cells[_kolCashierId, _fixedRow]    := '-';
    Cells[_kolCashierNm, _fixedRow]    := '-';
    Cells[_kolCashPayment, _fixedRow]  := '0';
    Cells[_kolKuponGoro, _fixedRow]    := '0';
    Cells[_kolKuponBottle, _fixedRow]  := '0';
    Cells[_kolKuponLain, _fixedRow]    := '0';
    Cells[_kolDebet, _fixedRow]        := '0';
    Cells[_kolCredit, _fixedRow]       := '0';
    Cells[_kolDiscCC, _fixedRow]       := '0';
    Cells[_kolCashBackTot, _fixedRow]  := '0';
    Cells[_kolCashGrandTot, _fixedRow] := '0';
    Cells[_kolBegBalance, _fixedRow]   := '0';

  end;
  }
end;

procedure TfrmDisplayPOSMonitor.ShowDetailCashback;
begin
  {if not Assigned(frmPopupDetailCashback) then
    frmPopupDetailCashback := TfrmPopupDetailCashback.Create(Application);

  frmPopupDetailCashback.Top  := FtopMain + pnl3.Top - pnl3.Height;
  frmPopupDetailCashback.Left := FLeftMain + pnl3.Left + (pnl3.Width - frmPopupDetailCashback.Width);
  frmPopupDetailCashback.ShowWithUserId(FUnitId, strgGrid.Ints[_kolBegBalance, iy]);
   }
end;

procedure TfrmDisplayPOSMonitor.ShowGrandTotalCashback;
begin
//  if not Assigned(frmPopupTransactionCashback) then
//    frmPopupTransactionCashback := TfrmPopupTransactionCashback.Create(Application);
//
//  frmPopupTransactionCashback.Top := frmMain.Top + pnl3.Top - pnl3.Height;
//  frmPopupTransactionCashback.Left := frmMain.Left + pnl3.Left + (pnl3.Width - frmPopupTransactionCashback.Width);
//  frmPopupTransactionCashback.Free;
end;

procedure TfrmDisplayPOSMonitor.lbl10Click(Sender: TObject);
begin
  ShowGrandTotalCashback;
end;

procedure TfrmDisplayPOSMonitor.lbl11Click(Sender: TObject);
begin
  ShowDetailCashback;
end;

procedure TfrmDisplayPOSMonitor.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
//  if(Key = Ord('T'))and(ssctrl in Shift) then
//    ShowGrandTotalCashback;
  if(Key = Ord('D'))and(ssctrl in Shift) then
    ShowDetailCashback;
end;

procedure TfrmDisplayPOSMonitor.strgGridRowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  iY  := NewRow;
end;

procedure TfrmDisplayPOSMonitor.edtShiftKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
//  if not (Key in [0..9, VK_RETURN, VK_BACK]) then
//  begin
//    Key := Ord(#0);
//  end;

  if (Key = VK_RETURN) and (dtNow.Text <> '') then
  begin
    edtShift.Enabled := False;
//    ClearAdvStringGrid(strgGrid);
//    cClearStringGrid(strgGrid,True);
    ParseDataGrid;
    edtShift.Enabled := True;    
  end;
end;

procedure TfrmDisplayPOSMonitor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
  if(Key = Ord('D')) and (ssctrl in Shift) then
    lbl11Click(Self)  
  else if(Key = VK_F5) and (ssctrl in Shift) then
    actRefreshExecute(Self)
  else if(Key = VK_Escape) then
    Close
end;

end.
