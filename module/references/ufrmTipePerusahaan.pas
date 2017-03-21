unit ufrmTipePerusahaan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, ufraFooter5Button, ActnList, uConn,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, System.Actions, DBClient,
  uDMClient, uDBUtils, uDXUtils, dxBarBuiltInMenu, cxContainer, Vcl.ComCtrls,
  dxCore, cxDateUtils, Vcl.Menus, ufraFooter4Button, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxPC;


type
  TfrmTipePerusahaan = class(TfrmMasterBrowse)
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    procedure actAddExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actDeleteTipePerusahaanExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    FCDSBrowse: tClientDataset;
    function GetData(): TDataSet;
    property CDSBrowse: tClientDataset read FCDSBrowse write FCDSBrowse;

  protected
    procedure RefreshData; override;
  public
    { Public declarations }
  end;

var
  frmTipePerusahaan: TfrmTipePerusahaan;

implementation

uses uTSCommonDlg, ufrmDialogTipePerusahaan;

{$R *.dfm}

procedure TfrmTipePerusahaan.actAddExecute(Sender: TObject);
begin
  inherited;
   ShowDialogForm(TfrmDialogTipePerusahaan);
end;

procedure TfrmTipePerusahaan.FormDestroy(Sender: TObject);
begin
  inherited;
  frmTipePerusahaan := nil;
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

procedure TfrmTipePerusahaan.actEditExecute(Sender: TObject);
begin
  inherited;
ShowDialogForm(TfrmDialogTipePerusahaan,
    cxGridView.DS.FieldByName('REF$TIPE_PERUSAHAAN_ID').AsString
    );
end;

procedure TfrmTipePerusahaan.actPrintExecute(Sender: TObject);
begin
  inherited;
  //print
end;

procedure TfrmTipePerusahaan.actRefreshExecute(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

function TfrmTipePerusahaan.GetData(): TDataSet;
var
  arrParam: TArr;
begin
  arrParam := nil;
//  Result := TipePerusahaan.GetDataTipePerusahaan(arrParam);
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
  cxGridView.LoadFromCDS(CDSBrowse);
//  cxGridViewTipePerusahaan.SetVisibleColumns(['REF$TIPE_PERUSAHAAN_ID'], False);
//  cxGridViewTipePerusahaan.SetColumnsCaption(['TPPERSH_CODE','TPPERSH_NAME'],['KODE','NAMA']);
end;

end.
