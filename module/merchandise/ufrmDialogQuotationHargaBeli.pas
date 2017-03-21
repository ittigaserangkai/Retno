unit ufrmDialogQuotationHargaBeli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialogBrowse, ExtCtrls, Mask, StrUtils, Menus,
  jpeg, System.Actions, Vcl.ActnList, Vcl.StdCtrls,
  ufraFooterDialog3Button, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxButtonEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
  TfrmDialogQuotationHargaBeli = class(TfrmMasterDialogBrowse)
    pnlatas: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    edtNamaSuplier: TEdit;
    dtTanggal: TcxDateEdit;
    dtEffektiveDate: TcxDateEdit;
    edtKeterangan: TEdit;
    edtRefNo: TEdit;
    lbl6: TLabel;
    edtNoBukti: TEdit;
    lbl7: TcxLabel;
    pm1: TPopupMenu;
    mniTambahBaris: TMenuItem;
    mniHapusBaris: TMenuItem;
    lblTambah: TcxLabel;
    img1: TImage;
    edbKodeSuplier: TcxButtonEdit;
    cxcolGridViewColumn1: TcxGridDBColumn;
    cxcolGridViewColumn2: TcxGridDBColumn;
    cxcolGridViewColumn3: TcxGridDBColumn;
    cxcolGridViewColumn4: TcxGridDBColumn;
    cxcolGridViewColumn5: TcxGridDBColumn;
    cxcolGridViewColumn6: TcxGridDBColumn;
    cxcolGridViewColumn7: TcxGridDBColumn;
    cxcolGridViewColumn8: TcxGridDBColumn;
    procedure ColGridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure edbKodeSuplierKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ColGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure lbl7Click(Sender: TObject);
    procedure ColGridKeyPress(Sender: TObject; var Key: Char);
    procedure mniTambahBarisClick(Sender: TObject);
    procedure mniHapusBarisClick(Sender: TObject);
    procedure ColGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtTanggalExit(Sender: TObject);
    procedure edbKodeSuplierKeyPress(Sender: TObject; var Key: Char);
    procedure btnSlipClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure footerDialogMasterbtnCloseClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNoBuktiKeyPress(Sender: TObject; var Key: Char);
    procedure edtRefNoKeyPress(Sender: TObject; var Key: Char);
    procedure dtEffektiveDateKeyPress(Sender: TObject; var Key: Char);
    procedure dtTanggalKeyPress(Sender: TObject; var Key: Char);
    procedure edtKeteranganKeyPress(Sender: TObject; var Key: Char);
    procedure edtNoBuktiKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRefNoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtEffektiveDateKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtTanggalKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtKeteranganKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ColGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure footerDialogMasterbtnCloseKeyUp(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure footerDialogMasterbtnSaveKeyUp(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lblTambahClick(Sender: TObject);
    procedure edbKodeSuplierEnter(Sender: TObject);
    procedure edbKodeSuplierExit(Sender: TObject);
    procedure edbKodeSuplierPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    FIsProcessSuccessfull: Boolean;
    FKodeSupplierAwal: string;
//    FQHB: TQuotationHargaBeli;


    { Private declarations }
  public
    ID: Integer;
    NoBukti: string;
    
    function GetNoBukti(aTglBukti : TDateTime): string;
    function IsKodeBArangExist: Boolean;
    function IsNoBuktiExist(aNobukti : String ; aUnitID : Integer; aExcludeID :
        Integer): Boolean;
    function IsProductFoundInQuotation: Boolean;
    function IsProdukKetemu(aKodeBrg:String; aUOM:String; aUnitID:Integer;
        aTglEfektif:TDateTime; aTglAkhir:TDateTime; aNoBukti:String): Boolean;
    function IsQuotationProcessed(aRefNo:String; aUnitID:Integer): Boolean;
    procedure LoadDataQuotationHargaBeli;
    property IsProcessSuccessfull: Boolean read FIsProcessSuccessfull write
        FIsProcessSuccessfull;
    { Public declarations }
  end;

var
  frmDialogQuotationHargaBeli: TfrmDialogQuotationHargaBeli;

implementation

uses  math, uTSCommonDlg, uAppUtils;
const
  _kolIDItem : Integer = 8;
  _kolDisc3 : Integer = 7;
  _kolDisc2 : Integer = 6;
  _kolDisc1 : Integer = 5;
  _kolBuyPrice : Integer = 4;
  _kolUOM : Integer = 3;
  _kolAliasBArang : Integer = 2;
  _kolNo : Integer = 0;
  _kolKodeBarang : Integer = 1;
{$R *.dfm}

procedure TfrmDialogQuotationHargaBeli.ColGridCanEditCell(Sender: TObject;
  ARow, ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
//  if (ACol in [_kolKodeBarang, _kolDisc1, _kolBuyPrice, _kolDisc3, _kolDisc2]) and (ARow >= ColGrid.FixedRows) then
//    CanEdit := True
//  else
//    CanEdit := False;
end;

procedure TfrmDialogQuotationHargaBeli.edbKodeSuplierKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sSQL: string;
begin
  inherited;
  {if Key = VK_RETURN then
  begin
    sSQL := ' select sup_code, sup_name '
            + ' from suplier '
            + ' where sup_code = ' + QuotedStr(edbkodeSuplier.Text);

    with cOpenQuery(sSQL) do
    begin
      try
      if not FieldByName('sup_code').IsNull then
      begin
        edbkodeSuplier.Text := FieldByName('sup_code').AsString;
        edtNamaSuplier.Text := FieldByName('sup_name').AsString;
      end else
        CommonDlg.ShowMessage('Data Suplier Dengan Kode ' + edbKodeSuplier.Text + ' Tidak Ditemukan');
      finally
        Free;
      end;
    end;
  end else if Key = VK_F5 then
  begin
    edbKodeSuplierClickBtn(Self);
  end
  else if (Key = VK_ESCAPE) then
  Begin
    footerDialogMasterbtnCloseClick(Sender);
  End
  else if (Key = VK_RETURN) and (ssctrl in Shift) then
  Begin
    footerDialogMasterbtnSaveClick(Sender);
  End
  else if (Key = Ord('R')) and (ssctrl in Shift) then
  Begin
    lbl7Click(Sender);
  End;
  }
end;

procedure TfrmDialogQuotationHargaBeli.FormShow(Sender: TObject);
begin
  inherited;
  {if not Assigned(FQHB) then
    FQHB := TQuotationHargaBeli.Create(Self);

  edbKodeSuplier.Text := '';

  if ID <> 0 then
    LoadDataQuotationHargaBeli
  else
  begin
    dtEffektiveDate.Date := cGetServerTime + 1 ;
    dtTanggal.Date := cGetServerTime;
    edtNoBukti.Text := TQuotationHargaBeli.GetNextNoBukti(DialogUnit); // GetNoBukti(dtTanggal.Date) ;
  end;
  }
  edbKodeSuplier.SetFocus;
end;

procedure TfrmDialogQuotationHargaBeli.footerDialogMasterbtnSaveClick(
  Sender: TObject);
var
  i: Integer;
begin
  inherited;
  if IsNoBuktiExist(edtNoBukti.Text, DialogUnit,ID) then
  begin
    CommonDlg.ShowError('Nobukti Sudah Terpakai !' + #13 + 'Lakukan Simpan Ulang !');
    edtNoBukti.Text := GetNoBukti(dtTanggal.Date);
  end;

  if IsKodeBArangExist then
  begin
    CommonDlg.ShowMessage('Tidak Boleh Ada Barang Yang Sama');
    Exit;
  end;

  if IsQuotationProcessed(edtNoBukti.Text,DialogUnit) then
    Exit;

  if IsProductFoundInQuotation then
    Exit;

  if Trim(edbKodeSuplier.Text) = '' then
  begin
    CommonDlg.ShowMessage('Kode Suplier Kosong');
    edbKodeSuplier.SetFocus;
    Exit;
  end else if Trim(edtKeterangan.Text) = '' then
  begin
    edtKeterangan.Text := '-';
  end;

  if Floor(dtTanggal.Date) > Floor(dtEffektiveDate.Date) then
  begin
    CommonDlg.ShowMessage('Tanggal Efektif Harus >= Tanggal Sekarang');
    dtTanggal.SetFocus;
    Exit;
  end;

  {
  FQHB.UpdateData(
    dtEffektiveDate.Date,
    ID,
    0,
    edtKeterangan.Text,
    edbKodeSuplier.Text,
    DialogUnit,
    edtNoBukti.Text,
    edtRefNo.Text,
    dtTanggal.Date);

  if Trim(ColGrid.Cells[_kolKodeBarang, colgrid.fixedRows]) = '' then
  begin
    CommonDlg.ShowMessage('Tidak Ada Data Barang Yang Disimpan');
    Exit;
  end;

  FQHB.QuotationHargaBeliItems.Clear;
  for i := ColGrid.FixedRows to ColGrid.RowCount - 1 do
  begin
    FQHB.UpdateQuotationHargaBeliItems(
    ColGrid.Cells[_kolKodeBarang,i],
     (ColGrid.Floats[_kolDisc1,i]),
     (ColGrid.Floats[_kolDisc2,i]),
     (ColGrid.Floats[_kolDisc3,i]),
     (ColGrid.Floats[_kolBuyPrice,i]),
    DialogUnit,
    DialogUnit,
    ColGrid.cells[_kolUOM,i],
    strtoint(ColGrid.Cells[_kolIdItem,i]));
  end;

  if not FQHB.ExecuteGenerateSQL then
  begin
    CommonDlg.ShowMessage('Gagal Menyimpan Data Quotation Harga Beli');
    cRollbackTrans;
    Exit;
  end else
  begin
    cCommitTrans;
    IsProcessSuccessfull := True;
    if CommonDlg.Confirm('Berhasil Menyimpan Data Quotation' + #13 + 'Apakah Anda Akan Mencetak Slip Quotation ?') = mrYes then
      DoSlipQuotation(FQHB.NoBukti, DialogUnit, FLoginFullname, FDialogUnitName);
    dtEffektiveDate.Date := cGetServerTime + 1;
    Close;

  end;

  }

end;

procedure TfrmDialogQuotationHargaBeli.FormCreate(Sender: TObject);
begin
  inherited;
//  FQHB := TQuotationHargaBeli.Create(Self);
  IsProcessSuccessfull := False;
end;

function TfrmDialogQuotationHargaBeli.GetNoBukti(aTglBukti : TDateTime): string;
var
  urutan: string;
  tmp : Integer;
  sFormatNoBukti: string;
  sSQL: string;
begin
  // TODO -cMM: TfrmDialogQuotationHargaBeli.GetNoBukti default body inserted
  Result := '';
  sFormatNoBukti := IntToStr(DialogUnit) + '.QUOT.' + FormatDateTime('yyyyMM',aTglBukti) ;
  sSQL := ' select nobukti '
          + ' from tQuotationHargaBeli '
          + ' where nobukti like ' + QuotedStr('%'+ sFormatNoBukti + '%')
          + ' order by nobukti desc' ;
  {
  with cOpenQuery(sSQL) do
  begin
    if not FieldByName('nobukti').IsNull then
    begin
      urutan := '';
      //urutan := Copy(fieldByName('nobukti').asString, 16,3);
      urutan := RightStr(fieldByName('nobukti').asString,3);
      tmp := StrToInt(urutan);
      Inc(tmp,1);
      urutan := StrPadLeft(IntToStr(tmp),3,'0');
      Result := sFormatNoBukti + urutan;
    end else
      Result := sFormatNoBukti + '001';
  end;
  }
end;

procedure TfrmDialogQuotationHargaBeli.LoadDataQuotationHargaBeli;
var
  i: Integer;
begin
  {FQHB.LoadByNoBukti(NoBukti, DialogUnit);
  edbKodeSuplier.Text := FQHB.NewSupplier.Kode;
  edtNamaSuplier.Text := FQHB.NewSupplier.Nama;
  edtRefNo.Text := FQHB.NoRef;
  dtEffektiveDate.Date := FQHB.EffectiveDate;
  dtTanggal.Date := FQHB.TglBukti;
  edtKeterangan.Text := FQHB.Keterangan;
  edtNoBukti.Text := FQHB.NoBukti;


  for i := 0 to FQHB.QuotationHargaBeliItems.Count - 1 do
  begin
    ColGrid.Cells[_kolNo,i + 1] := IntToStr(i + 1);
    ColGrid.Cells[_kolKodeBarang,i + 1] := FQHB.QuotationHargaBeliItems[i].Barang.Kode;
    ColGrid.Cells[_kolAliasBArang,i + 1] := FQHB.QuotationHargaBeliItems[i].Barang.Alias;
    ColGrid.Cells[_kolUOM,i + 1] := FQHB.QuotationHargaBeliItems[i].NewUOM.UOM;
    ColGrid.Floats[_kolBuyPrice,i + 1] :=  (FQHB.QuotationHargaBeliItems[i].Harga);
    ColGrid.Floats[_kolDisc1,i + 1] :=  (FQHB.QuotationHargaBeliItems[i].Disc1);
    ColGrid.Floats[_kolDisc2,i + 1] :=  (FQHB.QuotationHargaBeliItems[i].Disc2);
    ColGrid.Floats[_kolDisc3,i + 1] :=  (FQHB.QuotationHargaBeliItems[i].Disc3);
    ColGrid.Cells[_kolIDItem, i+ 1] := IntToStr(FQHB.QuotationHargaBeliItems[i].ID);
    ColGrid.AddRow;
  end;

  HapusBarisKosong(ColGrid,_kolKodeBarang);
  SetWarnaBarisSG(ColGrid);
  }
end;

procedure TfrmDialogQuotationHargaBeli.ColGridGetFloatFormat(
  Sender: TObject; ACol, ARow: Integer; var IsFloat: Boolean;
  var FloatFormat: String);
begin
  inherited;
  FloatFormat := '%.2n';
//  if (ACol in [_kolDisc1, _kolBuyPrice, _kolDisc3, _kolDisc2] ) and (ARow >= ColGrid.FixedRows) then
//    IsFloat := True
//  else
//    IsFloat := False;
end;

procedure TfrmDialogQuotationHargaBeli.lbl7Click(Sender: TObject);
begin
  inherited;
  {if ColGrid.RowCount <= 2 then
      ColGrid.Rows[1].Clear
    else begin
      ColGrid.Rows[ColGrid.Row].Clear;
      ColGrid.RemoveSelectedRows;
    end;
    }
end;

procedure TfrmDialogQuotationHargaBeli.ColGridKeyPress(Sender: TObject;
  var Key: Char);
var
  sKodeBrg: string;
  i: Integer;
  sSQL: string;
begin
  inherited;
  {if (Key = #13) and (ColGrid.Col = _kolKodeBarang) then
  begin
    sKodeBrg := TAppUtils.StrPadLeft(ColGrid.Columns[_kolKodeBArang].Rows[colGrid.row],igProd_Code_Length,'0' );
    sSQL := ' SELECT A.BRG_CODE , A.BRG_ALIAS, B.BRGSUP_SAT_CODE_BUY, B.BRGSUP_BUY_PRICE, B.BRGSUP_DISC1, B.BRGSUP_DISC2, B.BRGSUP_DISC3 '
            + ' FROM BARANG A, BARANG_SUPLIER B '
            + ' WHERE A.BRG_CODE = ' + Quot(sKodeBrg)
            + ' AND B.BRGSUP_SUP_CODE = ' + Quot(edbKodeSuplier.Text)
            + ' and a.brg_code = b.brgsup_brg_code'
            + '' ;

    with cOpenQuery(sSQL) do
    begin
      if not FieldByName('BRG_CODE').IsNull then
      begin
        try
          ColGrid.Cells[_kolNo,ColGrid.Row] := IntToStr(ColGrid.Row);
          ColGrid.Cells[_kolKodeBarang, ColGrid.Row] := FieldByName('BRG_CODE').AsString;
          ColGrid.Cells[_kolAliasBArang, ColGrid.Row] := FieldByName('BRG_ALIAS').AsString;
          ColGrid.Cells[_kolUOM, ColGrid.Row] := FieldByName('BRGSUP_SAT_CODE_BUY').AsString;
          ColGrid.Cells[_kolBuyPrice, ColGrid.Row] := FieldByName('BRGSUP_BUY_PRICE').AsString;
          ColGrid.Cells[_kolDisc1, ColGrid.Row] := FieldByName('BRGSUP_DISC1').AsString;
          ColGrid.Cells[_kolDisc2, ColGrid.Row] := FieldByName('BRGSUP_DISC2').AsString;
          ColGrid.Cells[_kolDisc3, ColGrid.Row] := FieldByName('BRGSUP_DISC3').AsString;
          ColGrid.Cells[_kolIDItem, ColGrid.Row] := '0';
          ColGrid.Col := _kolAliasBArang;
        finally
          Free;
        end;
      end else begin
        CommonDlg.ShowMessage('Barang Dengan Kode ' + ColGrid.Cells[_kolKodeBArang,colGrid.row] +
                              ' Tidak Ditemukan' + #13 + 'Pada Data Barang Suplier ' + edbKodeSuplier.Text);
        for i := _kolAliasBArang to ColGrid.ColCount - 1 do
        begin
          ColGrid.Cells[i,ColGrid.Row] := '';
        end;
      end;  
    end;
  end;
  }
end;

function TfrmDialogQuotationHargaBeli.IsKodeBArangExist: Boolean;
var
  j: Integer;
  i: Integer;
  sDicari: string;
begin
  Result := False;
  {
  for i := ColGrid.FixedRows to ColGrid.RowCount - 2 do
  begin
    sDicari := ColGrid.Cells[_kolKodeBarang,i];
    for j := ColGrid.FixedRows + 1 to ColGrid.RowCount - 1 do
    begin
      if ((Trim(sDicari)) = Trim(ColGrid.Cells[_kolKodeBarang, j])) and (i <> j) then
      begin
        Result := True;
        Exit;
      end;
    end;
  end;
  }
end;

function TfrmDialogQuotationHargaBeli.IsProductFoundInQuotation: Boolean;
var
  i: Integer;
  strKodeBrg: string;
//  sDicari: string;
begin
  Result := False;
  {
  for i := ColGrid.FixedRows to ColGrid.RowCount - 1 do
  begin
    strKodeBrg := ColGrid.Cells[_kolKodeBarang,i];
    strUOM := ColGrid.Cells[_kolUOM,i];
    if IsProdukKetemu(strKodeBrg, strUOM, DialogUnit, dtEffektiveDate.Date,
      dtTanggal.Date, edtNoBukti.Text) then
    Begin
      Result      := True;
      CommonDlg.ShowError('Barang dengan kode ' + strKodeBrg + ' sudah dibuatkan Quotation !');
      ColGrid.SetFocus;
      ColGrid.Row := i;
      Exit;
    End;
  end;
  }
end;

procedure TfrmDialogQuotationHargaBeli.mniTambahBarisClick(
  Sender: TObject);
begin
  inherited;
//  if not IsAdaBarisKosong(ColGrid, _kolKodeBarang) then
//  begin
//    ColGrid.AddRow;
//  end;
end;

procedure TfrmDialogQuotationHargaBeli.mniHapusBarisClick(Sender: TObject);
begin
  inherited;
//  HapusBarisTertentu(ColGrid);
end;

procedure TfrmDialogQuotationHargaBeli.ColGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  iKol: Integer;
  sSQL: string;
begin
  inherited;
  {if (Key = VK_F5) and (ColGrid.Col = _kolKodeBarang) then
  begin
    sSQL := ' SELECT A.BRG_CODE AS "KODE BARANG", A.BRG_ALIAS AS "NAMA BARANG", '
            + ' B.BRGSUP_SAT_CODE_BUY AS "SATUAN", B.BRGSUP_BUY_PRICE AS "HARGA", '
            + ' B.BRGSUP_DISC1 AS "DISC 1 (%)", B.BRGSUP_DISC2 AS "DISC 2 (%)", '
            + ' B.BRGSUP_DISC3 AS "DISC 3 (Rp.)"'
            + ' FROM BARANG A, BARANG_SUPLIER B '
            + ' WHERE A.BRG_CODE = B.BRGSUP_BRG_CODE '
            + ' AND B.BRGSUP_SUP_CODE = ' + Quot(edbKodeSuplier.Text);

    with cLookUp('Daftar Barang Suplier ' + edtNamaSuplier.Text, sSQL) do
    begin
      try
        ColGrid.Cells[_kolNo,ColGrid.Row] := IntToStr(ColGrid.Row);
        ColGrid.Cells[_kolKodeBarang, ColGrid.Row] := Strings[0];
        ColGrid.Cells[_kolAliasBArang, ColGrid.Row] := Strings[1];
        ColGrid.Cells[_kolUOM, ColGrid.Row] := Strings[2];
        ColGrid.Cells[_kolBuyPrice, ColGrid.Row] := Strings[3];
        ColGrid.Cells[_kolDisc1, ColGrid.Row] := Strings[4];
        ColGrid.Cells[_kolDisc2, ColGrid.Row] := Strings[5];
        ColGrid.Cells[_kolDisc3, ColGrid.Row] := Strings[6];
        ColGrid.Cells[_kolIDItem, ColGrid.Row] := '0';
        ColGrid.EditMode := False;
      finally
        Free;
      end;
    end;
  end
  else if (Key = Ord('T')) and (ssctrl in Shift) then
    lblTambahClick(Sender)
  else if (Key = Ord('R')) and (ssctrl in Shift) then
    lbl7Click(Sender)  
  else if (Key = VK_Escape) then
    Close
  else if (Key = VK_RETURN) and (ssctrl in Shift) then
  Begin
    if ColGrid.EditMode then
    begin
      iKol := ColGrid.Col;
      ColGrid.Col := _kolNo;
      ColGrid.Col := iKol;
      ColGrid.EditMode := False;
    end;
    footerDialogMasterbtnSaveClick(Sender);
  end
  }
end;

procedure TfrmDialogQuotationHargaBeli.dtTanggalExit(Sender: TObject);
begin
  inherited;
//  if ID <= 0 then
//    edtNoBukti.Text := TQuotationHargaBeli.GetNextNoBukti(DialogUnit);
end;

function TfrmDialogQuotationHargaBeli.IsNoBuktiExist(aNobukti : String ;
    aUnitID : Integer; aExcludeID : Integer): Boolean;
var
  sSQL: string;
begin
  Result := False;
  sSQL := 'select count(ID) from tquotationhargabeli'
          + ' where nobukti = ' + QuotedStr(aNobukti)
          + ' and newunit_id = ' + IntToStr(aUnitID)
          + ' and ID <> ' + IntToStr(aExcludeID);
  {
  with cOpenQuery(sSQL) do
  begin
    try
      if not Fields[0].IsNull then
        Result := Fields[0].AsInteger > 0;
        
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmDialogQuotationHargaBeli.edbKodeSuplierKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;
end;

procedure TfrmDialogQuotationHargaBeli.btnSlipClick(Sender: TObject);
begin
  inherited;
  //dosli
end;

procedure TfrmDialogQuotationHargaBeli.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;          
//  frmDialogQuotationHargaBeli := nil;
  Action := caFree;
end;

function TfrmDialogQuotationHargaBeli.IsProdukKetemu(aKodeBrg:String;
    aUOM:String; aUnitID:Integer; aTglEfektif:TDateTime; aTglAkhir:TDateTime;
    aNoBukti:String): Boolean;
var
  sSQL: String;
begin
  Result := false ;
  sSQL := 'select count(a.ID) as "IDQuotation" '
       + ' from TQUOTATIONHARGABELI a, TQUOTATIONHARGABELIITEM b'
       + ' where a.id = b.header_id'
       + ' and a.newunit_id = b.headerunit_id'
       + ' and a.nobukti <> ' + QuotedStr(aNoBukti)
       + ' and b.barang_kode = ' + QuotedStr(aKodeBrg)
       + ' and a.newunit_id = ' + IntToStr(aUnitID)
       + ' and b.newuom_code = ' + QuotedStr(aUOM)
       + ' and a.effectivedate = ' + TAppUtils.QuotD(aTglEfektif) ;
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

procedure TfrmDialogQuotationHargaBeli.footerDialogMasterbtnCloseClick(
  Sender: TObject);
begin
  inherited;
  IsProcessSuccessfull := False;
  Close;  
end;

procedure TfrmDialogQuotationHargaBeli.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogQuotationHargaBeli:=nil;
  frmDialogQuotationHargaBeli.Free;
end;

function TfrmDialogQuotationHargaBeli.IsQuotationProcessed(aRefNo:String;
    aUnitID:Integer): Boolean;
var
  sSQL: String;
begin
//  Result := False;
  sSQL := 'select count(ID) as QuotID from TQUOTATIONHARGABELI '
       + ' where NOBUKTI = ' + QuotedStr(aRefNo)
       + ' and NEWUNIT_ID = ' + IntToStr(aUnitID)
       + ' and ISPROCESSED = 1 ' ;
  {
  With cOpenQuery(sSQL) do
  Begin
    Try
      if Fields[0].AsInteger > 0 then
      Begin
        Result := True;
        CommonDlg.ShowError('Quotation harga beli sudah diproses !');
      End
      else
        Result := False;
    Finally
      Free;
    End;
  End;
  }
end;

procedure TfrmDialogQuotationHargaBeli.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
//  if(Key = VK_RETURN) and (ssctrl in Shift) then
//    footerDialogMasterbtnSaveClick(Sender)
//  else if(Key = VK_ESCAPE) then
//    footerDialogMasterbtnCloseClick(Sender)
//  else if (Key = Ord('R')) and (ssctrl in Shift) then
//    lbl7Click(Sender)  ;
end;

procedure TfrmDialogQuotationHargaBeli.edtNoBuktiKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;
end;

procedure TfrmDialogQuotationHargaBeli.edtRefNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;

end;

procedure TfrmDialogQuotationHargaBeli.dtEffektiveDateKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;

end;

procedure TfrmDialogQuotationHargaBeli.dtTanggalKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;

end;

procedure TfrmDialogQuotationHargaBeli.edbKodeSuplierPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  sSQL: string;
begin
  inherited;
  sSQL := ' select sup_code as "KODE SUPLIER", sup_name AS "NAMA SUPLIER" '
          + ' from suplier ';
  {
  with cLookUp('Daftar Suplier' , sSQL) do
  begin
    try
      if Strings[0] <> '' then
      begin
        edbKodeSuplier.Text := Strings[0];
        edtNamaSuplier.Text := Strings[1];
      end;
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmDialogQuotationHargaBeli.edtKeteranganKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
  if Key = #13 then
  Begin
    cxGrid.SetFocus;
    Key := #0;
  End;

end;

procedure TfrmDialogQuotationHargaBeli.edtNoBuktiKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_ESCAPE) then
  Begin
    footerDialogMasterbtnCloseClick(Sender);
  End
  else if (Key = VK_RETURN) and (ssctrl in Shift) then
  Begin
    footerDialogMasterbtnSaveClick(Sender);
  End
  else if (Key = Ord('R')) and (ssctrl in Shift) then
  Begin
    lbl7Click(Sender);
  End;

end;

procedure TfrmDialogQuotationHargaBeli.edtRefNoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_ESCAPE) then
  Begin
    footerDialogMasterbtnCloseClick(Sender);
  End
  else if (Key = VK_RETURN) and (ssctrl in Shift) then
  Begin
    footerDialogMasterbtnSaveClick(Sender);
  End
  else if (Key = Ord('R')) and (ssctrl in Shift) then
  Begin
    lbl7Click(Sender);
  End;

end;

procedure TfrmDialogQuotationHargaBeli.dtEffektiveDateKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_ESCAPE) then
  Begin
    footerDialogMasterbtnCloseClick(Sender);
  End
  else if (Key = VK_RETURN) and (ssctrl in Shift) then
  Begin
    footerDialogMasterbtnSaveClick(Sender);
  End
  else if (Key = Ord('R')) and (ssctrl in Shift) then
  Begin
    lbl7Click(Sender);
  End;

end;

procedure TfrmDialogQuotationHargaBeli.dtTanggalKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_ESCAPE) then
  Begin
    footerDialogMasterbtnCloseClick(Sender);
  End
  else if (Key = VK_RETURN) and (ssctrl in Shift) then
  Begin
    footerDialogMasterbtnSaveClick(Sender);
  End
  else if (Key = Ord('R')) and (ssctrl in Shift) then
  Begin
    lbl7Click(Sender);
  End;

end;

procedure TfrmDialogQuotationHargaBeli.edtKeteranganKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_ESCAPE) then
  Begin
    footerDialogMasterbtnCloseClick(Sender);
  End
  else if (Key = VK_RETURN) and (ssctrl in Shift) then
  Begin
    footerDialogMasterbtnSaveClick(Sender);
  End
  else if (Key = Ord('R')) and (ssctrl in Shift) then
  Begin
    lbl7Click(Sender);
  End;

end;

procedure TfrmDialogQuotationHargaBeli.ColGridKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  inherited;
//  if (Key = VK_ESCAPE) then
//  Begin
//    footerDialogMasterbtnCloseClick(Sender);
//  End
//  else if (Key = VK_RETURN) and (ssctrl in Shift) then
//  Begin
//    footerDialogMasterbtnSaveClick(Sender);
//  End
//  else if (Key = Ord('R')) and (ssctrl in Shift) then
//  Begin
//    lbl7Click(Sender);
//  End
//  else if (Key = Ord('T')) and (ssctrl in Shift) then
//  lblTambahClick(Sender);

end;

procedure TfrmDialogQuotationHargaBeli.footerDialogMasterbtnCloseKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
//  if (Key = VK_ESCAPE) then
//  Begin
//    footerDialogMasterbtnCloseClick(Sender);
//  End
//  else if (Key = VK_RETURN) and (ssctrl in Shift) then
//  Begin
//    footerDialogMasterbtnSaveClick(Sender);
//  End
//  else if (Key = Ord('R')) and (ssctrl in Shift) then
//  Begin
//    lbl7Click(Sender);
//  End;

end;

procedure TfrmDialogQuotationHargaBeli.footerDialogMasterbtnSaveKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
//  if (Key = VK_ESCAPE) then
//  Begin
//    footerDialogMasterbtnCloseClick(Sender);
//  End
//  else if (Key = VK_RETURN) and (ssctrl in Shift) then
//  Begin
//    footerDialogMasterbtnSaveClick(Sender);
//  End
//  else if (Key = Ord('R')) and (ssctrl in Shift) then
//  Begin
//    lbl7Click(Sender);
//  End;

end;

procedure TfrmDialogQuotationHargaBeli.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  inherited;
  if (Key = Ord('T')) and (ssctrl in Shift) then
    lblTambahClick(Sender)
  else if (Key = VK_ESCAPE) then
  Begin
    footerDialogMasterbtnCloseClick(Sender);
  End
  else if (Key = VK_RETURN) and (ssctrl in Shift) then
  Begin
    footerDialogMasterbtnSaveClick(Sender);
  End
  else if (Key = Ord('R')) and (ssctrl in Shift) then
  Begin
    lbl7Click(Sender);
  End;

end;

procedure TfrmDialogQuotationHargaBeli.lblTambahClick(Sender: TObject);
begin
  inherited;
  {if not IsAdaBarisKosong(ColGrid, _kolKodeBarang) then
  begin
    ColGrid.AddRow;
    ColGrid.Row := ColGrid.RowCount-ColGrid.FixedRows;
    ColGrid.Col := _kolKodeBarang;
  end;
  }
end;

procedure TfrmDialogQuotationHargaBeli.edbKodeSuplierEnter(
  Sender: TObject);
begin
  inherited;
  FKodeSupplierAwal := edbKodeSuplier.Text;
end;

procedure TfrmDialogQuotationHargaBeli.edbKodeSuplierExit(Sender: TObject);
begin
  inherited;
  if FKodeSupplierAwal <> edbKodeSuplier.Text then
  begin
//    cClearGrid(ColGrid,False);
  end;
end;

end.
