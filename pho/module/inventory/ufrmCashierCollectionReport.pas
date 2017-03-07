unit ufrmCashierCollectionReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter5Button, SUIButton,
  Mask, JvToolEdit, uConn, ActnList;

type
  TfrmCashierCollectionReport = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    pnlMain: TPanel;
    lbl1: TLabel;
    dtTglTo: TJvDateEdit;
    btnPrint: TsuiButton;
    actlstCashierCollectionReport: TActionList;
    actPrintCashierCollectionReport: TAction;
    actSaveToFile: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actPrintCashierCollectionReportExecute(Sender: TObject);
    procedure actSaveToFileExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPrintEnter(Sender: TObject);
    procedure btnPrintExit(Sender: TObject);
  private
    FParamList: TStringList;
    procedure SetParamList(const Value: TStringList);
    function GetDataForCashierCollectionReport(ADate: TDateTime): TResultDataSet;
  public
    property ParamList: TStringList read FParamList write SetParamList;
  end;

var
  frmCashierCollectionReport: TfrmCashierCollectionReport;

implementation

uses  uConstanta,suithemes, uGTSUICommonDlg,
  uReportCashierSupv, udmReport, ufrmDialogPrintPreview;

{$R *.dfm}

procedure TfrmCashierCollectionReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmCashierCollectionReport.FormDestroy(Sender: TObject);
begin
  inherited;
  frmCashierCollectionReport := nil;
  frmCashierCollectionReport.Free;
end;

function TfrmCashierCollectionReport.GetDataForCashierCollectionReport(
  ADate: TDateTime): TResultDataSet;
var
  arrParam: TArr;
  unitId: integer;
begin
  if not Assigned(ReportCashierSupv) then
    ReportCashierSupv := TReportCashierSupv.Create;

  unitId:= MasterNewUnit.ID;
  SetLength(arrParam, 2);
  arrParam[0].tipe := ptDateTime;
  arrParam[0].data := ADate;
  arrParam[1].tipe := ptInteger;
  arrParam[1].data := unitId;

  Result := ReportCashierSupv.GetDataForCashierCollectionReportByDate(arrParam);
end;

procedure TfrmCashierCollectionReport.SetParamList(
  const Value: TStringList);
begin
  FParamList := Value;
end;

procedure TfrmCashierCollectionReport.FormCreate(Sender: TObject);
begin
  inherited;
  ParamList := TStringList.Create;
end;

procedure TfrmCashierCollectionReport.actPrintCashierCollectionReportExecute(
  Sender: TObject);
begin
  inherited;
  ParamList.Clear;
  ParamList.Add(FLoginFullname);
  ParamList.Add(FormatDateTime('dd/mm/yyyy', dtTglTo.Date));
  ParamList.Add(MasterNewUnit.Nama );

  if not assigned(frmDialogPrintPreview) then
    frmDialogPrintPreview:= TfrmDialogPrintPreview.Create(Application);
    
  try
    with frmDialogPrintPreview do
    begin
      ListParams := ParamList;
      RecordSet  := GetDataForCashierCollectionReport(dtTglTo.Date);
      FilePath   := FFilePathReport + 'frCetakCashierCollectionReport.fr3';
      SetFormPropertyAndShowDialog(frmDialogPrintPreview);
    end;
  finally
    frmDialogPrintPreview.Free;
  end;
end;

procedure TfrmCashierCollectionReport.actSaveToFileExecute(
  Sender: TObject);
begin
  inherited;
  ParamList.Clear;
  ParamList.Add(FLoginFullname);
  ParamList.Add(FormatDateTime('dd/mm/yyyy', dtTglTo.Date));
  ParamList.Add(MasterNewUnit.Nama );

  with dmReport do
  begin
    Params := ParamList;
    frxDBDataset.DataSet := GetDataForCashierCollectionReport(dtTglTo.Date);
    pMainReport.LoadFromFile(ExtractFilePath(Application.ExeName) + '/template/frCetakCashierCollectionReport.fr3');
    pMainReport.PrepareReport;
    pMainReport.Export(frxeText);
  end;
end;

procedure TfrmCashierCollectionReport.FormShow(Sender: TObject);
begin
  inherited;
  dtTglTo.Date := Now;
end;

procedure TfrmCashierCollectionReport.btnPrintEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmCashierCollectionReport.btnPrintExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

end.
