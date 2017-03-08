unit ufraStockCard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Grids, BaseGrid, AdvGrid, ExtCtrls, StdCtrls, Mask, JvMaskEdit,
  JvSpin, JvEdit, JvTypedEdit, JvLabel, DateUtils, Math, JvFloatEdit;

type
  TFormMode = (fmProduct, fmSO, fmNone);

  TfraStockCard = class(TFrame)
    pnl4: TPanel;
    pnl1: TPanel;
    pnl2: TPanel;
    strgGrid: TAdvStringGrid;
    pnl3: TPanel;
    cbbBulan: TComboBox;
    lbl1: TLabel;
    spnedtTahun: TJvSpinEdit;
    cbbStockFor: TComboBox;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl15: TLabel;
    lbl14: TLabel;
    lbl13: TLabel;
    lbl12: TLabel;
    lblClose: TJvLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl11: TLabel;
    edtDocNo: TEdit;
    edtDocType: TEdit;
    edtDescription: TEdit;
    Label1: TLabel;
    intedtBeginning: TJvValidateEdit;
    intedtReceiving: TJvValidateEdit;
    intedtTransferIn: TJvValidateEdit;
    intedtCN: TJvValidateEdit;
    intedtDN: TJvValidateEdit;
    intedtRetur: TJvValidateEdit;
    intedtSales: TJvValidateEdit;
    intedtTransferOut: TJvValidateEdit;
    intedtWastage: TJvValidateEdit;
    intedtEnding: TJvValidateEdit;
    Label2: TLabel;
    intedtAdjustment: TJvValidateEdit;
    Label3: TLabel;
    intedtStockOpname: TJvValidateEdit;
    procedure lblCloseClick(Sender: TObject);
    procedure cbbBulanChange(Sender: TObject);
    procedure spnedtTahunKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure strgGridClick(Sender: TObject);
  private
    FProductCode: string;
    FFormMode: TFormMode;
    { Private declarations }
    procedure ParseDataGrid();
    procedure SetProductCode(const Value: string);
    procedure SetAllValue;
  public
    procedure ShowStockCard(AProductCode: String);
  published
    property ProductCode: string read FProductCode write SetProductCode;
    property FormMode: TFormMode read FFormMode write FFormMode;
  end;

var
  fraStockCard: TfraStockCard;

implementation

uses uStockCard, uConn, DB, ufrmProduct, ufrmMain;

{$R *.dfm}

procedure TfraStockCard.lblCloseClick(Sender: TObject);
begin
  fraStockCard.Parent := nil;  
  if FFormMode <> fmSO then
    frmProduct.SetActiveFooter5Button(True);
end;

procedure TfraStockCard.SetAllValue;
begin
  if not assigned(StockCard) then
    StockCard := TStockCard.Create;
  with StockCard do
  begin
    PeriodeBulan:= cbbBulan.ItemIndex+1;
    PeriodeTahun:= Floor(spnedtTahun.Value);
    Stock:= cbbStockFor.Text;
    ProductCode:= Self.ProductCode;
    UnitId := frmMain.UnitId;
    intedtBeginning.Value:= ValueBeginning;
    intedtReceiving.Value:= ValueReceiving;
    intedtTransferIn.Value:= ValueTransferIn;
    intedtCN.Value:= ValueCN;
    intedtDN.Value:= ValueDN;
    intedtRetur.Value:= ValueRetur;
    intedtSales.Value:= ValueSales;
    intedtTransferOut.Value:= ValueTransferOut;
    intedtWastage.Value:= ValueWastage;
    intedtAdjustment.Value := ValueAdjustment;
    intedtStockOpname.Value := ValueStockOpname;
    intedtEnding.Value:= ValueEnding;
  end;
end;

procedure TfraStockCard.ParseDataGrid;
var data  : TResultDataSet;
    i     : Integer;
begin
  with strgGrid do
  begin
    Clear;
    RowCount := 2;
    ColCount := 4;
    Cells[0,0] := 'DATE';
    Cells[1,0] := 'IN';
    Cells[2,0] := 'OUT';
    Cells[3,0] := 'SALDO';
    Assert(StockCard <> nil);

    data:= StockCard.GetListStockCard;
    if not data.IsEmpty then
      with data do
      begin
        RowCount:= data.RecordCount+1;
        i:=1;
        while not Eof do
        begin
          Cells[0,i] := FormatDateTime('dd MMMM yyyy', fieldbyname('PSC_DATE').AsDateTime);
          if cbbStockFor.Text='All' then
          begin
            Cells[1,i] := FloatToStr(data.fieldbyname('PSC_QTY_IN').AsFloat);
            Cells[2,i] := FloatToStr(data.fieldbyname('PSC_QTY_OUT').AsFloat);
            Cells[3,i] := FloatToStr(data.fieldbyname('PSC_QTY_SALDO').AsFloat);
          end
          else if cbbStockFor.Text='Common' then
          begin
            Cells[1,i] := FloatToStr(data.fieldbyname('PSC_QTY_COMMON_IN').AsFloat);
            Cells[2,i] := FloatToStr(data.fieldbyname('PSC_QTY_COMMON_OUT').AsFloat);
            Cells[3,i] := FloatToStr(data.fieldbyname('PSC_QTY_SALDO_COMMON').AsFloat);
          end
          else if cbbStockFor.Text='Trader' then
          begin
            Cells[1,i] := FloatToStr(data.fieldbyname('PSC_QTY_TRADER_IN').AsFloat);
            Cells[2,i] := FloatToStr(data.fieldbyname('PSC_QTY_TRADER_OUT').AsFloat);
            Cells[3,i] := FloatToStr(data.fieldbyname('PSC_QTY_SALDO_TRADER').AsFloat);
          end
          else if cbbStockFor.Text='Asgross' then
          begin
            Cells[1,i] := FloatToStr(data.fieldbyname('PSC_QTY_ASSGROS_IN').AsFloat);
            Cells[2,i] := FloatToStr(data.fieldbyname('PSC_QTY_ASSGROS_OUT').AsFloat);
            Cells[3,i] := FloatToStr(data.fieldbyname('PSC_QTY_SALDO_ASSGROS').AsFloat);
          end;

          Cells[4,i] := fieldbyname('PSC_DOC_NO').AsString;
          Cells[5,i] := fieldbyname('PSC_TRANS_TYPE').AsString;
          Cells[6,i] := fieldbyname('PSC_DESCRIPTION').AsString;
          Inc(i);
          Next;
        end;
      end;
    AutoSize:= True;
    OnClick(Self);
  end;
end;

procedure TfraStockCard.SetProductCode(const Value: string);
begin
  FProductCode := Value;
end;

procedure TfraStockCard.ShowStockCard(AProductCode: String);
begin
  cbbBulan.ItemIndex:= MonthOf(Now)-1;
  spnedtTahun.Value:= YearOf(Now);
  SetAllValue;
  ParseDataGrid;
  cbbBulan.SetFocus;
end;

procedure TfraStockCard.cbbBulanChange(Sender: TObject);
begin
  SetAllValue;
  ParseDataGrid;
end;

procedure TfraStockCard.spnedtTahunKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    SetAllValue;
    ParseDataGrid;
  end;
end;

procedure TfraStockCard.strgGridGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if(ARow=0)then HAlign:= taCenter;
end;

procedure TfraStockCard.strgGridClick(Sender: TObject);
begin
  edtDocNo.Text:= strgGrid.Cells[4,strgGrid.row];
  edtDocType.Text:= strgGrid.Cells[5,strgGrid.row];
  edtDescription.Text:= strgGrid.Cells[6,strgGrid.row];
end;

end.
