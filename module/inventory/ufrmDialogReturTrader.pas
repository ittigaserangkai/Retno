unit ufrmDialogReturTrader;

interface

uses
  Windows, SysUtils, Variants, Classes, Controls, Forms, ufrmMasterDialogBrowse,
  ExtCtrls, DateUtils, Mask, jpeg, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, cxLabel, cxButtons,
  cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit, cxButtonEdit,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.StdCtrls;

type
  TfrmDialogReturTrader = class(TfrmMasterDialogBrowse)
    pnl1: TPanel;
    edtKodeTrader: TcxButtonEdit;
    edtTradername: TEdit;
    dtTanggal: TcxDateEdit;
    edtketerangan: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    pnl3: TPanel;
    Barang: TLabel;
    Satuan: TLabel;
    edtKodeBarang: TcxButtonEdit;
    edtNamaBarang: TEdit;
    edtsatuan: TcxButtonEdit;
    edtNamaSatuan: TEdit;
    lblAddRow: TcxLabel;
    edtNoBukti: TEdit;
    lblRemoveRow: TcxLabel;
    btnRandom: TcxButton;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblAddRowClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lblRemoveRowClick(Sender: TObject);
    procedure strgGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNoBuktiKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridCellValidate(Sender: TObject; ACol, ARow: Integer;
      var Value: String; var Valid: Boolean);
    procedure ListOfValues(Sender:TObject);
    procedure edtKodeTraderExit(Sender: TObject);
    procedure edtKodeBarangExit(Sender: TObject);
    procedure edtsatuanExit(Sender: TObject);
    procedure edtKodeTraderClickBtn(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtsuplierKeyPress(Sender: TObject; var Key: Char);
    procedure edtKodeTraderKeyPress(Sender: TObject; var Key: Char);
    procedure btnRandomClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FDateTime: TDateTime;
    { Private declarations }
    FIDRetur         : Integer;
//    FNewRetur        : TReturTRADER;
//    FnewDoTRADER    : TDO_TRADER;
    FWaiting: Boolean;

    function getBarisKosong: Integer;
//    procedure getCompareDetil;
//    function getKonversiUOM(aKodeBarang:String;aUnitID:Integer;aUOM:String): Double;

    procedure InisialisasiForm;
    function InProcessing: Boolean;
    function IsBisaLanjut: Boolean;
    procedure SetDataBarangDanUOM(aBaris, aBarang: Integer; aUOM: String);
    procedure SetDataHargaDanQty(aBaris : Integer; aHarga : Double; aQty : Double);
    procedure SetDataHeader(aRetur: Integer);
    procedure SetDataPajak(aBaris : Integer; aPPNPersen : Double; aPPNBMPersen :
        Double);
    procedure SetDataDO(aBaris, aDOItem: Integer);
    procedure SetDataReturItem(aRetur: Integer);
    procedure SetSuplier(aBarang: string; aUnitID, aRow: Integer);
    procedure SimpanRetur(aReturTRADER: Integer);
//    property IDRetur: Integer read GetIDRetur write SetIDRetur;
  public
    function GetIDRetur: Integer;
    function IsCekDataItemBisaLanjut: Boolean;
    procedure SetIDRetur(const Value: Integer);
    { Public declarations }
  end;

var
  frmDialogReturTrader: TfrmDialogReturTrader;


implementation

uses udmReport,  uRetnoUnit, Math, uTSCommonDlg;

const
{
NO
Barang
Nama
Kode Suplier
UOM
QTY
DO
POID
Harga
ppnBMPErsen
PPNPErsen
ID
UOmDod
TotRet
}
_KolNo          :Integer = 0;
_KolBarang      :Integer = 1;
_KolNama        :Integer = 2;
_KolSupCode     :Integer = 3;
_KolUOM         :Integer = 4;
_Kolqty         :Integer = 5;
_KolPO          :Integer = 6;
_KolPODID       :Integer = 7;
_KolHarga       :Integer = 8;
_KolPPNBMPersen :Integer = 9;
_KolPPNPersen   :Integer = 10;
_KolID          :Integer = 11;
_kolUomDod      :Integer = 12;
_kolTotRet      :Integer = 13;


{$R *.dfm}

procedure TfrmDialogReturTrader.actDeleteExecute(Sender: TObject);
begin
  inherited;
   {
  if CommonDlg.Confirm('Anda Yakin Akan Menghapus Data') = mrYes then
  try
    if FNewRetur.RemoveFromDB then
    begin
      cCommitTrans;
      CommonDlg.ShowMessage('Berhasil Simpan Data');
      FormShow(nil);
    end else begin
      cRollbackTrans;
      CommonDlg.ShowError('Gagal Simpan Data');

    end;
  finally

  end;
  }
end;

procedure TfrmDialogReturTrader.actSaveExecute(Sender: TObject);
var

  i: Integer;
begin
  inherited;

  if InProcessing then
    exit;
  {
  FWaiting:= True;
  try
    HapusBarisKosong(strgGrid, _Kolqty);
    if not IsBisaLanjut then
      Exit;

    FNewRetur.UpdateData(FIDRetur,
                          edtketerangan.Text,
                          DialogUnit,
                          edtNoBukti.Text,
                          0,
                          edtKodeTrader.Text,
                          DialogUnit,
                          dtTanggal.Date
                );

    FNewRetur.NewReturTRADERItems.Clear;
    FNewRetur.BarangStockSirkulasiItems.Clear;

    for i := strgGrid.FixedRows to strgGrid.RowCount - 1 do
    begin
      if strgGrid.Cells[_Kolbarang,i] <> '' then
      begin
        FNewRetur.UpdateNewReturTRADERItems(strgGrid.Columns[_Kolbarang].Rows[i],
                                              DialogUnit,
                                              strgGrid.Columns[_kolHarga].Floats[i],
                                              strgGrid.Columns[_KolID].Ints[i],
                                              strgGrid.Columns[_KolPODID].Ints[i],
                                              strgGrid.Columns[_KolPPNBMPersen].Floats[i],
                                              strgGrid.Columns[_KolPPNPersen].Floats[i],
                                              strgGrid.Columns[_Kolqty].Floats[i],
                                              strgGrid.Columns[_Koluom].Rows[i],
                                              DialogUnit,
                                              DialogUnit,
                                              DialogUnit);


        FNewRetur.UpdateBarangStockSirkulasi(
              'Retur TRADER',
              strgGrid.Columns[_Kolbarang].Rows[i],
              DialogUnit,
              DialogUnit,
              strgGrid.Columns[_Koluom].Rows[i],
              edtNoBukti.Text,
              1 * strgGrid.Columns[_Kolqty].Floats[i],
              dtTanggal.Date,
              DialogUnit,
              0,
              GetHargaAVG(strgGrid.Columns[_Kolbarang].Rows[i], strgGrid.Columns[_KolUom].Rows[i], DialogUnit));
      end;
    end;

    SimpanRetur(FNewRetur);
  finally
    FWaiting:= False;
  end;
   }
end;

procedure TfrmDialogReturTrader.FormShow(Sender: TObject);
begin
  inherited;
  {
  FDateTime:= cGetServerTime;

  if GetIDRetur = 0 then
  begin
    InisialisasiForm;
  end
  else
  begin
    edtKodeBarang.Text := '';
    edtsatuan.Text := '';

    if FNewRetur.LoadByID(GetIDRetur,dialogunit) then
    begin
      SetDataHeader(FNewRetur);  
      SetDataReturItem(FNewRetur);
    end;
  end;
  }
end;

function TfrmDialogReturTrader.getBarisKosong: Integer;
var
  i: Integer;
begin
  Result := 0;
  {
  for i := 0 to strgGrid.RowCount - 1  do
  begin
    if strgGrid.Cells[_KolNama, i] = '' then
    begin
      Result := i;
      Exit;
    end;
  end;

  if Result = 0 then
  begin
    strgGrid.AddRow;
    Result := strgGrid.RowCount - 1;
  end;
  }
end;


procedure TfrmDialogReturTrader.lblAddRowClick(Sender: TObject);
var
  iBaris: Integer;
  i: Integer;
begin
  inherited;
  {
  // validasi jika entrian belum valid untuk kuantitas dan nomor po
  iBaris := strgGrid.RowCount-1;
  if (strgGrid.RowCount > 0) and (strgGrid.Cells[_KolBarang,iBaris]<>'') and
     ((strgGrid.Cells[_Kolqty,iBaris]='') or (strgGrid.Cells[_Kolqty,iBaris]='0') or
      (strgGrid.Cells[_KolPO,iBaris]='') or
      (strgGrid.Cells[_KolHarga,iBaris]='') or (strgGrid.Cells[_KolHarga,iBaris]='0')
     ) then
  begin
    CommonDlg.ShowMessage('Kode Barang : '+strgGrid.Cells[_KolBarang,iBaris]
                + ', Kuantitas atau Nomor DO masih kosong ... Mohon diisi'
                + ' terlebih dahulu sebelum tambah Kode Barang lagi');

    ClearByTag(Self,[1]);
    strgGrid.Row := iBaris;

    if (strgGrid.Cells[_Kolqty,iBaris]='') or (strgGrid.Cells[_Kolqty,iBaris]='0') then
       strgGrid.Col := _Kolqty
    else
       strgGrid.Col := _KolPO;

    strgGrid.SetFocus;
    Exit;
  end;
  if (Trim(edtKodeBarang.Text) = '') or (Trim(edtNamaBarang.Text) = '') then
  begin
    CommonDlg.ShowMessage('Kode Barang Masih Kosong');
    Exit;
  end;

  iBaris := getBarisKosong;
  if iBaris = 0 then
  begin
    strgGrid.AddRow;
    iBaris := strgGrid.RowCount - 1;
  end;

  for i:= 0 to strgGrid.RowCount - 1 do
  begin
    if (strgGrid.Cells[_KolBarang,i] = edtKodeBarang.Text) then
       // and (strgGrid.Cells[_koluom,i] = edtsatuan.Text))  then
    begin
      CommonDlg.ShowError('Data Barang dengan Kode ' + edtKodeBarang.Text+ ' Sudah Ada ');
      HapusBarisKosong(strgGrid, _KolBarang);
      Exit;
    end;
  end;

  strgGrid.Cells[_KolNo,iBaris]     := IntToStr(iBaris);
  strgGrid.Cells[_kolBarang,iBaris] := edtKodeBarang.Text;
  strgGrid.Cells[_kolNama,iBaris]   := edtNamaBarang.Text;
  strgGrid.Cells[_Koluom,iBaris]    := edtsatuan.Text;
  strgGrid.Cells[_Kolqty,iBaris]    := '0';
  strgGrid.Cells[_KolID,iBaris]     := '0';

  ClearByTag(Self,[1]);
  strgGrid.Row := iBaris;
  strgGrid.Col := _Kolqty;
  strgGrid.SetFocus;
  }
end;

procedure TfrmDialogReturTrader.FormCreate(Sender: TObject);
begin
  inherited;
  {
  FNewRetur := TReturTRADER.Create(Self);
  FnewDoTRADER := TDO_TRADER.Create(Self);
  }
end;

procedure TfrmDialogReturTrader.lblRemoveRowClick(Sender: TObject);
var iBaris:integer;
begin
  inherited;
  {  if strgGrid.RowCount <= 2 then
    begin
      iBaris:=strgGrid.Row;
      strgGrid.AddRow;
      strgGrid.Rows[iBaris].Clear;
      strgGrid.RemoveRows(ibaris,1);
    end
    else
    begin
      strgGrid.Rows[strgGrid.Row].Clear;
      strgGrid.RemoveSelectedRows;
    end;
    }
end;

procedure TfrmDialogReturTrader.strgGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var iBaris:integer;
begin
  inherited;
  {
  case key of

  Ord('R'):if (ssCtrl in Shift) then lblRemoveRowClick(Sender);
  VK_DOWN  :begin
              if (strgGrid.RowCount > 1) and (strgGrid.Cells[_KolBarang,strgGrid.row ]<>'') and
                 ((strgGrid.Cells[_Kolqty,strgGrid.row]='') or (strgGrid.Cells[_Kolqty,strgGrid.row]='0') or
                  (strgGrid.Cells[_KolPO,strgGrid.row]='') or
                  (strgGrid.Cells[_KolHarga,strgGrid.row]='') or (strgGrid.Cells[_KolHarga,strgGrid.row]='0')
                 ) then
              begin
                CommonDlg.ShowMessage('Kode Barang : '+strgGrid.Cells[_KolBarang,strgGrid.row]
                        +', Kuantitas atau Nomor DO masih kosong ... Mohon'
                        +' diisi terlebih dahulu sebelum tambah Kode Barang lagi');

                ClearByTag(Self,[1]);
                if (strgGrid.Cells[_Kolqty,strgGrid.row]='') or (strgGrid.Cells[_Kolqty,strgGrid.row]='0') then
                   strgGrid.Col := _Kolqty
                else
                   strgGrid.Col := _KolPO;
                strgGrid.SetFocus;
                Exit;
              end;
              if strgGrid.Row >= strgGrid.RowCount-1 then
              begin
                iBaris := getBarisKosong;
                if iBaris = 0 then
                begin
                  strgGrid.AddRow;
                  strgGrid.col:=1;
                end;
              end;
            end;

  end;
  }
end;

procedure TfrmDialogReturTrader.edtNoBuktiKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
end;

// penekanan tombol di Key Down
procedure TfrmDialogReturTrader.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  {
  case Key of
  VK_RETURN:begin
              if ActiveControl.ClassType = TAdvColumnGrid then
              begin
                 if strgGrid.Col < _KolPO then
                   strgGrid.Col := strgGrid.Col + 1
                 else
                   strgGrid.Col := 1;

              end
              else if (ssCtrl in Shift) then
              begin
                footerDialogMasterbtnSaveClick(self);
              end
              else if (ActiveControl.ClassType <> TcxLabel) then
                 SelectNext(ActiveControl,true,true);
              end;
  VK_F5:    begin
              ListOfValues(ActiveControl);
              Exit;
            end;
  Ord('T'):if (ssCtrl in Shift) then
           begin
              if ActiveControl.ClassType = TAdvColumnGrid then
              begin
                strgGrid.AddRow;
                strgGrid.Col := _KolBarang;
                strgGrid.Row := strgGrid.RowCount - 1;
              end;
           end;

  VK_ESCAPE: begin
               Close;
             end;

  end;
  }
end;

procedure TfrmDialogReturTrader.strgGridCellValidate(Sender: TObject; ACol,
  ARow: Integer; var Value: String; var Valid: Boolean);
var sSQL : string;
    i:integer;
    totqty,totret : Double;
    dQty,dKonversi,dHarga:double;

begin
  inherited;
  {
  if ACol = _KolBarang then
  begin
    if Value='' then Exit;

    if Length(Value)<igProd_Code_Length then
    begin
      Value := StrPadLeft(Value,igProd_Code_Length,'0');
    end;
    begin
      sSQL := ' select distinct a.doasd_brg_code, d.BRG_ALIAS, e.BRGSUP_SUP_CODE'
              + ' from do_TRADER_detil a,do_TRADER b,trader c, barang d'
              + ', BARANG_SUPLIER e'
              + ' where'
              + ' a.doasd_doas_no = b.doas_no'
              + ' and a.doasd_doas_unt_id = b.doas_unt_id'
              + ' and b.doas_trd_id = c.trd_id'
              + ' and b.doas_trd_unt_id = c.trd_unt_id'
              + ' and a.doasd_brg_code = d.brg_code'
              + ' and a.doasd_brg_unt_id = d.brg_unt_id'
              + ' and e.BRGSUP_BRG_CODE = d.BRG_CODE'
              + ' and e.BRGSUP_BRG_UNT_ID = d.BRG_UNT_ID'
              + ' and e.BRGSUP_IS_PRIMARY = 1'
              + ' and trd_code = ' + Quot(edtKodeTrader.Text)
              + ' and a.doasd_brg_code = ' + Quot(value)
              + ' and a.DOASD_UNT_ID = '+ IntToStr(DialogUnit);

      with cOpenQuery(sSQL) do
      begin
        if IsEmpty then
        begin
          CommonDlg.ShowMessage('Kode Barang tidak terdaftar di master produk/'
                              +' belum ada di DO  / Pastikan Barang Bisa Diretur');
          strgGrid.ClearSelectedCells;
          valid:=False;
          strgGrid.EditorMode := True;
          exit;
        end;
        for i:= strgGrid.FixedRows to strgGrid.RowCount - 1 do
        begin
          if (strgGrid.Cells[_KolBarang,i] = Value) and (i<>arow) then
          begin
            CommonDlg.ShowError('Data Barang dengan Kode ' + value+ ' Sudah Ada ');
            strgGrid.ClearSelectedCells;
            valid:=False;
            strgGrid.EditorMode := True;
            exit;
          end;
        end;

        strgGrid.Cells[_KolNo,ARow]   := IntToStr(arow);
        strgGrid.Cells[_kolNama,ARow] := Fields[1].AsString;

        strgGrid.Cells[_KolSupCode, strgGrid.Row] := Fields[2].AsString;

        strgGrid.Cells[_Koluom,ARow]  := '';
        strgGrid.Cells[_Kolqty,ARow]  := '0';
        strgGrid.Cells[_KolID,ARow]   := '0';

        ClearByTag(Self,[1]);
        strgGrid.Col := _KolNama;
      end;
    end;
  end
  else if ACol = _KolUOM then
  begin
    sSQL := 'select a.KONVSAT_SAT_CODE_FROM as " Kode_Satuan", b.SAT_NAME as "Nama Satuan" '
            + ' from REF$KONVERSI_SATUAN a, REF$SATUAN b '
            + ' where a.KONVSAT_SAT_CODE_FROM = ' + Quot(strgGrid.Cells[_kolUOM,ARow])
            + ' and a.KONVSAT_BRG_CODE = ' + Quot(strgGrid.Cells[_kolbarang,ARow])
            + ' and a.KONVSAT_BRG_UNT_ID = ' + IntToStr(dialogunit)
            + ' and b.SAT_CODE = a.KONVSAT_SAT_CODE_FROM '
            + ' and b.SAT_UNT_ID = a.KONVSAT_SCF_UNT_ID ';

      with cOpenQuery(sSQL) do
      begin
        if IsEmpty then
        begin
          CommonDlg.ShowMessage('Kode Satuan/UOM tidak terdaftar ... Check kembali');
          valid:=False;
          strgGrid.ClearSelectedCells;
          strgGrid.EditorMode := True;
          exit;
        end
        else
        begin
          strgGrid.Cells[_Koluom,ARow] := Fields[0].AsString;
          strgGrid.Cells[_KolPO,ARow] := '';
        end;
      end;
  end
  else if ACol = _Kolqty then
  begin
    if not TryStrToFloat(strgGrid.Cells[_Kolqty,ARow],dQty) or (dQty <=0)  then
    begin
      CommonDlg.ShowMessage('Format Angka salah ... & '+slinebreak+
                            'atau Qty tidak boleh <= 0 atau Qty Return > Qty stock');
      valid:=False;
      strgGrid.ClearSelectedCells;
      strgGrid.EditorMode := True;
      exit;
    end;
     strgGrid.Cells[_KolPO,ARow] := '';
  end
  else if ACol = _KolPO then
  begin
    sSQL := ' select a.doas_no as "Do Nomor", doasd_brg_code as "Kode Barang",'
          + ' b.doasd_id as "Dod Id", b.doasd_sat_code as "Satuan",'
          + ' b.doasd_sell_PRICE_disc as "Harga",b.doasd_qty_receipt "QTY Rec" ,'
          + ' b.doasd_qty_receipt-b.doasd_retur_ass "QTY Yg Bisa di Retur" ,'
          + ' b.doasd_retur_ass "Pernah di Retur" ,'
          + ' doas_date "Tgl Do" ,b.doasd_ppn'
          + ' from do_TRADER a, do_TRADER_detil b, trader c'
          + ' where c.trd_code = ' + Quot(edtKodeTrader.Text)
          + ' and c.trd_unt_id = ' + IntToStr(dialogunit)
          + ' and b.doasD_doas_NO = a.doas_no'
          + ' and b.doasd_doas_unt_id = a.doas_unt_id  and c.trd_id = a.doas_trd_id'
          + ' and c.trd_unt_id = a.doas_trd_unt_id  '
          + ' and b.doasd_brg_code = ' + Quot(strgGrid.Cells[_kolBarang,strgGrid.Row])
          + ' and b.doasd_brg_unt_id = ' + IntToStr(dialogunit)
          + ' and a.doas_NO= '+Quot(strgGrid.Cells[_KolPo,strgGrid.Row])
          + ' and b.doasd_qty_receipt-b.doasd_retur_ass > 0';
      with cOpenQuery(sSQL) do
      begin
        try
          if IsEmpty then
          begin
            CommonDlg.ShowMessage('Nomor DO tidak terdaftar ... Silakan dicheck kembali');
            valid:=False;
            strgGrid.ClearSelectedCells;
            strgGrid.EditorMode := True;
            exit;
          end;

          strgGrid.Cells[_KolPODID,strgGrid.Row] := Fields[2].AsString;
          strgGrid.Cells[_KolHarga,strgGrid.Row] := Fields[4].AsString;
          dHarga  := Fields[4].AsFloat;
       //   dHarga  := dHarga - (dHarga *  Fields[7].AsFloat /100);
       //  dHarga  := dHarga - (dHarga *   Fields[8].AsFloat / 100) - Fields[9].AsFloat;

        // strgGrid.Cells[_KOLPPNBMPersen,strgGrid.Row] := Fields[5].AsString;
          strgGrid.Cells[_KolPPNPersen,strgGrid.Row]:= Fields[9].AsString;
          strgGrid.Cells[_kolUomDod, strgGrid.Row]  := Fields[3].AsString;

          dKonversi := 0;
          with TNewBarang.Create(Self) do
          begin
            try
              if LoadByKode(strgGrid.Cells[_kolBarang,strgGrid.Row], dialogunit) then
              begin
                try
                  dKonversi := GetUOMValue(strgGrid.Cells[_KolUOM,strgGrid.Row])
                            / GetUOMValue(strgGrid.Cells[_kolUomDod,strgGrid.Row]);

                except
                  raise Exception.Create('Cek Konversi satuan dan uom asgross!');
                end;
              end;
            finally
              Free;
            end;
          end;
          totqty :=strgGrid.Floats[_Kolqty,strgGrid.Row]*dKonversi;
          totret := Fields[6].AsFloat;

          strgGrid.Cells[_KolHarga,strgGrid.Row] := FloatToStr(dHarga);

          if totqty > totret then
          begin
            CommonDlg.ShowMessage('QTY Melebihi Qty Receipt / Penjualan ->' + FloatToStr(totqty) + ' > ' + FloatToStr(totret));
            valid:=False;
            strgGrid.ClearSelectedCells;
            strgGrid.EditorMode := True;
            exit;
          end;
          strgGrid.Cells[_KolUOM,strgGrid.Row]  := Fields[3].AsString;
          strgGrid.Floats[_Kolqty,strgGrid.Row] := strgGrid.Floats[_Kolqty,strgGrid.Row]*dKonversi;
          strgGrid.Floats[_kolTotRet,strgGrid.Row]      := totret;

        finally
          footerDialogMaster.btnSave.Enabled :=true;
          Free;
        end;
        
      end;
  end;
  }
end;

procedure TfrmDialogReturTrader.ListOfValues(Sender:TObject);
var sSQL:string;
begin
  inherited;
  {
  if sender = edtKodeTrader then
  begin
    sSQL := 'select A.TRD_CODE as Kode,A.TRD_NAME as Nama'
            + ' from trader A'
            + ' where'
            + ' a.TRD_unt_id = ' + IntToStr(dialogunit)
            + ' and a.TRD_IS_TRADER = 1';
    with cLookUp('Daftar Trader ',sSQL) do
    begin
      if Strings[0]= '' then
         Exit;

      edtKodeTrader.Text := Strings[0];
      edtTradername.Text :=  Strings[1];
    end;
  end
  else if ((sender = strgGrid) and (strgGrid.Col=_KolBarang)) or (sender=edtKodeBarang) then
  begin


  sSQL := ' select distinct a.doasd_brg_code, d.BRG_ALIAS'//, e.BRGSUP_SUP_CODE'
        + ' from do_TRADER_detil a'
        + ' ,do_TRADER b,trader c, barang d'//, BARANG_SUPLIER e'
        + ' where a.doasd_doas_no = b.doas_no'
        + ' and a.doasd_doas_unt_id=b.doas_unt_id'
        + ' and b.doas_trd_id = c.trd_id'
        + ' and b.doas_trd_unt_id=c.trd_unt_id'
        + ' and a.doasd_brg_code=d.brg_code'
        + ' and a.doasd_brg_unt_id=d.brg_unt_id'
//        + ' and e.BRGSUP_BRG_CODE = d.BRG_CODE'
//        + ' and e.BRGSUP_IS_PRIMARY = 1'
        + ' and trd_code=' + Quot(edtKodeTrader.Text)
        + ' and a.DOASD_UNT_ID = '+ IntToStr(DialogUnit);

    with cLookUp('Data Barang',sSQL) do
    begin
      if Strings[0] = '' then
            Exit;
      if Sender = strgGrid then
      begin
        strgGrid.Cells[_KolBarang, strgGrid.Row]  := Strings[0];
        strgGrid.EditorMode:=true;
      end
      else
      begin
        edtKodeBarang.Text := Strings[0];
      end;
    end;
  end
  else if ((sender = strgGrid) and (strgGrid.Col=_KolUOM)) or (sender=edtsatuan) then
  begin
    sSQL := 'select distinct a.KONVSAT_SAT_CODE_FROM as " Kode Satuan",'
            + ' b.SAT_NAME as "Nama Satuan" '
            + ' from REF$KONVERSI_SATUAN a, REF$SATUAN b '
            + ' where a.KONVSAT_BRG_CODE = ' + Quot(strgGrid.Cells[_kolbarang,strggrid.row])
            + ' and a.KONVSAT_BRG_UNT_ID = ' + IntToStr(dialogunit)
            + ' and b.SAT_CODE = a.KONVSAT_SAT_CODE_FROM '
            + ' and b.SAT_UNT_ID = a.KONVSAT_SCF_UNT_ID '
            + ' group by a.konvsat_sat_code_from, b.sat_name' ;

    with cLookUp('Data Satuan',sSQL) do
    begin
      try
        if Strings[0] = '' then
            Exit;
        if sender = strgGrid then
        begin
          strgGrid.Cells[_KolUOM,strgGrid.Row] := Strings[0];
          strgGrid.EditorMode:=true;
        end
        else
        begin
          edtsatuan.Text := Strings[0];
        end;
      finally
        Free;
      end;
    end;
  end
  else if ((sender = strgGrid) and (strgGrid.Col=_KolPO)) then
  begin
    sSQL := ' select a.doas_no as "Do Nomor", doasd_brg_code as "Kode Barang",'
    + ' b.doasd_id as "DOD ID", b.doasd_sat_code as "Satuan",'
    + ' b.doasd_sell_PRICE_disc as "Harga" , doasd_qty_receipt as "QTY Rec" , '
    + ' b.doasd_qty_receipt-b.doasd_retur_ass as "QTY Yg Bisa di Retur" ,'
    + ' b.doasd_retur_ass  as "Pernah di Retur" ,'
    + ' doas_date "Tgl Do" , b.doasd_ppn '
    + ' from do_TRADER a, do_TRADER_detil b, trader c'
    + ' where c.trd_code = ' + Quot(edtKodeTrader.Text)
    + ' and c.trd_unt_id = ' + IntToStr(dialogunit)
    + ' and b.doasD_doas_NO = a.doas_no'
    + ' and b.doasd_doas_unt_id = a.doas_unt_id  and c.trd_id = a.doas_trd_id'
    + ' and c.trd_unt_id = a.doas_trd_unt_id  '
    + ' and a.DOAS_STATUS in ('+ Quot('RECEIPT') +','+ Quot('INVOICING') +', '+ Quot('PAID') +')'
    + ' and b.doasd_brg_code = ' + Quot(strgGrid.Cells[_kolBarang,strgGrid.Row])
    + ' and b.doasd_brg_unt_id = ' + IntToStr(dialogunit)
    + ' and b.doasd_qty_receipt-b.doasd_retur_ass > 0';


      with cLookUp('Data DO',sSQL) do
      begin
        try
          if Strings[0] = '' then
          begin
            strgGrid.Cells[_KolPo,strgGrid.Row]:= ''
          end;
          strgGrid.Cells[_KolPo,strgGrid.Row]:= Strings[0];
          strgGrid.Cells[_KolHarga,strgGrid.Row] := Strings[4];
          strgGrid.Cells[_KolPPNPersen,strgGrid.Row] := Strings[9];
          strgGrid.EditorMode:=true;
        finally
          Free;
        end;
      end;
  end;
  }
end;



procedure TfrmDialogReturTrader.edtKodeTraderExit(Sender: TObject);
begin
  inherited;
  {
    with TNewSupplierMerGroup.Create(Self) do
    begin
      try
        if LoadByKode(edtKodeTrader.Text, DialogUnit) then
        begin
          edtKodeTrader.Text := Kode;
          edtTradername.Text := Nama;
        end;
      finally
        Free;
      end;
    end;
    }
end;

procedure TfrmDialogReturTrader.edtKodeBarangExit(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
    sSQL := 'select a.brgsup_brg_code as "Kode Barang", b.brg_alias as "Barang Alias"'
            + ' from barang_suplier a, barang b '
            + ' where a.brgsup_brg_code = ' + QuotedStr(edtKodeBarang.Text)
            + ' and a.brgsup_brg_unt_id = ' + IntToStr(dialogunit)
            + ' and a.brgsup_supmg_sub_code = ' + QuotedStr(edtKodeTrader.Text)
            + ' and a.brgsup_supmg_unt_id = ' + IntToStr(dialogunit)
            + ' and b.brg_code = a.brgsup_brg_code '
            + ' and b.brg_unt_id = a.brgsup_brg_unt_id ';
    {
    with cOpenQuery(sSQL) do
    begin
      edtKodeBarang.Text := Fields[0].AsString;
      edtNamaBarang.Text := Fields[1].AsString
    end;
    }
end;

procedure TfrmDialogReturTrader.edtsatuanExit(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := 'select a.KONVSAT_SAT_CODE_FROM as " Kode_Satuan", b.SAT_NAME as "Nama Satuan" '
          + ' from REF$KONVERSI_SATUAN a, REF$SATUAN b '
          + ' where a.KONVSAT_SAT_CODE_FROM = ' + QuotedStr(edtsatuan.Text)
          + ' and a.KONVSAT_BRG_CODE = ' + QuotedStr(edtKodeBarang.Text)
          + ' and a.KONVSAT_BRG_UNT_ID = ' + IntToStr(dialogunit)
          + ' and b.SAT_CODE = a.KONVSAT_SAT_CODE_FROM '
          + ' and b.SAT_UNT_ID = a.KONVSAT_SCF_UNT_ID ';
   {
    with cOpenQuery(sSQL) do
    begin
      if not Fields[0].IsNull then
      begin
        edtsatuan.Text := Fields[0].AsString;
        edtNamaSatuan.Text := Fields[1].AsString;
      end;
    end;
    }
end;



procedure TfrmDialogReturTrader.edtKodeTraderClickBtn(Sender: TObject);
begin
  inherited;
  ListOfValues(edtKodeTrader);
end;

procedure TfrmDialogReturTrader.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action          := caFree;
end;

procedure TfrmDialogReturTrader.edtsuplierKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

procedure TfrmDialogReturTrader.edtKodeTraderKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

{procedure TfrmDialogRetur.getCompareDetil;
var
  iItem: Integer;
  sUomRetur,sUomPOD,sUomBSS: String;
  sKodeBarang: String;
  dKonvPOD,dKonvRetur,dKonvBSS: Double;
  sSQL: String;
begin
  HapusBarisKosong(strgGrid,2);
  for iItem := 1 to strgGrid.RowCount-1 do
  begin

      sKodeBarang        := strgGrid.Cells[1,iItem];
      sSQL := 'SELECT RD.RETD_SAT_CODE,RD.RETD_POD_PRICE, '
            + ' RD.RETD_POD_PPN_PERSEN,RD.RETD_POD_PPNBM_PERSEN,POD.POD_SAT_CODE_ORDER, '
            + ' POD.POD_PRICE,POD.POD_TOTAL_DISC,POD.POD_PPN_PERSEN,POD.POD_PPNBM_PERSEN, '
            + ' B.BRG_HARGA_AVERAGE,BSS.BSS_HARGA_TRANSAKSI,BSS.BSS_SAT_CODE '
            + ' FROM RETUR R '
            + ' INNER JOIN RETUR_DETIL RD ON (R.RET_ID = RD.RETD_RET_ID) '
            + ' AND (R.RET_UNT_ID = RD.RETD_RET_UNT_ID) '
            + ' INNER JOIN PO_DETIL POD ON (RD.RETD_POD_ID = POD.POD_ID) '
            + ' AND (RD.RETD_POD_UNT_ID = POD.POD_UNT_ID) '
            + ' INNER JOIN BARANG B ON (RD.RETD_BRG_CODE = B.BRG_CODE) '
            + ' AND (RD.RETD_BRG_UNT_ID = B.BRG_UNT_ID) '
            + ' INNER JOIN BARANG_STOK_SIRKULASI BSS ON (RD.RETD_BRG_CODE = BSS.BSS_BRG_CODE) '
            + ' AND (RD.RETD_BRG_UNT_ID = BSS.BSS_BRG_UNT_ID) AND (R.RET_NOBUKTI = BSS.BSS_DOC_NO) '
            + ' WHERE R.RET_NOBUKTI = ' + Quot(edtNoBukti.Text)
            + ' AND RD.RETD_BRG_CODE = ' + Quot(sKodeBarang)
            + ' AND RD.RETD_BRG_UNT_ID = ' + IntToStr(dialogunit);
      with cOpenQuery(sSQL) do
      begin
        try
            if not Fields[0].IsNull then
            begin
              sUomRetur          := Fields[0].AsString;
              dReturPrice        := Fields[1].AsFloat;
              dReturPPnPersen    := Fields[2].AsFloat;
              dReturPPNBMPersen  := Fields[3].AsFloat;
              sUomPOD            := Fields[4].AsString;
              dPODPrice          := Fields[5].AsFloat;
              dPODTotalDisc      := Fields[6].AsFloat;
              dPODPPnPersen      := Fields[7].AsFloat;
              dPODPPNBMPersen    := Fields[8].AsFloat;
              dBarangAVG         := Fields[9].AsFloat;
              dBssAVG            := Fields[10].AsFloat;
              sUomBSS            := Fields[11].AsString;
            end;
        finally
          Free;
        end;
      end;
      dKonvRetur         := getKonversiUOM(sKodeBarang,dialogunit,sUomRetur);
      dKonvPOD           := getKonversiUOM(sKodeBarang,dialogunit,sUomPOD);
      dKonvBSS           := getKonversiUOM(sKodeBarang,dialogunit,sUomBSS);
      dPriceReturCompare := dReturPrice;
      dPricePODCompare   := dKonvRetur/dKonvPOD*(dPODPrice-dPODTotalDisc);
      dReturPPn          := (dReturPPnPersen/100)*dReturPrice;
      dReturPPNBM        := (dReturPPNBMPersen/100)*dReturPrice;
      dPODPPn            := (dPODPPnPersen/100)*dPricePODCompare;
      dPODPPNBM          := (dPODPPNBMPersen/100)*dPricePODCompare;
      dAvgBarangCompare  := dBarangAVG;
      dAvgBssCompare     := 1/dKonvBSS*dBssAVG;
//      ShowMessage(FloatToStr(dAvgBarangCompare)+'--'+FloatToStr(dAvgBssCompare));
      DoTestingSaveLog(edtNoBukti.Text,'Total Price',FloatToStr(dPriceReturCompare),FloatToStr(dPricePODCompare),'','RETUR SUPLIER');
      DoTestingSaveLog(edtNoBukti.Text,'PPn',FloatToStr(dReturPPn),FloatToStr(dPODPPn),'','RETUR SUPLIER');
      DoTestingSaveLog(edtNoBukti.Text,'PPNBM',FloatToStr(dReturPPNBM),FloatToStr(dPODPPNBM),'','RETUR SUPLIER');
      DoTestingSaveLog(edtNoBukti.Text,'AVG',FloatToStr(dAvgBssCompare),FloatToStr(dAvgBarangCompare),'','RETUR SUPLIER');
  end;
end;
}


{
function TfrmDialogRetur.getKonversiUOM(aKodeBarang:String; aUnitID:Integer;
    aUOM:String): Double;
var
  sSQL: String;
begin
  Result := 0;
  sSQL := 'select konvsat_scale'
          + ' from ref$konversi_satuan'
          + ' where konvsat_brg_code = ' + Quot(aKodeBarang)
          + ' and konvsat_brg_unt_id = konvsat_unt_id'
          + ' and konvsat_scf_unt_id = konvsat_unt_id'
          + ' and konvsat_sat_code_from = ' + Quot(aUOM)
          + ' and konvsat_unt_id = ' + IntToStr(aUnitID);

  with cOpenQuery(sSQL) do
  begin
    try
      begin
        if not Fields[0].IsNull then
          Result := Fields[0].AsFloat;
      end;
    finally
      Free;
    end;
  end;
end;
}


procedure TfrmDialogReturTrader.btnRandomClick(Sender: TObject);
var
  iItem,iTrans: Integer;
  iJmlItem: Integer;
  iJmlTrans : Integer;
begin
  inherited;
  Randomize;
  Application.ProcessMessages;
  iJmlTrans := 5;
  {
  for iTrans := 1 to iJmlTrans do
  begin
    edtNoBukti.Text := 'R' + FormatDateTime('yy.hh:mm:ss:', Now) +'0'+IntToStr(dialogunit);
    cClearGrid(StrgGrid,False);
    edtKodeTrader.SetFocus;
    ListOfValues(edtKodeTrader);
    edtketerangan.Text := 'RANDOM';
    iJmlItem := RandomRange(2,5);

    iItem := 1;
    begin
      repeat
        begin
          strgGrid.SetFocus;
          strgGrid.Col := 1;
          strgGrid.Row := iItem;
          ListOfValues(strgGrid);
          strgGrid.Col := 3;
          ListOfValues(strgGrid);
          strgGrid.Cells[4,iItem] := IntToStr(RandomRange(1,10));
          strgGrid.Col := 5;
          ListOfValues(strgGrid);
          if strgGrid.Cells[5,iItem] <> '' then
          begin
              if GetQtyComparation(strgGrid, _KolBarang, _KolUOM, _Kolqty,
              edtNoBukti.Text, dialogunit)  then
                if not ((strgGrid.Cells[_KolHarga,iItem]='') or (strgGrid.Cells[_KolHarga,iItem]='0')) then
                  begin
                    iItem := iItem+1;
                    strgGrid.AddRow;
                  end;
          end;
        end
      until
      iItem = iJmlItem;
      footerDialogMasterbtnSaveClick(Self);
    end;
  end;
  }
  Close;
end;

procedure TfrmDialogReturTrader.FormCloseQuery(Sender: TObject; var CanClose:
    Boolean);
begin
  inherited;
  CanClose:= not InProcessing;
end;

function TfrmDialogReturTrader.GetIDRetur: Integer;
begin
  Result := FIDRetur;
end;

procedure TfrmDialogReturTrader.InisialisasiForm;
var
  s: string;
begin
  {
  s:= StrPadLeft(StrRight(IntToStr(YearOf(FDateTime)), 2), 2, '0');

  edtNoBukti.Text         := TReturTRADER.GetNextNoBukti(DialogUnit, s);
  dtTanggal.Date          := cGetServerDateTime;
  edtKodeTrader.Text      := '';
  edtKodeBarang.Text      := '';
  edtsatuan.Text          := '';
  }
end;

function TfrmDialogReturTrader.InProcessing: Boolean;
begin
  Result:= False;
  if FWaiting then
  begin
    CommonDlg.ShowConfirmGlobal('Tunggu proses sampai selesai!');
    Result := True;
  end;

end;

function TfrmDialogReturTrader.IsBisaLanjut: Boolean;
begin
  Result := False;
  {
  if not IsValidDateKarenaEOD(Trim(edtNoBukti.Text),dialogunit,dtTanggal.Date,
          TTReturTRADER,FMasterIsStore) then
    Exit;

  if CommonDlg.Confirm('Yakin akan Simpan Data ???')=mrNo then exit;

  if edtKodeTrader.Text = '' then
  begin
    CommonDlg.ShowError('Kode Trader Masih Kosong');
    edtKodeTrader.SetFocus;
    Exit;
  end;

  if edtketerangan.Text = '' then
  begin
    CommonDlg.ShowError('Keterangan Masih Kosong');
    edtketerangan.SetFocus;
    Exit;
  end;

  Result := IsCekDataItemBisaLanjut;
  }
end;

function TfrmDialogReturTrader.IsCekDataItemBisaLanjut: Boolean;
var
  i: Integer;
begin
  Result := False;
  {
  for i := strgGrid.FixedRows to strgGrid.RowCount - 1 do
  begin
    if strgGrid.Cells[_Kolbarang,i] <> '' then
    begin
      if (strgGrid.Cells[_Kolqty,i] = '') or (strgGrid.Cells[_Kolqty,i] = '0') then
      begin
        CommonDlg.ShowMessage('Kode Barang : ' + strgGrid.Cells[_KolBarang,i] +
                              ', Kuantitas masih kosong ... ' +
                              'Mohon diisi terlebih dahulu sebelum disimpan');
        strgGrid.Row := i;
        strgGrid.SetFocus;
        Exit;
      end;
      if (strgGrid.Cells[_KolPO,i]='') then
      begin
        CommonDlg.ShowMessage('Kode Barang : '+strgGrid.Cells[_KolBarang,i]+
                              ', Nomor DO masih kosong ... '+
                              'Mohon diisi terlebih dahulu sebelum disimpan');
        strgGrid.Row := i;
        strgGrid.SetFocus;
        Exit;
      end;
      if (strgGrid.Cells[_KolHarga,i]='') or (strgGrid.Cells[_KolHarga,i]='0') then
      begin
        CommonDlg.ShowMessage('Kode Barang : '+strgGrid.Cells[_KolBarang,i]+
                              ', Harga di DO masih kosong ... '+
                              'Mohon diisi Nomor DO dengan benar sebelum disimpan');
        strgGrid.Row := i;
        strgGrid.SetFocus;
        Exit;
      end;
    end;
  end;
  }
  Result := True;
end;

procedure TfrmDialogReturTrader.SetDataBarangDanUOM(aBaris, aBarang: Integer;
    aUOM: String);
begin
  {
  strgGrid.Cells[_kolBarang,aBaris]      := aBarang.Kode;
  strgGrid.Cells[_kolNama,aBaris]        := aBarang.Alias;
  strgGrid.Cells[_Koluom,aBaris]         := aUOM;
  SetSuplier(aBarang.Kode, DialogUnit, aBaris);
  }
end;

procedure TfrmDialogReturTrader.SetDataHargaDanQty(aBaris : Integer; aHarga : Double;
    aQty : Double);
begin
  {
  strgGrid.Floats[_Kolqty,aBaris]        := aQTY;
  strgGrid.Floats[_KolHarga,aBaris]      := aHarga;
  }
end;

procedure TfrmDialogReturTrader.SetDataHeader(aRetur: Integer);
begin
  {
  edtNoBukti.Text    := aRetur.NoBukti;
  edtKodeTrader.Text := aRetur.TRADER.Kode;
  edtTradername.Text := aRetur.TRADER.Nama;
  edtketerangan.Text := aRetur.Keterangan;
  dtTanggal.Date     := aRetur.TglBukti;
  }
end;

procedure TfrmDialogReturTrader.SetDataPajak(aBaris : Integer; aPPNPersen : Double;
    aPPNBMPersen : Double);
begin
  {
  strgGrid.Floats[_KOLPPNBMPersen,aBaris] := aPPNBMPersen;
  strgGrid.Floats[_KolPPNPersen,aBaris]   := aPPNPersen;
  }
end;

procedure TfrmDialogReturTrader.SetDataDO(aBaris, aDOItem: Integer);
begin
  {
  strgGrid.Cells[_kolpo,aBaris]          := aDOItem.DOASD_DOAS_NO;
  strgGrid.Ints[_KolPODID,aBaris]        := aDOItem.DOASD_ID;
  }
end;

procedure TfrmDialogReturTrader.SetDataReturItem(aRetur: Integer);
var
  i: Integer;
  iBaris: Integer;
begin
  {
  for i:= 0 to aRetur.NewReturTRADERItems.Count - 1 do
  begin
    iBaris := i + 1;
    strgGrid.Cells[_KolNo,iBaris]          := IntToStr(iBaris);
    strgGrid.Cells[_KolID,iBaris]          := FloatToStr(aRetur.NewReturTRADERItems[i].ID);

    SetDataBarangDanUOM(iBaris, aRetur.NewReturTRADERItems[i].Barang, aRetur.NewReturTRADERItems[i].UOM.UOM);
    SetDataPajak(iBaris, aRetur.NewReturTRADERItems[i].PPNPersen, aRetur.NewReturTRADERItems[i].PPNBMPersen);
    SetDataHargaDanQty(iBaris, aRetur.NewReturTRADERItems[i].Harga, aRetur.NewReturTRADERItems[i].QTY);
    SetDataDO(iBaris, aRetur.NewReturTRADERItems[i].dOItem);

    if i < aRetur.NewReturTRADERItems.Count - 1 then
      strgGrid.AddRow;

  end;
  }
end;

procedure TfrmDialogReturTrader.SetIDRetur(const Value: Integer);
begin
  FIDRetur := Value;
end;

procedure TfrmDialogReturTrader.SetSuplier(aBarang: string; aUnitID, aRow:
    Integer);
var
  s: string;
begin
  s:= 'select a.BRGSUP_SUP_CODE from barang_suplier a'
    + ' where a.BRGSUP_BRG_CODE = '+ QuotedStr(aBarang)
    + ' and a.BRGSUP_BRG_UNT_ID = '+ IntToStr(aUnitID)
    + ' and a.BRGSUP_UNT_ID = '+ IntToStr(aUnitID)
    + ' and a.BRGSUP_IS_PRIMARY = 1';
   {
  iQ:= cOpenQuery(s);
  try                
    if not iQ.Eof then
    begin
      strgGrid.Cells[_KolSupCode, aRow]      := iQ.Fields[0].AsString;
    end;
  finally
    FreeAndNil(iQ);
  end;
  }
end;

procedure TfrmDialogReturTrader.SimpanRetur(aReturTRADER: Integer);
var
  s: string;
  sSQL: string;
  sSQL2 : string;
begin
  {
  try
    if aReturTRADER.ID = 0 then
    begin
      if IsNoBuktiExist('RETUR_TRADER','RETASS_NOBUKTI','RETASS_UNT_ID', DialogUnit, aReturTRADER.NoBukti) then
      begin
        CommonDlg.ShowMessage('No Bukti Sudah Dipakai' + #13 +
                              'Langsung Digenerate Nobukti Baru, Silahkan Disimpan Ulang');

        s:= StrPadLeft(StrRight(IntToStr(YearOf(FDateTime)), 2), 2, '0');
        edtNoBukti.Text :=  TReturTRADER.GetNextNoBukti(dialogunit, s);
        Exit;
      end;
    end;

    if aReturTRADER.ExecuteGenerateSQL then
    begin
      cCommitTrans;
      if CommonDlg.Confirm('Berhasil Simpan Retur Asgross' +#13
                        + 'Akan Cetak Retur ke Asgross ??? ')= mrYes then
      begin
        setvariableheader(FDialogUnitName);
        frVariables.Variable['NAMAPERUSAHAAN']       := sNamaPerusahaan;
        frVariables.Variable['ALAMATPERUSAHAAN']     := sAlamatPerusahaan;
        frVariables.Variable['TELPPERUSAHAAN']       := sTelpPerusahaan;
        frVariables.Variable['UNITNAME']             := FDialogUnitName;

        sSQL  := GetSQLSlipReturnTrader(dialogunit, edtNoBukti.Text,GetCompanyHeader
        (FLoginFullname,FDialogUnitName,cGetServerTime, cGetServerTime));
        sSQL2 := GetSQLTotalHutang(DialogUnit,edtKodeTrader.Text);
        dmReportNew.EksekusiReport('slip_retur_TRADER', sSQL,sSQL2,True);
      end;

      Close;
    end
    else
    begin
      cRollbackTrans;
      CommonDlg.ShowError('Gagal Menyimpan Data');
      Exit;
    end;
  finally
    cRollbackTrans;
  end;
  }
end;

end.






