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
  cxButtonEdit, Vcl.Menus, cxButtons, cxGroupBox;

type
  TfrmDialogCN = class(TfrmMasterDialog)
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
  private
    FCDSPO_DETAIL: TClientDataset;
    FCDS_UOM: TClientDataset;
    FCNRecv: TModCNRecv;
    FDO: TModDO;
    FPO: TModPO;
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
  public
    procedure LoadDataCN(const AID: string);
    property CNRecv: TModCNRecv read GetCNRecv write FCNRecv;
    property DCItem: TcxGridDataController read GetDCItem;
    { Public declarations }
  end;

var
  frmDialogCN: TfrmDialogCN;

implementation

uses
  uDBUtils, ufrmCXLookup, DateUtils, uAppUtils;

{$R *.dfm}

procedure TfrmDialogCN.actSaveExecute(Sender: TObject);
begin
  inherited;
  if CNRecv.ID = '' then
    edNoCN.Text := DMClient.CrudClient.GenerateNo(TModCNRecv.ClassName);

  if not ValidateData then exit;
  UpdateData;



//  CNRecv.CNR_CNRDITEMS.Clear;

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
end;

procedure TfrmDialogCN.cxGridColCNDetailColumnKodePropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  lPODetail: TModPOItem;
begin
  inherited;

  lPODetail :=  TModPOItem(DMClient.CrudClient.Retrieve(TModPOItem.ClassName, FCDSPO_DETAIL.FieldByName('PO_DETAIL_ID').AsString));
  try
    if lPODetail = nil then
      Exit;

    if lPODetail.ID = '' then
      Exit;

    cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnNama.Index, lPODetail.POD_BARANG.ID);
    cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnHargaBeli.Index, lPODetail.POD_PRICE);
    cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnUOM.Index, lPODetail.POD_UOM.ID);
    cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnQty.Index, lPODetail.POD_QTY_ORDER);
    cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnTotal.Index, lPODetail.POD_TOTAL);
    cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnBarangSupplier.Index, lPODetail.POD_BARANG_SUPPLIER.ID);
    cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnPO.Index, lPODetail.POD_PO.ID);
    cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnPPN.Index, lPODetail.POD_PPN);
    cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnPPNBM.Index, lPODetail.POD_PPNBM);
    cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnPPNPERSEN.Index, lPODetail.POD_PPN_PERSEN);
    cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnPPNBMPERSEN.Index, lPODetail.POD_PPNBM_PERSEN);
    cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnTotalDisc.Index, lPODetail.POD_TOTAL_DISC);
    //cxGridTableCNDetail.SetValue(cxGridTableCNDetail.RecordIndex, cxGridColCNDetailColumnSupMG.Index, lPODetail.POD_PPNBM_PERSEN);
  finally
    lPODetail.Free;
  end;

end;

procedure TfrmDialogCN.cxGridTableCNDetailEditing(Sender:
    TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  inherited;
  AAllow := False;
  if AItem.Index in [cxGridColCNDetailColumnKode.Index, cxGridColCNDetailColumnQty.Index] then
    AAllow := True;

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
  with TfrmCXLookup.Execute('Look Up SO','TDSProvider.PO_GetDSByPeriod',
    StartOfTheYear(Now), EndOfTheYear(Now())) do
  begin
    Try
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
  LoadDataCN('');

  InisialisasiCBBUOM;
end;

function TfrmDialogCN.GetCNRecv: TModCNRecv;
begin
  if FCNRecv = nil then
  begin
    FCNRecv := TModCNRecv.Create;
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

procedure TfrmDialogCN.LoadDataCN(const AID: string);
begin
  ClearByTag([0,1]);
  if AID = '' then
    Exit;
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
  edPPN.Value         := FPO.PO_PPN;
  edPPNBM.Value       := FPO.PO_PPNBM;
  edSubTotal.Value    := FPO.PO_SUBTOTAL;
  edTotal.Value       := FPO.PO_TOTAL;

  cxGridTableCNDetail.ClearRows;
  LoadPLU(FPO);

  FreeAndNil(FDO);
  FDO := DMClient.CrudDOClient.RetrieveByPO(FPO.PO_NO);
  LoadDO(FDO);
end;

procedure TfrmDialogCN.UpdateData;
begin

  CNRecv.CNR_DATE     := dtCN.Date;
  CNRecv.CNR_PO       := TModPO.CreateID(FPO.ID);

  CNRecv.CNR_IS_CLAIM := 0;
  CNRecv.CNR_NO       := edNoCN.Text;

  CNRecv.CNR_PPN      := edPPN.Value;
  CNRecv.CNR_PPNBM    := edPPNBM.Value;
  CNRecv.CNR_TOTAL    := edTotal.Value;
  CNRecv.CNR_UNT      := TModUnit.CreateID(TRetno.UnitStore.ID);

//  CNRecv.
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
    if DCItem.Values[cxGridColCNDetailColumnQty.Index, i] = 0 then
    begin
      TAppUtils.Warning('QTY CN = 0');
      exit;
    end;

    for j := 0 to FDO.DOItems.Count-1 do
    begin
      lBSID := DCItem.Values[cxGridColCNDetailColumnNama.Index, i];
      if (lBSID = FDO.DOItems[j].BARANG.ID) then
      begin
        if DCItem.Values[cxGridColCNDetailColumnQty.Index, i] > FDO.DOItems[j].DOD_QTY_ORDER_RECV then
        begin
          TAppUtils.Warning('QTY CN tidak boleh melebihi QTY DO '
            +#13 +'Baris : ' + inttostr(i+1));
          exit;
        end;
      end;
    end;
  end;

  Result := True;
end;

end.
