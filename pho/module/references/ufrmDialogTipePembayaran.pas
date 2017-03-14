unit ufrmDialogTipePembayaran;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls,
  StdCtrls, uRetnoUnit, uModTipePembayaran, ufraFooterDialog3Button,
  System.Actions, Vcl.ActnList;

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
    procedure btnDeleteClick(Sender: TObject);
  private
    FIsProcessSuccessfull: Boolean;
    FTipePembayaranId: Integer;
    FFormMode: TFormMode;
    FModTipePembayaran: TModTipePembayaran;
    function GetModTipePembayaran: TModTipePembayaran;
//    FTipeBayar : TNewTipePembayaran;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: Boolean);
    procedure SetTipePembayaranId(const Value: Integer);
    procedure prepareAddData;
    procedure SimpanData;
    property ModTipePembayaran: TModTipePembayaran read GetModTipePembayaran write
        FModTipePembayaran;
  public
    procedure LoadData(aID: string);
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property TipePembayaranId: Integer read FTipePembayaranId write SetTipePembayaranId;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogTipePembayaran: TfrmDialogTipePembayaran;
  IDLokal : Integer;
implementation

uses uTSCommonDlg,  ufrmTipePembayaran, uDMClient, uAppUtils;

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

procedure TfrmDialogTipePembayaran.btnDeleteClick(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Yakin menghapus?') then exit;

  if ModTipePembayaran.ID <> '' then
  begin
    try
      DMClient.CrudClient.DeleteFromDB(ModTipePembayaran);
      TAppUtils.Information('Berhasil Hapus');
    except
      TAppUtils.Error('Gagal Hapus Data');
      raise
    end;
  end;
end;

procedure TfrmDialogTipePembayaran.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;

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
  SimpanData;
end;

procedure TfrmDialogTipePembayaran.FormShow(Sender: TObject);
begin
  inherited;
  if (FFormMode = fmEdit) then
  begin
//    IDLokal := StrToInt(frmTipePembayaran.strgGrid.Cells[2,frmTipePembayaran.strgGrid.Row]);
//    if FTipeBayar.LoadByID(IDLokal) then
//    begin
//      edtKodeTipePembayaran.Text := FTipeBayar.Kode;
//      edtTipePembayaran.Text := FTipeBayar.Nama;
//    end;
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
//  FTipeBayar := TNewTipePembayaran.Create(Self);
end;

function TfrmDialogTipePembayaran.GetModTipePembayaran: TModTipePembayaran;
begin
  if not assigned(FModTipePembayaran) then
    FModTipePembayaran := TModTipePembayaran.Create;
  Result := FModTipePembayaran;
end;

procedure TfrmDialogTipePembayaran.LoadData(aID: string);
begin
  FModTipePembayaran := DMClient.CrudClient.Retrieve(
    TModTipePembayaran.ClassName,aID) as TModTipePembayaran;
  edtKodeTipePembayaran.Text := ModTipePembayaran.TPBYR_CODE;
  edtTipePembayaran.Text := ModTipePembayaran.TPBYR_NAME;
 end;

procedure TfrmDialogTipePembayaran.SimpanData;
begin
  ModTipePembayaran.TPBYR_CODE := edtKodeTipePembayaran.Text;
  ModTipePembayaran.TPBYR_NAME := edtTipePembayaran.Text;

  try
    DMClient.CrudClient.SaveToDB(ModTipePembayaran);
    TAppUtils.Information('Berhasil Simpan');
  except
    TAppUtils.Error('Gagal Simpan Data');
    raise
  end;
end;

end.
