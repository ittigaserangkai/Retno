unit ufrmProductTypeNBD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button,
  StdCtrls, ExtCtrls, ActnList, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, System.Actions, ufrmMasterBrowse, cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, ufraFooter4Button, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel;

type
  TfrmProductTypeNBD = class(TfrmMasterBrowse)
    actlst1: TActionList;
    actAddProductTypeNBD: TAction;
    actEditProductTypeNBD: TAction;
    actDeleteProductTypeNBD: TAction;
    actRefreshProductTypeNBD: TAction;
    pnl1: TPanel;
    edtOwner: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    edtCostCenterDesc: TEdit;
    edtAccNameDB: TEdit;
    lbl3: TLabel;
    edtAccNameCR: TEdit;
    lbl4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure actAddProductTypeNBDExecute(Sender: TObject);
    procedure actEditProductTypeNBDExecute(Sender: TObject);
    procedure actDeleteProductTypeNBDExecute(Sender: TObject);
    procedure actRefreshProductTypeNBDExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure stringgridGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
  private
    IdProductTypeNBD: integer;
    strnama: string;
    procedure RefreshData();
  public
    { Public declarations }
  end;

var
  frmProductTypeNBD: TfrmProductTypeNBD;

implementation

uses ufrmDialogProductTypeNBD, uTSCommonDlg,  Math, uConn, uConstanta;

{$R *.dfm}

procedure TfrmProductTypeNBD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  //frmMain.DestroyMenu((sender as TForm));
  Action := caFree;
end;

procedure TfrmProductTypeNBD.FormDestroy(Sender: TObject);
begin
  inherited;
  frmProductTypeNBD := nil;
end;

procedure TfrmProductTypeNBD.actAddProductTypeNBDExecute(Sender: TObject);
begin
//  if (MasterNewUnit.ID=0) or (Mastercompany.ID=0) then
  begin
    CommonDlg.ShowError(ER_UNIT_OR_COMPANY_NOT_SPECIFIC);
    //frmMain.cbbUnit.SetFocus;
    Exit;
  end;

  if not Assigned(frmDialogProductTypeNBD) then
    Application.CreateForm(TfrmDialogProductTypeNBD, frmDialogProductTypeNBD);
  frmDialogProductTypeNBD.Caption := 'Add NBD Product Type';
  frmDialogProductTypeNBD.FormMode := fmAdd;
  //frmDialogProductTypeNBD.UntID := MasterNewUnit.ID;
  //frmDialogProductTypeNBD.CompID := Mastercompany.ID;

  SetFormPropertyAndShowDialog(frmDialogProductTypeNBD);
  if (frmDialogProductTypeNBD.IsProcessSuccessfull) then
  begin
    actRefreshProductTypeNBDExecute(Self);
    CommonDlg.ShowConfirm(atAdd);
  end;

  frmDialogProductTypeNBD.Free;
end;

procedure TfrmProductTypeNBD.actEditProductTypeNBDExecute(Sender: TObject);
begin
//  if strgGrid.Cells[5,strgGrid.row]='0' then Exit;
//  if (MasterNewUnit.ID=0) or (Mastercompany.ID=0) then
  begin
    CommonDlg.ShowError(ER_UNIT_OR_COMPANY_NOT_SPECIFIC);
    //frmMain.cbbUnit.SetFocus;
    Exit;
  end;
  if not Assigned(frmDialogProductTypeNBD) then
    Application.CreateForm(TfrmDialogProductTypeNBD, frmDialogProductTypeNBD);

  frmDialogProductTypeNBD.Caption := 'Edit NBD Product Type';
  frmDialogProductTypeNBD.FormMode := fmEdit;
//  frmDialogProductTypeNBD.UntID := MasterNewUnit.ID;
//  frmDialogProductTypeNBD.CompID := Mastercompany.ID;
//  frmDialogProductTypeNBD.ProductTypeNBDId := StrToInt(strgGrid.Cells[5,strgGrid.row]);

  SetFormPropertyAndShowDialog(frmDialogProductTypeNBD);
  if (frmDialogProductTypeNBD.IsProcessSuccessfull) then
  begin
    actRefreshProductTypeNBDExecute(Self);
    CommonDlg.ShowConfirm(atEdit);
  end;

  frmDialogProductTypeNBD.Free;
end;

