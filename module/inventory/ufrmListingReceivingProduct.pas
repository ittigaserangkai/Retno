unit ufrmListingReceivingProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls, Grids, uConn,
  BaseGrid, AdvGrid, cbxbase, dblup1a, Mask, JvToolEdit, SUIButton,
  ActnList, EditBtn, AdvCGrid, DB, IBCustomDataSet, IBQuery;

type
  TfrmListingReceivingProduct = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    pnlTop: TPanel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    btnShowRP: TsuiButton;
    dtTglFrom: TJvDateEdit;
    dtTglTo: TJvDateEdit;
    actlst1: TActionList;
    actRefreshListingReceivingProduct: TAction;
    actPrintListingReceivingProduct: TAction;
    edtSupName: TEdit;
    lbl2: TLabel;
    edtSupAddress: TEdit;
    actPrintDetilListingReceivingProduct: TAction;
    edtSupCode: TEditBtn;
    chkSupplier: TCheckBox;
    qryShowRec: TIBQuery;
    btnPrintDetail: TButton;
    qryPrintDtl: TIBQuery;
    procedure edtSupCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnShowRPClick(Sender: TObject);
    procedure actPrintListingReceivingProductExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actPrintDetilListingReceivingProductExecute(Sender: TObject);
    procedure edtSupCodeClickBtn(Sender: TObject);
    procedure edtSupCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSupCodeKeyPress(Sender: TObject; var Key: Char);
    procedure chkSupplierClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
//    procedure btnPrintDetailClick(Sender: TObject);
    procedure dtTglFromKeyPress(Sender: TObject; var Key: Char);
    procedure dtTglToKeyPress(Sender: TObject; var Key: Char);
    procedure fraFooter5Button1btnAddClick(Sender: TObject);
    procedure fraFooter5Button1btnUpdateClick(Sender: TObject);
    procedure btnShowRPExit(Sender: TObject);
    procedure btnShowRPEnter(Sender: TObject);
  private
    { Private declarations }
  public
    procedure LoadDataSupplier(aKodeSuplier : String; aUnitID : Integer);
    { Public declarations }
  published
  end;

var
  frmListingReceivingProduct: TfrmListingReceivingProduct;

implementation

uses  suithemes, uCNDNGoodReceiving, udmReport,
  ufrmDialogPrintPreview, urmSUnit, unewsupplier, udmReportNew;

{$R *.dfm}

procedure TfrmListingReceivingProduct.edtSupCodeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F5 then
end;

procedure TfrmListingReceivingProduct.btnShowRPClick(Sender: TObject);
var
  sFilterSupplier: string;
  sSQL: string;
begin

  sFilterSupplier := '';
  if not chkSupplier.Checked then
    sFilterSupplier := ' and c.sup_code = ' + Quot(edtSupCode.Text)
  else sFilterSupplier := '' ;

//  sSQL := 'select distinct' + qryShowRec.SQL.Text
//      + ' and a.do_date between ' + QuotDTNol(dtTglFrom.Date)
//      + ' and ' + QuotD(dtTglTo.Date,True)
//      + sFilterSupplier
//      + ' and a.do_unt_id = ' + IntToStr(MasterNewUnit.ID) ;

  sSQL := 'select a.do_no as "DO No.",'
       + ' a.do_date as "DO Date",'
       + ' a.do_np as "DO NP",'
       + ' c.sup_code as "Suplier Code",'
       + ' c.sup_name as "Suplier Name",'
       + ' b.dod_brg_code as "Kode Barang",'
       + ' d.brg_alias as "Nama Barang",'
       + ' b.dod_qty_order_recv as "DOD Qty Order Receive",'
       + ' b.dod_disc1 as "DOD Disc1",'
       + ' b.dod_disc2 as "DOD Disc2",'
       + ' b.dod_disc3 as "DOD Disc3",'
       + ' b.dod_ppn_persen as "DOD PPn%",'
       + ' b.dod_ppnbm_persen as "PPn BM%"'
       + ' from dord a, do_detil b, suplier c, barang d'
       + ' where a.do_no = b.dod_do_no'
       + ' and a.do_unt_id = b.dod_do_unt_id'
       + ' and a.do_sup_code = c.sup_code'
       + ' and b.dod_brg_code = d.brg_code'
       + ' and a.do_date between ' + QuotDTNol(dtTglFrom.Date)
       + ' and ' + QuotD(dtTglTo.Date,True)
       + sFilterSupplier
       + ' and a.do_unt_id = ' + IntToStr(MasterNewUnit.ID) ;

