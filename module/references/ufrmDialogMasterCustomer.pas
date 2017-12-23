unit ufrmDialogMasterCustomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, StdCtrls, ufraFooterDialog2Button, ExtCtrls,
  uConn, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, uDXUtils, uModCustomer, uModSuplier,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  uDMClient, uModTipePembayaran, uAppUtils, uConstanta;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogMasterCustomer = class(TfrmMasterDialog)
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
    edtNPWP: TEdit;
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
    procedure actSaveExecute(Sender: TObject);
    procedure chkPKPClick(Sender: TObject);
    procedure chkPPHClick(Sender: TObject);
    procedure chkPrincipalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxLookUpSupCodePropertiesEditValueChanged(Sender: TObject);
  private
    FModCustomer: TModCustomer;
    function GetModCustomer: TModCustomer;
    procedure InitLookup;
    procedure InitDefault(aState: Boolean);
    procedure SimpanData;
    property ModCustomer: TModCustomer read GetModCustomer write FModCustomer;
  public
    { Public declarations }
  published
  end;

var
  frmDialogMasterCustomer: TfrmDialogMasterCustomer;

implementation

uses uTSCommonDlg, uRetnoUnit, ufrmSearchRekening;

{$R *.dfm}    

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
end;

procedure TfrmDialogMasterCustomer.chkPPHClick(Sender: TObject);
begin
  inherited;
  lbl16.Visible := chkPPH.Checked;
  edtNPWP.Visible := chkPPH.Checked;
end;

procedure TfrmDialogMasterCustomer.chkPrincipalClick(Sender: TObject);
begin
  inherited;
  lblSubCode.Visible := chkPrincipal.Checked;
  cxLookUpSupCode.Visible := chkPrincipal.Checked;
  edtSupName.Visible := chkPrincipal.Checked;
end;

procedure TfrmDialogMasterCustomer.cxLookUpSupCodePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  edtSupName.Text := cxLookUpSupCode.DS.FieldByName('SUP_NAME').AsString;
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
  edtNPWP.Visible := not aState;

  lblSubCode.Visible := not aState;
  cxLookUpSupCode.Visible := not aState;
  edtSupName.Visible := not aState;
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
  ModCustomer.CUST_NPWP     := edtNPWP.Text;

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
    ModCustomer.SUPLIER_MERCHAN_GRUP := TModSuplier.CreateID(cxLookUpSupCode.EditValue);

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