procedure TfrmProductTypeNBD.actDeleteProductTypeNBDExecute(Sender: TObject);
begin
//  if strgGrid.Cells[5,strgGrid.row]='0' then Exit;
//  if (CommonDlg.Confirm('Are you sure you wish to delete Product Type (Code : '+strgGrid.Cells[0,strgGrid.row]+')?') = mrYes) then
  begin
   { if not assigned(ProductTypeNBD) then
      ProductTypeNBD := TProductTypeNBD.Create;
        if ProductTypeNBD.DeleteProductTypeNBD(StrToInt(strgGrid.Cells[5,strgGrid.row])) then
        begin
          actRefreshProductTypeNBDExecute(Self);
          CommonDlg.ShowConfirm(atDelete);
        end
        else
            CommonDlg.ShowError('Sudah pernah ada Transaksi ' +  #13
            + ' Tidak dapat di hapus ' );
   }end;
end;

procedure TfrmProductTypeNBD.RefreshData;
var
  data: TDataSet;
  i: Integer;
  tempBool: Boolean;
begin
  {if not assigned(ProductTypeNBD) then
    ProductTypeNBD := TProductTypeNBD.Create;

  data := ProductTypeNBD.GetDataProductTypeNBD(MasterNewUnit.ID);
  with strgGrid do
  begin
    Clear;
    RowCount := data.RecordCount+1;
    ColCount := 5;

    Cells[0, 0] := 'CODE';
    Cells[1, 0] := 'NAME';
    Cells[2, 0] := 'COST CENTER';
    Cells[3, 0] := 'ACCOUNT DB';
    Cells[4, 0] := 'ACCOUNT CR';
    i:=1;
    if RowCount>1 then
    with data do
    while not Eof do
    begin
      Cells[0, i] := data.Fieldbyname('TPPRO_CODE').AsString;
      Cells[1, i] := data.Fieldbyname('TPPRO_NAME').AsString;
      Cells[2, i] := 'FAKE DATA COST CENTER '+ IntToStr(i); //data.Fieldbyname('TPPRO_NAME').AsString;
      Cells[3, i] := data.Fieldbyname('TPPRO_REK_DEBET').AsString;
      Cells[4, i] := data.Fieldbyname('TPPRO_REK_CREDIT').AsString;
      Cells[5, i] := IntToStr(data.Fieldbyname('TPPRO_ID').AsInteger);
      Cells[6, i] := data.Fieldbyname('TPPRO_OWNER').AsString;
      Cells[7, i] := 'FAKE DATA COST CENTER '+ IntToStr(i);
      Cells[8, i] := data.Fieldbyname('ACCOUNT_NAME_DB').AsString;
      Cells[9, i] := data.Fieldbyname('ACCOUNT_NAME_CR').AsString;
      i:=i+1;
      Next;
    end
    else
    begin
      RowCount:=2;
      Cells[0, 1] := ' ';
      Cells[1, 1] := ' ';
      Cells[2, 1] := ' ';
      Cells[3, 1] := ' ';
      Cells[4, 1] := ' ';
      Cells[5, 1] := '0'; //ID
      Cells[6, 1] := ' ';
      Cells[7, 1] := ' ';
      Cells[8, 1] := ' ';
      Cells[9, 1] := ' ';
    end;
    FixedRows := 1;
    AutoSize := true;
  end;

  strgGridRowChanging(Self,0,1,tempBool);
  strgGrid.SetFocus;
  }
end;

procedure TfrmProductTypeNBD.actRefreshProductTypeNBDExecute(Sender: TObject);
begin
  RefreshData();
end;

procedure TfrmProductTypeNBD.FormShow(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'NBD PRODUCT TYPE';
  actRefreshProductTypeNBDExecute(Self);
end;

procedure TfrmProductTypeNBD.stringgridGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
//  IdProductTypeNBD:= StrToInt(strgGrid.Cells[2,arow]);
//  strNama:= strgGrid.Cells[1,arow];
end;

procedure TfrmProductTypeNBD.FormActivate(Sender: TObject);
begin
  inherited;
  //frmMain.CreateMenu((sender as TForm));
end;

procedure TfrmProductTypeNBD.strgGridRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  inherited;
//  edtOwner.Text := strgGrid.Cells[6,NewRow];
//  edtCostCenterDesc.Text := strgGrid.Cells[7,NewRow];
//  edtAccNameDB.Text := strgGrid.Cells[8,NewRow];
//  edtAccNameCR.Text := strgGrid.Cells[9,NewRow];
end;

end.
