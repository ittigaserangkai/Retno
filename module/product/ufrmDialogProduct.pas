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
  cxHyperLinkEdit, Vcl.Menus, cxButtons, Datasnap.DBClient, cxLabel;

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
    crBRSPurchaseNet: TcxCurrencyEdit;
    lbMargin: TLabel;
    crBRSMargin: TcxCurrencyEdit;
    Label21: TLabel;
    clSuppSupplier: TcxGridDBColumn;
    clSuppPurchasePrice: TcxGridDBColumn;
    clSuppDisc1: TcxGridDBColumn;
    clSuppDisc2: TcxGridDBColumn;
    clSuppDisc3: TcxGridDBColumn;
    clSuppMargin: TcxGridDBColumn;
    clSuppActive: TcxGridDBColumn;
    clSuppPrimer: TcxGridDBColumn;
    btnDelSupp: TcxButton;
    btnAddSupp: TcxButton;
    btnUpdateSupp: TcxButton;
    lbSuppShortCut1: TLabel;
    Label1: TLabel;
    gbSellingPrice: TcxGroupBox;
    gbSellingPriceGrid: TcxGroupBox;
    cxGroupBox5: TcxGroupBox;
    Label29: TLabel;
    btnDeletePrice: TcxButton;
    btnAddPrice: TcxButton;
    btnUpdatePrice: TcxButton;
    cxGridSellingPrice: TcxGrid;
    cxGrdDBSellingPrice: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    tsKonversi: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    Label2: TLabel;
    btnDelKonv: TcxButton;
    btnAddKonversi: TcxButton;
    cxGridKonversi: TcxGrid;
    cxGrdDBKonversi: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    clKonvSatuan: TcxGridDBColumn;
    clKonvValue: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    clKonvBarcode: TcxGridDBColumn;
    Label3: TLabel;
    cxExtLookupComboBox1: TcxExtLookupComboBox;
    Label4: TLabel;
    cxExtLookupComboBox2: TcxExtLookupComboBox;
    cxCurrencyEdit1: TcxCurrencyEdit;
    Label5: TLabel;
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
    procedure btnAddKonversiClick(Sender: TObject);
    procedure btnDelKonvClick(Sender: TObject);
    procedure crBRSPurchasePricePropertiesEditValueChanged(Sender: TObject);
    procedure crBRSDisc1PropertiesEditValueChanged(Sender: TObject);
    procedure crBRSDisc2PropertiesEditValueChanged(Sender: TObject);
    procedure crBRSDisc3PropertiesEditValueChanged(Sender: TObject);
    procedure crPurchaseNetPropertiesEditValueChanged(Sender: TObject);
    procedure crBRSMarginPropertiesEditValueChanged(Sender: TObject);
    procedure crBRSSellingPricePropertiesEditValueChanged(Sender: TObject);
  private
    FCDSSupp: TClientDataset;
    FCDSKonv: TClientDataset;
    FIsUpdateSupplier: Boolean;
    FModBarang: TModBarang;
    procedure AddSupplier;
    procedure LoadSupplierRow;
    procedure ClearForm;
    procedure ClearSupplier;
    procedure FilterOtherLookup(Src, Dst: TcxExtLookupComboBox);
    function GetCDSSupp: TClientDataset;
    function GetCDSKonv: TClientDataset;
    function GetModBarang: TModBarang;
    procedure CalculateMargin(Sender: TObject);
    procedure InitGrid;
    procedure InitLookup;
    procedure LoadItems;
    procedure SaveData;
    procedure UpdateData;
    procedure UpdateDataItem;
    function ValidateData: Boolean;
    property CDSSupp: TClientDataset read GetCDSSupp write FCDSSupp;
    property CDSKonv: TClientDataset read GetCDSKonv write FCDSKonv;
    property IsUpdateSupplier: Boolean read FIsUpdateSupplier write
        FIsUpdateSupplier;
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
  uModOutlet, uModRefPajak, uModSuplier, uDBUtils, ufrmCXLookup;

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

  if IsUpdateSupplier then
    CDSSupp.Edit
  else
    CDSSupp.Append;

  CDSSupp.FieldByName('Supplier').AsString := cxLookupSupplier.EditValue;
  CDSSupp.FieldByName('BRGSUP_EXPIRE_TIME').AsInteger := spExpiredTime.Value;
  CDSSupp.FieldByName('BRGSUP_DELIVERY_TIME').AsInteger := spDelivery.Value;
  CDSSupp.FieldByName('SATUAN_PURCHASE').AsString := cxLookupBRSUom.EditValue;
  CDSSupp.FieldByName('BRGSUP_STOCK_IN_ORDER').AsFloat := crStockInOrder.Value;
  CDSSupp.FieldByName('BRGSUP_IS_BKP').AsInteger := TAppUtils.BoolToInt(ckBKP.Checked);
  CDSSupp.FieldByName('BRGSUP_IS_PRIMARY').AsInteger := TAppUtils.BoolToInt(ckPrimer.Checked);
  CDSSupp.FieldByName('BRGSUP_IS_ENABLE_CN').AsInteger := TAppUtils.BoolToInt(ckEnableCN.Checked);
  CDSSupp.FieldByName('BRGSUP_IS_ACTIVE').AsInteger := TAppUtils.BoolToInt(ckActive.Checked);
