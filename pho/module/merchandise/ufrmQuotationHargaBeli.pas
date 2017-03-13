unit ufrmQUotationHargaBeli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDefaultMaster, ufraFooter5Button, StdCtrls, ExtCtrls, uRMSUnit,
  ufrmDialogQuotationHargaBeli,  EditBtn, uGTSUICommonDlg, Grids,
  BaseGrid, AdvGrid, AdvCGrid, Mask, JvToolEdit, uQuotationHargaBeli, jpeg;

type
  TfrmQuotationHargaBeli = class(TfrmDefaultMaster)
    pnlatas: TPanel;
    pnlbawah: TPanel;
    edtkodeSuplier: TEditBtn;
    lbl1: TLabel;
    edtNamaSuplier: TEdit;
    dtTanggal: TJvDateEdit;
    dtEffektiveDate: TJvDateEdit;
    edtKeterangan: TEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    edtRefNo: TEdit;
    ColGrid: TAdvColumnGrid;
    edtNoBukti: TEdit;
    lbl6: TLabel;
    btnSlip: TButton;
    img1: TImage;
    procedure frftr5btn1btnAddClick(Sender: TObject);
    procedure edtkodeSuplierClickBtn(Sender: TObject);
    procedure edtkodeSuplierKeyPress(Sender: TObject; var Key: Char);
    procedure ColGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure frftr5btn1btnUpdateClick(Sender: TObject);
    procedure ColGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure frftr5btn1btnDeleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ColGridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure edtkodeSuplierKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNoBuktiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSlipClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure frftr5btn1btnRefreshClick(Sender: TObject);
  private
    FQHB: TQuotationHargaBeli;
    i: Integer;
    { Private declarations }
  public
    ID: Integer;
    NoBukti: string;
    procedure LoadDataQuotationHargaBeli(aNobukti : String ; aUnitID : Integer);
    { Public declarations }
  end;

var
  frmQuotationHargaBeli: TfrmQuotationHargaBeli;

implementation

uses ufrmMaster;

const
  _kolDisc3 = 7;
  _kolDisc2 = 6;
  _kolDisc1 = 5;
  _kolBuyPrice = 4;
  _kolUOM = 3;
  _kolAliasBArang = 2;
  _kolNo = 0;
  _kolKodeBarang = 1;



{$R *.dfm}

procedure TfrmQuotationHargaBeli.frftr5btn1btnAddClick(Sender: TObject);
begin
  inherited;
  ID := 0;

  try
    frmDialogQuotationHargaBeli := TfrmDialogQuotationHargaBeli.Create(Self);
    SetFormPropertyAndShowDialog(frmDialogQuotationHargaBeli);
    if frmDialogQuotationHargaBeli.IsProcessSuccessfull then
    begin
      edtkodeSuplier.Text := frmDialogQuotationHargaBeli.edtkodeSuplier.Text;
      edtNamaSuplier.Text := frmDialogQuotationHargaBeli.edtNamaSuplier.Text;
      edtNoBukti.Text     := frmDialogQuotationHargaBeli.edtNoBukti.Text;
      LoadDataQuotationHargaBeli(edtNoBukti.Text, MasterNewUnit.ID);
    end;
  finally
    frmDialogQuotationHargaBeli.Free;
    
  end;
end;

