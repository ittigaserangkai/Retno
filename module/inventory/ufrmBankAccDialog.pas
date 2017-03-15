unit ufrmBankAccDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, SUIForm,
  StdCtrls, uNewBankAccount, System.Actions, Vcl.ActnList,
  ufraFooterDialog3Button;

type
  TfrmBankAccDialog = class(TfrmMasterDialog)
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
  private
    { Private declarations }
    FAuthId   : string;
    FAccId    : string;
    FBankAcc  : TBankAccount;
    procedure SetDataAuth;
    procedure ClearData;
  public
    { Public declarations }
    procedure ShowWithAuthId(aAuthorId: string = '', aAccId: string = '');
  end;

var
  frmBankAccDialog: TfrmBankAccDialog;

implementation

{$R *.dfm}
uses ufrmMain;

procedure TfrmBankAccDialog.SetDataAuth;
begin
  if FAccId <> '' then
  begin
    if FBankAcc.LoadByID(FAccId) then
    begin
      edtNm.Text            := FBankAcc.Bank.Nama;
      edtAlamat.Text        := FBankAcc.Bank.Alamat;
      edtCab.Text           := FBankAcc.Bank.Cabang;
      edtKode.Text          := FBankAcc.Bank.Kode;
      edtNoRek.Text         := FBankAcc.NoRek;
      chkIsActive.Checked   := FBankAcc.isActive;
    end;
  end
  else
  begin
      ClearData;
  end;
end;

procedure TfrmBankAccDialog.ClearData;
begin
  edtNm.Text            := '';
  edtAlamat.Text        := '';
  edtCab.Text           := '';
  edtKode.Text          := '';
  edtNoRek.Text         := '';
  chkIsActive.Checked   := False;
end;

procedure TfrmBankAccDialog.ShowWithAuthId(aAuthorId: string = '', aAccId: string = '');
begin
  FAuthId := aAuthorIdId;
  FAccId := aAccId;
  Self.ShowModal;
end;

procedure TfrmBankAccDialog.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;

  try
    with FBankAcc do
    begin
      UpdateData(edtKode, FAccId, edtNoRek.Text, FAuthId, chkIsActive.Checked );

      if not SaveToDB then
      begin
        cRollbackTrans;
        CommonDlg.ShowError('Gagal Simpan Data Lokasi Stok Opnam.');
      end
      else
      begin
        cCommitTrans;
        CommonDlg.ShowMessage('Data Lokasi Stok Opnam telah disimpan.');
        Close;
      end;

    end;
  finally
    cRollbackTrans;
  end;


end;

end.
