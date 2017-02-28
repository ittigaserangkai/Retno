unit ufrmTipePengirimanPO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, Grids, BaseGrid, AdvGrid,
  ufraFooter5Button, ActnList, uConn, uTipeKirimPO,uRetnoUnit;

type
  TfrmTipePengirimanPO = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    strgGrid: TAdvStringGrid;
    actlstTipePengirimanPO: TActionList;
    actAddTipePengirimanPO: TAction;
    actEditTipePengirimanPO: TAction;
    actDeleteTipePengirimanPO: TAction;
    actRefreshTipePengirimanPO: TAction;
    procedure FormShow(Sender: TObject);
    procedure actAddTipePengirimanPOExecute(Sender: TObject);
    procedure actEditTipePengirimanPOExecute(Sender: TObject);
    procedure actDeleteTipePengirimanPOExecute(Sender: TObject);
    procedure actRefreshTipePengirimanPOExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FNewTipeKirimPO : TTipeKirimPO;
    IDLokal : Integer;
    { Private declarations }
    function GetData(): TResultDataSet;
  public
    { Public declarations }
  end;

var
  frmTipePengirimanPO: TfrmTipePengirimanPO;

implementation

uses uTSCommonDlg, uTipePengirimanPO, ufrmDialogTipePengirimanPO,  uConstanta;

{$R *.dfm}

procedure TfrmTipePengirimanPO.FormShow(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'PO DELIVERY TYPE';
  actRefreshTipePengirimanPOExecute(Self);
end;

procedure TfrmTipePengirimanPO.actAddTipePengirimanPOExecute(
  Sender: TObject);
begin
  inherited;
  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    //frmMain.cbbUnit.SetFocus;
    Exit;
  end;
  if(MasterNewUnit.ID <> 0) then
  begin
    if not Assigned(frmDialogTipePengirimanPO) then
      Application.CreateForm(TfrmDialogTipePengirimanPO, frmDialogTipePengirimanPO);

    frmDialogTipePengirimanPO.frmSuiMasterDialog.Caption := 'Add PO Delivery Type';
    frmDialogTipePengirimanPO.FormMode := fmAdd;

    SetFormPropertyAndShowDialog(frmDialogTipePengirimanPO);
    if (frmDialogTipePengirimanPO.IsProcessSuccessfull) then
    begin
      actRefreshTipePengirimanPOExecute(Self);
      CommonDlg.ShowConfirm(atAdd);
    end;
  end
  else
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);

  frmDialogTipePengirimanPO.Free;
end;

procedure TfrmTipePengirimanPO.actEditTipePengirimanPOExecute(
  Sender: TObject);
begin
  inherited;
  // check is Unit Id is specified?
  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    //frmMain.cbbUnit.SetFocus;
    Exit;
  end;
  if(MasterNewUnit.ID <> 0) then
  begin
    if strgGrid.Cells[0,strgGrid.row]=' ' then Exit;

    if not Assigned(frmDialogTipePengirimanPO) then
      Application.CreateForm(TfrmDialogTipePengirimanPO, frmDialogTipePengirimanPO);

    frmDialogTipePengirimanPO.frmSuiMasterDialog.Caption := 'Edit PO Delivery Type';
    frmDialogTipePengirimanPO.FormMode := fmEdit;
    frmDialogTipePengirimanPO.TipePengirimanPOId := StrToInt(strgGrid.Cells[2,strgGrid.row]);

    SetFormPropertyAndShowDialog(frmDialogTipePengirimanPO);
    if (frmDialogTipePengirimanPO.IsProcessSuccessfull) then
    begin
      actRefreshTipePengirimanPOExecute(Self);
      CommonDlg.ShowConfirm(atEdit);
    end;
  end
  else
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);

  frmDialogTipePengirimanPO.Free;
end;

procedure TfrmTipePengirimanPO.actDeleteTipePengirimanPOExecute(
  Sender: TObject);
begin
  inherited;
  if strgGrid.Cells[0,strgGrid.row]=' ' then Exit;

  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    //frmMain.cbbUnit.SetFocus;
    Exit;
  end;
  if (CommonDlg.Confirm('Are you sure you wish to delete PO Delivery Type (Type: '+strgGrid.Cells[1,strgGrid.row]+ ' : ' +strgGrid.Cells[0,strgGrid.row]+') ?') = mrYes) then
  begin

    iDLokal := strgGrid.Ints[2,strgGrid.row];

    if FNewTipeKirimPO.LoadByID(IDLokal) then
    begin
      if FNewTipeKirimPO.RemoveFromDB then
      begin
        cCommitTrans;
        CommonDlg.ShowMessage('Data Berhasil Dihapus');
        actRefreshTipePengirimanPOExecute(Self);
        Exit;
      end
      else
      begin
        cRollbackTrans;
        CommonDlg.ShowError('Data Gagal Dihapus');
      end;
    end;
  end;
end;

procedure TfrmTipePengirimanPO.actRefreshTipePengirimanPOExecute(
  Sender: TObject);
var
    dataTipePengirimanPO: TResultDataSet;
    i,countData: Integer;
begin
  inherited;
  dataTipePengirimanPO := GetData();
  countData := dataTipePengirimanPO.RecordCount;
  with strgGrid do
  begin
    Clear;
    RowCount := countData+1;
    ColCount := 2;

    Cells[0, 0] := 'CODE';
    Cells[1, 0] := 'TYPE';

    if (RowCount > 1) then
    begin
      i := 1;
      while not dataTipePengirimanPO.Eof do
      begin
        Cells[0, i] := dataTipePengirimanPO.FieldByName('TPKRMPO_CODE').AsString;
        Cells[1, i] := dataTipePengirimanPO.FieldByName('TPKRMPO_NAME').AsString;
        Cells[2, i] := dataTipePengirimanPO.FieldByName('TPKRMPO_ID').AsString;

        Inc(i);
        dataTipePengirimanPO.Next;
      end;
    end
    else
    begin
      RowCount := 2;
      Cells[0, 1] := ' ';
      Cells[1, 1] := ' ';
    end;

    FixedRows := 1;
    AutoSize := true;
  end;
end;

function TfrmTipePengirimanPO.GetData: TResultDataSet;
begin
  // inisiate business model
  if not assigned(TipePengirimanPO) then
    TipePengirimanPO := TTipePengirimanPO.Create;



  Result := TipePengirimanPO.GetListDataTipePengirimanPO();
end;

procedure TfrmTipePengirimanPO.FormDestroy(Sender: TObject);
begin
  inherited;
  frmTipePengirimanPO := nil;
end;

procedure TfrmTipePengirimanPO.FormActivate(Sender: TObject);
begin
  inherited;
  //frmMain.CreateMenu((sender as TForm));
end;

procedure TfrmTipePengirimanPO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //frmMain.DestroyMenu((sender as TForm));
end;

procedure TfrmTipePengirimanPO.FormCreate(Sender: TObject);
begin
  inherited;
  FNewTipeKirimPO := TTipeKirimPO.Create(Self)
end;

end.
