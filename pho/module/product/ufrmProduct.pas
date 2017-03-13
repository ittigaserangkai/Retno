unit ufrmProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls,
  Mask, ActnList, DateUtils, Buttons, Math, System.Actions,
  cxStyles, cxClasses,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxLabel, cxCheckBox, cxTextEdit, cxCurrencyEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, cxButtonEdit, cxButtons,
  cxMaskEdit, cxDropDownEdit, cxCalendar, dxNavBarCollns, dxNavBarBase, dxNavBar,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox;

type
  TfrmProduct = class(TfrmMaster)
    pnl1: TPanel;
    lblCompanyCode: TLabel;
    lbl2: TLabel;
    edtProductName: TEdit;
    lbl3: TLabel;
    edtShortName: TEdit;
    lbl4: TLabel;
    edtBrandName: TEdit;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    edtStock: TEdit;
    edtProducttype: TEdit;
    edtActive: TEdit;
    lbl8: TLabel;
    lbl9: TLabel;
    edtUOMStockCode: TEdit;
    edtUOMPurchaseCode: TEdit;
    edtUOMStockName: TEdit;
    edtUOMPurchaseName: TEdit;
    lbl10: TLabel;
    edtOutlet: TEdit;
    lbl17: TLabel;
    fedtMaxQtyOrder: TcxCurrencyEdit;
    edtMaxQtyOrderUOM: TEdit;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    fedtStockOnOrder: TcxCurrencyEdit;
    edtStockOnOrderUOM: TEdit;
    fedtAverageSls: TcxCurrencyEdit;
    edtAverageSlsUOM: TEdit;
    edtSalesTaxCode: TEdit;
    lbl21: TcxLabel;
    lbl22: TcxLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    lbl27: TLabel;
    edtCatalog: TEdit;
    edtGroupCode: TEdit;
    edtGroupName: TEdit;
    edtSubGroupCode: TEdit;
    edtSubGroupName: TEdit;
    edtCategoryName: TEdit;
    edtCategoryCode: TEdit;
    edtMerchandName: TEdit;
    edtMerchandCode: TEdit;
    fedtCurrentStock: TcxCurrencyEdit;
    edtCurrentStockUOM: TEdit;
    lbl28: TLabel;
    lbl29: TLabel;
    edtPrimarySupplierCode: TEdit;
    edtPrimarySupplierName: TEdit;
    lbl30: TcxLabel;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl33: TLabel;
    lbl34: TLabel;
    intedtExpiredTime: TcxCurrencyEdit;
    intedtDeliveryTime: TcxCurrencyEdit;
    cbEnabledCN: TcxCheckBox;
    jvcuredtPurchasingPrice: TcxCurrencyEdit;
    edtPurchasingPriceUOM: TEdit;
    lbl36: TLabel;
    lbl37: TLabel;
    lbl38: TLabel;
    lbl39: TLabel;
    jvcuredtSellingPrice: TcxCurrencyEdit;
    edtSellingPriceUOM: TEdit;
    lbl40: TLabel;
    edtLastCOGSUOM: TEdit;
    lbl41: TLabel;
    jvcuredtLastCOGS: TcxCurrencyEdit;
    fedtMargin: TcxCurrencyEdit;
    lbl42: TLabel;
    cbEnableDec: TcxCheckBox;
    lbl43: TcxLabel;
    lbl44: TcxLabel;
    lbl45: TLabel;
    jvcuredtDepositValue: TcxCurrencyEdit;
    edtUser: TEdit;
    lbl46: TLabel;
    dtTgl: TcxDateEdit;
    lbl50: TcxLabel;
    cbTurunan: TcxCheckBox;
    lbl51: TLabel;
    actlst1: TActionList;
    actAddProduct: TAction;
    actEditProduct: TAction;
    actDeleteProduct: TAction;
    actRefreshProduct: TAction;
    lbl52: TLabel;
    edtLocation: TEdit;
    edtBKP: TEdit;
    Label1: TLabel;
    jvcuredtLastCost: TcxCurrencyEdit;
    lbl1: TLabel;
    lbl53: TLabel;
    actValidateProduct: TAction;
    lbl54: TLabel;
    dt1: TcxDateEdit;
    edt1: TEdit;
    lblValid: TLabel;
    cbIsTaxInclude: TcxCheckBox;
    lbl55: TLabel;
    edtPLUPurchase: TEdit;
    Label2: TLabel;
    cbIsDiskonGMC: TcxCheckBox;
    cbIsDeposit: TcxCheckBox;
    lbl35: TLabel;
    fedtStockQty: TcxCurrencyEdit;
    lbl56: TLabel;
    edtStockUOM: TEdit;
    fedtStockRp: TcxCurrencyEdit;
    edtUOMLastCost: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edSafetyStock: TcxCurrencyEdit;
    edtSSUOM: TEdit;
    lbl11: TLabel;
    edtAuthorId: TEdit;
    edtAuthorNm: TEdit;
    edtPubsNm: TEdit;
    edtPubsID: TEdit;
    lbl12: TLabel;
    chkBasicItem: TcxCheckBox;
    actProductSupplier: TAction;
    actUomConversion: TAction;
    actStockCard: TAction;
    actHistoryPo: TAction;
    actBonusProduct: TAction;
    actAlokasiStock: TAction;
    actSellingPrice: TAction;
    actProductTurunan: TAction;
    lblInvalid: TcxLabel;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    btnValidateProduct: TcxButton;
    cbpProductCode: TcxButtonEdit;
    dxNavBarLeftSide: TdxNavBar;
    dxNavGroupSettingProduct: TdxNavBarGroup;
    dxNavItemUoMConvertion: TdxNavBarItem;
    dxNavItemProductSupplier: TdxNavBarItem;
    dxNavItemStockCard: TdxNavBarItem;
    dxNavItemHistoryPO: TdxNavBarItem;
    dxNavGroupOtherInfo: TdxNavBarGroup;
    dxNavItemOtherInfo: TdxNavBarItem;
    cbpCompCode: TcxExtLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actAddProductExecute(Sender: TObject);
    procedure actEditProductExecute(Sender: TObject);
    procedure actDeleteProductExecute(Sender: TObject);
    procedure actRefreshProductExecute(Sender: TObject);
    procedure cbpProductCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbpProductCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actValidateProductExecute(Sender: TObject);
    procedure cbpProductCodeEnter(Sender: TObject);
    procedure cbpProductCodeExit(Sender: TObject);
    procedure fraFooter5Button1btnCloseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure actProductSupplierExecute(Sender: TObject);
    procedure actStockCardExecute(Sender: TObject);
    procedure actHistoryPoExecute(Sender: TObject);
    procedure actUomConversionExecute(Sender: TObject);
    procedure actBonusProductExecute(Sender: TObject);
    procedure actAlokasiStockExecute(Sender: TObject);
    procedure actSellingPriceExecute(Sender: TObject);
    procedure actProductTurunanExecute(Sender: TObject);
    procedure cbpProductCodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private

    FnewBArang : Integer;
    function ParseProduct(AProductCode: string): Boolean;
    procedure ClearForm;
    procedure ParseCompanyCode();
    procedure ShowFormBonusProduct();
    procedure ShowFormAlokasiStock();
    procedure ShowFormSellingPrice();
    procedure ShowFormUOMConversion();
    procedure ShowFormStockCard();
    procedure ShowFormProductSupplier();
    procedure ShowHistoriPOByProduct;
    procedure ShowFormProductTurunan();
   // procedure ShowFormSearchProduct();
    procedure ClearFrameOpened();
    procedure GetStockUOMRP();
    procedure SetLeftWidthSP;
    procedure SetXYSP;
  public
    procedure SetActiveFooter5Button(AIsActive: boolean);
    procedure SetLabel;
  end;

