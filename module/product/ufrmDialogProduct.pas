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
  cxHyperLinkEdit, Vcl.Menus, cxButtons, Datasnap.DBClient, cxLabel,
  cxButtonEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter;

type

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
    ckPrimarySupp: TcxCheckBox;
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
    cxLookupTipeHarga: TcxExtLookupComboBox;
    Label4: TLabel;
    cxLookupSatuanJual: TcxExtLookupComboBox;
    crKonversi: TcxCurrencyEdit;
    Label5: TLabel;
    pnlSellingPriceProp: TcxGroupBox;
    crSellingPrice: TcxCurrencyEdit;
    Label8: TLabel;
    Label9: TLabel;
    crSellDiscPercent: TcxCurrencyEdit;
    crSellDiscRP: TcxCurrencyEdit;
    Label11: TLabel;
    crSellingPriceNet: TcxCurrencyEdit;
    crSellingPriceCoret: TcxCurrencyEdit;
    crSellMargin: TcxCurrencyEdit;
    Label14: TLabel;
    Label13: TLabel;
    pnlSellingPriceDisc: TcxGroupBox;
    ckLimitCrazyPrice: TcxCheckBox;
    ckIsADS: TcxCheckBox;
    ckIsMailer: TcxCheckBox;
    Label12: TLabel;
    crLimitQTYCrazy: TcxCurrencyEdit;
    crLimitPriceCrazy: TcxCurrencyEdit;
    crPriceADS: TcxCurrencyEdit;
    crQTYADS: TcxCurrencyEdit;
    Label17: TLabel;
    Label18: TLabel;
    crSellMarkUP: TcxCurrencyEdit;
    crMaxQTYDisc: TcxCurrencyEdit;
    Label19: TLabel;
    crLastPurchasePrice: TcxCurrencyEdit;
    Label20: TLabel;
    Label22: TLabel;
    crAveragePrice: TcxCurrencyEdit;
    Label23: TLabel;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    clSellTipeHarga: TcxGridDBColumn;
    clSellSatuan: TcxGridDBColumn;
    clSellPrice: TcxGridDBColumn;
    clSellDiscPercent: TcxGridDBColumn;
    clSellDiscRP: TcxGridDBColumn;
    clSellPriceMargin: TcxGridDBColumn;
    cxGrdDBSellingPriceColumn1: TcxGridDBColumn;
    tsImport: TcxTabSheet;
    Panel1: TPanel;
    btnImport: TcxButton;
    edFileName: TcxButtonEdit;
    cxGrid1: TcxGrid;
    cxGrdXLS: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    OpDialog: TOpenDialog;
    cxButton1: TcxButton;
    mmLog: TMemo;
    lbUOMPurchase: TLabel;
    cxLookupSatPurchase: TcxExtLookupComboBox;
    ckFilterSupMG: TcxCheckBox;
    ckIsSOBlacklist: TcxCheckBox;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxLookupMerchanPropertiesEditValueChanged(Sender: TObject);
    procedure cxLookupMerchanGroupPropertiesEditValueChanged(Sender: TObject);
    procedure cxLookupSubGroupPropertiesEditValueChanged(Sender: TObject);
    procedure cxLookupMerkPropertiesEditValueChanged(Sender: TObject);
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
    procedure cxLookupSatuanJualPropertiesEditValueChanged(Sender: TObject);
    procedure btnAddPriceClick(Sender: TObject);
    procedure btnUpdatePriceClick(Sender: TObject);
    procedure btnDeletePriceClick(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure ckFilterSupMGClick(Sender: TObject);
    procedure crSellingPricePropertiesEditValueChanged(Sender: TObject);
    procedure crSellDiscPercentPropertiesEditValueChanged(Sender: TObject);
    procedure crSellDiscRPPropertiesEditValueChanged(Sender: TObject);
    procedure cxGrdDBSellingPriceCellClick(Sender: TcxCustomGridTableView;
        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
        TShiftState; var AHandled: Boolean);
    procedure edFileNamePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
    procedure cxGridKonversiExit(Sender: TObject);
    procedure cxLookupMerkKeyDown(Sender: TObject; var Key: Word; Shift:
        TShiftState);
    procedure edtShortNamePropertiesEditValueChanged(Sender: TObject);
    procedure cxLookupSatuanPropertiesEditValueChanged(Sender: TObject);
  private
    FCDSSupp: TClientDataset;
    FCDSKonv: TClientDataset;
    FCDSAvailableKonv: TClientDataSet;
    FCDSHargaJual: TClientDataset;
    FCDSImport: TClientDataSet;
    FCDSSatuan: TClientDataset;
    FCDSSupMG: TClientDataSet;
    FIsUpdateSupplier: Boolean;
    FIsUpdateHrgJual: Boolean;
    FModBarang: TModBarang;
    procedure AddSupplier;
    procedure AddHargaJual;
    procedure LoadSupplierRow;
    procedure ClearForm;
    procedure ClearSupplier;
    procedure FilterOtherLookup(Src, Dst: TcxExtLookupComboBox);
    function GetCDSSupp: TClientDataset;
    function GetCDSKonv: TClientDataset;
    function GetModBarang: TModBarang;
    procedure CalculateMargin(Sender: TObject);
    procedure CalculatePrice(Sender: TObject);
    function GetCDSAvailableKonv: TClientDataSet;
    function GetCDSHargaJual: TClientDataset;
    function GetCDSSatuan: TClientDataset;
    function GetCDSSupMG: TClientDataSet;
    procedure InitGrid;
    procedure InitLookup;
    procedure LoadItems;
    procedure LoadSellingPriceRow;
    procedure LoadXLS;
    procedure PumpData;
    function PumpDataDetail: Boolean;
    procedure SaveData;
    procedure SetDefaultInputSellPrice;
    procedure UpdateAvailableSat;
    procedure UpdateData;
    procedure UpdateDataItem;
    function ValidateData: Boolean;
    property CDSAvailableKonv: TClientDataSet read GetCDSAvailableKonv write
        FCDSAvailableKonv;
    property CDSSupp: TClientDataset read GetCDSSupp write FCDSSupp;
    property CDSKonv: TClientDataset read GetCDSKonv write FCDSKonv;
    property CDSHargaJual: TClientDataset read GetCDSHargaJual write FCDSHargaJual;
    property CDSImport: TClientDataSet read FCDSImport write FCDSImport;
    property CDSSatuan: TClientDataset read GetCDSSatuan write FCDSSatuan;
    property CDSSupMG: TClientDataSet read GetCDSSupMG write FCDSSupMG;
    property IsUpdateSupplier: Boolean read FIsUpdateSupplier write
        FIsUpdateSupplier;
    property IsUpdateHrgJual: Boolean read FIsUpdateHrgJual write FIsUpdateHrgJual;
    property ModBarang: TModBarang read GetModBarang write FModBarang;
  public
    procedure FilterLookupSUPMG(aChecked: Boolean);
    procedure LoadData(AID: String);
    { Public declarations }
  published
  end;

var
  frmDialogProduct: TfrmDialogProduct;

implementation

uses
  uDXUtils, uDMClient,  uModSatuan, uAppUtils, uConstanta, ufrmDialogMerk,
  uModOutlet, uModRefPajak, uModSuplier, uDBUtils, ufrmCXLookup, uModApp;

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
  if pgcMain.ActivePage = tsImport then
    PumpData
  else
    SaveData;
end;

procedure TfrmDialogProduct.AddSupplier;
var
  lCDS: TClientDataSet;
begin
  if not ValidateEmptyCtrl([1], True, gbSupplier) then exit;

  if IsUpdateSupplier then
    CDSSupp.Edit
  else
    CDSSupp.Append;

  CDSSupp.FieldByName('Supplier_Merchan').AsString := cxLookupSupplier.EditValue;
  CDSSupp.FieldByName('BRGSUP_EXPIRE_TIME').AsInteger := spExpiredTime.Value;
  CDSSupp.FieldByName('BRGSUP_DELIVERY_TIME').AsInteger := spDelivery.Value;
  CDSSupp.FieldByName('SATUAN_PURCHASE').AsString := cxLookupBRSUom.EditValue;
  CDSSupp.FieldByName('BRGSUP_STOCK_IN_ORDER').AsFloat := crStockInOrder.Value;
  CDSSupp.FieldByName('BRGSUP_IS_BKP').AsInteger := TAppUtils.BoolToInt(ckBKP.Checked);
  CDSSupp.FieldByName('BRGSUP_IS_SO_BLACKLIST').AsInteger := TAppUtils.BoolToInt(ckIsSOBlacklist.Checked);
  CDSSupp.FieldByName('BRGSUP_IS_PRIMARY').AsInteger := TAppUtils.BoolToInt(ckPrimarySupp.Checked);
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

  if ckPrimarySupp.Checked then
  begin
    lCDS := TClientDataSet.Create(Self);
    Try
      lCDS.CloneCursor(CDSSupp, True);
      lCDS.Filtered := True;
      lCDS.Filter := 'BRGSUP_IS_PRIMARY = 1';
      lCDS.First;
      while not lCDS.Eof do
      begin
        lCDS.Edit;
        lCDS.FieldByName('BRGSUP_IS_PRIMARY').AsInteger := 0;
        lCDS.Post;
        lCDS.Next;
      end;
    Finally
      lCDS.Free;
    End;
  end;

  CDSSupp.Post;

  cxGrdDBSupplier.ApplyBestFit;
  btnAddSupp.Click;
end;

procedure TfrmDialogProduct.AddHargaJual;
begin
  if not ValidateEmptyCtrl([1], True, gbSellingPrice) then exit;

  if IsUpdateHrgJual then
    CDSHargaJual.Edit
  else
    CDSHargaJual.Append;

  CDSHargaJual.FieldByName('TipeHarga').AsString := cxLookupTipeHarga.EditValue;
  CDSHargaJual.FieldByName('Satuan').AsString := cxLookupSatuanJual.EditValue;
  CDSHargaJual.FieldByName('BHJ_SELL_PRICE').AsFloat := crSellingPrice.EditValue;
  CDSHargaJual.FieldByName('BHJ_DISC_PERSEN').AsFloat := crSellDiscPercent.EditValue;
  CDSHargaJual.FieldByName('BHJ_DISC_NOMINAL').AsFloat := crSellDiscRP.EditValue;
  CDSHargaJual.FieldByName('BHJ_SELL_PRICE_DISC').AsFloat := crSellingPriceNet.EditValue;
  CDSHargaJual.FieldByName('BHJ_SELL_PRICE_CORET').AsFloat := crSellingPriceCoret.EditValue;
  CDSHargaJual.FieldByName('BHJ_MARK_UP').AsFloat := crSellMarkUP.EditValue;
  CDSHargaJual.FieldByName('BHJ_CONV_VALUE').AsFloat := crKonversi.EditValue;
  CDSHargaJual.FieldByName('BHJ_MAX_QTY_DISC').AsFloat := crMaxQTYDisc.EditValue;
  CDSHargaJual.FieldByName('BHJ_IS_MAILER').AsInteger := TAppUtils.BoolToInt( ckIsMailer.Checked );
  CDSHargaJual.FieldByName('BHJ_IS_LIMIT_QTY').AsInteger := TAppUtils.BoolToInt( ckLimitCrazyPrice.Checked );
  CDSHargaJual.FieldByName('BHJ_IS_QTY_SUBSIDY').AsInteger := TAppUtils.BoolToInt( ckIsADS.Checked );
  CDSHargaJual.FieldByName('BHJ_LIMIT_QTY').AsFloat := crLimitQTYCrazy.EditValue;
  CDSHargaJual.FieldByName('BHJ_LIMIT_QTY_PRICE').AsFloat := crLimitPriceCrazy.EditValue;
  CDSHargaJual.FieldByName('BHJ_QTY_SUBSIDY').AsFloat := crQTYADS.EditValue;
  CDSHargaJual.FieldByName('BHJ_QTY_SUBSIDY_PRICE').AsFloat := crPriceADS.EditValue;
  CDSHargaJual.Post;
//  cxGrdDBSellingPrice.ApplyBestFit;
  btnAddPrice.Click;
end;

procedure TfrmDialogProduct.LoadSupplierRow;
begin
  if CDSSupp.Eof then exit;

  cxLookupSupplier.EditValue  := CDSSupp.FieldByName('Supplier_Merchan').AsString;
  spExpiredTime.Value         := CDSSupp.FieldByName('BRGSUP_EXPIRE_TIME').AsInteger;
  spDelivery.Value            := CDSSupp.FieldByName('BRGSUP_DELIVERY_TIME').AsInteger;
  cxLookupBRSUom.EditValue    := CDSSupp.FieldByName('SATUAN_PURCHASE').AsString;
  crStockInOrder.Value        := CDSSupp.FieldByName('BRGSUP_STOCK_IN_ORDER').AsFloat;
  ckBKP.Checked               := CDSSupp.FieldByName('BRGSUP_IS_BKP').AsInteger = 1;
  ckIsSOBlacklist.Checked     := CDSSupp.FieldByName('BRGSUP_IS_SO_BLACKLIST').AsInteger = 1;
  ckPrimarySupp.Checked       := CDSSupp.FieldByName('BRGSUP_IS_PRIMARY').AsInteger = 1;
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

procedure TfrmDialogProduct.btnAddPriceClick(Sender: TObject);
begin
  inherited;
  Self.ClearByTag([0,1], gbSellingPrice);
  SetDefaultInputSellPrice;
  IsUpdateHrgJual := False;
  Application.ProcessMessages;
  cxLookupTipeHarga.SetFocus;
end;

procedure TfrmDialogProduct.btnAddSuppClick(Sender: TObject);
begin
  inherited;
  ClearSupplier;
  IsUpdateSupplier := False;
  Application.ProcessMessages;
  cxLookupSupplier.SetFocus;
end;

procedure TfrmDialogProduct.btnDeletePriceClick(Sender: TObject);
begin
  inherited;
  if CDSHargaJual.Eof then exit;
  CDSHargaJual.Delete;
end;

procedure TfrmDialogProduct.btnDelKonvClick(Sender: TObject);
var
  iRec: Integer;
begin
  inherited;
  if CDSKonv.State in [dsEdit, dsInsert ] then CDSKonv.Post;
  if not CDSKonv.Eof then CDSKonv.Delete;
//  iRec := cxGrdDBKonversi.DataController.FocusedRecordIndex;
//  cxGrdDBKonversi.DataController.DeleteRecord(iRec);
end;

procedure TfrmDialogProduct.btnDelSuppClick(Sender: TObject);
begin
  inherited;
  if CDSSupp.Eof then exit;
  CDSSupp.Delete;
end;

procedure TfrmDialogProduct.btnImportClick(Sender: TObject);
begin
  inherited;
  LoadXLS;
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

  Application.ProcessMessages; //--> need this
    //...  to prevent cxLookupMerk send Tab when focus position in TabOrder : 0
  SelectFirst;
end;

procedure TfrmDialogProduct.btnUpdatePriceClick(Sender: TObject);
begin
  inherited;
  AddHargaJual;
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
  ckPrimarySupp.Checked := True;
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

procedure TfrmDialogProduct.crSellDiscPercentPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalculatePrice(Sender);
end;

procedure TfrmDialogProduct.crSellDiscRPPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalculatePrice(Sender);
end;

procedure TfrmDialogProduct.crSellingPricePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalculatePrice(Sender);
  if crSellingPriceCoret.Value = 0 then
    crSellingPriceCoret.Value := crSellingPrice.Value;
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
  edtProductName.Text := cxLookupMerk.Text + ' ' + edtShortName.Text;
  Self.OnEditValueChanged(cxLookupMerk);
end;

procedure TfrmDialogProduct.cxLookupSatuanJualPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  crKonversi.Value := CDSAvailableKonv.FieldByName('Konversi').AsFloat;
end;

procedure TfrmDialogProduct.cxLookupSatuanPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if VarIsNull(cxLookupSatPurchase.EditValue) then
    cxLookupSatPurchase.EditValue := cxLookupSatuan.EditValue;
end;

procedure TfrmDialogProduct.cxLookupSubGroupPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  FilterOtherLookup(cxLookupSubGroup, cxLookupKategori);
end;

procedure TfrmDialogProduct.edFileNamePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  if OpDialog.Execute then
  begin
    edFileName.Text := OpDialog.FileName;
  end;
end;

procedure TfrmDialogProduct.edtShortNamePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  edtProductName.Text := cxLookupMerk.Text + ' ' + edtShortName.Text;
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
    FCDSSupp := TDBUtils.CreateObjectDataSet(TModBarangSupplier, Self);
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
  //disc bertingkat gak ya?   --> iya ternyata
  dDiskon := crBRSDisc1.Value/100 * crBRSPurchasePrice.Value;
  dNet := crBRSPurchasePrice.Value - dDiskon;
  dDiskon := dDiskon + (crBRSDisc2.Value/100 * dNet);
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

procedure TfrmDialogProduct.CalculatePrice(Sender: TObject);
begin

  if Sender = crSellDiscPercent then
    crSellDiscRP.Value := crSellDiscPercent.Value/100 * crSellingPrice.Value
  else
  begin
    if crSellingPrice.Value <> 0 then
      crSellDiscPercent.Value := crSellDiscRP.Value/crSellingPrice.Value * 100
    else begin
      crSellDiscPercent.Value := 0;
      crSellDiscRP.Value := 0;
    end;
  end;

  crSellingPriceNet.Value :=  crSellingPrice.Value - crSellDiscRP.Value;

end;

procedure TfrmDialogProduct.ckFilterSupMGClick(Sender: TObject);
begin
  inherited;
  FilterLookupSUPMG(ckFilterSupMG.Checked);
end;

procedure TfrmDialogProduct.cxButton1Click(Sender: TObject);
begin
  inherited;
  PumpData;
end;

procedure TfrmDialogProduct.cxGrdDBSellingPriceCellClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  LoadSellingPriceRow;
end;

procedure TfrmDialogProduct.cxGridKonversiExit(Sender: TObject);
begin
  inherited;
  if CDSKonv.State in [dsEdit, dsInsert] then CDSKonv.Post;
end;

procedure TfrmDialogProduct.cxLookupMerkKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
var
  lfrm: TfrmDialogMerk;
begin
  inherited;
  if Key = VK_F5 then
  begin
    lfrm := TfrmDialogMerk.Create(Application);
    Try
      lfrm.actDelete.Enabled := False;
      lfrm.ShowConfSuccess := False;

      if lfrm.ShowModal = mrOk then
      begin
        cxLookupMerk.DS.Append;
        cxLookupMerk.DS.FieldByName('MERK_ID').AsString           := lfrm.ModMerk.ID;
        cxLookupMerk.DS.FieldByName('MERK_NAME').AsString         := lfrm.ModMerk.MERK_NAME;
        cxLookupMerk.DS.FieldByName('MERK_DESCRIPTION').AsString  := lfrm.ModMerk.MERK_DESCRIPTION;
        cxLookupMerk.DS.Post;

        cxLookupMerk.EditValue := lfrm.ModMerk.ID;
      end;

    Finally
      Key := 0;
      lfrm.Free;
    End;

  end else if Key = VK_RETURN then edtCatalog.SetFocus;

end;

procedure TfrmDialogProduct.FilterLookupSUPMG(aChecked: Boolean);
begin
  CDSSupMG.Filter := '[REF$MERCHANDISE_GRUP_ID] = '
    + QuotedStr(VarToStr(cxLookupMerchanGroup.EditValue));
  CDSSupMG.Filtered := aChecked;

end;

function TfrmDialogProduct.GetCDSAvailableKonv: TClientDataSet;
begin
  If not Assigned(FCDSAvailableKonv) then
  begin
    FCDSAvailableKonv := TClientDataSet.Create(Self);
    FCDSAvailableKonv.AddField('ID', ftString);
    FCDSAvailableKonv.AddField('Satuan', ftString);
    FCDSAvailableKonv.AddField('Konversi', ftFloat);
    FCDSAvailableKonv.CreateDataSet;
  end;
  Result := FCDSAvailableKonv;
end;

function TfrmDialogProduct.GetCDSHargaJual: TClientDataset;
begin
  if not Assigned(FCDSHargaJual) then
    FCDSHargaJual := TDBUtils.CreateObjectDataSet(TModBarangHargaJual, Self);
  Result := FCDSHargaJual;
end;

function TfrmDialogProduct.GetCDSSatuan: TClientDataset;
begin
  if not Assigned(FCDSSatuan) then
    FCDSSatuan := TDBUtils.DSToCDS(
      DMClient.DSProviderClient.Satuan_GetDSLookup, Self);
  Result := FCDSSatuan;
end;

function TfrmDialogProduct.GetCDSSupMG: TClientDataSet;
begin
  if not Assigned(FCDSSupMG) then
    FCDSSupMG := TDBUtils.DSToCDS(
      DMClient.DSProviderClient.SuplierMerchan_GetDSLookup, Self);

  Result := FCDSSupMG;
end;

procedure TfrmDialogProduct.InitGrid;
begin
  cxGrdDBSupplier.LoadFromCDS(CDSSupp, False, False);
  cxGrdDBKonversi.LoadFromCDS(CDSKonv, False, False);
  cxGrdDBSellingPrice.LoadFromCDS(CDSHargaJual, False, False);
end;

procedure TfrmDialogProduct.InitLookup;
begin
  With DMClient.DSProviderClient do
  begin
    //tab Informasi
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

    //satuan all tab
    cxLookupSatuan.LoadFromCDS(CDSSatuan, 'ref$satuan_id', 'SAT_CODE', Self);
    cxLookupSatPurchase.LoadFromCDS(CDSSatuan, 'ref$satuan_id', 'SAT_CODE', Self);
    cxLookupBRSUom.LoadFromCDS(CDSAvailableKonv, 'ID', 'Satuan', Self);
    TcxExtLookupComboBoxProperties(clKonvSatuan.Properties).LoadFromCDS(
      CDSSatuan, 'ref$satuan_id', 'SAT_CODE', Self);
    TcxExtLookupComboBoxProperties(clSellSatuan.Properties).LoadFromCDS(
      CDSSatuan, 'ref$satuan_id', 'SAT_CODE', Self);

    //supplier all tab

    cxLookupSupplier.LoadFromCDS(CDSSupMG,'SUPLIER_MERCHAN_GRUP_ID','SUPMG_NAME', Self);
    cxLookupSupplier.SetVisibleColumnsOnly(['SUPMG_SUB_CODE', 'SUPMG_NAME', 'MERCHANGRUP_NAME']);

    TcxExtLookupComboBoxProperties(clSuppSupplier.Properties).LoadFromCDS(CDSSupMG,
      'SUPLIER_MERCHAN_GRUP_ID','SUPMG_NAME', Self);
    TcxExtLookupComboBoxProperties(clSuppSupplier.Properties).SetVisibleColumnsOnly(
      ['SUPMG_SUB_CODE', 'SUPMG_NAME', 'MERCHANGRUP_NAME']);

    cxLookupSupplier.SetMultiPurposeLookup;

    //tab Harga Jual
    cxLookupTipeHarga.LoadFromDS(TipeHarga_GetDSLookup,
      'REF$TIPE_HARGA_ID', 'TPHRG_NAME',  Self );
    cxLookupSatuanJual.LoadFromCDS(CDSAvailableKonv, 'ID', 'Satuan', Self);
    TcxExtLookupComboBoxProperties(clSellTipeHarga.Properties).LoadFromDS(
      TipeHarga_GetDSLookup,'REF$TIPE_HARGA_ID', 'TPHRG_NAME',  Self );

  end;
  //inisialisasi
end;

procedure TfrmDialogProduct.SaveData;
begin
  if not ValidateData then exit;
  UpdateData;
  Try
    ModBarang.ID := DMClient.CrudClient.SaveToDBID(ModBarang);
//    ModBarang.FilterKind := fckInclude;
//    ModBarang.AddFilterClass(TModBarang);
//    DMClient.CrudClient.SaveToDBLog(ModBarang);
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
var
  lKat: TModKategori;
begin
  If Assigned(FModBarang) then FModBarang.Free;
  FModBarang := DMClient.CrudClient.Retrieve(TModBarang.ClassName, aID) as TModBarang;    edtProductCode.Text             := ModBarang.BRG_CODE;

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

  edtProductName.Text             := ModBarang.BRG_NAME;

  //subgroup - kategori
  if ModBarang.Kategori.ID <> '' then
  begin
    lKat := DMCLient.CrudClient.Retrieve(
      TModKategori.ClassName, ModBarang.Kategori.ID) as TModKategori;
    cxLookupSubGroup.EditValue    := lKat.SubGroup.ID;
    cxLookupKategori.EditValue    := lKat.ID;
  end;

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
  lHJ: TModBarangHargaJual;
  lKonv: TModKonversi;
begin
  CDSSupp.EmptyDataSet;
  CDSKonv.EmptyDataSet;
  CDSHargaJual.EmptyDataSet;

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

  for i := 0 to ModBarang.HargaJual.Count-1 do
  begin
    lHJ := ModBarang.HargaJual[i];
    CDSHargaJual.Append;
    lHJ.UpdateToDataset(CDSHargaJual);
    CDSHargaJual.Post;
  end;

  CDSSupp.First;
  CDSKonv.First;
  CDSHargaJual.First;

  LoadSupplierRow;
end;

procedure TfrmDialogProduct.LoadSellingPriceRow;
begin
  if CDSHargaJual.Eof then exit;

  cxLookupTipeHarga.EditValue := CDSHargaJual.FieldByName('TipeHarga').AsString;
  cxLookupSatuanJual.EditValue := CDSHargaJual.FieldByName('Satuan').AsString;
  crSellingPrice.EditValue := CDSHargaJual.FieldByName('BHJ_SELL_PRICE').AsFloat;
  crSellDiscPercent.EditValue := CDSHargaJual.FieldByName('BHJ_DISC_PERSEN').AsFloat;
  crSellDiscRP.EditValue := CDSHargaJual.FieldByName('BHJ_DISC_NOMINAL').AsFloat;
  crSellingPriceNet.EditValue := CDSHargaJual.FieldByName('BHJ_SELL_PRICE_DISC').AsFloat;
  crSellingPriceCoret.EditValue := CDSHargaJual.FieldByName('BHJ_SELL_PRICE_CORET').AsFloat;
  crSellMarkUP.EditValue := CDSHargaJual.FieldByName('BHJ_MARK_UP').AsFloat;
  crKonversi.EditValue := CDSHargaJual.FieldByName('BHJ_CONV_VALUE').AsFloat;
  crMaxQTYDisc.EditValue := CDSHargaJual.FieldByName('BHJ_MAX_QTY_DISC').AsFloat;
  ckIsMailer.Checked := CDSHargaJual.FieldByName('BHJ_IS_MAILER').AsInteger = 1;
  ckLimitCrazyPrice.Checked := CDSHargaJual.FieldByName('BHJ_IS_LIMIT_QTY').AsInteger = 1;
  ckIsADS.Checked := CDSHargaJual.FieldByName('BHJ_IS_QTY_SUBSIDY').AsInteger = 1;
  crLimitQTYCrazy.EditValue := CDSHargaJual.FieldByName('BHJ_LIMIT_QTY').AsFloat;
  crLimitPriceCrazy.EditValue := CDSHargaJual.FieldByName('BHJ_LIMIT_QTY_PRICE').AsFloat;
  crQTYADS.EditValue := CDSHargaJual.FieldByName('BHJ_QTY_SUBSIDY').AsFloat;
crPriceADS.EditValue := CDSHargaJual.FieldByName('BHJ_QTY_SUBSIDY_PRICE').AsFloat;

  IsUpdateHrgJual := True;
end;

procedure TfrmDialogProduct.LoadXLS;
begin
  Self.Cursor := crHourGlass;
  Try
    if Assigned(FCDSImport) then FreeAndNil(FCDSImport);
    FCDSImport := TClientDataSet.Create(Self);

    CDSImport.LoadFromXLS(edFileName.Text);
    cxGrdXLS.LoadFromCDS(CDSImport);
  Finally
    Self.Cursor := crDefault;
  End;
end;

procedure TfrmDialogProduct.pgcMainChange(Sender: TObject);
begin
  inherited;
  If pgcMain.ActivePage = tsSupplier then
  begin
    btnAddSupp.Click;
    FilterLookupSUPMG(ckFilterSupMG.Checked);
  end else if pgcMain.ActivePage = tsKonversi then
  begin
    if CDSKonv.RecordCount = 0 then
      btnAddKonversi.Click;
  end else If pgcMain.ActivePage = tsSellingPrice then
  begin
    btnAddPrice.Click;
  end;

  if (pgcMain.ActivePage = tsSellingPrice) or (pgcMain.ActivePage = tsSupplier) then
    UpdateAvailableSat;
end;

procedure TfrmDialogProduct.PumpData;
var
  i: Integer;
begin
  cxLookupMerchan.CDS.Filtered := False;
  cxLookupMerchanGroup.CDS.Filtered := False;
  cxLookupSubGroup.CDS.Filtered := False;
  cxLookupKategori.CDS.Filtered := False;
  CDSImport.DisableControls;
  TAppUtils.InisialisasiProgressBar(Self, CDSImport.RecordCount);
  mmLog.Lines.Clear;
  Try
    CDSImport.First;
    while not CDSImport.Eof do
    begin
      Try
        PumpDataDetail;
      except
        on E:Exception do
        begin
          mmLog.Lines.Add('Error At Line : ' + IntToStr(CDSImport.RecNo));
          Raise;
//          mmLog.Lines.Add(E.Message);
//          mmLog.Lines.Add('****');
        end;
      End;

      TAppUtils.IncStepProgressBar(1);
      Application.ProcessMessages;

      CDSImport.Next;
    end;
  Finally
    CDSImport.EnableControls;
    TAppUtils.FinalisasiProgressBar();

    cxLookupMerchan.CDS.Filtered := True;
    cxLookupMerchanGroup.CDS.Filtered := True;
    cxLookupSubGroup.CDS.Filtered := True;
    cxLookupKategori.CDS.Filtered := True;
  End;

end;

function TfrmDialogProduct.PumpDataDetail: Boolean;
var
  lBS: TModBarangSupplier;
  lFloat: Double;
  lHJ: TModBarangHargaJual;
  lKonv: TModKonversi;
  lMerCode: string;
  lSubCode: string;
begin
  Result := False;
  if Assigned(FModBarang) then FModBarang.Free;

  //header
  ModBarang := DMClient.CrudClient.RetrieveByCode(TModBarang.ClassName,
    CDSImport.FieldByName('PLU').AsString
  ) as TModBarang;

//  if ModBarang.ID <> '' then
//  begin
//    Result := True;
//    Exit; //no edit for now
//  end;

  //merk
  if cxLookupMerk.DS.Locate('MERK_NAME', CDSImport.FieldByName('MERK').AsString, [loCaseInsensitive]) then
  begin
    ModBarang.Merk  := TModMerk.CreateID(cxLookupMerk.DS.FieldByName('MERK_ID').AsString);
  end;



  ModBarang.BRG_CODE            := CDSImport.FieldByName('PLU').AsString;
  ModBarang.BRG_NAME            := CDSImport.FieldByName('MERK_NAMA').AsString;
  ModBarang.BRG_CODE_PURCHASE   := CDSImport.FieldByName('PLU').AsString;
  ModBarang.BRG_NAME_PURCHASE   := CDSImport.FieldByName('MERK_NAMA').AsString;
  ModBarang.BRG_CATALOG         := CDSImport.FieldByName('PLU').AsString;
  ModBarang.BRG_ALIAS           := CDSImport.FieldByName('BRG_NAME').AsString;

  ModBarang.SAFETY_STOCK        := 0;
//  ModBarang.TipeBarang          := TModTipeBarang.CreateID(cxLookupTipeBarang.EditValue);

  if cxLookupSatuan.DS.Locate('SAT_CODE', CDSImport.FieldByName('UOM_BELI').AsString, [loCaseInsensitive]) then
  begin
    ModBarang.SATUAN_PURCHASE  := TModSatuan.CreateID(cxLookupSatuan.DS.FieldByName('ref$satuan_id').AsString);
  end;

  if cxLookupSatuan.DS.Locate('SAT_CODE', CDSImport.FieldByName('UOM_JUAL').AsString, [loCaseInsensitive]) then
  begin
    ModBarang.SATUAN_STOCK := TModSatuan.CreateID(cxLookupSatuan.DS.FieldByName('ref$satuan_id').AsString);
  end;

  lMerCode := '000' + CDSImport.FieldByName('MERCHAN').AsString;
  if cxLookupMerchan.DS.Locate('MERCHAN_CODE', lMerCode, [loCaseInsensitive]) then
  begin
    ModBarang.Merchandise  := TModMerchandise.CreateID(cxLookupMerchan.DS.FieldByName('REF$MERCHANDISE_ID').AsString);
  end;

  lSubCode :='000' +  CDSImport.FieldByName('KODE_GRUP').AsString;
  if cxLookupMerchanGroup.DS.Locate('MERCHANGRUP_CODE', lSubCode, [loCaseInsensitive]) then
  begin
    ModBarang.MerchandiseGroup  := TModMerchandiseGroup.CreateID(cxLookupMerchanGroup.DS.FieldByName('REF$MERCHANDISE_GRUP_ID').AsString);
  end;

//  if cxLookupSubGroup.DS.Locate('SUBGRUP_NAME', CDSImport.FieldByName('SUBGRUP_NAME').AsString, [loCaseInsensitive]) then
//  begin
//    ModBarang.  := TModMerchandise.CreateID(cxLookupSubGroup.DS.FieldByName('REF$SUB_GRUP_ID').AsString);
//  end;

  if cxLookupKategori.DS.Locate('KAT_NAME', CDSImport.FieldByName('KAT_NAME').AsString, [loCaseInsensitive]) then
  begin
    ModBarang.Kategori  := TModKategori.CreateID(cxLookupKategori.DS.FieldByName('REF$KATEGORI_ID').AsString);
  end;

  ModBarang.RefPajak            := TModRefPajak.CreateID('D84EA174-B8D1-4274-AD59-0E83502B6453');
  ModBarang.BRG_IS_CS           := 0;
  ModBarang.BRG_IS_STOCK        := 1;

  ModBarang.BRG_IS_ACTIVE       := 1;
  ModBarang.BRG_IS_BASIC        := 1;
  ModBarang.BRG_IS_DECIMAL      := 0;
  ModBarang.BRG_IS_PJK_INCLUDE  := 0;
  ModBarang.BRG_IS_DEPOSIT      := 0;
//  ModBarang.BRG_IS_BUILD        := TAppUtils.BoolToInt(chkIsBasic.Checked);
  ModBarang.BRG_IS_DISC_GMC     := 0;
  ModBarang.BRG_IS_GALON        := 0;
//  ModBarang.BRG_IS_VALIDATE     := TAppUtils.BoolToInt(chkIsBasic.Checked);


  //BARANG SUPPLIER
  ModBarang.Suppliers.Clear;
  lBS := TModBarangSupplier.Create;
  lBS.Supplier := DMClient.CrudClient.RetrieveByCode(
    TModSuplier.ClassName, CDSImport.FieldByName('KODE_SUP').AsString
  ) as TModSuplier;
  TryStrToFloat( CDSImport.FieldByName('HARGA_BELI').AsString, lFloat);
  lBS.BRGSUP_BUY_PRICE :=  lFloat;
  TryStrToFloat( CDSImport.FieldByName('DISC_1').AsString, lFloat);
  lBS.BRGSUP_DISC1 :=  lFloat;
  TryStrToFloat( CDSImport.FieldByName('DISC_2').AsString, lFloat);
  lBS.BRGSUP_DISC2 :=  lFloat;
  TryStrToFloat( CDSImport.FieldByName('DISC_3').AsString, lFloat);
  lBS.BRGSUP_DISC3 :=  lFloat;
  lBS.BRGSUP_MIN_ORDER := 0;
  lBS.BRGSUP_MAX_ORDER := 0;

  if cxLookupSatuan.DS.Locate('SAT_CODE', CDSImport.FieldByName('UOM_BELI').AsString, [loCaseInsensitive]) then
  begin
    lBS.SATUAN_PURCHASE  := TModSatuan.CreateID(cxLookupSatuan.DS.FieldByName('ref$satuan_id').AsString);
  end;

  ModBarang.Suppliers.Add(lBS);


  //KONVERSI
  ModBarang.Konversi.Clear;
  lKonv := TModKonversi.Create;
  lKonv.KONVSAT_BARCODE :=  CDSImport.FieldByName('BARCODE').AsString;
  lKonv.KONVSAT_SCALE := 1;
  if cxLookupSatuan.DS.Locate('SAT_CODE', CDSImport.FieldByName('UOM_JUAL').AsString, [loCaseInsensitive]) then
    lKonv.Satuan := TModSatuan.CreateID(cxLookupSatuan.DS.FieldByName('ref$satuan_id').AsString)
  else
    lKonv.Satuan := DMClient.CrudClient.RetrieveByCode(TModSatuan.ClassName, 'PCS') as TModSatuan;

  ModBarang.Konversi.Add(lKonv);

  //hargajual
  lHJ := TModBarangHargaJual.Create;
  lHJ.BHJ_CONV_VALUE := 1;

  if cxLookupSatuan.DS.Locate('SAT_CODE', CDSImport.FieldByName('UOM_JUAL').AsString, [loCaseInsensitive]) then
    lHJ.Satuan := TModSatuan.CreateID(cxLookupSatuan.DS.FieldByName('ref$satuan_id').AsString)
  else
    lHJ.Satuan := DMClient.CrudClient.RetrieveByCode(TModSatuan.ClassName, 'PCS') as TModSatuan;

  lHJ.TipeHarga := TModTipeHarga.CreateID('8F3F0369-85E9-4876-80F1-3DBE2E3701D9');
  TryStrToFloat( CDSImport.FieldByName('MARGIN').AsString, lFloat);
  lHJ.BHJ_MARK_UP := lFloat;

  ModBarang.HargaJual.Clear;
  TryStrToFloat( CDSImport.FieldByName('HRG_JUAL').AsString, lFloat);
  lHJ.BHJ_SELL_PRICE := lFloat;
  lHJ.BHJ_DISC_PERSEN := 0;
  lHJ.BHJ_DISC_NOMINAL := 0;
  lHJ.BHJ_SELL_PRICE_DISC := 0;
  ModBarang.HargaJual.Add(lHJ);

  Result := DMCLient.CrudClient.SaveToDB(ModBarang);
end;

procedure TfrmDialogProduct.SetDefaultInputSellPrice;
begin
  crSellMargin.Value := 0;
  if CDSSupp.Locate('BRGSUP_IS_PRIMARY',1,[loCaseInsensitive]) then
  begin
    crSellMargin.Value := CDSSupp.FieldByName('BRGSUP_MARK_UP').AsFloat;
    cxLookupSatuanJual.EditValue := CDSSupp.FieldByName('BRGSUP_MARK_UP').AsString;
  end;
end;

procedure TfrmDialogProduct.UpdateAvailableSat;
var
  lCDS: TClientDataSet;
  lModKonv: TModKonversi;
begin
  CDSAvailableKonv.EmptyDataSet;
  lCDS := TClientDataSet.Create(Self);
  lModKonv := TModKonversi.Create; //mempermudah akses saja
  Try
    lCDS.CloneCursor(CDSKonv, True);
    lCDS.First;
    while not lCDS.Eof do
    begin
      lModKonv.SetFromDataset(lCDS);
      CDSAvailableKonv.Append;
      CDSAvailableKonv.FieldByName('ID').AsString := lModKonv.Satuan.ID;
      CDSAvailableKonv.FieldByName('Konversi').AsFloat := lModKonv.KONVSAT_SCALE;

      if CDSSatuan.Locate('Ref$Satuan_ID', lModKonv.Satuan.ID, [loCaseInsensitive]) then
        CDSAvailableKonv.FieldByName('Satuan').AsString := CDSSatuan.FieldByName('SAT_CODE').AsString;

      CDSAvailableKonv.Post;

      lCDS.Next;
    end;

    cxLookupSatuanJual.Properties.View.ApplyBestFit();
    cxLookupBRSUom.Properties.View.ApplyBestFit();
  Finally
    lModKonv.Free;
    lCDS.Free;
  End;
end;

procedure TfrmDialogProduct.UpdateDataItem;
var
  i: Integer;
  lBS: TModBarangSupplier;
  lHJ: TModBarangHargaJual;
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

  CDSHargaJual.First;
  while not CDSHargaJual.eof do
  begin
    lHJ := TModBarangHargaJual.Create;
    lHJ.SetFromDataset(CDSHargaJual);
    ModBarang.HargaJual.Add(lHJ);
    CDSHargaJual.Next;
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
