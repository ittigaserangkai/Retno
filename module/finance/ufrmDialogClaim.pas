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
  uModRekening, uModSuplier, uConstanta, uInterface, System.StrUtils,
  cxButtonEdit, uModOrganization;

type
  TfrmDialogClaim = class(TfrmMasterDialog, ICrudAble)
    pnlHeader: TPanel;
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
    edOrgName: TcxTextEdit;
    btnDelItem: TcxButton;
    btnAdd: TcxButton;
    btnDetail: TcxButton;
    ckOrganization: TCheckBox;
    btnAddGR: TcxButton;
    btnAddCN: TcxButton;
    ckAutoDueDate: TCheckBox;
    cxgrdlvlCS: TcxGridLevel;
    cxGridDBTableCS: TcxGridDBTableView;
    cxGridColCSNo: TcxGridDBColumn;
    cxGridColCSDate: TcxGridDBColumn;
    edOrgCode: TcxButtonEdit;
    btnAddCS: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actViewAdjExecute(Sender: TObject);
    procedure actViewPOExecute(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDelItemClick(Sender: TObject);
    procedure ckOrganizationClick(Sender: TObject);
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
    procedure cbbOrganizationPropertiesEditValueChanged(Sender: TObject);
    procedure edOrgCodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnAddCSClick(Sender: TObject);
    procedure edOrgCodePropertiesEditValueChanged(Sender: TObject);
  private
    FCDSDO: TClientDataSet;
    FCDSCN: TClientDataSet;
    FCDSCS: TClientDataSet;
    FCDSOther: TClientDataSet;
    FCDSDN: TClientDataSet;
    FCDSOrg: TClientDataSet;
    FModClaim: TModClaimFaktur;
    FModOrganization: TModOrganization;
    procedure AddDOByID(aID: string);
    procedure AddCNByID(aID: string);
    procedure AddCSByID(aID: string);
    procedure AddDNByID(aID: string);
    procedure CalculateTotal;
    procedure DeleteData;
    procedure DetailDO;
    procedure DetailCN;
    procedure DetailDN;
    procedure FilterAPAccount;
    function GetCDSDO: TClientDataSet;
    function GetCDSCN: TClientDataSet;
    function GetCDSCS: TClientDataSet;
    function GetCDSOther: TClientDataSet;
    function GetCDSDN: TClientDataSet;
    function GetCDSOrg: TClientDataSet;
    function GetModClaim: TModClaimFaktur;
    procedure initView;
    procedure LoadCNDNItems;
    procedure LoadDoItems;
    procedure LoadOtherItems;
    procedure LookupDO;
    procedure LookupCN;
    procedure LookupDN;
    procedure LookupCS;
    procedure OnAfterDelete(Sender: TDataSet);
    procedure SetModOrganization(const Value: TModOrganization);
    procedure UpdateData;
    function ValidateData: Boolean;
    property CDSDO: TClientDataSet read GetCDSDO write FCDSDO;
    property CDSCN: TClientDataSet read GetCDSCN write FCDSCN;
    property CDSCS: TClientDataSet read GetCDSCS write FCDSCS;
    property CDSOther: TClientDataSet read GetCDSOther write FCDSOther;
    property CDSDN: TClientDataSet read GetCDSDN write FCDSDN;
    property CDSOrg: TClientDataSet read GetCDSOrg write FCDSOrg;
    property ModClaim: TModClaimFaktur read GetModClaim write FModClaim;
    property ModOrganization: TModOrganization read FModOrganization write
        SetModOrganization;
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
  uModDNRecv, uModAdjustmentFaktur, uModelHelper, ufrmCXMsgInfo, uRetnoUnit,
  ufrmLookupOrganization, uModContrabonSales;

{$R *.dfm}

procedure TfrmDialogClaim.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
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

procedure TfrmDialogClaim.AddCSByID(aID: string);
var
  lCS: TModClaimFakturItemCS;
begin
  lCS := TModClaimFakturItemCS.Create;
  Try
    lCS.CLMD_CS_Contrabon := TModContrabonSales.CreateID(aID);
    lCS.CLMD_CS_Contrabon.Reload;
    lCS.CLMD_CS_NETSALES  := lCS.CLMD_CS_Contrabon.CONT_NET_SALES;
    lCS.CLMD_CS_DATE      := lCS.CLMD_CS_Contrabon.CONT_DATE_SALES;
    CDSCS.Append;
    lCS.UpdateToDataset(CDSCS);
    CDSCS.Post;
  Finally
    lCS.Free;
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
  if cxgrdClaim.FocusedView = cxGridDBTableCS then LookupCS;
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

procedure TfrmDialogClaim.btnAddCSClick(Sender: TObject);
begin
  inherited;
  LookupCS;
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
  if (cxgrdClaim.FocusedView = cxGridDBTableCS) and (not CDSCS.eof) then
    CDSCS.Delete;
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
  lSupp: TModSuplierMerchanGroup;
begin
  if not Assigned(ModClaim.CLM_Organization) then exit;
  if CDSDO.Eof then exit;
  if ModClaim.CLM_Organization.ORG_Code = '' then
    ModClaim.CLM_Organization.Reload();

  if (ModClaim.CLM_Organization.ORG_IsSupplierMG<>1) then exit;


  lCDS := CDSDO.ClonedDataset(Self);
  lDate := 0;
  lSupp := TModSuplierMerchanGroup.CreateID(ModClaim.CLM_Organization.ID);
  Try
    lSupp.Reload();
    lCDS.First;
    while not lCDS.eof do
    begin
      if lDate < lCDS.FieldByName('DO_DATE').AsDateTime then
        lDate := lCDS.FieldByName('DO_DATE').AsDateTime;
      lCDS.Next;
    end;
    dtDueDate.Date := lDate + lSupp.SUPMG_TOP;
  Finally
    lSupp.Free;
    lCDS.Free;
  End;
end;

procedure TfrmDialogClaim.CalculateTotal;
var
  lCDSCN: TClientDataSet;
  lCDSDN: TClientDataSet;
  lCDSDO: TClientDataSet;
  lCDSOther: TClientDataSet;
  lCDSCS: TClientDataSet;

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
  lCDSCS      := CDSCS.ClonedDataset(Self, True);
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

    lCDSCS.First;
    while not lCDSCS.Eof do
    begin
      lTotalOther := lTotalOther + lCDSCS.FieldByName('CLMD_CS_NETSALES').AsFloat;
      lCDSCS.Next;
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
    CDSCS.EnableControls;
  end;
end;

procedure TfrmDialogClaim.cbbAccountPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  edAKunHutang.Text := cbbAccount.DS.FieldByName('REK_NAME').AsString;
end;

procedure TfrmDialogClaim.cbbOrganizationPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CDSDO.EmptyDataSet;
  CDSCN.EmptyDataSet;

  if not CDSOrg.Eof then
    edOrgName.Text := CDSOrg.FieldByName('ORG_Name').AsString;
end;

procedure TfrmDialogClaim.ckAutoDueDateClick(Sender: TObject);
begin
  inherited;
  dtDueDate.Enabled := not ckAutoDueDate.Checked;
end;

procedure TfrmDialogClaim.ckOrganizationClick(Sender: TObject);
begin
  inherited;
  if not ckOrganization.Checked then
  begin
    ModOrganization := nil;
  end;
end;

procedure TfrmDialogClaim.cxgrdClaimFocusedViewChanged(Sender: TcxCustomGrid;
    APrevFocusedView, AFocusedView: TcxCustomGridView);
begin
  inherited;
  btnAddGR.Visible  := AFocusedView <> cxGridDBTableGR;
  btnAddCN.Visible  := AFocusedView <> cxGridDBTableCN;
  btnAddDN.Visible  := AFocusedView <> cxGridDBTableDN;
  btnDetail.Visible := AFocusedView <> cxGridDBTableOther;
  btnAddCS.Visible  := AFocusedView <> cxGridDBTableCS;
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

procedure TfrmDialogClaim.edOrgCodePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  lOrg: TModOrganization;
begin
  inherited;
  lOrg := TfrmLookupOrganization.Lookup;
  if lOrg <> nil then
    ModOrganization := lOrg;
end;

procedure TfrmDialogClaim.edOrgCodePropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if edOrgCode.Text <> '' then
  begin
    ModOrganization := DMClient.CrudClient.RetrieveByCode(
      TModOrganization.ClassName, edOrgCode.Text) as TModOrganization;
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

procedure TfrmDialogClaim.FilterAPAccount;
var
  lCDS: TClientDataSet;
  sFilter: string;
begin
  lCDS := cbbAccount.CDS;
  if lCDS <> nil then
  begin
    lCDS.Filtered := True;
    sFilter := TRetno.SettingApp.REKENING_HUTANG;
    sFilter := StringReplace(sFilter, ';', ',', [rfReplaceAll]);
    sFilter := StringReplace(sFilter, ',', QuotedStr(',') , [rfReplaceAll]);
    lCDS.Filter := 'REK_CODE in (''' + sFilter + ''')';
  end;
end;

procedure TfrmDialogClaim.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key in [VK_F1, VK_F2, VK_F3, VK_F4, VK_F5] then
    cxgrdClaim.SetFocus;

  case Key of
    VK_F1 : cxgrdClaim.FocusedView := cxGridDBTableGR;
    VK_F2 : cxgrdClaim.FocusedView := cxGridDBTableCN;
    VK_F3 : cxgrdClaim.FocusedView := cxGridDBTableDN;
    VK_F4 : cxgrdClaim.FocusedView := cxGridDBTableOther;
    VK_F5 : cxgrdClaim.FocusedView := cxGridDBTableCS;
  end;
  if ssAlt in Shift then
  begin
    case Key of
      Ord('G') : LookupDO;
      Ord('C') : LookupCN;
      Ord('D') : LookupDN;
      Ord('K') : LookupCS;
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

function TfrmDialogClaim.GetCDSCS: TClientDataSet;
begin
  If not Assigned(FCDSCS) then
  begin
    FCDSCS := TDBUtils.CreateObjectDataSet(TModClaimFakturItemCS, Self, False);
    FCDSCS.AfterDelete := OnAfterDelete;
    FCDSCS.CreateDataSet;
  end;
  Result := FCDSCS;
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

function TfrmDialogClaim.GetCDSOrg: TClientDataSet;
begin
  if not Assigned(FCDSOrg) then
    FCDSOrg := TDBUtils.DSToCDS(DMClient.DSProviderClient.Organization_GetDSLookup(), Self);

  Result := FCDSOrg;
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
    TcxExtLookup(cxGridColOtherAccountCode.Properties).LoadFromDS(
      Rekening_GetDSLookup, 'REKENING_ID','REK_CODE', Self
    );
    TcxExtLookup(cxGridColOtherAccountCode.Properties).SetVisibleColumnsOnly(
      ['REK_CODE', 'REK_NAME']
    );

    lCDSAccount := TDBUtils.DSToCDS(Rekening_GetDSLookup, Self);
    cbbAccount.LoadFromCDS(lCDSAccount, 'REKENING_ID','REK_CODE', Self);
    cbbAccount.SetVisibleColumnsOnly(['REK_CODE', 'REK_NAME']);
    FilterAPAccount;

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
  cxGridDBTableCS.PrepareFromCDS(CDSCS);

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
var
  lEvent: TNotifyEvent;
begin
  lEvent := edOrgCode.Properties.OnEditValueChanged;
  Try
    edOrgCode.Properties.OnEditValueChanged := nil;

    CDSDO.EmptyDataSet;
    CDSCN.EmptyDataSet;
    CDSDN.EmptyDataSet;
    CDSOther.EmptyDataSet;

    dtTglClaim.Date       := Now();
    dtReturnDate.Date     := Now();
    dtDueDate.Date        := Now();
    cbbAccount.EditValue  := '';
    memDescription.Text   := '';
    edOrgName.Text        := '';
    edAKunHutang.Text     := '';
    ModOrganization       := nil;
    if aID <> '' then
    begin
      FModClaim                 := DMClient.CrudClient.Retrieve(TModClaimFaktur.ClassName, aID) as TModClaimFaktur;
      edTTFNo.Text              := ModClaim.CLM_TTF_NO;
      edNoClaim.Text            := ModClaim.CLM_NO;
      dtTglClaim.Date           := ModClaim.CLM_DATE;
      dtReturnDate.Date         := ModClaim.CLM_RETURN_DATE;
      dtDueDate.Date            := ModClaim.CLM_DUE_DATE;
      cbbAccount.EditValue      := ModClaim.CLM_REKENING_HUTANG.ID;
      memDescription.Text       := ModClaim.CLM_Description;

      ModClaim.CLM_Organization.Reload();
      ModOrganization           := ModClaim.CLM_Organization;

      LoadDoItems;
      LoadCNDNItems;
      LoadOtherItems;
    end else begin
      edNoClaim.Text := DMClient.CrudClient.GenerateNo(TModClaimFaktur.ClassName);
      edTTFNo.Text   := edNoClaim.Text;
    end;
    CalculateTotal;
  Finally
    edOrgCode.Properties.OnEditValueChanged := lEvent;
  End;
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
  lContrabon: TModClaimFakturItemCS;
  lOtherItem: TModClaimFakturItemOther;
begin
  for lOtherItem in ModClaim.OtherItems do
  begin
    CDSOther.Append;
    lOtherItem.UpdateToDataset(CDSOther);
    CDSOther.FieldByName('REK_NAME').AsString  := lOtherItem.CLMD_Other_Rekening.ID;
    CDSOther.Post;
  end;

  for lContrabon in ModClaim.CSItems do
  begin
    CDSCS.Append;
    lContrabon.UpdateToDataset(CDSCS);
    CDSCS.Post;
  end;
end;

procedure TfrmDialogClaim.LookupDO;
var
  frm: TfrmCXLookup;
  lDS: TClientDataSet;
begin
  if (ckOrganization.Checked) and (ModOrganization=nil) then
  begin
    TAppUtils.Warning('Organization harap dipilih terlebih dahulu');
    exit;
  end;

  lDS := TClientDataSet(
    DMClient.DSProviderClient.Claim_Lookup_DO(GetModAppRestID(ModOrganization)));
  frm := TfrmCXLookup.Execute(lDS, True);
  Try
    frm.HideFields(['SUPLIER_MERCHAN_GRUP_ID','DO_ID','PO_ID']);
    if frm.ShowModal = mrOk then
    begin
      if (not frm.Data.Eof) and (ModOrganization=nil) then
      begin
        ModOrganization := DMClient.CrudClient.Retrieve(
          TModOrganization.ClassName,
          frm.Data.FieldByName('SUPLIER_MERCHAN_GRUP_ID').AsString
        ) as TModOrganization;

        ckOrganization.Checked := True;
      end;

      while not frm.Data.eof do
      begin
        if ModOrganization.ID <> frm.Data.FieldByName('SUPLIER_MERCHAN_GRUP_ID').AsString then
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
  if (ckOrganization.Checked) and (ModOrganization=nil) then
  begin
    TAppUtils.Warning('Organization harap dipilih terlebih dahulu');
    exit;
  end;

  lDS := TClientDataSet(
    DMClient.DSProviderClient.Claim_Lookup_DN(GetModAppRestID(ModOrganization)));
  frm := TfrmCXLookup.Execute(lDS, True);
  Try
    frm.HideFields(['SUPLIER_MERCHAN_GRUP_ID','DN_RECV_ID']);
    if frm.ShowModal = mrOk then
    begin
      if (not frm.Data.Eof) and (ModOrganization=nil) then
      begin
        ModOrganization := DMClient.CrudClient.Retrieve(
          TModOrganization.ClassName,
          frm.Data.FieldByName('SUPLIER_MERCHAN_GRUP_ID').AsString
        ) as TModOrganization;

        ckOrganization.Checked := True;
      end;

      while not frm.Data.eof do
      begin
        if ModOrganization.ID <> frm.Data.FieldByName('SUPLIER_MERCHAN_GRUP_ID').AsString then
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
  if (ckOrganization.Checked) and (ModOrganization=nil) then
  begin
    TAppUtils.Warning('Organization harap dipilih terlebih dahulu');
    exit;
  end;

  lDS := TClientDataSet(
    DMClient.DSProviderClient.Claim_Lookup_CN(GetModAppRestID(ModOrganization)));
  frm := TfrmCXLookup.Execute(lDS, True);
  Try
    frm.HideFields(['SUPLIER_MERCHAN_GRUP_ID','CN_RECV_ID']);
    if frm.ShowModal = mrOk then
    begin
      if (not frm.Data.Eof) and (ModOrganization=nil) then
      begin
        ModOrganization := DMClient.CrudClient.Retrieve(
          TModOrganization.ClassName,
          frm.Data.FieldByName('SUPLIER_MERCHAN_GRUP_ID').AsString
        ) as TModOrganization;

        ckOrganization.Checked := True;
      end;

      while not frm.Data.eof do
      begin
        if ModOrganization.ID <> frm.Data.FieldByName('SUPLIER_MERCHAN_GRUP_ID').AsString then
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

procedure TfrmDialogClaim.LookupCS;
var
  frm: TfrmCXLookup;
  lDS: TClientDataSet;
begin
  if (ckOrganization.Checked) and (ModOrganization=nil) then
  begin
    TAppUtils.Warning('Organization harap dipilih terlebih dahulu');
    exit;
  end;

  lDS := TClientDataSet(
    DMClient.DSProviderClient.Claim_Lookup_CS(GetModAppRestID(ModOrganization)));
  frm := TfrmCXLookup.Execute(lDS, True);
  Try
    frm.HideFields(['CONTRABON_SALES_ID','CONT_ORGANIZATION_ID']);
    if frm.ShowModal = mrOk then
    begin
      if (not frm.Data.Eof) and (ModOrganization=nil) then
      begin
        ModOrganization := DMClient.CrudClient.Retrieve(
          TModOrganization.ClassName,
          frm.Data.FieldByName('CONT_ORGANIZATION_ID').AsString
        ) as TModOrganization;

        ckOrganization.Checked := True;
      end;

      while not frm.Data.eof do
      begin
        if ModOrganization.ID <> frm.Data.FieldByName('CONT_ORGANIZATION_ID').AsString then
        begin
          TAppUtils.Warning('Contrabon yang dipilih tidak sama supplier nya');
          break;
        end;

        if not CDSCS.Locate('CLMD_CS_Contrabon', frm.Data.FieldByName('CONTRABON_SALES_ID').AsString, [loCaseInsensitive]) then
        begin
          AddCSByID(frm.Data.FieldByName('CONTRABON_SALES_ID').AsString);
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

procedure TfrmDialogClaim.SetModOrganization(const Value: TModOrganization);
var
  lEvent: TNotifyEvent;
begin
  lEvent := edOrgCode.Properties.OnEditValueChanged;
  edOrgCode.Properties.OnEditValueChanged := nil;
  try
    if Assigned(FModOrganization) then
      FreeAndNil(FModOrganization);
    FModOrganization := Value;

    edOrgCode.Clear;
    edOrgName.Clear;
    if FModOrganization <> nil then
    begin
      edOrgCode.Text := FModOrganization.ORG_Code;
      edOrgName.Text := FModOrganization.ORG_Name;
    end;
  finally
    edOrgCode.Properties.OnEditValueChanged := lEvent;
  end;
end;

procedure TfrmDialogClaim.UpdateData;
var
  lItemCn: TModClaimFakturItemCN;
  lItemCS: TModClaimFakturItemCS;
  lItemDN: TModClaimFakturItemDN;
  lItemDO: TModClaimFakturItemDO;
  lItemOther: TModClaimFakturItemOther;
begin
  ModClaim.CLM_NO           := edNoClaim.Text;
  ModClaim.CLM_TTF_NO       := edTTFNo.Text;
  ModClaim.CLM_DATE         := dtTglClaim.Date;
  ModClaim.CLM_DUE_DATE     := dtDueDate.Date;
  ModClaim.CLM_RETURN_DATE  := dtReturnDate.Date;

  if Assigned(ModClaim.CLM_REKENING_HUTANG) then
    ModClaim.CLM_REKENING_HUTANG.Free;
  ModClaim.CLM_REKENING_HUTANG := TModRekening.CreateID(cbbAccount.EditValue);

  ModClaim.CLM_Organization := ModOrganization;
  ModClaim.CLM_Description  := memDescription.Text;

  ModClaim.DOItems.Clear;
  ModClaim.CNItems.Clear;
  ModClaim.DNItems.Clear;
  ModClaim.CSItems.Clear;
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
    while not CDSCS.Eof do
    begin
      lItemCS := TModClaimFakturItemCS.Create;
      lItemCS.SetFromDataset(CDSCS);
      ModClaim.CSItems.Add(lItemCS);
      CDSCS.Next;
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
  if (ModOrganization=nil) then
  begin
    TAppUtils.Warning('Organization belum dipilih');
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
