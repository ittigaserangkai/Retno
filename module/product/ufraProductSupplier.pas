unit ufraProductSupplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, uConn, uRetnoUnit, ActnList, uFormProperty,
  System.Actions, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.Menus, cxButtons, cxContainer,cxLabel, cxTextEdit, cxCurrencyEdit,
  cxCheckBox;

type
  TSaveProductSup = (sbAdd,sbEdit);

  TfraProductSupplier = class(TFrame)
    pnl4: TPanel;
    pnlAddEdit: TPanel;
    pnl1: TPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl10: TLabel;
    edtSupNameBwh: TEdit;
    intedtTOP: TcxCurrencyEdit;
    edtDisc1: TcxCurrencyEdit;
    edtDisc2: TcxCurrencyEdit;
    edtDisc3: TcxCurrencyEdit;
    lbl15: TLabel;
    lbl16: TLabel;
    edtPPrceDisc: TcxCurrencyEdit;
    lbl18: TLabel;
    intedtExpTime: TcxCurrencyEdit;
    lbl32: TLabel;
    lbl19: TLabel;
    lbl33: TLabel;
    intedtDelvrTime: TcxCurrencyEdit;
    lbl34: TLabel;
    chkEnableCN: TcxCheckBox;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl23: TLabel;
    chkIsSupPrim: TcxCheckBox;
    lbl11: TLabel;
    cbbIsBKP: TComboBox;
    intedtStockIn: TcxCurrencyEdit;
    intedtMinOrd: TcxCurrencyEdit;
    intedtMaxOrd: TcxCurrencyEdit;
    edtSupCode: TEdit;
    lblKetBKP: TLabel;
    chkIsActive: TcxCheckBox;
    lbl6: TLabel;
    lbl9: TLabel;
    lbl12: TLabel;
    edtMarkup: TcxCurrencyEdit;
    edtSellingPrice: TcxCurrencyEdit;
    lbl13: TLabel;
    pnl3: TPanel;
    lblAdd: TcxLabel;
    lblEdit: TcxLabel;
    lblDelete: TcxLabel;
    lblClose: TcxLabel;
    lbl1: TLabel;
    edtSupNameUP: TEdit;
    cbbUOM: TComboBox;
    lblView: TcxLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cbbUOMSell: TComboBox;
    jvcuredtSellPrice: TcxCurrencyEdit;
    cbbPriceType: TComboBox;
    fedtQty: TcxCurrencyEdit;
    Label5: TLabel;
    fedtDiscPercent: TcxCurrencyEdit;
    lbl42: TLabel;
    Label6: TLabel;
    edSell: TcxCurrencyEdit;
    chSaveEditedSellPrice: TcxCheckBox;
    Bevel1: TBevel;
    edtPurchPrice: TcxCurrencyEdit;
    actlst1: TActionList;
    actView: TAction;
    actAdd: TAction;
    actEdit: TAction;
    actDelete: TAction;
    cxGrid: TcxGrid;
    cxGridViewProductSupplier: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    btnSave: TcxButton;
    btnCancel: TcxButton;
    procedure lblCloseClick(Sender: TObject);
    procedure strgGridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure btnCancelClick(Sender: TObject);
    procedure lblAddClick(Sender: TObject);
    procedure lblEditClick(Sender: TObject);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure lblDeleteClick(Sender: TObject);
    procedure edtDisc1Change(Sender: TObject);
    procedure edtDisc3Change(Sender: TObject);
    procedure edtPurchPriceChange(Sender: TObject);
    procedure edtSupCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSupCodeChange(Sender: TObject);
    procedure edtPPrceDiscChange(Sender: TObject);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure edtSupCodeExit(Sender: TObject);
    procedure edtDisc2Change(Sender: TObject);
    procedure cbpUOMPurchKeyPress(Sender: TObject; var Key: Char);
    procedure lblViewClick(Sender: TObject);
    procedure chSaveEditedSellPriceClick(Sender: TObject);
    procedure edtMarkupChange(Sender: TObject);
    procedure jvcuredtSellPriceChange(Sender: TObject);
    procedure cbbUOMSellExit(Sender: TObject);
    procedure fedtDiscPercentChange(Sender: TObject);
    procedure edtPurchPriceKeyPress(Sender: TObject; var Key: Char);
    procedure edtMarkupKeyPress(Sender: TObject; var Key: Char);
    procedure jvcuredtSellPriceKeyPress(Sender: TObject; var Key: Char);
    procedure actViewExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure edtDisc1KeyPress(Sender: TObject; var Key: Char);
    procedure edtDisc2KeyPress(Sender: TObject; var Key: Char);
    procedure edtDisc3KeyPress(Sender: TObject; var Key: Char);
    procedure fedtDiscPercentKeyPress(Sender: TObject; var Key: Char);
    procedure btnSaveClick(Sender: TObject);
  private
//    FBHJ : TBarangHargaJual;
    FisIptPurchase: Boolean;
    FisKeyPress: Boolean;
    isBookMerchan : Boolean;
    FProductCode: string;
    //modeSaveProductSup: TSaveProductSup;
