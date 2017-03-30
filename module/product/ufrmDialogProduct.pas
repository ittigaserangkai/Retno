unit ufrmDialogProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls,
  StdCtrls, uConn, uRetnoUnit, ActnList, System.Actions, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxCurrencyEdit, cxCheckBox, ufraFooterDialog3Button, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  cxSpinEdit, cxGroupBox, uModBank, uModBarang, uInterface, dxBarBuiltInMenu,
  cxPC;

type
  TFormMode = (fmAdd, fmEdit);


  TfrmDialogProduct = class(TfrmMasterDialog, ICrudAble)
    lbProductCode: TLabel;
    lbShortname: TLabel;
    lbProductname: TLabel;
    lbStockCS: TLabel;
    lbProductType: TLabel;
    lbUOMStock: TLabel;
    lbOutlet: TLabel;
    edtShortName: TcxTextEdit;
    edtProductName: TcxTextEdit;
    lbCatalog: TLabel;
    edtCatalog: TcxTextEdit;
    lbGroup: TLabel;
    lbDivision: TLabel;
    lbRefPajak: TLabel;
    lbLocation: TLabel;
    lbCategory: TLabel;
    lbSubCategory: TLabel;
    intedtCommonAllocation: TcxCurrencyEdit;
    lbAlloc1: TLabel;
    edtCommonUOM: TcxTextEdit;
    edtAsgrossUOM: TcxTextEdit;
    intedtAsgrossAllocation: TcxCurrencyEdit;
    lbAlloc2: TLabel;
    lbAlloc3: TLabel;
    intedtTraderAllocation: TcxCurrencyEdit;
    edtTraderUOM: TcxTextEdit;
    cbStock: TcxComboBox;
    cxLookupTipeBarang: TcxExtLookupComboBox;
    cxLookupSatuan: TcxExtLookupComboBox;
    cxLookupSatPurchase: TcxExtLookupComboBox;
    cxLookupOutlet: TcxExtLookupComboBox;
    cxLookupLocation: TcxExtLookupComboBox;
    cxLookupJenisPajak: TcxExtLookupComboBox;
    cxLookupMerchan: TcxExtLookupComboBox;
    cxLookupMerchanGroup: TcxExtLookupComboBox;
    cxLookupSubGroup: TcxExtLookupComboBox;
    cxLookupKategori: TcxExtLookupComboBox;
    lbProductGallon: TLabel;
    edtBrgGalong: TcxTextEdit;
    edtBrgNamaGalon: TcxTextEdit;
    lbSafetyStock: TLabel;
    lbl9: TLabel;
    cxLookupMerk: TcxExtLookupComboBox;
    lbHari: TLabel;
    edtProductCode: TcxTextEdit;
    gbPurchase: TcxGroupBox;
    lbPLUPurchase: TLabel;
    edtPLUPurchase: TcxTextEdit;
    edtProductPurchase: TcxTextEdit;
    lbUOMPurchase: TLabel;
    cxGroupBox2: TcxGroupBox;
    lbPKMAvg: TLabel;
    lbLastCost: TLabel;
    jvcuredtLastCost: TcxCurrencyEdit;
    edtAverageSls: TcxCurrencyEdit;
    edtAverageSlsUOM: TcxTextEdit;
    edtLastCOGSUOM: TcxTextEdit;
    lbl41: TLabel;
    gbOption: TcxGroupBox;
    cbTurunan: TcxCheckBox;
    cbActive: TcxCheckBox;
    cbisDecimal: TcxCheckBox;
    cbIsTaxInclude: TcxCheckBox;
    cbisDeposit: TcxCheckBox;
    chkIsDiscAMC: TcxCheckBox;
    chkIsBasic: TcxCheckBox;
    chkIsGalon: TcxCheckBox;
    edtSSBARANG: TcxSpinEdit;
    pgcMain: TcxPageControl;
    tsInfo: TcxTabSheet;
    tsSupplier: TcxTabSheet;
    tsSellingPrice: TcxTabSheet;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxLookupMerchanPropertiesEditValueChanged(Sender: TObject);
    procedure cxLookupMerchanGroupPropertiesEditValueChanged(Sender: TObject);
    procedure cxLookupSubGroupPropertiesEditValueChanged(Sender: TObject);
    procedure cxLookupMerkPropertiesEditValueChanged(Sender: TObject);
    procedure edtProductNamePropertiesEditValueChanged(Sender: TObject);
  private
    FModBarang: TModBarang;
    procedure ClearForm;
    procedure FilterOtherLookup(Src, Dst: TcxExtLookupComboBox);
    function GetModBarang: TModBarang;
    procedure InitLookup;
    procedure SaveData;
    procedure UpdateData;
    function ValidateData: Boolean;
    property ModBarang: TModBarang read GetModBarang write FModBarang;
  public
    procedure LoadData(AID: String);
    { Public declarations }
  published
  end;

