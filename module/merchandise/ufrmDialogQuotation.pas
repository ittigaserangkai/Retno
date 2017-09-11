unit ufrmDialogQuotation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialogBrowse, ExtCtrls, StdCtrls,
  ufrmQuotation, uRetnoUnit,DB,jpeg, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, cxGroupBox, cxCheckBox,
  Vcl.Menus, cxButtons, cxCurrencyEdit, ufrmMasterDialog, cxGridBandedTableView,
  cxSplitter, cxGridDBBandedTableView, uInterface, Datasnap.DBClient, cxMemo,
  uModQuotation;

type

  TfrmDialogQuotation = class(TfrmMasterDialog, ICrudAble)
    cxGroupBox1: TcxGroupBox;
    Label6: TLabel;
    cxLookupSupplierMerchan: TcxExtLookupComboBox;
    Label7: TLabel;
    cxLookupMerchan: TcxExtLookupComboBox;
    dtEffective: TcxDateEdit;
    Label8: TLabel;
    Label9: TLabel;
    dtEnd: TcxDateEdit;
    ckIsMailer: TcxCheckBox;
    Label10: TLabel;
    Label11: TLabel;
    edQuotNo: TcxTextEdit;
    cxGridMasterLevel1: TcxGridLevel;
    cxGridMaster: TcxGrid;
    cxGrdDBHeader: TcxGridDBBandedTableView;
    cxSplitter1: TcxSplitter;
    colHeaderBrgCode: TcxGridDBBandedColumn;
    colHeaderBrgName: TcxGridDBBandedColumn;
    colHeaderSatuan: TcxGridDBBandedColumn;
    colHeaderBuyPrice: TcxGridDBBandedColumn;
    colHeaderBuyDisc1: TcxGridDBBandedColumn;
    colHeaderBuyDisc2: TcxGridDBBandedColumn;
    colHeaderBuyDisc3: TcxGridDBBandedColumn;
    colHeaderNetPrice: TcxGridDBBandedColumn;
    colHeaderMargin: TcxGridDBBandedColumn;
    colHeaderSellPrice: TcxGridDBBandedColumn;
    colHeaderSellDiscPerc: TcxGridDBBandedColumn;
    colHeaderSellDiscRp: TcxGridDBBandedColumn;
    colHeaderSellNetPrice: TcxGridDBBandedColumn;
    colHeaderSellPricePPN: TcxGridDBBandedColumn;
    mmRemark: TcxMemo;
    colHeaderBuyPricePPN: TcxGridDBBandedColumn;
    pmHeader: TPopupMenu;
    SetHargaBeliHargaIncludePPN1: TMenuItem;
    gbSuppOption: TcxGroupBox;
    ckShowPPN: TcxCheckBox;
    chkUpdateSellPrice: TcxCheckBox;
    colHeaderUpdateSellPrice: TcxGridDBBandedColumn;
    pnlDetail: TcxGroupBox;
    cxGridDetail: TcxGrid;
    cxGrdDBDetail: TcxGridDBTableView;
    colDetailTipeHarga: TcxGridDBColumn;
    colDetailSatuan: TcxGridDBColumn;
    colDetailKonversi: TcxGridDBColumn;
    cxGrdDBDetailColumn1: TcxGridDBColumn;
    colDetailMargin: TcxGridDBColumn;
    colDetailSellPrice: TcxGridDBColumn;
    colDetailSellDiscPerc: TcxGridDBColumn;
    colDetailSellDiscRp: TcxGridDBColumn;
    colDetailSellNetPrice: TcxGridDBColumn;
    colDetailSellPricePPN: TcxGridDBColumn;
    cxGrdDBDetailColumn2: TcxGridDBColumn;
    cxGrdDBDetailColumn3: TcxGridDBColumn;
    cxGrdDBDetailColumn4: TcxGridDBColumn;
    cxGrdDBDetailColumn5: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGroupBox2: TcxGroupBox;
    btnAddSat: TcxButton;
    btnDelSat: TcxButton;
    pmDetail: TPopupMenu;
    SetHargaJualiHargaIncludePPN1: TMenuItem;
    cxGroupBox3: TcxGroupBox;
    btnAddProd: TcxButton;
    btnDelProd: TcxButton;
    btnActivate: TcxButton;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxLookupMerchanPropertiesEditValueChanged(Sender: TObject);
    procedure colHeaderBuyPricePropertiesEditValueChanged(Sender: TObject);
    procedure colHeaderBuyDisc1PropertiesEditValueChanged(Sender: TObject);
    procedure colHeaderBuyDisc2PropertiesEditValueChanged(Sender: TObject);
    procedure colHeaderBuyDisc3PropertiesEditValueChanged(Sender: TObject);
    procedure SetHargaBeliHargaIncludePPN1Click(Sender: TObject);
    procedure colDetailSellPricePropertiesEditValueChanged(Sender: TObject);
    procedure colDetailSellDiscPercPropertiesEditValueChanged(Sender: TObject);
    procedure colDetailSellDiscRpPropertiesEditValueChanged(Sender: TObject);
    procedure colDetailMarginPropertiesEditValueChanged(Sender: TObject);
    procedure btnDelKonvClick(Sender: TObject);
    procedure SetHargaJualiHargaIncludePPN1Click(Sender: TObject);
    procedure btnAddProdClick(Sender: TObject);
    procedure btnDelProdClick(Sender: TObject);
    procedure ckShowPPNPropertiesEditValueChanged(Sender: TObject);
    procedure btnAddSatClick(Sender: TObject);
    procedure btnDelSatClick(Sender: TObject);
    procedure colDetailSatuanPropertiesEditValueChanged(Sender: TObject);
    procedure btnActivateClick(Sender: TObject);
  private
    FCDSHeader: TClientDataSet;
    FCDSDetail: TClientDataSet;
    FCDSSuplierMerchan: TClientDataSet;
    FModQuotation: TModQuotation;
    procedure AddProduct;
    procedure AddSellPrice;
    procedure CalculateNetBuyPrice;
    procedure CalculateNetSellPrice(Sender: TcxGridDBColumn);
    procedure CheckAndUpdateKonversi;
    procedure DeleteProduct;
    procedure DeleteSellPrice;
    function GetCDSHeader: TClientDataSet;
    function GetCDSDetail: TClientDataSet;
    function GetCDSSuplierMerchan: TClientDataSet;
    function GetModQuotation: TModQuotation;
    procedure InitReadOnly;
    procedure initView;
    procedure LoadHargaJual;
    procedure UpdateData;
    procedure UpdateSellingPrice(IsUpdateSellPrice: Boolean = True);
    function ValidateData: Boolean;
    property CDSHeader: TClientDataSet read GetCDSHeader write FCDSHeader;
    property CDSDetail: TClientDataSet read GetCDSDetail write FCDSDetail;
    property CDSSuplierMerchan: TClientDataSet read GetCDSSuplierMerchan write
        FCDSSuplierMerchan;
    property ModQuotation: TModQuotation read GetModQuotation write FModQuotation;
  public
    procedure InitActivation(aAktivasi: Boolean = True);
    procedure LoadData(aID: String);
  end;


