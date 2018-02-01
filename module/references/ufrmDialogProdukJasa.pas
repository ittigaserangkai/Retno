unit ufrmDialogProdukJasa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uInterface, ufrmMasterDialog,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, Vcl.StdCtrls, uDXUtils, uDMClient, cxCurrencyEdit,
  uModProdukJasa, uAppUtils, uConstanta, uModBarang, uModRefPajak, uModRekening;

type
  TfrmDialogProdukJasa = class(TfrmMasterDialog, ICRUDAble)  // tambahkan , ICRUDAble yak nanti
    Panel1: TPanel;
    lblCode: TLabel;
    lblName: TLabel;
    lblOwner: TLabel;
    edtCode: TEdit;
    edtName: TEdit;
    edtOwner: TEdit;
    Panel2: TPanel;
    lblDefaultPrice: TLabel;
    lblTipeBarang: TLabel;
    chkBKP: TCheckBox;
    cxLookUpTipeBarang: TcxExtLookupComboBox;
    lblPajak: TLabel;
    cxLookUpPajak: TcxExtLookupComboBox;
    Panel3: TPanel;
    cxLookupRekCredit: TcxExtLookupComboBox;
    cxLookupRekDebet: TcxExtLookupComboBox;
    lblRekCredit: TLabel;
    lblRekDebet: TLabel;
    crDefaultPrice: TcxCurrencyEdit;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FModProdukJasa: TModProdukJasa;
    function GetModProdukJasa: TModProdukJasa;
    procedure InitLookup;
    procedure SimpanData;
    property ModProdukJasa: TModProdukJasa read GetModProdukJasa write
        FModProdukJasa;
    { Private declarations }
  public
    procedure LoadData(ID: String);
    { Public declarations }
  end;

var
  frmDialogProdukJasa: TfrmDialogProdukJasa;

implementation

{$R *.dfm}

procedure TfrmDialogProdukJasa.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm(CONF_VALIDATE_FOR_DELETE) then exit;
  Try
    DMCLient.CrudClient.DeleteFromDB(ModProdukJasa);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.ModalResult:=mrOk;
  except
    TAppUtils.Error(ER_DELETE_FAILED);
    raise;
  End;
end;

procedure TfrmDialogProdukJasa.actSaveExecute(Sender: TObject);
begin
  inherited;
  SimpanData
end;

procedure TfrmDialogProdukJasa.FormCreate(Sender: TObject);
begin
  inherited;
  InitLookup;
end;

function TfrmDialogProdukJasa.GetModProdukJasa: TModProdukJasa;
begin
  if not Assigned(FModProdukJasa) then
    FModProdukJasa := TModProdukJasa.Create;
  Result := FModProdukJasa;
end;

procedure TfrmDialogProdukJasa.InitLookup;
begin
  cxLookUpTipeBarang.LoadFromDS(
    DMClient.DSProviderClient.RefTipeBarang_GetDSLookup,
    {id field} 'REF$TIPE_BARANG_ID', {display field} 'TPBRG_NAME',
    ['REF$TIPE_BARANG_ID']{hidden field}, self
  );

  cxLookUpPajak.LoadFromDS(
    DMClient.DSProviderClient.RefPajak_GetDSLookup,
    {id field} 'Ref$Pajak_ID', {display field} 'PJK_NAME',
    ['Ref$Pajak_ID'] {hidden field},self
  );

  cxLookupRekDebet.LoadFromDS(
    DMClient.DSProviderClient.Rekening_GetDSLookup,
    {id field} 'REKENING_ID', {display field} 'REK_NAME',
    ['REKENING_ID', 'REF$GRUP_REKENING_ID'] {hidden field},self
  );
  cxLookupRekDebet.SetMultiPurposeLookup;      //biar bisa filter manual

  cxLookupRekCredit.LoadFromDS(
    DMClient.DSProviderClient.Rekening_GetDSLookup,
    {id field} 'REKENING_ID', {display field} 'REK_NAME',
    ['REKENING_ID', 'REF$GRUP_REKENING_ID'] {hidden field},self
  );
  cxLookupRekDebet.SetMultiPurposeLookup;      //biar bisa filter manual

end;

procedure TfrmDialogProdukJasa.LoadData(ID: String);
begin
  if Assigned(FModProdukJasa) then FreeAndNil(FModProdukJasa);
  FModProdukJasa := DMclient.CrudClient.Retrieve(TModProdukJasa.ClassName, ID) as TModProdukJasa;

  // 1
  edtCode.Text      := ModProdukJasa.PROJAS_CODE;
  edtName.Text      := ModProdukJasa.PROJAS_NAME;
  edtOwner.Text     := ModProdukJasa.PROJAS_OWNER;

  //2
  chkBKP.Checked := ModProdukJasa.PROJAS_IS_BKP = 1;
  crDefaultPrice.Value := ModProdukJasa.PROJAS_DEFAULT_PRICE;
  cxLookUpTipeBarang.EditValue := ModProdukJasa.TIPE_BARANG.ID;
  cxLookUpPajak.EditValue := ModProdukJasa.PAJAK.ID;

  //3
  cxLookupRekDebet.EditValue := ModProdukJasa.REKENING_ID_DEBET.ID;
  cxLookupRekCredit.EditValue := ModProdukJasa.REKENING_ID_CREDIT.ID;
end;

procedure TfrmDialogProdukJasa.SimpanData;
begin
  if not ValidateEmptyCtrl([1], True) then exit;

  // 1
  ModProdukJasa.PROJAS_CODE  := edtCode.Text;
  ModProdukJasa.PROJAS_NAME  := edtName.Text;
  ModProdukJasa.PROJAS_OWNER := edtOwner.Text;

  //2
  if chkBKP.Checked then
    ModProdukJasa.PROJAS_IS_BKP := 1
  else
    ModProdukJasa.PROJAS_IS_BKP := 0;

  ModProdukJasa.PROJAS_DEFAULT_PRICE := crDefaultPrice.Value;
  ModProdukJasa.TIPE_BARANG := TModTipeBarang.CreateID(cxLookUpTipeBarang.EditValue);
  ModProdukJasa.PAJAK := TModRefPajak.CreateID(cxLookUpPajak.EditValue);

  //3
  ModProdukJasa.REKENING_ID_DEBET  := TModRekening.CreateID(cxLookupRekDebet.EditValue);
  ModProdukJasa.REKENING_ID_CREDIT := TModRekening.CreateID(cxLookupRekCredit.EditValue);


  try
    DMClient.CrudClient.SaveToDB(ModProdukJasa);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    self.ModalResult:=mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  end;

end;

end.