var
  frmProduct: TfrmProduct;

implementation

uses uTSCommonDlg,uConstanta, ufraBonusProduct, ufraAlokasiStock,
  ufraSellingPrice, ufraUOMConvertion, ufraStockCard, ufraProductSupplier,
  ufraProductTurunan, ufrmDialogProduct,
  uSpecialKey, ufraHistoriPOByProduct, uRetnoUnit,
  udmMain, uAppUtils;

{$R *.dfm}

const aHeightSP : integer = 290;
      aMaxTop   : Integer = 50;

procedure TfrmProduct.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ClearFrameOpened;
//  frmMain.DestroyMenu((sender as TForm));
  Action := caFree;
end;

procedure TfrmProduct.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'PRODUCT MASTER';
//  FnewBArang        := TNewBarang.Create(Self);
end;

procedure TfrmProduct.FormDestroy(Sender: TObject);
begin
  inherited;
  frmProduct := nil;
  FreeAndNil(FnewBArang);
end;

procedure TfrmProduct.GetStockUOMRP;
var
  ssQL      : string;
  dtAwal    : TDateTime;
  dtAkhir   : TDateTime;
begin

//  dtAwal  := StartOfAMonth(YearOf(cGetServerTime), MonthOf(cGetServerTime));
  dtAkhir := EndOfTheMonth(dtAwal);
  sSQL := 'select SUM(RUPIAH), SUM(QTY) from SP_KARTOK(' + TAppUtils.Quot(cbpProductCode.Text)
//                  + ',' + IntToStr(MasterNewUnit.ID) + ',' + TAppUtils.QuotD(dtAwal) + ','
                  + TAppUtils.QuotD(dtAkhir) + ')'
                  + ' where ISBONUSFORBONUS = 0';
  {
  with cOpenQuery(ssQL) do
  begin
    try
      if not eof then
      begin
        fedtStockRp.Value   := Fields[0].AsCurrency;
        fedtStockQty.Value  := Fields[1].AsFloat;
      end
      else
      begin
        fedtStockRp.Value   := 0;
        fedtStockQty.Value  := 0;
      end;  
      edtStockUOM.Text    := edtUOMStockName.Text;
    finally
      Free;
    end;

  end; }
end;


function TfrmProduct.ParseProduct(AProductCode: string): Boolean;
var
  sUOMLastPurchase: string;
  dLastPurchas: Double;
//  data  : TResultDataSet;
//  BT              : TBarangTransaksi;
//  FBarangSupplier : TBarangSupplier;
begin
  Result:= False;
  if Length(cbpProductCode.Text)>igProd_Code_Length then
  begin
    Exit;
  end;