//    SearchSupplier: TSearchSupplier;
//    FNewBarangSuplier : TBarangSupplier;
//    FNewSupplier : TNewSupplier;
//    FNewSupllierMerGroup : TNewSupplierMerGroup;
    procedure AddProductSupplier;
    function showHargaJual:Boolean;
    procedure ParseHeaderGrid;
    procedure ParseDataGrid();
    procedure SetProductCode(const Value: string);
    procedure getData4Combo();
    procedure clearDialog();
    procedure DeleteProductSupplier;
    procedure EditProductSupplier;
    procedure IptKeyPressOnHide;
    procedure SetAttributDefault;
    procedure SetAttributEnable(aValue: Boolean);
    procedure SetAttributReadOnly(aValue: Boolean);
    function SaveBHJ: Boolean;
    procedure ViewProductSupplier;
  public
    FSelFIsStore: Integer;
    FTpApp      : TTipeApp;
    FSelfUnitId: Integer;
    SUPMG_SUB_CODE: string;
    procedure LoadDataUOM(aKodeBrg : String; aUnitID : Integer);
    procedure ShowProductSupplier(AProductCode: String);
  published
    property ProductCode: string read FProductCode write SetProductCode;
  end;

var
  fraProductSupplier: TfraProductSupplier;
   IDLokal, GetIdProduk : Integer;
   aKodeLama : string;
implementation

uses ufrmSearchSupplier, ufrmProduct,
  uTSCommonDlg, uConstanta, Math, ufraSellingPrice;

{$R *.dfm}

function TfraProductSupplier.showHargaJual:boolean;
begin
  {if FBHJ=nil then
    FBHJ := TBarangHargaJual.Create(self);

  FBHJ.ClearProperties;
  if FBHJ.LoadByBarangKode(frmProduct.cbpProductCode.Text) then
  begin
    cSetItemAtComboObjectCode(cbbUOMSell, FBHJ.NewUOM.UOM);
    cSetItemAtComboObject(cbbPriceType, FBHJ.TipeHargaID);
    fedtQty.Value                 := FBHJ.KonversiValue;
    jvcuredtSellPrice.Value       := FBHJ.SellPrice;
    fedtDiscPercent.Value         := FBHJ.DiscPersen;
  end
  else
  begin
    FBHJ.ID := 0;
    fedtQty.Value                 := 1;
    jvcuredtSellPrice.Value       := 0;
    fedtDiscPercent.Value         := 0;
  end;
  }
  Result := false; //selling price bs di edit tanpa pengecualian
end;

procedure TfraProductSupplier.lblCloseClick(Sender: TObject);
begin
  fraProductSupplier.Parent := nil;
  if (assigned(fraSellingPrice)) and (fraSellingPrice.Parent <> nil) then
  begin
    frmProduct.actSellingPriceExecute(nil);
  end
  else
    frmProduct.SetActiveFooter5Button(True);
end;

procedure TfraProductSupplier.ParseDataGrid;
var intI: Integer;
  sSQL: string;
    tempBool: Boolean;
