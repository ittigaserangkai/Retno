unit ufrmListDailyTransaction;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, System.Actions, Vcl.ActnList,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  Data.DB;

type
  TfrmListDailyTransaction = class(TfrmMasterBrowse)
    procedure actPrintExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
//    FFpay : TNewFinalPayment;
    procedure ParseHeaderGrid;
  public
  end;

var
  frmListDailyTransaction: TfrmListDailyTransaction;

implementation

uses  ufrmDialogPrintPreview, ufrmDialogViewDetilTransaksi,
  ufrmDialogDetilPayment, uRetnoUnit, uDMReport;

{$R *.dfm}
const
{
TRANSACTION DATE
TRANSACTION NO
TOTAL
CASH
CREDIT
VOUCHER
KUPON BOTOL
}
      _kolNo        : Integer = 0;
      _kolPos       : Integer = 1;
      _kolShift     : Integer = 2;
      _kolCID       : Integer = 3;
      _kolCNm       : Integer = 4;
      _kolDateTime  : Integer = 5;
      _kolTransctNo : Integer = 6;
      _kolCashP     : Integer = 7;
      _kolVG        : Integer = 8;
      _kolVB        : Integer = 9;
      _kolVL        : Integer = 10;
      _kolCardNm    : Integer = 11;
      _kolDeb       : Integer = 12;
      _kolCrE       : Integer = 13;  
      _kolDiscCard  : Integer = 14;
      _kolCashB     : Integer = 15;

      _colCount     : integer = 16;
      _fixedRow     : integer = 2;
      _LAPid        : Integer = 1001;

procedure TfrmListDailyTransaction.actPrintExecute(Sender: TObject);
var
  sSQL    : String;
  i, j    : integer;
  SS      : TStrings;
begin
  inherited;
  {
  if strgGrid.FloatingFooter.Visible then
    j := 2
  else
    j := 1;

  cExDelTmpLaporan(_LAPid, FLoginId);

  SS := TStringList.Create;
  Self.Enabled := False;

  try
    for i := strgGrid.FixedRows to strgGrid.RowCount - j do
    begin
      sSQL:= 'INSERT INTO TEMP_LAPORAN (LAPORAN_ID, USER_ID, CHAR1, CHAR2, CHAR3,'
            + ' CHAR4, CHAR5, CHAR6,CHAR7, NUM1, NUM2, NUM3, NUM4, NUM5,'
            + ' NUM6, NUM7, NUM8, NUM9) VALUES ('
            + IntToStr(_LAPid) + ', '
            + IntToStr(FLoginId) + ', '
            + Quot(strgGrid.Cells[_kolShift, i]) + ', '
            + Quot(strgGrid.Cells[_kolPos, i]) + ', '
            + Quot(strgGrid.Cells[_kolCid, i]) + ', '
            + Quot(strgGrid.Cells[_kolCNm, i]) + ', '
            + Quot(strgGrid.Cells[_kolDateTime, i]) + ', '
            + Quot(strgGrid.Cells[_kolTransctNo, i]) + ', '
            + Quot(strgGrid.Cells[_kolCardNm, i]) + ', '
            + strgGrid.Cells[_kolNo, i] + ', '
            + strgGrid.Cells[_kolCashP, i] + ', '
            + strgGrid.Cells[_kolVG, i] + ', '
            + strgGrid.Cells[_kolVB, i] + ', '
            + strgGrid.Cells[_kolVL, i] + ', '
            + strgGrid.Cells[_kolCrE, i] + ', '
            + strgGrid.Cells[_kolDeb, i] + ', '
            + strgGrid.Cells[_kolCashB, i] + ', '
            + strgGrid.Cells[_kolDiscCard, i] + ')';

      SS.Add(sSQL);

    end;
    if kExecuteSQLsNoBlob(SS) then
    begin
      cCommitTrans;

      sSQL := 'SELECT '+ GetCompanyHeader(FLoginFullname,MasterNewunit.Nama,
                                        dtTgl.Date, cGetServerTime)
          + ' laporan_id, user_id, char1 as "SHIFT", char2 as "POS",'
          + ' CHAR3 AS CID, CHAR4 AS CNM, CHAR5 AS "tTIme", CHAR6 as "TranscNo",'
          + ' CHAR7 as CardCode,'
          + ' num1 as "NO", num2 as "CASHP", num3 as VG,'
          + ' num4 as VB, num5 as VL, num6 as CREDIT,'
          + ' num7 as DEBET, num8 as CASHB, NUM9 as DISCCARD'
          + ' FROM TEMP_LAPORAN'
          + ' WHERE laporan_id = ' + IntToStr(_LAPid)
          + ' AND user_id = ' +  IntToStr(FLoginId)
          + ' ORDER BY num1';

      dmReportNew.EksekusiReport('CashierDailyTransct', sSQL,'',True);
    end;

  finally
    Self.Enabled  := True;
    SS.Free;
  end;
  }
