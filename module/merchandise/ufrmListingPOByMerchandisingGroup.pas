unit ufrmListingPOByMerchandisingGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, ComCtrls, StdCtrls, ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, dxCore, cxDateUtils, Vcl.Menus, System.Actions,
  Vcl.ActnList, ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC;

type
  TfrmListingPOByMerchandisingGroup = class(TfrmMasterBrowse)
    Panel1: TPanel;
    chkMerGrup: TCheckBox;
    chkStatus: TCheckBox;
    dtp2: TDateTimePicker;
    lbl1: TLabel;
    dtp1: TDateTimePicker;
    lbl2: TLabel;
    lbl3: TLabel;
    cbbStatus: TComboBox;
    cbbMerGroup: TComboBox;
    lbl4: TLabel;
    btnShow: TcxButton;
    btnSvExcel: TcxButton;
    DlgSv: TSaveDialog;
    Label1: TLabel;
    cbbMerch: TComboBox;
    chkMerch: TCheckBox;
    GroupBox1: TGroupBox;
    optRptStatus: TRadioButton;
    optRptMerGrp: TRadioButton;
    optRptMer: TRadioButton;
    procedure actExportExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    //procedure cbpStatusPOChange(Sender: TObject);
    //procedure cbpMerchGroupChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbbMerGroupChange(Sender: TObject);
    procedure chkMerGrupClick(Sender: TObject);
    procedure optRptMerClick(Sender: TObject);
    procedure optRptMerGrpClick(Sender: TObject);
    procedure optRptStatusClick(Sender: TObject);
  private
    { Private declarations }
    procedure FillComboStatusPO;
    procedure FillComboMerchGroup;
    procedure FillMerchan(aMerId: Integer = 0);
    function GetSQL(aOrder: string = ''): string;
  public
    { Public declarations }
  end;

var
  frmListingPOByMerchandisingGroup: TfrmListingPOByMerchandisingGroup;

implementation

uses uTSCommonDlg, uRetnoUnit, udmReport, uAppUtils;

//var arrParam: TArr;

{$R *.dfm}

procedure TfrmListingPOByMerchandisingGroup.actExportExecute(Sender: TObject);
begin
  inherited;
  if DlgSv.Execute then
  begin
//    sgGrid.SaveToXLS(DlgSv.FileName);
  end;
end;

procedure TfrmListingPOByMerchandisingGroup.actPrintExecute(Sender: TObject);
var
  s: string;

begin
  inherited;
  {
    frVariables.Variable['dtFrom']        := dtp1.Date;
    frVariables.Variable['dtTo']          := dtp2.Date;
    frVariables.Variable['loginname']     := FLoginFullname;
    frVariables.Variable['unitname']      := MasterNewUnit.Nama;

    setvariableheader(MasterNewUnit.Nama);
    frVariables.Variable['NAMAPERUSAHAAN']       := sNamaPerusahaan;
    frVariables.Variable['ALAMATPERUSAHAAN']     := sAlamatPerusahaan;
    frVariables.Variable['TELPPERUSAHAAN']       := sTelpPerusahaan;
    frVariables.Variable['UNITNAME']             := MasterNewUnit.Nama;

  self.Enabled := False;
  try
    if optRptStatus.Checked then
    begin
      s:= ' order by a.PO_STAPO_ID';
      frVariables.Variable['Title']:= 'Pengelompokan berdasarkan status PO';
      dmReportNew.EksekusiReport('frPOStatusMerchanGroupByStatus',GetSQL(s),'',True);
    end
    else if optRptMerGrp.Checked then
    begin
      frVariables.Variable['Title']:= 'Pengelompokan berdasarkan Grup Merchandize';
      s:= ' order by g.MERCHAN_ID';
      dmReportNew.EksekusiReport('frPOStatusMerchanGroupByGrp',GetSQL(s),'',True);
    end
    else if optRptMer.Checked then
    begin
      s:= ' order by c.SUPMG_MERCHANGRUP_ID';
      frVariables.Variable['Title']:= 'Pengelompokan berdasarkan Merchandize';
      dmReportNew.EksekusiReport('frPOStatusMerchanGroupByMer',GetSQL(s),'',True);
    end
    else
      dmReportNew.EksekusiReport('frPOStatusMerchanGroup',GetSQL,'',True);
  finally
    Self.Enabled:= True;
  end;
  }
