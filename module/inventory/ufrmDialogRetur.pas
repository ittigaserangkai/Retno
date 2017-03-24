unit ufrmDialogRetur;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialogBrowse, ExtCtrls, StdCtrls, Mask, DateUtils,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button, ufrmMasterDialog,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, cxLabel,
  cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit, cxButtonEdit, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid;

type
  TfrmDialogRetur = class(TfrmMasterDialogBrowse)
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
    Label1: TLabel;
    edtNoPO: TcxButtonEdit;
    btnClearPO: TButton;
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
    procedure edtsuplierKeyPress(Sender: TObject; var Key: Char);
    procedure edtMerchandisekodeKeyPress(Sender: TObject; var Key: Char);
    procedure btnClearPOClick(Sender: TObject);
    procedure edtNoPOKeyPress(Sender: TObject; var Key: Char);
    procedure edtNoPOClickBtn(Sender: TObject);
    procedure footerDialogMasterbtnCloseClick(Sender: TObject);
  private
    FAutoCommit: Boolean;
    FCanEditCell: Boolean;
    { Private declarations }
    FMerchanID  : Integer;
//    FNewRetur   : TReturSupplier;
//    FnewPO      : TPO;
    FReturID: Integer;
    FRtrLpkisSukses: Boolean;
    procedure AddNewRow;
    function GetSQLMerchandise(aKodeMer: string =''): string;
    function GetSQLPoNo(aPoNo: string=''): string;
    function isAdaDoubleItemUomPo: Boolean;
    procedure SetNomor;
  public
    function getBarisKosong: Integer;
    procedure getCompareDetil;
    function getKonversiUOM(aKodeBarang, aUOM: String): Double;
    function GetSQLBrgSupMerchan(aKodeBrg: string =''): string;
    procedure LoadDataPO(aNoBukti : String  ; aUnitID : INteger);
    procedure ParseHeader;
    function QtyLebihPo(aNobukti : String ; aQtyRet : double;aKdBrg : String;
        aUnitID: Integer): Boolean;
    procedure SetUnitID(aUnitID : integer);
    property AutoCommit: Boolean read FAutoCommit write FAutoCommit;
    property CanEditCell: Boolean read FCanEditCell write FCanEditCell;
    property MerchanID: Integer read FMerchanID write FMerchanID;
    property ReturID: Integer read FReturID write FReturID;
    property RtrLpkisSukses: Boolean read FRtrLpkisSukses write FRtrLpkisSukses;
    { Public declarations }
  end;

var
  frmDialogRetur: TfrmDialogRetur;
  dReturPPnPersen,dReturPPNBMPersen,dPODPPnPersen,dPODPPNBMPersen : Double;
  dReturPrice,dReturPPn,dReturPPNBM : Double;
  dPODPrice,dPODTotalDisc,dPODPPn,dPODPPNBM : Double;
  dPriceReturCompare,dPricePODCompare,dPriceSystem : Double;
  dAvgBarangCompare,dAvgBssCompare : Double;
  dBarangAVG,dBssAVG : Double;

implementation

uses udmReport, uRetnoUnit, Math, StrUtils, uConstanta;

const
  _KolBarang      : Integer = 1;
  _KolNama        : Integer = 2;
  _KolUOM         : Integer = 3;
  _Kolqty         : Integer = 4;
  _KolPO          : Integer = 5;
  _KolHarga       : Integer = 6;
  _KolPODID       : Integer = 7;
  _KolPPNBMPersen : Integer = 8;
  _KolPPNPersen   : Integer = 9;
  _KolID          : Integer = 10;
  _kolUomPod      : Integer = 11;
  _kolPODUnt      : Integer = 12;


{$R *.dfm}

procedure TfrmDialogRetur.AddNewRow;
var
  i: Integer;
begin
 { i := strgGrid.RowCount - 1;
  if (strgGrid.Cells[_KolBarang, i] <> '') and (strgGrid.Cells[_KolUOM, i] <> '')
      and (strgGrid.Cells[_Kolqty, i] <> '') then
  begin
    strgGrid.AddRow;
    strgGrid.Row := i + 1;
    strgGrid.Col := _KolBarang;
    SetNomor;
  end;
  }
end;

