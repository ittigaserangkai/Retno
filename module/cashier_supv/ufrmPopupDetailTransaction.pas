unit ufrmPopupDetailTransaction;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms,
  ExtCtrls, StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxLabel;

type
  TfrmPopupDetailTransaction = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;

    lblClose: TcxLabel;
    edtCashierID: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCashierNm: TEdit;
    edtShift: TEdit;
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    cxlvMaster: TcxGridLevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblCloseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FUnitID : Integer;
    FBegBln : Integer;
//   _fixedRow  : Integer;
//   _colCount  : Integer;

    procedure ParseHeaderGrid();
    procedure ParseDataGrid();
  public
    { Public declarations }
        procedure ShowWithId(aUnitId: Integer; aBegBlcId: Integer; aCashierID : string;
            aCashierNm: string; aShift: string);
  end;

var
  frmPopupDetailTransaction: TfrmPopupDetailTransaction;

implementation

uses uRetnoUnit;
{$R *.dfm}
const
      _kolNo        : Integer = 0;
      _kolDateTime  : Integer = 1;
      _kolTransctNo : Integer = 2;
      _kolCashP     : Integer = 3;
      _kolVG        : Integer = 4;
      _kolVB        : Integer = 5;
      _kolVL        : Integer = 6;
      _kolCardCode  : Integer = 7;
      _kolDeb       : Integer = 8;
      _kolCrE       : Integer = 9;
      _kolCashB     : Integer = 10;

      _fixedRow     : Integer = 2;
      _colCount     : Integer = 11;


procedure TfrmPopupDetailTransaction.ShowWithId(aUnitId: Integer; aBegBlcId:
    Integer; aCashierID : string; aCashierNm: string; aShift: string);
begin
  FUnitId   := aUnitId;
  FBegBln   := aBegBlcId;

  edtCashierID.Text := aCashierID;
  edtCashierNm.Text := aCashierNm;
  edtShift.Text     := aShift;

  ParseHeaderGrid;
  ParseDataGrid;
  Self.ShowModal;
end;

procedure TfrmPopupDetailTransaction.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmPopupDetailTransaction.FormDestroy(Sender: TObject);
begin
  frmPopupDetailTransaction := nil;
end;

procedure TfrmPopupDetailTransaction.FormShow(Sender: TObject);
begin
  ParseDataGrid;
end;

procedure TfrmPopupDetailTransaction.ParseDataGrid;
//var
//  sSQL      : string;
//  sTrsctNo  : string;
//  sTrsctTm  : string;
//  dCashP    : Double;
//  dCashB    : Double;
//  dVg, dVb  : Double;
//  dVl, dTot : Double;
//  sCardCode : string;
//  dCardC    : Double;
//  dCardD    : Double;
//  i, n, m   : integer;

