unit ufrmDialogTipePembayaran;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls,
  StdCtrls, uRetnoUnit, uModTipePembayaran, ufraFooterDialog3Button,
  System.Actions, Vcl.ActnList;

type
  TfrmDialogTipePembayaran = class(TfrmMasterDialog)
    lbl1: TLabel;
    lbl2: TLabel;
    edtKodeTipePembayaran: TEdit;
    edtTipePembayaran: TEdit;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
  private
    FModTipePembayaran: TModTipePembayaran;
    function GetModTipePembayaran: TModTipePembayaran;
    procedure SimpanData;
    function ValidateData: boolean;
    property ModTipePembayaran: TModTipePembayaran read GetModTipePembayaran write
        FModTipePembayaran;
  public
    procedure LoadData(aID: string);
  end;

var
  frmDialogTipePembayaran: TfrmDialogTipePembayaran;


implementation

uses uDMClient, uAppUtils, uConstanta;

{$R *.dfm}

procedure TfrmDialogTipePembayaran.actDeleteExecute(Sender: TObject);
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

procedure TfrmDialogTipePembayaran.actSaveExecute(Sender: TObject);
begin
  inherited;
  if not ValidateData then  exit;
  SimpanData;
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
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
  except
    TAppUtils.Error('Gagal Simpan Data');
    raise
  end;
end;

function TfrmDialogTipePembayaran.ValidateData: boolean;
begin
  Result := False;
  if edtKodeTipePembayaran.Text ='' then
  begin TAppUtils.Warning('Kode Tidak Boleh Kosong');
  exit;
  end;

  if edtTipePembayaran.Text ='' then
  begin TAppUtils.Warning('Nama Tidak Boleh Kosong');
  exit;
  end;

Result := True;
  // TODO -cMM: TfrmDialogTipePembayaran.ValidateData default body inserted
end;

end.
