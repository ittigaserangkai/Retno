unit ufrmSatuan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls, Grids,
  BaseGrid, ActnList, uConn, uRetnoUnit, DB, System.Actions,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid;

type
  TfrmSatuan = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    actlstSatuan: TActionList;
    actAddSatuan: TAction;
    actEditSatuan: TAction;
    actDeleteSatuan: TAction;
    actRefreshSatuan: TAction;
    cxGridViewSatuan: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid: TcxGrid;

    procedure FormShow(Sender: TObject);
    procedure actAddSatuanExecute(Sender: TObject);
    procedure actEditSatuanExecute(Sender: TObject);
    procedure actDeleteSatuanExecute(Sender: TObject);
    procedure actRefreshSatuanExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
//    FNewUOM : TNewUOM;
  public
    { Public declarations }
  end;

var
  frmSatuan: TfrmSatuan;

implementation

uses uTSCommonDlg, ufrmDialogSatuan, uConstanta;

{$R *.dfm}
const
  _kolKode  : Integer = 0;
  _kolNama  : Integer = 1;
  _kolGrup  : Integer = 2;
  _kolUrutan: Integer = 3;



procedure TfrmSatuan.FormShow(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'UNIT OF MEASURE (UOM)';
  actRefreshSatuanExecute(Self);
end;

procedure TfrmSatuan.actAddSatuanExecute(Sender: TObject);
begin
  inherited;

    if not Assigned(frmDialogSatuan) then
      Application.CreateForm(TfrmDialogSatuan, frmDialogSatuan);

    frmDialogSatuan.Caption := 'Add Unit Of Measure (UOM)';
    frmDialogSatuan.FormMode := fmAdd;
    SetFormPropertyAndShowDialog(frmDialogSatuan);

    if (frmDialogSatuan.IsProcessSuccessfull) then
    begin
      actRefreshSatuanExecute(Self);
      CommonDlg.ShowConfirm(atAdd);
    end;


  FreeAndNil(frmDialogSatuan);
end;

procedure TfrmSatuan.actEditSatuanExecute(Sender: TObject);
begin
  inherited;

{    if (strgGrid.Cells[_kolKode,strgGrid.Row] = ' ') then
      Exit;

    if not Assigned(frmDialogSatuan) then
      Application.CreateForm(TfrmDialogSatuan, frmDialogSatuan);

    frmDialogSatuan.frmSuiMasterDialog.Caption := 'Edit Unit Of Measure (UOM)';
    frmDialogSatuan.FormMode := fmEdit;

  frmDialogSatuan.SatuanId := strgGrid.Cells[_kolKode,strgGrid.Row];
  SetFormPropertyAndShowDialog(frmDialogSatuan);
  if (frmDialogSatuan.IsProcessSuccessfull) then
  begin
    actRefreshSatuanExecute(Self);
    CommonDlg.ShowConfirm(atEdit);
  end;

  }
  FreeAndNil(frmDialogSatuan);
end;

procedure TfrmSatuan.actDeleteSatuanExecute(Sender: TObject);
var
  aUOM: string;
begin
  inherited;
 {
  aUOM := strgGrid.Cells[_kolKode,strgGrid.Row];
  if (CommonDlg.Confirm('Are you sure you wish to delete UOM (Code: '
        + strgGrid.Cells[_kolKode,strgGrid.Row]+')?') = mrYes) then
  begin
    if FNewUOM.LoadByUOM(aUOM) then
    begin
      if FNewUOM.RemoveFromDB then
      begin
        cCommitTrans;
        CommonDlg.ShowMessage('Data Berhasil DiHapus');
        actRefreshSatuanExecute(Self);
        Exit;
      end
      else
      begin
        cRollbackTrans;
        CommonDlg.ShowError('Data Gagal Di Hapus');
      end;
    end;
  end;
   }
end;

procedure TfrmSatuan.actRefreshSatuanExecute(Sender: TObject);
var i, countData: Integer;
//    iB : TFDQuery;

begin
  {
  try
    iB  := cOpenQuery(TNewUOM.GetSQLUom);

    iB.Last;
    iB.First;

    countData := iB.RecordCount;
    with strgGrid do
    begin
      Clear;
      RowCount := countData+1;
      ColCount := 4;

      Cells[_kolKode, 0]  := 'CODE';
      Cells[_kolNama, 0]  := 'NAME';
      Cells[_kolGrup, 0]  := 'GROUP';
      Cells[_kolUrutan, 0]:= 'URUTAN';

      if (RowCount > 1) then
      begin
        i := 1;
        while not iB.Eof do
        begin
          Cells[_kolKode, i]    := iB.FieldByName('SAT_CODE').AsString;
          Cells[_kolNama, i]    := iB.FieldByName('SAT_NAME').AsString;
          Cells[_kolGrup, i]    := iB.FieldByName('SAT_GROUP').AsString;
          Cells[_kolUrutan, i]  := iB.FieldByName('SAT_URUTAN').AsString;

          Inc(i);
          Application.ProcessMessages;
          iB.Next;
        end;
      end
      else
      begin
        RowCount := 2;
        Cells[_kolKode, 1]  := ' ';
        Cells[_kolNama, 1]  := ' ';
        Cells[_kolGrup, 1]  := ' ';
        Cells[_kolUrutan, 1]:= ' ';
      end;

      FixedRows := 1;
      AutoSize := true;
    end;
  finally
    strgGrid.SetFocus;
    FreeAndNil(iB);
  end;
  }
end;

procedure TfrmSatuan.FormDestroy(Sender: TObject);
begin
  inherited;
//  FreeAndNil(FnewUOM);
  frmSatuan := nil;
end;

procedure TfrmSatuan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action  := caFree;
end;

procedure TfrmSatuan.FormCreate(Sender: TObject);
begin
  inherited;
//  FnewUOM := TNewUOM.create(Self);
end;

end.