end;

procedure TfrmListingReceivingProduct.actPrintListingReceivingProductExecute(
  Sender: TObject);
var
  sSupplierLap: string;
  sSQL: string;
  sFilterSupplier: string;
begin

  sFilterSupplier := '';
  sSupplierLap := 'Semua';
  if not chkSupplier.Checked then
  begin
    sFilterSupplier := ' and d.sup_code = ' + Quot(edtSupCode.Text);
    sSupplierLap    := edtSupCode.Text + ' ' + edtSupName.Text;

  end;

  Self.Enabled  := False;
  try
    sSQL := 'select ' + GetCompanyHeader(FLoginFullname, MasterNewUnit.Nama,dtTglFrom.Date, dtTglTo.Date)
            + Quot(sSupplierLap) + ' as FilterSupplier,'
            + ' a.do_no, a.do_date,d.sup_code, d.sup_name, c.brg_code, c.brg_alias,'
            + ' b.dod_sat_code_order as UOM,b.dod_qty_order_recv as Qty, b.dod_price as Harga,'
            + ' b.dod_disc1 as D1, (b.dod_price *  b.dod_disc1 * 0.01) as D1RP, '
            + ' b.dod_disc2 as D2,((b.dod_price - (b.dod_price *  b.dod_disc1 * 0.01)) * b.dod_disc2 * 0.01) as D2Rp,'
            + ' b.dod_disc3 as D3, b.dod_ppn_persen as PPN, '
            + ' b.dod_ppnbm_persen as PPNBM '
            + ' from dord a, do_detil b, barang c, suplier d'
            + ' where a.do_no = b.dod_do_no'
            + ' and a.do_unt_id = b.dod_do_unt_id'
            + ' and b.dod_brg_code = c.brg_code'
            + ' and a.do_sup_code = d.sup_code'
            + ' and a.do_date between ' + QuotDTNol(dtTglFrom.Date) + ' and ' + QuotD(dtTglTo.Date, True)
            + sFilterSupplier
            + ' order by a.do_no';

//    if Sender = fraFooter5Button1.btnAdd then
//      dmReportNew.EksekusiReport('ListingRecProd', sSQL,'',True)
//    else if Sender = fraFooter5Button1.btnUpdate then
//      dmReportNew.EksekusiReport('ListReceivingProductDetil', sSQL, '', True);

    if TsuiButton(Sender).Name = 'btnAdd' then
      dmReportNew.EksekusiReport('ListingRecProd', sSQL,'',True)
    else if TsuiButton(Sender).Name = 'btnUpdate' then
      dmReportNew.EksekusiReport('ListReceivingProductDetil', sSQL, '', True);

  finally
    Self.Enabled  := True;
  end;

end;

procedure TfrmListingReceivingProduct.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    Action:= caFree;
end;

procedure TfrmListingReceivingProduct.FormDestroy(Sender: TObject);
begin
  inherited;
    frmListingReceivingProduct:= nil;
end;

procedure TfrmListingReceivingProduct.FormShow(Sender: TObject);
begin
  inherited;
  dtTglFrom.Date:= cGetServerTime;
  dtTglTo.Date  := cGetServerTime;

  edtSupCode.Text := '';
end;

procedure TfrmListingReceivingProduct.actPrintDetilListingReceivingProductExecute(
  Sender: TObject);
var
  sFilterSupplier: string;
  sSQL: string;
