unit ufrmListQuotMailer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmListQuotation, ActnList, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, Vcl.Menus,
  cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, IBX.IBCustomDataSet,
  IBX.IBQuery, System.Actions, ufraFooter4Button, cxLabel, cxButtonEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Vcl.StdCtrls, cxButtons,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls;

type
  TfrmListQuotMailer = class(TfrmListQuotation)
    procedure btnShowListClick(Sender: TObject);
    procedure fraFooter5Button1btnAddClick(Sender: TObject);
    procedure clgrdQuotListClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure clgrdDetailGetFloatFormat(Sender: TObject; ACol,
      ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
    procedure clgrdQuotListRowChanging(Sender: TObject; OldRow,
      NewRow: Integer; var Allow: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListQuotMailer: TfrmListQuotMailer;

implementation

uses udmReport, uRetnoUnit, uAppUtils;

const
  _kolMUPersen = 8;
  _kolHargaRata2 = 7;
  _kolHarga = 6;
  _kolHrgBarang = 7;
  _kolRefNo = 1;

{$R *.dfm}

procedure TfrmListQuotMailer.btnShowListClick(Sender: TObject);
var
  iUnitCode: Integer;
  sSQL: string;
begin
  iUnitCode := MasterNewUnit;

  sSQL := 'SELECT A.QUOT_REF_NO AS "Ref No",'
       + ' A.QUOT_DATE AS "Quot Date",'
       + ' A.QUOT_DATE_EFFECTIVE AS "Date Effective",'
       + ' A.QUOT_REMARK AS "Remark"'
       + ' FROM QUOTATION_PROMO A '
       + ' WHERE A.QUOT_DATE BETWEEN ' + TAppUtils.QuotD(dtTgl1.Date)
       + ' AND ' + TAppUtils.QuotD(dtTgl2.Date,True)
       + ' AND A.quot_unt_id = ' + IntToStr(iUnitCode)
       + ' ORDER BY A.QUOT_REF_NO ' ;

//  cQueryToGrid(sSQL,clgrdQuotList,True);
//  clgrdQuotList.AutoSizeColumns(True,8);
//  cClearGrid(clgrdDetail,False);

end;

procedure TfrmListQuotMailer.fraFooter5Button1btnAddClick(Sender: TObject);
var
  sSQL: string;
begin

//  sSQL := 'select '+ GetCompanyHeader(frmMain.LoginFullname, frmMain.UnitName, cGetServerTime, cGetServerTime )
//      + qryPrint.SQL.Text
//      + ' and q.QUOT_DATE between ' + QuotD(dtTgl1.Date)
//      + ' and ' + QuotD(dtTgl2.Date)
//      + ' and q.QUOT_UNT_ID = ' + IntToStr(frmMain.UnitId)
//      + ' order by q.quot_ref_no';
//
  sSQL := 'select '
       + ' q.quot_ref_no,q.quot_date,q.quot_date_effective,q.quot_end_date, '
       + ' q.quot_remark,s.sup_name,b.brg_code,b.brg_name,b.brg_alias,b.brg_code_purchase,'
       + ' b.brg_name,th.tphrg_name,rs.sat_code,qd.quotd_price,qd.quotd_harga_average,'
       + ' qd.quotd_mu_persen,qd.quotd_mu_rupiah,qd.quotd_mu_rupiah_plus_ppn,'
       + ' s.sup_code'
       + ' from quotation_promo q, quotationpromo_detil qd,barang b, suplier s,'
       + ' ref$tipe_harga th,ref$satuan rs'
       + ' where q.quot_id = qd.quotd_quot_id'
       + ' and q.quot_unt_id = qd.quotd_quot_unt_id'
       + ' and qd.quotd_brg_code = b.brg_code'
       + ' and qd.quotd_sup_code = s.sup_code'
       + ' and qd.quotd_tipe_harga_id = th.tphrg_id'
       + ' and qd.quotd_tipe_harga_unt_id = th.tphrg_unt_id'
       + ' and qd.quotd_sat_code = rs.sat_code'
       + ' and q.QUOT_DATE between ' + TAppUtils.QuotD(dtTgl1.Date) /// INI PAKE FILTER JAM MAS
       + ' and ' + TAppUtils.QuotD(dtTgl2.Date)
       + ' and q.QUOT_UNT_ID = ' + IntToStr(MasterNewUnit)
       + ' order by q.quot_ref_no';  /// INI PAKE FILTER JAM MAS JG

//  dmReportNew.EksekusiReport('ListQuotationMailer', sSQL, '', True);

end;

procedure TfrmListQuotMailer.clgrdQuotListClickCell(Sender: TObject; ARow,
  ACol: Integer);
var
  sSQL: string;
  sRefNo: string;
begin
//  sRefNo := clgrdQuotList.Cells[_kolRefNo,clgrdQuotList.Row];

  sSQL := 'select s.SUP_NAME as "Suplier",'
       + ' b.BRG_CODE_PURCHASE as "PLU Purchase",'
       + ' b.brg_code_purchase as "PLU",'
       + ' b.brg_alias as "Nama Barang",'
       + ' th.tphrg_name as "Tipe Harga",'
       + ' qd.QUOTD_PRICE as "Harga",'
       + ' qd.QUOTD_HARGA_AVERAGE as "Rata-rata",'
       + ' qd.QUOTD_MU_PERSEN as "Margin %"'
       + ' from quotation_promo q, quotationpromo_detil qd,barang b, suplier s,'
       + ' REF$TIPE_HARGA th'
       + ' where q.quot_id = qd.quotd_quot_id'
       + ' and q.quot_unt_id = qd.quotd_quot_unt_id'
       + ' and qd.quotd_brg_code = b.brg_code'
       + ' and qd.quotd_sup_code = s.sup_code'
       + ' and qd.QUOTD_TIPE_HARGA_ID = th.TPHRG_ID'
       + ' and qd.QUOTD_TIPE_HARGA_UNT_ID = th.TPHRG_UNT_ID'
       + ' and q.quot_ref_no = ' + QuotedStr(sRefNo)
       + ' and q.quot_unt_id = ' + IntToStr(MasterNewUnit) ;  /// INI FILTER UNITNYA KOK GA AD?

//  cQueryToGrid(sSQL,clgrdDetail,True);
//  clgrdDetail.AutoSizeColumns(True,8);
//  clgrdDetail.ColWidths[_kolHarga] := 100;
//  clgrdDetail.ColWidths[_kolHargaRata2] := 100;
//  clgrdDetail.ColWidths[_kolMUPersen] := 80;

end;

procedure TfrmListQuotMailer.clgrdDetailGetFloatFormat(Sender: TObject;
  ACol, ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  if ARow=0 then Exit;
  FloatFormat := '%0.2n';
  case ACol of
    0..5 : IsFloat := False;
    6..8 : IsFloat := True;
  end;
end;

procedure TfrmListQuotMailer.clgrdQuotListRowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
begin
  {
  if clgrdQuotList.Cells[0, NewRow] <> '' then
  begin
    Allow:= True;
    clgrdQuotListClickCell(Self,clgrdQuotList.Row,clgrdQuotList.Col);
  end else
  begin
    Allow:= False;
    Exit;
  end;
  }
end;

procedure TfrmListQuotMailer.FormDestroy(Sender: TObject);
begin
//  inherited;
   frmListQuotMailer := nil;
end;

procedure TfrmListQuotMailer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited;
    Action := caFree;
end;

end.
