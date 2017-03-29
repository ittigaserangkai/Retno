unit ufrmPopupHistCDFP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls,
  DateUtils, cxGraphics, cxControls, cxLookAndFeels, DB,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid;

type
  TfrmPopupHistCDFP = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    dt1: TcxDateEdit;
    lbl3: TLabel;
    lbl2: TLabel;
    edtShift: TEdit;
    lbl1: TLabel;
    edtPOSCode: TEdit;
    lbl4: TLabel;
    edtCashierID: TEdit;
    edtCashierName: TEdit;
    lblClose: TcxLabel;
    pnl4: TPanel;
    lbl5: TLabel;
    edtNote: TEdit;
    lbl6: TLabel;
    edtSupervisorID: TEdit;
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    cxlvMaster: TcxGridLevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure lblCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
  private
    dataFinPay: TDataSet;
    procedure ParseHeaderGrid(jmlData: Integer);
    procedure ParseDataGrid();
  public
    { Public declarations }
    balanceID: Integer;
    UnitID: integer;
  end;

var
  frmPopupHistCDFP: TfrmPopupHistCDFP;

implementation

uses uConstanta;

{$R *.dfm}

procedure TfrmPopupHistCDFP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmPopupHistCDFP.FormDestroy(Sender: TObject);
begin
  frmPopupHistCDFP := nil;
end;

procedure TfrmPopupHistCDFP.ParseDataGrid;
var intI: Integer;
    tempBool: Boolean;
    tempStartCash,tempFinPay,tempEndCash: Currency;
    AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word;
begin
  {if not Assigned(FinalPayment) then
    FinalPayment := TFinalPayment.Create;

  dataFinPay := FinalPayment.GetListDataFinalPaymentDetil(balanceID,UnitID);
  ParseHeaderGrid(dataFinPay.RecordCount);

  if dataFinPay.RecordCount > 0 then
  begin
    //initiate
    intI := 1;
    tempStartCash := 0;
    dataFinPay.First;

    while not(dataFinPay.Eof) do
    begin
      with strgGrid do
      begin
        tempFinPay := dataFinPay.FieldByName('TOTAL_FINPAY').AsCurrency;
        tempEndCash := tempStartCash + tempFinPay;

        Cells[0,intI] := CurrToStr(tempStartCash);
        Alignments[0,intI] := taRightJustify;
        Cells[1,intI] := CurrToStr(tempFinPay);
        Alignments[1,intI] := taRightJustify;
        Cells[2,intI] := CurrToStr(tempEndCash);
        Alignments[2,intI] := taRightJustify;

        try
          DecodeDateTime(dataFinPay.FieldByName('DATE_CREATE').AsDateTime,
                         AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond);
        finally
          Cells[3,intI] := IntToStr(AHour) +':'+ IntToStr(AMinute)
                     +':'+ IntToStr(ASecond) +':'+ IntToStr(AMilliSecond);

        end;

        Cells[4,intI] := dataFinPay.FieldByName('DATE_CREATE').AsString;
        Cells[5,intI] := dataFinPay.FieldByName('POS_CODE').AsString;
        Cells[6,intI] := dataFinPay.FieldByName('SHIFT_NAME').AsString;
        Cells[7,intI] := dataFinPay.FieldByName('USR_USERNAME').AsString;
        Cells[8,intI] := dataFinPay.FieldByName('CASHIER_FULLNAME').AsString;
        Cells[9,intI] := dataFinPay.FieldByName('SUPERVISOR_FULLNAME').AsString;

        tempStartCash := tempEndCash;

      end; //END WITH STRGRID

      Inc(intI);
      dataFinPay.Next;
    end; //while not eof
  end;// end if recordcount

  strgGrid.FixedRows := 1;
  strgGrid.AutoSize := true;

  tempBool := True;
  strgGridRowChanging(Self,0,1,tempBool);
  }
end;

procedure TfrmPopupHistCDFP.ParseHeaderGrid(jmlData: Integer);
begin
  {with strgGrid do
  begin
    Clear;
    ColCount := 4;
    RowCount := jmlData + 1;
    Cells[0,0] := 'START CASH';
    Cells[1,0] := 'INPUT';
    Cells[2,0] := 'END CASH';
    Cells[3,0] := 'TIME';

    if jmlData < 1 then
    begin
      RowCount := 2;
    end;

    FixedRows := 1;
    AutoSize := true;
  end;
  }
end;

procedure TfrmPopupHistCDFP.lblCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPopupHistCDFP.FormShow(Sender: TObject);
begin
  ParseDataGrid;
end;

procedure TfrmPopupHistCDFP.strgGridRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  {
  try
    if strgGrid.Cells[4,NewRow] <> '' then
      dt1.Date := StrToDateTime(strgGrid.Cells[4,NewRow]);
    edtNote.Text := 'Final Payment';
  except
    //do nothing
  end;

  edtPOSCode.Text := strgGrid.Cells[5,NewRow];
  edtShift.Text := strgGrid.Cells[6,NewRow];
  edtCashierID.Text := strgGrid.Cells[7,NewRow];
  edtCashierName.Text := strgGrid.Cells[8,NewRow];
  edtSupervisorID.Text := strgGrid.Cells[9,NewRow];
  }
end;

end.
