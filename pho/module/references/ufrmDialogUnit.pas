unit ufrmDialogUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, SUIForm,
  StdCtrls, cbxbase, dblup1a, JclStrings, uNewUnit, EditBtn;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogUnit = class(TfrmMasterDialog)
    lbl1: TLabel;
    edtUnitCode: TEdit;
    Lbl2: TLabel;
    edtUnitName: TEdit;
    lbl3: TLabel;
    edtUnitDesc: TEdit;
    Label2: TLabel;
    edtUntInfoAddress: TEdit;
    Label4: TLabel;
    edtUnitAppNm: TEdit;
    Label5: TLabel;
    edtUnitCompNm: TEdit;
    Label6: TLabel;
    edtUnitRegnNm: TEdit;
    Label7: TLabel;
    edtUnitPropNm: TEdit;
    Label8: TLabel;
    edtUnitKabNm: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    edtUnitPhone: TEdit;
    edtUnitFax: TEdit;
    Label12: TLabel;
    edtUnitZip: TEdit;
    Label13: TLabel;
    edtUnitContact: TEdit;
    Label14: TLabel;
    edtUnitEmail: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edtUnitChildID: TEdit;
    Label18: TLabel;
    edtUntInfoNpwpID: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    edtUntInfoNpwpNm: TEdit;
    edtUntInfoNpwpAdr: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    edtUntInfoNpwpRegsD: TEdit;
    edtUntInfoCompTypeNm: TEdit;
    edtUnitTypeNm: TEdit;
    edtUntInfoNpwpRegsM: TEdit;
    edtUntInfoNpwpRegsY: TEdit;
    Label3: TLabel;
    Label11: TLabel;
    edtUnitParentNm: TEdit;
    edtUnitChildNm: TEdit;
    rgTipeUnit: TRadioGroup;
    grpAuthority: TGroupBox;
    chkAllowPO: TCheckBox;
    chkAllowGR: TCheckBox;
    chkActive: TCheckBox;
    edtUnitAppID: TEditBtn;
    edtUnitCompID: TEditBtn;
    edtUntInfoCompTypeID: TEditBtn;
    edtUnitRegnID: TEditBtn;
    edtUnitTypeID: TEditBtn;
    edtUnitPropId: TEditBtn;
    edtUnitKabID: TEditBtn;
    edtUnitParentID: TEditBtn;
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
    procedure edtUnitAppIDClickBtn(Sender: TObject);
    procedure edtUnitCompIDClickBtn(Sender: TObject);
    procedure edtUntInfoCompTypeIDClickBtn(Sender: TObject);
    procedure edtUnitRegnIDClickBtn(Sender: TObject);
    procedure edtUnitTypeIDClickBtn(Sender: TObject);
    procedure edtUnitPropIdClickBtn(Sender: TObject);
    procedure edtUnitKabIDClickBtn(Sender: TObject);
    procedure edtUnitParentIDClickBtn(Sender: TObject);
  private
    FCompID     : Integer;
    FisActive   : Integer;
    FUnitId     : integer;
    FLoginUnit  : integer;
    FLoginID    : integer;
    FUnit       : TUnit;

    FIsProcessSuccessfull: boolean;
    function CekLookUpID(aValue: string): Boolean;
//    FFormMode: TFormMode;
//    IdType: Integer;
//    FIdType: TStringList;



//    function SaveUnit: boolean;
//    function UpdateUnit: boolean;
//    procedure SetFormMode(const Value: TFormMode);
//    procedure SetIsProcessSuccessfull(const Value: boolean);
//    procedure SetUnitId(const Value: integer);
//    procedure showDataEdit(intIdUnit:Integer);
//    procedure prepareAddData;
    procedure SetData;
    procedure ClearData;
//    procedure KeyPressStr(var Key: Char);
  public
    procedure ShowWithCompanyID(aCompID: Integer; aUnitID: integer;
        aLoginUnit: integer; aLoginID: integer);

    
    
  published
