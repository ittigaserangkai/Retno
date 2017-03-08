unit ufrmDialogSatuan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls,
  StdCtrls, uRetnoUnit, ufraFooterDialog3Button, uModSatuan, uDMClient;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogSatuan = class(TfrmMasterDialog)
    lbl1: TLabel;
    edtCode: TEdit;
    Lbl2: TLabel;
    edtName: TEdit;
    lbl3: TLabel;
    cbbGroup: TComboBox;
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FIsProcessSuccessfull: boolean;
    FFormMode: TFormMode;
    FSatuan: TModSatuan;
//    FNewUOM : TNewUOM;
    FUOMLama : String;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: Boolean);
    procedure SetSatuan(const Value: TModSatuan);
  protected
    FID: string;
  public
    procedure LoadData(AID : String);
    property Satuan: TModSatuan read FSatuan write SetSatuan;
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

procedure TfrmDialogSatuan.footerDialogMasterbtnSaveClick(Sender: TObject);
begin
  inherited;
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

  {
  TUom := TNewUOM.Create(Self);
  try

    if (FUOMLama <> edtCode.Text) then
    begin
      if TUom.LoadByUOM(edtCode.Text) then
      begin
        CommonDlg.ShowErrorExist('CODE',edtCode.Text);
        edtCode.SetFocus;
        Exit;
      end;
    end;
  finally
    FreeAndNil(TUom);
  end;

  FNewUOM.UpdateData(
    cbbGroup.Text,
    edtName.Text,
    edtCode.Text,
    StrToInt(cbbUrutan.Text));

  try
    if FNewUOM.ExecuteGenerateSQL(FUOMLama) then
    begin
      cCommitTrans;
      CommonDlg.ShowMessage('Berhasil Menyimpan Data');
      Close;
    end
    else
    begin
      cRollbackTrans;
      CommonDlg.ShowMessage('Data Gagal disimpan');
    end;
  finally
    cRollbackTrans;
  end;
   }
//  frmSatuan.actRefreshSatuanExecute(sender);
end;

procedure TfrmDialogSatuan.FormCreate(Sender: TObject);
begin
  inherited;
  FID := '';
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
    //DMClient.

    edtCode.Text := '';
    edtName.Text := '';
    cbbGroup.ItemIndex := 0;
  end;
end;

procedure TfrmDialogSatuan.SetSatuan(const Value: TModSatuan);
begin
  FSatuan := Value;
end;

end.
