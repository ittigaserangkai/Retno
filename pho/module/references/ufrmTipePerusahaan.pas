unit ufrmTipePerusahaan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter5Button, ActnList, uConn,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, System.Actions, DBClient,
  uDMClient, uDBUtils, uDXUtils;

type
  TfrmTipePerusahaan = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    actlstTipeSupplier: TActionList;
    actAddTipePerusahaan: TAction;
    actEditTipePerusahaan: TAction;
    actDeleteTipePerusahaan: TAction;
    actRefreshTipePerusahaan: TAction;
    cxGridViewTipePerusahaan: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid: TcxGrid;
    cxGridViewTipePerusahaanColumn1: TcxGridDBColumn;
    cxGridViewTipePerusahaanColumn2: TcxGridDBColumn;
    cxGridViewTipePerusahaanColumn3: TcxGridDBColumn;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actAddTipePerusahaanExecute(Sender: TObject);
    procedure actEditTipePerusahaanExecute(Sender: TObject);
    procedure actDeleteTipePerusahaanExecute(Sender: TObject);
    procedure actRefreshTipePerusahaanExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    FCDSBrowse: tClientDataset;
    function GetData(): TDataSet;
    procedure RefreshData;
    property CDSBrowse: tClientDataset read FCDSBrowse write FCDSBrowse;

  public
    { Public declarations }
  end;

var
  frmTipePerusahaan: TfrmTipePerusahaan;

implementation

uses uTSCommonDlg, ufrmDialogTipePerusahaan;

{$R *.dfm}

procedure TfrmTipePerusahaan.FormDestroy(Sender: TObject);
begin
  inherited;
  frmTipePerusahaan := nil;
end;

procedure TfrmTipePerusahaan.FormShow(Sender: TObject);
begin
  inherited;
  // no unit id must be specified, so hide the combo
//  frmMain.lbl1.Visible := False;
//  frmMain.cbbUnit.Visible := False;
  
  lblHeader.Caption := 'COMPANY TYPE';
  actRefreshTipePerusahaanExecute(Self);
end;

procedure TfrmTipePerusahaan.actAddTipePerusahaanExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogTipePerusahaan) then
    Application.CreateForm(TfrmDialogTipePerusahaan, frmDialogTipePerusahaan);

  frmDialogTipePerusahaan.Caption := 'Add Company Type';
  frmDialogTipePerusahaan.FormMode := fmAdd;

  SetFormPropertyAndShowDialog(frmDialogTipePerusahaan);
  if (frmDialogTipePerusahaan.IsProcessSuccessfull) then
  begin
    actRefreshTipePerusahaanExecute(Self);
    CommonDlg.ShowConfirm(atAdd);
  end;

  frmDialogTipePerusahaan.Free;
end;

procedure TfrmTipePerusahaan.actEditTipePerusahaanExecute(Sender: TObject);
begin
  inherited;
  // check is data available
//  if strgGrid.Cells[0,strgGrid.row]=' ' then Exit;

  if not Assigned(frmDialogTipePerusahaan) then
    Application.CreateForm(TfrmDialogTipePerusahaan, frmDialogTipePerusahaan);

  frmDialogTipePerusahaan.Caption := 'Edit Company Type';
  frmDialogTipePerusahaan.FormMode := fmEdit;
//  frmDialogTipePerusahaan.TipePerusahaanId := StrToInt(strgGrid.Cells[2,strgGrid.row]);
  frmDialogTipePerusahaan.loaddata(CDSBrowse.FieldByName('REF$TIPE_PERUSAHAAN_ID').AsString);
  SetFormPropertyAndShowDialog(frmDialogTipePerusahaan);
  if (frmDialogTipePerusahaan.IsProcessSuccessfull) then
  begin
    actRefreshTipePerusahaanExecute(Self);
    CommonDlg.ShowConfirm(atEdit);
  end;

  frmDialogTipePerusahaan.Free;
end;

procedure TfrmTipePerusahaan.actDeleteTipePerusahaanExecute(
  Sender: TObject);
begin
  inherited;
//  if strgGrid.Cells[0,strgGrid.row]=' ' then Exit;
  {
  if (CommonDlg.Confirm('Are you sure you wish to delete Company Type (Name: '+strgGrid.Cells[1,strgGrid.row]+')?') = mrYes) then
  begin
    // todo: put your code to delete data here..
    // code goes here..
    if not assigned(TipePerusahaan) then
      TipePerusahaan := TTipePerusahaan.Create;

    if TipePerusahaan.DeleteDataTipePerusahaan(StrToInt(strgGrid.Cells[2,strgGrid.row])) then
    begin
      actRefreshTipePerusahaanExecute(Self);
      CommonDlg.ShowConfirm(atDelete);
    end;
  end;
  }
end;

function TfrmTipePerusahaan.GetData(): TDataSet;
var
  arrParam: TArr;
begin
  arrParam := nil;
//  Result := TipePerusahaan.GetDataTipePerusahaan(arrParam);
end;

procedure TfrmTipePerusahaan.actRefreshTipePerusahaanExecute(Sender: TObject);
begin
  RefreshData;
end;

procedure TfrmTipePerusahaan.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //frmMain.lbl1.Visible := True;
  //frmMain.cbbUnit.Visible := True;
  //frmMain.DestroyMenu((sender as TForm));
end;

procedure TfrmTipePerusahaan.FormActivate(Sender: TObject);
begin
  inherited;
  // no unit id must be specified, so hide the combo
  //frmMain.lbl1.Visible := False;
  //frmMain.cbbUnit.Visible := False;
  //frmMain.cbbCompCode.Visible := False;
  //frmMain.lbl2.Visible := False;
  //frmMain.CreateMenu((sender as TForm));
end;

procedure TfrmTipePerusahaan.FormDeactivate(Sender: TObject);
begin
  inherited;
  // no unit id must be specified, so hide the combo
  //frmMain.lbl1.Visible := True;
  //frmMain.cbbUnit.Visible := True;
  //frmMain.cbbCompCode.Visible := True;
  //frmMain.lbl2.Visible := True;
end;

procedure TfrmTipePerusahaan.RefreshData;
begin
  CDSBrowse := TDbUtils.DSToCDS(DMClient.DSProviderClient.TipePerusahaan_GetDSOverview, self);
  cxGridViewTipePerusahaan.LoadFromCDS(CDSBrowse);
//  cxGridViewTipePerusahaan.SetVisibleColumns(['REF$TIPE_PERUSAHAAN_ID'], False);
//  cxGridViewTipePerusahaan.SetColumnsCaption(['TPPERSH_CODE','TPPERSH_NAME'],['KODE','NAMA']);
end;

end.
