unit ufrmPopupDetailCashback;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit,  cxLabel, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid;

type
  TfrmPopupDetailCashback = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    lblClose: TcxLabel;
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    cxlvMaster: TcxGridLevel;
    cxcolTime: TcxGridDBColumn;
    cxcolCard: TcxGridDBColumn;
    cxcolTransaction: TcxGridDBColumn;
    cxcolCashback: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure lblCloseClick(Sender: TObject);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
  private
    FBegBlcId : integer;
    FUnitID   : Integer;
    procedure ParseHeaderGrid();
    procedure ParseDataGrid();
  public
    { Public declarations }
    procedure ShowWithUserId(aUnitId: Integer; aBegBlcId: Integer);

  end;

var
  frmPopupDetailCashback: TfrmPopupDetailCashback;

implementation

{$R *.dfm}

const
      _kolDateTime  : Integer = 0;
      _kolCardCode  : Integer = 1;
      _kolTransctNo   : Integer = 2;
      _kolCashBack  : Integer = 3;

procedure TfrmPopupDetailCashback.ShowWithUserId(aUnitId: Integer; aBegBlcId:
    Integer);
begin
  FUnitId   := aUnitId;
  FbegBlcID := aBegBlcId;

//  edtCashierID.Text := aCashierID;
//  edtCashierNm.Text := aCashierNm;
//  edtShift.Text     := aShift;

  ParseDataGrid;
  Self.Show;
end;
procedure TfrmPopupDetailCashback.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmPopupDetailCashback.FormDestroy(Sender: TObject);
begin
  frmPopupDetailCashback := nil;
end;

procedure TfrmPopupDetailCashback.ParseDataGrid;
var
  sSQL  : string;
//  i, n  : Integer;
begin
  ParseHeaderGrid;

   sSQL := 'select t.TRANS_DATE, CC.CARD_NAME, tc.TRANSC_TRANS_NO,'
            + ' tc.TRANSC_CHARGE + TRANSC_CASHBACK_CHARGE + tc.TRANSC_CASHBACK_NILAI'
          	+ ' from transaksi t '
            + ' inner join transaksi_card tc on tc.transc_trans_no = t.trans_no '
            + ' and tc.transc_trans_unt_id = t.trans_unt_id '
            + ' and t.trans_balance_id = ' + IntToStr(FBegBlcId)
            + ' and t.trans_balance_unt_id = ' + IntToStr(FUnitID)
          	+ ' and t.trans_bayar_card > 0 '
            + ' inner join ref$credit_card cc on cc.card_id = tc.transc_card_id '
            + ' and cc.card_unt_id = tc.transc_card_unt_id '
            + ' ORDER BY t.TRANS_DATE';
//            + ' group by cc.card_is_credit ';
  {
  i := strgGrid.FixedRows;
  n := 0;
  with cOpenQuery(sSQL) do
  begin
    try
      while not Eof  do
      begin

        if n > 0 then
          strgGrid.AddRow;

        strgGrid.Cells[_kolDateTime, i + n]   := FormatDateTime('HH:MM:SS',  Fields[0].AsDateTime);
        strgGrid.Cells[_kolCardCode, i + n]   := Fields[1].AsString;
        strgGrid.Cells[_kolTransctNo, i + n]  := Fields[2].AsString;
        strgGrid.Cells[_kolCashBack, i + n]   := FloatToStr(Fields[3].asFloat);

        Inc(n);
        Next;
      end;

    finally
      Free;
    end;
  end;
  strgGrid.FloatingFooter.ColumnCalc[_kolCashBack] := acSUM;
  strgGrid.AutoSize := True;
   }
end;

procedure TfrmPopupDetailCashback.ParseHeaderGrid;
begin
  {with strgGrid do
  begin
    Clear;
    ColCount := 4;
    RowCount := 3;
    Cells[_kolDateTime,0]   := 'TIME';
    Cells[_kolCardCode,0]   := 'CARD CODE';
    Cells[_kolTransctNo,0]  := 'TRANSACTION NO.';
    Cells[_kolCashBack,0]   := 'CASHBACK';

    FixedRows := 1;         
  end;
  }
end;

procedure TfrmPopupDetailCashback.lblCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPopupDetailCashback.strgGridGetFloatFormat(Sender: TObject;
  ACol, ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  if ACol in [_kolDateTime.._kolTransctNo] then
    IsFloat := False;

  if IsFloat then
    FloatFormat := '%.2n';
end;

end.
