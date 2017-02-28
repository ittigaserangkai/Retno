unit ufrmMerchandiseGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, Grids, BaseGrid, AdvGrid,
  ufraFooter5Button, ActnList, SUIDlg, uNewMerchandize, uRetnoUnit;

type
  TfrmMerchandiseGroup = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    strgGrid: TAdvStringGrid;
    actlstMerchandiseGroup: TActionList;
    actAddMerchanGroup: TAction;
    actEditMerchanGroup: TAction;
    actDeleteMerchanGroup: TAction;
    actRefreshMerchanGroup: TAction;
   // FMerchanGroupId: integer;
    procedure actAddMerchanGroupExecute(Sender: TObject);
    procedure actEditMerchanGroupExecute(Sender: TObject);
    procedure actDeleteMerchanGroupExecute(Sender: TObject);
    procedure actRefreshMerchanGroupExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure fraFooter5Button1btnCloseClick(Sender: TObject);
  private
    FNewMerchandize: TNewMerchadize;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMerchandiseGroup: TfrmMerchandiseGroup;

implementation

uses ufrmDialogMerchandiseGroup, uTSCommonDlg, uMerchandiseGroup, uConn,
   uConstanta;

{$R *.dfm}
const
  _kolNo      : Integer = 0;
  _kolMerCd   : Integer = 1;
  _kolMerNm   : Integer = 2;
  _kolMerPjk  : Integer = 3;
  _kolMerId   : Integer = 4;

procedure TfrmMerchandiseGroup.actAddMerchanGroupExecute(
  Sender: TObject);
begin
  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    ////frmMain.cbbUnit.SetFocus;
    Exit;
  end;
  if not Assigned(frmDialogMerchandiseGroup) then
    Application.CreateForm(TfrmDialogMerchandiseGroup, frmDialogMerchandiseGroup);
  frmDialogMerchandiseGroup.frmSuiMasterDialog.Caption := 'Add Merchandise';
  frmDialogMerchandiseGroup.FormMode := fmAdd;

  SetFormPropertyAndShowDialog(frmDialogMerchandiseGroup);
  if (frmDialogMerchandiseGroup.IsProcessSuccessfull) then
  begin
    actRefreshMerchanGroupExecute(Self);
    CommonDlg.ShowConfirm(atAdd);
  end;

  frmDialogMerchandiseGroup.Free;
end;

procedure TfrmMerchandiseGroup.actEditMerchanGroupExecute(
  Sender: TObject);
begin
  if strgGrid.Cells[_kolMerId,strgGrid.row] = '0' then Exit;
  if MasterNewUnit.ID = 0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    ////frmMain.cbbUnit.SetFocus;
    Exit;
  end;

  if not Assigned(frmDialogMerchandiseGroup) then
    Application.CreateForm(TfrmDialogMerchandiseGroup, frmDialogMerchandiseGroup);

  frmDialogMerchandiseGroup.frmSuiMasterDialog.Caption := 'Edit Merchandise';
  frmDialogMerchandiseGroup.FormMode := fmEdit;
  frmDialogMerchandiseGroup.MerchanGroupId := StrToInt(strgGrid.Cells[_kolMerId,strgGrid.Row]);// put your merchan group id that won be edit
  SetFormPropertyAndShowDialog(frmDialogMerchandiseGroup);

  if (frmDialogMerchandiseGroup.IsProcessSuccessfull) then
  begin
    actRefreshMerchanGroupExecute(Self);
    CommonDlg.ShowConfirm(atEdit);
  end;

  frmDialogMerchandiseGroup.Free;
end;

procedure TfrmMerchandiseGroup.actDeleteMerchanGroupExecute(
  Sender: TObject);
