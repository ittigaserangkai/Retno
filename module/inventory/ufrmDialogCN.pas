unit ufrmDialogCN;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, Vcl.StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxCurrencyEdit, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxDBExtLookupComboBox, uDXUtils, uModCNRecv, uModelHelper,
  uModDO, uModPO, uModUnit, uRetnoUnit, uDMClient, System.StrUtils, Datasnap.DBClient,
  cxButtonEdit, Vcl.Menus, cxButtons, cxGroupBox, uInterface, uModApp, uModGudang;

type
  TfrmDialogCN = class(TfrmMasterDialog, ICRUDAble)
    pnlHeader: TPanel;
    lblTglCN: TLabel;
    lblNomorPO: TLabel;
    lblKodeSupplier: TLabel;
    lblNomorCN: TLabel;
    lblTglTerima: TLabel;
    lblNP: TLabel;
    lblNomorDO: TLabel;
    lblSubTotal: TLabel;
    lblPPN: TLabel;
    lblPPNBM: TLabel;
    lblTotal: TLabel;
    dtCN: TcxDateEdit;
    edKodeSupplier: TcxTextEdit;
    edNamaSupplier: TcxTextEdit;
    edNoCN: TcxTextEdit;
    dtTerima: TcxDateEdit;
    edNoNP: TcxTextEdit;
    edNoDO: TcxTextEdit;
    edSubTotal: TcxCurrencyEdit;
    edPPN: TcxCurrencyEdit;
    edPPNBM: TcxCurrencyEdit;
    edTotal: TcxCurrencyEdit;
    cxgrdlvlCN: TcxGridLevel;
    cxgrdCN: TcxGrid;
    cxGridTableCNDetail: TcxGridTableView;
    cxgrdclmnCNDetailColumnTipe: TcxGridColumn;
    cxGridColCNDetailColumnKode: TcxGridColumn;
    cxGridColCNDetailColumnNama: TcxGridColumn;
    cxGridColCNDetailColumnHargaBeli: TcxGridColumn;
    cxGridColCNDetailColumnQty: TcxGridColumn;
    cxGridColCNDetailColumnUOM: TcxGridColumn;
    cxGridColCNDetailColumnTotal: TcxGridColumn;
    cxGridColCNDetailColumnBarangSupplier: TcxGridColumn;
    cxGridColCNDetailColumnPO: TcxGridColumn;
    cxGridColCNDetailColumnPPN: TcxGridColumn;
    cxGridColCNDetailColumnPPNBM: TcxGridColumn;
    cxGridColCNDetailColumnPPNBMPERSEN: TcxGridColumn;
    cxGridColCNDetailColumnPPNPERSEN: TcxGridColumn;
    cxGridColCNDetailColumnTotalDisc: TcxGridColumn;
    cxGridColCNDetailColumnSupMG: TcxGridColumn;
    edPO: TcxButtonEdit;
    cxGroupBox5: TcxGroupBox;
    Label29: TLabel;
    btnDeletePrice: TcxButton;
    btnAddPrice: TcxButton;
    cxGridColCNDetailColumnPODetail: TcxGridColumn;
    cxGridColCNDetailColumnDisc: TcxGridColumn;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure edPOKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure cxGridColCNDetailColumnKodePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridTableCNDetailEditing(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; var AAllow: Boolean);
    procedure edPOPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure btnAddPriceClick(Sender: TObject);
    procedure btnDeletePriceClick(Sender: TObject);
    procedure cxGridColCNDetailColumnQtyPropertiesEditValueChanged(
      Sender: TObject);
  private
    FCDSPO_DETAIL: TClientDataset;
    FCDS_UOM: TClientDataset;
    FCNRecv: TModCNRecv;
    FDO: TModDO;
    FPO: TModPO;
    procedure CalculateTotal;
    procedure DeleteData;
