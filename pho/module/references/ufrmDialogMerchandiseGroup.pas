unit ufrmDialogMerchandiseGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, StdCtrls, ufraFooterDialog2Button, ExtCtrls,
   uNewMerchandize, uRetnoUnit ;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogMerchandiseGroup = class(TfrmMasterDialog)
    lbl1: TLabel;
    edtName: TEdit;
    Label1: TLabel;
    edtCode: TEdit;
    Label10: TLabel;
    cbbPpn: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FIsProcessSuccessfull: boolean;
    FFormMode: TFormMode;
    FnewMerchan: TNewMerchadize;
    FMerchanGroupId: integer;
    IDLokal: Integer;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure SetMerchanGroupId(const Value: integer);
    procedure prepareAddData;
  public
    procedure LoadListCbpPpn;
    { Public declarations }
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property MerchanGroupId: integer read FMerchanGroupId write SetMerchanGroupId;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogMerchandiseGroup: TfrmDialogMerchandiseGroup;

implementation

uses uTSCommonDlg, ufrmMerchandiseGroup;

{$R *.dfm}

procedure TfrmDialogMerchandiseGroup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogMerchandiseGroup.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogMerchandiseGroup := nil;
end;

procedure TfrmDialogMerchandiseGroup.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogMerchandiseGroup.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogMerchandiseGroup.footerDialogMasterbtnSaveClick(
  Sender: TObject);
var
  aPajak_ID: Integer;
begin
  if edtCode.Text = '' then
  begin
    CommonDlg.ShowError('Kode Belum didisi');
    edtCode.SetFocus;
    Exit;
  end;

  if edtName.Text = '' then
  begin
    CommonDlg.ShowError('Nama Belum diisi');
    edtName.SetFocus;
    Exit;
  end;

  if FnewMerchan.isKodeExits(edtCode.Text, FnewMerchan.ID) then
  begin
    CommonDlg.ShowError('Code ' + edtCode.Text + ' Sudah Ada');
    edtCode.SetFocus;
    Exit;
  end;

  aPajak_ID := cGetIDfromCombo(cbbPpn);
  FnewMerchan.UpdateData(IDLokal,edtCode.Text,edtName.Text, aPajak_ID);

  try
    if FnewMerchan.ExecuteGenerateSQL then
    begin
      cCommitTrans;
      CommonDlg.ShowMessage(' Data Sudah Disimpan');
      frmMerchandiseGroup.actRefreshMerchanGroupExecute(nil);
      Close;
    end else begin
      cRollBackTrans;
      CommonDlg.ShowMessage('Data gagal disimpan');
      Exit;
    end;
  finally
    cRollBackTrans;
  end;

  frmMerchandiseGroup.actRefreshMerchanGroupExecute(Sender);


 {
  if (FormMode = fmAdd) then
  begin
    FIsProcessSuccessfull := SaveMerchanGroup;
    if FIsProcessSuccessfull then
      Close;
  end
  else
  begin
    FIsProcessSuccessfull := UpdateMerchanGroup;
    if FIsProcessSuccessfull then
      Close;
  end; // end if  }
end;

procedure TfrmDialogMerchandiseGroup.SetMerchanGroupId(
  const Value: integer);
begin
  FMerchanGroupId := Value;
end;

procedure TfrmDialogMerchandiseGroup.prepareAddData;
begin
  edtCode.Clear;
  edtName.Clear;
end;

procedure TfrmDialogMerchandiseGroup.FormShow(Sender: TObject);
begin
  inherited;
  LoadListCbpPpn;

  if (FFormMode = fmEdit) then
  begin
    IDLokal := MerchanGroupId;
    if FnewMerchan.LoadByID(IDLokal) then
    begin
      edtCode.Text        := FnewMerchan.Kode;
      edtName.Text        := FnewMerchan.Nama;
      cSetItemAtComboObject(cbbPpn, FnewMerchan.PjkId);
    end
  end
  else
  begin
    IDLokal := 0;
    prepareAddData();
  end;
end;

procedure TfrmDialogMerchandiseGroup.FormCreate(Sender: TObject);
begin
  inherited;
  FnewMerchan := TNewMerchadize.Create(Self);
end;

procedure TfrmDialogMerchandiseGroup.LoadListCbpPpn;
var
  sSQL: string;
begin
  sSQL := ' SELECT PJK_ID, PJK_NAME '
          + ' FROM REF$PAJAK '
          + ' ORDER BY PJK_CODE ';
  cQueryToComboObject(cbbPpn, sSQL);

end;

end.
