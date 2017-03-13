unit ufrmDialogProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls,
  StdCtrls, uConn, uRetnoUnit, ActnList, System.Actions, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxCurrencyEdit, cxCheckBox;

type
  TFormMode = (fmAdd, fmEdit);
  TArrDataCombo = array of record
                    id: Integer;
                    code: string;
                  end;

  TBarangSupplierPajak = record
    PajakCode: string;
    IsBKP: Integer;
    SupplierCode: string;
    IsPKP: Integer;
  end;
  TArrayBarangSupplierPajak = array of TBarangSupplierPajak;

  TfrmDialogProduct = class(TfrmMasterDialog)
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    cbTurunan: TcxCheckBox;
    lbl6: TLabel;
    lbl8: TLabel;
    lbl10: TLabel;
    edtProductCode: TEdit;
    edtShortName: TEdit;
    edtBrandName: TEdit;
    lbl23: TLabel;
    edtCatalog: TEdit;
    cbActive: TcxCheckBox;
    lbl26: TLabel;
    lbl27: TLabel;
    lbl20: TLabel;
    lbl7: TLabel;
    pnl1: TPanel;
    lbl25: TLabel;
    jvcuredtLastCost: TcxCurrencyEdit;
    lbl41: TLabel;
    edtLastCOGSUOM: TEdit;
    lbl29: TLabel;
    edtAverageSlsUOM: TEdit;
    cbisDecimal: TcxCheckBox;
    cbIsTaxInclude: TcxCheckBox;
    lbl30: TLabel;
    lbl31: TLabel;
    grpPurchase: TGroupBox;
    lbl28: TLabel;
    edtPLUPurchase: TEdit;
    edtProductPurchase: TEdit;
    lbl1: TLabel;
    edtUOMName: TEdit;
    intedtCommonAllocation: TcxCurrencyEdit;
    lbl21: TLabel;
    edtCommonUOM: TEdit;
    edtAsgrossUOM: TEdit;
    intedtAsgrossAllocation: TcxCurrencyEdit;
    lbl22: TLabel;
    lbl24: TLabel;
    intedtTraderAllocation: TcxCurrencyEdit;
    edtTraderUOM: TEdit;
    cbisDeposit: TcxCheckBox;
    cbpStok: TComboBox;
    cbpProductType: TComboBox;
    cbpUOMStok: TComboBox;
    cbpOutlet: TComboBox;
    cbpLocation: TComboBox;
    cbpTax: TComboBox;
    cbpMerchan: TComboBox;
    cbpMerchanGrup: TComboBox;
    cbpSubGroup: TComboBox;
    cbpKategori: TComboBox;
    edtUOMPurchase: TEdit;
    chkIsGalon: TcxCheckBox;
    Label1: TLabel;
    edtBrgGalong: TEdit;
    edtBrgNamaGalon: TEdit;
    chkIsDiscAMC: TcxCheckBox;
    edtAverageSls: TcxCurrencyEdit;
    Label3: TLabel;
    edtAuthorId: TEdit;
    edtAuthorNm: TEdit;
    edtPubsID: TEdit;
    edtPubsNm: TEdit;
    Label4: TLabel;
    lblLabel2: TLabel;
    edtSSSubGroup: TcxCurrencyEdit;
    edtSSBARANG: TcxCurrencyEdit;
    chkIsBasic: TcxCheckBox;
    lbl9: TLabel;
    cbbProductName: TComboBox;
    ActionList1: TActionList;
    actPluIsActive: TAction;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbpUOMStockChange(Sender: TObject);
    procedure intedtCommonAllocationExit(Sender: TObject);
    procedure edtProductCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtProductNameKeyPress(Sender: TObject; var Key: Char);
    procedure edtShortNameKeyPress(Sender: TObject; var Key: Char);
    procedure edtBrandNameKeyPress(Sender: TObject; var Key: Char);
    procedure edtCatalogKeyPress(Sender: TObject; var Key: Char);
//    procedure intedtTotalKeyDown(Sender: TObject; var Key: Word;
//      Shift: TShiftState);
    procedure cbTurunanKeyPress(Sender: TObject; var Key: Char);
    procedure cbActiveKeyPress(Sender: TObject; var Key: Char);
    procedure cbisDecimalKeyPress(Sender: TObject; var Key: Char);
    procedure cbIsTaxIncludeKeyPress(Sender: TObject; var Key: Char);
//    procedure cbpProductTypeChange(Sender: TObject);
//    procedure cbpOutletChange(Sender: TObject);
//    procedure cbpLocationChange(Sender: TObject);
//    procedure cbpTaxChange(Sender: TObject);
//    procedure cbpMerchandChange(Sender: TObject);
//    procedure cbpMerchanGroupChange(Sender: TObject);
    procedure cbpSubGroupChange(Sender: TObject);
//    procedure cbpCategoryChange(Sender: TObject);
    procedure edtBrandNameExit(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbpMerchanChange(Sender: TObject);
    procedure cbpMerchanGrupChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtPLUPurchaseKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPLUPurchaseExit(Sender: TObject);
    procedure chkIsGalonClick(Sender: TObject);
    procedure edtBrgGalongKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAuthorIdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPubsIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkIsBasicKeyPress(Sender: TObject; var Key: Char);
    procedure edtProductNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbbProductNameKeyPress(Sender: TObject; var Key: Char);
  private
    //arrProductType        : TArrDataCombo;
    //arrUOM                : TArrDataCombo;
    //arrOutlet             : TArrDataCombo;
    //arrLocation           : TArrDataCombo;
    //arrTax                : TArrDataCombo;
    //arrMerchand           : TArrDataCombo;
    //arrGroup              : TArrDataCombo;
    //arrKategori           : TArrDataCombo;
    //FIdProductType        : Integer;
    //FIdOutlet             : Integer;
    //FIdTax                : Integer;
    //FIdCategory           : Integer;
    //FIdMerchand           : Integer;
    //FIdGroup              : Integer;
    //FIdKategori           : Integer;
    FIsProcessSuccessfull : Boolean;
    FProductId            : string;
    FFormMode             : TFormMode;
    //dataHugeCombo : TResultDataSet;
//    FNewBarang  : TNewBarang;
//    fMerk       : TMerk;
    FTmpPajakCode: string;
    FxGen: Integer;
    function simpanUOM(aUOMCode: string):boolean;
    function SaveProduct: boolean;
    function CekTotalAllocation: Boolean;
    function GeneratePLU:string;

    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: Boolean);
    procedure SetProductId(const Value: string);
