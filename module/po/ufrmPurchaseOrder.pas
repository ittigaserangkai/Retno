unit ufrmPurchaseOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, ComCtrls, StdCtrls, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxContainer, dxCore, cxDateUtils, Vcl.Menus, System.Actions, Vcl.ActnList,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  cxButtonEdit, Data.DB, uDMClient, uAppUtils,uDBUtils,
  uDXUtils, Datasnap.DBClient, ufrmGeneratePOForAll,
  dxmdaset, cxGridDBDataDefinitions, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxGroupBox, cxRadioGroup, uModPO;

type
  TfrmPurchaseOrder = class(TfrmMasterBrowse)
    cxgrdlvlPODetail: TcxGridLevel;
    cxGridDBTableSODetail: TcxGridDBTableView;
    cbbSupMGAkhir: TcxExtLookupComboBox;
    cbbSupMGAwal: TcxExtLookupComboBox;
    lblSupMG: TcxLabel;
    lblStatus: TcxLabel;
    cbbStatusPO: TcxExtLookupComboBox;
    lblTo: TcxLabel;
    pmPO: TPopupMenu;
    mnGeneratedPO: TMenuItem;
    mnCancelPO: TMenuItem;
    mnClosePO: TMenuItem;
    pmPrint: TPopupMenu;
    CetakBatch1: TMenuItem;
    CetakBatch2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CetakBatch1Click(Sender: TObject);
    procedure CetakBatch2Click(Sender: TObject);
    procedure mnCancelPOClick(Sender: TObject);
    procedure mnClosePOClick(Sender: TObject);
    procedure mnGeneratedPOClick(Sender: TObject);
    procedure pmPOPopup(Sender: TObject);
  private
    FCDS: TClientDataSet;
    FCDSDetil: TClientDataSet;
    sSQL  : string;
    procedure InisialisasiDBBStatusPO;
    procedure InisialisasiCBBSupMGAkhir; overload;
    procedure InisialisasiCBBSupMGAwal;
    procedure RefreshDataPO;
    procedure RefreshDataPODetil;
    procedure UpdateStatusPO(AStatus: string);
  protected
    function GetSQLStatusPO: string; dynamic;
    function GetSupCode    : string; virtual;
    procedure RefreshData; override;
  end;

  /// nama from disamakan dengan unitnamenya mis : unit ufrmPurchaseOrder, nama form = frmPurchaseOrder [hilangkan huruf u di depan]
  /// combo supplier1 dan supplier2 diganti aj dengan editbutton

var
  frmPurchaseOrder: TfrmPurchaseOrder;

implementation

uses
  uConn, udmReport, DateUtils, ufrmDialogPrintPreview, uTSCommonDlg,
  ufrmPORevision, uConstanta, uModApp;

{$R *.dfm}

procedure TfrmPurchaseOrder.FormCreate(Sender: TObject);
begin
  inherited;
  InisialisasiDBBStatusPO;
  InisialisasiCBBSupMGAkhir;
  InisialisasiCBBSupMGAwal;
end;

procedure TfrmPurchaseOrder.actAddExecute(Sender: TObject);
begin
  inherited;
  frmGeneratePOForAll := TfrmGeneratePOForAll.Create(Self);
  frmGeneratePOForAll.ShowModal;
end;

procedure TfrmPurchaseOrder.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmPORevision, cxGridView.DS.FieldByName('PO_ID').AsString);
end;

procedure TfrmPurchaseOrder.actPrintExecute(Sender: TObject);
var
  lSize: Integer;
  pnt: TPoint;
begin
  inherited;
  lSize := Screen.MenuFont.Size;
  try
    Screen.MenuFont.Size := 12;
    pnt := Self.fraFooter4Button1.btnPrint.ClientToScreen(Point(0,0));
    pmPrint.Popup(pnt.X + 100,pnt.Y - 50);
  finally
    Screen.MenuFont.Size := lSize;
  end;
//  PrintDialog;
end;

procedure TfrmPurchaseOrder.CetakBatch1Click(Sender: TObject);
var
  FilterPeriode: string;
  sNomorPO: string;