procedure TfrmQuotationHargaBeli.edtkodeSuplierClickBtn(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := ' select a.newsupplier_Kode AS "KODE SUPLIER", b.sup_name AS "NAMA SUPLIER"'
          + ' from TQuotationHargaBeli a, suplier b '
          + ' where b.sup_code = a.newsupplier_kode '
          + ' group by a.newsupplier_Kode, b.sup_name ';

  with cLookUp('Daftar Suplier' , sSQL) do
  begin
    try
      if  Strings[0] <> '' then
      begin
        edtkodeSuplier.Text := Strings[0];
        edtNamaSuplier.Text := Strings[1];
        edtNamaSuplier.SetFocus;
      end;  
    finally
      Free;
    end;
  end;

end;

procedure TfrmQuotationHargaBeli.edtkodeSuplierKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

procedure TfrmQuotationHargaBeli.ColGridKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sSQL: string;
begin
  inherited;
  if (Key = VK_F5) and (ColGrid.Col = _kolKodeBarang) then
  begin
    sSQL := ' SELECT A.BRG_CODE AS "KODE BARANG" , A.BRG_ALIAS AS "NAMA BARANG", '
            + ' B.BRGSUP_SAT_CODE_BUY AS "UOM", B.BRGSUP_BUY_PRICE AS "HARGA", '
            + ' B.BRGSUP_DISC1 AS "DISC 1 (%)", B.BRGSUP_DISC2 AS "DISC 2 (%)", '
            + ' B.BRGSUP_DISC3 AS DISC 3 (Rp.)'
            + ' FROM BARANG A, BARANG_SUPLIER B '
            + ' WHERE A.BRG_CODE = B.BRGSUP_BRG_CODE '
            + ' AND B.BRGSUP_SUP_CODE = ' + Quot(edtkodeSuplier.Text);

    with cLookUp('Daftar Barang Suplier ' + edtNamaSuplier.Text, sSQL) do
    begin
      try
        ColGrid.Cells[_kolNo,ColGrid.Row] := IntToStr(i);
        ColGrid.Cells[_kolKodeBarang, ColGrid.Row] := Strings[0];
        ColGrid.Cells[_kolAliasBArang, ColGrid.Row] := Strings[1];
        ColGrid.Cells[_kolUOM, ColGrid.Row] := Strings[2];
        ColGrid.Cells[_kolBuyPrice, ColGrid.Row] := Strings[3];
        ColGrid.Cells[_kolDisc1, ColGrid.Row] := Strings[4];
        ColGrid.Cells[_kolDisc2, ColGrid.Row] := Strings[5];
        ColGrid.Cells[_kolDisc3, ColGrid.Row] := Strings[6];
      finally
        Free;
      end;
    end;
  end;
end;

procedure TfrmQuotationHargaBeli.LoadDataQuotationHargaBeli(aNobukti : String ;
    aUnitID : Integer);
var
  i: Integer;
begin
  if FQHB.LoadByNoBukti(aNobukti, aUnitID) then
  begin
    //edtkodeSuplier.Text := FQHB.NewSupplier.Kode;
    //edtNamaSuplier.Text := FQHB.NewSupplier.Nama;

    edtRefNo.Text := FQHB.NoRef;
    dtEffektiveDate.Date := FQHB.EffectiveDate;
    dtTanggal.Date := FQHB.TglBukti;
    ID := FQHB.ID;
    NoBukti := FQHB.NoBukti;
    edtKeterangan.Text := FQHB.Keterangan;

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

      ColGrid.AddRow;
    end;

    HapusBarisKosong(ColGrid,_kolKodeBarang);
    SetWarnaBarisSG(ColGrid);
  end else begin
    CommonDlg.ShowMessage('Nobukti Tidak Ditemukan');
  end;
end;

procedure TfrmQuotationHargaBeli.FormCreate(Sender: TObject);
begin
  inherited;
  FQHB := TQuotationHargaBeli.Create(Self);
end;

procedure TfrmQuotationHargaBeli.frftr5btn1btnUpdateClick(Sender: TObject);
begin
  inherited;
  try
    frmDialogQuotationHargaBeli         := TfrmDialogQuotationHargaBeli.Create(Self);
    frmDialogQuotationHargaBeli.ID      := FQHB.ID;
    frmDialogQuotationHargaBeli.NoBukti := FQHB.NoBukti;

    SetFormPropertyAndShowDialog(frmDialogQuotationHargaBeli);

    if frmDialogQuotationHargaBeli.IsProcessSuccessfull then
    begin
      edtkodeSuplier.Text := frmDialogQuotationHargaBeli.edtkodeSuplier.Text;
      edtNamaSuplier.Text := frmDialogQuotationHargaBeli.edtNamaSuplier.Text;
      edtNoBukti.Text     := frmDialogQuotationHargaBeli.edtNoBukti.Text;
      LoadDataQuotationHargaBeli(edtNoBukti.Text, MasterNewUnit.ID);
    end;
  finally
    frmDialogQuotationHargaBeli.Free;
  end;
end;

procedure TfrmQuotationHargaBeli.ColGridGetFloatFormat(Sender: TObject;
  ACol, ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  FloatFormat := '%0.2n';
  if (ACol in [_kolDisc1, _kolBuyPrice, _kolDisc3, _kolDisc2] ) and (ARow >= ColGrid.FixedRows) then
    IsFloat := True
  else
    IsFloat := False;
end;

procedure TfrmQuotationHargaBeli.frftr5btn1btnDeleteClick(Sender: TObject);
begin
  inherited;
  if Trim(ColGrid.Cells[_kolKodeBarang, 1]) <> '' then
  begin
    if FQHB.RemoveFromDB(ID,MasterNewUnit.ID) then
    begin
      cCommitTrans;
      CommonDlg.ShowMessage('Berhasil Menghapus Data');
      FQHB.ClearProperties;
      ClearByTag(Self, [0]);
      edtkodeSuplier.SetFocus;
    end else
      CommonDlg.ShowMessage('Gagal Menghapus Data');
  end else
    CommonDlg.ShowMessage('Tidak Ada Data Yang Dihapus');
end;

procedure TfrmQuotationHargaBeli.FormShow(Sender: TObject);
begin
  inherited;
  edtkodeSuplier.Text := '';
  if MasterNewUnit.ID = 0 then
    CommonDlg.ShowMessage('Company Belum Dipilih');

  frftr5btn1.btnUpdate.Enabled := False;
end;

procedure TfrmQuotationHargaBeli.ColGridCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  CanEdit := False;
end;

procedure TfrmQuotationHargaBeli.edtkodeSuplierKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sSQL: string;
begin
  inherited;
  if Key = VK_RETURN then
  begin
    sSQL := ' select distinct sup_code, sup_name '
            + ' from suplier '
            + ' where sup_code = ' + Quot(edtkodeSuplier.Text);

    with cOpenQuery(sSQL) do
    begin
      try
      if not FieldByName('sup_code').IsNull then
      begin
        edtkodeSuplier.Text := FieldByName('sup_code').AsString;
        edtNamaSuplier.Text := FieldByName('sup_name').AsString;
        edtNamaSuplier.SetFocus;
      end else
        CommonDlg.ShowMessage('Data Suplier Dengan Kode ' + edtkodeSuplier.Text + ' Tidak Ditemukan');
      finally
        Free;
      end;
    end;
  end else if Key = VK_F5 then
  begin
    edtkodeSuplierClickBtn(Self);
  end;
end;

procedure TfrmQuotationHargaBeli.edtNoBuktiKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sSQL: string;
begin
  inherited;
  if Key = VK_F5 then
  begin
    sSQL := ' select NoBukti AS "NO. BUKTI" , NOREF, TglBukti, EFFECTIVEDATE as "Effective Date", Keterangan'
            + ' from tQuotationHargaBeli '
            + ' where NewSupplier_Kode = ' + Quot(edtkodeSuplier.Text);

    with cLookUp('List No Bukti Quotation Harga Beli', sSQL) do
    begin
      if  Strings[0] <> '' then
      begin
        edtNoBukti.Text := Strings[0];
        LoadDataQuotationHargaBeli(edtNoBukti.Text, MasterNewUnit.ID);
      end;
    end;


  end;


  frftr5btn1.btnUpdate.Enabled := True;
end;

procedure TfrmQuotationHargaBeli.btnSlipClick(Sender: TObject);
begin
  inherited;
  DoSlipQuotation(edtNoBukti.Text, MasterNewUnit.ID, FLoginFullname, MasterNewUnit.Nama);
end;

procedure TfrmQuotationHargaBeli.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmQuotationHargaBeli := nil;
  Action := caFree;
end;

procedure TfrmQuotationHargaBeli.frftr5btn1btnRefreshClick(
  Sender: TObject);
begin
  inherited;
  LoadDataQuotationHargaBeli(edtNoBukti.Text, MasterNewUnit.ID);
end;

end.
