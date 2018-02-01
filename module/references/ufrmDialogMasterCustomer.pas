unit ufrmDialogMasterCustomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, StdCtrls, ufraFooterDialog2Button, ExtCtrls,
  uConn, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, uDXUtils, uModCustomer, uModSuplier,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  uDMClient, uModTipePembayaran, uAppUtils, uConstanta, Vcl.Mask, uInterface;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogMasterCustomer = class(TfrmMasterDialog, ICRUDAble)
    Panel1: TPanel;
    lbl5: TLabel;
    lbl1: TLabel;
    edtCustCode: TEdit;
    edtCustName: TEdit;
    lbl12: TLabel;
    edtContactPerson: TEdit;
    lbl8: TLabel;
    edtTitle: TEdit;
    Panel2: TPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl7: TLabel;
    lbl11: TLabel;
    edtAddress: TEdit;
    edtCity: TEdit;
    edtTelephone: TEdit;
    edtPostCode: TEdit;
    edtFaxNo: TEdit;
    Panel3: TPanel;
    lbl13: TLabel;
    edtTaxNo: TEdit;
    lbl16: TLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    lbl27: TLabel;
    edtTermOP: TEdit;
    Panel4: TPanel;
    lbl10: TLabel;
    edtCustDesc: TEdit;
    chkPrincipal: TCheckBox;
    lblSubCode: TLabel;
    edtSupName: TEdit;
    cxLookUpSupCode: TcxExtLookupComboBox;
    chkPKP: TCheckBox;
    chkPPH: TCheckBox;
    cxLookUpTipeBayar: TcxExtLookupComboBox;
    medtNPWP: TMaskEdit;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure chkPKPClick(Sender: TObject);
    procedure chkPPHClick(Sender: TObject);
    procedure chkPrincipalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxLookUpSupCodePropertiesEditValueChanged(Sender: TObject);
    procedure edtFaxNoKeyPress(Sender: TObject; var Key: Char);
    procedure edtNPWPKeyPress(Sender: TObject; var Key: Char);
    procedure edtPostCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtTaxNoKeyPress(Sender: TObject; var Key: Char);
    procedure edtTelephoneKeyPress(Sender: TObject; var Key: Char);
    procedure edtTermOPKeyPress(Sender: TObject; var Key: Char);
    procedure medtNPWPKeyPress(Sender: TObject; var Key: Char);
  private
    FModCustomer: TModCustomer;
    function GetModCustomer: TModCustomer;
    procedure InitLookup;
    procedure InitDefault(aState: Boolean);
    procedure SimpanData;
    property ModCustomer: TModCustomer read GetModCustomer write FModCustomer;
  public
    procedure LoadData(ID: String);
    { Public declarations }
  published
  end;

var
  frmDialogMasterCustomer: TfrmDialogMasterCustomer;

implementation

uses uTSCommonDlg, uRetnoUnit, ufrmSearchRekening;

{$R *.dfm}    

procedure TfrmDialogMasterCustomer.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm(CONF_VALIDATE_FOR_DELETE) then exit;
  Try
    DMCLient.CrudClient.DeleteFromDB(ModCustomer);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.ModalResult:=mrOk;
  except
    TAppUtils.Error(ER_DELETE_FAILED);
    raise;
  End;
end;

procedure TfrmDialogMasterCustomer.actSaveExecute(Sender: TObject);
begin
  inherited;
  SimpanData;
end;

procedure TfrmDialogMasterCustomer.chkPKPClick(Sender: TObject);
begin
  inherited;
  lbl13.Visible := chkPKP.Checked;
  edtTaxNo.Visible := chkPKP.Checked;
  if not chkPKP.Checked then
    edtTaxNo.Clear;
end;

procedure TfrmDialogMasterCustomer.chkPPHClick(Sender: TObject);
begin
  inherited;
  lbl16.Visible := chkPPH.Checked;
  medtNPWP.Visible := chkPPH.Checked;
  if not chkPPH.Checked then
    medtNPWP.Clear;