begin
  //if not Assigned(ProductSupplier) then ProductSupplier := TProductSupplier.Create;
  //dataProductSuplier := ProductSupplier.GetListDataProductSupplier(FSelfUnitId,frmProduct.cbpProductCode.Text);

  ParseHeaderGrid;

  sSQL := 'select bs.brgsup_id, smg.supmg_sub_code, s.sup_code, s.sup_name, bs.brgsup_mark_up,bs.brgsup_expire_time,'
         + ' bs.brgsup_delivery_time, b.brg_code, b.brg_name,      b.brg_catalog,      bs.brgsup_stock_in_order,'
         + '       bs.brgsup_sat_code_buy,      sat.sat_name,      bs.brgsup_min_order,      bs.brgsup_max_order,'
         + '       smg.supmg_top,      bs.brgsup_disc1,      bs.brgsup_disc2,      bs.brgsup_disc3,      bs.brgsup_buy_price-bs.brgsup_buy_price_disc,'
         + '       bs.brgsup_buy_price,      bs.brgsup_buy_price_disc,      bs.brgsup_is_bkp,      bs.brgsup_is_primary,      bs.brgsup_is_enable_cn,'
         + '       smg.supmg_is_bkp,      bs.brgsup_is_active, mg.merchangrup_name, mg.merchangrup_code  '
         + ' from barang_suplier bs '
         + ' left join suplier_merchan_grup smg on bs.brgsup_supmg_sub_code = smg.supmg_sub_code'
         + ' left join suplier s on smg.supmg_code=s.sup_code '
         + ' left join barang b on bs.brgsup_brg_code=b.brg_code'
         + ' left join ref$satuan sat on bs.brgsup_sat_code_buy=sat.sat_code '
         + ' left join ref$MERCHANDISE_GRUP mg on smg.SUPMG_MERCHANGRUP_ID = mg.MERCHANGRUP_ID'
         + ' where bs.brgsup_brg_code = ' + QuotedStr(frmProduct.cbpProductCode.Text)
         + ' ';
   {
  with cOpenQuery(sSQL) do
  begin
    intI := 1;
    while not Eof do
    begin
      with strgGrid do
      begin
        AddCheckBox(0,intI,False,false);
        Cells[1,intI] := FieldByName('SUP_CODE').AsString;
        Cells[2,intI] := FieldByName('SUPMG_TOP').AsString;

        if FieldByName('BRGSUP_IS_BKP').AsInteger = 1 then
          Cells[3,intI] := 'BKP'
        else Cells[3,intI] := 'BTKP';

        Cells[4,intI] := CurrToStr(FieldByName('BRGSUP_BUY_PRICE').AsCurrency);
        Cells[5,intI] := FloatToStr(FieldByName('BRGSUP_DISC1').AsFloat);
        Cells[6,intI] := FloatToStr(FieldByName('BRGSUP_DISC2').AsFloat);
        Cells[7,intI] := FloatToStr(FieldByName('BRGSUP_DISC3').AsFloat);
        Cells[8,intI] := CurrToStr(FieldByName('BRGSUP_BUY_PRICE_DISC').AsCurrency);
        Cells[9,intI] := FieldByName('brgsup_sat_code_buy').AsString;

        if FieldByName('BRGSUP_IS_BKP').AsInteger <> FieldByName('SUPMG_IS_BKP').AsInteger
        then Cells[10,intI] := 'BKP/BTKP different from Sup Merchan Grup'
        else Cells[10,intI] := 'BKP/BTKP same with Sup Merchan Grup';

        Cells[11,intI] := FieldByName('merchangrup_code').AsString;
        Cells[12,intI] := FieldByName('merchangrup_name').AsString;

        Cells[13,intI] := FieldByName('BRGSUP_DELIVERY_TIME').AsString;
        Cells[14,intI] := FieldByName('BRGSUP_SAT_CODE_BUY').AsString;
        Cells[15,intI] := FieldByName('SAT_NAME').AsString;
        Cells[16,intI] := FieldByName('BRGSUP_IS_ENABLE_CN').AsString;
        Cells[17,intI] := FieldByName('BRGSUP_IS_PRIMARY').AsString;
        Cells[18,intI] := FloatToStr(FieldByName('BRGSUP_STOCK_IN_ORDER').AsFloat);
        Cells[19,intI] := FloatToStr(FieldByName('BRGSUP_MIN_ORDER').AsFloat);
        Cells[20,intI] := FloatToStr(FieldByName('BRGSUP_MAX_ORDER').AsFloat);
        Cells[21,intI] := FieldByName('BRGSUP_ID').AsString;
        Cells[22,intI] := FieldByName('BRGSUP_IS_ACTIVE').AsString;
        Cells[23,intI] := FloatToStr(FieldByName('brgsup_mark_up').AsFloat);
        Cells[24,intI] := FieldByName('SUPMG_SUB_CODE').AsString;
        Cells[25,intI] := FieldByName('BRGSUP_ID').AsString;

        Inc(intI);
        Next;
        if not EOF then
          strgGrid.AddRow;
      end;
    end; 
  end;

  strgGrid.SetFocus;
  strgGrid.AutoSize := true;
  strgGrid.FixedRows := 1;
  edtSupNameUP.Text := '';
  strgGridRowChanging(Self,1,1,tempBool);
  }
end;

procedure TfraProductSupplier.ParseHeaderGrid;
begin
  {cclearStringGrid(strgGrid, False);
  with strgGrid do
  begin
    ColCount := 13;
    Cells[0,0] := '  ';
    Cells[1,0] := 'SUP. CODE';
    Cells[2,0] := 'TOP';
    Cells[3,0] := 'BKP/BTKP';
    Cells[4,0] := 'PURCHASE PRICE';
    Cells[5,0] := 'DISC1 (%)';
    Cells[6,0] := 'DISC2 (%)';
    Cells[7,0] := 'DISC3 (Rp.)';
    Cells[8,0] := 'PURCHASE PRICE DISC';
    Cells[9,0] := 'UOM';
    Cells[10,0] := 'KETERANGAN';
    Cells[11,0] := 'KODE MERCHAN. GRUP';
    Cells[12,0] := 'NAMA MERCHAN. GRUP';

     FixedRows := 1;
    AutoSize := true;
  end;  }
end;

procedure TfraProductSupplier.SetProductCode(const Value: string);
begin
  FProductCode := Value;
end;

procedure TfraProductSupplier.ShowProductSupplier(AProductCode: String);
begin
  pnlAddEdit.Visible := false;
  ParseDataGrid();

//  if FSelfIsStore = 1 then
  if FTpApp = TSTORE then
    pnlAddEdit.Enabled := False
  else
    pnlAddEdit.Enabled := True;

  lblAdd.Enabled := pnlAddEdit.Enabled;
  lblEdit.Enabled := pnlAddEdit.Enabled;
  lblDelete.Enabled := pnlAddEdit.Enabled;    
  FisIptPurchase := True;
end;

procedure TfraProductSupplier.strgGridCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  if (ACol = 0) then
    CanEdit := true
  else
    CanEdit := false;
end;

procedure TfraProductSupplier.btnCancelClick(Sender: TObject);
begin
  IptKeyPressOnHide;
  pnlAddEdit.Visible := false;
end;

procedure TfraProductSupplier.lblAddClick(Sender: TObject);

begin
  actAddExecute(nil);
end;

procedure TfraProductSupplier.lblEditClick(Sender: TObject);
begin
  actEditExecute(nil);


end;

procedure TfraProductSupplier.strgGridRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
//  edtSupNameUP.Text := strgGrid.Cells[10,NewRow];
end;

procedure TfraProductSupplier.lblDeleteClick(Sender: TObject);

begin
  actDeleteExecute(nil);

end;


procedure TfraProductSupplier.getData4Combo();
var arrParam: TArr;
    sSQL : string;
