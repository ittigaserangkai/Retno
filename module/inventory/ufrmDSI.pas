unit ufrmDSI;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms,
  ufrmMasterBrowse, StdCtrls, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  System.Actions, Vcl.ActnList, ufraFooter4Button, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC;

type
  TfrmDSI = class(TfrmMasterBrowse)
    pnl1: TPanel;
    lbl1: TLabel;
    cbbMerchan: TComboBox;
    lbl2: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    procedure actRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
    procedure edt2KeyPress(Sender: TObject; var Key: Char);
  private                  
    procedure ParseHeaderGrid();
    procedure ShowProduct(AMerchanGroup, ACode, AName: string);
  public
    { Public declarations }
  end;

var
  frmDSI: TfrmDSI;

implementation

{$R *.dfm}

procedure TfrmDSI.actRefreshExecute(Sender: TObject);
begin
  inherited;
  if (cbbMerchan.Text = 'All') then
    ShowProduct('', edt1.Text,edt2.Text)
  else
    ShowProduct(cbbMerchan.Text, edt1.Text, edt2.Text);
end;

procedure TfrmDSI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDSI.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'KARTU STOCK (DSI)';
  ParseHeaderGrid;
end;

procedure TfrmDSI.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDSI := nil;
end;

procedure TfrmDSI.ParseHeaderGrid;
begin 
  {with strgGrid do
  begin
    Clear;
    ColCount := 9;
    RowCount := 2;
    Cells[0,0] := 'No.';
    Cells[1,0] := 'Merchandise Group';
    Cells[2,0] := 'Product Code';
    Cells[3,0] := 'Product Name';
    Cells[4,0] := 'Selling Price';
    Cells[5,0] := 'UOM';
    Cells[6,0] := 'Qty Store';
    Cells[7,0] := 'Qty Selling POS';
    Cells[8,0] := 'Qty of Day';

    FixedRows := 1;
    AutoSize := true;
  end;
  }
end;

procedure TfrmDSI.edt1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    actRefreshExecute(self);
    cxGrid.SetFocus;
  end;
end;

procedure TfrmDSI.ShowProduct(AMerchanGroup, ACode, AName: string);
var i: integer;
begin 
  ParseHeaderGrid;
  {
  strgGrid.RowCount := strgGrid.RowCount-1;
  for i:=1 to 10 do
  begin
    with strgGrid do
    begin
      Cells[0,i] := inttostr(i);
      Cells[1,i] := 'HARDLINE';
      Cells[2,i] := '0202910001';
      Cells[3,i] := 'WINGS CREAM DET PROMO 20/225GR';
      Cells[4,i] := '9500';
      Alignments[4,i] := taRightJustify;
      Cells[5,i] := 'CRT';    
      Cells[6,i] := '55';
      Cells[7,i] := '30';
      Cells[8,i] := '25';
      RowCount := RowCount + 1;
    end;
  end;

  strgGrid.AutoSize := true;
  strgGrid.FixedRows := 1;
  }
end;

procedure TfrmDSI.edt2KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    actRefreshExecute(self);
    cxGrid.SetFocus;
  end;
end;

end.
