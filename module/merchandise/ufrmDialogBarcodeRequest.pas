unit ufrmDialogBarcodeRequest;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms,
  ufrmMasterDialogBrowse, StdCtrls, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.Menus, cxLabel, Vcl.ComCtrls, dxCore, cxDateUtils, cxButtonEdit,
  cxButtons, cxCurrencyEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, uAppUtils, uDMClient, ufrmCXLookup, uDBUtils, Datasnap.DBClient,
  uModTransferBarang, uModBarcodeRequest, uModSuplier, uModelHelper,
  ufrmMasterDialog, uModBarang, System.Variants, uDXUtils, uConstanta,
  uInterface, uModSatuan, cxMemo;

type
  TProcessType = (ptAdd, ptEdit, ptNone);
  TfrmDialogBarcodeRequest = class(TfrmMasterDialog, ICRUDAble)
    Panel1: TPanel;
    lbl1: TLabel;
    lbl3: TLabel;
    lbl6: TLabel;
    edtSupplierName: TEdit;
    edtBarNo: TEdit;
    Label2: TLabel;
    dtTgl: TcxDateEdit;
    edbSupplierCode: TcxButtonEdit;
    curredtUnitPrice: TcxCurrencyEdit;
    grpPurchaseOrder: TGroupBox;
    lbl7: TLabel;
    lbl8: TLabel;
    edtDatePO: TcxDateEdit;
    edPO: TcxButtonEdit;
    cxgrdBR: TcxGrid;
    cxGridTableBR: TcxGridTableView;
    cxgrdlBR: TcxGridLevel;
    cxGridTableColCode: TcxGridColumn;
    cxGridTableColNama: TcxGridColumn;
    cxGridTableColUOM: TcxGridColumn;
    cxGridTableColBarcode: TcxGridColumn;
    cxGridTableColQTY: TcxGridColumn;
    cxGridTableColHarga: TcxGridColumn;
    cxGridTableColTotal: TcxGridColumn;
    cxGridTableColPLU_ID: TcxGridColumn;
    cxGridTableColUOMid: TcxGridColumn;
    memDesc: TcxMemo;
    Label1: TLabel;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure curredtUnitPriceExit(Sender: TObject);
    procedure edbSupplierCodeExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edbSupplierCodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edPOKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edPOPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edtDatePOPropertiesInitPopup(Sender: TObject);
    procedure cxGridTableColCodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxGridTableColCodePropertiesEditValueChanged(Sender: TObject);
    procedure cxGridTableColUOMPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxGridTableBRDataControllerNewRecord(
      ADataController: TcxCustomDataController; ARecordIndex: Integer);
    procedure cxGridTableColQTYPropertiesEditValueChanged(Sender: TObject);
    procedure cxGridTableColHargaPropertiesEditValueChanged(Sender: TObject);
    procedure cxGridTableColCodePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridTableColBarcodePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    FCDSBarang: TClientDataset;
    FModbarcodeRequest: TModBarcodeRequest;
    procedure DeleteData;
    function GetModbarcodeRequest: TModBarcodeRequest;
    procedure LookupSuplier;
    procedure LookupNoPO;
    procedure LoadDetailPO(AID: String);
    procedure LookupBarang;
    procedure LookupUOM(ABarangID: String);
    procedure SetBarangToGrid(APLU, ASatuanID: String);
    procedure SetSUPMG(ASupMG: String);
    procedure SimpanData;
    procedure UpdateBarcodePrice;
    procedure UpdateData;
    procedure UpdateTotalBarcodePrice;
    function ValidateData: Boolean;
    function ValidateSUPMG: Boolean;
    property CDSBarang: TClientDataset read FCDSBarang write FCDSBarang;
    property ModbarcodeRequest: TModBarcodeRequest read GetModbarcodeRequest write
        FModbarcodeRequest;
  public
    procedure LoadData(AID : String);
    { Public declarations }
  published
  end;

var
  frmDialogBarcodeRequest: TfrmDialogBarcodeRequest;
  IsSuccessfull : Boolean;


