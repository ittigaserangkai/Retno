unit ufrmDialogTipePembayaran;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, SUIForm,
  StdCtrls, uNewTipePembayaran, uRetnoUnit, uRMSBaseClass;

type
  TFormMode = (fmAdd, fmEdit);
  TfrmDialogTipePembayaran = class(TfrmMasterDialog)
    lbl1: TLabel;
    lbl2: TLabel;
    edtKodeTipePembayaran: TEdit;
    edtTipePembayaran: TEdit;
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FIsProcessSuccessfull: Boolean;
    FTipePembayaranId: Integer;
    FFormMode: TFormMode;
    FTipeBayar : TNewTipePembayaran;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: Boolean);
    procedure SetTipePembayaranId(const Value: Integer);
    procedure prepareAddData;
  public
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property TipePembayaranId: Integer read FTipePembayaranId write SetTipePembayaranId;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogTipePembayaran: TfrmDialogTipePembayaran;
  IDLokal : Integer;
implementation

uses uTSCommonDlg,  ufrmTipePembayaran;

{$R *.dfm}

{ TfrmDialogPembayaran }



{ TfrmDialogPembayaran }

procedure TfrmDialogTipePembayaran.prepareAddData;
begin
  edtKodeTipePembayaran.Clear;
  edtTipePembayaran.Clear;
end;

procedure TfrmDialogTipePembayaran.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogTipePembayaran.SetIsProcessSuccessfull(
  const Value: Boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogTipePembayaran.SetTipePembayaranId(
  const Value: Integer);
begin
  FTipePembayaranId := Value;
end;

procedure TfrmDialogTipePembayaran.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;
  if (FormMode = fmAdd) then
  begin
   // FIsProcessSuccessfull := SaveTipePembayaran;
   // if FIsProcessSuccessfull then
   //   Close;
   IDLokal := 0;
  end else
  begin
    IDLokal := StrToInt(frmTipePembayaran.strgGrid.Cells[2,frmTipePembayaran.strgGrid.Row])
    //FIsProcessSuccessfull := UpdateTipePembayaran;
    //if FIsProcessSuccessfull then
    //  Close;
  end; // end if

  if edtKodeTipePembayaran.Text = '' then
  begin
    CommonDlg.ShowError('Kode Belum diisi');
    edtKodeTipePembayaran.SetFocus;
    Exit;
  end;

  if edtTipePembayaran.Text = '' then
  begin
    CommonDlg.ShowError('Tipe Pembayaran Belum diisi');
    edtTipePembayaran.SetFocus;
    Exit;
  end;

  FTipeBayar.UpdateData(IDLokal,
                        edtKodeTipePembayaran.Text,
                        edtTipePembayaran.Text
                        );
                        
  try
    if FTipeBayar.ExecuteGenerateSQL then
    begin
      cCommitTrans;
      CommonDlg.ShowMessage('Data Berhasil Disimpan');
      frmTipePembayaran.actRefreshTipePembayaranExecute(Self);;
      Close;
    end else
    begin
      cRollbackTrans;
      CommonDlg.ShowMessage('Data Gagal Disimpan');
      Exit;
    end;
  finally
    cRollbackTrans;
  end;
end;

procedure TfrmDialogTipePembayaran.FormShow(Sender: TObject);
begin
  inherited;
  if (FFormMode = fmEdit) then
  begin
    IDLokal := StrToInt(frmTipePembayaran.strgGrid.Cells[2,frmTipePembayaran.strgGrid.Row]);
    if FTipeBayar.LoadByID(IDLokal) then
    begin
      edtKodeTipePembayaran.Text := FTipeBayar.Kode;
      edtTipePembayaran.Text := FTipeBayar.Nama;
    end;
  end else
  begin
    prepareAddData();
  end;
end;

procedure TfrmDialogTipePembayaran.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogTipePembayaran := nil;
end;

procedure TfrmDialogTipePembayaran.FormCreate(Sender: TObject);
begin
  inherited;
  FTipeBayar := TNewTipePembayaran.Create(Self);
end;

end.
