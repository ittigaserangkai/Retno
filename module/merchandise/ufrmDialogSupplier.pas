unit ufrmDialogSupplier;

interface

uses
  uConn, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ExtCtrls, ActnList,
  uRetnoUnit, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit, cxCurrencyEdit,
  System.Actions, ufraFooterDialog3Button, Vcl.Mask, Vcl.StdCtrls, cxButtonEdit,
  dxBarBuiltInMenu, cxPC, uModSuplier, uDMClient, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, uInterface, uAppUtils, uConstanta;

type
  TFormMode = (fmAddSup, fmAddMer, fmEdit);

  TfrmDialogSupplier = class(TfrmMasterDialog,ICRUDAble)
    pc1: TcxPageControl;
    tsSupplier: TcxTabSheet;
    tsMerchandiseGroup: TcxTabSheet;
    edtSupCode: TEdit;
    edtSupName: TEdit;
    lbl3: TLabel;
    edtAddress: TEdit;
    edtCity: TEdit;
    lbl4: TLabel;
    lbl18: TLabel;
    edtPostCode: TEdit;
    edtFax: TEdit;
    lbl19: TLabel;
    edtPhone: TEdit;
    lbl5: TLabel;
    lbl6: TLabel;
    edtContactP: TEdit;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl10: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    bvl2: TBevel;
    edtAccountName: TEdit;
    edtAccountNo: TEdit;
    cbbPKP: TComboBox;
    lbl36: TLabel;
    edtTaxNo: TEdit;
    lbl21: TLabel;
    edtTitle: TEdit;
    lbl37: TLabel;
    edtMerGrup: TEdit;
    lbl23: TLabel;
    lbl24: TLabel;
    edtTermOP: TEdit;
    lbl27: TLabel;
    lbl28: TLabel;
    lbl25: TLabel;
    edtLeadTime: TEdit;
    lbl26: TLabel;
    lbl22: TLabel;
    curedtCreditLmt: TcxCurrencyEdit;
    lbl15: TLabel;
    curedtAPEndB: TcxCurrencyEdit;
    curedtCNBln: TcxCurrencyEdit;
    lbl16: TLabel;
    lbl34: TLabel;
    dtLastPurchs: TcxDateEdit;
    lbl35: TLabel;
    curedtPaymnt: TcxCurrencyEdit;
    curedtOutsdPaymnt: TcxCurrencyEdit;
    lbl9: TLabel;
    lbl33: TLabel;
    edtNoOfPO: TEdit;
    lbl29: TLabel;
    edtExtdDesc: TEdit;
    chkEnableCN: TCheckBox;
    pnl1: TPanel;
    lbl30: TLabel;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl38: TLabel;
    lbl39: TLabel;
    lbl40: TLabel;
    lbl41: TLabel;
    lbl42: TLabel;
    lbl43: TLabel;
    lbl44: TLabel;
    edtAddrMer: TEdit;
    edtCityMer: TEdit;
    edtPostCodeMer: TEdit;
    edtFaxMer: TEdit;
    edtPhoneMer: TEdit;
    edtContactMer: TEdit;
    edtTitleMer: TEdit;
    edtBankCodeMer: TEdit;
    edtBankAccNameMer: TEdit;
    edtBankAccNoMer: TEdit;
    grp: TGroupBox;
    lbl45: TLabel;
    chkMon: TCheckBox;
    chkTue: TCheckBox;
    chkWed: TCheckBox;
    chkThu: TCheckBox;
    chkFri: TCheckBox;
    chkSat: TCheckBox;
    chkSun: TCheckBox;
    chkIsDif: TCheckBox;
    cbbBKP: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    edtFee: TEdit;
    Label3: TLabel;
    chkFee: TCheckBox;
    actSupplier: TActionList;
    actUpdateBank: TAction;
    Label5: TLabel;
    Label4: TLabel;
    medtNPWP: TMaskEdit;
    cbpBankCodeMer: TcxButtonEdit;
    cbpDeliverPO: TComboBox;
    cbpPayment: TComboBox;
    cbpMerchGroup: TComboBox;
    Label6: TLabel;
    edtCabangBank: TEdit;
    Label7: TLabel;
    edtBankBranch: TEdit;
    Label8: TLabel;
    edtBankAddrss: TEdit;
    edtAlamatBank: TEdit;
    Lbl2: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cbbPpn: TComboBox;
    chkSupActive: TCheckBox;
    Label11: TLabel;
    edtDisc: TcxCurrencyEdit;
    Label12: TLabel;
    chkAllMer: TCheckBox;
    edtNPWPAlamat: TEdit;
    Label13: TLabel;
    cxLookUpBank: TcxExtLookupComboBox;
    Label14: TLabel;
    cxLookupTipePerush: TcxExtLookupComboBox;
    cxLookUpSuppGroup: TcxExtLookupComboBox;
    cxLookUpSupType: TcxExtLookupComboBox;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);


  private
    FModSupplier: TModSuplier;
    function GetModSupplier: TModSuplier;
    procedure SimpanData;
    property ModSupplier: TModSuplier read GetModSupplier write FModSupplier;


  public
    procedure LoadData(ID: String);
  published
  end;