begin
  if FSelfUnitId = 0 then arrParam := nil
  else
  begin
    SetLength(arrParam,2);
    arrParam[0].tipe := ptString;
    arrParam[0].data := FProductCode;
    arrParam[1].tipe := ptInteger;
    arrParam[1].data := FSelfUnitId;
  end;
//  if not Assigned(Satuan) then Satuan := TSatuan.Create;
  LoadDataUOM(FProductCode, FSelfUnitId);

  sSQL := ' select TPHRG_ID, TPHRG_NAME '
           + ' from ref$tipe_HArga '
           + ' where TPHRG_UNT_ID = ' + IntToStr(FSelfUnitId);
//  cQueryToComboObject(cbbPriceType, sSQL);

  cbbPriceType.ItemIndex := cbbPriceType.Items.IndexOf('TOKO');

end;

procedure TfraProductSupplier.clearDialog();
begin
  edtSupCode.Clear;
  edtSupNameBwh.Clear;
  intedtTOP.Clear;
  edtPurchPrice.Value := 0;
  edtDisc1.Value := 0;
  edtDisc2.Value := 0;
  edtDisc3.Value := 0;
  edtPPrceDisc.Value := 0;
  intedtExpTime.Value := 0;
  intedtDelvrTime.Value := 0;
  //cbpUOMPurch.Clear;
  //edtUOMName.Clear;
  chkEnableCN.Checked := False;
  chkIsSupPrim.Checked := False;
  intedtStockIn.Value := 0;
  intedtMinOrd.Value := 0;
  intedtMaxOrd.Value := 0;
  edtSupCodeExit(Self);
  cbbIsBKP.Color := clWindow;
  lblKetBKP.Visible := False;
end;

procedure TfraProductSupplier.edtDisc1Change(Sender: TObject);
var tempPrice: Real;
begin
  if FisKeyPress then
  begin
    tempPrice := ((100 - edtDisc1.Value)/100) * edtPurchPrice.Value;
    edtPPrceDisc.Value := (((100 - edtDisc2.Value)/100) * tempPrice) - edtDisc3.Value;
  end;
end;

procedure TfraProductSupplier.edtDisc3Change(Sender: TObject);
var tempPrice: Real;
begin
  if FisKeyPress then
  begin
    tempPrice := ((100 - edtDisc1.Value)/100) * edtPurchPrice.Value;
    edtPPrceDisc.Value := (((100 - edtDisc2.Value)/100) * tempPrice) - edtDisc3.Value;
  end;
end;

procedure TfraProductSupplier.edtPurchPriceChange(Sender: TObject);
//var tempPrice: Real;
begin
//  tempPrice := ((100 - edtDisc1.Value)/100) * edtPurchPrice.Value;
//  edtPPrceDisc.Value := (((100 - edtDisc2.Value)/100) * tempPrice) - edtDisc3.Value;
  if FisKeyPress then
  begin
    try
      edtMarkup.Value := RoundTo(((jvcuredtSellPrice.Value-edtPurchPrice.Value)/jvcuredtSellPrice.Value)*100, -2)
    except
      edtMarkup.Value := 0;
    end;

    edtDisc1Change(nil);
  end;

end;

procedure TfraProductSupplier.edtSupCodeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  i: Integer;

begin
  if (Key = VK_F5) then
  begin
   if not assigned(frmDialogSearchSupplier) then
      frmDialogSearchSupplier := TfrmDialogSearchSupplier.Create(Application);

    frmDialogSearchSupplier.DialogUnit      := FSelfUnitId;
    frmDialogSearchSupplier.FMasterIsStore  := FSelfIsStore;
    frmDialogSearchSupplier.searchFor := sfProductSup;
//    frmDialogSearchSupplier.GroupCode := frmProduct.edtGroupCode.Text;
//    frmDialogSearchSupplier.MerchandiseCode := frmProduct.edtMerchandCode.Text;
    frmDialogSearchSupplier.ShowModal;

    if frmDialogSearchSupplier.IsProcessSuccessfull then
    begin
//      for i := strgGrid.FixedRows to strgGrid.RowCount - 1 do
      begin
//        if  LowerCase(Trim(frmDialogSearchSupplier.SupplierCode)) = LowerCase(Trim(strgGrid.Cells[1,i])) then
        begin
          CommonDlg.ShowError('Suplier sudah terdaftar');
          exit;
        end;  
      end;

      edtSupCode.Text := frmDialogSearchSupplier.SupplierCode;
      edtSupNameBwh.Text := frmDialogSearchSupplier.SupplierName;
//      intedtTOP.Value := StrToInt(frmDialogSearchSupplier.strgGrid.Cells[2,frmDialogSearchSupplier.strgGrid.Row]);
//      SUPMG_SUB_CODE := frmDialogSearchSupplier.strgGrid.Cells[3,frmDialogSearchSupplier.strgGrid.Row];
    end;

  end;
end;

