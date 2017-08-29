unit udmReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Math, frxDesgn, frxClass, frxDBSet,
  frxPreview, Vcl.ComCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus, dxBarBuiltInMenu,
  Datasnap.DBClient, frxExportCSV, System.Actions, Vcl.ActnList, frxDMPExport,
  frxExportText, frxExportHTML, frxExportPDF, frxExportMail, frxExportXLS,
  dxStatusBar, cxPC, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxButtons,
  cxGroupBox, Data.DB, Datasnap.DSClientRest, Datasnap.DSProxyRest,
  Data.FireDACJSONReflect, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uClientClasses,
  uDMClient, FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin;

type
  TDMReport = class(TForm)
    TePanel1: TcxGroupBox;
    bCetak: TcxButton;
    bTutup: TcxButton;
    btnExportAs: TcxButton;
    bDesign: TcxButton;
    cbFileType: TcxComboBox;
    btnPrev: TcxButton;
    btnNext: TcxButton;
    btnZoomOut: TcxButton;
    btnZoomIn: TcxButton;
    btnFind: TcxButton;
    cbZoom: TcxComboBox;
    btnFastPrint: TcxButton;
    pgcReport: TcxPageControl;
    tsDotMatrix: TcxTabSheet;
    frxPreview2: TfrxPreview;
    tsGraphic: TcxTabSheet;
    frxPreview1: TfrxPreview;
    pnStatusBar: TdxStatusBar;
    frxReport1: TfrxReport;
    frxReport2: TfrxReport;
    IBQ1: TfrxDBDataset;
    IBQ2: TfrxDBDataset;
    exExcel: TfrxXLSExport;
    exEmail: TfrxMailExport;
    exPDF: TfrxPDFExport;
    exHTML: TfrxHTMLExport;
    exText: TfrxSimpleTextExport;
    frxDMexport: TfrxDotMatrixExport;
    actList: TActionList;
    actPrintClose: TAction;
    actPrintDlg: TAction;
    actSwitchTab: TAction;
    actClose: TAction;
    exCSV: TfrxCSVExport;
    FDMemTable1: TFDMemTable;
    FDMemTable2: TFDMemTable;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    procedure actCloseExecute(Sender: TObject);
    procedure actPrintCloseExecute(Sender: TObject);
    procedure actPrintDlgExecute(Sender: TObject);
    procedure actSwitchTabExecute(Sender: TObject);
    procedure bDesignClick(Sender: TObject);
    procedure btnExportAsClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPrevClick(Sender: TObject);
    procedure btnZoomInClick(Sender: TObject);
    procedure btnZoomOutClick(Sender: TObject);
    procedure cbZoomPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta:
        Integer; MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos:
        TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos:
        TPoint; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure frxPreview1PageChanged(Sender: TfrxPreview; PageNo: Integer);
    procedure frxPreview2PageChanged(Sender: TfrxPreview; PageNo: Integer);
    procedure pgcReportChange(Sender: TObject);
    procedure pgcReportClick(Sender: TObject);
    procedure pnStatusBarClick(Sender: TObject);
    procedure TePanel1Click(Sender: TObject);
  private
    FBisaDesignReport: Boolean;
    FRealName: string;
    FReportClient: TDSReportClient;
    FReportName: string;
    FReportPath: string;
    FTanggalCetak: string;
    { Private declarations }
//    FTextReportFile: string;
    FUserName: string;
    function FocusedPreview: TfrxPreview;
    function FocusedReport: TfrxReport;
    function GetReportClient: TDSReportClient;
    procedure PrintReport(WithDialog: Boolean);
    procedure SetCBZoom;
    procedure SetReportPath(const Value: string);
  public
    procedure AddReportVariable(AVariableName: String; AVariableValue: String);
    procedure ExecuteReport(aReportName: String; aListDataset: TFDJSONDataSets);
        overload;
    function IsBisaDesignReport: Boolean;
    property BisaDesignReport: Boolean read FBisaDesignReport write
        FBisaDesignReport;
    property RealName: string read FRealName write FRealName;
    property ReportClient: TDSReportClient read GetReportClient write FReportClient;
    property ReportPath: string read FReportPath write SetReportPath;
    property TanggalCetak: string read FTanggalCetak write FTanggalCetak;
    property UserName: string read FUserName write FUserName;
    { Public declarations }
  end;


var
  DMReport: TDMReport;

implementation

uses
  uAppUtils, Data.SqlExpr, System.StrUtils;


{$R *.dfm}

procedure TDMReport.actCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TDMReport.actPrintCloseExecute(Sender: TObject);
begin
  PrintReport(False);
  Close;
