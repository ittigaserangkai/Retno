unit ufrmDetilPOFromTrader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, StdCtrls, Grids, BaseGrid, AdvGrid,
  ufraFooterDialog2Button, ExtCtrls, SUIForm, JvEdit, Mask, JvToolEdit, AdvObj,
  JvExMask, JvExStdCtrls, JvValidateEdit;

type
  TfrmDetilPOFromTrader = class(TfrmMasterDialog)
    Panel1: TPanel;
    Panel2: TPanel;
    strgGrid: TAdvStringGrid;
    lblPOTrader: TLabel;
    lblPOTraderDate: TLabel;
    edtTraderCode: TEdit;
    edtTraderName: TEdit;
    edtTraderType: TEdit;
    lbl11: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edtStatus: TEdit;
    edtLeadTime: TEdit;
    lbl5: TLabel;
    lbl9: TLabel;
    edtTOP: TEdit;
    curredtTotalPrice: TJvValidateEdit;
    lblTotalPO: TLabel;
    lbl10: TLabel;
    lbl8: TLabel;
    dtTgl: TJvDateEdit;
    edtPOASNo: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
  private

    FPOASNo: string;
    FUnitID: Integer;
    procedure SetPOASNo(const Value: string);
    procedure ParseHeaderGrid();
    procedure ParseTraderPO;
    procedure ShowQtyPOAssgrosDetilByPONo;
  public
    { Public declarations }
    procedure SetAllComponentReadOnly;
    property UnitID: Integer read FUnitID write FUnitID;
  published
    property POASNo: string read FPOASNo write SetPOASNo;
  end;

var
  frmDetilPOFromTrader: TfrmDetilPOFromTrader;

implementation

uses uRMSUnit, uPOAssgrosNew, uDOAssgros, DB, uConn;

const
      _kolNo        : integer = 0;
      _kolBrgID     : integer = 1;
      _kolBrgNm     : integer = 2;
      _kolUom       : integer = 3;
      _kolQtyOrder  : integer = 4;
      _kolQtyStock  : integer = 5;
      _kolStatus    : integer = 6;

      _fixedRow     : integer = 1;
      _colCOunt     : integer = 7;
      _rowCount     : integer = 2;




{$R *.dfm}

procedure TfrmDetilPOFromTrader.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDetilPOFromTrader.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDetilPOFromTrader := nil;
end;

procedure TfrmDetilPOFromTrader.SetPOASNo(const Value: string);
begin
  FPOASNo := Value;
end;

procedure TfrmDetilPOFromTrader.FormShow(Sender: TObject);
begin
  inherited;
  ParseTraderPO;
  ParseHeaderGrid;
  ShowQtyPOAssgrosDetilByPONo;
end;

procedure TfrmDetilPOFromTrader.ParseHeaderGrid;
begin
  with strgGrid do
  begin
    Clear;
    ColCount  := _colCOunt;
    RowCount  := _rowcount;

    Cells[_kolNo,0]       := 'NO.';
    Cells[_kolBrgID,0]    := 'PRODUCT CODE';
    Cells[_kolbrgNm,0]    := 'PRODUCT NAME';
    Cells[_kolUom,0]      := 'UOM';
    Cells[_kolQtyOrder,0] := 'QTY ORDER';
    Cells[_kolQtyStock,0] := 'QTY STOCK';
    Cells[_kolStatus,0]   := 'STATUS';

    FixedRows := _fixedRow;
    AutoSize := true;
  end;
end;

procedure TfrmDetilPOFromTrader.ParseTraderPO;
//var
//  data: TResultDataSet;
//  aParams: TArr;
begin

  with cOpenQuery(getSQLPoAssGrosTrader(FPOASNo, FUnitID))do
  begin
    try
      edtPOASNo.Text      := FPOASNo;
      dtTgl.Date          := FieldByName('POAS_DATE').AsDateTime;
      edtTraderCode.Text  := FieldByName('TRD_CODE').AsString;
      edtTraderName.Text  := FieldByName('TRD_NAME').AsString;

      if (FieldByName('TRD_IS_ASSGROS').AsInteger = 1) then
        edtTraderType.Text := 'ASSGROS'
      else
        edtTraderType.Text := 'TRADER';

      edtStatus.Text          := FieldByName('POAS_STATUS').AsString;
      edtLeadTime.Text        := inttostr(FieldByName('POAS_LEAD_TIME').AsInteger);
      edtTOP.Text             := inttostr(FieldByName('POAS_TOP').AsInteger);
      curredtTotalPrice.Value := FieldByName('POAS_TOTAL').AsCurrency;

    finally
      Free;
    end;
  end;

{
  SetLength(aParams,1);
  aParams[0].tipe := ptString;
  aParams[0].data := APONo;
  if not assigned(PurchasingOrder) then
    PurchasingOrder := TPurchasingOrder.Create;
  data := PurchasingOrder.GetTraderPOAssgros(aParams);
  if (data.RecordCount > 0) then
  begin
    with data do
    begin
      edtPOASNo.Text := POASNo;
      dtTgl.Date := FieldByName('POAS_DATE').AsDateTime;
      edtTraderCode.Text := FieldByName('TRD_CODE').AsString;
      edtTraderName.Text := FieldByName('TRD_NAME').AsString;
      if (FieldByName('TRD_IS_ASSGROS').AsInteger = 1) then
        edtTraderType.Text := 'ASSGROS'
      else
        edtTraderType.Text := 'TRADER';
      edtStatus.Text := FieldByName('POAS_STATUS').AsString;
      edtLeadTime.Text := inttostr(FieldByName('POAS_LEAD_TIME').AsInteger);
      edtTOP.Text := inttostr(FieldByName('POAS_TOP').AsInteger);
      curredtTotalPrice.Value := FieldByName('POAS_TOTAL').AsCurrency;
    end;
  end;
  }
