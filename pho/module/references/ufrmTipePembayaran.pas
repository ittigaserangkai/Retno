unit ufrmTipePembayaran;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls,
  ufraFooter5Button, ActnList, uConn, uRetnoUnit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, System.Actions, ufrmMaster, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, ufraFooter4Button, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, DBClient, uClientClasses, uDMClient,
  uDBUtils, uDXUtils;

type
  TfrmTipePembayaran = class(TfrmMasterBrowse)
    actlstTipePembayaran: TActionList;
    actAddTipePembayaran: TAction;
    actEditTipePembayaran: TAction;
    actDeleteTipePembayaran: TAction;
    actRefreshTipePembayaran: TAction;
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    procedure actAddTipePembayaranExecute(Sender: TObject);
    procedure actRefreshTipePembayaranExecute(Sender: TObject);
    procedure actEditTipePembayaranExecute(Sender: TObject);
    procedure actDeleteTipePembayaranExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FCDS: tClientDataset;
    FDSP: TDSProviderClient;
//    FTipePembayaran : TNewTipePembayaran;
    { Private declarations }
    function GetData(): TDataSet;
    function GetDSP: TDSProviderClient;
    procedure RefreshData;
    property CDS: tClientDataset read FCDS write FCDS;
    property DSP: TDSProviderClient read GetDSP write FDSP;
  public
    { Public declarations }
  end;

var
  frmTipePembayaran: TfrmTipePembayaran;

implementation

uses uTSCommonDlg, ufrmDialogTipePembayaran,  uConstanta;

{$R *.dfm}

{ TfrmTipePembayaran }

function TfrmTipePembayaran.GetData: TDataSet;
begin
  // inisiate business model
//  if not assigned(TipePembayaran) then
//    TipePembayaran := TTipePembayaran.Create;

//  Result := TipePembayaran.GetListDataTipePembayaran();
end;

procedure TfrmTipePembayaran.actAddTipePembayaranExecute(Sender: TObject);
begin
  inherited;
//  if MasterNewUnit.ID=0 then
//  begin
//    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
//    //frmMain.cbbUnit.SetFocus;
//    Exit;
//  end;
//  if(MasterNewUnit.ID <> 0) then
  begin
    if not Assigned(frmDialogTipePembayaran) then
      Application.CreateForm(TfrmDialogTipePembayaran, frmDialogTipePembayaran);

    frmDialogTipePembayaran.Caption := 'Add Payment Type';
    frmDialogTipePembayaran.FormMode := fmAdd;

    SetFormPropertyAndShowDialog(frmDialogTipePembayaran);
    if (frmDialogTipePembayaran.IsProcessSuccessfull) then
    begin
      actRefreshTipePembayaranExecute(Self);
      CommonDlg.ShowConfirm(atAdd);
    end;
  end
;//  else
//    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);

  frmDialogTipePembayaran.Free;
end;

procedure TfrmTipePembayaran.actRefreshTipePembayaranExecute(
  Sender: TObject);
var
    dataTipePembayaran: TDataSet;
    i,countData: Integer;
begin
  inherited;
  dataTipePembayaran := GetData();
  countData := dataTipePembayaran.RecordCount;
  {with strgGrid do
  begin
    Clear;
    RowCount := countData+1;
    ColCount := 2;

    Cells[0, 0] := 'CODE';
    Cells[1, 0] := 'TYPE';

    if (RowCount > 1) then
    begin
      i := 1;
      while not dataTipePembayaran.Eof do
      begin
        Cells[0, i] := dataTipePembayaran.FieldByName('TPBYR_CODE').AsString;
        Cells[1, i] := dataTipePembayaran.FieldByName('TPBYR_NAME').AsString;
        Cells[2, i] := dataTipePembayaran.FieldByName('TPBYR_ID').AsString;

        Inc(i);
        dataTipePembayaran.Next;
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

procedure TfrmTipePembayaran.actEditTipePembayaranExecute(Sender: TObject);
begin
  inherited;
  // check is Unit Id is specified?
//  if MasterNewUnit.ID=0 then
//  begin
//    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
//    //frmMain.cbbUnit.SetFocus;
//    Exit;
//  end;
//  if(MasterNewUnit.ID <> 0) then
  begin
//    if strgGrid.Cells[0,strgGrid.row]=' ' then Exit;

    if not Assigned(frmDialogTipePembayaran) then
      Application.CreateForm(TfrmDialogTipePembayaran, frmDialogTipePembayaran);

    frmDialogTipePembayaran.Caption := 'Edit Payment Type';
    frmDialogTipePembayaran.FormMode := fmEdit;
//    frmDialogTipePembayaran.TipePembayaranId := StrToInt(strgGrid.Cells[2,strgGrid.row]);

    SetFormPropertyAndShowDialog(frmDialogTipePembayaran);
    if (frmDialogTipePembayaran.IsProcessSuccessfull) then
    begin
      actRefreshTipePembayaranExecute(Self);
      CommonDlg.ShowConfirm(atEdit);
    end;
  end
;//  else
//    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);

  frmDialogTipePembayaran.Free;
end;

procedure TfrmTipePembayaran.actDeleteTipePembayaranExecute(
  Sender: TObject);
begin
  inherited;
//  if strgGrid.Cells[0,strgGrid.row]=' ' then Exit;

//  if (CommonDlg.Confirm('Are you sure you wish to delete Payment Type (Type: '+strgGrid.Cells[1,strgGrid.row]+ ' : ' +strgGrid.Cells[2,strgGrid.row]+') ?') = mrYes) then
  begin
    {
    IDLokal := StrToInt(frmTipePembayaran.strgGrid.Cells[2,frmTipePembayaran.strgGrid.Row]);
    if FTipePembayaran.LoadByID(IDLokal) then
    begin
      if FTipePembayaran.RemoveFromDB then
      begin
        cCommitTrans;
        CommonDlg.ShowMessage('Data Berhasil Dihapus');
        actRefreshTipePembayaranExecute(Self);
        Exit;
      end else
      begin
        cRollbackTrans;
        CommonDlg.ShowError('Data Gagal Dihapus');
        Exit;
      end;
    end;
    }
  end;
  
end;

procedure TfrmTipePembayaran.FormShow(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'PAYMENT TYPE';
  actRefreshTipePembayaranExecute(Self);
end;

procedure TfrmTipePembayaran.FormDestroy(Sender: TObject);
begin
  inherited;
  frmTipePembayaran := nil;
end;

procedure TfrmTipePembayaran.FormActivate(Sender: TObject);
begin
  inherited;
  //frmMain.CreateMenu((sender as TForm));
end;

procedure TfrmTipePembayaran.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //frmMain.DestroyMenu((sender as TForm));
end;

procedure TfrmTipePembayaran.FormCreate(Sender: TObject);
begin
  inherited;
  RefreshData;
//  FTipePembayaran := TNewTipePembayaran.Create(Self);
end;

function TfrmTipePembayaran.GetDSP: TDSProviderClient;
begin
  if not assigned(FDSP) then
    FDSP := TDSProviderClient.Create(DMClient.RestConn,False);
  Result := FDSP;
end;

procedure TfrmTipePembayaran.RefreshData;
begin
  CDS := TDBUtils.DSToCDS(DSP.TipePembayaran_GetDSOverview(),self);
  CXGridview.LoadFromCDS(CDS);
//  cxGridView.SetVisibleColumns(['REF$TIPE_PEMBAYARAN_ID'],false);
//  cxGridView.SetColumnsCaption(['TPBYR_CODE', 'TPBYR_NAME'],['Kode', 'Nama']);
end;

end.
