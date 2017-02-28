unit ufrmMasterProductNBD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster,  ufraFooter5Button,
  StdCtrls, ExtCtrls, ActnList, uConn;

type
  TfrmMasterProductNBD = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    actlst1: TActionList;
    actAddMasterProductNBD: TAction;
    actEditMasterProductNBD: TAction;
    actDeleteMasterProductNBD: TAction;
    actRefreshMasterProductNBD: TAction;
    pnl1: TPanel;
    pnl2: TPanel;
    edtProductDesc: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    edtProductType: TEdit;
    strgGrid: TAdvStringGrid;
    lbl3: TLabel;
    lbl4: TLabel;
    edtProductTypeName: TEdit;
    edtAccountDB: TEdit;
    edtAccountNameDB: TEdit;
    edtAccountCR: TEdit;
    edtAccountNameCR: TEdit;
    Panel1: TPanel;
    edtSearch: TEdit;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure actAddMasterProductNBDExecute(Sender: TObject);
    procedure actEditMasterProductNBDExecute(Sender: TObject);
    procedure actDeleteMasterProductNBDExecute(Sender: TObject);
    procedure actRefreshMasterProductNBDExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure stringgridGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure strgGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure strgGridGridHint(Sender: TObject; ARow, ACol: Integer;
      var hintstr: String);
    procedure edtSearchChange(Sender: TObject);
  private
    IdMasterProductNBD: integer;
    strnama: string;
    procedure RefreshData();
    procedure FindDataOnGrid(AText: String);
  public
    { Public declarations }
  end;

var
  frmMasterProductNBD: TfrmMasterProductNBD;

implementation

uses ufrmDialogMasterProductNBD, uTSCommonDlg, Math, DB, uLogin,  uConstanta,
  uRetnoUnit, uNewProduk_Jasa;

const
    _KolCODE             = 0;
    _KolBKP              = 1;
    _KolTax              = 2;
    _KolUOM              = 3;
    _KolPRICE            = 4;
    _KolQTY              = 5;
    _KolPROJAS_NAME      = 6;
    _KolTPPRO_CODE       = 7;
    _KolTPPRO_NAME       = 8;
    _KolTPPRO_REK_DEBET  = 9;
    _KolACCOUNT_NAME_DB  = 10;
    _KolTPPRO_REK_CREDIT = 11;
    _KolACCOUNT_NAME_CR  = 12;

{$R *.dfm}

procedure TfrmMasterProductNBD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Try
     //frmMain.DestroyMenu((sender as TForm));
  Except
  end;
  Action := caFree;
end;

procedure TfrmMasterProductNBD.FormDestroy(Sender: TObject);
begin
  inherited;
  frmMasterProductNBD := nil;
end;

procedure TfrmMasterProductNBD.actAddMasterProductNBDExecute(Sender: TObject);
begin
  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    //frmMain.cbbUnit.SetFocus;
    Exit;
  end;
  if not Assigned(frmDialogMasterProductNBD) then
    Application.CreateForm(TfrmDialogMasterProductNBD, frmDialogMasterProductNBD);
  frmDialogMasterProductNBD.frmSuiMasterDialog.Caption := 'Add NBD Product Master';
  frmDialogMasterProductNBD.FormMode                   := fmAdd;

  SetFormPropertyAndShowDialog(frmDialogMasterProductNBD);
  if (frmDialogMasterProductNBD.IsProcessSuccessfull) then
  begin
    actRefreshMasterProductNBDExecute(Self);
    CommonDlg.ShowConfirm(atAdd);
  end;

  frmDialogMasterProductNBD.Free;
end;

procedure TfrmMasterProductNBD.actEditMasterProductNBDExecute(Sender: TObject);
begin
  if strgGrid.Cells[0,strgGrid.row]='' then Exit;
  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    //frmMain.cbbUnit.SetFocus;
    Exit;
  end;
  if not Assigned(frmDialogMasterProductNBD) then
    Application.CreateForm(TfrmDialogMasterProductNBD, frmDialogMasterProductNBD);
  frmDialogMasterProductNBD.frmSuiMasterDialog.Caption := 'Edit NBD Product Master';
  frmDialogMasterProductNBD.FormMode                   := fmEdit;
  frmDialogMasterProductNBD.MasterProductNBDId         := strgGrid.Cells[0,strgGrid.row];

  SetFormPropertyAndShowDialog(frmDialogMasterProductNBD);
  if (frmDialogMasterProductNBD.IsProcessSuccessfull) then
  begin
    actRefreshMasterProductNBDExecute(Self);
    CommonDlg.ShowConfirm(atEdit);
  end;

  frmDialogMasterProductNBD.Free;