var
  frmDialogSupplier: TfrmDialogSupplier;

implementation

uses
  uDXUtils, uModTipePerusahaan, uModBank;


{$R *.dfm}

procedure TfrmDialogSupplier.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm(CONF_VALIDATE_FOR_DELETE) then exit;
  Try
    DMCLient.CrudClient.DeleteFromDB(ModSupplier);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.ModalResult:=mrOk;
  except
    TAppUtils.Error(ER_DELETE_FAILED);
    raise;
  End;
end;

procedure TfrmDialogSupplier.actSaveExecute(Sender: TObject);
begin
  inherited;
  SimpanData;
end;

procedure TfrmDialogSupplier.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  cxLookUpBank.LoadFromDS(
    DMClient.DSProviderClient.Bank_GetDSLookup,
      'BANK_ID','BANK_NAME',['BANK_ID'],self
    );
  cxLookUpBank.SetMultiPurposeLookup;

  cxLookupTipePerush.LoadFromDS(
    DMClient.DSProviderClient.TipePerusahaan_GetDSLookup,
      'REF$TIPE_PERUSAHAAN_ID','TPPERSH_NAME',['REF$TIPE_PERUSAHAAN_ID'],self
    );

  cxLookUpSupType.LoadFromDS(
    DMClient.DSProviderClient.TipeSuplier_GetDSLookup,
      'REF$TIPE_SUPLIER_ID','TPSUP_NAME',['REF$TIPE_SUPLIER_ID'],self
    );

  cxLookUpSuppGroup.LoadFromDS(
    DMClient.DSProviderClient.SuplierGroup_GetDSLookup,
      'SUPLIER_GROUP_ID', 'GROUP_NAME', ['SUPLIER_GROUP_ID'],self
    );


end;

procedure TfrmDialogSupplier.FormShow(Sender: TObject);
begin
  inherited;
  edtSupCode.SetFocus;
end;

function TfrmDialogSupplier.GetModSupplier: TModSuplier;
begin
  if not Assigned(FModSupplier) then
    FModSupplier := TModSuplier.Create;
  Result := FModSupplier;
end;