procedure TfraProductSupplier.edtSupCodeChange(Sender: TObject);
var dataSearchSup: TDataSet;
begin
  {if not Assigned(SearchSupplier) then SearchSupplier := TSearchSupplier.Create;

  dataSearchSup := SearchSupplier.SearchSupplierCode(frmProduct.edtGroupCode.Text,edtSupCode.Text);

  if dataSearchSup.RecordCount > 0 then
  begin
    edtSupNameBwh.Text  := dataSearchSup.FieldByName('SUP_NAME').AsString;
    intedtTOP.Value     := dataSearchSup.FieldByName('TOP').AsInteger;
    SUPMG_SUB_CODE      := dataSearchSup.FieldByName('SUB_CODE').AsString;

    if dataSearchSup.FieldByName('ENABLE_CN').AsInteger = 1 then
      chkEnableCN.Checked := True
    else
      chkEnableCN.Checked := False;

    edtDisc1.Value  := dataSearchSup.FieldByName('DISC').AsFloat;

  end
  else
  begin
    edtSupNameBwh.Text  := '';
    intedtTOP.Value     := 0;
    edtDisc1.Value      := 0;
    chkEnableCN.Checked := False;
    SUPMG_SUB_CODE      := '';
  end    }
end;

procedure TfraProductSupplier.edtPPrceDiscChange(Sender: TObject);
begin
{
  if edtSellingPrice.value <> 0 then
    edtMarkup.Value := RoundTo(((edtSellingPrice.Value-edtPPrceDisc.Value)/edtSellingPrice.Value)*100,-2)
  else
    edtMarkup.Value := 0;
}
end;

procedure TfraProductSupplier.strgGridGetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  FloatFormat := '%.2n';
  if ACol in [4,7,8] then
    IsFloat := True
  else
    IsFloat := False;
end;

procedure TfraProductSupplier.edtSupCodeExit(Sender: TObject);
begin
//  if IsBKPAndPKP(ProductCode, edtSupCode.Text, FSelfUnitId) then
//    cbbIsBKP.ItemIndex := 0
//  else
//    cbbIsBKP.ItemIndex := 1;
end;

procedure TfraProductSupplier.edtDisc2Change(Sender: TObject);
var tempPrice : real;
begin
  if FisKeyPress then
  begin
    tempPrice := ((100 - edtDisc1.Value)/100) * edtPurchPrice.Value;
    edtPPrceDisc.Value := (((100 - edtDisc2.Value)/100) * tempPrice) - edtDisc3.Value;
  end;
end;

procedure TfraProductSupplier.cbpUOMPurchKeyPress(Sender: TObject;
  var Key: Char);
begin
 Key := UpCase(Key);
end;

procedure TfraProductSupplier.LoadDataUOM(aKodeBrg : String; aUnitID : Integer);
var
  sSQL: string;
begin
  sSQL :=
    'SELECT distinct KS.KONVSAT_SAT_CODE_from, KS.KONVSAT_SAT_CODE_FROM ' +
    'FROM REF$KONVERSI_SATUAN KS ' +
    'INNER JOIN REF$SATUAN S1 ON (S1.SAT_CODE = KS.KONVSAT_SAT_CODE_FROM) ' +
    'INNER JOIN BARANG BRG ON (BRG.BRG_CODE=KS.KONVSAT_BRG_CODE)' +
    'WHERE (KS.KONVSAT_BRG_CODE=' + QuotedStr(aKodeBrg) + ' )';

//  cQueryToComboObjectCode(cbbUOM, sSQL);
//  cQueryToComboObjectCode(cbbUOMSell, sSQL);
end;

procedure TfraProductSupplier.lblViewClick(Sender: TObject);
begin
  actViewExecute(nil);
end;

procedure TfraProductSupplier.SetAttributDefault;
begin
  edtSupNameBwh.ReadOnly    := True;
  intedtTOP.Properties.ReadOnly        := True;
  intedtStockIn.Properties.ReadOnly    := True;
  edtSellingPrice.Properties.ReadOnly  := True;
end;

procedure TfraProductSupplier.SetAttributEnable(aValue: Boolean);
begin
//  with TNewBarang.Create(Self) do
//  begin
//    try
//      try
//        if LoadByKode(frmProduct.cbpProductCode.Text) then
//          isBookMerchan := StrToInt(Trim(getGlobalVar('BOOKS_MERCHANDISE_ID')))=NewMerchadize.ID
//        else
//          isBookMerchan := false;
//      except
//        isBookMerchan := false;
//      end;
//    finally
//      Free;
//    end;
//  end;
  
  cbbUOM.Enabled            := aValue;
  cbbIsBKP.Enabled          := aValue;
  btnSave.Enabled           := aValue;
  btnCancel.Enabled         := aValue;

  if showHargaJual then
  begin
    chSaveEditedSellPrice.Checked := False;
  end
  else
  begin
    chSaveEditedSellPrice.Checked := True;
    chSaveEditedSellPrice.Enabled := False;
  end;
end;

procedure TfraProductSupplier.SetAttributReadOnly(aValue: Boolean);
begin
  edtSupCode.ReadOnly                  := aValue;
  intedtExpTime.Properties.ReadOnly    := True;
  intedtDelvrTime.Properties.ReadOnly  := True;
  intedtMinOrd.Properties.ReadOnly     := aValue;
  intedtMaxOrd.Properties.ReadOnly     := aValue;
  edtDisc1.Properties.ReadOnly         := aValue;
  edtDisc2.Properties.ReadOnly         := aValue;
  edtDisc3.Properties.ReadOnly         := aValue;


