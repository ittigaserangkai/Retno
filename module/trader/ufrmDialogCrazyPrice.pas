unit ufrmDialogCrazyPrice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, uInterface, uDBUtils,
  uDXUtils, Datasnap.DBClient, System.DateUtils, uModCrazyPrice, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxGridCustomTableView,
  cxGridTableView, cxGridCustomView, cxClasses, cxGridLevel, cxGrid, uDMClient,
  cxCalendar, Vcl.StdCtrls, cxContainer, cxTextEdit, cxCurrencyEdit,uModBarang,
  cxButtonEdit, ufrmLookupOrganization, uModOrganization,uModApp,
  cxDBExtLookupComboBox, uModSatuan, uAppUtils, System.Generics.Collections, ufrmCXLookup;

type
  TfrmDialogCrazyPrice = class(TfrmMasterDialog, ICRUDAble)
    cxgrdlvlCP: TcxGridLevel;
    cxgrdCP: TcxGrid;
    cxGridTableCP: TcxGridTableView;
    cxGridColCPKode: TcxGridColumn;
    cxGridColCPNama: TcxGridColumn;
    cxGridColCPPLU: TcxGridColumn;
    cxGridColCPNamaBarang: TcxGridColumn;
    cxGridColCPSatuan: TcxGridColumn;
    cxGridColCPCOGS: TcxGridColumn;
    cxGridColCPDisc: TcxGridColumn;
    cxGridColCPSellpriceDisc: TcxGridColumn;
    cxGridColCPSellPriceDiscPPN: TcxGridColumn;
    cxGridColCPMarkUp: TcxGridColumn;
    cxGridColCPBHJMarkUp: TcxGridColumn;
    cxGridColCPPPN: TcxGridColumn;
    cxGridColCPPeriodeMulai: TcxGridColumn;
    cxGridColCPPeriodeAkhir: TcxGridColumn;
    pnlKeterangan: TPanel;
    lblSebelumDisc: TLabel;
    lblSetelahDisc: TLabel;
    edHJBelumDisc: TcxCurrencyEdit;
    edHJSetelahDisc: TcxCurrencyEdit;
    edMarkUpSebelum: TcxCurrencyEdit;
    edMarkUpSesudah: TcxCurrencyEdit;
    lblHJ: TLabel;
    lblMU: TLabel;
    lblHJPPN: TLabel;
    edHJPPN: TcxCurrencyEdit;
    cxGridColCPOrgID: TcxGridColumn;
    lblNamaBarang: TLabel;
    edNamaBarang: TcxTextEdit;
    cxGridColCPPLUID: TcxGridColumn;
    cxGridColCPBHJSellpriceDisc: TcxGridColumn;
    cxGridColCPBHJSellpriceDiscPPN: TcxGridColumn;
    cxGridColCPTglInput: TcxGridColumn;
    cxGridColCPCrazyPrice_ID: TcxGridColumn;
    lblPPN: TLabel;
    edPPN: TcxCurrencyEdit;
    actLoadOrg: TAction;
    lblCustomer: TLabel;
    edOrganisasi: TcxTextEdit;
    cxGridColCPUOMBHJ: TcxGridColumn;
    procedure actDeleteExecute(Sender: TObject);
    procedure actLoadOrgExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGridTableCPDataControllerNewRecord(
      ADataController: TcxCustomDataController; ARecordIndex: Integer);
    procedure cxGridColCPKodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxGridColCPKodePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridTableCPEditing(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; var AAllow: Boolean);
    procedure cxGridTableCPFocusedRecordChanged(Sender: TcxCustomGridTableView;
        APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
        ANewItemRecordFocusingChanged: Boolean);
    procedure cxGridColCPPLUPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridColCPSatuanPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridColCPDiscPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure HitungNilaiPerBaris(ARec, ACol : Integer; ANominal : Double);
    procedure cxGridColCPMarkUpPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridColCPSellPriceDiscPPNPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridColCPSatuanPropertiesInitPopup(Sender: TObject);
    procedure cxGridTableCPDataControllerBeforeDelete(
      ADataController: TcxCustomDataController; ARecordIndex: Integer);
  private
    FCDSBarang: TClientDataset;
    FCDSSatuan: TClientDataset;
    function GetCDSBarang: TClientDataset;
    function GetCDSSatuan: TClientDataset;
    function IsBisaHapus: Boolean;
    procedure LoadDataBHJ(ARecordIndex : Integer; ABHJ : TModBarangHargaJual);
    procedure LoadDataOrg(ARecordIndex : Integer; AOrg : TModOrganization);
    function IsBisaSimpan: Boolean;
    function IsDetailValid: Boolean;
    procedure LoadDataBarang(ARecordIndex : Integer; AKode : String);
    procedure LookUpBarang;
    procedure LookUpORG;

    property CDSBarang: TClientDataset read GetCDSBarang write FCDSBarang;
    property CDSSatuan: TClientDataset read GetCDSSatuan write FCDSSatuan;
    { Private declarations }
  public
    procedure LoadData(AID : String);
    { Public declarations }
  end;