procedure TfrmDialogRetur.FormShow(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  edtNoPO.Clear;
  {
  if FReturID = 0 then
  begin
    edtNoBukti.Text         := TReturSupplier.GetNextNoBukti(DialogUnit);  //'R' + FormatDateTime('yy.hh:mm:ss:', Now) +'0'+IntToStr(DialogUnit);
    dtTanggal.Date          := cGetServerTime;
  end
  else
  begin
    edtKodeBarang.Text := '';
    edtsatuan.Text := '';
    if FNewRetur.LoadByID(FReturID,DialogUnit) then
    begin
      edtNoBukti.Text         := FNewRetur.NoBukti;
      edtsuplier.Text         := FNewRetur.SuplierCode;
      edtnamasuplier.Text     := FNewRetur.NewSuplier.Nama;
      FMerchanID              := FNewRetur.NewMerchadize.ID;
      edtMerchandisekode.Text := FNewRetur.NewMerchadize.Kode;
      edtmerchandisename.Text := FNewRetur.NewMerchadize.Nama;
      edtketerangan.Text      := FNewRetur.Keterangan;
      dtTanggal.Date          := FNewRetur.TglBukti;

      for i:= 0 to FNewRetur.NewReturSupplierItems.Count - 1 do
      begin
        strgGrid.Cells[0,i+1]               := IntToStr(i+1);
        strgGrid.Cells[_kolBarang,i+1]      := FNewRetur.NewReturSupplierItems[i].Barang.Kode;
        strgGrid.Cells[_kolNama,i+1]        := FNewRetur.NewReturSupplierItems[i].Barang.Alias;
        strgGrid.Cells[_Koluom,i+1]         := FNewRetur.NewReturSupplierItems[i].UOM.UOM;
        strgGrid.Floats[_Kolqty,i+1]        :=  (FNewRetur.NewReturSupplierItems[i].QTY);
        strgGrid.Cells[_KolPODID,i+1]       := FloatToStr(FNewRetur.NewReturSupplierItems[i].POItemID);
        strgGrid.Cells[_KolHarga,i+1]       := FloatToStr(FNewRetur.NewReturSupplierItems[i].Harga);
        strgGrid.Cells[_KOLPPNBMPersen,i+1] := FloatToStr(FNewRetur.NewReturSupplierItems[i].PPNBMPersen);
        strgGrid.Cells[_KolPPNPersen,i+1]   := FloatToStr(FNewRetur.NewReturSupplierItems[i].PPNPersen);
        strgGrid.Cells[_KolID,i+1]          := FloatToStr(FNewRetur.NewReturSupplierItems[i].ID);

        strgGrid.Cells[_kolpo,i+1]          := FNewRetur.NewReturSupplierItems[i].POItemNo;
        strgGrid.Ints[_kolPODUnt,i+1]       := FNewRetur.NewReturSupplierItems[i].POItemUnitID;

        if i < FNewRetur.NewReturSupplierItems.Count - 1 then
          strgGrid.AddRow;

      end;
    end;
  end;
  }
end;

function TfrmDialogRetur.getBarisKosong: Integer;
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
  //i:=0;
  if Result = 0 then
  begin
    strgGrid.AddRow;
    Result := strgGrid.RowCount - 1;
  end;
  }
end;


procedure TfrmDialogRetur.JvLabel1Click(Sender: TObject);
var
  iBaris: Integer;
  i: Integer;
begin
  inherited;
  if not CanEditCell then
    exit;
  // validasi jika entrian belum valid untuk kuantitas dan nomor po
  {
  iBaris := strgGrid.RowCount-1;
  if (strgGrid.RowCount > 0) and (strgGrid.Cells[_KolBarang,iBaris]<>'') and
     ((strgGrid.Cells[_Kolqty,iBaris]='') or (strgGrid.Cells[_Kolqty,iBaris]='0') or
      (strgGrid.Cells[_KolPO,iBaris]='') or
      (strgGrid.Cells[_KolHarga,iBaris]='') or (strgGrid.Cells[_KolHarga,iBaris]='0')
     ) then
  begin
    CommonDlg.ShowMessage('Kode Barang : '+strgGrid.Cells[_KolBarang,iBaris]+', Kuantitas atau Nomor PO masih kosong ... Mohon diisi terlebih dahulu sebelum tambah Kode Barang lagi');
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
    if (strgGrid.Cells[1,i] = edtKodeBarang.Text) then
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
  strgGrid.Cells[_Kolqty,iBaris]    := '0';
  strgGrid.Cells[_KolID,iBaris]     := '0';

  ClearByTag(Self,[1]);
  strgGrid.Row := iBaris;
  strgGrid.Col := _Kolqty;
  strgGrid.SetFocus;
  }
end;

procedure TfrmDialogRetur.footerDialogMasterbtnSaveClick(Sender: TObject);
var
  aPOID: Integer;
  aharga: Double;
  aUOM: string;
  aQTY: Double;
  aPPNPersen: Double;
  aPPNBMPersen: Double;
  aBarangKode: string;
  i: Integer;
  IDLokal: Integer;
  vSave:Boolean;
  sSQL  : string;
