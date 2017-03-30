unit ufrmSearchSupplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, StdCtrls, ufraFooterDialog2Button, ExtCtrls, uConn,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, Vcl.Menus, cxButtons, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button;

type
  TsearchFor = (sfProductSup, sfMasterSup);

  TfrmDialogSearchSupplier = class(TfrmMasterDialog)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    edtSupCode: TEdit;
    edtSupName: TEdit;
    pnl2: TPanel;
    cxGrid: TcxGrid;
    cxGridViewSearchSupplier: TcxGridDBTableView;
    cxGridViewSearchSupplierColumn1: TcxGridDBColumn;
    cxGridViewSearchSupplierColumn2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    btnSearch: TcxButton;
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure edtSupCodeChange(Sender: TObject);
    procedure edtSupNameChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure strgGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSupCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSupNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FIsProcessSuccessfull: boolean;
    FSupplierCode: string;
    FSupplierName: string;
    data : TDataSet;

    procedure SetIsProcessSuccessfull(const Value: boolean); 
    procedure FindDataOnGrid(AText: String);
    procedure SetSupplierCode(const Value: string);
    procedure SetSupplierName(const Value: string);
    procedure ParserGrid(jmlData: Integer);
    { Private declarations }
  public
    { Public declarations }
    searchFor: TsearchFor;
  published
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
    property SupplierCode: string read FSupplierCode write SetSupplierCode;
    property SupplierName: string read FSupplierName write SetSupplierName;
  end;

var
  frmDialogSearchSupplier: TfrmDialogSearchSupplier;

implementation

uses ufrmMain, ufrmProduct;

{$R *.dfm}

procedure TfrmDialogSearchSupplier.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  //initiate
  SupplierCode := '';
  SupplierName := '';
  IsProcessSuccessfull := False;

//  if(strgGrid.Cells[0,strgGrid.Row])='' then Exit
//  else
//  begin
//    SupplierCode := strgGrid.Cells[0,strgGrid.Row];
//    SupplierName := strgGrid.Cells[1,strgGrid.Row];
//    IsProcessSuccessfull := True;
//  end;

  Close;
end;

procedure TfrmDialogSearchSupplier.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogSearchSupplier.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogSearchSupplier.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogSearchSupplier := nil;
end;

procedure TfrmDialogSearchSupplier.FindDataOnGrid(AText: String);
//var
//  resPoint: TPoint;
begin
  if (AText <> '') then
  begin
//    resPoint := strgGrid.Find(Point(0,0),AText,[fnIncludeFixed]);
//    if (resPoint.Y <> -1) then
//    begin
//      strgGrid.ScrollInView(resPoint.X, resPoint.Y);
//      strgGrid.SelectRows(resPoint.Y, 1);
//    end;
  end;
end;

procedure TfrmDialogSearchSupplier.edtSupCodeChange(Sender: TObject);
begin
  if Length(edtSupCode.Text) = 1 then
  begin
//    if not Assigned(SearchSupplier) then SearchSupplier := TSearchSupplier.Create;
//
//    if searchFor = sfProductSup then
//    begin
//      data := SearchSupplier.GetListSup4ProductSupByCode
//              (frmMain.UnitId, frmProduct.edtMerchandCode.Text, edtSupCode.Text + '%');
//      ParserGrid(data.RecordCount);
//    end // product sup
//    else if searchFor = sfMasterSup then
//    begin
//      data := SearchSupplier.GetListSup4MasterSupByCode(frmMain.UnitId, edtSupCode.Text  + '%');
//      ParserGrid(data.RecordCount);
//    end; // master sup

  end // length = 1
  else
    FindDataOnGrid(edtSupCode.Text);
end;

procedure TfrmDialogSearchSupplier.edtSupNameChange(Sender: TObject);
begin
  if Length(edtSupName.Text) = 1 then
  begin
//    if not Assigned(SearchSupplier) then SearchSupplier := TSearchSupplier.Create;

    if searchFor = sfProductSup then
    begin
//      data := SearchSupplier.GetListSup4ProductSupByName
//              (frmMain.UnitId, frmProduct.edtMerchandCode.Text, edtSupName.Text + '%');
      ParserGrid(data.RecordCount);
    end // product sup
    else if searchFor = sfMasterSup then
    begin
