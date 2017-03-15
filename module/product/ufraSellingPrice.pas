unit ufraSellingPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Math, uRetnoUnit,
  ActnList, uFormProperty, System.Actions, cxGridCustomTableView,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, cxContainer, cxTextEdit, cxCurrencyEdit,
  Vcl.Menus, cxButtons, cxLabel, Vcl.StdCtrls;


type
  TSaveMode = (smAdd,smEdit);
  TfraSellingPrice = class(TFrame)
    pnl4: TPanel;
    pnl1: TPanel;
    lblClose: TcxLabel;
    lblAdd: TcxLabel;
    lblDelete: TcxLabel;
    pnlAddEdit: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    cbbUOM: TComboBox;
    jvcuredtSellPrice: TcxCurrencyEdit;
    lbl42: TLabel;
    fedtDiscPercent: TcxCurrencyEdit;
    jvcuredtDiscNominal: TcxCurrencyEdit;
    lbl7: TLabel;
    jvcuredtSellPriceDisc: TcxCurrencyEdit;
    lbl10: TLabel;
    lbl11: TLabel;
    cbbPriceType: TComboBox;
    pnl3: TPanel;
    lbl5: TLabel;
    lbl8: TLabel;
    chkIsLimit: TCheckBox;
    chkIsADS: TCheckBox;
    jvcuredtPriceLimit: TcxCurrencyEdit;
    jvcuredtPriceADS: TcxCurrencyEdit;
    lblEdit: TcxLabel;
    intedtQtyLimit: TcxCurrencyEdit;
    intedtQtyADS: TcxCurrencyEdit;
    lbl13: TLabel;
    lbl14: TLabel;
    fedtQty: TcxCurrencyEdit;
    Label1: TLabel;
    jvcuredtSellPriceCoret: TcxCurrencyEdit;
    fedtMarkUp: TcxCurrencyEdit;
    chkIsMailer: TCheckBox;
    lblMaxQtyDisc: TLabel;
    edtMaxQtyDisc: TcxCurrencyEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtUomPurchase: TEdit;
    edtUOMSTock: TEdit;
    edtPurchPrice: TcxCurrencyEdit;
    edtAVGPrice: TcxCurrencyEdit;
    Label4: TLabel;
    edtSellMargin: TcxCurrencyEdit;
    actSellPrice: TActionList;
    actAddSellPrice: TAction;
    Label6: TLabel;
    lblView: TcxLabel;
    Label5: TLabel;
    cxGrid: TcxGrid;
    cxGridViewSellingPrice: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridViewSellingPriceColumn1: TcxGridDBColumn;
    cxGridViewSellingPriceColumn2: TcxGridDBColumn;
    cxGridViewSellingPriceColumn3: TcxGridDBColumn;
    cxGridViewSellingPriceColumn4: TcxGridDBColumn;
    cxGridViewSellingPriceColumn5: TcxGridDBColumn;
    cxGridViewSellingPriceColumn6: TcxGridDBColumn;
    cxGridViewSellingPriceColumn7: TcxGridDBColumn;
    cxGridViewSellingPriceColumn8: TcxGridDBColumn;
    cxGridViewSellingPriceColumn9: TcxGridDBColumn;
    cxGridViewSellingPriceColumn10: TcxGridDBColumn;
    cxGridViewSellingPriceColumn11: TcxGridDBColumn;
    cxGridViewSellingPriceColumn12: TcxGridDBColumn;
    cxGridViewSellingPriceColumn13: TcxGridDBColumn;
    cxGridViewSellingPriceColumn14: TcxGridDBColumn;
    cxGridViewSellingPriceColumn15: TcxGridDBColumn;
    cxCurrencyEdit1: TcxCurrencyEdit;
    btnCancel: TcxButton;
    btnSave: TcxButton;
    procedure lblCloseClick(Sender: TObject);
    procedure lblAddClick(Sender: TObject);
    procedure lblEditClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure chkIsLimitClick(Sender: TObject);
    procedure chkIsADSClick(Sender: TObject);
    procedure jvcuredtSellPriceChange(Sender: TObject);
    procedure lblDeleteClick(Sender: TObject);
    procedure fedtMarkUpChange(Sender: TObject);
    procedure fedtDiscPercentExit(Sender: TObject);
    procedure cbbUOMExit(Sender: TObject);
    procedure jvcuredtDiscNominalExit(Sender: TObject);
//    procedure actAddSellPriceExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure lblViewClick(Sender: TObject);
    procedure cbbPriceTypeKeyPress(Sender: TObject; var Key: Char);
    procedure cbbUOMKeyPress(Sender: TObject; var Key: Char);
    procedure fedtQtyKeyPress(Sender: TObject; var Key: Char);
    procedure jvcuredtSellPriceKeyPress(Sender: TObject; var Key: Char);
    procedure fedtDiscPercentKeyPress(Sender: TObject; var Key: Char);
    procedure jvcuredtDiscNominalKeyPress(Sender: TObject; var Key: Char);
    procedure jvcuredtSellPriceDiscKeyPress(Sender: TObject;
      var Key: Char);
    procedure jvcuredtSellPriceCoretKeyPress(Sender: TObject;
      var Key: Char);
    procedure edtSellMarginKeyPress(Sender: TObject; var Key: Char);
    procedure chkIsLimitKeyPress(Sender: TObject; var Key: Char);
    procedure intedtQtyLimitKeyPress(Sender: TObject; var Key: Char);
    procedure jvcuredtPriceLimitKeyPress(Sender: TObject; var Key: Char);
    procedure chkIsADSExit(Sender: TObject);
    procedure chkIsLimitExit(Sender: TObject);
    procedure chkIsADSKeyPress(Sender: TObject; var Key: Char);
    procedure intedtQtyADSKeyPress(Sender: TObject; var Key: Char);
    procedure jvcuredtPriceADSKeyPress(Sender: TObject; var Key: Char);
    procedure chkIsMailerExit(Sender: TObject);
    procedure chkIsMailerKeyPress(Sender: TObject; var Key: Char);
    procedure cxGridViewSellingPriceEditing(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; var AAllow: Boolean);
    procedure fedtMarkUpKeyPress(Sender: TObject; var Key: Char);
    procedure edtMaxQtyDiscKeyPress(Sender: TObject; var Key: Char);
    procedure edtSellMarginExit(Sender: TObject);
  private
    SaveMode: TSaveMode;