//    procedure PrepareCombo;
    procedure PrepareAdd;
    procedure PrepareEdit;
    function SaveProductExec: Boolean;
    procedure SetCbbTax(aMerchanID: Integer);
    procedure SetIFStore;
  public
    KodeLama: String;
    function GetDataFromCbpStok(combo: TComboBox): Integer;
    function getHasilCheckBox(checkBox: TcxCheckBox): Integer;
    function GetSQLMerk(aMerk: String =''): string;
    function IsMerGroupValidLokal: Boolean;
    procedure LoadDataSS(aSubGroupID : Integer; aUntID : Integer);
    procedure LoadListCBpKategori(iSubGrupID: Integer);
    procedure LoadListCbpLocation;
    procedure LoadListCbpMerchan;
    procedure LoadListCBpMerchanGrup(merchangrupID : Integer);
    procedure LoadListCbpOutLet;
    procedure LoadListCbpProductType;
    procedure LoadListCbpSubGroup(MerchangroupID: Integer);
    procedure LoadListCbpTax;
    procedure LoadListCbpUOMStok;
    procedure ParseComboMerk(aCombo : TComboBox; aText: String);
    procedure SetcbpStok(isStok : Integer);
    procedure setCheckBox(checkBox: TcxCheckBox; Isi : Integer);
    procedure SetDataPLUPurchase;
    { Public declarations }
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property ProductId: string read FProductId write SetProductId;
    property IsProcessSuccessfull: Boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogProduct: TfrmDialogProduct;

implementation

uses ufrmMain, DB, uTSCommonDlg, ufrmProduct, uConstanta, uAppUtils;

{$R *.dfm}


function TfrmDialogProduct.simpanUOM(aUOMCode: string):boolean;
begin

  Result := False;
   {
   with TKonversiSatuan.Create(nil) do
   begin
     try
        (*  pengecekan sudah ada dalam kelas
         *)
        UpdateData(
                                0,
                                edtProductCode.Text,
                                aUOMCode,
                                aUOMCode,
                                1,
                                edtProductCode.Text);


        if ExecuteGenerateSQLByFilterUnit(aUOMCode, aUOMCode, '') then
        begin
          Result := True;
          exit;
        end
        else
        begin
          cRollbackTrans;
          CommonDlg.ShowError('Gagal menyimpan konversi UOM '+Quot(aUOMCode));
        end;
     finally;
        Free;
     end;
   end;  }
end;

procedure TfrmDialogProduct.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogProduct.FormDestroy(Sender: TObject);
begin
  inherited;
//  FreeAndNil(FNewBarang);
//  FreeAndNil(Fmerk);
  frmDialogProduct := nil;
end;

