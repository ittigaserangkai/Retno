unit ufrmDialogWastageReal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialogBrowse, ExtCtrls, StdCtrls, Mask, DateUtils,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxCurrencyEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar;

type
  TFormMode = (fAdd, fEdit);
  TfrmDialogWastageReal = class(TfrmMasterDialogBrowse)
    pnl1: TPanel;
    lbl2: TLabel;
    lbl1: TLabel;
    dtTgl: TcxDateEdit;
    lbl4: TLabel;
    curredtSubTotal: TcxCurrencyEdit;
    lbl3: TLabel;
    lbl7: TLabel;
    curredtPPN: TcxCurrencyEdit;
    curredtPPNBM: TcxCurrencyEdit;
    lbl10: TLabel;
    lbl11: TLabel;
    curredtTotalWastage: TcxCurrencyEdit;
    edtTransNo: TEdit;
    edtNote: TEdit;
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure jvlblHapusClick(Sender: TObject);
    procedure jvlblTambahClick(Sender: TObject);
    procedure edtTransNoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRefNoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure ColGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ColGridCellValidate(Sender: TObject; ACol, ARow: Integer;
      var Value: String; var Valid: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
//    FBarang: TNewBarang;
//    FBArangStockSirkulasi: TBarangStockSirkulasiItems;
    FHarga: Double;
//    FKonversiSatuan: TKonversiSatuan;
//    FWastage    : TWastage;
//    FWastageOld : TWastage;
    FNOBUkti    : string;
    isEdited    : Boolean;
    function isCheckQty: Boolean;
  public
    arrBrg: array of String;
    function IsAdaDataDouble: Boolean;
    function IsiUOMLangsung: string;
    procedure JumlahAkhir;
    procedure JumlahAkhirNol;
    procedure LoadDetilWastage;
    procedure LoadHeaderWastage;
    procedure LookUpData(Sender:TObject);
    procedure LookupUOM;
    procedure SaveDetilWastage;
    procedure SaveHeaderWastage;
  published
  end;

var
  frmDialogWastageReal: TfrmDialogWastageReal;

implementation

uses ufrmSearchProduct, ufrmSearchSO, ufrmSearchPO, uConstanta, uTSCommonDlg,
  ufrmWastageReal;

const
  _kolTotal         : Integer = 10;
  _kolPPNBM         : Integer = 9;
  _kolPPNBMPersen   : Integer = 8;
  _kolPPN           : Integer = 7;
  _kolPPNPersen     : Integer = 6;
  _kolUOMStock      : Integer = 5;
  _kolHargaAverage  : Integer = 4;
  _kolQTY           : Integer = 3;
  _kolUOMTransaksi  : Integer = 2;
  _kolAliasBarang   : Integer = 1;
  _kolKodeBarang    : Integer = 0;
//  _kolKodeBarangOld : integer = 11;
  _kolFid           : integer = 11;
  _kolUnitId        : Integer = 12;
  _kolDecimal       : Integer = 13;

  {$R *.dfm}

procedure TfrmDialogWastageReal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;

//  FreeAndNil(FWastage);
//  if FWastageOld <> nil then
//    FreeAndNil(FWastageOld);
end;

procedure TfrmDialogWastageReal.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogWastageReal := nil;
end;

procedure TfrmDialogWastageReal.jvlblHapusClick(Sender: TObject);
begin
  inherited;
// if CommonDlg.Confirm('Anda Yakin Ingin Menghapus Data Barang ' + ColGrid.Cells[_kolAliasBarang, ColGrid.Row] ) = mrYes then
 begin
//   HapusBarisTertentu(ColGrid);
   JumlahAkhir;
 end;
end;

procedure TfrmDialogWastageReal.jvlblTambahClick(Sender: TObject);
var
  iBaris: Integer;
  sSQL: string;
begin
  inherited;
  sSQL  := 'select brg_code as "KODE BARANG", brg_alias as "ALIAS BARANG" '
           + ' from barang ';
 {
  with cLookUp('DAFTAR BARANG ', sSQL) do
  begin
    if FBarang.LoadByKode(Strings[0]) then
    begin
      if cekDuplicatValueInColGrid(ColGrid,Strings[0],_kolKodeBarang) then
      begin
        CommonDlg.ShowMessage('Data Barang ' + Strings[1] + ' Sudah Ada');
        Exit;
      end;

      iBaris := GetBarisKosong(ColGrid,_kolKodeBarang);
                   ColGrid.Cells[_kolKodeBarang, iBaris] := FBarang.Kode;
      ColGrid.Cells[_kolAliasBarang, iBaris] := FBarang.Alias;
      ColGrid.Floats[_kolHargaAverage, iBaris] :=  (FBarang.HargaAverage);
      FHarga := FBarang.HargaAverage;
      ColGrid.Cells[_kolUOMStock, iBaris] := FBarang.KodeSatuanStock.UOM;
      ColGrid.Cells[_kolPPNPersen, iBaris] := FloatToStr(FBarang.NewPajak.PPN);
      ColGrid.Cells[_kolPPNBMPersen, iBaris] := FloatToStr(FBarang.NewPajak.PPNBM);
    end;

    Free;
  end;
  }
end;

procedure TfrmDialogWastageReal.edtTransNoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    dtTgl.SetFocus;
end;

procedure TfrmDialogWastageReal.edtRefNoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    edtNote.SetFocus;
end;

procedure TfrmDialogWastageReal.FormCreate(Sender: TObject);
begin
  inherited;
  {
  FBarang := TNewBarang.Create(Self);
  FKonversiSatuan := TKonversiSatuan.Create(Self);
  FBArangStockSirkulasi := TBarangStockSirkulasiItems.Create(TBarangStockSirkulasiItem);

  FWastage := TWastage.Create(Self);
  }
end;

procedure TfrmDialogWastageReal.ColGridKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);

