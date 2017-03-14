unit ufrmDialogSysParmCompTemp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls,
  StdCtrls, uRetnoUnit, uTSCommonDlg, System.Actions, Vcl.ActnList,
  ufraFooterDialog3Button;

type
    TFormMode = (fmAdd,fmEdit);
    TfrmDialogSysParmCompTemp = class(TfrmMasterDialog)
    lblNama       : TLabel;
    lblDefault    : TLabel;
    lblGroup      : TLabel;
    lblDescription: TLabel;
    edtNama       : TEdit;
    edtDefault    : TEdit;
    edtGroup      : TEdit;
    edtDescription: TEdit;

    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);


  private
    FisProcessSuccess: Boolean;
//    FSysParmCompTemp : TSysParameterCompanyTemplate;
    procedure SetisProcessSuccess(const Value: Boolean);
  public
    { Public declarations }
    FIDBaru : Integer;
  published
    property isProcessSuccess: Boolean read FisProcessSuccess write
        SetisProcessSuccess;
  end;

var
  frmDialogSysParmCompTemp: TfrmDialogSysParmCompTemp;

implementation

{$R *.dfm}

procedure TfrmDialogSysParmCompTemp.footerDialogMasterbtnSaveClick(Sender:
    TObject);
begin
  inherited;

  if (edtNama.Text = '') then
  begin
    CommonDlg.ShowErrorEmpty('NAME');
    edtNama.SetFocus;
    Exit;
  end;
  {
  FSysParmCompTemp.UpdateData(FIDBaru,edtNama.Text,edtDefault.Text,edtGroup.Text,edtDescription.Text);
  try
    if FSysParmCompTemp.SaveToDB then
    begin
      cCommitTrans;
      CommonDlg.ShowMessage('Proses simpan berhasil');
      FisProcessSuccess := True;
      Close;
    end else
    begin
      cRollbackTrans;
      CommonDlg.ShowMessage('Proses simpan gagal');
    end;
  finally
    cRollbackTrans;
  end;
  }
end;

procedure TfrmDialogSysParmCompTemp.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogSysParmCompTemp := nil;
end;

procedure TfrmDialogSysParmCompTemp.FormCreate(Sender: TObject);
begin
  inherited;
//  FSysParmCompTemp := TSysParameterCompanyTemplate.Create(Self);
end;

procedure TfrmDialogSysParmCompTemp.FormShow(Sender: TObject);
begin
  inherited;

  edtNama.Font.Size         := 10;
  edtDefault.Font.Size      := 10;
  edtGroup.Font.Size        := 10;
  edtDescription.Font.Size  := 10;

  if (FIDBaru <> 0) then
  begin
//    if FSysParmCompTemp.LoadByID(FIDBaru) then
//    begin
//      edtNama.Text        := FSysParmCompTemp.Name;
//      edtDefault.Text     := FSysParmCompTemp.Defaul;
//      edtGroup.Text       := FSysParmCompTemp.Group;
//      edtDescription.Text := FSysParmCompTemp.Description;
//    end;
  end;
end;

procedure TfrmDialogSysParmCompTemp.SetisProcessSuccess(const Value: Boolean);
begin
  FisProcessSuccess := Value;
end;


end.