//    property FormMode: TFormMode read FFormMode write SetFormMode;
//    property UnitId: integer read FUnitId write SetUnitId;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write FIsProcessSuccessfull;
  end;

var
  frmDialogUnit: TfrmDialogUnit;
  intCbbTypeCount: Integer;

implementation

uses  uTSCommonDlg, uRetnoUnit, Math;
//  uTipePerusahaan;

{$R *.dfm}

//procedure TfrmDialogUnit.showDataEdit(intIdUnit:Integer);
//var data: TResultDataSet;
//    intI: Integer;
//    strR, strDataType: string;
//begin
//  if not assigned(Unt) then
//    Unt := TUnit.Create;
//  data:= Unt.SearchDataUnit(intIdUnit);
////  edtCodeUnit.Text := data.fieldbyname('UNT_CODE').AsString;
////  edtNameUnit.Text := data.fieldbyname('UNT_NAME').AsString;
////  edtDescUnit.Text := data.fieldbyname('UNT_DESCRIPTION').AsString;
////  edtAddressUnit.Text := data.fieldbyname('ADDRESS').AsString;
////  edtNPWPUnit.Text := data.fieldbyname('NPWP').AsString;
//  IdType:=data.fieldbyname('TPPERSH_ID').AsInteger;
//
//  intI:=0;
//  repeat
//      cbbTypeUnitR.ItemIndex:=intI;
//      strR:= cbbTypeUnitR.Items.Strings[intI];
//      strDataType:= data.fieldbyname('TPPERSH_NAME').AsString;
//
//      inc(intI);
//  until (strR = strDataType) or (intI = (intCbbTypeCount-1));
//
//     cbbTypeUnitR.ItemIndex:=intI-1;
//end;

//procedure TfrmDialogUnit.prepareAddData;
//begin
//  edtCodeUnit.Clear;
//  edtNameUnit.Clear;
//  edtDescUnit.Clear;
//  cbbTypeUnitR.ItemIndex:=0;
//end;

//function TfrmDialogUnit.SaveUnit: boolean;
//var
//  arrParam: TArr;
//begin
//  result := false;
//
//  if edtCodeUnit.Text='' then
//  begin
//    CommonDlg.ShowErrorEmpty('CODE');
//    edtCodeUnit.SetFocus;
//    Exit;
//  end
//  else
//  if edtNameUnit.Text='' then
//  begin
//    CommonDlg.ShowErrorEmpty('NAME');
//    edtNameUnit.SetFocus;
//    Exit;
//  end;
//
//  if not assigned(Unt) then
//    Unt := TUnit.Create;
//
//  if Unt.IsCodeExist(edtCodeUnit.Text,frmMain.CompanyId) then
//  begin
//    CommonDlg.ShowErrorExist('CODE',edtCodeUnit.Text);
//    edtCodeUnit.SetFocus;
//    FreeAndNil(Unt);
//    Exit;
//  end;
//
//  // set param
//  SetLength(arrParam,8);
//  arrParam[0].tipe := ptString;
//  arrParam[0].data := edtCodeUnit.Text;
//  arrParam[1].tipe := ptString;
//  arrParam[1].data := edtNameUnit.Text;
//  arrParam[2].tipe := ptString;
//  arrParam[2].data := edtDescUnit.Text;
//  arrParam[3].tipe := ptInteger;
//  arrParam[3].data := IdType;
//  arrParam[4].tipe := ptString;
//  arrParam[4].data := edtAddressUnit.Text;
//  arrParam[5].tipe := ptString;
////  arrParam[5].data := edtNPWPUnit.Text;
//  arrParam[6].tipe := ptInteger;
//  arrParam[6].data := frmMain.LoginId;
//  arrParam[7].tipe := ptInteger;
//  arrParam[7].data := frmMain.CompanyId;
//
//  result:= Unt.InputDataUnit(arrParam);
//
//end;

