unit ufrmDialogPersonalMember;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCurrencyEdit, Vcl.StdCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, ufraFooterDialog3Button, DB, System.Actions, Vcl.ActnList,
  uClientClasses, uModMember, uDBUtils, uDMClient, uInterface, uAppUtils,
  cxSpinEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  Datasnap.DBClient, uDXUtils;

type
  TModul = (mPopUpPersonalMember, mDialogMemberShip);
  
  TfrmDialogPersonalMember = class(TfrmMasterDialog, iCrudable)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    dtLahir: TcxDateEdit;
    edtTempatLhr: TEdit;
    edtNoIdentts: TEdit;
    edtAlamat: TEdit;
    edtRt: TEdit;
    edtKecamatan: TEdit;
    edtRw: TEdit;
    edtKota: TEdit;
    edtPostCode: TEdit;
    edtTelp: TEdit;
    pnl3: TPanel;
    lbl4: TLabel;
    lbl5: TLabel;
    edtName: TEdit;
    edtCardNo: TEdit;
    cbbGender: TComboBox;
    cbbWarganegara: TComboBox;
    cbbStatus: TComboBox;
    edtPndptn: TcxCurrencyEdit;
    edtJmlTanggungan: TcxSpinEdit;
    cbpAgama: TcxExtLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    cbpTipeBayar: TcxExtLookupComboBox;
    Label3: TLabel;
    edtTOP: TcxSpinEdit;
    cbpKelompok: TComboBox;
    Label4: TLabel;
    edtLeadTime: TcxSpinEdit;
    Label5: TLabel;
    edtPlafon: TcxCurrencyEdit;
    Label6: TLabel;
    cbpMember: TcxExtLookupComboBox;
    cbpKelurahan: TcxExtLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure cbpKelurahanPropertiesEditValueChanged(Sender: TObject);
  private
    FCrud: TCrudClient;
    FModMember: TModMember;
    FCDSAgama: tclientDataset;
    FCDSTipeBayar: tclientDataset;
    FCDSTipeMember: tclientDataset;
    FDsProvider: TDSProviderClient;
    procedure ClearForm;
    function GetCDSAgama: tclientDataset;
    function GetCDSTipeBayar: tclientDataset;
    function GetCDSTipeMember: tclientDataset;
    function GetCrud: TCrudClient;
    function GetDsProvider: TDSProviderClient;
    function GetModMember: TModMember;
    procedure SimpanData;
    property CDSAgama: tclientDataset read GetCDSAgama write FCDSAgama;
    property CDSTipeBayar: tclientDataset read GetCDSTipeBayar write FCDSTipeBayar;
    property CDSTipeMember: tclientDataset read GetCDSTipeMember write
        FCDSTipeMember;
    property Crud: TCrudClient read GetCrud write FCrud;
    property DsProvider: TDSProviderClient read GetDsProvider write FDsProvider;
    property ModMember: TModMember read GetModMember write FModMember;
  public
    procedure LoadData(AID: String);
  published
  end;

var
  frmDialogPersonalMember: TfrmDialogPersonalMember;

implementation

uses uTSCommonDlg, uConstanta, ufrmDialogMemberShip, uRetnoUnit,
  uModRefAgama;

{$R *.dfm}

procedure TfrmDialogPersonalMember.FormCreate(Sender: TObject);
var dsAgama : TDataSet;
begin
  inherited;
  cbpAgama.Properties.LoadFromCDS(CDSAgama,'REF$AGAMA_ID', 'AGAMA_NAME', ['REF$AGAMA_ID'] , self);
  cbpMember.Properties.LoadFromCDS(CDSTipeMember,'REF$TIPE_MEMBER_ID', 'TPMEMBER_NAME', ['REF$TIPE_MEMBER_ID'] , self);
  cbpTipeBayar.Properties.LoadFromCDS(CDSTipeBayar,'REF$TIPE_PEMBAYARAN_ID', 'TPBYR_NAME', ['REF$TIPE_PEMBAYARAN_ID'] , self);
  cbpKelurahan.LoadFromDS(DMClient.DSProviderClient.RefWilayah_GetDSLookup,
    'REF$WILAYAH_ID','KELURAHAN',['REF$WILAYAH_ID'], SELF);
  cbpKelurahan.SetMultiPurposeLookup;
  ClearForm;
  Self.AssignKeyDownEvent;
