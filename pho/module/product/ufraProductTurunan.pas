unit ufraProductTurunan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxContainer, cxTextEdit,
  cxCurrencyEdit, cxLabel, Vcl.ExtCtrls, Vcl.Menus, cxButtons;

type
  TfraProductTurunan = class(TFrame)
    pnl4: TPanel;
    pnl1: TPanel;
    lblAdd: TcxLabel;
    lblEdit: TcxLabel;
    lbl22: TcxLabel;
    lblClose: TcxLabel;
    pnl2: TPanel;
    lbl1: TLabel;
    edt30: TEdit;
    pnlAddEdit: TPanel;
    lbl2: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    lbl3: TLabel;
    fedt5: TcxCurrencyEdit;
    edt15: TEdit;
    lbl4: TLabel;
    fedt1: TcxCurrencyEdit;
    lbl5: TLabel;
    lbl7: TLabel;
    cxGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    btnCancel: TcxButton;
    btnSave: TcxButton;
    procedure lblCloseClick(Sender: TObject);
    procedure lblAddClick(Sender: TObject);
    procedure lblEditClick(Sender: TObject);
    procedure strgGridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edt1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FProductCode: string;
    procedure ParseHeaderGrid();
    procedure ParseDataGrid();
    procedure SetProductCode(const Value: string);
  public
    procedure ShowProductTurunan(AProductCode: String);
  published
    property ProductCode: string read FProductCode write SetProductCode;
  end;

var
  fraProductTurunan: TfraProductTurunan;

implementation

uses ufrmSearchProduct, ufrmProduct;

{$R *.dfm}

procedure TfraProductTurunan.lblCloseClick(Sender: TObject);
begin
  fraProductTurunan.Parent := nil;
  frmProduct.SetActiveFooter5Button(True);
end;

procedure TfraProductTurunan.lblAddClick(Sender: TObject);
begin
  fraProductTurunan.Height := 150;
  pnlAddEdit.Visible := true;
end;

procedure TfraProductTurunan.lblEditClick(Sender: TObject);
begin
  fraProductTurunan.Height := 150;
  pnlAddEdit.Visible := true;
end;

procedure TfraProductTurunan.strgGridCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  if (ACol = 0) then
    CanEdit := true
  else
    CanEdit := false;
end;

procedure TfraProductTurunan.ParseDataGrid;
begin
  ParseHeaderGrid;
//  with strgGrid do
//  begin
//    AddCheckBox(0,1,false,false);
//    Cells[1,1] := '002901';
//    Cells[2,1] := 'PCK';
//    Cells[3,1] := '0,50';
//    Cells[4,1] := '0,00';
//
//    FixedRows := 1;
//    Autosize := true;
//  end;
end;

procedure TfraProductTurunan.ParseHeaderGrid;
begin
//  with strgGrid do
//  begin
//    Clear;
//    RowCount := 10;
//    ColCount := 5;
//    Cells[0,0] := '  ';
//    Cells[1,0] := 'PRODUCT CODE';
//    Cells[2,0] := 'UOM';
//    Cells[3,0] := 'QTY';
//    Cells[4,0] := 'PERCENTAGE (%)';
//
//    FixedRows := 1;
//    Autosize := true;
//  end;
end;

procedure TfraProductTurunan.SetProductCode(const Value: string);
begin
  FProductCode := Value;
end;

procedure TfraProductTurunan.ShowProductTurunan(AProductCode: String);
begin
  ParseDataGrid;
  pnlAddEdit.Visible := false;
  cxGrid.SetFocus;
end;

procedure TfraProductTurunan.btnCancelClick(Sender: TObject);
begin
  pnlAddEdit.Visible := false;
  fraProductTurunan.Height := 200;
end;

procedure TfraProductTurunan.btnSaveClick(Sender: TObject);
begin
  // code save here..
  // if successfully..
  pnlAddEdit.Visible := false;
  fraProductTurunan.Height := 200;
end;

procedure TfraProductTurunan.edt1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F5) then
  begin
    if not assigned(frmDialogSearchProduct) then
      frmDialogSearchProduct := TfrmDialogSearchProduct.Create(Application);

//    frmDialogSearchProduct.DialogUnit     := frmProduct.MasterNewUnit.ID;
//    frmDialogSearchProduct.DialogCompany  := frmProduct.MasterCompany.ID;

    frmDialogSearchProduct.ShowModal;

    frmDialogSearchProduct.Free;
  end;
end;

end.
