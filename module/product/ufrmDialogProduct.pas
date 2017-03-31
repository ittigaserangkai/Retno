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
  cxPC, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxSplitter,
  cxHyperLinkEdit, Vcl.Menus, cxButtons, Datasnap.DBClient;

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
    gbSupplier: TcxGroupBox;
    gbSupplierGrid: TcxGroupBox;
    pnlGridSupplierBtn: TcxGroupBox;
    cxGridSupplier: TcxGrid;
    cxGrdDBSupplier: TcxGridDBTableView;
    cxGridSupplierLevel1: TcxGridLevel;
    cxLookupSupplier: TcxExtLookupComboBox;
    lbSupplier: TLabel;
    spTOP: TcxSpinEdit;
    lbDays1: TLabel;
    lbTOP: TLabel;
    spExpiredTime: TcxSpinEdit;
    lbDays2: TLabel;
    spDelivery: TcxSpinEdit;
    lbDays3: TLabel;
    Label6: TLabel;
    cxLookupBRSUom: TcxExtLookupComboBox;
    crStockInOrder: TcxCurrencyEdit;
    Label7: TLabel;
    lbExpiredDate: TLabel;
    lbDeliveryTime: TLabel;
    crMinOrder: TcxCurrencyEdit;
    crMaxOrder: TcxCurrencyEdit;
    Label10: TLabel;
    gbSuppOption: TcxGroupBox;
    ckActive: TcxCheckBox;
    ckPrimer: TcxCheckBox;
    ckBKP: TcxCheckBox;
    ckEnableCN: TcxCheckBox;
    lbSellingPrice: TLabel;
    crBRSSellingPrice: TcxCurrencyEdit;
    lbPurchasePrice: TLabel;
    crBRSPurchasePrice: TcxCurrencyEdit;
    lbDisc1: TLabel;
    crBRSDisc1: TcxCurrencyEdit;
    Label15: TLabel;
    Label16: TLabel;
    crBRSDisc2: TcxCurrencyEdit;
    lbDisc2: TLabel;
    lbDisc3: TLabel;
    crBRSDisc3: TcxCurrencyEdit;
    lbPurchaseNet: TLabel;
    crPurchaseNet: TcxCurrencyEdit;
    lbMargin: TLabel;
    crBRSMargin: TcxCurrencyEdit;
    Label21: TLabel;
    clSuppSupplier: TcxGridDBColumn;
    clSuppPurchasePrice: TcxGridDBColumn;
    clSuppDisc1: TcxGridDBColumn;
    clSuppDisc2: TcxGridDBColumn;
    clSuppDisc3: TcxGridDBColumn;
    clSuppPriceNet: TcxGridDBColumn;
    clSuppMargin: TcxGridDBColumn;
    clSuppActive: TcxGridDBColumn;
    clSuppPrimer: TcxGridDBColumn;
    btnDelSupp: TcxButton;
    btnAddSupp: TcxButton;
    btnUpdateSupp: TcxButton;
    lbSuppShortCut1: TLabel;
    Label1: TLabel;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxLookupMerchanPropertiesEditValueChanged(Sender: TObject);
    procedure cxLookupMerchanGroupPropertiesEditValueChanged(Sender: TObject);
    procedure cxLookupSubGroupPropertiesEditValueChanged(Sender: TObject);
    procedure cxLookupMerkPropertiesEditValueChanged(Sender: TObject);
    procedure edtProductNamePropertiesEditValueChanged(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnUpdateSuppClick(Sender: TObject);
    procedure btnDelSuppClick(Sender: TObject);
    procedure ckEnableCNKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAddSuppClick(Sender: TObject);
    procedure cxGrdDBSupplierCellClick(Sender: TcxCustomGridTableView;
        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
        TShiftState; var AHandled: Boolean);
    procedure pgcMainChange(Sender: TObject);
  private
    FCDSSupp: TClientDataset;
    FModBarang: TModBarang;
    procedure AddSupplier;
    procedure LoadSupplierRow;
    procedure ClearForm;
    procedure ClearSupplier;
    procedure FilterOtherLookup(Src, Dst: TcxExtLookupComboBox);
    function GetCDSSupp: TClientDataset;
    function GetModBarang: TModBarang;
    procedure InitGrid;
    procedure InitLookup;
    procedure LoadSupplier;
    procedure SaveData;
    procedure UpdateData;
    procedure UpdateDataSupplier;
    function ValidateData: Boolean;
    property CDSSupp: TClientDataset read GetCDSSupp write FCDSSupp;
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
  uModOutlet, uModRefPajak, uModSuplier, uDBUtils;

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

procedure TfrmDialogProduct.AddSupplier;
begin
  if not ValidateEmptyCtrl([1], True, gbSupplier) then exit;

  if CDSSupp.Locate('SupplierID', cxLookupSupplier.EditValue, [loCaseInsensitive]) then
    CDSSupp.Edit
  else
    CDSSupp.Append;
  CDSSupp.FieldByName('SupplierID').AsString := cxLookupSupplier.EditValue;
  CDSSupp.FieldByName('SupplierName').AsString := cxLookupSupplier.Text;
  CDSSupp.FieldByName('TOP').AsInteger := spTOP.Value;
  CDSSupp.FieldByName('ExpiredTime').AsInteger := spExpiredTime.Value;
  CDSSupp.FieldByName('DeliveryTime').AsInteger := spDelivery.Value;
  CDSSupp.FieldByName('UOM').AsString := cxLookupBRSUom.EditValue;
  CDSSupp.FieldByName('StockInOrder').AsFloat := crStockInOrder.Value;
  CDSSupp.FieldByName('IsBKP').AsInteger := TAppUtils.BoolToInt(ckBKP.Checked);
  CDSSupp.FieldByName('IsPrimer').AsInteger := TAppUtils.BoolToInt(ckPrimer.Checked);
  CDSSupp.FieldByName('EnableCN').AsInteger := TAppUtils.BoolToInt(ckEnableCN.Checked);
  CDSSupp.FieldByName('Active').AsInteger := TAppUtils.BoolToInt(ckActive.Checked);
  CDSSupp.FieldByName('SellingPrice').AsFloat := crBRSSellingPrice.Value;
  CDSSupp.FieldByName('PurchasePrice').AsFloat := crBRSPurchasePrice.Value;
  CDSSupp.FieldByName('Disc1').AsFloat := crBRSDisc1.Value;
  CDSSupp.FieldByName('Disc2').AsFloat := crBRSDisc2.Value;
  CDSSupp.FieldByName('Disc3').AsFloat := crBRSDisc3.Value;
  CDSSupp.FieldByName('PurchaseNet').AsFloat := crPurchaseNet.Value;
  CDSSupp.FieldByName('Margin').AsFloat := crBRSMargin.Value;
  CDSSupp.FieldByName('MinOrder').AsFloat := crMinOrder.Value;
  CDSSupp.FieldByName('MaxOrder').AsFloat := crMaxOrder.Value;
  CDSSupp.Post;

  cxGrdDBSupplier.ApplyBestFit;
  btnAddSupp.Click;
end;

procedure TfrmDialogProduct.LoadSupplierRow;
begin
  if CDSSupp.Eof then exit;

  cxLookupSupplier.EditValue  := CDSSupp.FieldByName('SupplierID').AsString;
  spTOP.Value                 := CDSSupp.FieldByName('TOP').AsInteger;
  spExpiredTime.Value         := CDSSupp.FieldByName('ExpiredTime').AsInteger;
  spDelivery.Value            := CDSSupp.FieldByName('DeliveryTime').AsInteger;
  cxLookupBRSUom.EditValue    := CDSSupp.FieldByName('UOM').AsString;
  crStockInOrder.Value        := CDSSupp.FieldByName('StockInOrder').AsFloat;
  ckBKP.Checked               := CDSSupp.FieldByName('IsBKP').AsInteger = 1;
  ckPrimer.Checked            := CDSSupp.FieldByName('IsPrimer').AsInteger = 1;
  ckEnableCN.Checked          := CDSSupp.FieldByName('EnableCN').AsInteger = 1;
  ckActive.Checked            := CDSSupp.FieldByName('Active').AsInteger = 1;
  crBRSSellingPrice.Value     := CDSSupp.FieldByName('SellingPrice').AsFloat;
  crBRSPurchasePrice.Value    := CDSSupp.FieldByName('PurchasePrice').AsFloat;
  crBRSDisc1.Value            := CDSSupp.FieldByName('Disc1').AsFloat;
  crBRSDisc2.Value            := CDSSupp.FieldByName('Disc2').AsFloat;
  crBRSDisc3.Value            := CDSSupp.FieldByName('Disc3').AsFloat;
  crPurchaseNet.Value         := CDSSupp.FieldByName('PurchaseNet').AsFloat;
  crBRSMargin.Value           := CDSSupp.FieldByName('Margin').AsFloat;
  crMinOrder.Value            := CDSSupp.FieldByName('MinOrder').AsFloat;
  crMaxOrder.Value            := CDSSupp.FieldByName('MaxOrder').AsFloat;

end;

procedure TfrmDialogProduct.btnAddSuppClick(Sender: TObject);
begin
  inherited;
  ClearSupplier;
  Application.ProcessMessages;
  cxLookupSupplier.SetFocus;
end;

procedure TfrmDialogProduct.btnDelSuppClick(Sender: TObject);
begin
  inherited;
  if CDSSupp.Eof then exit;
  CDSSupp.Delete;
end;

procedure TfrmDialogProduct.ClearForm;
begin
  ClearByTag([0,1]);
  ClearSupplier;
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

procedure TfrmDialogProduct.btnUpdateSuppClick(Sender: TObject);
begin
  inherited;
//  showmessage(BoolToStr(CheckControlParent(cxLookupSupplier, tsSupplier)));
  AddSupplier;
end;

procedure TfrmDialogProduct.ckEnableCNKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  inherited;
  If Key = VK_RETURN then
    btnUpdateSupp.SetFocus;
end;

procedure TfrmDialogProduct.ClearSupplier;
begin
  ClearByTag([0,1], gbSupplier);
  ckPrimer.Checked := True;
  ckActive.Checked := True;
  ckBKP.Checked := True;
  ckEnableCN.Checked := True;
end;

procedure TfrmDialogProduct.cxGrdDBSupplierCellClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  LoadSupplierRow;
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
  pgcMain.ActivePage := tsInfo;
  InitLookup;
  InitGrid;
  AssignKeyDownEvent;
  ClearForm;
end;

procedure TfrmDialogProduct.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  case Key of
    VK_F1 : pgcMain.ActivePage := tsInfo;
    VK_F2 : pgcMain.ActivePage := tsSupplier;
    VK_F3 : pgcMain.ActivePage := tsSellingPrice;
  end;
end;

procedure TfrmDialogProduct.FormShow(Sender: TObject);
begin
  inherited;
  edtProductCode.SetFocus;
end;

function TfrmDialogProduct.GetCDSSupp: TClientDataset;
begin
  if not Assigned(FCDSSupp) then
  begin
    FCDSSupp := TClientDataSet.Create(Self);
    FCDSSupp.AddField('ID', ftString);
    FCDSSupp.AddField('SupplierID', ftString);
    FCDSSupp.AddField('SupplierName', ftString);
    FCDSSupp.AddField('TOP', ftInteger);
    FCDSSupp.AddField('ExpiredTime', ftInteger);
    FCDSSupp.AddField('DeliveryTime', ftInteger);
    FCDSSupp.AddField('UOM', ftString);
    FCDSSupp.AddField('StockInOrder', ftFloat);
    FCDSSupp.AddField('IsBKP', ftInteger);
    FCDSSupp.AddField('IsPrimer', ftInteger);
    FCDSSupp.AddField('EnableCN', ftInteger);
    FCDSSupp.AddField('Active', ftInteger);
    FCDSSupp.AddField('SellingPrice', ftFloat);
    FCDSSupp.AddField('PurchasePrice', ftFloat);
    FCDSSupp.AddField('Disc1', ftFloat);
    FCDSSupp.AddField('Disc2', ftFloat);
    FCDSSupp.AddField('Disc3', ftFloat);
    FCDSSupp.AddField('PurchaseNet', ftFloat);
    FCDSSupp.AddField('Margin', ftFloat);
    FCDSSupp.AddField('MinOrder', ftFloat);
    FCDSSupp.AddField('MaxOrder', ftFloat);
    FCDSSupp.CreateDataSet;
  end;
  Result := FCDSSupp;
end;

function TfrmDialogProduct.GetModBarang: TModBarang;
begin
  if not Assigned(FModBarang) then
    FModBarang := TModBarang.Create;
  Result := FModBarang;
end;

procedure TfrmDialogProduct.InitGrid;
begin
  cxGrdDBSupplier.LoadFromCDS(CDSSupp, False);
end;

procedure TfrmDialogProduct.InitLookup;
//var
//  lDS: TDataSet;
begin
  With DMClient.DSProviderClient do
  begin
    cxLookupTipeBarang.LoadFromDS(RefTipeBarang_GetDSLookup,
      'REF$TIPE_BARANG_ID', 'TPBRG_NAME',  Self );

    cxLookupOutlet.LoadFromDS(Outlet_GetDSLookup,
      'REF$OUTLET_ID', 'OUTLET_NAME', Self);
    cxLookupMerchan.LoadFromDS(Merchandise_GetDSLookup,
      'REF$MERCHANDISE_ID','MERCHAN_NAME' ,Self);
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
      'REF$LOKASI_ID', 'LOK_NAME', Self);
    cxLookupJenisPajak.LoadFromDS(RefPajak_GetDSLookup,
      'REF$PAJAK_ID', 'PJK_NAME' ,Self);
    cxLookupMerk.LoadFromDS(Merk_GetDSLookUp,'MERK_ID', 'MERK_NAME' , Self);
    cxLookupSupplier.LoadFromDS(Suplier_GetDSLookup,
      'SUPLIER_ID','SUP_NAME', ['SUPLIER_ID'], Self);
    cxLookupSupplier.SetMultiPurposeLookup;
    cxLookupMerchan.SetMultiPurposeLookup;
    cxLookupMerchanGroup.SetMultiPurposeLookup;
    cxLookupSubGroup.SetMultiPurposeLookup;
    cxLookupKategori.SetMultiPurposeLookup;
    cxLookupMerk.SetMultiPurposeLookup;

    cxLookupSatuan.LoadFromDS(Satuan_GetDSLookup,'ref$satuan_id', 'SAT_CODE', Self);
    cxLookupSatPurchase.LoadFromDS(Satuan_GetDSLookup,'ref$satuan_id', 'SAT_CODE', Self);
    cxLookupBRSUom.LoadFromDS(Satuan_GetDSLookup,'ref$satuan_id', 'SAT_CODE', Self);

    //meh optimasi , bisa g 1 dataset utk bbrp provider