//    FBHJ : TBarangHargaJual;
//    FBarang : TNewBarang;
    FProductCode: string;
    FLastCogs: Real;
    FUOMLama: string;
    sScale : TStrings;
    sKodeUOM : TStrings;
    sKodeBarang : String;
    iIDBarang : Integer;
    sUomBuy         : string;
    dUomBuyConv     : Double;
    //arrIdTpHarga: array of Integer;
    //arrSatuan: array of record
    //            Code  : String;
    //            Scale : Real;
    //           end;
    procedure SetProductCode(const Value: string);
    procedure SetLastCogs(const Value: Real);
    procedure ParseDataGrid();
    procedure ParseDataComboPriceType();
    procedure SetDiscon(isDiscPersen: Boolean);
    function AddData(): Boolean;
    procedure SetMarkUp;
    procedure SetSellingMargin;
    procedure AdvColGrdAddCheckBox(aCol: integer; aRow: integer; aValue: integer);
    procedure SetAttributDefault;
    procedure SetAttributEnable(aValue: Boolean);
    procedure SetAttributReadOnly(aValue: Boolean);
   // function EditData(intID: Integer): Boolean;
   // function DeleteData(intID: Integer): Boolean;
  public
//    FSelfIsStore: Integer;
    FSelfUnitId : Integer;
    FTpApp      : TTipeApp;
    function getBarisKosong: Integer;
    function GetHasilCheckBox(checkBox: TCheckBox): Integer;
    function GetIDBArangFromKode(kodeBarang: String): Integer;
    procedure ParseDataCbbUOM;
    procedure setCheckBox(checkBox: TCheckBox; aNilai : Integer);
    procedure ShowSellingPrice(AProductCode: String);
  published
    property ProductCode: string read FProductCode write SetProductCode;
    property LastCOGS: Real read FLastCogs write SetLastCogs;
  end;

var
  fraSellingPrice: TfraSellingPrice;

const
  _kolBHJSatCode = 0;
  _kolBHJConvValue = 1;
  _kolTPHRGName = 2;
  _kolBHJSellPrice = 3;
  _kolBHJDiscPersen = 4;
  _kolBHJDiscNominal = 5;
  _kolBHJSellPriceDisc = 6;
  _kolBHJIsLimitQTY = 7;
  _KolBHJIsQtySubsidy = 8;
  _kolID = 14;
  _kolIsMailer = 9;
  _kolPurChaseRp = 10;
  _kolPurchaseUom = 11;
  _kolAvgRp = 12;
  _kolAvgUom = 13;



implementation

uses uConn, ufrmProduct, uTSCommonDlg, uConstanta, ufraProductSupplier;

{$R *.dfm}

{ TfraSellingPrice }

procedure TfraSellingPrice.AdvColGrdAddCheckBox(aCol: integer; aRow: integer; aValue: integer);
begin
   {
    if aValue = 1 then
      strgGrid.AddCheckBox(aCol , aRow, True , False)
    else
      strgGrid.AddCheckBox(aCol, aRow, False , False);

    strgGrid.Alignments[aCol,aRow]  := taCenter;
    }
end;

procedure TfraSellingPrice.SetProductCode(const Value: string);
begin
  FProductCode := Value;
end;

procedure TfraSellingPrice.SetLastCogs(const Value: Real);
begin
  FLastCogs:= Value;
end;

procedure TfraSellingPrice.ParseDataComboPriceType();
var
  sSQL: string;
begin
   sSQL := ' select TPHRG_ID, TPHRG_NAME '
           + ' from ref$tipe_HArga '
           + ' where TPHRG_UNT_ID = ' + IntToStr(FSelfUnitId);
//   cQueryToComboObject(cbbPriceType, sSQL);

end;

procedure TfraSellingPrice.ShowSellingPrice(AProductCode: String);
var
  sUOMLastPrice: string;
  dLastPrice: Double;
  dQtyConv  : Double;
begin

  if FTpApp = TSTORE then
  begin
    pnlAddEdit.Enabled := False
  end
  else
  begin
    pnlAddEdit.Enabled := True;
  end;

  lblAdd.Enabled      := pnlAddEdit.Enabled;
  lblEdit.Enabled     := pnlAddEdit.Enabled;
  lblDelete.Enabled   := pnlAddEdit.Enabled;

//  FBHJ                := TBarangHargaJual.Create(Self);
//  FBarang             := TNewBarang.Create(Self);

  sScale              := TStringList.Create;
  sKodeUOM            := TStringList.Create;
  sKodeBarang         := frmProduct.cbpProductCode.Text;
  iIDBarang           := GetIDBArangFromKode(sKodeBarang);