//  if not assigned(Product) then
//    Product := TProduct.Create;
  {
  FBarangSupplier := TBarangSupplier.Create(Self);
  BT  := TBarangTransaksi.Create(Self);
  with TNewBarang.Create(self) do
  begin
    try
      if LoadByKode(AProductCode) then
      begin
        FBarangSupplier.LoadByKodeBrg(AProductCode);
        BT.LoadByKode(AProductCode);

            edtProductName.Text := Nama;
            edtShortName.Text   := Alias;
            edtBrandName.Text   := Merk;

            if IsStock = 1           then edtStock.Text := 'STOCK';
            if IsCS = 1              then edtStock.Text := 'CS';
            if IsBuild  = 1          then cbTurunan.Checked:= True else cbTurunan.Checked:= False;
            if IsPajakInclude  = 1   then cbIsTaxInclude.Checked:= True else cbIsTaxInclude.Checked:= False;
            if IsActive = 1          then edtActive.Text:= 'ACTIVE' else edtActive.Text:= 'NOT ACTIVE';

            if IsValidate =1 then
            begin
              lblInvalid.Visible := false;
              lblValid.Visible   := true;
            end
            else
            begin
              lblInvalid.Visible := true;
              lblValid.Visible   := false;
            end;

            edtProducttype.Text     := GetTipeBarangName;
            edtUOMStockCode.Text    := KodeSatuanStock.UOM;
            edtUOMStockName.Text    := KodeSatuanStock.Nama;
            edtUOMPurchaseCode.Text := KodePurchase;
//            dinon aktifkan sbb invis
//            edtUOMPurchaseName.Text := GetPLUPurhaseName;


            edtOutlet.Text          := SalesOutlet.Kode;
            edtLocation.Text        := NewLocation.Kode;

            fedtMaxQtyOrder.Text    := FormatFloat('0.000',FBarangSupplier.MaxOrder);
            edtMaxQtyOrderUOM.Text  := FBarangSupplier.KodeSatuanBeli;
            fedtStockOnOrder.Value  := BT.StockInOrder;   //fieldbyname('BRGT_STOCK_IN_ORDER').AsFloat;
            edtStockOnOrderUOM.Text := FBarangSupplier.KodeSatuanBeli;
            fedtAverageSls.Value    := PkmAverage;
            edtAverageSlsUOM.Text   := KodeSatuanStock.UOM;

            edtSalesTaxCode.Text    := NewPajak.Nama;

            if NewPajak.Kode <> '0' then edtBKP.Text := 'BKP' else edtBKP.Text := 'BTKP';

            edtCatalog.Text         := Catalog;
            edtGroupCode.Text       := NewMerchandizeGroup.Kode;
            edtGroupName.Text       := NewMerchandizeGroup.Nama;
            edtSubGroupCode.Text    := Kategori.SubGroup.Kode;
            edtSubGroupName.Text    := Kategori.SubGroup.Nama;
            edtCategoryCode.Text    := Kategori.Kode;
            edtCategoryName.Text    := Kategori.Nama;
            edtMerchandCode.Text    := NewMerchadize.Kode;
            edtMerchandName.Text    := NewMerchadize.Nama;

            fedtCurrentStock.Value  := BT.Stock; //fieldbyname('BRGT_STOCK').AsFloat;
            edtCurrentStockUOM.Text := KodeSatuanStock.UOM;

            cbEnabledCN.Checked := FBarangSupplier.IsEnableCN = 1;

            edtPrimarySupplierCode.Text:= FBarangSupplier.NewSupplier.Kode;
            edtPrimarySupplierName.Text:= FBarangSupplier.NewSupplier.Nama;

            intedtExpiredTime.Value  := FBarangSupplier.ExpireTime;
            intedtDeliveryTime.Value := FBarangSupplier.DeliveryTime;

            jvcuredtPurchasingPrice.Value := FBarangSupplier.HargaBeli ;// fieldbyname('BRGSUP_BUY_PRICE').AsFloat;
            edtPurchasingPriceUOM.Text    := FBarangSupplier.KodeSatuanBeli; // fieldbyname('BRGSUP_SAT_CODE_BUY').AsString;

            edtPLUPurchase.Text := KodePurchase;

            edtLastCOGSUOM.Text    := KodeSatuanStock.UOM;
            jvcuredtLastCOGS.Value := GetHargaAVG(edtLastCOGSUOM.Text);




            cbEnableDec.Checked   := IsDecimal = 1;
            cbIsDiskonGMC.Checked := IsDiscGMC = 1;
            cbIsDeposit.Checked   := IsDeposit = 1;

            GetLastPurchasePrice(dLastPurchas,sUOMLastPurchase );
            jvcuredtLastCost.Value := dLastPurchas;
            edtUOMLastCost.Text    := sUOMLastPurchase;

            dtTgl.Date:= BT.DATE_MODIFY; //fieldbyname('DATE_MODIFY').AsDateTime;
            if BT.OP_MODIFY > 0 then
              edtUser.Text := IntToStr(BT.OP_MODIFY)// fieldbyname('OP_MODIFY').AsString;
            else
              edtUser.Text := '';

            //data := Product.GetDataFromBHJ(AProductCode);

            jvcuredtSellingPrice.Value :=  GetSellPricePrice;
            edtSellingPriceUOM.Text:= GetSellPricePriceUOM;

            //Safety Stock
            edSafetyStock.Value := SafetyStock;
            edtSSUOM.Text := KodeSatuanStock.UOM;

            //Author n Publisher
            edtAuthorId.Text    := Author.ID;
            edtAuthorNm.Text    := Author.Nama;
            edtPubsID.Text      := Pubs.ID;
            edtPubsNm.Text      := Pubs.PublisherNm;
            chkBasicItem.Checked:= (IsBasic = 1);

            if jvcuredtLastCOGS.Value <> 0 then
            begin
              if jvcuredtSellingPrice.Value = 0 then
                fedtMargin.Value := (jvcuredtSellingPrice.Value - jvcuredtLastCOGS.Value)
              else
                fedtMargin.Value := (jvcuredtSellingPrice.Value - jvcuredtLastCOGS.Value)
                                    / jvcuredtSellingPrice.Value * 100;
            end
            else
              fedtMargin.Value := 0;
          Result:= True;
      end;
    finally
      FBarangSupplier.Free;
      BT.Free;
      Free;
    end;
  end;
  }
  GetStockUOMRP;

