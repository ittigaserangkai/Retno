unit ufrmDialogTipePengirimanPO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, StdCtrls;

type
  TFormMode = (fmAdd, fmEdit);
  TfrmDialogTipePengirimanPO = class(TfrmMasterDialog)
    lbl1: TLabel;
    lbl2: TLabel;
    edtKodeTipePengirimanPO: TEdit;
    edtTipePengirimanPO: TEdit;
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FIsProcessSuccessfull: Boolean;
    FTipePengirimanPOId: Integer;
    FFormMode: TFormMode;
//    FNewTipeKirimPO : TTipeKirimPO;
    IDLokal : Integer;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: Boolean);
    procedure SetTipePengirimanPOId(const Value: Integer);
  public
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property TipePengirimanPOId: Integer read FTipePengirimanPOId write SetTipePengirimanPOId;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogTipePengirimanPO: TfrmDialogTipePengirimanPO;

implementation

uses uTSCommonDlg,uRetnoUnit, ufrmTipePengirimanPO;

{$R *.dfm}

procedure TfrmDialogTipePengirimanPO.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogTipePengirimanPO.SetIsProcessSuccessfull(
  const Value: Boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogTipePengirimanPO.SetTipePengirimanPOId(
  const Value: Integer);
begin
  FTipePengirimanPOId := Value;
end;

procedure TfrmDialogTipePengirimanPO.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;

  {
  FNewTipeKirimPO.UpdateData(IDLokal,
                              edtKodeTipePengirimanPO.Text,
                              edtTipePengirimanPO.Text
                              );
  try
    if FNewTipeKirimPO.ExecuteGenerateSQL then
    begin
      cCommitTrans;
      CommonDlg.ShowMessage('Data Berhasil Disimpan');
      frmTipePengirimanPO.actRefreshTipePengirimanPOExecute(Self);
      Close;
    end
    else begin
      cRollbackTrans;
      CommonDlg.ShowError('Data gagal Disimpan');
    end;
  finally
    cRollbackTrans;
  end;
  }
end;

procedure TfrmDialogTipePengirimanPO.FormShow(Sender: TObject);
begin
  inherited;
  if (FFormMode = fmEdit) then
  begin
    IDLokal := TipePengirimanPOId;
//    if FNewTipeKirimPO.LoadByID(IDLokal) then
//    begin
//      edtKodeTipePengirimanPO.Text := FNewTipeKirimPO.Kode;
//      edtTipePengirimanPO.Text := FNewTipeKirimPO.Name;
//    end
//    else
    begin
      IDLokal := 0;
      edtKodeTipePengirimanPO.Text := '';
      edtTipePengirimanPO.Text := '';
    end;
  end;
end;

procedure TfrmDialogTipePengirimanPO.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogTipePengirimanPO := nil;
end;

procedure TfrmDialogTipePengirimanPO.FormCreate(Sender: TObject);
begin
  inherited;
//  FNewTipeKirimPO := TTipeKirimPO.Create(Self);
end;

end.
