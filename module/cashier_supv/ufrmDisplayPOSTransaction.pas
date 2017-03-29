unit ufrmDisplayPOSTransaction;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms,
  ufrmMasterBrowse, StdCtrls, ExtCtrls, Mask,
  ActnList, System.Actions, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, ufraFooter4Button, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC;

type
  TfrmDisplayPOSTransaction = class(TfrmMasterBrowse)
    pnl1: TPanel;
    lbl1: TLabel;
    dtNow: TcxDateEdit;
    lbl2: TLabel;
    edtPos: TEdit;
    pnl3: TPanel;
    lbl11: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtPosKeyPress(Sender: TObject; var Key: Char);
    procedure lbl10Click(Sender: TObject);
    procedure lbl11Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FUnitId   : Integer;
    FtopMain  : Integer;
    FLeftMain : Integer; 
//    FFinalPayment : TNewFinalPayment;
    procedure ParseHeaderGrid();
    procedure ParseDataGrid();
    procedure ShowPayment();
    procedure ShowDetail();
  public
    { Public declarations }
    procedure ShowWithId(aUnitId: Integer; aTop: integer; aLeft : integer);
  end;

var
  frmDisplayPOSTransaction: TfrmDisplayPOSTransaction;

implementation

uses ufrmPopupDetailTransaction;

{$R *.dfm}

const
      _kolShift         : Integer = 0;
      _kolCashierId     : Integer = 1;
      _kolCashierNm     : Integer = 2;
      _kolCashPayment   : Integer = 3;
      _kolKuponGoro     : Integer = 4;
      _kolKuponBottle   : Integer = 5;
      _kolKuponLain     : Integer = 6;
      _kolDebet         : Integer = 7;
      _kolCredit        : Integer = 8;
      _kolDiscCc        : Integer = 9;
      _kolCashBackTot   : Integer = 10;
      _kolCashGrandTot  : Integer = 11;
      _kolBegBalance    : Integer = 12;

      _fixedRow         : Integer = 2;
      _colCount         : Integer = 12;


procedure TfrmDisplayPOSTransaction.ShowWithId(aUnitId: Integer; aTop: integer;
    aLeft : integer);
begin
  FUnitId   := aUnitId;
  FtopMain  := aTop;
  FLeftMain := aLeft;
  ParseHeaderGrid;
  Self.Show;
end;

procedure TfrmDisplayPOSTransaction.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDisplayPOSTransaction.FormCreate(Sender: TObject);
begin
  inherited;
//  FFinalPayment     := TNewFinalPayment.Create(nil);
  lblHeader.Caption := 'DISPLAY POS TRANSACTION';
  dtNow.Date        := now;

end;

procedure TfrmDisplayPOSTransaction.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDisplayPOSTransaction := nil;
end;

procedure TfrmDisplayPOSTransaction.edtPosKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = Chr(VK_RETURN)) and (dtNow.Text <> '') then
    ParseDataGrid;
end;

procedure TfrmDisplayPOSTransaction.ParseDataGrid;
var
    i, j      : Integer;
    n, m      : Integer;
    sSQL      : string;
    sShiftNm  : string;
begin
  {
  cClearStringGrid(strgGrid, False);

  if strgGrid.FloatingFooter.Visible then
    j := _fixedRow + 1
  else
    j := _fixedRow;

  n := strgGrid.rowCount;
  m := 0;
  sSQL  := 'SELECT DISTINCT SHIFT_NAME FROM SHIFT'
        + ' WHERE SHIFT_UNT_ID = '+ IntToStr(FUnitId);
  with cOpenQuery(sSQL) do
  begin
    try
      while not Eof do
      begin

        FFinalPayment.FinalPaymentPOSItems.Clear;
        sShiftNm  := Fields[0].AsString;
        FFinalPayment.LoadPOSTransaction(FUnitId, dtNow.Date, sShiftNm , edtPos.Text);
        with FFinalPayment do
        begin
          for i := 0 to FinalPaymentPOSItems.Count - 1 do
          begin

            if (m >= n -j) then
              strgGrid.AddRow;

            strgGrid.Cells[_kolShift, m + _fixedRow]        := FinalPaymentPOSItems[i].BeginningBalance.Shift.Name;
            strgGrid.Cells[_kolCashierId, m + _fixedRow]    := FinalPaymentPOSItems[i].CashierCode;
            strgGrid.Cells[_kolCashierNm, m + _fixedRow]    := FinalPaymentPOSItems[i].CashierName;
            strgGrid.Cells[_kolCashPayment, m + _fixedRow]  := CurrToStr(FinalPaymentPOSItems[i].CashPayment);
            strgGrid.Cells[_kolKuponGoro, m + _fixedRow]    := CurrToStr(FinalPaymentPOSItems[i].VoucherGoro);
            strgGrid.Cells[_kolKuponBottle, m + _fixedRow]  := CurrToStr(FinalPaymentPOSItems[i].VoucherBotol);
            strgGrid.Cells[_kolKuponLain, m + _fixedRow]    := CurrToStr(FinalPaymentPOSItems[i].VoucherLain);

            strgGrid.Cells[_kolDebet, m + _fixedRow]        := CurrToStr(FinalPaymentPOSItems[i].CardDebit);
            strgGrid.Cells[_kolCredit, m + _fixedRow]       := CurrToStr(FinalPaymentPOSItems[i].CardCredit);
            strgGrid.Cells[_kolDiscCc, m + _fixedRow]       := CurrToStr(FinalPaymentPOSItems[i].TotalDiscCard);
            strgGrid.Cells[_kolCashBackTot, m + _fixedRow]  := CurrToStr(FinalPaymentPOSItems[i].CashBack);
            strgGrid.Cells[_kolCashGrandTot, m + _fixedRow] := CurrToStr(FinalPaymentPOSItems[i].GrandTotal);
            strgGrid.Cells[_kolBegBalance, m + _fixedRow]   := CurrToStr(FinalPaymentPOSItems[i].BeginningBalance.ID);

            Inc(m)
          end;
        end;
        Next;
      end;
    finally
      Free;
    end;

  end;

    with strgGrid do
    begin
      FloatingFooter.ColumnCalc[_kolCashPayment] := acSUM;
      FloatingFooter.ColumnCalc[_kolKuponGoro]   := acSUM;
      FloatingFooter.ColumnCalc[_kolKuponBottle] := acSUM;
      FloatingFooter.ColumnCalc[_kolKuponLain]   := acSUM;
      FloatingFooter.ColumnCalc[_kolDebet]       := acSUM;
      FloatingFooter.ColumnCalc[_kolCredit]      := acSUM;
      FloatingFooter.ColumnCalc[_kolDiscCc]      := acSUM;
      FloatingFooter.ColumnCalc[_kolCashBackTot] := acSUM;
      FloatingFooter.ColumnCalc[_kolCashGrandTot]:= acSUM;
      AutoSize := True;
    end;
   }