begin
  if strgGrid.Cells[_kolMerId,strgGrid.row]='0' then Exit;
  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    ////frmMain.cbbUnit.SetFocus;
    Exit;
  end;

  if (CommonDlg.Confirm('Are you sure you wish to delete Merchandise (Code: '+strgGrid.Cells[0,strgGrid.row]+')?') = mrYes) then
  begin
    {if not assigned(MerchandiseGroup) then
      MerchandiseGroup := TMerchandiseGroup.Create;

    if MerchandiseGroup.DeleteDataMerchandiseGroup(StrToInt(strgGrid.Cells[2,strgGrid.Row]),MasterNewUnit.ID) then
    begin
      actRefreshMerchanGroupExecute(Self);
      CommonDlg.ShowConfirm(atDelete);
    end;
    }
    if FNewMerchandize.LoadByID(StrToInt(strgGrid.Cells[_kolMerId,strgGrid.Row])) then
    begin
      if FNewMerchandize.RemoveFromDB then
      begin
        cCommitTrans;
        CommonDlg.ShowMessage('Data Berhail DiHapus');
        frmMerchandiseGroup.fraFooter5Button1.btnRefresh.Click;
        exit;
      end
      else
      begin
        cRollbackTrans;
        CommonDlg.ShowMessage('Data Gagal Dihapus');
      end;
    end;
  end;

end;

procedure TfrmMerchandiseGroup.actRefreshMerchanGroupExecute(
  Sender: TObject);
var data: TResultDataSet;
    i: Integer;
begin
  inherited;
  if not assigned(MerchandiseGroup) then
    MerchandiseGroup := TMerchandiseGroup.Create;

  data := MerchandiseGroup.GetDataMerchandiseGroup();
  with strgGrid do
  begin
    Clear;
    ColCount := 4;
    RowCount := data.RecordCount+1;

    Cells[_kolNo, 0]      := 'NO';
    Cells[_kolMerCd, 0]   := 'CODE';
    Cells[_kolMerNm, 0]   := 'NAME';
    Cells[_kolMerPjk, 0]  := 'PAJAK';

    i:=1;
    if RowCount>1 then
    begin
      with data do
      begin
        while not Eof do
        begin
          Cells[_kolNo, i]      := IntToStr(i);
          Cells[_kolMerCd, i]   := FieldByName('MERCHAN_CODE').AsString;
          Cells[_kolMerNm, i]   := FieldByName('MERCHAN_NAME').AsString;
          Cells[_kolMerPjk, i]  := FieldByName('PJK_NAME').AsString;
          Cells[_kolMerId, i]   := IntToStr(FieldByName('MERCHAN_ID').AsInteger);
          i:=i+1;
          Application.ProcessMessages;
          Next;
        end
      end
    end
    else
    begin
      RowCount:=2;
      Cells[_kolNo, 1]      := ' ';
      Cells[_kolMerCd, 1]   := ' ';
      Cells[_kolMerNm, 1]   := ' ';
      Cells[_kolMerPjk, 1]  := ' ';
      Cells[_kolMerId, 1]   := '0';
    end;
    FixedRows := 1;
    AutoSize := true;
  end;
  strgGrid.SetFocus;
end;

procedure TfrmMerchandiseGroup.FormDestroy(Sender: TObject);
begin
  inherited;
  frmMerchandiseGroup := nil;
end;

procedure TfrmMerchandiseGroup.FormShow(Sender: TObject);
begin
  inherited;
  lblHeader.Caption:='MERCHANDISE';
  actRefreshMerchanGroupExecute(Self);
end;

procedure TfrmMerchandiseGroup.FormActivate(Sender: TObject);
begin
  inherited;
  //frmMain.CreateMenu((sender as TForm));
end;

procedure TfrmMerchandiseGroup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //frmMain.DestroyMenu((sender as TForm));
end;

procedure TfrmMerchandiseGroup.FormCreate(Sender: TObject);
begin
  inherited;
  FNewMerchandize := TNewMerchadize.Create(Self);

  {if FNewMerchandize.LoadByID(StrToInt(strgGrid.Cells[2,strgGrid.Row]),MasterNewUnit.ID) then
  begin
    if FNewMerchandize.RemoveFromDB then
    begin
      cCommitTrans;
      CommonDlg.ShowMessage('Data Berhail DiHapus');
      exit;
    end
    else
    begin
    cRollbackTrans;
      CommonDlg.ShowMessage('Data Gagal Dihapus');

    end;
  end   }
end;

procedure TfrmMerchandiseGroup.fraFooter5Button1btnCloseClick(
  Sender: TObject);
begin
  inherited;
  fraFooter5Button1.btnCloseClick(Sender);

end;

end.