procedure TfrmDialogProduct.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogProduct.SetIsProcessSuccessfull(const Value: Boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogProduct.SetProductId(const Value: string);
begin
  FProductId := Value;
end;

function TfrmDialogProduct.SaveProduct: boolean;
var
  aWidth: string;
  aValidateUserUnit_ID: Integer;
  aValidateUserID: Integer;
  aUOMWeight: string;
  aUOMVolume: string;
  aUOMDiameter: string;
  aTipeBarangID: Integer;
  aSalesOutlet_ID: Integer;
  aNewMerchandizeGroup_ID: Integer;
  aNewMerchadize_ID: Integer;
  aNewLocation_Kode: string;
  aNewBarangPajak_ID: Integer;
  aNama: string;
  aMerk: string;
  aLength: string;
  aUOM: string;
  aKodePurchase: string;
  aKode: string;
  aKategori_ID: Integer;
  aIsValidate: Integer;
  aIsStock: Integer;
  aIsPajakInclude: Integer;
  aIsGalon: Integer;
  aIsDiscGMC: Integer;
  aIsDeposit: Integer;
  aIsDecimal: Integer;
  aIsCS: Integer;
  aIsBuild: Integer;
  aIsActive: Integer;
  aHeight: string;
  aExpireTime: Integer;
  aDefaultMarkUP: Double;
  aCatalog: string;
  aAlias: string;
  aHargaAvg: Double ;
  sAuthorId : string;
  sPubsId   : string;
begin
   Result := False;
  //insert to table barang transaksi
  aAlias := edtShortName.Text; //cbbProductName.Text;
  aCatalog := edtCatalog.Text;
//  aDefaultMarkUP := FNewBarang.DefaultMarkUP ;
//  aExpireTime := FNewBarang.ExpireTime;
//  aHeight := FNewBarang.Height;

  aIsActive := getHasilcheckBox(cbactive) ;
  aIsBuild := getHasilCheckBox(cbTurunan);
  aIsStock := GetDataFromCbpStok(cbpStok);
  if aIsStock = 1 then
    aIsCS := 0
  else
    aIsCS := 1;

  aIsDecimal := getHasilCheckBox(cbisDecimal);
  aIsDeposit :=getHasilCheckBox(cbisDeposit);
  aIsDiscGMC := getHasilCheckBox(chkIsDiscAMC) ;
  aIsGalon := getHasilCheckBox(chkIsGalon);
  aIsPajakInclude := getHasilCheckBox(cbIsTaxInclude);

//  aIsValidate := FNewBarang.IsValidate;

  if cbpMerchan.ItemIndex < 0 then
  begin
    CommonDlg.ShowError('Merchandize Belum Diisi');
    cbpMerchan.SetFocus;
    Exit;
  end;

  if cbpMerchanGrup.ItemIndex < 0 then
  begin
    CommonDlg.ShowError('Merchandize Group Belum Diisi');
    cbpMerchanGrup.SetFocus;
    Exit;
  end;

  if cbpSubGroup.ItemIndex < 0 then
  begin
    CommonDlg.ShowError('Sub Group Belum Diisi');
    cbpSubGroup.SetFocus;
    Exit;
  end;

  if cbpKategori.ItemIndex < 0 then
  begin
    CommonDlg.ShowError('Kategori Belum Diisi');
    cbpKategori.SetFocus;
    Exit;
  end;

//  aKategori_ID := cGetIDfromCombo(cbpKategori);
//  aKode := edtProductCode.Text;
//  aKodePurchase := edtPLUPurchase.Text;
//  aUOM := cGetIDfromComboCode(cbpUOMStok) ;
//  aLength := FNewBarang.Length ;
//  aMerk := cbbProductName.Text;// edtShortName.Text;
//  aNama := edtBrandName.Text;
//  aNewBarangPajak_ID := cGetIDfromCombo(cbpTax);

  if cbpLocation.ItemIndex < 0 then
  begin
    CommonDlg.ShowError('Lokasi Belum Diisi');
    cbpLocation.SetFocus;
    Exit;
  end;

  

//  aNewLocation_Kode := cGetIDfromComboCode(cbpLocation);
//  aNewMerchadize_ID := cGetIDfromCombo(cbpMerchan);
//  aNewMerchandizeGroup_ID :=  cGetIDfromCombo(cbpMerchanGrup);
//  aSalesOutlet_ID := cGetIDfromCombo(cbpOutlet);
//  aTipeBarangID := cGetIDfromCombo(cbpProductType);
//  aUOMDiameter := FNewBarang.UOMDiameter;
//  aUOMVolume := FNewBarang.UOMVolume ;
//  aUOMWeight := FNewBarang.UOMWeight;
//
//  aValidateUserID := FLoginId ;
//  aValidateUserUnit_ID := FLoginUnitId;
//  aWidth := FNewBarang.Width;
//  aHArgaAvg := FNewBArang.HargaAverage;
//  sAuthorId := Trim(edtAuthorId.Text);
//  sPubsId   := Trim(edtPubsID.Text);

  if aIsGalon = 1 then
  begin
//    with TNewBarang.Create(Self) do
//    begin
//      try
//        if not LoadByKode(edtBrgGalong.Text) then
//        begin
//          CommonDlg.ShowError('Barang Galon Tidak Ditemukan');
//          edtBrgGalong.SetFocus;
//          Exit;
//        end;
//      finally
//        Free;
//      end;
//    end;
  end;
  {
  FNewBarang.UpdateData(
  aAlias,
  aCatalog,
  aDefaultMarkUP,
  aExpireTime,
  aHeight,
  aIsActive,
  aIsBuild,
  aIsCS,
  aIsDecimal,
  aIsDeposit,
  aIsDiscGMC,
  aIsGalon,
  aIsPajakInclude,
  aIsStock,
  aIsValidate,
  aKategori_ID,
  aKode,
  aKodePurchase,
  aUOM,
  aLength,
  aMerk,
  aNama,
  aNewBarangPajak_ID,
  aNewLocation_Kode,
  aNewMerchadize_ID,
  aNewMerchandizeGroup_ID,
  aSalesOutlet_ID,
  aTipeBarangID,
  aUOMDiameter,
  aUOMVolume,
  aUOMWeight,
  aValidateUserID,
  aValidateUserUnit_ID,
  aWidth,
  aHargaAvg,
  edtBrgGalong.Text,
  sAuthorId,
  sPubsId,
  edtSSBARANG.Value,
  aIsActive
  );
  //cek merk sudah ada
  //jika tidak ada maka insert merk baru
  if not fMerk.LoadByMerk(cbbProductName.Text, DialogCompany) then
  begin
    fMerk.UpdateData(cbbProductName.Text, 0, cbbProductName.Text, DialogUnit, DialogCompany);
    if fMerk.SaveToDB then
    begin
      //bisa langsung di commit bs tidak 
    end
    else
    begin
      cRollbackTrans;
      CommonDlg.ShowError('Merk belum terdaftar');
      exit;
    end;      
  end;   

   }
  Result := SaveProductExec;


end;

procedure TfrmDialogProduct.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin

  FxGen := 0;
  if not IsMerGroupValidLokal then
  begin
    Exit;
  end;
  
  if (FormMode = fmAdd) then
  begin
    KodeLama := '';
    FIsProcessSuccessfull := SaveProduct;
    if FIsProcessSuccessfull then
      Close;
  end
  else
  begin
//    KodeLama := FNewBarang.Kode;
    FIsProcessSuccessfull := SaveProduct;
    if FIsProcessSuccessfull then
      Close;
  end; // end if
end;



procedure TfrmDialogProduct.PrepareAdd;
begin
  KodeLama := '';

  intedtCommonAllocation.Value:= 100;
  intedtAsgrossAllocation.Value:= 0;
  intedtTraderAllocation.Value:= 0;

  edtProductCode.Text := GeneratePLU;
  edtPLUPurchase.Text := edtProductCode.Text;

  cbIsTaxInclude.Checked  := True;
  cbActive.Checked        := True;
  chkIsBasic.Checked      := True;
  chkIsDiscAMC.Checked    := True;

end;

procedure TfrmDialogProduct.PrepareEdit;
var
  sUOMLastPurchase: string;
  dLastPurchase: Double;

begin
 {if FNewBarang.LoadByKode(frmProduct.cbpProductCode.Text) then
 begin
   KodeLama := FNewBarang.Kode;



   edtProductCode.Text := FNewBarang.Kode;
   cbbProductName.Text := FNewBarang.Merk;
   edtBrandName.Text := FNewBarang.Nama;
   edtShortName.Text := FNewBarang.Alias;
   SetcbpStok(FNewBarang.IsStock);
   cSetItemAtComboObject(cbpProductType,FNewBarang.TipeBarangID);
   cSetItemAtComboObjectCode(cbpUOMStok, FNewBarang.KodeSatuanStock.UOM);
   cSetItemAtComboObject(cbpOutlet, FNewBarang.SalesOutlet.ID);
   cSetItemAtComboObjectCode(cbpLocation, FNewBarang.NewLocation.Kode);
   cSetItemAtComboObject(cbpMerchan, FNewBarang.NewMerchadize.ID);
   cbpMerchanChange(nil);

   cSetItemAtComboObject(cbpMerchanGrup, FNewBarang.NewMerchandizeGroup.ID);
   cbpMerchanGrupChange(nil);

   cSetItemAtComboObject(cbpSubGroup,FNewBarang.Kategori.SubGroup.ID);
   cbpSubGroupChange(nil);

   cSetItemAtComboObject(cbpKategori,FNewBarang.Kategori.ID);

   cSetItemAtComboObject(cbpTax, FNewBarang.NewPajak.ID);

   setCheckBox(cbTurunan, FNewBarang.IsBuild);
   setCheckBox(cbActive,FNewBarang.IsActive);
   setCheckBox(cbisDecimal, FNewBarang.IsDecimal);
   setCheckBox(cbIsTaxInclude, FNewBarang.IsPajakInclude);
   setCheckBox(cbisDeposit, FNewBarang.IsDeposit);
   setCheckBox(chkIsGalon, FNewBarang.IsGalon);
   setCheckBox(chkIsDiscAMC, FNewBarang.IsDiscGMC);
   setCheckBox(chkIsBasic,FNewBarang.IsBasic);

   if FNewBarang.IsGalon = 1 then
   begin
     edtBrgGalong.Text := FNewBarang.BarangGalon.Kode;
     edtBrgNamaGalon.Text := FNewBarang.BarangGalon.Nama;
   end;

   edtCatalog.Text := FNewBarang.Catalog;
   edtPLUPurchase.Text := FNewBarang.KodePurchase;
   edtPLUPurchaseExit(nil);


   edtAverageSls.Value := FNewBarang.GetPKMAVG;
   edtAverageSlsUOM.Text := FNewBarang.KodeSatuanStock.UOM;

   FNewBarang.GetLastPurchasePrice(dLastPurchase, sUOMLastPurchase);
   jvcuredtLastCost.Value := dLastPurchase;
   edtLastCOGSUOM.Text     := sUOMLastPurchase;

   cbpSubGroupChange(cbpSubGroup);
   edtSSBARANG.Value := FNewBarang.SafetyStock;

   edtAuthorId.Text     := FNewBarang.Author.ID;
   edtAuthorNm.Text     := FNewBarang.Author.Nama;
   edtPubsID.Text       := FNewBarang.Pubs.ID;
   edtPubsNm.Text       := FNewBarang.Pubs.PublisherNm;

 end;
   }

end;

procedure TfrmDialogProduct.FormShow(Sender: TObject);
begin
  inherited;
  cbActive.Enabled  := actPluIsActive.Enabled;      
  
  FTmpPajakCode := Trim(cbpTax.Text);
  LoadListCbpProductType;
  LoadListCbpUOMStok;
  LoadListCbpOutLet;
  LoadListCbpLocation;
  LoadListCbpTax;

  LoadListCbpMerchan;
   ParseComboMerk(cbbProductName, cbbProductName.Text);

  edtPLUPurchase.Text := edtProductCode.Text;
  if FormMode=fmAdd then
    PrepareAdd
  else
  begin
    PrepareEdit;
  end;
  edtProductCode.SetFocus;
  chkIsGalonClick(Sender);

  if (FormMode = fmEdit) and (FLoginIsStore = 1) then
    SetIFStore;
end;

procedure TfrmDialogProduct.cbpUOMStockChange(Sender: TObject);
begin
  inherited;
  edtAverageSlsUOM.Text:=cbpUOMStok.Text;
  edtCommonUOM.Text:=cbpUOMStok.Text;
  edtAsgrossUOM.Text:=cbpUOMStok.Text;
  edtTraderUOM.Text:=cbpUOMStok.Text;
  edtLastCOGSUOM.Text:=cbpUOMStok.Text;
end;

function TfrmDialogProduct.CekTotalAllocation: Boolean;
var TotalAllocation: Integer;
begin
  TotalAllocation:= intedtCommonAllocation.EditValue+
                    intedtAsgrossAllocation.EditValue+
                    intedtTraderAllocation.EditValue;
  if TotalAllocation <> 100 then
    Result:=False
  else
    Result:=True;
end;

procedure TfrmDialogProduct.intedtCommonAllocationExit(Sender: TObject);
begin
  inherited;
  if not CekTotalAllocation then
  begin
    intedtCommonAllocation.Style.Font.Color:= clRed;
    intedtAsgrossAllocation.Style.Font.Color:= clRed;
    intedtTraderAllocation.Style.Font.Color:= clRed;
  end
  else
  begin
    intedtCommonAllocation.Style.Font.Color:= clBlack;
    intedtAsgrossAllocation.Style.Font.Color:= clBlack;
    intedtTraderAllocation.Style.Font.Color:= clBlack;
  end;
end;

procedure TfrmDialogProduct.edtProductCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    edtProductCode.Text := TAppUtils.StrPadLeft(edtProductCode.Text,igProd_Code_Length,'0');
    cbbProductName.SetFocus;
    cbbProductName.SelectAll;
  end;
end;

procedure TfrmDialogProduct.edtProductNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := UpCase(Key);  
end;

procedure TfrmDialogProduct.edtShortNameKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (Key = Chr(VK_RETURN)) then
  begin
    cbpStok.SetFocus;
    cbpStok.SelectAll;
  end;
end;

procedure TfrmDialogProduct.edtBrandNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    edtShortName.SetFocus;
    edtShortName.SelectAll;
    edtBrandNameExit(Sender);
  end;
end;


procedure TfrmDialogProduct.edtCatalogKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = chr(VK_RETURN)) then
  begin
    if (Trim(edtCatalog.Text) = '') then
      Exit;