end;

procedure TfrmDisplayPOSTransaction.ParseHeaderGrid;
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

    MergeCells(_kolShift,0,1,2);
    Cells[_kolShift,0]      := 'SHIFT';

    MergeCells(_kolCashierId,0,2,1);
    Cells[_kolCashierId,0]    := 'CASHIER';
    Cells[_kolCashierId,1]    := 'ID';
    Cells[_kolCashierNm,1]    := 'NAME';

    MergeCells(_kolCashPayment,0,1,2);
    Cells[_kolCashPayment,0]  := 'CASH PAYMENT';

    MergeCells(_kolKuponGoro,0,3,1);
    Cells[_kolKuponGoro,0]    := 'VOUCHER';
    Cells[_kolKuponGoro,1]    := 'GORO';
    Cells[_kolKuponBottle,1]  := 'BOTTLE';
    Cells[_kolKuponLain,1]    := 'OTHER';


    MergeCells(_kolDebet,0,3,1);
    Cells[_kolDebet,0]        := 'CARD';
    Cells[_kolDebet,1]        := 'DEBET';
    Cells[_kolCredit,1]       := 'CREDIT';
    Cells[_kolDiscCc,1]       := 'DISC';

    MergeCells(_kolCashBackTot,0,1,2);
    Cells[_kolCashBackTot,0]  := 'TOT. CASHBACK';

    MergeCells(_kolCashGrandTot,0,1,2);
    Cells[_kolCashGrandTot,0]  := 'TOT. CASHGRAND';

  end;
  }
end;

procedure TfrmDisplayPOSTransaction.ShowDetail;
begin
  if not assigned(frmPopupDetailTransaction) then
    frmPopupDetailTransaction := TfrmPopupDetailTransaction.Create(Application);
  {
  frmPopupDetailTransaction.ShowWithId(masternewunit.id,
                              strgGrid.Ints[_kolBegBalance, strgGrid.Row],
                              strgGrid.Cells[_kolCashierId, strgGrid.Row],
                              strgGrid.Cells[_kolCashierNm, strgGrid.Row],
                              strgGrid.Cells[_kolShift, strgGrid.Row]);
  }
end;

procedure TfrmDisplayPOSTransaction.ShowPayment;
begin
//  if not assigned(frmPopupPayment) then
//    frmPopupPayment := TfrmPopupPayment.Create(Application);
//
//  frmPopupPayment.Top := frmMain.Top + pnl3.Top - pnl3.Height;
//  frmPopupPayment.Left := frmMain.Left + pnl3.Left + (pnl3.Width - frmPopupPayment.Width);
//  frmPopupPayment.Free;
end;

procedure TfrmDisplayPOSTransaction.lbl10Click(Sender: TObject);
begin
  ShowPayment;
end;

procedure TfrmDisplayPOSTransaction.lbl11Click(Sender: TObject);
begin
  ShowDetail;
end;

procedure TfrmDisplayPOSTransaction.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
//  if(Key = Ord('P'))and(ssctrl in Shift) then
//    ShowPayment;
  if(Key = Ord('D'))and(ssctrl in Shift) then
    ShowDetail;
end;

procedure TfrmDisplayPOSTransaction.strgGridGetFloatFormat(Sender: TObject;
  ACol, ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  if ACol in [_kolShift.._kolCashierNm] then IsFloat := False;
  if IsFloat then FloatFormat := '%.2n';
end;

procedure TfrmDisplayPOSTransaction.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  inherited;
  if(Key = Ord('D')) and (ssctrl in Shift) then
    lbl11Click(Self)  
  else if(Key = VK_F5) and (ssctrl in Shift) then
    GetAndRunButton('btnRefresh')
  else if(Key = VK_Escape) then
    Close
//  else if(Key = Ord('D')) and (ssctrl in Shift) then   //History PO
//    actShowHistorySOExecute(sender)
//  else if (Key = Ord('E')) and (ssctrl in Shift) then  //Edit SO
//    fraFooter5Button1btnDeleteClick(sender)
//  else if (Key = Ord('C')) and (ssctrl in Shift) then  //New
//    fraFooter5Button1btnUpdateClick(sender);
end;

end.