//  FBarang.LoadByKode(sKodeBarang);
//  edtAVGPrice.Value   := FBarang.HargaAverage;
//  edtUOMStock.Text    := FBarang.KodeSatuanStock.UOM;



//  FBarang.GetLastPurchasePrice(dLastPrice,sUOMLastPrice);
  edtPurchPrice.Value := dLastPrice;
  edtUomPurchase.Text := sUOMLastPrice;

//  fedtMarkUp.Value    := RoundTo(FBarang.DefaultMarkUP,-2);
  pnlAddEdit.Visible  := false;



  sUomBuy             := edtUomPurchase.Text;
//  dQtyConv  := GetQtyConv(sUomBuy, sKodeBarang);
  if dQtyConv <= 0 then
    dQtyConv  := 1;

  dUomBuyConv := 1 / dQtyConv;


  ParseDataGrid;
  ParseDataComboPriceType;
  cxGrid.SetFocus;


  ParseDataCbbUOM;

end;

procedure TfraSellingPrice.lblCloseClick(Sender: TObject);
begin
  fraSellingPrice.Parent := nil;
  if (assigned(fraProductSupplier)) and (fraProductSupplier.Parent <> nil) then
  begin
    frmProduct.actProductSupplierExecute(nil);
  end
  else
    frmProduct.SetActiveFooter5Button(True);
end;

procedure TfraSellingPrice.lblAddClick(Sender: TObject);
begin
  if FSelfUnitId=0 then
  begin
    CommonDlg.ShowError('UNIT BELUM DIPILIH');
    //frmMain.cbbUnit.SetFocus;
    Exit;
  end;

  FUOMLama                    := '';
  cbbPriceType.ItemIndex      := cbbPriceType.Items.IndexOf('TOKO');
//  jvcuredtSellPrice.Value     := FBarang.GetSellPricePrice;
  fedtDiscPercent.Value       := 0;
  jvcuredtDiscNominal.Value   := 0;
  jvcuredtSellPriceDisc.Value := 0;
  chkIsLimit.Checked          := False;
  intedtQtyLimit.Value        := 0;
  jvcuredtPriceLimit.Value    := 0;
  chkIsLimitClick(Self);
  chkIsADS.Checked            := False;
  intedtQtyADS.Value          := 0;
  jvcuredtPriceADS.Value      := 0;
  jvcuredtSellPriceCoret.Value:= 0;
  cbbUOMExit(nil);
  chkIsADSClick(Self);

  SaveMode                    := smAdd;
  pnlAddEdit.Visible          := True;
end;

procedure TfraSellingPrice.lblEditClick(Sender: TObject);
var BHJID: Integer;
  sUOMLastPurchase: string;
  dLastPurchase: Double;
begin

  SetAttributReadOnly(False);
  SetAttributEnable(True);
//  SetAttributDefault;

  if FSelfUnitId=0 then
  begin
    CommonDlg.ShowError('UNIT BELUM DIPILIH');
    //frmMain.cbbUnit.SetFocus;
    Exit;
  end;

  {
  if FBHJ.LoadByID(BHJID, FSelfUnitId) then
  begin
    FUOMLama := FBHJ.NewUOM.UOM;

    cSetItemAtComboObject(cbbPriceType,FBHJ.TipeHargaID);
    cSetItemAtComboObjectCode(cbbUOM, FBHJ.NewUOM.UOM);
    fedtQty.Value                 := FBHJ.KonversiValue;
    jvcuredtSellPrice.Value       := FBHJ.SellPrice;
    fedtDiscPercent.Value         := FBHJ.DiscPersen;
    jvcuredtDiscNominal.Value     := FBHJ.DiscNominal;
    jvcuredtSellPriceDisc.Value   := FBHJ.SellPriceDisc;
    jvcuredtSellPriceCoret.Value  := FBHJ.SellPriceCoret;
    setCheckBox(chkIsLimit,FBHJ.IsLimitQty);
    intedtQtyLimit.Value          := FBHJ.LimitQty;
    jvcuredtPriceLimit.Value      := FBHJ.LimitQtyPrice;
    setCheckBox(chkIsADS,FBHJ.IsQtySubsidy);
    intedtQtyADS.Value            := FBHJ.QtySubsidy;
    jvcuredtPriceADS.Value        := FBHJ.QtySubsidyPrice;
    edtMaxQtyDisc.Value           := FBHJ.MaxQtyDisc;
    chkIsMailer.Checked           := FBHJ.IsMailer = 1;

    edtAVGPrice.Value             := FBHJ.NewBarang.HargaAverage;
    edtUOMStock.Text              := FBHJ.NewBarang.KodeSatuanStock.UOM;

    FBHJ.NewBarang.GetLastPurchasePrice(dLastPurchase,sUOMLastPurchase);
    edtPurchPrice.Value           := dLastPurchase;
    edtUomPurchase.Text           := sUOMLastPurchase;

    chkIsADSClick(Self);
    SaveMode:= smEdit;

    cbbUOMExit(nil);
  end else
    CommonDlg.ShowMessage('Tidak bisa load Data');
  }
  pnlAddEdit.Visible := true;

end;

procedure TfraSellingPrice.btnCancelClick(Sender: TObject);
begin
  pnlAddEdit.Visible := false;
end;