//  ParamList: TStringList;
begin

  sFilterSupplier := '';
  if not chkSupplier.Checked then
    sFilterSupplier := ' and dord.do_sup_code = ' + Quot(edtSupCode.Text)
  else sFilterSupplier := '' ;



  sSQL :=  'SELECT ' + GetCompanyHeader(FLoginFullname,MasterNewUnit.Nama,dtTglFrom.Date,dtTglTo.Date)
        + ' mer.merchan_code,mer.merchan_name,dord.date_create,'
        + ' extractdate(po.po_date) as po_date,dord.do_np, dord.do_no,'
        + ' dord.do_po_no,sup.sup_code,rtp.tppersh_code,sup.sup_name as sup_name,'
        + ' dord.do_so_no, so.so_date,brg.brg_code,brg.brg_alias,'
        + ' dod.dod_qty_order,dod.dod_qty_order_recv,dod.dod_price,dod.dod_total,'
        + ' dod.dod_ppn,dod.dod_ppnbm,dod.dod_total_tax,dod.dod_sat_code_order,'
        + ' dod.dod_disc1,dod.dod_disc2,dod.dod_disc3,dod.dod_ppn_persen,dod.dod_ppnbm_persen'
        + ' from dord dord left join do_detil dod on dord.do_no=dod.dod_do_no'
        + ' and dord.do_unt_id=dod.dod_do_unt_id'
        + ' left join barang brg on dod.dod_brg_code=brg.brg_code'
        + ' left join po on dord.do_po_no=po.po_no'
        + ' and dord.do_po_unt_id=po.po_unt_id'
        + ' left join so on po.po_so_no=so.so_no'
        + ' and po.po_so_unt_id=so.so_unt_id'
        + ' left join ref$merchandise_grup mg on dord.do_merchangrup_id=mg.merchangrup_id'
        + ' left join ref$merchandise mer on mg.merchangrup_merchan_id=mer.merchan_id'
        + ' left join suplier sup on dord.do_sup_code=sup.sup_code'
        + ' left join ref$tipe_perusahaan rtp on sup.sup_tppersh_id = rtp.tppersh_id'
        + ' WHERE DORD.DO_DATE BETWEEN ' + QuotD(dtTglFrom.Date)
        + ' and ' + QuotD(dtTglTo.Date)
        + sFilterSupplier
        + ' and dord.do_unt_id = ' + IntToStr(MasterNewUnit.ID)
        + ' order by dord.do_no' ;
end;

procedure TfrmListingReceivingProduct.edtSupCodeClickBtn(Sender: TObject);
var
  sSQL: string;
begin
  sSQL := 'select sup_code as Kode, sup_name as Nama, sup_address as Alamat from suplier';
  with cLookUp('Daftar Supplier', sSQL) do
  begin
    try
      if Strings[0] = '' then
        Exit;
      LoadDataSupplier(Strings[0], MasterNewUnit.ID);
    finally
      Free;
    end;
  end;
end;

procedure TfrmListingReceivingProduct.LoadDataSupplier(aKodeSuplier : String;
    aUnitID : Integer);
begin
  with TNewSupplier.Create(Self) do
  begin
    try
      if LoadByKode(aKodeSuplier, aUnitID) then
      begin
        edtSupName.Text     := Nama;
        edtSupAddress.Text  := Alamat;
        edtSupCode.Text     := Kode;
      end else begin
        edtSupName.Text     := '';
        edtSupAddress.Text  := '';
        edtSupCode.Text     := '';
      end;
    finally
      Free;
    end;

  end;
end;

procedure TfrmListingReceivingProduct.edtSupCodeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F5 then           //DULUNYA ENTER
  begin
    LoadDataSupplier(edtSupCode.Text, MasterNewUnit.ID);
    fraFooter5Button1.SetFocus;
  end;
end;

procedure TfrmListingReceivingProduct.edtSupCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

procedure TfrmListingReceivingProduct.chkSupplierClick(Sender: TObject);
begin
  if chkSupplier.Checked then
  begin
    edtSupCode.Text := '';
    edtSupName.Text := '';
    edtSupCode.Enabled := False;
  end
  else
  begin
    edtSupCode.Text := '';
    edtSupName.Text := '';
    edtSupCode.Enabled := True;
    edtSupCode.SetFocus;
  end;

end;

procedure TfrmListingReceivingProduct.btnUpdateClick(Sender: TObject);
var
  sSQL: string;