end;

procedure TfrmListDailyTransaction.actRefreshExecute(Sender: TObject);
var
  i, j  : Integer;
  m, n    : Integer;
begin
  inherited;
  ParseHeaderGrid;
  {
  if strgGrid.FloatingFooter.Visible then
    j := _fixedRow + 1
  else
    j := _fixedRow;

  n := strgGrid.rowCount;
  m := 0;

  FFpay.FinalPaymentPOSItems.Clear;
  FFpay.LoadPOSTransactionItem(masternewunit.id, dtTgl.Date);
  for i:= 0 to FFpay.FinalPaymentPOSItems.Count - 1 do
  begin
    if (m >= n -j) then
      strgGrid.AddRow;

    strgGrid.Cells[_kolNo, m + _fixedRow]       := IntToStr(m + 1);
    with FFpay do
    begin
      strgGrid.Cells[_kolPos, m + _fixedRow]      := FinalPaymentPOSItems[i].PosCode;
      strgGrid.Cells[_kolShift, m + _fixedRow]    := FinalPaymentPOSItems[i].ShiftID;
      strgGrid.Cells[_kolCid, m + _fixedRow]      := FinalPaymentPOSItems[i].CashierCode;
      strgGrid.Cells[_kolCNm, m + _fixedRow]      := FinalPaymentPOSItems[i].CashierName;
      strgGrid.Cells[_kolDateTime, m + _fixedRow] := FormatDateTime('HH:MM:SS', FinalPaymentPOSItems[i].DtTmTransct);
      strgGrid.Cells[_kolTransctNo, m + _fixedRow]:= FinalPaymentPOSItems[i].TransctNo;

      strgGrid.Cells[_kolCashP, m + _fixedRow]    := CurrToStr(FinalPaymentPOSItems[i].CashPayment);
      strgGrid.Cells[_kolVG, m + _fixedRow]       := CurrToStr(FinalPaymentPOSItems[i].VoucherGoro);
      strgGrid.Cells[_kolVB, m + _fixedRow]       := CurrToStr(FinalPaymentPOSItems[i].VoucherBotol);
      strgGrid.Cells[_kolVL, m + _fixedRow]       := CurrToStr(FinalPaymentPOSItems[i].VoucherLain);

      strgGrid.Cells[_kolCardNm, m + _fixedRow]   := FinalPaymentPOSItems[i].CardNm;
      strgGrid.Cells[_kolDeb, m + _fixedRow]      := CurrToStr(FinalPaymentPOSItems[i].CardDebit);
      strgGrid.Cells[_kolCrE, m + _fixedRow]      := CurrToStr(FinalPaymentPOSItems[i].CardCredit);
      strgGrid.Cells[_kolCashB, m + _fixedRow]    := CurrToStr(FinalPaymentPOSItems[i].CashBack);
      strgGrid.Cells[_kolDiscCard, m + _fixedRow]    := CurrToStr(FinalPaymentPOSItems[i].TotalDiscCard);

      Inc(m);
    end;


  end;

  with strgGrid do
  begin
    FloatingFooter.ColumnCalc[_kolNo]       := acNONE;
    FloatingFooter.ColumnCalc[_kolPos]      := acNONE;
    FloatingFooter.ColumnCalc[_kolShift]    := acNONE;
    FloatingFooter.ColumnCalc[_kolCid]      := acNONE;
    FloatingFooter.ColumnCalc[_kolCNm]      := acNONE;
    FloatingFooter.ColumnCalc[_kolDateTime] := acNONE;
    FloatingFooter.ColumnCalc[_kolTransctNo]:= acNONE;
    FloatingFooter.ColumnCalc[_kolCardNm]   := acNONE;

    FloatingFooter.ColumnCalc[_kolCashP]    := acSUM;
    FloatingFooter.ColumnCalc[_kolVG]       := acSUM;
    FloatingFooter.ColumnCalc[_kolVB]       := acSUM;
    FloatingFooter.ColumnCalc[_kolVL]       := acSUM;
    FloatingFooter.ColumnCalc[_kolDeb]      := acSUM;
    FloatingFooter.ColumnCalc[_kolCrE]      := acSUM;
    FloatingFooter.ColumnCalc[_kolCashB]    := acSUM;
    FloatingFooter.ColumnCalc[_kolDiscCard] := acSUM;

    AutoSize := True;
  end;
  }
