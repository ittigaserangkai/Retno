unit ufrmBank;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls, Grids,
  ActnList, uConn, uRetnoUnit, uTSBaseClass,  System.Actions, DB;

type
  TfrmBank = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    actlstBank: TActionList;
    actAddBank: TAction;
    actEditBank: TAction;
    actDeleteBank: TAction;
    actRefreshBank: TAction;
    pnlBodyUp: TPanel;
    Label1: TLabel;
    edtPencarian: TEdit;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actAddBankExecute(Sender: TObject);
    procedure actEditBankExecute(Sender: TObject);
    procedure actDeleteBankExecute(Sender: TObject);
    procedure actRefreshBankExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edtPencarianKeyPress(Sender: TObject; var Key: Char);
    procedure edtPencarianChange(Sender: TObject);
  private
  resPoint: TPoint;
    procedure FindDataOnGrid(aText:String);
    { Private declarations }

    function GetData(): TDataSet;

  public
//     FBank : TBank;
    { Public declarations }
  end;

var
  frmBank: TfrmBank;

implementation

uses uTSCommonDlg, ufrmDialogBank,  uConstanta;

{$R *.dfm}

procedure TfrmBank.FormDestroy(Sender: TObject);
begin
  inherited;
  frmBank := nil;
end;

procedure TfrmBank.FormShow(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'BANK';
  actRefreshBankExecute(Self);
end;

procedure TfrmBank.actAddBankExecute(Sender: TObject);
begin
  inherited;
  // check is Unit Id is specified?
//  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    ////frmMain.cbbUnit.SetFocus;
    Exit;
  end;
//  if(MasterNewUnit.ID <> 0) then
  begin
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
  end
;//  else
//    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);

  frmDialogBank.Free;
end;

procedure TfrmBank.actEditBankExecute(Sender: TObject);
begin
  inherited;
  // check is Unit Id is specified?
//  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    ////frmMain.cbbUnit.SetFocus;
    Exit;
  end;
//  if(MasterNewUnit.ID <> 0) then
  begin
//    if strgGrid.Cells[0,strgGrid.row]=' ' then Exit;

    if not Assigned(frmDialogBank) then
      Application.CreateForm(TfrmDialogBank, frmDialogBank);

    frmDialogBank.Caption := 'Edit Bank';
    frmDialogBank.FormMode := fmEdit;
//    frmDialogBank.BankId := StrToInt(strgGrid.Cells[4,strgGrid.row]);

    SetFormPropertyAndShowDialog(frmDialogBank);
    if (frmDialogBank.IsProcessSuccessfull) then
    begin
      actRefreshBankExecute(Self);
      CommonDlg.ShowConfirm(atEdit);
    end;
  end
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

function TfrmBank.GetData(): TDataSet;

begin
  // inisiate business model
//  if not assigned(Bank) then
//    Bank := TBank.Create;
//
//  Result := Bank.GetListDataBank();
end;

procedure TfrmBank.actRefreshBankExecute(Sender: TObject);
var
    dataBank: TDataSet;
    i,countData: Integer;
begin
  dataBank := GetData();
  countData := dataBank.RecordCount;
//  with strgGrid do
//  begin
//    Clear;
//    RowCount := countData+1;
//    ColCount := 4;
//
//    Cells[0, 0] := 'CODE';
//    Cells[1, 0] := 'NAME';
//    Cells[2, 0] := 'BRANCH';
//    Cells[3, 0] := 'ADDRESS';
//
//    if (RowCount > 1) then
//    begin
//      i := 1;
//      while not dataBank.Eof do
//      begin
//        Cells[0, i] := dataBank.FieldByName('BANK_CODE').AsString;
//        Cells[1, i] := dataBank.FieldByName('BANK_NAME').AsString;
//        Cells[2, i] := dataBank.FieldByName('BANK_BRANCH').AsString;
//        Cells[3, i] := dataBank.FieldByName('BANK_ADDRESS').AsString;
//        Cells[4, i] := dataBank.FieldByName('BANK_ID').AsString;
//
//        Inc(i);
//        dataBank.Next;
//      end;
//    end
//    else
//    begin
//      RowCount := 2;
//      Cells[0, 1] := ' ';
//      Cells[1, 1] := ' ';
//      Cells[2, 1] := ' ';
//      Cells[3, 1] := ' ';
//    end;
//
//    FixedRows := 1;
//    AutoSize := true;
//  end;
end;

procedure TfrmBank.FormActivate(Sender: TObject);
begin
  inherited;
//  frmMain.CreateMenu((sender as TForm));
end;

procedure TfrmBank.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
//  frmMain.DestroyMenu((sender as TForm));
end;

procedure TfrmBank.FormCreate(Sender: TObject);
begin
  inherited;
//  FBank := uNewBank.TBank.Create(Self);
end;

procedure TfrmBank.edtPencarianKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
//  if Key = Chr(VK_RETURN) then
//  begin
//    if edtPencarian.Text <> '' then
//    begin
//      resPoint := strgGrid.FindNext;
//      if (resPoint.Y <> -1) then
//      begin
//        strgGrid.ScrollInView(resPoint.X, resPoint.Y);
//        strgGrid.SelectRows(resPoint.Y, 1);
//      end;
//    end;
//  end;
end;

procedure TfrmBank.edtPencarianChange(Sender: TObject);
begin
  inherited;
  FindDataOnGrid(edtPencarian.Text);
end;

procedure TfrmBank.FindDataOnGrid(aText:String);
begin
//  if (aText <> '') then
//  begin
//    resPoint := strgGrid.Find(Point(0,0),aText,[fnIncludeFixed]);
//    if (resPoint.Y <> -1) then
//    begin
//      strgGrid.ScrollInView(resPoint.X, resPoint.Y);
//      strgGrid.SelectRows(resPoint.Y, 1);
//    end;
//  end;
end;

end.


