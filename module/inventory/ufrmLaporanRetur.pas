unit ufrmLaporanRetur;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, frxClass, frxDBSet,
  cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  cxButtonEdit, System.Actions, Vcl.ActnList, ufraFooter4Button, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC;

type
  TfrmLaporanRetur = class(TfrmMasterBrowse)
    lbl1: TLabel;
    edtNamaSuplier: TEdit;
    edKodeSuplier: TcxButtonEdit;
    dtFrom: TcxDateEdit;
    dtTo: TcxDateEdit;
    lbl2: TLabel;
    pnltengah: TPanel;
    lbl3: TLabel;
    chkAllSuplier: TCheckBox;
    dataset: TfrxDBDataset;
    btnShow: TcxButton;
    chkAllUnit: TCheckBox;
    procedure actPrintExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure edKodeSuplierClickBtn(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkAllSuplierClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure frftr5btn1btnUpdateClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure frftr5btn1btnAddClick(Sender: TObject);
    procedure frftr5btn1btnDeleteClick(Sender: TObject);
  private
    function GetSQLRetur(aHeader: string =''): string;
    procedure SetHeader;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLaporanRetur: TfrmLaporanRetur;

implementation

uses  udmReport, uAppUtils;

const
  _kolNO          : Integer = 0;
  _kolTglBukti    : Integer = 1;
  _kolNoBukti     : Integer = 2;
  _kolKodeSuplier : Integer = 3;
  _kolNamaSuplier : Integer = 4;
  _kolNominal     : Integer = 5;
  _kolPPN         : Integer = 6;
  _kolPPNBM       : Integer = 7;
  _kolTotal       : Integer = 8;
  _kolNilaiJual   : Integer = 9;
  _kolId          : Integer = 10;
  _kolUntId       : Integer = 11;
  _RowCount       : Integer = 2;
  _ColCount       : Integer = 10;
  _fixedRow       : Integer = 1;
  _fixedCol       : Integer = 1;




{$R *.dfm}

procedure TfrmLaporanRetur.actPrintExecute(Sender: TObject);
var
  sUnitName: string;
  sLoginFullName: string;
  sSQL: string;

begin
  inherited;


  if sLoginFullName = '' then sLoginFullName := 'LoginFullName';
  if sUnitName = '' then sUnitName := 'UnitName';


// sSQL := GetSQLRetur(GetCompanyHeader(sLoginFullName,sUnitName,cGetServerTime,
//        cGetServerTime));
// dmReportNew.EksekusiReport('Laporan_Retur_Supplier', sSQL, '',True);
end;

procedure TfrmLaporanRetur.actRefreshExecute(Sender: TObject);
var
  Total: Double;
  PPNBM: Double;
  PPN: Double;
  Nominal: Double;
  i: Integer;
  sSQL: string;
begin
  inherited;
  SetHeader;
  {
  sSQL  := GetSQLRetur;
  with cOpenQuery(sSQL) do
  begin
    try
      i := ColGrid.FixedRows;
      if not Eof then
      begin
        Last;
        ColGrid.RowCount := RecordCount + 1;
        First;
      end;

      while not Eof do
      begin
        Nominal := fieldByName('NOMINAL').AsFloat;
        PPN     :=  fieldByName('PPN').AsFloat;
        PPNBM   := fieldByName('PPNBM').AsFloat;
        Total   := Nominal + PPN + PPNBM;

        ColGrid.Cells[_kolNO, i]            := IntToStr(i);
        ColGrid.Cells[_kolTglBukti, i]      := fieldByName('RET_TGLBUKTI').AsString;
        ColGrid.Cells[_kolNoBukti, i]       := fieldByName('RET_NOBUKTI').AsString;
        ColGrid.Cells[_kolKodeSuplier, i]   := fieldByName('KODE_SUPLIER').AsString;
        ColGrid.Cells[_kolNamaSuplier, i]   := fieldByName('NAMA_SUPLIER').AsString;
        ColGrid.Floats[_kolNominal, i]      :=  (Nominal);
        ColGrid.Floats[_kolPPN, i]          :=  (PPN);
        ColGrid.Floats[_kolPPNBM, i]        :=  (PPNBM);
        ColGrid.Floats[_kolTotal, i]        :=  (Total);
        ColGrid.Floats[_kolNilaiJual, i]    :=  fieldByName('HargaJual').AsFloat;
        ColGrid.Cells[_kolId, i]            := fieldByName('ret_id').AsString;
        ColGrid.Cells[_kolUntId, i]         := fieldByName('ret_unt_id').AsString;

        Inc(i);
        Next;
      end;
    finally
      free;
    end;
  end;

  HapusBarisKosong(ColGrid, _kolKodeSuplier);
  ColGrid.AutoSizeColumns(True,5);
  }
end;
procedure TfrmLaporanRetur.edKodeSuplierClickBtn(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := 'select a.RET_SUP_CODE as "KODE SUPLIER", c.sup_name as "NAMA SUPLIER"'
      + ' from retur a'
      + ' inner join suplier c on a.RET_SUP_CODE = c.SUP_CODE'
      + ' and a.ret_unt_id = ' + IntToStr(masternewunit)
      + ' group by a.RET_SUP_CODE, c.sup_name';
  {
  with cLookUp('DAFTAR SUPLIER ', sSQL) do   
  begin
    try
      edKodeSuplier.Text  := Strings[0];
      edtNamaSuplier.Text := Strings[1];
      cClearGrid(ColGrid, False);
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmLaporanRetur.FormShow(Sender: TObject);
begin
  inherited;
  edKodeSuplier.Text := '';
//  dtFrom.Date := cGetServerTime;
//  dtTo.Date := cGetServerTime;

  if FMasterIsStore = 1 then     
    chkAllUnit.Visible := False
  else
    chkAllUnit.Visible := True;

  SetHeader;
end;

procedure TfrmLaporanRetur.chkAllSuplierClick(Sender: TObject);
begin
  inherited;

  if chkAllSuplier.Checked = True then
  begin
    edKodeSuplier.Enabled := False;
    edtNamaSuplier.Enabled := False;
  end
  else
  begin
    edKodeSuplier.Enabled := True;
    edtNamaSuplier.Enabled := True;
  end;

end;

procedure TfrmLaporanRetur.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmLaporanRetur:=nil;
  Action := caFree;
end;

function TfrmLaporanRetur.GetSQLRetur(aHeader: string =''): string;
var
  sOrderUnt: string;
  sThisUNit: string;
  sMerJoin: string;
  sTblMer: string;
  sDetil: string;
  sUnitJoin: string;
  sSltKolUnt: string;
  sTblUnit: string;
  sParmUnit: string;
  sFilterSupplier : string;
  sSQL            : string;
begin

  sFilterSupplier := '';
  if not chkAllSuplier.Checked then
  begin
    sFilterSupplier := ' and d.sup_code = ' + QuotedStr(edKodeSuplier.Text);
  end;

  if not chkAllUnit.Checked then
  begin
    sParmUnit := ' and b.ret_unt_id = ' + IntToStr(masternewunit);
  end
  else
  begin
    sTblUnit    := ', AUT$UNIT g ';
    sSltKolUnt  := ', g.UNT_CODE ';
    sOrderUnt   := ' UNT_CODE,';
    sUnitJoin   := ' and b.ret_unt_id = g.UNT_ID ';
  end;

  if aHeader <> '' then
  begin
//    if not chkAllUnit.Checked then
//      sThisUNit :=  QuotedStr(masternewunit) + ' as UNT_CODE,';

    sDetil    := ' ,a.RETD_POD_PO_NO, e.MERCHAN_CODE, e.MERCHAN_NAME,'
              + ' f.BHJ_SELL_PRICE_DISC, c.BRG_CODE, c.BRG_ALIAS';
    sTblMer   := ' ,REF$MERCHANDISE e';
    sMerJoin  := ' and c.BRG_MERCHAN_ID = e.MERCHAN_ID';
  end;


  sSQL := ' select '+ aHeader
          + sThisUNit
          + ' d.sup_code as "KODE_SUPLIER", d.sup_name as "NAMA_SUPLIER" , b.RET_NOBUKTI, b.RET_TGLBUKTI,'
          + ' SUM(a.retd_pod_qty_order * a.retd_pod_price) as "NOMINAL", '
          + ' SUM(a.retd_pod_ppn_persen * a.retd_pod_price * a.retd_pod_qty_order /100)'
          + ' as "PPN", SUM(a.retd_pod_ppnbm_persen * a.retd_pod_price * a.retd_pod_qty_order /100)'
          + ' as "PPNBM", retd_pod_qty_order'
          + sDetil
          + ' ,sum(f.BHJ_SELL_PRICE_DISC * a.RETD_POD_QTY_ORDER) as HargaJual'
          + ' ,b.ret_id, b.ret_unt_id'
          + sSltKolUnt
          + ' from retur_detil a, retur b,  suplier d, BARANG c,'
          + ' BARANG_HARGA_JUAL f'
          + sTblMer
          + sTblUnit
          + ' where b.ret_id = a.retd_ret_id '
          + ' and b.ret_unt_id = a.retd_ret_unt_id '
          + ' and b.RET_SUP_CODE = d.SUP_CODE'
          + ' and a.RETD_BRG_CODE = c.BRG_CODE'
          + sMerJoin
          + ' and c.BRG_CODE = f.BHJ_BRG_CODE'
          + ' and f.BHJ_TPHRG_ID = 2'
          + sUnitJoin
          + sParmUnit
          + ' and b.ret_tglbukti between ' + TAppUtils.QuotD(dtFrom.Date) + ' and ' + TAppUtils.QuotD(dtTo.Date, True)
          + sFilterSupplier
          + ' GROUP BY d.sup_code, d.sup_name,B.RET_NOBUKTI,B.RET_TGLBUKTI, retd_pod_qty_order'
          + sDetil
          + ' ,b.ret_id, b.ret_unt_id'
          + sSltKolUnt
          + ' order by '
          + sOrderUnt
          + ' B.RET_TGLBUKTI, B.RET_NOBUKTI, b.ret_unt_id';



  Result := sSQL;
end;

procedure TfrmLaporanRetur.SetHeader;
begin
  {with ColGrid do
  begin
    Clear;
    RowCount  := _RowCount;
    ColCount  := _ColCount;
    FixedRows := _fixedRow;
    FixedCols := _fixedCol;

    Cells[_kolNO, 0]          := 'NO';
    Cells[_kolTglBukti, 0]    := 'TGL BUKTI';
    Cells[_kolNoBukti, 0]     := 'NO. BUKTI';
    Cells[_kolKodeSuplier, 0] := 'KODE SUPLIER';
    Cells[_kolNamaSuplier, 0] := 'NAMA SUPLIER';
    Cells[_kolNominal, 0]     := 'NOMINAL';
    Cells[_kolPPN, 0]         := 'PPN';
    Cells[_kolPPNBM, 0]       := 'PPNBM';
    Cells[_kolTotal, 0]       := 'TOTAL';
    Cells[_kolNilaiJual, 0]   := 'NILAI JUAL';

  end;
  }
end;

procedure TfrmLaporanRetur.frftr5btn1btnUpdateClick(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  {
  if ColGrid.Cells[_kolId, ColGrid.Row] = '' then
    exit;

  sSQL := ' select c.BRG_CODE AS "PLU", c.BRG_ALIAS AS "NAMA", '
      + ' (a.retd_pod_qty_order * a.retd_pod_price) as "NOMINAL",'
      + ' (a.retd_pod_ppn_persen * a.retd_pod_price * a.retd_pod_qty_order /100)as "PPPN",'
      + ' (a.retd_pod_ppnbm_persen * a.retd_pod_price * a.retd_pod_qty_order /100)'
      + ' as "PPNBM",'
      + ' (f.BHJ_SELL_PRICE_DISC * a.RETD_POD_QTY_ORDER) as "HARGA JUAL" '
      + ' from retur_detil a'
      + ' inner join retur b on b.ret_id = a.retd_ret_id'
      + ' and b.ret_unt_id = a.retd_ret_unt_id'
      + ' and b.ret_id = '+ ColGrid.Cells[_kolId, ColGrid.Row]
      + ' and b.RET_UNT_ID = '+ ColGrid.Cells[_kolUntId, ColGrid.Row]
      + ' inner join BARANG c on a.RETD_BRG_CODE = c.BRG_CODE'
      + ' inner join BARANG_HARGA_JUAL f on c.BRG_CODE = f.BHJ_BRG_CODE'
      + ' and f.BHJ_TPHRG_ID = 2'
      + ' order by c.BRG_CODE';

    if not Assigned(frmPopupGrid) then
    frmPopupGrid  := TfrmPopupGrid.Create(Self);

  frmPopupGrid.Init(sSQL, 'TRANSAKSI RETUR '
                    + ColGrid.Cells[_kolNoBukti, ColGrid.Row]);
  frmPopupGrid.ShowModal;
   }
end;

procedure TfrmLaporanRetur.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
  if(Key = Ord('H'))and(ssctrl in Shift) then
    frftr5btn1btnAddClick(nil)
  else if(Key = Ord('D'))and(ssctrl in Shift) then
    frftr5btn1btnUpdateClick(nil)
  else if(Key = Ord('P'))and(ssctrl in Shift) then
    frftr5btn1btnDeleteClick(nil);


end;

procedure TfrmLaporanRetur.frftr5btn1btnAddClick(Sender: TObject);
var
  Total: Double;
  PPNBM: Double;
  PPN: Double;
  Nominal: Double;
  i: Integer;
  sSQL: string;
begin
  inherited;
  SetHeader;
  {
  sSQL  := GetSQLRetur;
  with cOpenQuery(sSQL) do
  begin
    try
      i := ColGrid.FixedRows;
      if not Eof then
      begin
        Last;
        ColGrid.RowCount := RecordCount + 1;
        First;
      end;

      while not Eof do
      begin
        Nominal := fieldByName('NOMINAL').AsFloat;
        PPN     :=  fieldByName('PPN').AsFloat;
        PPNBM   := fieldByName('PPNBM').AsFloat;
        Total   := Nominal + PPN + PPNBM;

        ColGrid.Cells[_kolNO, i]            := IntToStr(i);
        ColGrid.Cells[_kolTglBukti, i]      := fieldByName('RET_TGLBUKTI').AsString;
        ColGrid.Cells[_kolNoBukti, i]       := fieldByName('RET_NOBUKTI').AsString;
        ColGrid.Cells[_kolKodeSuplier, i]   := fieldByName('KODE_SUPLIER').AsString;
        ColGrid.Cells[_kolNamaSuplier, i]   := fieldByName('NAMA_SUPLIER').AsString;
        ColGrid.Floats[_kolNominal, i]      :=  (Nominal);
        ColGrid.Floats[_kolPPN, i]          :=  (PPN);
        ColGrid.Floats[_kolPPNBM, i]        :=  (PPNBM);
        ColGrid.Floats[_kolTotal, i]        :=  (Total);
        ColGrid.Floats[_kolNilaiJual, i]    :=  fieldByName('HargaJual').AsFloat;
        ColGrid.Cells[_kolId, i]            := fieldByName('ret_id').AsString;
        ColGrid.Cells[_kolUntId, i]         := fieldByName('ret_unt_id').AsString;

        Inc(i);
        Next;
      end;
    finally
      free;
    end;
  end;

  HapusBarisKosong(ColGrid, _kolKodeSuplier);
  ColGrid.AutoSizeColumns(True,5);
   }
end;

procedure TfrmLaporanRetur.frftr5btn1btnDeleteClick(Sender: TObject);
var
  sUnitName: string;
  sLoginFullName: string;
  sSQL: string;

begin
  inherited;


  if sLoginFullName = '' then sLoginFullName := 'LoginFullName';
  if sUnitName = '' then sUnitName := 'UnitName';


// sSQL := GetSQLRetur(GetCompanyHeader(sLoginFullName,sUnitName,cGetServerTime,
//        cGetServerTime));
// dmReportNew.EksekusiReport('Laporan_Retur_Supplier', sSQL, '',True);

end;

end.