//      data := SearchSupplier.GetListSup4MasterSupByName(frmMain.UnitId, edtSupName.Text + '%');
      ParserGrid(data.RecordCount);
    end; // master sup

  end // length = 1
  else
    FindDataOnGrid(edtSupName.Text);
end;

procedure TfrmDialogSearchSupplier.SetSupplierCode(const Value: string);
begin
  FSupplierCode := Value;
end;

procedure TfrmDialogSearchSupplier.SetSupplierName(const Value: string);
begin
  FSupplierName := Value;
end;

procedure TfrmDialogSearchSupplier.FormShow(Sender: TObject);
//var i, countData : integer;
begin
  {if not Assigned(SearchSupplier) then SearchSupplier := TSearchSupplier.Create;

  if searchFor = sfProductSup then
    data := SearchSupplier.GetListSupplier4ProductSup(frmMain.UnitId,frmProduct.edtGroupCode.Text) //modif by didit: edtMerchandCode->edtGroupCode
  else if searchFor = sfMasterSup then
    data := SearchSupplier.GetListSup4MasterSup(frmMain.UnitId);

  if data.RecordCount > 22 then countData := 22
  else countData := data.RecordCount;

  with strgGrid do
  begin
    Clear;
    RowCount := countData + 1;
    ColCount := 2;

    Cells[0,0] := 'SUPPLIER CODE';
    Cells[1,0] := 'SUPPLIER NAME';

    if RowCount > 1 then
    begin
      i := 1;
      while not data.Eof do
      begin
        Cells[0, i] := data.FieldByName('SUP_CODE').AsString;
        Cells[1, i] := data.FieldByName('SUP_NAME').AsString;

        if searchFor = sfProductSup then
        begin
          Cells[2, i] := data.FieldByName('TOP').AsString;
          Cells[3, i] := data.FieldByName('SUB_CODE').AsString;
        end;

        if i > 22 then Exit;
        Inc(i);
        data.Next;
      end;
    end
    else
    begin
      RowCount := 2;
      Cells[0, 1] := ' ';
      Cells[1, 1] := ' ';
      Cells[2, 1] := '0';
      Cells[3, 1] := '0';
    end;
    AutoSize := true;
  end;
  edtSupCode.SetFocus;
  strgGrid.FixedRows := 1;   }

end;

procedure TfrmDialogSearchSupplier.ParserGrid(jmlData: Integer);
//var i: Integer;
begin
 { with strgGrid do
  begin
    Clear;
    RowCount := jmlData + 1;
    ColCount := 2;

    Cells[0,0] := 'SUPPLIER CODE';
    Cells[1,0] := 'SUPPLIER NAME';

    if RowCount > 1 then
    begin
      i := 1;
      while not data.Eof do
      begin
        Cells[0, i] := data.FieldByName('SUP_CODE').AsString;
        Cells[1, i] := data.FieldByName('SUP_NAME').AsString;

        if searchFor = sfProductSup then
        begin
          Cells[2, i] := data.FieldByName('TOP').AsString;
          Cells[3, i] := data.FieldByName('SUB_CODE').AsString;
        end;
        Inc(i);
        data.Next;
      end;
    end
    else
    begin
      RowCount := 2;
      Cells[0, 1] := ' ';
      Cells[1, 1] := ' ';
      Cells[2, 1] := '0';
      Cells[3, 1] := '0';
    end;
    AutoSize := true;
  end;
  edtSupCode.SetFocus;
  strgGrid.FixedRows := 1; }
end;

procedure TfrmDialogSearchSupplier.strgGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  if (Key = Ord(VK_UP)) then
//    if (strgGrid.Row = 1) then
//    begin
//      edtSupCode.SetFocus;
//      edtSupCode.SelectAll;
//    end;
end;

procedure TfrmDialogSearchSupplier.edtSupCodeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  if (Key = Ord(VK_DOWN)) then
//    strgGrid.SetFocus;
end;

procedure TfrmDialogSearchSupplier.edtSupNameKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  if (Key = Ord(VK_DOWN)) then
//    strgGrid.SetFocus;
end;

end.
