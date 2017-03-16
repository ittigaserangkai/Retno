unit ufrmPrintPurchaseOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, cbxbase, dblup1a, SUIButton, ComCtrls,
  ufraFooter1Button, ExtCtrls;

type
  TfrmPrintRecapitulationPO = class(TfrmMaster)
    fraFooter1Button1: TfraFooter1Button;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    btnPrint: TsuiButton;
    cbpMerchGroup: TColumnComboBox;
    edtMerchGroup: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbpMerchGroupChange(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnPrintEnter(Sender: TObject);
    procedure btnPrintExit(Sender: TObject);
  private
    { Private declarations }
    procedure FillComboMerchGroup;
  public
    { Public declarations }
  end;

var
  frmPrintRecapitulationPO: TfrmPrintRecapitulationPO;

implementation

uses uConn,suithemes, uPrintPurchaseOrder,  udmReport, DateUtils,
  ufrmDialogPrintPreview, udmReportNew, uRMSUnit, fr_Class;

var arrParam: TArr;

{$R *.dfm}

procedure TfrmPrintRecapitulationPO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  Action:= caFree;
end;

procedure TfrmPrintRecapitulationPO.FormDestroy(Sender: TObject);
begin
  inherited;

  frmPrintRecapitulationPO:= nil;
end;

procedure TfrmPrintRecapitulationPO.FormShow(Sender: TObject);
begin
  inherited;

  dtp1.Date:= Now;
  dtp2.Date:= Now;

  FillComboMerchGroup;
end;

procedure TfrmPrintRecapitulationPO.FillComboMerchGroup;
var dataMerchGroup: TResultDataSet;
begin
  if not Assigned(PrintPurchaseOrder) then
    PrintPurchaseOrder:= TPrintPurchaseOrder.Create;

  SetLength(arrParam,0);
  arrParam := nil;
  dataMerchGroup:= PrintPurchaseOrder.GetAllDataMerchandise(arrParam);

  // isi list combo box MerchGroup
  with cbpMerchGroup do begin
    ClearGridData;
    ColCount := 3;

    if not dataMerchGroup.IsEmpty then begin
      dataMerchGroup.First;
      RowCount := dataMerchGroup.RecordCount + 1;
      AddRow(['Id', 'Merchandise Code', 'Merchandise Name']);

      while not dataMerchGroup.Eof do begin
        AddRow([dataMerchGroup.FieldByName('MERCHAN_ID').AsString,
          dataMerchGroup.FieldByName('MERCHAN_CODE').AsString,
          dataMerchGroup.FieldByName('MERCHAN_NAME').AsString]);
        dataMerchGroup.Next;
      end;
    end
    else begin
      RowCount := 2;
      AddRow(['Id', 'Division Code', 'Division Name']);
      AddRow(['', ' ', ' ']);
    end;

    FixedRows := 1;
    SizeGridToData;
    Text := '';
  end;
end;

procedure TfrmPrintRecapitulationPO.cbpMerchGroupChange(Sender: TObject);
begin
  inherited;

  edtMerchGroup.Text:= cbpMerchGroup.Cells[2,cbpMerchGroup.Row];
end;

procedure TfrmPrintRecapitulationPO.btnPrintClick(Sender: TObject);
var
  sSQL: string;

begin
  inherited;

  if (cbpMerchGroup.Cells[0,cbpMerchGroup.Row] = '') or (cbpMerchGroup.Cells[0,cbpMerchGroup.Row] = 'Id') then
    Exit;

    sSQL :=
    'select sup.sup_code, (sup.sup_code || '' '' || RTP.TPPERSH_CODE || '' '' || sup.sup_name) as suplier_code_name, ' +
      'p.po_date, p.po_no, p.po_deliver_date as due_date, supmg.supmg_lead_time, ' +
       's.so_no, s.so_date, sum(pod.pod_qty_order) as qty_order, sum(pod.pod_total) as total_po, ' +
       'sum(pod.pod_total_disc) as Subtotal, sum(pod.pod_ppn) as pod_ppn, sum(pod.pod_ppnbm) as pod_ppnbm, ' +
       //'sum(pod_total_disc + pod_ppn + pod_ppnbm ) as purchase, ' +
       'sum(pod.POD_TOTAL_TAX) as purchase, ' +
       'sum(dod.dod_qty_order)as qty_receive, ' +
       'd.do_date, stapo.stapo_name ' +
       {'extractdate(do_date) as do_date, stapo_name ' + }
    'from po p ' +
      'left join so s on (p.po_so_no=s.so_no and p.po_so_unt_id=s.so_unt_id) ' +
      'left join so_detil sod on (sod.sod_so_no=s.so_no and sod.sod_so_unt_id=s.so_unt_id) ' +
      'left join po_detil pod on (pod.pod_po_no=p.po_no and pod.pod_po_unt_id=p.po_unt_id and pod.pod_sod_id=sod.sod_id and pod.pod_sod_unt_id=sod.sod_unt_id) ' +
      'left join dord d on (d.do_po_no=p.po_no and d.do_po_unt_id=p.po_unt_id and d.do_so_no=s.so_no and d.do_so_unt_id=s.so_unt_id) ' +
      'left join do_detil dod on (dod.dod_do_no=d.do_no and dod.dod_do_unt_id=d.do_unt_id ' +
      'and dod.dod_pod_id = pod.pod_id and dod.dod_pod_unt_id = pod.pod_unt_id) ' +
      'left join suplier_merchan_grup supmg on (p.po_supmg_sub_code=supmg.supmg_sub_code) ' +
      'left join suplier sup on (supmg.supmg_code=sup.sup_code) ' +
      'left join ref$status_po stapo on (p.po_stapo_id=stapo.stapo_id ) ' +
      'LEFT JOIN REF$TIPE_PERUSAHAAN RTP ON sup.SUP_TPPERSH_ID = RTP.TPPERSH_ID ' +
    'where p.po_date >= ' + QuotD(dtp1.Date) +
    ' and p.po_date <= ' + QuotD(dtp2.Date) +
    //(extractdate(po_date) between :po_date1 and :po_date2) ' +
    ' and s.so_merchangrup_id = ' + cbpMerchGroup.Cells[0,cbpMerchGroup.Row] +
    ' AND P.PO_UNT_ID = ' + IntToStr(MasterNewUnit.ID) +
    'group by sup.sup_code, rtp.TPPERSH_CODE, sup.sup_name, p.po_date, p.po_no, p.po_deliver_date, supmg.supmg_lead_time, ' +
      's.so_no, s.so_date, d.do_date, stapo.stapo_name';

    frVariables.Variable['loginname']    := FLoginFullname;
    frVariables.Variable['unitname']     := MasterNewUnit.Nama;

    frVariables.Variable['FPODateFrom']  := FormatDateTime('dd/mm/yyyy', dtp1.Date);
    frVariables.Variable['FPODateTo']    := FormatDateTime('dd/mm/yyyy', dtp2.Date);

    frVariables.Variable['FMerchanID']   := cbpMerchGroup.Cells[0,cbpMerchGroup.Row];
    frVariables.Variable['FMerchanName'] := edtMerchGroup.Text;

    dmReportNew.EksekusiReport('frRecapitulationPO',sSQL);

end;

procedure TfrmPrintRecapitulationPO.FormActivate(Sender: TObject);
begin
  inherited;
  frmPrintRecapitulationPO.Caption := 'PRINT RECAPITULATION PURCHASE ORDER';
end;

procedure TfrmPrintRecapitulationPO.btnPrintEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmPrintRecapitulationPO.btnPrintExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

end.
  