begin
  {
  cClearStringGrid(strgGrid, False);

  sSQL := 'SELECT TRANS_NO, DATE_CREATE FROM TRANSAKSI'
        + ' WHERE TRANS_BALANCE_ID = ' + IntToStr(FBegBln)
        + ' AND TRANS_UNT_ID = '+ IntToStr(FUnitID)
        + ' AND TRANS_IS_PENDING = 0 '
        + ' ORDER BY DATE_CREATE';

  if strgGrid.FloatingFooter.Visible then
    m := _fixedRow + 1
  else
    m := _fixedRow;

  n := strgGrid.rowCount;
  i := 0;
  with cOpenQuery(sSQL) do
  begin
    try
      while not Eof do
      begin
        sTrsctNo  := '';
        dCashB    := 0;
        dVg       := 0;
        dVb       := 0;
        dVl       := 0;
        sCardCode := '';
        dCardC    := 0;
        dCardD    := 0;
        dTot      := 0;

        if  (i >= m - n) then
          strgGrid.AddRow;

          sTrsctNo  := Fields[0].AsString;
          sTrsctTm  := FormatDateTime('HH:MM:SS',  Fields[1].AsDateTime);

          //card
          sSQL  := 'select cc.card_is_credit, tc.transc_nilai,'
              + ' tc.TRANSC_CASHBACK_NILAI, CC.CARD_NAME'
              + ' from transaksi t'
              + ' inner join transaksi_card tc on tc.transc_trans_no = t.trans_no'
              + ' and tc.transc_trans_unt_id = t.trans_unt_id'
              + ' AND t.TRANS_NO = '+ Quot(sTrsctNo)
              + ' and t.TRANS_UNT_ID = '+ IntToStr(FUnitID)
              + ' and t.trans_bayar_card > 0'
              + ' AND T.TRANS_IS_PENDING = 0'
              + ' inner join ref$credit_card cc on cc.card_id = tc.transc_card_id'
              + ' and cc.card_unt_id = tc.transc_card_unt_id';
          with cOpenQuery(sSQL) do
          begin
            try
              if not eof then
              begin
                if Fields[0].AsInteger = 1 then //credit card
                	dCardC := Fields[1].AsFloat
                else //debit card
                	dCardD := Fields[1].AsFloat;

                dCashB    := Fields[2].AsFloat;
                sCardCode := Fields[3].AsString;

              end;  

            finally
              free;
            end;
          end;

          //v goro
          sSQL := 'select v.vcrd_nominal'
                + ' from voucher_detil v'
                + ' inner join transaksi t on v.vcrd_pos_trans_no = t.trans_no'
                + ' and v.vcrd_unt_id=t.trans_unt_id'
                + ' where t.trans_no = '+ Quot(sTrsctNo)
                + ' and t.TRANS_UNT_ID ='+ IntToStr(FUnitID)
                + ' AND T.TRANS_IS_PENDING = 0';
          with cOpenQuery(sSQL) do
          begin
            try
              if not eof then
              begin
                dVg := Fields[0].AsFloat;
              end;
            finally
              free;
            end;
          end;

          //voucher lain-lain
          sSQL := 'select vl.vcrl_total_value'
          	+ ' from voucher_lain_lain vl '
            + ' inner join transaksi t on vl.vcrl_trans_no = t.trans_no '
            + ' and vl.vcrl_trans_unt_id = t.trans_unt_id '
            + ' where t.trans_no = '+ Quot(sTrsctNo)
            + ' and t.TRANS_UNT_ID ='+ IntToStr(FUnitID)
            + ' AND T.TRANS_IS_PENDING = 0';

          with cOpenQuery(sSQL) do
          begin
            try
              if not eof then
              begin
                dVl := Fields[0].AsFloat;
              end;
            finally
              Free;
            end;
          end;

          //kupon botol
          sSQL := 'select tkb.tkb_sell_price_disc'
            + ' from trans_kupon_botol tkb '
            + ' inner join transaksi t on tkb.tkb_pos_trans_no = t.trans_no '
            + ' and tkb.tkb_unt_id = t.trans_unt_id '
            + ' where t.trans_no = '+ Quot(sTrsctNo)
            + ' and t.TRANS_UNT_ID ='+ IntToStr(FUnitID)
            + ' AND T.TRANS_IS_PENDING = 0';
          with cOpenQuery(sSQL) do
          begin
            try
              if not eof then
              begin
                dVb := Fields[0].AsFloat;
              end;
            finally
              Free;
            end;
          end;

          sSQL := 'select t.TRANS_TOTAL_BAYAR from transaksi t'
                + ' where t.trans_no = '+ Quot(sTrsctNo)
                + ' and t.TRANS_UNT_ID ='+ IntToStr(FUnitID)
                + ' AND T.TRANS_IS_PENDING = 0';
          with cOpenQuery(sSQL) do
          begin
            try
              if not eof then
              begin
								dTot := Fields[0].AsFloat;
              end;
            finally
              Free;
            end;
          end;

          dCashP  := dTot - dCardC - dCardD;

         strgGrid.Cells[_kolNo, i + _fixedRow]        := IntToStr(i + 1);
         strgGrid.Cells[_kolDateTime, i + _fixedRow]  := sTrsctTm;
         strgGrid.Cells[_kolTransctNo, i + _fixedRow] := sTrsctNo;
         strgGrid.Cells[_kolCashP, i + _fixedRow]     := FloatToStr(dCashP);
         strgGrid.Cells[_kolVG, i + _fixedRow]        := FloatToStr(dVg);
         strgGrid.Cells[_kolVB, i + _fixedRow]        := FloatToStr(dVb);
         strgGrid.Cells[_kolVL, i + _fixedRow]        := FloatToStr(dVl);
         strgGrid.Cells[_kolCardCode, i + _fixedRow]  := sCardCode;
         strgGrid.Cells[_kolDeb, i + _fixedRow]       := FloatToStr(dCardD);
         strgGrid.Cells[_kolCrE, i + _fixedRow]       := FloatToStr(dCardC);
         strgGrid.Cells[_kolCashB, i + _fixedRow]     := FloatToStr(dCashB);
        Inc(i);
        Next;
      end;
    finally
      Free;
    end;
  end;

  with strgGrid  do
  begin
    FloatingFooter.ColumnCalc[_kolNo]         := acNONE;
    FloatingFooter.ColumnCalc[_kolDateTime]   := acNONE;
    FloatingFooter.ColumnCalc[_kolTransctNo]  := acNONE;
    FloatingFooter.ColumnCalc[_kolCashP]      := acSUM;
    FloatingFooter.ColumnCalc[_kolVG]         := acSUM;
    FloatingFooter.ColumnCalc[_kolVB]         := acSUM;
    FloatingFooter.ColumnCalc[_kolVL]         := acSUM;
    FloatingFooter.ColumnCalc[_kolCardCode]   := acNONE;
    FloatingFooter.ColumnCalc[_kolDeb]        := acSUM;
    FloatingFooter.ColumnCalc[_kolCrE]        := acSUM;
    FloatingFooter.ColumnCalc[_kolCashB]      := acSUM;
    AutoSize := true;
  end;
  }
