unit ufrmDialogClaim;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, Vcl.StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar,
  cxCurrencyEdit, cxMemo, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, uDMClient, cxGridBandedTableView, cxGridDBBandedTableView, Vcl.Menus,
  cxButtons, uDXUtils, Datasnap.DBClient, uDBUtils, uModClaimFaktur,
  uModRekening, uModSuplier, uConstanta, uInterface;

type
  TfrmDialogClaim = class(TfrmMasterDialog, ICrudAble)
    pnlHeader: TPanel;
    cbbSupplierMG: TcxExtLookupComboBox;
    lblTTF: TLabel;
    dtTglClaim: TcxDateEdit;
    edTTFNo: TcxTextEdit;
    lblTgkClaim: TLabel;
    lblDescription: TLabel;
    memDescription: TcxMemo;
    pnlSummary: TPanel;
    lblDO: TLabel;
    lblCN: TLabel;
    crTotalDO: TcxCurrencyEdit;
    crTotalCN: TcxCurrencyEdit;
    lblDN: TLabel;
    lblOther: TLabel;
    lblTotal: TLabel;
    crTotalDN: TcxCurrencyEdit;
    crTotalOther: TcxCurrencyEdit;
    crTotal: TcxCurrencyEdit;
    pnlData: TPanel;
    cxgrdClaim: TcxGrid;
    cxGridDBTableCN: TcxGridDBTableView;
    cxGridColCNNP: TcxGridDBColumn;
    cxGridColCNPO: TcxGridDBColumn;
    cxGridColCNTgl: TcxGridDBColumn;
    cxGridColCNNominal: TcxGridDBColumn;
    cxGridDBTableDN: TcxGridDBTableView;
    cxGridColDNNP: TcxGridDBColumn;
    cxGridColDNPO: TcxGridDBColumn;
    cxGridColDNTgl: TcxGridDBColumn;
    cxGridColDNNominal: TcxGridDBColumn;
    cxGridDBTableOther: TcxGridDBTableView;
    cxGridColOtherCostCenter: TcxGridDBColumn;
    cxGridColOtherAccountCode: TcxGridDBColumn;
    cxGridColOtherAccountName: TcxGridDBColumn;
    cxGridColOtherNominal: TcxGridDBColumn;
    cxGridDBTableGR: TcxGridDBBandedTableView;
    cxGridColGRNP: TcxGridDBBandedColumn;
    cxGridColGRPO: TcxGridDBBandedColumn;
    cxGridColGRNoFaktur: TcxGridDBBandedColumn;
    cxGridColGRTglFakturPajak: TcxGridDBBandedColumn;
    cxGridColGRNoFakturPajak: TcxGridDBBandedColumn;
    cxGridColGRNominalFakturPajak: TcxGridDBBandedColumn;
    cxGridColGRTglFaktur: TcxGridDBBandedColumn;
    cxGridColGRNominal: TcxGridDBBandedColumn;
    cxgrdlvlGR: TcxGridLevel;
    cxgrdlvlCN: TcxGridLevel;
    cxgrdlvlDN: TcxGridLevel;
    cxgrdlvlOther: TcxGridLevel;
    pnlButtonData: TPanel;
    btnAddDN: TcxButton;
    actViewPO: TAction;
    actAddCN: TAction;
    actAddDN: TAction;
    actViewAdj: TAction;
    lblTglKembali: TLabel;
    dtReturnDate: TcxDateEdit;
    lblDueDate: TLabel;
    dtDueDate: TcxDateEdit;
    lblAkun: TLabel;
    cbbAccount: TcxExtLookupComboBox;
    edAKunHutang: TcxTextEdit;
    lblNoClaim: TLabel;
    edNoClaim: TcxTextEdit;
    edNamaSupplierMG: TcxTextEdit;
    btnDelItem: TcxButton;
    btnAdd: TcxButton;
    btnDetail: TcxButton;
    ckSupplier: TCheckBox;
    btnAddGR: TcxButton;
    btnAddCN: TcxButton;
    ckAutoDueDate: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actViewAdjExecute(Sender: TObject);
    procedure actViewPOExecute(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure cbbSupplierMGPropertiesEditValueChanged(Sender: TObject);
    procedure btnDelItemClick(Sender: TObject);
    procedure ckSupplierClick(Sender: TObject);
    procedure cbbAccountPropertiesEditValueChanged(Sender: TObject);
    procedure cxgrdClaimFocusedViewChanged(Sender: TcxCustomGrid; APrevFocusedView,
        AFocusedView: TcxCustomGridView);
    procedure cxGridColOtherAccountNamePropertiesEditValueChanged(
      Sender: TObject);
    procedure cxGridColOtherAccountCodePropertiesEditValueChanged(
      Sender: TObject);
    procedure cxGridColOtherNominalPropertiesEditValueChanged(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnDetailClick(Sender: TObject);
    procedure btnAddGRClick(Sender: TObject);
    procedure btnAddCNClick(Sender: TObject);
    procedure btnAddDNClick(Sender: TObject);
    procedure ckAutoDueDateClick(Sender: TObject);
  private
    FCDSDO: TClientDataSet;
    FCDSCN: TClientDataSet;
    FCDSOther: TClientDataSet;
    FCDSDN: TClientDataSet;
    FModClaim: TModClaimFaktur;
    procedure AddDOByID(aID: string);
    procedure AddCNByID(aID: string);
    procedure AddDNByID(aID: string);
    procedure CalculateTotal;
    procedure DeleteData;
    procedure DetailDO;
    procedure DetailCN;
    procedure DetailDN;
    function GetCDSDO: TClientDataSet;
    function GetCDSCN: TClientDataSet;
    function GetCDSOther: TClientDataSet;
    function GetCDSDN: TClientDataSet;
    function GetModClaim: TModClaimFaktur;
    procedure initView;
    procedure LoadCNDNItems;
    procedure LoadDoItems;
    procedure LoadOtherItems;
    procedure LookupDO;
    procedure LookupCN;
    procedure LookupDN;
    procedure OnAfterDelete(Sender: TDataSet);
    procedure UpdateData;
    function ValidateData: Boolean;
    property CDSDO: TClientDataSet read GetCDSDO write FCDSDO;
    property CDSCN: TClientDataSet read GetCDSCN write FCDSCN;
    property CDSOther: TClientDataSet read GetCDSOther write FCDSOther;
    property CDSDN: TClientDataSet read GetCDSDN write FCDSDN;
    property ModClaim: TModClaimFaktur read GetModClaim write FModClaim;
    { Private declarations }
  public
    procedure CalculateDueDate;
    procedure LoadData(aID: String);
    { Public declarations }
  end;

var
  frmDialogClaim: TfrmDialogClaim;

implementation

uses
  ufrmCXLookup, uAppUtils, uModDO, uModPO, uModCNRecv,
  uModDNRecv, uModAdjustmentFaktur, uModelHelper, ufrmCXMsgInfo {Ini jgn dihilangkan} ;

{$R *.dfm}

procedure TfrmDialogClaim.FormCreate(Sender: TObject);
begin
  inherited;
  initView;
  ckAutoDueDateClick(Self);
end;

procedure TfrmDialogClaim.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if TAppUtils.Confirm('Anda Yakin Menghapus Data') then DeleteData;
end;

procedure TfrmDialogClaim.actSaveExecute(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  Try
    ModClaim.ID := DMClient.CrudClaimFakturClient.SaveToDBID(ModClaim);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    Self.ModalResult := mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  End;
end;

procedure TfrmDialogClaim.actViewAdjExecute(Sender: TObject);
begin
  inherited;
  ShowMessage('LIhat Adjustment');
end;

procedure TfrmDialogClaim.actViewPOExecute(Sender: TObject);
begin
  inherited;
  ShowMessage('LIhat PO Detail');
end;

procedure TfrmDialogClaim.AddDOByID(aID: string);
var
  lDO: TModClaimFakturItemDO;
begin
  lDO := TModClaimFakturItemDO.Create;
  Try
    lDO.CLMD_DO               := TModDO.CreateID(aID);
    lDO.CLMD_DO.Reload;

    lDO.CLMD_DO_PO            := TModPO.CreateID(lDO.CLMD_DO.PO.ID);
    lDO.CLMD_DO_PO.Reload();

    lDO.CLMD_DO_DISC          := lDO.CLMD_DO.DO_DISC + lDO.CLMD_DO.DO_ADJUSTMENT_DISC;
    lDO.CLMD_DO_PPN           := lDO.CLMD_DO.DO_PPN + lDO.CLMD_DO.DO_ADJUSTMENT_PPN;
    lDO.CLMD_DO_TOTAL         := lDO.CLMD_DO.DO_TOTAL + lDO.CLMD_DO.DO_ADJUSTMENT;
    lDO.CLMD_DO_SUBTOTAL      := lDO.CLMD_DO_TOTAL - lDO.CLMD_DO_PPN -lDO.CLMD_DO_DISC;
    lDO.CLMD_DO_INV_TAX_DATE  := lDO.CLMD_DO.DO_DATE; //default

    CDSDO.Append;
    lDO.UpdateToDataset(CDSDO);
    CDSDO.FieldByName('DO_NO').AsString     := lDO.CLMD_DO.DO_NO;
    CDSDO.FieldByName('DO_NP').AsString     := lDO.CLMD_DO.DO_NO;
    CDSDO.FieldByName('PO_NO').AsString     := lDO.CLMD_DO_PO.PO_NO;
    CDSDO.FieldByName('DO_DATE').AsDateTime := lDO.CLMD_DO.DO_DATE;

    CDSDO.Post;
  Finally
    lDO.Free;
  End;
end;

procedure TfrmDialogClaim.AddCNByID(aID: string);
var
  lCN: TModClaimFakturItemCN;
begin
  lCN := TModClaimFakturItemCN.Create;
  Try
    lCN.CLMD_CN_CNRecv          := TModCNRecv.CreateID(aID);
    lCN.CLMD_CN_CNRecv.Reload;

    lCN.CLMD_CN_DO              := TModDO.CreateID(lCN.CLMD_CN_CNRecv.CNR_DO.ID);
    lCN.CLMD_CN_DO.Reload();
    lCN.CLMD_CN_DO.PO.Reload();

    lCN.CLMD_CN_DISC      := lCN.CLMD_CN_CNRecv.CNR_TOTAL_DISC;
    lCN.CLMD_CN_PPN       := lCN.CLMD_CN_CNRecv.CNR_PPN;
    lCN.CLMD_CN_TOTAL     := lCN.CLMD_CN_CNRecv.CNR_TOTAL;
    lCN.CLMD_CN_SUBTOTAL  := lCN.CLMD_CN_TOTAL - lCN.CLMD_CN_PPN - lCN.CLMD_CN_DISC;

    CDSCN.Append;
    lCN.UpdateToDataset(CDSCN);
    CDSCN.FieldByName('DO_NO').AsString     := lCN.CLMD_CN_DO.DO_NO;
    CDSCN.FieldByName('DO_NP').AsString     := lCN.CLMD_CN_DO.DO_NO;
    CDSCN.FieldByName('PO_NO').AsString     := lCN.CLMD_CN_DO.PO.PO_NO;
    CDSCN.FieldByName('CN_DATE').AsDateTime := lCN.CLMD_CN_CNRecv.CNR_DATE;
    CDSCN.Post;
  Finally
    lCN.Free;
  End;
end;

procedure TfrmDialogClaim.AddDNByID(aID: string);
var
  lDN: TModClaimFakturItemDN;
begin
  lDN := TModClaimFakturItemDN.Create;
  Try
    lDN.CLMD_DN_DNRecv          := TModDNRecv.CreateID(aID);
    lDN.CLMD_DN_DNRecv.Reload;

    lDN.CLMD_DN_DO              := TModDO.CreateID(lDN.CLMD_DN_DNRecv.DNR_DO.ID);
    lDN.CLMD_DN_DO.Reload();
    lDN.CLMD_DN_DO.PO.Reload();

    lDN.CLMD_DN_DISC      := lDN.CLMD_DN_DNRecv.DNR_TOTAL_DISC;
    lDN.CLMD_DN_PPN       := lDN.CLMD_DN_DNRecv.DNR_PPN;
    lDN.CLMD_DN_TOTAL     := lDN.CLMD_DN_DNRecv.DNR_TOTAL;
    lDN.CLMD_DN_SUBTOTAL  := lDN.CLMD_DN_TOTAL - lDN.CLMD_DN_PPN - lDN.CLMD_DN_DISC;

    CDSDN.Append;
    lDN.UpdateToDataset(CDSDN);
    CDSDN.FieldByName('DO_NO').AsString     := lDN.CLMD_DN_DO.DO_NO;
    CDSDN.FieldByName('DO_NP').AsString     := lDN.CLMD_DN_DO.DO_NO;
    CDSDN.FieldByName('PO_NO').AsString     := lDN.CLMD_DN_DO.PO.PO_NO;
    CDSDN.FieldByName('DN_DATE').AsDateTime := lDN.CLMD_DN_DNRecv.DNR_DATE;
    CDSDN.Post;
  Finally
    lDN.Free;
  End;
end;

procedure TfrmDialogClaim.btnAddClick(Sender: TObject);
begin
  inherited;
  if cxgrdClaim.FocusedView = cxGridDBTableGR then LookupDO;
  if cxgrdClaim.FocusedView = cxGridDBTableCN then LookupCN;
  if cxgrdClaim.FocusedView = cxGridDBTableDN then LookupDN;
  if cxgrdClaim.FocusedView = cxGridDBTableOther then
  begin
    CDSOther.Append;
    CDSOther.Post;
  end;
end;

procedure TfrmDialogClaim.btnAddCNClick(Sender: TObject);
begin
  inherited;
  LookupCN;
end;

procedure TfrmDialogClaim.btnAddDNClick(Sender: TObject);
begin
  inherited;
  LookupDN;
end;

procedure TfrmDialogClaim.btnAddGRClick(Sender: TObject);
begin
  inherited;
  LookupDO;
end;

procedure TfrmDialogClaim.btnDelItemClick(Sender: TObject);
begin
  inherited;
  if (cxgrdClaim.FocusedView = cxGridDBTableGR) and (not CDSDO.eof) then
    CDSDO.Delete;;
  if (cxgrdClaim.FocusedView = cxGridDBTableCN) and (not CDSCN.eof) then
    CDSCN.Delete;;
  if (cxgrdClaim.FocusedView = cxGridDBTableDN) and (not CDSDN.eof) then
    CDSDN.Delete;;
  if (cxgrdClaim.FocusedView = cxGridDBTableOther) and (not CDSOther.eof) then
    CDSOther.Delete;
  CalculateTotal;
end;

procedure TfrmDialogClaim.btnDetailClick(Sender: TObject);
begin
  inherited;
  if cxgrdClaim.FocusedView = cxGridDBTableGR then DetailDO;
  if cxgrdClaim.FocusedView = cxGridDBTableCN then DetailCN;
  if cxgrdClaim.FocusedView = cxGridDBTableDN then DetailDN;
end;

procedure TfrmDialogClaim.CalculateDueDate;
var
  lCDS: TClientDataset;
  lDate: TDateTime;
begin
  if not Assigned(ModClaim.CLM_SupplierMG) then exit;
  if CDSDO.Eof then exit;

  lCDS := CDSDO.ClonedDataset(Self);
  lDate := 0;

  Try
    lCDS.First;
    while not lCDS.eof do
    begin
      if lDate < lCDS.FieldByName('DO_DATE').AsDateTime then
        lDate := lCDS.FieldByName('DO_DATE').AsDateTime;
      lCDS.Next;
    end;
  Finally
    lCDS.Free;
  End;

  if ModClaim.CLM_SupplierMG.SUPMG_SUB_CODE = '' then
    ModClaim.CLM_SupplierMG.Reload();
  dtDueDate.Date := lDate + ModClaim.CLM_SupplierMG.SUPMG_TOP;
end;

procedure TfrmDialogClaim.CalculateTotal;
var
  lCDSCN: TClientDataSet;
  lCDSDN: TClientDataSet;
  lCDSDO: TClientDataSet;
  lCDSOther: TClientDataSet;
  lTotalCN: Double;
  lTotalDN: Double;
  lTotalDO: Double;
  lTotalOther: Double;
begin
  lTotalDO    := 0;
  lTotalCN    := 0;
  lTotalDN    := 0;
  lTotalOther := 0;
  lCDSDO      := CDSDO.ClonedDataset(Self, True);
  lCDSCN      := CDSCN.ClonedDataset(Self, True);
  lCDSDN      := CDSDN.ClonedDataset(Self, True);
  lCDSOther   := CDSOther.ClonedDataset(Self, True);
  try
    lCDSDO.First;
    while not lCDSDO.Eof do
    begin
      lTotalDO := lTotalDO + lCDSDO.FieldByName('CLMD_DO_TOTAL').AsFloat;
      lCDSDO.Next;
    end;

    lCDSCN.First;
    while not lCDSCN.Eof do
    begin
      lTotalCN := lTotalCN + lCDSCN.FieldByName('CLMD_CN_TOTAL').AsFloat;
      lCDSCN.Next;
    end;

    lCDSDN.First;
    while not lCDSDN.Eof do
    begin
      lTotalDN := lTotalDN + lCDSDN.FieldByName('CLMD_DN_TOTAL').AsFloat;
      lCDSDN.Next;
    end;

    lCDSOther.First;
    while not lCDSOther.Eof do
    begin
      lTotalOther := lTotalOther + lCDSOther.FieldByName('CLMD_OTHER_TOTAL').AsFloat;
      lCDSOther.Next;
    end;

    crTotalDO.Value     := lTotalDO;
    crTotalCN.Value     := lTotalCN;
    crTotalDN.Value     := lTotalDN;
    crTotalOther.Value  := lTotalOther;
    crTotal.Value       := lTotalDO  - lTotalCN + lTotalDN + lTotalOther;
  finally
    lCDSDO.Free;
    lCDSCN.Free;
    lCDSDN.Free;
    lCDSOther.Free;

    CDSDO.EnableControls;
    CDSCN.EnableControls;
    CDSDN.EnableControls;
    CDSOther.EnableControls;
  end;
end;

procedure TfrmDialogClaim.cbbAccountPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  edAKunHutang.Text := cbbAccount.DS.FieldByName('REK_NAME').AsString;
end;

procedure TfrmDialogClaim.cbbSupplierMGPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CDSDO.EmptyDataSet;
  CDSCN.EmptyDataSet;

  if cbbSupplierMG.DS = nil then exit;
  edNamaSupplierMG.Text := cbbSupplierMG.DS.FieldByName('SUP_NAME').AsString;
end;

procedure TfrmDialogClaim.ckAutoDueDateClick(Sender: TObject);
begin
  inherited;
  dtDueDate.Enabled := not ckAutoDueDate.Checked;
end;

procedure TfrmDialogClaim.ckSupplierClick(Sender: TObject);
begin
  inherited;
  if not ckSupplier.Checked then cbbSupplierMG.EditValue := '';
end;

procedure TfrmDialogClaim.cxgrdClaimFocusedViewChanged(Sender: TcxCustomGrid;
    APrevFocusedView, AFocusedView: TcxCustomGridView);
begin
  inherited;
  btnAddGR.Visible := AFocusedView <> cxGridDBTableGR;
  btnAddCN.Visible := AFocusedView <> cxGridDBTableCN;
  btnAddDN.Visible := AFocusedView <> cxGridDBTableDN;
  btnDetail.Visible := AFocusedView <> cxGridDBTableOther;
end;

procedure TfrmDialogClaim.cxGridColOtherAccountCodePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if CDSOther.State in [dsEdit] then CDSOther.Post;
  CDSOther.Edit;
  CDSOther.FieldValues['REK_NAME'] := CDSOther.FieldValues['CLMD_Other_Rekening'];
  CDSOther.Post;
end;

procedure TfrmDialogClaim.cxGridColOtherAccountNamePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if CDSOther.State in [dsEdit] then CDSOther.Post;
  CDSOther.Edit;
  CDSOther.FieldValues['CLMD_Other_Rekening'] := CDSOther.FieldValues['REK_NAME'];
  CDSOther.Post;
end;

procedure TfrmDialogClaim.cxGridColOtherNominalPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if CDSOther.State in [dsEdit] then CDSOther.Post;
  CalculateTotal;
end;

procedure TfrmDialogClaim.DeleteData;
begin
  if not Assigned(ModClaim) then
    Raise Exception.Create('Data not Loaded');

  if ModClaim.ID = '' then
  begin
    TAppUtils.Error('Tidak ada data yang dihapus');
    exit;
  end;

  Try
    DMClient.CrudClaimFakturClient.DeleteFromDB(ModClaim);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.ModalResult := mrOk;
  except
    TAppUtils.Error(ER_DELETE_FAILED);
    raise;
  End;
end;

procedure TfrmDialogClaim.DetailDO;
var
  lDOID: string;
  lDS: TDataset;
begin
  if CDSDO.Eof then exit;
  lDOID := CDSDO.FieldByName('CLMD_DO').AsString;
  lDS := DMCLient.DSProviderClient.DODetail_WithAdj(lDOID);
  try
    TfrmCXMsgInfo.ShowSimpleMsg('Detail DO_NP : ' + CDSDO.FieldByName('DO_NP').AsString,
      lDS, ['DO_ID']);
  finally
    lDS.Free;
  end;
end;

procedure TfrmDialogClaim.DetailCN;
var
  lCNID: string;
  lDS: TDataset;
begin
  if CDSCN.Eof then exit;
  lCNID := CDSCN.FieldByName('CLMD_CN_CNRecv').AsString;
  lDS := DMCLient.DSProviderClient.CNDetail_GetDS(lCNID);
  try
    TfrmCXMsgInfo.ShowSimpleMsg('Detail CN atas DO_NP ' + CDSCN.FieldByName('DO_NP').AsString,
      lDS, ['CN_Recv_ID']);
  finally
    lDS.Free;
  end;
end;

procedure TfrmDialogClaim.DetailDN;
var
  lDNID: string;
  lDS: TDataset;
begin
  if CDSDN.Eof then exit;
  lDNID := CDSDN.FieldByName('CLMD_DN_DNRecv').AsString;
  lDS := DMCLient.DSProviderClient.DNDetail_GetDS(lDNID);
  try
    TfrmCXMsgInfo.ShowSimpleMsg('Detail DN atas DO_NP ' + CDSDN.FieldByName('DO_NP').AsString,
      lDS, ['DN_Recv_ID']);
  finally
    lDS.Free;
  end;
end;

procedure TfrmDialogClaim.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key in [VK_F1, VK_F2, VK_F3, VK_F4] then
    cxgrdClaim.SetFocus;

  case Key of
    VK_F1 : cxgrdClaim.FocusedView := cxGridDBTableGR;
    VK_F2 : cxgrdClaim.FocusedView := cxGridDBTableCN;
    VK_F3 : cxgrdClaim.FocusedView := cxGridDBTableDN;
    VK_F4 : cxgrdClaim.FocusedView := cxGridDBTableOther;
  end;
  if ssAlt in Shift then
  begin
    case Key of
      Ord('G') : LookupDO;
      Ord('C') : LookupCN;
      Ord('D') : LookupDN;
    end;
  end;
end;

function TfrmDialogClaim.GetCDSDO: TClientDataSet;
begin
  If not Assigned(FCDSDO) then
  begin
    FCDSDO := TDBUtils.CreateObjectDataSet(TModClaimFakturItemDO, Self, False);
    FCDSDO.AddField('DO_NO', ftString);
    FCDSDO.AddField('DO_NP', ftString);
    FCDSDO.AddField('PO_NO', ftString);
    FCDSDO.AddField('DO_DATE', ftDate);
    FCDSDO.AfterDelete := OnAfterDelete;
    FCDSDO.CreateDataSet;
  end;
  Result := FCDSDO;
end;

function TfrmDialogClaim.GetCDSCN: TClientDataSet;
begin
  If not Assigned(FCDSCN) then
  begin
    FCDSCN := TDBUtils.CreateObjectDataSet(TModClaimFakturItemCN, Self, False);
    FCDSCN.AddField('DO_NO', ftString);
    FCDSCN.AddField('DO_NP', ftString);
    FCDSCN.AddField('PO_NO', ftString);
    FCDSCN.AddField('CN_DATE', ftDate);
    FCDSCN.AfterDelete := OnAfterDelete;
    FCDSCN.CreateDataSet;
  end;
  Result := FCDSCN;
end;

function TfrmDialogClaim.GetCDSOther: TClientDataSet;
begin
  If not Assigned(FCDSOther) then
  begin
    FCDSOther := TDBUtils.CreateObjectDataSet(TModClaimFakturItemOther, Self, False);
    FCDSOther.AddField('REK_NAME', ftString);
    FCDSOther.AfterDelete := OnAfterDelete;
    FCDSOther.CreateDataSet;
  end;
  Result := FCDSOther;
end;

function TfrmDialogClaim.GetCDSDN: TClientDataSet;
begin
  If not Assigned(FCDSDN) then
  begin
    FCDSDN := TDBUtils.CreateObjectDataSet(TModClaimFakturItemDN, Self, False);
    FCDSDN.AddField('DO_NO', ftString);
    FCDSDN.AddField('DO_NP', ftString);
    FCDSDN.AddField('PO_NO', ftString);
    FCDSDN.AddField('DN_DATE', ftDate);
    FCDSDN.AfterDelete := OnAfterDelete;
    FCDSDN.CreateDataSet;
  end;
  Result := FCDSDN;
end;

function TfrmDialogClaim.GetModClaim: TModClaimFaktur;
begin
  if not Assigned(FModClaim) then
    FModClaim := TModClaimFaktur.Create;
  Result := FModClaim;
end;

procedure TfrmDialogClaim.initView;
var
  lCDSAccount: TClientDataSet;
begin

  With DMClient.DSProviderClient do
  begin
    cbbSupplierMG.LoadFromDS(SuplierMerchan_GetDSLookup,
      'SUPLIER_MERCHAN_GRUP_ID' , 'SUP_CODE', Self);
    cbbSupplierMG.SetVisibleColumnsOnly(['SUP_CODE', 'SUP_NAME', 'MERCHANGRUP_NAME']);
    cbbSupplierMG.SetMultiPurposeLookup;

    TcxExtLookup(cxGridColOtherAccountCode.Properties).LoadFromDS(
      Rekening_GetDSLookup, 'REKENING_ID','REK_CODE', Self
    );
    TcxExtLookup(cxGridColOtherAccountCode.Properties).SetVisibleColumnsOnly(
      ['REK_CODE', 'REK_NAME']
    );

    lCDSAccount := TDBUtils.DSToCDS(Rekening_GetDSLookup, Self);
    cbbAccount.LoadFromCDS(lCDSAccount, 'REKENING_ID','REK_CODE', Self);
    cbbAccount.SetVisibleColumnsOnly(['REK_CODE', 'REK_NAME']);

    TcxExtLookup(cxGridColOtherCostCenter.Properties).LoadFromDS(
      CostCenter_GetDSLookup, 'COST_CENTER_ID','COCTER_NAME',['COST_CENTER_ID'],Self
    );

    TcxExtLookup(cxGridColOtherAccountCode.Properties).LoadFromCDS(
      lCDSAccount, 'REKENING_ID','REK_CODE' ,Self
    );
    TcxExtLookup(cxGridColOtherAccountCode.Properties).SetVisibleColumnsOnly(
      ['REK_CODE', 'REK_NAME']
    );
    TcxExtLookup(cxGridColOtherAccountName.Properties).LoadFromCDS(
      lCDSAccount, 'REKENING_ID','REK_NAME' ,Self
    );
    TcxExtLookup(cxGridColOtherAccountName.Properties).SetVisibleColumnsOnly(
      ['REK_CODE', 'REK_NAME']
    );

  end;
  cxGridDBTableGR.PrepareFromCDS(CDSDO);
  cxGridDBTableCN.PrepareFromCDS(CDSCN);
  cxGridDBTableDN.PrepareFromCDS(CDSDN);
  cxGridDBTableOther.PrepareFromCDS(CDSOther);
  LoadData('');
end;

procedure TfrmDialogClaim.LoadCNDNItems;
var
  lCNItem: TModClaimFakturItemCN;
  lDNItem: TModClaimFakturItemDN;
begin
  for lCNItem in ModClaim.CNItems do
  begin
    CDSCN.Append;
    lCNItem.UpdateToDataset(CDSCN);
    lCNItem.CLMD_CN_CNRecv.Reload();
    lCNItem.CLMD_CN_DO.Reload;
    lCNItem.CLMD_CN_DO.PO.Reload();
    CDSCN.FieldByName('DO_NO').AsString     := lCNItem.CLMD_CN_DO.DO_NO;
    CDSCN.FieldByName('DO_NP').AsString     := lCNItem.CLMD_CN_DO.DO_NP;
    CDSCN.FieldByName('PO_NO').AsString     := lCNItem.CLMD_CN_DO.PO.PO_NO;
    CDSCN.FieldByName('CN_DATE').AsDateTime := lCNItem.CLMD_CN_CNRecv.CNR_DATE;
    CDSCN.Post;
  end;

  for lDNItem in ModClaim.DNItems do
  begin
    CDSDN.Append;
    lDNItem.UpdateToDataset(CDSDN);
    lDNItem.CLMD_DN_DNRecv.Reload();
    lDNItem.CLMD_DN_DO.Reload;
    lDNItem.CLMD_DN_DO.PO.Reload();
    CDSDN.FieldByName('DO_NO').AsString     := lDNItem.CLMD_DN_DO.DO_NO;
    CDSDN.FieldByName('DO_NP').AsString     := lDNItem.CLMD_DN_DO.DO_NP;
    CDSDN.FieldByName('PO_NO').AsString     := lDNItem.CLMD_DN_DO.PO.PO_NO;
    CDSDN.FieldByName('DN_DATE').AsDateTime := lDNItem.CLMD_DN_DNRecv.DNR_DATE;
    CDSDN.Post;
  end;
end;

procedure TfrmDialogClaim.LoadData(aID: String);
begin
  CDSDO.EmptyDataSet;
  CDSCN.EmptyDataSet;
  CDSDN.EmptyDataSet;
  CDSOther.EmptyDataSet;

  dtTglClaim.Date       := Now();
  dtReturnDate.Date     := Now();
  dtDueDate.Date        := Now();
  cbbAccount.EditValue  := '';
  memDescription.Text   := '';
  edNamaSupplierMG.Text := '';
  edAKunHutang.Text     := '';

  if aID <> '' then
  begin
    FreeAndNil(FModClaim);
    FModClaim               := DMClient.CrudClient.Retrieve(TModClaimFaktur.ClassName, aID) as TModClaimFaktur;
    edTTFNo.Text            := ModClaim.CLM_TTF_NO;
    edNoClaim.Text          := ModClaim.CLM_NO;
    dtTglClaim.Date         := ModClaim.CLM_DATE;
    dtReturnDate.Date       := ModClaim.CLM_RETURN_DATE;
    dtDueDate.Date          := ModClaim.CLM_DUE_DATE;
    cbbAccount.EditValue    := ModClaim.CLM_REKENING_HUTANG.ID;
    cbbSupplierMG.EditValue := ModClaim.CLM_SupplierMG.ID;
    memDescription.Text     := ModClaim.CLM_Description;

    LoadDoItems;
    LoadCNDNItems;
    LoadOtherItems;
  end else begin
    edNoClaim.Text := DMClient.CrudClient.GenerateNo(TModClaimFaktur.ClassName);
    edTTFNo.Text   := edNoClaim.Text
  end;
  CalculateTotal;
end;

procedure TfrmDialogClaim.LoadDoItems;
var
  lDOitem: TModClaimFakturItemDO;
begin
  for lDOitem in ModClaim.DOItems do
  begin
    CDSDO.Append;
    lDOitem.UpdateToDataset(CDSDO);
    lDOitem.CLMD_DO.Reload();
    lDOitem.CLMD_DO.PO.Reload();
    CDSDO.FieldByName('DO_NO').AsString     := lDOItem.CLMD_DO.DO_NO;
    CDSDO.FieldByName('DO_NP').AsString     := lDOItem.CLMD_DO.DO_NP;
    CDSDO.FieldByName('PO_NO').AsString     := lDOItem.CLMD_DO.PO.PO_NO;
    CDSDO.FieldByName('DO_DATE').AsDateTime := lDOItem.CLMD_DO.DO_DATE;
    CDSDO.Post;
  end;
end;

procedure TfrmDialogClaim.LoadOtherItems;
var
  lOtherItem: TModClaimFakturItemOther;
begin
  for lOtherItem in ModClaim.OtherItems do
  begin
    CDSOther.Append;
    lOtherItem.UpdateToDataset(CDSOther);
    CDSOther.FieldByName('REK_NAME').AsString  := lOtherItem.CLMD_Other_Rekening.ID;
    CDSOther.Post;
  end;
end;

procedure TfrmDialogClaim.LookupDO;
var
  frm: TfrmCXLookup;
  lDS: TClientDataSet;
begin
  if (ckSupplier.Checked) and (VarToStr(cbbSupplierMG.EditValue)='') then
  begin
    TAppUtils.Warning('Supplier harap dipilih terlebih dahulu');
    exit;
  end;

  lDS := TClientDataSet(
    DMClient.DSProviderClient.Claim_Lookup_DO(cbbSupplierMG.EditValueRest));
  frm := TfrmCXLookup.Execute(lDS, True);
  Try
    frm.HideFields(['SUPLIER_MERCHAN_GRUP_ID','DO_ID','PO_ID']);
    if frm.ShowModal = mrOk then
    begin
      if not frm.Data.Eof then
      begin
        cbbSupplierMG.EditValue := frm.Data.FieldByName('SUPLIER_MERCHAN_GRUP_ID').AsString;
        ckSupplier.Checked := True;
      end;

      while not frm.Data.eof do
      begin
        if cbbSupplierMG.EditValue <> frm.Data.FieldByName('SUPLIER_MERCHAN_GRUP_ID').AsString then
        begin
          TAppUtils.Warning('DO yang dipilih tidak sama supplier nya');
          break;
        end;

        if not CDSDO.Locate('CLMD_DO', frm.Data.FieldByName('DO_ID').AsString, [loCaseInsensitive]) then
        begin
          AddDOByID(frm.Data.FieldByName('DO_ID').AsString);
        end;
        frm.Data.Next;
      end;
    end;
    CalculateTotal;
    CalculateDueDate;
  Finally
    frm.Free;
    lDS.Free;
  End;
end;

procedure TfrmDialogClaim.LookupDN;
var
  frm: TfrmCXLookup;
  lDS: TClientDataSet;
begin
  if (ckSupplier.Checked) and (VarToStr(cbbSupplierMG.EditValue)='') then
  begin
    TAppUtils.Warning('Supplier harap dipilih terlebih dahulu');
    exit;
  end;

  lDS := TClientDataSet(
    DMClient.DSProviderClient.Claim_Lookup_DN(cbbSupplierMG.EditValueRest));
  frm := TfrmCXLookup.Execute(lDS, True);
  Try
    frm.HideFields(['SUPLIER_MERCHAN_GRUP_ID','DN_RECV_ID']);
    if frm.ShowModal = mrOk then
    begin
      if not frm.Data.Eof then
      begin
        cbbSupplierMG.EditValue := frm.Data.FieldByName('SUPLIER_MERCHAN_GRUP_ID').AsString;
        ckSupplier.Checked := True;
      end;

      while not frm.Data.eof do
      begin
        if cbbSupplierMG.EditValue <> frm.Data.FieldByName('SUPLIER_MERCHAN_GRUP_ID').AsString then
        begin
          TAppUtils.Warning('CN yang dipilih tidak sama supplier nya');
          break;
        end;

        if not CDSDN.Locate('CLMD_DN_DNRecv', frm.Data.FieldByName('DN_RECV_ID').AsString, [loCaseInsensitive]) then
        begin
          AddDNByID(frm.Data.FieldByName('DN_RECV_ID').AsString);
        end;
        frm.Data.Next;
      end;
    end;
    CalculateTotal;
  Finally
    frm.Free;
    lDS.Free;
  End;
end;

procedure TfrmDialogClaim.LookupCN;
var
  frm: TfrmCXLookup;
  lDS: TClientDataSet;
begin
  if (ckSupplier.Checked) and (VarToStr(cbbSupplierMG.EditValue)='') then
  begin
    TAppUtils.Warning('Supplier harap dipilih terlebih dahulu');
    exit;
  end;

  lDS := TClientDataSet(
    DMClient.DSProviderClient.Claim_Lookup_CN(cbbSupplierMG.EditValueRest));
  frm := TfrmCXLookup.Execute(lDS, True);
  Try
    frm.HideFields(['SUPLIER_MERCHAN_GRUP_ID','CN_RECV_ID']);
    if frm.ShowModal = mrOk then
    begin
      if not frm.Data.Eof then
      begin
        cbbSupplierMG.EditValue := frm.Data.FieldByName('SUPLIER_MERCHAN_GRUP_ID').AsString;
        ckSupplier.Checked := True;
      end;

      while not frm.Data.eof do
      begin
        if cbbSupplierMG.EditValue <> frm.Data.FieldByName('SUPLIER_MERCHAN_GRUP_ID').AsString then
        begin
          TAppUtils.Warning('CN yang dipilih tidak sama supplier nya');
          break;
        end;

        if not CDSCN.Locate('CLMD_CN_CNRecv', frm.Data.FieldByName('CN_RECV_ID').AsString, [loCaseInsensitive]) then
        begin
          AddCNByID(frm.Data.FieldByName('CN_RECV_ID').AsString);
        end;
        frm.Data.Next;
      end;
    end;
    CalculateTotal;
  Finally
    frm.Free;
    lDS.Free;
  End;
end;

procedure TfrmDialogClaim.OnAfterDelete(Sender: TDataSet);
begin
  CalculateTotal;
end;

procedure TfrmDialogClaim.UpdateData;
var
  lItemCn: TModClaimFakturItemCN;
  lItemDN: TModClaimFakturItemDN;
  lItemDO: TModClaimFakturItemDO;
  lItemOther: TModClaimFakturItemOther;
begin
  ModClaim.CLM_NO := edNoClaim.Text;
  ModClaim.CLM_TTF_NO := edTTFNo.Text;
  ModClaim.CLM_DATE := dtTglClaim.Date;
  ModClaim.CLM_DUE_DATE := dtDueDate.Date;
  ModClaim.CLM_RETURN_DATE := dtReturnDate.Date;

  if Assigned(ModClaim.CLM_REKENING_HUTANG) then
    ModClaim.CLM_REKENING_HUTANG.Free;
  ModClaim.CLM_REKENING_HUTANG := TModRekening.CreateID(cbbAccount.EditValue);

  if Assigned(ModClaim.CLM_SupplierMG) then
    ModClaim.CLM_SupplierMG.Free;
  ModClaim.CLM_SupplierMG := TModSuplierMerchanGroup.CreateID(cbbSupplierMG.EditValue);

  ModClaim.CLM_Description := memDescription.Text;

  ModClaim.DOItems.Clear;
  ModClaim.CNItems.Clear;
  ModClaim.DNItems.Clear;
  ModClaim.OtherItems.Clear;

  CDSDO.DisableControls;
  CDSCN.DisableControls;
  CDSDN.DisableControls;
  CDSOther.DisableControls;
  try
    CDSDO.First;
    while not CDSDO.Eof do
    begin
      lItemDO := TModClaimFakturItemDO.Create;
      lItemDO.SetFromDataset(CDSDO);
      ModClaim.DOItems.Add(lItemDO);
      CDSDO.Next;
    end;
    CDSCN.First;
    while not CDSCN.Eof do
    begin
      lItemCN := TModClaimFakturItemCN.Create;
      lItemCN.SetFromDataset(CDSCN);
      ModClaim.CNItems.Add(lItemCN);
      CDSCN.Next;
    end;
    while not CDSDN.Eof do
    begin
      lItemDN := TModClaimFakturItemDN.Create;
      lItemDN.SetFromDataset(CDSDN);
      ModClaim.DNItems.Add(lItemDN);
      CDSDN.Next;
    end;
    while not CDSOther.Eof do
    begin
      lItemOther := TModClaimFakturItemOther.Create;
      lItemOther.SetFromDataset(CDSOther);
      ModClaim.OtherItems.Add(lItemOther);
      CDSOther.Next;
    end;

    ModClaim.Calculate;
  finally
    CDSDO.DisableControls;
    CDSCN.DisableControls;
    CDSDN.DisableControls;
    CDSOther.DisableControls;
  end;

end;

function TfrmDialogClaim.ValidateData: Boolean;
begin
  Result := False;
  if VarToStr(cbbSupplierMG.EditValue) = '' then
  begin
    TAppUtils.Warning('Supplier belum dipilih');
    exit;
  end;
  if VarToStr(cbbAccount.EditValue) = '' then
  begin
    TAppUtils.Warning('Account Hutang belum dipilih');
    exit;
  end;
  if crTotal.Value = 0 then
  begin
    TAppUtils.Warning('Total Klaim = 0');
    exit;
  end;

  if not Result then Result := True;
end;

end.