begin
  inherited;
  {
  if (ColGrid.Col = _kolUOMTransaksi) and (ColGrid.Row >= ColGrid.FixedRows) and (Key = VK_F5) then
  begin
    JumlahAkhir;
  end;
  }
end;

procedure TfrmDialogWastageReal.JumlahAkhir;
begin
  {
  curredtPPN.Value          := SumColAdvColGrid(ColGrid, _kolPPN);
  curredtPPNBM.Value        := SumColAdvColGrid(ColGrid, _kolPPNBM);

  curredtSubTotal.Value     := SumColAdvColGrid(ColGrid, _kolTotal);

  curredtTotalWastage.Value := curredtSubTotal.Value + curredtPPN.Value + curredtPPNBM.Value ;
  }
end;

procedure TfrmDialogWastageReal.JumlahAkhirNol;
begin
  curredtSubTotal.Value     := 0;
  curredtPPN.Value          := 0;
  curredtPPNBM.Value        := 0;
  curredtTotalWastage.Value := 0;
end;

procedure TfrmDialogWastageReal.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;
  {
  if ColGrid.Focused then
  begin
    ColGrid.EditorMode := False;
    edtNote.SetFocus;
  end;

  if Trim(edtTransNo.Text) = '' then
    exit;

  footerDialogMaster.btnSave.SetFocus;
  if not GetQtyComparation(colgrid, _kolKodeBarang, _kolUOMTransaksi, _kolQTY,
      edtTransNo.Text, dialogunit) then
    exit;

  if not isCheckQty then
  begin
    CommonDlg.ShowError('Ada qty bernilai nol !');
    exit;
  end;  

  if not IsValidDateKarenaEOD(edtTransNo.Text, dialogunit, dtTgl.Date, TTWastage, 1) then
    Exit;

  if IsAdaDataDouble then // ini aku tambahi mas AP, soale kalo cm mengandalkan penecekan pada saat insert data ke Grid riskan, kemarin aku coba msh bisa data double
  begin
    Exit;
  end;

  if (ColGrid.RowCount = ColGrid.FixedRows + 1 )  and (isEdited) then
  begin

  end
  else
  begin
    if IsValueNullInColGrid(ColGrid, _kolUOMTransaksi) then
    begin
      CommonDlg.ShowMessage('Semua UOM BArang HArus Diisi');
      Exit;
    end;

    if IsValueNullInColGrid(ColGrid, _kolQTY) then
    begin
      CommonDlg.ShowMessage('Tidak Boleh Ada QTY yang 0');
      Exit;
    end;
  end;

  try
    dtTgl.SetFocus;
    SaveHeaderWastage ;
    SaveDetilWastage;

    if not FWastage.ExecuteGenerateSQL(FNOBUkti,dialogunit) then
    begin
      cRollbackTrans;
      CommonDlg.ShowMessage('Gagal Menyimpan Data Wastage');
    end else
    begin
      cCommitTrans;
      frmWastageReal.LoadDetilWastage;// .LoadDataWastage;
      if (CommonDlg.Confirm('Berhasil Menyimpan Data Wastage' + #13 + 'Apakah Anda Akan Mencetak Laporan?') = mrYES) then
        DoSlipWastage(Trim(edtTransNo.Text),IntToStr(dialogunit),FLoginFullname, FDialogUnitName);
      Close;
    end;
  finally
  end;
  }
end;

procedure TfrmDialogWastageReal.SaveDetilWastage;
var
  Total           : Double;
  Satuan          : string;
  QTY             : Double;
  PPNPersen       : Double;
  PPNNominal      : Double;
  PPNBMPersen     : Double;
  PPNBMNominal    : Double;
  Harga           : Double;
  BarangKode      : string;
  i, inRecMax, j  : Integer;  
  iIdOld          : Integer;
  iUnitIdP        : integer;
  IIDP            : integer;

begin
  {
  FWastage.WastageItems.Clear;

  if FWastageOld <> nil then
  begin
    for i := ColGrid.FixedRows to ColGrid.RowCount - 1 do
    begin
      j := 0;
      while j < FWastageOld.WastageItems.Count do
      begin
        IIDP       := FWastageOld.WastageItems[j].ID;
        iUnitIdP   := FWastageOld.WastageItems[j].FNEWUNIT_ID;

        if (IIDP = ColGrid.Ints[_kolFid, i]) and
              (iUnitIdP = ColGrid.Ints[_kolUnitId, i]) then
        begin
          FWastageOld.WastageItems.Delete(j);
          j := - 1;
        end;
        Inc(j);
      end;
    end;
  end;

     inRecMax := ColGrid.RowCount  ;

    for i := ColGrid.FixedRows to inRecMax - 1   do
    begin
      if Trim(ColGrid.Cells[_kolKodeBarang, i]) <> '' then
      begin
        BarangKode    := ColGrid.Cells[_kolKodeBarang, i];
        Harga         := ColGrid.Floats[_kolHargaAverage, i];
        PPNBMNominal  := ColGrid.Floats[_kolPPNBM, i];
        PPNBMPersen   := ColGrid.Floats[_kolPPNBMPersen, i];
        PPNNominal    := ColGrid.Floats[_kolPPN, i];
        PPNPersen     := ColGrid.Floats[_kolPPNPersen, i];
        QTY           := ColGrid.Floats[_kolQTY, i];
        Satuan        := ColGrid.Cells[_kolUOMTransaksi, i];
        Total         := ColGrid.Floats[_kolTotal, i];

        if ColGrid.Cells[_kolFid, i] = '' then
          iIdOld := 0
        else
          iIdOld := ColGrid.Ints[_kolFid, i];

        FWastage.UpdateWastageItems(
          BarangKode,
          Harga,
          dialogunit,
          FNOBUkti,
          dialogunit,
          PPNBMNominal,
          PPNBMPersen,
          PPNNominal,
          PPNPersen,
          QTY,
          Satuan,
          0,
          Total,
          iIdOld);

      end;
    end;

    try
      if FWastageOld <> nil then
      begin
        if FWastageOld.WastageItems.Count <> 0 then
        begin
          if not FWastageOld.RemoveFromDBItem(FNOBUkti,dialogunit) then
          begin
            cRollbackTrans;
          end
          else
          begin
            cCommitTrans;
          end;
        end;
      end;
    finally
      cRollbackTrans;
    end;
    }
end;

procedure TfrmDialogWastageReal.SaveHeaderWastage;
begin
  {
  if FWastage.CekNoBuktiExist(FNOBUkti, DialogUnit) then
  FNOBUkti := FWastage.GetNextWastageNO(DialogUnit);

  FWastage.UpdateData(
    isEdited,
    dtTgl.Date,
    edtNote.Text,
    0,
    FNOBUkti,
    curredtPPN.Value,
    curredtPPNBM.Value,
    curredtTotalWastage.Value,
    dialogunit);
    }
end;

procedure TfrmDialogWastageReal.FormShow(Sender: TObject);
begin
  inherited;
  FNOBUkti := frmWastageReal.FNoBukti;
  {
  if Trim(FNOBUkti) <> '' then
  begin
    FWastage.LoadByWSTRL_NO(FNOBUkti, dialogunit); 
    LoadHeaderWastage;
    LoadDetilWastage;
    isEdited := True;
    FWastageOld := TWastage.Create(Self);
    FWastageOld.LoadByWSTRL_NO(FNOBUkti, dialogunit);

  end else
  begin
    ClearByTag(Self, [0]);
    cClearGrid(ColGrid,False);
    FWastage.WSTRL_UNT.LoadByID(dialogunit);
    FNOBUkti := FWastage.GetNextWastageNO(DialogUnit);
    edtTransNo.Text := FNOBUkti;
    isEdited := False;
  end;
  }
end;

procedure TfrmDialogWastageReal.LoadDetilWastage;
var
  j: Integer;
  i: Integer;
begin
  {
  ColGrid.ColCount              := ColGrid.ColCount + 2;
  ColGrid.ColWidths[_kolFid]    := 0;
  ColGrid.ColWidths[_kolUnitId] := 0;

  j := ColGrid.FixedRows;
  for i := 0 to FWastage.WastageItems.Count - 1 do
  begin
    ColGrid.Cells[_kolKodeBarang, j] := FWastage.WastageItems[i].Barang.Kode;
    ColGrid.Cells[_kolAliasBarang, j] := FWastage.WastageItems[i].Barang.Alias;
    ColGrid.Cells[_kolUOMTransaksi, j] := FWastage.WastageItems[i].SATUAN;
    ColGrid.Floats[_kolQTY, j] :=  (FWastage.WastageItems[i].QTY);
    ColGrid.Cells[_kolHargaAverage, j] := FloatToStr(FWastage.WastageItems[i].HARGA);
    ColGrid.Cells[_kolUOMStock, j] := FWastage.WastageItems[i].Barang.KodeSatuanStock.UOM;
    ColGrid.Cells[_kolPPNPersen, j] :=FloatToStr(FWastage.WastageItems[i].PPN_PERSEN);
    ColGrid.Cells[_kolPPN, j ] := FloatToStr(FWastage.WastageItems[i].PPN_NOMINAL);
    ColGrid.Cells[_kolPPNBMPersen, j] := FloatToStr(FWastage.WastageItems[i].PPNBM_PERSEN);
    ColGrid.Cells[_kolPPNBM, j] := FloatToStr(FWastage.WastageItems[i].PPNBM_NOMINAL);
    ColGrid.Cells[_kolTotal , j] := FloatToStr(FWastage.WastageItems[i].Total);
    //hiden -> untuk id
    ColGrid.Cells[_kolFid, j] := IntToStr(FWastage.WastageItems[i].ID);
    ColGrid.Cells[_kolUnitId, j] := IntToStr(FWastage.WastageItems[i].FNEWUNIT_ID);

    if FBarang.LoadByKode(FWastage.WastageItems[i].Barang.Kode) then
    begin  
      ColGrid.Cells[_kolDecimal,j]       := IntToStr(FBarang.IsDecimal);
    end;


    ColGrid.AddRow;
    Inc(j);
  end;

  HapusBarisKosong(ColGrid,_kolKodeBarang);
  JumlahAkhir;
  }
end;

procedure TfrmDialogWastageReal.LoadHeaderWastage;
begin
  {edtTransNo.Text := FWastage.WSTRL_NO;
  dtTgl.Date := FWastage.WSTRL_DATE;
  edtNote.Text := FWastage.WSTRL_DESCRIPTION;
  }
end;

procedure TfrmDialogWastageReal.ColGridCellValidate(Sender: TObject; ACol,
  ARow: Integer; var Value: String; var Valid: Boolean);
var
  iQty: Integer;
  sSQL      : string;
  sKOdeBrg  : string;
  sKodeUom  : string;
  iNcount   : integer;
  i         : integer; 
  dQty      : Double;
begin
  inherited;
  {
  if ACol in [_kolKodeBarang] then
  begin
    if Value='' then Exit;

    if Length(Value)<igProd_Code_Length then
    begin
      Value := StrPadLeft(Value,igProd_Code_Length,'0');
    end;
    begin
      if FBarang.LoadByKode(Value) then
      begin
        ColGrid.Cells[_kolAliasBarang,ARow]   := FBarang.Alias;
        ColGrid.Floats[_kolPPNBMPersen,ARow]  := FBarang.NewPajak.PPNBM ;
        ColGrid.Floats[_kolPPNPersen,ARow]    := FBarang.NewPajak.PPN;

        ColGrid.Cells[_kolUOMTransaksi,ARow]  := '';
        ColGrid.Floats[_kolPPNBM,ARow]        := 0;
        ColGrid.Floats[_kolPPN,ARow]          := 0;
        ColGrid.Floats[_kolQTY, ARow]         := 0;
        ColGrid.Floats[_kolTotal, ARow]       := 0;
        ColGrid.Floats[_kolHargaAverage, ARow]:= 0;
        ColGrid.Cells[_kolDecimal,ARow]       := IntToStr(FBarang.IsDecimal);


      end
      else
        Valid := False;
    end;

  end;
  if (ACol = _kolQTY) then
  begin
    if (ColGrid.Cells[_KolDecimal,ARow] = '0') then
    begin
      if not TryStrToInt(ColGrid.Cells[_kolQTY,ARow],iQty) then
      begin
        CommonDlg.ShowMessage('Format Angka salah ... ');
        valid := False;
        ColGrid.ClearSelectedCells;
        ColGrid.EditorMode := True;
        exit;
      end;
    end
    else
    begin
      if not TryStrToFloat(ColGrid.Cells[_kolQTY,ARow],dQty)  then
      begin
        CommonDlg.ShowMessage('Format Angka salah ... ');
        valid := False;
        ColGrid.ClearSelectedCells;
        ColGrid.EditorMode := True;
        exit;
      end;
    end;
    begin
    ColGrid.Floats[_kolPPNBM,ARow]        := ColGrid.Floats[_kolQTY,ARow] * ColGrid.Floats[_kolHargaAverage,ARow] * ColGrid.Floats[_kolPPNBMPersen,ARow] / 100;
    ColGrid.Floats[_kolPPN,ARow]          := ColGrid.Floats[_kolQTY,ARow] * ColGrid.Floats[_kolHargaAverage,ARow] * ColGrid.Floats[_kolPPNPersen,ARow] / 100;
    ColGrid.Floats[_kolTotal, ARow]       := (ColGrid.Floats[_kolQTY, ARow] * ColGrid.Floats[_kolHargaAverage, ARow]);
    end;
  end;
   }

  if ACol = _kolUOMTransaksi then
  begin
    sSQL := 'select a.KONVSAT_SAT_CODE_FROM as " Kode_Satuan", b.SAT_NAME as "Nama Satuan" '
            + ' from REF$KONVERSI_SATUAN a, REF$SATUAN b '
//            + ' where a.KONVSAT_SAT_CODE_FROM = ' + QuotedStr(ColGrid.Cells[_kolUOMTransaksi,ARow])
//            + ' and a.KONVSAT_BRG_CODE = ' + QuotedStr(ColGrid.Cells[_kolKodeBarang,ARow])
            + ' and b.SAT_CODE = a.KONVSAT_SAT_CODE_FROM ';
    {
    with cOpenQuery(sSQL) do
    begin
      try
        if IsEmpty then
        begin
          CommonDlg.ShowMessage('Kode Satuan/UOM tidak terdaftar ... Check kembali');
          valid := False;
          ColGrid.ClearSelectedCells;
          ColGrid.EditorMode := True;
          exit;
        end
        else
        begin
          ColGrid.Cells[_kolUOMTransaksi,ARow] := Fields[0].AsString;

          sKOdeBrg := trim(ColGrid.Cells[_kolKodeBarang, ARow]);
          sKodeUom := trim(ColGrid.Cells[_kolUOMTransaksi, ARow]);
          iNcount := 0;

          for i := ColGrid.FixedRows to ColGrid.RowCount - 1 do
          begin
            if (Trim(ColGrid.Cells[_kolKodeBarang, i]) = sKOdeBrg) and
                  (Trim(ColGrid.Cells[_kolUOMTransaksi, i]) = sKodeUom) then
              Inc(iNcount);

            if iNcount > 1 then
            begin
              CommonDlg.ShowMessage('Ada data barang dengan UOM yang sama');
              ColGrid.Floats[_kolQTY, ARow]         := 0;
              Valid := False;
            end;

          end;

          if FBarang.LoadByKode(ColGrid.Cells[_KolKodeBarang, ARow]) and Valid then
          begin
            ColGrid.Floats[_kolHargaAverage,ARow] := FBarang.GetHargaAVG(Value);
            ColGrid.Floats[_kolPPNBM,ARow]        := ColGrid.Floats[_kolQTY,ARow] * ColGrid.Floats[_kolHargaAverage,ARow] * ColGrid.Floats[_kolPPNBMPersen,ARow] / 100;
            ColGrid.Floats[_kolPPN,ARow]          := ColGrid.Floats[_kolQTY,ARow] * ColGrid.Floats[_kolHargaAverage,ARow] * ColGrid.Floats[_kolPPNPersen,ARow] / 100;
          end;
        end;
      finally
        Free;
      end;
    end;
       }
  end;
  JumlahAkhir;

end;

function TfrmDialogWastageReal.IsiUOMLangsung: string;
var
  PPNBMPersen: Double;
  PPNPersen: Double;
  HargaAverage: Double;
  sSQL: string;
begin
  inherited;
  {sSQL := 'select distinct konvsat_sat_code_to as "UOM" '
          + ' from ref$konversi_satuan a '
          + ' where konvsat_brg_code = ' + QuotedStr(ColGrid.Cells[_kolKodeBarang,ColGrid.Row])
          + ' and konvsat_sat_code_to = ' + QuotedStr(ColGrid.Cells[_kolUOMTransaksi, ColGrid.Row]);

  with cOpenQuery(sSQL) do
  begin
    ColGrid.Cells[_kolUOMTransaksi, ColGrid.Row] := Fields[0].AsString;
    Result := Fields[0].AsString;
    if FKonversiSatuan.LoadByKodeBarangAndUOMStock(
                    ColGrid.Cells[_kolKodeBarang, ColGrid.Row],
                    ColGrid.Cells[_kolUOMStock,ColGrid.Row],
                    Fields[0].AsString) then
    begin
      FHarga :=  (ColGrid.Floats[_kolHargaAverage, ColGrid.Row]);
      HargaAverage := FHarga;
      PPNPersen :=  (ColGrid.Floats[_kolPPNPersen, ColGrid.Row]);
      PPNBMPersen :=   (ColGrid.Floats[_kolPPNBMPersen, ColGrid.Row]);

      if PPNPersen = 0 then
         ColGrid.Cells[_kolPPN, ColGrid.Row] := '0'
      else
        ColGrid.Cells[_kolPPN, ColGrid.Row] := FloatToStr(PPNPersen * HargaAverage / 100);

      if PPNBMPersen = 0 then
        ColGrid.Cells[_kolPPNBM, ColGrid.Row] := '0'
      else
        ColGrid.Cells[_kolPPNBM, ColGrid.Row] := FloatToStr(PPNBMPersen * HargaAverage /100);

      ColGrid.Cells[_kolHargaAverage, ColGrid.Row] := FloatToStr(HargaAverage);
      ColGrid.Cells[_kolQTY, ColGrid.Row] := '0,00';
      ColGrid.Cells[_kolTotal, ColGrid.Row] := '0,00';
    end else
      CommonDlg.ShowMessage('Kode Barang ' + ColGrid.Cells[_kolKodeBarang, ColGrid.Row] +
                #13 + 'Nama Barang ' + ColGrid.Cells[_kolAliasBarang, ColGrid.Row] +
                #13 + 'Tidak Memiliki UOM ' + ColGrid.Cells[_kolUOMTransaksi, ColGrid.Row]);
    Free;
  end;
  }
end;

procedure TfrmDialogWastageReal.LookupUOM;
var
  sSQL: string;
begin
  inherited;
  {
  sSQL := 'select distinct konvsat_sat_code_to as "UOM" '
          + ' from ref$konversi_satuan a '
          + ' where konvsat_brg_code = ' + QuotedStr(ColGrid.Cells[_kolKodeBarang,ColGrid.Row]);
  with cLookUp('DAFTAR SATUAN ', sSQL) do
  begin
    if Strings[0] = '' then
      Exit;

    ColGrid.Cells[_kolUOMTransaksi, ColGrid.Row] := Strings[0];
    IsiUOMLangsung;
    
  end;
  }
end;

function TfrmDialogWastageReal.isCheckQty: Boolean;
var
  i : integer;
begin
  Result := True;
  {for i:= ColGrid.FixedRows to ColGrid.RowCount - 1 do
  begin
    if ColGrid.Floats[_kolQTY, i] <= 0 then
    begin
      Result  := False;
      Exit;
    end;  
  end;
  }
end;

function TfrmDialogWastageReal.IsAdaDataDouble: Boolean;
var
  j: Integer;
  i: Integer;
begin
  Result := False;
  {
  for i := 1 to ColGrid.RowCount - 1 do
  begin
    for j := i + 1 to ColGrid.RowCount - 1 do
    begin
      if (ColGrid.Cells[_kolKodeBarang, i] = ColGrid.Cells[_kolKodeBarang, j]) and
         (ColGrid.Cells[_kolUOMTransaksi, i] = ColGrid.Cells[_kolUOMTransaksi, j]) then
      begin
        Result := True;
        ColGrid.Row := i;
        CommonDlg.ShowError('Ada Data Double Baris ' + IntToStr(i) + ' dan ' + IntToStr(j));
        Exit;
      end;
    end;
  end;
  }
end;

procedure TfrmDialogWastageReal.LookUpData(Sender:TObject);
var
  sSQL: string;
begin
  {
  if (sender = ColGrid) and (ColGrid.Col in [_kolKodeBarang, _kolAliasBarang]) then
  begin
    sSQL := ' select brg_code as "Kode Barang", brg_alias as "Barang Alias" '
            + ' from barang '
            + ' where  brg_harga_average > 0'
            + ' group by brg_code, brg_alias ';

    with cLookUp('Data Barang',sSQL) do
    begin
      try
        if Strings[0] = '' then
          Exit;

        ColGrid.Cells[_kolKodeBarang,ColGrid.Row] := Strings[0];
        ColGrid.EditorMode := True;
      finally
        Free;
      end;
    end;
  end else if (sender = ColGrid) and (ColGrid.Col = _kolUOMTransaksi) then
  begin
    sSQL := 'select a.KONVSAT_SAT_CODE_FROM as " Kode Satuan", b.SAT_NAME as "Nama Satuan" '
            + ' from REF$KONVERSI_SATUAN a, REF$SATUAN b '
            + ' where a.KONVSAT_BRG_CODE = ' + Quot(ColGrid.Cells[_kolKodeBarang,ColGrid.row])
            + ' and b.SAT_CODE = a.KONVSAT_SAT_CODE_FROM '
            + ' group by a.konvsat_sat_code_from, b.sat_name' ;

    with cLookUp('Data Satuan',sSQL) do
    begin
      try
        if Strings[0] = '' then
            Exit;

        ColGrid.Cells[_kolUOMTransaksi ,ColGrid.Row] := Strings[0];
        ColGrid.EditorMode := True;
        sSQL := 'select BRG_SAT_CODE_STOCK'
              + ' from barang'
              + ' where brg_code = '+ Quot(ColGrid.Cells[_kolKodeBarang,ColGrid.row]);

        with cOpenQuery(sSQL) do
        begin
          try
            if not Eof then
              ColGrid.Cells[_kolUOMStock,ColGrid.Row] := Fields[0].Text;
          finally
            Free;
          end;

        end;

      finally
        Free;
      end;
    end;
  end;
  }
end;


procedure TfrmDialogWastageReal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  {
  case Key of
    VK_RETURN   : begin
                    if (ssCtrl in Shift) then
                    begin
                      footerDialogMasterbtnSaveClick(self);
                    end else
                    begin
                      if ActiveControl.ClassType = TAdvColumnGrid then
                      begin
                        if ColGrid.Col + 1 > 3 then
                          ColGrid.Col := 0
                        else ColGrid.Col := ColGrid.Col + 1;
                      end
                      else if (ActiveControl.ClassType <> TJvLabel) then
                        SelectNext(ActiveControl,True,True);
                    end;
                  end;
      VK_F5     : begin
                    LookUpData(ActiveControl);
                    Exit;
                  end;
      VK_DOWN   : begin
                    if (ssCtrl in Shift) then
                    begin
                      if ActiveControl.ClassType = TAdvColumnGrid then
                        begin
                          if (ColGrid.Cells[_kolKodeBarang, ColGrid.RowCount - 1] <> '') or
                              (ColGrid.Cells[_kolUOMTransaksi, ColGrid.RowCount - 1] <> '') or
                              (ColGrid.Cells[_kolQTY, ColGrid.RowCount - 1] <> '') then
                              ColGrid.AddRow;

                        end
                      else if (ActiveControl.ClassType <> TJvLabel) then
                        SelectNext(ActiveControl,True,True);
                    end;
                  end;

       VK_UP  :   begin
                    if (ssCtrl in Shift) then
                    begin
                      if ActiveControl.ClassType = TAdvColumnGrid then
                        begin
                          if ColGrid.RowCount > ColGrid.FixedRows then
                          begin

                            if ColGrid.RowCount > ColGrid.FixedRows + 1 then
                            begin
                              ColGrid.RemoveRows(ColGrid.row , 1);
                              JumlahAkhir;
                            end
                            else
                            begin
                              ColGrid.Rows[ColGrid.row].Clear;
                              JumlahAkhirNol;
                            end;
                          end;

                        end
                      else if (ActiveControl.ClassType <> TJvLabel) then
                          SelectNext(ActiveControl,True,True);
                    end;
                  end;
       VK_ESCAPE : close;
  end;


  if (Key = Ord('T')) and (ssctrl in Shift) then
    jvlblTambahClick(Self)
  else if (Key = Ord('R')) and (ssctrl in Shift) then
    jvlblHapusClick(Self);
    }
end;

end.