end;

procedure TfrmListingPOByMerchandisingGroup.actRefreshExecute(Sender: TObject);
begin
  inherited;
  self.Enabled := False;
  cShowWaitWindow();
  try
//    cQueryToGrid(GetSQL,sgGrid);
//    sgGrid.AutoSize := True;
  finally
    self.Enabled := True;
    cCloseWaitWindow;
  end;
end;

procedure TfrmListingPOByMerchandisingGroup.FormShow(Sender: TObject);
begin
  inherited;

  dtp1.Date:= Now;
  dtp2.Date:= Now;

  FillComboStatusPO;
  FillComboMerchGroup;
//  FillMerchan(cGetIDfromCombo(cbbMerGroup));
  chkStatus.Checked := True;
  chkMerGrup.Checked:= True;
  chkMerch.Checked  := True;
end;

procedure TfrmListingPOByMerchandisingGroup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:= caFree;
end;

procedure TfrmListingPOByMerchandisingGroup.FormDestroy(Sender: TObject);
begin
  inherited;

  frmListingPOByMerchandisingGroup:= nil;
end;

procedure TfrmListingPOByMerchandisingGroup.FillComboStatusPO;
var
  sSQL: string;
begin
  sSQL := 'select stapo_id,stapo_name from ref$status_po'
          + ' where stapo_unt_id = ' + IntToStr(MasterNewUnit)
          + ' order by stapo_id';

//  cQueryToComboObject(cbbStatus, sSQL);
end;

procedure TfrmListingPOByMerchandisingGroup.FillComboMerchGroup;
var //dataMerchGroup: TResultDataSet;
  sSQL: string;
begin
  sSQL := 'select merchan_id, merchan_name from ref$merchandise'
          + ' where merchan_unt_id = ' + IntToStr(MasterNewUnit);

//  cQueryToComboObject(cbbMerGroup, sSQL);

end;




procedure TfrmListingPOByMerchandisingGroup.FormActivate(Sender: TObject);
begin
  inherited;
  frmListingPOByMerchandisingGroup.Caption := 'LISTING PURCHASE ORDER BY MERCHANDISING GROUP';
end;

procedure TfrmListingPOByMerchandisingGroup.cbbMerGroupChange(Sender: TObject);
begin
  inherited;
//  FillMerchan(cGetIDfromCombo(cbbMerGroup));
end;

procedure TfrmListingPOByMerchandisingGroup.chkMerGrupClick(Sender: TObject);
var
  aBool: Boolean;
begin
  inherited;
  aBool:= chkMerGrup.Checked;

  if aBool then
  begin
    chkMerch.Checked:= True;
    chkMerch.Enabled:= False;
    cbbMerch.Enabled:= False;
  end
  else
  begin
    chkMerch.Enabled:= True;
    cbbMerch.Enabled:= True;
  end;
end;

procedure TfrmListingPOByMerchandisingGroup.FillMerchan(aMerId: Integer = 0);
var
  sSQL: string;
begin
  sSQL := 'select MERCHANGRUP_ID, MERCHANGRUP_NAME from REF$MERCHANDISE_GRUP'
          + ' where MERCHANGRUP_UNT_ID = ' + IntToStr(MasterNewUnit);

  if aMerId <> 0 then
    sSQL:= sSQL + ' and MERCHANGRUP_MERCHAN_ID = '+ IntToStr(aMerId);

//  cQueryToComboObject(cbbMerch, sSQL);
end;

function TfrmListingPOByMerchandisingGroup.GetSQL(aOrder: string = ''): string;
var
  sStatus: string;
  sFilterStatus: string;
  sMerGrup: string;
  sFilterMerGrup: string;
  sFltrMerch: string;
  sSQL: string;
begin
    sFilterMerGrup := '';
    sMerGrup := 'Semua';
    if not chkMerGrup.Checked then
    begin
      sMerGrup := cbbMerGroup.Text;
//      sFilterMerGrup := ' and g.MERCHAN_ID = '+ IntToStr(cGetIDfromCombo(cbbMerGroup))
//                      + ' and g.MERCHAN_UNT_ID = '+ IntToStr(MasterNewUnit.ID);
    end;

    sFilterStatus := '';
    sStatus := 'Semua';
    if not chkStatus.Checked then
    begin
      sStatus := cbbStatus.Text;
