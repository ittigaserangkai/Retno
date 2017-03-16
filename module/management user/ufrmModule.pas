unit ufrmModule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls,
  ufraFooter5Button, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid,
  cxClasses;

type
  TfrmModule = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    pnlBodyUp: TPanel;
    edtPencarian: TEdit;
    Label1: TLabel;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid: TcxGrid;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    cxGridDBTableView1Column5: TcxGridDBColumn;
    cxGridDBTableView1Column6: TcxGridDBColumn;
    cxGridDBTableView1Column7: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure fraFooter5Button1btnDeleteClick(Sender: TObject);
    procedure fraFooter5Button1btnRefreshClick(Sender: TObject);
    procedure fraFooter5Button1btnUpdateClick(Sender: TObject);
    procedure fraFooter5Button1btnAddClick(Sender: TObject);
    procedure edtPencarianKeyPress(Sender: TObject; var Key: Char);
    procedure edtPencarianChange(Sender: TObject);
  private
//    FMdl      : TModule;
    procedure SetData;
    procedure SetHeader;
    { Private declarations }
  public
    procedure FindDataOnGrid(aText:String);
    procedure ShowWithID(aUnitID: integer; aLoginID: integer);
    { Public declarations }
  end;

var
  frmModule: TfrmModule;  
  resPoint: TPoint;

implementation
uses
  uRetnoUnit, uTSCommonDlg, ufrmDialogModule;

{$R *.dfm}
const
  _kolNo    : Integer = 0;
  _kolID    : Integer = 1;
  _kolNm    : Integer = 2;
  _kolCap   : Integer = 3;
  _kolLbl   : Integer = 4;
  _kolAct   : Integer = 5;
  _kolPath  : Integer = 6;

  _fixedRow : Integer = 1;
  _RowCount : Integer = 2;
  _ColCount : Integer = 7;

procedure TfrmModule.SetData;
var
  m: Integer;
  i: Integer;
begin
  SetHeader;
  i := 0;
//  m := strgGrid.RowCount;
//  with cOpenQuery(getSQLModuleLIst(MasterNewUnit.ID)) do
//  begin
//    try
//      while not Eof do
//      begin
//        AddRowNo(strgGrid, _kolNo, i, m, True);
//        strgGrid.Cells[_kolID, i + _fixedRow]   := FieldByName('MOD_ID').AsString;
//        strgGrid.Cells[_kolNm, i + _fixedRow]   := FieldByName('MOD_NAME').AsString;
//        strgGrid.Cells[_kolCap, i + _fixedRow]  := FieldByName('MOD_CAPTION').AsString;
//        strgGrid.Cells[_kolLbl, i + _fixedRow]  := FieldByName('MOD_LABEL').AsString;
//        strgGrid.Cells[_kolAct, i + _fixedRow]  := FieldByName('MOD_ACTION').AsString;
//        strgGrid.Cells[_kolPath, i + _fixedRow] := FieldByName('MOD_ICON_PATH').AsString;
//
//        Inc(i);
//        Next;
//      end;
//    finally
//      Free;
//      strgGrid.AutoSize := True;
//    end;
//  end;

end;

procedure TfrmModule.SetHeader;
begin
//  with strgGrid do
//  begin
//    RowCount  := _RowCount;
//    FixedRows := _fixedRow;
//    ColCount  := _ColCount;
//
//    Cells[_kolNo, 0]    := 'NO';
//    Cells[_kolID, 0]    := 'ID';
//    Cells[_kolNm, 0]    := 'NAME';
//    Cells[_kolCap, 0]   := 'CAPTION';
//    Cells[_kolLbl, 0]   := 'LABEL';
//    Cells[_kolAct, 0]   := 'ACTION';
//    Cells[_kolPath, 0]  := 'ICON PATH';
//
//    AutoSize  := True;
//  end;
end;

procedure TfrmModule.ShowWithID(aUnitID: integer; aLoginID: integer);
begin
//  MasterNewUnit.LoadByID(aUnitID);
  FLoginID  := aLoginID;
  SetData;

  self.Show;
end;

procedure TfrmModule.FormShow(Sender: TObject);
begin
  inherited;
//  FMdl  := TModule.Create(nil);
  SetHeader;
  SetData;
end;

procedure TfrmModule.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action  := caFree;
end;

procedure TfrmModule.FormDestroy(Sender: TObject);
begin
  inherited;
//  FreeAndNil(FMdl);
  frmModule := nil;
end;

procedure TfrmModule.fraFooter5Button1btnDeleteClick(Sender: TObject);
begin
  inherited;
//  if (CommonDlg.Confirm('Are you sure you wish to delete Modul (Name: '
//                  + strgGrid.Cells[_kolNm ,strgGrid.row]+')?') = mrYes) then
//  begin
//    if FMdl.LoadByID(strgGrid.Ints[_kolID, strgGrid.Row], Masternewunit.ID) then
//    begin
//      if FMdl.RemoveFromDB then
//      begin
//        cCommitTrans;
//        CommonDlg.ShowMessage('Sukses menghapus data');
//      end
//      else
//      begin
//        cRollbackTrans;
//        CommonDlg.ShowError('Gagal menghapus data');
//      end;
//    end
//    else
//    begin
//      CommonDlg.ShowError('Data tidak ditemukan');
//    end;
//  end;
end;

procedure TfrmModule.fraFooter5Button1btnRefreshClick(Sender: TObject);
begin
  inherited;
  SetData;
end;

procedure TfrmModule.fraFooter5Button1btnUpdateClick(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogModule) then
    Application.CreateForm(TfrmDialogModule, frmDialogModule);

  frmDialogModule.Caption := 'Edit Module';
//  frmDialogModule.ModId := strgGrid.Ints[_kolID, strgGrid.Row];
  SetFormPropertyAndShowDialog(frmDialogModule);

end;

procedure TfrmModule.fraFooter5Button1btnAddClick(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogModule) then
    Application.CreateForm(TfrmDialogModule, frmDialogModule);

  frmDialogModule.Caption := 'Add Module';
  frmDialogModule.ModId := 0;
  SetFormPropertyAndShowDialog(frmDialogModule);
end;

procedure TfrmModule.edtPencarianKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = Chr(VK_RETURN) then
  begin
    if edtPencarian.Text <> '' then
    begin
//      resPoint := strgGrid.FindNext;
//      if (resPoint.Y <> -1) then
//      begin
//        strgGrid.ScrollInView(resPoint.X, resPoint.Y);
//        strgGrid.SelectRows(resPoint.Y, 1);
//      end;
    end;
  end;
end;

procedure TfrmModule.FindDataOnGrid(aText:String);
begin
  if (aText <> '') then
  begin
//    resPoint := strgGrid.Find(Point(0,0),aText,[fnIncludeFixed]);
    if (resPoint.Y <> -1) then
    begin
//      strgGrid.ScrollInView(resPoint.X, resPoint.Y);
//      strgGrid.SelectRows(resPoint.Y, 1);
    end;
  end;
end;


procedure TfrmModule.edtPencarianChange(Sender: TObject);
begin
  inherited;
  FindDataOnGrid(edtPencarian.Text);
end;

end.