//  CDSSupp.FieldByName('SellingPrice').AsFloat := crBRSSellingPrice.Value;
  CDSSupp.FieldByName('BRGSUP_BUY_PRICE').AsFloat := crBRSPurchasePrice.Value;
  CDSSupp.FieldByName('BRGSUP_DISC1').AsFloat := crBRSDisc1.Value;
  CDSSupp.FieldByName('BRGSUP_DISC2').AsFloat := crBRSDisc2.Value;
  CDSSupp.FieldByName('BRGSUP_DISC3').AsFloat := crBRSDisc3.Value;
//  CDSSupp.FieldByName('PurchaseNet').AsFloat := crPurchaseNet.Value;
  CDSSupp.FieldByName('BRGSUP_MARK_UP').AsFloat := crBRSMargin.Value;
  CDSSupp.FieldByName('BRGSUP_MIN_ORDER').AsFloat := crMinOrder.Value;
  CDSSupp.FieldByName('BRGSUP_MAX_ORDER').AsFloat := crMaxOrder.Value;

  CDSSupp.Post;

  cxGrdDBSupplier.ApplyBestFit;
  btnAddSupp.Click;
end;

procedure TfrmDialogProduct.LoadSupplierRow;
begin
  if CDSSupp.Eof then exit;

  cxLookupSupplier.EditValue  := CDSSupp.FieldByName('Supplier').AsString;
  spExpiredTime.Value         := CDSSupp.FieldByName('BRGSUP_EXPIRE_TIME').AsInteger;
  spDelivery.Value            := CDSSupp.FieldByName('BRGSUP_DELIVERY_TIME').AsInteger;
  cxLookupBRSUom.EditValue    := CDSSupp.FieldByName('SATUAN_PURCHASE').AsString;
  crStockInOrder.Value        := CDSSupp.FieldByName('BRGSUP_STOCK_IN_ORDER').AsFloat;
  ckBKP.Checked               := CDSSupp.FieldByName('BRGSUP_IS_BKP').AsInteger = 1;
  ckPrimer.Checked            := CDSSupp.FieldByName('BRGSUP_IS_PRIMARY').AsInteger = 1;
  ckEnableCN.Checked          := CDSSupp.FieldByName('BRGSUP_IS_ENABLE_CN').AsInteger = 1;
  ckActive.Checked            := CDSSupp.FieldByName('BRGSUP_IS_ACTIVE').AsInteger = 1;
//  crBRSSellingPrice.Value     := CDSSupp.FieldByName('SellingPrice').AsFloat;
  crBRSPurchasePrice.Value    := CDSSupp.FieldByName('BRGSUP_BUY_PRICE').AsFloat;
  crBRSDisc1.Value            := CDSSupp.FieldByName('BRGSUP_DISC1').AsFloat;
  crBRSDisc2.Value            := CDSSupp.FieldByName('BRGSUP_DISC2').AsFloat;
  crBRSDisc3.Value            := CDSSupp.FieldByName('BRGSUP_DISC3').AsFloat;
//  crPurchaseNet.Value         := CDSSupp.FieldByName('PurchaseNet').AsFloat;
  crBRSMargin.Value           := CDSSupp.FieldByName('BRGSUP_MARK_UP').AsFloat;
  crMinOrder.Value            := CDSSupp.FieldByName('BRGSUP_MIN_ORDER').AsFloat;
  crMaxOrder.Value            := CDSSupp.FieldByName('BRGSUP_MAX_ORDER').AsFloat;

  IsUpdateSupplier := True;
end;

procedure TfrmDialogProduct.btnAddKonversiClick(Sender: TObject);
begin
  inherited;
  cxGridKonversi.SetFocus;
  cxGrdDBKonversi.Focused := True;
  cxGrdDBKonversi.DataController.Append;
  cxGrdDBKonversi.DataController.FocusedRecordIndex :=
    cxGrdDBKonversi.DataController.RecordCount-1;
  cxGrdDBKonversi.GetColumnByFieldName('Satuan').Focused := True;

