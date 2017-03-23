unit ufrmDialogUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ExtCtrls, StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxButtonEdit, System.Actions, Vcl.ActnList,
  ufraFooterDialog3Button, Vcl.ComCtrls, dxCore, cxDateUtils, cxDropDownEdit,
  cxCalendar, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  Datasnap.DBClient,uModUnit, uInterface,uModCompany, uAppUtils,uModPropinsi,
  uModTipePerusahaan;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogUnit = class(TfrmMasterDialog, ICRUDAble)
    lblCode: TLabel;
    lblName: TLabel;
    lblDescription: TLabel;
    lblAddress: TLabel;
    lblAppType: TLabel;
    Label5: TLabel;
    lblRegion: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    lblNPWP: TLabel;
    lblNPWPName: TLabel;
    lblNPWPAddress: TLabel;
    lblNPWPRegDate: TLabel;
    rgTipeUnit: TRadioGroup;
    grpAuthority: TGroupBox;
    chkAllowPO: TCheckBox;
    chkAllowGR: TCheckBox;
    chkActive: TCheckBox;
    edCode: TcxTextEdit;
    edNama: TcxTextEdit;
    edDesciption: TcxTextEdit;
    edAddress: TcxTextEdit;
    edRegisterNPWP: TcxDateEdit;
    cbbAppType: TcxExtLookupComboBox;
    cbbCompany: TcxExtLookupComboBox;
    cbbCorporateType: TcxExtLookupComboBox;
    cbbParentUnit: TcxExtLookupComboBox;
    edContactPerson: TcxTextEdit;
    edEmail: TcxTextEdit;
    edRegion: TcxTextEdit;
    edPhone: TcxTextEdit;
    edFax: TcxTextEdit;
    edZIP: TcxTextEdit;
    cbbPropinsi: TcxExtLookupComboBox;
    cbbKabupaten: TcxExtLookupComboBox;
    edNPWPAddress: TcxTextEdit;
    edNPWPName: TcxTextEdit;
    edNPWP: TcxTextEdit;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure cbbTypeUnitRChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtUnitAppIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtUnitCompIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtUntInfoCompTypeIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtUnitRegnIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtUnitPropIdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtUnitKabIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtUnitAppIDKeyPress(Sender: TObject; var Key: Char);
    procedure edtUnitTypeIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtUnitCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtUntInfoNpwpRegsDKeyPress(Sender: TObject; var Key: Char);
    procedure edtUntInfoNpwpRegsMKeyPress(Sender: TObject; var Key: Char);
    procedure edtUntInfoNpwpRegsYKeyPress(Sender: TObject; var Key: Char);
    procedure edtUnitRegnIDKeyPress(Sender: TObject; var Key: Char);
    procedure chkActiveClick(Sender: TObject);
    procedure edtUnitRegnIDClickBtn(Sender: TObject);
    procedure edtUnitTypeIDClickBtn(Sender: TObject);
    procedure edtUnitPropIdClickBtn(Sender: TObject);
    procedure edtUnitKabIDClickBtn(Sender: TObject);
    procedure edtUnitParentIDClickBtn(Sender: TObject);
    procedure edtUnitAppIDPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtUnitCompIDPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtUntInfoCompTypeIDPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cbbPropinsiPropertiesChange(Sender: TObject);
  private
    FCompID     : Integer;
    FisActive   : Integer;
    FUnitId     : integer;
    FLoginUnit  : integer;
    FLoginID    : integer;
//    FUnit       : TUnit;

    FIsProcessSuccessfull: boolean;
    FUnitStore: TModUnit;
    cdsKabupaten: TClientDataSet;
    cdsUnitParent: TClientDataSet;
//    function CekLookUpID(aValue: string): Boolean;
    procedure SetData;
//    procedure ClearData;
    function GetUnitStore: TModUnit;
    procedure InisialisasiCBBAutApp;
    procedure InisialisasiCBBCompany;
    procedure InisialisasiCBBTipePuerusahaan;
    procedure InisialisasiPropinsi;
    procedure InisialisasiKabupaten;
    procedure InisialisasiUnitParent;
    procedure LoadData(AID : String);
    property UnitStore: TModUnit read GetUnitStore write FUnitStore;
  public
    procedure ShowWithCompanyID(aCompID: Integer; aUnitID: integer;
        aLoginUnit: integer; aLoginID: integer);



  published
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write FIsProcessSuccessfull;
  end;

