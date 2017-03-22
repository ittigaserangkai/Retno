unit uFrmPODisp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxCurrencyEdit,
  System.Actions, Vcl.ActnList, ufraFooter4Button, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, cxPC;

type
  TfrmPODisp = class(TfrmMasterBrowse)
    pnleft: TPanel;
    pnPOHeader: TPanel;
    edPONo: TEdit;
    lb1: TLabel;
    lbl8: TLabel;
    edSuplierCode: TEdit;
    edSuplierName: TEdit;
    lb2: TLabel;
    dtTglPO: TcxDateEdit;
    lbl10: TLabel;
    edSubTotal: TcxCurrencyEdit;
    lbl12: TLabel;
    edDiscount: TcxCurrencyEdit;
    lbl13: TLabel;
    edPPN: TcxCurrencyEdit;
    lbl14: TLabel;
    edPPNBM: TcxCurrencyEdit;
    lbl11: TLabel;
    edTotalBeli: TcxCurrencyEdit;
    pnLisTop: TPanel;
    lblGenNum: TLabel;
    edGRUnitName: TEdit;
    edGRUnitKode: TEdit;
    lb4: TLabel;
    edGRAlamat: TEdit;
    lb5: TLabel;
    lb6: TLabel;
    chkPoGen: TCheckBox;
    chkPoNo: TCheckBox;
    edGEnNum: TEdit;
    cxgrdPONumber: TcxGrid;
    grdPONumber: TcxGridDBTableView;
    grdlvl1: TcxGridLevel;
    cxcolPONumber: TcxGridDBColumn;
    cxcolSupplier: TcxGridDBColumn;
    procedure actPrintExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edGEnNumExit(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure agPONumberListRowChanging(Sender: TObject; OldRow,
      NewRow: Integer; var Allow: Boolean);
    procedure edGEnNumKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkPoGenClick(Sender: TObject);
    procedure chkPoNoClick(Sender: TObject);
  private
//    fPO :TPO;
    iStartDynCol, iDynColCount : Integer;
    procedure clearPOUI;
    function GetSQLPoNoOrGenNo(aPoNo: string): string;
    procedure LoadUnit4Grid;
    procedure showPO(aRow:integer);
    procedure printSlipPO(aNoBukti : String ; aUnitID : Integer; ALoginFullName: String = ''; AUnitName: String = '');
    procedure SetParmChkFltrInp;
    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmPODisp: TfrmPODisp;
  iPOGENNum : Integer;

implementation

uses uTSCommonDlg, uConstanta;

const
  _Kol_x_Node : string = 'Kol_x_Node';
  _Kol_i_No : string = 'Kol_i_No';
  _Kol_i_RowType : string = 'Kol_i_RowType';
  _Kol_s_Sort : string = 'Kol_s_Sort';
  _Kol_s_TipeBrgPO : string = 'Kol_s_TipeBrgPO';
  _Kol_s_BrgKode : string = 'Kol_s_BrgKode';
  _Kol_s_BrgNama : string = 'Kol_s_BrgNama';
  _Kol_f_Harga : string = 'Kol_f_Harga';
  _Kol_s_Satuan : string = 'Kol_s_Satuan';
  _Kol_f_Disc1 : String = 'Kol_f_Disk1';
  _Kol_f_Disc2 : String = 'Kol_f_Disk2';
  _Kol_f_Disc3 : String = 'Kol_f_Disk3';
  _Kol_f_PPNPersen : String = 'Kol_f_PPNPersen';
  _Kol_f_PPNBMPersen : String = 'Kol_f_PPNBMPersen';
  _Kol_f_Unt_Qty_ : string = 'Kol_f_Unt_Qty_';
  _Kol_f_JmlQty : string = 'Kol_f_JmlQty';
  _Kol_f_JmlHrg : string = 'Kol_f_JmlHrg';
  _Kol_f_TotalHrg : String = 'Kol_f_TotalHrg';

  sSQL4Unit : string = 'select distinct UNT_ID, UNT_CODE from Aut$Unit order by UNT_ID';

{$R *.dfm}

procedure TfrmPODisp.actPrintExecute(Sender: TObject);
begin
  inherited;
//  printSlipPO(edPONo.Text, MasterNewUnit.ID, FLoginFullname, MasterNewUnit.Nama);
end;

procedure TfrmPODisp.actRefreshExecute(Sender: TObject);
var sSQL : String;
    i : Integer;
begin
  inherited;

  if iPOGENNum <=0 then
    Exit;

//  edGEnNum.Value := iPOGENNum;

  sSQL := 'select '+
          '  a.PO_NO, '+
          '  c.sup_name '+
          'from '+
          '  PO a '+
          '  left join SUPLIER_MERCHAN_GRUP b on (b.SUPMG_SUB_CODE=a.po_SUPMG_SUB_CODE ) '+
          '  left join suplier c on (c.SUP_CODE=b.supmg_code ) '+
          'where '+
          '  a.PO_gen_id = '+ IntToStr(iPOGENNum);
  {
  with cOpenQuery(sSQL) do
  begin
    if recordCount>0 then
    begin
      i:= agPONumberList.FixedRows;
      cClearGrid(agPONumberList, False);
      while not Eof do
      begin
        if agPONumberList.RowCount - agPONumberList.FixedRows < recordCount then
          agPONumberList.AddRow;

        agPONumberList.Cells[0,i] := fieldByName('PO_NO').AsString;
        agPONumberList.Cells[1,i] := fieldByName('sup_name').AsString;
        i:= i+1;
        Next;
      end;
      showPO(agPONumberList.FixedRows);
    end
    else
      CommonDlg.ShowMessage('Generate Nomer "'+IntToStr(iPOGENNum)+'" Tidak di temukan pada daftar PO');
  end;
  }
end;

procedure TfrmPODisp.LoadUnit4Grid;
var i, iTempCount: integer;
begin
  {
  cClearGrid(cxGridView,False);

  cxGridView.Columns[0].Name      := _Kol_x_Node;
  cxGridView.Columns[0].Header    := '';
  cxGridView.Columns[0].Width     := 0;
  cxGridView.MergeCells(0,0,1,2);

  iStartDynCol := 14;

  for i:= 1 to iStartDynCol-1 do
  begin
    with cxGridView.Columns.Add do
    case i of
    1 : begin
          Name      := _Kol_i_No;
          Header    := 'PO ITEMS';
          Alignment := taCenter;
          Width     := 35;
          cxGridView.Cells[Index,1] := 'No';
        end;
    2 : begin
          Name      := _Kol_i_RowType;
          Header    := '';
          Width     := 0;
        end;
    3 : begin
          Name      := _Kol_s_Sort;
          Header    := '';
          Width     := 0;
        end;
    4 : begin
          Name      := _Kol_s_TipeBrgPO;
          Header    := '';
          Alignment := taLeftJustify;
          ReadOnly  := True;
          Color     := clBtnFace;
          Width     := 100;
          cxGridView.Cells[Index,1] := 'PO Item Type';
        end;
    5 : begin
          Name      := _Kol_s_BrgKode;
          Header    := 'Kode Barang';
          Alignment := taLeftJustify;
          ReadOnly  := True;
          Width     := 70;
          cxGridView.Cells[Index,1] := 'PLU';
        end;
    6 : begin
          Name      := _Kol_s_BrgNama;
          Header    := 'Nama';
          Alignment := taLeftJustify;
          ReadOnly  := True;
          Color     := clBtnFace;
          Width     := 200;
          cxGridView.Cells[Index,1] := 'Nama Item';
        end;
    7 : begin
          Name      := _Kol_f_Harga;
          Header    := 'Harga';
          Alignment := taRightJustify;
          Width     := 100;
          ReadOnly  := True;
          Color     := clBtnFace;
          cxGridView.Cells[Index,1] := 'Harga';
        end;
    8 : begin
          Name      := _Kol_s_Satuan;
          Header    := 'Satuan';
          Alignment := taLeftJustify;
          Width     := 60;
          ReadOnly  := True;
          Color     := clBtnFace;
          cxGridView.Cells[Index,1] := 'UOM';
        end;
    9 : begin
          Name      := _Kol_f_Disc1;
          Header    := 'Disc1 %';
          Alignment := taLeftJustify;
          Width     := 80;
          ReadOnly  := True;
          Color     := clBtnFace;
          cxGridView.Cells[Index,1] := 'Disc1 %';
        end;
    10: begin
          Name      := _Kol_f_Disc2;
          Header    := 'Disc2 %';
          Alignment := taLeftJustify;
          Width     := 80;
          ReadOnly  := True;
          Color     := clBtnFace;
          cxGridView.Cells[Index,1] := 'Disc2 %';
        end;
    11: begin
          Name      := _Kol_f_Disc3;
          Header    := 'Disc3 Rp';
          Alignment := taLeftJustify;
          Width     := 80;
          ReadOnly  := True;
          Color     := clBtnFace;
          cxGridView.Cells[Index,1] := 'Disc3 Rp';
        end;
    12: begin
          Name      := _Kol_f_PPNPersen;
          Header    := 'PPN %';
          Alignment := taLeftJustify;
          Width     := 80;
          ReadOnly  := True;
          Color     := clBtnFace;
          cxGridView.Cells[Index,1] := 'PPN %';
        end;
    13: begin
          Name      := _Kol_f_PPNBMPersen;
          Header    := 'PPNBM %';
          Alignment := taLeftJustify;
          Width     := 80;
          ReadOnly  := True;
          Color     := clBtnFace;
          cxGridView.Cells[Index,1] := 'PPNBM %';
        end;

    end;
  end;
    cxGridView.MergeCells(1,0,iStartDynCol-1,1);

  iTempCount := 0;
  cxGridView.AddRow;

  with cOpenQuery(sSQL4Unit) do
  try

    while not EOF do
    begin
      iTempCount := iTempCount + 1;
      with cxGridView.Columns.Add do
      begin
        Name        := _Kol_f_Unt_Qty_+fieldByName('UNT_ID').AsString;
        Header      := fieldByName('UNT_CODE').AsString;
        Alignment   := taRightJustify;
        ReadOnly    := True;
        Color       := clYellow;
        Width       := 50;

        cxGridView.Cells[Index,1] := 'QTY';
      end;
      next;

    end;
  finally
    Free;
  end;
  iDynColCount := iTempCount;

  with cxGridView.Columns.Add do
  begin
    Name        := _Kol_f_JmlQty;
    Header      := 'Jumlah';
    Alignment   := taRightJustify;
    ReadOnly    := True;
    Color       := clBtnFace;
    Font.Style  := [fsBold];
    Width       := 70;

    cxGridView.Cells[Index,1] := 'QTY';
  end;

  with cxGridView.Columns.Add do
  begin
    Name        := _Kol_f_JmlHrg;
    Header      := 'Jumlah';
    Alignment   := taRightJustify;
    ReadOnly    := True;
    Color       := clBtnFace;
    Font.Style  := [fsBold];
    Width       := 120;

    cxGridView.Cells[Index,1] := 'Harga';
    cxGridView.MergeCells(Index-1,0,2,1);
    FloatFormat := '%0.2n';
    Editor      := edFloat;
  end;

  with cxGridView.Columns.Add do
  begin
    Name        := _Kol_f_TotalHrg;
    Header      := 'Jumlah';
    Alignment   := taRightJustify;
    ReadOnly    := True;
    Color       := clMoneyGreen;
    Font.Style  := [fsBold];
    Width       := 120;

    cxGridView.Cells[Index,1] := 'Total';
    FloatFormat := '%0.2n';
    Editor      := edFloat;
  end;

  cxGridView.AddRow;

  cxGridView.FixedRows := 2;
  cxGridView.FixedCols := 4;
  cxGridView.FixedFooters := 1;
  cxGridView.FloatingFooter.Visible := true;
  }
end;

procedure TfrmPODisp.FormShow(Sender: TObject);
begin
  inherited;
  actRefreshExecute(Self);
end;

procedure TfrmPODisp.FormDestroy(Sender: TObject);
begin
  inherited;
  frmPODisp := nil;
end;

procedure TfrmPODisp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmPODisp.edGEnNumExit(Sender: TObject);
begin
  inherited;
//  if iPOGENNum <> edGEnNum.Value then
//  begin
//    iPOGENNum := edGEnNum.Value;
//    btRefreshClick(edGEnNum);
//  end;
end;

procedure TfrmPODisp.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmPODisp.FormCreate(Sender: TObject);
begin
  inherited;
  LoadUnit4Grid;
//  fPO := TPO.Create(Self);
end;

procedure TfrmPODisp.agPONumberListRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);