begin
  inherited;
  edtNoPO.Text := Trim(edtNoPO.Text);
  {if edtNoPO.Text = '' then // Not Konsinyasi
     HapusBarisKosong(strgGrid,_KolPO)
  else
     HapusBarisKosong(strgGrid,_KolBarang);

  if isAdaDoubleItemUomPo then
  begin
    CommonDlg.ShowError('Plu dengan Uom pada Po yang sama');
    exit;
  end;

  if not GetQtyComparation(strgGrid, _KolBarang, _KolUOM, _Kolqty,
            edtNoBukti.Text, DialogUnit) then
    exit;

  if not IsValidDateKarenaEOD(Trim(edtNoBukti.Text),DialogUnit,dtTanggal.Date,TTReturSupplier,FMasterIsStore) then
    Exit;

  begin
    if edtNoPO.Text = '' then
    begin
       if CommonDlg.Confirm('Yakin akan Simpan Data ?')=mrNo then exit;
    end
    else
    begin
       if CommonDlg.Confirm('Yakin akan Simpan Data Retur Konsinyasi ?')=mrNo then exit;
    end;

    if edtsuplier.Text = '' then
    begin
      CommonDlg.ShowError('Data Suplier Belum Ada');
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
    (*
    if edtNoPO.Text <> '' then
    begin
      with TPO.Create(Self) do
      begin
        try
          if LoadByNoBukti(edtNoPO.Text, DialogUnit) then
          begin
            if NewSupplierMerGroup.NewSupplier.Kode <> edtsuplier.Text then
            begin
              CommonDlg.ShowError('Kode Supplier PO dan Supplier Retur Tidak Sama');
              edtNoPO.SetFocus;
              Exit;
            end
            else if NewSupplierMerGroup.NewMerchadizeGroup.NewMerchadize.Kode <> edtMerchandisekode.Text then
            begin
              CommonDlg.ShowError('Merchandise Group PO dan Supplier Tidak Sama');
              edtNoPO.SetFocus;
              Exit;
            end;
          end
          else
          begin
            CommonDlg.ShowError('PO Konsinyasi Tidak Ditemukan');
            edtNoPO.SetFocus;
            Exit;
          end;
        finally
          Free;
        end;

      end;

    end;
    *)
  end;

  IDLokal := FReturID;

  FNewRetur.UpdateData(IDLokal,
                        edtketerangan.Text,
                        DialogUnit,
                        edtNoBukti.Text,
                        0,
                        '', //merchan  group
                        dtTanggal.Date,
                        edtNoPO.Text,
                        DialogUnit,
                        FMerchanID,
                        edtsuplier.Text
                        );

 try
   FNewRetur.NewReturSupplierItems.Clear;
   FNewRetur.BarangStockSirkulasiItems.Clear;
    for i := 1 to strgGrid.RowCount - 1 do
    begin
      if strgGrid.Cells[_Kolbarang,i] <> '' then
      begin
        if (strgGrid.Cells[_Kolqty,i]='') or (strgGrid.Floats[_Kolqty,i]= 0) then
        begin
          CommonDlg.ShowMessage('Kode Barang : '+strgGrid.Cells[_KolBarang,i]+
                                ', Kuantitas masih kosong ... '+ #13 +
                                'Mohon diisi terlebih dahulu sebelum disimpan');
          strgGrid.Row := i;
          strgGrid.SetFocus;
          Exit;
        end;
        if (strgGrid.Cells[_KolPO,i]='') then
        begin
          CommonDlg.ShowMessage('Kode Barang : '+strgGrid.Cells[_KolBarang,i]+
                                ', Nomor PO masih kosong ... '+ #13 +
                                'Mohon diisi terlebih dahulu sebelum disimpan');
          strgGrid.Row := i;
          strgGrid.SetFocus;
          Exit;
        end;

        if Qtylebihpo(strgGrid.Cells[_KolPO,i], strgGrid.Floats[_Kolqty,i],
          strgGrid.Cells[_KolBarang,i],  strgGrid.ints[_kolPODUnt,i])  then
        begin
          CommonDlg.ShowMessage('Kode Barang : '+strgGrid.Cells[_KolBarang,i]+
                                ', Qty Retur melebihi qty PO ... '+ #13 +
                                'Mohon di koreksi');
          strgGrid.Row := i;
          strgGrid.SetFocus;
          Exit;
        end;
        if (strgGrid.Cells[_KolHarga,i]='') or (strgGrid.Cells[_KolHarga,i]='0') then
        begin
          CommonDlg.ShowMessage('Kode Barang : '+strgGrid.Cells[_KolBarang,i]+
                                ', Harga di PO masih kosong ... '+ #13 +
                                'Mohon diisi Nomor PO dengan benar sebelum disimpan');
          strgGrid.Row := i;
          strgGrid.SetFocus;
          Exit;
        end;

      aBarangKode   := strgGrid.Cells[_Kolbarang,i];
      aharga        := StrToFloat(strgGrid.Cells[_kolHarga,i]);
      aPOID         := StrToInt(strgGrid.Cells[_KolPODID,i]);
      aPPNBMPersen  := StrToFloat(strgGrid.Cells[_KolPPNBMPersen,i]);
      aPPNPersen    := StrToFloat(strgGrid.Cells[_KolPPNPersen,i]);
      aQTY          :=  (strgGrid.Floats[_Kolqty,i]);
      aUOM          := strgGrid.Cells[_Koluom,i];

      FNewRetur.UpdateNewReturSupplierItems(aBarangKode,
                                            aharga,
                                            0,
                                            aPOID,
                                            aPPNBMPersen,
                                            aPPNPersen,
                                            aQTY,
                                            aUOM,
                                            strgGrid.Ints[_kolPODUnt, i],
                                            DialogUnit,
                                            strgGrid.Cells[_KolPO, i]
                                            );


      with TNewBarang.Create(Self) do
      begin
        try
          if LoadByKode(aBarangKode) then
          begin
            aharga := GetHargaAVG(aUOM);
          end;
        finally
          Free;
        end;
      end;

      FNewRetur.UpdateBarangStockSirkulasi(
            '',
            aBarangKode,
            DialogUnit,
            aUOM,
            edtNoBukti.Text,
            (aQTY * - 1),
            dtTanggal.Date,
            DialogUnit,
            0,
            aharga);
      end;
    end;
  finally
  end;

  begin
    vSave := false;
    try
      if FNewRetur.ID = 0 then
        if IsNoBuktiExist('RETUR','RET_NOBUKTI','RET_UNT_ID',FNewRetur.NewUnit.ID, FNewRetur.NoBukti) then
        begin
          CommonDlg.ShowMessage('No Bukti Sudah Dipakai' + #13 +
                                'Langsung Digenerate Nobukti Baru, Silahkan Disimpan Ulang');
          edtNoBukti.Text :=  TReturSupplier.GetNextNoBukti(DialogUnit);
          Exit;
        end;

      if FNewRetur.ExecuteGenerateSQL then
      begin
        RtrLpkisSukses := True;
        if FAutoCommit then
        begin
          cCommitTrans;
          vSave := true;

          Begin
            CommonDlg.ShowMessage('Data Berhasil Disimpan');
          end
        end
        else
        begin    
          Close;
        end;  
      end
      else
      begin
        cRollbackTrans;
        RtrLpkisSukses := False;
        begin
          CommonDlg.ShowError('Gagal Menyimpan Data');
          Exit;
        end
      end;
    except
      RtrLpkisSukses := False;
      Close;
    end;
  end;
  begin
    if vSave then
    begin
      begin
      if CommonDlg.Confirm('Akan Cetak Retur ke Supplier ??? ')= mrYes then
      begin
        sSQL  := GetSQLSlipReturn(DialogUnit, edtNoBukti.Text,
              GetCompanyHeader(fLoginFullname, FDialogUnitName,cGetServerTime, cGetServerTime));
        dmReportNew.EksekusiReport('frcetakRetur_Supp', sSQL,'',True);
      end;
      end;
      Close;
    end
  end;
  }