end;

procedure TfrmDialogProduct.btnAddSuppClick(Sender: TObject);
begin
  inherited;
  ClearSupplier;
  IsUpdateSupplier := False;
  Application.ProcessMessages;
  cxLookupSupplier.SetFocus;
end;

procedure TfrmDialogProduct.btnDelKonvClick(Sender: TObject);
begin
  inherited;
  if not CDSKonv.Eof then CDSKonv.Delete;
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

procedure TfrmDialogProduct.crBRSDisc1PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalculateMargin(Sender);
end;

procedure TfrmDialogProduct.crBRSDisc2PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalculateMargin(Sender);
end;

procedure TfrmDialogProduct.crBRSDisc3PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalculateMargin(Sender);
end;

procedure TfrmDialogProduct.crBRSMarginPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalculateMargin(Sender);
end;

procedure TfrmDialogProduct.crBRSPurchasePricePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalculateMargin(Sender);
end;

procedure TfrmDialogProduct.crBRSSellingPricePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalculateMargin(Sender);
end;

procedure TfrmDialogProduct.crPurchaseNetPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalculateMargin(Sender);
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
    VK_F2 : pgcMain.ActivePage := tsKonversi;
    VK_F3 : pgcMain.ActivePage := tsSupplier;
    VK_F4 : pgcMain.ActivePage := tsSellingPrice;
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
    FCDSSupp := TDBUtils.CreateObjectDataSet(TModBarangSupplier, Self)
//    FCDSSupp := TClientDataSet.Create(Self);
//    FCDSSupp.AddField('ID', ftString);
//    FCDSSupp.AddField('SupplierID', ftString);
//    FCDSSupp.AddField('SupplierName', ftString);
//    FCDSSupp.AddField('TOP', ftInteger);
//    FCDSSupp.AddField('ExpiredTime', ftInteger);
//    FCDSSupp.AddField('DeliveryTime', ftInteger);
//    FCDSSupp.AddField('UOM', ftString);
//    FCDSSupp.AddField('StockInOrder', ftFloat);
//    FCDSSupp.AddField('IsBKP', ftInteger);
//    FCDSSupp.AddField('IsPrimer', ftInteger);
//    FCDSSupp.AddField('EnableCN', ftInteger);
//    FCDSSupp.AddField('Active', ftInteger);
//    FCDSSupp.AddField('SellingPrice', ftFloat);
//    FCDSSupp.AddField('PurchasePrice', ftFloat);
//    FCDSSupp.AddField('Disc1', ftFloat);
//    FCDSSupp.AddField('Disc2', ftFloat);
//    FCDSSupp.AddField('Disc3', ftFloat);
//    FCDSSupp.AddField('PurchaseNet', ftFloat);
//    FCDSSupp.AddField('Margin', ftFloat);
//    FCDSSupp.AddField('MinOrder', ftFloat);
//    FCDSSupp.AddField('MaxOrder', ftFloat);
//    FCDSSupp.CreateDataSet;
  end;
  Result := FCDSSupp;
end;

function TfrmDialogProduct.GetCDSKonv: TClientDataset;
begin
  if not Assigned(FCDSKonv) then
    FCDSKonv := TDBUtils.CreateObjectDataSet(TModKonversi, Self);
  Result := FCDSKonv;
end;

function TfrmDialogProduct.GetModBarang: TModBarang;
begin
  if not Assigned(FModBarang) then
    FModBarang := TModBarang.Create;
  Result := FModBarang;
end;

procedure TfrmDialogProduct.CalculateMargin(Sender: TObject);
var
  dDiskon: Double;
  dNet: Double;
begin
  //disc bertingkat gak ya?
  dDiskon := crBRSDisc1.Value/100 * crBRSPurchasePrice.Value;
  dDiskon := dDiskon + (crBRSDisc2.Value/100 * crBRSPurchasePrice.Value);
  dDiskon := dDiskon + crBRSDisc3.Value;
  dNet := crBRSPurchasePrice.Value - dDiskon;
  crBRSPurchaseNet.Value := dNet;

  if Sender = crBRSSellingPrice then
  begin
    if dNet <> 0 then
      crBRSMargin.Value := (crBRSSellingPrice.Value - dNet) / dNet * 100;
  end else
  begin
    crBRSSellingPrice.Value := (100+crBRSMargin.Value)/100 * dNet;
  end;
end;