//    FPO: TModPO;
    function GetCNRecv: TModCNRecv;
    function GetDCItem: TcxGridDataController;
    procedure InisialisasiCBBUOM;
    procedure LoadDO(ADO: TModDO);
    procedure LoadPLU(APO: TModPO);
    procedure LoadPO(aPONO: String);
    procedure UpdateData;
    function ValidateData: Boolean;
    { Private declarations }
  protected
    function GetCNDNClass: TModAppClass; virtual;
  public
    procedure LoadData(AID: string);
    property CNRecv: TModCNRecv read GetCNRecv write FCNRecv;
    property DCItem: TcxGridDataController read GetDCItem;
    { Public declarations }
  end;

var
  frmDialogCN: TfrmDialogCN;

implementation

uses
  uDBUtils, ufrmCXLookup, DateUtils, uAppUtils, uModBarang, uModSatuan,
  uConstanta;

{$R *.dfm}

procedure TfrmDialogCN.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if TAppUtils.Confirm('Anda Yakin Menghapus Data') then DeleteData;
end;

procedure TfrmDialogCN.actSaveExecute(Sender: TObject);
begin
  inherited;
  if CNRecv.ID = '' then
    edNoCN.Text := DMClient.CrudClient.GenerateNo(GetCNDNClass.ClassName);

  if not ValidateData then exit;
  UpdateData;

  Try
    CNRecv.ID := DMClient.CrudCNClient.SaveToDBID(CNRecv);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    Self.ModalResult := mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  End;

end;

procedure TfrmDialogCN.btnAddPriceClick(Sender: TObject);
begin
  inherited;
  DCItem.AppendRecord;
end;

procedure TfrmDialogCN.btnDeletePriceClick(Sender: TObject);
begin
  inherited;
  DCItem.DeleteRecord(DCItem.FocusedRecordIndex);
  CalculateTotal;
end;

procedure TfrmDialogCN.CalculateTotal;
var
  i: Integer;
  lDisc: Double;
  lPPN: Double;
  lPPNBM: Double;
  lPrice: Double;
  lQTY: Integer;
  lSubTotal: Double;
  lTotal: Double;
  lTotalDisc: Double;
  lTotPPN: Double;
  lTotPPNBM: Double;
begin
  DCItem.Post;

  lTotal    := 0;
  lTotPPN   := 0;
  lTotPPNBM := 0;

  for i := 0 to DCItem.RecordCount-1 do
  begin
    lQTY        := DCItem.Values[i,cxGridColCNDetailColumnQty.Index];
    lPrice      := DCItem.Values[i,cxGridColCNDetailColumnHargaBeli.Index];
    lDisc       := DCItem.Values[i,cxGridColCNDetailColumnDisc.Index];

    lSubTotal   := lQTY * (lPrice-lDisc);
    lTotalDisc  := lQTy * lDisc;

    lPPN        := lSubTotal * DCItem.Values[i,cxGridColCNDetailColumnPPNPERSEN.Index]/100;
    lPPNBM      := lSubTotal * DCItem.Values[i,cxGridColCNDetailColumnPPNBMPERSEN.Index]/100;

    DCItem.Values[i,cxGridColCNDetailColumnTotal.Index] := lSubTotal + lPPN + lPPNBM;
    DCItem.Values[i,cxGridColCNDetailColumnTotalDisc.Index] := lTotalDisc;
    DCItem.Values[i,cxGridColCNDetailColumnPPN.Index] := lPPN;
    DCItem.Values[i,cxGridColCNDetailColumnPPNBM.Index] := lPPNBM;

    lTotPPN     := lTotPPN + lPPN;
    lTotPPNBM   := lTotPPNBM + lPPNBM;
    lTotal      := lTotal + lSubTotal;
  end;


  edSubTotal.Value  := lTotal;
  edPPN.Value       := lTotPPN;
  edPPNBM.Value     := lTotPPNBM;
  edTotal.Value     := lTotal + lTotPPN + lTotPPNBM;
end;

procedure TfrmDialogCN.cxGridColCNDetailColumnKodePropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  lDisc: Double;
  lPODetail: TModPOItem;
  lPPN: Double;
  lPPNBM: Double;
  lPrice: Double;
  lQTY: Double;
  lTotal: Double;
