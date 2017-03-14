unit ufrmDialogProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls,
  StdCtrls, uConn, uRetnoUnit, ActnList, System.Actions, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxCurrencyEdit, cxCheckBox, ufraFooterDialog3Button, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  cxSpinEdit, cxGroupBox, uModBank, uModBarang;

type
  TFormMode = (fmAdd, fmEdit);


  TfrmDialogProduct = class(TfrmMasterDialog)
    lbProductCode: TLabel;
    lbShortname: TLabel;
    lbProductname: TLabel;
    lbStockCS: TLabel;
    lbProductType: TLabel;
    lbUOMStock: TLabel;
    lbOutlet: TLabel;
    edtShortName: TcxTextEdit;
    edtProductName: TcxTextEdit;
    lbCatalog: TLabel;
    edtCatalog: TcxTextEdit;
    lbGroup: TLabel;
    lbDivision: TLabel;
    lbRefPajak: TLabel;
    lbLocation: TLabel;
    lbCategory: TLabel;
    lbSubCategory: TLabel;
    intedtCommonAllocation: TcxCurrencyEdit;
    lbAlloc1: TLabel;
    edtCommonUOM: TcxTextEdit;
    edtAsgrossUOM: TcxTextEdit;
    intedtAsgrossAllocation: TcxCurrencyEdit;
    lbAlloc2: TLabel;
    lbAlloc3: TLabel;
    intedtTraderAllocation: TcxCurrencyEdit;
    edtTraderUOM: TcxTextEdit;
    cbStock: TcxComboBox;
    cxLookupTipeBarang: TcxExtLookupComboBox;
    cxLookupSatuan: TcxExtLookupComboBox;
    cxLookupOutlet: TcxExtLookupComboBox;
    cxLookupLocation: TcxExtLookupComboBox;
    cxLookupJenisPajak: TcxExtLookupComboBox;
    cxLookupMerchan: TcxExtLookupComboBox;
    cxLookupMerchanGroup: TcxExtLookupComboBox;
    cxLookupSubGroup: TcxExtLookupComboBox;
    cxLookupKategori: TcxExtLookupComboBox;
    lbProductGallon: TLabel;
    edtBrgGalong: TcxTextEdit;
    edtBrgNamaGalon: TcxTextEdit;
    lbSafetyStock: TLabel;
    lbl9: TLabel;
    cxLookupMerk: TcxExtLookupComboBox;
    lbHari: TLabel;
    edtProductCode: TcxTextEdit;
    gbPurchase: TcxGroupBox;
    lbPLUPurchase: TLabel;
    edtPLUPurchase: TcxTextEdit;
    edtProductPurchase: TcxTextEdit;
    cxExtLookupComboBox1: TcxExtLookupComboBox;
    lbUOMPurchase: TLabel;
    cxGroupBox2: TcxGroupBox;
    lbPKMAvg: TLabel;
    lbLastCost: TLabel;
    jvcuredtLastCost: TcxCurrencyEdit;
    edtAverageSls: TcxCurrencyEdit;
    edtAverageSlsUOM: TcxTextEdit;
    edtLastCOGSUOM: TcxTextEdit;
    lbl41: TLabel;
    gbOption: TcxGroupBox;
    cbTurunan: TcxCheckBox;
    cbActive: TcxCheckBox;
    cbisDecimal: TcxCheckBox;
    cbIsTaxInclude: TcxCheckBox;
    cbisDeposit: TcxCheckBox;
    chkIsDiscAMC: TcxCheckBox;
    chkIsBasic: TcxCheckBox;
    chkIsGalon: TcxCheckBox;
    edtSSBARANG: TcxSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxLookupMerchanPropertiesEditValueChanged(Sender: TObject);
  private
    FModBarang: TModBarang;
    procedure InitLookup;
    procedure UpdateData;
    function ValidateData: Boolean;
    property ModBarang: TModBarang read FModBarang write FModBarang;
  public
    { Public declarations }
  published
  end;

var
  frmDialogProduct: TfrmDialogProduct;

implementation

uses
  uDXUtils, uDMClient,  uModSatuan, uAppUtils, uConstanta;

{$R *.dfm}

procedure TfrmDialogProduct.cxLookupMerchanPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
//  Showmessage(cxLookupMerchan.EditValue);
end;

procedure TfrmDialogProduct.FormCreate(Sender: TObject);
begin
  inherited;
  AssignKeyDownEvent;
  InitLookup;
  ClearByTag([0]);
end;

procedure TfrmDialogProduct.FormShow(Sender: TObject);
begin
  inherited;
  edtProductCode.SetFocus;
end;

procedure TfrmDialogProduct.InitLookup;
begin
  With DMClient.DSProviderClient do
  begin
    cxLookupTipeBarang.LoadFromDS(RefTipeBarang_GetDSLookup,
      'REF$TIPE_BARANG_ID', 'TPBRG_NAME', ['REF$TIPE_BARANG_ID'], Self );
    cxLookupSatuan.LoadFromDS(Satuan_GetDSLookup,
      'SAT_CODE', 'SAT_NAME', [], Self);
    cxLookupOutlet.LoadFromDS(Outlet_GetDSLookup,
      'REF$OUTLET_ID', 'OUTLET_NAME', ['REF$OUTLET_ID'], Self);
    cxLookupMerchan.LoadFromDS(Merchandise_GetDSLookup,
      'REF$MERCHANDISE_ID','MERCHAN_NAME' ,['REF$MERCHANDISE_ID'], Self);
    cxLookupMerchanGroup.LoadFromDS(MerchandiseGroup_GetDSLookup,
      'REF$MERCHANDISE_GRUP_ID','MERCHANGRUP_NAME' ,
      ['REF$MERCHANDISE_GRUP_ID','REF$MERCHANDISE_ID'], Self);
    cxLookupSubGroup.LoadFromDS(SubGroup_GetDSLookup,
      'REF$SUB_GRUP_ID','SUBGRUP_NAME' ,
      ['REF$MERCHANDISE_GRUP_ID','REF$SUB_GRUP_ID'], Self);
    cxLookupKategori.LoadFromDS(Kategori_GetDSLookup,
      'REF$KATEGORI_ID','KAT_NAME' ,
      ['REF$KATEGORI_ID','REF$SUB_GRUP_ID'], Self);
    cxLookupLocation.LoadFromDS(Lokasi_GetDSLookup,
      'LOK_CODE', 'LOK_NAME', [], Self);
    cxLookupJenisPajak.LoadFromDS(RefPajak_GetDSLookup,
      'REF$PAJAK_ID', 'PJK_NAME' , ['REF$PAJAK_ID'], Self);
    cxLookupMerk.LoadFromDS(Merk_GetDSLookUp,
      'MERK_ID', 'MERK_NAME' , ['MERK_ID'], Self);
  end;
end;

procedure TfrmDialogProduct.UpdateData;
begin
  ModBarang.BRG_CODE := edtProductCode.Text;
  ModBarang.BRG_NAME := edtProductName.Text;
end;

function TfrmDialogProduct.ValidateData: Boolean;
begin
  Result := False;
  if not TAppUtils.Confirm(CONF_VALIDATE_FOR_SAVE) then
    exit;
  Result := True;
end;


end.
