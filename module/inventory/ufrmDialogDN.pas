unit ufrmDialogDN;

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
  cxGrid, cxDBExtLookupComboBox, uDXUtils, uModelHelper,
  uModDO, uModPO, uModUnit, uRetnoUnit, uDMClient, System.StrUtils, Datasnap.DBClient,
  cxButtonEdit, Vcl.Menus, cxButtons, cxGroupBox, uInterface, uModApp,
  uModDNRecv;

type
  TfrmDialogDN = class(TfrmMasterDialog, ICRUDAble)
    pnlHeader: TPanel;
    lblTglDN: TLabel;
    lblNomorPO: TLabel;
    lblKodeSupplier: TLabel;
    lblNomorDN: TLabel;
    lblTglTerima: TLabel;
    lblNP: TLabel;
    lblNomorDO: TLabel;
    lblSubTotal: TLabel;
    lblPPN: TLabel;
    lblPPNBM: TLabel;
    lblTotal: TLabel;
    dtDN: TcxDateEdit;
    edKodeSupplier: TcxTextEdit;
    edNamaSupplier: TcxTextEdit;
    edNoDN: TcxTextEdit;
    dtTerima: TcxDateEdit;
    edNoNP: TcxTextEdit;
    edNoDO: TcxTextEdit;
    edSubTotal: TcxCurrencyEdit;
    edPPN: TcxCurrencyEdit;
    edPPNBM: TcxCurrencyEdit;
    edTotal: TcxCurrencyEdit;
    cxgrdlvlDN: TcxGridLevel;
    cxgrdDN: TcxGrid;
    cxGridTableDNDetail: TcxGridTableView;
    cxgrdclmnDNDetailColumnTipe: TcxGridColumn;
    cxGridColDNDetailColumnKode: TcxGridColumn;
    cxGridColDNDetailColumnNama: TcxGridColumn;
    cxGridColDNDetailColumnHargaBeli: TcxGridColumn;
    cxGridColDNDetailColumnQty: TcxGridColumn;
    cxGridColDNDetailColumnUOM: TcxGridColumn;
    cxGridColDNDetailColumnTotal: TcxGridColumn;
    cxGridColDNDetailColumnBarangSupplier: TcxGridColumn;
    cxGridColDNDetailColumnPO: TcxGridColumn;
    cxGridColDNDetailColumnPPN: TcxGridColumn;
    cxGridColDNDetailColumnPPNBM: TcxGridColumn;
    cxGridColDNDetailColumnPPNBMPERSEN: TcxGridColumn;
    cxGridColDNDetailColumnPPNPERSEN: TcxGridColumn;
    cxGridColDNDetailColumnTotalDisc: TcxGridColumn;
    cxGridColDNDetailColumnSupMG: TcxGridColumn;
    edPO: TcxButtonEdit;
    cxGroupBox5: TcxGroupBox;
    Label29: TLabel;
    btnDeletePrice: TcxButton;
    btnAddPrice: TcxButton;
    cxGridColDNDetailColumnPODetail: TcxGridColumn;
    cxGridColDNDetailColumnDisc: TcxGridColumn;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure edPOKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure cxGridColDNDetailColumnKodePropertiesValidate(Sender: TObject; var
        DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridTableDNDetailEditing(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; var AAllow: Boolean);
    procedure edPOPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure btnAddPriceClick(Sender: TObject);
    procedure btnDeletePriceClick(Sender: TObject);
    procedure cxGridColDNDetailColumnQtyPropertiesEditValueChanged(Sender: TObject);
  private
    FCDSPO_DETAIL: TClientDataset;
    FCDS_UOM: TClientDataset;
    FDNRecv: TModDNRecv;
    FDO: TModDO;
    FPO: TModPO;
    procedure CalculateTotal;
    procedure DeleteData;
//    FPO: TModPO;
    function GetDNRecv: TModDNRecv;
    function GetDCItem: TcxGridDataController;
    procedure InisialisasiCBBUOM;
    procedure LoadDO(ADO: TModDO);
    procedure LoadPLU(APO: TModPO);
    procedure LoadPO(aPONO: String);
    procedure UpdateData;
    function ValidateData: Boolean;
    { Private declarations }
  protected
  public
    procedure LoadData(AID: string);
    property DNRecv: TModDNRecv read GetDNRecv write FDNRecv;
    property DCItem: TcxGridDataController read GetDCItem;
    { Public declarations }
  end;

var
  frmDialogDN: TfrmDialogDN;

implementation

uses
  uDBUtils, ufrmCXLookup, DateUtils, uAppUtils, uModBarang, uModSatuan,
  uConstanta;

{$R *.dfm}

procedure TfrmDialogDN.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if TAppUtils.Confirm('Anda Yakin Menghapus Data') then DeleteData;
end;

procedure TfrmDialogDN.actSaveExecute(Sender: TObject);
begin
  inherited;
  if DNRecv.ID = '' then
    edNoDN.Text := DMClient.CrudClient.GenerateNo(TModDNRecv.ClassName);

  if not ValidateData then exit;
  UpdateData;

  Try
    DNRecv.ID := DMClient.CrudDNClient.SaveToDBID(DNRecv);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    Self.ModalResult := mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  End;

end;

procedure TfrmDialogDN.btnAddPriceClick(Sender: TObject);
begin
  inherited;
  DCItem.AppendRecord;
end;

procedure TfrmDialogDN.btnDeletePriceClick(Sender: TObject);
begin
  inherited;
  DCItem.DeleteRecord(DCItem.FocusedRecordIndex);
  CalculateTotal;
end;

procedure TfrmDialogDN.CalculateTotal;
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
    lQTY        := DCItem.Values[i,cxGridColDNDetailColumnQty.Index];
    lPrice      := DCItem.Values[i,cxGridColDNDetailColumnHargaBeli.Index];
    lDisc       := DCItem.Values[i,cxGridColDNDetailColumnDisc.Index];
    lSubTotal   := lQTY * (lPrice-lDisc);
    lTotalDisc  := lQTy * lDisc;

    lPPN        := lSubTotal * DCItem.Values[i,cxGridColDNDetailColumnPPNPERSEN.Index]/100;
    lPPNBM      := lSubTotal * DCItem.Values[i,cxGridColDNDetailColumnPPNBMPERSEN.Index]/100;

    DCItem.Values[i,cxGridColDNDetailColumnTotal.Index] := lSubTotal + lPPN + lPPNBM;
    DCItem.Values[i,cxGridColDNDetailColumnTotalDisc.Index] := lTotalDisc;
    DCItem.Values[i,cxGridColDNDetailColumnPPN.Index] := lPPN;
    DCItem.Values[i,cxGridColDNDetailColumnPPNBM.Index] := lPPNBM;

    lTotPPN     := lTotPPN + lPPN;
    lTotPPNBM   := lTotPPNBM + lPPNBM;
    lTotal      := lTotal + lSubTotal;
  end;


  edSubTotal.Value  := lTotal;
  edPPN.Value       := lTotPPN;
  edPPNBM.Value     := lTotPPNBM;
  edTotal.Value     := lTotal + lTotPPN + lTotPPNBM;
end;

procedure TfrmDialogDN.cxGridColDNDetailColumnKodePropertiesValidate(Sender:
    TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error:
    Boolean);
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

    if VarIsNull(DCitem.Values[DCItem.FocusedRecordIndex,cxGridColDNDetailColumnQty.Index]) then
      lQTY := lPoDetail.POD_QTY_ORDER
    else
      lQTY := DCitem.Values[DCItem.FocusedRecordIndex,cxGridColDNDetailColumnQty.Index];

    //disc per qty
    lDisc   := lPoDetail.POD_TOTAL_DISC; // / lPoDetail.POD_QTY_ORDER;
    lPrice  := lPODetail.POD_PRICE;
    lTotal  := lQTY * (lPrice - lDisc);
    lPPN    := lPODetail.POD_PPN_PERSEN/100 * lTotal;
    lPPNBM  := lPODetail.POD_PPNBM_PERSEN/100 * lTotal;

    cxGridTableDNDetail.SetValue(cxGridTableDNDetail.RecordIndex, cxGridColDNDetailColumnNama.Index, lPODetail.POD_BARANG.ID);
    cxGridTableDNDetail.SetValue(cxGridTableDNDetail.RecordIndex, cxGridColDNDetailColumnHargaBeli.Index, lPrice);
    cxGridTableDNDetail.SetValue(cxGridTableDNDetail.RecordIndex, cxGridColDNDetailColumnUOM.Index, lPODetail.POD_UOM.ID);
    cxGridTableDNDetail.SetValue(cxGridTableDNDetail.RecordIndex, cxGridColDNDetailColumnQty.Index, lQTY);
    cxGridTableDNDetail.SetValue(cxGridTableDNDetail.RecordIndex, cxGridColDNDetailColumnTotal.Index, lTotal);
    cxGridTableDNDetail.SetValue(cxGridTableDNDetail.RecordIndex, cxGridColDNDetailColumnBarangSupplier.Index, lPODetail.POD_BARANG_SUPPLIER.ID);
    cxGridTableDNDetail.SetValue(cxGridTableDNDetail.RecordIndex, cxGridColDNDetailColumnPO.Index, lPODetail.POD_PO.ID);
    cxGridTableDNDetail.SetValue(cxGridTableDNDetail.RecordIndex, cxGridColDNDetailColumnPPN.Index, lPPN);
    cxGridTableDNDetail.SetValue(cxGridTableDNDetail.RecordIndex, cxGridColDNDetailColumnPPNBM.Index, lPPNBM);
    cxGridTableDNDetail.SetValue(cxGridTableDNDetail.RecordIndex, cxGridColDNDetailColumnPPNPERSEN.Index, lPODetail.POD_PPN_PERSEN);
    cxGridTableDNDetail.SetValue(cxGridTableDNDetail.RecordIndex, cxGridColDNDetailColumnPPNBMPERSEN.Index, lPODetail.POD_PPNBM_PERSEN);
    cxGridTableDNDetail.SetValue(cxGridTableDNDetail.RecordIndex, cxGridColDNDetailColumnTotalDisc.Index, lDisc * lQTY);
    cxGridTableDNDetail.SetValue(cxGridTableDNDetail.RecordIndex, cxGridColDNDetailColumnPODetail.Index, lPODetail.ID);
    cxGridTableDNDetail.SetValue(cxGridTableDNDetail.RecordIndex, cxGridColDNDetailColumnDisc.Index, lDisc);
//    cxGridTableDNDetail.SetValue(cxGridTableDNDetail.RecordIndex, cxGridColDNDetailColumnSupMG.Index, lPODetail.POD_PPNBM_PERSEN);

    CalculateTotal;
  finally
    lPODetail.Free;
  end;

end;

procedure TfrmDialogDN.cxGridColDNDetailColumnQtyPropertiesEditValueChanged(
    Sender: TObject);
begin
  inherited;
  CalculateTotal;
end;

procedure TfrmDialogDN.cxGridTableDNDetailEditing(Sender:
    TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  inherited;
  AAllow := False;
  if AItem.Index in [cxGridColDNDetailColumnKode.Index, cxGridColDNDetailColumnQty.Index] then
    AAllow := True;

end;

procedure TfrmDialogDN.DeleteData;
begin
  if not Assigned(DNRecv) then
    Raise Exception.Create('Data not Loaded');

  if DNRecv.ID = '' then
  begin
    TAppUtils.Error('Tidak ada data yang dihapus');
    exit;
  end;

  Try
    DMClient.CrudDNClient.DeleteFromDB(DNRecv);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.ModalResult := mrOk;
  except
    TAppUtils.Error(ER_DELETE_FAILED);
    raise;
  End;
end;

procedure TfrmDialogDN.edPOKeyDown(Sender: TObject; var Key: Word; Shift:
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

procedure TfrmDialogDN.edPOPropertiesButtonClick(Sender: TObject;
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

procedure TfrmDialogDN.FormCreate(Sender: TObject);
begin
  inherited;
  LoadData('');

  InisialisasiCBBUOM;
end;

function TfrmDialogDN.GetDNRecv: TModDNRecv;
begin
  if FDNRecv = nil then
  begin
    FDNRecv := TModDNRecv.Create;
  end;

  Result := FDNRecv;
end;

function TfrmDialogDN.GetDCItem: TcxGridDataController;
begin
  Result := cxGridTableDNDetail.DataController;
end;

procedure TfrmDialogDN.InisialisasiCBBUOM;
begin
  FCDS_UOM := TDBUtils.DSToCDS(DMClient.DSProviderClient.Satuan_GetDSLookup, Self);
  TcxExtLookupComboBoxProperties(cxGridTableDNDetail.Columns[cxGridColDNDetailColumnUOM.Index].Properties).LoadFromCDS(
    FCDS_UOM,'ref$satuan_id','sat_code',['ref$satuan_id'],Self);

end;

procedure TfrmDialogDN.LoadData(AID: string);
  var
  i: Integer;
  iRec: Integer;
  lItem: TModDNRecvItem;
begin
  ClearByTag([0,1]);
  if AID = '' then Exit;
  if Assigned(FDNRecv) then FreeAndNil(FDNRecv);

  FDNRecv := DMClient.CrudDNClient.Retrieve(TModDNRecv.ClassName, aID) as TModDNRecv;

  FPO := TModPO(DMClient.CrudPOClient.Retrieve(TModPO.ClassName,DNRecv.DNR_PO.ID));
  FPO.LoadPO_SUPPLIER_MERCHAN_GRUP;

  edPO.Text           := FPO.PO_NO;
  edKodeSupplier.Text := FPO.PO_SUPPLIER_MERCHAN_GRUP.SUPMG_SUB_CODE;
  edNamaSupplier.Text := FPO.PO_SUPPLIER_MERCHAN_GRUP.SUPMG_NAME;
  cxGridTableDNDetail.ClearRows;
  LoadPLU(FPO);

  FreeAndNil(FDO);
  FDO := DMClient.CrudDOClient.RetrieveByPO(FPO.PO_NO);
  LoadDO(FDO);

  DCItem.RecordCount  := 0;
  dtDN.Date           := DNRecv.DNR_DATE;
  edNoDN.Text         := DNRecv.DNR_NO;
  edPPN.Value         := DNRecv.DNR_PPN;
  edPPNBM.Value       := DNRecv.DNR_PPNBM;
  edTotal.Value       := DNRecv.DNR_TOTAL;
  edSubTotal.Value    := DNRecv.DNR_TOTAL - DNRecv.DNR_PPN - DNRecv.DNR_PPNBM;

  for i := 0 to DNRecv.DNR_DNRDITEMS.Count-1 do
  begin
    lItem := DNRecv.DNR_DNRDITEMS[i];
    iRec := DCItem.AppendRecord;
    DCItem.Values[iRec, cxGridColDNDetailColumnBarangSupplier.Index] := lItem.BARANG_SUPLIER.ID;
    DCItem.Values[iRec, cxGridColDNDetailColumnKode.Index]           := lItem.PO_DETAIL.ID;
    DCItem.Values[iRec, cxGridColDNDetailColumnNama.Index]           := lItem.BARANG.ID;
    DCItem.Values[iRec, cxGridColDNDetailColumnPODetail.Index]       := lItem.PO_DETAIL.ID;
    DCItem.Values[iRec, cxGridColDNDetailColumnUOM.Index]            := lItem.DNRD_UOM.ID;
    DCItem.Values[iRec, cxGridColDNDetailColumnQty.Index]            := lItem.DNRD_QTY;
    DCItem.Values[iRec, cxGridColDNDetailColumnTotal.Index]          := lItem.DNRD_TOTAL;
    DCItem.Values[iRec, cxGridColDNDetailColumnTotalDisc.Index]      := lItem.DNRD_TOTAL_DISC;
    DCItem.Values[iRec, cxGridColDNDetailColumnPPN.Index]            := lItem.DNRD_PPN;
    DCItem.Values[iRec, cxGridColDNDetailColumnPPNBM.Index]          := lItem.DNRD_PPNBM;
    DCItem.Values[iRec, cxGridColDNDetailColumnPPNPERSEN.Index]      := lItem.DNRD_PPN_PERSEN;
    DCItem.Values[iRec, cxGridColDNDetailColumnPPNBMPERSEN.Index]    := lItem.DNRD_PPNBM_PERSEN;
    DCItem.Values[iRec, cxGridColDNDetailColumnHargaBeli.Index]      := lItem.DNRD_PRICE;
    DCItem.Values[iRec, cxGridColDNDetailColumnDisc.Index]           := lItem.DISCOUNT;
  end;


end;

procedure TfrmDialogDN.LoadDO(ADO: TModDO);
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

procedure TfrmDialogDN.LoadPLU(APO: TModPO);
begin
  if APO = nil then
    Exit;

  FCDSPO_DETAIL := TDBUtils.DSToCDS(DMClient.DSProviderClient.PO_DSLookUpDetail(APO.PO_NO), Self);
  TcxExtLookupComboBoxProperties(cxGridTableDNDetail.Columns[cxGridColDNDetailColumnKode.Index].Properties).LoadFromCDS(
    FCDSPO_DETAIL,'PO_DETAIL_id','BRG_CODE',['PO_NO','PO_DETAIL_id','REF$SATUAN_ID', 'BARANG_ID'],Self);

  TcxExtLookupComboBoxProperties(cxGridTableDNDetail.Columns[cxGridColDNDetailColumnNama.Index].Properties).LoadFromCDS(
    FCDSPO_DETAIL,'BARANG_ID','BRG_NAME',['PO_NO','PO_DETAIL_id','REF$SATUAN_ID', 'BARANG_ID'],Self);
end;

procedure TfrmDialogDN.LoadPO(aPONO: String);
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

  cxGridTableDNDetail.ClearRows;
  LoadPLU(FPO);

  FreeAndNil(FDO);
  FDO := DMClient.CrudDOClient.RetrieveByPO(FPO.PO_NO);
  LoadDO(FDO);


end;

procedure TfrmDialogDN.UpdateData;
var
  i: Integer;
  lItem: TModDNRecvItem;
begin
  CalculateTotal;
  DNRecv.DNR_DATE     := dtDN.Date;
  DNRecv.DNR_PO       := TModPO.CreateID(FPO.ID);
  DNRecv.DNR_IS_CLAIM := 0;
  DNRecv.DNR_NO       := edNoDN.Text;
  DNRecv.DNR_PPN      := edPPN.Value;
  DNRecv.DNR_PPNBM    := edPPNBM.Value;
  DNRecv.DNR_TOTAL    := edTotal.Value;
  DNRecv.DNR_UNT      := TModUnit.CreateID(TRetno.UnitStore.ID);
  DNRecv.DNR_DO       := TModDO.CreateID(FDO.ID);


  DNRecv.DNR_DNRDITEMS.Clear;
  for i := 0 to DCItem.RecordCount-1 do
  begin
    lItem := TModDNRecvItem.Create;
    DNRecv.DNR_DNRDITEMS.Add(lItem);

    lItem.BARANG_SUPLIER      := TModBarangSupplier.CreateID(DCItem.Values[i, cxGridColDNDetailColumnBarangSupplier.Index]);
    lItem.BARANG              := TModBarang.CreateID(DCItem.Values[i, cxGridColDNDetailColumnNama.Index]);
    lItem.PO_DETAIL           := TModPoItem.CreateID(DCItem.Values[i, cxGridColDNDetailColumnPODetail.Index]);
    lItem.DNRD_UOM            := TModSatuan.CreateID(DCItem.Values[i, cxGridColDNDetailColumnUOM.Index]);
    lItem.DNRD_QTY            := DCItem.Values[i, cxGridColDNDetailColumnQty.Index];
    lItem.DNRD_TOTAL          := DCItem.Values[i, cxGridColDNDetailColumnTotal.Index];
    lItem.DNRD_TOTAL_DISC     := DCItem.Values[i, cxGridColDNDetailColumnTotalDisc.Index];
    lItem.DNRD_PPN            := DCItem.Values[i, cxGridColDNDetailColumnPPN.Index];
    lItem.DNRD_PPNBM          := DCItem.Values[i, cxGridColDNDetailColumnPPNBM.Index];
    lItem.DNRD_PPN_PERSEN     := DCItem.Values[i, cxGridColDNDetailColumnPPNPERSEN.Index];
    lItem.DNRD_PPNBM_PERSEN   := DCItem.Values[i, cxGridColDNDetailColumnPPNBMPERSEN.Index];
    lItem.DNRD_PRICE          := DCItem.Values[i, cxGridColDNDetailColumnHargaBeli.Index];
    lItem.DISCOUNT            := DCItem.Values[i, cxGridColDNDetailColumnDisc.Index];
  end;

end;

function TfrmDialogDN.ValidateData: Boolean;
var
  i: Integer;
  j: Integer;
//  lBSID: String;
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
    if DCItem.Values[i,cxGridColDNDetailColumnQty.Index] = 0 then
    begin
      TAppUtils.Warning('QTY CN = 0');
      exit;
    end;

//    for j := 0 to FDO.DOItems.Count-1 do
//    begin
//      lBSID := DCItem.Values[i,cxGridColDNDetailColumnNama.Index];
//      if (lBSID = FDO.DOItems[j].BARANG.ID) then
//      begin
//        if DCItem.Values[i,cxGridColDNDetailColumnQty.Index] > FDO.DOItems[j].DOD_QTY_ORDER_RECV then
//        begin
//          TAppUtils.Warning('QTY CN tidak boleh melebihi QTY DO '
//            +#13 +'Baris : ' + inttostr(i+1));
//          exit;
//        end;
//      end;
//    end;
    for j := 0 to DCItem.RecordCount-1 do
    begin
      if i = j then continue;
      if DCItem.Values[i, cxGridColDNDetailColumnNama.Index] = DCItem.Values[j, cxGridColDNDetailColumnNama.Index] then
      begin
        TAppUtils.Warning('Item Baris : ' + inttostr(i+1) + ' & ' + inttostr(j+1) + ' sama');
        exit;
      end;
    end;
  end;

  Result := True;
end;

end.