var
  frmDialogCrazyPrice: TfrmDialogCrazyPrice;

implementation

{$R *.dfm}

procedure TfrmDialogCrazyPrice.actDeleteExecute(Sender: TObject);
var
  I: Integer;
  lCP: TModCrazyPrice;
  lObjectCPs: tobjectList<TModApp>;
begin
  inherited;
  lObjectCPs := TObjectList<TModApp>.Create();
  for I := 0 to cxGridTableCP.DataController.RecordCount - 1 do
  begin
    if cxGridTableCP.Text(I, cxGridColCPCrazyPrice_ID.Index) <> '' then
    begin
      lCP := TModCrazyPrice.CreateID(cxGridTableCP.Text(I, cxGridColCPCrazyPrice_ID.Index));
      lObjectCPs.Add(lCP);
    end;
  end;

  if DMClient.CrudCrazyPriceClient.DeleteBatch(lObjectCPs) then
  begin
    TAppUtils.Information('Berhasil Hapus');
    ModalResult := mrOk;
  end;

end;

procedure TfrmDialogCrazyPrice.actLoadOrgExecute(Sender: TObject);
begin
  inherited;
  if cxGridTableCP.RecordIndex < 0 then
    Exit;

  if (cxGridTableCP.Controller.FocusedColumn = cxGridColCPKode) or (cxGridTableCP.Controller.FocusedColumn = cxGridColCPNama) then
  begin
    LookUpORG;
  end else if (cxGridTableCP.Controller.FocusedColumn = cxGridColCPPLU) or (cxGridTableCP.Controller.FocusedColumn = cxGridColCPNamaBarang) then
  begin
    LookUpBarang;
  end

end;

procedure TfrmDialogCrazyPrice.actSaveExecute(Sender: TObject);
var
  I: Integer;
  lCP: TModCrazyPrice;
  lObjectCPs: tobjectList<TModApp>;
begin
  inherited;
  if not IsBisaSimpan then
    Exit;

  lObjectCPs := TObjectList<TModApp>.Create();
  for I := 0 to cxGridTableCP.DataController.RecordCount - 1 do
  begin
    lCP := TModCrazyPrice.CreateID(cxGridTableCP.Text(I, cxGridColCPCrazyPrice_ID.Index));
    cxGridTableCP.LoadObjectData(lCP, i);

    lObjectCPs.Add(lCP);
  end;

  if DMClient.CrudCrazyPriceClient.SaveBatch(lObjectCPs) then
  begin
    TAppUtils.Information('Berhasil Simpan');
    ModalResult := mrOk;
  end;

end;

procedure TfrmDialogCrazyPrice.FormCreate(Sender: TObject);
begin
  inherited;
  TcxExtLookupComboBoxProperties(cxGridTableCP.Columns[cxGridColCPSatuan.Index].Properties).LoadFromCDS(CDSSatuan,'ref$satuan_id', 'sat_code',['sat_name', 'SAT_GROUP', 'SAT_URUTAN','OPC_UNIT', 'OPM_UNIT', 'SAT_HO_AUTHORIZE', 'REF$SATUAN_ID'],Self);
  TcxExtLookupComboBoxProperties(cxGridTableCP.Columns[cxGridColCPSatuan.Index].Properties).SetMultiPurposeLookup;

