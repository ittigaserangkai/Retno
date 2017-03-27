unit ufrmPopupHistCD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DateUtils, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxLabel, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TfrmPopupHistCD = class(TForm)
    pnl1: TPanel;
    pnl3: TPanel;
    lbl3: TLabel;
    lbl2: TLabel;
    lbl1: TLabel;
    lbl4: TLabel;
    dt1: TcxDateEdit;
    edtShift: TEdit;
    edtPOSCode: TEdit;
    edtCashierID: TEdit;
    edtCashierName: TEdit;
    pnl2: TPanel;
    lblClose: TcxLabel;
    pnl4: TPanel;
    lbl6: TLabel;
    edtSupervisorID: TEdit;
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    cxlvMaster: TcxGridLevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblCloseClick(Sender: TObject);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
  private
    dataCashDropp: TDataSet;

    procedure ParseHeaderGrid(jmlData: Integer);
    procedure ParseDataGrid();
    procedure InitForm();
  public
    { Public declarations }
    Unit_ID: Integer;
    balanceID: Integer;
    balanceDate: TDateTime;
    balancePOSCode, balanceShiftName, balanceCashierName, balanceCashierFullName: string;
  end;

var
  frmPopupHistCD: TfrmPopupHistCD;

implementation

{$R *.dfm}

procedure TfrmPopupHistCD.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmPopupHistCD.FormDestroy(Sender: TObject);
begin
  frmPopupHistCD := nil;
end;

procedure TfrmPopupHistCD.ParseDataGrid;
var intI: Integer;
    tempBool: Boolean;
    tempStartCash,tempCashDrop,tempEndCash: Currency;
    AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word;
begin
  {if not Assigned(CashDropping) then
    CashDropping := TCashDropping.Create;

  dataCashDropp := CashDropping.GetListDataCashDroppingDetil(balanceID, Unit_ID);

  ParseHeaderGrid(dataCashDropp.RecordCount);

  if dataCashDropp.RecordCount > 0 then
  begin
    //initiate
    intI := 1;
    tempStartCash := 0;
    dataCashDropp.First;

    while not(dataCashDropp.Eof) do
    begin
      with strgGrid do
      begin
        tempCashDrop := dataCashDropp.FieldByName('CASHDROP_TOTAL').AsCurrency;
        tempEndCash := tempStartCash + tempCashDrop;

        Cells[0,intI] := CurrToStr(tempStartCash);
        Alignments[0,intI] := taRightJustify;
        Cells[1,intI] := CurrToStr(tempCashDrop);
        Alignments[1,intI] := taRightJustify;
        Cells[2,intI] := CurrToStr(tempEndCash);
        Alignments[2,intI] := taRightJustify;

        try
          DecodeDateTime(dataCashDropp.FieldByName('CASHDROP_DATE').AsDateTime,
                         AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond);
        finally
          Cells[3,intI] := IntToStr(AHour) +':'+ IntToStr(AMinute)
                     +':'+ IntToStr(ASecond) +':'+ IntToStr(AMilliSecond);

        end;

        Cells[4,intI] := dataCashDropp.FieldByName('CASHDROP_DATE').AsString;
        Cells[5,intI] := dataCashDropp.FieldByName('POS_CODE').AsString;
        Cells[6,intI] := dataCashDropp.FieldByName('BALANCE_SHIFT_ID').AsString;
        Cells[7,intI] := dataCashDropp.FieldByName('CASHIER_ID').AsString;
        Cells[8,intI] := dataCashDropp.FieldByName('CASHIER_FULLNAME').AsString;
        Cells[9,intI] := dataCashDropp.FieldByName('SUPERVISOR_FULLNAME').AsString;

        tempStartCash := tempEndCash;
      end;

      Inc(intI);
      dataCashDropp.Next;
    end; //while not eof
  end;// end if recordcount

  strgGrid.FixedRows := 1;
  strgGrid.AutoSize := true;

  tempBool := True;
  strgGridRowChanging(Self,0,1,tempBool);
  }
end;

procedure TfrmPopupHistCD.ParseHeaderGrid(jmlData: Integer);
begin
  {with strgGrid do
  begin
    Clear;
    ColCount := 4;
    RowCount := jmlData + 1;
    Cells[0,0] := 'START CASH';
    Cells[1,0] := 'CASH DROPPING';
    Cells[2,0] := 'END CASH';
    Cells[3,0] := 'TIME';

    if jmlData < 1 then
    begin
      RowCount := 2;
      Cells[0,1] := '';
      Cells[1,1] := '';
      Cells[2,1] := '';
      Cells[3,1] := '';
    end;

    FixedRows := 1;
    AutoSize := true;
  end;
  }
end;

procedure TfrmPopupHistCD.FormShow(Sender: TObject);
begin
  InitForm;
  ParseDataGrid;
end;

procedure TfrmPopupHistCD.InitForm();
begin
  dt1.Date := balanceDate;
  edtPOSCode.Text := balancePOSCode;
  edtShift.Text := balanceShiftName;
  edtCashierID.Text := balanceCashierName;
  edtCashierName.Text := balanceCashierFullName;
end;

procedure TfrmPopupHistCD.lblCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPopupHistCD.strgGridRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
//  edtSupervisorID.Text := strgGrid.Cells[9,NewRow];
end;

end.