var
  frmDialogUnit: TfrmDialogUnit;
  intCbbTypeCount: Integer;

implementation

uses  uTSCommonDlg, uRetnoUnit, Math, uDXUtils,
uDMClient, uDBUtils, uModAuthApp;

{$R *.dfm}

procedure TfrmDialogUnit.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Apakah Anda Yakin Akan Menghapus ?')  then
    Exit;

  if DMClient.CrudClient.DeleteFromDB(UnitStore) then
  begin
    TAppUtils.Information('Berhasil Hapus Data Cabang');
    LoadData('');
  end;

end;

procedure TfrmDialogUnit.actSaveExecute(Sender: TObject);
begin
  inherited;
  if not ValidateEmptyCtrl([1], True) then
    Exit;

  UnitStore.COMPANY             := TModCompany.CreateID(cbbCompany.EditValue);
  UnitStore.AUTAPP              := TModAutApp.CreateID(cbbAppType.EditValue);

  UnitStore.UNT_IS_HO           := TAppUtils.BoolToInt(UnitStore.UNT_IS_HO = 1);
  UnitStore.UNT_IS_STORE        := TAppUtils.BoolToInt(UnitStore.UNT_IS_STORE = 1);
  UnitStore.UNT_IS_WH           := TAppUtils.BoolToInt(UnitStore.UNT_IS_WH = 1);

  UnitStore.UNT_ADR             := edAddress.Text;
  UnitStore.UNT_ZIP             := edZIP.Text;
  UnitStore.AUTAPP              := TModAutApp.CreateID(cbbAppType.EditValue);
  UnitStore.UNT_CODE            := edCode.Text;
  UnitStore.UNT_CONTACT_PERSON  := edContactPerson.Text;
  UnitStore.UNT_DESCRIPTION     := edDesciption.Text;
  UnitStore.UNT_EMAIL           := edEmail.Text;
  UnitStore.UNT_FAX             := edFax.Text;


  if cbbParentUnit.EditValue = null then
    UnitStore.UNT_PARENT        := nil
  else
    UnitStore.UNT_PARENT          := TModUnit.CreateID(cbbParentUnit.EditValue);

  UnitStore.UNT_IS_ACTIVE       := TAppUtils.BoolToInt(chkActive.Checked);
  UnitStore.UNT_IS_ALLOWPO      := TAppUtils.BoolToInt(chkAllowPO.Checked);
  UnitStore.UNT_ISGRALLOWED     := TAppUtils.BoolToInt(chkAllowGR.Checked);

  UnitStore.KABUPATEN           := TModKabupaten.CreateID(cbbKabupaten.EditingValue);

  UnitStore.UNT_NAME            := edNama.Text;
  UnitStore.UNT_PHONE           := edPhone.Text;
  UnitStore.UNT_RGN_CODE        := edRegion.Text;
  UnitStore.UNT_NPWP            := edNPWP.Text;
  UnitStore.UNT_NPWP_ADR        := edNPWPAddress.Text;
  UnitStore.UNT_NPWP_NAME       := edNPWPName.Text;
  UnitStore.UNT_NPWP_REG_DATE   := edRegisterNPWP.Date;
  UnitStore.REF_TIPE_PERUSAHAAN := TModTipePerusahaan.CreateID(cbbCorporateType.EditValue);

  if DMClient.CrudClient.SaveToDB(UnitStore) then
  begin
    TAppUtils.Information('Berhasil Simpan Data Cabang');
    LoadData('');
  end;





end;

procedure TfrmDialogUnit.FormDestroy(Sender: TObject);
begin
//  FreeAndNil(FUnit);
  frmDialogUnit := nil;
  inherited;
end;

procedure TfrmDialogUnit.FormShow(Sender: TObject);
begin
//    prepareAddData();
end;

procedure TfrmDialogUnit.footerDialogMasterbtnSaveClick(Sender: TObject);
//var
//  dtOut              : TDateTime;
//  sShrDt             : string;
//  isHoStWh           : Integer;
begin
  inherited;

