unit ufrmDailySalesAnalysis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterReport, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, Actions, ActnList, StdCtrls, cxButtons, ExtCtrls, cxControls,
  cxContainer, cxEdit, ComCtrls, dxCore, cxDateUtils, cxStyles, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxDropDownEdit, cxDBExtLookupComboBox, cxTextEdit, cxMaskEdit, cxCalendar,
  cxImageComboBox, cxCustomData, cxFilter, cxData;

type
  TfrmDailySalesAnalysis = class(TfrmMasterReport)
    Panel2: TPanel;
    Label2: TLabel;
    dtStart: TcxDateEdit;
    dtEnd: TcxDateEdit;
    Label3: TLabel;
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    cxlvMaster: TcxGridLevel;
    Label4: TLabel;
    cbGroup: TcxImageComboBox;
    procedure actExportExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure LoadData;
  end;

var
  frmDailySalesAnalysis: TfrmDailySalesAnalysis;

implementation

{$R *.dfm}

uses uDMClient, uDMReport, uDXUtils, DateUtils;

procedure TfrmDailySalesAnalysis.actExportExecute(Sender: TObject);
begin
  inherited;
  cxGridView.ExportToXLS();
end;

procedure TfrmDailySalesAnalysis.actPrintExecute(Sender: TObject);
begin
  inherited;
  with DMReport do
  begin
    AddReportVariable('UserCetak', 'USER');
    AddReportVariable('DateStart', FormatDateTime('dd/MM/yyyy', dtStart.Date));
    AddReportVariable('DateEnd', FormatDateTime('dd/MM/yyyy', dtEnd.Date));
    ExecuteReport('Reports\DSA', ReportClient.DSA_GetDSPrint(dtStart.Date, dtEnd.Date, cbGroup.EditValue),[]);
  end;
end;

procedure TfrmDailySalesAnalysis.actRefreshExecute(Sender: TObject);
begin
  inherited;
  LoadData;
end;

procedure TfrmDailySalesAnalysis.FormCreate(Sender: TObject);
begin
  inherited;
  dtStart.Date := Now();
  dtEnd.Date := Now();
  cbGroup.ItemIndex := 0;
end;

procedure TfrmDailySalesAnalysis.LoadData;
begin
  cxGridView.LoadFromDS(DMReport.ReportClient.DSA_GetDS(dtStart.Date, dtEnd.Date, cbGroup.EditValue), Self);
  if Assigned(cxGridView.DataController.DataSource) then
  begin
    cxGridView.AutoFormatCurrency(',0.00;(,0.00)');
    cxGridView.SetSummaryByColumns(['LastSales','LastSalesProcent',
                                    'LastProfit','LastProfitProcent',
                                    'AllSales','AllSalesProcent',
                                    'AllProfit','AllProfitProcent']);
    cxGridView.ApplyBestFit();
  end;
end;

end.
