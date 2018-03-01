unit ufrmDOForTrader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, Mask, Grids,
  ActnList, DB, System.Actions, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, ufraFooter4Button, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, System.Generics.Collections, uDXUtils,
  uModDOTrader, uModOrganization, Datasnap.DBClient, uDBUtils, System.DateUtils,
  ufrmDialogDOForTrader, uAppUtils, uDMReport;

type
  TfrmDOForTrader = class(TfrmMasterBrowse)
    cxGridColOverviewNo: TcxGridDBColumn;
    cxGridColOverviewDate: TcxGridDBColumn;
    cxGridColOverviewDesc: TcxGridDBColumn;
    cxGridColOverviewOrgCode: TcxGridDBColumn;
    cxGridColOverviewOrgName: TcxGridDBColumn;
    cxGridColOverviewTotal: TcxGridDBColumn;
    cxGridColOverviewSubTotal: TcxGridDBColumn;
    cxGridColOverViewDisc: TcxGridDBColumn;
    cxGridColOverviewPPN: TcxGridDBColumn;
    edNoBuktiDOAkhir: TcxTextEdit;
    edNoBuktiDoAwal: TcxTextEdit;
    lblNoBukti: TcxLabel;
    lblSDNo: TcxLabel;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure edNoBuktiDOAkhirExit(Sender: TObject);
    procedure edNoBuktiDoAwalExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FCDS: TClientDataset;
  public
    procedure RefreshData; override;
  end;

var
  frmDOForTrader: TfrmDOForTrader;

implementation

uses
  uConstanta, Math, uDMClient;

{$R *.dfm}


procedure TfrmDOForTrader.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogDOForTrader)
end;

procedure TfrmDOForTrader.actEditExecute(Sender: TObject);
begin
  inherited;
  if FCDS = nil  then
    Exit;

  ShowDialogForm(TfrmDialogDOForTrader, FCDS.FieldByName('DOTRADER_ID').AsString);
end;

procedure TfrmDOForTrader.actPrintExecute(Sender: TObject);
begin
  inherited;
  with DMReport do
  begin
    AddReportVariable('P1',FormatDateTime('dd MMM yyyy', dtAwalFilter.Date));
    AddReportVariable('P2',FormatDateTime('dd MMM yyyy', dtAkhirFilter.Date));
    AddReportVariable('NO1', edNoBuktiDoAwal.Text);
    AddReportVariable('NO2', edNoBuktiDOAkhir.Text);
//    AddReportVariable('USER', UserName);

    DmReport.ExecuteReport(
    'reports\DOTrader_DisplayOmset',
    DMReport.ReportClient.DOTrader_DisplayOmset(dtAwalFilter.Date, dtAkhirFilter.Date,edNoBuktiDoAwal.TextRest, edNoBuktiDOAkhir.TextRest),
    ['Q_DISPLAYOMSET']
  );
  end;
end;

procedure TfrmDOForTrader.edNoBuktiDOAkhirExit(Sender: TObject);
begin
  inherited;
  if edNoBuktiDoakhir.Text = '' then
    Exit;

  edNoBuktiDoakhir.Text := TAppUtils.StrPadLeft(edNoBuktiDoakhir.Text,11,'0');
end;

procedure TfrmDOForTrader.edNoBuktiDoAwalExit(Sender: TObject);
begin
  inherited;
  if edNoBuktiDoAwal.Text = '' then
    Exit;

  edNoBuktiDoAwal.Text := TAppUtils.StrPadLeft(edNoBuktiDoAwal.Text,11,'0');
end;

procedure TfrmDOForTrader.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDOForTrader.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'DO FOR ASSGROS';
end;

procedure TfrmDOForTrader.RefreshData;
begin
  inherited;
  if Assigned(FCDS) then FreeAndNil(FCDS);
  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.DOTrader_GetDSOverview(StartOfTheDay(dtAwalFilter.Date), EndOfTheDay(dtAkhirFilter.Date), edNoBuktiDoAwal.TextRest, edNoBuktiDOAkhir.TextRest) ,Self );
  cxGridView.LoadFromCDS(FCDS, False);

end;

end.