begin
  inherited;

  lPODetail :=  TModPOItem(DMClient.CrudClient.Retrieve(TModPOItem.ClassName, FCDSPO_DETAIL.FieldByName('PO_DETAIL_ID').AsString));
  try
    if lPODetail = nil then
      Exit;

    if lPODetail.ID = '' then
      Exit;

    if VarIsNull(DCitem.Values[DCItem.FocusedRecordIndex,cxGridColCNDetailColumnQty.Index]) then
      lQTY := lPoDetail.POD_QTY_ORDER
    else
      lQTY := DCitem.Values[DCItem.FocusedRecordIndex,cxGridColCNDetailColumnQty.Index];

    //disc per qty
    lDisc   := lPoDetail.POD_TOTAL_DISC; // / lPoDetail.POD_QTY_ORDER;
    lPrice  := lPODetail.POD_PRICE;
    lTotal  := lQTY * (lPrice - lDisc);
    lPPN    := lPODetail.POD_PPN_PERSEN/100 * lTotal;
    lPPNBM  := lPODetail.POD_PPNBM_PERSEN/100 * lTotal;

    cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnNama.Index, lPODetail.POD_BARANG.ID);
    cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnHargaBeli.Index, lPrice);
    cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnUOM.Index, lPODetail.POD_UOM.ID);
    cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnQty.Index, lQTY);
    cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnTotal.Index, lTotal);
    cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnBarangSupplier.Index, lPODetail.POD_BARANG_SUPPLIER.ID);
    cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnPO.Index, lPODetail.POD_PO.ID);
    cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnPPN.Index, lPPN);
    cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnPPNBM.Index, lPPNBM);
    cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnPPNPERSEN.Index, lPODetail.POD_PPN_PERSEN);
    cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnPPNBMPERSEN.Index, lPODetail.POD_PPNBM_PERSEN);
    cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnTotalDisc.Index, lDisc * lQTY);
    cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnPODetail.Index, lPODetail.ID);
    cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnDisc.Index, lDisc);
//    cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnSupMG.Index, lPODetail.POD_PPNBM_PERSEN);

    CalculateTotal;
  finally
    lPODetail.Free;
  end;

end;

procedure TfrmDialogCN.cxGridColCNDetailColumnQtyPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalculateTotal;
end;