//  with TNewBarang.Create(Self) do
//  begin
//    try
//      if LoadByKode(frmProduct.cbpProductCode.Text) then
//        isBookMerchan := StrToInt(Trim(getGlobalVar('BOOKS_MERCHANDISE_ID')))=NewMerchadize.ID
//      else
//        isBookMerchan := false;
//    finally
//      Free;
//    end;
//  end;

  edtPurchPrice.Properties.ReadOnly := false;
  edtMarkup.Properties.ReadOnly := false;

  if showHargaJual then
  begin
    chSaveEditedSellPrice.Checked := False;
  end
  else
  begin
    chSaveEditedSellPrice.Checked := True;
    chSaveEditedSellPrice.Enabled := False;
  end;

end;

procedure TfraProductSupplier.btnSaveClick(Sender: TObject);
var is_Enable,is_Primary,is_BKP,is_Active: SmallInt;
    KodeS , sSQL : string;
begin
//  FNewBarangSuplier := TBarangSupplier.Create(Self);
//  FNewSupplier := TNewSupplier.Create(Self);
//  FNewSupllierMerGroup := TNewSupplierMerGroup.Create(Self);

  // save here..
  if edtSupCode.Text = '' then
  begin
    CommonDlg.ShowErrorEmpty(' Supplier Code ');
    edtSupCode.SetFocus;
    ParseDataGrid;
    Exit;
  end;

  if cbbUOM.Text = '' then
  begin
    CommonDlg.ShowErrorEmpty('UOM');
    cbbUOM.SetFocus;
    Exit;
  end;

  if intedtMinOrd.Value > intedtMaxOrd.Value then
  begin
    CommonDlg.ShowMessage('Minimal Order tidak boleh > Maximal Order');
    intedtMinOrd.SetFocus;
    Exit;
  end;

    //initiate
  is_Enable := 0;
  is_Primary := 0;
  is_BKP := 0;
  is_Active := 0;

  if cbbIsBKP.Text = 'BKP' THEN is_BKP := 1;
  if chkEnableCN.Checked then is_Enable := 1;
  if chkIsSupPrim.Checked then is_Primary := 1;
  if chkIsActive.Checked then is_Active := 1;


 sSQL := 'select a.supmg_sub_code'
         + ' from suplier_merchan_grup a, ref$MERCHANDISE_GRUP b'
         + ' where a.SUPMG_MERCHANGRUP_ID = b.MERCHANGRUP_ID'
         + ' and a.supmg_code = ' + QuotedStr(edtSupCode.Text)
         + ' and b.merchangrup_code = ' + QuotedStr(frmProduct.edtGroupCode.Text);

//  with cOpenQuery(sSQL) do
//  begin
//    try
//      KodeS := '';
//      while not Eof do
//      begin
//        KodeS := FieldByName('supmg_sub_code').AsString;
//
//        Next;
//      end;
//    finally
//      Free;
//    end;
//  end;

  if KodeS = '' then
  begin
    CommonDlg.ShowError('Data MerChandhize Grup Code Belum Ada' + Char(13) + ' Data Gagal Disimpan');
    Exit;
  end;

//  if FNewBarangSuplier.isKodeExits(frmProduct.cbpProductCode.Text, KodeS, IDLokal) then
  begin
    CommonDlg.ShowError('Data  ' + KodeS + ' Sudah Ada');
    Exit;
  end;
  {
  FNewBarangSuplier.UpdateData(
                                intedtDelvrTime.Value,
                                edtDisc1.Value,
                                edtDisc2.Value,
                                edtDisc3.Value,
                                intedtExpTime.Value,
                                FNewBarangSuplier.Fee,
                                edtPurchPrice.Value,
                                edtPPrceDisc.Value,
                                edtSellingPrice.Value,
                                IDLokal,
                                is_Active,
                                is_BKP,
                                is_Enable,
                                is_Primary,
                                frmProduct.cbpProductCode.Text,
                                cbbUOM.Text,
                                edtMarkup.Value,
                                intedtMaxOrd.Value,
                                intedtMinOrd.Value,
                                edtSupCode.Text,
                                KodeS,
                                intedtStockIn.Value
                                 );
  }
//------------------------------- harga jual

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

  cbbUOMSellExit(nil);

  if not SaveBHJ then
  begin
    Exit;
  end;

//------------------------------- end harga jual

  {if FNewBarangSuplier.ExecuteGenerateSQLByFilterUnit then
  begin
     cCommitTrans;
     CommonDlg.ShowMessage('Data Berhasil Disimpan');
     ParseDataGrid();
     IptKeyPressOnHide;
     pnlAddEdit.Visible := false;
     Exit;
  end
  else
  begin
     cRollbackTrans;
     CommonDlg.ShowMessage('Data Gagal Disimpan');
  end;
    }
end;

procedure TfraProductSupplier.chSaveEditedSellPriceClick(Sender: TObject);
begin
  cbbPriceType.Enabled := chSaveEditedSellPrice.Checked;
  cbbUOMSell.Enabled := chSaveEditedSellPrice.Checked;
  jvcuredtSellPrice.Properties.ReadOnly := not chSaveEditedSellPrice.Checked;
  fedtDiscPercent.Properties.ReadOnly := not chSaveEditedSellPrice.Checked;
end;

procedure TfraProductSupplier.edtMarkupChange(Sender: TObject);
begin
  if FisKeyPress then
  begin
    if not FisIptPurchase then
    try
      edtPurchPrice.Value := RoundTo(jvcuredtSellPrice.Value - ((edtMarkup.Value/100)* jvcuredtSellPrice.Value ),-2);
    except
      edtPurchPrice.Value := 0;
    end;
  end;