var
  frmDialogProduct: TfrmDialogProduct;

implementation

uses
  uDXUtils, uDMClient,  uModSatuan, uAppUtils, uConstanta, ufrmDialogMerk,
  uModOutlet, uModRefPajak, uModSuplier;

{$R *.dfm}

procedure TfrmDialogProduct.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm(CONF_VALIDATE_FOR_DELETE) then exit;
  Try
    DMClient.CrudClient.DeleteFromDB(ModBarang);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.ModalResult := mrOk;
  except
    TAppUtils.Error(ER_DELETE_FAILED);
    raise;
  End;
end;

procedure TfrmDialogProduct.actSaveExecute(Sender: TObject);
begin
  inherited;
  SaveData;
end;

procedure TfrmDialogProduct.ClearForm;
begin
  ClearByTag([0,1]);
  cbStock.ItemIndex := 0;
  cxLookupTipeBarang.SetDefaultValue;
  cxLookupSatuan.SetDefaultValue;
  cxLookupOutlet.SetDefaultValue;
  cxLookupMerchan.SetDefaultValue;
  cxLookupMerchanGroup.SetDefaultValue;
  cxLookupKategori.SetDefaultValue;
  cxLookupLocation.SetDefaultValue;
  cxLookupJenisPajak.SetDefaultValue;
  cxLookupMerk.SetDefaultValue;
  Application.ProcessMessages; //--> need this
    //...  to prevent cxLookupMerk send Tab when focus position in TabOrder : 0
  SelectFirst;
end;

procedure TfrmDialogProduct.cxLookupMerchanGroupPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  FilterOtherLookup(cxLookupMerchanGroup, cxLookupSubGroup);
end;

procedure TfrmDialogProduct.cxLookupMerchanPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  FilterOtherLookup(cxLookupMerchan, cxLookupMerchanGroup);
end;

procedure TfrmDialogProduct.cxLookupMerkPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  edtShortName.Text := cxLookupMerk.Text + ' ' + edtProductName.Text;
  Self.OnEditValueChanged(cxLookupMerk);
end;

procedure TfrmDialogProduct.cxLookupSubGroupPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  FilterOtherLookup(cxLookupSubGroup, cxLookupKategori);
end;

procedure TfrmDialogProduct.edtProductNamePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  edtShortName.Text := cxLookupMerk.Text + ' ' + edtProductName.Text;
end;

procedure TfrmDialogProduct.FilterOtherLookup(Src, Dst: TcxExtLookupComboBox);
var
  KeyField: string;
begin
  inherited;
  with Dst.CDS do
  begin
    KeyField := Src.Properties.KeyFieldNames;
    Filter := '[' + KeyField + '] = '
      + QuotedStr(Src.DS.FieldByName(KeyField).AsString);
    Filtered := True;
  end;
  Dst.SetDefaultValue();

  //ini dipasang di onEditValueChanged,
  //yang apabila dipasang di lookup jenis generic (setMultiPurposeLookup)
  //harusny enternya 2 kali baru pindah fokus
  //nah ngepasin saja ada trigger Dst.SetDefaultValue yang EditValueChanged
  //dan destiniasi terakhir di cxlookupKategori, diaman OnEditValueChanged nil (di isi runtime)
  //jadi pas malahan
  // ....... solusi lain misal cxlookupkategori ada onEditValueChanged,
  //........tambahkan TForm.OnEditValueChanged(cxLookupKategori)
end;

procedure TfrmDialogProduct.FormCreate(Sender: TObject);
begin
  inherited;
  InitLookup;
  AssignKeyDownEvent;
  ClearForm;
end;

procedure TfrmDialogProduct.FormShow(Sender: TObject);
begin
  inherited;
  edtProductCode.SetFocus;
end;

function TfrmDialogProduct.GetModBarang: TModBarang;
begin
  if not Assigned(FModBarang) then
    FModBarang := TModBarang.Create;
  Result := FModBarang;
