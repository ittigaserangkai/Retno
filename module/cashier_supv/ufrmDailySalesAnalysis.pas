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
  cxCustomData, cxFilter, cxData;

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
    procedure actExportExecute(Sender: TObject);
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
end;

procedure TfrmDailySalesAnalysis.LoadData;
begin
  cxGridView.LoadFromDS(DMReport.ReportClient.DSA_GetDS(dtStart.Date, dtEnd.Date), Self);
end;

end.