end;

procedure TfrmDialogMasterCustomer.chkPrincipalClick(Sender: TObject);
begin
  inherited;
  lblSubCode.Visible := chkPrincipal.Checked;
  cxLookUpSupCode.Visible := chkPrincipal.Checked;
  edtSupName.Visible := chkPrincipal.Checked;
  if not chkPrincipal.Checked then
    begin
      cxLookUpSupCode.Clear;
      edtSupName.Clear;
    end;
end;

procedure TfrmDialogMasterCustomer.cxLookUpSupCodePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  edtSupName.Text := cxLookUpSupCode.DS.FieldByName('SUP_NAME').AsString;
end;

procedure TfrmDialogMasterCustomer.edtFaxNoKeyPress(Sender: TObject; var Key:
    Char);
begin
  inherited;
  if not CharInSet(key,[#8,'0'..'9']) then key := #0;
end;

procedure TfrmDialogMasterCustomer.edtNPWPKeyPress(Sender: TObject; var Key:
    Char);
begin
  inherited;
  if not CharInSet(key,[#8,'0'..'9']) then key := #0;
end;

procedure TfrmDialogMasterCustomer.edtPostCodeKeyPress(Sender: TObject; var
    Key: Char);
begin
  inherited;
  if not CharInSet(key,[#8,'0'..'9']) then key := #0;
end;

procedure TfrmDialogMasterCustomer.edtTaxNoKeyPress(Sender: TObject; var Key:
    Char);
begin
  inherited;
  if not CharInSet(key,[#8,'0'..'9']) then key := #0;
end;

procedure TfrmDialogMasterCustomer.edtTelephoneKeyPress(Sender: TObject; var
    Key: Char);
begin
  inherited;
  if not CharInSet(key,[#8,'0'..'9']) then key := #0;
end;

procedure TfrmDialogMasterCustomer.edtTermOPKeyPress(Sender: TObject; var Key:
    Char);
begin
  inherited;
  if not CharInSet(key,[#8,'0'..'9']) then key := #0;
end;

procedure TfrmDialogMasterCustomer.FormCreate(Sender: TObject);
begin
  inherited;
  InitLookup;
  InitDefault(True);
end;

function TfrmDialogMasterCustomer.GetModCustomer: TModCustomer;
begin
  if not Assigned(FModCustomer) then
    FModCustomer := TModCustomer.Create;
  Result := FModCustomer;
end;

procedure TfrmDialogMasterCustomer.InitLookup;
begin
  cxLookUpTipeBayar.LoadFromDS(
    DMClient.DSProviderClient.TipePembayaran_GetDSLookUp,
    'REF$TIPE_PEMBAYARAN_ID','TPBYR_NAME',
    ['REF$TIPE_PEMBAYARAN_ID','REF$TIPE_PEMBAYARAN_ID'],self
  );

  cxLookUpSupCode.LoadFromDS(
    DMClient.DSProviderClient.Suplier_GetDSLookup,
      'SUPLIER_ID','SUP_CODE',
      ['SUPLIER_ID','SUPLIER_ID'],self
    );
  cxLookUpSupCode.SetMultiPurposeLookup;

end;

procedure TfrmDialogMasterCustomer.InitDefault;
begin
  Self.EnableDisableControl(Panel3, aState);
  Self.EnableDisableControl(Panel4, aState);

  lbl13.Visible := not aState;
  edtTaxNo.Visible := not aState;

  lbl16.Visible := not aState;
  medtNPWP.Visible := not aState;

  lblSubCode.Visible := not aState;
  cxLookUpSupCode.Visible := not aState;
  edtSupName.Visible := not aState;
end;

procedure TfrmDialogMasterCustomer.LoadData(ID: String);
begin
  if Assigned(FModCustomer) then FreeAndNil(FModCustomer);
  FModCustomer := DMclient.CrudClient.Retrieve(TModCustomer.ClassName, ID) as TModCustomer;

  // 1
  edtCustCode.Text      := ModCustomer.CUST_CODE;
  edtCustName.Text      := ModCustomer.CUST_NAME;
  edtContactPerson.Text := ModCustomer.CUST_CONTACT_PERSON;
  edtTitle.Text         := ModCustomer.CUST_TITLE;

  //2
  edtAddress.Text   := ModCustomer.CUST_ADDRESS;
  edtCity.Text      := ModCustomer.CUST_CITY;
  edtPostCode.Text  := ModCustomer.CUST_POST_CODE;
  edtTelephone.Text := ModCustomer.CUST_TELP;
  edtFaxNo.Text     := ModCustomer.CUST_FAX;

  //3
  edtTaxNo.Text := ModCustomer.CUST_LR_TAX;
  medtNPWP.Text := ModCustomer.CUST_NPWP;

  chkPKP.Checked  := ModCustomer.CUST_IS_PKP=1;
  chkPPH.Checked  := ModCustomer.CUST_IS_PPH23=1;

  cxLookUpTipeBayar.EditValue := ModCustomer.TIPE_PEMBAYARAN.ID;

  edtTermOP.text := ModCustomer.CUST_TOP;

  //4
  edtCustDesc.Text := ModCustomer.CUST_DESCRIPTION;
  chkPrincipal.Checked := ModCustomer.CUST_IS_PRINCIPAL=1;

  cxLookUpSupCode.EditValue := ModCustomer.SUPLIER_MERCHAN_GRUP.ID;

end;

procedure TfrmDialogMasterCustomer.medtNPWPKeyPress(Sender: TObject; var Key:
    Char);
begin
  inherited;
//  if not CharInSet(key,[#8,'0'..'9']) then key := #0;
end;

procedure TfrmDialogMasterCustomer.SimpanData;
begin
  if not ValidateEmptyCtrl([1], True) then exit;

  // 1
  ModCustomer.CUST_CODE           := edtCustCode.Text;
  ModCustomer.CUST_NAME           := edtCustName.Text;
  ModCustomer.CUST_CONTACT_PERSON := edtContactPerson.Text;
  ModCustomer.CUST_TITLE          := edtTitle.Text;

  //2
  ModCustomer.CUST_ADDRESS    := edtAddress.Text;
  ModCustomer.CUST_CITY       :=  edtCity.Text;
  ModCustomer.CUST_POST_CODE  := edtPostCode.Text;
  ModCustomer.CUST_TELP       :=  edtTelephone.Text;
  ModCustomer.CUST_FAX        := edtFaxNo.Text;

  //3
  if chkPKP.Checked then
    ModCustomer.CUST_IS_PKP   := 1
  else
    ModCustomer.CUST_IS_PKP   := 0;

  if chkPPH.Checked then
    ModCustomer.CUST_IS_PPH23 := 1
  else
    ModCustomer.CUST_IS_PPH23 := 0;

  ModCustomer.CUST_LR_TAX   := edtTaxNo.Text;
  ModCustomer.CUST_NPWP     := medtNPWP.Text;

  if not VarIsNull(cxLookUpTipeBayar.EditValue) then
    ModCustomer.TIPE_PEMBAYARAN  := TModTipePembayaran.CreateID(cxLookUpTipeBayar.EditValue);

  ModCustomer.CUST_TOP := edtTermOP.text;

  //4
  ModCustomer.CUST_DESCRIPTION := edtCustDesc.Text;
  if chkPrincipal.Checked then
    ModCustomer.CUST_IS_PRINCIPAL := 1
  else
    ModCustomer.CUST_IS_PRINCIPAL := 0;

  if not VarIsNull(cxLookUpSupCode.EditValue) then
    ModCustomer.SUPLIER_MERCHAN_GRUP := TModSuplier.CreateID(cxLookUpSupCode.EditValue)
    // ini kl isi
  else
    ModCustomer.SUPLIER_MERCHAN_GRUP := nil;
    // ini kl kosong

  try
    DMClient.CrudClient.SaveToDB(ModCustomer);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    self.ModalResult:=mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  end;

end;

end.
