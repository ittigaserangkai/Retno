unit ufrmPrintHistoryPOBySupplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ComCtrls, ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  dxCore, cxDateUtils, Vcl.Menus, System.Actions, Vcl.ActnList,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  cxButtonEdit;

type
//  TMyThread = class(TThread)
//  private
//    { Private declarations }
//  protected
//    procedure Execute; override;
//    procedure FillComboSupplier;
//  end;

  TfrmPrintHistoryPOBySupplier = class(TfrmMasterBrowse)
    Panel1: TPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl1: TLabel;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    edtSupplier: TEdit;
    chkSupplier: TCheckBox;
    chkStatus: TCheckBox;
    lbl4: TLabel;
    edbSupplier: TcxButtonEdit;
    cbbStatusPO: TcxComboBox;
    procedure actPrintExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edbSupplierKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edbSupplierPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    procedure FetchPOStatus;
    procedure FetchSupplierName(aKodeSuplier : String; aUnitID : Integer);
  public
    { Public declarations }
  end;

var
  frmPrintHistoryPOBySupplier: TfrmPrintHistoryPOBySupplier;

implementation

uses udmReport, DateUtils, ufrmSplash, ufrmDialogPrintPreview, uConstanta,
     ufrmSearchSupplier, uTSCommonDlg, uRetnoUnit, uAppUtils;

{$R *.dfm}

procedure TfrmPrintHistoryPOBySupplier.actPrintExecute(Sender: TObject);
var SeparatorDate: Char;
  sSupplier: string;
  sStatus: string;
  sFilterSupplier: string;
  sFilterStatus: string;
  sSQL: string;
  formatTanggalPendek: string;
begin
  inherited;

  if (edbSupplier.Text = '') and (not chkSupplier.Checked) then
  begin
    CommonDlg.ShowError('Supplier Belum Dipilih');
    edbSupplier.SetFocus;
    Exit;
  end;

  if cbbStatusPO.Text = '' then
  begin
    if not chkStatus.Checked then
    begin
      CommonDlg.ShowError('Status PO Belum Dipilih');
      cbbStatusPO.SetFocus;
      Exit;
    end;
  end;

  SeparatorDate:= FormatSettings.DateSeparator;
  formatTanggalPendek:= FormatSettings.ShortDateFormat;

  try
    FormatSettings.DateSeparator:= '/';
    FormatSettings.ShortDateFormat:= 'mm/dd/yyyy';

    sFilterStatus := '';
    sStatus := 'SEMUA';
    if not chkStatus.Checked then
    begin
      sFilterStatus := ' AND UPPER(e.STAPO_NAME) LIKE UPPER(' + QuotedStr(cbbStatusPO.Text) + ')';
      sStatus := cbbStatusPO.Text;
    end;

    sFilterSupplier := '';
    sSupplier := 'SEMUA';
    if not chkSupplier.Checked then
    begin
      sFilterSupplier := ' AND d.sup_code = ' + QuotedStr(edbSupplier.Text) ;
      sSupplier := edbSupplier.Text + '-' + edtSupplier.Text;

    end;

    sSQL := 'SELECT  '
          + QuotedStr(sSupplier) + ' as FilterSupplier,'
          + QuotedStr(sStatus) + ' as FilterStatus,'
          + ' d.sup_code, d.sup_name, a.PO_DATE, a.PO_NO, e.STAPO_NAME, b.pod_qty_order,'
          + ' b.pod_price, b.pod_disc1, b.pod_disc2, b.pod_disc3, b.pod_ppn_persen,'
          + ' b.pod_ppnbm_persen, f.dod_qty_order_recv,'
          + ' b.POD_TOTAL, b.POD_PPN, b.POD_PPNBM'
          + ' from po a'
          + ' inner join po_detil b on a.po_no = b.pod_po_no and a.po_unt_id = b.pod_po_unt_id'
          + ' inner join suplier_merchan_grup c on a.po_supmg_sub_code = c.supmg_sub_code '
          + ' inner join suplier d on c.supmg_code = d.sup_code '
          + ' inner join REF$STATUS_PO e on a.po_stapo_id = e.stapo_id '
          + ' left outer join do_detil f on b.pod_id = f.dod_pod_id and b.pod_unt_id = f.dod_pod_unt_id'
          + ' WHERE a.PO_DATE between ' + TAppUtils.QuotD(dtp1.DateTime) + ' and ' + TAppUtils.QuotD(dtp2.DateTime, True)
          + sFilterStatus
          + sFilterSupplier
          + ' ORDER BY a.PO_NO, a.PO_DATE,e.STAPO_NAME';

//   dmReportNew.EksekusiReport('laphistorypobysuuplier',sSQL,'',True);


  finally
    FormatSettings.DateSeparator:= SeparatorDate;
    FormatSettings.ShortDateFormat:= formatTanggalPendek;
  end;
end;

procedure TfrmPrintHistoryPOBySupplier.actRefreshExecute(Sender: TObject);
var SeparatorDate: Char;
  sSupplier: string;
  sStatus: string;
  sFilterSupplier: string;
  sFilterStatus: string;
  sSQL: string;
  formatTanggalPendek: string;
