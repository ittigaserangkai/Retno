unit ufrmDataCostumer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls, Grids,
  BaseGrid, AdvGrid, ActnList;

type
  TfrmDataCostumer = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    actlstInputSupplierForNotSO: TActionList;
    actAddDataCostumer: TAction;
    actEditDataCostumer: TAction;
    actDeleteDataCostumer: TAction;
    actRefreshDataCostumer: TAction;
    strgGrid: TAdvStringGrid;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actAddDataCostumerExecute(Sender: TObject);
    procedure actEditDataCostumerExecute(Sender: TObject);
    procedure actDeleteDataCostumerExecute(Sender: TObject);
    procedure actRefreshDataCostumerExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure ParseHeaderGrid();
    procedure ParseDataGrid();
  public
    { Public declarations }
  end;

var
  frmDataCostumer: TfrmDataCostumer;

implementation

uses  ufrmDialogDataCostumer, uGTSUICommonDlg, DateUtils, uConn,
  uDataCustomer, DB;

{$R *.dfm}

procedure TfrmDataCostumer.FormActivate(Sender: TObject);
begin
  inherited;
  //frmMain.CreateMenu((Sender as TForm));
end;

procedure TfrmDataCostumer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ////frmMain.DestroyMenu((Sender as TForm));
  Action := caFree;
end;

procedure TfrmDataCostumer.FormCreate(Sender: TObject);
begin
  inherited;
  Self.Caption := 'DATA CUSTOMER';
  lblHeader.Caption := Self.Caption;
  actRefreshDataCostumerExecute(Self);
end;

procedure TfrmDataCostumer.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDataCostumer := nil;
end;

procedure TfrmDataCostumer.actAddDataCostumerExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogDataCostumer) then
    Application.CreateForm(TfrmDialogDataCostumer, frmDialogDataCostumer);
  frmDialogDataCostumer.frmSuiMasterDialog.Caption := 'Add Data Customer';
  frmDialogDataCostumer.FormMode:=fmAdd;

  SetFormPropertyAndShowDialog(frmDialogDataCostumer);
  if (frmDialogDataCostumer.IsProcessSuccessfull) then
  begin
    actRefreshDataCostumerExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atAdd);
  end;

  frmDialogDataCostumer.Free;
  strgGrid.SetFocus;
end;

procedure TfrmDataCostumer.actEditDataCostumerExecute(Sender: TObject);
begin
  inherited;         
  if strgGrid.Cells[5,strgGrid.Row]='' then Exit;
  if not Assigned(frmDialogDataCostumer) then
    Application.CreateForm(TfrmDialogDataCostumer, frmDialogDataCostumer);
  frmDialogDataCostumer.frmSuiMasterDialog.Caption := 'Edit Data Customer';
  frmDialogDataCostumer.FormMode:=fmEdit;
  frmDialogDataCostumer.DataCustomerId:=StrToInt(strgGrid.Cells[5,strgGrid.row]);

  SetFormPropertyAndShowDialog(frmDialogDataCostumer);
  if (frmDialogDataCostumer.IsProcessSuccessfull) then
  begin
    actRefreshDataCostumerExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atEdit);
  end;

  frmDialogDataCostumer.Free;
  strgGrid.SetFocus;
end;

procedure TfrmDataCostumer.actDeleteDataCostumerExecute(Sender: TObject);
var arr: TArr;
begin
  inherited;
  if strgGrid.Cells[5,strgGrid.Row]='' then Exit;
  if (CommonDlg.Confirm('Are you sure you wish to delete Data Customer (Customer Name: '+ strgGrid.Cells[1,strgGrid.Row] +')?') = mrNo) then
    Exit;
  SetLength(arr,1);
  arr[0].tipe:= ptInteger;
  arr[0].data:= strgGrid.Cells[5,strgGrid.Row];
  if not assigned(DataCustomer) then
    DataCustomer := TDataCustomer.Create;
  if DataCustomer.DeleteDataCustomer(arr) then
  begin
    actRefreshDataCostumerExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atDelete);
  end;
  strgGrid.SetFocus;
end;

procedure TfrmDataCostumer.actRefreshDataCostumerExecute(Sender: TObject);
begin
  inherited;
  ParseDataGrid();
end;

procedure TfrmDataCostumer.ParseHeaderGrid();
begin
  with strgGrid do
  begin
    Clear;
    RowCount:= 2;
    ColCount:= 5;
    Cells[0,0]:= 'CODE';
    Cells[1,0]:= 'NAME';
    Cells[2,0]:= 'ADDRESS';
    Cells[3,0]:= 'TELEPHONE';
    Cells[4,0]:= 'CONTACT PERSON';
    AutoSize:= True;
  end;
end;

procedure TfrmDataCostumer.ParseDataGrid;
var data: TResultDataSet;
    arr: TArr;
    i: Integer;
begin
  ParseHeaderGrid;
  SetLength(arr,0);
  if not assigned(DataCustomer) then
    DataCustomer := TDataCustomer.Create;
  data:= DataCustomer.GetListCustomer(arr);
  with strgGrid, data do
  begin
    if not IsEmpty then
    begin
      RowCount:= RecordCount+1;
      i:=0;
      while not Eof do
      begin
        Inc(i);
        Cells[0,i]:= fieldbyname('CUSTV_CODE').AsString;
        Cells[1,i]:= fieldbyname('CUSTV_NAME').AsString;
        Cells[2,i]:= fieldbyname('CUSTV_ADDRESS').AsString;
        Cells[3,i]:= fieldbyname('CUSTV_TELP').AsString;
        Cells[4,i]:= fieldbyname('CUSTV_CONTACT_PERSON').AsString;
        Cells[5,i]:= IntToStr(fieldbyname('CUSTV_ID').AsInteger);
        Next;
      end;
      AutoSize:= True;
    end;
  end;
end;

procedure TfrmDataCostumer.FormShow(Sender: TObject);
begin
  inherited;
  strgGrid.SetFocus;
end;

end.