end;

procedure TfrmProduct.ParseCompanyCode;
//var //data: TResultDataSet;
  //  i: Integer;
begin
  {
  if not Assigned(SearchProduct) then SearchProduct := TSearchProduct.Create;

  data := SearchProduct.GetListBarangbyCode(MasterNewUnit.ID, '000%', '', mNone);

  i:=1;
  with data do
  if not IsEmpty then
  begin
    cbpProductCode.ClearGridData;
    cbpProductCode.RowCount := data.RecordCount+1;
    cbpProductCode.ColCount := 3;
    cbpProductCode.AddRow(['Id','Product Code','Product Name']);
    cbpProductCode.FixedRows:= 1;
    while (not Eof) do
    begin
      cbpProductCode.AddRow([IntToStr(i),data.FieldByName('brg_code').AsString,data.FieldByName('brg_name').AsString]);
      Inc(i);
      Next;
    end; // while
    cbpProductCode.SizeGridToData;
    cbpProductCode.Text := cbpProductCode.Cells[1,1];
  end // is empty
  else
  begin
    cbpProductCode.RowCount := 2;
    cbpProductCode.ColCount := 3;
    cbpProductCode.FixedRows:= 1;
    cbpProductCode.AddRow(['Id','Product Code','Product Name']);
    cbpProductCode.AddRow(['0','','']);
    cbpProductCode.SizeGridToData;
  end;
  }
end;

procedure TfrmProduct.ShowFormBonusProduct;
begin
  if edtProductName.Text='' then Exit;
  ClearFrameOpened;
  //OpenLoading(FORM_LOADING);
  SetActiveFooter5Button(false);

  if not assigned(fraBonusProduct) then
    fraBonusProduct := TfraBonusProduct.Create(Application);

//  fraFooter5Button1.btnClose.Cancel := False;
  fraBonusProduct.Height            := 290;
  fraBonusProduct.Parent            := pnlBody;
  fraBonusProduct.Align             := alBottom;
  fraBonusProduct.ProductCode       := cbpProductCode.Text;
  fraBonusProduct.UntID             := 1;
  fraBonusProduct.OP_ID             := FLoginId;

//  fraBonusProduct.ShowBonusProduct(cbpProductCode.Text,MasterNewUnit.ID);

  fraBonusProduct.SetFocus;
end;

procedure TfrmProduct.ShowFormAlokasiStock;
begin
  if edtProductName.Text='' then Exit;
  ClearFrameOpened;
  //OpenLoading(FORM_LOADING);
  SetActiveFooter5Button(false);

  if not assigned(fraAlokasiStock) then
    fraAlokasiStock := TfraAlokasiStock.Create(Application);

//  fraFooter5Button1.btnClose.Cancel := False;
  fraAlokasiStock.Height            := 290;
  fraAlokasiStock.Parent            := pnlBody;
  fraAlokasiStock.Align             := alBottom;
  fraAlokasiStock.ProductCode       := cbpProductCode.Text;
  fraAlokasiStock.ShowAlokasiStock(cbpProductCode.Text);
//  CloseLoading;
end;

procedure TfrmProduct.ShowFormSellingPrice;
begin
  if edtProductName.Text='' then Exit;
  SetActiveFooter5Button(false);

  if not assigned(fraSellingPrice) then
    fraSellingPrice := TfraSellingPrice.Create(Application);

//  fraFooter5Button1.btnClose.Cancel := False;
  fraSellingPrice.Height            := aHeightSP;
  fraSellingPrice.Parent            := pnlBody;
//  fraSellingPrice.FSelfUnitId       := MasterNewUnit.ID;
  fraSellingPrice.FTpApp            := FTipeApp;


  if (assigned(fraProductSupplier)) and (fraProductSupplier.Parent <> nil)  then
  begin
    SetXYSP;
  end
  else
  begin
    fraSellingPrice.Align             := alBottom;
  end;

  fraSellingPrice.ProductCode       := cbpProductCode.Text;
  fraSellingPrice.LastCOGS          := jvcuredtLastCOGS.Value;
  fraSellingPrice.ShowSellingPrice(cbpProductCode.Text);
