unit ufrmDailySalesReport;

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
  TfrmDailySalesReport = class(TfrmMasterReport)
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    cxlvMaster: TcxGridLevel;
    dtEnd: TcxDateEdit;
    dtStart: TcxDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    procedure actPrintExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  end;

var
  frmDailySalesReport: TfrmDailySalesReport;

implementation

{$R *.dfm}

uses uDMClient, uDMReport, uDXUtils, DateUtils;

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

  with DMReport do
  begin
    AddReportVariable('UserCetak', 'USER');
    AddReportVariable('DateStart', FormatDateTime('dd/MM/yyyy', dtStart.Date));
    AddReportVariable('DateEnd', FormatDateTime('dd/MM/yyyy', dtEnd.Date));
    ExecuteReport('Reports\DSR', ReportClient.DSR_GetDS(dtStart.Date, dtEnd.Date),[]);
  end;
end;

procedure TfrmDailySalesReport.FormCreate(Sender: TObject);
begin
  inherited;
  dtStart.Date := Now();
  dtEnd.Date := Now();
end;

end.
