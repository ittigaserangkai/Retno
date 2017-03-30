unit ufrmSatuan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls,
   ActnList, uConn, uRetnoUnit, DB, System.Actions,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Datasnap.DBClient, uDMClient;

type
  TfrmSatuan = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    actlstSatuan: TActionList;
    actAddSatuan: TAction;
    actEditSatuan: TAction;
    actDeleteSatuan: TAction;
    actRefreshSatuan: TAction;
    cxGrid: TcxGrid;
    cxGrdBrowse: TcxGridDBTableView;
    cxGrdDetail: TcxGridDBTableView;
    lvMaster: TcxGridLevel;
    lvDetail: TcxGridLevel;

    procedure FormShow(Sender: TObject);
    procedure actAddSatuanExecute(Sender: TObject);
    procedure actEditSatuanExecute(Sender: TObject);
    procedure actDeleteSatuanExecute(Sender: TObject);
    procedure actRefreshSatuanExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure fraFooter5Button1btnCloseClick(Sender: TObject);
  private
    FCDS: TClientDataSet;
    property CDS: TClientDataSet read FCDS write FCDS;
    { Private declarations }
//    FNewUOM : TNewUOM;
  public
    { Public declarations }
  end;

var
  frmSatuan: TfrmSatuan;

implementation

uses ufrmDialogSatuan, uDBUtils, uAppUtils, uDXUtils, uTSCommonDlg;

{$R *.dfm}

procedure TfrmSatuan.FormShow(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'UNIT OF MEASURE (UOM)';
  actRefreshSatuanExecute(Self);
end;

procedure TfrmSatuan.fraFooter5Button1btnCloseClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TfrmSatuan.actAddSatuanExecute(Sender: TObject);
begin
  inherited;

    if not Assigned(frmDialogSatuan) then
      Application.CreateForm(TfrmDialogSatuan, frmDialogSatuan);

    frmDialogSatuan.Caption := 'Add Unit Of Measure (UOM)';
    frmDialogSatuan.FormMode := fmAdd;
    SetFormPropertyAndShowDialog(frmDialogSatuan);

    if (frmDialogSatuan.IsProcessSuccessfull) then
    begin
      actRefreshSatuanExecute(Self);
//      CommonDlg.ShowConfirm(atAdd);
    end;


  FreeAndNil(frmDialogSatuan);
end;

procedure TfrmSatuan.actEditSatuanExecute(Sender: TObject);
begin
  inherited;

    if not Assigned(frmDialogSatuan) then
      Application.CreateForm(TfrmDialogSatuan, frmDialogSatuan);

    frmDialogSatuan.Caption  := 'Edit Unit Of Measure (UOM)';
    frmDialogSatuan.FormMode := fmEdit;
    frmDialogSatuan.LoadData(CDS.FieldByName('REF$SATUAN_ID').AsString);

    SetFormPropertyAndShowDialog(frmDialogSatuan);
  if (frmDialogSatuan.IsProcessSuccessfull) then
    actRefreshSatuanExecute(Self);

  FreeAndNil(frmDialogSatuan);
end;

procedure TfrmSatuan.actDeleteSatuanExecute(Sender: TObject);
//var
//  aUOM: string;
begin
  inherited;
  cxGrdBrowse.ExportToXLS();
// frmDialogSatuan.LoadData(cxgrid);
 {
  aUOM := strgGrid.Cells[_kolKode,strgGrid.Row];
  if (CommonDlg.Confirm('Are you sure you wish to delete UOM (Code: '
        + strgGrid.Cells[_kolKode,strgGrid.Row]+')?') = mrYes) then
  begin
    if FNewUOM.LoadByUOM(aUOM) then
    begin
      if FNewUOM.RemoveFromDB then
      begin
        cCommitTrans;
        CommonDlg.ShowMessage('Data Berhasil DiHapus');
        actRefreshSatuanExecute(Self);
        Exit;
      end
      else
      begin
        cRollbackTrans;
        CommonDlg.ShowError('Data Gagal Di Hapus');
      end;
    end;
  end;
   }
end;

procedure TfrmSatuan.actRefreshSatuanExecute(Sender: TObject);
begin
  if Assigned(FCDS) then FCDS.Free;

  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.Satuan_GetDSOverview ,Self );
  cxGrdBrowse.LoadFromCDS(CDS);
  cxGrdBrowse.SetVisibleColumns(['REF$SATUAN_ID'],False);
end;

procedure TfrmSatuan.FormDestroy(Sender: TObject);
begin
  inherited;
//  FreeAndNil(FnewUOM);
  frmSatuan := nil;
end;

procedure TfrmSatuan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action  := caFree;
end;

procedure TfrmSatuan.FormCreate(Sender: TObject);
begin
  inherited;
//  FnewUOM := TNewUOM.create(Self);
end;

end.