end;

procedure TfrmProduct.ShowFormUOMConversion;
begin

  if edtProductName.Text = '' then Exit;

  SetActiveFooter5Button(false);
  if not assigned(fraUOMConvertion) then
    fraUOMConvertion := TfraUOMConvertion.Create(Application);

//  fraFooter5Button1.btnClose.Cancel := False;

//  fraUOMConvertion.FSelfUnitId      := MasterNewUnit.ID;
  fraUOMConvertion.Height           := 290;
  fraUOMConvertion.Parent           := pnlBody;
  fraUOMConvertion.Align            := alBottom;
  fraUOMConvertion.pnlAddEdit.Visible := false;
  fraUOMConvertion.ProductCode        := cbpProductCode.Text;
  fraUOMConvertion.ShowUOMConvertion(edtUOMStockCode.Text);


end;

procedure TfrmProduct.ShowFormStockCard;
begin
  if edtProductName.Text='' then Exit;
  ClearFrameOpened;
  //OpenLoading(FORM_LOADING);
  SetActiveFooter5Button(false);

  if not assigned(fraStockCard) then
    fraStockCard := TfraStockCard.Create(Application);

//  fraFooter5Button1.btnClose.Cancel := False;
  fraStockCard.FSelfUsername          := FLoginUsername;
  fraStockCard.fselfFullname          := FLoginFullname;
//  fraStockCard.FSelfUnitId          := MasterNewUnit.ID;
  fraStockCard.Parent               := pnlBody;
  fraStockCard.Align                := alBottom;
  fraStockCard.ProductCode          := cbpProductCode.Text;
  fraStockCard.ShowStockCard(cbpProductCode.Text);
end;

procedure TfrmProduct.ShowFormProductSupplier;
begin
  if edtProductName.Text='' then Exit;
  SetActiveFooter5Button(false);
  if not assigned(fraProductSupplier) then
    fraProductSupplier := TfraProductSupplier.Create(Application);

//  fraFooter5Button1.btnClose.Cancel := False;
//  fraProductSupplier.FSelfUnitID        := MasterNewUnit.ID;
  fraProductSupplier.FSelfIsStore       := FMasterIsStore;
  fraProductSupplier.Height         := 293;
  fraProductSupplier.Parent         := pnlBody;

  if (assigned(fraSellingPrice)) and (fraSellingPrice.Parent <> nil) then
    SetXYSP;

  fraProductSupplier.Align          := alBottom;
  fraProductSupplier.ProductCode    := cbpProductCode.Text;
  fraProductSupplier.ShowProductSupplier(cbpProductCode.Text);
end;

procedure TfrmProduct.ShowHistoriPOByProduct;
begin
  if edtProductName.Text='' then Exit;
  ClearFrameOpened;
  SetActiveFooter5Button(false);

  if not assigned(fraHistoriPOByProduct) then
    fraHistoriPOByProduct := TfraHistoriPOByProduct.Create(Application);

//  fraFooter5Button1.btnClose.Cancel := False;
  fraHistoriPOByProduct.Height      := 240;
  fraHistoriPOByProduct.Parent      := pnlBody;
  fraHistoriPOByProduct.Align       := alBottom;
  fraHistoriPOByProduct.ProductCode := cbpProductCode.Text;
  fraHistoriPOByProduct.ShowPOByProduct;
  fraHistoriPOByProduct.FromMode    := fmProduct;
end;

procedure TfrmProduct.actAddProductExecute(Sender: TObject);
begin
  if not assigned(frmDialogProduct) then
    frmDialogProduct := TfrmDialogProduct.Create(Application);
  frmDialogProduct.ShowModal;
//  with frmDialogProduct do
//  begin
//    try
//      fraFooter5Button1.btnClose.Cancel           := True;
//      Caption := 'Add Product';
//      FormMode                   := fmAdd;
//      SetFormPropertyAndShowDialog(frmDialogProduct);
//      if (IsProcessSuccessfull) then
//      begin
//        cbpProductCode.Text := edtProductCode.Text;
//        actRefreshProductExecute(nil);
//        CommonDlg.ShowConfirm(atAdd);
//      end;
//    finally
//      free;
//    end;
//  end;

end;

procedure TfrmProduct.actEditProductExecute(Sender: TObject);
begin
  if edtProductName.Text='' then Exit;
//  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError('UNIT BELUM DIPILIH');
    Exit;
  end;

  if SpecialKey.ChekFrameAdded then
  begin
    SpecialKey.ExecuteLabelOnFrame('lblEdit');
    Exit;
  end;

  if not assigned(frmDialogProduct) then
    frmDialogProduct := TfrmDialogProduct.Create(Application);

//  with frmDialogProduct do
//  begin
//    try
//      fraFooter5Button1.btnClose.Cancel           := True;
//      Caption := 'Edit Product';
//      FormMode                   := fmEdit;
//      ProductId                  := cbpProductCode.Text;
//      SetFormPropertyAndShowDialog(frmDialogProduct);
//      if (IsProcessSuccessfull) then
//      begin
//        cbpProductCode.Text := edtProductCode.Text;
//        actRefreshProductExecute(nil);
//        CommonDlg.ShowConfirm(atEdit);
//      end;
//    finally
//      free;
//    end;
//  end;