procedure TfrmDialogCN.cxGridTableCNDetailEditing(Sender:
    TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  inherited;
  AAllow := False;
  if AItem.Index in [cxGridColCNDetailColumnKode.Index, cxGridColCNDetailColumnQty.Index] then
    AAllow := True;

end;

procedure TfrmDialogCN.DeleteData;
begin
  if not Assigned(CNRecv) then
    Raise Exception.Create('Data not Loaded');

  if CNRecv.ID = '' then
  begin
    TAppUtils.Error('Tidak ada data yang dihapus');
    exit;
  end;

  Try
    DMClient.CrudCNClient.DeleteFromDB(CNRecv);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.ModalResult := mrOk;
  except
    TAppUtils.Error(ER_DELETE_FAILED);
    raise;
  End;
end;

procedure TfrmDialogCN.edPOKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
var
  iNomor: Integer;
begin
  inherited;
  if Key = 13 then
  begin
    iNomor    := StrToIntDef(edPO.Text,0);
    edPO.Text := RightStr('00000000000' + IntToStr(iNomor), 11);

    LoadPO(edPO.Text);
  end;

end;

procedure TfrmDialogCN.edPOPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  with TfrmCXLookup.Execute('Look Up PO','TDSProvider.PO_GetDSByPeriod',
    StartOfTheYear(Now), EndOfTheYear(Now())) do
  begin
    Try
      HideFields(['AUT$UNIT_ID','PO_ID','REF$STATUS_PO_ID']);
      if ShowModal = mrOK then
      begin
        edPo.Text := Data.FieldByName('PO_NO').AsString;
        LoadPO(edPO.Text);
      end;
    Finally
      free;
    End;
  end;
end;

procedure TfrmDialogCN.FormCreate(Sender: TObject);
begin
  inherited;
  LoadData('');

  InisialisasiCBBUOM;
end;

function TfrmDialogCN.GetCNDNClass: TModAppClass;
begin
  Result := TModCNRecv;
end;

function TfrmDialogCN.GetCNRecv: TModCNRecv;
begin
  if FCNRecv = nil then
  begin
    FCNRecv := GetCNDNClass.Create as TModCNRecv;
  end;

  Result := FCNRecv;
end;

function TfrmDialogCN.GetDCItem: TcxGridDataController;
begin
  Result := cxGridTableCNDetail.DataController;
end;

procedure TfrmDialogCN.InisialisasiCBBUOM;
begin
  FCDS_UOM := TDBUtils.DSToCDS(DMClient.DSProviderClient.Satuan_GetDSLookup, Self);
  TcxExtLookupComboBoxProperties(cxGridTableCNDetail.Columns[cxGridColCNDetailColumnUOM.Index].Properties).LoadFromCDS(
    FCDS_UOM,'ref$satuan_id','sat_code',['ref$satuan_id'],Self);

end;

procedure TfrmDialogCN.LoadData(AID: string);
  var
  i: Integer;
  iRec: Integer;
  lItem: TModCNRecvItem;
begin
  ClearByTag([0,1]);
  if AID = '' then Exit;
  if Assigned(FCNRecv) then FreeAndNil(FCNRecv);

  FCNRecv := DMClient.CrudCNClient.Retrieve(GetCNDNClass.ClassName, aID) as TModCNRecv;

  FPO := TModPO(DMClient.CrudPOClient.Retrieve(TModPO.ClassName,CNRecv.CNR_PO.ID));
  FPO.LoadPO_SUPPLIER_MERCHAN_GRUP;

  edPO.Text           := FPO.PO_NO;
  edKodeSupplier.Text := FPO.PO_SUPPLIER_MERCHAN_GRUP.SUPMG_SUB_CODE;
  edNamaSupplier.Text := FPO.PO_SUPPLIER_MERCHAN_GRUP.SUPMG_NAME;
  cxGridTableCNDetail.ClearRows;
  LoadPLU(FPO);

  FreeAndNil(FDO);
  FDO := DMClient.CrudDOClient.RetrieveByPO(FPO.PO_NO);
  LoadDO(FDO);

  DCItem.RecordCount  := 0;
  dtCN.Date           := CNRecv.CNR_DATE;
  edNoCN.Text         := CNRecv.CNR_NO;
  edPPN.Value         := CNRecv.CNR_PPN;
  edPPNBM.Value       := CNRecv.CNR_PPNBM;
  edTotal.Value       := CNRecv.CNR_TOTAL;
  edSubTotal.Value    := CNRecv.CNR_TOTAL - CNRecv.CNR_PPN - CNRecv.CNR_PPNBM;

  for i := 0 to CNRecv.CNR_CNRDITEMS.Count-1 do
  begin
    lItem := CNRecv.CNR_CNRDITEMS[i];
    iRec := DCItem.AppendRecord;
    DCItem.Values[iRec, cxGridColCNDetailColumnBarangSupplier.Index] := lItem.BARANG_SUPLIER.ID;
    DCItem.Values[iRec, cxGridColCNDetailColumnKode.Index]           := lItem.PO_DETAIL.ID;
    DCItem.Values[iRec, cxGridColCNDetailColumnNama.Index]           := lItem.BARANG.ID;
    DCItem.Values[iRec, cxGridColCNDetailColumnPODetail.Index]       := lItem.PO_DETAIL.ID;
    DCItem.Values[iRec, cxGridColCNDetailColumnUOM.Index]            := lItem.CNRD_UOM.ID;
    DCItem.Values[iRec, cxGridColCNDetailColumnQty.Index]            := lItem.CNRD_QTY;
    DCItem.Values[iRec, cxGridColCNDetailColumnTotal.Index]          := lItem.CNRD_TOTAL;
    DCItem.Values[iRec, cxGridColCNDetailColumnTotalDisc.Index]      := lItem.CNRD_TOTAL_DISC;
    DCItem.Values[iRec, cxGridColCNDetailColumnPPN.Index]            := lItem.CNRD_PPN;
    DCItem.Values[iRec, cxGridColCNDetailColumnPPNBM.Index]          := lItem.CNRD_PPNBM;
    DCItem.Values[iRec, cxGridColCNDetailColumnPPNPERSEN.Index]      := lItem.CNRD_PPN_PERSEN;
    DCItem.Values[iRec, cxGridColCNDetailColumnPPNBMPERSEN.Index]    := lItem.CNRD_PPNBM_PERSEN;
    DCItem.Values[iRec, cxGridColCNDetailColumnHargaBeli.Index]      := lItem.CNRD_PRICE;
    DCItem.Values[iRec, cxGridColCNDetailColumnDisc.Index]           := lItem.DISCOUNT;
  end;


end;

procedure TfrmDialogCN.LoadDO(ADO: TModDO);
begin
  dtTerima.Date := Now;
  edNoNP.Text   := '';
  edNoDO.Text   := '';

  if ADO= nil then
    Exit;

  dtTerima.Date := ADO.DO_DATE;
  edNoNP.Text   := ADO.DO_NP;
  edNoDO.Text   := ADO.DO_NO;
end;

procedure TfrmDialogCN.LoadPLU(APO: TModPO);
begin
  if APO = nil then
    Exit;

  FCDSPO_DETAIL := TDBUtils.DSToCDS(DMClient.DSProviderClient.PO_DSLookUpDetail(APO.PO_NO), Self);
  TcxExtLookupComboBoxProperties(cxGridTableCNDetail.Columns[cxGridColCNDetailColumnKode.Index].Properties).LoadFromCDS(
    FCDSPO_DETAIL,'PO_DETAIL_id','BRG_CODE',['PO_NO','PO_DETAIL_id','REF$SATUAN_ID', 'BARANG_ID'],Self);

  TcxExtLookupComboBoxProperties(cxGridTableCNDetail.Columns[cxGridColCNDetailColumnNama.Index].Properties).LoadFromCDS(
    FCDSPO_DETAIL,'BARANG_ID','BRG_NAME',['PO_NO','PO_DETAIL_id','REF$SATUAN_ID', 'BARANG_ID'],Self);
end;

procedure TfrmDialogCN.LoadPO(aPONO: String);
begin
  FreeAndNil(FPO);

  FPO := TModPO(DMClient.CrudPOClient.RetrieveByCode(TModPO.ClassName,aPONO));
  if FPO = nil then
    Exit;

  if FPO.ID = '' then
    Exit;

  FPO.LoadPO_SUPPLIER_MERCHAN_GRUP;

  edPO.Text           := FPO.PO_NO;
  edKodeSupplier.Text := FPO.PO_SUPPLIER_MERCHAN_GRUP.SUPMG_SUB_CODE;
  edNamaSupplier.Text := FPO.PO_SUPPLIER_MERCHAN_GRUP.SUPMG_NAME;
//  edPPN.Value         := FPO.PO_PPN;
//  edPPNBM.Value       := FPO.PO_PPNBM;
//  edSubTotal.Value    := FPO.PO_SUBTOTAL;
//  edTotal.Value       := FPO.PO_TOTAL;

  cxGridTableCNDetail.ClearRows;
  LoadPLU(FPO);

  FreeAndNil(FDO);
  FDO := DMClient.CrudDOClient.RetrieveByPO(FPO.PO_NO);
  LoadDO(FDO);


end;

procedure TfrmDialogCN.UpdateData;
var
  i: Integer;
  lItem: TModCNRecvItem;
begin
  CalculateTotal;
  CNRecv.CNR_DATE       := dtCN.Date;
  CNRecv.CNR_PO         := TModPO.CreateID(FPO.ID);
  CNRecv.CNR_IS_CLAIM   := 0;
  CNRecv.CNR_NO         := edNoCN.Text;
  CNRecv.CNR_PPN        := edPPN.Value;
  CNRecv.CNR_PPNBM      := edPPNBM.Value;
  CNRecv.CNR_TOTAL      := edTotal.Value;
  CNRecv.CNR_UNT        := TModUnit.CreateID(TRetno.UnitStore.ID);
  CNRecv.CNR_DO         := TModDO.CreateID(FDO.ID);
  CNRecv.CNR_GUDANG     := TModGudang.CreateID(TRetno.SettingApp.GUDANG_DO.ID);
  CNRecv.CNR_TOTAL_DISC := 0;

  CNRecv.CNR_CNRDITEMS.Clear;
  for i := 0 to DCItem.RecordCount-1 do
  begin
    lItem := TModCNRecvItem.Create;
    CNRecv.CNR_CNRDITEMS.Add(lItem);

    lItem.BARANG_SUPLIER      := TModBarangSupplier.CreateID(DCItem.Values[i, cxGridColCNDetailColumnBarangSupplier.Index]);
    lItem.BARANG              := TModBarang.CreateID(DCItem.Values[i, cxGridColCNDetailColumnNama.Index]);
    lItem.PO_DETAIL           := TModPoItem.CreateID(DCItem.Values[i, cxGridColCNDetailColumnPODetail.Index]);
    lItem.CNRD_UOM            := TModSatuan.CreateID(DCItem.Values[i, cxGridColCNDetailColumnUOM.Index]);
    lItem.CNRD_QTY            := DCItem.Values[i, cxGridColCNDetailColumnQty.Index];
    lItem.CNRD_TOTAL          := DCItem.Values[i, cxGridColCNDetailColumnTotal.Index];
    lItem.CNRD_TOTAL_DISC     := DCItem.Values[i, cxGridColCNDetailColumnTotalDisc.Index];
    lItem.CNRD_PPN            := DCItem.Values[i, cxGridColCNDetailColumnPPN.Index];
    lItem.CNRD_PPNBM          := DCItem.Values[i, cxGridColCNDetailColumnPPNBM.Index];
    lItem.CNRD_PPN_PERSEN     := DCItem.Values[i, cxGridColCNDetailColumnPPNPERSEN.Index];
    lItem.CNRD_PPNBM_PERSEN   := DCItem.Values[i, cxGridColCNDetailColumnPPNBMPERSEN.Index];
    lItem.CNRD_PRICE          := DCItem.Values[i, cxGridColCNDetailColumnHargaBeli.Index];
    lItem.DISCOUNT            := DCItem.Values[i, cxGridColCNDetailColumnDisc.Index];

    CNRecv.CNR_TOTAL_DISC     := CNRecv.CNR_TOTAL_DISC + lItem.CNRD_TOTAL_DISC;
  end;

end;

function TfrmDialogCN.ValidateData: Boolean;
var
  i: Integer;
  j: Integer;
  lBSID: String;
begin
  Result := False;
  if not ValidateEmptyCtrl([0,1]) then exit;

  //check empty grid;
  if DCItem.RecordCount = 0 then
  begin
    TAppUtils.Warning('Baris Item masih kosong');
    exit;
  end;

  //check QTY > DO
  if not Assigned(FDO) then exit;
  for i := 0 to DCItem.RecordCount-1 do
  begin
    if DCItem.Values[i,cxGridColCNDetailColumnQty.Index] = 0 then
    begin
      TAppUtils.Warning('QTY CN = 0');
      exit;
    end;

    for j := 0 to FDO.DOItems.Count-1 do
    begin
      lBSID := DCItem.Values[i,cxGridColCNDetailColumnNama.Index];
      if (lBSID = FDO.DOItems[j].BARANG.ID) then
      begin
        if DCItem.Values[i,cxGridColCNDetailColumnQty.Index] > FDO.DOItems[j].DOD_QTY_ORDER_RECV then
        begin
          TAppUtils.Warning('QTY CN tidak boleh melebihi QTY DO '
            +#13 +'Baris : ' + inttostr(i+1));
          exit;
        end;
      end;
    end;

    for j := 0 to DCItem.RecordCount-1 do
    begin
      if i = j then continue;
      if DCItem.Values[i, cxGridColCNDetailColumnNama.Index] = DCItem.Values[j, cxGridColCNDetailColumnNama.Index] then
      begin
        TAppUtils.Warning('Item Baris : ' + inttostr(i+1) + ' & ' + inttostr(j+1) + ' sama');
        exit;
      end;
    end;
  end;

  Result := True;
end;

end.
