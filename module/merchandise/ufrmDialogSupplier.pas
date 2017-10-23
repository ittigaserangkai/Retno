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
  cxDBExtLookupComboBox, uInterface, uAppUtils, uConstanta, cxDBLookupComboBox,
  Vcl.Menus, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxButtons,
  cxGroupBox, Datasnap.DBClient, uModTipePembayaran;

type
  TFormMode = (fmAddSup, fmAddMer, fmEdit);

  TfrmDialogSupplier = class(TfrmMasterDialog,ICRUDAble)
    pc1: TcxPageControl;
    tsSupplier: TcxTabSheet;
    edtSupName: TcxTextEdit;
    lbl3: TLabel;
    edtAddress: TcxTextEdit;
    edtCity: TcxTextEdit;
    lbl4: TLabel;
    lbl18: TLabel;
    edtPostCode: TcxTextEdit;
    edtFax: TcxTextEdit;
    lbl19: TLabel;
    edtPhone: TcxTextEdit;
    lbl5: TLabel;
    lbl6: TLabel;
    edtContactP: TcxTextEdit;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl10: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    bvl2: TBevel;
    edtAccountName: TcxTextEdit;
    edtAccountNo: TcxTextEdit;
    cbbPKP: TComboBox;
    lbl36: TLabel;
    edtTaxNo: TcxTextEdit;
    lbl21: TLabel;
    edtTitle: TcxTextEdit;
    actSupplier: TActionList;
    actUpdateBank: TAction;
    Label5: TLabel;
    Label4: TLabel;
    medtNPWP: TMaskEdit;
    Label6: TLabel;
    edtCabangBank: TcxTextEdit;
    edtAlamatBank: TcxTextEdit;
    Lbl2: TLabel;
    Label9: TLabel;
    chkSupActive: TCheckBox;
    edtNPWPAlamat: TcxTextEdit;
    Label13: TLabel;
    cxLookUpBank: TcxExtLookupComboBox;
    Label14: TLabel;
    cxLookupTipePerush: TcxExtLookupComboBox;
    cxLookUpSuppGroup: TcxExtLookupComboBox;
    cxLookUpSupType: TcxExtLookupComboBox;
    edtSupCode: TcxTextEdit;
    tsMerchandiseGroup: TcxTabSheet;
    gbSupplierGrid: TcxGroupBox;
    pnlGridSupplierBtn: TcxGroupBox;
    btnDelSupp: TcxButton;
    btnAddSupp: TcxButton;
    btnUpdateSupp: TcxButton;
    cxGridSupplier: TcxGrid;
    cxGrdDBSupplierMerchan: TcxGridDBTableView;
    cxGridSupplierLevel1: TcxGridLevel;
    pgcMerchan: TcxPageControl;
    tsMG: TcxTabSheet;
    lblPPN: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    lbl29: TLabel;
    lbl33: TLabel;
    lbl34: TLabel;
    lbl35: TLabel;
    lbl37: TLabel;
    lbl45: TLabel;
    lbl9: TLabel;
    chkAllMer: TCheckBox;
    chkEnableCN: TCheckBox;
    chkFee: TCheckBox;
    curedtAPEndB: TcxCurrencyEdit;
    curedtCNBln: TcxCurrencyEdit;
    curedtCreditLmt: TcxCurrencyEdit;
    curedtOutsdPaymnt: TcxCurrencyEdit;
    curedtPaymnt: TcxCurrencyEdit;
    dtLastPurchs: TcxDateEdit;
    edtDisc: TcxCurrencyEdit;
    edtExtdDesc: TcxTextEdit;
    edtFee: TcxTextEdit;
    edtLeadTime: TcxTextEdit;
    edtNoOfPO: TcxTextEdit;
    edtTermOP: TcxTextEdit;
    grp: TGroupBox;
    chkMon: TCheckBox;
    chkTue: TCheckBox;
    chkWed: TCheckBox;
    chkThu: TCheckBox;
    chkFri: TCheckBox;
    chkSat: TCheckBox;
    chkSun: TCheckBox;
    tsA: TcxTabSheet;
    pnlAddress: TPanel;
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
    Label7: TLabel;
    Label8: TLabel;
    edtAddrMer: TcxTextEdit;
    edtCityMer: TcxTextEdit;
    edtPostCodeMer: TcxTextEdit;
    edtFaxMer: TcxTextEdit;
    edtPhoneMer: TcxTextEdit;
    edtContactMer: TcxTextEdit;
    edtTitleMer: TcxTextEdit;
    edtAccountNameMer: TcxTextEdit;
    edtAccountNoMer: TcxTextEdit;
    chkIsDif: TCheckBox;
    edtCabangBankMer: TcxTextEdit;
    edtAlamatBankMer: TcxTextEdit;
    cxLookupMerchGroup: TcxExtLookupComboBox;
    cxLookupPaymentType: TcxExtLookupComboBox;
    clSupMerchanGroup: TcxGridDBColumn;
    clTipePembayaran: TcxGridDBColumn;
    cxLookupPODeliver: TcxExtLookupComboBox;
    chkPKP: TCheckBox;
    cxLookupPPN: TcxExtLookupComboBox;
    cxLookUpBankMer: TcxExtLookupComboBox;
    chkIsSOBlacklist: TCheckBox;
    pnlMG: TPanel;
    PopupMenu1: TPopupMenu;
    EditData1: TMenuItem;
    btnCancelSupp: TcxButton;
    btnEditSupp: TcxButton;
    Label1: TLabel;
    edtEmail: TcxTextEdit;
    Label10: TLabel;
    edtEmailMer: TcxTextEdit;
    Label15: TLabel;
    edSubMgKode: TcxTextEdit;
    lblKode: TLabel;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddSuppClick(Sender: TObject);
    procedure btnDelSuppClick(Sender: TObject);
    procedure cxGrdDBSupplierMerchanFocusedRecordChanged(Sender:
        TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord:
        TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure chkIsDifClick(Sender: TObject);
    procedure chkPKPClick(Sender: TObject);
    procedure cxGrdDBSupplierMerchanCellClick(Sender: TcxCustomGridTableView;
        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
        TShiftState; var AHandled: Boolean);
    procedure cxLookUpBankPropertiesEditValueChanged(Sender: TObject);
    procedure cxLookUpBankMerPropertiesEditValueChanged(Sender: TObject);
    procedure edtPostCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtPostCodeMerKeyPress(Sender: TObject; var Key: Char);
    procedure pc1Change(Sender: TObject);
    procedure pgcMerchanExit(Sender: TObject);
    procedure EditData1Click(Sender: TObject);
    procedure btnCancelSuppClick(Sender: TObject);
    procedure btnEditSuppClick(Sender: TObject);
    procedure btnUpdateSuppClick(Sender: TObject);


  private
    FCDSItems: TClientDataSet;
    FDisableUpdateDetail: Boolean;
    FIsUpdateSupplier: Boolean;
    FModSupplier: TModSuplier;
    procedure InitCategory(aState: Boolean);
    function GetCDSItems: TClientDataSet;
    function GetModSupplier: TModSuplier;
    procedure InitLookup;
    procedure ShowDetail(AIDObject: String);
    procedure SimpanData;
    function UpdateDetail: Boolean;
    function ValidateDetail: Boolean;
    property CDSItems: TClientDataSet read GetCDSItems write FCDSItems;
    property DisableUpdateDetail: Boolean read FDisableUpdateDetail write
        FDisableUpdateDetail;
    property IsUpdateSupplier: Boolean read FIsUpdateSupplier write
        FIsUpdateSupplier;
    property ModSupplier: TModSuplier read GetModSupplier write FModSupplier;


  public
    procedure LoadData(ID: String);
  published
  end;

var
  frmDialogSupplier: TfrmDialogSupplier;

implementation

uses
  uDXUtils, uModTipePerusahaan, uModBank, uDBUtils;


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

procedure TfrmDialogSupplier.btnAddSuppClick(Sender: TObject);
begin
  inherited;
  Self.ClearByTag([0,1], pgcMerchan);
  IsUpdateSupplier := False;
  InitCategory(True);
//  CDSItems.Append;
//  CDSItems.Post;
end;

procedure TfrmDialogSupplier.btnCancelSuppClick(Sender: TObject);
begin
  inherited;
  InitCategory(false);
end;

procedure TfrmDialogSupplier.btnDelSuppClick(Sender: TObject);
begin
  inherited;
  if not CDSItems.Eof then
    CDSItems.Delete;
end;

procedure TfrmDialogSupplier.btnEditSuppClick(Sender: TObject);
begin
  inherited;
  InitCategory(true);
end;

procedure TfrmDialogSupplier.btnUpdateSuppClick(Sender: TObject);
begin
  inherited;
  UpdateDetail;
end;

procedure TfrmDialogSupplier.InitCategory(aState: Boolean);
begin
  Self.EnableDisableControl(pnlMg, aState);
  Self.EnableDisableControl(pnlAddress, aState);
  if aState then
    chkIsDifClick(self);
  btnUpdateSupp.Visible := aState;
  btnCancelSupp.Visible := aState;
  cxGridSupplier.Enabled := not aState;
  btnAddSupp.Visible := not aState;
  btnEditSupp.Visible := not aState;
  actSave.Enabled := not aState;

  btnDelSupp.Left := 0;
  btnCancelSupp.Left := 0;
  btnUpdateSupp.Left := 0;
  btnEditSupp.Left := 0;
  btnAddSupp.Left := 0;

end;

procedure TfrmDialogSupplier.chkIsDifClick(Sender: TObject);
begin
  inherited;
  edtAddrMer.Enabled := chkIsDif.Checked;
  edtCityMer.Enabled := chkIsDif.Checked;
  edtPhoneMer.Enabled := chkIsDif.Checked;
  edtPostCodeMer.Enabled := chkIsDif.Checked;
  edtFaxMer.Enabled := chkIsDif.Checked;
  edtContactMer.Enabled := chkIsDif.Checked;
  edtEmailMer.Enabled := chkIsDif.Checked;
  edtTitleMer.Enabled := chkIsDif.Checked;
  cxLookUpBankMer.Enabled := chkIsDif.Checked;
  edtCabangBankMer.Enabled := chkIsDif.Checked;
  edtAlamatBankMer.Enabled := chkIsDif.Checked;
  edtAccountNameMer.Enabled := chkIsDif.Checked;
  edtAccountNoMer.Enabled := chkIsDif.Checked;
end;

procedure TfrmDialogSupplier.chkPKPClick(Sender: TObject);
begin
  inherited;
  lblPPN.Visible := chkPKP.Checked;
  cxLookupPPN.Visible := chkPKP.Checked;
end;

procedure TfrmDialogSupplier.cxGrdDBSupplierMerchanCellClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  btnEditSupp.Enabled;
//  if not CDSItems.eof then
//    ShowDetail(CDSItems.FieldByName('ID').AsString);
end;

procedure TfrmDialogSupplier.cxGrdDBSupplierMerchanFocusedRecordChanged(Sender:
    TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord:
    TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  if not CDSItems.eof then
    ShowDetail(CDSItems.FieldByName('ID').AsString);
end;

procedure TfrmDialogSupplier.cxLookUpBankMerPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if cxLookUpBankMer.DS.Eof then exit;
  edtAlamatBankMer.Text := cxLookUpBankMer.DS.FieldByName('BANK_ADDRESS').AsString;
  edtCabangBankMer.Text := cxLookUpBankMer.DS.FieldByName('BANK_BRANCH').AsString;
end;

procedure TfrmDialogSupplier.cxLookUpBankPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if cxLookUpBank.DS.Eof then exit;
  edtAlamatBank.Text := cxLookUpBank.DS.FieldByName('BANK_ADDRESS').AsString;
  edtCabangBank.Text := cxLookUpBank.DS.FieldByName('BANK_BRANCH').AsString;
end;

procedure TfrmDialogSupplier.EditData1Click(Sender: TObject);
begin
  inherited;
  InitCategory(True);
end;

procedure TfrmDialogSupplier.edtPostCodeKeyPress(Sender: TObject; var Key:
    Char);
begin
  inherited;
  if not CharInSet(key,[#8,'0'..'9']) then key := #0;
end;

procedure TfrmDialogSupplier.edtPostCodeMerKeyPress(Sender: TObject; var Key:
    Char);
begin
  inherited;
  if not CharInSet(key,[#8,'0'..'9']) then key := #0;
end;

procedure TfrmDialogSupplier.FormCreate(Sender: TObject);
begin
  inherited;
  pc1.ActivePage := tsSupplier;
  pgcMerchan.ActivePage := tsMG;
  Self.AssignKeyDownEvent;

  InitLookup;

  cxGrdDBSupplierMerchan.LoadFromCDS(CDSItems, FALSE, FALSE);
  IsUpdateSupplier := False;
  chkPKPClick(self);
end;

procedure TfrmDialogSupplier.FormShow(Sender: TObject);
begin
  inherited;
  edtSupCode.SetFocus;
end;

function TfrmDialogSupplier.GetCDSItems: TClientDataSet;
begin
  if not assigned(FCDSItems) then
    FCDSItems := TDBUtils.CreateObjectDataSet(TModSuplierMerchanGroup, Self);

  Result := FCDSItems;
end;

function TfrmDialogSupplier.GetModSupplier: TModSuplier;
begin
  if not Assigned(FModSupplier) then
    FModSupplier := TModSuplier.Create;
  Result := FModSupplier;
end;

procedure TfrmDialogSupplier.InitLookup;
begin
  cxLookupMerchGroup.LoadFromDS(
    DMClient.DSProviderClient.MerchandiseGroup_GetDSLookup,
    'REF$MERCHANDISE_GRUP_ID','MERCHANGRUP_NAME',
    ['REF$MERCHANDISE_GRUP_ID','REF$MERCHANDISE_ID'],self
  );

  TcxExtLookupComboBoxProperties(clSupMerchanGroup.Properties).LoadFromDS(
  DMClient.DSProviderClient.MerchandiseGroup_GetDSLookup,
    'REF$MERCHANDISE_GRUP_ID','MERCHANGRUP_NAME',
    ['REF$MERCHANDISE_GRUP_ID','REF$MERCHANDISE_ID'],self
  );

  cxLookUpBank.LoadFromDS(
    DMClient.DSProviderClient.Bank_GetDSLookup,
      'BANK_ID','BANK_NAME',['BANK_ID'],self
    );
  cxLookUpBank.SetMultiPurposeLookup;

  cxLookUpBankMer.LoadFromDS(
    DMClient.DSProviderClient.Bank_GetDSLookup,
      'BANK_ID','BANK_NAME',['BANK_ID'],self
    );
  cxLookUpBankMer.SetMultiPurposeLookup;


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

  cxLookupPaymentType.LoadFromDS(
    DMClient.DSProviderClient.TipePembayaran_GetDSOverview,
      'REF$TIPE_PEMBAYARAN_ID', 'TPBYR_NAME', ['REF$TIPE_PEMBAYARAN_ID'],self
    );

  TcxExtLookupComboBoxProperties(clTipePembayaran.Properties).LoadFromDS(
    DMClient.DSProviderClient.TipePembayaran_GetDSOverview,
      'REF$TIPE_PEMBAYARAN_ID', 'TPBYR_NAME', ['REF$TIPE_PEMBAYARAN_ID'],self
    );

  cxLookupPODeliver.LoadFromDS(
    DMClient.DSProviderClient.TipeKirimPO_GetDSOverview,
      'REF$TIPE_KIRIM_PO_ID', 'TPKRMPO_NAME', ['REF$TIPE_KIRIM_PO_ID'],self
    );

  cxLookupPPN.LoadFromDS(
    DMClient.DSProviderClient.RefPajak_GetDSLookup,
      'REF$PAJAK_ID', 'PJK_NAME', ['REF$PAJAK_ID'],self
    );
end;

procedure TfrmDialogSupplier.LoadData(ID: String);
var
  i: Integer;
  lModSuppGroup: TModSuplierMerchanGroup;
begin
  DisableUpdateDetail := True;
  if Assigned(FModSupplier) then FreeAndNil(FModSupplier);
  FModSupplier := DMclient.CrudClient.Retrieve(TModSuplier.ClassName, ID) as TModSuplier;

  //load header
  edtSupCode.Text               := ModSupplier.SUP_CODE;
  cxLookupTipePerush.EditValue  := ModSupplier.TIPE_PERUSAHAAN.ID;
  edtSupName.Text               := ModSupplier.SUP_NAME;
  edtAddress.Text               := ModSupplier.SUP_ADDRESS;
  edtCity.Text                  := ModSupplier.SUP_CITY;
  edtPostCode.Text              := ModSupplier.SUP_POST_CODE;
  edtPhone.Text                 := ModSupplier.SUP_TELP;
  edtFax.Text                   := ModSupplier.SUP_FAX;
  edtContactP.Text              := ModSupplier.SUP_CONTACT_PERSON;
  edtTitle.Text                 := ModSupplier.SUP_TITLE;
  cxLookUpSupType.EditValue     := ModSupplier.TIPE_SUPLIER.ID;
  cbbPKP.ItemIndex              := ModSupplier.SUP_IS_PKP;
  edtTaxNo.Text                 := ModSupplier.SUP_LR_TAX;
  medtNPWP.Text                 := ModSupplier.SUP_NPWP;
  edtNPWPAlamat.Text            := ModSupplier.SUP_NPWP_ALAMAT;
  cxLookUpBank.EditValue        := ModSupplier.BANK.ID;
  edtCabangBank.Text            := ModSupplier.SUP_BANK_BRANCH;
  edtAlamatBank.Text            := ModSupplier.SUP_BANK_ADDRESS;
  edtAccountNo.Text             := ModSupplier.SUP_BANK_ACCOUNT_NO;
  edtAccountName.Text           := ModSupplier.SUP_BANK_ACCOUNT_NAME;
  cxLookUpSuppGroup.EditValue   := ModSupplier.SUPLIER_GROUP.ID;
  chkSupActive.Checked          := ModSupplier.SUP_IS_ACTIVE=1;
  chkIsSOBlacklist.Checked      := ModSupplier.IS_SO_BLACKLIST=1;

  edtEmail.Text                 := ModSupplier.SUP_EMAIL;

  //load detail

  CDSItems.EmptyDataSet;  //kosongkan grid
  for i := 0 to ModSupplier.SuplierMerchanGroups.Count-1 do
  begin
    //ambil dari object list baris ke - i
    lModSuppGroup := ModSupplier.SuplierMerchanGroups[i];

    CDSItems.Append;
    lModSuppGroup.UpdateToDataset(CDSItems);  //isikan ke grid
    CDSItems.Post;
  end;
  DisableUpdateDetail := False;

end;

procedure TfrmDialogSupplier.pc1Change(Sender: TObject);
begin
  inherited;
  InitCategory(false);
end;

procedure TfrmDialogSupplier.pgcMerchanExit(Sender: TObject);
begin
  inherited;
//  UpdateDetail;
end;

procedure TfrmDialogSupplier.ShowDetail(AIDObject: String);
var
  lEvent: TNotifyEvent;
begin
  lEvent := chkIsDif.OnClick;
  Try
    chkIsDif.OnClick := nil;
    if CDSItems.Eof then exit;  //exit jika tidak ada record yang dipilih

  //isi kan form dari CDSItems, contoh :
  //  cxLookupMerchGroup.EditValue  := ModSupplier.SuplierMerchanGroups[0].MERCHANDISE_GRUP.ID;
    InitCategory(false);

    cxLookupMerchGroup.EditValue  := CDSItems.FieldByName('MERCHANDISE_GRUP').AsString;
    edSubMgKode.Text              := CDSItems.FieldByName('SUPMG_SUB_CODE').AsString;
    cxLookupPaymentType.EditValue := CDSItems.FieldByName('TIPE_PEMBAYARAN').AsString;
    edtTermOP.Text                := CDSItems.FieldByName('SUPMG_TOP').AsString;
    edtLeadTime.Text              := CDSItems.FieldByName('SUPMG_LEAD_TIME').AsString;
    cxLookupPODeliver.EditValue   := CDSItems.FieldByName('TIPE_KIRIM_PO').AsString;
    curedtCreditLmt.Value         := CDSItems.FieldByName('SUPMG_CREDIT_LIMIT').AsFloat;
    edtExtdDesc.EditValue         := CDSItems.FieldByName('SUPMG_DESCRIPTION').AsString;
    curedtAPEndB.Value            := CDSItems.FieldByName('SUPMG_AP_ENDING_BALANCE').AsFloat;
    curedtCNBln.Value             := CDSItems.FieldByName('SUPMG_CN_BALANCE').AsFloat;
    edtDisc.Text                  := CDSItems.FieldByName('SUPMG_DISC').AsString;
    dtLastPurchs.Date             := CDSItems.FieldByName('SUPMG_LAST_PURCHASE').AsDateTime;
    curedtPaymnt.Value            := CDSItems.FieldByName('SUPMG_LAST_PAYMENT').AsFloat;
    curedtOutsdPaymnt.Value       := CDSItems.FieldByName('SUPMG_OUTSTANDING_PAYMENT').AsFloat;
    edtNoOfPO.Text                := CDSItems.FieldByName('SUPMG_NO_OF_PO').AsString;
    edtFee.Text                   := CDSItems.FieldByName('SUPMG_FEE').AsString;
    chkFee.Checked                := CDSItems.FieldByName('SUPMG_IS_FEE_4ALL').AsInteger=1;
    chkPKP.Checked                := CDSItems.FieldByName('SUPMG_IS_PKP').AsInteger=1;
    cxLookupPPN.EditValue         := CDSItems.FieldByName('SUPMG_PAJAK').AsString;
  //  chkAllMer.Checked             := CDSItems.FieldByName('').AsInteger=1;  //belum tau gimana
    chkEnableCN.Checked           := CDSItems.FieldByName('SUPMG_IS_ENABLE_CN').AsInteger=1;
    chkMon.Checked := CDSItems.FieldByName('SUPMG_IS_MON').AsInteger=1;
    chkTue.Checked := CDSItems.FieldByName('SUPMG_IS_TUE').AsInteger=1;
    chkWed.Checked := CDSItems.FieldByName('SUPMG_IS_WED').AsInteger=1;
    chkThu.Checked := CDSItems.FieldByName('SUPMG_IS_THU').AsInteger=1;
    chkFri.Checked := CDSItems.FieldByName('SUPMG_IS_FRI').AsInteger=1;
    chkSat.Checked := CDSItems.FieldByName('SUPMG_IS_SAT').AsInteger=1;
    chkSun.Checked := CDSItems.FieldByName('SUPMG_IS_SUN').AsInteger=1;

  // tab sheet Alamat
    chkIsDif.Checked          := CDSItems.FieldByName('SUPMG_IS_DIF_CONTACT').AsInteger = 1;
    edtAddrMer.Text           := CDSItems.FieldByName('SUPMG_ADDRESS').AsString;
    edtCityMer.Text           := CDSItems.FieldByName('SUPMG_CITY').AsString;
    edtPostCodeMer.Text       := CDSItems.FieldByName('SUPMG_POST_CODE').AsString;
    edtPhoneMer.Text          := CDSItems.FieldByName('SUPMG_TELP').AsString;
    edtFaxMer.Text            := CDSItems.FieldByName('SUPMG_FAX').AsString;
    edtContactMer.Text        := CDSItems.FieldByName('SUPMG_CONTACT_PERSON').AsString;
    edtEmailMer.Text          := CDSItems.FieldByName('SUPMG_EMAIL').AsString;
    edtTitleMer.Text          := CDSItems.FieldByName('SUPMG_TITLE').AsString;
    cxLookUpBankMer.EditValue := CDSItems.FieldByName('BANK').AsString;
    edtAccountNameMer.Text    := CDSItems.FieldByName('SUPMG_BANK_ACCOUNT_NAME').AsString;
    edtAccountNoMer.Text      := CDSItems.FieldByName('SUPMG_BANK_ACCOUNT_NO').AsString;

    IsUpdateSupplier := True;
  Finally
    chkIsDif.OnClick := lEvent;
  End;
end;

procedure TfrmDialogSupplier.SimpanData;
var
  lModSuppGroup: TModSuplierMerchanGroup;
begin
  if not ValidateEmptyCtrl([1], True, tsSupplier) then exit;
//  if not UpdateDetail then exit;

//  if (btnUpdateSupp.Visible) then
//  begin
//    TAppUtils.Error('Tidak bisa menyimpan data, Simpan terlebih dahulu perubahan di grid merchan grup');
//    exit;
//  end;


  if CDSItems.RecordCount = 0 then
  begin
    TAppUtils.Warning('Merchan Group wajib diisi minimal 1');
    exit;
  end;

  CDSItems.First;
  while not CDSItems.Eof do
  begin
    if CDSItems.FieldByName('MERCHANDISE_GRUP').AsString  = '' then
    begin
      TAppUtils.Warning('Ada Items yang Merchandise Grup masih kosong');
      exit;
    end;
    CDSItems.Next;
  end;
  CDSItems.First;

  //simpan header tab 1
  ModSupplier.SUP_CODE              := edtSupCode.Text;
  if not VarIsNull(cxLookupTipePerush.EditValue) then
    ModSupplier.TIPE_PERUSAHAAN     := TModTipePerusahaan.CreateID(cxLookupTipePerush.EditValue);
  ModSupplier.SUP_NAME              := edtSupName.Text;
  ModSupplier.SUP_ADDRESS           := edtAddress.Text;
  ModSupplier.SUP_CITY              := edtCity.Text;
  ModSupplier.SUP_POST_CODE         := edtPostCode.Text;
  ModSupplier.SUP_TELP              := edtPhone.Text;
  ModSupplier.SUP_FAX               := edtFax.Text;
  ModSupplier.SUP_CONTACT_PERSON    := edtContactP.Text;
  ModSupplier.SUP_TITLE             := edtTitle.Text;
  ModSupplier.SUP_EMAIL             := edtEmail.Text;
  if not VarIsNull(cxLookUpSupType.EditValue) then
    ModSupplier.TIPE_SUPLIER        := TModTipeSuplier.CreateID(cxLookUpSupType.EditValue);
  ModSupplier.SUP_IS_PKP            := cbbPKP.ItemIndex;
  ModSupplier.SUP_LR_TAX            := edtTaxNo.Text;
  ModSupplier.SUP_NPWP              := medtNPWP.Text;
  ModSupplier.SUP_NPWP_ALAMAT       := edtNPWPAlamat.Text;
  if not VarIsNull(cxLookUpBank.EditValue) then
    ModSupplier.BANK                := TModBank.CreateID(cxLookUpBank.EditValue);
  ModSupplier.SUP_BANK_BRANCH       := edtCabangBank.Text;
  ModSupplier.SUP_BANK_ADDRESS      := edtAlamatBank.Text;
  ModSupplier.SUP_BANK_ACCOUNT_NO   := edtAccountNo.Text;
  ModSupplier.SUP_BANK_ACCOUNT_NAME := edtAccountName.Text;
  if not VarIsNull(cxLookUpSuppGroup.EditValue) then
    ModSupplier.SUPLIER_GROUP       := TModSuplierGroup.CreateID(cxLookUpSuppGroup.EditValue);

  if chkSupActive.Checked then
    ModSupplier.SUP_IS_ACTIVE := 1
  else
    ModSupplier.SUP_IS_ACTIVE := 0;

  if chkIsSOBlacklist.Checked then
    ModSupplier.IS_SO_BLACKLIST := 1
  else
    ModSupplier.IS_SO_BLACKLIST := 0;
  //simpan detail, tab supplier
  ModSupplier.SuplierMerchanGroups.Clear;  //kosongkan object list dulu

  CDSItems.First; //ke record pertama
  while not CDSItems.eof do //loop selama record masih ada
  begin
    lModSuppGroup := TModSuplierMerchanGroup.Create;
    lModSuppGroup.SetFromDataset(CDSItems);
    // kode diatas otomatis mengisi object dengan nilai yang ada di CDSItems

    //isi object list dengan lModSuppGroup
    ModSupplier.SuplierMerchanGroups.Add(lModSuppGroup);
    CDSItems.Next; //maju ke record berikutnya
  end;

  try
    DMClient.CrudSupplierClient.SaveToDB(ModSupplier);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    self.ModalResult:=mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  end;
end;

function TfrmDialogSupplier.UpdateDetail: Boolean;
//var
//  lItem: TModSuplierMerchanGroup;
begin
  if DisableUpdateDetail then
  begin
    Result := True;
    exit;
  end;
  Result := False;

  DisableUpdateDetail := True;
  Try

    if not ValidateDetail then
      exit;

    if IsUpdateSupplier then //jika user click grid
      CDSItems.Edit
    else begin
      if CDSItems.Locate('MERCHANDISE_GRUP',cxLookupMerchGroup.EditValue, []) then
      begin
        TAppUtils.Warning('Merchandise Group sudah ada di grid');
        exit;
      end;
      CDSItems.Append; //jika user klik tombol tambah
    end;


    //isikan property ke sini , contoh :
    //COBA START
    CDSItems.FieldByName('SUPMG_SUB_CODE').AsString     := edSubMgKode.Text;
    CDSItems.FieldByName('supmg_name').AsString         := edtSupName.Text;
    //COBA END
    CDSItems.FieldByName('MERCHANDISE_GRUP').AsString   := cxLookupMerchGroup.EditValue;
    CDSItems.FieldByName('TIPE_PEMBAYARAN').AsString    := cxLookupPaymentType.EditValue;
    CDSItems.FieldByName('SUPMG_CREDIT_LIMIT').AsFloat  := curedtCreditLmt.Value;
    CDSItems.FieldByName('SUPMG_DESCRIPTION').AsString  := edtExtdDesc.Text;
    CDSItems.FieldByName('SUPMG_TOP').AsString          := edtTermOP.Text;
    CDSItems.FieldByName('SUPMG_LEAD_TIME').AsString    := edtLeadTime.Text;
    CDSItems.FieldByName('SUPMG_FEE').AsString          := edtFee.Text;
    CDSItems.FieldByName('SUPMG_IS_FEE_4ALL').AsInteger :=  TAppUtils.BoolToInt(chkFee.Checked);
    CDSItems.FieldByName('TIPE_KIRIM_PO').AsString      := cxLookupPODeliver.EditValue;
  // bagian ini hanya display, bukan untuk input [START]
  // aktifkan kl mau dipakke input
  //  CDSItems.FieldByName('SUPMG_AP_ENDING_BALANCE').AsFloat   := curedtAPEndB.Value;
  //  CDSItems.FieldByName('SUPMG_CN_BALANCE').AsFloat          := curedtCNBln.Value;
  //  CDSItems.FieldByName('SUPMG_DISC').AsString               := edtDisc.Text;
  //  CDSItems.FieldByName('SUPMG_LAST_PURCHASE').AsDateTime    := dtLastPurchs.Date;
  //  CDSItems.FieldByName('SUPMG_LAST_PAYMENT').AsFloat        := curedtPaymnt.Value;
  //  CDSItems.FieldByName('SUPMG_OUTSTANDING_PAYMENT').AsFloat := curedtOutsdPaymnt.Value;
  //  CDSItems.FieldByName('SUPMG_NO_OF_PO').AsString           := edtNoOfPO.Text;
  // bagian ini hanya display, bukan untuk input [END]
    CDSItems.FieldByName('SUPMG_IS_ENABLE_CN').AsInteger := TAppUtils.BoolToInt(chkEnableCN.Checked);
    CDSItems.FieldByName('SUPMG_IS_MON').AsInteger := TAppUtils.BoolToInt(chkMon.Checked);
    CDSItems.FieldByName('SUPMG_IS_TUE').AsInteger := TAppUtils.BoolToInt(chkTue.Checked);
    CDSItems.FieldByName('SUPMG_IS_WED').AsInteger := TAppUtils.BoolToInt(chkWed.Checked);
    CDSItems.FieldByName('SUPMG_IS_THU').AsInteger := TAppUtils.BoolToInt(chkThu.Checked);
    CDSItems.FieldByName('SUPMG_IS_FRI').AsInteger := TAppUtils.BoolToInt(chkFri.Checked);
    CDSItems.FieldByName('SUPMG_IS_SAT').AsInteger := TAppUtils.BoolToInt(chkSat.Checked);
    CDSItems.FieldByName('SUPMG_IS_SUN').AsInteger := TAppUtils.BoolToInt(chkSun.Checked);
    CDSItems.FieldByName('SUPMG_IS_PKP').AsInteger := TAppUtils.BoolToInt(chkPKP.Checked);
    if not VarIsNull(cxLookupPPN.EditValue) then
      CDSItems.FieldByName('SUPMG_PAJAK').AsString := cxLookupPPN.EditValue;

  // tab sheet Alamat
    CDSItems.FieldByName('SUPMG_IS_DIF_CONTACT').AsInteger := TAppUtils.BoolToInt(chkIsDif.Checked);
    if chkIsDif.Checked then
    begin
      CDSItems.FieldByName('SUPMG_ADDRESS').AsString            := edtAddrMer.Text;
      CDSItems.FieldByName('SUPMG_CITY').AsString               := edtCityMer.Text;
      CDSItems.FieldByName('SUPMG_POST_CODE').AsString          := edtPostCodeMer.Text;
      CDSItems.FieldByName('SUPMG_TELP').AsString               := edtPhoneMer.Text;
      CDSItems.FieldByName('SUPMG_FAX').AsString                := edtFaxMer.Text;
      CDSItems.FieldByName('SUPMG_CONTACT_PERSON').AsString     := edtContactMer.Text;
      CDSItems.FieldByName('SUPMG_EMAIL').AsString              := edtEmailMer.Text;
      CDSItems.FieldByName('SUPMG_TITLE').AsString              := edtTitleMer.Text;
      if not VarIsNull(cxLookUpBankMer.EditValue) then
        CDSItems.FieldByName('BANK').AsString                     := cxLookUpBankMer.EditValue;
      CDSItems.FieldByName('SUPMG_BANK_ACCOUNT_NAME').AsString  := edtAccountNameMer.Text;
      CDSItems.FieldByName('SUPMG_BANK_ACCOUNT_NO').AsString    :=  edtAccountNoMer.Text;
    end;

    CDSItems.Post;

    Result := True;
  Finally
    DisableUpdateDetail := False;
  End;
end;

function TfrmDialogSupplier.ValidateDetail: Boolean;
begin
  Result := False;

//  if VarIsNull(cxLookupMerchGroup.EditValue) then
//  begin
//    TAppUtils.Warning('Kategori harus diisi');
//    exit;
//  end;

  if not Self.ValidateEmptyCtrl([1,2], True, tsMg) then
    exit;



  Result := True;
end;

end.
