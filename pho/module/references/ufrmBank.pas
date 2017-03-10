unit ufrmBank;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls, Grids,
  ActnList, uConn, uRetnoUnit, uTSBaseClass,  System.Actions, DB, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, DBClient, uDMCLient, uClientClasses,
  ufrmMasterBrowse, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel;

type
  TfrmBank = class(TfrmMasterBrowse)
    actlstBank: TActionList;
    actAddBank: TAction;
    actEditBank: TAction;
    actDeleteBank: TAction;
    actRefreshBank: TAction;
    procedure actAddBankExecute(Sender: TObject);
    procedure actEditBankExecute(Sender: TObject);
    procedure actDeleteBankExecute(Sender: TObject);
    procedure actRefreshBankExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCDS: TClientDataSet;
  resPoint: TPoint;
    property CDS: TClientDataSet read FCDS write FCDS;
  public
    procedure RefreshData; override;
//     FBank : TBank;
    { Public declarations }
  end;

var
  frmBank: TfrmBank;

implementation

uses
  uTSCommonDlg, ufrmDialogBank,  uConstanta, uDXUtils, uDBUtils;

{$R *.dfm}

procedure TfrmBank.actAddBankExecute(Sender: TObject);
begin
  inherited;
  // check is Unit Id is specified?
//  if MasterNewUnit.ID=0 then
//  begin
//    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
//    frmMain.cbbUnit.SetFocus;
//    Exit;
//  end;
//  if(MasterNewUnit.ID <> 0) then
//  begin
    if not Assigned(frmDialogBank) then
      Application.CreateForm(TfrmDialogBank, frmDialogBank);

    frmDialogBank.Caption := 'Add Bank';
    frmDialogBank.FormMode := fmAdd;

    SetFormPropertyAndShowDialog(frmDialogBank);
    if (frmDialogBank.IsProcessSuccessfull) then
    begin
      actRefreshBankExecute(Self);
      CommonDlg.ShowConfirm(atAdd);
    end;
//  end
;//  else
//    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);

  frmDialogBank.Free;
end;

procedure TfrmBank.actEditBankExecute(Sender: TObject);
begin
  inherited;
  // check is Unit Id is specified?
//  if MasterNewUnit.ID=0 then
//  begin
//    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
//    ////frmMain.cbbUnit.SetFocus;
//    Exit;
//  end;
//  if(MasterNewUnit.ID <> 0) then
//  begin
//    if strgGrid.Cells[0,strgGrid.row]=' ' then Exit;
    if CDS.Eof then exit;

    if not Assigned(frmDialogBank) then
      Application.CreateForm(TfrmDialogBank, frmDialogBank);

    frmDialogBank.Caption := 'Edit Bank';
    frmDialogBank.FormMode := fmEdit;
    frmDialogBank.LoadData(CDS.FieldByName('Bank_ID').AsString);

    SetFormPropertyAndShowDialog(frmDialogBank);
    if (frmDialogBank.IsProcessSuccessfull) then
    begin
      actRefreshBankExecute(Self);
      CommonDlg.ShowConfirm(atEdit);
    end;
//  end
;//  else
//    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);

  frmDialogBank.Free;
end;

procedure TfrmBank.actDeleteBankExecute(Sender: TObject);
begin
  inherited;
//  if strgGrid.Cells[0,strgGrid.row]=' ' then Exit;
  // check is Unit Id is specified?
//  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    ////frmMain.cbbUnit.SetFocus;
    Exit;
  end;
//  if (CommonDlg.Confirm('Are you sure you wish to delete Bank (Name: '+strgGrid.Cells[1,strgGrid.row]+ ' : ' +strgGrid.Cells[2,strgGrid.row]+') ?') = mrYes) then
  begin
    // todo: put your code to delete data here..
    // code goes here..
    {if not assigned(Bank) then
      Bank := TBank.Create;

    if Bank.DeleteDataBank(StrToInt(strgGrid.Cells[4,strgGrid.row]),MasterNewUnit.ID) then
    begin
      actRefreshBankExecute(Self);
      CommonDlg.ShowConfirm(atDelete);
    end;}
//    IDLokal := StrToInt(strgGrid.Cells[4,strgGrid.Row]);
{    if FBank.LoadByID(IDLokal) then
    begin
      try
        if FBank.RemoveFromDB then
        begin
          cCommitTrans;
          actRefreshBankExecute(nil);
          CommonDlg.ShowMessage('Data Berhasil Dihapus');
          Exit;
        end else
        begin
          cRollbackTrans;
          CommonDlg.ShowError('Data Gagal Dihapus');
          Exit;
        end;
      finally
        cRollbackTrans;
      end;
    end; }
  end;
end;

procedure TfrmBank.actRefreshBankExecute(Sender: TObject);

begin
  RefreshData;
end;

procedure TfrmBank.FormActivate(Sender: TObject);
begin
  inherited;
//  frmMain.CreateMenu((sender as TForm));
end;

procedure TfrmBank.FormCreate(Sender: TObject);
begin
  inherited;
//  FBank := uNewBank.TBank.Create(Self);
end;

procedure TfrmBank.RefreshData;
begin
  if Assigned(FCDS) then FreeAndNil(FCDS);
  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.Bank_GetDSOverview ,Self );
  cxGridView.LoadFromCDS(CDS);
  cxGridView.SetVisibleColumns(['Bank_ID'],False);
end;

end.