//    if not assigned(Product) then
//      Product := TProduct.Create;
//    if (Product.IsCatalogExist(edtCatalog.Text,DialogUnit)) then
//    begin
//      CommonDlg.ShowError('Catalog is exist. Please insert a new catalog!.');
//      edtCatalog.SetFocus;
//      edtCatalog.SelectAll;
//    end
//    else
//    begin
//      edtPLUPurchase.SetFocus;
//      edtPLUPurchase.SelectAll;
//    end;
  end;
end;

procedure TfrmDialogProduct.cbTurunanKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = chr(VK_RETURN)) then
    cbActive.SetFocus;
end;

procedure TfrmDialogProduct.cbActiveKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = chr(VK_RETURN)) then
    cbisDecimal.SetFocus;
end;

procedure TfrmDialogProduct.cbisDecimalKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = chr(VK_RETURN)) then
    cbIsTaxInclude.SetFocus;
end;

procedure TfrmDialogProduct.cbIsTaxIncludeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = chr(VK_RETURN)) then
  begin
    chkIsBasic.SetFocus;
  end;
end;

procedure TfrmDialogProduct.cbpSubGroupChange(Sender: TObject);
begin
  inherited;
  if cbpSubGroup.Items.Count > 0 then
  begin
//    LoadListCBpKategori(cGetIDfromCombo(cbpSubGroup));
//    LoadDataSS(cGetIDfromCombo(cbpSubGroup), DialogUnit);
  end;
