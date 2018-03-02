unit ufrmPODOListByStatus;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterReport, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, Vcl.ComCtrls, uAppUtils,
  uDMReport, System.DateUtils, uDXUtils;

type
  TfrmPODOListByStatus = class(TfrmMasterReport)
    lblPeriode: TLabel;
    lblSD: TLabel;
    dtpAwal: TDateTimePicker;
    dtpAkhir: TDateTimePicker;
    lblStatus: TLabel;
    lblNoBukti: TLabel;
    lblSDNoBukti: TLabel;
    edtNoBuktiAwal: TEdit;
    edtNoBuktiAkhir: TEdit;
    cbbStatus: TComboBox;
    procedure actPrintExecute(Sender: TObject);
    procedure edtNoBuktiAkhirExit(Sender: TObject);
    procedure edtNoBuktiAwalExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPODOListByStatus: TfrmPODOListByStatus;

implementation

{$R *.dfm}

procedure TfrmPODOListByStatus.actPrintExecute(Sender: TObject);
begin
  inherited;
  with DMReport do
  begin
    AddReportVariable('P1',FormatDateTime('dd MMM yyyy', dtpAwal.Date));
    AddReportVariable('P2',FormatDateTime('dd MMM yyyy', dtpAkhir.Date));
    AddReportVariable('NO1', edtNoBuktiAwal.Text);
    AddReportVariable('NO2', edtNoBuktiAkhir.Text);
    AddReportVariable('STATUS', cbbStatus.Text);

    ExecuteReport(
      'reports/PODOListByStatus',
      DMReport.ReportClient.PODO_TRADER_BY_STATUS(dtpAwal.Date, dtpAkhir.Date,edtNoBuktiAwal.TextRest, edtNoBuktiAkhir.TextRest, cbbStatus.TextRest),['PODOList']);
  end;
end;

procedure TfrmPODOListByStatus.edtNoBuktiAkhirExit(Sender: TObject);
begin
  inherited;
  if edtNoBuktiAkhir.Text = '' then
    Exit;

  edtNoBuktiAkhir.Text := TAppUtils.StrPadLeft(edtNoBuktiAkhir.Text,11,'0');
end;

procedure TfrmPODOListByStatus.edtNoBuktiAwalExit(Sender: TObject);
begin
  inherited;
  if edtNoBuktiAwal.Text = '' then
    Exit;

  edtNoBuktiAwal.Text := TAppUtils.StrPadLeft(edtNoBuktiAwal.Text,11,'0');
end;

procedure TfrmPODOListByStatus.FormShow(Sender: TObject);
begin
  inherited;
  dtpAwal.DateTime := StartOfTheMonth(Now);
  dtpAkhir.DateTime:= EndOfTheDay(Now);


end;

end.
