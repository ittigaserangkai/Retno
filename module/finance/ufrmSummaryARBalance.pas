unit ufrmSummaryARBalance;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterReport, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxControls, cxContainer,
  cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxLabel, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxGroupBox, cxRadioGroup, System.DateUtils, uDMReport, uDMClient, uAppUtils, uDBUtils;

type
  TfrmSummaryARBalance = class(TfrmMasterReport)
    dtPeriodeAwal: TcxDateEdit;
    dtPeriodeAkhir: TcxDateEdit;
    lblSD: TcxLabel;
    lblPeriode: TcxLabel;
    cxrdgrpJenisLaporan: TcxRadioGroup;
    procedure actPrintExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSummaryARBalance: TfrmSummaryARBalance;

implementation

{$R *.dfm}

procedure TfrmSummaryARBalance.actPrintExecute(Sender: TObject);
begin
  inherited;
  with DMReport do
  begin
    AddReportVariable('UserCetak', UserName);
    AddReportVariable('P1', FormatDateTime('dd MMM yyyy', dtPeriodeAwal.Date));
    AddReportVariable('P2', FormatDateTime('dd MMM yyyy', dtPeriodeAkhir.Date));

    if cxrdgrpJenisLaporan.ItemIndex = 0 then
      ExecuteReport('reports/AR_Balance_Detail', ReportClient.Summary_AR_Balance(dtPeriodeAwal.Date, dtPeriodeAkhir.Date), ['AR_BALANCE_DETAIL'])
    else
      ExecuteReport('reports/AR_Balance_Summary', ReportClient.Summary_AR_Balance(dtPeriodeAwal.Date, dtPeriodeAkhir.Date), ['AR_BALANCE_DETAIL']);
  end;
end;

procedure TfrmSummaryARBalance.FormCreate(Sender: TObject);
begin
  inherited;
  dtPeriodeAwal.Date := StartOfTheMonth(Now);
  dtPeriodeAkhir.Date:= EndOfTheDay(Now);
end;

end.