end;



procedure TfrmDialogProduct.edtBrandNameExit(Sender: TObject);
var i: Integer;
    iSpace, iAllSpaceCount, iCount : Byte;
begin
  inherited;
  iSpace := 0;
  iAllSpaceCount := 0;
  iCount := 0;
  edtBrandName.Text := trim(edtBrandName.Text);
  edtShortName.Text := '';

  for i:=1 to length(edtBrandName.Text) do
  begin
    if edtBrandName.Text[i] = ' ' then
      iAllSpaceCount := iAllSpaceCount+1;
  end;

  if iAllSpaceCount > 2 then iAllSpaceCount:=2;

  for i:=1 to length(edtBrandName.Text) do
  begin
    if length(edtShortName.Text) >20 then
      exit;
      
    if iSpace < iAllSpaceCount then
    begin
      if edtBrandName.Text[i] = ' ' then
      begin
        edtShortName.Text := edtShortName.Text + edtBrandName.Text[i];
        iSpace := iSpace+1;
        iCount := 0;
      end
      else if ((iCount<3) and (iSpace=0)) or ((iCount<4) and (iSpace=1)) then
      begin
        edtShortName.Text := edtShortName.Text + edtBrandName.Text[i];
        iCount := iCount +1;
      end;
    end
    else
    edtShortName.Text := edtShortName.Text + edtBrandName.Text[i];
  end;


end;

function TfrmDialogProduct.GeneratePLU: string;
var
//    objProduct: TProduct;
    data: TDataSet;
    _LastPLU, _LastPLUOriginal, _NewPLU: string;
    _IntPLU, _MaxIntPLU: Integer;
    //_D1, _D2, _D3, _D4, _D5, _D6: Integer;
begin
//  _MaxIntPLU := StrToIntDef(Copy('999999999', 1, igProd_Code_Length), 999999);
//  objProduct := TProduct.Create;
//  data := objProduct.GetLastPLU;
//  if not data.Eof then
//    _LastPLU := data.FieldByName('BRG_CODE').AsString
//  else
//    _LastPLU := StrPadLeft('1',igProd_Code_Length,'0'); //'000001';
//
//  _LastPLUOriginal := _LastPLU;
//
//  _IntPLU := StrToIntDef(_LastPLU,0);
//
//  if _IntPLU = _MaxIntPLU then
//    _IntPLU := 1
//  else
//    Inc(_IntPLU);
//  _LastPLU := StrPadLeft(IntToStr(_IntPLU), igProd_Code_Length, '0');
//
//  repeat
//    if not Product.GetPLUExist(_LastPLU) then
//    begin
//      _NewPLU := _LastPLU;
//      Break;
//    end;
//
//    // increment PLU lagi ... .
//    _IntPLU := StrToInt(_LastPLU);
//    if _IntPLU = _MaxIntPLU then
//      _IntPLU := 1
//    else
//      Inc(_IntPLU);
//    _LastPLU := StrPadLeft(IntToStr(_IntPLU), igProd_Code_Length, '0');
//  until (_LastPLU = _LastPLUOriginal);
//
//  FreeAndNil(objProduct);
//  if (_LastPLU = _LastPLUOriginal) then
//  begin
//    CommonDlg.ShowError('PLU is Exceeded.'+#13#13+'Please Contact Your System Admnistrator');
//    Result := '';
//    Exit;
//  end;
//
//  Result := _NewPLU;
end;

procedure TfrmDialogProduct.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = Ord('P')) and (ssCtrl in shift) then
  begin
    edtProductCode.Text := GeneratePLU;
  end;
end;


function TfrmDialogProduct.getHasilCheckBox(checkBox: TcxCheckBox): Integer;
begin
  //Result := 0;
  if checkBox.Checked = True then
    Result := 1
  else
    Result := 0;
end;

procedure TfrmDialogProduct.LoadListCbpLocation;
var
  sSQL: string;
begin
  sSQL := ' SELECT LOK_CODE, LOK_NAME '
          + ' FROM REF$LOKASI '
          + ' WHERE LOK_UNT_ID= ' + IntToStr(DialogUnit)
          + ' ORDER BY LOK_CODE ';
//  cQueryToComboObjectCode(cbpLocation,sSQL);
end;

procedure TfrmDialogProduct.LoadListCbpMerchan;
var
  sSQL: string;
