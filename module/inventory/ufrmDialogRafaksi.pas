unit ufrmDialogRafaksi;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, ufrmMasterDialogBrowse, ExtCtrls,
  DateUtils, jpeg, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  Data.DB, cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, cxLabel,
  cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit, cxButtonEdit,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.StdCtrls;

type
  TfrmDialogRafaksi = class(TfrmMasterDialogBrowse)
    pnl1: TPanel;
    edtMerchandisekode: TcxButtonEdit;
    edtmerchandisename: TEdit;
    dtTanggal: TcxDateEdit;
    edtketerangan: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edtsuplier: TcxButtonEdit;
    edtnamasuplier: TEdit;
    Suplier: TLabel;
    pnl3: TPanel;
    Barang: TLabel;
    Satuan: TLabel;
    edtKodeBarang: TcxButtonEdit;
    edtNamaBarang: TEdit;
    edtsatuan: TcxButtonEdit;
    edtNamaSatuan: TEdit;
    JvLabel1: TcxLabel;
    edtNoBukti: TEdit;
    lblRemoveRow: TcxLabel;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure JvLabel1Click(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
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
    procedure edtsuplierExit(Sender: TObject);
    procedure edtMerchandisekodeExit(Sender: TObject);
    procedure edtKodeBarangExit(Sender: TObject);
    procedure edtsatuanExit(Sender: TObject);
    procedure edtsuplierClickBtn(Sender: TObject);
    procedure edtMerchandisekodeClickBtn(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtsuplierKeyPress(Sender: TObject; var Key: Char);
    procedure edtMerchandisekodeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FIDrafaksi : Integer;
    dHargaAvg : Double;
//    FNewrafaksi : TrafaksiSupplier;

    function getBarisKosong: Integer;

    procedure InisialisasiForm;
    function IsBisaLanjut: Boolean;
    procedure SetDataBarangDanUOM(aBaris, aBarang: Integer; aUOM: String);
    procedure SetDataHargaDanQty(aBaris : Integer; aHarga : Double; aQty : Double);
    procedure SetDataHeader(arafaksi: Integer);
    procedure SetDatarafaksiItem(arafaksi: Integer);
    procedure Simpanrafaksi(arafaksiSupplier: Integer);
  public
    function GetIDrafaksi: Integer;
    function IsCekDataItemBisaLanjut: Boolean;
    function ischekrafaksi(aKodeBarang :string; aBrgUnit : integer): Boolean;
    procedure SetIDrafaksi(const Value: Integer);
    { Public declarations }

  end;

var
  frmDialogRafaksi: TfrmDialogRafaksi;


implementation

uses udmReport,  uRetnoUnit, uAppUtils, uTSCommonDlg;

const
{
NO
Barang
Nama
UOM
STOCK
AVG / UOM
STOCK RP
QTY
NILAI RAFAKSI
TOTAL RAFAKSI
}
_KolBarang      :Integer = 1;
_KolNama        :Integer = 2;
_KolUOM         :Integer = 3;
_Kolstock       :Integer = 4;
_Kolavg         :Integer = 5;
_KolStokRp      :Integer = 6;
_Kolqtyraf      :Integer = 7;
_Kolnilairaf    :Integer = 8;
_Koltotalraf    :Integer = 9;
_KolId          :Integer = 10;
_kolscale       :Integer = 11;
_kolppn         :Integer = 12;


{$R *.dfm}

procedure TfrmDialogRafaksi.FormShow(Sender: TObject);
begin
  inherited;
  if GetIDrafaksi = 0 then
  begin
    InisialisasiForm;
  end else begin
    edtKodeBarang.Text := '';
    edtsatuan.Text := '';
    {
    if FNewrafaksi.LoadByID(GetIDrafaksi,dialogunit) then
    begin
      SetDataHeader(FNewrafaksi);
      SetDatarafaksiItem(FNewrafaksi);
    end;
    }
  end;
  
end;

function TfrmDialogRafaksi.getBarisKosong: Integer;
var
  i: Integer;
begin
  Result := 0;
  {for i := 0 to strgGrid.RowCount - 1  do
  begin
    if strgGrid.Cells[2, i] = '' then
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


procedure TfrmDialogRafaksi.JvLabel1Click(Sender: TObject);
var
  iBaris: Integer;
  i: Integer;
begin
  inherited;

  // validasi jika entrian belum valid untuk kuantitas dan nomor po
  {
  iBaris := strgGrid.RowCount-1;
  if (strgGrid.RowCount > 0) and (strgGrid.Cells[_KolBarang,iBaris]<>'') and
     ((strgGrid.Cells[_Kolqtyraf,iBaris]='') or (strgGrid.Cells[_Kolqtyraf,iBaris]='0') or
      (strgGrid.Cells[_Kolnilairaf,iBaris]='') or (strgGrid.Cells[_Kolnilairaf,iBaris]='0')
     ) then
  begin
    CommonDlg.ShowMessage('Kode Barang : '+strgGrid.Cells[_KolBarang,iBaris]+', Kuantitas atau Nilai Rafksi masih kosong ... Mohon diisi terlebih dahulu sebelum tambah Kode Barang lagi');
    ClearByTag(Self,[1]);
    strgGrid.Row := iBaris;
    if (strgGrid.Cells[_Kolqtyraf,iBaris]='') or (strgGrid.Cells[_Kolqtyraf,iBaris]='0') then
       strgGrid.Col := _Kolqtyraf
    else
       strgGrid.Col := _Kolnilairaf;
    strgGrid.SetFocus;
    Exit;
  end;
  if (Trim(edtKodeBarang.Text) = '') or (Trim(edtNamaBarang.Text) = '') then
  begin
    CommonDlg.ShowMessage('Kode Barang Masih Kosong');
    Exit;
  end;
  if (strgGrid.Floats[_Kolqtyraf,ibaris] > strgGrid.Floats[_Kolstock,ibaris] ) then
  begin
    CommonDlg.ShowMessage('Kode Barang : '+strgGrid.Cells[_KolBarang,ibaris]+
                          ', Qty Rafaksi Melebihi stock ... '+
                          '!');
    strgGrid.SetFocus;
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
    if (strgGrid.Cells[1,i] = edtKodeBarang.Text) then
       // and (strgGrid.Cells[_koluom,i] = edtsatuan.Text))  then
    begin
      CommonDlg.ShowError('Data Barang dengan Kode ' + edtKodeBarang.Text+ ' Sudah Ada ');
      HapusBarisKosong(strgGrid,1);
      Exit;
    end;
  end;

  strgGrid.Cells[0,iBaris]          := IntToStr(iBaris);
  strgGrid.Cells[_kolBarang,iBaris] := edtKodeBarang.Text;
  strgGrid.Cells[_kolNama,iBaris]   := edtNamaBarang.Text;
  strgGrid.Cells[_Koluom,iBaris]    := edtsatuan.Text;
  strgGrid.Cells[_Kolqtyraf,iBaris]      := '0';
  strgGrid.Cells[_Kolnilairaf,iBaris]    := '0';
  strgGrid.Cells[_Koltotalraf,iBaris]    := '0';
  strgGrid.Cells[_KolID,iBaris]          := '0';

  ClearByTag(Self,[1]);
  strgGrid.Row := iBaris;
  strgGrid.Col := _Kolqtyraf;
  strgGrid.SetFocus;
  }
end;

procedure TfrmDialogRafaksi.footerDialogMasterbtnSaveClick(Sender: TObject);
var
  bss : Integer;
  qtybss : Double;
  avgbss : Double;
  brgavg : Double;
  qtyrafaksi : double;
  i: Integer;
  sSql : string;
begin
  inherited;
  {HapusBarisKosong(strgGrid,7);

  if not IsBisaLanjut then
    Exit;

  FNewrafaksi.UpdateData(FIDrafaksi,edtketerangan.Text,DialogUnit,edtNoBukti.Text,0,edtMerchandisekode.Text,DialogUnit,dtTanggal.Date,0);
  FNewrafaksi.NewrafaksiSupplierItems.Clear;
  FNewrafaksi.BarangStockSirkulasiItems.Clear;

  for i := 1 to strgGrid.RowCount - 1 do
  begin
    if strgGrid.Cells[_Kolbarang,i] <> '' then
    begin
      // insert detail rafaksi
      FNewrafaksi.UpdateNewrafaksiSupplierItems(strgGrid.Columns[_Kolbarang].Rows[i],
                                                DialogUnit,
                                                strgGrid.Columns[_Kolstock].Floats[i],
                                                strgGrid.Columns[_KolNilaiRaf].Floats[i],
                                                strgGrid.Columns[_KolID].Ints[i],
                                                strgGrid.Columns[_Kolqtyraf].Floats[i],
                                                strgGrid.Columns[_Koluom].Rows[i],
                                                DialogUnit,
                                                DialogUnit);

//    insert ke barang stok sirkulasi

       for bss := 1 to 2 do
       begin
           if bss = 1 then
             begin
               if strgGrid.Columns[_Kolqtyraf].Floats[i] < strgGrid.Columns[_Kolstock].Floats[i] then
                  qtybss := -1 * strgGrid.Columns[_Kolqtyraf].Floats[i]
               else
                  qtybss := -1 * strgGrid.Columns[_Kolstock].Floats[i];

               avgbss := strgGrid.Columns[_Kolnilairaf].Floats[i] / ((100 + strgGrid.Columns[_Kolppn].Floats[i])/100);
             end
           else
             begin
               if strgGrid.Columns[_Kolqtyraf].Floats[i] < strgGrid.Columns[_Kolstock].Floats[i] then
                  qtybss := strgGrid.Columns[_Kolqtyraf].Floats[i]
               else
                  qtybss := strgGrid.Columns[_Kolstock].Floats[i];
               avgbss := 0;
             end;

            FNewrafaksi.UpdateBarangStockSirkulasi(
            'Rafaksi Supplier',
            strgGrid.Columns[_Kolbarang].Rows[i],
            DialogUnit,
            DialogUnit,
            strgGrid.Columns[_Koluom].Rows[i],
            edtNoBukti.Text,
            qtybss,
            dtTanggal.Date,
            DialogUnit,
            0,
            avgbss);
       end;

       // update avg cost dan nilai rafksi di master barang

       if strgGrid.Columns[_Kolqtyraf].Floats[i] < strgGrid.Columns[_Kolstock].Floats[i] then
         begin
           brgavg := (strgGrid.Columns[_Kolavg].Floats[i]/strgGrid.Columns[_kolscale].Floats[i])-
                     (((strgGrid.Columns[_Kolnilairaf].Floats[i]*strgGrid.Columns[_Kolqtyraf].Floats[i])/((100 + strgGrid.Columns[_kolppn].Floats[i])/100 ))/ (strgGrid.Columns[_Kolstock].Floats[i]*strgGrid.Columns[_kolscale].Floats[i]));
           qtyrafaksi := strgGrid.Columns[_Kolqtyraf].Floats[i];
         end
       else
         begin
           brgavg := (strgGrid.Columns[_Kolavg].Floats[i]/strgGrid.Columns[_kolscale].Floats[i])-
                     ((strgGrid.Columns[_Kolnilairaf].Floats[i]/strgGrid.Columns[_kolscale].Floats[i])/((100 + strgGrid.Columns[_kolppn].Floats[i])/100 ));
           qtyrafaksi := strgGrid.Columns[_Kolstock].Floats[i];
         end;
          sSql := 'update barang set  '
                  + ' BRG_HARGA_AVERAGE = ' + FloatToStr(brgavg)
                  + ' ,BRG_NILAI_RAFAKSI = ' + FloatToStr((strgGrid.Columns[_Kolnilairaf].Floats[i]/strgGrid.Columns[_kolscale].Floats[i]))
                  + ' ,BRG_QTY_RAFAKSI = ' + FloatToStr((qtyrafaksi * strgGrid.Columns[_kolscale].Floats[i]))
                  + ' ,BRG_LBH_RAFAKSI = ' + FloatToStr((strgGrid.Columns[_Kolqtyraf].Floats[i]* strgGrid.Columns[_kolscale].Floats[i]) - (qtyrafaksi * strgGrid.Columns[_kolscale].Floats[i]))
                  + ' ,DATE_MODIFY = ' + QuotDT(cGetServerTime)
                  + ' where brg_code = ' + Quot(strgGrid.Columns[_Kolbarang].Rows[i])
                  + ' and brg_unt_id = ' + IntToStr(DialogUnit)
                  + ';';

         if not cExecSQL(sSql, False,FNewrafaksi.GetHeaderFlag) then
          begin
            cRollbackTrans;
            Exit;
          end else
            cCommitTrans;

    end;
  end;
  Simpanrafaksi(FNewrafaksi);

  }
end;

procedure TfrmDialogRafaksi.FormCreate(Sender: TObject);
begin
  inherited;

//  FNewrafaksi := TrafaksiSupplier.Create(Self);
end;

procedure TfrmDialogRafaksi.lblRemoveRowClick(Sender: TObject);
var iBaris:integer;
begin
  inherited;
  {
    if strgGrid.RowCount <= 2 then
    begin
      iBaris:=strgGrid.Row;
      strgGrid.AddRow;
      strgGrid.Rows[iBaris].Clear;
      strgGrid.RemoveRows(ibaris,1);
    end
    else begin
      strgGrid.Rows[strgGrid.Row].Clear;
      strgGrid.RemoveSelectedRows;
    end;
    }
end;

procedure TfrmDialogRafaksi.strgGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var iBaris:integer;
begin
  inherited;
  {
  case key of

  Ord('R'):if (ssCtrl in Shift) then lblRemoveRowClick(Sender);
  VK_DOWN  :begin
              if (strgGrid.RowCount > 1) and (strgGrid.Cells[_KolBarang,strgGrid.row ]<>'') and
                 ((strgGrid.Cells[_Kolqtyraf,strgGrid.row]='') or (strgGrid.Cells[_Kolqtyraf,strgGrid.row]='0') or
                  (strgGrid.Cells[_Kolnilairaf,strgGrid.row]='') or (strgGrid.Cells[_KolNilaiRaf,strgGrid.row]='0')
                 ) then
              begin
                CommonDlg.ShowMessage('Kode Barang : '+strgGrid.Cells[_KolBarang,strgGrid.row]+', Kuantitas masih kosong ... Mohon diisi terlebih dahulu sebelum tambah Kode Barang lagi');
                ClearByTag(Self,[1]);
                if (strgGrid.Cells[_Kolqtyraf,strgGrid.row]='') or (strgGrid.Cells[_Kolqtyraf,strgGrid.row]='0') then
                   strgGrid.Col := _Kolqtyraf
                else
                   strgGrid.Col := _Kolnilairaf;
                strgGrid.SetFocus;
                Exit;
              end;

              if (strgGrid.Floats[_Kolqtyraf,strgGrid.row] > strgGrid.Floats[_Kolstock,strgGrid.row] ) then
              begin
                CommonDlg.ShowMessage('Kode Barang : '+strgGrid.Cells[_KolBarang,strgGrid.row]+
                                      ', Qty Rafaksi Melebihi stock ... '+
                                      '!');
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

procedure TfrmDialogRafaksi.edtNoBuktiKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
end;

// penekanan tombol di Key Down
procedure TfrmDialogRafaksi.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    auom    : string;
    dtawal  : TDateTime;
    dtakhir : TDateTime;
    sSql    : string;
    dNilaiRaf : Double;
    dQtyRaf   : Double;
begin
  inherited;
  {
    dtawal  := StartOfAMonth(YearOf(cGetServerTime), MonthOf(cGetServerTime));
    dtakhir := EndOfTheMonth(dtAwal);
  case Key of
  VK_RETURN:begin
            if ActiveControl.ClassType = TAdvColumnGrid then
            begin
               if strgGrid.Col = _KolUOM then
                 begin
                   auom := strgGrid.Cells[_KolUOM,strgGrid.row];
                   sSql := 'select kdbrg,(stok/konvsat_scale) stok , stokrp , konvsat_scale  from sp_stoknow(' + Quot(strgGrid.Cells[_KolBarang,strgGrid.row]) + ','
                           +  IntToStr(dialogunit) + ',' + QuotD(dtakhir) +') a ,REF$KONVERSI_SATUAN b '
                           + ' where kdbrg=konvsat_brg_code'
                           + ' and konvsat_sat_code_from = ' + quot(auom)
                           + ' and konvsat_unt_id= ' + IntToStr(dialogunit);
                      with cOpenQuery(sSQL) do
                      begin
                          strgGrid.Cells[_Kolstock,strgGrid.Row]:=FloatToStr(fieldbyname('STOK').AsFloat);
                          strgGrid.Cells[_Kolavg,strgGrid.Row]:=FloatToStr(dHargaAvg*fieldbyname('KONVSAT_SCALE').AsFloat);
                          strgGrid.Cells[_KolStokRp,strgGrid.Row]:=FloatToStr(fieldbyname('STOKRP').AsFloat);
                          strgGrid.Cells[_kolscale,strgGrid.Row]:=FloatToStr(fieldbyname('KONVSAT_SCALE').AsFloat);
                      end;


                   strgGrid.Col := strgGrid.Col + 4;
                 end
               else if strgGrid.Col < _Kolnilairaf then
                  strgGrid.Col := strgGrid.Col + 1
               else if strgGrid.Col = _Kolnilairaf then
                 begin
                    dNilaiRaf := strgGrid.Floats[_Kolnilairaf,strgGrid.Row];
                    dQtyRaf   := strgGrid.Floats[_Kolqtyraf,strgGrid.Row];
                    strgGrid.Floats[_Koltotalraf,strgGrid.Row] := dNilaiRaf * dQtyRaf;
                    strgGrid.Col := 1;
                 end;


            end else if (ssCtrl in Shift) then
            begin
              footerDialogMasterbtnSaveClick(self);
            end else if (ActiveControl.ClassType <> TcxLabel) then
               SelectNext(ActiveControl,true,true);
            end;
  VK_F5:    begin
              ListOfValues(ActiveControl);
              Exit;
            end;
  Ord('T'): begin
              if (strgGrid.Floats[_Kolqtyraf,strgGrid.row] > strgGrid.Floats[_Kolstock,strgGrid.row] ) then
              begin
                CommonDlg.ShowMessage('Kode Barang : '+strgGrid.Cells[_KolBarang,strgGrid.row]+
                                      ', Qty Rafaksi Melebihi stock ... '+
                                      '!');
                strgGrid.SetFocus;
                Exit;
              end;
              
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

procedure TfrmDialogRafaksi.strgGridCellValidate(Sender: TObject; ACol,
  ARow: Integer; var Value: String; var Valid: Boolean);
var sSQL : string;
    i:integer;
    dQty : Double;
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
      sSQL := 'select a.brgsup_brg_code as "Kode Barang", b.brg_alias as "Barang Alias",brg_Harga_average,Pjk_ppn'
              + ' from barang_suplier a, barang b , ref$pajak c'
              + ' where a.brgsup_brg_code = ' + Quot(value)
              + ' and a.brgsup_brg_unt_id = ' + IntToStr(dialogunit)
              + ' and a.brgsup_supmg_sub_code = ' + Quot(edtMerchandisekode.Text)
              + ' and a.brgsup_supmg_unt_id = ' + IntToStr(dialogunit)
              + ' and b.brg_code = a.brgsup_brg_code '
              + ' and a.BRGSUP_IS_ENABLE_CN = 1'
              + ' and b.brg_unt_id = a.brgsup_brg_unt_id '
              + ' and b.brg_pjk_id=c.pjk_id and b.brg_pjk_unt_id=c.pjk_unt_id';
      with cOpenQuery(sSQL) do
      begin
        if IsEmpty then
        begin
          CommonDlg.ShowMessage('Kode Barang tidak terdaftar di master produk/ belum ada di PO Rec / Pastikan Barang Bisa Dirafaksi');
          strgGrid.ClearSelectedCells;
          valid:=False;
          strgGrid.EditorMode := True;
          exit;
        end;

        if not ischekrafaksi(Value,DialogUnit) then
        begin
           CommonDlg.ShowError('Kode ' + value+ ' Masih ada dalam periode rafaksi');
           strgGrid.ClearSelectedCells;
           valid:=False;
           Exit;
        end;
        for i:= 0 to strgGrid.RowCount - 1 do
        begin
          if (strgGrid.Cells[1,i] = Value) and (i<>arow) then
          begin
            CommonDlg.ShowError('Data Barang dengan Kode ' + value+ ' Sudah Ada ');
            strgGrid.ClearSelectedCells;
            valid:=False;
            strgGrid.EditorMode := True;
            exit;
          end;
        end;

        strgGrid.Cells[0,ARow]        := IntToStr(arow);
        strgGrid.Cells[_KolNama,ARow] := Fields[1].AsString;
        dHargaAvg := Fields[2].AsFloat;
        strgGrid.Floats[_Kolavg,ARow] := Fields[2].AsFloat;
        strgGrid.Cells[_Koluom,ARow]  := '';
        strgGrid.Cells[_Kolqtyraf,ARow]  := '0';
        strgGrid.Cells[_KolID,ARow]   := '0';
        strgGrid.Floats[_kolppn,ARow] := Fields[3].AsFloat;
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
        end;
      end;
  end
  else if ACol = _Kolqtyraf then
  begin
    if not TryStrToFloat(strgGrid.Cells[_Kolqtyraf,ARow],dQty) or (dQty <=0)  then
    begin
      CommonDlg.ShowMessage('Format Angka salah ... & '+slinebreak+
                            'atau Qty tidak boleh <= 0 atau Qty rafaksin > Qty stock');
      valid:=False;
      strgGrid.ClearSelectedCells;
      strgGrid.EditorMode := True;
      exit;
    end;
  end ;
   }
end;

procedure TfrmDialogRafaksi.ListOfValues(Sender:TObject);
var sSQL:string;
begin
  inherited;
  {
  if sender = edtsuplier then
  begin
    sSQL :='select sup_code as "Kode Suplier", sup_name as "Nama Suplier" '
            + ' from suplier '
            + ' where sup_unt_id = ' + IntToStr(dialogunit);

    with cLookUp('Data Suplier',sSQL) do
    begin
      if Strings[0] = '' then
         Exit;

      edtsuplier.Text := Strings[0];
    end;
  end
  else if sender = edtMerchandisekode then
  begin
    sSQL := 'select b.SUPMG_SUB_CODE as Kode, SUPMG_SUB_CODE, b.SUPMG_NAME as Nama'
            + ' from suplier a, suplier_merchan_grup b '
            + ' where a.sup_code = ' + Quot(edtsuplier.Text)
            + ' and a.sup_unt_id = ' + IntToStr(dialogunit)
            + ' and b.supmg_code = a.sup_code '
            + ' and b.supmg_unt_id = a.sup_unt_id ' ;
    with cLookUp('Sub Supplier ',sSQL) do
    begin
      if Strings[0]= '' then
         Exit;

      edtMerchandisekode.Text := Strings[0];
    end;
  end
  else if ((sender = strgGrid) and (strgGrid.Col=_KolBarang)) or (sender=edtKodeBarang) then
  begin

    sSQL := 'select a.brgsup_brg_code as "Kode Barang", b.brg_alias as "Barang Alias"'
            + ' from barang_suplier a, barang b '
            + ' where a.brgsup_brg_unt_id = ' + IntToStr(dialogunit)
            + ' and a.brgsup_supmg_sub_code = ' + Quot(edtMerchandisekode.Text)
            + ' and a.brgsup_supmg_unt_id = ' + IntToStr(dialogunit)
            + ' and b.brg_code = a.brgsup_brg_code '
            + ' and a.BRGSUP_IS_ENABLE_CN = 1'
            + ' and b.brg_unt_id = a.brgsup_brg_unt_id ';
    

    with cLookUp('Data Barang',sSQL) do
    begin
      if Strings[0] = '' then
            Exit;
      if Sender = strgGrid then
      begin
        strgGrid.Cells[_KolBarang,strgGrid.Row] := Strings[0];
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
    sSQL := 'select distinct a.KONVSAT_SAT_CODE_FROM as " Kode Satuan", b.SAT_NAME as "Nama Satuan" '
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
  end ;
   }
end;

procedure TfrmDialogRafaksi.edtsuplierExit(Sender: TObject);
var sSQL:string;
begin
  inherited;
    sSQL :='select sup_code , sup_name '
          + 'from suplier '
          + ' where sup_code = ' + QuotedStr(UpperCase(edtsuplier.Text))
          + ' and sup_unt_id = ' + IntToStr(dialogunit);
    {
    with cOpenQuery(sSQL) do
    begin
      try
        edtsuplier.Text := Fields[0].AsString;
        edtnamasuplier.Text := Fields[1].AsString;
        cClearGrid(strgGrid, False);
      finally
        Free;
      end;
    end;
    }
end;

procedure TfrmDialogRafaksi.edtMerchandisekodeExit(Sender: TObject);
begin
  inherited;
  {
   with TNewSupplierMerGroup.Create(Self) do
    begin
      try
        if LoadByKode(edtMerchandisekode.Text, DialogUnit) then
        begin
          edtMerchandisekode.Text := Kode;
          edtmerchandisename.Text := Nama;
        end;
      finally
        Free;
      end;
    end;
    }
end;

procedure TfrmDialogRafaksi.edtKodeBarangExit(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
    {
    sSQL := 'select a.brgsup_brg_code as "Kode Barang", b.brg_alias as "Barang Alias"'
            + ' from barang_suplier a, barang b '
            + ' where a.brgsup_brg_code = ' + QuotedStr(edtKodeBarang.Text)
            + ' and a.brgsup_brg_unt_id = ' + IntToStr(dialogunit)
            + ' and a.brgsup_supmg_sub_code = ' + QuotedStr(edtMerchandisekode.Text)
            + ' and a.brgsup_supmg_unt_id = ' + IntToStr(dialogunit)
            + ' and b.brg_code = a.brgsup_brg_code '
            + ' and b.brg_unt_id = a.brgsup_brg_unt_id ';

    with cOpenQuery(sSQL) do
    begin
      edtKodeBarang.Text := Fields[0].AsString;
      edtNamaBarang.Text := Fields[1].AsString
    end;
    }
end;

procedure TfrmDialogRafaksi.edtsatuanExit(Sender: TObject);
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

procedure TfrmDialogRafaksi.edtsuplierClickBtn(Sender: TObject);
//var sSql:string;
begin
  inherited;
  ListOfValues(edtsuplier);
end;

procedure TfrmDialogRafaksi.edtMerchandisekodeClickBtn(Sender: TObject);
begin
  inherited;
  ListOfValues(edtMerchandisekode);
end;

procedure TfrmDialogRafaksi.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action          := caFree;
end;

procedure TfrmDialogRafaksi.edtsuplierKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

procedure TfrmDialogRafaksi.edtMerchandisekodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

function TfrmDialogRafaksi.GetIDrafaksi: Integer;
begin
  Result := FIDrafaksi;
end;

procedure TfrmDialogRafaksi.InisialisasiForm;
begin
  {
  edtNoBukti.Text         := TrafaksiSupplier.GetNextNoBukti(DialogUnit);
  dtTanggal.Date          := cGetServerDateTime;
  edtsuplier.Text         := '';
  edtMerchandisekode.Text := '';
  edtKodeBarang.Text      := '';
  edtsatuan.Text          := '';
  strgGrid.Columns[_KolId].Width:=0 ;
  strgGrid.Columns[_kolscale].Width:=0;
  }
end;

function TfrmDialogRafaksi.IsBisaLanjut: Boolean;
begin
  Result := False;

  if CommonDlg.Confirm('Yakin akan Simpan Data ???')=mrNo then exit;
  if edtsuplier.Text = '' then
  begin
    CommonDlg.ShowMessage('Data Suplier Belum Ada');
    edtsuplier.SetFocus;
    Exit;
  end;

  if edtMerchandisekode.Text = '' then
  begin
    CommonDlg.ShowError('Data Merchandise Masih Kosong');
    edtMerchandisekode.SetFocus;
    Exit;
  end;

  if edtketerangan.Text = '' then
  begin
    CommonDlg.ShowError('Keterangan Masih Kosong');
    edtketerangan.SetFocus;
    Exit;
  end;

  Result := IsCekDataItemBisaLanjut;
end;

function TfrmDialogRafaksi.IsCekDataItemBisaLanjut: Boolean;
var
  i: Integer;
begin
  Result := False;
  {
  for i := 1 to strgGrid.RowCount - 1 do
  begin
    if strgGrid.Cells[_Kolbarang,i] <> '' then
    begin
      if (strgGrid.Cells[_Kolqtyraf,i] = '') or (strgGrid.Cells[_Kolqtyraf,i] = '0') then
      begin
        CommonDlg.ShowMessage('Kode Barang : ' + strgGrid.Cells[_KolBarang,i] +
                              ', Kuantitas masih kosong ... ' +
                              'Mohon diisi terlebih dahulu sebelum disimpan');
        strgGrid.Row := i;
        strgGrid.SetFocus;
        Exit;
      end;

      if (strgGrid.Floats[_Kolqtyraf,i] > strgGrid.Floats[_Kolstock,i] ) then
      begin
        CommonDlg.ShowMessage('Kode Barang : '+strgGrid.Cells[_KolBarang,i]+
                              ', Qty Rafaksi Melebihi stock .... '+
                              '!');
        strgGrid.Row := i;
        strgGrid.SetFocus;
        Exit;
      end;

      if (strgGrid.Cells[_Kolnilairaf,i]='') or (strgGrid.Cells[_Kolnilairaf,i]='0') then
      begin
        CommonDlg.ShowMessage('Kode Barang : '+strgGrid.Cells[_KolBarang,i]+
                              ', Nilai Rafaksi masih kosong ... '+
                              'Mohon diisi ');
        strgGrid.Row := i;
        strgGrid.SetFocus;
        Exit;
      end;

    end;
  end;
   }
  Result := True;
end;

function TfrmDialogRafaksi.ischekrafaksi(aKodeBarang :string; aBrgUnit :
    integer): Boolean;
    var
      sSql : string;
begin
  sSql:='select * from rafaksi_detil where rafd_akhir_periode=0 '
        + ' and rafd_brg_code = ' + QuotedStr(aKodeBarang)
        + ' and rafd_unt_id = ' + IntToStr(aBrgUnit);
  {
   with cOpenQuery(sSQL) do
      begin
        if IsEmpty then
        begin
          Result:=True;
          exit;
        end;
     end;
     }
  Result := False;
end;

procedure TfrmDialogRafaksi.SetDataBarangDanUOM(aBaris, aBarang: Integer; aUOM:
    String);
begin
  {
  strgGrid.Cells[_kolBarang,aBaris]      := aBarang.Kode;
  strgGrid.Cells[_kolNama,aBaris]        := aBarang.Alias;
  strgGrid.Cells[_Koluom,aBaris]         := aUOM;
  }
end;

procedure TfrmDialogRafaksi.SetDataHargaDanQty(aBaris : Integer; aHarga : Double;
    aQty : Double);
begin
  {
  strgGrid.Floats[_Kolqtyraf,aBaris]        := aQTY;
  strgGrid.Floats[_Kolnilairaf,aBaris]      := aHarga;
  }
end;

procedure TfrmDialogRafaksi.SetDataHeader(arafaksi: Integer);
begin
 {
  edtNoBukti.Text         := arafaksi.NoBukti;
  edtsuplier.Text         := arafaksi.SupplierMerGroup.NewSupplier.Kode;
  edtnamasuplier.Text     := arafaksi.SupplierMerGroup.NewSupplier.Nama;
  edtMerchandisekode.Text := arafaksi.SupplierMerGroup.Kode;
  edtmerchandisename.Text := arafaksi.SupplierMerGroup.Nama;
  edtketerangan.Text      := arafaksi.Keterangan;
  dtTanggal.Date          := arafaksi.TglBukti;
  }
end;

procedure TfrmDialogRafaksi.SetDatarafaksiItem(arafaksi: Integer);
var
  i: Integer;
  iBaris: Integer;
begin
  {
  for i:= 0 to arafaksi.NewrafaksiSupplierItems.Count - 1 do
  begin
    iBaris := i + 1;
    strgGrid.Cells[0,iBaris]               := IntToStr(iBaris);
    strgGrid.Cells[_KolID,iBaris]          := FloatToStr(arafaksi.NewrafaksiSupplierItems[i].ID);
    
    SetDataBarangDanUOM(iBaris, arafaksi.NewrafaksiSupplierItems[i].Barang, arafaksi.NewrafaksiSupplierItems[i].UOM.UOM);
    SetDataHargaDanQty(iBaris, arafaksi.NewrafaksiSupplierItems[i].NILAIRAF, arafaksi.NewrafaksiSupplierItems[i].QTY);

    if i < arafaksi.NewrafaksiSupplierItems.Count - 1 then
      strgGrid.AddRow;

  end;
  }
end;

procedure TfrmDialogRafaksi.SetIDrafaksi(const Value: Integer);
begin
  FIDrafaksi := Value;
end;

procedure TfrmDialogRafaksi.Simpanrafaksi(arafaksiSupplier: Integer);
var
  sSQL: string;
begin
  {
  try
    if arafaksiSupplier.ID = 0 then
    begin
      if IsNoBuktiExist('rafaksi','RAF_NOBUKTI','RAF_UNT_ID',arafaksiSupplier.NewUnit.ID, arafaksiSupplier.NoBukti) then
      begin
        CommonDlg.ShowMessage('No Bukti Sudah Dipakai' + #13 +
                              'Langsung Digenerate Nobukti Baru, Silahkan Disimpan Ulang');
        edtNoBukti.Text :=  TrafaksiSupplier.GetNextNoBukti(dialogunit);
        Exit;
      end;
    end;  

    if arafaksiSupplier.ExecuteGenerateSQL then
    begin
      cCommitTrans;
      if CommonDlg.Confirm('Berhasil Simpan rafaksi Supplier' +#13+ 'Akan Cetak slip rafaksi Supplier ?? ')= mrYes then
      begin
        sSQL  := GetSQLSliprafaksin(dialogunit, edtNoBukti.Text,GetCompanyHeader(FLoginFullname,FDialogUnitName,cGetServerTime, cGetServerTime));
        dmReportNew.EksekusiReport('frcetakrafaksi_Supp', sSQL,'',True);
      end;

      Close;
    end  else begin
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






