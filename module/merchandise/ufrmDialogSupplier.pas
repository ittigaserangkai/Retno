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
  cxGroupBox, Datasnap.DBClient;

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
    lbSuppShortCut1: TLabel;
    btnDelSupp: TcxButton;
    btnAddSupp: TcxButton;
    btnUpdateSupp: TcxButton;
    cxGridSupplier: TcxGrid;
    cxGrdDBSupplierMerchan: TcxGridDBTableView;
    cxGridSupplierLevel1: TcxGridLevel;
    pgcMerchan: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    Label1: TLabel;
    Label10: TLabel;
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
    lbl27: TLabel;
    lbl28: TLabel;
    lbl29: TLabel;
    lbl33: TLabel;
    lbl34: TLabel;
    lbl35: TLabel;
    lbl37: TLabel;
    lbl45: TLabel;
    lbl9: TLabel;
    cbbBKP: TComboBox;
    cbbPpn: TComboBox;
    chkAllMer: TCheckBox;
    chkEnableCN: TCheckBox;
    chkFee: TCheckBox;
    curedtAPEndB: TcxCurrencyEdit;
    curedtCNBln: TcxCurrencyEdit;
    curedtCreditLmt: TcxCurrencyEdit;
    curedtOutsdPaymnt: TcxCurrencyEdit;
    curedtPaymnt: TcxCurrencyEdit;
    cxLookupPODeliver: TcxLookupComboBox;
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
    cxTabSheet2: TcxTabSheet;
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
    Label7: TLabel;
    Label8: TLabel;
    edtAddrMer: TcxTextEdit;
    edtCityMer: TcxTextEdit;
    edtPostCodeMer: TcxTextEdit;
    edtFaxMer: TcxTextEdit;
    edtPhoneMer: TcxTextEdit;
    edtContactMer: TcxTextEdit;
    edtTitleMer: TcxTextEdit;
    edtBankCodeMer: TcxTextEdit;
    edtBankAccNameMer: TcxTextEdit;
    edtBankAccNoMer: TcxTextEdit;
    chkIsDif: TCheckBox;
    cbpBankCodeMer: TcxButtonEdit;
    edtBankBranch: TcxTextEdit;
    edtBankAddrss: TcxTextEdit;
    cxGrdDBSupplierMerchanColumn1: TcxGridDBColumn;
    cxGrdDBSupplierMerchanColumn2: TcxGridDBColumn;
    cxLookupMerchGroup: TcxExtLookupComboBox;
    cxLookupPaymentType: TcxExtLookupComboBox;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnUpdateSuppClick(Sender: TObject);
    procedure btnAddSuppClick(Sender: TObject);
    procedure btnDelSuppClick(Sender: TObject);
    procedure cxGrdDBSupplierMerchanFocusedRecordChanged(Sender:
        TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord:
        TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);


  private
    FCDSItems: TClientDataSet;
    FModSupGrup: TModSuplierMerchanGroup;
    FModSupplier: TModSuplier;
    function GetCDSItems: TClientDataSet;
    function GetModSupplier: TModSuplier;
    procedure LoadDetail;
    procedure ShowDetail(AIDObject: Integer);
    procedure SimpanData;
    property CDSItems: TClientDataSet read GetCDSItems write FCDSItems;
    property ModSupGrup: TModSuplierMerchanGroup read FModSupGrup write FModSupGrup;
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
  FModSupGrup := nil;
  Self.ClearByTag([0,1], pgcMerchan);
end;

procedure TfrmDialogSupplier.btnDelSuppClick(Sender: TObject);
var
  idx: Integer;
  LModSup: TModSuplierMerchanGroup;
begin
  inherited;
  if not CDSItems.Eof then
  begin
    LModSup := TModSuplierMerchanGroup(CDSItems.FieldByName('ID').AsInteger);
    if assigned(LModSup) then
    begin
      idx := ModSupplier.SuplierMerchanGroups.IndexOf(LModSup);
      ModSupplier.SuplierMerchanGroups.Delete(idx);
      CDSItems.Delete;
    end;
  end;

end;

procedure TfrmDialogSupplier.btnUpdateSuppClick(Sender: TObject);
begin
  inherited;
  if not assigned(FModSupGrup) then
  begin
    FModSupGrup := TModSuplierMerchanGroup.Create;
    ModSupplier.SuplierMerchanGroups.Add(ModSupGrup);
  end;

  ModSupGrup.MERCHANDISE_GRUP := TModMerchandiseGroup.CreateID(cxLookupMerchGroup.EditValue);
  ModSupGrup.SUPMG_CREDIT_LIMIT := curedtCreditLmt.Value;


  LoadDetail;
end;

procedure TfrmDialogSupplier.cxGrdDBSupplierMerchanFocusedRecordChanged(Sender:
    TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord:
    TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  ShowDetail(CDSItems.FieldByName('ID').AsInteger);
end;

procedure TfrmDialogSupplier.FormCreate(Sender: TObject);
begin
  inherited;
  pc1.ActivePage := tsSupplier;
  Self.AssignKeyDownEvent;

  cxLookupMerchGroup.LoadFromDS(
    DMClient.DSProviderClient.MerchandiseGroup_GetDSLookup,
      'REF$MERCHANDISE_GRUP_ID','MERCHANGRUP_NAME',self
    );

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

  cxGrdDBSupplierMerchan.LoadFromCDS(CDSItems);
end;

procedure TfrmDialogSupplier.FormShow(Sender: TObject);
begin
  inherited;
  edtSupCode.SetFocus;
end;

function TfrmDialogSupplier.GetCDSItems: TClientDataSet;
begin
  if not assigned(FCDSItems) then
  begin
    FCDSItems := TClientDataSet.Create(self);
    FCDSItems.AddField('ID',ftInteger);
    FCDSItems.AddField('Nama',ftString);
    FCDSItems.CreateDataSet;
  end;
  Result := FCDSItems;
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

  LoadDetail;
end;

procedure TfrmDialogSupplier.LoadDetail;
var
  I: Integer;
  LSupMerchan: TModSuplierMerchanGroup;
begin
  if not Assigned(FModSupplier) then Exit;
  CDSItems.EmptyDataSet;
  for i := 0 to ModSupplier.SuplierMerchanGroups.Count-1 do
  begin
    LSupMerchan := ModSupplier.SuplierMerchanGroups[i];
    CDSItems.Append;
    CDSItems.FieldByName('ID').AsInteger := Integer(LSupMerchan);
    if cxLookupMerchGroup.DS.Locate('REF$MERCHANDISE_GRUP_ID',LSupMerchan.MERCHANDISE_GRUP.ID,[loCaseInsensitive]) then
      CDSItems.FieldByName('Nama').AsString := cxLookupMerchGroup.DS.FieldByName('MERCHANGRUP_NAME').AsString;
    CDSItems.Post;
  end;

end;

procedure TfrmDialogSupplier.ShowDetail(AIDObject: Integer);
begin
  if AIDObject = 0 then exit;
  ModSupGrup := TModSuplierMerchanGroup(AIDObject);
  cxLookupMerchGroup.EditValue := ModSupGrup.MERCHANDISE_GRUP.ID;
  curedtCreditLmt.Value := ModSupGrup.SUPMG_CREDIT_LIMIT;
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
