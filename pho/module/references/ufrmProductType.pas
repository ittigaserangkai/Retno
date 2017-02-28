unit ufrmProductType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster,  ufraFooter5Button, StdCtrls, ExtCtrls, ActnList,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, System.Actions;

type
  TfrmProductType = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    actlst1: TActionList;
    actAddProductType: TAction;
    actEditProductType: TAction;
    actDeleteProductType: TAction;
    actRefreshProductType: TAction;
    cxGridViewTipeProduk: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid: TcxGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure actAddProductTypeExecute(Sender: TObject);
    procedure actEditProductTypeExecute(Sender: TObject);
    procedure actDeleteProductTypeExecute(Sender: TObject);
    procedure actRefreshProductTypeExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure strgGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fraFooter5Button1btnCloseClick(Sender: TObject);
  private
    IdProductType: integer;
    strnama: string;
//    FTipeProduct : TTipeProduk;
    procedure RefreshData();
  public
    { Public declarations }
  end;

var
  frmProductType: TfrmProductType;

implementation

uses ufrmDialogProductType, uTSCommonDlg, Math, uConn, uConstanta;

{$R *.dfm}

procedure TfrmProductType.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmProductType.FormDestroy(Sender: TObject);
begin
  inherited;
  frmProductType := nil;
end;

procedure TfrmProductType.actAddProductTypeExecute(Sender: TObject);
begin

  if not Assigned(frmDialogProductType) then
    Application.CreateForm(TfrmDialogProductType, frmDialogProductType);

  frmDialogProductType.Caption := 'Add Product Type';
  frmDialogProductType.FormMode := fmAdd;

  SetFormPropertyAndShowDialog(frmDialogProductType);
  if (frmDialogProductType.IsProcessSuccessfull) then
  begin
    actRefreshProductTypeExecute(Self);
    CommonDlg.ShowConfirm(atAdd);
  end;

  frmDialogProductType.Free;
end;

procedure TfrmProductType.actEditProductTypeExecute(Sender: TObject);
begin
//  if strgGrid.Cells[2,strgGrid.row]='0' then Exit;
//  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    //frmMain.cbbUnit.SetFocus;
    Exit;
  end;
  if not Assigned(frmDialogProductType) then
    Application.CreateForm(TfrmDialogProductType, frmDialogProductType);
  frmDialogProductType.Caption := 'Edit Product Type';
  frmDialogProductType.FormMode := fmEdit;
//  frmDialogProductType.ProductTypeId := StrToInt(strgGrid.Cells[2,strgGrid.row]);

  SetFormPropertyAndShowDialog(frmDialogProductType);
  if (frmDialogProductType.IsProcessSuccessfull) then
  begin
    actRefreshProductTypeExecute(Self);
    CommonDlg.ShowConfirm(atEdit);
  end;

  frmDialogProductType.Free;
end;

procedure TfrmProductType.actDeleteProductTypeExecute(Sender: TObject);
var
  aID: Integer;
begin
  try
//    if strgGrid.Cells[2,strgGrid.row]='0' then Exit;
//    if MasterNewUnit.ID=0 then
    begin
      CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
      //frmMain.cbbUnit.SetFocus;
      Exit;
    end;
//    if (CommonDlg.Confirm('Are you sure you wish to delete Product Type (Code : '+strgGrid.Cells[0,strgGrid.row]+')?') = mrYes) then
    begin
//      if not assigned(ProductType) then
//        ProductType := TProductType.Create;
//
//      aID := StrToInt(strgGrid.Cells[2,strgGrid.row]);
//
//      if FtipeProduct.LoadByID(aID) then
      begin
//        if FTipeProduct.RemoveFromDB then
        begin
          actRefreshProductTypeExecute(Self);
          CommonDlg.ShowConfirm(atDelete);
        end// else CommonDlg.ShowMessage('Load data gagal');
      end;
    end;
  finally
    frmProductType.fraFooter5Button1.btnRefresh.Click;
  end;
end;

procedure TfrmProductType.RefreshData;
var
  data:TDataSet;
  i:Integer;
begin
  {if not assigned(ProductType) then
    ProductType := TProductType.Create;

  data := ProductType.GetDataProductType();
  with strgGrid do
  begin
    Clear;
    RowCount := data.RecordCount+1;
    ColCount := 2;

    Cells[0, 0] := 'CODE';
    Cells[1, 0] := 'NAME';
    i:=1;
    if RowCount>1 then
    begin
      with data do
      begin
        while not Eof do
        begin
          Cells[0, i] := data.Fieldbyname('TPBRG_CODE').AsString;
          Cells[1, i] := data.Fieldbyname('TPBRG_NAME').AsString;
          Cells[2, i] := IntToStr(data.Fieldbyname('TPBRG_ID').AsInteger);
          i:=i+1;
          Application.ProcessMessages;
          Next;
        end;
      end;
    end
    else
    begin
      RowCount:=2;
      Cells[0, 1] := ' ';
      Cells[1, 1] := ' ';
      Cells[2, 1] := '0';
    end;
    FixedRows := 1;
    AutoSize := true;
  end;
  strgGrid.SetFocus;}
end;

procedure TfrmProductType.actRefreshProductTypeExecute(Sender: TObject);
begin
  RefreshData();
end;

procedure TfrmProductType.FormShow(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'PRODUCT TYPE';
  actRefreshProductTypeExecute(Self);
end;

procedure TfrmProductType.strgGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
//  IdProductType:= StrToInt(strgGrid.Cells[2,arow]);
//  strNama:= strgGrid.Cells[1,arow];
end;

procedure TfrmProductType.FormActivate(Sender: TObject);
begin
  inherited;
  //frmMain.CreateMenu((sender as TForm));
end;

procedure TfrmProductType.FormCreate(Sender: TObject);
begin
  inherited;
//  FTipeProduct := TTipeProduk.Create(Self);
end;

procedure TfrmProductType.fraFooter5Button1btnCloseClick(Sender: TObject);
begin
  inherited;
  fraFooter5Button1.btnCloseClick(Sender);

end;

end.