end;

procedure TfrmDialogCrazyPrice.cxGridColCPDiscPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
//var
//  dCOGS: Double;
//  dMU: Double;
//  dPPN: Double;
//  dSellpriceDisc: Double;
//  dSellpriceDiscPPN: Double;
begin
  inherited;
  if VarIsNull(DisplayValue) then
    Exit;

  HitungNilaiPerBaris(cxGridTableCP.RecordIndex, cxGridColCPDisc.Index, DisplayValue);

//  dPPN              := cxGridTableCP.Double(cxGridTableCP.RecordIndex, cxGridColCPPPN.Index);
//  dCOGS             := cxGridTableCP.Double(cxGridTableCP.RecordIndex, cxGridColCPCOGS.Index);
//  dSellpriceDiscPPN := dCOGS * (100 - DisplayValue)/100;
//  dSellpriceDisc    := dSellpriceDiscPPN / ((dPPN + 100) / 100);
//  dMU               := (dSellpriceDiscPPN - dCOGS) / dCOGS * 100;
//
//  cxGridTableCP.SetValue(cxGridTableCP.RecordIndex, cxGridColCPSellpriceDisc.Index, dSellpriceDisc);
//  cxGridTableCP.SetValue(cxGridTableCP.RecordIndex, cxGridColCPSellPriceDiscPPN.Index, dSellpriceDiscPPN);
//  cxGridTableCP.SetValue(cxGridTableCP.RecordIndex, cxGridColCPMarkUp.Index, dMU);

end;

procedure TfrmDialogCrazyPrice.HitungNilaiPerBaris(ARec, ACol : Integer;
    ANominal : Double);
var
  dCOGS: Double;
  dDisc: Double;
  dMU: Double;
  dPPN: Double;
  dSellpriceDisc: Double;
  dSellpriceDiscPPN: Double;
begin
  inherited;
  dPPN              := cxGridTableCP.Double(cxGridTableCP.RecordIndex, cxGridColCPPPN.Index);

  dMU               := cxGridTableCP.Double(cxGridTableCP.RecordIndex, cxGridColCPMarkUp.Index);
  dCOGS             := cxGridTableCP.Double(cxGridTableCP.RecordIndex, cxGridColCPCOGS.Index);
  dDisc             := cxGridTableCP.Double(cxGridTableCP.RecordIndex, cxGridColCPDisc.Index);

  dSellpriceDiscPPN := 0;


  if ACol = cxGridColCPDisc.Index then
  begin
    dDisc             := ANominal;
    dSellpriceDiscPPN := (dCOGS * (100 - dDisc)/100) * (100 + dMU) / 100;
  end else if ACol = cxGridColCPMarkUp.Index then
  begin
    dMU               := ANominal;
    dSellpriceDiscPPN := (dCOGS * (100 - dDisc)/100) * (100 + dMU) / 100;
  end else if ACol = cxGridColCPSellPriceDiscPPN.Index then
  begin
    dSellpriceDiscPPN := ANominal;
    dMU               := ((dSellpriceDiscPPN * 100 * 100) / (dCOGS * (100 - dDisc))) - 100;
  end;

  dSellpriceDisc    := dSellpriceDiscPPN / ((dPPN + 100) / 100);

  cxGridTableCP.SetValue(cxGridTableCP.RecordIndex, cxGridColCPSellpriceDisc.Index, dSellpriceDisc);
  cxGridTableCP.SetValue(cxGridTableCP.RecordIndex, cxGridColCPSellPriceDiscPPN.Index, dSellpriceDiscPPN);
  cxGridTableCP.SetValue(cxGridTableCP.RecordIndex, cxGridColCPMarkUp.Index, dMU);
  cxGridTableCP.SetValue(cxGridTableCP.RecordIndex, cxGridColCPDisc.Index, dDisc);

end;

procedure TfrmDialogCrazyPrice.cxGridColCPKodePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  actLoadOrgExecute(Sender);
end;