end;

procedure TfrmDialogRetur.FormCreate(Sender: TObject);
begin
  inherited;

//  FNewRetur   := TReturSupplier.Create(Self);
//  FnewPO      := TPO.Create(Self);
  CanEditCell := True;
  //varible LPK penutupan
  FAutoCommit := True;
end;

procedure TfrmDialogRetur.lblRemoveRowClick(Sender: TObject);
var iBaris:integer;
begin
  inherited;
  if not CanEditCell then
    exit;
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
    SetNomor;
end;

procedure TfrmDialogRetur.strgGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var iBaris:integer;
begin
  inherited;
  {
  case key of
  VK_RETURN:begin
              if strgGrid.Col+1 > 5 then strgGrid.Col:=1 else strgGrid.Col:=strgGrid.Col+1;
              strgGrid.SetFocus;
            end;
  Ord('R'):if (ssCtrl in Shift) then lblRemoveRowClick(Sender);
  VK_DOWN  :begin
              if (strgGrid.RowCount > 1) and (strgGrid.Cells[_KolBarang,strgGrid.row ]<>'') and
                 ((strgGrid.Cells[_Kolqty,strgGrid.row]='') or (strgGrid.Cells[_Kolqty,strgGrid.row]='0') or
                  (strgGrid.Cells[_KolPO,strgGrid.row]='') or
                  (strgGrid.Cells[_KolHarga,strgGrid.row]='') or (strgGrid.Cells[_KolHarga,strgGrid.row]='0')
                 ) then
              begin
                CommonDlg.ShowMessage('Kode Barang : '+strgGrid.Cells[_KolBarang,strgGrid.row]+', Kuantitas atau Nomor PO masih kosong ... Mohon diisi terlebih dahulu sebelum tambah Kode Barang lagi');
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

procedure TfrmDialogRetur.edtNoBuktiKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
end;

// penekanan tombol di Key Down
procedure TfrmDialogRetur.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  {case Key of
  VK_RETURN:begin
            if ActiveControl.ClassType = TStringGrid then
            begin
               if strgGrid.Col+1 > strgGrid.ColCount-1 then strgGrid.Col:=1 else strgGrid.Col:=strgGrid.Col+1;
            end else if (ssCtrl in Shift) then
            begin
              footerDialogMasterbtnSaveClick(self);
            end else if (ActiveControl.ClassType <> TcxLabel) then
               SelectNext(ActiveControl,true,true);
            end;
  VK_F5:    begin
              if not FAutoCommit then
                exit;

              ListOfValues(ActiveControl);
              Exit;
            end;
  Ord('T'): begin
              if CanEditCell then
              begin
                if (ssCtrl in Shift) then
                begin
                  if  not FAutoCommit then
                    Exit;

                  AddNewRow;
                  Exit;
                end;
              end;
            end;
  VK_ESCAPE: begin
               Close;
             end;
  
  end;
  }
end;

procedure TfrmDialogRetur.strgGridCellValidate(Sender: TObject; ACol,
  ARow: Integer; var Value: String; var Valid: Boolean);
var sSQL : string;
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


      sSQL  := GetSQLBrgSupMerchan(Value);
      with cOpenQuery(sSQL) do
      begin
        if IsEmpty then
        begin
          CommonDlg.ShowMessage('Kode Barang tidak terdaftar di master produk/ belum ada di PO Rec / Pastikan Barang Bisa Diretur');
          strgGrid.ClearSelectedCells;
          valid := False;
          Value := '';
          strgGrid.EditorMode := True;
          exit;
        end;

        strgGrid.Cells[0,ARow]        := IntToStr(arow);
        strgGrid.Cells[_kolNama,ARow] := Fields[1].AsString;
        strgGrid.Cells[_Koluom,ARow]  := '';
        strgGrid.Cells[_Kolqty,ARow]  := '0';
        strgGrid.Cells[_KolPO,ARow]   := '';
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
            + ' and b.SAT_CODE = a.KONVSAT_SAT_CODE_FROM ';

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
  end
  else if ACol = _KolPO then
  begin


    sSQL := GetSQLPoNo(Value);

      with cOpenQuery(sSQL) do
      begin
        if IsEmpty then
        begin
          CommonDlg.ShowMessage('Nomor PO tidak terdaftar ... Silakan dicheck kembali');
          valid:=False;
          strgGrid.ClearSelectedCells;
          strgGrid.EditorMode := True;
          exit;
        end;
        if  Fields[13].AsFloat < strgGrid.Floats[_Kolqty,ARow] then
        begin
          CommonDlg.ShowMessage('Qty Retur melebihi qty PO');
          valid:=False;
          strgGrid.EditorMode := True;
          exit;
        end;
        strgGrid.Cells[_KolPODID,ARow]  := Fields[2].AsString;
        strgGrid.Cells[_kolPODUnt,ARow] := Fields[11].AsString;
        strgGrid.Cells[_KolHarga,ARow]  := Fields[4].AsString;
        dHarga  := Fields[4].AsFloat;
        dHarga  := dHarga - (dHarga *  Fields[7].AsFloat /100);
        dHarga  := dHarga - (dHarga *   Fields[8].AsFloat / 100) - Fields[9].AsFloat;
        dHarga  := dHarga - Fields[12].AsFloat;

        strgGrid.Cells[_KOLPPNBMPersen,ARow] := Fields[5].AsString;
        strgGrid.Cells[_KolPPNPersen,ARow] := Fields[6].AsString;
        strgGrid.Cells[_kolUomPod,ARow] := Fields[3].AsString;


        dKonversi := 0;
        with TNewBarang.Create(Self) do
        begin
          if LoadByKode(strgGrid.Cells[_kolBarang,ARow]) then
          begin
            dKonversi := GetUOMValue(strgGrid.Cells[_KolUOM,ARow]) / GetUOMValue(strgGrid.Cells[_kolUomPod,ARow]);
          end;
        end;

        strgGrid.Cells[_KolHarga,ARow] := FloatToStr(dHarga*dKonversi);
      end;
  end;
  }
  valid := True;