end;

procedure TfrmPopupDetailTransaction.ParseHeaderGrid;
begin
  {
  with strgGrid  do
  begin
    ColCount := _colCount;

    if FloatingFooter.Visible then
      RowCount := _fixedRow + 2
    else
      RowCount := _fixedRow + 1;

    FixedRows := _fixedRow;

    MergeCells(_kolNo,0,1,2);
    Cells[_kolNo,0] := 'NO';

    MergeCells(_kolDateTime,0,1,2);
    Cells[_kolDateTime,0] := 'TIME';

    MergeCells(_kolTransctNo,0,1,2);
    Cells[_kolTransctNo,0]  := 'TRANSCT NO.';

    MergeCells(_kolCashP,0,1,2);
    Cells[_kolCashP,0]  := 'CASH PAYMENT';

    MergeCells(_kolVG,0,3,1);
    Cells[_kolVG,0] := 'VOUCHER';
    Cells[_kolVG,1] := 'GORO';
    Cells[_kolVB,1] := 'BOTTLE';
    Cells[_kolVL,1] := 'OTHER';

    MergeCells(_kolCardCode,0,3,1);
    Cells[_kolCardCode,0] := 'CARD';
    Cells[_kolCardCode,1] := 'NAME';
    Cells[_kolDeb,1]      := 'DEBET';
    Cells[_kolCrE,1]      := 'CREDIT';

    MergeCells(_kolCashB,0,1,2);
    Cells[_kolCashB ,0]  := 'CASH BACK';

  end;
  }
end;

procedure TfrmPopupDetailTransaction.lblCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPopupDetailTransaction.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  if key = VK_ESCAPE then
    Close;

end;

end.