end;

procedure TfrmProduct.actDeleteProductExecute(Sender: TObject);
var
  strErr: string;
begin
  if SpecialKey.ChekFrameAdded then
  begin
    SpecialKey.ExecuteLabelOnFrame('lblDelete');
    Exit;
  end;

  if edtProductName.Text='' then Exit;
  {if (CommonDlg.Confirm('Are you sure want to delete product (Product Code: '+cbpProductCode.Text+')?') = mrYes) then
  begin
    if FnewBArang.LoadByKode(cbpProductCode.Text) then
    begin
      try
        FnewBArang.RemoveFromDB;
        cCommitTrans;
        CommonDlg.ShowMessage('berhasil menghapus data');
        ClearByTag(Self,[0]);
        cbpProductCode.Text := '';
        actRefreshProductExecute(nil);
      except
        on E: EIBError do
        begin
          strErr := GetForeignTable(e.Message);
          if strErr <> '' then
            CommonDlg.ShowError(strErr)
          else
            CommonDlg.ShowError(e.Message);
        end;
      end;
    end
    else
    begin
      CommonDlg.ShowMessage('Tidak menemukan data product tersebut');
    end;
  end;
   }
end;

procedure TfrmProduct.actRefreshProductExecute(Sender: TObject);
begin
  ParseProduct(cbpProductCode.Text);
end;

procedure TfrmProduct.ShowFormProductTurunan;
begin
  if edtProductName.Text='' then Exit;
  ClearFrameOpened;
  SetActiveFooter5Button(false);
  if not assigned(fraProductTurunan) then
    fraProductTurunan := TfraProductTurunan.Create(Application);

//  fraFooter5Button1.btnClose.Cancel := False;
  fraProductTurunan.Parent          := Self;
  fraProductTurunan.Height          := 290;
  fraProductTurunan.Parent          := pnlBody;
  fraProductTurunan.Align           := alBottom;
  fraProductTurunan.ProductCode     := cbpProductCode.Text;
  fraProductTurunan.ShowProductTurunan(cbpProductCode.Text);
end;

procedure TfrmProduct.cbpProductCodeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    if (Length(cbpProductCode.Text) < igProd_Code_Length) and (Trim(cbpProductCode.Text) <> '') then
    begin
      cbpProductCode.Text := TAppUtils.StrPadLeft(cbpProductCode.Text,igProd_Code_Length,'0');
    end;

    ClearForm;
    if Trim(cbpProductCode.Text) = '' then
      Exit;


    if (not ParseProduct(cbpProductCode.Text))then
    begin
      CommonDlg.ShowError(PRODUCT_NOT_FOUND);
      Exit;
    end;


  end;

end;

procedure TfrmProduct.cbpProductCodePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  sSQL: string;
begin
  inherited;
  sSQL := ' select brg_code as Kode, brg_alias as Alias'
            + ' from barang ';
  {
  with cLookUp('Daftar Barang', sSQL) do
  begin
    try
    begin
      cbpProductCode.Text := Strings[0];
      edtProductName.SetFocus;
      edtBrandName.SetFocus;
    end;
    finally
      Free
    end;
  end; }
end;

procedure TfrmProduct.ClearForm;
begin
  edtProductName.Clear;
  edtShortName.Clear;
  edtBrandName.Clear;
  edtBKP.Clear;
  edtStock.Clear;
  edtProducttype.Clear;
  edtActive.Clear;
  edtUOMStockCode.Clear;
  edtUOMStockName.Clear;
  edtUOMPurchaseCode.Clear;
  edtUOMPurchaseName.Clear;
  edtOutlet.Clear;
  edtLocation.Clear;


  edtMaxQtyOrderUOM.Clear;
  edtAverageSlsUOM.Clear;
  edtStockOnOrderUOM.Clear;
  edtSalesTaxCode.Clear;
  edtCatalog.Clear;
  edtGroupCode.Clear;
  edtGroupName.Clear;
  edtSubGroupCode.Clear;
  edtSubGroupName.Clear;
  edtCategoryCode.Clear;
  edtCategoryName.Clear;
  edtMerchandCode.Clear;
  edtMerchandName.Clear;
  edtCurrentStockUOM.Clear;
  edtPrimarySupplierCode.Clear;
  edtPrimarySupplierName.Clear;
  edtPurchasingPriceUOM.Clear;
  edtSellingPriceUOM.Clear;
  edtLastCOGSUOM.Clear;
  edtUser.Clear;
  dtTgl.Clear;

  fedtMaxQtyOrder.Value:=0;
  fedtAverageSls.Value:=0;
  fedtStockOnOrder.Value:=0;
  fedtCurrentStock.Value:=0;
  fedtMargin.Value:=0;

  intedtExpiredTime.Value:=0;
  intedtDeliveryTime.Value:=0;

  jvcuredtPurchasingPrice.Value:=0;
  jvcuredtSellingPrice.Value:=0;
  jvcuredtLastCOGS.Value:=0;
  jvcuredtDepositValue.Value:=0;
  jvcuredtLastCost.Value:=0;

  fedtStockQty.Value := 0;
  fedtStockRp.Value := 0;
  edtStockUOM.Clear;

  lblInvalid.Visible := false;
  lblValid.Visible := false;

  edtAuthorId.Clear;
  edtAuthorNm.Clear;
  edtPubsID.Clear;
  edtPubsNm.clear;
  chkBasicItem.Checked := False;

