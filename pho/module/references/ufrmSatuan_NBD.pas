unit ufrmSatuan_NBD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls, Grids,
  BaseGrid, AdvGrid, ActnList, uConn;

type
  TfrmSatuan_NBD = class(TfrmMaster)
    strgGrid: TAdvStringGrid;
    fraFooter5Button1: TfraFooter5Button;
    actlstSatuan_NBD: TActionList;
    actAddSatuan_NBD: TAction;
    actEditSatuan_NBD: TAction;
    actDeleteSatuan_NBD: TAction;
    actRefreshSatuan_NBD: TAction;
    procedure FormShow(Sender: TObject);
    procedure actAddSatuan_NBDExecute(Sender: TObject);
    procedure actEditSatuan_NBDExecute(Sender: TObject);
    procedure actDeleteSatuan_NBDExecute(Sender: TObject);
    procedure actRefreshSatuan_NBDExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    //function GetData(): TDataSet;
  public
    { Public declarations }
  end;

var
  frmSatuan_NBD: TfrmSatuan_NBD;

implementation

uses uTSCommonDlg, ufrmDialogSatuan_NBD, uSatuan_NBD,  uConstanta,
     uNewRefSatuan_NBD;

{$R *.dfm}

procedure TfrmSatuan_NBD.FormShow(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'NBD UNIT OF MEASURE (UOM)';
  actRefreshSatuan_NBDExecute(Self);
end;

procedure TfrmSatuan_NBD.actAddSatuan_NBDExecute(Sender: TObject);
begin
  inherited;
  //check is unit id specified
  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    //frmMain.cbbUnit.SetFocus;
    Exit;
  end;
  if (MasterNewUnit.ID <> 0) then
  begin
    if not Assigned(frmDialogSatuan_NBD) then
      Application.CreateForm(TfrmDialogSatuan_NBD, frmDialogSatuan_NBD);

    frmDialogSatuan_NBD.frmSuiMasterDialog.Caption := 'Add NBD UOM';
    frmDialogSatuan_NBD.FormMode := fmAdd;

    SetFormPropertyAndShowDialog(frmDialogSatuan_NBD);
    if (frmDialogSatuan_NBD.IsProcessSuccessfull) then
    begin
      actRefreshSatuan_NBDExecute(Self);
      CommonDlg.ShowConfirm(atAdd);
    end;
  end
  else
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);

  frmDialogSatuan_NBD.Free;
end;

procedure TfrmSatuan_NBD.actEditSatuan_NBDExecute(Sender: TObject);
begin
  inherited;
  //check is unit id specified
  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    //frmMain.cbbUnit.SetFocus;
    Exit;
  end;
  if (MasterNewUnit.ID <> 0) then
  begin
    if (strgGrid.Cells[0,strgGrid.Row] = ' ') then Exit;

    if not Assigned(frmDialogSatuan_NBD) then
      Application.CreateForm(TfrmDialogSatuan_NBD, frmDialogSatuan_NBD);

    frmDialogSatuan_NBD.frmSuiMasterDialog.Caption := 'Edit NBD UOM';
    frmDialogSatuan_NBD.FormMode := fmEdit;
    frmDialogSatuan_NBD.Satuan_NBDId := strgGrid.Cells[0,strgGrid.Row]; // R // put your Satuan_NBD id that won be edit

    SetFormPropertyAndShowDialog(frmDialogSatuan_NBD);
    if (frmDialogSatuan_NBD.IsProcessSuccessfull) then
    begin
      actRefreshSatuan_NBDExecute(Self);
      CommonDlg.ShowConfirm(atEdit);
    end;
  end
  else
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);

  frmDialogSatuan_NBD.Free;
end;

procedure TfrmSatuan_NBD.actDeleteSatuan_NBDExecute(Sender: TObject);
var
    FNewSatuan_NBD: TNewSatuan_NBD;
begin
  inherited;
  if (strgGrid.Cells[0,strgGrid.Row] = ' ') then Exit;
  if (CommonDlg.Confirm('Are you sure you wish to delete UOM (Code: '+strgGrid.Cells[0,strgGrid.Row]+')?') = mrYes) then
  begin
    FNewSatuan_NBD := TNewSatuan_NBD.Create(self);
    try
       if  FNewSatuan_NBD.RemoveFromDB(strgGrid.Cells[0,strgGrid.Row], MasterNewUnit.ID) then
        begin
          actRefreshSatuan_NBDExecute(Self);
          CommonDlg.ShowConfirm(atDelete);
        end;
    except
          CommonDlg.ShowError(ER_DELETE_FAILED);
    end;
    FNewSatuan_NBD.Free;
{    if not assigned(Satuan_NBD) then
      Satuan_NBD := TSatuan_NBD.Create;


    if Satuan_NBD.DeleteDataSatuan_NBD(strgGrid.Cells[0,strgGrid.Row]) then
    begin
      actRefreshSatuan_NBDExecute(Self);
      CommonDlg.ShowConfirm(atDelete);
    end;
}
  end;
end;

{function TfrmSatuan_NBD.GetData(): TDataSet;
var
  arrParam: TArr;
begin
  // inisiate business model
  if not assigned(Satuan_NBD) then
    Satuan_NBD := TSatuan_NBD.Create;

  // check is Unit Id specified?
  if MasterNewUnit.ID <> 0 then
  begin
    SetLength(arrParam,1);
    arrParam[0].tipe := ptString;
    arrParam[0].data := MasterNewUnit.ID;
  end
  else
    arrParam := nil;

  Result := Satuan_NBD.GetListSatuan_NBD(arrParam);
end;
}

procedure TfrmSatuan_NBD.actRefreshSatuan_NBDExecute(Sender: TObject);
var i, countData: Integer;
    dataSatuan_NBD: TDataSet;
begin
  dataSatuan_NBD := GetListSatuan_NBD(MasterNewUnit.ID);
  dataSatuan_NBD.Last;
  countData := dataSatuan_NBD.RecordCount;
  with strgGrid do
  begin
    Clear;
    RowCount := countData+1;
    ColCount := 3;

    Cells[0, 0] := 'CODE';
    Cells[1, 0] := 'NAME';
    Cells[2, 0] := 'GROUP';

    if (RowCount > 1) then
    begin
      i := 1;
      dataSatuan_NBD.First;
      while not dataSatuan_NBD.Eof do
      begin
        Cells[0, i] := dataSatuan_NBD.FieldByName('SATNBD_CODE').AsString;
        Cells[1, i] := dataSatuan_NBD.FieldByName('SATNBD_NAME').AsString;
        Cells[2, i] := dataSatuan_NBD.FieldByName('SATNBD_GROUP').AsString;

        Inc(i);
        dataSatuan_NBD.Next;
      end;
    end
    else
    begin
      RowCount := 2;
      Cells[0, 1] := ' ';
      Cells[1, 1] := ' ';
      Cells[2, 1] := ' ';
    end;

    FixedRows := 1;
    AutoSize := true;
  end;
end;

procedure TfrmSatuan_NBD.FormDestroy(Sender: TObject);
begin
  inherited;
  frmSatuan_NBD := nil;
end;

procedure TfrmSatuan_NBD.FormActivate(Sender: TObject);
begin
  inherited;
  //frmMain.CreateMenu((sender as TForm));
end;

procedure TfrmSatuan_NBD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  //frmMain.DestroyMenu((sender as TForm));
end;

end.