procedure TfrmDialogCrazyPrice.cxGridColCPKodePropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  lORG: TModOrganization;
begin
  inherited;
  lORG := TModOrganization(DMClient.CrudClient.RetrieveByCode(TModOrganization.ClassName, DisplayValue));
  try
    if lORG <> nil then
    begin
      LoadDataOrg(cxGridTableCP.DataController.FocusedRecordIndex, lORG)
    end;
  finally
    lORG.Free;
  end;
end;

procedure TfrmDialogCrazyPrice.cxGridColCPMarkUpPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  if VarIsNull(DisplayValue) then
    Exit;

  HitungNilaiPerBaris(cxGridTableCP.RecordIndex, cxGridColCPMarkUp.Index, DisplayValue);

end;

procedure TfrmDialogCrazyPrice.cxGridColCPPLUPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  LoadDataBarang(cxGridTableCP.RecordIndex, DisplayValue);
end;

procedure TfrmDialogCrazyPrice.cxGridColCPSatuanPropertiesInitPopup(
  Sender: TObject);
var
  sUOMS: string;
begin
  inherited;
  sUOMS                   := cxGridTableCP.Text(cxGridTableCP.RecordIndex,cxGridColCPUOMBHJ.Index);

  cxGridTableCP.FilterDataLookUp(cxGridColCPSatuan, 'sat_code', foEqual, TAppUtils.StringToArrayOfString(sUOMS),TAppUtils.StringToArrayOfString(sUOMS));

end;

procedure TfrmDialogCrazyPrice.cxGridColCPSatuanPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  lBarangID: string;
  lModBHJ: TModBarangHargaJual;
  lSatuanID: string;
begin
  inherited;
  lBarangID := cxGridTableCP.Text(cxGridTableCP.RecordIndex, cxGridColCPPLUID.Index);
  lSatuanID := CDSSatuan.FieldByName('ref$satuan_id').AsString;

  lModBHJ := DMClient.CrudBarangHargaJualClient.RetrieveByPLU(TModBarang.CreateID(lBarangID), TModSatuan.CreateID(lSatuanID));
  try
    LoadDataBHJ(cxGridTableCP.RecordIndex, lModBHJ);
  finally
    lModBHJ.Free;
  end;
end;

procedure TfrmDialogCrazyPrice.cxGridColCPSellPriceDiscPPNPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  if VarIsNull(DisplayValue) then
    Exit;

  HitungNilaiPerBaris(cxGridTableCP.RecordIndex, cxGridColCPSellPriceDiscPPN.Index, DisplayValue);

end;

procedure TfrmDialogCrazyPrice.cxGridTableCPDataControllerBeforeDelete(
  ADataController: TcxCustomDataController; ARecordIndex: Integer);
var
  I: Integer;
  lCP: TModCrazyPrice;
  lObjectCPs: tobjectList<TModApp>;
begin
  inherited;
  if cxGridTableCP.RecordIndex < 0 then
    raise Exception.Create('Tidak Ada Baris Yang Akan Dihapus');

  if cxGridTableCP.Text(I, cxGridColCPCrazyPrice_ID.Index) = '' then
    Exit;

  if not TAppUtils.Confirm('Data akan terhapus dari database. Anda akan melanjutkan ?') then
    Abort;

  lObjectCPs := TObjectList<TModApp>.Create;
  lCP := TModCrazyPrice.CreateID(cxGridTableCP.Text(cxGridTableCP.RecordIndex ,cxGridColCPCrazyPrice_ID.Index));
  lObjectCPs.Add(lCP);
  DMClient.CrudCrazyPriceClient.DeleteBatch(lObjectCPs);
end;

procedure TfrmDialogCrazyPrice.cxGridTableCPDataControllerNewRecord(
  ADataController: TcxCustomDataController; ARecordIndex: Integer);