end;

procedure TDMReport.actPrintDlgExecute(Sender: TObject);
begin
  PrintReport(True);
end;

procedure TDMReport.actSwitchTabExecute(Sender: TObject);
begin
  If pgcReport.ActivePage = tsDotMatrix then
    pgcReport.ActivePage := tsGraphic
  else
    pgcReport.ActivePage := tsDotMatrix
end;

procedure TDMReport.AddReportVariable(AVariableName: String; AVariableValue:
    String);
begin
  frxGlobalVariables[AVariableName] := AVariableValue;
end;

procedure TDMReport.bDesignClick(Sender: TObject);
begin
  If not IsBisaDesignReport then
  begin
    TAppUtils.Warning('Anda tidak memiliki hak untuk design report');
    Exit;
  end;

  FocusedReport.DesignReport;
  FocusedReport.PrepareReport;
end;

procedure TDMReport.btnExportAsClick(Sender: TObject);
begin
  case cbFileType.ItemIndex of
    0 : FocusedReport.Export(exText);
    1 : FocusedReport.Export(exExcel);
    2 : FocusedReport.Export(exPDF);
    3 : FocusedReport.Export(exHTML);
    4 : FocusedReport.Export(exEmail);
  end;
  FocusedReport.ShowReport;
end;

procedure TDMReport.btnFindClick(Sender: TObject);
begin
  FocusedPreview.Find;
end;

procedure TDMReport.btnNextClick(Sender: TObject);
begin
  FocusedPreview.Next;
end;

procedure TDMReport.btnPrevClick(Sender: TObject);
begin
  FocusedPreview.Prior;
end;

procedure TDMReport.btnZoomInClick(Sender: TObject);
begin
  FocusedPreview.Zoom :=  FocusedPreview.Zoom + 0.25;
  SetCBZoom;
end;

procedure TDMReport.btnZoomOutClick(Sender: TObject);
begin
  FocusedPreview.Zoom :=  FocusedPreview.Zoom - 0.25;
  SetCBZoom;
end;

procedure TDMReport.cbZoomPropertiesChange(Sender: TObject);
var
  lFac: Double;
begin
  TryStrToFloat(StringReplace(cbZoom.Text , '%', '', [rfReplaceAll]), lFac);
  If lFac > 0 then
    FocusedPreview.Zoom := (lFac/100);
end;

procedure TDMReport.ExecuteReport(aReportName: String; aListDataset:
    TFDJSONDataSets);
var
  sTextReportFile: string;
//  sSQL: string;
  sReportFile: string;
  AisTextReport : Boolean;
  dsCount: Integer;
//  FilterState1, FilterState2 : -> kalau besuk butuh filtering , smntara tutup sik
  Filter1, Filter2 : String;
  lCDS: TClientDataSet;
begin
  frxPreview1.Clear;
  frxPreview2.Clear;
//
//  Filter1 := '';
//  Filter2 := '';

  FReportName := aReportName;
  sReportFile := Self.ReportPath + FReportName + '.fr3';
  sTextReportFile := Self.ReportPath + FReportName + '_txt.fr3';

  //tambahakan variabel report disini, sementara hardcoded dulu
  frxGlobalVariables['COMP'] := 'Goro Assalaam';

  frxGlobalVariables['USERNAME']    := UserName;
  frxGlobalVariables['REALNAME']    := RealName;
  frxGlobalVariables['TGLCETAK']    := FormatDateTime('yyyy/mm/dd hh:mm:ss',Now());

  dsCount := TFDJSONDataSetsReader.GetListCount(aListDataset);

  if dsCount = 0 then
    Raise Exception.Create('Empty Dataset');

  FDMemTable1.Close;
  FDMemTable2.Close;


  FDMemTable1.AppendData(TFDJSONDataSetsReader.GetListValue(aListDataSet, 0));
  FDMemTable1.Open;

  if dsCount > 1 then   //sementara 2 dataset dulu gan..
  begin
    FDMemTable2.AppendData(TFDJSONDataSetsReader.GetListValue(aListDataSet, 1));
    FDMemTable2.Open;
  end;

  frxReport1.FileName := sReportFile;
  frxReport2.FileName := sTextReportFile;

  //override true
  if FileExists(sTextReportFile) then
    AisTextReport := True
  else
    AisTextReport := False;

  frxReport1.DataSets.Clear;
  if (not frxReport1.LoadFromFile(sReportFile)) and (not AisTextReport) then
  begin
    If frxReport1.DataSets.Count=0 then
      frxReport1.DataSets.Add(Self.ibq1);
    frxReport2.ShowReport;
    pgcReport.ActivePage := tsDotMatrix;
    ShowModal;