begin
  sSQL := ' SELECT MERCHAN_ID,MERCHAN_NAME '
          + ' FROM REF$MERCHANDISE '
          + ' ORDER BY MERCHAN_CODE ';
//  cQueryToComboObject(cbpMerchan,sSQL);
  cbpMerchanChange(nil);
end;

procedure TfrmDialogProduct.LoadListCbpOutLet;
var
  SSQL: string;
begin
  SSQL := ' select OUTLET_ID, OUTLET_NAME '
          + ' from REF$OUTLET '
          + ' where OUTLET_UNT_ID= ' + IntToStr(DialogUnit)
          + ' order by OUTLET_CODE ' ;
//  cQueryToComboObject(cbpOutlet,SSQL);
end;

procedure TfrmDialogProduct.LoadListCbpProductType;
var
  ssQL: string;
begin
  ssQL := 'SELECT TPBRG_ID, TPBRG_NAME '
          + ' FROM REF$TIPE_BARANG '
          + ' ORDER BY TPBRG_CODE ' ;
//  cQueryToComboObject(cbpProductType,ssQL);
end;

procedure TfrmDialogProduct.LoadListCbpTax;
var
  sSQL: string;
begin
  sSQL := ' SELECT PJK_ID, PJK_NAME '
          + ' FROM REF$PAJAK '
          + ' ORDER BY PJK_CODE ';
//  cQueryToComboObject(cbpTax, sSQL);
end;

procedure TfrmDialogProduct.LoadListCbpUOMStok;
var
  sSQL: string;
begin
 sSQL := ' select SAT_CODE, SAT_NAME '
         + ' from REF$SATUAN '
         + ' order by SAT_NAME ';
// cQueryToComboObjectCode(cbpUOMStok,sSQL);
end;

procedure TfrmDialogProduct.cbpMerchanChange(Sender: TObject);
var
  iMerId: Integer;
begin
  inherited;
  if cbpMerchan.Items.Count > 0 then
  begin
//    iMerId  := cGetIDfromCombo(cbpMerchan);
    LoadListCBpMerchanGrup (iMerId);
    SetCbbTax(iMerId);
  end;

end;

procedure TfrmDialogProduct.LoadListCBpMerchanGrup(merchangrupID : Integer);
var
  sSQL: string;
begin

  sSQL := ' SELECT MERCHANGRUP_ID , MERCHANGRUP_NAME '
          + ' FROM REF$MERCHANDISE_GRUP '
          + ' where MERCHANGRUP_MERCHAN_ID = ' + IntToStr(merchangrupID)
          + ' ORDER BY MERCHANGRUP_CODE ';
//  cQueryToComboObject(cbpMerchanGrup,sSQL);
  cbpMerchanGrupChange(nil);
end;

procedure TfrmDialogProduct.cbpMerchanGrupChange(Sender: TObject);
begin
  inherited;
//  if cbpMerchanGrup.Items.Count > 0 then
//    LoadListCbpSubGroup(cGetIDfromCombo(cbpMerchanGrup));

end;

procedure TfrmDialogProduct.LoadListCBpKategori(iSubGrupID: Integer);
var
  sSQL: string;
begin

  sSQL := ' SELECT KAT_ID, KAT_NAME '
          + ' FROM REF$KATEGORI '
          + ' WHERE KAT_SUBGRUP_ID= ' + IntToStr(iSubGrupID);
//  cQueryToComboObject(cbpKategori,sSQL);

end;

procedure TfrmDialogProduct.LoadListCbpSubGroup(MerchangroupID: Integer);
var
  sSQL: string;
begin

  sSQL := ' SELECT SUBGRUP_ID, SUBGRUP_NAME '
          + ' FROM REF$SUB_GRUP '
          + ' WHERE SUBGRUP_MERCHANGRUP_ID = ' + IntToStr(MerchangroupID);
//  cQueryToComboObject(cbpSubGroup, sSQL);
  cbpSubGroupChange(nil);


end;

function TfrmDialogProduct.GetDataFromCbpStok(combo: TComboBox): Integer;
begin
  Result := 0 ;
  if combo.ItemIndex = 0 then
    Result := 1 // barang is stok
  else if combo.ItemIndex = 1 then
    Result := 0;
end;

procedure TfrmDialogProduct.FormCreate(Sender: TObject);
begin
  inherited;
//  FNewBarang := TNewBarang.Create(Self);
//  fMerk      := TMerk.CreateWithUser(Self, FLoginId);
  edtProductCode.MaxLength := igProd_Code_Length;
end;

procedure TfrmDialogProduct.edtPLUPurchaseKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sSQL: string;
begin
  inherited;
  if Key = VK_F5 then
  begin
    sSQL := ' select a.brg_code as Kode, a.brg_alias as Alias, b.sat_Code, b.sat_name as Nama'
          + ' from barang a, ref$satuan b '
          + ' where b.SAT_CODE = a.BRG_SAT_CODE_STOCK ';

//    with cLookUp('DAftara Barang', sSQL) do
//    begin
//      try
//        edtPLUPurchase.Text := Strings[0];
//      finally
//        Free;
//        edtProductPurchase.SetFocus;
//      end;
//    end;
  end;
end;

procedure TfrmDialogProduct.setCheckBox(checkBox: TcxCheckBox; Isi : Integer);
begin
  if Isi = 0 then
    checkBox.Checked := False
  else if Isi = 1 then
    checkBox.Checked := True;

end;

procedure TfrmDialogProduct.SetDataPLUPurchase;
var
  sSQL: string;
begin
   sSQL := ' select b.sat_Code as "Kode Barang", a.brg_alias as "Alias",  b.sat_name as "Satuan" '
          + ' from barang a, ref$satuan b '
          + ' where b.SAT_CODE = a.BRG_SAT_CODE_STOCK '
//          + ' and a.brg_code = ' + QuotedStr(FNewBarang.KodePurchase)
          ;