procedure TfrmDialogProduct.InitGrid;
begin
  cxGrdDBSupplier.LoadFromCDS(CDSSupp, False, False);
  cxGrdDBKonversi.LoadFromCDS(CDSKonv, False, False);
end;

procedure TfrmDialogProduct.InitLookup;
var
  lCDS: TClientDataSet;
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

    cxLookupMerchan.SetMultiPurposeLookup;
    cxLookupMerchanGroup.SetMultiPurposeLookup;
    cxLookupSubGroup.SetMultiPurposeLookup;
    cxLookupKategori.SetMultiPurposeLookup;
    cxLookupMerk.SetMultiPurposeLookup;

    lCDS := TDBUtils.DSToCDS(Satuan_GetDSLookup, Self);
    cxLookupSatuan.LoadFromCDS(lCDS, 'ref$satuan_id', 'SAT_CODE', Self);
    cxLookupSatPurchase.LoadFromCDS(lCDS, 'ref$satuan_id', 'SAT_CODE', Self);
    cxLookupBRSUom.LoadFromCDS(lCDS, 'ref$satuan_id', 'SAT_CODE', Self);
    TcxExtLookupComboBoxProperties(clKonvSatuan.Properties).LoadFromCDS(
      lCDS, 'ref$satuan_id', 'SAT_CODE', Self);

    lCDS := TDBUtils.DSToCDS(Suplier_GetDSLookup, Self);
    cxLookupSupplier.LoadFromCDS(lCDS,'SUPLIER_ID','SUP_NAME', ['SUPLIER_ID'], Self);
    TcxExtLookupComboBoxProperties(clSuppSupplier.Properties).LoadFromCDS(lCDS,
      'SUPLIER_ID','SUP_NAME', ['SUPLIER_ID'], Self);
    cxLookupSupplier.SetMultiPurposeLookup;

  end;
  //inisialisasi
end;

procedure TfrmDialogProduct.SaveData;
begin
  if not ValidateData then exit;
  UpdateData;
  Try
    ModBarang.ID := DMClient.CrudClient.SaveToDBID(ModBarang);
//    DMClient.CrudClient.SaveToDBFilter(ModBarang,TModKonversi.ClassName);
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

  UpdateDataItem;
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

  LoadItems;
end;

procedure TfrmDialogProduct.LoadItems;
var
  i: Integer;
  lBS: TModBarangSupplier;
  lKonv: TModKonversi;
begin
  CDSSupp.EmptyDataSet;
  CDSKonv.EmptyDataSet;

  for i := 0 to ModBarang.Suppliers.Count-1 do
  begin
    lBS := ModBarang.Suppliers[i];
    CDSSupp.Append;
    lBS.UpdateToDataset(CDSSupp);
    CDSSupp.Post;
  end;

  for i := 0 to ModBarang.Konversi.Count-1 do
  begin
    lKonv := ModBarang.Konversi[i];
    CDSKonv.Append;
    lKonv.UpdateToDataset(CDSKonv);
    CDSKonv.Post;
  end;

  CDSSupp.First;
  CDSKonv.First;

  LoadSupplierRow;
end;

procedure TfrmDialogProduct.pgcMainChange(Sender: TObject);
begin
  inherited;
  If pgcMain.ActivePage = tsSupplier then
    cxLookupSupplier.SetFocus
  else if pgcMain.ActivePage = tsKonversi then
  begin
    if CDSKonv.RecordCount = 0 then
      btnAddKonversi.Click;
  end;
end;

procedure TfrmDialogProduct.UpdateDataItem;
var
  i: Integer;
  lBS: TModBarangSupplier;
  lKonv: TModKonversi;
begin
  ModBarang.Suppliers.Clear;
  ModBarang.Konversi.Clear;

  CDSSupp.First;
  while not CDSSupp.eof do
  begin
    lBS := TModBarangSupplier.Create;
    lBS.SetFromDataset(CDSSupp);
    ModBarang.Suppliers.Add(lBS);
    CDSSupp.Next;
  end;

  CDSKonv.First;
  while not CDSKonv.eof do
  begin
    lKonv := TModKonversi.Create;
    lKonv.SetFromDataset(CDSKonv);
    ModBarang.Konversi.Add(lKonv);
    CDSKonv.Next;
  end;
end;

function TfrmDialogProduct.ValidateData: Boolean;
begin
  Result := False;
  If not ValidateEmptyCtrl([1], True, tsInfo) then exit;



  if not TAppUtils.Confirm(CONF_VALIDATE_FOR_SAVE) then exit;
  Result := True;
end;


end.
