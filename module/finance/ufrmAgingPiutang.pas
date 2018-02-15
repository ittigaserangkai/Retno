unit ufrmAgingPiutang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterBrowse, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  System.Actions, Vcl.ActnList, ufraFooter4Button, Vcl.StdCtrls, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, Datasnap.DBClient, uDMClient,
  uDMReport, uDXUtils, uDBUtils, Data.FireDACJSONReflect, cxCurrencyEdit;

type
  TfrmAgingPiutang = class(TfrmMasterBrowse)
    cxGridColOrgCode: TcxGridDBColumn;
    cxGridColOrgName: TcxGridDBColumn;
    cxGridColTOP: TcxGridDBColumn;
    cxGridColBelumJatuhTemp: TcxGridDBColumn;
    cxGridCol1_7: TcxGridDBColumn;
    cxGridCol8_14: TcxGridDBColumn;
    cxGridCol15_21: TcxGridDBColumn;
    cxGridCol22_28: TcxGridDBColumn;
    cxGridColLebihBesar28: TcxGridDBColumn;
    cxGridColTotal: TcxGridDBColumn;
    procedure actPrintExecute(Sender: TObject);
  private
//    FCDS: TClientDataset;
    FJSONDataSets: TFDJSONDataSets;
    { Private declarations }
  protected
    procedure RefreshData; override;
  public
    { Public declarations }
  end;

var
  frmAgingPiutang: TfrmAgingPiutang;

implementation

{$R *.dfm}

procedure TfrmAgingPiutang.actPrintExecute(Sender: TObject);
begin
//  inherited;
  with DMReport do
  begin
    AddReportVariable('UserCetak', 'USER');
    ExecuteReport('reports/Aging_Piutang' ,ReportClient.AgingPiutang, ['AGING_PIUTANG']);
  end;
end;

procedure TfrmAgingPiutang.RefreshData;
begin
  inherited;
  FJSONDataSets := DMReport.ReportClient.AgingPiutang();
  TFDJSONDataSetsReader.GetListValue(FJSONDataSets, 0);

  cxGridView.LoadFromDS(TDataSet(TFDJSONDataSetsReader.GetListValue(FJSONDataSets, 0)), Self);
  cxGridView.ApplyBestFit();
end;

end.