//procedure TfrmDialogUnit.SetFormMode(const Value: TFormMode);
//begin
//  FFormMode := Value;
//end;

//procedure TfrmDialogUnit.SetIsProcessSuccessfull(const Value: boolean);
//begin
//  FIsProcessSuccessfull := Value;
//end;

//procedure TfrmDialogUnit.SetUnitId(const Value: integer);
//begin
//  FUnitId := Value;
//end;

//function TfrmDialogUnit.UpdateUnit: boolean;
//var
//  arrParam: TArr;
//begin
//  result := false;
////
//  if edtCodeUnit.Text='' then
//  begin
//    CommonDlg.ShowErrorEmpty('CODE');
//    edtCodeUnit.SetFocus;
//    Exit;
//  end
//  else
//  if edtNameUnit.Text='' then
//  begin
//    CommonDlg.ShowErrorEmpty('NAME');
//    edtNameUnit.SetFocus;
//    Exit;
//  end;
//
//  if Unt.IsCodeExist(edtCodeUnit.Text,frmMain.CompanyId,UnitId) then
//  begin
//    CommonDlg.ShowErrorExist('CODE',edtCodeUnit.Text);
//    edtCodeUnit.SetFocus;
//    FreeAndNil(Unt);
//    Exit;
//  end;
//
//  // set param
//  SetLength(arrParam,8);
//  arrParam[0].tipe := ptString;
//  arrParam[0].data := edtCodeUnit.Text;
//  arrParam[1].tipe := ptString;
//  arrParam[1].data := edtNameUnit.Text;
//  arrParam[2].tipe := ptString;
//  arrParam[2].data := edtDescUnit.Text;
//  arrParam[3].tipe := ptInteger;
//  arrParam[3].data := IdType;
//  arrParam[4].tipe := ptString;
//  arrParam[4].data := edtAddressUnit.Text;
//  arrParam[5].tipe := ptString;
////  arrParam[5].data := edtNPWPUnit.Text;
//  arrParam[6].tipe := ptInteger;
//  arrParam[6].data := UnitId;
//  arrParam[7].tipe := ptInteger;
//  arrParam[7].data := frmMain.LoginId;
//
//  if not assigned(Unt) then
//    Unt := TUnit.Create;
////
//  result:=Unt.UpdateDataUnit(arrParam);
//
//end;

procedure TfrmDialogUnit.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FUnit);
  frmDialogUnit := nil;
  inherited;
end;

procedure TfrmDialogUnit.FormShow(Sender: TObject);
//var data: TResultDataSet;
begin
//  inherited;
//  FIdType := TStringList.Create;
//  if not assigned(TipePerusahaan) then
//    TipePerusahaan := TTipePerusahaan.Create;
//
//  {Set Unit Type}
//  cbbTypeUnitR.Clear;
//  FIdType.Clear;
//  data:=TipePerusahaan.GetDataTipePerusahaan(nil);
//  intCbbTypeCount:= data.RecordCount;
//  with data do
//  begin
//    IdType:=data.fieldbyname('TPPERSH_ID').AsInteger;
//    while not Eof do
//    begin
//      cbbTypeUnitR.Items.Add(data.fieldbyname('TPPERSH_NAME').AsString);
//      FIdType.Add(IntToStr(data.fieldbyname('TPPERSH_ID').AsInteger));
//      Next;
//    end;
//  end;
//
//  if (FFormMode = fmEdit) then
//    showDataEdit(UnitId)
//  else
//    prepareAddData();
end;

procedure TfrmDialogUnit.footerDialogMasterbtnSaveClick(Sender: TObject);
var
  dtOut              : TDateTime;
  sShrDt             : string;
  isHoStWh           : Integer;
