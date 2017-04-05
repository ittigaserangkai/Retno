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
    cxLookupMerchGroup: TcxExtLookupComboBox;
    cxLookupPaymentType: TcxExtLookupComboBox;
    clSupMerchanGroup: TcxGridDBColumn;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddSuppClick(Sender: TObject);
    procedure btnDelSuppClick(Sender: TObject);
    procedure cxGrdDBSupplierMerchanFocusedRecordChanged(Sender:
        TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord:
        TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure btnUpdateSuppClick(Sender: TObject);


  private
    FCDSItems: TClientDataSet;
    FIsUpdateSupplier: Boolean;
    FModSupplier: TModSuplier;
    function GetCDSItems: TClientDataSet;
    function GetModSupplier: TModSuplier;
    procedure InitLookup;
    procedure ShowDetail(AIDObject: String);
    procedure SimpanData;
    procedure UpdateDetail;
    property CDSItems: TClientDataSet read GetCDSItems write FCDSItems;
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
end;

procedure TfrmDialogSupplier.btnDelSuppClick(Sender: TObject);
begin
  inherited;
  if not CDSItems.Eof then
    CDSItems.Delete;
end;

procedure TfrmDialogSupplier.btnUpdateSuppClick(Sender: TObject);
begin
  inherited;
  UpdateDetail;
end;

procedure TfrmDialogSupplier.cxGrdDBSupplierMerchanFocusedRecordChanged(Sender:
    TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord:
    TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  if not CDSItems.eof then
    ShowDetail(CDSItems.FieldByName('ID').AsString);
end;

procedure TfrmDialogSupplier.FormCreate(Sender: TObject);
begin
  inherited;
  pc1.ActivePage := tsSupplier;
  Self.AssignKeyDownEvent;

  InitLookup;

  cxGrdDBSupplierMerchan.LoadFromCDS(CDSItems);
  IsUpdateSupplier := False;
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
    FCDSItems := TDBUtils.CreateObjectDataSet(TModSuplierMerchanGroup, Self)
//    FCDSItems := TClientDataSet.Create(self);
//    FCDSItems.AddField('ID',ftInteger);
//    FCDSItems.AddField('Nama',ftString);
//    FCDSItems.CreateDataSet;
  end;
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

//  TcxExtLookupComboBoxProperties(clSupMerchanGroup.Properties).LoadFromDS(
//    DMClient.DSProviderClient.MerchandiseGroup_GetDSLookup,
//    'REF$MERCHANDISE_GRUP_ID','MERCHANGRUP_NAME',
//    ['REF$MERCHANDISE_GRUP_ID','REF$MERCHANDISE_ID'],self
//  );

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

procedure TfrmDialogSupplier.LoadData(ID: String);
var
  i: Integer;
  lModSuppGroup: TModSuplierMerchanGroup;
begin
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

  //load detail

  CDSItems.EmptyDataSet;  //kosongkan grid
  for i := 0 to ModSupplier.SuplierMerchanGroups.Count-1 do
  begin
    CDSItems.Append;
    //ambil dari object list baris ke - i
    lModSuppGroup := ModSupplier.SuplierMerchanGroups[i];
    //isikan ke grid
    TDBUtils.UpdateToDataset(lModSuppGroup, CDSItems);
    CDSItems.Post;
  end;

end;

procedure TfrmDialogSupplier.ShowDetail(AIDObject: String);
begin
  if CDSItems.Eof then exit;  //exit jika tidak ada record yang dipilih

  //isi kan form dari CDSItems, contoh :

  cxLookupMerchGroup.EditValue := CDSItems.FieldByName('MERCHANDISE_GRUP').AsString;
  edtExtdDesc.EditValue := CDSItems.FieldByName('SUPMG_DESCRIPTION').AsString;
  curedtCreditLmt.Value := CDSItems.FieldByName('SUPMG_CREDIT_LIMIT').AsFloat;

  //....... lanjutkan

  IsUpdateSupplier := True;
end;

procedure TfrmDialogSupplier.SimpanData;
var
  lModSuppGroup: TModSuplierMerchanGroup;
begin
  if not ValidateEmptyCtrl then exit;

  //simpan header tab 1
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

  //simpan detail, tab supplier
  ModSupplier.SuplierMerchanGroups.Clear;  //kosongkan object list dulu

  CDSItems.First; //ke record pertama
  while not CDSItems.eof do //loop selama record masih ada
  begin
    lModSuppGroup := TModSuplierMerchanGroup.Create;
    TDBUtils.SetFromDataset(lModSuppGroup, CDSItems, False);
    // kode diatas otomatis mengisi object dengan nilai yang ada di CDSItems

    //isi object list dengan lModSuppGroup
    ModSupplier.SuplierMerchanGroups.Add(lModSuppGroup);
    CDSItems.Next; //maju ke record berikutnya
  end;

  try
    DMClient.CrudClient.SaveToDB(ModSupplier);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    self.ModalResult:=mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  end;
end;

procedure TfrmDialogSupplier.UpdateDetail;
begin
  if IsUpdateSupplier then //jika user click grid
    CDSItems.Edit
  else
    CDSItems.Append; //jika user klik tombol tambah

  //isikan property ke sini , contoh :
  CDSItems.FieldByName('MERCHANDISE_GRUP').AsString   := cxLookupMerchGroup.EditValue;
  CDSItems.FieldByName('SUPMG_CREDIT_LIMIT').AsFloat  := curedtCreditLmt.Value;
  CDSItems.FieldByName('SUPMG_DESCRIPTION').AsString  := edtExtdDesc.Text;
  // ..... lanjutkan

  CDSItems.Post;
end;

end.
