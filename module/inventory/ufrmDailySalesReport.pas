unit ufrmDailySalesReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter5Button, Mask,
  JvToolEdit, SUIButton, uConn, ActnList;

type
  TfrmDailySalesReport = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    pnlMain: TPanel;
    lbl1: TLabel;
    dtTglTo: TJvDateEdit;
    btnPrint: TsuiButton;
    actlstDSR: TActionList;
    actPrintDSR: TAction;
    actSaveDSRToFile: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure actPrintDSRExecute(Sender: TObject);
    procedure actSaveDSRToFileExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPrintEnter(Sender: TObject);
    procedure btnPrintExit(Sender: TObject);
  private
    FParamList: TStringList;
    function GetDataDSR(ADate: TDateTime): TResultDataSet;
    procedure SetParamList(const Value: TStringList);
  public
    property ParamList: TStringList read FParamList write SetParamList;
  end;

var
  frmDailySalesReport: TfrmDailySalesReport;

implementation

uses uGTSUICommonDlg,suithemes, uReportCashierSupv, uConstanta,  udmReport,
  ufrmDialogPrintPreview;

{$R *.dfm}

{ TfrmDailySalesReport }

function TfrmDailySalesReport.GetDataDSR(ADate: TDateTime): TResultDataSet;
var arrParam: TArr;
begin
  if not Assigned(ReportCashierSupv) then
    ReportCashierSupv := TReportCashierSupv.Create;

  SetLength(arrParam, 2);
  arrParam[0].tipe := ptDateTime;
  arrParam[0].data := ADate;
  arrParam[1].tipe := ptInteger;
  arrParam[1].data := MasterNewUnit.ID;

  Result := ReportCashierSupv.GetDSR(arrParam);
end;

procedure TfrmDailySalesReport.SetParamList(const Value: TStringList);
begin
  FParamList := Value;
end;

procedure TfrmDailySalesReport.FormCreate(Sender: TObject);
begin
  inherited;
  ParamList := TStringList.Create;
end;

procedure TfrmDailySalesReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDailySalesReport.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDailySalesReport := nil;
  frmDailySalesReport.Free;
end;

procedure TfrmDailySalesReport.actPrintDSRExecute(Sender: TObject);
begin
  inherited;
  ParamList.Clear;
  ParamList.Add(FLoginFullname);
  ParamList.Add(FormatDateTime('dd/mm/yyyy', dtTglTo.Date));
  ParamList.Add(MasterNewUnit.Nama);

  if not Assigned(frmDialogPrintPreview) then
    frmDialogPrintPreview:= TfrmDialogPrintPreview.Create(Application);

  try
    with frmDialogPrintPreview do
    begin
      RecordSet := GetDataDSR(dtTglTo.Date);
      ListParams:= ParamList;
      FilePath  := FFilePathReport + 'frCetakDailySalesReport.fr3';
      SetFormPropertyAndShowDialog(frmDialogPrintPreview);
    end;
  finally
    frmDialogPrintPreview.Free;
  end;
end;

procedure TfrmDailySalesReport.actSaveDSRToFileExecute(Sender: TObject);
begin
  inherited;
  ParamList.Clear;
  ParamList.Add(FLoginFullname);
  ParamList.Add(FormatDateTime('dd/mm/yyyy', dtTglTo.Date));
  ParamList.Add(MasterNewUnit.Nama);

  with dmReport do
  begin
    Params := ParamList;
    frxDBDataset.DataSet := GetDataDSR(dtTglTo.Date);
    pMainReport.LoadFromFile(ExtractFilePath(Application.ExeName) + '/template/frCetakDailySalesReport.fr3');
    pMainReport.PrepareReport;
    pMainReport.ShowReport;
//    frxDotMatrix.ExportObject(pMainReport);
    pMainReport.Export(frxDotMatrix);
  end;
end;

procedure TfrmDailySalesReport.FormShow(Sender: TObject);
begin
  inherited;
  dtTglTo.Date := now;
end;

procedure TfrmDailySalesReport.btnPrintEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmDailySalesReport.btnPrintExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

end.