end;

procedure TfrmDialogProduct.InitLookup;
begin
  With DMClient.DSProviderClient do
  begin
    cxLookupTipeBarang.LoadFromDS(RefTipeBarang_GetDSLookup,
      'REF$TIPE_BARANG_ID', 'TPBRG_NAME', ['REF$TIPE_BARANG_ID'], Self );
    cxLookupSatuan.LoadFromDS(Satuan_GetDSLookup,
      'ref$satuan_id', 'SAT_NAME', ['ref$satuan_id'], Self);
    cxLookupSatPurchase.LoadFromDS(Satuan_GetDSLookup,
      'ref$satuan_id', 'SAT_NAME', ['ref$satuan_id'], Self);
    cxLookupOutlet.LoadFromDS(Outlet_GetDSLookup,
      'REF$OUTLET_ID', 'OUTLET_NAME', ['REF$OUTLET_ID'], Self);
    cxLookupMerchan.LoadFromDS(Merchandise_GetDSLookup,
      'REF$MERCHANDISE_ID','MERCHAN_NAME' ,['REF$MERCHANDISE_ID'], Self);
    cxLookupMerchanGroup.LoadFromDS(MerchandiseGroup_GetDSLookup,
      'REF$MERCHANDISE_GRUP_ID','MERCHANGRUP_NAME' ,
      ['REF$MERCHANDISE_GRUP_ID','REF$MERCHANDISE_ID'], Self);
    cxLookupSubGroup.LoadFromDS(SubGroup_GetDSLookup,
      'REF$SUB_GRUP_ID','SUBGRUP_NAME' ,
      ['REF$MERCHANDISE_GRUP_ID','REF$SUB_GRUP_ID'], Self);
    cxLookupKategori.LoadFromDS(Kategori_GetDSLookup,
      'REF$KATEGORI_ID','KAT_NAME' ,
      ['REF$KATEGORI_ID','REF$SUB_GRUP_ID'], Self);
    cxLookupLocation.LoadFromDS(Lokasi_GetDSLookup,
      'REF$LOKASI_ID', 'LOK_NAME', ['REF$LOKASI_ID'], Self);
    cxLookupJenisPajak.LoadFromDS(RefPajak_GetDSLookup,
      'REF$PAJAK_ID', 'PJK_NAME' , ['REF$PAJAK_ID'], Self);
    cxLookupMerk.LoadFromDS(Merk_GetDSLookUp,
      'MERK_ID', 'MERK_NAME' , ['MERK_ID'], Self);

    cxLookupMerchan.SetMultiPurposeLookup;
    cxLookupMerchanGroup.SetMultiPurposeLookup;
    cxLookupSubGroup.SetMultiPurposeLookup;
    cxLookupKategori.SetMultiPurposeLookup;
    cxLookupMerk.SetMultiPurposeLookup;
  end;
  //inisialisasi
end;

procedure TfrmDialogProduct.SaveData;
begin
  if not ValidateData then exit;
  UpdateData;
  Try
    ModBarang.ID := DMClient.CrudClient.SaveToDBID(ModBarang);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    Self.ModalResult := mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  End;
end;