begin
  inherited;
  if ARecordIndex = 0 then
  begin
    ADataController.Values[ARecordIndex, cxGridColCPPeriodeMulai.Index] := StartOfTheDay(Now);
    ADataController.Values[ARecordIndex, cxGridColCPPeriodeAkhir.Index] := EndOfTheDay(Now);
    ADataController.Values[ARecordIndex, cxGridColCPTglInput.Index]     := Now;
  end else begin
    ADataController.Values[ARecordIndex, cxGridColCPPeriodeMulai.Index] := ADataController.Values[ARecordIndex - 1, cxGridColCPPeriodeMulai.Index];
    ADataController.Values[ARecordIndex, cxGridColCPPeriodeAkhir.Index] := ADataController.Values[ARecordIndex - 1, cxGridColCPPeriodeAkhir.Index];
    ADataController.Values[ARecordIndex, cxGridColCPTglInput.Index]     := ADataController.Values[ARecordIndex - 1, cxGridColCPTglInput.Index];
    ADataController.Values[ARecordIndex, cxGridColCPKode.Index]         := ADataController.Values[ARecordIndex - 1, cxGridColCPKode.Index];
    ADataController.Values[ARecordIndex, cxGridColCPNama.Index]         := ADataController.Values[ARecordIndex - 1, cxGridColCPNama.Index];
    ADataController.Values[ARecordIndex, cxGridColCPOrgID.Index]        := ADataController.Values[ARecordIndex - 1, cxGridColCPOrgID.Index];
  end;
end;