begin
  inherited;
  sNomorPO := FCDS.FieldByName('PO_NO').AsString;
  FilterPeriode := dtAwalFilter.Text + ' s/d ' + dtAkhirFilter.Text;
  dmReport.AddReportVariable('FilterPeriode', FilterPeriode );
  dmReport.AddReportVariable('UserCetak', 'Baskoro');
  dmReport.ExecuteReport( 'Reports/Slip_PO' ,
    dmReport.ReportClient.PO_SLIP_ByDateNoBukti(
      dtAwalFilter.Date,
      dtAkhirFilter.Date,
      sNomorPO,
      sNomorPO
    ),[]
  );
end;

procedure TfrmPurchaseOrder.CetakBatch2Click(Sender: TObject);
var
  FilterPeriode: string;
  sNomorPO: string;
begin
  inherited;
  sNomorPO := '';
  with dmReport do
  begin
    FilterPeriode := dtAwalFilter.Text + ' s/d ' + dtAkhirFilter.Text;

    AddReportVariable('FilterPeriode', FilterPeriode );
    AddReportVariable('UserCetak', 'Baskoro');

    ExecuteReport( 'Reports/Slip_PO' ,
      ReportClient.PO_SLIP_ByDateNoBukti(
        dtAwalFilter.Date,
        dtAkhirFilter.Date,
        sNomorPO,
        sNomorPO
      ),[]
    );
  end;
end;

procedure TfrmPurchaseOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmPurchaseOrder.FormDestroy(Sender: TObject);
begin
  inherited;

  frmPurchaseOrder:= nil;
end;

procedure TfrmPurchaseOrder.FormShow(Sender: TObject);
begin
  dtAwalFilter.Date:= Now;
  dtAkhirFilter.Date:= Now;
  inherited;
end;

function TfrmPurchaseOrder.GetSQLStatusPO: string;
begin

  Result := 'SELECT stapo_id || ''    '' || '
            +' UPPER(stapo_name)'
            +' FROM ref$status_po'

            +' ORDER BY stapo_id';

end;

function TfrmPurchaseOrder.GetSupCode: string;
begin
  sSQL:= 'SELECT sup_code, sup_name '
          + ' FROM suplier ';
  {
  with cLookUp('Daftar Supplier', sSQL,200,1) do
   begin
     try
       if Trim(Strings[0]) = '' then
          Result := ''
       else
          Result := Strings[0];

     finally
       Free;
     end;

   end;
  }
end;

procedure TfrmPurchaseOrder.InisialisasiDBBStatusPO;
var
  lcdsStatusPO: TClientDataSet;
begin
  lcdsStatusPO := TDBUtils.DSToCDS(DMClient.DSProviderClient.StatusPO_GetDSLookup(), Self);
  cbbStatusPO.Properties.LoadFromCDS(lcdsStatusPO,'ref$status_po_id','STAPO_NAME',['ref$status_po_id'],Self);
  cbbStatusPO.Properties.SetMultiPurposeLookup;
end;

procedure TfrmPurchaseOrder.InisialisasiCBBSupMGAkhir;
var
  lcdsStatusSupMG: TClientDataSet;
begin
  lcdsStatusSupMG := TDBUtils.DSToCDS(DMClient.DSProviderClient.SuplierMerchan_GetDSLookup(), Self);
  cbbSupMGAkhir.Properties.LoadFromCDS(lcdsStatusSupMG,'SUPMG_SUB_CODE','SUPMG_SUB_CODE',['SUPLIER_MERCHAN_GRUP_ID','REF$MERCHANDISE_ID', 'REF$MERCHANDISE_GRUP_ID'],Self);
  cbbSupMGAkhir.Properties.SetMultiPurposeLookup;
end;

procedure TfrmPurchaseOrder.InisialisasiCBBSupMGAwal;
var
  lcdsStatusSupMG: TClientDataSet;
begin
  lcdsStatusSupMG := TDBUtils.DSToCDS(DMClient.DSProviderClient.SuplierMerchan_GetDSLookup(), Self);

  cbbSupMGAwal.Properties.LoadFromCDS(lcdsStatusSupMG,'SUPMG_SUB_CODE','SUPMG_SUB_CODE',['SUPLIER_MERCHAN_GRUP_ID','REF$MERCHANDISE_ID', 'REF$MERCHANDISE_GRUP_ID'],Self);
  cbbSupMGAwal.Properties.SetMultiPurposeLookup;
end;

procedure TfrmPurchaseOrder.mnCancelPOClick(Sender: TObject);
begin
  inherited;
  UpdateStatusPO('CANCELED');
end;

procedure TfrmPurchaseOrder.mnClosePOClick(Sender: TObject);
begin
  inherited;
  UpdateStatusPO('CLOSED');