procedure TfrmDialogProduct.UpdateData;
begin
  ModBarang.BRG_CODE            := edtProductCode.Text;
  ModBarang.BRG_NAME            := edtProductName.Text;
  ModBarang.BRG_CODE_PURCHASE   := edtPLUPurchase.Text;
  ModBarang.BRG_NAME_PURCHASE   := edtProductPurchase.Text;
  ModBarang.BRG_CATALOG         := edtCatalog.Text;
  ModBarang.BRG_ALIAS           := edtShortName.Text;
  ModBarang.Merk                := TModMerk.CreateID(cxLookupMerk.EditValue);

  ModBarang.SAFETY_STOCK        := edtSSBARANG.Value;
  ModBarang.TipeBarang          := TModTipeBarang.CreateID(cxLookupTipeBarang.EditValue);
  ModBarang.SATUAN_STOCK        := TModSatuan.CreateID(cxLookupSatuan.EditValue);
  ModBarang.SATUAN_PURCHASE     := TModSatuan.CreateID(cxLookupSatPurchase.EditValue);
  ModBarang.Outlet              := TModOutlet.CreateID(cxLookupOutlet.EditValue);
  ModBarang.Lokasi              := TModlokasi.CreateID(cxLookupLocation.EditValue);
  ModBarang.Merchandise         := TModMerchandise.CreateID(cxLookupMerchan.EditValue);
  ModBarang.MerchandiseGroup    := TModMerchandiseGroup.CreateID(cxLookupMerchanGroup.EditValue);
  ModBarang.Kategori            := TModKategori.CreateID(cxLookupKategori.EditValue);
  ModBarang.RefPajak            := TModRefPajak.CreateID(cxLookupJenisPajak.EditValue);
  ModBarang.BRG_IS_CS           := TAppUtils.BoolToInt(cbStock.ItemIndex=1);
  ModBarang.BRG_IS_STOCK        := TAppUtils.BoolToInt(cbStock.ItemIndex=0);

  ModBarang.BRG_IS_ACTIVE       := TAppUtils.BoolToInt(cbActive.Checked);
  ModBarang.BRG_IS_BASIC        := TAppUtils.BoolToInt(chkIsBasic.Checked);
  ModBarang.BRG_IS_DECIMAL      := TAppUtils.BoolToInt(cbisDecimal.Checked);
  ModBarang.BRG_IS_PJK_INCLUDE  := TAppUtils.BoolToInt(cbIsTaxInclude.Checked);
  ModBarang.BRG_IS_DEPOSIT      := TAppUtils.BoolToInt(cbisDeposit.Checked);
//  ModBarang.BRG_IS_BUILD        := TAppUtils.BoolToInt(chkIsBasic.Checked);
  ModBarang.BRG_IS_DISC_GMC     := TAppUtils.BoolToInt(chkIsDiscAMC.Checked);
  ModBarang.BRG_IS_GALON        := TAppUtils.BoolToInt(chkIsGalon.Checked);
//  ModBarang.BRG_IS_VALIDATE     := TAppUtils.BoolToInt(chkIsBasic.Checked);

end;

procedure TfrmDialogProduct.LoadData(AID: String);
begin
  If Assigned(FModBarang) then FModBarang.Free;
  FModBarang := DMClient.CrudClient.Retrieve(TModBarang.ClassName, aID) as TModBarang;
  edtProductCode.Text             := ModBarang.BRG_CODE;
  edtProductName.Text             := ModBarang.BRG_NAME;
  edtPLUPurchase.Text             := ModBarang.BRG_CODE_PURCHASE;
  edtProductPurchase.Text         := ModBarang.BRG_NAME_PURCHASE;
  edtCatalog.Text                 := ModBarang.BRG_CATALOG;
  edtShortName.Text               := ModBarang.BRG_ALIAS;
  edtSSBARANG.Value               := ModBarang.SAFETY_STOCK;
  cxLookupMerk.EditValue          := ModBarang.Merk.ID;
  cxLookupTipeBarang.EditValue    := ModBarang.TipeBarang.ID;
  cxLookupSatuan.EditValue        := ModBarang.SATUAN_STOCK.ID;
  cxLookupSatPurchase.EditValue   := ModBarang.SATUAN_PURCHASE.ID;
  cxLookupOutlet.EditValue        := ModBarang.Outlet.ID;
  cxLookupLocation.EditValue      := ModBarang.Lokasi.ID;
  cxLookupMerchan.EditValue       := ModBarang.Merchandise.ID;
  cxLookupMerchanGroup.EditValue  := ModBarang.MerchandiseGroup.ID;
  cxLookupKategori.EditValue      := ModBarang.Kategori.ID;
  cxLookupJenisPajak.EditValue    := ModBarang.RefPajak.ID;
  cbStock.ItemIndex               := ModBarang.BRG_IS_CS;
  cbActive.Checked                := ModBarang.BRG_IS_ACTIVE = 1;
  chkIsBasic.Checked              := ModBarang.BRG_IS_BASIC = 1;
  cbisDecimal.Checked             := ModBarang.BRG_IS_DECIMAL = 1;
  cbIsTaxInclude.Checked          := ModBarang.BRG_IS_PJK_INCLUDE = 1;
  cbisDeposit.Checked             := ModBarang.BRG_IS_DEPOSIT = 1;
  chkIsDiscAMC.Checked            := ModBarang.BRG_IS_DISC_GMC = 1;
  chkIsGalon.Checked              := ModBarang.BRG_IS_GALON = 1;
end;

function TfrmDialogProduct.ValidateData: Boolean;
begin
  Result := False;
  If not ValidateEmptyCtrl([1]) then exit;
  Result := True;
end;


end.