end;

procedure TfrmListDailyTransaction.ParseHeaderGrid;
begin
  {
  with strgGrid do
  begin
    Clear;
    ColCount := _colCount;

    if FloatingFooter.Visible then
      RowCount := _fixedRow + 2
    else
      RowCount := _fixedRow + 1;

    FixedRows := _fixedRow;

    MergeCells(_kolNo,0,1,2);
    Cells[_kolNo,0] := 'NO';

    MergeCells(_kolPos,0,1,2);
    Cells[_kolPos,0]  := 'POS';

    MergeCells(_kolShift,0,1,2);
    Cells[_kolShift,0]  := 'SHIFT';

    MergeCells(_kolCid ,0,2,1);
    Cells[_kolCid ,0] := 'CASHIER';
    Cells[_kolCid,1]  := 'ID';
    Cells[_kolCNm,1]  := 'NAME';

    MergeCells(_kolDateTime,0,1,2);
    Cells[_kolDateTime,0]  := 'TIME';

    MergeCells(_kolTransctNo,0,1,2);
    Cells[_kolTransctNo,0]  := 'TRANSCT NO.';

    MergeCells(_kolCashP,0,1,2);
    Cells[_kolCashP,0]  := 'CASH PAYMENT';

    MergeCells(_kolVG,0,3,1);
    Cells[_kolVG,0] := 'VOUCHER';
    Cells[_kolVG,1] := 'ASSALAM';
    Cells[_kolVB,1] := 'BOTTLE';
    Cells[_kolVL,1] := 'OTHER';


    MergeCells(_kolCardNm,0,5,1);
    Cells[_kolCardNm,0] := 'CARD';
    Cells[_kolCardNm,1] := 'NAME';
    Cells[_kolDeb,1]      := 'DEBET';
    Cells[_kolCrE,1]      := 'CREDIT';

    Cells[_kolCashB,1]  := 'CASHBACK';

    Cells[_kolDiscCard,1]  := 'DISC CARD';

    AutoSize := True;
  end;
  }
end;


procedure TfrmListDailyTransaction.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//  FreeAndNil(FFpay);
  Action := caFree;
end;

procedure TfrmListDailyTransaction.FormDestroy(Sender: TObject);
begin
  inherited;
  frmListDailyTransaction := nil;
end;

procedure TfrmListDailyTransaction.FormCreate(Sender: TObject);
begin
  inherited;
//  FFpay := TNewFinalPayment.Create(nil);
  ParseHeaderGrid;
end;


procedure TfrmListDailyTransaction.FormShow(Sender: TObject);
begin
  inherited;
//  dtAwalFilter.Date := cGetServerTime;
end;

end.



