unit ufrmDialogCustomerVoucher;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, StdCtrls,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button;

type
  TFormMode = (fmAdd, fmEdit);
  TfrmDialogCostumerVoucher = class(TfrmMasterDialog)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edtName: TEdit;
    edtContact: TEdit;
    edtAddress: TEdit;
    edtPhone: TEdit;
    Label1: TLabel;
    edtCode: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtNameKeyPress(Sender: TObject; var Key: Char);
    procedure edtContactKeyPress(Sender: TObject; var Key: Char);
    procedure edtPhoneKeyPress(Sender: TObject; var Key: Char);
    procedure edtAddressKeyPress(Sender: TObject; var Key: Char);
  private
    FFormMode: TFormMode;
    FIsProcessSuccessfull: boolean;
    FDataCustomerId: Integer;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure SetDataCustomerId(const Value: Integer);
    procedure showDataEdit(aId: Integer);
    procedure prepareAddData;
    function  SaveData: boolean;
    function  UpdateData: boolean;
  public
    function cekkode(aKode :string; aUntId : integer): Boolean;
    { Public declarations }
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
    property DataCustomerId: Integer read FDataCustomerId write SetDataCustomerId;
  end;

var
  frmDialogCostumerVoucher: TfrmDialogCostumerVoucher;

implementation

uses
  uTSCommonDlg;

{$R *.dfm}

function TfrmDialogCostumerVoucher.cekkode(aKode :string; aUntId : integer):
    Boolean;
    var
      ssql : string;
begin
  Result := False;
    ssql:=  ' select * from Customer_Voucher where '
          + ' upper(CUSTV_CODE) = upper(' + QuotedStr(aKode) + ')'
          + ' And CUSTV_UNT_ID = ' + IntToStr(aUntId);
//    with cOpenQuery(ssql) do
//    begin
//        if not Eof then
//          Result := True;
//    end;
end;

procedure TfrmDialogCostumerVoucher.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogCostumerVoucher.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogCostumerVoucher.SetDataCustomerId(const Value: Integer);
begin
  FDataCustomerId:=Value;
end;

procedure TfrmDialogCostumerVoucher.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogCostumerVoucher.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogCostumerVoucher := nil;
end;

procedure TfrmDialogCostumerVoucher.showDataEdit(aId: Integer);
begin
//  with TCustomerVoucher.Create(self) do
//  try
//    if not LoadByID(aId,DialogUnit) then
//    begin
//      CommonDlg.ShowError('Data tdk ditemukan...');
//      Exit;
//    end;
//    edtCode.Text:= CODE;
//    edtName.Text:= NAME;
//    edtAddress.Text:= ADDRESS;
//    edtPhone.Text:= TELP;
//    edtContact.Text:=CONTACT_PERSON;
//  finally
//    Free;
//  end;
end;

procedure TfrmDialogCostumerVoucher.prepareAddData;
begin
  edtCode.Clear;
  edtName.Clear;
  edtContact.Clear;
  edtAddress.Clear;
  edtPhone.Clear;
end;

procedure TfrmDialogCostumerVoucher.FormShow(Sender: TObject);
begin
  inherited;
  if (FFormMode = fmEdit) then
    showDataEdit(FDataCustomerId)
  else
    prepareAddData();
  edtCode.SetFocus;
end;

function TfrmDialogCostumerVoucher.SaveData: boolean;
begin
//  with TCustomerVoucher.CreateWithUser(self,FLoginId) do
//  try
//    UpdateData(edtAddress.Text,edtCode.Text,edtContact.Text,0,0,edtName.Text,
//       DialogUnit,edtPhone.Text);
//    if SaveToDB then
//    begin
//      cCommitTrans;
//      CommonDlg.ShowConfirmGlobal('Simpan sukses...');
//      Result:=True;
//    end
//    else
//    begin
//      cRollbackTrans;
//      CommonDlg.ShowError('Error Simpan...');
//      Result:=False;
//    end;
//  finally
//    Free;
//  end;

end;

function TfrmDialogCostumerVoucher.UpdateData: boolean;
begin
//  with TCustomerVoucher.CreateWithUser(self,FLoginId) do
//  try
//    if not LoadByID(DataCustomerId,DialogUnit) then
//    begin
//      CommonDlg.ShowError('Data tdk ditemukan...');
//      Result:=False;
//      Exit;
//    end;
//
//    UpdateData(edtAddress.Text,edtCode.Text,edtContact.Text,0,DataCustomerId,edtName.Text,
//       DialogUnit,edtPhone.Text);
//
//    if SaveToDB then
//    begin
//      cCommitTrans;
//      CommonDlg.ShowConfirmGlobal('Simpan sukses...');
//      Result:=True;
//    end
//    else
//    begin
//      cRollbackTrans;
//      CommonDlg.ShowError('Error Simpan...');
//      Result:=False;
//    end;
//  finally
//    Free;
//  end;

end;

procedure TfrmDialogCostumerVoucher.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;
  if edtCode.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('Code Voucher');
    edtCode.SetFocus;
    Exit;
  end;
  if cekkode(edtCode.Text,DialogUnit) then
  begin
    CommonDlg.ShowError('Code Voucher Sudah di pakai ');
    edtCode.SetFocus;
    Exit;
  end;
  if edtName.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('Customer Name' );
    edtName.SetFocus;
    Exit;
  end;
  if (FormMode = fmAdd) then
  begin
    FIsProcessSuccessfull := SaveData;
    if FIsProcessSuccessfull then
      Close;
  end
  else
  begin
    FIsProcessSuccessfull := UpdateData;
    if FIsProcessSuccessfull then
      Close;
  end; // end if
end;

procedure TfrmDialogCostumerVoucher.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (ssCtrl in Shift) then
  footerDialogMasterbtnSaveClick(Sender);
end;

procedure TfrmDialogCostumerVoucher.edtCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
  if Key = Chr(VK_Return) then
  edtName.SetFocus;
end;

procedure TfrmDialogCostumerVoucher.edtNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = Chr(VK_Return) then
  edtContact.SetFocus;
end;

procedure TfrmDialogCostumerVoucher.edtContactKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = Chr(VK_Return) then
  edtPhone.SetFocus;
end;

procedure TfrmDialogCostumerVoucher.edtPhoneKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = Chr(VK_Return) then
  edtAddress.SetFocus;
end;

procedure TfrmDialogCostumerVoucher.edtAddressKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = Chr(VK_Return) then
  footerDialogMaster.btnSave.SetFocus;
end;

end.