end;

procedure TfrmMasterProductNBD.actDeleteMasterProductNBDExecute(Sender: TObject);
var
    FNewProduk_Jasa : TNewProduk_Jasa;
begin
  if strgGrid.Cells[0,strgGrid.row]='' then Exit;
  if (CommonDlg.Confirm('Are you sure you wish to delete Product (Code : '+strgGrid.Cells[0,strgGrid.row]+')?') = mrYes) then
  begin
    FNewProduk_Jasa := TNewProduk_Jasa.CreateWithUser(self, FLoginId, FLoginUnitId);
    //FNewProduk_Jasa.LoadByCODE(strgGrid.Cells[0,strgGrid.row], MasterNewUnit.ID);
    //    if MasterProductNBD.DeleteMasterProductNBD(strgGrid.Cells[0,strgGrid.row]) then
    if FNewProduk_Jasa.RemoveFromDB(strgGrid.Cells[0,strgGrid.row], MasterNewUnit.ID) then
    begin
      cCommitTrans;
      actRefreshMasterProductNBDExecute(Self);
      CommonDlg.ShowConfirm(atDelete);
      FNewProduk_Jasa.Free;
    end
    else
    begin
      cRollbackTrans;
      CommonDlg.ShowError(ER_DELETE_FAILED);
      FNewProduk_Jasa.Free;
    end;
  end;
end;

procedure TfrmMasterProductNBD.RefreshData;
var
//  sSQL: string;
  data: TDataSet;
  i: Integer;
  tempBool: Boolean;
begin

  data := GetDataMasterProductNBD(MasterNewUnit.ID, Mastercompany.ID);
  data.Last;
  with strgGrid do
  begin
    Clear;
    RowCount := data.RecordCount+1;
    ColCount := 6;
    Cells[_KolCODE, 0]  := 'CODE';
    Cells[_KolBKP, 0]   := 'BKP/NON BKP';
    Cells[_KolTax, 0]   := 'TAX';
    Cells[_KolUOM, 0]   := 'UOM';
    Cells[_KolPRICE, 0] := 'UNIT PRICE (NonPPN)';
    Cells[_KolQTY, 0]   := 'JML';
    i:=1;
    data.First;
    if RowCount>1 then
    with data do
    while not Eof do
    begin
      Cells[_KolCODE, i]  := data.Fieldbyname('PROJAS_CODE').AsString;
      if data.Fieldbyname('PROJAS_IS_BKP').AsInteger = 1 then
        Cells[_KolBKP, i] := 'BKP'
      else Cells[_KolBKP, i] := 'NON BKP';
      Cells[_KolTax, i]   := data.Fieldbyname('PJK_NAME').AsString;
      Cells[_KolUOM, i]   := data.Fieldbyname('PROJAS_SATNBD_CODE').AsString;
      Cells[_KolPRICE, i] := FormatFloat('"Rp" ,0.00', data.Fieldbyname('PROJAS_PRICE').AsFloat) + ' / ' +
                     data.Fieldbyname('PER_NAME').AsString;
      Cells[_KolPROJAS_NAME, i]      := data.Fieldbyname('PROJAS_NAME').AsString;
      Cells[_KolQty, i]              := data.Fieldbyname('PROJAS_QTY').AsString;
      Cells[_KolTPPRO_CODE, i]       := data.Fieldbyname('TPPRO_CODE').AsString;
      Cells[_KolTPPRO_NAME, i]       := data.Fieldbyname('TPPRO_NAME').AsString;
      Cells[_KolTPPRO_REK_DEBET, i]  := data.Fieldbyname('TPPRO_REK_DEBET').AsString;
      Cells[_KolACCOUNT_NAME_DB, i]  := data.Fieldbyname('ACCOUNT_NAME_DB').AsString;
      Cells[_KolTPPRO_REK_CREDIT, i] := data.Fieldbyname('TPPRO_REK_CREDIT').AsString;
      Cells[_KolACCOUNT_NAME_CR, i]  := data.Fieldbyname('ACCOUNT_NAME_CR').AsString;
      i:=i+1;
      Next;
    end
    else //RowCount
    begin
      RowCount:=2;
      i := 1;
      Cells[_KolCODE, i]             := ' ';
      Cells[_KolBKP, i]              := ' ';
      Cells[_KolTax, i]              := ' ';
      Cells[_KolUOM, i]              := ' ';
      Cells[_KolPRICE, i]            := ' ';
      Cells[_KolQty, i]              := '0';
      Cells[_KolPROJAS_NAME, i]      := ' ';
      Cells[_KolTPPRO_CODE, i]       := ' ';
      Cells[_KolTPPRO_NAME, i]       := ' ';
      Cells[_KolTPPRO_REK_DEBET, i]  := ' ';
      Cells[_KolACCOUNT_NAME_DB, i]  := ' ';
      Cells[_KolTPPRO_REK_CREDIT, i] := ' ';
      Cells[_KolACCOUNT_NAME_CR, i]  := ' ';
      //NOT USED id
    end;
    FixedRows := 1;
    AutoSize := true;
  end;

  strgGridRowChanging(Self,0,1,tempBool);
  strgGrid.SetFocus;
