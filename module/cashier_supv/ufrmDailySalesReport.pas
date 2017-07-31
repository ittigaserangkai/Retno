unit ufrmDailySalesReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, ActnList, uFormProperty,
  System.Actions, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, ufraFooter4Button, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC;

type
  TfrmDailySalesReport = class(TfrmMasterBrowse)
    procedure actExportExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
//    FParamList: TStringList;
//    function GetDataDSR(ADate: TDateTime): TResultDataSet;
//    procedure SetParamList(const Value: TStringList);
  public
    procedure RefreshData; override;
//    property ParamList: TStringList read FParamList write SetParamList;
  end;

var
  frmDailySalesReport: TfrmDailySalesReport;

implementation

uses uTSCommonDlg, udmReport;

{$R *.dfm}

procedure TfrmDailySalesReport.actExportExecute(Sender: TObject);
begin
  inherited;   {
  dlgSaveFile.InitialDir := ExtractFilePath(Application.ExeName);
  if dlgSaveFile.Execute then
  begin
    ParamList.Clear;
    ParamList.Add(FLoginFullname);
    ParamList.Add(FormatDateTime('dd/mm/yyyy', dtTglTo.Date));
    ParamList.Add(MasterNewunit.Nama);

    with dmReport do
    begin
      Params := ParamList;
      frxDBDataset.DataSet := GetDataDSR(dtTglTo.Date);
      pMainReport.LoadFromFile(ExtractFilePath(Application.ExeName) + '/template/frCetakDailySalesReport.fr3');
      pMainReport.PrepareReport;
  //    pMainReport.ShowReport;
  ////    frxDotMatrix.ExportObject(pMainReport);
  //    pMainReport.Export(frxDotMatrix);

      frxeText.PrintAfter := False;
      frxeText.ShowDialog := False;
      frxeText.OEMCodepage := True;
//      frxeText.FileName := ExtractFilePath(Application.ExeName) + '\DSR_' + FormatDateTime('yyyy-mm-dd', Now) + '.txt';
      if dlgSaveFile.FilterIndex = 1 then
        frxeText.FileName := dlgSaveFile.FileName + '.txt'
      else
        frxeText.FileName := dlgSaveFile.FileName;
      pMainReport.Export(frxeText);
    end;
  end;  }
end;

{ TfrmDailySalesReport }

//function TfrmDailySalesReport.GetDataDSR(ADate: TDateTime): TResultDataSet;
//var arrParam: TArr;
//begin
//  if not Assigned(ReportCashierSupv) then
//    ReportCashierSupv := TReportCashierSupv.Create;
//
//  SetLength(arrParam, 2);
//  arrParam[0].tipe := ptDateTime;
//  arrParam[0].data := ADate;
//  arrParam[1].tipe := ptInteger;
//  arrParam[1].data := 3; //ReportCashierSupv.GetDefaultUnitId;
//
//  Result := ReportCashierSupv.GetDSR(arrParam);
//end;

//procedure TfrmDailySalesReport.SetParamList(const Value: TStringList);
//begin
//  FParamList := Value;
//end;
//
procedure TfrmDailySalesReport.FormCreate(Sender: TObject);
begin
  inherited;
//  ParamList := TStringList.Create;
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
end;

procedure TfrmDailySalesReport.actPrintExecute(Sender: TObject);
var
  SaldoAwal : string;
  sSQL      : string;
  SS        : string;
begin
  inherited;
  {
  SaldoAwal := getGlobalVar('SALDOAWALDSR');

  if Trim(SaldoAwal) = '' then
  begin
    CommonDlg.ShowMessage('Saldo awal belum didefinisikan !'+ #13
                  + 'Nilai default saldo awal 30.000.000');
    SaldoAwal := '30000000'; //nilai default saldo awal 30.000.000
    with TSysParm.Create(Self) do
    begin
      try
        UpdateData('Nilai default saldo awal setiap transaksi', 'TRANSAKSI', 0,
                    'SALDOAWALDSR', '30000000');

        if not SaveToDB then
          cRollbackTrans
        else
          cCommitTrans;

      finally
        Free;
      end;
    end;
  end;
  sSQL:='';
  if FTipeApp = TSTORE then
  sSQL := 'select * from proc_tr$dsr(' + QuotD(dtTglTo.Date)
        + ',' + IntToStr(masternewunit.id) + ')'
  else
  Begin
      SS := 'select unt_id from aut$unit where unt_is_active=1';
      with cOpenQuery(ss) do
      begin
       while not Eof do
       begin
        if sSql <> '' then
        sSQL := sSQL + ' union ';

        sSQL := sSQL + 'select a.*,unt_name,unt_description,unt_phone,uti_address'
                     + ' from proc_tr$dsr(' + QuotD(dtTglTo.Date)
                     + ',' + IntToStr(Fields[0].AsInteger) + ') a , aut$unit b, unit_info c where unit=b.unt_id and unit=c.uti_unt_id';
        Next;
       end;
      end;
  end;
  frVariables.Variable['PERIODE'] := dtTglTo.Date;
  frVariables.Variable['SaldoAwal'] := StrToInt(SaldoAwal);
  dmReportNew.EksekusiReport('DailySalesReport',sSQL,'',True);
  }

end;

procedure TfrmDailySalesReport.FormShow(Sender: TObject);
begin
  inherited;
  dtAkhirFilter.Date := now;
end;

procedure TfrmDailySalesReport.RefreshData;
begin
  
end;

end.



