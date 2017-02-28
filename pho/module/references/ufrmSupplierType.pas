unit ufrmSupplierType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls, ActnList,
  uConn, uRetnoUnit, DB, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, System.Actions;

type
  TfrmSupplierType = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    actlstSupplierType: TActionList;
    actAddSupplierType: TAction;
    actEditSupplierType: TAction;
    actDeleteSupplierType: TAction;
    actRefreshSupplierType: TAction;
    cxGrid: TcxGrid;
    cxGridViewTipeSupplier: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    procedure FormShow(Sender: TObject);
    procedure actAddSupplierTypeExecute(Sender: TObject);
    procedure actEditSupplierTypeExecute(Sender: TObject);
    procedure actDeleteSupplierTypeExecute(Sender: TObject);
    procedure actRefreshSupplierTypeExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure fraFooter5Button1btnCloseClick(Sender: TObject);
  private
    { Private declarations }
//    FNewSupplierType : TNewTipeSupplier;
    function GetData(): TDataSet;
  public
    { Public declarations }
  end;

var
  frmSupplierType: TfrmSupplierType;

implementation

uses uTSCommonDlg, ufrmDialogSupplierType, Math,  uConstanta;

{$R *.dfm}
procedure TfrmSupplierType.FormDestroy(Sender: TObject);
begin
  inherited;
  frmSupplierType := nil;
end;

procedure TfrmSupplierType.FormShow(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'SUPPLIER TYPE';
  actRefreshSupplierTypeExecute(Self);
end;

procedure TfrmSupplierType.actAddSupplierTypeExecute(Sender: TObject);
begin
  //check is Unit ID is specified
//  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    //frmMain.cbbUnit.SetFocus;
    Exit;
  end;
//  if (MasterNewUnit.ID <> 0) then
  begin
    if not Assigned(frmDialogSupplierType) then
      Application.CreateForm(TfrmDialogSupplierType, frmDialogSupplierType);

    frmDialogSupplierType.Caption := 'Add Supplier Type';
    frmDialogSupplierType.FormMode := fmAdd;

    SetFormPropertyAndShowDialog(frmDialogSupplierType);
    if (frmDialogSupplierType.IsProcessSuccessfull) then
    begin
      actRefreshSupplierTypeExecute(Self);
      CommonDlg.ShowConfirm(atAdd);
    end;
  end
//  else
//    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    
//  frmDialogSupplierType.Free;
end;

procedure TfrmSupplierType.actEditSupplierTypeExecute(Sender: TObject);
begin
  // check is Unit ID Specified
//  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    //frmMain.cbbUnit.SetFocus;
    Exit;
  end;
//  if (MasterNewUnit.ID <> 0) then
  begin
    // check is there any data available to delete
//    if(strgGrid.Cells[0, strgGrid.Row] = ' ') then Exit;

    if not Assigned(frmDialogSupplierType) then
      Application.CreateForm(TfrmDialogSupplierType, frmDialogSupplierType);

    frmDialogSupplierType.Caption := 'Edit Supplier Type';
    frmDialogSupplierType.FormMode := fmEdit;
//    frmDialogSupplierType.SupplierTypeId := StrToInt(strgGrid.Cells[2,strgGrid.row]);

    SetFormPropertyAndShowDialog(frmDialogSupplierType);
    if (frmDialogSupplierType.IsProcessSuccessfull) then
    begin
      actRefreshSupplierTypeExecute(Self);
      CommonDlg.ShowConfirm(atEdit);
    end;
  end
;//  else
//    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    
  frmDialogSupplierType.Free;
end;

procedure TfrmSupplierType.actDeleteSupplierTypeExecute(Sender: TObject);
begin
//  if strgGrid.Cells[0,strgGrid.row]=' ' then Exit;
//  if (CommonDlg.Confirm('Are you sure you wish to delete Supplier Type (Name: '+strgGrid.Cells[1,strgGrid.row]+')?') = mrYes) then
  begin
   {
   if FNewSupplierType.LoadByID(StrToInt(strgGrid.Cells[2,strgGrid.row])) then
    begin
      if FNewSupplierType.RemoveFromDB then
      begin
        cCommitTrans;
        CommonDlg.ShowMessage('Data Sudah dihapus');
        actRefreshSupplierTypeExecute(self);
        exit;
      end
      else
      begin
        cRollbackTrans;
        CommonDlg.ShowMessage('Data gagal dihapus');
      end;
    end;
    }
  end;
end;

function TfrmSupplierType.GetData(): TDataSet;
//var
//  IdUnt: Integer;
begin
  // inisiate business model
//  if not assigned(Supliertipe) then
//    Supliertipe := TSuplierTipe.Create;

  // check is Unit Id specified?
//  if MasterNewUnit.ID <> 0 then
//  begin
//    IdUnt := MasterNewUnit.ID;
//  end
//  else
//    IdUnt := 0;

//  Result := Supliertipe.GetListDataSupplierTipe();
end;

procedure TfrmSupplierType.actRefreshSupplierTypeExecute(Sender: TObject);
var
  dataTPSupplier: TDataSet;
  i, countData: Integer;
begin
  dataTPSupplier := GetData();
  countData := dataTPSupplier.RecordCount;
  {
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
      while not dataTPSupplier.Eof do
      begin
        Cells[0, i] := dataTPSupplier.FieldByName('TPSUP_CODE').AsString;
        Cells[1, i] := dataTPSupplier.FieldByName('TPSUP_NAME').AsString;
        Cells[2, i] := dataTPSupplier.FieldByName('TPSUP_ID').AsString;

        dataTPSupplier.Next;
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

procedure TfrmSupplierType.FormActivate(Sender: TObject);
begin
  inherited;
  //frmMain.CreateMenu((sender as TForm));
end;

procedure TfrmSupplierType.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //frmMain.DestroyMenu((sender as TForm));
end;

procedure TfrmSupplierType.FormCreate(Sender: TObject);
begin
  inherited;
//  FNewSupplierType := TNewTipeSupplier.Create(self);
end;

procedure TfrmSupplierType.fraFooter5Button1btnCloseClick(Sender: TObject);
begin
  inherited;
  fraFooter5Button1.btnCloseClick(Sender);

end;

end.
