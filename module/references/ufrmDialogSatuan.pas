unit ufrmDialogSatuan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls,
  StdCtrls, uRetnoUnit, ufraFooterDialog3Button, uModSatuan,
  uDMClient, uAppUtils, System.Actions, Vcl.ActnList, uDXUtils;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogSatuan = class(TfrmMasterDialog)
    lbl1: TLabel;
    edtCode: TEdit;
    Lbl2: TLabel;
    edtName: TEdit;
    lbl3: TLabel;
    cbbGroup: TComboBox;
    procedure actSaveExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    FIsProcessSuccessfull: boolean;
    FFormMode: TFormMode;
    FSatuan: TModSatuan;
//    FNewUOM : TNewUOM;
//    FUOMLama : String;
    function GetSatuan: TModSatuan;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: Boolean);
  protected
    FID: string;
  public
    procedure LoadData(AID : String);
    property Satuan: TModSatuan read GetSatuan write FSatuan;
    { Public declarations }
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property IsProcessSuccessfull: Boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogSatuan: TfrmDialogSatuan;

implementation

uses uTSCommonDlg, uConn, DB;

{$R *.dfm}

procedure TfrmDialogSatuan.actSaveExecute(Sender: TObject);
begin
  inherited;
  FIsProcessSuccessfull := False;

  if edtCode.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('CODE');
    edtCode.SetFocus;
    Exit;
  end;
  if edtName.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('NAME');
    edtName.SetFocus;
    Exit;
  end;

  Satuan.SAT_CODE := edtCode.Text;
  Satuan.SAT_GROUP := cbbGroup.Text;
  Satuan.SAT_NAME := edtName.Text;

  try
    FIsProcessSuccessfull := DMClient.CrudClient.SaveToDB(Satuan);
    TAppUtils.Information('Berhasil Simpan Data');
  except
    on E : Exception do
      TAppUtils.Error(E.Message);
  end;
end;

procedure TfrmDialogSatuan.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogSatuan.SetIsProcessSuccessfull(const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogSatuan.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogSatuan := nil;
end;

procedure TfrmDialogSatuan.btnDeleteClick(Sender: TObject);
begin
  inherited;
  FIsProcessSuccessfull := False;

  if not TAppUtils.Confirm('Anda Yakin Akan Menghapus Data ?') then
    Exit;

  try
    FIsProcessSuccessfull := DMClient.CrudClient.DeleteFromDB(Satuan);
    TAppUtils.Information('Berhasil Hapus Data');
  except
    on E : Exception do
      TAppUtils.Error(E.Message);
  end;
end;

procedure TfrmDialogSatuan.FormCreate(Sender: TObject);
begin
  inherited;
  FID := '';
  Self.AssignKeyDownEvent;
end;

function TfrmDialogSatuan.GetSatuan: TModSatuan;
begin
  if not Assigned(FSatuan) then
    FSatuan := TModSatuan.Create;

  Result := FSatuan;
end;

procedure TfrmDialogSatuan.LoadData(AID : String);
begin
  FreeAndNil(FSatuan);
  FID := '';

  if AID = '' then
  begin
    edtCode.Text := '';
    edtName.Text := '';
    cbbGroup.ItemIndex := 0;
  end else begin
    FID := AID;

    FSatuan := DMClient.CrudClient.Retrieve(TModSatuan.ClassName,FID) as TModSatuan;

    edtCode.Text := FSatuan.SAT_CODE;
    edtName.Text := FSatuan.SAT_NAME;
    cbbGroup.ItemIndex := cbbGroup.Items.IndexOf(FSatuan.SAT_GROUP);
  end;
end;

end.