//  if not CekLookUpID(edtUnitAppID.Text) then
//  begin
//    CommonDlg.ShowError('Application Type harus diisi');
//    Exit;
//  end;
//
//  if not CekLookUpID(edtUnitCompID.Text) then
//  begin
//    CommonDlg.ShowError('Company Root harus diisi');
//    Exit;
//  end;
//
//  if not CekLookUpID(edtUntInfoCompTypeID.Text) then
//  begin
//    CommonDlg.ShowError('Corporate Type harus diisi');
//    Exit;
//  end;
//
//  if not CekLookUpID(edtUnitRegnID.Text) then
//  begin
//    CommonDlg.ShowError('Region harus diisi');
//    Exit;
//  end;
//
//  if not CekLookUpID(edtUnitTypeID.Text) then
//  begin
//    CommonDlg.ShowError('Unit Type harus diisi');
//    Exit;
//  end;
//
//  if not CekLookUpID(edtUnitPropId.Text) then
//  begin
//    CommonDlg.ShowError('Propinsi harus diisi');
//    Exit;
//  end;
//
//  if not CekLookUpID(edtUnitKabID.Text) then
//  begin
//    CommonDlg.ShowError('Kabupaten harus diisi');
//    Exit;
//  end;
//
//  sShrDt  := FormatSettings.ShortDateFormat;
//  FormatSettings.ShortDateFormat := 'dd-mm-yyyy';
//
//
//  if not TryStrToDate( edtUntInfoNpwpRegsD.Text + FormatSettings.DateSeparator + edtUntInfoNpwpRegsM.Text
//              + FormatSettings.DateSeparator + edtUntInfoNpwpRegsY.Text, dtOut ) then
//  begin
//    CommonDlg.ShowError('Tanggal Tidak Sesuai');
//    FormatSettings.ShortDateFormat := sShrDt;
//    Exit;
//  end;
//
//  isHoStWh  := rgTipeUnit.ItemIndex;

  {
  try
    with FUnit do
    begin
      UpdateData(StrToInt(edtUnitAppID.text), StrToInt(edtUnitCompID.Text),
                edtUnitDesc.Text, FUnitId, edtUnitCode.Text, edtUnitName.Text,

                chkAllowPO.Checked, chkAllowGR.Checked, isHoStWh, edtUnitTypeID.Text,
                StrToInt(edtUnitParentID.Text), edtUnitZip.Text, edtUnitPhone.Text,
                 edtUnitFax.Text, edtUnitContact.Text, edtUnitEmail.Text,
                 StrToInt(edtUnitPropId.Text), edtUnitKabID.Text, edtUnitRegnID.Text,

                FLoginID, FLoginUnit, StrToInt(edtUntInfoCompTypeID.Text),
                edtUntInfoAddress.Text, edtUntInfoNpwpID.Text,
                edtUntInfoNpwpNm.Text, edtUntInfoNpwpAdr.Text,
                dtOut, FisActive);

      if not SaveToDB then
      begin
        cRollbackTrans;
        CommonDlg.ShowError('Gagal Simpan Data Unit.');
      end
      else
      begin
        cCommitTrans;
        CommonDlg.ShowMessage('Data Unit telah disimpan.');
        FIsProcessSuccessfull := True;
        Close;
      end;

    end;
  finally
    cRollbackTrans;
  end;
  }
//  FormatSettings.ShortDateFormat := sShrDt;
end;

procedure TfrmDialogUnit.cbbPropinsiPropertiesChange(Sender: TObject);
begin
  inherited;
  if VarIsNull(cbbPropinsi.EditValue) then
    cdsKabupaten.Filtered := False
  else begin
    cdsKabupaten.Filter   := ' propinsi_id = ' + QuotedStr(cbbPropinsi.EditValue);
    cdsKabupaten.Filtered := True;
  end;

end;

procedure TfrmDialogUnit.cbbTypeUnitRChange(Sender: TObject);
begin
//  IdType:= StrToInt(FIdType.Strings[cbbTypeUnitR.ItemIndex]);
end;

//function TfrmDialogUnit.CekLookUpID(aValue: string): Boolean;
//var
//  i       : Integer;
//  aResult : Boolean;
//begin

