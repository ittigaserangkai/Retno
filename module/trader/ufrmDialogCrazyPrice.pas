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
  cxDBExtLookupComboBox, uModSatuan, uAppUtils, System.Generics.Collections;

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
    procedure actDeleteExecute(Sender: TObject);
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
  private
    FCDSSatuan: TClientDataset;
    function GetCDSSatuan: TClientDataset;
    function IsBisaHapus: Boolean;
    procedure LoadDataBHJ(ARecordIndex : Integer; ABHJ : TModBarangHargaJual);
    procedure LoadDataOrg(ARecordIndex : Integer; AOrg : TModOrganization);
    function IsBisaSimpan: Boolean;

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
  if not IsBisaHapus then
    Exit;

  lObjectCPs := TObjectList<TModApp>.Create();
  for I := 0 to cxGridTableCP.DataController.RecordCount - 1 do
  begin
    lCP := TModCrazyPrice.CreateID(cxGridTableCP.Text(I, cxGridColCPCrazyPrice_ID.Index));
    lObjectCPs.Add(lCP);
  end;

  if DMClient.CrudCrazyPriceClient.DeleteBatch(lObjectCPs) then
  begin
    TAppUtils.Information('Berhasil Hapus');
    ModalResult := mrOk;
  end;

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
  TcxExtLookupComboBoxProperties(cxGridTableCP.Columns[cxGridColCPSatuan.Index].Properties).LoadFromCDS(CDSSatuan,'REF$SATUAN_ID', 'sat_code',['SAT_NAME','SAT_GROUP', 'SAT_URUTAN','OPC_UNIT', 'OPM_UNIT', 'SAT_HO_AUTHORIZE', 'REF$SATUAN_ID'],Self);
  TcxExtLookupComboBoxProperties(cxGridTableCP.Columns[cxGridColCPSatuan.Index].Properties).SetMultiPurposeLookup;

end;

procedure TfrmDialogCrazyPrice.cxGridColCPDiscPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  dCOGS: Double;
  dMU: Double;
  dPPN: Double;
  dSellpriceDisc: Double;
  dSellpriceDiscPPN: Double;
begin
  inherited;
  if VarIsNull(DisplayValue) then
    Exit;

  dPPN              := cxGridTableCP.Double(cxGridTableCP.RecordIndex, cxGridColCPPPN.Index);
  dCOGS             := cxGridTableCP.Double(cxGridTableCP.RecordIndex, cxGridColCPCOGS.Index);
  dSellpriceDiscPPN := dCOGS * (100 - DisplayValue)/100;
  dSellpriceDisc    := dSellpriceDiscPPN / ((dPPN + 100) / 100);
  dMU               := (dSellpriceDiscPPN - dCOGS) / dCOGS * 100;

  cxGridTableCP.SetValue(cxGridTableCP.RecordIndex, cxGridColCPSellpriceDisc.Index, dSellpriceDisc);
  cxGridTableCP.SetValue(cxGridTableCP.RecordIndex, cxGridColCPSellPriceDiscPPN.Index, dSellpriceDiscPPN);
  cxGridTableCP.SetValue(cxGridTableCP.RecordIndex, cxGridColCPMarkUp.Index, dMU);

end;

procedure TfrmDialogCrazyPrice.cxGridColCPKodePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  lOrg: TModOrganization;
begin
  inherited;
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

procedure TfrmDialogCrazyPrice.cxGridColCPPLUPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  lBarang: TModBarang;
  lBHJ: TModBarangHargaJual;
begin
  inherited;
  lBarang := TModBarang(DMClient.CrudClient.RetrieveByCode(TModBarang.ClassName, DisplayValue));
  try
    if lBarang <> nil then
    begin
      cxGridTableCP.SetValue(cxGridTableCP.RecordIndex, cxGridColCPNamaBarang.Index, lBarang.BRG_NAME);
      cxGridTableCP.SetValue(cxGridTableCP.RecordIndex, cxGridColCPPLUID.Index, lBarang.ID);
      cxGridTableCP.SetValue(cxGridTableCP.RecordIndex, cxGridColCPSatuan.Index, null);

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
    edMarkUpSebelum.Value := 0;
    edMarkUpSesudah.Value := 0;

    edHJBelumDisc.Value   := 0;
    edHJSetelahDisc.Value := 0;
    edHJPPN.Value         := 0;
  end else begin
    edNamaBarang.Text     := cxGridTableCP.Text(AFocusedRecord.RecordIndex,cxGridColCPNamaBarang.Index);
    edMarkUpSebelum.Value := cxGridTableCP.Double(AFocusedRecord.RecordIndex,cxGridColCPBHJMarkUp.Index);
    edMarkUpSesudah.Value := cxGridTableCP.Double(AFocusedRecord.RecordIndex,cxGridColCPMarkUp.Index);

    edHJBelumDisc.Value   := cxGridTableCP.Double(AFocusedRecord.RecordIndex,cxGridColCPBHJSellpriceDisc.Index);
    edHJSetelahDisc.Value := cxGridTableCP.Double(AFocusedRecord.RecordIndex,cxGridColCPSellpriceDisc.Index);

    edHJPPN.Value         := cxGridTableCP.Double(AFocusedRecord.RecordIndex,cxGridColCPSellPriceDiscPPN.Index);
  end;
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
  Result := True;
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
    cxGridTableCP.SetObjectData(lCP, i);

    lOrg := TModOrganization(DMClient.CrudClient.Retrieve(TModOrganization.ClassName,lCP.CRAZY_ORGANIZATION.ID));
    LoadDataOrg(I, lOrg);

    lBrg := TModBarang(DMClient.CrudClient.Retrieve(TModBarang.ClassName, lCP.CRAZY_BARANG.ID));
    cxGridTableCP.SetValue(i, cxGridColCPPLU.Index, lBrg.BRG_CODE);
    cxGridTableCP.SetValue(i, cxGridColCPNamaBarang.Index, lBrg.BRG_NAME);

    lModBHJ := DMClient.CrudBarangHargaJualClient.RetrieveByPLU(lCP.CRAZY_BARANG, lCP.CRAZY_SATUAN);
    try
      LoadDataBHJ(cxGridTableCP.RecordIndex, lModBHJ);
    finally
      lModBHJ.Free;
    end;
  end;
end;

procedure TfrmDialogCrazyPrice.LoadDataBHJ(ARecordIndex : Integer; ABHJ :
    TModBarangHargaJual);
begin
  cxGridTableCP.SetValue(ARecordIndex, cxGridColCPCOGS.Index, ABHJ.BHJ_PURCHASE_PRICE);
  cxGridTableCP.SetValue(ARecordIndex, cxGridColCPPPN.Index, ABHJ.BHJ_PPN);
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
end;

end.