//  with cLookUp('Daftar Barang', sSQL) do
//  begin
//    try
//      edtProductPurchase.Text := Strings[0];
//      edtUOMPurchase.Text := Strings[1];
//      edtUOMName.Text := Strings[2];
//    finally
//      Free;
//    end;
//  end;
end;

procedure TfrmDialogProduct.edtPLUPurchaseExit(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := ' select a.brg_alias, b.sat_Code, b.sat_name '
          + ' from barang a, ref$satuan b '
          + ' where b.SAT_CODE = a.BRG_SAT_CODE_STOCK '
          + ' and a.brg_code = ' + QuotedStr(edtPLUPurchase.Text)
          ;
          
//  with cOpenQuery(sSQL) do
//  begin
//    try
//      if not FieldByName('brg_alias').IsNull then
//      begin
//      edtProductPurchase.Text := FieldByName('brg_alias').AsString;
//      edtUOMPurchase.Text := FieldByName('sat_Code').AsString;
//      edtUOMName.Text := FieldByName('sat_name').AsString;
//      end else begin
//        edtProductPurchase.Text := '';
//        edtUOMPurchase.Text := '';
//        edtUOMName.Text := '';
//      end;
//    finally
//      Free;
//    end;
//  end;
end;

procedure TfrmDialogProduct.SetcbpStok(isStok : Integer);
begin
  if isStok = 1 then
    cbpStok.ItemIndex := 0
  else if isStok = 0 then
    cbpStok.ItemIndex := 1;
end;

procedure TfrmDialogProduct.chkIsGalonClick(Sender: TObject);
begin
  inherited;
  edtBrgGalong.Enabled      := chkIsGalon.Checked;
  edtBrgNamaGalon.Enabled   := edtBrgGalong.Enabled;
end;

procedure TfrmDialogProduct.edtBrgGalongKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sTipeBarang: string;
  sSQL: string;
begin
  inherited;
  sTipeBarang := '0001';
  if Key = VK_F5 then
  begin
    sSQL := 'SELECT BRG_CODE, BRG_ALIAS '
          + ' FROM BARANG B,REF$TIPE_BARANG RTB '
          + ' WHERE B.BRG_TPBRG_ID = RTB.TPBRG_ID '
          + ' AND RTB.TPBRG_CODE = '+ QuotedStr(sTipeBarang);
//    with cLookUp('Daftar Barang', sSQL) do
//    begin
//      try
//        if Strings[0] = '' then
//          Exit;
//
//        edtBrgGalong.Text := Strings[0];
//        edtBrgNamaGalon.Text := Strings[1];
//
//      finally
//        Free;
//      end;
//    end;
  end;
end;

procedure TfrmDialogProduct.edtAuthorIdKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sSQL  : string;
begin
  inherited;
  if Key = vk_F5 then
  begin
    sSQL := 'SELECT ID, NAMA, TPTLHR AS "TEMPAT LAHIR", EMAIL, ALAMAT, KOTA,'
          + ' ALAMATKANTOR AS "ALAMAT KANTOR", NAMAPENA AS "NAMA PENA"'
          + ' FROM AUTHOR';

//    with cLookUp('Data Pengarang buku', sSQL) do
//    begin
//      try
//        if Strings[0] <> '' then
//        begin
//          edtAuthorId.Text  := Strings[0];
//          edtAuthorNm.Text  := Strings[1];
//        end;
//      finally
//        Free;
//      end;
//
//    end;

  end;

end;

procedure TfrmDialogProduct.edtPubsIDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sSql  : string;
begin

  inherited;
  if Key = vk_F5 then
  begin
    sSQL := 'SELECT PUBS_NO as "ID", PUBS_NAME as NAMA, PUBS_ADDRESS1 AS ALAMAT,'
          + ' PUBS_CITY AS KOTA, PUBS_COUNTRY AS NEGARA'
          + ' FROM PUBLISHER';

//    with cLookUp('Data Penerbit', sSQL) do
//    begin
//      try
//        if Strings[0] <> '' then
//        begin
//          edtPubsID.Text  := Strings[0];
//          edtPubsNm.Text  := Strings[1];
//        end;
//      finally
//        Free;
//      end;
//
//    end;

  end;

end;

procedure TfrmDialogProduct.LoadDataSS(aSubGroupID : Integer; aUntID : Integer);
var
  sSQL: string;
begin
  sSQL := 'select safetystock'
          + ' from REF$SUB_GRUP'
          + ' where subgrup_id = ' + IntToStr(aSubGroupID);

//  with cOpenQuery(sSQL) do
//  begin
//    try
//      while not Eof do
//      begin
//        edtSSSubGroup.Value := FieldByName('safetystock').AsFloat;
//        Next;
//      end;
//    finally
//      Free;
//    end;
//  end;

end;

procedure TfrmDialogProduct.chkIsBasicKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = chr(VK_RETURN)) then
  begin
    edtCatalog.SetFocus;
    edtCatalog.SelectAll;
  end;

end;

function TfrmDialogProduct.IsMerGroupValidLokal: Boolean;
begin
  Result := False;
//  with TKategori.Create(Self) do
//  begin
//    try
//      if cbpKategori.ItemIndex < 0 then
//      begin
//        CommonDlg.ShowError('Kategori Belum Diisi');
//        cbpKategori.SetFocus;
//        Exit;
//      end;
//
//      LoadByID(cGetIDfromCombo(cbpKategori));
//      if not IsMerGroupValid(edtProductCode.Text, SubGroup.Group.ID) then
//      begin
//        CommonDlg.ShowError('Barang Ini Sudah Punya Supplier' + #13
//                            + 'Merchandize Group Harus Sesuai Dengan Merchandize Group Supplier');
//        cbpMerchanGrup.SetFocus;
//        Exit;
//      end else
//        Result := True;
//    finally
//      Free;
//    end;
//  end;
end;

procedure TfrmDialogProduct.edtProductNameKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

  if (Key = VK_RETURN) then
  begin
    edtBrandName.SetFocus;
    edtBrandName.SelectAll;
  end;