end;

procedure TfrmDetilPOFromTrader.ShowQtyPOAssgrosDetilByPONo;
var
//aParams: TArr;
//    data: TResultDataSet;
    i, n, m: integer;
begin

  if strgGrid.FloatingFooter.Visible then
    m := _fixedRow + 1
  else
    m := _fixedRow;

  n := strgGrid.rowCount;
  i := 0;

  with cOpenQuery(getSQLPoAssGrosTraderDetail(FPOASNo, FUnitID)) do
  begin
    try
      while not Eof do
      begin
        if (i >= n - m) then
          strgGrid.AddRow;

        strgGrid.Cells[_kolNo, i + _fixedRow]       := inttostr(i + 1);
        strgGrid.Cells[_kolBrgID, i + _fixedRow]    := fieldByName('BRG_CODE').AsString;
        strgGrid.Cells[_kolBrgNm, i + _fixedRow]    := fieldByName('BRG_ALIAS').AsString;
        strgGrid.Cells[_kolUom, i + _fixedRow]      := fieldByName('POASD_SAT_CODE').AsString;
        strgGrid.Cells[_kolQtyOrder, i + _fixedRow] := FloatToStr(fieldByName('POASD_QTY').AsFloat);

        if (edtTraderType.Text = 'ASSGROS') then
        begin
          strgGrid.Cells[_kolQtyStock, i + _fixedRow] := inttostr(fieldByName('BRGT_ASSGROS_STOCK').AsInteger);
          if (fieldByName('POASD_QTY').AsFloat < fieldByName('BRGT_ASSGROS_STOCK').AsFloat) then
            strgGrid.Cells[_kolStatus, i + _fixedRow] := 'AVAILABLE'
          else
            strgGrid.Cells[_kolStatus, i + _fixedRow] := 'NOT AVAILABLE';
        end
        else
        begin
          strgGrid.Cells[_kolQtyStock, i + _fixedRow] := FloatToStr(fieldByName('BRGT_TRADER_STOCK').AsFloat);
          if (fieldByName('POASD_QTY').AsFloat < fieldByName('BRGT_TRADER_STOCK').AsFloat) then
            strgGrid.Cells[_kolStatus, i + _fixedRow] := 'AVAILABLE'
          else
            strgGrid.Cells[_kolStatus, i + _fixedRow] := 'NOT AVAILABLE';
        end;

        Inc(i);
        Next;
      end;  
    finally
      Free;
      strgGrid.AutoSize := true;
    end;

  end;


//  SetLength(aParams,1);
//  aParams[0].tipe := ptString;
////  aParams[0].data := APONo;
//  aParams[0].data := FPOASNo;
//  if not assigned(PurchasingOrder) then
//    PurchasingOrder := TPurchasingOrder.Create;
//  data := PurchasingOrder.GetQtyPOAssgrosDetilByNo(aParams);
//
//  ParseHeaderGrid;
//  if (data.RecordCount > 0) then
//  begin
//    with strgGrid do
//    begin
//      RowCount := RowCount+data.RecordCount-1;
//      i:=1;
//      while not data.Eof do
//      begin
//        Cells[0,i] := inttostr(i);
//        Cells[1,i] := data.fieldByName('BRG_CODE').AsString;
//        Cells[2,i] := data.fieldByName('BRG_NAME').AsString;
//        Cells[3,i] := data.fieldByName('POASD_SAT_CODE').AsString;
//        Cells[4,i] := FloatToStr(data.fieldByName('POASD_QTY').AsFloat);
//        if (edtTraderType.Text = 'ASSGROS') then
//        begin
//          Cells[5,i] := inttostr(data.fieldByName('BRGT_ASSGROS_STOCK').AsInteger);
//          if (data.fieldByName('POASD_QTY').AsFloat < data.fieldByName('BRGT_ASSGROS_STOCK').AsFloat) then
//            Cells[6,i] := 'AVAILABLE'
//          else
//            Cells[6,i] := 'NOT AVAILABLE';
//        end
//        else
//        begin
//          Cells[5,i] := FloatToStr(data.fieldByName('BRGT_TRADER_STOCK').AsFloat);
//          if (data.fieldByName('POASD_QTY').AsFloat < data.fieldByName('BRGT_TRADER_STOCK').AsFloat) then
//            Cells[6,i] := 'AVAILABLE'
//          else
//            Cells[6,i] := 'NOT AVAILABLE';
//        end;
//
//        i:=i+1;
//        data.Next;
//      end;
//
//      AutoSize := true;
//    end;
//  end;
end;

procedure TfrmDetilPOFromTrader.SetAllComponentReadOnly;
var
  i: integer;
begin
  for i:=0 to ComponentCount-1 do
    if Components[i] is TEdit then
      TEdit(Components[i]).ReadOnly := True
    else if Components[i] is TJvDateEdit then
      TJvDateEdit(Components[i]).ReadOnly := True
    else if Components[i] is TJvValidateEdit then
      TJvValidateEdit(Components[i]).ReadOnly := True;
end;

procedure TfrmDetilPOFromTrader.strgGridGetFloatFormat(Sender: TObject;
  ACol, ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  FloatFormat := '%.3n';
  if (ACol in [_kolQtyOrder,_kolQtyStock]) and (ARow > 0) then
    IsFloat := True
  else
//  if (ACol in [4,6,7]) and (ARow > 0) then
//  begin
//    FloatFormat := '%.2n';
//    IsFloat := True;
//  end
//  else
    IsFloat := False;
end;

end.