end;

procedure TfrmMasterProductNBD.actRefreshMasterProductNBDExecute(Sender: TObject);
begin
  RefreshData();
end;

procedure TfrmMasterProductNBD.FormShow(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'NBD PRODUCT MASTER';
  actRefreshMasterProductNBDExecute(Self);
end;

procedure TfrmMasterProductNBD.stringgridGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  IdMasterProductNBD:= StrToInt(strgGrid.Cells[2,arow]);
  strNama:= strgGrid.Cells[1,arow];
end;

procedure TfrmMasterProductNBD.FormActivate(Sender: TObject);
begin
  inherited;
  //frmMain.CreateMenu((sender as TForm));
end;

procedure TfrmMasterProductNBD.strgGridRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  edtProductDesc.Text     := strgGrid.Cells[_KolPROJAS_NAME ,NewRow];
  edtProductType.Text     := strgGrid.Cells[_KolTPPRO_CODE ,NewRow];
  edtProductTypeName.Text := strgGrid.Cells[_KolTPPRO_NAME ,NewRow];
  edtAccountDB.Text       := strgGrid.Cells[_KolTPPRO_REK_DEBET ,NewRow];
  edtAccountNameDB.Text   := strgGrid.Cells[_KolACCOUNT_NAME_DB ,NewRow];
  edtAccountCR.Text       := strgGrid.Cells[_KolTPPRO_REK_CREDIT ,NewRow];
  edtAccountNameCR.Text   := strgGrid.Cells[_KolACCOUNT_NAME_CR ,NewRow];
end;

procedure TfrmMasterProductNBD.strgGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  edtProductDesc.Text     := strgGrid.Cells[_KolPROJAS_NAME,ARow];
  edtProductType.Text     := strgGrid.Cells[_KolTPPRO_CODE,ARow];
  edtProductTypeName.Text := strgGrid.Cells[_KolTPPRO_NAME,ARow];
  edtAccountDB.Text       := strgGrid.Cells[_KolTPPRO_REK_DEBET,ARow];
  edtAccountNameDB.Text   := strgGrid.Cells[_KolACCOUNT_NAME_DB,ARow];
  edtAccountCR.Text       := strgGrid.Cells[_KolTPPRO_REK_CREDIT,ARow];
  edtAccountNameCR.Text   := strgGrid.Cells[_KolACCOUNT_NAME_CR,ARow];
end;

procedure TfrmMasterProductNBD.strgGridGridHint(Sender: TObject; ARow,
  ACol: Integer; var hintstr: String);
begin
  inherited;
  if ACol = _KolPRICE then
     hintstr := '"UNIT PRICE non PPN" = DPP';

end;

procedure TfrmMasterProductNBD.FindDataOnGrid(AText: String);
var
  resPoint: TPoint;
begin
  if (AText <> '') then
  begin
    resPoint := strgGrid.Find(Point(0,0),AText,[fnIncludeFixed]);
    if (resPoint.Y <> -1) then
    begin
      strgGrid.ScrollInView(resPoint.X, resPoint.Y);
      strgGrid.SelectRows(resPoint.Y, 1);
    end;
  end;
end;

procedure TfrmMasterProductNBD.edtSearchChange(Sender: TObject);
begin
  inherited;
  FindDataOnGrid(edtSearch.Text);
end;

end.
