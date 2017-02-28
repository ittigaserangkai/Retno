unit ufrmDialogTipePerusahaan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls,
  StdCtrls, uRetnoUnit;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogTipePerusahaan = class(TfrmMasterDialog)
    lbl1: TLabel;
    edtCode: TEdit;
    Lbl2: TLabel;
    edtName: TEdit;
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FIsProcessSuccessfull: boolean;
    FTipePerusahaanId: Integer;
    FFormMode: TFormMode;
//    FPerusahaan : TnewTipePerusahaan;
    IDLokal : Integer;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: Boolean);
    procedure SetTipePerusahaanId(const Value: Integer);
    procedure prepareAddData;
  public
    { Public declarations }
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property TipePerusahaanId: Integer read FTipePerusahaanId write SetTipePerusahaanId;
    property IsProcessSuccessfull: Boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogTipePerusahaan: TfrmDialogTipePerusahaan;

implementation

uses  uTSCommonDlg, uConn,  ufrmTipePerusahaan;

{$R *.dfm}

procedure TfrmDialogTipePerusahaan.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogTipePerusahaan := nil;
end;

procedure TfrmDialogTipePerusahaan.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogTipePerusahaan.SetIsProcessSuccessfull(const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogTipePerusahaan.SetTipePerusahaanId(const Value: Integer);
begin
  FTipePerusahaanId := Value;
end;

procedure TfrmDialogTipePerusahaan.footerDialogMasterbtnSaveClick(Sender: TObject);
begin
  if (FormMode = fmAdd) then
  begin
  IDLokal := 0;
 //   FIsProcessSuccessfull := SaveTipePerusahaan;
  //  if FIsProcessSuccessfull then
   //  Close;

  end else
  begin
//    IDLokal := StrToInt(frmTipePerusahaan.strgGrid.Cells[2,frmTipePerusahaan.strgGrid.row]);
 // end;
 //    FIsProcessSuccessfull := UpdateTipePerusahaan;
  //   if FIsProcessSuccessfull then
  //   Close;
  end;

    if edtCode.Text = '' then
    begin
      CommonDlg.ShowError('Data Kode Belum diisi');
      edtCode.SetFocus;
      Exit;
    end;

    if edtName.Text = '' then
    begin
      CommonDlg.ShowError('Data Nama Belum didisi');
      edtName.Text;
      Exit;
    end;
    {
    FPerusahaan.UpdateData(IDLokal,edtCode.Text,edtName.Text,DialogUnit);
    try
      if FPerusahaan.ExecuteGenerateSQL then
      begin
        cCommitTrans;
        CommonDlg.ShowMessage('Berhasil Menyimpan Data');
        frmTipePerusahaan.actRefreshTipePerusahaanExecute(Self);
        Close;
      end else
      begin
        cRollbackTrans;
        CommonDlg.ShowError('Gagal Menyimpan Data');
        Exit;
      end;
     finally
       cRollbackTrans;
     end;
     }
end;

procedure TfrmDialogTipePerusahaan.prepareAddData;
begin
  edtCode.Clear;
  edtName.Clear;
end;

procedure TfrmDialogTipePerusahaan.FormShow(Sender: TObject);
begin
  inherited;
  if (FFormMode = fmEdit) then
  begin
    {
    IDLokal := StrToInt(frmTipePerusahaan.strgGrid.Cells[2,frmTipePerusahaan.strgGrid.row]);
    if FPerusahaan.LoadByID(IDLokal,DialogUnit) then
    begin
      edtCode.Text := FPerusahaan.Kode;
      edtName.Text := FPerusahaan.Nama;
    end;}
    // showDataEdit(TipePerusahaanId)
  end else
    prepareAddData();
end;

procedure TfrmDialogTipePerusahaan.FormCreate(Sender: TObject);
begin
  inherited;
//  FPerusahaan := TnewTipePerusahaan.Create(Self);
end;

end.