//    frxReport1.DesignReport;
  end else begin
    frxReport2.LoadFromFile(frxReport2.FileName);

    If frxReport1.DataSets.Count=0 then
      frxReport1.DataSets.Add(Self.ibq1);

    frxReport1.PrepareReport;
    frxReport2.PrepareReport;
    frxReport1.ShowReport;
    frxReport2.ShowReport;
    if AisTextReport then
      pgcReport.ActivePage := tsDotMatrix
    else
      pgcReport.ActivePage := tsGraphic;
    ShowModal;
  end;
end;

function TDMReport.FocusedPreview: TfrxPreview;
begin
  if pgcReport.ActivePage = tsDotMatrix then
    Result := frxPreview2
  else
    Result := frxPreview1;
end;

function TDMReport.FocusedReport: TfrxReport;
begin
  if pgcReport.ActivePage = tsDotMatrix then
    Result := frxReport2
  else
    Result := frxReport1;
end;

procedure TDMReport.FormCreate(Sender: TObject);
begin
  BisaDesignReport := True;
  ReportPath := TAppUtils.GetAppPath;
end;

procedure TDMReport.FormMouseWheel(Sender: TObject; Shift: TShiftState;
    WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  FocusedPreview.MouseWheelScroll(WheelDelta);
end;

procedure TDMReport.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
    MousePos: TPoint; var Handled: Boolean);
begin
  if ssCtrl in Shift then
  begin
    FocusedPreview.Zoom :=  FocusedPreview.Zoom - 0.1;
    SetCBZoom;
  end;
end;

procedure TDMReport.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
    MousePos: TPoint; var Handled: Boolean);
begin
  if ssCtrl in Shift then
  begin
    FocusedPreview.Zoom :=  FocusedPreview.Zoom + 0.1;
    SetCBZoom;
  end;
end;

procedure TDMReport.FormShow(Sender: TObject);
begin
  FocusedPreview.SetFocus;
end;

procedure TDMReport.frxPreview1PageChanged(Sender: TfrxPreview; PageNo:
    Integer);
begin
  If FocusedPreview = Sender then
    pnStatusBar.Panels[0].Text := 'Page ' +  Inttostr(PageNo) + ' of '
                          + Inttostr(Sender.PageCount) + '   ';
end;

procedure TDMReport.frxPreview2PageChanged(Sender: TfrxPreview; PageNo:
    Integer);
begin
  If FocusedPreview = Sender then
    pnStatusBar.Panels[0].Text := 'Page ' + Inttostr(PageNo) + ' of '
                          + Inttostr(Sender.PageCount) + '   ';

end;

function TDMReport.GetReportClient: TDSReportClient;
begin
  if not Assigned(FReportClient) then
    FReportClient := TDSReportClient.Create(DMClient.RestConn, False);
  Result := FReportClient;
end;

function TDMReport.IsBisaDesignReport: Boolean;
begin
  Result := True;
//  Result := gv.HasAuthority('designreport');
end;

procedure TDMReport.pgcReportChange(Sender: TObject);
begin
  //FocusedPreview.SetFocus;
end;

procedure TDMReport.pgcReportClick(Sender: TObject);
begin
  FocusedPreview.SetFocus;
end;

procedure TDMReport.pnStatusBarClick(Sender: TObject);
begin
  FocusedPreview.SetFocus;
end;

procedure TDMReport.PrintReport(WithDialog: Boolean);
begin
  FocusedReport.PrintOptions.ShowDialog := WithDialog;
  frxDMexport.ShowDialog := WithDialog;
  If FocusedReport = frxReport1 then
    FocusedReport.Print
  else
    FocusedReport.Export(frxDMexport);

  FocusedReport.ShowReport;
end;

procedure TDMReport.SetCBZoom;
var
  lChange: TNotifyEvent;
begin
  lChange := cbZoom.Properties.OnChange;
  cbZoom.Properties.OnChange := nil;

  cbZoom.Text := FloatToStr(FocusedPreview.Zoom * 100) + '%';
  cbZoom.Properties.OnChange := lChange;

end;

procedure TDMReport.SetReportPath(const Value: string);
begin
  FReportPath := Value;
  if RightStr(FReportPath,1) <> '\' then
  begin
    FReportPath := FReportPath + '\';
  end;
end;

procedure TDMReport.TePanel1Click(Sender: TObject);
begin
  FocusedPreview.SetFocus;
end;

end.