begin
  inherited;

  if not CekLookUpID(edtUnitAppID.Text) then
  begin
    CommonDlg.ShowError('Application Type harus diisi');
    Exit;
  end;

  if not CekLookUpID(edtUnitCompID.Text) then
  begin
    CommonDlg.ShowError('Company Root harus diisi');
    Exit;
  end;

  if not CekLookUpID(edtUntInfoCompTypeID.Text) then
  begin
    CommonDlg.ShowError('Corporate Type harus diisi');
    Exit;
  end;

  if not CekLookUpID(edtUnitRegnID.Text) then
  begin
    CommonDlg.ShowError('Region harus diisi');
    Exit;
  end;

  if not CekLookUpID(edtUnitTypeID.Text) then
  begin
    CommonDlg.ShowError('Unit Type harus diisi');
    Exit;
  end;

  if not CekLookUpID(edtUnitPropId.Text) then
  begin
    CommonDlg.ShowError('Propinsi harus diisi');
    Exit;
  end;

  if not CekLookUpID(edtUnitKabID.Text) then
  begin
    CommonDlg.ShowError('Kabupaten harus diisi');
    Exit;
  end;

  sShrDt  := FormatSettings.ShortDateFormat;
  FormatSettings.ShortDateFormat := 'dd-mm-yyyy';


  if not TryStrToDate( edtUntInfoNpwpRegsD.Text + FormatSettings.DateSeparator + edtUntInfoNpwpRegsM.Text
              + FormatSettings.DateSeparator + edtUntInfoNpwpRegsY.Text, dtOut ) then
  begin
    CommonDlg.ShowError('Tanggal Tidak Sesuai');
    FormatSettings.ShortDateFormat := sShrDt;
    Exit;
  end;

  isHoStWh  := rgTipeUnit.ItemIndex;


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
  FormatSettings.ShortDateFormat := sShrDt;
end;

procedure TfrmDialogUnit.cbbTypeUnitRChange(Sender: TObject);
begin
//  IdType:= StrToInt(FIdType.Strings[cbbTypeUnitR.ItemIndex]);
end;

function TfrmDialogUnit.CekLookUpID(aValue: string): Boolean;
var
  i       : Integer;
  aResult : Boolean;
begin

  try
    i := StrToInt(Trim(aValue));
    if i > 0  then
      aResult := True
    else
      aResult := False;
  except
    aResult := False;
  end;
  
  Result := aResult ;
end;

procedure TfrmDialogUnit.SetData;
begin
  if FUnitId > 0 then
  begin
    if FUnit.LoadByID(FUnitId) then
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
      //edtUnitChildID.Text         := IntToStr(FUnit.ChilID);
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
  end;
end;

procedure TfrmDialogUnit.ClearData;
begin
  edtUnitCode.Clear;
  edtUnitName.Clear;
  edtUnitDesc.Clear;
  edtUntInfoAddress.Clear;
  edtUnitAppID.Clear;
  edtUnitAppNm.Clear;
  edtUnitCompID.Clear;
  edtUnitCompNm.Clear;
  edtUnitRegnID.Clear;
  edtUnitRegnNm.Clear;
  edtUnitPropId.Clear;
  edtUnitPropNm.Clear;
  edtUnitKabID.Clear;
  edtUnitKabNm.Clear;
  edtUnitTypeID.Clear;
  edtUnitTypeNm.Clear;
  edtUnitPhone.Clear;
  edtUnitFax.Clear;
  edtUnitZip.Clear;
  edtUnitContact.Clear;
  edtUnitEmail.Clear;
  edtUnitParentID.Text  := '0';
  edtUnitParentNm.Clear;
  edtUnitChildID.Clear;
  edtUnitChildNm.Clear;
  edtUntInfoCompTypeID.Clear;
  edtUntInfoCompTypeNm.Clear;
  edtUntInfoNpwpID.Clear;
  edtUntInfoNpwpNm.Clear;
  edtUntInfoNpwpAdr.Clear;
  edtUntInfoNpwpRegsD.Clear;
  edtUntInfoNpwpRegsM.Clear;
  edtUntInfoNpwpRegsY.Clear;
  chkActive.Checked := False;