begin
//
  sSQL := 'SELECT' + GetCompanyHeader(FLoginFullname, MasterNewUnit.Nama, dtTglFrom.Date, dtTglTo.Date)
      + 'MER.MERCHAN_CODE, MER.MERCHAN_NAME, DORD.DATE_CREATE, EXTRACTDATE(PO.PO_DATE) AS PO_DATE, DORD.DO_NP, DORD.DO_NO,' + #13#10 +
      'DORD.DO_PO_NO, SUP.SUP_CODE, RTP.TPPERSH_CODE || '' '' || SUP.SUP_NAME AS SUP_NAME, DORD.DO_SO_NO, SO.SO_DATE,' + #13#10 +
      'BRG.BRG_CODE, BRG.BRG_ALIAS, DOD.DOD_QTY_ORDER, DOD.DOD_QTY_ORDER_RECV,' + #13#10 +
      'DOD.DOD_PRICE, DOD.DOD_TOTAL, DOD.DOD_PPN, DOD.DOD_PPNBM, DOD.DOD_TOTAL_TAX,' + #13#10 +
      'DOD.DOD_SAT_CODE_ORDER' + #13#10 +
    'FROM DORD DORD' + #13#10 +
    'LEFT JOIN DO_DETIL DOD ON DORD.DO_NO=DOD.DOD_DO_NO' + #13#10 +
        'AND DORD.DO_UNT_ID=DOD.DOD_DO_UNT_ID' + #13#10 +
    'LEFT JOIN BARANG BRG ON DOD.DOD_BRG_CODE=BRG.BRG_CODE' + #13#10 +
    'LEFT JOIN PO ON DORD.DO_PO_NO=PO.PO_NO' + #13#10 +
        'AND DORD.DO_PO_UNT_ID=PO.PO_UNT_ID' + #13#10 +
    'LEFT JOIN SO ON PO.PO_SO_NO=SO.SO_NO' + #13#10 +
        'AND PO.PO_SO_UNT_ID=SO.SO_UNT_ID' + #13#10 +
    'LEFT JOIN REF$MERCHANDISE_GRUP MG ON DORD.DO_MERCHANGRUP_ID=MG.MERCHANGRUP_ID' + #13#10 +
    'LEFT JOIN REF$MERCHANDISE MER ON MG.MERCHANGRUP_MERCHAN_ID=MER.MERCHAN_ID' + #13#10 +
    'LEFT JOIN SUPLIER SUP ON DORD.DO_SUP_CODE=SUP.SUP_CODE' + #13#10 +
    'LEFT JOIN REF$TIPE_PERUSAHAAN RTP ON SUP.SUP_TPPERSH_ID = RTP.TPPERSH_ID ' + #13#10 +
    'WHERE (DORD.DO_DATE BETWEEN ' + QuotD(dtTglFrom.Date ) + ' AND ' + QuotD(dtTglTo.Date) + #13#10 +
        'AND DORD.DO_SUP_CODE LIKE ' + Quot('%' + edtSupCode.Text + '%') + #13#10 +
        'AND DORD.DO_UNT_ID = ' + IntToStr(MasterNewUnit.ID) + #13#10 + ')' +
    'ORDER BY' + #13#10 +
        'MER.MERCHAN_CODE, MER.MERCHAN_NAME, DORD.DO_PO_NO, DORD.DATE_CREATE, SUP.SUP_CODE, BRG.BRG_CODE';

    ShowReport('ListReceivingProductDetil',sSQL, '', True);
end;


procedure TfrmListingReceivingProduct.dtTglFromKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmListingReceivingProduct.dtTglToKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmListingReceivingProduct.fraFooter5Button1btnAddClick(
  Sender: TObject);
begin
  inherited;
  actPrintListingReceivingProductExecute(Sender) ;
end;

procedure TfrmListingReceivingProduct.fraFooter5Button1btnUpdateClick(
  Sender: TObject);
begin
  inherited;
  actPrintListingReceivingProductExecute(Sender) ;
end;

procedure TfrmListingReceivingProduct.btnShowRPExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmListingReceivingProduct.btnShowRPEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

end.