//  try
//    i := StrToInt(Trim(aValue));
//    if i > 0  then
//      aResult := True
//    else
//      aResult := False;
//  except
//    aResult := False;
//  end;
//
//  Result := aResult ;
//end;

procedure TfrmDialogUnit.SetData;
begin
  if FUnitId > 0 then
  begin
    {if FUnit.LoadByID(FUnitId) then
    begin

      edtUnitCode.Text            := FUnit.Kode;
      edtUnitName.Text            := FUnit.Nama;
      edtUnitDesc.Text            := FUnit.Description;
      edtUnitAppID.Text           := IntToStr(FUnit.AppID);
      edtUnitAppNm.Text           := FUnit.App.AppName;
      edtUntInfoAddress.Text      := FUnit.UnitInfo.Address;
      edtUnitCompID.Text          := IntToStr(FUnit.Company.ID);
      edtUnitCompNm.Text          := FUnit.Company.Nama;
      edtUntInfoCompTypeID.Text   := IntToStr(FUnit.UnitInfo.PrshTypeID);
      edtUntInfoCompTypeNm.Text   := FUnit.UnitInfo.PrshType.Nama;
      edtUnitRegnID.Text          := FUnit.Regn.RgnCode;
      edtUnitRegnNm.Text          := FUnit.Regn.RgnName;
      edtUnitTypeID.Text          := FUnit.UnitTypeID;
      edtUnitTypeNm.Text          := FUnit.UnitType.UnitTypeName;
      edtUnitPhone.Text           := FUnit.Phone;
      edtUnitFax.Text             := FUnit.Fax;
      edtUnitZip.Text             := FUnit.Zip;
      edtUnitPropId.Text          := IntToStr(FUnit.Prop.Prop_ID);
      edtUnitPropNm.Text          := FUnit.Prop.Prop_Name;
      edtUnitKabID.Text           := FUnit.Kab.Kab_ID;
      edtUnitKabNm.Text           := FUnit.Kab.Kab_Name;
      edtUnitContact.Text         := FUnit.Contact;
      edtUnitEmail.Text           := FUnit.Email;
      edtUnitParentID.Text        := IntToStr(FUnit.ParentID);
      edtUntInfoNpwpID.Text       := FUnit.UnitInfo.Npwp;
      edtUntInfoNpwpNm.Text       := FUnit.UnitInfo.NpwpNm;
      edtUntInfoNpwpAdr.Text      := FUnit.UnitInfo.NpwpAdr;
      edtUntInfoNpwpRegsD.Text    := FormatDateTime('DD', FUnit.UnitInfo.NpwpRegs);
      edtUntInfoNpwpRegsM.Text    := FormatDateTime('MM', FUnit.UnitInfo.NpwpRegs);
      edtUntInfoNpwpRegsY.Text    := FormatDateTime('YYYY', FUnit.UnitInfo.NpwpRegs);
      chkAllowPo.Checked          := (FUnit.isAllowPo=1);
      chkActive.Checked           := (FUnit.isActive = 1)

    end;
  end
  else
  begin
    ClearData;
  end;  }

  end;
end;

//procedure TfrmDialogUnit.ClearData;
//begin
//  edtUnitCode.Clear;
//  edtUnitName.Clear;
//  edtUnitDesc.Clear;
//  edtUntInfoAddress.Clear;
//  edtUnitAppID.Clear;
//  edtUnitAppNm.Clear;
//  edtUnitCompID.Clear;
//  edtUnitCompNm.Clear;
//  edtUnitRegnID.Clear;
//  edtUnitRegnNm.Clear;
//  edtUnitPropId.Clear;
//  edtUnitPropNm.Clear;
//  edtUnitKabID.Clear;
//  edtUnitKabNm.Clear;
//  edtUnitTypeID.Clear;
//  edtUnitTypeNm.Clear;
//  edtUnitPhone.Clear;
//  edtUnitFax.Clear;
//  edtUnitZip.Clear;
//  edtUnitContact.Clear;
//  edtUnitEmail.Clear;
//  edtUnitParentID.Text  := '0';
//  edtUnitParentNm.Clear;
//  edtUnitChildID.Clear;
//  edtUnitChildNm.Clear;
//  edtUntInfoCompTypeID.Clear;
//  edtUntInfoCompTypeNm.Clear;
//  edtUntInfoNpwpID.Clear;
//  edtUntInfoNpwpNm.Clear;
//  edtUntInfoNpwpAdr.Clear;
//  edtUntInfoNpwpRegsD.Clear;
//  edtUntInfoNpwpRegsM.Clear;
//  edtUntInfoNpwpRegsY.Clear;
//  chkActive.Checked := False;