end;

procedure TfraProductSupplier.jvcuredtSellPriceChange(Sender: TObject);
begin
  if FisKeyPress then
  begin
    try
      edtPurchPrice.Value := RoundTo((jvcuredtSellPrice.Value*((100-edtMarkup.Value)/100)),-2);
    except
      edtPurchPrice.Value := 0;
    end;

    edSell.Value := jvcuredtSellPrice.Value - (jvcuredtSellPrice.Value * fedtDiscPercent.Value / 100);
  end;

end;

procedure TfraProductSupplier.cbbUOMSellExit(Sender: TObject);
var
  sSQL: string;
begin
  {
  sSQL := 'select distinct konvsat_scale '
          + ' from ref$Konversi_satuan '
          + ' where konvsat_sat_code_from = ' + Quot(cGetIDfromComboCode(cbbUOMSell))
          + ' and konvsat_brg_code = ' + Quot(frmProduct.cbpProductCode.Text);
  with cOpenQuery(sSQL) do
  begin
    try
      if not FieldByName('konvsat_scale').IsNull then
        fedtQty.Value:= StrToFloat(FieldByName('konvsat_scale').AsString)
      else
        fedtQty.Value := 0;
    finally
      Free
    end;
  end; }
end;

function TfraProductSupplier.SaveBHJ: Boolean;
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

//  aID := FBHJ.ID;

  aAlokasiDanaSupplierID      := 0; // he he he ...........
  aDiscNominal                := (jvcuredtSellPrice.Value * fedtDiscPercent.Value / 100);
  aDiscPersen                 := fedtDiscPercent.Value;

  aIsLimitQty                 := 0;
  aIsQtySubsidy               := 0;
  aKonversiValue              := fedtQty.Value;
  aLimitQty                   := 0;
  aLimitQtyPrice              := 0;
  aMarkUp                     := edtMarkup.Value;
  aNewBarangKode              := frmProduct.cbpProductCode.Text;
  aNewUnit_ID                 := FSelfUnitId;
//  aUOM                        := cGetIDfromComboCode(cbbUOMSell);
  aQtySubsidy                 := 0;
  aQtySubsidyPrice            := 0;
  aRemark                     := 'Create with Purchase Form';
  aSellPrice                  := jvcuredtSellPrice.Value ;
  aSellPriceCoret             := 0;
  aSellPriceDisc              := edSell.Value;
//  aTipeHargaID                := cGetIDfromCombo(cbbPriceType) ;

  if (aSellPrice < 0) or (aSellPriceDisc < 0) or (aSellPriceCoret < 0) then
  begin
    CommonDlg.ShowMessage('Tidak boleh ada nilai minus');
    Exit;
  end;

  iIsMailer := 1;
  {
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
  10000); // max qty disc

    try
      if FBHJ.ExecuteGenerateSQLByUnit then
      begin
        Result := True;
      end
      else begin
        cRollbackTrans;
        CommonDlg.ShowMessage('Gagal Menyimpan Data');
      end;
    finally
    end;
    }
end;

procedure TfraProductSupplier.fedtDiscPercentChange(Sender: TObject);
begin
    edSell.Value := jvcuredtSellPrice.Value-(jvcuredtSellPrice.Value * fedtDiscPercent.Value / 100);
end;

procedure TfraProductSupplier.edtPurchPriceKeyPress(Sender: TObject;
  var Key: Char);
begin
  FisIptPurchase := True;
  FisKeyPress    := True;
end;

procedure TfraProductSupplier.edtMarkupKeyPress(Sender: TObject;
  var Key: Char);
begin
  FisIptPurchase  := False;
  FisKeyPress     := True;
end;

procedure TfraProductSupplier.jvcuredtSellPriceKeyPress(Sender: TObject;
  var Key: Char);
begin
  FisKeyPress     := True;
end;

procedure TfraProductSupplier.actViewExecute(Sender: TObject);
begin
  ViewProductSupplier;
end;

procedure TfraProductSupplier.actAddExecute(Sender: TObject);
begin
  AddProductSupplier;
end;

procedure TfraProductSupplier.actEditExecute(Sender: TObject);
begin
  EditProductSupplier;
end;

procedure TfraProductSupplier.AddProductSupplier;
begin
  //  lblEditClick(self);
    IptKeyPressOnHide;
    if FSelfUnitId = 0 then
    begin
      CommonDlg.ShowError('UNIT BELUM DIPILIH');
      fraProductSupplier.Parent := nil; // close
      //frmMain.cbbUnit.SetFocus;
    end
    else
    begin
      aKodeLama := '';
      IDLokal := 0;
      pnlAddEdit.Visible := true;
      chkEnableCN.Checked := False;
      chkIsSupPrim.Checked := False;
      clearDialog();
      getData4Combo();
      edtSupCode.SetFocus;
    end;
    SetAttributEnable(True);
    SetAttributReadOnly(False);
end;

procedure TfraProductSupplier.DeleteProductSupplier;
var
  IsBerhasilHapus: Boolean;
  chkStatue: Boolean;
  intI: Integer;