begin
  inherited;
  showPO(NewRow);
end;

procedure TfrmPODisp.clearPOUI;
begin
  edPONo.Text         := '';
  dtTglPO.Date        := Now;
  edSuplierCode.Text  := '';
  edSuplierName.Text  := '';
  edSubTotal.Value    := 0;
  edDiscount.Value    := 0;
  edPPN.Value         := 0;
  edPPNBM.Value       := 0;
  edTotalBeli.Value   := 0;

//  cClearGrid(cxGridView, False);

end;

procedure TfrmPODisp.showPO(aRow:integer);
var iItems, iStores:Integer;
begin
  clearPOUI;
  {
  if fPO.LoadByNoBukti(agPONumberList.Cells[0, aRow], MasterNewUnit.ID) then
  begin
    with fPO do
    begin
      edPONo.Text         := NoBukti;
      dtTglPO.Date        := TglBukti;
      edSuplierCode.Text  := NewSupplierMerGroup.NewSupplier.Kode;
      edSuplierName.Text  := NewSupplierMerGroup.NewSupplier.Nama;
      edSubTotal.Value    := Total;
      edDiscount.Value    := Disc;
      edPPN.Value         := PPN;
      edPPNBM.Value       := PPNBM;
      edTotalBeli.Value   := Total-Disc+PPN+PPNBM;

      edGRUnitKode.Text   := GRUnit.Kode;
      edGRUnitName.Text   := GRUnit.Nama;
      edGRAlamat.Text     := GRAlamat;      

      for iItems:=0 to POItems.Count-1 do
      begin
        if cxGridView.RowCount-cxGridView.FixedRows-cxGridView.FixedFooters < POItems.Count then
          cxGridView.AddRow;
          
        cxGridView.Cells[cxGridView.ColumnByName[_Kol_s_TipeBrgPO].Index, iItems+cxGridView.FixedRows]    := POItems[iItems].Barang.GetTipeBarangName;
        cxGridView.Cells[cxGridView.ColumnByName[_Kol_s_BrgKode].Index, iItems+cxGridView.FixedRows]     := POItems[iItems].Barang.Kode;
        cxGridView.Cells[cxGridView.ColumnByName[_Kol_s_BrgNama].Index, iItems+cxGridView.FixedRows]     := POItems[iItems].Barang.Nama;
        cxGridView.Floats[cxGridView.ColumnByName[_Kol_f_Harga].Index, iItems+cxGridView.FixedRows]      := POItems[iItems].Price;
        cxGridView.Cells[cxGridView.ColumnByName[_Kol_s_Satuan].Index, iItems+cxGridView.FixedRows]      := POItems[iItems].SatCodeOrder.UOM;
        cxGridView.Floats[cxGridView.ColumnByName[_Kol_f_Disc1].Index, iItems+cxGridView.FixedRows]      := POItems[iItems].Disc1;
        cxGridView.Floats[cxGridView.ColumnByName[_Kol_f_Disc2].Index, iItems+cxGridView.FixedRows]      := POItems[iItems].Disc2;
        cxGridView.Floats[cxGridView.ColumnByName[_Kol_f_Disc3].Index, iItems+cxGridView.FixedRows]      := POItems[iItems].Disc3;
        cxGridView.Floats[cxGridView.ColumnByName[_Kol_f_PPNPersen].Index, iItems+cxGridView.FixedRows]  := POItems[iItems].PPNPersen;
        cxGridView.Floats[cxGridView.ColumnByName[_Kol_f_PPNBMPersen].Index, iItems+cxGridView.FixedRows]:= POItems[iItems].PPNBMPersen;

        for iStores := 0 to POItems[iItems].POStores.Count-1 do
        begin
          cxGridView.Floats[cxGridView.ColumnByName[_Kol_f_Unt_Qty_+IntToStr(POItems[iItems].POStores[iStores].POStoreUnitID)].Index, iItems+cxGridView.FixedRows] := POItems[iItems].POStores[iStores].QtyOrder;
        end;
        
        cxGridView.Floats[cxGridView.ColumnByName[_Kol_f_JmlQty].Index, iItems+cxGridView.FixedRows]     := POItems[iItems].QtyOrder;
        cxGridView.Floats[cxGridView.ColumnByName[_Kol_f_JmlHrg].Index, iItems+cxGridView.FixedRows]     := POItems[iItems].Total;
        cxGridView.Floats[cxGridView.ColumnByName[_Kol_f_TotalHrg].Index, iItems+cxGridView.FixedRows]   := POItems[iItems].TotalTemp;
      end;
    end;
  end;
  }