end;

procedure TfrmProduct.FormShow(Sender: TObject);
begin
  inherited;
  cbTurunan.Enabled:= False;
  cbIsTaxInclude.Enabled:= False;
  cbEnabledCN.Enabled:= False;
  cbEnableDec.Enabled:= False;
  cbIsDiskonGMC.Enabled := False;
  cbIsDeposit.Enabled := False;
  chkBasicItem.Enabled := False;
  ClearForm;
  ParseCompanyCode;
  cbpProductCode.Text := '';

  if not assigned(SpecialKey) then
    SpecialKey := TSpecialKey.Create;

  SetLabel;

end;

procedure TfrmProduct.FormActivate(Sender: TObject);
begin
  inherited;
//  fraFooter5Button1.btnClose.Cancel:= False;
end;

procedure TfrmProduct.cbpProductCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if(ssctrl in Shift)and(Key=VK_DELETE)then
    Key:= VK_NONAME;
end;

procedure TfrmProduct.actValidateProductExecute(Sender: TObject);
begin
//  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError('UNIT BELUM DIPILIH');
    Exit;
  end;
  {
  with TNewBarang.Create(Self) do
  begin
    try
      if ValidateBarang(cbpProductCode.Text)  then
      begin
        cCommitTrans;
        ParseProduct(cbpProductCode.Text);
      end
      else
        cRollbackTrans;

    finally
      cRollbackTrans;
      Free;
    end;
  end; }

end;

procedure TfrmProduct.ClearFrameOpened;
begin
  try
    if assigned(fraProductSupplier) then
      fraProductSupplier.Parent := nil;
    if assigned(fraBonusProduct) then
      fraBonusProduct.Parent := nil;
    if assigned(fraUOMConvertion) then
      fraUOMConvertion.Parent := nil;
    if assigned(fraSellingPrice) then
      fraSellingPrice.Parent := nil;
    if assigned(fraAlokasiStock) then
      fraAlokasiStock.Parent := nil;
    if assigned(fraStockCard) then
      fraStockCard.Parent := nil;
    if assigned(fraProductTurunan) then
      fraProductTurunan.Parent := nil;
    if assigned(fraHistoriPOByProduct) then
      fraHistoriPOByProduct.Parent := nil;
  except
  end;
end;

procedure TfrmProduct.cbpProductCodeEnter(Sender: TObject);
begin
  inherited;
  cbpProductCode.SelStart := 0;
  cbpProductCode.SelectAll;
end;

procedure TfrmProduct.SetActiveFooter5Button(AIsActive: boolean);
begin
  {with fraFooter5Button1 do
  begin
    actAddProduct.Enabled := AIsActive;
    actEditProduct.Enabled := AIsActive;
    actDeleteProduct.Enabled := AIsActive;
    actRefreshProduct.Enabled := AIsActive;
    btnClose.Enabled := AIsActive;
  end;     }
  SetLabel;
end;

procedure TfrmProduct.cbpProductCodeExit(Sender: TObject);
begin
  inherited;
  if (Length(cbpProductCode.Text) < igProd_Code_Length) and (Trim(cbpProductCode.Text) <> '') then
  begin
    cbpProductCode.Text := TAppUtils.StrPadLeft(cbpProductCode.Text,igProd_Code_Length,'0');
  end;

end;

procedure TfrmProduct.fraFooter5Button1btnCloseClick(Sender: TObject);
begin
  //inherited;
  Self.Close;
  //fraFooter5Button1.btnCloseClick(Sender);
end;