end;

procedure TfrmDialogPersonalMember.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.ConfirmHapus then Exit;
  Try
    DMClient.CrudClient.DeleteFromDB(ModMember);
    Self.ModalResult := mrOK;
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
  Except
    TAppUtils.Error(ER_DELETE_FAILED);
    Raise
  End;
end;

procedure TfrmDialogPersonalMember.actSaveExecute(Sender: TObject);
begin
  inherited;
  SimpanData;
end;

procedure TfrmDialogPersonalMember.cbpKelurahanPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  edtKecamatan.Text             := cbpKelurahan.DS.FieldByName('kecamatan').AsString;
  edtKota.Text                  := cbpKelurahan.DS.FieldByName('kabupaten').AsString;
  edtPostCode.Text              := cbpKelurahan.DS.FieldByName('kodepos').AsString;
end;

procedure TfrmDialogPersonalMember.ClearForm;
begin
  ClearbyTag([0,1]);
  cbpAgama.SetDefaultValue;
  cbpKelompok.ItemIndex := 0;
  cbpMember.SetDefaultValue;
  cbpTipeBayar.SetDefaultValue;
end;

function TfrmDialogPersonalMember.GetCDSAgama: tclientDataset;
begin
  if not assigned(FCDSAgama) then
    FCDSAgama := Tdbutils.DSToCDS(DsProvider.Agama_GetDSLookup, self);
    Result := FCDSAgama;
end;

function TfrmDialogPersonalMember.GetCDSTipeBayar: tclientDataset;
begin
  if not assigned(FCDSTipeBayar) then
  Begin
    FCDSTipeBayar := Tdbutils.DSToCDS(DsProvider.TipePembayaran_GetDSOverview, self);
    FCDSTipeBayar.IndexFieldNames := 'TPBYR_CODE';
    FCDSTipeBayar.First;
  End;
  Result := FCDSTipeBayar;
end;

function TfrmDialogPersonalMember.GetCDSTipeMember: tclientDataset;
begin
  if not assigned(FCDSTipeMember) then
    FCDSTipeMember := Tdbutils.DSToCDS(DsProvider.RefTipeMember_GetDSLookup, self);
  Result := FCDSTipeMember;
end;

function TfrmDialogPersonalMember.GetCrud: TCrudClient;
begin
  if not Assigned(FCrud) then
    fCrud := TCrudClient.Create(DMClient.RestConn, FALSE);
  Result := FCrud;
end;

function TfrmDialogPersonalMember.GetDsProvider: TDSProviderClient;
begin
  if not assigned(FDsProvider) then
    FDsProvider := TDSProviderClient.Create(DmClient.RestConn,False);
  Result := FDsProvider;
end;

function TfrmDialogPersonalMember.GetModMember: TModMember;
begin
  Result := FModMember;
end;

