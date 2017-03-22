unit ufrmListQuotHB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmListQuotation, ActnList, StdCtrls, ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, Vcl.Menus,
  cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, System.Actions,
  ufraFooter4Button, cxLabel, cxButtonEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxButtons, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC;

type
  TfrmListQuotHB = class(TfrmListQuotation)
    procedure actPrintExecute(Sender: TObject);
    procedure btnShowListClick(Sender: TObject);
    procedure clgrdQuotListClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fraFooter5Button1btnCloseClick(Sender: TObject);
    procedure clgrdQuotListRowChanging(Sender: TObject; OldRow,
      NewRow: Integer; var Allow: Boolean);
    procedure FormShow(Sender: TObject);
    procedure clgrdDetailGetFloatFormat(Sender: TObject; ACol,
      ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
    procedure FormActivate(Sender: TObject);
    procedure dtTgl1KeyPress(Sender: TObject; var Key: Char);
    procedure dtTgl2KeyPress(Sender: TObject; var Key: Char);
    procedure btnShowListKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }

  procedure DoPrintListQuotationHB
  (sNoRef : String ; iUnitID : Integer;sLoginFulName: String; sUnitName : String);

  end;

var
  frmListQuotHB: TfrmListQuotHB;

implementation

uses  uRetnoUnit, uAppUtils;

const
  _kolDiscRp = 7;
  _kolHarga = 4;

{$R *.dfm}

procedure TfrmListQuotHB.actPrintExecute(Sender: TObject);
begin
  inherited;
  DoPrintListQuotationHB('',MasterNewUnit, FLoginFullname ,'MasterNewUnit.Nama');
end;

procedure TfrmListQuotHB.DoPrintListQuotationHB
(sNoRef : String ; iUnitID : Integer;sLoginFulName: String; sUnitName : String);
var
  sRefNo: string;
  sSQL1: string;
  sKodeSup1, sKodeSup2 : string;
begin
  sRefNo := sNoRef;
  sKodeSup1 := edtKodeSup1.Text;
  sKodeSup2 := edtKodeSup2.Text;

  sSql1 := 'SELECT '
         + ' Q.NoBukti, Q.TglBukti,Q.effectivedate,'
         + ' Q.Noref, S.Sup_code, S.sup_name, QD.newuom_code,'
         + ' QD.*, B.brg_alias, B.brg_code'
         + ' from tquotationhargabeli Q, suplier S,'
         + ' tquotationhargabeliitem QD, barang B'
         + ' where Q.newsupplier_kode = S.sup_code'
         + ' and Q.id = QD.header_id'
         + ' and Q.newunit_id = QD.HEADERUNIT_ID'
         + ' and QD.barang_kode = B.brg_code'
         + ' and Q.newunit_id = ' + IntToStr(iUnitID)
         + ' and Q.NEWSUPPLIER_KODE BETWEEN ' + QuotedStr(sKodeSup1)
         + ' and ' + QuotedStr(sKodeSup2)
         + ' and Q.TGLBUKTI BETWEEN ' + TAppUtils.QuotD(dtTgl1.Date)
         + ' and ' +  TAppUtils.QuotD(dtTgl2.Date, True)
         + ' order by Q.NoBukti';

//  dmReportNew.EksekusiReport('ListQuotationHB', sSQL1, '', True);
end;

procedure TfrmListQuotHB.btnShowListClick(Sender: TObject);
var
  sSql: string;
  iUnitID: Integer;
  sKodeSup2: string;
  sKodeSup1: string;
begin
  sKodeSup1 := edtKodeSup1.Text;
  sKodeSup2 := edtKodeSup2.Text;
  iUnitID   := MasterNewUnit;

  sSql := 'SELECT Q.NoBukti AS "No. Bukti", '
       + ' Q.TglBukti AS "Tgl. Bukti",'
       + ' Q.effectivedate AS "Effective Date",'
       + ' Q.Noref AS "No Reff",'
       + ' S.Sup_code AS "Suplier Code", '
       + ' S.sup_name AS "Suplier Name", '
       + ' Q.KETERANGAN AS "Remark" '
       + ' from tquotationhargabeli Q, suplier S '
       + ' where Q.newsupplier_kode = S.sup_code '
       + ' and Q.newunit_id = ' + IntToStr(iUnitID)
       + ' and Q.NEWSUPPLIER_KODE BETWEEN ' + QuotedStr(sKodeSup1)
       + ' and ' + QuotedStr(sKodeSup2)
       + ' and Q.TGLBUKTI BETWEEN ' + TAppUtils.QuotD(dtTgl1.Date)
       + ' and ' + TAppUtils.QuotD(dtTgl2.Date)
       + ' order by Q.NoBukti';

//  cQueryToGrid(sSQL,clgrdQuotList,True);
//  clgrdQuotList.AutoSizeColumns(True,8);
//  cClearGrid(clgrdDetail,False);
end;

procedure TfrmListQuotHB.clgrdQuotListClickCell(Sender: TObject; ARow,
  ACol: Integer);
var
  sSQL: string;
//  iUnitCode: Integer;
  sRefNo: string;
begin

//  sRefNo := clgrdQuotList.Cells[1,clgrdQuotList.Row];
//  iUnitCode := frmMain.UnitId;

  sSQL := 'select c.brg_code, c.brg_alias, b.harga, b.disc1,b.disc2,b.disc3,'
       + ' b.newuom_code'
       + ' from tquotationhargabeli a,tquotationhargabeliitem b,barang c'
       + ' where a.id = b.header_id'
       + ' and a.newunit_id = b.headerunit_id'
       + ' and a.nobukti = ' + QuotedStr(sRefNo)
       + ' and a.newunit_id = ' + IntToStr(MasterNewUnit)
       + ' and b.barang_kode = c.brg_code '
       + ' order by c.brg_code' ;

//  cQueryToGrid(sSQL,clgrdDetail,True);
//  clgrdDetail.AutoSizeColumns(True,8);
//  clgrdDetail.ColWidths[_kolHarga] := 100;
//  clgrdDetail.ColWidths[_kolDiscRp] := 100;
  
end;

procedure TfrmListQuotHB.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmListQuotHB := nil;
end;

procedure TfrmListQuotHB.fraFooter5Button1btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmListQuotHB.clgrdQuotListRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  {if clgrdQuotList.Cells[0, NewRow] <> '' then
  begin
    Allow:= True;
    clgrdQuotListClickCell(Self,clgrdQuotList.Col,clgrdQuotList.Row);
  end else
  begin
    Allow:= False;
    Exit;
  end;
  }
end;

procedure TfrmListQuotHB.FormShow(Sender: TObject);
begin
  inherited;
    lblHeader.Caption:= 'LISTING QUOTATION HARGA BELI';
    frmListQuotation.Caption:= 'Listing Quotation Harga Beli';
    dtTgl1.Date := Now;
    dtTgl2.Date := Now;
end;

procedure TfrmListQuotHB.clgrdDetailGetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  if ARow = 0 then Exit;

  FloatFormat:= '%.2n';
  case ACol of
    3 : IsFloat := False;
    4 :
    begin
      IsFloat := True;
    end;
    5..10: IsFloat := True;
  else
    IsFloat:= False;
  end;
end;

procedure TfrmListQuotHB.FormActivate(Sender: TObject);
begin
  inherited;
//  cClearGrid(clgrdQuotList,False);
//  cClearGrid(clgrdDetail,False);
end;

procedure TfrmListQuotHB.dtTgl1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmListQuotHB.dtTgl2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmListQuotHB.btnShowListKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Perform(WM_NEXTDLGCTL,0,0);
end;

end.
