unit ufrmDialogMaintenancePassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls,
  StdCtrls, System.Actions, Vcl.ActnList, ufraFooterDialog3Button;

type                         
  TFormMode = (fmAdd, fmEdit);
  
  TfrmDialogMaintenancePassword = class(TfrmMasterDialog)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edtUserName: TEdit;
    edtFullname: TEdit;
    cbbLevel: TComboBox;
    edtPasswd: TEdit;
    chkStatus: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure edtUserNameKeyPress(Sender: TObject; var Key: Char);
    procedure btnDeleteClick(Sender: TObject);
  private
    FIsProcessSuccessfull: boolean;
    FFormMode: TFormMode;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    { Private declarations }
  public
    { Public declarations }
    User_ID: Integer;             
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogMaintenancePassword: TfrmDialogMaintenancePassword;

implementation

uses uTSCommonDlg;

{$R *.dfm}

procedure TfrmDialogMaintenancePassword.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogMaintenancePassword.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogMaintenancePassword := nil;
end;

procedure TfrmDialogMaintenancePassword.SetFormMode(
  const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogMaintenancePassword.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogMaintenancePassword.footerDialogMasterbtnSaveClick(
  Sender: TObject);
var intStatus: SmallInt;
    levelID: Integer;
begin
  inherited;
  IsProcessSuccessfull := False;

  if edtUserName.Text = '' then
  begin
    CommonDlg.ShowErrorEmpty('Cashier ID');
    edtUserName.SetFocus;
    Exit;
  end
  else
  begin
    if chkStatus.Checked then
      intStatus := 1
    else
      intStatus := 0;

    {levelID mengacu pada table aut$grup idgrup supervisorPos & operatorPos }

    If cbbLevel.ItemIndex = 0 then
      levelID := 10
    else
      levelID := 11;

    {
    if not Assigned(MaintenancePasswd) then MaintenancePasswd := TMaintenancePasswd.Create;

    if FormMode = fmAdd then
    begin
       IsProcessSuccessfull := MaintenancePasswd.InputDataMaintenancePasswd(edtUserName.Text, edtFullname.Text, edtPasswd.Text,
                                                                            intStatus, levelID);
    end // end fmadd
    else
    begin
       IsProcessSuccessfull := MaintenancePasswd.UpdateDataMaintenancePasswd(edtUserName.Text, edtFullname.Text, edtPasswd.Text,
                                                                             intStatus, User_ID);
    end; //end fmedit
    }
  end; //end = ''
  Close;
end;

procedure TfrmDialogMaintenancePassword.btnDeleteClick(Sender: TObject);
var delStatue: Boolean;
begin
  inherited;
  {if strgGrid.Cells[5,strgGrid.Row] = '0' then Exit;

  if (CommonDlg.Confirm('Are you sure you wish to delete Cashier (Cashier Id: '+ strgGrid.Cells[1,strgGrid.Row] +')?') = mrYes) then
  begin
    if not Assigned(MaintenancePasswd) then MaintenancePasswd := TMaintenancePasswd.Create;

    delStatue := MaintenancePasswd.DeleteDataMaintenancePasswd(StrToInt(strgGrid.Cells[6,strgGrid.Row]), masternewunit.id);
    if delStatue then
    begin
      actRefreshMaintenancePasswdExecute(Self);
      CommonDlg.ShowConfirmSuccessfull(atDelete);
    end;
  end;
  }
end;

procedure TfrmDialogMaintenancePassword.edtUserNameKeyPress(
  Sender: TObject; var Key: Char);
begin
  //if not (Key in ['0'..'9', Chr(VK_RETURN), Chr(VK_DELETE), Chr(VK_BACK)]) then
   //Key := #0;

end;

end.
