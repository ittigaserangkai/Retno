unit ufrmDialogQuotationMailerNeo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialogBrowse, ExtCtrls, StdCtrls, Mask,
  DB, Math, Buttons, ComCtrls, DateUtils, jpeg,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxContainer, dxCore,
  cxDateUtils, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, cxPC, dxDockControl, dxDockPanel, cxSpinEdit,
  cxTimeEdit, cxLabel;

type
  TFormMode = (fmAdd, fmEdit);
  TfrmDialogQuotationMailerNeo = class(TfrmMasterDialogBrowse)
    pnlTop: TPanel;
    img1: TImage;
    lbl4: TLabel;
    lbl3: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    edtQuotationNo: TEdit;
    dtRefDate: TcxDateEdit;
    dtEffectiveDate: TcxDateEdit;
    edtRemark: TEdit;
    dtEndDate: TcxDateEdit;
    lblEndDate: TLabel;
    cxcolGridViewColumn1: TcxGridDBColumn;
    cxcolGridViewColumn2: TcxGridDBColumn;
    cxcolGridViewColumn3: TcxGridDBColumn;
    cxcolGridViewColumn4: TcxGridDBColumn;
    cxcolGridViewColumn5: TcxGridDBColumn;
    cxcolGridViewColumn6: TcxGridDBColumn;
    cxcolGridViewColumn7: TcxGridDBColumn;
    cxcolGridViewColumn8: TcxGridDBColumn;
    cxcolGridViewColumn9: TcxGridDBColumn;
    cxcolGridViewColumn10: TcxGridDBColumn;
    cxcolGridViewColumn11: TcxGridDBColumn;
    cxcolGridViewColumn12: TcxGridDBColumn;
    cxcolGridViewColumn13: TcxGridDBColumn;
    cxcolGridViewColumn14: TcxGridDBColumn;
    cxcolGridViewColumn15: TcxGridDBColumn;
    cxcolGridViewColumn16: TcxGridDBColumn;
    cxcolGridViewColumn17: TcxGridDBColumn;
    cxcolGridViewColumn18: TcxGridDBColumn;
    edtEffectiveTime: TcxTimeEdit;
    edtEndTime: TcxTimeEdit;
    pnlProduct: TPanel;
    lblProductName: TLabel;
    lblCatalogCode: TLabel;
    lblProductCode: TLabel;
    lblTambahRow: TcxLabel;
    lblHapusRow: TcxLabel;
    edtProdName: TEdit;
    edtCatalogCode: TEdit;
    edtProdCode: TEdit;
    procedure FormShow(Sender: TObject);
    procedure edtProdCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure strgGridCellValidate(Sender: TObject; ACol, ARow: Integer;
      var Value: String; var Valid: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnUpdateClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure edtQuotationNoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtRefDateKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtEffectiveDateKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtEffectiveTimeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtEndDateKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtEndTimeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRemarkKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lblHapusRowClick(Sender: TObject);
    procedure lblTambahRowClick(Sender: TObject);
    procedure strgGridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
  private
    FFormMode             : TFormMode;
    FIsProcessSuccessfull : Boolean;
    FMerGroupId           : Integer; // bernilai -1 jika tidak ada mergroup aktif
//    FQuotationMailer      : TNewQuotationPromo;
//    FBarang               : TNewBarang;
    FNoBuktiBuatMasterMailer: string;

    procedure InisialisasiFormNew;
    procedure InistialisasiGrid;
    procedure LoadDataDetail;
    procedure LoadDataBarangQuotation(aQuotationItem, aBaris: Integer);

    procedure LoadDataHargaQuotation(aQuotationItem, aBaris: Integer);
    procedure LoadDataHeader;

    { Private declarations }
  public
    FIDLokal: Integer;
    Function IsUOMAda(aKodeBrg:String) :Boolean ;
    function IsBarangSudahAda(aKodeBaru : string; aUOM:String): Boolean;
    function getBarisKosong: Integer;
    function GetNamaBarangByKode(aKode: String; aUnitID: Integer): string;
    procedure LoadDAtaToGrid(aBrgCode : String; aBrgUnitID : Integer);

    procedure UpdateQuotationMailerItem(aBaris, aQuotation: Integer);

    function IsPLUSudahAda(aKodeBaru:string; aUOM:String):    Boolean;
    procedure LoadPLUAllUOMJual(aPLU : String; aUnitID : Integer);
    function GetTipeHargaIDByName(TpHrgName: String; TpHrgUntID : Integer): Integer;
    function GetTipeHargaNameByID(TipeHargaID: Integer;TipeHArgaUntID:integer):
        string;
    procedure HapusDuplikatGrid(i : Integer);
    procedure LoadBarangByKode;
    procedure UbahIsParent;
    property FormMode: TFormMode read FFormMode write FFormMode;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write FIsProcessSuccessfull;
    property MerchandGroupId: Integer read FMerGroupId;
    property NoBuktiBuatMasterMailer: string read FNoBuktiBuatMasterMailer;

    procedure AturLebarKolom;
    function GetNoBuktiQuotation: string;
    function IsNoBuktiExisted(strKodeBrg:string; strUOM : string): Boolean;
    function IsProductFoundInQuotation: Boolean;
    function IsProdukKetemu(aKodeBrg:String; aUOM:String; aUnitID:Integer;
        aTglEfektif:TDateTime; aTglAkhir:TDateTime; aNoBukti:String): Boolean;
    function IsQuotationProcessed(aRefNo:String; aUnitID:Integer): Boolean;

    procedure HitungDisc(aBaris : Integer);
    procedure HitungDiscPersen(aBaris : Integer);
    procedure HitungMarginPersen(aBaris : Integer);
    procedure HitungMarginRupiah(aBaris : Integer);
    procedure HitungSellPriceDisc(aBaris : Integer);

    { Public declarations }
  end;

const
  _KolIsParent       : Integer = 0;
  _KolPLUPurchase    : Integer = 1;
  _KolPLU            : Integer = 2;
  _KolNamaBarang     : Integer = 3;
  _KolTipeHArga      : Integer = 4;
  _KolUOM            : Integer = 5;
  _KolHargaBeli      : Integer = 6;
  _KolUOMHargaBeli   : Integer = 7;
  _KolPPNPersen      : Integer = 8;
  _KolPrice          : Integer = 9;
  _KolDisc           : Integer = 10;
  _KolDiscPersen     : Integer = 11;
  _KolSetelahDisc    : Integer = 12;
  _KolHArgaAVGIncPPN : Integer = 13;
  _KolHArgaAVGExcPPN : Integer = 14;
  _MUPersen          : Integer = 15;
  _MURupiah          : Integer = 16;
  _KonvValue         : Integer = 17;
  _KolItemID         : Integer = 18;
  _KolKodeSupplier   : Integer = 19;
var
  frmDialogQuotationMailerNeo: TfrmDialogQuotationMailerNeo;

implementation
uses uTSCommonDlg,  uConstanta, uAppUtils;

{$R *.dfm}

procedure TfrmDialogQuotationMailerNeo.AturLebarKolom;
begin
  {with strgGrid do
  begin
    AutoSizeColumns(True, 5);
    AutoSizeCol(_KolNamaBarang);
    AutoSizeCol(_KolIsParent);
    AutoSizeCol(_KolPLUPurchase);
    AutoSizeCol(_KolPLU);
    AutoSizeCol(_KolTipeHArga);
    AutoSizeCol(_KolUOM);
    AutoSizeCol(_KolHArgaAVGExcPPN);
    AutoSizeCol(_MUPersen);
    AutoSizeCol(_MURupiah);
    AutoSizeCol(_KonvValue);
    AutoSizeCol(_KolPPNPersen);
    AutoSizeCol(_KolItemID);

    Columns[_KolItemID].Width := 0;
    //Columns[_KolKodeSupplier].Width := 0;
  end;
  }
end;

procedure TfrmDialogQuotationMailerNeo.FormShow(Sender: TObject);
begin
  inherited;
  InistialisasiGrid;
  {
  FQuotationMailer.LoadByID(FIDLokal, DialogUnit);
  if FIDLokal = 0 then
  begin
    InisialisasiFormNew;
    AturLebarKolom;
    edtQuotationNo.Text  := TNewQuotationPromo.GetNextNoBukti(DialogUnit); // FormatDateTime('yyyy.mm.dd-hh.mm.ss', cGetServerTime);
  end else begin
    LoadDataHeader;
    LoadDataDetail;
  end;
  }
end;

procedure TfrmDialogQuotationMailerNeo.edtProdCodeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sSQL: string;
begin
  inherited;

  {if (Key = VK_F5) then
  begin
  sSQL := 'select a.Brg_code as "Kode",a.brg_catalog as "Katalog",a.brg_alias as  "Nama" '
            + ' from barang a '
            + ' and a.BRG_IS_ACTIVE = 1'
            + ' and a.BRG_HARGA_AVERAGE > 0';

    with cLookUp('Daftar Barang',sSQL) do
    begin
      try
        cShowWaitWindow('Load Data ...');

        if Strings[0] = '' then
          Exit;

        edtProdCode.Text        := strings[0];
        edtCatalog.Text     := strings[1];
        edtProdName.Text    := Strings[2];
      finally
        Free;
        cCloseWaitWindow;
      end;
    end;
  end
  else if (Key = VK_RETURN) then
  begin
    if edtProdCode.Text='' then Exit;
    if Length(edtProdCode.Text) < igProd_Code_Length then Exit;

    if FBarang.LoadByKode(edtProdCode.Text) then
    begin
      edtProdName.Text  := FBarang.Alias;
      edtCatalog.Text   := FBarang.Catalog;
      if FBarang.IsActive <> 1 then
      begin
        CommonDlg.ShowError('Barang ' + FBarang.Kode + ' Sudah Tidak Aktif');
        edtProdCode.SetFocus;
        Exit;
      end;
    end;

    lblTambahClick(Sender);
    strgGrid.Columns[_KolPrice].Color := clGreen;
    strgGrid.Columns[_KolDisc].Color := clGreen;
    strgGrid.Columns[_KolDiscPersen].Color := clGreen;
  end;
   }
end;

procedure TfrmDialogQuotationMailerNeo.UbahIsParent;
var
  j: Integer;
  sPLU: string;
  sPLUPurchase, sPLUPurchase2 : string;
  i, itmp: Integer;
begin
  itmp := 0;
  {for i := 1 to strgGrid.RowCount - 1 do
  begin
    sPLU := strgGrid.Cells[_kolPLU, i];
    sPLUPurchase := strgGrid.Cells[_kolPLUPurchase, i];
    if sPLU <> sPLUPurchase then
    begin
      for j := 1 to strgGrid.RowCount - 1 do
      begin
        sPLUPurchase2 := strgGrid.Cells[_kolPLUPurchase, j];
        if sPLU = sPLUPurchase then
          strgGrid.SetCheckBoxState(_KolIsPArent, j, True)
        else
          strgGrid.SetCheckBoxState(_KolIsParent,j,False);
      end;
    end
    else begin
      for j := 1 to strgGrid.RowCount - 1 do
      begin
        if sPLUPurchase = strgGrid.Cells[_kolPLUPurchase, j] then
       Inc(itmp,1);
      end;

      if itmp > 1 then
      begin
        for j := 1 to strgGrid.RowCount - 1 do
        begin
          if sPLUPurchase = strgGrid.Cells[_kolPLUPurchase, j] then
            strgGrid.SetCheckBoxState(_KolIsPArent, j, True)
          else
            strgGrid.SetCheckBoxState(_KolIsParent,j,False);
        end;
      end;
    end;
  end;
  }
end;

function TfrmDialogQuotationMailerNeo.IsBarangSudahAda(aKodeBaru : string;
    aUOM:String): Boolean;
var
  i: Integer;
begin
  Result := False;
  {for i := 1 to strgGrid.RowCount do
  begin
    if (aKodeBaru = strgGrid.Cells[_kolPLU,i]) and (aUOM = strgGrid.Cells[_kolUOM,i]) then
    begin
      Result := True;

      CommonDlg.ShowError('Product dengan kode ' + edtProdCode.Text + ' dan nama ' + edtProdName.Text + ' sudah ada' );
      Exit;
    end;
  end;
  }
end;

Function TfrmDialogQuotationMailerNeo.IsUOMAda(aKodeBrg:String) :Boolean;
var
  SSQL: String;
Begin
  Result := False;
  SSQL := 'select b.BHJ_SAT_CODE'
           + ' from barang a, barang_harga_jual b, ref$tipe_harga c'
           + ' where a.brg_code = b.bhj_brg_code'
           + ' and b.bhj_tphrg_id = c.tphrg_id'
           + ' and a.brg_code = ' + QuotedStr(aKodeBrg)
           + ' and b.BHJ_UNT_ID =  ' + IntToStr(DialogUnit)
           + ' and c.tphrg_ID = 2';
  {with cOpenQuery(SSQL) do
  Begin
    Try
      if Fields[0].AsString <> '' then
        Result := True;
    Finally
      Free;
    End;
  End;
  }
End;

function TfrmDialogQuotationMailerNeo.getBarisKosong: Integer;
var
  i: Integer;
begin
  Result := 0;
  {for i := strgGrid.FixedRows to strgGrid.RowCount - 1  do
  begin
    if strgGrid.Cells[_KolPLUPurchase, i] = '' then
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

procedure TfrmDialogQuotationMailerNeo.LoadDAtaToGrid(aBrgCode : String;
    aBrgUnitID : Integer);
begin
  {with FBarang do
  begin
    try
      if not LoadByKode(aBrgCode) then
      begin
        CommonDlg.ShowError('PLU ' + aBrgCode + ' Tidak Ditemukan');
        Exit;
      end else if IsActive = 0 then
      begin
        CommonDlg.ShowError('PLU ' + aBrgCode + ' Sudah Tidak Aktif');
        Exit;
      end else if HargaAverage <= 0 then
      begin
        CommonDlg.ShowError('PLU ' + aBrgCode + ' Mempunyai Harga Rata-Rata <= 0');
        Exit;
      end;

      LoadPLUAllUOMJual(Kode, DialogUnit);
    finally
      //Free;
    end;
  end;

  }
end;

function TfrmDialogQuotationMailerNeo.IsPLUSudahAda(aKodeBaru:string; aUOM:String):
    Boolean;
var
  i: Integer;
begin
  Result := False;
  {
  for i := 1 to strgGrid.RowCount do
  begin
    if (aKodeBaru = strgGrid.Cells[_kolPLU,i]) and (aUOM = strgGrid.Cells[_kolUOM,i]) then
    begin
      CommonDlg.ShowError('Product Dengan Kode ' + edtProdCode.Text + ' dan Nama '
      + edtProdName.Text + ' Sudah Ada' );
      Result       := True;
      edtProdCode.SetFocus;
      strgGrid.Row := i;
      Exit;
    end;
  end;
  }
end;


procedure TfrmDialogQuotationMailerNeo.LoadPLUAllUOMJual(aPLU : String; aUnitID
    : Integer);
var
//  FBHJ: TBarangHargaJual;
  iBaris: Integer;
  sSQL: string;
begin
  sSQL := 'select bhj_id '
          + ' from barang_harga_jual'
          + ' where bhj_brg_code = ' + QuotedStr(aPLU)
          + ' and bhj_tphrg_id = 2'
          + ' and bhj_unt_id = ' + IntToStr(aUnitID);
  {
  with cOpenQuery(sSQL) do
  begin
    FBHJ := TBarangHargaJual.Create(Self);
    try
      while not Eof do
      begin
        if FBHJ.LoadByID(FieldByName('bhj_id').AsInteger, aUnitID) then
        begin
          if not IsPLUSudahAda(FBHJ.NewBarang.Kode, FBHJ.NewUOM.UOM) then
          begin
             iBaris := getBarisKosong;

             strgGrid.AddCheckBox(_KolIsParent,iBaris,True,True);
             strgGrid.SetCheckBoxState(_KolIsPArent, iBaris, False);

             strgGrid.Cells[_KolPLUPurchase , iBaris]     := FBHJ.NewBarang.KodePurchase ;
             strgGrid.Cells[_KolPLU, iBaris]              := FBHJ.NewBarang.Kode;
             strgGrid.Cells[_KolNAmaBArang, iBaris]       := FBHJ.NewBarang.Alias;
             strgGrid.Cells[_KolTipeHarga, iBaris]        := FBHJ.GetTipeHargaName;
             strgGrid.Cells[_KolUOM,iBaris]               := FBHJ.NewUOM.UOM;
             strgGrid.Floats[_KolPrice, iBaris]           := FBHJ.SellPrice;
             strgGrid.Floats[_KolDisc, iBaris]            := FBHJ.DiscNominal;
             strgGrid.Floats[_KolDiscPersen, iBaris]      := FBHJ.DiscPersen;
             strgGrid.Floats[_KolSetelahDisc, iBaris]     := FBHJ.SellPriceDisc;
             strgGrid.Floats[_KolPPNPersen,iBaris]        := FBHJ.NewBarang.NewPajak.PPN;
             strgGrid.Floats[_KonvValue,iBaris]           := FBHJ.NewBarang.GetUOMValue(FBHJ.NewUOM.UOM);
             strgGrid.Cells[_KolKodeSupplier, iBaris]     := GetLastSupCode(FBHJ.NewBarang.Kode);

             strgGrid.Floats[_KolHargaBeli,iBaris]        := FBHJ.NewBarang.GetHargaBeli(strgGrid.Cells[_KolKodeSupplier, iBaris]);
             strgGrid.Cells[_KolUOMHargaBeli,iBaris]      := FBHJ.NewBarang.GetSatuanHargaBeli(strgGrid.Cells[_KolKodeSupplier, iBaris]);

             strgGrid.Floats[_KolHArgaAVGExcPPN,iBaris]   := FBHJ.NewBarang.GetHargaAVG(FBHJ.NewUOM.UOM);
             strgGrid.Floats[_KolHArgaAVGIncPPN,iBaris]   := FBHJ.NewBarang.GetHargaAVG(FBHJ.NewUOM.UOM) * (FBHJ.NewBarang.NewPajak.PPN + 100) / 100;
             strgGrid.Ints[_KolItemID,iBaris]             := 0;
                         
             HitungMarginPersen(iBaris);
             HitungMarginRupiah(iBaris);
           end;


        end;
        Next;
      end;
    finally
      FBHJ.Free;
      Free;
    end;
  end;
  }
end;

procedure TfrmDialogQuotationMailerNeo.FormCreate(Sender: TObject);
begin
  inherited;
  {FQuotationMailer     := TNewQuotationPromo.Create(Self);
  FBarang              := TNewBarang.Create(Self);
  FormStyle            := FormStyle;
  IsProcessSuccessfull := False;
  }
end;

function TfrmDialogQuotationMailerNeo.GetNamaBarangByKode(aKode: String; aUnitID:
    Integer): string;
var
  sSQL: string;
begin
  Result := '';
  sSQL := ' select brg_alias '
          + ' from barang '
          + ' where brg_code = ' + QuotedStr(aKode);

  {with cOpenQuery(sSQL) do
  begin
    try
      Result := FieldByname('brg_alias').AsString;
    finally
      Free
    end;
  end;
  }
end;

function TfrmDialogQuotationMailerNeo.GetTipeHargaIDByName(TpHrgName: String; TpHrgUntID
    : Integer): Integer;
var
  sSQL: string;
begin
  Result := 0 ;
  sSQL := ' select tphrg_id '
          + ' from ref$tipe_harga '
          + ' where tphrg_name = ' + QuotedStr(TpHrgName)
          + ' and tphrg_unt_id = ' + IntToStr(TpHrgUntID);
  {with cOpenQuery(sSQL) do
  begin
    try
      if not Fields[0].IsNull then
        Result := FieldByName('tphrg_id').AsInteger;
    finally
      Free;
    end;
  end;
  }
end;

function TfrmDialogQuotationMailerNeo.GetTipeHargaNameByID(TipeHargaID: Integer;
    TipeHArgaUntID:integer): string;
var
  sSQL: string;
begin
  Result := '';
  sSQL := 'select tpHrg_name '
          + ' from ref$Tipe_Harga '
          + ' where tpHrg_ID = ' + IntToStr(TipeHargaID)
          + ' and tpHrg_unt_ID = ' + IntToStr(TipeHArgaUntID);
  {with cOpenQuery(sSQL) do
  begin
    try
      Result := FieldByName('tpHrg_name').AsString;
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmDialogQuotationMailerNeo.HapusDuplikatGrid(i : Integer);
var
  iAkhir1, iAkhir2: Integer;
  sBrgCode1, sTipeHarga1 , sBrgCode2, sTipeHarga2 : string;
begin
  {
  for iakhir1 := i downto 1  do
  begin
    sBrgCode1 := strgGrid.Cells[_kolPLU, iakhir1];
    sTipeHarga1 := strgGrid.Cells[_kolTipeHarga,iakhir1];
    for iakhir2 := strgGrid.RowCount - 1 downto 1 do
    begin
      if iAkhir1 <> iAkhir2 then
      begin
        sBrgCode2 := strgGrid.Cells[_kolPLU, iakhir2];
        sTipeHarga2 := strgGrid.Cells[_kolTipeHarga, iakhir2];
        if ((sBrgCode1 = sBrgCode2) and (sTipeHarga1 = sTipeHarga2)) then
        begin
          strgGrid.Rows[iAkhir1].Clear;
          strgGrid.RemoveSelectedRows;
          i := i - 1;
          HapusDuplikatGrid(i);
        end;
      end;
    end;
  end;
  strgGrid.RemoveDuplicates(_KolPLU,True);
  }
end;

procedure TfrmDialogQuotationMailerNeo.LoadBarangByKode;
var
  aKode : string;
begin
  {aKode := strgGrid.Cells[_KolPLU,strgGrid.Row];
  if Trim(aKode) <> '' then
  begin
    if FBarang.LoadByKode(aKode) then
    begin
      edtProdCode.Text := FBarang.Kode;
      edtProdName.Text := FBarang.Alias;
      edtCatalog.Text := FBarang.Catalog;
    end;
  end;
  }
end;


procedure TfrmDialogQuotationMailerNeo.footerDialogMasterbtnSaveClick(
  Sender: TObject);
var
  dtEff: tDateTime;
  dtNow: tDateTime;
  sNoBukti: string;
  dtEndDateTime: TDateTime;
  dtRefDateTime: TDateTime;
  i: Integer;
begin
  inherited;

  dtRefDateTime := EncodeDateTime(YearOf(dtEffectiveDate.Date), MonthOf(dtEffectiveDate.Date), DayOf(dtEffectiveDate.Date), HourOf(edtEffectiveTime.Time), MinuteOf(edtEffectiveTime.Time), SecondOf(edtEffectiveTime.Time), 0);
  dtEndDateTime := EncodeDateTime(YearOf(dtEndDate.Date), MonthOf(dtEndDate.Date), DayOf(dtEndDate.Date), HourOf(edtEndTime.Time), MinuteOf(edtEndTime.Time), SecondOf(edtEndTime.Time), 0);

  if dtEffectiveDate.Date = 0 then
  begin
    CommonDlg.ShowMessage('Tanggal Efektif Kosong');
    dtEffectiveDate.SetFocus;
    Exit;
  end;

  if dtEndDate.Date = 0 then
  begin
    CommonDlg.ShowMessage('Tanggal Akhir Kosong');
    dtEffectiveDate.SetFocus;
    Exit;
  end;

  if  dtEndDateTime <= dtRefDateTime then
  begin
    CommonDlg.ShowMessage('End Date Harus Lebih Besar dari Effective Date');
    Exit;
  end;

//  dtNow := cGetServerTime;
  dtEff := dtRefDateTime;
  If (dtEff <= dtNow) then
  Begin
    CommonDlg.ShowMessage('Waktu Effective Date harus > waktu sekarang !');
    Exit;
  End;

  if edtRemark.Text = '' then
  begin
    CommonDlg.ShowMessage('Remark Kosong');
    edtRemark.SetFocus;
    Exit;
  end;

  if IsQuotationProcessed(edtQuotationNo.Text,DialogUnit) then
    Exit;

  if IsProductFoundInQuotation then
    Exit;

  {
  FQuotationMailer.UpdateData(dtRefDateTime,FIDLokal,0,dtRefDate.Date,edtQuotationNo.Text,edtRemark.Text,DialogUnit,dtEndDateTime,1);


  FQuotationMailer.QuotationPromoItems.Clear;
  for i := 2 to strgGrid.RowCount - 1 do
  begin
    if strgGrid.Cells[_MUPersen,i] = '' then
      Continue;

    UpdateQuotationMailerItem(i, FQuotationMailer);
  end;

  try

    cShowWaitWindow('Sedang Menyimpan Data');
    if FQuotationMailer.ExecuteGenerateSQL then
    begin
      IsProcessSuccessfull := True;
      cCommitTrans;

      sNoBukti := edtQuotationNo.Text;


    cCloseWaitWindow; // biar messagenya ga ketutupan. >> BP
    if CommonDlg.Confirm('Berhasil Menyimpan Data Quotation Mailer' + #13 + 'Apakah Anda Akan Mencetak Quotation Mailer ?') = mrYes then
      DoPrintSlipQuotationMailer(sNoBukti, DialogUnit, FLoginFullname, FDialogUnitName);

    end else
    begin
      cRollbackTrans;
      CommonDlg.ShowError('Gagal Menyimpan Data');
    end;     
  finally
    cCloseWaitWindow;
    cRollBackTrans;
    Close;
  end;
  }
end;

procedure TfrmDialogQuotationMailerNeo.UpdateQuotationMailerItem(aBaris,
    aQuotation: Integer);
var
  sKodeSupplier: string;
  dDiscPersen: Double;
  dDisc: Double;
  iItemID: Integer;
  sTipeHargaName: string;
  iTipeHargaID: Integer;
  iTIpeHargaUnitID: Integer;
  iUnitID: Integer;
  iQuotationUnitID: Integer;
  dPrice: Double;
  aKodeSatuanUnitID: Integer;
  sKodeSatuan: string;
  sKodeBarangUnitID: Integer;
  sKodeBarangParentUnitID: Integer;
  sKodeBarangParent: string;
  sKodeBarang: string;
  dMUPersen: Double;
  dMURupiah: Double;
  dMUHargaPPN: Double;
  dHargaRata: Double;
begin
  {dMUPersen               := strgGrid.Floats[_MuPersen,aBaris];
  dMURupiah               := strgGrid.Floats[_MURupiah,aBaris];
  dMUHargaPPN             := dMURupiah;  // ini ga perlu pake PPN
  sKodeBarang             := strgGrid.Cells[_KolPLU, aBaris] ;
  sKodeBarangParent       := strgGrid.Cells[_KolPLUPurchase,aBaris];
  sKodeBarangParentUnitID := DialogUnit;
  sKodeBarangUnitID       := DialogUnit;
  sKodeSatuan             := strgGrid.Cells[_KolUOM,aBaris];
  aKodeSatuanUnitID       := DialogUnit;
  dPrice                  := strgGrid.Floats[_KolPrice,aBaris];
  dDisc                   := strgGrid.Floats[_KolDisc,aBaris];
  dDiscPersen             := strgGrid.Floats[_KolDiscPersen,aBaris];
  iQuotationUnitID        := DialogUnit;
  iUnitID                 := DialogUnit;
  sTipeHargaName          := strgGrid.Cells[_KolTipeHArga,aBaris];
  iTIpeHargaUnitID        := DialogUnit;
  iTipeHargaID            := GetTipeHargaIDByName(sTipeHargaName,DialogUnit);
  iItemID                 := StrToInt(strgGrid.Cells[_KolItemID,aBaris]);
  dHargaRata              := strgGrid.Floats[_KolHArgaAVGExcPPN,aBaris];
  sKodeSupplier           := strgGrid.Cells[_KolKodeSupplier,aBaris];


  aQuotation.UpdateQuotationItems(
             sKodeSupplier,
             dMUPersen,
             dMURupiah,
             dMUHargaPPN,
             iItemID,
             sKodeBarang,
             sKodeBarangParent,
             sKodeSatuan,
             dPrice,
             iQuotationUnitID,
             iUnitID,
             iTipeHargaID,
             dHargaRata,
             dDisc,
             dDiscPersen
             );
  }
end;


procedure TfrmDialogQuotationMailerNeo.strgGridCellValidate(Sender: TObject;
  ACol, ARow: Integer; var Value: String; var Valid: Boolean);
var
  dMURupiah: Double;
  dDiscPersen: Double;
  dDisc: Double;
  dMUPersen: Double;
  dHarga: Double;
begin
  inherited;
  {if ACol in [_KolPrice]then
  begin
    if not TryStrToFloat(Value, dHarga) then
      Valid := False
    else
    begin
      HitungDisc(ARow);
      HitungSellPriceDisc(ARow);
      HitungMarginPersen(ARow);
      HitungMarginRupiah(ARow);

      strgGrid.EditMode := False;
      strgGrid.AutoSizeCol(ACol);
    end;
  end else if aCol = _MUPersen then
  begin
    if not TryStrToFloat(Value, dMUPersen) then
      Valid := False
    else begin
      strgGrid.Floats[_KolSetelahDisc,aRow] := (strgGrid.Floats[_MUPersen,aRow] + 100) * strgGrid.Floats[_KolHArgaAVGIncPPN,aRow] / 100;

      if strgGrid.Floats[_KolDiscPersen,aRow] <> 0 then
        strgGrid.Floats[_KolPrice,aRow]       := strgGrid.Floats[_KolSetelahDisc,aRow] / strgGrid.Floats[_KolDiscPersen,aRow] * 100
      else
        strgGrid.Floats[_KolPrice,aRow]       := strgGrid.Floats[_KolSetelahDisc,aRow];

      HitungDisc(ARow);
      HitungSellPriceDisc(ARow);
      HitungMarginRupiah(ARow);

      strgGrid.AutoSizeCol(ACol);
    end;
  end  else if aCol = _MURupiah then
  begin

    if not TryStrToFloat(Value, dMURupiah) then
      Valid := False
    else begin
      strgGrid.Floats[_KolSetelahDisc,aRow] := strgGrid.Floats[_KolHArgaAVGIncPPN,aRow] + dMURupiah;

      if strgGrid.Floats[_KolDiscPersen,aRow] <> 0 then
        strgGrid.Floats[_KolPrice,aRow]       := strgGrid.Floats[_KolSetelahDisc,aRow] / strgGrid.Floats[_KolDiscPersen,aRow] * 100
      else
        strgGrid.Floats[_KolPrice,aRow]       := strgGrid.Floats[_KolSetelahDisc,aRow];

      HitungDisc(ARow);
      HitungSellPriceDisc(ARow);
      HitungMarginPersen(ARow);

      strgGrid.AutoSizeCol(ACol);
    end;
  end else if ACol = _KolDisc then
  begin
    if not TryStrToFloat(Value, dDisc) then
      Valid := False
    else begin
      HitungDiscPersen(ARow);
      HitungSellPriceDisc(ARow);
      HitungMarginPersen(ARow);
      HitungMarginRupiah(ARow);

      strgGrid.AutoSizeCol(ACol);
    end;
  end else if ACol = _KolDiscPersen then
  begin
    if not TryStrToFloat(Value, dDiscPersen) then
      Valid := False
    else begin
      HitungDisc(ARow);
      HitungSellPriceDisc(ARow);
      HitungMarginPersen(ARow);
      HitungMarginRupiah(ARow);

      strgGrid.AutoSizeCol(ACol);
    end;
  end;
  }
end;

procedure TfrmDialogQuotationMailerNeo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogQuotationMailerNeo.btnUpdateClick(Sender: TObject);
begin
  inherited;
//  DoPrintSlipQuotationMailer(edtQuotationNo.Text, DialogUnit, FLoginFullname, FDialogUnitName);
end;

procedure TfrmDialogQuotationMailerNeo.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (ssCtrl in Shift) then
  begin
    if Key = Ord('T') then
    begin
      lblTambahRowClick(nil);
    end else if Key = Ord('R') then
    begin
      lblHapusRowClick(nil);
    end;
  end;
end;

function TfrmDialogQuotationMailerNeo.IsNoBuktiExisted(strKodeBrg:string; strUOM:string): Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'select b.quotd_brg_code, a.quot_date, quot_date_effective, quot_end_date'
       + ' from quotation_promo a, quotationpromo_detil b'
       + ' where a.quot_id = b.quotd_quot_id'
       + ' and a.quot_unt_id = b.quotd_unt_id'
       + ' and a.quot_ref_no = ' + QuotedStr(edtQuotationNo.Text) ;
  {with cOpenQuery(sSQL) do
  Begin
    if Fields[0].AsString <> '' then
    Begin
      Result := True;
    End;

  End;
  }
end;

function TfrmDialogQuotationMailerNeo.IsProductFoundInQuotation: Boolean;
var
  dtEffDateTime: TDateTime;
  strUOM: String;
  i: Integer;
  strKodeBrg: string;
begin
  Result := False;

  dtEffDateTime := EncodeDateTime(YearOf(dtEffectiveDate.Date), MonthOf(dtEffectiveDate.Date), DayOf(dtEffectiveDate.Date), HourOf(edtEffectiveTime.Time), MinuteOf(edtEffectiveTime.Time), SecondOf(edtEffectiveTime.Time), 0);

  {for i := strgGrid.FixedRows to strgGrid.RowCount - 1 do
  begin
    strKodeBrg := strgGrid.Cells[_KolPLU,i];
    strUOM := strgGrid.Cells[_kolUOM,i];
    if IsProdukKetemu(strKodeBrg, strUOM, DialogUnit, dtEffDateTime,
    dtEndDate.Date, edtQuotationNo.Text) then
    Begin
      Result       := True;
      CommonDlg.ShowError('Barang dengan kode ' + strKodeBrg + ' sudah dibuatkan Quotation !');
      strgGrid.SetFocus;
      strgGrid.Row := i;
      Exit;
    End;
  end;
  }
end;

function TfrmDialogQuotationMailerNeo.IsProdukKetemu(aKodeBrg:String; aUOM:String;
    aUnitID:Integer; aTglEfektif:TDateTime; aTglAkhir:TDateTime;
    aNoBukti:String): Boolean;
var
  sSQL: String;
begin
  Result := false ;
  sSQL := 'select count(a.QUOT_ID) as "IDQuotation" '
       + ' from QUOTATION_PROMO a, QUOTATIONPROMO_DETIL b'
       + ' where a.QUOT_ID = b.QUOTD_QUOT_ID'
       + ' and a.QUOT_UNT_ID = b.QUOTD_UNT_ID'
       + ' and a.QUOT_REF_NO <> ' + QuotedStr(aNoBukti)
       + ' and b.QUOTD_BRG_CODE = ' + QuotedStr(aKodeBrg)
       + ' and a.QUOT_UNT_ID = ' + IntToStr(aUnitID)
       + ' and b.QUOTD_SAT_CODE = ' + QuotedStr(aUOM)
       + ' and ' + TAppUtils.QuotD(aTglEfektif) + ' between '
       + ' a.QUOT_DATE_EFFECTIVE '
       + ' and a.QUOT_END_DATE group by b.QUOTD_BRG_CODE' ;
  {
  with cOpenQuery(sSQL) do
  Begin
    Try
      if Fields[0].AsInteger > 0 then
      Begin
        Result := True;
        Exit;
      End;
    Finally
      Free;
    End;
  End;
  }
end;

procedure TfrmDialogQuotationMailerNeo.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = Ord('R')) and (ssctrl in Shift) then
    lblHapusRowClick(Sender)
  else if (Key = Ord('T')) and (ssctrl in Shift) then
    lblTambahRowClick(Sender);
end;

procedure TfrmDialogQuotationMailerNeo.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogQuotationMailerNeo := nil;
  frmDialogQuotationMailerNeo.Free;
end;

procedure TfrmDialogQuotationMailerNeo.HitungDisc(aBaris : Integer);
begin
//  strgGrid.Floats[_KolDisc,aBaris] := (strgGrid.Floats[_KolPrice,aBaris] * strgGrid.Floats[_KolDiscPersen,aBaris] / 100);
end;

procedure TfrmDialogQuotationMailerNeo.HitungDiscPersen(aBaris : Integer);
begin
//  if strgGrid.Floats[_KolPrice,aBaris] <> 0 then
//    strgGrid.Floats[_KolDiscPersen,aBaris] := strgGrid.Floats[_KolDisc,aBaris] / strgGrid.Floats[_KolPrice,aBaris] * 100
//  else
//    strgGrid.Floats[_KolDiscPersen,aBaris] := 0;
end;

procedure TfrmDialogQuotationMailerNeo.HitungMarginPersen(aBaris : Integer);
begin
//  if strgGrid.Floats[_KolHArgaAVGIncPPN,aBaris] <> 0 then
//    strgGrid.Floats[_MUPersen,aBaris] := (strgGrid.Floats[_KolSetelahDisc,aBaris] - strgGrid.Floats[_KolHArgaAVGIncPPN,aBaris]) / strgGrid.Floats[_KolHArgaAVGIncPPN,aBaris] * 100
//  else
//    strgGrid.Floats[_MUPersen,aBaris] := 0;
end;

procedure TfrmDialogQuotationMailerNeo.HitungMarginRupiah(aBaris : Integer);
begin
//  strgGrid.Floats[_MURupiah,aBaris] := strgGrid.Floats[_KolSetelahDisc,aBaris] - strgGrid.Floats[_KolHArgaAVGIncPPN,aBaris];
end;

procedure TfrmDialogQuotationMailerNeo.HitungSellPriceDisc(aBaris : Integer);
begin
//  strgGrid.Floats[_KolSetelahDisc,aBaris] := strgGrid.Floats[_KolPrice,aBaris] - strgGrid.Floats[_KolDisc,aBaris];
end;


function TfrmDialogQuotationMailerNeo.IsQuotationProcessed(aRefNo:String;
    aUnitID:Integer): Boolean;
var
  sSQL: String;
begin
//  Result := False;
  sSQL := 'select count(QUOT_ID) as QuotID from QUOTATION_PROMO '
       + ' where QUOT_REF_NO = ' + QuotedStr(aRefNo)
       + ' and QUOT_UNT_ID = ' + IntToStr(aUnitID)
       + ' and QUOT_IS_PROCESSED = 1 ' ;
  {
  With cOpenQuery(sSQL) do
  Begin
    Try
      if Fields[0].AsInteger > 0 then
      Begin
        Result := True;
        CommonDlg.ShowError('Quotation mailer sudah diproses !');
      End
      else
        Result := False;
    Finally
      Free;
    End;
  End;
  }
end;

procedure TfrmDialogQuotationMailerNeo.edtQuotationNoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  inherited;
  if (Key = VK_Return) then
  dtRefDate.SetFocus;
end;

procedure TfrmDialogQuotationMailerNeo.dtRefDateKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  inherited;
  if (Key = VK_Return) then
  dtEffectiveDate.SetFocus; 
end;

procedure TfrmDialogQuotationMailerNeo.dtEffectiveDateKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  inherited;
  if (Key = VK_Return) then
  edtEffectiveTime.SetFocus;
end;

procedure TfrmDialogQuotationMailerNeo.dtEffectiveTimeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  inherited;
  if (Key = VK_Return) then
  edtEndTime.SetFocus;
end;

procedure TfrmDialogQuotationMailerNeo.dtEndDateKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  inherited;
  if (Key = VK_Return) then
  edtEndTime.SetFocus;
end;

procedure TfrmDialogQuotationMailerNeo.dtEndTimeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  inherited;
  if (Key = VK_Return) then
  edtRemark.SetFocus;
end;

procedure TfrmDialogQuotationMailerNeo.edtRemarkKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_Return) then
    cxGrid.SetFocus;
end;

function TfrmDialogQuotationMailerNeo.GetNoBuktiQuotation: string;
begin
//  Result := FQuotationMailer.RefNo;
end;

procedure TfrmDialogQuotationMailerNeo.InisialisasiFormNew;
begin
//  dtRefDate.Date       := cGetServerTime;
//  dtEffectiveDate.Date := cGetServerTime + 1;
  edtEffectiveTime.Time := StrToTime('12:00:00 AM');
//  dtEndDate.Date       := cGetServerTime  + 1;
  edtEndTime.Time       := StrToTime('12:00:00 PM');
  edtRemark.Text       := '';

//  cClearGrid(strgGrid,False);

//  dtRefDate.Date       := cGetServerTime;
end;

procedure TfrmDialogQuotationMailerNeo.InistialisasiGrid;
begin
  {with strgGrid do
  begin
    MergeCells(0,0,1,2);
    MergeCells(_KolIsParent,0,1,2);
    MergeCells(_KolPLUPurchase,0,1,2);
    MergeCells(_KolPLU,0,1,2);
    MergeCells(_KolNamaBarang,0,1,2);
    MergeCells(_KolTipeHArga,0,1,2);
    MergeCells(_KolUOM,0,1,2);
    MergeCells(_KolPPNPersen,0,1,2);
    MergeCells(_KolHargaBeli,0,2,1);
    MergeCells(_KolPrice,0,4,1);
    MergeCells(_KolHArgaAVGIncPPN,0,2,1);
    MergeCells(_MUPersen,0,2,1);
    MergeCells(_KonvValue,0,1,2);
    MergeCells(_KolItemID,0,1,2);
    MergeCells(_KolKodeSupplier,0,1,2);

    Cells[_KolHargaBeli,1]        := 'Harga';
    Cells[_KolUOMHargaBeli,1]     := 'UOM';
    Cells[_KolPrice,1]            := 'Harga [A]';
    Cells[_KolDisc,1]             := 'Diskon [B]';
    Cells[_KolDiscPersen,1]       := 'Diskon % [C]';
    Cells[_KolSetelahDisc,1]      := '[A - B]';
    Cells[_KolHArgaAVGIncPPN,1]   := 'Inc PPN';
    Cells[_KolHArgaAVGExcPPN,1]   := 'Exc PPN';
    Cells[_MUPersen,1]            := '%';
    Cells[_MURupiah,1]            := 'Rp';
    Cells[_KolKodeSupplier,1]     := 'Kode Sup';

    AturLebarKolom;
  end;
  }
end;

procedure TfrmDialogQuotationMailerNeo.lblHapusRowClick(Sender: TObject);
begin
  inherited;
  {if strgGrid.RowCount <= 3 then
      strgGrid.Rows[2].Clear
    else begin
      strgGrid.Rows[strgGrid.Row].Clear;
      strgGrid.RemoveSelectedRows;
    end;
    }
end;

procedure TfrmDialogQuotationMailerNeo.lblTambahRowClick(Sender: TObject);
var ss : TStrings;
  i: Integer;
  sParentAkhir: string;
begin
  inherited;
   if edtProdCode.Text = '' then
   begin
     CommonDlg.ShowMessage('Data Product Kosong');
     Exit;
   end;

   if not IsBarangSudahAda(edtProdCode.Text,'') then
   begin
//     sParentAkhir := GetParentPalingAkhir(edtProdCode.Text,DialogUnit);
//     ss := LoadDataQuotation(sParentAkhir,DialogUnit);
     for i := 0 to ss.Count - 1 do
     begin
       LoadDAtaToGrid(ss[i],DialogUnit);
     end;

     UbahIsParent;

     edtProdCode.Text       := '';
     edtProdName.Text   := '';
     edtCatalogCode.Text    := '';
     edtProdCode.SetFocus;

     AturLebarKolom;
//     SetWarnaBarisSG(strgGrid);
   end;
end;


procedure TfrmDialogQuotationMailerNeo.LoadDataDetail;
var
  iBaris: Integer;
  i: Integer;
begin
  {ClearAdvStringGrid(strgGrid);

  cClearGrid(strgGrid,False);

  for i := 0 to FQuotationMailer.QuotationPromoItems.Count - 1 do
  begin
    iBaris := i + 2;
    with strgGrid do
    begin
      strgGrid.AddCheckBox(_KolIsParent, iBaris,True,True);
      strgGrid.SetCheckBoxState(_KolIsPArent, iBaris, False);

      LoadDataBarangQuotation(FQuotationMailer.QuotationPromoItems[i], iBaris);
      LoadDataHargaQuotation(FQuotationMailer.QuotationPromoItems[i], iBaris);

      Ints[_KolItemID, iBaris]        := FQuotationMailer.QuotationPromoItems[i].ID;

      if i + 1 < FQuotationMailer.QuotationPromoItems.Count then
        strgGrid.AddRow;
    end;
  end;

  UbahIsParent;
  AturLebarKolom;
  SetWarnaBarisSG(strgGrid);
   }
end;

procedure TfrmDialogQuotationMailerNeo.LoadDataHargaQuotation(aQuotationItem,
    aBaris: Integer);
begin
  {with strgGrid do
  begin
    Floats[_KolPrice , aBaris]      := aQuotationItem.Price;
    Floats[_KolDiscPersen , aBaris] := aQuotationItem.DiscPersen;

    HitungDisc(aBaris);
    HitungSellPriceDisc(aBaris);
    HitungMarginPersen(aBaris);
    HitungMarginRupiah(aBaris);
  end;
  }
end;

procedure TfrmDialogQuotationMailerNeo.LoadDataBarangQuotation(aQuotationItem,
    aBaris: Integer);
//var
//  FLokalBarang: TNewBarang;
begin
  {
  with strgGrid do
  begin
    FLokalBarang := aQuotationItem.Barang;
    try
      Cells[_KolPLUPurchase, aBaris]      := aQuotationItem.Barang.KodePurchase;
      Cells[_KolPLU, aBaris]              := FLokalBarang.Kode;
      Cells[_KolNamaBarang, aBaris]       := FLokalBarang.Alias;
      Cells[_KolUOM, aBaris]              := aQuotationItem.KodeSatuan;
      Cells[_kolTipeHArga, aBaris]        := GetTipeHargaNameByID(aQuotationItem.TipeHargaID,DialogUnit);
      Floats[_KolHargaBeli,aBaris]        := FLokalBarang.GetHargaBeli(GetLastSupCode(FLokalBarang.Kode));
      Cells[_KolUOMHargaBeli,aBaris]      := FLokalBarang.GetSatuanHargaBeli(GetLastSupCode(FLokalBarang.Kode));
      Floats[_KolPPNPersen, aBaris]       := FLokalBarang.NewPajak.PPN;
      Floats[_KolHArgaAVGExcPPN, aBaris]  := FLokalBarang.GetHargaAVG(aQuotationItem.KodeSatuan);
      Floats[_KolHArgaAVGIncPPN, aBaris]  := FLokalBarang.GetHargaAVG(aQuotationItem.KodeSatuan) * (100 + FLokalBarang.NewPajak.PPN) / 100;
      Floats[_KonvValue, aBaris]          := aQuotationItem.GetKonversiValue;
      Cells[_KolKodeSupplier,aBaris]      := GetLastSupCode(FLokalBarang.Kode);
    finally
      FLokalBarang.Free;
    end;
  end;
  }
end;

procedure TfrmDialogQuotationMailerNeo.LoadDataHeader;
begin
  {with FQuotationMailer do
  begin
    dtEffectiveDate.Date  := EffectifDate;
    dtEffectiveTime.Time  := EffectifDate;
    dtRefDate.Date        := QuotDate;
    dtEndDate.Date        := EndDate;
    dtEndTime.Time        := EndDate;
    edtQuotationNo.Text   := RefNo;
    edtRemark.Text        := Remark;

    edtProdCode.Text          := '';
    edtCatalog.Text       := '';
    edtProdName.Text      := '';
  end;
  }
end;

procedure TfrmDialogQuotationMailerNeo.strgGridCanEditCell(Sender: TObject;
  ARow, ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  CanEdit := False;
  if (ACol in [_KolPrice, _KolDisc, _KolDiscPersen, _MUPersen, _MURupiah])  then
    CanEdit := True;
end;

end.