//    lDS := Satuan_GetDSLookup;
//    Try
//      cxLookupSatuan.LoadFromDS(TDBUtils.DSToCDS(lDS, Self, False),
//      'ref$satuan_id', 'SAT_NAME', Self);
//      cxLookupSatPurchase.LoadFromDS(TDBUtils.DSToCDS(lDS, Self, False),
//        'ref$satuan_id', 'SAT_NAME', Self);
//      cxLookupBRSUom.LoadFromDS(TDBUtils.DSToCDS(lDS, Self, False),
//        'ref$satuan_id', 'SAT_NAME', Self);
//    Finally
//      lDS.Free;
//    End;
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

  UpdateDataSupplier;

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

  LoadSupplier;
end;

procedure TfrmDialogProduct.LoadSupplier;
var
  i: Integer;
  lBS: TModBarangSupplier;
begin
  for i := 0 to ModBarang.Suppliers.Count-1 do
  begin
    lBS := ModBarang.Suppliers[i];
    CDSSupp.Append;
    CDSSupp.FieldByName('ID').AsString            := lBS.ID;
    CDSSupp.FieldByName('SupplierID').AsString    := lBS.Supplier.ID;
    If cxLookupSupplier.DS.Locate('Suplier_ID', lBS.Supplier.ID, [loCaseInsensitive]) then
      CDSSupp.FieldByName('SupplierName').AsString  := cxLookupSupplier.DS.FieldByName('SUP_NAME').AsString;