end;

procedure TfrmDialogRetur.ListOfValues(Sender:TObject);
var sSQL:string;
begin
  inherited;
  {if Sender = edtNoPO then
  begin
    sSQL := 'select a.PO_no as NOPO, a.PO_date as tanggal, PO_UNT_ID as Unit'
        + ' from po a, suplier_merchan_grup b, REF$MERCHANDISE_GRUP c, REF$MERCHANDISE d'
        + ' where a.po_supmg_sub_code = b.supmg_sub_code'
        + ' and b.supmg_merchangrup_id = c.merchangrup_id'
        + ' and c.MERCHANGRUP_MERCHAN_ID = d.MERCHAN_ID'
        + ' and b.supmg_code = '+ QuotedStr(edtsuplier.Text)
        + ' and d.MERCHAN_ID = '+ IntToStr(FMerchanID)
        + ' and a.po_stapo_id = 5'
        + ' and a.PO_TPPO_ID in (2,3,4)';



    with cLookUp('Daftar PO', sSQL) do
    begin
      try
        if Strings[0] = '' then
          Exit;

        LoadDataPO(Strings[0], StrToInt(Strings[2]));
        SetNomor;
      finally
        Free;
      end;
    end;
  end
  else if sender = edtsuplier then
  begin
    sSQL :='select sup_code as "Kode Suplier", sup_name as "Nama Suplier" '
            + ' from suplier ';

    with cLookUp('Data Suplier',sSQL) do
    begin
      if Strings[0] = '' then
         Exit;

      edtsuplier.Text := Strings[0];
      //edtnamasuplier.Text := Strings[1];
    end;
  end
  else if sender = edtMerchandisekode then
  begin

    sSQL := GetSQLMerchandise;
    with cLookUp('Merchandise Group ',sSQL) do
    begin
      if Strings[0]= '' then
         Exit;
      edtMerchandisekode.Text := Strings[0]; 
    end;
  end
  else if ((sender = strgGrid) and (strgGrid.Col=_KolBarang)) or (sender=edtKodeBarang) then
  begin

      sSQL  := GetSQLBrgSupMerchan;


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
            + ' and b.SAT_CODE = a.KONVSAT_SAT_CODE_FROM '
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
          //edtNamaSatuan.Text := Strings[1];
        end;
      finally
        Free;
      end;
    end;
  end
  else if ((sender = strgGrid) and (strgGrid.Col=_KolPO)) then
  begin

      sSQL := GetSQLPoNo;
      with cLookUp('Data PO',sSQL) do
      begin
        try
          if Strings[0] = '' then
          begin
            strgGrid.Cells[_KolPo,strgGrid.Row]:= ''
          end;
          strgGrid.Cells[_KolPo,strgGrid.Row]:= Strings[0];
          strgGrid.EditorMode:=true;
        finally
          Free;
        end;
      end;
  end;
  }