//end;


procedure TfrmDialogUnit.ShowWithCompanyID(aCompID: Integer; aUnitID: integer;
        aLoginUnit: integer; aLoginID: integer);
begin
  FCompID     := aCompId;
  FUnitId     := aUnitId;
  FLoginID    := aLoginID;
  FLoginUnit  := aLoginUnit;
//  FUnit       := TUnit.CreateWithUser(nil, aLoginID);
  setdata;
  Self.ShowModal;
end;

procedure TfrmDialogUnit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(FUnitStore);
end;

procedure TfrmDialogUnit.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;

  InisialisasiCBBCompany;
  InisialisasiCBBAutApp;
  InisialisasiCBBTipePuerusahaan;

  InisialisasiKabupaten;
  InisialisasiPropinsi;
  InisialisasiUnitParent;

  LoadData('');
end;

procedure TfrmDialogUnit.edtUnitAppIDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
// if key = vk_F5 then
//    FUnit.GetRecApp(edtUnitAppID, edtUnitAppNm);
end;

procedure TfrmDialogUnit.edtUnitCompIDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
//  if key = vk_F5 then
//    FUnit.GetRecCompany(edtUnitCompID, edtUnitCompNm);
end;

procedure TfrmDialogUnit.edtUnitCompIDPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  kEY: Word;
begin
  inherited;
  kEY := VK_F5;
    edtUnitCompIDKeyDown(Sender, kEY, [ssAlt]);
end;

procedure TfrmDialogUnit.edtUntInfoCompTypeIDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
//  if key = vk_F5 then
//    FUnit.GetRecPrshType(edtUntInfoCompTypeID, edtUntInfoCompTypeNm);
end;

procedure TfrmDialogUnit.edtUntInfoCompTypeIDPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  kEY: Word;
begin
  inherited;
  kEY := VK_F5;
    edtUntInfoCompTypeIDKeyDown(Sender, kEY, [ssAlt]);
end;

procedure TfrmDialogUnit.edtUnitRegnIDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
// if key = vk_F5 then
//    FUnit.GetRecRegn(edtUnitRegnID, edtUnitRegnNm);
end;

procedure TfrmDialogUnit.edtUnitPropIdKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
//if key = vk_F5 then
//    FUnit.GetRecProp(edtUnitPropId, edtUnitPropNm);
end;

procedure TfrmDialogUnit.edtUnitKabIDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
//var
//  aPropId: Integer;
begin
  inherited;
//  TryStrToInt(edtUnitPropId.Text, aPropId);

//  if key = vk_F5 then
//    FUnit.GetRecKab(edtUnitKabID, edtUnitKabNm, aPropId)
//  else if Key = vk_return then
//    FUnit.GetRecKab(aPropId, edtUnitKabID, edtUnitKabNm);

end;

procedure TfrmDialogUnit.edtUnitAppIDKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (CharInSet(Key, ['0'..'9'])) then
    Key := #0;
//  if not (Key in ['0'..'9']) then
//    Key := #0;
end;

procedure TfrmDialogUnit.edtUnitAppIDPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  kEY: Word;
begin
  inherited;
  kEY := VK_F5;
    edtUnitAppIDKeyDown(Sender, kEY, [ssAlt]);
end;

procedure TfrmDialogUnit.edtUnitTypeIDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
//  FUnit.GetRecUnitType(edtUnitTypeID, edtUnitTypeNm);
end;

procedure TfrmDialogUnit.edtUnitCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

procedure TfrmDialogUnit.edtUntInfoNpwpRegsDKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
//  if not (Key in ['0'..'9']) then
  if not (CharInSet(Key, ['0'..'9'])) then
    Key := #0;