end;

procedure TfrmPurchaseOrder.mnGeneratedPOClick(Sender: TObject);
begin
  inherited;
  UpdateStatusPO('GENERATED');
end;

procedure TfrmPurchaseOrder.pmPOPopup(Sender: TObject);
var
  i: Integer;
begin
  inherited;

  for i := 0 to pmPO.Items.Count - 1 do
  begin
    pmPO.Items[i].Enabled := False;
  end;

  if cbbStatusPO.DS.Locate('ref$status_po_id',cxGridView.DS.FieldByName('REF$STATUS_PO_ID').AsString,[loCaseInsensitive]) then
  begin
    if cbbStatusPO.DS.FieldByName('STAPO_NAME').AsString = 'CANCELED' then
      mnGeneratedPO.Enabled := True
    else if cbbStatusPO.DS.FieldByName('STAPO_NAME').AsString = 'GENERATED' then
      mnCancelPO.Enabled := True
    else if cbbStatusPO.DS.FieldByName('STAPO_NAME').AsString = 'RECEIVED' then
      mnClosePO.Enabled := True;
  end;
end;

procedure TfrmPurchaseOrder.RefreshData;
begin
  inherited;
  try
    TAppUtils.cShowWaitWindow('Mohon Ditunggu');
    RefreshDataPO;
    RefreshDataPODetil;
    cxGridDBTableSODetail.SetMasterKeyField('PO_ID');
    cxGridDBTableSODetail.SetDetailKeyField('PO_ID');
  finally
    TAppUtils.cCloseWaitWindow;
  end;
end;

procedure TfrmPurchaseOrder.RefreshDataPO;
var
  sStatusPOId, SupMGAwal, SupMGAkhir: string;
begin
  if Assigned(FCDS) then FreeAndNil(FCDS);

  if cbbStatusPO.ItemIndex < 0 then sStatusPOId := 'xyz'
  else sStatusPOId := cbbStatusPO.EditValue;

  if cbbSupMGAwal.ItemIndex < 0 then SupMGAwal := 'xyz'
  else SupMGAwal := cbbSupMGAwal.EditValueText;

  if cbbSupMGAkhir.ItemIndex < 0 then SupMGAkhir := 'xyz'
  else SupMGAkhir := cbbSupMGAkhir.EditValueText;


  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.PO_GetDSOverview(dtAwalFilter.Date,dtAkhirFilter.Date,SupMGAwal,SupMGAkhir, sStatusPOId, nil),Self );
  cxGridView.LoadFromCDS(FCDS);
  cxGridView.SetVisibleColumns(['AUT$UNIT_ID', 'PO_ID', 'REF$STATUS_PO_ID'],False);
end;

procedure TfrmPurchaseOrder.RefreshDataPODetil;
var
  lvl: TcxGridLevel;
begin
  if Assigned(FCDSDetil) then FreeAndNil(FCDSDetil);

  FCDSDetil := TDBUtils.DSToCDS(DMClient.DSProviderClient.PO_GetDSOverviewDetil(dtAwalFilter.Date,dtAkhirFilter.Date, nil),Self );
  cxGridDBTableSODetail.LoadFromCDS(FCDSDetil);
  cxGridDBTableSODetail.SetVisibleColumns(['PO_DATE','AUT$UNIT_ID', 'PO_ID', 'BARANG_ID'],False);

end;

procedure TfrmPurchaseOrder.UpdateStatusPO(AStatus: string);
var
  lModPO: TModPO;
begin
  if cbbStatusPO.DS.Locate('STAPO_NAME',AStatus,[loCaseInsensitive]) then
  begin
    lModPO := DMCLient.CrudClient.RetrieveSingle(TModPO.ClassName, cxGridView.DS.FieldByName('PO_ID').AsString) as TModPO;
    lModPO.CrudFilterKind := fckInclude;
    lModPO.AddFilterCrud(TModPO);
    try
      lModPO.PO_STATUS_PO := TModStatusPO.CreateID(cbbStatusPO.DS.FieldByName('ref$status_po_id').AsString);
      if DMClient.CrudClient.SaveToDB(lModPO) then
      begin
        TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
        Self.ModalResult := mrOk;
        RefreshData;
      end
      else
        TAppUtils.Error(ER_INSERT_FAILED);
    finally
      lModPO.Free;
    end;
  end;
end;

end.