implementation

uses  
  
  uTSCommonDlg, uRetnoUnit, uModPO;

{$R *.dfm}

procedure TfrmDialogBarcodeRequest.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if TAppUtils.Confirm('Anda Yakin Menghapus Data') then DeleteData;
end;

procedure TfrmDialogBarcodeRequest.actSaveExecute(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  SimpanData;
end;

procedure TfrmDialogBarcodeRequest.curredtUnitPriceExit(Sender: TObject);
begin
  inherited;
  UpdateBarcodePrice;
  UpdateTotalBarcodePrice;
end;

procedure TfrmDialogBarcodeRequest.cxGridTableBRDataControllerNewRecord(
  ADataController: TcxCustomDataController; ARecordIndex: Integer);
begin
  inherited;
  cxGridTableBR.DataController.Values[ARecordIndex, cxGridTableColHarga.Index] := curredtUnitPrice.Value;
end;

procedure TfrmDialogBarcodeRequest.cxGridTableColBarcodePropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
  var
  iCurrentRow: Integer;
  lPLU: string;
  lUOMID: string;
  sPLU: String;
begin
  inherited;
  iCurrentRow := cxGridTableBR.DataController.FocusedRecordIndex;
  lPLU := DisplayValue;
  lUOMID := cxGridTableBR.DataController.Values[iCurrentRow, cxGridTableColUOMid.Index];
  SetBarangToGrid(lPLU, lUOMID);
end;

procedure TfrmDialogBarcodeRequest.cxGridTableColCodePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  if not ValidateSUPMG then exit;
  LookupBarang;
end;

procedure TfrmDialogBarcodeRequest.cxGridTableColCodePropertiesEditValueChanged(
  Sender: TObject);
var
  iCurrentRow: Integer;
  sPLU: String;
begin
  inherited;
//  if not ValidateSUPMG then exit;
//  cxGridTableBR.DataController.Post();
//  iCurrentRow := cxGridTableBR.DataController.FocusedRecordIndex;
//  sPLU        := vartostr(cxGridTableBR.DataController.Values[iCurrentRow, cxGridTableColCode.Index]);
//  SetBarangToGrid(sPLU);
end;

procedure TfrmDialogBarcodeRequest.cxGridTableColCodePropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  iCurrentRow: Integer;
  lPLU: string;
  lUOMID: string;
  sPLU: String;
begin
  inherited;
  if ValidateSUPMG then
  begin
//    cxGridTableBR.DataController.Post();
    iCurrentRow := cxGridTableBR.DataController.FocusedRecordIndex;
//    sPLU        := vartostr(cxGridTableBR.DataController.Values[iCurrentRow, cxGridTableColCode.Index]);

    lPLU := DisplayValue;
    lUOMID := VarToStr(cxGridTableBR.DataController.Values[iCurrentRow, cxGridTableColUOMid.Index]);


    FreeAndNil(FCDSBarang);
    CDSBarang := TDBUtils.DSToCDS(DMClient.DSProviderClient.BarangBarcodeBySupMg_GetDSLookup(ModbarcodeRequest.BR_SUPMG.ID), Self);

    if CDSBarang.Locate('BRG_CODE', lPLU, [loCaseInsensitive]) then
      SetBarangToGrid(lPLU, lUOMID)
    else
      TAppUtils.Warning('PLU ' + lPLU + ' tidak ditemukan di barang supplier');
  end
  else
  begin
    ErrorText := '';
    Error := True;
  end;
end;

procedure TfrmDialogBarcodeRequest.cxGridTableColHargaPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  UpdateTotalBarcodePrice;
end;

procedure TfrmDialogBarcodeRequest.cxGridTableColQTYPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  UpdateTotalBarcodePrice;
end;

procedure TfrmDialogBarcodeRequest.cxGridTableColUOMPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  iCurrentRow: Integer;
  LBarangID: string;
begin
  inherited;
  iCurrentRow := cxGridTableBR.DataController.FocusedRecordIndex;
  LBarangID := VarToStr(cxGridTableBR.DataController.Values[iCurrentRow, cxGridTableColPLU_ID.Index]);
  if LBarangID = '' then
    begin
      TAppUtils.Warning('PLU belum dipilih');
      exit;
    end;

  LookupUOM(LBarangID);
end;

procedure TfrmDialogBarcodeRequest.DeleteData;
begin
  if not Assigned(ModbarcodeRequest) then
    Raise Exception.Create('Data not Loaded');

  if ModbarcodeRequest.ID = '' then
  begin
    TAppUtils.Error('Tidak ada data yang dihapus');
    exit;
  end;

  Try
    DMClient.CrudClient.DeleteFromDB(ModbarcodeRequest);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.ModalResult := mrOk;
  except
    TAppUtils.Error(ER_DELETE_FAILED);
    raise;
  End;
end;

procedure TfrmDialogBarcodeRequest.edbSupplierCodeExit(Sender: TObject);
begin
  inherited;
  SetSUPMG(edbSupplierCode.Text);
end;

procedure TfrmDialogBarcodeRequest.FormCreate(Sender: TObject);
begin
  inherited;
  LoadData('');
  //biasanya ini jarang dipanggil untuk form create, tapi ini digunakan untuk
  //generate tanggal hari ini yg ada di 'LoadData'
  //karena 'LoadData' harusnya dengan parameter, maka parameternya dikosongi.
end;

procedure TfrmDialogBarcodeRequest.edbSupplierCodePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  cxGridTableBR.DataController.RecordCount:=0;
  LookupSuplier;
end;

procedure TfrmDialogBarcodeRequest.edPOKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  inherited;
  if KEY =VK_F5 then LookupNoPO;
end;

procedure TfrmDialogBarcodeRequest.edPOPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  LookupNoPO;
end;

procedure TfrmDialogBarcodeRequest.edtDatePOPropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  Abort;
  //tanggal PO udah read only, biat ga perlu klik pilih tanggal lagi
end;

function TfrmDialogBarcodeRequest.GetModbarcodeRequest: TModBarcodeRequest;
begin
  if FModbarcodeRequest = nil then
    FModbarcodeRequest := TModbarcodeRequest.Create;
  Result := FModbarcodeRequest;
end;

procedure TfrmDialogBarcodeRequest.LoadData(AID : String);
var
  i: Integer;
  iCurrentRow: Integer;
  iRec: Integer;
  lItem: TModBarcodeRequestItem;
  lKonvSat: TModKonversi;
//  lModBarang: TModBarang;
begin
  if AID <> '' then
  //untuk identifikasi parameter AID kosong atau isi
  begin
    FModBarcodeRequest          := DMclient.CrudClient.Retrieve(TModBarcodeRequest.ClassName, AID) as TModBarcodeRequest;
    curredtUnitPrice.EditValue  := ModBarcodeRequest.BR_HARGA;
    // dijalankan kl parameter AID terisi
  end else
  begin
    FModBarcodeRequest            := TModBarcodeRequest.Create;
    FModBarcodeRequest.BR_DATE    := Now();
    curredtUnitPrice.EditValue    := TRetno.SettingApp.PRICE_BARCODE_REQ;
    //Tanggal Otomatis

    FModbarcodeRequest.BR_NO      := DMClient.CRUDBarcodeRequest.GenerateNo(ModBarcodeRequest.ClassName);
    //dijalankan kl parameter AID kosong
  end;

  //header
  edtbarNO.Text               := ModBarcodeRequest.BR_NO;
  dtTgl.Date                  := ModBarcodeRequest.BR_DATE;
  memDesc.Text                := ModbarcodeRequest.BR_DESCRIPTION;

  if ModbarcodeRequest.BR_SUPMG <> nil then
  BEGIN
    ModbarcodeRequest.BR_SUPMG.Reload();
    edbSupplierCode.Text := ModbarcodeRequest.BR_SUPMG.SUPMG_SUB_CODE;
    edtSupplierName.Text := ModbarcodeRequest.BR_SUPMG.SUPMG_NAME;
  END;

//  //detail
  cxGridTablebR.ClearRows;
  for i := 0 to ModbarcodeRequest.BarcodeRequestItems.Count-1 do
  begin
    lItem := ModbarcodeRequest.BarcodeRequestItems[i];
    iRec  := cxGridTableBR.DataController.AppendRecord;
    //persingkat dengan buat variabel lokal
    lItem.BRI_BARANG.Reload(True);
    lItem.BRI_SATUAN.Reload();
    cxGridTableBR.DataController.Values[iRec,cxGridTableColPLU_ID.Index]  := litem.BRI_BARANG.ID;
    cxGridTableBR.DataController.Values[iRec,cxGridTableColCode.Index]    := lItem.BRI_BARANG.BRG_CODE;
    cxGridTableBR.DataController.Values[iRec,cxGridTableColNama.Index]    := lItem.BRI_BARANG.BRG_NAME;
    cxGridTableBR.DataController.Values[iRec,cxGridTableColQTY.Index]     := lItem.BRI_QTY;
    cxGridTableBR.DataController.Values[iRec,cxGridTableColUOM.Index]     := lItem.BRI_SATUAN.SAT_CODE;
    cxGridTableBR.DataController.Values[iRec,cxGridTableColUOMid.Index]   := lItem.BRI_SATUAN.ID;

    lKonvSat := lItem.BRI_BARANG.GetKonversiFromUOM(lItem.BRI_SATUAN.ID);
    if lKonvSat <> nil then
      cxGridTableBR.DataController.Values[iRec, cxGridTableColBarcode.Index]  := lKonvSat.KONVSAT_BARCODE;

    cxGridTableBR.DataController.Values[iRec,cxGridTableColHarga.Index]   := lItem.BRI_HARGA;
    cxGridTableBR.DataController.Values[iRec,cxGridTableColTotal.Index]   := lItem.BRI_TOTAL;

  end;
end;

procedure TfrmDialogBarcodeRequest.LookupSuplier;
var
  cxLookupMG: TfrmCXLookup;
  LCDSSupMG: TClientDataset;
begin
  LCDSSupMG := TDBUtils.DSToCDS(DMClient.DSProviderClient.SuplierMerchan_GetDSLookup(), Self);
  cxLookupMG := TfrmCXLookup.Execute(LCDSSupMG);
  Try
    cxLookupMG.HideFields(['suplier_merchan_grup_id']);
    if cxLookupMG.ShowModal = mrOK then
    begin
      SetSUPMG(cxLookupMG.Data.FieldByName('SUPMG_SUB_CODE').AsString);
    end;
  Finally
    cxLookupMG.Free;
    LCDSSupMG.Free;
    //jangan lupa free biar RAM ga tambah beban
  End;
end;

procedure TfrmDialogBarcodeRequest.LookupNoPO;
var
  cxLookup: TfrmCXLookup;
  LCDSPO: TClientDataset;
begin
  LCDSPO := TDBUtils.DSToCDS(DMClient.DSProviderClient.PObySUPMGCODE_GetDSOLookUp(ModbarcodeRequest.BR_SUPMG.ID), Self);
  cxLookup := TfrmCXLookup.Execute(LCDSPO);
  Try
    cxLookup.HideFields(['PO_ID', 'SUPLIER_MERCHAN_GRUP_ID', 'SUPLIER_ID']);
    if cxLookup.ShowModal = mrOK then
    begin
      //ambil data dari cxLookup :
      //cxLookup.Data.FieldByName(namafield).Axxxx
      LoadDetailPO(cxLookup.Data.FieldByName('PO_ID').AsString);

      //isi data dari lookup form
    end;
  Finally
    cxLookup.Free;
    LCDSPO.Free;
    //jangan lupa free biar RAM ga tambah beban
  End;
end;

procedure TfrmDialogBarcodeRequest.LoadDetailPO(AID: String);
var
  i: Integer;
  iRow: Integer;
  lPO: TModPO;
  lPOItem: TModPOItem;

  iCurrentRow: Integer;
  lKonvSat: TModKonversi;
//  lModBarang: TModBarang;

begin
  lPO := TCRUDObj.Retrieve<TModPO>(AID);
  try
    edPO.Text       := lPO.PO_NO;
    edtDatePO.Date  := lPO.PO_DATE;

//    cxGridTableBR.DataController.RecordCount:=0;

    for i := 0 to lPO.POItems.Count-1 do
    begin
      lPOItem := lPO.POItems[i];
      iRow    :=  cxGridTableBR.DataController.AppendRecord;
      lPOItem.POD_BARANG.Reload(True);
      lPOItem.POD_UOM.Reload();
      cxGridTableBR.DataController.Values[iRow, cxGridTableColPLU_ID.Index]   := lPOItem.POD_BARANG.ID;
      cxGridTableBR.DataController.Values[iRow, cxGridTableColCode.Index]     := lPOItem.POD_BARANG.BRG_CODE;
      cxGridTableBR.DataController.Values[iRow, cxGridTableColNama.Index]     := lPOItem.POD_BARANG.BRG_NAME;
      cxGridTableBR.DataController.Values[iRow, cxGridTableColUOM.Index]      := lPOItem.POD_UOM.SAT_CODE;
      cxGridTableBR.DataController.Values[iRow, cxGridTableColUOMid.Index]    := lPOItem.POD_UOM.ID;
//      cxGridTableBR.DataController.Values[iRow, cxGridTableColBarcode.Index]  := lPOItem.POD_BARANG.BRG_CATALOG;

    lKonvSat := lPOItem.POD_BARANG.GetKonversiFromUOM(lPOItem.POD_UOM.ID);
    if lKonvSat <> nil then
      cxGridTableBR.DataController.Values[iRow, cxGridTableColBarcode.Index]  := lKonvSat.KONVSAT_BARCODE;

      cxGridTableBR.DataController.Values[iRow, cxGridTableColQTY.Index]      := lPOItem.POD_QTY_ORDER;
      UpdateBarcodePrice;
      UpdateTotalBarcodePrice;
    end;

  finally
    lPO.Free;
  end;
end;

procedure TfrmDialogBarcodeRequest.LookupBarang;
var
  cxLookup: TfrmCXLookup;
//  lCDS: tclientDataset;
begin
//  if not Assigned(CDSBarang) then
  FreeAndNil(FCDSBarang);
  CDSBarang := TDBUtils.DSToCDS(DMClient.DSProviderClient.BarangBarcodeBySupMg_GetDSLookup(ModbarcodeRequest.BR_SUPMG.ID), Self);
  cxLookup := TfrmCXLookup.Execute(CDSBarang);
  Try
    cxLookup.HideFields(
      ['BARANG_ID','BARANG_SUPLIER_ID','SUPLIER_ID','SUPLIER_MERCHAN_GRUP_ID','REF$SATUAN_ID']
    );
    if cxLookup.ShowModal = mrOK then
    begin
      SetBarangToGrid(cxLookup.Data.FieldByname('BRG_CODE').AsString,
        cxLookup.Data.FieldByname('REF$SATUAN_ID').AsString
      );
    end;
  Finally
    cxLookup.Free;
  End;
end;

procedure TfrmDialogBarcodeRequest.LookupUOM(ABarangID: String);
var
  cxLookup: TfrmCXLookup;
  iCurrentRow: Integer;
  LCDSuom: TClientDataset;
begin
  LCDSuom := TDBUtils.DSToCDS(DMClient.DSProviderClient.KonversiSatuan_GetDS(ABarangID), Self);
  cxLookup := TfrmCXLookup.Execute(LCDSuom);
  Try
    cxLookup.HideFields(['REF$SATUAN_ID', 'BARANG_ID', 'BRG_NAME', 'KONVSAT_SCALE']);
    if cxLookup.ShowModal = mrOK then
    begin
      //ambil data dari cxLookup :
      //cxLookup.Data.FieldByName(namafield).Axxxx
      iCurrentRow := cxGridTableBR.DataController.FocusedRecordIndex;
      cxGridTableBR.DataController.Values[iCurrentRow, cxGridTableColUOMid.Index]  :=  cxLookup.Data.FieldByName('Ref$Satuan_ID').AsString;
      cxGridTableBR.DataController.Values[iCurrentRow, cxGridTableColUOM.Index]    :=  cxLookup.Data.FieldByName('SAT_CODE').AsString;
      SetBarangToGrid( cxGridTableBR.DataController.Values[iCurrentRow, cxGridTableColCode.Index],
        cxGridTableBR.DataController.Values[iCurrentRow, cxGridTableColUOMid.Index]);

      //isi data dari lookup ke grid
    end;
  Finally
    cxLookup.Free;
    LCDSUOM.Free;
  End;
end;

procedure TfrmDialogBarcodeRequest.SetBarangToGrid(APLU, ASatuanID: String);
var
  iCurrentRow: Integer;
  lKonvSat: TModKonversi;
  lModBarang: TModBarang;
begin
  lModBarang := TCRUDObj.RetrieveCode<TModBarang>(APLU);

  //Jare Manda, cara retrieve yg lebih simpel. Tur aku ra paham. wkwkwk
  Try
    iCurrentRow := cxGridTableBR.DataController.FocusedRecordIndex;
    //mendapatkan baris grid yg sedang fokus;

    if lModBarang.ID = '' then
      TAppUtils.Warning('PLU Tidak Ditemukan!');
    //diwoco kudune ngerti, soale jelaske kangelan. wkwkwk

    //cara mengisi grid, format :
    //'namaGrid'.DataController.Values[ 'index baris', 'index kolom'] = xxx
    cxGridTableBR.DataController.Values[iCurrentRow, cxGridTableColCode.Index]      := lModBarang.BRG_CODE;
    cxGridTableBR.DataController.Values[iCurrentRow, cxGridTableColNama.Index]      := lModBarang.BRG_NAME;
    cxGridTableBR.DataController.Values[iCurrentRow, cxGridTableColPLU_ID.Index]    := lModBarang.ID;

    lKonvSat := lModBarang.GetKonversiFromUOM(ASatuanID);
    if lKonvSat <> nil then
    begin
      lKonvSat.Satuan.Reload();
      cxGridTableBR.DataController.Values[iCurrentRow, cxGridTableColBarcode.Index] := lKonvSat.KONVSAT_BARCODE;
      cxGridTableBR.DataController.Values[iCurrentRow, cxGridTableColUOM.Index]     := lKonvSat.Satuan.SAT_CODE;
      cxGridTableBR.DataController.Values[iCurrentRow, cxGridTableColUOMid.Index]   := lKonvSat.Satuan.ID;
    end;


    //Set UOM Default
    if (ASatuanID = '') and  (lModBarang.SATUAN_STOCK <> nil) then
    begin
      lModBarang.SATUAN_STOCK.Reload();
      cxGridTableBR.DataController.Values[iCurrentRow, cxGridTableColUOMid.Index] := lModBarang.SATUAN_STOCK.ID;
      cxGridTableBR.DataController.Values[iCurrentRow, cxGridTableColUOM.Index]   := lModBarang.SATUAN_STOCK.SAT_CODE;
    end;

//    cxGridTableBR.DataController.Post();
    cxGridTableBR.DataController.PostEditingData();
  Finally
    lModBarang.Free;
  End;

end;

procedure TfrmDialogBarcodeRequest.SetSUPMG(ASupMG: String);
var
  lModSUPMG: TModSuplierMerchanGroup;
begin
  lModSUPMG := TCRUDObj.RetrieveCode<TModSuplierMerchanGroup>(ASupMG);
  //Jare Manda, cara retrieve yg lebih simpel. Tur aku ra paham. wkwkwk
  Try
    if lModSUPMG.ID = '' then
      TAppUtils.Warning('Suplier Merchan Grup Tidak Ditemukan!');
    //diwoco kudune ngerti, soale jelaske kangelan. wkwkwk

    //cara mengisi grid, format :
    //LOKASI = xxx
    edbSupplierCode.Text := lModSUPMG.SUPMG_SUB_CODE;
    edtSupplierName.Text := lModSUPMG.SUPMG_NAME;

    ModbarcodeRequest.BR_SUPMG := TModSuplierMerchanGroup.CreateID(lModSUPMG.ID);

  Finally
    lModSUPMG.Free;
  End;

end;

procedure TfrmDialogBarcodeRequest.SimpanData;
begin
  try
    DMClient.CRUDJurnalClient.SaveToDB(ModbarcodeRequest);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    self.ModalResult:=mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  end;
end;

procedure TfrmDialogBarcodeRequest.UpdateBarcodePrice;
var
  i: Integer;
begin
  for i := 0 to cxGridTableBR.DataController.RecordCount-1 do
  begin
    cxGridTableBR.DataController.Values[i, cxGridTableColHarga.index] := curredtUnitPrice.value;
  end;
//
end;

procedure TfrmDialogBarcodeRequest.UpdateData;
var
  i: Integer;
  lItem: TModBarcodeRequestItem;  //var nama bebas untuk detail
begin
//header
  if ModbarcodeRequest.ID = '' then
    edtBarNo.Text := DMClient.CRUDBarcodeRequest.GenerateNo(ModbarcodeRequest.ClassName);
    //generate nomor otomatis,
    {
      mau tau detailnya? coba ctrl+klik 'GenerateNo' yg di situ.
      Kl udah kebuka balik sini lagi, lanjut baca.

      Udah kebuka kan tadi? Kliatan kan tulisan 'TCRUDTransferBarang.GenerateNo'?
      Itu lokasinya ada di server. uServerClases.TCRUDTransferBarang.GenerateNo
      TCRUDTCRUDTransferBarang itu inherit dari TCRUD yang di-'overide' di bagian  TCRUD.
      Jangan tanya gimana! Aku yo ra isoh jelaske. wkwkwk
      Nah, kl mau bikin custom no yg serupa copy aja, trus rename, isinya disesuaikan.
      Abis itu daftarkan di uDMClient, metodenya sama copy-paste.
      Buka ServerContainerUnit, register di method RegisterServerClases.
      Jalankan server, generate data snap clientclasses.

      Sementara ini dulu, besok dilanjut.

    }

  ModbarcodeRequest.BR_NO           := edtBarNo.Text;
  ModbarcodeRequest.BR_DATE         := dtTgl.Date;
  ModbarcodeRequest.BR_HARGA        := curredtUnitPrice.EditValue;
  ModbarcodeRequest.BR_TOTAL        := vartofloat(cxGridTableBR.GetFooterSummary(cxGridTableColTotal));
  ModbarcodeRequest.BR_UNIT         := TRetno.UnitStore;
  ModbarcodeRequest.BR_COLIE        := cxGridTableBR.GetFooterSummary(cxGridTableColQTY);
  ModbarcodeRequest.BR_DESCRIPTION  := memDesc.Text;

//detail
  ModbarcodeRequest.BarcodeRequestItems.Clear; //hapus yg sudah ada, biasanya kl edit, biar ga dobel.

  for i := 0 to cxGridTableBR.DataController.RecordCount-1 do
    begin
      lItem := TModBarcodeRequestItem.Create;
      lItem.BRI_BARANG  := TModBarang.CreateID(cxGridTableBR.Values(i,cxGridTableColPLU_ID.Index));
      lItem.BRI_SATUAN  := TModSatuan.CreateID(cxGridTableBR.Values(i,cxGridTableColUOMid.Index));
      //                     Mod Asal             tabel                kolom
      lItem.BRI_QTY     := VarToFloat(cxGridTableBR.Values(i,cxGridTableColQTY.Index));
      lItem.BRI_HARGA   := cxGridTableBR.Values(i,cxGridTableColHarga.Index);
      lItem.BRI_TOTAL   := cxGridTableBR.Values(i,cxGridTableColTotal.Index);
      //                    Konversi Varchar ke Double

      ModbarcodeRequest.BarcodeRequestItems.Add(lItem)
    end;


end;

procedure TfrmDialogBarcodeRequest.UpdateTotalBarcodePrice;
var
  i: Integer;
begin
    cxGridTableBR.DataController.Post;
  for i := 0 to cxGridTableBR.DataController.RecordCount-1 do
  begin
    cxGridTableBR.DataController.Values[i, cxGridTableColTotal.Index] :=
      cxGridTableBR.DataController.Values[i, cxGridTableColHarga.index] * cxGridTableBR.DataController.Values[i, cxGridTableColQTY.index];
  end;
//
end;

function TfrmDialogBarcodeRequest.ValidateData: Boolean;
var
  a: Integer;
  i: Integer;
  lQty: Double;

begin
  Result := False;
  cxGridTableBR.DataController.Post();

  if not ValidateEmptyCtrl([0,1]) then exit;

  //validasi harus ada minim 1 baris
  if cxGridTableBR.DataController.RecordCount < 1 then
  begin
    TAppUtils.Warning('Item minimal 1 baris');
    exit;
  end;

  //validasi qty harus lebih dari 0
  if cxGridTableBR.GetFooterSummary(cxGridTableColQTY) <= 0 then
  begin
    TAppUtils.Warning('Quantity pada baris ke-'+IntToStr(i+1)+' salah');
    exit;
  end;

  //validasi harus terisi: PLU, UOM, qty, harga
  for i := 0 to cxGridTableBR.DataController.RecordCount-1 do
  begin
      //validasi harga ga boleh kurang dari 0
    if cxGridTableBR.Values(i,cxGridTableColHarga.Index) <=0 then
    begin
      TAppUtils.Warning('Harga pada baris ke-'+IntToStr(i+1)+' Salah.');
      exit;
    end;

    if varisnull (cxGridTableBR.Values(i,cxGridTableColPLU_ID.Index)) then
    begin
      TAppUtils.Warning('PLU pada baris ke-'+IntToStr(i+1)+' belum diisi.');
      exit;
    end;

    if varisnull (cxGridTableBR.Values(i,cxGridTableColUOMid.Index)) then
    begin
      TAppUtils.Warning('UOM pada baris ke-'+IntToStr(i+1)+' belum diisi.');
      exit;
    end;

    if varisnull (cxGridTableBR.Values(i,cxGridTableColQTY.Index)) then
    begin
      TAppUtils.Warning('Quantity pada baris ke-'+IntToStr(i+1)+' belum diisi.');
      exit;
    end;
  end;

  for i := 0 to cxGridTableBR.DataController.RecordCount -1 do
  begin
    for a := 0 to cxGridTableBR.DataController.RecordCount -1 do
    begin
      if i = a then
      Continue;
      if (cxGridTableBR.DataController.Values[i,cxGridTableColCode.Index] = cxGridTableBR.DataController.Values[a,cxGridTableColCode.Index])
       and (cxGridTableBR.DataController.Values[i,cxGridTableColUOMid.Index] = cxGridTableBR.DataController.Values[a,cxGridTableColUOMid.Index]) then
      begin
        TAppUtils.Warning('PLU baris ke-'+IntToStr(i+1)+' dan ke-' +IntToStr(a+1)+' tidak boleh dengan UoM yang sama.');
        exit;
      end;
    end;
  end;

  Result := True;
end;

function TfrmDialogBarcodeRequest.ValidateSUPMG: Boolean;
var
  i: Integer;
  lQty: Double;

begin
  Result := False;
//  cxGridTableBR.DataController.Post();

  //validasi SUPMG harus terisi
  if ModbarcodeRequest.BR_SUPMG = nil then
  begin
    TAppUtils.Warning('Suplier Merchan Grup harus diisi.');
    exit;
  end;

  Result := True;
end;

end.
