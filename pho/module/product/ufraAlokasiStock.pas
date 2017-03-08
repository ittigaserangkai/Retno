unit ufraAlokasiStock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Grids, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  cxTextEdit, cxCurrencyEdit, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxLabel,
  Vcl.ExtCtrls;

type
  TfraAlokasiStock = class(TFrame)
    pnl1: TPanel;
    pnl4: TPanel;
    pnl2: TPanel;
    lblClose: TcxLabel;
    lbl1: TLabel;
    edt28: TEdit;
    cxViewStockAllocation: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid: TcxGrid;
    ecCurrentStock: TcxCurrencyEdit;
    procedure lblCloseClick(Sender: TObject);
  private
    FProductCode: string;
    procedure ParseHeaderGrid();
    procedure SetProductCode(const Value: string);
  public
    procedure ShowAlokasiStock(AProductCode: String);
  published
    property ProductCode: string read FProductCode write SetProductCode;
  end;

var
  fraAlokasiStock: TfraAlokasiStock;
  
implementation

uses ufrmProduct, uConn;

{$R *.dfm}

{ TfraAlokasiStock }

procedure TfraAlokasiStock.ParseHeaderGrid;
begin
  with cxViewStockAllocation.DataController do
  begin
    ClearDetails;
//    RowCount := 4;
//    ColCount := 4;
    Values[0,0] := 'STOCK ALOCATION';
    Values[1,0] := 'QTY';
    Values[2,0] := 'UOM';
    Values[3,0] := 'UOM DESC.';

    AutoSize := true;
//    FixedRows := 1;
  end;
end;

procedure TfraAlokasiStock.SetProductCode(const Value: string);
begin
  FProductCode := Value;
end;

procedure TfraAlokasiStock.ShowAlokasiStock(AProductCode: String);
var data: TDataSet;
begin
  data := TDataSet.Create(Self);
  ParseHeaderGrid;
  with cxViewStockAllocation.DataController do
  begin
    Values[0,1] := 'COMMON';
    Values[0,2] := 'TRADER';
    Values[0,3] := 'ASGROSS';

//    if not assigned(Product) then
//      Product := TProduct.Create;

    Values[1,1] := FloatToStr(data.fieldbyname('BRGT_COMMON_STOCK').AsFloat);
    Values[1,2] := FloatToStr(data.fieldbyname('BRGT_ASSGROS_STOCK').AsFloat);
    Values[1,3] := FloatToStr(data.fieldbyname('BRGT_TRADER_STOCK').AsFloat);

    Values[2,1] := frmProduct.edtUOMStockCode.Text;
    Values[2,2] := frmProduct.edtUOMStockCode.Text;
    Values[2,3] := frmProduct.edtUOMStockCode.Text;

    Values[3,1] := frmProduct.edtUOMStockName.Text;
    Values[3,2] := frmProduct.edtUOMStockName.Text;
    Values[3,3] := frmProduct.edtUOMStockName.Text;

    ecCurrentStock.EditValue:= data.fieldbyname('BRGT_STOCK').AsInteger;
    edt28.Text := frmProduct.edtUOMStockCode.Text;
    SetFocus;
  end;

end;

procedure TfraAlokasiStock.lblCloseClick(Sender: TObject);
begin
  fraAlokasiStock.Parent := nil;   
  frmProduct.SetActiveFooter5Button(True);
end;

end.