//  if Length(edtUntInfoNpwpRegsD.Text)= 1 then
//    edtUntInfoNpwpRegsM.SetFocus;

end;

procedure TfrmDialogUnit.edtUntInfoNpwpRegsMKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
//  if not (Key in ['0'..'9']) then
  if not (CharInSet(Key, ['0'..'9'])) then
    Key := #0;
//  if Length(edtUntInfoNpwpRegsM.Text)= 1 then
//    edtUntInfoNpwpRegsY.SetFocus;
end;

procedure TfrmDialogUnit.edtUntInfoNpwpRegsYKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
//  if not (Key in ['0'..'9']) then
  if not (CharInSet(Key, ['0'..'9'])) then
    Key := #0;

end;

procedure TfrmDialogUnit.edtUnitRegnIDKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
//  if not (Key in ['A'..'Z']) then
  if not (CharInSet(Key, ['0'..'9'])) then
    Key := #0;
end;

procedure TfrmDialogUnit.chkActiveClick(Sender: TObject);
begin
  inherited;
  if chkActive.Checked then
    FisActive  := 1
  else
    FisActive  := 0;
end;

procedure TfrmDialogUnit.edtUnitRegnIDClickBtn(Sender: TObject);
var
  kEY: Word;
begin
  inherited;
  kEY := VK_F5;
    edtUnitRegnIDKeyDown(Sender, kEY, [ssAlt]);
end;

procedure TfrmDialogUnit.edtUnitTypeIDClickBtn(Sender: TObject);
var
  kEY: Word;
begin
  inherited;
  kEY := VK_F5;
    edtUnitTypeIDKeyDown(Sender, kEY, [ssAlt]);
end;

procedure TfrmDialogUnit.edtUnitPropIdClickBtn(Sender: TObject);
var
  kEY: Word;
begin
  inherited;
  kEY := VK_F5;
    edtUnitPropIdKeyDown(Sender, kEY, [ssAlt]);
end;

procedure TfrmDialogUnit.edtUnitKabIDClickBtn(Sender: TObject);
var
  kEY: Word;
begin
  inherited;
  kEY := VK_F5;
    edtUnitKabIDKeyDown(Sender, kEY, [ssAlt]);
end;

procedure TfrmDialogUnit.edtUnitParentIDClickBtn(Sender: TObject);
var
  kEY: Word;
begin
  inherited;
  kEY := VK_F5;
    edtUnitAppIDKeyDown(Sender, kEY, [ssAlt]);
end;

function TfrmDialogUnit.GetUnitStore: TModUnit;
begin
  if FUnitStore = nil then
    FUnitStore := TModUnit.Create;

  Result := FUnitStore;
end;

procedure TfrmDialogUnit.InisialisasiCBBAutApp;
var
  lcdsAutApp: TClientDataSet;
begin
  lcdsAutApp := TDBUtils.DSToCDS(DMClient.DSProviderClient.AutAPP_GetDSLookup(), Self);
  cbbAppType.Properties.LoadFromCDS(lcdsAutApp,'AUT$APP_ID','APP_NAME',['AUT$APP_ID'],Self);
  cbbAppType.Properties.SetMultiPurposeLookup;
end;

procedure TfrmDialogUnit.InisialisasiCBBCompany;
var
  lcdsCompany: TClientDataSet;
begin
  lcdsCompany := TDBUtils.DSToCDS(DMClient.DSProviderClient.Company_GetDSLookup(), Self);
  cbbCompany.Properties.LoadFromCDS(lcdsCompany,'Company_ID','COMP_NAME',['Company_ID'],Self);
  cbbCompany.Properties.SetMultiPurposeLookup;
end;

procedure TfrmDialogUnit.InisialisasiCBBTipePuerusahaan;
var
  lcdsTipeCompany: TClientDataSet;
begin
  lcdsTipeCompany := TDBUtils.DSToCDS(DMClient.DSProviderClient.TipePerusahaan_GetDSOverview(), Self);
  cbbCorporateType.Properties.LoadFromCDS(lcdsTipeCompany,'REF$TIPE_PERUSAHAAN_ID','TPPERSH_NAME',['REF$TIPE_PERUSAHAAN_ID'],Self);
  cbbCorporateType.Properties.SetMultiPurposeLookup;