begin
    IsBerhasilHapus := False;
    if (CommonDlg.Confirm('Anda yakin akan menghapus data ?') = mrNo)  then
      Exit;
    {
    FNewBarangSuplier := TBarangSupplier.Create(Self);
    FNewSupplier := TNewSupplier.Create(Self);
    FNewSupllierMerGroup := TNewSupplierMerGroup.Create(Self);
  
    try
      for intI := 1 to strgGrid.RowCount-1 do
      begin
        strgGrid.GetCheckBoxState(0,intI,chkStatue);
  
        if chkStatue then
        begin
          try

            IDLokal := StrToInt(strgGrid.Cells[21,intI]);
            if FNewBarangSuplier.LoadByID(IDLokal) then
            begin
              IsBerhasilHapus := FNewBarangSuplier.RemoveFromDB;
              if not IsBerhasilHapus then
              begin
                cRollbackTrans;
                Exit;
              end;
            end;
  
          except
            on E: Exception do
              CommonDlg.ShowMessage(e.Message);
          end;
        end;
      end;
  
  
      if IsBerhasilHapus then
      begin
        cCommitTrans;
        CommonDlg.ShowMessage('Berhasil Menghapus Data');
      end;
  
      ParseDataGrid();
    finally
      cRollbackTrans;
      FNewBarangSuplier.Free;
      FNewSupplier.Free;
      FNewSupllierMerGroup.Free;
    end; }
end;

procedure TfraProductSupplier.EditProductSupplier;
begin

//    IptKeyPressOnHide;
//    FNewBarangSuplier := TBarangSupplier.Create(Self);
//    FNewSupplier := TNewSupplier.Create(Self);
//    FNewSupllierMerGroup := TNewSupplierMerGroup.Create(Self);

     if FSelfUnitId = 0 then
     begin
      CommonDlg.ShowError('UNIT BELUM DIPILIH');
      fraProductSupplier.Parent := nil; // close
     end
     else
     begin
       try
          {
          getData4Combo();
          IDLokal := StrToInt(strgGrid.Cells[21,strgGrid.Row]);
          if FNewBarangSuplier.LoadByID(IDLokal) then
          begin
            edtSupCode.Text       := FNewBarangSuplier.NewSupplier.Kode;
            edtSupNameBwh.Text    := FNewBarangSuplier.NewSupplier.Nama;
            intedtExpTime.Value   := FNewBarangSuplier.ExpireTime;
            intedtDelvrTime.Value := FNewBarangSuplier.DeliveryTime;
            intedtStockIn.Value   := FNewBarangSuplier.StockInOrder;
            intedtMinOrd.Value    := FNewBarangSuplier.MinOrder;
            intedtMaxOrd.Value    := FNewBarangSuplier.MaxOrder;
            chkIsSupPrim.Checked  := FNewBarangSuplier.IsPrimary=1;
            chkEnableCN.Checked   := FNewBarangSuplier.IsEnableCN=1;
            chkIsActive.Checked   := FNewBarangSuplier.IsActive=1;
            edtPurchPrice.Value   := FNewBarangSuplier.HargaBeli;
            edtPPrceDisc.Value    := FNewBarangSuplier.HargaBeliDisc;
            edtDisc1.Value        := FNewBarangSuplier.Disc1;
            edtDisc2.Value        := FNewBarangSuplier.Disc2;
            edtDisc3.Value        := FNewBarangSuplier.Disc3;
            edtMarkup.Value       := FNewBarangSuplier.MarkUP;
            pnlAddEdit.Visible := true;
  
            cSetItemAtComboObjectCode(cbbUOM, FNewBarangSuplier.KodeSatuanBeli);
            if FNewBarangSuplier.IsBKP = 1 then
              cbbIsBKP.ItemIndex := 0
            else
              cbbIsBKP.ItemIndex := 1;
  
          end

          else
           begin
              IDLokal := 0;
              CommonDlg.ShowError('Data Tidak ditemukan');
           end;
           }
       except
            on E: Exception do
            CommonDlg.ShowMessage(e.Message);
       end;
     end;
  
    SetAttributEnable(True);
    SetAttributReadOnly(False);
  
    edtPurchPriceChange(Self);
    jvcuredtSellPriceChange(Self);
end;

procedure TfraProductSupplier.ViewProductSupplier;
begin
  IptKeyPressOnHide;
  lblEditClick(self);
  SetAttributDefault;
  SetAttributEnable(False);
  SetAttributReadOnly(True);
end;

procedure TfraProductSupplier.actDeleteExecute(Sender: TObject);
begin
  DeleteProductSupplier;
end;

procedure TfraProductSupplier.IptKeyPressOnHide;
begin
  FisIptPurchase  := False;
  FisKeyPress     := False;
  edtMarkup.Clear;   
end;

procedure TfraProductSupplier.edtDisc1KeyPress(Sender: TObject;
  var Key: Char);
begin
  FisIptPurchase := True;
  FisKeyPress    := True;
end;

procedure TfraProductSupplier.edtDisc2KeyPress(Sender: TObject;
  var Key: Char);
begin
  FisIptPurchase := True;
  FisKeyPress    := True;
end;

procedure TfraProductSupplier.edtDisc3KeyPress(Sender: TObject;
  var Key: Char);
begin
  FisIptPurchase := True;
  FisKeyPress    := True;
end;

procedure TfraProductSupplier.fedtDiscPercentKeyPress(Sender: TObject;
  var Key: Char);
begin
  FisKeyPress     := True;
end;

end.
