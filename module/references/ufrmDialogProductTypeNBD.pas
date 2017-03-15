unit ufrmDialogProductTypeNBD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, StdCtrls, ufraFooterDialog2Button, ExtCtrls,
  ufraFooterDialog3Button, System.Actions, Vcl.ActnList;

type     
  TFormMode = (fmAdd, fmEdit);
  
  TfrmDialogProductTypeNBD = class(TfrmMasterDialog)
    lbl1: TLabel;
    lbl2: TLabel;
    edtCode: TEdit;
    edtName: TEdit;
    rg1: TRadioGroup;
    rbMarketing: TRadioButton;
    rbStore: TRadioButton;
    lbl3: TLabel;
    edtRekDebet: TEdit;
    lbl4: TLabel;
    lbl5: TLabel;
    edtRekCredit: TEdit;
    lblSearchRek: TLinkLabel;
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure edtRekDebetKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRekCreditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodeKeyPress(Sender: TObject; var Key: Char);
  private
    FIsProcessSuccessfull: boolean;
    FProductTypeNBDId: Integer;
    FFormMode: TFormMode;
//    FProductTypeNBD: TProductTypeNBD;
    FProdukID: Integer;
//    FProdukIDLama: Integer;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure SetProductTypeNBDId(const Value: Integer);
    procedure ShowDataEdit();
    procedure PrepareAddData();
  public
    { Public declarations }
//    UntID: Integer;
//    CompID: Integer;
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property ProductTypeNBDId: Integer read FProductTypeNBDId write SetProductTypeNBDId;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogProductTypeNBD: TfrmDialogProductTypeNBD;
implementation

uses uTSCommonDlg, uConn, ufrmSearchRekening, DB, uRetnoUnit, uConstanta;

{$R *.dfm}

{ TfrmDialogProductTypeNBD }

procedure TfrmDialogProductTypeNBD.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogProductTypeNBD.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogProductTypeNBD.SetProductTypeNBDId(const Value: Integer);
begin
  FProductTypeNBDId := Value;
end;

procedure TfrmDialogProductTypeNBD.footerDialogMasterbtnSaveClick(
  Sender: TObject);
var
  sOwner: string;
begin
  inherited;
  if edtCode.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('CODE');
    edtCode.SetFocus;
    Exit;
  end
  else
  if edtName.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('NAME');
    edtName.SetFocus;
    Exit;
  end
  else
  if edtRekDebet.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('REK. DEBET');
    edtRekDebet.SetFocus;
    Exit;
  end
  else
  if edtRekCredit.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('REK. CREDIT');
    edtRekCredit.SetFocus;
    Exit;
  end;
  if rbMarketing.Checked then
  sOwner := 'MARKETING'
  else
  sOwner := 'STORE';

//  if FProductTypeNBD.LoadByTPPRO_CODE(edtCode.Text) then
  begin
    CommonDlg.ShowMessage('Tidak Dapat Menyimpan Data' + #13 + 'Kode Sudah Dipakai');
    edtCode.SetFocus;
    Exit;
  end;
  {
  FProductTypeNBD.UpdateData(edtCode.Text,FProdukID,edtName.Text,
                             sOwner,edtRekCredit.Text,DialogUnit,
                             edtRekDebet.Text,DialogUnit);

  try
    if FProductTypeNBD.SaveToDB then
    begin
      cCommitTrans;
//      CommonDlg.ShowMessage('Berhasil Menyimpan Data');
      FIsProcessSuccessfull := True;
      Close;
    end
    else begin
      cRollbackTrans;
      CommonDlg.ShowMessage('Data Gagal disimpan');
    end;
  finally
    cRollbackTrans;
  end;
 }


end;

procedure TfrmDialogProductTypeNBD.FormShow(Sender: TObject);
begin
  inherited;
//  if not Assigned(FProductTypeNBD) then
//  FProductTypeNBD := TProductTypeNBD.Create(Self);
  if (FFormMode = fmEdit) then
  begin
     FProdukID := ProductTypeNBDId ;
  end else begin
     FProdukID := 0;
  end;

  prepareAddData();

  if FProdukID <> 0 then
  begin
//    if FProductTypeNBD.LoadByID(FProdukID) then
    begin
      prepareAddData();
//      edtCode.Text          := FProductTypeNBD.TPPRO_CODE;
//      edtName.Text          := FProductTypeNBD.TPPRO_NAME;
//      if FProductTypeNBD.TPPRO_OWNER = 'MARKETING' then
//      rbMarketing.Checked := True
//      else if FProductTypeNBD.TPPRO_OWNER = 'STORE' then
//      rbStore.Checked := True;
      ShowDataEdit;
    end;
  end;
end;

procedure TfrmDialogProductTypeNBD.ShowDataEdit();
begin
  {
  with cOpenQuery('Select * from Ref$Tipe_Produk '
        + ' where TPPRO_ID = ' + IntToStr(FProdukID)) do
  begin
    try
    edtRekDebet.Text   := fieldbyname('TPPRO_REK_DEBET').asString;
    edtRekCredit.Text  := fieldbyname('TPPRO_REK_CREDIT').asString;
    finally
      Free;
    end;
  end;
    }
end;

procedure TfrmDialogProductTypeNBD.PrepareAddData;
begin
  edtCode.Clear;
  edtName.Clear;
end;

procedure TfrmDialogProductTypeNBD.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogProductTypeNBD.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogProductTypeNBD := nil;
end;

procedure TfrmDialogProductTypeNBD.edtRekDebetKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
inherited;
  if(Key = VK_F5) then
  begin
    if not assigned(frmDialogSearchRekening) then
      frmDialogSearchRekening := TfrmDialogSearchRekening.Create(Application);

    frmDialogSearchRekening.searcMode := mDebet;
//    frmDialogListNp.DialogCompany := DialogCompany;
//    frmDialogListNp.DialogUnit    := DialogUnit;
    frmDialogSearchRekening.ShowModal;

    if frmDialogSearchRekening.IsProcessSuccessfull = True then
    begin
      edtRekDebet.Text := frmDialogSearchRekening.RekeningCode;
    end;

    frmDialogSearchRekening.Free;

  end;
end;

procedure TfrmDialogProductTypeNBD.edtRekCreditKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if(Key = VK_F5) then
  begin
    if not assigned(frmDialogSearchRekening) then
      frmDialogSearchRekening := TfrmDialogSearchRekening.Create(Application);

    frmDialogSearchRekening.DialogUnit    := DialogUnit;
    frmDialogSearchRekening.DialogCompany := DialogCompany;
    frmDialogSearchRekening.searcMode := mCredit;
    // pendapatan ==>> [wait 4 DB]
    frmDialogSearchRekening.ShowModal;

    if frmDialogSearchRekening.IsProcessSuccessfull = True then
    begin
      edtRekCredit.Text := frmDialogSearchRekening.RekeningCode;
    end;

    frmDialogSearchRekening.Free;
  end;
end;

procedure TfrmDialogProductTypeNBD.edtCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

end.