procedure TfrmDialogSupplier.LoadData(ID: String);
begin
  if Assigned(FModSupplier) then FreeAndNil(FModSupplier);
  FModSupplier := DMclient.CrudClient.Retrieve(TModSuplier.ClassName, ID) as TModSuplier;

  edtSupCode.Text := ModSupplier.SUP_CODE;
  cxLookupTipePerush.EditValue := ModSupplier.TIPE_PERUSAHAAN.ID;
  edtSupName.Text := ModSupplier.SUP_NAME;
  edtAddress.Text := ModSupplier.SUP_ADDRESS;
  edtCity.Text := ModSupplier.SUP_CITY;
  edtPostCode.Text := ModSupplier.SUP_POST_CODE;
  edtPhone.Text := ModSupplier.SUP_TELP;
  edtFax.Text := ModSupplier.SUP_FAX;
  edtContactP.Text := ModSupplier.SUP_CONTACT_PERSON;
  edtTitle.Text := ModSupplier.SUP_TITLE;
  cxLookUpSupType.EditValue := ModSupplier.TIPE_SUPLIER.ID;
  cbbPKP.ItemIndex := ModSupplier.SUP_IS_PKP;
  edtTaxNo.Text := ModSupplier.SUP_LR_TAX;
  medtNPWP.Text := ModSupplier.SUP_NPWP;
  edtNPWPAlamat.Text := ModSupplier.SUP_NPWP_ALAMAT;
  cxLookUpBank.EditValue := ModSupplier.BANK.ID;
  edtCabangBank.Text := ModSupplier.SUP_BANK_BRANCH;
  edtAlamatBank.Text := ModSupplier.SUP_BANK_ADDRESS;
  edtAccountNo.Text := ModSupplier.SUP_BANK_ACCOUNT_NO;
  edtAccountName.Text := ModSupplier.SUP_BANK_ACCOUNT_NAME;
  cxLookUpSuppGroup.EditValue := ModSupplier.SUPLIER_GROUP.ID;
  chkSupActive.Checked := ModSupplier.SUP_IS_ACTIVE=1;

//  tab kedua
//  cbpMerchGroup.ItemIndex := ModSupplier.

end;

procedure TfrmDialogSupplier.SimpanData;
begin
  if not ValidateEmptyCtrl then exit;


  ModSupplier.SUP_CODE := edtSupCode.Text;
  if not VarIsNull(cxLookupTipePerush.EditValue) then
    ModSupplier.TIPE_PERUSAHAAN := TModTipePerusahaan.CreateID(cxLookupTipePerush.EditValue);
  ModSupplier.SUP_NAME := edtSupName.Text;
  ModSupplier.SUP_ADDRESS := edtAddress.Text;
  ModSupplier.SUP_CITY := edtCity.Text;
  ModSupplier.SUP_POST_CODE := edtPostCode.Text;
  ModSupplier.SUP_TELP := edtPhone.Text;
  ModSupplier.SUP_FAX := edtFax.Text;
  ModSupplier.SUP_CONTACT_PERSON := edtContactP.Text;
  ModSupplier.SUP_TITLE := edtTitle.Text;
  if not VarIsNull(cxLookUpSupType.EditValue) then
    ModSupplier.TIPE_SUPLIER := TModTipeSuplier.CreateID(cxLookUpSupType.EditValue);
  ModSupplier.SUP_IS_PKP := cbbPKP.ItemIndex;
  ModSupplier.SUP_LR_TAX := edtTaxNo.Text;
  ModSupplier.SUP_NPWP := medtNPWP.Text;
  ModSupplier.SUP_NPWP_ALAMAT := edtNPWPAlamat.Text;
  ModSupplier.BANK := TModBank.CreateID(cxLookUpBank.EditValue);
  ModSupplier.SUP_BANK_BRANCH := edtCabangBank.Text;
  ModSupplier.SUP_BANK_ADDRESS := edtAlamatBank.Text;
  ModSupplier.SUP_BANK_ACCOUNT_NO := edtAccountNo.Text;
  ModSupplier.SUP_BANK_ACCOUNT_NAME := edtAccountName.Text;
  if not VarIsNull(cxLookUpSuppGroup.EditValue) then
    ModSupplier.SUPLIER_GROUP := TModSuplierGroup.CreateID(cxLookUpSuppGroup.EditValue);

  if chkSupActive.Checked then
    ModSupplier.SUP_IS_ACTIVE := 1
  else
    ModSupplier.SUP_IS_ACTIVE := 0;

  try
    DMClient.CrudClient.SaveToDB(ModSupplier);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    self.ModalResult:=mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  end;
end;

end.