procedure TfrmDialogPersonalMember.LoadData(AID: String);
begin
  if Assigned(FModMember) then FreeAndNil(FModMember);
  FModMember := Crud.Retrieve(TModMember.ClassName, AID) as TModMember;

  edtName.Text                 := ModMember.MEMBER_NAME;
  edtCardNo.Text               := ModMember.MEMBER_CARD_NO;
  cbbWarganegara.ItemIndex     := ModMember.MEMBER_IS_WNI;
  edtTempatLhr.Text            := ModMember.MEMBER_PLACE_OF_BIRTH;
  dtLahir.Date                 := ModMember.MEMBER_DATE_OF_BIRTH;
  edtNoIdentts.Text            := ModMember.MEMBER_KTP_NO;
  cbbGender.ItemIndex          := ModMember.MEMBER_SEX;
  cbpAgama.EditValue           := ModMember.MEMBER_AGAMA.ID;
  edtAlamat.Text               := ModMember.MEMBER_ADDRESS;
  edtRt.Text                   := ModMember.MEMBER_RT;
  edtRw.Text                   := ModMember.MEMBER_RW;
  cbpKelurahan.Text            := ModMember.MEMBER_KELURAHAN;
  edtKecamatan.Text            := ModMember.MEMBER_KECAMATAN;
  edtKota.Text                 := ModMember.MEMBER_KOTA;
  edtPostCode.Text             := ModMember.MEMBER_POST_CODE;
  edtTelp.Text                 := ModMember.MEMBER_TELP;
  cbbStatus.ItemIndex          := ModMember.MEMBER_IS_MARRIED;
  edtJmlTanggungan.Value       := ModMember.MEMBER_JML_TANGGUNGAN;
  edtPndptn.Value              := ModMember.MEMBER_PENDAPATAN;
  cbpKelompok.ItemIndex        := ModMember.IS_TRADER;
  cbpMember.EditValue          := ModMember.RefTipeMember.ID;
  cbpTipeBayar.EditValue       := ModMember.MEMBER_TIPE_BAYAR.ID;
  edtTOP.Value                 := ModMember.MEMBER_TOP;
  edtLeadTime.Value            := ModMember.MEMBER_LEAD_TIME;
  edtPlafon.Value              := ModMember.MEMBER_PLAFON;
end;

procedure TfrmDialogPersonalMember.SimpanData;
begin
  ModMember.MEMBER_NAME                     := edtName.Text;
  ModMember.MEMBER_CARD_NO                  := edtCardNo.Text;
  ModMember.MEMBER_IS_WNI                   := cbbWarganegara.ItemIndex;
  ModMember.MEMBER_PLACE_OF_BIRTH           := edtTempatLhr.Text;
  ModMember.MEMBER_DATE_OF_BIRTH            := dtLahir.Date;
  ModMember.MEMBER_KTP_NO                   := edtNoIdentts.Text;
  ModMember.MEMBER_SEX                      := cbbGender.ItemIndex;
  ModMember.MEMBER_AGAMA                    := TModRefAgama.CreateID(cbpAgama.EditValue);
  ModMember.MEMBER_ADDRESS                  := edtAlamat.Text;
  ModMember.MEMBER_RT                       := edtRt.Text;
  ModMember.MEMBER_RW                       := edtRw.Text;
  ModMember.MEMBER_KELURAHAN                := cbpKelurahan.Text;
  ModMember.MEMBER_KECAMATAN                := edtKecamatan.Text;
  ModMember.MEMBER_KOTA                     := edtKota.Text;
  ModMember.MEMBER_POST_CODE                := edtPostCode.Text;
  ModMember.MEMBER_TELP                     := edtTelp.Text;
  ModMember.MEMBER_IS_MARRIED               := cbbStatus.ItemIndex;
  ModMember.MEMBER_JML_TANGGUNGAN           := edtJmlTanggungan.Value;
  ModMember.MEMBER_PENDAPATAN               := edtPndptn.Value;
  ModMember.IS_TRADER                       := cbpKelompok.ItemIndex;
  ModMember.RefTipeMember.ID                := cbpMember.EditValue;
  ModMember.MEMBER_TIPE_BAYAR.ID            := cbpTipeBayar.EditValue;
  ModMember.MEMBER_TOP                      := edtTOP.Value;
  ModMember.MEMBER_LEAD_TIME                := edtLeadTime.Value;
  ModMember.MEMBER_PLAFON                   := edtPlafon.Value;

  try
    Crud.SaveToDB(ModMember);
    TAppUtils.Information('Simpan Berhasil.');
    Self.ModalResult := mrOK;
  except
    TAppUtils.Error('Gagal Menyimpan Data.');
    Raise
  end;
end;

end.