end;

procedure TfrmPODisp.printSlipPO(aNoBukti : String ; aUnitID : Integer; ALoginFullName:
    String = ''; AUnitName: String = '');
var
  sSQL2: string;
  sSQL: string;
begin
  if ALoginFullName = '' then ALoginFullName := 'LoginFullName';
  if AUnitName = '' then AUnitName := 'UnitName';
  {
  if not fPO.UpdateStatusPO(4,FLoginId, FLoginUnitId) then
  begin
    cRollbackTrans;
    CommonDlg.ShowMessage('Gagal Update Status PO Menjadi Ordered');
    Exit;
  end;

  sSQL := 'SELECT '
            + IntToStr(LEAD_TIME) + ' as LeadTime,'
            + ' a.PO_NO, a.PO_DATE, d.SUP_CODE, d.SUP_NAME, e.MERCHANGRUP_CODE, e.MERCHANGRUP_NAME, f.BRG_CODE, f.BRG_ALIAS, f.BRG_NAME, d.sup_address,'
            + ' d.sup_city, d.sup_post_code, d.sup_fax, d.sup_telp, c.supmg_top, f.brg_catalog, f.brg_merk, b.pod_sat_code_order, a.po_desc_print, a.PO_disc, '
            + ' a.PO_PPN,a.po_ppnbm ,d.SUP_CONTACT_PERSON, g.TPPERSH_CODE, '
            + '(SELECT SUM(POD_TOTAL_DISC) FROM PO_DETIL WHERE POD_IS_BKP = 0 AND POD_PO_NO = a.PO_NO) AS BTKP, '
            + '(SELECT SUM(POD_TOTAL_DISC) FROM PO_DETIL WHERE POD_IS_BKP = 1 AND POD_PO_NO = a.PO_NO) AS BKP, '
            + ' b.*'
            + ' FROM PO a, PO_DETIL b, SUPLIER_MERCHAN_GRUP c, SUPLIER d, ref$merchandise_grup e, barang f, REF$TIPE_PERUSAHAAN g'
            + ' where a.PO_NO = ' + Quot(aNoBukti)
            + ' and a.PO_UNT_ID = ' + IntToStr(aUnitID)
            + ' and a.PO_NO = b.POD_PO_NO'
            + ' and a.PO_UNT_ID = b.POD_UNT_ID'
            + ' and a.PO_SUPMG_SUB_CODE = c.SUPMG_SUB_CODE'
            + ' and c.SUPMG_CODE = d.SUP_CODE'
            + ' and c.SUPMG_MERCHANGRUP_ID = e.MERCHANGRUP_ID'
            + ' and b.POD_BRG_CODE = f.BRG_CODE'
            + ' and d.SUP_TPPERSH_ID = g.TPPERSH_ID'
            + ' order by a.PO_NO , f.BRG_CODE';

    sSQL2 := 'Select '
          + IntToStr(LEAD_TIME) + ' as LeadTime,'
          + ' b.POSTORE_UNT_ID, b.POSTORE_QTYORDER as POD_QTY_ORDER,'
          + ' a.POD_PRICE, POD_PPN, POD_PPNBM, au.UNT_ID '
          + ' , (a.POD_PRICE * a.POD_DISC1/ 100) as adisc1'
          + ' , ((a.POD_PRICE - (a.POD_PRICE * a.POD_DISC1/ 100)) * a.POD_DISC2 / 100)  as adisc2'
          + ' , a.POD_DISC3'
          + ' , ((a.POD_PRICE * a.POD_DISC1/ 100) + ((a.POD_PRICE - (a.POD_PRICE * a.POD_DISC1/ 100)) * a.POD_DISC2 / 100)  + a.POD_DISC3) as adiscTot'
          + ' ,c.PO_GR_ALAMAT,  au.UNT_NAME as GR_UNIT_NAME,  c.PO_NO, c.PO_DATE,'
          + ' e.SUP_CODE, e.SUP_NAME, f.MERCHANGRUP_CODE, f.MERCHANGRUP_NAME, g.BRG_CODE,'
          + ' g.BRG_NAME, e.sup_address, e.sup_city, e.sup_post_code, e.sup_fax,'
          + ' e.sup_telp, d.supmg_top, g.brg_catalog, g.brg_merk, a.pod_sat_code_order,'
          + ' c.po_desc_print, c.PO_disc,  c.PO_PPN, c.po_ppnbm ,e.SUP_CONTACT_PERSON,'
          + ' h.TPPERSH_CODE'
          + ' , (SELECT SUM((a1.POD_PRICE * a1.POD_DISC1/ 100) + ((a1.POD_PRICE - (a1.POD_PRICE * a1.POD_DISC1/ 100)) * a1.POD_DISC2 / 100)  + a1.POD_DISC3)'
          + ' FROM PO_DETIL a1 WHERE POD_IS_BKP = 0 AND POD_PO_NO = c.PO_NO) AS BTKP'
          + ' from PO_DETIL a'
          + ' inner join TPOSTORE b on a.POD_PO_NO = b.PO_NO'
          + ' and a.POD_ID = b.POD_ID'
          + ' and a.POD_UNT_ID = b.UNT_ID'
          + ' and a.POD_PO_NO = ' + Quot(aNoBukti)
          + ' inner join PO c on c.PO_NO = a.POD_PO_NO'
          + ' and c.PO_UNT_ID = a.POD_UNT_ID'
          + ' and c.PO_UNT_ID = ' + IntToStr(aUnitID)
          + ' inner join SUPLIER_MERCHAN_GRUP d on c.PO_SUPMG_SUB_CODE = d.SUPMG_SUB_CODE'
          + ' inner join SUPLIER e on d.SUPMG_CODE = e.SUP_CODE'
          + ' inner join ref$merchandise_grup f on d.SUPMG_MERCHANGRUP_ID = f.MERCHANGRUP_ID'
          + ' inner join barang g on a.POD_BRG_CODE = g.BRG_CODE'
          + ' inner join REF$TIPE_PERUSAHAAN h on  e.SUP_TPPERSH_ID = h.TPPERSH_ID'
          + ' inner join AUT$UNIT au on au.UNT_ID = b.POSTORE_UNT_ID'
         + ' order by au.UNT_ID, c.PO_NO, g.BRG_CODE' ;//c.po_date desc'; //b.POSTORE_UNT_ID, a.POD_BRG_CODE

    dmReportNew.EksekusiReport('frcetakPO_Fresh', sSQL, sSQL2,True);
   }
