unit ufrmOutlet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls, Grids,
  BaseGrid, AdvGrid, ActnList, uConn, uRetnoUnit, uNewSalesOutlet;

type
  TfrmOutlet = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    strgGrid: TAdvStringGrid;
    actlstOutlet: TActionList;
    actAddOutlet: TAction;
    actEditOutlet: TAction;
    actDeleteOutlet: TAction;
    actRefreshOutlet: TAction;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actEditOutletExecute(Sender: TObject);
    procedure actAddOutletExecute(Sender: TObject);
    procedure actDeleteOutletExecute(Sender: TObject);
    procedure actRefreshOutletExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure fraFooter5Button1btnCloseClick(Sender: TObject);
  private
  FNewOutlet : TNewSalesOutlet;
    { Private declarations }
    function GetData(): TResultDataSet;
  public
    { Public declarations }
  end;

var
  frmOutlet: TfrmOutlet;

implementation

uses uTSCommonDlg, ufrmDialogOutlet, uOutlet,  uConstanta;

{$R *.dfm}

procedure TfrmOutlet.FormDestroy(Sender: TObject);
begin
  inherited;
  frmOutlet := nil;
end;

procedure TfrmOutlet.FormShow(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'SALES OUTLET';
  actRefreshOutletExecute(Self);
end;

procedure TfrmOutlet.actEditOutletExecute(Sender: TObject);
begin
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
    if not Assigned(frmDialogOutlet) then
      Application.CreateForm(TfrmDialogOutlet, frmDialogOutlet);

    frmDialogOutlet.frmSuiMasterDialog.Caption := 'Edit Sales Outlet';
    frmDialogOutlet.FormMode := fmEdit;
    frmDialogOutlet.OutletId := StrToInt(strgGrid.Cells[2,strgGrid.row]);

    SetFormPropertyAndShowDialog(frmDialogOutlet);
    if (frmDialogOutlet.IsProcessSuccessfull) then
    begin
      actRefreshOutletExecute(Self);
      CommonDlg.ShowConfirm(atEdit);
    end;
  end
  else
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);

  frmDialogOutlet.Free;
end;

procedure TfrmOutlet.actAddOutletExecute(Sender: TObject);
begin
  // check is Unit Id is specified?
  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    //frmMain.cbbUnit.SetFocus;
    Exit;
  end;
  if(MasterNewUnit.ID <> 0) then
  begin
    if not Assigned(frmDialogOutlet) then
      Application.CreateForm(TfrmDialogOutlet, frmDialogOutlet);

    frmDialogOutlet.frmSuiMasterDialog.Caption := 'Add Sales Outlet';
    frmDialogOutlet.FormMode := fmAdd;

    SetFormPropertyAndShowDialog(frmDialogOutlet);
    if (frmDialogOutlet.IsProcessSuccessfull) then
    begin
     actRefreshOutletExecute(Self);
     CommonDlg.ShowConfirm(atAdd);
    end;
  end
  else
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);

  frmDialogOutlet.Free;
end;

procedure TfrmOutlet.actDeleteOutletExecute(Sender: TObject);
begin
  if strgGrid.Cells[0,strgGrid.row]=' ' then Exit;
  // check is Unit Id is specified?
  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    //frmMain.cbbUnit.SetFocus;
    Exit;
  end;
  if (CommonDlg.Confirm('Are you sure you wish to delete Sales Outlet (Name: '+strgGrid.Cells[1,strgGrid.row]+')?') = mrYes) then
  begin

    if FNewOutlet.LoadByID(StrToInt(strgGrid.Cells[2,strgGrid.row])) then
    begin
      if FNewOutlet.RemoveFromDB then
      begin
        cCommitTrans;
        CommonDlg.ShowMessage(' Data Berhasil dihapus');
        frmOutlet.actRefreshOutletExecute(Self);
        exit;
      end
      else begin
        cRollbackTrans;
        CommonDlg.ShowMessage('Data Gagal dihapus');
      end;
      actRefreshOutletExecute(Self);
    end

  end;
end;

function TfrmOutlet.GetData(): TResultDataSet;
var 
  arrParam: TArr;
begin
  // inisiate the business model
  if not assigned(Outlet) then
    Outlet := TOutlet.Create;

//  if MasterNewUnit.ID <> 0 then
//  begin
//    SetLength(arrParam,1);
//    arrParam[0].tipe := ptString;
//    arrParam[0].data := MasterNewUnit.ID;
//  end
//  else
    arrParam := nil;

  Result := Outlet.GetListDataOutlet(arrParam);
end;

procedure TfrmOutlet.actRefreshOutletExecute(Sender: TObject);
var
  dataOutlet: TResultDataSet;
  i, countData:Integer;
begin
  dataOutlet := GetData();
  countData := dataOutlet.RecordCount;
  with strgGrid do
  begin
    Clear;
    RowCount := countData+1;
    ColCount := 2;

    Cells[0,0]:='CODE';
    Cells[1,0]:='NAME';

    if RowCount > 1 then
    begin
      i := 1;
      while not dataOutlet.Eof do
      begin
        Cells[0, i] := dataOutlet.FieldByName('OUTLET_CODE').AsString;
        Cells[1, i] := dataOutlet.FieldByName('OUTLET_NAME').AsString;
        Cells[2, i] := dataOutlet.FieldByName('OUTLET_ID').AsString;

        dataOutlet.Next;
        Inc(i);
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
  //=== R ====
end;

procedure TfrmOutlet.FormActivate(Sender: TObject);
begin
  inherited;
  //frmMain.CreateMenu((sender as TForm));
end;

procedure TfrmOutlet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  //frmMain.DestroyMenu((sender as TForm));
end;

procedure TfrmOutlet.FormCreate(Sender: TObject);
begin
  inherited;
  FNewOutlet := TNewSalesOutlet.create(self);
end;

procedure TfrmOutlet.fraFooter5Button1btnCloseClick(Sender: TObject);
begin
  inherited;
  fraFooter5Button1.btnCloseClick(Sender);

end;

end.