//      sFilterStatus := ' and a.po_stapo_id = ' + IntToStr(cGetIDfromCombo(cbbStatus));
    end;

    if not chkMerch.Checked then
    begin
//      sFltrMerch:= ' and f.MERCHANGRUP_ID = '+ IntToStr(cGetIDfromCombo(cbbMerch))
//                  + ' and f.MERCHANGRUP_UNT_ID = '+ IntToStr(MasterNewUnit.ID);

    end;

    sSQL := 'select '
              + ' d.sup_code as "Kode Suplier", d.sup_name as "Nama Suplier"'
              + ', a.po_no as "No PO", a.po_date as "Tgl PO", b.so_no as "No SO"'
              + ', b.so_date as "Tgl SO", e.pod_brg_code "Kode Barang"'
              + ', e.pod_qty_order as "QTY Order", e.pod_price as "Price"'
              + ', e.pod_disc1 as "Disc 1",e.pod_disc2 as "Disc 2"'
              + ', e.pod_disc3 as "Disc 3",'
              + ' e.pod_ppn_persen as "PPn", e.pod_ppnbm_persen as "PPNBM"'
              + ', a.po_valid_date as "Tgl Valid"'
              + ', h.STAPO_CODE as "Kode Status", h.STAPO_NAME as "Status"'
              + ', f.MERCHANGRUP_CODE as "Kode Merch"'
              + ', f.MERCHANGRUP_NAME as "Nama Merchan"'
              + ', g.MERCHAN_CODE as "Kode Grup"'
              + ', g.MERCHAN_NAME as "Nama Grup"'
              + ' from po a, so b, suplier_merchan_grup c, suplier d, po_detil e'
              + ', REF$MERCHANDISE_GRUP f, REF$MERCHANDISE g, REF$STATUS_PO h'
              + ' where a.po_so_no = b.so_no'
              + ' and a.po_so_unt_id = b.so_unt_id'
              + ' and a.po_supmg_sub_code = c.supmg_sub_code'
              + ' and a.po_supmg_unt_id = c.supmg_unt_id'
              + ' and c.supmg_code = d.sup_code'
              + ' and c.supmg_sup_unt_id = d.sup_unt_id'
              + ' and a.po_no = e.pod_po_no'
              + ' and a.po_unt_id = e.pod_po_unt_id'
              + ' and a.po_unt_id = ' + IntToStr(MasterNewUnit)
              + ' and c.SUPMG_MERCHANGRUP_ID = f.MERCHANGRUP_ID'
              + ' and c.SUPMG_MG_UNT_ID = f.MERCHANGRUP_UNT_ID'
              + ' and f.MERCHANGRUP_MERCHAN_ID = g.MERCHAN_ID'
              + ' and f.MERCHANGRUP_MERCHAN_UNT_ID = g.MERCHAN_UNT_ID'
              + ' and a.PO_STAPO_ID = h.STAPO_ID'
              + ' and a.PO_STAPO_UNT_ID = h.STAPO_UNT_ID'
              + ' and h.STAPO_UNT_ID = '+ IntToStr(MasterNewUnit)
              + sFilterStatus
              + sFilterMerGrup
              + sFltrMerch
              + ' and a.po_date between ' + TAppUtils.QuotD(dtp1.DateTime)
              + ' and ' + TAppUtils.QuotD(dtp2.DateTime, True);

  if aOrder = '' then
    sSQL:= sSQL + ' order by a.po_no, a.po_date'
  else
    sSQL:= sSQL + aOrder + ', a.po_no, a.po_date';

  Result := sSQL; 
end;

procedure TfrmListingPOByMerchandisingGroup.optRptMerClick(Sender: TObject);
begin
  inherited;
  if optRptMer.Checked then
  begin
    optRptStatus.Checked:= False;
    optRptMerGrp.Checked:= False;
  end;
end;

procedure TfrmListingPOByMerchandisingGroup.optRptMerGrpClick(Sender: TObject);
begin
  inherited;
  if optRptMerGrp.Checked then
  begin
    optRptStatus.Checked:= False;
    optRptMer.Checked:= False;
  end;
end;

procedure TfrmListingPOByMerchandisingGroup.optRptStatusClick(Sender: TObject);
begin
  inherited;
  if optRptStatus.Checked then
  begin
    optRptMerGrp.Checked:= False;
    optRptMer.Checked:= False;
  end;

end;

end.