end;

procedure TfrmPODisp.edGEnNumKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sSql  : string;
  s     : string;
begin
  inherited;
  if Key= vk_return then
  begin
    if chkPoGen.Checked then
      TryStrToInt(edGEnNum.Text, iPOGENNum)
    else
    begin
      sSql := GetSQLPoNoOrGenNo(edGEnNum.Text);
      {with cOpenQuery(sSql) do
      begin
        try
          if not Eof then
          begin
            iPOGENNum := FieldByName('GENERATE_NO').AsInteger;
          end;
        finally
          Free;
        end;
      end;
      }
    end;
    actRefreshExecute(edGEnNum);
  end
  else if Key= VK_F5 then
  begin

      sSql := GetSQLPoNoOrGenNo('');

      if chkPoGen.Checked then
        s := 'PO Generate Number'
      else
        s := 'PO Number';
      {
      with cLookUp(s, sSql, 200, 1, true) do
      begin
        try
            if Strings[0] = '' then
              Exit;

            if chkPoGen.Checked then
                edGEnNum.Text := Strings[1]
            else
              edGEnNum.Text := Strings[0];

              iPOGENNum := StrToInt(Strings[1]);
              agPONumberList.SetFocus;
        finally
            Free;
        end

      end; }
  end;
end;

procedure TfrmPODisp.chkPoGenClick(Sender: TObject);
var
  aBol : Boolean;