end;

procedure TfrmDialogUnit.InisialisasiPropinsi;
var
  lcdsPropinsi: TClientDataSet;
begin
  lcdsPropinsi := TDBUtils.DSToCDS(DMClient.DSProviderClient.Propinsi_GetDSLookUp(), Self);
  cbbPropinsi.Properties.LoadFromCDS(lcdsPropinsi,'PROPINSI_ID','NAME',['PROPINSI_ID'],Self);
  cbbPropinsi.Properties.SetMultiPurposeLookup;
end;

procedure TfrmDialogUnit.InisialisasiKabupaten;
begin
  cdsKabupaten := TDBUtils.DSToCDS(DMClient.DSProviderClient.Kabupaten_GetDSLookUp(), Self);
  cbbKabupaten.Properties.LoadFromCDS(cdsKabupaten,'KABUPATEN_ID','NAME',['KABUPATEN_ID','PROPINSI_ID'],Self);
  cbbKabupaten.Properties.SetMultiPurposeLookup;
end;

procedure TfrmDialogUnit.InisialisasiUnitParent;
begin
  cdsUnitParent := TDBUtils.DSToCDS(DMClient.DSProviderClient.Unit_GetDSLookUp(), Self);
  cbbParentUnit.Properties.LoadFromCDS(cdsUnitParent,'AUT$UNIT_ID','UNT_NAME',['AUT$UNIT_ID', 'UNT_CODE'],Self);
  cbbParentUnit.Properties.SetMultiPurposeLookup;
end;

procedure TfrmDialogUnit.LoadData(AID : String);
begin
  FreeAndNil(FUnitStore);
  ClearByTag([0,1]);

  if AID <> '' then
  begin
    FUnitStore := TModUnit(DMCLient.CrudClient.Retrieve(TModUnit.ClassName, AID));
    if FUnitStore <> nil then
    begin
      cbbCompany.EditValue       := UnitStore.COMPANY.ID;
      cbbAppType.EditValue       := UnitStore.AUTAPP.ID;
      cbbCorporateType.EditValue := UnitStore.REF_TIPE_PERUSAHAAN.ID;

      rgTipeUnit.ItemIndex       := 0;

      if UnitStore.UNT_IS_HO = 1 then
        rgTipeUnit.ItemIndex     := 0
      else if UnitStore.UNT_IS_STORE = 1  then
        rgTipeUnit.ItemIndex     := 1
      else
        rgTipeUnit.ItemIndex     := 2;

      edAddress.Text             := UnitStore.UNT_ADR;
      edZIP.Text                 := UnitStore.UNT_ZIP;
      edCode.Text                := UnitStore.UNT_CODE;
      edContactPerson.Text       := UnitStore.UNT_CONTACT_PERSON;
      edDesciption.Text          := UnitStore.UNT_DESCRIPTION;
      edEmail.Text               := UnitStore.UNT_EMAIL;
      edFax.Text                 := UnitStore.UNT_FAX;

      cbbKabupaten.EditValue     := UnitStore.kABUPATEN.id;
      cbbPropinsi.EditValue      := cdsKabupaten.FieldByName('PROPINSI_ID').AsString;

      cbbPropinsiPropertiesChange(cbbPropinsi);
      cbbParentUnit.EditValue    := UnitStore.UNT_PARENT.ID;


      edNPWP.Text                := UnitStore.UNT_NPWP;
      edNPWPAddress.Text         := UnitStore.UNT_NPWP_ADR;
      edNPWPName.Text            := UnitStore.UNT_NPWP_NAME;
      edRegisterNPWP.Date        := UnitStore.UNT_NPWP_REG_DATE;
      chkActive.Checked          := UnitStore.UNT_IS_ACTIVE = 1;
      chkAllowPO.Checked         := UnitStore.UNT_IS_ALLOWPO  = 1;
      chkAllowGR.Checked         := UnitStore.UNT_ISGRALLOWED  = 1;

      edNama.Text                := UnitStore.UNT_NAME;
      edPhone.Text               := UnitStore.UNT_PHONE;
      edRegion.Text              := UnitStore.UNT_RGN_CODE;
    end;
  end;
end;

end.