//    CDSSupp.FieldByName('TOP').AsInteger          := lBS.Supplier.TOP;
    CDSSupp.FieldByName('ExpiredTime').AsInteger  := lBS.BRGSUP_EXPIRE_TIME;
    CDSSupp.FieldByName('DeliveryTime').AsInteger := lBS.BRGSUP_DELIVERY_TIME;
    CDSSupp.FieldByName('UOM').AsString           := lBS.SATUAN_PURCHASE.ID;
    CDSSupp.FieldByName('StockInOrder').AsFloat   := lBS.BRGSUP_STOCK_IN_ORDER;
    CDSSupp.FieldByName('IsBKP').AsInteger        := lBS.BRGSUP_IS_BKP;
    CDSSupp.FieldByName('IsPrimer').AsInteger     := lBS.BRGSUP_IS_PRIMARY;
    CDSSupp.FieldByName('EnableCN').AsInteger     := lBS.BRGSUP_IS_ENABLE_CN;
    CDSSupp.FieldByName('Active').AsInteger       := lBS.BRGSUP_IS_ACTIVE;
    CDSSupp.FieldByName('PurchasePrice').AsFloat  := lBS.BRGSUP_BUY_PRICE;
    CDSSupp.FieldByName('Disc1').AsFloat          := lBS.BRGSUP_DISC1;
    CDSSupp.FieldByName('Disc2').AsFloat          := lBS.BRGSUP_DISC2;
    CDSSupp.FieldByName('Disc3').AsFloat          := lBS.BRGSUP_DISC3;
    CDSSupp.FieldByName('Margin').AsFloat         := lBS.BRGSUP_MARK_UP;

    //hitung dari margin nanti :