end;

procedure TfrmDialogRetur.edtsuplierExit(Sender: TObject);
var sSQL:string;
begin
  inherited;
    sSQL :='select sup_code , sup_name '
          + 'from suplier '
          + ' where sup_code = ' + QuotedStr(UpperCase(edtsuplier.Text));
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

procedure TfrmDialogRetur.edtMerchandisekodeExit(Sender: TObject);
var
  sSQL: string;
begin
  inherited;

  if Trim(edtMerchandisekode.Text) = '' then
    Exit;
  {
  sSQL  := GetSQLMerchandise(edtMerchandisekode.Text);
  with cOpenQuery(sSQL) do
  begin
    try
      edtMerchandisekode.Text := Fields[0].AsString;
      edtmerchandisename.Text := Fields[1].AsString;
      FMerchanID              := Fields[2].AsInteger;

      cClearGrid(strgGrid, False);
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmDialogRetur.edtKodeBarangExit(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
    {
    sSQL  := GetSQLBrgSupMerchan(edtKodeBarang.Text);
    with cOpenQuery(sSQL) do
    begin
      try
        edtKodeBarang.Text := Fields[0].AsString;
        edtNamaBarang.Text := Fields[1].AsString;
      finally
        free;
      end;
    end;
    }
end;

procedure TfrmDialogRetur.edtsatuanExit(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := 'select a.KONVSAT_SAT_CODE_FROM as " Kode_Satuan", b.SAT_NAME as "Nama Satuan" '
          + ' from REF$KONVERSI_SATUAN a, REF$SATUAN b '
          + ' where a.KONVSAT_SAT_CODE_FROM = ' + QuotedStr(edtsatuan.Text)
          + ' and a.KONVSAT_BRG_CODE = ' + QuotedStr(edtKodeBarang.Text)
          + ' and b.SAT_CODE = a.KONVSAT_SAT_CODE_FROM ';
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

procedure TfrmDialogRetur.edtsuplierClickBtn(Sender: TObject);
begin
  inherited;
  ListOfValues(edtsuplier);
end;

procedure TfrmDialogRetur.edtMerchandisekodeClickBtn(Sender: TObject);
begin
  inherited;
  ListOfValues(edtMerchandisekode);
end;

procedure TfrmDialogRetur.edtsuplierKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

procedure TfrmDialogRetur.edtMerchandisekodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

procedure TfrmDialogRetur.getCompareDetil;
var
  iItem: Integer;
  sUomRetur,sUomPOD,sUomBSS: String;
  sKodeBarang: String;
  dKonvPOD,dKonvRetur,dKonvBSS: Double;
  sSQL: String;
begin
  {HapusBarisKosong(strgGrid,2);
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
            + ' INNER JOIN BARANG_STOK_SIRKULASI BSS ON (RD.RETD_BRG_CODE = BSS.BSS_BRG_CODE) '
            + ' AND (R.RET_NOBUKTI = BSS.BSS_DOC_NO) '
            + ' WHERE R.RET_NOBUKTI = ' + Quot(edtNoBukti.Text)
            + ' AND RD.RETD_BRG_CODE = ' + Quot(sKodeBarang);
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
      dKonvRetur         := getKonversiUOM(sKodeBarang,sUomRetur);
      dKonvPOD           := getKonversiUOM(sKodeBarang,sUomPOD);
      dKonvBSS           := getKonversiUOM(sKodeBarang,sUomBSS);
      dPriceReturCompare := dReturPrice;
      dPricePODCompare   := dKonvRetur/dKonvPOD*(dPODPrice-dPODTotalDisc);
      dReturPPn          := (dReturPPnPersen/100)*dReturPrice;
      dReturPPNBM        := (dReturPPNBMPersen/100)*dReturPrice;
      dPODPPn            := (dPODPPnPersen/100)*dPricePODCompare;
      dPODPPNBM          := (dPODPPNBMPersen/100)*dPricePODCompare;
      dAvgBarangCompare  := dBarangAVG;
      dAvgBssCompare     := 1/dKonvBSS*dBssAVG;
      DoTestingSaveLog(edtNoBukti.Text,'Total Price',FloatToStr(dPriceReturCompare),FloatToStr(dPricePODCompare),'','RETUR SUPLIER');
      DoTestingSaveLog(edtNoBukti.Text,'PPn',FloatToStr(dReturPPn),FloatToStr(dPODPPn),'','RETUR SUPLIER');
      DoTestingSaveLog(edtNoBukti.Text,'PPNBM',FloatToStr(dReturPPNBM),FloatToStr(dPODPPNBM),'','RETUR SUPLIER');
      DoTestingSaveLog(edtNoBukti.Text,'AVG',FloatToStr(dAvgBssCompare),FloatToStr(dAvgBarangCompare),'','RETUR SUPLIER');
  end;
  }
end;

function TfrmDialogRetur.getKonversiUOM(aKodeBarang, aUOM: String): Double;
var
  sSQL: String;
begin
  Result := 0;
  sSQL := 'select konvsat_scale'
          + ' from ref$konversi_satuan'
          + ' where konvsat_brg_code = ' + QuotedStr(aKodeBarang)
          + ' and konvsat_sat_code_from = ' + QuotedStr(aUOM);
  {
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
  }
end;

procedure TfrmDialogRetur.btnClearPOClick(Sender: TObject);
begin
  inherited;
  edtNoPO.Clear;
//  cClearGrid(strgGrid, False);
end;

procedure TfrmDialogRetur.edtNoPOKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Key := UpCase(Key); 
end;

procedure TfrmDialogRetur.edtNoPOClickBtn(Sender: TObject);
begin
  inherited;
  ListOfValues(EDtNoPO);
end;

function TfrmDialogRetur.GetSQLBrgSupMerchan(aKodeBrg: string =''): string;
var
  sSQL: string;
begin
  sSQL  := 'select a.brgsup_brg_code as "Kode Barang",'
        + ' b.brg_alias as "Barang Alias" '//a.brgsup_supmg_sub_code
        + ' from barang_suplier a'
        + ' inner join barang b on a.brgsup_brg_code = b.brg_code'
        + ' inner join SUPLIER_MERCHAN_GRUP c on a.brgsup_supmg_sub_code = c.SUPMG_SUB_CODE'
        + ' inner join ref$MERCHANDISE_Grup d on d.merchangrup_id = c.supmg_merchangrup_id'
        + ' inner join REF$MERCHANDISE e on d.MERCHANGRUP_MERCHAN_ID = e.MERCHAN_ID'
        + ' and e.MERCHAN_ID = '+ IntToStr(FMerchanID)
        + ' and a.BRGSUP_IS_ENABLE_CN = 1'
        + ' and c.supmg_code = '+ QuotedStr(edtsuplier.Text);
  if akodeBrg <> '' then
    sSQL := SSQL + ' and a.brgsup_brg_code = '+ QuotedStr(akodeBrg);

  Result := sSQL;
end;

function TfrmDialogRetur.GetSQLMerchandise(aKodeMer: string =''): string;
var
  sSQL: string;
begin
  sSQL := 'select DISTINCT d.MERCHAN_CODE as Kode, d.MERCHAN_NAME as Nama,'
      + ' d.MERCHAN_ID as ID'
      + ' from suplier_merchan_grup b, ref$MERCHANDISE_Grup c, REF$MERCHANDISE d'
      + ' where b.supmg_code = '+ QuotedStr(edtsuplier.Text)
      + ' and c.merchangrup_id = b.supmg_merchangrup_id'
      + ' and c.MERCHANGRUP_MERCHAN_ID = d.MERCHAN_ID'
      + ' and b.SUPMG_IS_ENABLE_CN = 1';
  if aKodeMer <> '' then
    sSQL := sSQL + ' and d.MERCHAN_CODE =' + QuotedStr(aKodeMer);

  Result := sSQL;
end;

function TfrmDialogRetur.GetSQLPoNo(aPoNo: string=''): string;
var
  sSQL: string;
begin
   {sSQL := 'select a.po_no as "PO NOMOR", c.brgsup_brg_code as "Kode Barang",'
        + ' b.pod_id as "POD ID", b.pod_sat_code_order as "Satuan",'
        + ' b.POD_PRICE, b.POD_PPNBM_PERSEN, b.POD_PPN_PERSEN,'
        + ' b.POD_DISC1, b.POD_DISC2, b.POD_DISC3, b.POD_TOTAL_DISC,'
        + ' b.POd_po_unt_id as "Unit ID", POD_DISC_TAMBAHAN,POD_QTY_ORDER'
        + ' from PO a, po_detil b, barang_suplier c, barang d '
        + ' where'
        + ' a.PO_TPPO_ID in (2,3,4)'
        + ' and c.BRGSUP_SUP_CODE = '+ QuotedStr(edtsuplier.Text)
        + ' and d.BRG_CODE = c.BRGSUP_BRG_CODE'
        + ' and d.BRG_MERCHAN_ID = '+ IntToStr(FMerchanID)
        + ' and (a.PO_UNT_ID  = ' + IntToStr(DialogUnit)
        + '  or a.PO_UNT_ID '
        + ' in (select DISTINCT UNT_ID from TPOSTORE where POSTORE_UNT_ID = '
        +  IntToStr(DialogUnit)
        + ' ))'
        + ' and b.POD_PO_NO = a.po_no '
        + ' and b.POd_po_unt_id = a.po_unt_id '
        + ' and c.brgsup_id = b.pod_brgsup_id '
        + ' and c.brgsup_brg_code = ' + QuotedStr(strgGrid.Cells[_kolBarang,strgGrid.Row])
        + ' ';
  if aPoNo <> '' then
    sSQL := sSQL + ' and a.po_no = '+ Quot
    (aPoNo);
   }
  Result := sSQL;
end;

function TfrmDialogRetur.isAdaDoubleItemUomPo: Boolean;
var
  j: Integer;
  i: Integer;
begin
    Result := False;
  {
  for i := strgGrid.FixedRows to strgGrid.RowCount - 2 do
  begin
    for j := i + 1 to strgGrid.RowCount - 1 do
    begin
      if (Trim(strgGrid.Cells[_KolBarang, i]) = Trim(strgGrid.Cells[_KolBarang, j])) and
        (Trim(strgGrid.Cells[_KolUOM, i]) = Trim(strgGrid.Cells[_KolUOM, j])) and
        (Trim(strgGrid.Cells[_KolPO, i]) = Trim(strgGrid.Cells[_KolPO, j])) then
      begin
        Result := True;
        exit;
      end;  
    end;  
  end;
  }
end;

procedure TfrmDialogRetur.LoadDataPO(aNoBukti : String  ; aUnitID : INteger);
var
  aNextRow: Integer;
  iBaris: Integer;
  i: Integer;
begin
  {
  with TPO.Create(nil) do
  begin
    try
      if LoadByNoBukti(aNoBukti, aUnitID) then
      begin
        POItems.LoadByNoBukti(aNoBukti, aUnitID);

        edtNoPO.Text := NoBukti;

        if strgGrid.Cells[_KolBarang, strgGrid.RowCount - 1] <> '' then
        begin
          aNextRow  := strgGrid.RowCount;
          strgGrid.RowCount := POItems.Count + 1 + strgGrid.RowCount - 1;
        end
        else
        begin
          aNextRow  := strgGrid.FixedRows;
          strgGrid.RowCount := POItems.Count + 1;
        end;

        for i := 0 to POItems.Count - 1 do
        begin
          iBaris := i + aNextRow;
          strgGrid.Cells[_KolBarang,iBaris]       := POItems[i].Barang.Kode;
          strgGrid.Cells[_KolNama,iBaris]         := POItems[i].Barang.Alias;
          strgGrid.Cells[_KolUOM,iBaris]          := POItems[i].SatCodeOrder.UOM;
          strgGrid.Cells[_KolPO,iBaris]           := NoBukti;
          strgGrid.Floats[_Kolqty,iBaris]         := 0;
          strgGrid.Floats[_KolHarga,iBaris]       := POItems[i].Price - POItems[i].GetTotalDisc
                                                  + POItems[i].PPN + POItems[i].PPNBM ;//POItems[i].Total;
          strgGrid.Ints[_KolPODID, iBaris]        := POItems[i].ID;
          strgGrid.Floats[_KolPPNPersen,iBaris]   := POItems[i].PPNPersen;
          strgGrid.Floats[_KolPPNBMPersen,iBaris] := POItems[i].PPNBMPersen;
          strgGrid.Ints[_KolID,iBaris]            := 0;
          strgGrid.Ints[_kolPODUnt, iBaris]       := POItems[i].NewUnit.ID;


        end;
      end
      else
      begin
        edtNoPO.Text := '';
      end;
    finally
      Free;
    end;   
  end;
  }
end;

procedure TfrmDialogRetur.ParseHeader;
begin
  {with strgGrid do
  begin
    Clear;
    RowCount  := 2;
    FixedRows := 1;

    Cells[0, 0]           := 'No';
    Cells[_KolBarang, 0]  := 'Barang';
    Cells[_KolNama, 0]    := 'Nama';
    Cells[_KolUOM, 0]     := 'Uom';
    Cells[_Kolqty, 0]     := 'Qty';
    Cells[_KolPO, 0]      := 'Nomor PO';
    Cells[_KolHarga, 0]   := 'Harga';

  end;
  }
end;

procedure TfrmDialogRetur.SetNomor;
var
  j: Integer;
  i: Integer;
begin
  j := 0;
  {for i := strgGrid.FixedRows to strgGrid.RowCount - 1 do
  begin
    inc(j);
    strgGrid.Cells[0, i] := IntToStr(j);
  end;
  }
end;

procedure TfrmDialogRetur.footerDialogMasterbtnCloseClick(Sender: TObject);
begin
  inherited;
  RtrLpkisSukses := False;
end;

function TfrmDialogRetur.QtyLebihPo(aNobukti : String ; aQtyRet : double;aKdBrg
    : String; aUnitID: Integer): Boolean;
    var
      ssql : string;
begin
  result:= true;
  ssql:= 'select pod_qty_order from  po_detil'
        + ' where pod_brg_code=' +QuotedStr(aKdBrg)
        + ' and pod_po_no =' + QuotedStr(aNobukti)
        + ' and pod_po_unt_id='  + IntToStr(aUnitID);
  {
  with cOpenQuery(sSQL) do
      begin
        if not IsEmpty then
        begin
          if FieldByName('pod_qty_order').AsFloat < aQtyRet then
             Result :=true
          else
            Result := false;
        end;
      end;
      }
end;

procedure TfrmDialogRetur.SetUnitID(aUnitID : integer);
begin
  DialogUnit  := aUnitID;
end;

end.
