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
  cxDBExtLookupComboBox;

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
    procedure FormCreate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FCDS: TClientDataSet;
    FCDSDetil: TClientDataSet;
    { Private declarations }
    sSQL  : string;
    procedure InisialisasiDBBStatusPO;
    procedure InisialisasiCBBSupMGAkhir; overload;
    procedure InisialisasiCBBSupMGAwal;
    procedure RefreshDataPO;
    procedure RefreshDataPODetil;

  protected
    function GetSQLStatusPO: string; dynamic;
    function GetSupCode    : string; virtual;
    procedure RefreshData; override;
  public
    { Public declarations }
  end;

  /// nama from disamakan dengan unitnamenya mis : unit ufrmPurchaseOrder, nama form = frmPurchaseOrder [hilangkan huruf u di depan]
  /// combo supplier1 dan supplier2 diganti aj dengan editbutton

var
  frmPurchaseOrder: TfrmPurchaseOrder;

implementation

uses uConn, udmReport, DateUtils, ufrmDialogPrintPreview, uTSCommonDlg,
  ufrmPORevision;

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
  iPOUnitID: Integer;
  strDtFrst     : string;
  strDtNext     : string;
  sStapo_ID,
  sTmp          : string;


begin
  inherited;
//  iPOUnitID := GetPOUnitID(MasterNewUnit.ID);

//  if (cbbStatusPO.EditValue = null) or (cbbStatusPO.ItemIndex < 0) then
//  begin
//    CommonDlg.ShowErrorEmpty('Status PO');
//    cbbStatusPO.SetFocus;
//    Exit;
//  end;
//
//  FormatSettings.DateSeparator   := '/';
//  FormatSettings.ShortDateFormat := 'mm/dd/yyyy';
//  strDtFrst       := FormatDateTime('mm/dd/yyyyy', dtAwalFilter.Date) + ' 00:00:00';
//  strDtNext       := FormatDateTime('mm/dd/yyyyy', dtAkhirFilter.Date) + ' 23:59:59';
//  sStapo_ID       := Trim(copy(cboStatusPO.Text,1, pos(' ',cboStatusPO.Text)));
//  sTmp            := trim(copy(cboStatusPO.Text, pos(' ',cboStatusPO.Text)+1,
//                          length(cboStatusPO.Text)- pos(' ',cboStatusPO.Text)));
//
//  sSQL:= 'SELECT '
//        + ' s.sup_code, smg.supmg_code, '
//        + ' s.sup_name as sup_name, p.po_date '
//        + ' as po_date, p.po_no, '
//        + ' p.po_so_no, p.po_colie, p.PO_DISC, p.po_ppn, '
//        + ' p.po_ppnbm, p.PO_DISC + p.po_ppn + p.po_ppnbm as po_purchase, p.po_total '
//        + ' from po p '
//        + ' inner join suplier_merchan_grup smg on p.po_supmg_sub_code = smg.supmg_sub_code  '
//        + ' inner join suplier s on smg.supmg_code = s.sup_code  '
//        + ' left outer join ref$tipe_perusahaan rtp on s.sup_tppersh_id = rtp.tppersh_id '
//        + ' where s.SUP_CODE >= ' +  QuotedStr(edtBtnSuplier1.Text)
//        + ' AND s.SUP_CODE <= ' +   QuotedStr(edtBtnSuplier2.Text)
//        + ' AND p.PO_DATE >= ' +   QuotedStr(strDtFrst)
//        + ' AND p.PO_DATE <= ' +   QuotedStr(strDtNext)
//        + ' AND (p.PO_STAPO_ID = ' +   QuotedStr(sStapo_ID)
//        + ' ) '
//        + ' AND P.PO_UNT_ID = ' + IntToStr(iPOUnitID)
//        + ' ORDER BY s.SUP_CODE ASC,rtp.tppersh_code ASC, s.sup_name ASC, '
//        + ' po_date ASC, p.po_no ASC';

//      dmReportNew.EksekusiReport('frcetakPO_listing', sSQL,'',True);
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

end.