procedure TfrmDialogCrazyPrice.cxGridTableCPEditing(Sender:
    TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  inherited;
  AAllow := AItem.Index in [cxGridColCPKode.Index,
                            cxGridColCPPLU.Index,
                            cxGridColCPDisc.Index,
                            cxGridColCPSatuan.Index,
                            cxGridColCPPeriodeMulai.Index,
                            cxGridColCPPeriodeAkhir.Index,
                            cxGridColCPMarkUp.Index,
                            cxGridColCPSellpriceDisc.Index,
                            cxGridColCPSellPriceDiscPPN.Index,
                            cxGridColCPNamaBarang.Index];
end;

procedure TfrmDialogCrazyPrice.cxGridTableCPFocusedRecordChanged(Sender:
    TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord:
    TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  if AFocusedRecord = nil then
    Exit;

  if VarIsNull(AFocusedRecord.Values[cxGridColCPNamaBarang.Index]) then
  begin
    edNamaBarang.Text     := '';
    edOrganisasi.Text     := '';
    edMarkUpSebelum.Value := 0;
    edMarkUpSesudah.Value := 0;

    edHJBelumDisc.Value   := 0;
    edHJSetelahDisc.Value := 0;
    edHJPPN.Value         := 0;
    edPPN.Value           := 0;
  end else begin
    edNamaBarang.Text     := cxGridTableCP.Text(AFocusedRecord.RecordIndex,cxGridColCPNamaBarang.Index);
    edOrganisasi.Text     := cxGridTableCP.Text(AFocusedRecord.RecordIndex,cxGridColCPNama.Index);
    edMarkUpSebelum.Value := cxGridTableCP.Double(AFocusedRecord.RecordIndex,cxGridColCPBHJMarkUp.Index);
    edMarkUpSesudah.Value := cxGridTableCP.Double(AFocusedRecord.RecordIndex,cxGridColCPMarkUp.Index);

    edHJBelumDisc.Value   := cxGridTableCP.Double(AFocusedRecord.RecordIndex,cxGridColCPBHJSellpriceDisc.Index);
    edHJSetelahDisc.Value := cxGridTableCP.Double(AFocusedRecord.RecordIndex,cxGridColCPSellpriceDisc.Index);

    edHJPPN.Value         := cxGridTableCP.Double(AFocusedRecord.RecordIndex,cxGridColCPSellPriceDiscPPN.Index);
    edPPN.Value           := cxGridTableCP.Double(AFocusedRecord.RecordIndex,cxGridColCPPPN.Index);
  end;
end;

function TfrmDialogCrazyPrice.GetCDSBarang: TClientDataset;
begin
  if FCDSBarang = nil then
  begin
    FCDSBarang := TDBUtils.DSToCDS(DMClient.DSProviderClient.Barang_GetDSLookup(''), Self);
  end;

  Result := FCDSBarang;
end;

function TfrmDialogCrazyPrice.GetCDSSatuan: TClientDataset;
begin
  if FCDSSatuan = nil then
    FCDSSatuan := TDBUtils.DSToCDS(DMClient.DSProviderClient.Satuan_GetDSLookup(), Self);

  Result := FCDSSatuan;
end;

function TfrmDialogCrazyPrice.IsBisaHapus: Boolean;
begin
  Result := False;

  if not TAppUtils.Confirm('Anda Yakin Akan Menghapus Data ?') then
    Exit;

  Result := True;
end;

function TfrmDialogCrazyPrice.IsBisaSimpan: Boolean;
begin
  Result := False;

  if not IsDetailValid then
    Exit;

  Result := True;
end;

function TfrmDialogCrazyPrice.IsDetailValid: Boolean;
var
  I: Integer;
  sPrefix: string;
begin
  Result := False;

  if cxGridTableCP.DataController.RecordCount = 0 then
  begin
    TAppUtils.Warning('Tidak Ada Data Yang Akan Disimpan');
    Exit;
  end;

  for I := 0 to cxGridTableCP.DataController.RecordCount - 1 do
  begin
    sPrefix := 'Baris ke ' + IntToStr(i+1);
    if  cxGridTableCP.Text(i, cxGridColCPOrgID.Index) = '' then
    begin
      TAppUtils.Warning(sPrefix + ' Trader Belum diisi dengan benar');
      Exit;
    end;

    if  cxGridTableCP.Text(i, cxGridColCPPLUID.Index) = '' then
    begin
      TAppUtils.Warning(sPrefix + ' PLU Belum diisi dengan benar');
      Exit;
    end;

    if (TAppUtils.DateToInt(cxGridTableCP.Date(i, cxGridColCPPeriodeMulai.index)) > TAppUtils.DateToInt(cxGridTableCP.Date(i, cxGridColCPPeriodeAkhir.Index))) then
    begin
      TAppUtils.Warning(sPrefix + ' Tanggal Mulai > Tanggal Akhir');
      Exit;
    end;

    if  cxGridTableCP.Double(i, cxGridColCPSellPriceDiscPPN.Index) <= 0 then
    begin
      TAppUtils.Warning(sPrefix + ' Harga Jual Belum Diset Dengan Benar');
      Exit;
    end;
  end;

  Result := True;
end;

procedure TfrmDialogCrazyPrice.LoadDataBarang(ARecordIndex : Integer; AKode :
    String);
var
  i: Integer;
  lBarang: TModBarang;
  lBHJ: TModBarangHargaJual;
begin
  lBarang := TModBarang(DMClient.CrudBarangClient.RetrieveByCodeBHJUOM(TModBarang.ClassName, AKode));
  try
    if lBarang <> nil then
    begin
      cxGridTableCP.SetValue(ARecordIndex, cxGridColCPPLU.Index, lBarang.BRG_CODE);
      cxGridTableCP.SetValue(ARecordIndex, cxGridColCPNamaBarang.Index, lBarang.BRG_NAME);
      cxGridTableCP.SetValue(ARecordIndex, cxGridColCPPLUID.Index, lBarang.ID);
      cxGridTableCP.SetValue(ARecordIndex, cxGridColCPSatuan.Index, null);
      cxGridTableCP.SetValue(ARecordIndex, cxGridColCPUOMBHJ.Index, lBarang.UntaianUOMBHJ);
      cxGridTableCP.SetValue(ARecordIndex, cxGridColCPPPN.Index, 0);

      for i := 0 to  lBarang.Suppliers.Count - 1 do
      begin
        if lBarang.Suppliers[i].BRGSUP_IS_PRIMARY = 1 then
          if lBarang.Suppliers[i].BRGSUP_IS_BKP = 1 then
            cxGridTableCP.SetValue(ARecordIndex, cxGridColCPPPN.Index, 10);
      end;

      lBHJ := TModBarangHargaJual.Create;
      try
        LoadDataBHJ(cxGridTableCP.RecordIndex,lBHJ );
      finally
        lBHJ.Free;
      end;

      edNamaBarang.Text := lBarang.BRG_NAME;
    end;
  finally
    lBarang.Free;
  end;
end;

procedure TfrmDialogCrazyPrice.LoadData(AID : String);
var
  lCPS: TModApps;
  I: Integer;
  lBrg: TModBarang;
  lCP: TModCrazyPrice;
  lModBHJ: TModBarangHargaJual;
  lOrg: TModOrganization;
begin
  lCPS := DMClient.CrudCrazyPriceClient.RetrieveBatch(TModCrazyPrice.ClassName, AID);
  for I := 0 to lCPS.APPs.Count - 1 do
  begin
    cxGridTableCP.DataController.AppendRecord;

    lCP := TModCrazyPrice(lCPS.APPs[i]);

    lOrg := TModOrganization(DMClient.CrudClient.Retrieve(TModOrganization.ClassName,lCP.CRAZY_ORGANIZATION.ID));
    LoadDataOrg(I, lOrg);

    lBrg := TModBarang(DMClient.CrudClient.Retrieve(TModBarang.ClassName, lCP.CRAZY_BARANG.ID));
    try
      LoadDataBarang(I, lBrg.BRG_CODE);
    finally
      lBrg.Free;
    end;

    lModBHJ := DMClient.CrudBarangHargaJualClient.RetrieveByPLU(lCP.CRAZY_BARANG, lCP.CRAZY_SATUAN);
    try
      LoadDataBHJ(i, lModBHJ);
    finally
      lModBHJ.Free;
    end;

    cxGridTableCP.SetObjectData(lCP, i);
  end;
end;

procedure TfrmDialogCrazyPrice.LoadDataBHJ(ARecordIndex : Integer; ABHJ :
    TModBarangHargaJual);
begin
  cxGridTableCP.SetValue(ARecordIndex, cxGridColCPCOGS.Index, ABHJ.BHJ_PURCHASE_PRICE_PPN);


//  cxGridTableCP.SetValue(ARecordIndex, cxGridColCPPPN.Index, ABHJ.BHJ_PPN);
  cxGridTableCP.SetValue(ARecordIndex, cxGridColCPBHJMarkUp.Index, ABHJ.BHJ_MARK_UP);
  cxGridTableCP.SetValue(ARecordIndex, cxGridColCPBHJSellpriceDiscPPN.Index, ABHJ.BHJ_SELL_PRICE);
  cxGridTableCP.SetValue(ARecordIndex, cxGridColCPBHJSellpriceDisc.Index, ABHJ.BHJ_SELL_PRICE_EX_PPN);

end;

procedure TfrmDialogCrazyPrice.LoadDataOrg(ARecordIndex : Integer; AOrg :
    TModOrganization);
begin
  cxGridTableCP.DataController.Values[ARecordIndex, cxGridColCPOrgID.Index]  := AOrg.ID;
  cxGridTableCP.DataController.Values[ARecordIndex, cxGridColCPKode.Index]   := AOrg.ORG_Code;
  cxGridTableCP.DataController.Values[ARecordIndex, cxGridColCPNama.Index]   := AOrg.ORG_Name;

  edOrganisasi.Text := AOrg.ORG_Name;
end;

procedure TfrmDialogCrazyPrice.LookUpBarang;
begin
  with TfrmCXLookup.Execute(CDSBarang,False, 'Look Up Data') do
  begin
    Try
      HideFields(['BARANG_ID']);
      if ShowModal = mrOK then
      begin
        LoadDataBarang(cxGridTableCP.RecordIndex, Data.FieldByName('brg_code').AsString);
      end;
    Finally
      free;
    End;
  end;
end;

procedure TfrmDialogCrazyPrice.LookUpORG;
var
  lOrg: TModOrganization;
begin
  lOrg := TfrmLookupOrganization.Lookup(-1);
  try
    if lOrg <> nil then
    begin
      LoadDataOrg(cxGridTableCP.DataController.FocusedRecordIndex, lORG)
    end;
  finally
    if lOrg  = nil then
      lOrg.Free;
  end;
end;

end.