procedure TfrmProduct.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  isCloseForm: Boolean;
begin
  inherited;
  if (Key = VK_F1) then
  begin
    if actBonusProduct.Enabled then
      actBonusProductExecute(nil);
  end;
  if (Key = VK_F2) then
  begin
    if actAlokasiStock.Enabled then
      actAlokasiStockExecute(nil);
  end;
  if (Key = VK_F3) then
  begin
    if  actSellingPrice.Enabled then
      actSellingPriceExecute(nil);
  end;
  if (Key = VK_F5) then
  begin
    if (Assigned(fraBonusProduct)) then
    begin
      if not (fraBonusProduct.Parent = nil) then
        Exit;
    end
    else if (Assigned(fraProductSupplier)) then
    begin
      if not (fraProductSupplier.Parent = nil) then
        Exit;
    end;
    if ActiveControl = cbpProductCode then
    begin
      cbpProductCodePropertiesButtonClick(sender, 0);
      Key := VK_RETURN;
      cbpProductCodeKeyUp(Self,Key,Shift);
      Key := Ord(0);
    end;
  end;

  if (Key = Ord('L')) and (ssCtrl in shift) then
  begin
    cbpProductCode.SetFocus;
    cbpProductCode.SelectAll;
  end;

  if (Key = Ord('A')) and (ssCtrl in shift) then
  begin
    if actHistoryPo.Enabled then
      actHistoryPoExecute(nil);
  end;

  if (Key = Ord('K')) and (ssCtrl in shift) then
  begin
    if actUomConversion.Enabled then
      actUomConversionExecute(nil);
  end;

  if (Key = Ord('S')) and (ssCtrl in shift) then
  begin
    if actStockCard.Enabled then
      actStockCardExecute(nil);
  end;

  if (Key = Ord('P')) and (ssCtrl in shift) then
  begin
    if actProductSupplier.Enabled then
      actProductSupplierExecute(nil);
  end;

  if Key = VK_ESCAPE then
  begin
    SpecialKey.SpecialKeyEscape(Self,isCloseForm);
    if not (isCloseForm) then
      SetActiveFooter5Button(True);
  end;

  if (Key = Ord('V')) and (ssCtrl in shift) then
  begin
    if actValidateProduct.Enabled then
    actValidateProductExecute(Self);
  end;

  if (Key = VK_F1) and (ssctrl in Shift) then
  begin
    if (Assigned(fraSellingPrice)) then
    begin
      if not (fraSellingPrice.Parent = nil) then
        fraSellingPrice.lblAddClick(Sender);
    end;
  end;

  if (Key = VK_F2) and (ssctrl in Shift) then
  begin
    if (Assigned(fraSellingPrice)) then
    begin
      if not (fraSellingPrice.Parent = nil) then
        fraSellingPrice.lblEditClick(Sender);
    end;
  end;

  if (Key = VK_F3) and (ssctrl in Shift) then
  begin
    if (Assigned(fraSellingPrice)) then
    begin
      if not (fraSellingPrice.Parent = nil) then
        fraSellingPrice.lblDeleteClick(Sender);
    end;
  end;

  if (Key = VK_ESCAPE) and (ssctrl in Shift) then
  begin
    if (Assigned(fraSellingPrice)) then
    begin
      if not (fraSellingPrice.Parent = nil) then
        fraSellingPrice.lblCloseClick(Sender);
    end;
  end;

end;

procedure TfrmProduct.SetLabel;
begin
  if FLoginIsStore=1 then //FMasterIsStore=1 then
  {fraFooter5Button1.lbl1.Enabled := False
  else
  fraFooter5Button1.lbl1.Enabled := True;

  fraFooter5Button1.lbl2.Enabled := fraFooter5Button1.lbl1.Enabled;
  fraFooter5Button1.lbl3.Enabled := fraFooter5Button1.lbl1.Enabled;
  fraFooter5Button1.lbl4.Enabled := fraFooter5Button1.lbl1.Enabled;
  fraFooter5Button1.btnAdd.Enabled := fraFooter5Button1.lbl1.Enabled;
  fraFooter5Button1.btnUpdate.Enabled := fraFooter5Button1.lbl1.Enabled;
  fraFooter5Button1.btnDelete.Enabled := fraFooter5Button1.lbl1.Enabled;
  }
end;

procedure TfrmProduct.SetXYSP;
begin
  fraSellingPrice.Align   := alCustom;
  SetLeftWidthSP;
end;

procedure TfrmProduct.SetLeftWidthSP;
var
  aMaxHeight: Integer;
begin
  aMaxHeight  := Floor((pnlBody.Height - aMaxTop)/2);
  fraProductSupplier.Height := aMaxHeight;
  fraSellingPrice.Height    := aMaxHeight;
  fraSellingPrice.Top       := fraProductSupplier.Top - aMaxHeight;
  fraSellingPrice.Left    := fraProductSupplier.Left;
  fraSellingPrice.Width   := fraProductSupplier.Width;
end;

procedure TfrmProduct.FormResize(Sender: TObject);
begin
  inherited;
  if (assigned(fraSellingPrice)) and (assigned(fraProductSupplier)) then
  begin
    if (fraSellingPrice.Parent <> nil) and (fraProductSupplier.Parent <> nil) then
    begin
      SetLeftWidthSP;
    end;
  end;
end;

procedure TfrmProduct.actProductSupplierExecute(Sender: TObject);
begin
  inherited;
  ShowFormProductSupplier;
end;

procedure TfrmProduct.actStockCardExecute(Sender: TObject);
begin
  inherited;
  ShowFormStockCard;
end;

procedure TfrmProduct.actHistoryPoExecute(Sender: TObject);
begin
  inherited;
  ShowHistoriPOByProduct;
end;

procedure TfrmProduct.actUomConversionExecute(Sender: TObject);
begin
  inherited;
  ShowFormUOMConversion;
end;

procedure TfrmProduct.actBonusProductExecute(Sender: TObject);
begin
  inherited;
  ShowFormBonusProduct;
end;

procedure TfrmProduct.actAlokasiStockExecute(Sender: TObject);
begin
  inherited;
  ShowFormAlokasiStock;
end;

procedure TfrmProduct.actSellingPriceExecute(Sender: TObject);
begin
  inherited;
  ShowFormSellingPrice;
end;

procedure TfrmProduct.actProductTurunanExecute(Sender: TObject);
begin
  inherited;
  ShowFormProductTurunan();
end;

end.