end;


procedure TfrmDialogUnit.ShowWithCompanyID(aCompID: Integer; aUnitID: integer;
        aLoginUnit: integer; aLoginID: integer);
begin
  FCompID     := aCompId;
  FUnitId     := aUnitId;
  FLoginID    := aLoginID;
  FLoginUnit  := aLoginUnit;
  FUnit       := TUnit.CreateWithUser(nil, aLoginID);
  setdata;
  Self.ShowModal;
end;

procedure TfrmDialogUnit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited;
//  Action  := caFree;
end;

procedure TfrmDialogUnit.edtUnitAppIDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
 if key = vk_F5 then
    FUnit.GetRecApp(edtUnitAppID, edtUnitAppNm);
end;

procedure TfrmDialogUnit.edtUnitCompIDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_F5 then
    FUnit.GetRecCompany(edtUnitCompID, edtUnitCompNm);
end;

procedure TfrmDialogUnit.edtUntInfoCompTypeIDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_F5 then
    FUnit.GetRecPrshType(edtUntInfoCompTypeID, edtUntInfoCompTypeNm);
end;

procedure TfrmDialogUnit.edtUnitRegnIDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
 if key = vk_F5 then
    FUnit.GetRecRegn(edtUnitRegnID, edtUnitRegnNm);
end;

procedure TfrmDialogUnit.edtUnitPropIdKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
if key = vk_F5 then
    FUnit.GetRecProp(edtUnitPropId, edtUnitPropNm);
end;

procedure TfrmDialogUnit.edtUnitKabIDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  aPropId: Integer;
begin
  inherited;
  TryStrToInt(edtUnitPropId.Text, aPropId);
  
  if key = vk_F5 then
    FUnit.GetRecKab(edtUnitKabID, edtUnitKabNm, aPropId)
  else if Key = vk_return then
    FUnit.GetRecKab(aPropId, edtUnitKabID, edtUnitKabNm);

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

procedure TfrmDialogUnit.edtUnitTypeIDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  FUnit.GetRecUnitType(edtUnitTypeID, edtUnitTypeNm);
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
  if Length(edtUntInfoNpwpRegsD.Text)= 1 then
    edtUntInfoNpwpRegsM.SetFocus;

end;

procedure TfrmDialogUnit.edtUntInfoNpwpRegsMKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
//  if not (Key in ['0'..'9']) then
  if not (CharInSet(Key, ['0'..'9'])) then
    Key := #0;
  if Length(edtUntInfoNpwpRegsM.Text)= 1 then
    edtUntInfoNpwpRegsY.SetFocus;
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

//procedure TfrmDialogUnit.KeyPressStr(var Key: Char);
//begin
//  if not (Key in ['0'..'9']) then
//    Key := #0;
//end;

procedure TfrmDialogUnit.chkActiveClick(Sender: TObject);
begin
  inherited;
  if chkActive.Checked then
    FisActive  := 1
  else
    FisActive  := 0;
end;

procedure TfrmDialogUnit.edtUnitAppIDClickBtn(Sender: TObject);
var
  kEY: Word;
begin
  inherited;
  kEY := VK_F5;
    edtUnitAppIDKeyDown(Sender, kEY, [ssAlt]);
end;

procedure TfrmDialogUnit.edtUnitCompIDClickBtn(Sender: TObject);
var
  kEY: Word;
begin
  inherited;
  kEY := VK_F5;
    edtUnitCompIDKeyDown(Sender, kEY, [ssAlt]);

end;

procedure TfrmDialogUnit.edtUntInfoCompTypeIDClickBtn(Sender: TObject);
var
  kEY: Word;
begin
  inherited;
  kEY := VK_F5;
    edtUntInfoCompTypeIDKeyDown(Sender, kEY, [ssAlt]);
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

end.