end;

function TfrmDialogProduct.GetSQLMerk(aMerk: String =''): string;
begin
  aMerk := trim(aMerk);
  if aMerk = '' then
    aMerk := 'A%'
  else
    aMerk := aMerk + '%';
                                              
  Result := 'SELECT MERK_NAME FROM MERK'
        + ' WHERE MERK_COMP_ID = ' + IntToStr(DialogCompany);
end;

procedure TfrmDialogProduct.ParseComboMerk(aCombo : TComboBox; aText: String);
begin

  with aCombo do
  begin
    Items.Clear;
//    with cOpenQuery(GetSQLMerk(aText)) do
//    begin
//      try
//        if not IsEmpty then
//        begin
//          while not Eof do
//          begin
//            Items.Append(FieldByName('MERK_NAME').AsString);
//
//            Next;
//          end;
//        end
//        else
//        begin
//        end;
//        aCombo.SelText := aText;
//      finally
//        free;
//      end;
//    end;
  end;


end;

procedure TfrmDialogProduct.cbbProductNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

procedure TfrmDialogProduct.SetCbbTax(aMerchanID: Integer);
var
  sSQL: string;
begin
  sSQL := ' SELECT MERCHAN_PJK_ID '
          + ' FROM REF$MERCHANDISE '
          + ' WHERE MERCHAN_ID = '+ IntToStr(aMerchanID)
          + ' ORDER BY MERCHAN_CODE ';
//  with cOpenQuery(sSQL) do
//  begin
//    try
//      if not Fields[0].IsNull then
//      begin
//        cSetItemAtComboObject(cbpTax, Fields[0].AsInteger);
//      end
//      else
//        cbpTax.ItemIndex  := 0;
//
//    finally
//      Free;
//    end;
//  end;

end;

procedure TfrmDialogProduct.SetIFStore;
var
  aTSuiChk    : TcxCheckBox;
  aTjvFltEdt  : TcxCurrencyEdit;
  aTJvIntEdt  : TcxCurrencyEdit;
  aTJvCurrEdt : TcxCurrencyEdit;
  aTjvFltEdt2 : TcxCurrencyEdit;
  aTCombo     : TComboBox;
  aTedit      : TEdit;
  i           : Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if(Components[i] is TEdit) then
    begin
      aTedit          := (Components[i] as TEdit);
      aTedit.ReadOnly := True;
      aTedit.Color    := $00E7E7E7;
    end
    else if (Components[i] is TComboBox) then
    begin
      aTCombo         := (Components[i] as TComboBox);
      aTCombo.Enabled := False;
    end
    else if (Components[i] is TcxCurrencyEdit) then
    begin
      aTjvFltEdt2          := (Components[i] as TcxCurrencyEdit);
      aTjvFltEdt2.Properties.ReadOnly := True;
      aTjvFltEdt2.Style.Color    := $00E7E7E7;
    end
    else if (Components[i] is TcxCurrencyEdit) then
    begin
      aTJvCurrEdt           := (Components[i] as TcxCurrencyEdit);
      aTJvCurrEdt.Properties.ReadOnly  := True;
      aTJvCurrEdt.Style.Color    := $00E7E7E7;
    end
    else if (Components[i] is TcxCurrencyEdit) then
    begin
      aTJvIntEdt            := (Components[i] as TcxCurrencyEdit);
      aTJvIntEdt.Properties.ReadOnly   := True;
      aTJvIntEdt.Style.Color      := $00E7E7E7;
    end
    else if (Components[i] is TcxCurrencyEdit) then
    begin
      aTjvFltEdt           := (Components[i] as TcxCurrencyEdit);
      aTjvFltEdt.Properties.ReadOnly  := True;
      aTjvFltEdt.Style.Color      := $00E7E7E7;
    end
    else if (Components[i] is TcxCheckBox) then
    begin
      aTSuiChk          := (Components[i] as TcxCheckBox);
      aTSuiChk.Enabled  := False;
    end;

  end;
  edtSSBARANG.Properties.ReadOnly  := False;
  edtSSBARANG.Style.Color     := clWindow;

end;

function TfrmDialogProduct.SaveProductExec: Boolean;
var
  sPlu: string;
begin
  Result := False;

  Inc(FxGen);

  // akode lama di isi waktu save button di klik
//  try
//    FNewBarang.ExecuteGenerateSQL(KodeLama);
//    if FormMode = fmAdd then
//    begin
//      if simpanUOM(FNewBarang.KodeSatuanStock.UOM) then
//      begin
//        cCommitTrans;
//        Result  := True;
//      end;
//    end
//    else
//    begin
//      cCommitTrans;
//      Result  := True;
//    end;
//
//    if edtProductCode.Text <> FNewBarang.Kode then
//      CommonDlg.ShowMessage('Kode Plu '+ #13
//                        + edtProductCode.Text + ' menjadi '+ FNewBarang.Kode );
//
//  except
//    on E: EIBError do
//    begin
//      cRollbackTrans;
//
//      if e.IBErrorCode = 335544665 then   //err primary ato unique key
//      begin
//
//        if FxGen > iMaxGen then
//        begin
//          CommonDlg.ShowMessage('Pengisian data gagal');
//          exit;
//        end;
//
//        sPlu  := GeneratePLU;
//
//        FNewBarang.Kode         := sPlu;
//        FNewBarang.KodePurchase := sPlu;
//
//        //rekursif
//        Result := SaveProductExec;
//
//      end
//      else if e.IBErrorCode = 335544345 then //err lock conflict
//      begin
//        //wait 10 s until unlock
//        cShowWaitWindow('Transaction waiting in 10s');
//        Sleep(10000);
//        cCloseWaitWindow;
//        //rekursif
//        Result := SaveProductExec;
//      end
//      else
//        CommonDlg.ShowError('Error Number '+ IntToStr(e.IBErrorCode) + #13
//                           + ' Pengisian data gagal');
//
//    end;
//
//  end;
end;

end.
