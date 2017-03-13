unit ufrmOutlet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, ufraFooter5Button, StdCtrls, ExtCtrls,
  uConn, uRetnoUnit, System.Actions, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  Vcl.ActnList;

type
  TfrmOutlet = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actDeleteOutletExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
//  FNewOutlet : TNewSalesOutlet;
    { Private declarations }
    function GetData(): TDataSet;
  public
    { Public declarations }
  end;

var
  frmOutlet: TfrmOutlet;

implementation

uses uTSCommonDlg, ufrmDialogOutlet, uConstanta;

{$R *.dfm}

procedure TfrmOutlet.actAddExecute(Sender: TObject);
begin
  inherited;
  // check is Unit Id is specified?
//  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    Exit;
  end;
  if(1 <> 0) then
  begin
    if not Assigned(frmDialogOutlet) then
      Application.CreateForm(TfrmDialogOutlet, frmDialogOutlet);

    frmDialogOutlet.Caption := 'Add Sales Outlet';
    frmDialogOutlet.FormMode := fmAdd;

    SetFormPropertyAndShowDialog(frmDialogOutlet);
    if (frmDialogOutlet.IsProcessSuccessfull) then
    begin
     actRefreshExecute(Self);
     CommonDlg.ShowConfirm(atAdd);
    end;
  end
  else
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);

  frmDialogOutlet.Free;
end;

procedure TfrmOutlet.FormDestroy(Sender: TObject);
begin
  inherited;
  frmOutlet := nil;
end;

procedure TfrmOutlet.FormShow(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'SALES OUTLET';
  actRefreshExecute(Self);
end;

procedure TfrmOutlet.actDeleteOutletExecute(Sender: TObject);
begin
//  if strgGrid.Cells[0,strgGrid.row]=' ' then Exit;
  // check is Unit Id is specified?
//  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    Exit;
  end;
//  if (CommonDlg.Confirm('Are you sure you wish to delete Sales Outlet (Name: '+strgGrid.Cells[1,strgGrid.row]+')?') = mrYes) then
  begin
    {
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
    }
  end;
end;

procedure TfrmOutlet.actEditExecute(Sender: TObject);
begin
  inherited;
  // check is Unit Id is specified?
  {if MasterNewUnit.ID=0 then
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
  }
  frmDialogOutlet.Free;
end;

procedure TfrmOutlet.actRefreshExecute(Sender: TObject);
var
  dataOutlet: TDataSet;
  i, countData:Integer;
begin
  inherited;
  dataOutlet := GetData();
  countData := dataOutlet.RecordCount;
  {with strgGrid do
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
  }

end;

function TfrmOutlet.GetData(): TDataSet;
var 
  arrParam: TArr;
begin
  // inisiate the business model
//  if not assigned(Outlet) then
//    Outlet := TOutlet.Create;

    arrParam := nil;

//  Result := Outlet.GetListDataOutlet(arrParam);
end;

procedure TfrmOutlet.FormCreate(Sender: TObject);
begin
  inherited;
//  FNewOutlet := TNewSalesOutlet.create(self);
end;

end.
