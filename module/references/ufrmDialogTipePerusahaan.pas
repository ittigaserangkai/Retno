unit ufrmDialogTipePerusahaan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls,
  StdCtrls, uRetnoUnit, uModTipePerusahaan, ufraFooterDialog3Button,
  uDMClient, uAppUtils, System.Actions, Vcl.ActnList, uInterface;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogTipePerusahaan = class(TfrmMasterDialog, ICRUDAble)
    lbl1: TLabel;
    edtCode: TEdit;
    Lbl2: TLabel;
    edtName: TEdit;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FIsProcessSuccessfull: boolean;
    FTipePerusahaanId: Integer;
    FFormMode: TFormMode;
    FModTipePerusahaan: TModTipePerusahaan;
//    FPerusahaan : TnewTipePerusahaan;
    IDLokal : Integer;
    function GetModTipePerusahaan: TModTipePerusahaan;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: Boolean);
    procedure SetTipePerusahaanId(const Value: Integer);
    procedure prepareAddData;
    procedure SimpanData;
    property ModTipePerusahaan: TModTipePerusahaan read GetModTipePerusahaan write
        FModTipePerusahaan;
  public
    procedure LoadData(aID: string);
    { Public declarations }
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property TipePerusahaanId: Integer read FTipePerusahaanId write SetTipePerusahaanId;
    property IsProcessSuccessfull: Boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogTipePerusahaan: TfrmDialogTipePerusahaan;

implementation

uses  uTSCommonDlg, uConn, uDXUtils;

{$R *.dfm}

procedure TfrmDialogTipePerusahaan.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if ModTipePerusahaan.ID = '' then exit;
  if TAppUtils.Confirm('Anda Yakin Hapus Data?') = False then exit;

  try
    DMClient.CrudClient.DeleteFromDB(ModTipePerusahaan);
    TAppUtils.Information('Data Berhasil Dihapus');
    Self.ModalResult:=mrOk;
  except
    TAppUtils.Error('Gagal Hapus Data');
    raise

  end;
end;

procedure TfrmDialogTipePerusahaan.actSaveExecute(Sender: TObject);
begin
  inherited;
  SimpanData;
end;

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
    SimpanData;
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
  self.AssignKeyDownEvent;
//  FPerusahaan := TnewTipePerusahaan.Create(Self);
end;

function TfrmDialogTipePerusahaan.GetModTipePerusahaan: TModTipePerusahaan;
begin
  if not assigned(FModTipePerusahaan) then
    FModTipePerusahaan := TModTipePerusahaan.Create;
  Result := FModTipePerusahaan;
end;

procedure TfrmDialogTipePerusahaan.LoadData(aID: string);
begin
  ModTipePerusahaan := DmClient.CrudClient.Retrieve(TModTipePerusahaan.ClassName, aID) as TModTipePerusahaan;
  edtCode.Text := ModTipePerusahaan.TPPERSH_CODE;
  edtName.Text := ModTipePerusahaan.TPPERSH_NAME;
end;

procedure TfrmDialogTipePerusahaan.SimpanData;
begin
  if not ValidateEmptyCtrl  then   exit;

  ModTipePerusahaan.TPPERSH_CODE := edtCode.Text;
  ModTipePerusahaan.TPPERSH_NAME := edtName.Text;

  try
    DMClient.CrudClient.SaveToDB(ModTipePerusahaan);
    TAppUtils.Information('Data Berhasil Disimpan');
    Self.ModalResult:=mrOk;
  except
    TAppUtils.Error('Gagal Simpan Data');
    raise

  end;
end;

end.