var
  frmDialogQuotation: TfrmDialogQuotation;


implementation

uses  uTSCommonDlg, ufrmSearchProduct, DateUtils, Math, uConstanta, uAppUtils,
  uDBUtils, uDXUtils, uDMClient, ufrmCXLookup, uModBarang, uModSuplier,
  uClientClasses;

{$R *.dfm}

procedure TfrmDialogQuotation.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if ModQuotation.IsProcessed=1 then
  begin
    TAppUtils.Warning('Quotation sudah diaktivasi tidak bisa dihapus');
    exit;
  end;
  Try
    DMClient.CrudClient.DeleteFromDB(ModQuotation);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.ModalResult := mrOk;
  except
    TAppUtils.Error(ER_DELETE_FAILED);
    raise;
  End;
end;

procedure TfrmDialogQuotation.actSaveExecute(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  Try
    ModQuotation.ID := DMClient.CrudClient.SaveToDBID(ModQuotation);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    Self.ModalResult := mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  End;
end;

procedure TfrmDialogQuotation.AddProduct;
var
  frm: TfrmCXLookup;
  lCDS: TClientDataSet;
begin
  inherited;
  if VarIsNull(cxLookupSupplierMerchan.EditValue) then
  begin
    TAppUtils.Warning('Supplier Merchan harap dipilih terlebih dahulu');
    exit;
  end;

  lCDS := TClientDataSet(
    DMClient.DSProviderClient.BarangQuotation_GetDSLookup(cxLookupSupplierMerchan.EditValue)
  );

  frm := TfrmCXLookup.Execute(lCDS, True);
  Try
    frm.HideFields(['BARANG_SUPLIER_ID', 'BARANG_ID', 'SUPLIER_ID', 'SUP_CODE',
      'SUP_NAME', 'SUPLIER_MERCHAN_GRUP_ID', 'REF$SATUAN_PURCHASE']);
    if frm.ShowModal = mrOk then
    begin
      while not frm.Data.eof do
      begin
        if not CDSHeader.Locate('Barang', frm.Data.FieldByName('BARANG_ID').AsString, [loCaseInsensitive]) then
        begin
          CDSHeader.Append;
          CDSHeader.SetFieldFrom('BrgCode', frm.Data, 'BRG_CODE');
          CDSHeader.SetFieldFrom('Satuan', frm.Data, 'REF$SATUAN_PURCHASE');
          CDSHeader.SetFieldFrom('BrgName', frm.Data, 'BRG_NAME');
          CDSHeader.SetFieldFrom('BuyPrice', frm.Data, 'BuyPrice');
          CDSHeader.SetFieldFrom('BuyDisc1', frm.Data, 'Disc1');
          CDSHeader.SetFieldFrom('BuyDisc2', frm.Data, 'Disc2');
          CDSHeader.SetFieldFrom('BuyDisc3', frm.Data, 'Disc3');
          CDSHeader.SetFieldFrom('BuyNetPrice', frm.Data, 'NetPrice');
          CDSHeader.SetFieldFrom('Konversi', frm.Data, 'Konversi');
          CDSHeader.SetFieldFrom('Barang', frm.Data, 'BARANG_ID');
          CDSHeader.SetFieldFrom('IsBKP', frm.Data, 'Is_BKP');
          CDSHeader.SetFieldFrom('Margin', frm.Data, 'BRGSUP_MARK_UP');
          CDSHeader.SetFieldFrom('BarangSupplier', frm.Data, 'BARANG_SUPLIER_ID');
          if chkUpdateSellPrice.Checked then
            CDSHeader.FieldByName('IsUpdateSellPrice').AsInteger := 1
          else
            CDSHeader.FieldByName('IsUpdateSellPrice').AsInteger := 0;

          CDSHeader.Post;
          CalculateNetBuyPrice;

          LoadHargaJual;
        end;
        frm.Data.Next;
      end;
    end;
  Finally
    frm.Free;
    lCDS.Free;
  End;
end;

procedure TfrmDialogQuotation.AddSellPrice;
begin
  CDSDetail.Append;
  CDSDetail.FieldByName('Barang').AsString          := CDSHeader.FieldByName('Barang').AsString;
  CDSDetail.FieldByName('BarangSupplier').AsString  := CDSHeader.FieldByName('BarangSupplier').AsString;
//  CDSDetail.FieldByName('TipeHarga').AsString       := '';
//  CDSDetail.FieldByName('Satuan').AsString          := '';
  CDSDetail.FieldByName('SellPrice').AsFloat        := 0;
  CDSDetail.FieldByName('SellDiscPercent').AsFloat  := 0;
  CDSDetail.FieldByName('SellDiscRp').AsFloat       := 0;
  CDSDetail.FieldByName('Konversi').AsFloat         := 0;
  CDSDetail.FieldByName('Margin').AsFloat           := 0;
  CDSDetail.FieldByName('BuyPrice').AsFloat         := 0;
  CDSDetail.FieldByName('BuyDisc1').AsFloat         := 0;
  CDSDetail.FieldByName('BuyDisc2').AsFloat         := 0;
  CDSDetail.FieldByName('BuyDisc3').AsFloat         := 0;
  CDSDetail.FieldByName('BuyNetPrice').AsFloat      := 0;
  CDSDetail.FieldByName('IsBKP').AsInteger          := CDSHeader.FieldByName('IsBKP').AsInteger;
  CDSDetail.FieldByName('IsBKP').AsInteger  := CDSHeader.FieldByName('IsBKP').AsInteger;

  CDSDetail.Post;
end;

procedure TfrmDialogQuotation.btnDelKonvClick(Sender: TObject);
begin
  inherited;
  DeleteProduct;
end;

procedure TfrmDialogQuotation.CalculateNetBuyPrice;
var
  dDisc1: Double;
  dDisc2: Double;
  dDisc3: Double;
  dNet: Double;
  dPrice: Double;
begin
  if CDSHeader.State in [dsEdit] then CDSHeader.Post;

  dPrice  := CDSHeader.FieldByName('BuyPrice').AsFloat;
  dDisc1  := CDSHeader.FieldByName('BuyDisc1').AsFloat * dPrice / 100;
  dNet    := dPrice - dDisc1;
  dDisc2  := CDSHeader.FieldByName('BuyDisc2').AsFloat * dNet / 100;
  dNet    := dNet - dDisc2;
  dDisc3  := CDSHeader.FieldByName('BuyDisc3').AsFloat;
  dNet    := dNet - dDisc3;


  CDSHeader.Edit;
  CDSHeader.FieldByName('BuyNetPrice').AsFloat := dNet;
  if CDSHeader.FieldByName('IsBKP').AsInteger = 1 then
    CDSHeader.FieldByName('BuyPricePPN').AsFloat := dNet * 1.1;
  CDSHeader.Post;

  UpdateSellingPrice(CDSHeader.FieldByName('IsUpdateSellPrice').AsInteger=1);
end;

procedure TfrmDialogQuotation.CalculateNetSellPrice(Sender: TcxGridDBColumn);
var
  dBuyPrice: Double;
  dDiscRp: Double;
  dDiscPr: Double;
  dMargin: Double;
  dNet: Double;
  dPrice: Double;
begin
  if CDSDetail.State in [dsEdit] then CDSDetail.Post;

  dMargin     := CDSDetail.FieldByName('Margin').AsFloat;
  dDiscRp     := CDSDetail.FieldByName('SellDiscRp').AsFloat;
  dDiscPr     := CDSDetail.FieldByName('SellDiscPercent').AsFloat;
  dPrice      := CDSDetail.FieldByName('SellPrice').AsFloat;
  dBuyPrice   := CDSDetail.FieldByName('BuyNetPrice').AsFloat;

  if Sender = colDetailMargin then
  begin
    dPrice  := dBuyPrice * (100+dMargin)/100;
    dDiscRp := dPrice * dDiscRp/100;
  end else if (Sender = colDetailSellPrice) and (dBuyPrice<>0) then
  begin
    dMargin := (dPrice-dBuyPrice) / dBuyPrice * 100;
  end else if Sender = colDetailSellDiscPerc then
  begin
    dDiscRp := dPrice * dDiscPr/100;
  end else if (Sender = colDetailSellDiscRp) and (dPrice<>0) then
  begin
    dDiscPr := dDiscRp / dPrice * 100;
  end;

  dNet      := dPrice - dDiscRp;

  CDSDetail.Edit;
  CDSDetail.FieldByName('SellPrice').AsFloat          := dPrice;
  CDSDetail.FieldByName('Margin').AsFloat             := dMargin;
  CDSDetail.FieldByName('SellDiscPercent').AsFloat    := dDiscRp;
  CDSDetail.FieldByName('SellDiscRp').AsFloat         := dDiscPr;
  CDSDetail.FieldByName('SellNetPrice').AsFloat       := dNet;
  if CDSHeader.FieldByName('IsBKP').AsInteger = 1 then
    CDSDetail.FieldByName('SellPricePPN').AsFloat := dNet * 1.1;
  CDSDetail.Post;
end;

procedure TfrmDialogQuotation.CheckAndUpdateKonversi;
var
  i: Integer;
  lBarang: TModBarang;
  lBarangID: string;
  lSatCode: string;
  lSatuanID: string;
begin
  if CDSDetail.State in [dsEdit] then CDSDetail.Post;
  lBarangID := CDSHeader.FieldByName('Barang').AsString;
  lSatuanID := CDSDetail.FieldByName('Satuan').AsString;
  lSatCode  := VarToStr(cxGrdDBDetail.DataController.Values[cxGrdDBDetail.DataController.FocusedRecordIndex, colDetailSatuan.Index]);
  lBarang   := DMClient.CrudClient.Retrieve(TModBarang.ClassName, lBarangID) as TModBarang;
  Try
    CDSDetail.Edit;
    CDSDetail.FieldByName('Konversi').AsFloat := 0;
    CDSDetail.FieldByName('Satuan').AsString  := '';
    for i := 0 to lBarang.Konversi.Count-1 do
    begin
      if lBarang.Konversi[i].Satuan.ID = lSatuanID then
      begin
        CDSDetail.FieldByName('Konversi').AsFloat := lBarang.Konversi[i].KONVSAT_SCALE;
        CDSDetail.FieldByName('Satuan').AsString  := lSatuanID;
      end;
    end;
    CDSDetail.Post;

    if CDSDetail.FieldByName('Satuan').AsString <> '' then
      UpdateSellingPrice(CDSHeader.FieldByName('IsUpdateSellPrice').AsInteger=1)
    else
      TAppUtils.Error('Satuan ' + lSatCode + ' tidak ditemukan di daftar Konversi Product ' + lBarang.BRG_NAME );

  Finally
    lBarang.Free;
  End;
end;

procedure TfrmDialogQuotation.ckShowPPNPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  colDetailSellPricePPN.Visible               := ckShowPPN.Checked;
  colHeaderBuyPricePPN.Position.Band.Visible  := ckShowPPN.Checked;
end;

procedure TfrmDialogQuotation.colDetailMarginPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalculateNetSellPrice(colDetailMargin);
end;

procedure TfrmDialogQuotation.colDetailSatuanPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CheckAndUpdateKonversi;
end;

procedure TfrmDialogQuotation.colDetailSellDiscPercPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalculateNetSellPrice(colDetailSellDiscPerc);
end;

procedure TfrmDialogQuotation.colDetailSellDiscRpPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalculateNetSellPrice(colDetailSellDiscRp);
end;

procedure TfrmDialogQuotation.colDetailSellPricePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalculateNetSellPrice(colDetailSellPrice);
end;

procedure TfrmDialogQuotation.colHeaderBuyDisc1PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalculateNetBuyPrice();
end;

procedure TfrmDialogQuotation.colHeaderBuyDisc2PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalculateNetBuyPrice();
end;

procedure TfrmDialogQuotation.colHeaderBuyDisc3PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalculateNetBuyPrice();
end;

procedure TfrmDialogQuotation.colHeaderBuyPricePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalculateNetBuyPrice();
end;

procedure TfrmDialogQuotation.btnAddSatClick(Sender: TObject);
begin
  inherited;
  AddSellPrice;
end;

procedure TfrmDialogQuotation.btnDelSatClick(Sender: TObject);
begin
  inherited;
  DeleteSellPrice;
end;

procedure TfrmDialogQuotation.btnActivateClick(Sender: TObject);
var
  lQuot: TCrudQuotationClient;
begin
  inherited;
  if ModQuotation.ID = '' then
  begin
    TAppUtils.Warning('Harap simpan terlebih dahulu Quotation sebelum aktivasi');
  end;
  lQuot := TCrudQuotationClient.Create(DMClient.RestConn, False);
  Try
    if lQuot.ActivateQuotation(ModQuotation) then
    begin
      TAppUtils.Information('Quotation Berhasil di aktivasi');
      actSave.Enabled := False;
      btnActivate.Enabled := False;
      exit;
    end;
  Finally
    lQuot.Free;
  End;
end;

procedure TfrmDialogQuotation.btnAddProdClick(Sender: TObject);
begin
  inherited;
  AddProduct;
end;

procedure TfrmDialogQuotation.btnDelProdClick(Sender: TObject);
begin
  inherited;
  DeleteProduct;
end;

procedure TfrmDialogQuotation.cxLookupMerchanPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cxLookupSupplierMerchan.DS.Filtered := True;
  cxLookupSupplierMerchan.DS.Filter := '[REF$MERCHANDISE_ID] = ' + QuotedStr(cxLookupMerchan.EditValue);
end;

procedure TfrmDialogQuotation.DeleteProduct;
begin
  CDSHeader.DisableControls;
  CDSDetail.DisableControls;
  Try
    CDSDetail.First;
    while not CDSDetail.Eof do
    begin
      CDSDetail.Delete;
    end;
    CDSHeader.Delete;
  Finally
    CDSHeader.EnableControls;
    CDSDetail.EnableControls;
  End;
end;

procedure TfrmDialogQuotation.DeleteSellPrice;
begin
  If not CDSDetail.Eof then
    CDSDetail.Delete;
end;

procedure TfrmDialogQuotation.FormCreate(Sender: TObject);
begin
  inherited;
  initView;
  LoadData('');
end;

function TfrmDialogQuotation.GetCDSHeader: TClientDataSet;
begin
  If not Assigned(FCDSHeader) then
  begin
    FCDSHeader := TDBUtils.CreateObjectDataSet(TModQuotationDetail, Self, False);
    FCDSHeader.AddField('BrgCode', ftString);
    FCDSHeader.AddField('BrgName', ftString);
//    FCDSHeader.AddField('IsPurchaseUOM', ftBoolean);
//    FCDSHeader.AddField('SellPricePPN', ftFloat);
    FCDSHeader.AddField('BuyPricePPN', ftFloat);
    FCDSHeader.CreateDataSet;
  end;
  Result := FCDSHeader;
end;

function TfrmDialogQuotation.GetCDSDetail: TClientDataSet;
begin
  If not Assigned(FCDSDetail) then
  begin
    FCDSDetail := TDBUtils.CreateObjectDataSet(TModQuotationDetail, Self, False);
    FCDSDetail.AddField('SellNetPrice', ftFloat);
    FCDSDetail.AddField('SellPricePPN', ftFloat);
    FCDSDetail.CreateDataSet;
  end;
  Result := FCDSDetail;
end;

function TfrmDialogQuotation.GetCDSSuplierMerchan: TClientDataSet;
begin
  if not Assigned(FCDSSuplierMerchan) then
  begin
    FCDSSuplierMerchan := TDBUtils.DSToCDS(
      DMClient.DSProviderClient.SuplierMerchan_GetDSLookup, Self);
  end;
  Result := FCDSSuplierMerchan;
end;

function TfrmDialogQuotation.GetModQuotation: TModQuotation;
begin
  if not Assigned(FModQuotation) then
    FModQuotation := TModQuotation.Create;
  Result := FModQuotation;
end;

procedure TfrmDialogQuotation.InitActivation(aAktivasi: Boolean = True);
begin
  btnActivate.Enabled := aAktivasi;
  btnAddProd.Enabled := not aAktivasi;
  btnAddSat.Enabled := not aAktivasi;
  btnDelProd.Enabled := not aAktivasi;
  btnDelSat.Enabled := not aAktivasi;
  actSave.Enabled := not aAktivasi;
end;

procedure TfrmDialogQuotation.InitReadOnly;
begin
  btnActivate.Enabled := False;
  btnAddProd.Enabled := False;
  btnAddSat.Enabled := False;
  btnDelProd.Enabled := False;
  btnDelSat.Enabled := False;
  actSave.Enabled := False;
  actDelete.Enabled := False;
end;

procedure TfrmDialogQuotation.initView;
var
  lCDS: TClientDataSet;
begin
  With DMClient.DSProviderClient do
  begin
    lCDS := TClientDataSet.Create(Self);
    lCDS.CloneCursor(CDSSuplierMerchan, True);
    cxLookupSupplierMerchan.LoadFromCDS(CDSSuplierMerchan,
      'SUPLIER_MERCHAN_GRUP_ID' , 'SUP_NAME',    Self);

    cxLookupSupplierMerchan.SetVisibleColumnsOnly(['SUP_CODE', 'SUP_NAME', 'MERCHANGRUP_NAME']);

    cxLookupMerchan.LoadFromDS(Merchandise_GetDSLookup,
      'REF$MERCHANDISE_ID','MERCHAN_NAME' ,Self);

    TcxExtLookupComboBoxProperties(colHeaderSatuan.Properties).LoadFromDS(
      Satuan_GetDSLookup, 'ref$satuan_id', 'SAT_CODE', Self);
    TcxExtLookupComboBoxProperties(colDetailSatuan.Properties).LoadFromDS(
      Satuan_GetDSLookup, 'ref$satuan_id', 'SAT_CODE', Self);
    TcxExtLookupComboBoxProperties(colDetailTipeHarga.Properties).LoadFromDS(
      TipeHarga_GetDSLookup, 'ref$tipe_harga_id', 'tphrg_name', Self);
  end;

  cxLookupMerchan.SetDefaultValue();
  cxLookupSupplierMerchan.SetMultiPurposeLookup;
  cxGrdDBHeader.PrepareFromCDS(CDSHeader);
  cxGrdDBDetail.PrepareFromCDS(CDSDetail);
  cxGrdDBHeader.OptionsView.Header := False;

  CDSDetail.IndexFieldNames := 'Barang';
  CDSDetail.MasterSource := cxGrdDBHeader.DataController.DataSource;
  CDSDetail.MasterFields := 'Barang';


  //debug only
  cxLookupMerchan.DS.Locate('MERCHAN_NAME','DRY FOOD', [loCaseInsensitive]);
  cxLookupMerchan.EditValue := cxLookupMerchan.DS.FieldByName('REF$MERCHANDISE_ID').AsString;
  cxLookupSupplierMerchan.EditValue := '5C729EEC-6E9C-4E95-8EA0-BE8D8586B71F';


end;

procedure TfrmDialogQuotation.LoadData(aID: String);
var
  i: Integer;
  lBarang: TModBarang;
  lDetail: TModQuotationDetail;
begin
  if aID <> '' then
     FModQuotation := DMClient.CrudClient.Retrieve(TModQuotation.ClassName, aID) as TModQuotation
  else begin
    ModQuotation.RefNo := DMClient.CrudClient.GenerateNo(TModQuotation.ClassName);
    ModQuotation.EffectiveDate := Now();
    ModQuotation.EndDate := Now();
    ModQuotation.Remark := '';
    ModQuotation.Details.Clear;
  end;

  edQuotNo.Text         := ModQuotation.RefNo;
  dtEffective.Date      := ModQuotation.EffectiveDate;
  dtEnd.Date            := ModQuotation.EndDate;
  mmRemark.Lines.Text   := ModQuotation.Remark;
  ckIsMailer.EditValue  := ModQuotation.IsMailer;

  if Assigned(ModQuotation.Merchandise) then
    cxLookupMerchan.EditValue := ModQuotation.Merchandise.ID;

  if Assigned(ModQuotation.SupplierMerchanGroup) then
    cxLookupSupplierMerchan.EditValue := ModQuotation.SupplierMerchanGroup.ID;


  lBarang := TModBarang.Create;
  for i := 0 to ModQuotation.Details.Count-1 do
  begin
    lDetail := ModQuotation.Details[i];

    if lBarang.ID <> lDetail.Barang.ID then FreeAndNil(lBarang);

    if lBarang = nil then
      lBarang := DMClient.CrudClient.Retrieve(TModBarang.ClassName, lDetail.Barang.ID) as TModBarang;


    if lDetail.IsSellingPrice = 1 then
    begin
      CDSDetail.Append;
      lDetail.UpdateToDataset(CDSDetail);
      CDSDetail.FieldByName('SellNetPrice').AsFloat := lDetail.SellPrice - lDetail.SellDiscRp;
      CDSDetail.FieldByName('SellPricePPN').AsFloat := CDSDetail.FieldByName('SellNetPrice').AsFloat;
      if lDetail.IsBKP = 1 then
        CDSDetail.FieldByName('SellPricePPN').AsFloat := CDSDetail.FieldByName('SellNetPrice').AsFloat * 1.1;
      CDSDetail.Post;
    end else
    begin
      CDSHeader.Append;
      lDetail.UpdateToDataset(CDSHeader);
      CDSHeader.FieldByName('BrgCode').AsString     := lBarang.BRG_CODE;
      CDSHeader.FieldByName('BrgName').AsString     := lBarang.BRG_NAME;
      CDSHeader.FieldByName('BuyPricePPN').AsFloat  := lDetail.BuyNetPrice;
      if lDetail.IsBKP = 1 then
        CDSHeader.FieldByName('BuyPricePPN').AsFloat := lDetail.BuyNetPrice * 1.1;
      CDSHeader.Post;
    end;
  end;
  InitActivation(False);

  if ModQuotation.IsProcessed=1 then InitReadOnly;
end;

procedure TfrmDialogQuotation.LoadHargaJual;
var
  dProportion: Double;
  i: Integer;
  lBarang: TModBarang;
  lBarangID: String;
  lRecNO: Integer;
begin
  lRecNO := CDSHeader.RecNo;
  CDSHeader.DisableControls;
  CDSDetail.DisableControls;
  Try
    lBarangID := CDSHeader.FieldByName('Barang').AsString;
    lBarang := DMClient.CrudClient.Retrieve(TModBarang.ClassName, lBarangID) as TModBarang;
    Try
      //existing
      for i:=0 to lBarang.HargaJual.Count-1 do
      begin
        CDSDetail.Append;
        CDSDetail.FieldByName('Barang').AsString          := lBarang.ID;
        CDSDetail.FieldByName('BarangSupplier').AsString  := CDSHeader.FieldByName('BarangSupplier').AsString;
        CDSDetail.FieldByName('TipeHarga').AsString       := lBarang.HargaJual[i].TipeHarga.ID;
        CDSDetail.FieldByName('Satuan').AsString          := lBarang.HargaJual[i].Satuan.ID;
        CDSDetail.FieldByName('SellPrice').AsFloat        := lBarang.HargaJual[i].BHJ_SELL_PRICE;
        CDSDetail.FieldByName('SellDiscPercent').AsFloat  := lBarang.HargaJual[i].BHJ_DISC_PERSEN;
        CDSDetail.FieldByName('SellDiscRp').AsFloat       := lBarang.HargaJual[i].BHJ_DISC_NOMINAL;
        CDSDetail.FieldByName('Konversi').AsFloat         := lBarang.HargaJual[i].BHJ_CONV_VALUE;

        //data master produk masih salah
        CDSDetail.FieldByName('Margin').AsFloat           := lBarang.HargaJual[i].BHJ_MARK_UP;
        if lBarang.HargaJual[i].BHJ_MARK_UP = 0 then
          CDSDetail.FieldByName('Margin').AsFloat         := CDSHeader.FieldByName('Margin').AsFloat;
        dProportion := lBarang.HargaJual[i].BHJ_CONV_VALUE / CDSHeader.FieldByName('Konversi').AsFloat ;

        CDSDetail.FieldByName('BuyPrice').AsFloat         := dProportion * CDSHeader.FieldByName('BuyPrice').AsFloat;
        CDSDetail.FieldByName('BuyDisc1').AsFloat         := CDSHeader.FieldByName('BuyDisc1').AsFloat;
        CDSDetail.FieldByName('BuyDisc2').AsFloat         := CDSHeader.FieldByName('BuyDisc2').AsFloat;
        CDSDetail.FieldByName('BuyDisc3').AsFloat         := dProportion * CDSHeader.FieldByName('BuyDisc3').AsFloat;
        CDSDetail.FieldByName('BuyNetPrice').AsFloat      := dProportion * CDSHeader.FieldByName('BuyNetPrice').AsFloat;
        CDSDetail.FieldByName('IsBKP').AsInteger          := CDSHeader.FieldByName('IsBKP').AsInteger;

        CDSDetail.Post;
        CalculateNetSellPrice(nil);
      end;
    Finally
      FreeAndNil(lBarang);
    End;
  Finally
    CDSHeader.EnableControls;
    CDSDetail.EnableControls;
    CDSHeader.RecNo := lRecNO;
  End;
end;

procedure TfrmDialogQuotation.SetHargaBeliHargaIncludePPN1Click(Sender:
    TObject);
begin
  inherited;
  if CDSHeader.FieldByName('IsBKP').AsInteger <> 1 then exit;

  if CDSHeader.State in [dsEdit] then
    CDSHeader.Post;


  CDSHeader.Edit;
  CDSHeader.FieldByName('BuyPrice').AsFloat := CDSHeader.FieldByName('BuyPrice').AsFloat / 1.1;
  CDSHeader.Post;








  CalculateNetBuyPrice;
end;

procedure TfrmDialogQuotation.SetHargaJualiHargaIncludePPN1Click(Sender:
    TObject);
var
  dSellPrice: Double;
begin
  inherited;

  if CDSDetail.FieldByName('IsBKP').AsInteger <> 1 then exit;

  if CDSDetail.State in [dsEdit] then
    CDSDetail.Post;

  dSellPrice  := CDSDetail.FieldByName('SellPrice').AsFloat / 1.1;

  CDSDetail.Edit;
  CDSDetail.FieldByName('SellPrice').AsFloat  := dSellPrice;
  CDSDetail.Post;

  CalculateNetSellPrice(colDetailSellPrice);
end;

procedure TfrmDialogQuotation.UpdateData;
var
  lDetail: TModQuotationDetail;
begin
  ModQuotation.RefNo          := edQuotNo.Text;
  ModQuotation.TransDate      := Now();
  ModQuotation.EffectiveDate  := dtEffective.Date;
  ModQuotation.EndDate        := dtEnd.Date;
  ModQuotation.Remark         := mmRemark.Text;
  ModQuotation.IsMailer       := ckIsMailer.EditValue;
  ModQuotation.IsProcessed    := 0;
  ModQuotation.Merchandise    := TModMerchandise.CreateID(cxLookupMerchan.EditValue);
  ModQuotation.SupplierMerchanGroup := TModSuplierMerchanGroup.CreateID(cxLookupSupplierMerchan.EditValue);

  ModQuotation.Details.Clear;
  //header
  CDSHeader.First;
  while not CDSHeader.Eof do
  begin
    lDetail                 := TModQuotationDetail.Create;
    lDetail.SetFromDataset(CDSHeader);
    lDetail.IsSellingPrice  := 0;
    lDetail.Tax             := 10; //sementara hardcode
    ModQuotation.Details.Add(lDetail);

    CDSDetail.First;
    while not CDSDetail.Eof do
    begin
      lDetail                 := TModQuotationDetail.Create;
      lDetail.SetFromDataset(CDSDetail);
      lDetail.IsSellingPrice  := 1;
      lDetail.Tax             := 10; //sementara hardcode
      ModQuotation.Details.Add(lDetail);
      CDSDetail.Next;
    end;
    CDSHeader.Next;
  end;
end;

procedure TfrmDialogQuotation.UpdateSellingPrice(IsUpdateSellPrice: Boolean =
    True);
var
  dBuyPrice: Double;
  dMargin: Double;
  dProportion: Double;
  dSellPrice: Double;
  lRecNo: Integer;
begin
  if CDSHeader.State in [dsEdit] then CDSHeader.Post;

  lRecNo := CDSDetail.RecNo;
  CDSDetail.DisableControls;
  try
    CDSDetail.First;
    while not CDSDetail.Eof do
    begin
      CDSDetail.Edit;

      //new
      dProportion := 1;
      if CDSHeader.FieldByName('Konversi').AsFloat <> 0 then
        dProportion := CDSDetail.FieldByName('Konversi').AsFloat / CDSHeader.FieldByName('Konversi').AsFloat ;
      CDSDetail.FieldByName('BuyPrice').AsFloat         := dProportion * CDSHeader.FieldByName('BuyPrice').AsFloat;
      CDSDetail.FieldByName('BuyDisc1').AsFloat         := CDSHeader.FieldByName('BuyDisc1').AsFloat;
      CDSDetail.FieldByName('BuyDisc2').AsFloat         := CDSHeader.FieldByName('BuyDisc2').AsFloat;
      CDSDetail.FieldByName('BuyDisc3').AsFloat         := dProportion * CDSHeader.FieldByName('BuyDisc3').AsFloat;
      CDSDetail.FieldByName('BuyNetPrice').AsFloat      := dProportion * CDSHeader.FieldByName('BuyNetPrice').AsFloat;

      //fixed margin
      dMargin     := CDSDetail.FieldByName('Margin').AsFloat;
      dSellPrice  := CDSDetail.FieldByName('SellPrice').AsFloat;
      dBuyPrice   := CDSDetail.FieldByName('BuyNetPrice').AsFloat;

      if IsUpdateSellPrice then
        dSellPrice := (100+dMargin)/100 * dBuyPrice
      else if dBuyPrice <> 0 then
        dMargin := (dSellPrice-dBuyPrice)/dBuyPrice * 100;

      CDSDetail.FieldByName('Margin').AsFloat       := dMargin;
      CDSDetail.FieldByName('SellPrice').AsFloat    := dSellPrice;
      CDSDetail.FieldByName('SellNetPrice').AsFloat := dSellPrice - CDSDetail.FieldByName('SellDiscRp').AsFloat;
      if CDSHeader.FieldByName('IsBKP').AsInteger = 1 then
        CDSDetail.FieldByName('SellPricePPN').AsFloat := CDSDetail.FieldByName('SellNetPrice').AsFloat * 1.1;

      CDSDetail.Post;
      CDSDetail.Next;
    end;
  finally
    CDSDetail.RecNo := lRecNo;
    CDSDetail.EnableControls;
  end;

end;

function TfrmDialogQuotation.ValidateData: Boolean;
begin
  Result := False;

  if VarIsNull(cxLookupMerchan.EditValue) then
  begin
    TAppUtils.Warning('Merchan belum diisi');
    exit;
  end;

  if VarIsNull(cxLookupSupplierMerchan.EditValue) then
  begin
    TAppUtils.Warning('Supplier belum diisi');
    exit;
  end;

  if CDSHeader.RecordCount = 0 then
  begin
    TAppUtils.Warning('Data Produk kosong');
    exit;
  end;

  if not Result then Result := True;
end;

end.