begin
  inherited;

  aBol  := chkPoGen.Checked;

  chkPoNo.Checked   := not aBol;
  chkPoGen.Checked  := aBol;

  SetParmChkFltrInp;
end;

function TfrmPODisp.GetSQLPoNoOrGenNo(aPoNo: string): string;
var
  sSql: string;
begin
  sSql := 'select '+
          '  PO_NO as No_PO, '+
          '  po_gen_id GENERATE_NO, '+
          '  po_date TGL_PO, '+
          '  sp.sup_code KODE_SUP, '+
          '  sp.sup_name NAMA_SUP '+
          'from '+
          '  PO '+
          '  left join suplier_merchan_grup smg on (smg.supmg_sub_code=po.po_supmg_sub_code) '+
          '  left join suplier sp on (sp.sup_code=smg.supmg_code) '+
          'where '+
          '  po_unt_id='+IntToStr(MasterNewUnit);

  if aPoNo <> '' then
    sSql := sSql + ' and PO_NO = '+ QuotedStr(aPoNo);

  Result := sSql;
end;

procedure TfrmPODisp.chkPoNoClick(Sender: TObject);
var
  aBol : Boolean;
begin
  inherited;

  aBol  := chkPoNo.Checked;

  chkPoGen.Checked  := not aBol;
  chkPoNo.Checked   := aBol;

  SetParmChkFltrInp;
end;

procedure TfrmPODisp.SetParmChkFltrInp;
begin
  if chkPoGen.Checked then
    lblGenNum.Caption := 'PO Generate Number:'
  else
    lblGenNum.Caption := 'PO No:';
end;

end.
