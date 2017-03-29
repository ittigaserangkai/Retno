unit ufrmSearchWastageReal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialogBrowse, StdCtrls, Mask, ExtCtrls,
  System.Actions, Vcl.ActnList,
  ufraFooterDialog3Button, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxCheckBox, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid;

type                              
  TFormMode = (fmAdd, fmEdit);
  TfrmSearchWastageReal = class(TfrmMasterDialogBrowse)
    pnl1: TPanel;
    cb1: TcxCheckBox;
    dt2: TcxDateEdit;
    dt1: TcxDateEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    btn1: TcxButton;
    lbl3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt1Change(Sender: TObject);
    procedure cb1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure strgGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FIsProcessSuccessfull: boolean;
    FFormMode: TFormMode;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure FindDataOnGrid(AText: String);
    procedure ParseHeaderGrid();
    procedure ParseDataGrid();
  public
    { Public declarations }    
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmSearchWastageReal: TfrmSearchWastageReal;

implementation

{$R *.dfm}

procedure TfrmSearchWastageReal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmSearchWastageReal.FormDestroy(Sender: TObject);
begin
  inherited;
  frmSearchWastageReal := nil;
end;

procedure TfrmSearchWastageReal.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;
  FIsProcessSuccessfull := true;
  close;
end;

procedure TfrmSearchWastageReal.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmSearchWastageReal.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmSearchWastageReal.ParseHeaderGrid;
begin
  {with strgGrid do
  begin
    Clear;
    RowCount := 2;
    ColCount := 4;
    Cells[0,0] := 'TRANSACT NO.';
    Cells[1,0] := 'DATE';
    Cells[2,0] := 'PO NO.';
    Cells[3,0] := 'RECEIVE DATE';

    AutoSize := true;
  end;
  }
end;

procedure TfrmSearchWastageReal.FormShow(Sender: TObject);
begin
  dt2.Date := now;
  dt1.Date := now;
  cb1.Checked := false;
  cb1Click(self);
  ParseHeaderGrid;
  ParseDataGrid;
end;

procedure TfrmSearchWastageReal.FindDataOnGrid(AText: String);
var
  resPoint: TPoint;
begin
  if (AText <> '') then
  begin
    {
    resPoint := strgGrid.Find(Point(0,0),AText,[fnIncludeFixed]);
    if (resPoint.Y <> -1) then
    begin    
      strgGrid.ScrollInView(resPoint.X, resPoint.Y);
      strgGrid.SelectRows(resPoint.Y, 1);
    end;
    }
  end;
end;

procedure TfrmSearchWastageReal.edt1Change(Sender: TObject);
begin
  FindDataOnGrid(edt1.Text);
end;

procedure TfrmSearchWastageReal.cb1Click(Sender: TObject);
begin
  if (cb1.Checked) then
  begin
    dt1.Enabled := true;
    dt2.Enabled := true;
  end
  else
  begin                 
    dt1.Enabled := false;
    dt2.Enabled := false;
  end;
end;

procedure TfrmSearchWastageReal.ParseDataGrid;
var i: integer;
begin
  ParseHeaderGrid;
  {
  with strgGrid do
  begin
    RowCount := 1;
    for i:=1 to 10 do
    begin
      RowCount := RowCount + 1;
      Cells[0,i] := '00000219';
      Cells[1,i] := '25-03-2007';
      Cells[2,i] := '00192001';
      Cells[3,i] := '20-03-2007';
    end;

    AutoSize := true;
    FixedRows := 1;
  end;
  }
end;

procedure TfrmSearchWastageReal.btn1Click(Sender: TObject);
begin
  ParseHeaderGrid;
  ParseDataGrid;
end;

procedure TfrmSearchWastageReal.strgGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_UP) then
  {  if (strgGrid.Row = 1) then
    begin
      edt1.SetFocus;
      edt1.SelectAll;
    end;
    }
end;

procedure TfrmSearchWastageReal.edt1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DOWN) then
    cxGrid.SetFocus;
end;

end.
