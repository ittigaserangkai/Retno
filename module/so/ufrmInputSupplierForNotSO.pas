unit ufrmInputSupplierForNotSO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter5Button, Grids,
  BaseGrid, AdvGrid, ActnList, uRMSUnit, uRMSBaseClass;

type
  TfrmInputSupplierForNotSO = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    pnlKeterangan: TPanel;
    actlstInputSupplierForNotSO: TActionList;
    actAddSupplierForNotSO: TAction;
    actEditSupplierForNotSO: TAction;
    actDeleteSupplierForNotSO: TAction;
    actRefreshSupplierForNotSO: TAction;
    strgGrid: TAdvStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actAddSupplierForNotSOExecute(Sender: TObject);
    procedure actEditSupplierForNotSOExecute(Sender: TObject);
    procedure actDeleteSupplierForNotSOExecute(Sender: TObject);
    procedure actRefreshSupplierForNotSOExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure fraFooter5Button1btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInputSupplierForNotSO: TfrmInputSupplierForNotSO;

implementation

uses ufrmDialogInputSupplierForNotSO, uGTSUICommonDlg, uInputSupplierForNotSO,
  uConn, DB, ufrmMain;

{$R *.dfm}

procedure TfrmInputSupplierForNotSO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //////frmMain.DestroyMenu((Sender as TForm));
  Action := caFree;
end;

procedure TfrmInputSupplierForNotSO.FormDestroy(Sender: TObject);
begin
  inherited;
  frmInputSupplierForNotSO := nil;
end;

procedure TfrmInputSupplierForNotSO.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'INPUT SUPPLIER NOT FOR SO';
  actRefreshSupplierForNotSOExecute(Self);  
end;

procedure TfrmInputSupplierForNotSO.actAddSupplierForNotSOExecute(
  Sender: TObject);
begin
  if not Assigned(frmDialogInputSupplierForNotSO) then
    Application.CreateForm(TfrmDialogInputSupplierForNotSO, frmDialogInputSupplierForNotSO);
  frmDialogInputSupplierForNotSO.frmSuiMasterDialog.Caption := 'Add Supplier For Not SO';
  frmDialogInputSupplierForNotSO.FormMode:=fmAdd;

  SetFormPropertyAndShowDialog(frmDialogInputSupplierForNotSO);
  if (frmDialogInputSupplierForNotSO.IsProcessSuccessfull) then
  begin
    actRefreshSupplierForNotSOExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atAdd);
  end;
    
  frmDialogInputSupplierForNotSO.Free;
end;

procedure TfrmInputSupplierForNotSO.actEditSupplierForNotSOExecute(
  Sender: TObject);
begin
  if strgGrid.Cells[2,strgGrid.Row]='0' then Exit;
  if not Assigned(frmDialogInputSupplierForNotSO) then
    Application.CreateForm(TfrmDialogInputSupplierForNotSO, frmDialogInputSupplierForNotSO);
  frmDialogInputSupplierForNotSO.frmSuiMasterDialog.Caption := 'Edit Supplier For Not SO';
  frmDialogInputSupplierForNotSO.FormMode:=fmEdit;
  frmDialogInputSupplierForNotSO.SuplierBlacklistId:=StrToInt(strgGrid.Cells[2,strgGrid.row]);

  SetFormPropertyAndShowDialog(frmDialogInputSupplierForNotSO);
  if (frmDialogInputSupplierForNotSO.IsProcessSuccessfull) then
  begin
    actRefreshSupplierForNotSOExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atEdit);
  end;

  frmDialogInputSupplierForNotSO.Free;
end;

procedure TfrmInputSupplierForNotSO.actDeleteSupplierForNotSOExecute(
  Sender: TObject);
var
  sSQL: string;
  IDLokal: Integer;
begin
  if strgGrid.Cells[2,strgGrid.Row]='0' then Exit;
  if (CommonDlg.Confirm('Are you sure you wish to delete supplier (Supplier Code: '+strgGrid.Cells[0,strgGrid.row]+')?') = mrYes) then
  begin
  {  if not assigned(SuplierBlackList) then
      SuplierBlackList := TSuplierBlackList.Create;

    if SuplierBlackList.DeleteDataSuplierBlackList(StrToInt(strgGrid.Cells[2,strgGrid.Row]))then
    begin
      actRefreshSupplierForNotSOExecute(Self);
      CommonDlg.ShowConfirmSuccessfull(atDelete);
    end;  }
   IDLokal := StrToInt(strgGrid.Cells[2,strgGrid.Row]);

    sSQL := 'delete from SO_SUPLIER_BLACKLIST where '
            + ' SOSB_ID = ' + IntToStr(IDLokal)
            + ' and SOSB_UNT_ID = ' + IntToStr(masternewunit.id);


    if not cExecSQL(sSQL,False,SuplierBlackList.GetHeaderFlag) then
    begin
      cRollbackTrans;
      CommonDlg.ShowError('Data Gagal Dihapus');
      Exit;
    end
    else if not SimpanBlob(sSQL,1) then
    begin
      cRollbackTrans;
      CommonDlg.ShowError('Data Gagal Disimpan');
      Exit;
    end
    else begin
      cCommitTrans;
      CommonDlg.ShowMessage('Data Berhasil Dihapus');
      strgGrid.Clear;
    end;

    actRefreshSupplierForNotSOExecute(Self);
  end;
end;

procedure TfrmInputSupplierForNotSO.actRefreshSupplierForNotSOExecute(
  Sender: TObject);
var data: TResultDataSet;
    i: Integer;
begin
  if not assigned(SuplierBlackList) then
    SuplierBlackList := TSuplierBlackList.Create;

  //Set Data
  data:= SuplierBlackList.Data;
  with strgGrid do
  begin
    Clear;
    ColCount := 2;
    RowCount := data.RecordCount+1;

    Cells[0, 0] := 'SUPPLIER CODE';
    Cells[1, 0] := 'SUPPLIER NAME';

    if RowCount>1 then
    with data do
    begin
      i:=1;
      while not Eof do
      begin
        Cells[0, i] := data.fieldbyname('SOSB_SUP_CODE').AsString;
        Cells[1, i] := data.fieldbyname('SUP_NAME').AsString;
        Cells[2, i] := IntToStr(data.fieldbyname('SOSB_ID').AsInteger);
        i:=i+1;
        Next;
      end;
    end
    else
    begin
      RowCount:=2;
      Cells[0, 1] := ' ';
      Cells[1, 1] := ' ';
      Cells[2, 1] := '0';
      Cells[3, 1] := '0';
    end;
    AutoSize:=True;
    FixedRows:=1;
  end;
end;

procedure TfrmInputSupplierForNotSO.FormActivate(Sender: TObject);
begin
  inherited;
  frmInputSupplierForNotSO.Caption := 'INPUT SUPPLIER NOT FOR SO';
  ////frmMain.CreateMenu((Sender as TForm));
end;

procedure TfrmInputSupplierForNotSO.fraFooter5Button1btnCloseClick(
  Sender: TObject);
begin
  inherited;
  fraFooter5Button1.btnCloseClick(Sender);

end;

end.




