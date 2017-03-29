unit ufrmProductForSelling;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter5Button, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxMaskEdit, cxButtonEdit, cxTextEdit, cxCurrencyEdit;

type
  TfrmProductForSelling = class(TfrmMaster)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    fraFooter5Button1: TfraFooter5Button;
    edtProdName: TEdit;
    edtProdMerk: TEdit;
    edtProdMerkName: TEdit;
    edtCatalog: TEdit;
    edtProdType: TEdit;
    edtOutlet: TEdit;
    pnl2: TPanel;
    jvcurrSellPrice: TcxCurrencyEdit;
    pnl3: TPanel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl9: TLabel;
    edtUOMSTock1: TEdit;
    edtUOMStock2: TEdit;
    edtUOMStock3: TEdit;
    jvSelling: TcxCurrencyEdit;
    jvStock: TcxCurrencyEdit;
    jvCurrentStock: TcxCurrencyEdit;
    edProductCode: TcxButtonEdit;
    cbUOMJual: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
//    procedure cbpProductCodeKeyUp(Sender: TObject; var Key: Word;
//      Shift: TShiftState);
//    procedure cbpProductCodeExit(Sender: TObject);
//    procedure cbpUOMSellKeyUp(Sender: TObject; var Key: Word;
//      Shift: TShiftState);
    procedure edProductCodeClickBtn(Sender: TObject);
    procedure edProductCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbUOMJualChange(Sender: TObject);
  private
//    FBarang: TNEWBarang;
    procedure ClearForm;
    procedure ClearFormUOMPrice;
    procedure ParseProduct(AProductCode: string; aUnitID : Integer);
    procedure ParseUOMPrice(AProductCode, AUOMCode: string; aUnitID : Integer);
    procedure LoadUOMSell(AProductCode: string; aUnitID : Integer);
  public
    { Public declarations }
  end;

var
  frmProductForSelling: TfrmProductForSelling;

implementation

uses uTSCommonDlg, uConstanta, uRetnoUnit;

{$R *.dfm}

procedure TfrmProductForSelling.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmProductForSelling.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'PRODUCT INFORMATION FOR SELLING';
//  FBarang := TNewBarang.Create(Self);
end;

procedure TfrmProductForSelling.FormDestroy(Sender: TObject);
begin
  inherited;
  frmProductForSelling := nil;
end;

procedure TfrmProductForSelling.FormShow(Sender: TObject);
begin
  inherited;
  ClearForm;
  edProductCode.SetFocus;
end;

procedure TfrmProductForSelling.ClearForm;
begin
  edtProdName.Clear;
  edtProdMerk.Clear;
  edtProdMerkName.Clear;
  edtCatalog.Clear;
  edtProdType.Clear;
  edtOutlet.Clear;
  edProductCode.Text := '';

  jvcurrSellPrice.Value := 0;
  jvStock.Value := 0;
  jvCurrentStock.Value := 0;
end;

procedure TfrmProductForSelling.ClearFormUOMPrice;
begin
  jvcurrSellPrice.Value := 0;
  edtCatalog.Text       := '';
end;


procedure TfrmProductForSelling.ParseProduct(AProductCode: string; aUnitID :
    Integer);
var
  dCurrStock: Double;
  dPenjualan: Double;
  dTemp: Double;
begin
  if Length(edProductCode.Text)>igProd_Code_Length then
    Exit;
  {
  with FBarang do
  begin
    if LoadByKode(AProductCode) then
    begin
      edtProdName.Text        := Nama;
      edtProdMerk.Text        := Merk;
      edtProdMerkName.Text    := Alias;
      edtProdType.Text        := GetTipeBarangName;
      edtOutlet.Text          := SalesOutlet.Nama;

      getPenjualan(cGetServerTime, cGetServerTime, dPenjualan, dTemp);
      GetStock(cGetServerTime, MasterNewUnit.ID, dCurrStock, dTemp);

      jvCurrentStock.Value    := dCurrStock;
      jvSelling.Value         := dPenjualan;
      jvStock.Value           := dCurrStock + dPenjualan;


      edtUOMSTock1.Text       := KodeSatuanStock.UOM;
      edtUOMSTock2.Text       := KodeSatuanStock.UOM;
      edtUOMSTock3.Text       := KodeSatuanStock.UOM;

      LoadUOMSell(Kode, aUnitID);
    end else begin
      edtProdName.Text        := '';
      edtProdMerk.Text        := '';
      edtProdMerkName.Text    := '';
      edtProdType.Text        := '';
      edtOutlet.Text          := '';

      edtUOMSTock1.Text       := '';
      edtUOMSTock2.Text       := '';
      edtUOMSTock2.Text       := '';

      ClearFormUOMPrice;
    end;
  end;
  }
end;

procedure TfrmProductForSelling.LoadUOMSell(AProductCode: string; aUnitID :
    Integer);
var
  sSQL: string;
begin
    sSQL := ' SELECT BHJ.BHJ_SAT_CODE, SAT.SAT_NAME ' +
            ' FROM BARANG_HARGA_JUAL BHJ ' +
            ' LEFT JOIN REF$SATUAN SAT ON SAT.SAT_CODE = BHJ.BHJ_SAT_CODE ' +
            ' WHERE BHJ_BRG_CODE = ' + QuotedStr(AProductCode) +
            ' and BHJ_UNT_ID = ' + IntToStr(aUnitID) +
            ' and bhj.bhj_tphrg_id = 2';
  {
  with cOpenQuery(sSQL) do
  begin
    try
      ClearFormUOMPrice;

      cbUOMJual.Items.Clear;
      if not IsEmpty then
      begin
        while (not Eof) do
        begin
          cbUOMJual.Items.Add(FieldByName('BHJ_SAT_CODE').AsString);
          Next;
        end;

        cbUOMJual.ItemIndex := 0;
      end
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmProductForSelling.ParseUOMPrice(AProductCode, AUOMCode: string;
    aUnitID : Integer);
var
  sSQL: string;
begin
  sSQL := 'select a.bhj_sell_price_disc, b.konvsat_barcode'
          + ' from barang_harga_jual a, ref$konversi_satuan b'
          + ' where a.bhj_brg_code = ' + QuotedStr(AProductCode)
          + ' and a.bhj_tphrg_id = 2'
          + ' and a.bhj_sat_code = ' + QuotedStr(AUOMCode)
          + ' and a.bhj_brg_code = b.konvsat_brg_code'
          + ' and a.bhj_sat_code = b.konvsat_sat_code_from'
          + ' and bhj_unt_id = ' + IntToStr(aUnitID);

  {
  with cOpenQuery(sSQL) do
  begin
    try
      while not EOF do
      begin
        edtCatalog.Text       := FieldByName('konvsat_barcode').AsString;
        jvcurrSellPrice.Value := FieldByName('BHJ_SELL_PRICE_DISC').AsFloat;
        Next;
      end;
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmProductForSelling.edProductCodeClickBtn(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := 'select brg_code,brg_alias from barang ';
  {
  with cLookUp('Daftar Barang', sSQL) do
  begin
    try
      if Strings[0] = '' then
        Exit;

      edProductCode.Text := Strings[0];  
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmProductForSelling.edProductCodeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    ParseProduct(edProductCode.Text, MasterNewUnit);
    cbUOMJualChange(Self);
  end;
end;

procedure TfrmProductForSelling.cbUOMJualChange(Sender: TObject);
begin
  inherited;
  ParseUOMPrice(edProductCode.Text,cbUOMJual.Text,MasterNewUnit);
end;

end.


