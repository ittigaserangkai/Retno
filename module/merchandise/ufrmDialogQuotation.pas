unit ufrmDialogQuotation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialogBrowse, ExtCtrls, StdCtrls,
  ufrmQuotation, uRetnoUnit,DB,jpeg, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit, cxButtonEdit;

type
  TQuotDetilInfo = record
    Id: Integer;
    Plu: string;
    PluPurchase: string;
    UomBhj: string;
    UomStok: string;
    UomStokPurchase: string;
    Price: Currency;
    Disc1: Extended;
    Disc2: Extended;
    Disc3: Currency;
    QtyConvertion: Extended;
    IsEdited: Boolean;
    KonversiSatuanScale: Extended;
  end;

  TFormMode = (fmAdd, fmEdit);
  TfrmDialogQuotation = class(TfrmMasterDialogBrowse)
    pnlTop: TPanel;
    lbl1: TLabel;
    edtSupplierName: TEdit;
    lbl7: TLabel;
    cbpMerchGroup: TcxComboBox;
    edtMGName: TEdit;
    Label1: TLabel;
    lbl3: TLabel;
    dtRefDate: TcxDateEdit;
    Label2: TLabel;
    edtLeadTime: TEdit;
    lbl2: TLabel;
    Label4: TLabel;
    edtTOP: TEdit;
    Label3: TLabel;
    dtEffectiveDate: TcxDateEdit;
    Label5: TLabel;
    edtRemark: TEdit;
    edtQuotationNo: TEdit;
    cbpSupplierCode: TcxComboBox;
    edtSupplier: TcxButtonEdit;
    edtMGCode: TcxButtonEdit;
    img1: TImage;
    edtKode: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure edtKodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure jvlblTambahClick(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure strgGridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure FormShow(Sender: TObject);
    procedure strgGridClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure btn1Click(Sender: TObject);
    procedure edtSupplierKeyPress(Sender: TObject; var Key: Char);
    procedure edtSupplierKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSupplierClickBtn(Sender: TObject);
    procedure edtMGCodeClickBtn(Sender: TObject);
    procedure edtMGCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridCellValidate(Sender: TObject; ACol, ARow: Integer;
      var Value: String; var Valid: Boolean);
    procedure footerDialogMasterbtnCloseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtQuotationNoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtEffectiveDateKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRemarkKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMGCodeKeyPress(Sender: TObject; var Key: Char);
  private
    FFormMode             : TFormMode;
    FIsProcessSuccessfull : Boolean;
//    FQuotation            : TNewQuotation;
//    FSuplier              : TNewSupplier;
//    FSupMerchanGrup       : TNewSupplierMerGroup;

    procedure AturLebarKolom;
    procedure InisialisasiForm;
    procedure LoadDataBarangQuotation(aQuotationItem, aBaris: Integer; aSupCode:
        String);
    procedure LoadDataHargaQuotation(aQuotationItem, aBaris: Integer);
    procedure LoadDataQuotationHeader;
    procedure LoadDataQuotationItemToGrid;
    procedure LoadDataSupMerGroup(aMGCOde : String; aSupplierCode : String ;
        aUnitID : Integer);
    procedure LoadDataSupplier(aSupCode : String; aUnitID : Integer);

    procedure RefreshFrmQuotation;
    procedure UpdateQuotationItem(aBaris, aQuotation: Integer);
  public
    FIDLokal      : Integer;
    FIsProcessed  : Integer;

    procedure CekBarangKode(sbrgCode : String; ibrgUnitID : Integer; sSupCode :
        string; sbrgCodePurchase : string);
    function IsPLUSudahAda(aKodeBaru : string; aUOM:String): Boolean;
    function getBarisKosong: Integer;
    function GetNamaBarangByKode(aKode: String; aUnitID: Integer): string;
    procedure LoadDAtaToGrid(sbrgCode : String; ibrgUnitID : Integer; sSupCode :
        string; aMerGroupCode : String);
    function SearchMerchanGrupIDByMerchanGrupCode(MerchanGrupCode:string): Integer;
    function GetTipeHargaIDByName(TpHrgName: String; TpHrgUntID : Integer): Integer;
    function GetTipeHargaNameByID(TipeHargaID: Integer;TipeHArgaUntID:integer):
        string;
    procedure HapusDuplikatGrid(i : Integer);
    procedure HitungDisc(aBaris : Integer);
    procedure HitungDiscPersen(aBaris : Integer);
    procedure HitungMarginPersen(aBaris : Integer);
    procedure HitungMarginRupiah(aBaris : Integer);
    procedure HitungSellPriceDisc(aBaris : Integer);
    procedure InisialisasiGrid;
    function IsProductFoundInQuotation: Boolean;
    function IsProdukSdhAdaQuotation(aKodeBrg :String; aUOM:String;
        aUnitID:Integer; aTglEfektif:TDateTime; aTglAkhir:TDateTime;
        aNoBukti:String): Boolean;
    function IsQuotationProcessed(aRefNo:String; aUnitID:Integer): Boolean;
    procedure LoadBarangByKode;
    procedure LoadDAtaToGrid2(sbrgCode : String; ibrgUnitID : Integer; sSupCode :
        string);
    procedure LoadDataTOGrid3(sbrgCode : String; ibrgUnitID : Integer; sSupCode :
        string; sbrgCodePurchase : string);
    procedure LoadPLUAllUOMJual(aPLU : String; aUnitID : Integer; aSupCode :
        String);
    procedure UbahIsParent;
    property FormMode: TFormMode read FFormMode write FFormMode;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write FIsProcessSuccessfull;
  end;


var
  frmDialogQuotation: TfrmDialogQuotation;

const
  _KolIsParent      : Integer = 0;
  _KolPLUPurchase   : Integer = 1;
  _KolPLU           : Integer = 2;
  _KolNamaBarang    : Integer = 3;
  _KolTipeHArga     : Integer = 4;
  _KolUOM           : Integer = 5;
  _KolHargaBeli     : Integer = 6;
  _KolUOMHargaBeli  : Integer = 7;
  _KolPPNPersen     : Integer = 8;
  _KolPrice         : Integer = 9;
  _KolDisc          : Integer = 10;
  _KolDiscPersen    : Integer = 11;
  _KolSetelahDisc   : Integer = 12;
  _KolHArgaAVGIncPPN: Integer = 13;
  _KolHArgaAVGExcPPN: Integer = 14;
  _MUPersen         : Integer = 15;
  _MURupiah         : Integer = 16;
  _KonvValue        : Integer = 17;
  _KolItemID        : Integer = 18;
  _isMailer         : Integer = 19;  

implementation

uses  uTSCommonDlg, ufrmSearchProduct, DateUtils, Math, uConstanta, uAppUtils;

{$R *.dfm}

procedure TfrmDialogQuotation.FormCreate(Sender: TObject);
begin
  inherited;

//  FQuotation            := TNewQuotation.create(Self);
//  Fsuplier              := TNewSupplier.Create(Self);
//  FIsProcessSuccessfull := False;
//  FSupMerchanGrup       := TNewSupplierMerGroup.Create(Self);

  edtSupplier.Text      := '';
  edtMGName.Text        := '';
  edtMGCode.Text        := '';
  edtQuotationNo.Text   := '';
//  dtRefDate.Date        := cGetServerTime;
//  dtEffectiveDate.Date  := cGetServerTime + 1;
end;

procedure TfrmDialogQuotation.edtKodeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var sSQL : string;
begin
  inherited;
  if (Key = VK_F5) then
  begin
    sSQL := 'select a.Brg_code as Kode, a.brg_catalog as Katalog, a.brg_alias as Nama'
            + ' from barang a, barang_suplier b, SUPLIER_MERCHAN_GRUP c,REF$MERCHANDISE_GRUP d'
            + ' where a.brg_code = b.brgsup_brg_code'
            + ' and b.BRGSUP_SUPMG_SUB_CODE = c.SUPMG_SUB_CODE'
            + ' and c.SUPMG_MERCHANGRUP_ID = d.MERCHANGRUP_ID'
            + ' and a.BRG_HARGA_AVERAGE > 0'
            + ' and b.brgsup_sup_code = ' + QuotedStr(edtSupplier.Text)
            + ' and d.MERCHANGRUP_CODE = ' + QuotedStr(edtMGCode.Text);
    {
    with cLookUp('Daftar Barang',sSQL) do
    begin
      try
        if Strings[0] = '' then
          Exit;

        edtKode.Text := strings[0];
        edtCatalog.Text := strings[1];
        edtProdName.Text := Strings[2];
      finally
        Free;
      end;
    end;  }
  end
  else if (Key = VK_RETURN) and not (ssctrl in Shift) then
  begin
    jvlblTambahClick(nil);
    edtKode.SetFocus;
    edtKode.SelectAll;
  end else if (Key = VK_UP) then
  begin
    cxGrid.SetFocus;
  end;

end;


procedure TfrmDialogQuotation.FormDestroy(Sender: TObject);
begin
  inherited;
//  FreeAndNil(FQuotation);
//  FreeAndNil(Fsuplier);
  frmDialogQuotation := nil;
end;


procedure TfrmDialogQuotation.jvlblTambahClick(Sender: TObject);
var
  SS : TStrings;
  i: Integer;
  sParentAkhir: string;
begin
  inherited;
 if edtKode.Text = '' then
 begin
   CommonDlg.ShowMessage('Data Product Kosong');
   Exit;
 end;

 if not IsPLUSudahAda(edtKode.Text,'') then
 begin
//   sParentAkhir := GetParentPalingAkhir(edtKode.Text,DialogUnit);
//   SS           := LoadDataQuotation(sParentAkhir,DialogUnit);

   for i := 0 to ss.Count - 1 do
   begin
     LoadDAtaToGrid(SS[i],DialogUnit,edtSupplier.Text, edtMGCode.Text);
   end;
   
   UbahIsParent;
 end;

 AturLebarKolom;
// SetWarnaBarisSG(strgGrid);
end;

procedure TfrmDialogQuotation.footerDialogMasterbtnSaveClick(
  Sender: TObject);
var
  sRef: string;
  sSvr: string;
  sEff: string;
  dtSvr: TDate;
  dtEff: TDate;
  dtRef: TDate;
  i: Integer;
begin
  inherited;
  IsProcessSuccessfull := False;
  edtQuotationNo.SetFocus;

  if IsQuotationProcessed(edtQuotationNo.Text,DialogUnit) then
    Exit;

//  if FSuplier.Kode = '' then
  begin
    CommonDlg.ShowMessage('Kode Suplier Kosong');
    edtSupplier.SetFocus;
    Exit;
  end;

//  if FSupMerchanGrup.Kode = '' then
  begin
    CommonDlg.ShowMessage('Merchandise Group Kosong');
    edtMGCode.SetFocus;
    Exit;
  end;

  if dtEffectiveDate.Date = 0 then
  begin
    CommonDlg.ShowMessage('Tanggal Efektif Kosong');
    dtEffectiveDate.SetFocus;
    Exit;
  end;

  dtEff := dtEffectiveDate.Date;
//  dtSvr := cGetServerTime;
  dtRef := dtRefDate.Date;

  sEff  := DateToStr(dtEff);
  sSvr  := DateToStr(dtSvr);
  sRef  := DateToStr(dtRef);

  dtEff := StrToDate(sEff);
  dtSvr := StrToDate(sSvr);
  dtRef := StrToDate(sRef);

  if dtEff < dtSvr then
  Begin
    CommonDlg.ShowMessage('Waktu Effective Date harus > tanggal sekarang !');
    Exit;
  End;

  if dtEff < dtRef then
  begin
    CommonDlg.ShowMessage('Waktu Effective Date harus >= Quatation Date!');
    Exit;
  end;

  if dtRef < dtSvr then
  begin
    CommonDlg.ShowMessage('Waktu Quatation Date harus > tanggal sekarang!');
    Exit;
  end;

  if IsQuotationProcessed(edtQuotationNo.Text,DialogUnit) then
    Exit;

  if IsProductFoundInQuotation then
    Exit;
  {
  FQuotation.UpdateData(dtEffectiveDate.Date,FIDLokal,FIsProcessed,dtRefDate.Date,edtQuotationNo.Text,edtRemark.Text,FSupMerchanGrup.Kode,DialogUnit,DialogUnit,dtEffectiveDate.Date,0);

  FQuotation.QuotationItems.Clear;
  for i := 2 to strgGrid.RowCount - 1 do
  begin
    if strgGrid.Cells[_MUPersen,i] = '' then
      Continue;
      
    UpdateQuotationItem(i, FQuotation);
  end;

  try
    if FQuotation.ExecuteGenerateSQL then
    begin
      cCommitTrans;

      if (CommonDlg.Confirm('Berhasil Simpan Data' + #13 + 'Apakah Anda Akan Mencetak Slip Quotation Harga Jual ?') = mrYes) then
        DoSlipQuotationHJ(FQuotation.RefNo, DialogUnit, FLoginFullname, FDialogUnitName);

      RefreshFrmQuotation;
    end else
    begin
      cRollbackTrans;
      CommonDlg.ShowError('Gagal Menyimpan Data');
    end;
  finally
    cRollBackTrans;
    IsProcessSuccessfull := True;
  end;
  Close; }
end;

procedure TfrmDialogQuotation.strgGridCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  CanEdit := False;
  if (ACol in [_KolPrice, _KolDisc, _KolDiscPersen, _MUPersen, _MURupiah])  then
    CanEdit := True;
end;




procedure TfrmDialogQuotation.strgGridRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  inherited;
   LoadBarangByKode;
end;

procedure TfrmDialogQuotation.strgGridGetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  FloatFormat := '%.2n';
  if (ARow > 1) and  (ACol in [_KolPrice,_KolSetelahDisc, _KolHArgaAVGIncPPN, _KolHArgaAVGExcPPN, _MUPersen, _MURupiah]) then
    IsFloat := True
  else
    IsFloat := False;
end;


procedure TfrmDialogQuotation.AturLebarKolom;
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
    Columns[_isMailer].Width := 0;
  end;
  }
end;

procedure TfrmDialogQuotation.CekBarangKode(sbrgCode : String; ibrgUnitID :
    Integer; sSupCode : string; sbrgCodePurchase : string);

begin
    LoadDAtaToGrid2(sbrgCode,ibrgUnitID,sSupCode);

     LoadDAtaToGrid2(sbrgCodePurchase,ibrgUnitID,sSupCode);


     //Load semua data menggunakan filter brg_purchase_code = sbrgCodePurchase
     // dan brg_code <> sbrgCode
     //dan brg_code <> sbrgCodePurchase
     LoadDataTOGrid3(sbrgCode,ibrgUnitID,sSupCode,sbrgCodePurchase);


end;

function TfrmDialogQuotation.IsPLUSudahAda(aKodeBaru:string; aUOM:String):
    Boolean;
var
  i: Integer;
begin
  Result := False;
  {for i := 1 to strgGrid.RowCount do
  begin
    if (aKodeBaru = strgGrid.Cells[_kolPLU,i]) and (aUOM = strgGrid.Cells[_kolUOM,i]) then
    begin
      CommonDlg.ShowError('Product Dengan Kode ' + edtKode.Text + ' dan Nama '
      + edtProdName.Text + ' Sudah Ada' );
      Result       := True;
      edtKode.SetFocus;
      strgGrid.Row := i;
      Exit;
    end;
  end;
  }
end;

procedure TfrmDialogQuotation.FormShow(Sender: TObject);
begin
  inherited;
  InisialisasiForm;
  InisialisasiGrid;

  {
  if FormMode = fmadd then
  begin
    edtQuotationNo.Text   := TNewQuotation.GetNextNoBukti(DialogUnit);
    FIsProcessed          := 0;
    dtRefDate.Date        := cGetServerTime;
    dtEffectiveDate.Date  := cGetServerTime + 1;
  end else begin
    if FQuotation.LoadByID(FIDLokal,DialogUnit) then
    begin
      LoadDataQuotationHeader;
      LoadDataQuotationItemToGrid;
    end else begin
      CommonDlg.ShowError('Quotation Tidak Ditemukan');
      Exit;
    end;
  end;
   }
end;

function TfrmDialogQuotation.getBarisKosong: Integer;
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
  end;}
end;

function TfrmDialogQuotation.GetNamaBarangByKode(aKode: String; aUnitID:
    Integer): string;
var
  sSQL: string;
begin
  Result := '';
  sSQL := ' select brg_Alias '
          + ' from barang '
          + ' where brg_code = ' + QuotedStr(aKode);
  {
  with cOpenQuery(sSQL) do
  begin
    try
      Result := FieldByname('brg_alias').AsString;
    finally
      Free
    end;
  end;
  }
end;

procedure TfrmDialogQuotation.LoadDAtaToGrid(sbrgCode : String; ibrgUnitID :
    Integer; sSupCode : string; aMerGroupCode : String);
var sSQL : string;
//  FBarang: TNewBarang;
  iBaris: Integer;
  dNominalKolMUPersen, dNominalKolMURupiah , dNominalKolRataRata: Double;
begin
  {FBarang := TNewBarang.Create(Self);
  with FBarang do
  begin
    try
      if not LoadByKode(sbrgCode) then
      begin
        CommonDlg.ShowError('PLU ' + sbrgCode + ' Tidak Ditemukan');
        Exit;
      end else if IsActive = 0 then
      begin
        CommonDlg.ShowError('PLU ' + sbrgCode + ' Sudah Tidak Aktif');
        Exit;
      end else if HargaAverage <= 0 then
      begin
        CommonDlg.ShowError('PLU ' + sbrgCode + ' Mempunyai Harga Rata-Rata <= 0');
        Exit;
      end else if not IsBeliDariSupplier(sSupCode, aMerGroupCode) then
      begin
        CommonDlg.ShowError('PLU ' + sbrgCode + ' Bukan Berasal Dari Merchandise ' + aMerGroupCode);
        Exit;
      end;

      LoadPLUAllUOMJual(Kode, DialogUnit, sSupCode);
    finally
      Free;
    end;

  end;

  Exit;
  SSQL := 'select distinct a.brg_code,a.BRG_CODE_PURCHASE,  a.BRG_ALIAS ,  a.brg_harga_average, c.tphrg_name ,  b.bhj_sat_code , '
          + ' b.bhj_sell_price , d.BRGSUP_DISC1 , d.BRGSUP_DISC2 , d.BRGSUP_DISC3 , b.BHJ_CONV_VALUE ,g.PJK_PPN'
          + ' from barang a, barang_harga_jual b, ref$tipe_harga c, barang_suplier d, '
          + ' suplier_merchan_grup e, REF$MERCHANDISE_GRUP f , REF$PAJAK g'
          + ' where a.brg_code = b.bhj_brg_code '
          + ' and b.bhj_tphrg_id = c.tphrg_id '
          + ' and b.bhj_tphrg_unt_id = c.tphrg_unt_id '
          + ' and a.brg_code = d.brgsup_brg_code '
          + ' and d.BRGSUP_SUPMG_SUB_CODE = e.SUPMG_SUB_CODE '
          + ' and e.SUPMG_MERCHANGRUP_ID = f.MERCHANGRUP_ID '
          + ' and a.brg_code = ' + Quot(sbrgcode)
          + ' and c.tphrg_ID = 2'
          + ' and e.supmg_code = ' + Quot(edtSupplier.Text)
          + ' and f.merchangrup_code = ' + Quot(edtMGCode.Text)
          + ' and a.BRG_HARGA_AVERAGE > 0'
          + ' and a.BRG_PJK_ID = g.PJK_ID '

          + ' order by c.tphrg_name ';

 with cOpenQuery(sSQL) do
 begin
   try
       while not Eof do
       begin
         if not IsPLUSudahAda(FieldByNAme('brg_code').AsString, FieldByName('bhj_sat_code').AsString) then
         begin
           iBaris := getBarisKosong;
           if iBaris = 0 then
           begin
             strgGrid.AddRow;
             iBaris := strgGrid.RowCount - 1;
           end;

           strgGrid.AddRow;
           strgGrid.AddCheckBox(_KolIsParent,iBaris,True,True);
           strgGrid.SetCheckBoxState(_KolIsPArent, iBaris, False);

           strgGrid.Cells[_KolPLUPurchase , iBaris]     := FieldByName('BRG_CODE_PURCHASE').AsString ;
           strgGrid.Cells[_KolPLU, iBaris]              := FieldByNAme('brg_code').AsString;
           strgGrid.Cells[_KolNAmaBArang, iBaris]       := FieldByname('BRG_ALIAS').AsString;
           strgGrid.Cells[_KolTipeHarga, iBaris]        := FieldByName('tphrg_name').AsString;
           strgGrid.Cells[_KolUOM,iBaris]               := FieldByName('bhj_sat_code').AsString;
           strgGrid.Floats[_KolPrice, iBaris]           := (FieldByName('bhj_sell_price').AsFloat);
           strgGrid.Cells[_KolPPNPersen,iBaris]         := FieldByName('PJK_PPN').AsString;
           strgGrid.Cells[_KolHArgaAVGExcPPN,iBaris]    := FieldByName('brg_harga_average').AsString;
           strgGrid.Cells[_KolItemID, iBaris]           := '0';

           dNominalKolRataRata := StrTofloat(FieldByName('brg_harga_average').AsString) * StrTofloat(FieldByName('BHJ_CONV_VALUE').AsString) * (100 + strgGrid.Floats[_KolPPNPersen,iBaris]) / 100;

           strgGrid.Cells[_KonvValue, iBaris ]          := FieldByName('BHJ_CONV_VALUE').AsString;

           if dNominalKolRataRata <> 0 then
             dNominalKolMUPersen := 100 * (FieldByName('bhj_sell_price').AsFloat - dNominalKolRataRata) / dNominalKolRataRata
           else
             dNominalKolMUPersen := 0;

           dNominalKolMURupiah    :=  (FieldByName('bhj_sell_price').AsFloat - dNominalKolRataRata)/ ((100 + FieldByName('PJK_PPN').asFloat) / 100);

           strgGrid.Floats[_KolHArgaAVGExcPPN, iBaris]  := (dNominalKolRataRata);
           strgGrid.Floats[_MUPersen, iBaris]           := (dNominalKolMUPersen);
           strgGrid.Floats[_MURupiah, iBaris ]          := (dNominalKolMURupiah);

         end;
           Next;
       end;
   finally
     Free;
   end;
 end;
     AturLebarKolom;
     }
end;

function TfrmDialogQuotation.SearchMerchanGrupIDByMerchanGrupCode(
    MerchanGrupCode:string): Integer;
var
  sSQL: string;
begin
  sSQL := 'select merchangrup_ID '
          + ' from ref$merchandise_grup '
          + ' where merchangrup_code = ' + QuotedStr(MerchanGrupCode);
  {with cOpenQuery(sSQL) do
  begin
    try
      Result := StrToInt(FieldByName('merchangrup_ID').AsString);
    finally
      Free
    end;
  end;
  }
end;

function TfrmDialogQuotation.GetTipeHargaIDByName(TpHrgName: String; TpHrgUntID
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

function TfrmDialogQuotation.GetTipeHargaNameByID(TipeHargaID: Integer;
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

procedure TfrmDialogQuotation.HapusDuplikatGrid(i : Integer);
var
  iAkhir1, iAkhir2: Integer;
  sBrgCode1, sTipeHarga1 , sBrgCode2, sTipeHarga2 : string;
begin
  {for iakhir1 := i downto 1  do
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

procedure TfrmDialogQuotation.LoadBarangByKode;
var   sSQL: string;
begin
  sSQL := 'select brg_code, brg_catalog, brg_alias '
          + ' from barang '
{          + ' where brg_code = ' + QuotedStr(strgGrid.Cells[_KolPLU,strgGrid.Row]);
  with cOpenQuery(sSQL) do
  begin
    try
    begin
      edtKode.Text := FieldByName('brg_code').AsString;
      edtCatalog.Text := FieldByName('brg_catalog').AsString;
      edtProdName.Text := FieldByName('brg_alias').AsString;
    end;
    finally
      Free;
    end;
  end; }
end;

procedure TfrmDialogQuotation.LoadDAtaToGrid2(sbrgCode : String; ibrgUnitID :
    Integer; sSupCode : string);
var
  iBaris: Integer;
  sbrgCodePurchase: string;
  SSQL: string;
begin
 SSQL := 'select a.brg_code ,a.BRG_CODE_PURCHASE,  a.brg_name ,a.BRG_ALIAS, c.tphrg_name ,  b.bhj_sat_code , a.brg_harga_average, '
          + ' b.bhj_sell_price , d.BRGSUP_DISC1 , d.BRGSUP_DISC2 , d.BRGSUP_DISC3 , b.BHJ_CONV_VALUE , H.PJK_PPN'
          + ' from barang a, barang_harga_jual b, ref$tipe_harga c, barang_suplier d, '
          + ' suplier_merchan_grup e, REF$MERCHANDISE_GRUP f, suplier g , ref$pajak h'
          + ' where a.brg_code = b.bhj_brg_code '
          + ' and b.bhj_tphrg_id = c.tphrg_id '
          + ' and b.bhj_tphrg_unt_id = c.tphrg_unt_id '
          + ' and a.brg_code = d.brgsup_brg_code '
          + ' and d.BRGSUP_SUPMG_SUB_CODE = e.SUPMG_SUB_CODE '
          + ' and e.SUPMG_MERCHANGRUP_ID = f.MERCHANGRUP_ID '
          + ' and d.BRGSUP_SUP_CODE = g.sup_code '
          + ' and a.BRG_PJK_ID = h.PJK_ID'
          + ' and a.brg_code = ' + QuotedStr(sbrgcode)
          + ' and g.sup_code = ' + QuotedStr(sSupCode)
          + ' order by c.tphrg_name ';
 {
 with cOpenQuery(sSQL) do
 begin
   try
     if not FieldByName('brg_code').IsNull then
     begin
       sbrgCode := FieldByName('brg_code').AsString;
       sbrgCodePurchase := FieldByName('BRG_CODE_PURCHASE').AsString;
         iBaris := getBarisKosong;
         if iBaris = 0 then
         begin
           strgGrid.AddRow;
           iBaris := strgGrid.RowCount - 1;
         end;

         while not Eof do
         begin
           strgGrid.AddCheckBox(_KolIsParent,iBaris,True,True);
           strgGrid.SetCheckBoxState(_KolIsPArent, iBaris, False);
           strgGrid.Cells[_KolPLUPurchase , iBaris] := sbrgCodePurchase ;
           strgGrid.Cells[_KolPLU, iBaris]          := FieldByNAme('brg_code').AsString;
           strgGrid.Cells[_KolNAmaBArang, iBaris]   := FieldByname('BRG_ALIAS').AsString;
           strgGrid.Cells[_KolTipeHarga, iBaris]    := FieldByName('tphrg_name').AsString;
           strgGrid.Cells[_KolUOM,iBaris]           := FieldByName('bhj_sat_code').AsString;
           strgGrid.Cells[_KolPrice, iBaris]        := FieldByName('bhj_sell_price').AsString;
           strgGrid.Cells[_MUPersen, iBaris]        := FieldByName('BRGSUP_DISC1').AsString;
           strgGrid.Cells[_MURupiah, iBaris ]       := FieldByName('BRGSUP_DISC2').AsString;
           strgGrid.Cells[_KonvValue,iBaris]        := FieldByName('BHJ_CONV_VALUE').AsString;
           strgGrid.Cells[_KolPPNPersen,iBaris]     := FieldByName('PJK_PPN').AsString;
           strgGrid.Cells[_KolHArgaAVGExcPPN,iBaris]     := FieldByName('brg_harga_average').AsString;
           strgGrid.Cells[_KolItemID,iBaris]        := '0';
           Next;
           if not Eof then
           begin
             strgGrid.AddRow;
             Inc(iBaris);
           end;
         end;
     AturLebarKolom;
     end;
   finally
     Free;
   end;
  end;
  }
end;

procedure TfrmDialogQuotation.LoadDataTOGrid3(sbrgCode : String; ibrgUnitID :
    Integer; sSupCode : string; sbrgCodePurchase : string);
var  SSQL: string;
  iBaris: Integer;
begin
 SSQL := 'select a.brg_code,a.BRG_CODE_PURCHASE,  a.brg_alias , c.tphrg_name ,  b.bhj_sat_code , '
          + ' b.bhj_sell_price , d.BRGSUP_DISC1 , d.BRGSUP_DISC2 , d.BRGSUP_DISC3 , b.BHJ_CONV_VALUE,h.pjk_ppn '
          + ' from barang a, barang_harga_jual b, ref$tipe_harga c, barang_suplier d, '
          + ' suplier_merchan_grup e, REF$MERCHANDISE_GRUP f, suplier g, ref$pajak h '
          + ' where a.brg_code = b.bhj_brg_code '
          + ' and b.bhj_tphrg_id = c.tphrg_id '
          + ' and b.bhj_tphrg_unt_id = c.tphrg_unt_id '
          + ' and a.brg_code = d.brgsup_brg_code '
          + ' and d.BRGSUP_SUPMG_SUB_CODE = e.SUPMG_SUB_CODE '
          + ' and e.SUPMG_MERCHANGRUP_ID = f.MERCHANGRUP_ID '
          + ' and d.BRGSUP_SUP_CODE = g.sup_code '
          + ' and a.BRG_PJK_ID = h.PJK_ID'
          + ' and a.BRG_CODE_PURCHASE = ' + QuotedStr(sbrgCodePurchase)
          + ' and g.sup_code = ' + QuotedStr(sSupCode)
          + ' and a.brg_code <> a.BRG_CODE_PURCHASE'
          + ' and a.brg_code <> ' + QuotedStr(sbrgCode)
          + ' order by c.tphrg_name ';
 {
 with cOpenQuery(sSQL) do
 begin
   try
     if not FieldByName('brg_code').IsNull then
     begin
       sbrgCode := FieldByName('brg_code').AsString;
       sbrgCodePurchase := FieldByName('BRG_CODE_PURCHASE').AsString;
         iBaris := getBarisKosong;
         if iBaris = 0 then
         begin
           strgGrid.AddRow;
           iBaris := strgGrid.RowCount - 1;
         end;

         while not Eof do
         begin
           strgGrid.AddCheckBox(_KolIsParent,iBaris,True,True);
           strgGrid.SetCheckBoxState(_KolIsPArent, iBaris, False);
           strgGrid.Cells[_KolPLUPurchase , iBaris] := sbrgCodePurchase ;
           strgGrid.Cells[_KolPLU, iBaris]          := FieldByNAme('brg_code').AsString;
           strgGrid.Cells[_KolNAmaBArang, iBaris]   := FieldByname('brg_alias').AsString;
           strgGrid.Cells[_KolTipeHarga, iBaris]    := FieldByName('tphrg_name').AsString;
           strgGrid.Cells[_KolUOM,iBaris]           := FieldByName('bhj_sat_code').AsString;
           strgGrid.Cells[_KolPrice, iBaris]        := FieldByName('bhj_sell_price').AsString;
           strgGrid.Cells[_MUPersen, iBaris]        := FieldByName('BRGSUP_DISC1').AsString;
           strgGrid.Cells[_MURupiah, iBaris ]       := FieldByName('BRGSUP_DISC2').AsString;
           strgGrid.Cells[_KonvValue,iBaris]        := FieldByName('BHJ_CONV_VALUE').AsString;
           strgGrid.Cells[_KolPPNPersen,iBaris]     := FieldByName('pjk_ppn').AsString;
           strgGrid.Cells[_KolHArgaAVGExcPPN,iBaris]     := FieldByName('brg_harga_average').AsString;
           strgGrid.Cells[_KolItemID,iBaris]        := '0';
           Next;
           if not Eof then
           begin
             strgGrid.AddRow;
             Inc(iBaris);
           end;
         end;
     AturLebarKolom;
     end;
   finally
     Free;
   end;
  end;
  }
end;

procedure TfrmDialogQuotation.strgGridClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  inherited;
  LoadBarangByKode;
end;

procedure TfrmDialogQuotation.UbahIsParent;
var
  j: Integer;
  sPLU: string;
  sPLUPurchase, sPLUPurchase2 : string;
  i, itmp: Integer;
begin
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
      itmp := 0;
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

procedure TfrmDialogQuotation.btn1Click(Sender: TObject);
begin
  inherited;
//  HapusDuplikatGrid(strgGrid.RowCount - 1);
end;

procedure TfrmDialogQuotation.edtSupplierKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

procedure TfrmDialogQuotation.edtSupplierKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

  if (Key = VK_RETURN) then
  begin
    LoadDataSupplier(edtSupplier.Text, DialogUnit);
  end
  else if (Key = VK_F5) then
  begin
    edtSupplierClickBtn(Self);
  end;
end;

procedure TfrmDialogQuotation.edtSupplierClickBtn(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
    sSQL := ' Select sup_code as " Kode", sup_name as " Nama" '
            + ' from Suplier ';
    {
    with cLookUp('Suplier',sSQL) do
    begin
      try
        if Strings[0] = '' then
          Exit;

        edtSupplier.Text := Strings[0];
      finally
        Free;
      end;
    end;
    }
end;

procedure TfrmDialogQuotation.edtMGCodeClickBtn(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
sSQL := ' select c.merchangrup_code as "Kode", c.merchangrup_name as "Nama", b.supmg_merchangrup_id as "Id" '
        + ' from suplier a, suplier_merchan_grup b, ref$merchandise_grup c'
        + ' where b.supmg_code = ' + QuotedStr(edtSupplier.Text)
        + ' and c.merchangrup_id = b.supmg_merchangrup_id'
        + ' and a.sup_code = b.supmg_code ';
    {
    with cLookUp('Merchandise',sSQL) do
    begin
      try
        if Strings[0] = '' then
          Exit;

        edtMGCode.Text := Strings[0];
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmDialogQuotation.edtMGCodeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) then
  begin
    edtMGCodeClickBtn(Self)  
  end else if (Key = VK_RETURN) then
  begin
    LoadDataSupMerGroup(edtMGCode.Text, edtSupplier.Text, DialogUnit);
  end; 

end;

procedure TfrmDialogQuotation.strgGridCellValidate(Sender: TObject; ACol,
  ARow: Integer; var Value: String; var Valid: Boolean);
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

procedure TfrmDialogQuotation.footerDialogMasterbtnCloseClick(
  Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmDialogQuotation.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {
  if (ssCtrl in  Shift) and (Key = Ord('R')) then
      jvlblHapusClick(Sender)
  Else If (ssCtrl in  Shift) and (Key = Ord('T')) then
      jvlblTambahClick(Sender)   
  Else If (Key = VK_Return) and (ssCtrl in  Shift)   then
  begin
    if strgGrid.EditMode then
    begin
      strgGrid.Col := _KolPLU;
      strgGrid.Col := _KolPrice;
      strgGrid.EditMode := False;
    end;


    footerDialogMasterbtnSaveClick(Sender);
  end
  Else If (Key = VK_ESCAPE) Then
    Close;
    }
end;

function TfrmDialogQuotation.IsProductFoundInQuotation: Boolean;
var
  strUOM: String;
  i: Integer;
  strKodeBrg: string;
begin
  Result := False;
  {
  for i := strgGrid.FixedRows to strgGrid.RowCount - 1 do
  begin
    strKodeBrg := strgGrid.Cells[_KolPLU,i];
    strUOM := strgGrid.Cells[_kolUOM,i];
    if IsProdukSdhAdaQuotation(strKodeBrg, strUOM, DialogUnit, dtEffectiveDate.Date, dtRefDate.Date,
       edtQuotationNo.Text) then
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

function TfrmDialogQuotation.IsProdukSdhAdaQuotation(aKodeBrg :String;
    aUOM:String; aUnitID:Integer; aTglEfektif:TDateTime; aTglAkhir:TDateTime;
    aNoBukti:String): Boolean;
var
  sSQL: String;
begin
  Result := false ;
  sSQL := 'select count(QUOT_ID) as "IDQuotation" '
       + ' from quotation a, quotation_detil b'
       + ' where a.quot_id = b.quotd_quot_id'
       + ' and a.quot_unt_id = b.quotd_unt_id '
       + ' and a.quot_ref_no <> ' + QuotedStr(aNoBukti)
       + ' and b.quotd_brg_code = ' + QuotedStr(aKodeBrg)
       + ' and b.quotd_sat_code = ' + QuotedStr(aUOM)
       + ' and a.quot_unt_id = ' + IntToStr(aUnitID)
       + ' and a.quot_date_effective =' + TAppUtils.QuotD(aTglEfektif) ;
  {
  with cOpenQuery(sSQL) do
  Begin
    if Fields[0].AsInteger > 0 then
    Begin
      Result := True;
      Exit;
    End;
  End;
   }
end;

procedure TfrmDialogQuotation.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogQuotation.edtQuotationNoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key=VK_RETURN then
    dtEffectiveDate.SetFocus;
end;

procedure TfrmDialogQuotation.dtEffectiveDateKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key=VK_RETURN then
    edtRemark.SetFocus;
end;

procedure TfrmDialogQuotation.edtRemarkKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key=VK_RETURN then
    edtKode.SetFocus;
end;

procedure TfrmDialogQuotation.InisialisasiForm;
begin
//  dtRefDate.Date        := cGetServerTime;

  edtSupplier.Text      := '';
  edtSupplierName.Text  := '';
  cbpMerchGroup.Text    := '';
  edtMGName.Text        := '';
  edtQuotationNo.Text   :='';
  dtRefDate.Text        := '';
  edtLeadTime.Text      := '';
  edtTOP.Text           := '';
  dtEffectiveDate.Text  := '';
  edtRemark.Text        := '';

//  cClearGrid(strgGrid,False);
end;

function TfrmDialogQuotation.IsQuotationProcessed(aRefNo:String;
    aUnitID:Integer): Boolean;
var
  sSQL: String;
begin
  sSQL := 'select count(QUOT_ID) as QuotID from Quotation '
       + ' where QUOT_REF_NO = ' + QuotedStr(aRefNo)
       + ' and QUOT_UNT_ID = ' + IntToStr(aUnitID)
       + ' and QUOT_IS_PROCESSED = 1';
  {
  With cOpenQuery(sSQL) do
  Begin
    Try
      if Fields[0].AsInteger > 0 then
      Begin
        Result := True;
        CommonDlg.ShowError('Quotation sudah diproses !');
      End
      else
        Result := False;
    Finally
      Free;
    End;
  End;
  }
end;

procedure TfrmDialogQuotation.LoadDataQuotationHeader;
begin
  {with FQuotation do
  begin
    FSupMerchanGrup.LoadByKode(SupmgSubCode);
    LoadDataSupplier(FSupMerchanGrup.NewSupplier.Kode,DialogUnit);

    FSupMerchanGrup.LoadByKode(SupmgSubCode);
    LoadDataSupMerGroup(FSupMerchanGrup.NewMerchadizeGroup.Kode, FSuplier.Kode, DialogUnit);

    dtEffectiveDate.Date  := EffectifDate;
    FIsProcessed          := IsProcessed;
    dtRefDate.Date        := QuotDate;
    edtQuotationNo.Text   := RefNo;
    edtRemark.Text        := Remark;

    edtKode.Text          := '';
    edtCatalog.Text       := '';
    edtProdName.Text      := '';
  end;
  }
end;

procedure TfrmDialogQuotation.LoadDataQuotationItemToGrid;
var
  iBaris: Integer;
  i: Integer;
begin
  {cClearGrid(strgGrid,False);

  for i := 0 to FQuotation.QuotationItems.Count - 1 do
  begin
    iBaris := i + 2;
    with strgGrid do
    begin
      strgGrid.AddCheckBox(_KolIsParent, iBaris,True,True);
      strgGrid.SetCheckBoxState(_KolIsPArent, iBaris, False);

      LoadDataBarangQuotation(FQuotation.QuotationItems[i], iBaris, edtSupplier.Text);
      LoadDataHargaQuotation(FQuotation.QuotationItems[i], iBaris);

      Ints[_isMailer, iBaris]         := FQuotation.IsMailer;
      Ints[_KolItemID, iBaris]        := FQuotation.QuotationItems[i].ID;

      if i + 1 < FQuotation.QuotationItems.Count then
        strgGrid.AddRow;
    end;
  end;

  UbahIsParent;
  AturLebarKolom;
  SetWarnaBarisSG(strgGrid);
  }
end;

procedure TfrmDialogQuotation.LoadDataSupMerGroup(aMGCOde : String;
    aSupplierCode : String ; aUnitID : Integer);
begin
  {if FSupMerchanGrup.LoadBySuplierKode(aSupplierCode,aMGCOde) then
  begin
    edtMGCode.Text  := FSupMerchanGrup.NewMerchadizeGroup.Kode;
    edtMGName.Text  := FSupMerchanGrup.NewMerchadizeGroup.Nama;
    edtLeadTime.Text:= IntToStr(FSupMerchanGrup.LeadTime);
    edtTOP.Text     := IntToStr(FSupMerchanGrup.TOP);
  end else begin
    edtMGCode.Text  := '';
    edtMGName.Text  := '';
    edtLeadTime.Text:= '0';
    edtTOP.Text     := '0';
  end;

  cClearGrid(strgGrid, False);
  }
end;

procedure TfrmDialogQuotation.LoadDataSupplier(aSupCode : String; aUnitID :
    Integer);
begin
  {if FSuplier.LoadByKode(aSupCode) then
  begin
    edtSupplier.Text      := FSuplier.Kode;
    edtSupplierName.Text  := FSuplier.Nama;
    edtMGCode.SetFocus;
  end else begin
    edtSupplier.Text      := '';
    edtSupplierName.Text  := '';
  end;
   }
  LoadDataSupMerGroup('','',DialogUnit); // di dalamnya sdh ada cleargrids
end;

procedure TfrmDialogQuotation.RefreshFrmQuotation;
begin
  {frmQuotation.edtSupplier.Text     := FSuplier.Kode;
  frmQuotation.edtSupplierName.Text := FSuplier.Nama;
  frmQuotation.edtMGCode.Text       := FSupMerchanGrup.NewMerchadizeGroup.Kode;
  frmQuotation.edtMGName.Text       := FSupMerchanGrup.NewMerchadizeGroup.Nama;
  frmQuotation.edtQuotationref.Text := FQuotation.RefNo;

  frmQuotation.edtProdName.Text := '';
  frmQuotation.edtCatalog.Text := '';
  frmQuotation.edtKode.Text := '';
  }
end;

procedure TfrmDialogQuotation.edtMGCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

procedure TfrmDialogQuotation.HitungDisc(aBaris : Integer);
begin
//  strgGrid.Floats[_KolDisc,aBaris] := (strgGrid.Floats[_KolPrice,aBaris] * strgGrid.Floats[_KolDiscPersen,aBaris] / 100);
end;

procedure TfrmDialogQuotation.HitungDiscPersen(aBaris : Integer);
begin
//  if strgGrid.Floats[_KolPrice,aBaris] <> 0 then
//    strgGrid.Floats[_KolDiscPersen,aBaris] := strgGrid.Floats[_KolDisc,aBaris] / strgGrid.Floats[_KolPrice,aBaris] * 100
//  else
//    strgGrid.Floats[_KolDiscPersen,aBaris] := 0;

end;

procedure TfrmDialogQuotation.HitungMarginPersen(aBaris : Integer);
begin
//  if strgGrid.Floats[_KolHArgaAVGIncPPN,aBaris] <> 0 then
//    strgGrid.Floats[_MUPersen,aBaris] := (strgGrid.Floats[_KolSetelahDisc,aBaris] - strgGrid.Floats[_KolHArgaAVGIncPPN,aBaris]) / strgGrid.Floats[_KolHArgaAVGIncPPN,aBaris] * 100
//  else
//    strgGrid.Floats[_MUPersen,aBaris] := 0;
end;

procedure TfrmDialogQuotation.HitungMarginRupiah(aBaris : Integer);
begin
//  strgGrid.Floats[_MURupiah,aBaris] := strgGrid.Floats[_KolSetelahDisc,aBaris] - strgGrid.Floats[_KolHArgaAVGIncPPN,aBaris];
end;

procedure TfrmDialogQuotation.HitungSellPriceDisc(aBaris : Integer);
begin
//  strgGrid.Floats[_KolSetelahDisc,aBaris] := strgGrid.Floats[_KolPrice,aBaris] - strgGrid.Floats[_KolDisc,aBaris];
end;

procedure TfrmDialogQuotation.InisialisasiGrid;
begin
  {
  with strgGrid do
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
    MergeCells(_isMailer,0,1,2);

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

    AturLebarKolom;
  end;
  }
end;

procedure TfrmDialogQuotation.LoadDataBarangQuotation(aQuotationItem, aBaris:
    Integer; aSupCode: String);
//var
//  FBarang: TNewBarang;
begin
  {
  with strgGrid do
  begin
    FBarang := aQuotationItem.GetBarang;
    try
      Cells[_KolPLUPurchase, aBaris]      := aQuotationItem.KodeBarangParent;
      Cells[_KolPLU, aBaris]              := FBarang.Kode;
      Cells[_KolNamaBarang, aBaris]       := FBarang.Alias;
      Cells[_KolUOM, aBaris]              := aQuotationItem.KodeSatuan;
      Cells[_kolTipeHArga, aBaris]        := GetTipeHargaNameByID(aQuotationItem.TipeHargaID,DialogUnit);
      Floats[_KolHargaBeli,aBaris]        := FBarang.GetHargaBeli(aSupCode);
      Cells[_KolUOMHargaBeli,aBaris]      := FBarang.GetSatuanHargaBeli(aSupCode);
      Floats[_KolPPNPersen, aBaris]       := FBarang.NewPajak.PPN;
      Floats[_KolHArgaAVGExcPPN, aBaris]  := FBarang.GetHargaAVG(aQuotationItem.KodeSatuan);
      Floats[_KolHArgaAVGIncPPN, aBaris]  := FBarang.GetHargaAVG(aQuotationItem.KodeSatuan) * (100 + FBarang.NewPajak.PPN) / 100;
      Floats[_KonvValue, aBaris]          := aQuotationItem.GetKonversiValue;
    finally
      FBarang.Free;
    end;
  end;
  }
end;

procedure TfrmDialogQuotation.LoadDataHargaQuotation(aQuotationItem, aBaris:
    Integer);
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

procedure TfrmDialogQuotation.LoadPLUAllUOMJual(aPLU : String; aUnitID :
    Integer; aSupCode : String);
var
  iBaris: Integer;
//  FBHJ: TBarangHargaJual;
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
             strgGrid.Floats[_KolHargaBeli,iBaris]        := FBHJ.NewBarang.GetHargaBeli(aSupCode);
             strgGrid.Cells[_KolUOMHargaBeli,iBaris]      := FBHJ.NewBarang.GetSatuanHargaBeli(aSupCode);

             strgGrid.Floats[_KolHArgaAVGExcPPN,iBaris]   := FBHJ.NewBarang.GetHargaAVG(FBHJ.NewUOM.UOM);
             strgGrid.Floats[_KolHArgaAVGIncPPN,iBaris]   := FBHJ.NewBarang.GetHargaAVG(FBHJ.NewUOM.UOM) * (FBHJ.NewBarang.NewPajak.PPN + 100) / 100;

             strgGrid.Cells[_KolItemID, iBaris]           := '0';

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

procedure TfrmDialogQuotation.UpdateQuotationItem(aBaris, aQuotation: Integer);
var
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
  {
  dMUPersen               := strgGrid.Floats[_MuPersen,aBaris];
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


  aQuotation.UpdateQuotationItems(dMUPersen,dMURupiah,dMUHargaPPN,iItemID,sKodeBarang,sKodeBarangParent, sKodeBarangParentUnitID, sKodeBarangUnitID,
             sKodeSatuan,
             aKodeSatuanUnitID,
             dPrice,
             dDisc,
             dDiscPersen,
             iQuotationUnitID,
             iUnitID,
             iTipeHargaID,
             iTIpeHargaUnitID,
             dHargaRata);
  }
end;

end.