begin
  inherited;
  if (edbSupplier.Text = '') and (not chkSupplier.Checked) then
  begin
    CommonDlg.ShowError('Supplier Belum Dipilih');
    edbSupplier.SetFocus;
    Exit;
  end;

  if cbbStatusPO.Text = '' then
  begin
    if not chkStatus.Checked then
    begin
      CommonDlg.ShowError('Status PO Belum Dipilih');
      cbbStatusPO.SetFocus;
      Exit;
    end;
  end;

  SeparatorDate:= FormatSettings.DateSeparator;
  formatTanggalPendek:= FormatSettings.ShortDateFormat;

  try
    FormatSettings.DateSeparator:= '/';
    FormatSettings.ShortDateFormat:= 'mm/dd/yyyy';

    sFilterStatus := '';
    sStatus := 'SEMUA';
    if not chkStatus.Checked then
    begin
      sFilterStatus := ' AND UPPER(e.STAPO_NAME) LIKE UPPER(' + QuotedStr(cbbStatusPO.Text) + ')';
      sStatus := cbbStatusPO.Text;
    end;

    sFilterSupplier := '';
    sSupplier := 'SEMUA';
    if not chkSupplier.Checked then
    begin
      sFilterSupplier := ' AND d.sup_code = ' + QuotedStr(edbSupplier.Text) ;
      sSupplier := edbSupplier.Text + '-' + edtSupplier.Text;

    end;

    sSQL := 'SELECT  '
          + ' d.sup_code as "Kode Suplier", d.sup_name as "Nama Suplier", a.PO_DATE as "Tgl PO", a.PO_NO as "No PO", e.STAPO_NAME as "Status", b.pod_qty_order as "QTY Order",'
          + ' f.dod_qty_order_recv as "QTY Recv",b.pod_price as "Price", b.pod_disc1 as "Disc1", b.pod_disc2 as "Disc2", b.pod_disc3 as "Disc3", b.pod_ppn_persen as "PPn",'
          + ' b.pod_ppnbm_persen as "PPNBM",'
          + ' b.POD_PPN as "Nilai PPn", b.POD_PPNBM as "Nilai PPNBM",b.POD_TOTAL as "Total"'
          + ' from po a'
          + ' inner join po_detil b on a.po_no = b.pod_po_no and a.po_unt_id = b.pod_po_unt_id'
          + ' inner join suplier_merchan_grup c on a.po_supmg_sub_code = c.supmg_sub_code '
          + ' inner join suplier d on c.supmg_code = d.sup_code '
          + ' inner join REF$STATUS_PO e on a.po_stapo_id = e.stapo_id '
          + ' left outer join do_detil f on b.pod_id = f.dod_pod_id and b.pod_unt_id = f.dod_pod_unt_id'
          + ' WHERE a.PO_DATE between ' + TAppUtils.QuotD(dtp1.DateTime) + ' and ' + TAppUtils.QuotD(dtp2.DateTime, True)
          + sFilterStatus
          + sFilterSupplier
          + ' ORDER BY a.PO_NO, a.PO_DATE,e.STAPO_NAME';

//    cQueryToGrid(sSQL,sgGrid);
//    sgGrid.AutoSize := True;

  finally
  FormatSettings.DateSeparator:= SeparatorDate;
  FormatSettings.ShortDateFormat:= formatTanggalPendek;
  end;
end;

procedure TfrmPrintHistoryPOBySupplier.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:= caFree;
end;

procedure TfrmPrintHistoryPOBySupplier.FormDestroy(Sender: TObject);
begin
  inherited;

  frmPrintHistoryPOBySupplier:= nil;
end;

procedure TfrmPrintHistoryPOBySupplier.FormCreate(Sender: TObject);
begin
  inherited;

  lblHeader.Caption:= 'PRINT HISTORY PO BY SUPPLIER';
  frmPrintHistoryPOBySupplier.Caption:= 'Print History PO By Supplier';
end;

procedure TfrmPrintHistoryPOBySupplier.FormActivate(Sender: TObject);
begin
  inherited;
  frmPrintHistoryPOBySupplier.Caption:= 'PRINT HISTORY PO BY SUPPLIER';
end;

procedure TfrmPrintHistoryPOBySupplier.FormDeactivate(Sender: TObject);
begin
  inherited;

  frmPrintHistoryPOBySupplier.Caption:= '';
end;

procedure TfrmPrintHistoryPOBySupplier.FormShow(Sender: TObject);
begin
  inherited;

  dtp1.Date:= Now;
  dtp2.Date:= Now;
  FetchPOStatus;

end;

procedure TfrmPrintHistoryPOBySupplier.FetchPOStatus;

begin

end;

procedure TfrmPrintHistoryPOBySupplier.FetchSupplierName(aKodeSuplier : String;
    aUnitID : Integer);
begin
  {with TNewSupplier.Create(Self) do
  begin
    try
      if LoadByKode(aKodeSuplier) then
      begin
        edtSupplier.Text      := Nama;
        edbSupplier.Text  := Kode;
      end else begin
        edtSupplier.Text      := '';
        edbSupplier.Text  := '';
      end;
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmPrintHistoryPOBySupplier.edbSupplierPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  iPOUnitID: Integer;
  sSQL: string;
begin
  inherited;
  {iPOUnitID := GetPOUnitID(MasterNewUnit.ID);
  sSQL := 'select sup_code as Kode,sup_name as Nama'
            + ' from suplier';

  with cLookUp('Daftar Supplier', sSQL) do
  begin
    try
      if Strings[0] = '' then
        Exit;

      FetchSupplierName(Strings[0], iPOUnitID);
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmPrintHistoryPOBySupplier.edbSupplierKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
var
  iPOUnitID: Integer;
  sSQL: string;
begin
  inherited;
  {iPOUnitID := GetPOUnitID(MasterNewUnit.ID);
  if Key = VK_F5 then
  begin


    sSQL := 'select sup_code as Kode,sup_name as Nama'
            + ' from suplier';

    with cLookUp('Daftar Supplier', sSQL) do
    begin
      try
        if Strings[0] = '' then
          Exit;

        FetchSupplierName(Strings[0], iPOUnitID);
      finally
        Free;
      end;
    end;

  end else
  if Key = VK_RETURN then
    FetchSupplierName(edbSupplier.Text, iPOUnitID);
    }
end;

end.