//    CDSSupp.FieldByName('SellingPrice').AsFloat   := lBS.BRGSUP_BUY_PRICE;
//    CDSSupp.FieldByName('PurchaseNet').AsFloat    := lBS.BRGSUP_EXPIRE_TIME;
    CDSSupp.Post;
  end;

  CDSSupp.First;
  LoadSupplierRow;
end;

procedure TfrmDialogProduct.pgcMainChange(Sender: TObject);
begin
  inherited;
  If pgcMain.ActivePage = tsSupplier then
    cxLookupSupplier.SetFocus;
end;

procedure TfrmDialogProduct.UpdateDataSupplier;
var
  i: Integer;
  lBS: TModBarangSupplier;
begin
  ModBarang.Suppliers.Clear;
  CDSSupp.First;
  while not CDSSupp.eof do
  begin
    lBS                       := TModBarangSupplier.CreateID(CDSSupp.FieldByName('ID').AsString);
    lBS.Supplier              := TModSuplier.CreateID(CDSSupp.FieldByName('SupplierID').AsString);
    lBS.SATUAN_PURCHASE       := TModSatuan.CreateID(CDSSupp.FieldByName('UOM').AsString);

    lBS.BRGSUP_BUY_PRICE      := CDSSupp.FieldByName('PurchasePrice').AsFloat;
    lBS.BRGSUP_DISC1          := CDSSupp.FieldByName('Disc1').AsFloat;
    lBS.BRGSUP_DISC2          := CDSSupp.FieldByName('Disc2').AsFloat;
    lBS.BRGSUP_DISC3          := CDSSupp.FieldByName('Disc3').AsFloat;
    lBS.BRGSUP_MARK_UP        := CDSSupp.FieldByName('Margin').AsFloat;

    lBS.BRGSUP_EXPIRE_TIME    := CDSSupp.FieldByName('ExpiredTime').AsInteger;
    lBS.BRGSUP_DELIVERY_TIME  := CDSSupp.FieldByName('DeliveryTime').AsInteger;

    lBS.BRGSUP_STOCK_IN_ORDER := CDSSupp.FieldByName('StockInOrder').AsFloat;
    lBS.BRGSUP_MIN_ORDER      := CDSSupp.FieldByName('MinOrder').AsFloat;
    lBS.BRGSUP_MAX_ORDER      := CDSSupp.FieldByName('MaxOrder').AsFloat;

    lBS.BRGSUP_IS_PRIMARY     := CDSSupp.FieldByName('IsPrimer').AsInteger;
    lBS.BRGSUP_IS_ACTIVE      := CDSSupp.FieldByName('Active').AsInteger;
    lBS.BRGSUP_IS_ENABLE_CN   := CDSSupp.FieldByName('EnableCN').AsInteger;
    lBS.BRGSUP_IS_BKP         := CDSSupp.FieldByName('IsBKP').AsInteger;



    ModBarang.Suppliers.Add(lBS);
    CDSSupp.Next;
  end;
end;

function TfrmDialogProduct.ValidateData: Boolean;
begin
  Result := False;
  If not ValidateEmptyCtrl([1], True, tsInfo) then exit;
  Result := True;
end;


end.