function TfraSellingPrice.AddData(): Boolean;
var
  iIsMailer: Integer;
  aTipeHargaID: Integer;
  aSellPriceDisc: Double;
  aSellPriceCoret: Double;
  aSellPrice: Double;
  aRemark: string;
  aQtySubsidyPrice: Double;
  aQtySubsidy: Integer;
  aUOM: string;
  aNewUnit_ID: Integer;
  aNewBarangKode: string;
  aMarkUp: Double;
  aLimitQtyPrice: Double;
  aLimitQty: Integer;
  aKonversiValue: Double;
  aIsQtySubsidy: Integer;
  aIsLimitQty: Integer;
  aID: Integer;
  aDiscPersen: Double;
  aDiscNominal: Double;
  aAlokasiDanaSupplierID: Integer;
begin
  Result := False;
  {if SaveMode = smAdd then
    aID := 0
  else
    aID := FBHJ.ID;


  aAlokasiDanaSupplierID := 0; // he he he ...........
  aDiscNominal := jvcuredtDiscNominal.Value;
  aDiscPersen := fedtDiscPercent.Value;

  aIsLimitQty := GetHasilCheckBox(chkIsLimit);
  aIsQtySubsidy := GetHasilCheckBox(chkIsADS);
  aKonversiValue := fedtQty.Value;
  aLimitQty := Floor( intedtQtyLimit.Value);
  aLimitQtyPrice := jvcuredtPriceLimit.Value;
  aMarkUp := fedtMarkUp.Value;
  aNewBarangKode := sKodeBarang ;
  aNewUnit_ID := FSelfUnitId;
  aUOM := cGetIDfromComboCode(cbbUOM);
  aQtySubsidy := Floor(intedtQtyADS.Value);
  aQtySubsidyPrice := jvcuredtPriceADS.Value;
  aRemark := '';
  aSellPrice := jvcuredtSellPrice.Value ;
  aSellPriceCoret := jvcuredtSellPriceCoret.Value;
  aSellPriceDisc := jvcuredtSellPriceDisc.Value;
  aTipeHargaID := cGetIDfromCombo(cbbPriceType) ;

  if FUOMLama <> aUOM then
  begin
    if IsUOMSudahAdaTransaksi(FBHJ.NewBarang.Kode, FBHJ.NewUOM.UOM) then
    begin
      CommonDlg.ShowError('Setting Harga Tidak Bisa Diubah' + #13 + 'Sudah Ada Transaksi Yang Memakai Setting Harga Tersebut');
      cRollbackTrans;
      Exit;
    end;
  end;

  if FBHJ.IsSettingHargaJualSudahAda(FSelfUnitId, aNewBarangKode, aUOM, aTipeHargaID, aID) then
  begin
    CommonDlg.ShowError('Barang, Satuan , Dan Tipe Harga Sudah Diinput');
    cbbUOM.SetFocus;
    Exit;
  end;
  
  if (aSellPrice < 0) or (aSellPriceDisc < 0) or (aSellPriceCoret < 0) then
  begin
    CommonDlg.ShowMessage('Tidak boleh ada nilai minus');
    Exit;
  end;

  iIsMailer := 0;
  if chkIsMailer.Checked then
    iIsMailer := 1;

  FBHJ.UpdateData(
  aAlokasiDanaSupplierID,
  aDiscNominal,
  aDiscPersen,
  aID,
  aIsLimitQty,
  aIsQtySubsidy,
  aKonversiValue,
  aLimitQty,
  aLimitQtyPrice,
  aMarkUp,
  aNewBarangKode,
  aNewUnit_ID,
  aUOM,
  aQtySubsidy,
  aQtySubsidyPrice,
  aRemark,
  aSellPrice,
  aSellPriceCoret,
  aSellPriceDisc,
  aTipeHargaID,
  iIsMailer,
  edtMaxQtyDisc.Value);

    try
//      if FBHJ.ExecuteGenerateSQL then
      if FBHJ.ExecuteGenerateSQLByUnit then
      begin
//        if not IsUOMSudahAdaKonversi(FBHJ.NewBarang.Kode, FBHJ.NewUOM.UOM, FBHJ.NewUnit.ID) then
//        begin
//          CommonDlg.ShowError('KOnversi UOM ' + FBHJ.NewUOM.UOM + ' Tidak Ditemukan');
//          Exit;
//          cRollbackTrans;
//        end;
//
        cCommitTrans;
        Result := True;
        CommonDlg.ShowMessage('Berhasil Menyimpan Data');
        ParseDataGrid;
      end
      else begin
        cRollbackTrans;
        CommonDlg.ShowMessage('Gagal Menyimpan Data');
      end;
    finally
      cRollbackTrans;
    end;


  pnlAddEdit.Visible := false;
 }

end;

procedure TfraSellingPrice.btnSaveClick(Sender: TObject);
begin
  if cbbUOM.Text='' then
  begin
    CommonDlg.ShowError('UOM Belum Dipilih');
    cbbUOM.SetFocus;
    Exit;
  end;

  if fedtQty.Value <= 0 then
  begin
    CommonDlg.ShowError('Konversi UOM Masih Salah');
    fedtQty.SetFocus;
    Exit;
  end;

//  if IsUOMSudahAdaTransaksi(frmProduct.cbpProductCode.Text, cGetIDfromComboCode(cbbUOM)) then
//  begin
//    CommonDlg.ShowError('Setting Harga Tidak Bisa Disimpan' + #13 + 'KonversiUOM Tidak Ditemukan');
//    cRollbackTrans;
//    Exit;
//  end;

  cbbUOMExit(nil);

  AddData;
end;

procedure TfraSellingPrice.ParseDataGrid;
var //data: TResultDataSet;
  iBaris    : Integer;
  sSQL      : string;
  sBrgCode  : string;
  sUom      : string;
  dHrgAvg   : Double;
  sUomAvg   : string;
  dPurch    : Double;
  sUomPurch : string;
  //  i: Integer;
begin

  dHrgAvg   := 0;
  dPurch    := 0;
//  cClearGrid(strgGrid,False);
  sSQL := 'SELECT BHJ.BHJ_SAT_CODE, BHJ.BHJ_CONV_VALUE, TH.TPHRG_NAME, BHJ.BHJ_SELL_PRICE, '
          + ' BHJ.BHJ_DISC_PERSEN, BHJ.BHJ_DISC_NOMINAL, BHJ.BHJ_SELL_PRICE_DISC, '
          + ' BHJ.BHJ_IS_LIMIT_QTY, BHJ.BHJ_IS_QTY_SUBSIDY, BHJ.BHJ_ID,'
          + ' BHJ.BHJ_IS_MAILER, BHJ.BHJ_BRG_CODE'
          + ' FROM BARANG_HARGA_JUAL BHJ '
          + ' LEFT JOIN REF$TIPE_HARGA TH ON BHJ.BHJ_TPHRG_ID=TH.TPHRG_ID '
          + ' AND BHJ.BHJ_TPHRG_UNT_ID=TH.TPHRG_UNT_ID '
          + ' WHERE BHJ.BHJ_BRG_CODE = ' + QuotedStr(sKodeBarang)
          + ' and BHJ.BHJ_UNT_ID = ' + intTostr(FSelfUnitId);
   {with cOpenQuery(sSQL) do
   begin
     try
      iBaris := getBarisKosong;
         if iBaris = 0 then
         begin
           strgGrid.AddRow;
           iBaris := strgGrid.RowCount - 1;
         end;
         if not Eof then
         begin
            sBrgCode  := FieldByName('BHJ_BRG_CODE').AsString;
            sSQL := 'SELECT BRG_HARGA_AVERAGE, BRG_SAT_CODE_STOCK'
                + ' FROM BARANG'
                + ' WHERE BRG_CODE = '+ Quot(sBrgCode);
            with cOpenQuery(sSQL) do
            begin
              try
                dHrgAvg := Fields[0].AsFloat;
                sUomAvg := Fields[1].AsString;
              finally
                Free;
              end;
            end;

              sSQL := 'select b.dod_price,b.dod_sat_code_order '
                    + ' from dord a,do_detil b'
                    + ' where a.do_no = b.dod_do_no'
                    + ' and a.do_unt_id = b.dod_do_unt_id'
                    + ' and a.do_unt_id = ' + IntToStr(FSelfUnitId)
                    + ' and b.dod_qty_order_recv <> 0'
                    + ' and b.dod_brg_code = ' + Quot(sBrgCode)
                    + ' order by a.do_date desc';
            with cOpenQuery(sSQL) do
            begin
              try
                dPurch := Fields[0].AsFloat;
                sUomPurch := Fields[1].AsString;
              finally
                free;
              end;
            end;

         end;

         while not Eof do
         begin
           strgGrid.Cells[_kolBHJSatCode, iBaris] := FieldByName('BHJ_SAT_CODE').AsString;
           strgGrid.Cells[_kolBHJConvValue, iBaris] := FieldByName('BHJ_CONV_VALUE').AsString;
           strgGrid.Cells[_kolTPHRGName, iBaris] := FieldByName('TPHRG_NAME').AsString;
           strgGrid.Cells[_kolBHJSellPrice, iBaris] := FieldByName('BHJ_SELL_PRICE').AsString;
           strgGrid.Cells[_kolBHJDiscPersen, iBaris] := FieldByName('BHJ_DISC_PERSEN').AsString;
           strgGrid.Cells[_kolBHJDiscNominal, iBaris] := FieldByNAme('BHJ_DISC_NOMINAL').AsString;
           strgGrid.Cells[_kolBHJSellPriceDisc, iBaris] := FieldByName('BHJ_SELL_PRICE_DISC').AsString;

//           strgGrid.Cells[_kolBHJIsLimitQty, iBaris] := FieldByName('BHJ_IS_LIMIT_QTY').AsString;
           AdvColGrdAddCheckBox(_kolBHJIsLimitQty, iBaris, FieldByName('BHJ_IS_LIMIT_QTY').AsInteger);
//           strgGrid.Cells[_kolBHJisQtySubsidy, iBaris] := FieldByName('BHJ_IS_QTY_SUBSIDY').AsString;
           AdvColGrdAddCheckBox(_kolBHJisQtySubsidy, iBaris, FieldByName('BHJ_IS_QTY_SUBSIDY').AsInteger);
//           strgGrid.Cells[_kolIsMailer, iBaris] := FieldByName('BHJ_IS_MAILER').AsString;
           AdvColGrdAddCheckBox(_kolIsMailer, iBaris, FieldByName('BHJ_IS_MAILER').AsInteger);

           sUom      := FieldByName('BHJ_SAT_CODE').AsString;
           strgGrid.Cells[_kolPurChaseRp, iBaris] :=  FormatFloat('#,###,##0.00', dPurch);
           strgGrid.Cells[_kolPurchaseUom, iBaris] := sUomPurch;
           strgGrid.Cells[_kolAvgRp, iBaris] :=  FormatFloat('#,###,##0.00',
                                             dHrgAvg * GetQtyConvFromTo(sUom, sUomAvg,  sBrgCode));
           strgGrid.Cells[_kolAvgUom, iBaris] := sUomAvg;

           strgGrid.Cells[_kolID, iBaris] := FieldByName('BHJ_ID').AsString;
           Next;
           if not Eof then
           begin
             strgGrid.AddRow;
             Inc(iBaris);
           end;
         end;

     finally
       Free;
     end;
   end;
  strgGrid.ColWidths[_kolID]          := 0;
  strgGrid.ColWidths[_kolPurChaseRp]  := 0;
  strgGrid.ColWidths[_kolPurchaseUom] := 0;
  strgGrid.ColWidths[_kolAvgRp]       := 0;
  strgGrid.ColWidths[_kolAvgUom]      := 0;
  }
end;

procedure TfraSellingPrice.chkIsLimitClick(Sender: TObject);
begin
  if chkIsLimit.Checked then
  begin
    intedtQtyLimit.Enabled:= True;
    jvcuredtPriceLimit.Enabled:= True;
  end
  else
  begin
    intedtQtyLimit.Enabled:= False;
    jvcuredtPriceLimit.Enabled:= False;
  end;
end;

procedure TfraSellingPrice.chkIsADSClick(Sender: TObject);
begin
  if chkIsADS.Checked then
  begin
    intedtQtyADS.Enabled:= True;
    jvcuredtPriceADS.Enabled:= True;
  end
  else
  begin
    intedtQtyADS.Enabled:= False;
    jvcuredtPriceADS.Enabled:= False;
  end;
end;

procedure TfraSellingPrice.SetDiscon(isDiscPersen: Boolean);
begin
  {
  jvcuredtSellPriceDisc.Value := (((100 - fedtDiscPercent.Value) / 100) *
                                jvcuredtSellPrice.Value) - jvcuredtDiscNominal.Value;
  }
  if isDiscPersen then
    jvcuredtDiscNominal.Value := jvcuredtSellPrice.Value * fedtDiscPercent.Value / 100
  else if jvcuredtSellPrice.Value <> 0 then
    fedtDiscPercent.Value := jvcuredtDiscNominal.Value / jvcuredtSellPrice.Value * 100
  else begin
    fedtDiscPercent.Value := 0;
  end;

  jvcuredtSellPriceDisc.Value := (((100 - fedtDiscPercent.Value) / 100) *
                                jvcuredtSellPrice.Value);

end;

procedure TfraSellingPrice.jvcuredtSellPriceChange(Sender: TObject);
begin
  SetDiscon(True);
  SetMarkUp;
  SetSellingMargin;
end;

procedure TfraSellingPrice.lblDeleteClick(Sender: TObject);
var //i: Integer;
  bhjID: Integer;
  //  isChecked,isSuccesfully: Boolean;
begin
  if (CommonDlg.Confirm('Are you sure you wish to delete detail selling price ?') = mrYes) then
  begin
    {try
      bhjID := StrToInt(strgGrid.cells[_kolID,strgGrid.Row]);
      if FBHJ.LoadByID(bhjID, FSelfUnitId) then
      begin
        if FBHJ.RemoveFromDB then
        begin
          if IsUOMSudahAdaTransaksi(FBHJ.NewBarang.Kode, FBHJ.NewUOM.UOM) then
          begin
            CommonDlg.ShowError('Setting Harga Tidak Bisa Dihapus' + #13 + 'Sudah Ada Transaksi Yang Memakai Setting Harga Tersebut');
            cRollbackTrans;
            Exit;
          end;

          cCommitTrans;
          FUOMLama := '';
          CommonDlg.ShowConfirm(atDelete)
        end else begin
          cRollbackTrans;
          CommonDlg.ShowMessage('gagal menghapus data');
        end;
      end else begin
        cRollbackTrans;
        CommonDlg.ShowMessage('Barang tersebut tidak bisa ditampilkan ');
       end;
    finally
      cRollbackTrans;
    end;  }
  end;

  ParseDataGrid;
end;

procedure TfraSellingPrice.fedtMarkUpChange(Sender: TObject);
//var MarkUpNominal: Real;
begin
  {MarkUpNominal:= (fedtMarkUp.Value/100) * LastCOGS!;
  jvcuredtSellPrice.Value:= LastCOGS + MarkUpNominal;
  }
end;

procedure TfraSellingPrice.fedtDiscPercentExit(Sender: TObject);
begin
  SetDiscon(True);
end;

function TfraSellingPrice.getBarisKosong: Integer;
var
  i: Integer;
begin
  Result := 0;
{  for i := 0 to strgGrid.RowCount - 1  do
  begin
    if strgGrid.Cells[2, i] = '' then
    begin
      Result := i;
      Exit;
    end;
  end;

  if (Result = 0) then
  begin
    strgGrid.AddRow;
    Result := strgGrid.RowCount - 1;
  end; }
end;

function TfraSellingPrice.GetHasilCheckBox(checkBox: TCheckBox): Integer;
begin
  Result := 0;
  if checkBox.Checked = True then
    Result := 1
end;

function TfraSellingPrice.GetIDBArangFromKode(kodeBarang: String): Integer;
begin
  Result := 0;
end;

procedure TfraSellingPrice.ParseDataCbbUOM;
var
 // i: Integer;
  sSQL: string;
begin
  sScale := TStringList.Create;
  sKodeUOM := TStringList.Create;
  sSQL := ' select distinct a.konvsat_sat_code_from, b.sat_name '
          + ' from ref$konversi_satuan a, ref$satuan b '
          + ' where a.konvsat_brg_code = ' + Quotedstr(sKodeBarang)
          + ' and b.sat_Code = a.konvsat_sat_code_from ';
//  cQueryToComboObjectCode(cbbUOM,sSQL);
end;

procedure TfraSellingPrice.setCheckBox(checkBox: TCheckBox; aNilai : Integer);
begin
  if aNilai = 1 then
    checkBox.Checked := True
  else if aNilai = 0 then
    checkBox.Checked := False;
end;

procedure TfraSellingPrice.cbbUOMExit(Sender: TObject);
var
  sSQL: string;
begin
  {edtUOMSTock.Text := cGetIDfromComboCode(cbbUOM);

  sSQL := 'select distinct konvsat_scale '
          + ' from ref$Konversi_satuan '
          + ' where konvsat_sat_code_from = ' + Quot(cGetIDfromComboCode(cbbUOM))
          + ' and konvsat_brg_code = ' + Quot(sKodeBarang);
  with cOpenQuery(sSQL) do
  begin
    try
      if not FieldByName('konvsat_scale').IsNull then
        fedtQty.Value:= StrToFloat(FieldByName('konvsat_scale').AsString)
      else
        fedtQty.Value := 0;

      edtAVGPrice.Value := FBarang.HargaAverage * fedtQty.Value;
      SetMarkUp;
      SetSellingMargin;
    finally
      Free
    end;
  end; }
end;

procedure TfraSellingPrice.SetMarkUp;
var
  dSelisihHarga: Double;
begin
  dSelisihHarga := jvcuredtSellPrice.Value - edtAVGPrice.Value;
  if edtAVGPrice.Value <> 0 then
    fedtMarkUp.Value := RoundTo(dSelisihHarga / edtAVGPrice.Value * 100,-2)
  else
    fedtMarkUp.Value := 0;
end;

procedure TfraSellingPrice.SetSellingMargin;
var
  dUomCurPrice  : Double;
begin
  if fedtQty.Value <> 0 then
    dUomCurPrice  := fedtQty.Value
  else
    dUomCurPrice  := 1;
  {
  if FBarang.HargaAverage<>0 then
    edtSellMargin.Value := RoundTo(((jvcuredtSellPrice.Value - FBarang.HargaAverage)
                           * 100 * dUomCurPrice * dUomBuyConv) / FBarang.HargaAverage,-2)
  else
    edtSellMargin.Value := 0;
     }
end;

procedure TfraSellingPrice.jvcuredtDiscNominalExit(Sender: TObject);
begin
  SetDiscon(False);
end;

procedure TfraSellingPrice.Action1Execute(Sender: TObject);
begin
  if FSelfUnitId=0 then
  begin
    CommonDlg.ShowError('UNIT BELUM DIPILIH');
    //frmMain.cbbUnit.SetFocus;
    Exit;
  end;

  FUOMLama                    := '';
  cbbPriceType.ItemIndex      := cbbPriceType.Items.IndexOf('TOKO');
//  jvcuredtSellPrice.Value     := FBarang.GetSellPricePrice;
  fedtDiscPercent.Value       := 0;
  jvcuredtDiscNominal.Value   := 0;
  jvcuredtSellPriceDisc.Value := 0;
  chkIsLimit.Checked          := False;
  intedtQtyLimit.Value        := 0;
  jvcuredtPriceLimit.Value    := 0;
  chkIsLimitClick(Self);
  chkIsADS.Checked            := False;
  intedtQtyADS.Value          := 0;
  jvcuredtPriceADS.Value      := 0;
  cbbUOMExit(nil);
  chkIsADSClick(Self);

  SaveMode                    := smAdd;
  pnlAddEdit.Visible          := True;

end;

procedure TfraSellingPrice.lblViewClick(Sender: TObject);
begin
  lblEditClick(self);
  SetAttributReadOnly(True);
  SetAttributEnable(False);
  SetAttributDefault;

end;

procedure TfraSellingPrice.SetAttributDefault;
begin
  fedtqty.Properties.ReadOnly                := True;
  jvcuredtSellPriceDisc.Properties.ReadOnly  := True;
  edtSellMargin.Properties.ReadOnly          := True;
  fedtMarkUp.Properties.ReadOnly             := True;
  edtMaxQtyDisc.Properties.ReadOnly          := True;
  edtPurchPrice.Properties.ReadOnly          := True;
  edtUomPurchase.ReadOnly         := True;
  edtAvgPrice.Properties.ReadOnly            := True;
  edtUomStock.ReadOnly            := True;
end;

procedure TfraSellingPrice.SetAttributEnable(aValue: Boolean);
begin
  cbbPriceType.Enabled            := aValue;
  cbbUOM.Enabled                  := aValue;
  chkIsLimit.Enabled              := aValue;
  chkIsADS.Enabled                := aValue;
  chkIsMailer.Enabled             := aValue;
  btnSave.Enabled                 := aValue;
  btnCancel.Enabled               := aValue;
end;

procedure TfraSellingPrice.SetAttributReadOnly(aValue: Boolean);
begin
  jvcuredtSellPrice.Properties.ReadOnly      := aValue;
  fedtDiscPercent.Properties.ReadOnly        := aValue;
  jvcuredtDiscNominal.Properties.ReadOnly    := aValue;
  jvcuredtSellPriceCoret.Properties.ReadOnly := aValue;
  intedtQtyLimit.Properties.ReadOnly         := aValue;
  intedtQtyADS.Properties.ReadOnly           := aValue;
  jvcuredtPriceLimit.Properties.ReadOnly     := aValue;
  jvcuredtPriceADS.Properties.ReadOnly       := aValue;

end;

procedure TfraSellingPrice.cbbPriceTypeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    cbbUOM.SetFocus;
    cbbUOM.SelectAll;
  end;
end;

procedure TfraSellingPrice.cbbUOMKeyPress(Sender: TObject; var Key: Char);
var
  sSQL: string;
begin
  {
  edtUOMSTock.Text := cGetIDfromComboCode(cbbUOM);
   
  sSQL := 'select distinct konvsat_scale '
          + ' from ref$Konversi_satuan '
          + ' where konvsat_sat_code_from = ' + Quot(cGetIDfromComboCode(cbbUOM))
          + ' and konvsat_brg_code = ' + Quot(sKodeBarang);
  with cOpenQuery(sSQL) do
  begin
    try
      if not FieldByName('konvsat_scale').IsNull then
        fedtQty.Value:= StrToFloat(FieldByName('konvsat_scale').AsString)
      else
        fedtQty.Value := 0;

      edtAVGPrice.Value := FBarang.HargaAverage * fedtQty.Value;
      SetMarkUp;
      SetSellingMargin;
    finally
      Free
    end;
  end; }

  if (Key = Chr(VK_RETURN)) then
  begin
    fedtQty.SetFocus;
    fedtQty.SelectAll;
  end;
end;

procedure TfraSellingPrice.fedtQtyKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    jvcuredtSellPrice.SetFocus;
    jvcuredtSellPrice.SelectAll;
  end;
end;

procedure TfraSellingPrice.jvcuredtSellPriceKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    fedtDiscPercent.SetFocus;
    fedtDiscPercent.SelectAll;
  end;
end;

procedure TfraSellingPrice.fedtDiscPercentKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = Chr(VK_RETURN) then 
  begin
    jvcuredtDiscNominal.SetFocus;
    SetDiscon(True);
  end
end;

procedure TfraSellingPrice.jvcuredtDiscNominalKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = Chr(VK_RETURN) then
  begin
    jvcuredtSellPriceDisc.SetFocus;
    SetDiscon(False);
  end
end;

procedure TfraSellingPrice.jvcuredtSellPriceDiscKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    jvcuredtSellPriceCoret.SetFocus;
    jvcuredtSellPriceCoret.SelectAll;
  end;
end;

procedure TfraSellingPrice.jvcuredtSellPriceCoretKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    edtSellMargin.SetFocus;
    edtSellMargin.SelectAll;
  end;
end;

procedure TfraSellingPrice.edtSellMarginKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    chkIsLimit.SetFocus;
  end;
end;

procedure TfraSellingPrice.chkIsLimitKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    intedtQtyLimit.SetFocus;
    intedtQtyLimit.SelectAll;
  end;
end;

procedure TfraSellingPrice.intedtQtyLimitKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    jvcuredtPriceLimit.SetFocus;
    jvcuredtPriceLimit.SelectAll;
  end;
end;

procedure TfraSellingPrice.jvcuredtPriceLimitKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    chkIsADS.SetFocus;
  end;
end;

procedure TfraSellingPrice.chkIsADSExit(Sender: TObject);
begin
  if chkIsADS.Checked then
  begin
    intedtQtyADS.Enabled:= True;
    jvcuredtPriceADS.Enabled:= True;
  end
  else
  begin
    intedtQtyADS.Enabled:= False;
    jvcuredtPriceADS.Enabled:= False;
  end;
end;

procedure TfraSellingPrice.chkIsLimitExit(Sender: TObject);
begin
  if chkIsLimit.Checked then
  begin
    intedtQtyLimit.Enabled:= True;
    jvcuredtPriceLimit.Enabled:= True;
  end
  else
  begin
    intedtQtyLimit.Enabled:= False;
    jvcuredtPriceLimit.Enabled:= False;
  end;
end;

procedure TfraSellingPrice.chkIsADSKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    intedtQtyADS.SetFocus;
    intedtQtyADS.SelectAll;
  end;
end;

procedure TfraSellingPrice.intedtQtyADSKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    jvcuredtPriceADS.SetFocus;
    jvcuredtPriceADS.SelectAll;
  end;
end;

procedure TfraSellingPrice.jvcuredtPriceADSKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    chkIsMailer.SetFocus;
  end;
end;

procedure TfraSellingPrice.chkIsMailerExit(Sender: TObject);
begin
  if chkIsADS.Checked then
  begin
    intedtQtyADS.Enabled:= True;
    jvcuredtPriceADS.Enabled:= True;
  end
  else
  begin
    intedtQtyADS.Enabled:= False;
    jvcuredtPriceADS.Enabled:= False;
  end;
end;

procedure TfraSellingPrice.chkIsMailerKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    fedtMarkUp.SetFocus;
    fedtMarkUp.SelectAll;
  end;
end;

procedure TfraSellingPrice.cxGridViewSellingPriceEditing(Sender:
    TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
//  if(ACol = 0)and(strgGrid.Cells[1,ARow]<>'')then
//    CanEdit := true
//  else
//    CanEdit := false;
end;

procedure TfraSellingPrice.fedtMarkUpKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    edtMaxQtyDisc.SetFocus;
    edtMaxQtyDisc.SelectAll;
  end;
end;

procedure TfraSellingPrice.edtMaxQtyDiscKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    btnSave.SetFocus;
  end;
end;

procedure TfraSellingPrice.edtSellMarginExit(Sender: TObject);
begin
//  FormatFloat('%.2n',edtSellMargin.Value);
end;

End.
