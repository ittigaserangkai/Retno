unit ufrmDialogSupplier;

interface

uses
  uConn, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ExtCtrls, ActnList,
  uRetnoUnit, ufrmSupplier, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit, cxCurrencyEdit,
  System.Actions, ufraFooterDialog3Button, Vcl.Mask, Vcl.StdCtrls, cxButtonEdit,
  dxBarBuiltInMenu, cxPC;

type
  TFormMode = (fmAddSup, fmAddMer, fmEdit);

  TfrmDialogSupplier = class(TfrmMasterDialog)
    pc1: TcxPageControl;
    tsSupplier: TcxTabSheet;
    tsMerchandiseGroup: TcxTabSheet;
    edtSupCode: TEdit;
    edtSupName: TEdit;
    lbl3: TLabel;
    edtAddress: TEdit;
    edtCity: TEdit;
    lbl4: TLabel;
    lbl18: TLabel;
    edtPostCode: TEdit;
    edtFax: TEdit;
    lbl19: TLabel;
    edtPhone: TEdit;
    lbl5: TLabel;
    lbl6: TLabel;
    edtContactP: TEdit;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl10: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    bvl2: TBevel;
    edtAccountName: TEdit;
    edtAccountNo: TEdit;
    edtBankName: TEdit;
    cbbPKP: TComboBox;
    lbl36: TLabel;
    edtTaxNo: TEdit;
    lbl21: TLabel;
    edtTitle: TEdit;
    lbl37: TLabel;
    edtMerGrup: TEdit;
    lbl23: TLabel;
    lbl24: TLabel;
    edtTermOP: TEdit;
    lbl27: TLabel;
    lbl28: TLabel;
    lbl25: TLabel;
    edtLeadTime: TEdit;
    lbl26: TLabel;
    lbl22: TLabel;
    curedtCreditLmt: TcxCurrencyEdit;
    lbl15: TLabel;
    curedtAPEndB: TcxCurrencyEdit;
    curedtCNBln: TcxCurrencyEdit;
    lbl16: TLabel;
    lbl34: TLabel;
    dtLastPurchs: TcxDateEdit;
    lbl35: TLabel;
    curedtPaymnt: TcxCurrencyEdit;
    curedtOutsdPaymnt: TcxCurrencyEdit;
    lbl9: TLabel;
    lbl33: TLabel;
    edtNoOfPO: TEdit;
    lbl29: TLabel;
    edtExtdDesc: TEdit;
    chkEnableCN: TCheckBox;
    pnl1: TPanel;
    lbl30: TLabel;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl38: TLabel;
    lbl39: TLabel;
    lbl40: TLabel;
    lbl41: TLabel;
    lbl42: TLabel;
    lbl43: TLabel;
    lbl44: TLabel;
    edtAddrMer: TEdit;
    edtCityMer: TEdit;
    edtPostCodeMer: TEdit;
    edtFaxMer: TEdit;
    edtPhoneMer: TEdit;
    edtContactMer: TEdit;
    edtTitleMer: TEdit;
    edtBankCodeMer: TEdit;
    edtBankAccNameMer: TEdit;
    edtBankAccNoMer: TEdit;
    grp: TGroupBox;
    lbl45: TLabel;
    chkMon: TCheckBox;
    chkTue: TCheckBox;
    chkWed: TCheckBox;
    chkThu: TCheckBox;
    chkFri: TCheckBox;
    chkSat: TCheckBox;
    chkSun: TCheckBox;
    chkIsDif: TCheckBox;
    cbbBKP: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    edtFee: TEdit;
    Label3: TLabel;
    chkFee: TCheckBox;
    actSupplier: TActionList;
    actUpdateBank: TAction;
    Label5: TLabel;
    Label4: TLabel;
    medtNPWP: TMaskEdit;
    cbTipePerusahaan: TComboBox;
    cbTipeSupplier: TComboBox;
    edKodeBank: TcxButtonEdit;
    cbpBankCodeMer: TcxButtonEdit;
    cbpDeliverPO: TComboBox;
    cbpPayment: TComboBox;
    cbpMerchGroup: TComboBox;
    Label6: TLabel;
    edtSuppGrpNo: TEdit;
    edtSuppGrpNm: TEdit;
    edtCabangBank: TEdit;
    Label7: TLabel;
    edtBankBranch: TEdit;
    Label8: TLabel;
    edtBankAddrss: TEdit;
    edtAlamatBank: TEdit;
    Lbl2: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cbbPpn: TComboBox;
    chkSupActive: TCheckBox;
    Label11: TLabel;
    edtDisc: TcxCurrencyEdit;
    Label12: TLabel;
    chkAllMer: TCheckBox;
    edtNPWPAlamat: TEdit;
    Label13: TLabel;

    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtPostCodeKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edKodeBankClickBtn(Sender: TObject);
    procedure edKodeBankKeyPress(Sender: TObject; var Key: Char);
    procedure edKodeBankExit(Sender: TObject);
    procedure edKodeBankKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbpBankCodeMerClickBtn(Sender: TObject);
    procedure cbpBankCodeMerExit(Sender: TObject);
    procedure cbpMerchGroup1ClickBtn(Sender: TObject);
    procedure cbpMerchGroupExit(Sender: TObject);
    procedure edtFeeKeyPress(Sender: TObject; var Key: Char);
    procedure chkIsDifClick(Sender: TObject);
    procedure cbbPKPChange(Sender: TObject);
    Procedure LoadListCbpBKP();
    procedure edtSuppGrpNoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSupNameKeyPress(Sender: TObject; var Key: Char);
    procedure edtSupNameExit(Sender: TObject);
    procedure cbbBKPChange(Sender: TObject);


  private
    aKodelama: string;
    //FTipeSupplier: TNewTipeSupplier;
    FKodeLama : String;
//    FNewSupplierMerGroup: TNewSupplierMerGroup;
//    FNewUnit: TUnit;
//    FSupplier: TNewSupplier;
//    FMerchandise : TNewMerchadize;
    FFormMode: TFormMode;
    FxGen: Integer;
    isSuplier : Boolean;
    isMerchandise : Boolean;
    isInsert : Integer;
    imerchandise : Integer ;

    function GetMerGroupName(aMerchanGrupKode: String): string;
    procedure LoadDataMerGroup(aMerchanGrupID: Integer);
    procedure SetFormMode(const Value: TFormMode);

    procedure LoadDataTipePerusahaan;
    function SimpanSupplierExec: Boolean;



  public
    function IsKodeMerchanExist(aMerchanID: Integer; aKodeSuplier : string):
        Boolean;
    { Public declarations }

    function IsKodeExist(aKodeSup:string; aKodeLama : String): Boolean;
    function cekPKP(PKP:string): Integer;
    function GetBankIDByCode(aKode: string): Integer;
    function GetTipePershByID(ID:Integer): string;
    procedure GetDataBankMer;
    procedure IsiDataForBank(aBank: Integer);
    procedure GetDataMerchandiseGroup(aKodeMerchanGroup: string);
    function getIsBKP: Integer;
    function GetKodeLama(kodeSuplier: string; merchan_ID: Integer): string;
    function getResultCheckBox(CheckBox : TCheckBox): Integer;
    function LeftCodeSuplier: string;
    procedure LoadListCbpMerchGroupAdd;
    procedure LoadDataBank(aKode: string);
    procedure LoadDatacbpTOP;
    procedure LoadDataSuplierForMerchAdd;
    procedure LoadDataSuplierForMerchEdit;
    procedure LoadDataSupplier;
    procedure LoadDataTipeSupplier;
    procedure LoadListcbpDeliverPO;
    procedure LoadListCBpPayment;
    procedure LoadListCbpPpn;
    procedure setCbbBKP;
    procedure setCbbPPN;
    procedure setCheckBox(checkBox : TCheckBox; anilai : integer);
    procedure SetDaysValue(isChecked : Boolean);
    function SimpanMerchandise: Boolean;
    function SimpanSupplier: Boolean;
  published
    property FormMode : TFormMode read FFormMode write SetFormMode;
    property KodeLama : String read FKodeLama write FKodeLama;
  end;

var
  frmDialogSupplier: TfrmDialogSupplier;

implementation

uses uTSCommonDlg;//, DB, uIntOp;

  const lenSupCode : Integer = 6;
        cSepMerch  : string = '-';

{$R *.dfm}

procedure TfrmDialogSupplier.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogSupplier := nil;
end;

procedure TfrmDialogSupplier.footerDialogMasterbtnSaveClick(
  Sender: TObject);
var
  aKode: string;
  iItemIndex: Integer;
begin
  aKode := Trim(copy(cbpMerchGroup.Text,1, Pos(cSepMerch, cbpMerchGroup.Text) - 1));
  if pc1.ActivePageIndex = 0 then
  begin
    if SimpanSupplier then
    begin
//      frmSupplier.LoadDataSupplier(FSupplier.Kode);
//      if frmSupplier.LoadListcbpMerchGroup(FSupplier.Kode) then
        frmSupplier.LoadDataMerchandise(aKode);

      Self.Close;
    end;
  end
  else
  begin
    if SimpanMerchandise then
    begin

//      if frmSupplier.LoadListcbpMerchGroup(FSupplier.Kode) then
        frmSupplier.LoadDataMerchandise(aKode);

//     if FNewSupplierMerGroup.IsBKP=1 then
//       Begin
//         iItemIndex := 0;
//       End
//     else
       Begin
         iItemIndex := 1;
       End;

      frmSupplier.cbpMerchanGroup.ItemIndex := iItemIndex;
      frmSupplier.LoadDataMerchandise(aKode);

      Self.Close;
    end;
  end;
end;

procedure TfrmDialogSupplier.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

function TfrmDialogSupplier.IsKodeExist(aKodeSup:string; aKodeLama : String):
    Boolean;
var
  sSQL: string;
begin
  Result := False ;
  sSQL := 'select count(sup_code) as jml '
          + ' from suplier '
          + ' where sup_code = ' + QuotedStr(aKodeSup)
          + ' and sup_code <> ' + QuotedStr(aKodeLama);
//  with cOpenQuery(sSQL) do
//  begin
//    try
//      if FieldByName('jml').AsInteger > 0 then
//        Result := True;
//    finally
//      Free;
//    end;
//  end;
end;

function TfrmDialogSupplier.cekPKP(PKP:string): Integer;
begin
  Result := 0;
  if PKP = 'PKP' then
    Result := 1;
end;

procedure TfrmDialogSupplier.FormCreate(Sender: TObject);
begin
  inherited;
//  FSupplier := TNewSupplier.Create(nil);
//  FNewSupplierMerGroup := TNewSupplierMerGroup.Create(nil);
//  FNewUnit := TUnit.Create(nil);
//  FMerchandise := TNewMerchadize.Create(nil);

end;

function TfrmDialogSupplier.GetTipePershByID(ID:Integer): string;
var
  sSQL: string;
begin
  Result := '' ;
  sSQL := 'select TpPersh_CODE '
          + ' from ref$tipe_Perusahaan '
          + ' where TPPERSH_ID = '+ IntToStr(ID);
//  with cOpenQuery(sSQL) do
//  begin
//    try
//      Result := FieldByName('TpPersh_CODE').AsString;
//    finally
//      Free;
//    end;
//  end;
end;

procedure TfrmDialogSupplier.edtPostCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9',#8]) then
    Key := #0; 
end;

procedure TfrmDialogSupplier.LoadDataTipePerusahaan;
var
  sSQL: String;
begin
  sSQL := 'select TPPERSH_ID,TPPERSH_CODE || ' + QuotedStr(' - ') + ' TPPERSH_NAME'
          + ' from ref$tipe_perusahaan';
          
//  cQueryToComboObject(cbTipePerusahaan, sSQL);
end;

procedure TfrmDialogSupplier.LoadDataTipeSupplier;
var
  sSQL: String;
begin
  sSQL := 'select tpsup_id,tpsup_name'
          + ' from ref$tipe_suplier';
//  cQueryToComboObject(cbTipeSupplier, sSQL);
end;

function TfrmDialogSupplier.SimpanSupplier: Boolean;
var
  FSupplierGrpNo: Integer;
  BankID: Integer;
begin
  Result := False;

   if edtSupCode.Text = '' then
   begin
     CommonDlg.ShowErrorEmpty('SUPPLIER CODE');
     edtSupCode.SetFocus;
     CommonDlg.ShowMessage(edtSupName.Text);
     Exit;
   end
   else if edtSupName.Text = '' then
   begin
     CommonDlg.ShowErrorEmpty('SUPPLIER NAME');
     edtSupName.SetFocus;
     Exit;
   end
   else if edtAddress.Text = '' then
   begin
     CommonDlg.ShowErrorEmpty('SUPPLIER ADDRESS');
     edtAddress.SetFocus;
     Exit;
   end ;

   if cbbPKP.Text = 'PKP' then
   begin

     if Trim(medtNPWP.Text) = '' then
     begin
       CommonDlg.ShowError('NPWP Belum Diisi');
       medtNPWP.SetFocus;
       Exit;
     end;
   end
   else
   begin
     edtTaxNo.Text      := '';
     medtNPWP.Text      := '';
     edtNPWPAlamat.Text := '';
   end;

   BankID := GetBankIDByCode(Trim(edKodeBank.Text));
   if BankID = 0 then
   begin
     CommonDlg.ShowError('Data Bank Masih Salah, Mohon Dikoreksi');
     edKodeBank.SetFocus;
     Exit;
   end;

   TryStrToInt(Trim(edtSuppGrpNo.Text), FSupplierGrpNo);   //if err = 0
   {
   FSupplier.UpdateData(edtAddress.Text,
     BankID,
     edtFax.Text,
     cekPKP(cbbPKP.Text),
     edtSupCode.Text,
     edtPostCode.Text,
     edtContactP.Text,
     edtCity.Text,
     edtTaxNo.Text,
     edtSupName.Text,
     medtNPWP.Text,
     edtAccountNo.Text,
     edtAccountName.Text,
     FSupplier.ServiceLevel,
     edtPhone.Text,
     cGetIDfromCombo(cbTipePerusahaan),
     cGetIDfromCombo(cbTipeSupplier),
     edtTitle.Text,
     FLoginId,
     FLoginId,
     cGetServerTime,
     cGetServerTime,
     FLoginUnitId,
     FLoginUnitId,
     (FSupplierGrpNo),
     edtCabangBank.Text,
     edtAlamatBank.Text,
     chkSupActive.Checked,
     edtNPWPAlamat.Text
     ); }
  FxGen   := 0;
  Result  := SimpanSupplierExec;
end;



procedure TfrmDialogSupplier.FormShow(Sender: TObject);

begin
  inherited;
  LoadDataTipePerusahaan;
  LoadDataTipeSupplier;

//  ClearByTag(Self,[0]);

  if FFormMode = fmAddSup then
  begin
    pc1.ActivePageIndex := 0;
  end
  else
    pc1.ActivePageIndex := 1;




//  FNewSupplierMerGroup.ClearProperties;
//  FNewUnit.ClearProperties;

  IsInsert := frmSupplier.isInsert;
  isMerchandise := frmSupplier.isMerchandise;
  isSuplier := frmSupplier.isSuplier;
  LoadListCBpPayment;
  LoadListcbpDeliverPO;
  LoadListCbpPpn;

  cbbBKP.ItemIndex := - 1;
  cbbBKP.ItemIndex := 1;
  cbbPpn.ItemIndex := 1;
  chkSupActive.Checked    := True;
  edtFee.Text       := '0';
  edtLeadTime.Text  := '0';
  chkMon.Checked    := True;
  chkTue.Checked    := True;
  chkWed.Checked    := True;
  chkThu.Checked    := True;
  chkFri.Checked    := True;
  chkSat.Checked    := True;
  chkSun.Checked    := True;
  edtDisc.Value     := 0;


  if (IsInsert = 1) and (isSuplier = True)  then
  begin
    KodeLama := '';
  end
  else if (IsInsert = 1) and (isMerchandise = True) then
  begin
    KodeLama := frmSupplier.SKode;
    pc1.ActivePageIndex := 1;
    chkEnableCN.Checked := True;
    chkAllMer.Checked   := True;

    {if FSupplier.LoadByKode(KodeLama) then
    begin
      LoadDataSuplierForMerchAdd;
      LoadListCbpMerchGroupAdd;
      SetDaysValue(True);
    end
    else }
    begin
     CommonDlg.ShowError('Data Supplier Tidak Ditemukan');
     Exit
    end;
  end
  else if (IsInsert = 0) and (isMerchandise = True) then
  begin
    LoadListCbpMerchGroupAdd;


    LoadDataMerGroup(frmSupplier.iMerchanGroup_ID);
    LoadListCbpBKP;
    cbpMerchGroup.Enabled := False;
  end;
end;

Procedure TfrmDialogSupplier.LoadListCbpBKP();
begin
//   if FNewSupplierMerGroup.IsBKP = 1 then
//     Begin
//       cbbbkp.ItemIndex := 1;
//     End
//   else
     Begin
       cbbBKP.ItemIndex := 0;
     End;

end;
procedure TfrmDialogSupplier.edKodeBankClickBtn(Sender: TObject);
var
  sSQL: String;
begin
  inherited;

  sSQL := 'select Bank_Code as Kode, bank_name as Nama'
          + ' from bank';
  {
  with cLookUp('Daftar Bank', sSQL) do
  begin
    try
      if Strings[0] = '' then
        Exit;

      edKodeBank.Text := Strings[0];
      edKodeBank.SetFocus;
      edtAccountNo.SetFocus;
    finally
      Free;
    end;
  end;  }
end;

procedure TfrmDialogSupplier.LoadDataBank(aKode: string);
var
  sSQL: String;
begin
  sSQL := 'select Bank_Code as Kode, bank_name as Nama'
          + ' from bank'
          + ' where bank_code = ' + QuotedStr(aKode);
  {
  with cOpenQuery(sSQL) do
  begin
    try
      if not Fields[0].IsNull then
      begin
        edKodeBank.Text    := FieldByName('Kode').AsString;
        edtBankName.Text   := FieldByName('Nama').AsString; 
      end
      else
      begin
        edKodeBank.Text    := '';
        edtBankName.Text   := '';
      end;
    finally
      Free;
    end;
  end;  }
end;

procedure TfrmDialogSupplier.edKodeBankKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

procedure TfrmDialogSupplier.edKodeBankExit(Sender: TObject);
begin
  inherited;
  LoadDataBank(edKodeBank.Text);
end;

procedure TfrmDialogSupplier.edKodeBankKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F5 then
    edKodeBankClickBtn(nil);
end;

function TfrmDialogSupplier.GetBankIDByCode(aKode: string): Integer;
var
  sSQL: String;
begin
  Result := 0;
  sSQL := 'select bank_id'
          + ' from bank'
          + ' where bank_code = ' + QuotedStr(aKode);

//  with cOpenQuery(sSQL) do
//  begin
//    if not Fields[0].IsNull then
//    begin
//      Result := FieldByName('bank_id').AsInteger;
//    end;
//  end;
end;



procedure TfrmDialogSupplier.LoadDataSupplier;
begin
  {
  if FSupplier.LoadByKode(frmSupplier.edtKodeSupplier.Text) then
  begin
    with FSupplier do
    begin

      edtSupCode.Text := Kode;
      cSetItemAtComboObject(cbTipePerusahaan, TipePerusahaanID);
      edtSupName.Text := Nama;
      edtAddress.Text := Alamat;
      edtCity.Text := Kota;
      edtPostCode.Text := KodePos;
      edtFax.Text := Fax;
      edtPhone.Text := Telpon;
      edtContactP.Text := KontakPerson;
      edtAccountName.Text := RekNama;
      edtAccountNo.Text := RekBank;
      edtTaxNo.Text := LRTax;

      edKodeBank.Text := Bank.Kode;
      edKodeBankExit(nil);
      edtTitle.Text := Title;

      cSetItemAtComboObject(cbTipeSupplier, TipeSupplier.ID);

      edtSuppGrpNo.Text   := IntToStr(SuppGroup.GroupNo);
      edtSuppGrpNm.Text   := SuppGroup.GroupNm;

      if IsPKP = 1 then
        cbbPKP.ItemIndex := 1
      else
        cbbPKP.ItemIndex := 0;

      medtNPWP.Text := NPWP;

      edtCabangBank.Text    := CabangBank;
      edtAlamatBank.Text    := AlamatBank;
      chkSupActive.Checked  := SupIsActive;
    end;
  end
  else
  begin
    CommonDlg.ShowMessage('Tidak bisa load data suplier');
  end; }
end;

procedure TfrmDialogSupplier.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogSupplier.LoadDatacbpTOP;
var
  sSQL: string;
begin
  sSQL := ' select TPBYR_ID, TPBYR_NAME '
          + ' from ref$tipe_pembayaran ';


end;

function TfrmDialogSupplier.getIsBKP: Integer;
begin
  result := 0;
  if Trim(cbbBKP.Text) = 'NON BKP' then
    Result := 0
  else if Trim(cbbBKP.Text) = 'BKP' then
    result := 1
  else begin
    //CommonDlg.ShowMessage('Cek BKP/Non BKP');
    Exit;
  end;

end;

function TfrmDialogSupplier.getResultCheckBox(CheckBox : TCheckBox): Integer;
begin
  Result := 0;
  if CheckBox.Checked = True then
    Result := 1;
end;

procedure TfrmDialogSupplier.LoadDataSuplierForMerchAdd;
begin
  {edtAddrMer.Text := FSupplier.Alamat;
  edtCityMer.Text := FSupplier.Kota;
  edtPostCodeMer.Text := FSupplier.KodePos;
  edtPhoneMer.Text := FSupplier.Telpon;
  edtFaxMer.Text := FSupplier.Fax;
  edtContactMer.Text := FSupplier.KontakPerson;
  edtTitleMer.Text := FSupplier.Title;
  IsiDataForBank(FSupplier.Bank.ID);
  edtBankAccNameMer.Text := FSupplier.RekNama;
  edtBankAccNoMer.Text := FSupplier.RekBank;
  }
end;

procedure TfrmDialogSupplier.setCbbBKP;
begin
//  if FNewSupplierMerGroup.IsBKP = 0 then
//    cbbBKP.ItemIndex := 0
//  else
    cbbBKP.ItemIndex := 1;
end;

procedure TfrmDialogSupplier.setCheckBox(checkBox : TCheckBox; anilai :
    integer);
begin
  if anilai = 0 then
    checkBox.Checked := False
  else
    checkBox.Checked := True;
end;

function TfrmDialogSupplier.SimpanMerchandise: Boolean;
var
  aNama: string;
  iMerchGrp: Integer;
  isAdaOldMerchanGrup: Boolean;
  i: Integer;
  aDisc: Double;
  aPajak_ID: Integer;
  strErr: string;
  aTipeKirimPO, aTipeKirimPOUnit_ID, aTipePembayaran, aTipePembayaranUnit_ID: Integer;
  aLastPayment, aLastPurchase : TDateTime;
  aIsFri, aIsIDDiff, aIsMon, aIsSat,aIsSun,aIsThu, aIsWed, aIsTue, aLeadTime  : Integer;
  aMerchandizeUnit_ID, aNewMerchadize_ID, aNewUnit_ID, aNoOfPO, aSupplierUnit_ID : Integer;
  aAPEndingBalance, aCNBalance, aCreditLimit, aFee, aOutStandingPayment: Double;
  aAddress, aBankAccountName, aBankAccountNo, aCity, aDescription, aFax: string;
  aKode, aKontakPerson, aNewSupplier_Kode, aPostCode, aTelp, aTitle : string;
  aBankID, aBankUnit_ID, aISEnableCN,aIsFee4All, aIsBKP, aTOP : Integer;
begin
  Result                  := False;
  isAdaOldMerchanGrup     := False;
  curedtAPEndB.Value      := 0;
  curedtCNBln.Value       := 0;
  curedtAPEndB.Value      := 0;
  curedtPaymnt.Value      := 0;
  curedtOutsdPaymnt.value := 0;
  {
  if chkIsDif.Checked then
  begin
    aAddress              := edtAddrMer.Text ;
    aAPEndingBalance      := curedtAPEndB.Value ;
    aBankAccountName      := edtBankAccNameMer.Text;
    aBankAccountNo        := edtBankAccNoMer.Text;

    with TBank.Create(Self) do
    begin
      try
        if LoadByKode(cbpBankCodeMer.Text) then
          aBankID := ID
        else
        begin
          CommonDlg.ShowError('Data Bank Masih Salah');
          cbpBankCodeMer.SetFocus;
          Exit;
        end;
      finally
        Free;
      end;
    end;

    aBankUnit_ID          := DialogUnit;
    aCity                 := edtCityMer.Text;
    aCNBalance            := curedtCNBln.Value;
    aCreditLimit          := curedtCreditLmt.Value;
    aDescription          := edtExtdDesc.Text;
    aFax                  := edtFaxMer.Text;
    TryStrToFloat(edtFee.Text, aFee);
    aIsBKP                := getIsBKP;
  end
  else
  begin
    aAddress              := FSupplier.Alamat ;
    aAPEndingBalance      := curedtAPEndB.Value ;
    aBankAccountName      := FSupplier.RekNama;
    aBankAccountNo        := FSupplier.RekBank;

    if FSupplier.Bank.ID > 0 then
      aBankID               := FSupplier.Bank.ID
    else
    begin
      CommonDlg.ShowError('Data Bank Masih Salah');
      //cbpBankCodeMer.SetFocus;
      Exit;
    end;


    aBankUnit_ID          := DialogUnit;
    aCity                 := FSupplier.Kota;
    aCNBalance            := curedtCNBln.Value;
    aCreditLimit          := curedtCreditLmt.Value;
    aDescription          := edtExtdDesc.Text;
    aFax                  := FSupplier.Fax;
    TryStrToFloat(edtFee.Text, aFee);
    aIsBKP                := getIsBKP;
  end;

  if (not aIsBKP in [0,1]) or (Trim(cbbBKP.Text) = '') then
  begin
    CommonDlg.ShowError('BKP/NON BKP Belum Diisi');
    cbbBKP.SetFocus;
    Exit;
  end;

  aISEnableCN           := getResultCheckBox(chkEnableCN);
  aIsFee4All            := getResultCheckBox(chkFee);
  aIsFri                := getResultCheckBox(chkFri);
  aIsIDDiff             := getResultCheckBox(chkIsDif) ; //asIs ID Diff;
  aIsMon                := getResultCheckBox(chkMon) ;
  aIsSat                := getResultCheckBox(chkSat);
  aIsSun                := getResultCheckBox(chkSun);
  aIsThu                := getResultCheckBox(chkThu);
  aIsTue                := getResultCheckBox(chkTue);
  aIsWed                := getResultCheckBox(chkWed);
  aKode                 := aKodeLama;
  //posisi edit pengisian aKode pada saat form show
  aKontakPerson         := edtContactMer.Text;
  aLastPayment          := curedtPaymnt.Value;
  aLastPurchase         := dtLastPurchs.Date;
  TryStrToInt(edtLeadTime.Text, aLeadTime);
  aMerchandizeUnit_ID   := DialogUnit;

  aNewMerchadize_ID     := cGetIDfromCombo(cbpMerchGroup) ;// diisi pada waktu cbpMerchGroupClickBtn
  aNewSupplier_Kode     := frmSupplier.edtKodeSupplier.Text;
  aNewUnit_ID           := DialogUnit ;

  TryStrToInt(edtNoOfPO.Text, aNoOfPO);

  aOutStandingPayment   := curedtOutsdPaymnt.value;
  aPostCode             := edtPostCodeMer.Text;
  aSupplierUnit_ID      := DialogUnit;
  aTelp                 := edtPhoneMer.Text;
  aTipeKirimPO          := cGetIDfromCombo(cbpDeliverPO);
  aTipeKirimPOUnit_ID   := DialogUnit;
  aTipePembayaran       := cGetIDfromCombo(cbpPayment);
  aTipePembayaranUnit_ID:= DialogUnit;
  aTitle                := edtTitleMer.Text;
  TryStrToInt(edtTermOP.Text, aTOP);

  aPajak_ID := cGetIDfromCombo(cbbPpn);
  aDisc     := edtDisc.Value;
  aNama     := Copy(edtSupCode.Text + edtMerGrup.Text, 1, 60);

  if isInsert = 0 then
  begin
    if FNewSupplierMerGroup.NewMerchadizeGroup.ID <> cGetIDfromCombo(cbpMerchGroup)  then
    begin
      if IsKodeMerchanExist(cGetIDfromCombo(cbpMerchGroup),frmSupplier.edtKodeSupplier.Text) then
      begin
        CommonDlg.ShowMessage('Anda sudah menset kode suplier ' + frmSupplier.edtSupName.Text
        + ' dengan kode merchandise group ' + cbpMerchGroup.Text);
        cbpMerchGroup.SetFocus;
        Exit;
      end;
    end;
  end
  else
  if isInsert = 1 then
  begin
    if IsKodeMerchanExist(cGetIDfromCombo(cbpMerchGroup),frmSupplier.edtKodeSupplier.Text) then
    begin
        CommonDlg.ShowMessage('Anda sudah menset kode suplier ' + frmSupplier.edtSupName.Text
        + ' dengan kode merchandise group ' + cbpMerchGroup.Text);
        cbpMerchGroup.SetFocus;

        isAdaOldMerchanGrup := True;

        if chkAllMer.Checked then
        begin
          CommonDlg.ShowMessage('Akan dilakukan konfigurasi kode suplier dengan kode divisi yang berbeda');
        end
        else
          Exit;
    end;
  end;

  if aTOP <= 0 then
  begin
    CommonDlg.ShowError('TOP Belum Diisi');
    edtTermOP.SetFocus;
    Exit;
  end
  else
  if aLeadTime <= 0 then
  begin
    CommonDlg.ShowError('Lead Time Belum Diisi');
    edtLeadTime.SetFocus;
    Exit;
  end
  else

  if edtFee.Text = '' then
  begin
    CommonDlg.ShowMessage('Fee Kosong');
    edtFee.SetFocus;
    Exit;
  end;

  FNewSupplierMerGroup.UpdateData(
                      aAddress,
                      aAPEndingBalance,
                      aBankAccountName,
                      aBankAccountNo,
                      aBankID,
                      aCity,
                      aCNBalance,
                      aCreditLimit,
                      aDescription,
                      aFax,
                      aFee,
                      aIsBKP,
                      aISEnableCN,
                      aIsFee4All,
                      aIsFri,
                      aIsIDDiff,
                      aIsMon,
                      aIsSat,
                      aIsSun,
                      aIsThu,
                      aIsTue,
                      aIsWed,
                      aKode, // posisi insert diisi 0 edit ambil dari fnewsuplierMerchgroup.kode
                      aKontakPerson,
                      aLastPayment,
                      aLastPurchase,
                      aLeadTime,
                      aNewMerchadize_ID,
                      aNewSupplier_Kode,
                      aNoOfPO,
                      aOutStandingPayment,
                      aPostCode,
                      aTelp,
                      aTipeKirimPO,
                      aTipePembayaran,
                      aTitle,
                      aTOP,
                      aPajak_ID,
                      aDisc,
                      aNama
                      );



  try
    cShowWaitWindow;
    self.Enabled  := False;
    try
      if not isAdaOldMerchanGrup then
        FNewSupplierMerGroup.ExecuteGenerateSQL(aKodelama);
      if (chkAllMer.Checked) and (isInsert = 1) then
      begin
        for i := 0 to cbpMerchGroup.Items.Count - 1 do
        begin
          iMerchGrp :=  cGetIDfromCombo(cbpMerchGroup, i);

          if IsKodeMerchanExist(cGetIDfromCombo(cbpMerchGroup, i),frmSupplier.edtKodeSupplier.Text) then
          begin
            Continue;
          end
          else
          begin

            FNewSupplierMerGroup.SetIDMerchanGroup(iMerchGrp);
          end;

          aKodeLama := GetKodeLama(frmSupplier.edtKodeSupplier.Text, iMerchGrp);

          FNewSupplierMerGroup.ExecuteGenerateSQL(aKodelama);



        end;
      end;
    finally
      cCloseWaitWindow;
      self.Enabled  := True;
    end;

    cCommitTrans;
    CommonDlg.ShowMessage('Pengisian data mercandise grup berhasil');
    Result := True;
    close;
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
}
end;

procedure TfrmDialogSupplier.cbpBankCodeMerClickBtn(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := 'select Bank_Code as Kode, bank_name as Nama'
          + ' from bank';

//  with cLookUp('Daftar Bank', sSQL) do
//  begin
//    try
//      if Strings[0] = '' then
//        Exit;
//
//      cbpBankCodeMer.Text := Strings[0];
//      cbpBankCodeMer.SetFocus;
//      edtBankCodeMer.SetFocus;
//    finally
//      Free;
//    end;
//  end;
end;

procedure TfrmDialogSupplier.cbpBankCodeMerExit(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := 'select Bank_Code as Kode, bank_name as Nama'

          + ' from bank'
          + ' where bank_code = ' + QuotedStr(cbpBankCodeMer.Text);
  {
  with cOpenQuery(sSQL) do
  begin
    try
      if not Fields[0].IsNull then
      begin
        cbpBankCodeMer.Text := FieldByName('Kode').AsString;
        edtBankCodeMer.Text := FieldByName('Nama').AsString;

      end
      else
      begin
        cbpBankCodeMer.Text := '';
        edtBankCodeMer.Text := '';
      end;
    finally
      Free;
    end;
  end;  }
end;

procedure TfrmDialogSupplier.cbpMerchGroup1ClickBtn(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
 sSQL := ' select merchangrup_code, merchangrup_name, MERCHANGRUP_ID '
         + ' from ref$merchandise_grup ';
  {
  with cLookUp('daftar Merchandise Grup', sSQL) do
  begin
    try
      if Strings[0] = '' then
        Exit;

      cbpMerchGroup.Text := Strings[0];
      edtMerGrup.Text := Strings[1];
      imerchandise := strToInt(Strings[2]);
      cbpMerchGroup.SetFocus;
      edtMerGrup.SetFocus;
    finally
      Free;
    end;
  end; }
end;

procedure TfrmDialogSupplier.cbpMerchGroupExit(Sender: TObject);
begin
  if cbpMerchGroup.Text = '' then
     exit
  else
  begin
    edtMerGrup.Text := GetMerGroupName(cbpMerchGroup.Text);
//    LoadDataMerGroup(cGetIDfromCombo(cbpMerchGroup));
  end
end;

function TfrmDialogSupplier.IsKodeMerchanExist(aMerchanID: Integer;
    aKodeSuplier : string): Boolean;
var
  sSQL: string;
begin
  Result := False ;
  sSQL := 'select supMG_sub_code '
          + ' from suplier_merchan_grup '
          + ' where supmg_code = ' + QuotedStr(aKodeSuplier)
          + ' and SUPMG_MERCHANGRUP_ID = ' + IntToStr(aMerchanID);
  {
  with cOpenQuery(sSQL) do
  begin
    if not FieldByName('supMG_sub_code').IsNull then
    begin
      Result := True
    end;
  end; }
end;

procedure TfrmDialogSupplier.IsiDataForBank(aBank: Integer);
var
  sSQL: string;
begin
  sSQL := ' select BANK_CODE, BANK_NAME'

          + ' from bank '
          + ' where BANK_ID = ' + IntToStr(aBank);
  {with cOpenQuery(sSQL) do
  begin
    try
      if not FieldByName('BANK_CODE').IsNull then
      begin
        cbpBankCodeMer.Text := fieldbyName('BANK_CODE').AsString;
        edtBankCodeMer.Text := fieldbyName('BANK_NAME').AsString;

      end
    finally
      Free
    end;
  end; }
end;

procedure TfrmDialogSupplier.GetDataMerchandiseGroup(aKodeMerchanGroup: string);
var
  sSQL: string;
begin
    sSQL := ' select MERCHANGRUP_CODE, MERCHANGRUP_NAME '
          + ' from ref$merchandise_grup '
          + '  where MERCHANGRUP_CODE = ' + QuotedStr(aKodeMerchanGroup);
  {with cOpenQuery(sSQL) do
  begin
    try
      if not FieldByName('MERCHANGRUP_CODE').IsNull then
      begin
        cbpMerchGroup.Text := FieldByName('MERCHANGRUP_CODE').AsString;
        edtMerGrup.Text := FieldByName('MERCHANGRUP_NAME').AsString;
      end;
    finally
      Free
    end;
  end }
end;

function TfrmDialogSupplier.GetKodeLama(kodeSuplier: string; merchan_ID:
    Integer): string;
var
  sSQL: string;
begin
  Result := '';
  sSQL := ' select supmg_sub_code '
          + ' from suplier_merchan_grup '
          + ' where supmg_code = ' + QuotedStr(kodeSuplier)
          + ' and supMG_merchangrup_id = ' + IntToStr(merchan_ID);
  {with cOpenQuery(sSQL) do
  begin
    try
      if not FieldByName('supmg_sub_code').IsNull then
        Result := fieldByName('supmg_sub_code').AsString
      else
        //CommonDlg.ShowMessage('kode suplier merchan grup tidak ditemukan');
    finally
      Free;
    end;
  end; }
end;

procedure TfrmDialogSupplier.LoadDataSuplierForMerchEdit;
begin
  {edtAddrMer.Text := FNewSupplierMerGroup.Address;
  edtCityMer.Text := FNewSupplierMerGroup.City;
  edtPhoneMer.Text := FNewSupplierMerGroup.Telp;
  edtPostCodeMer.Text := FNewSupplierMerGroup.PostCode;
  edtFaxMer.Text := FNewSupplierMerGroup.Fax;
  edtContactMer.Text := FNewSupplierMerGroup.KontakPerson;
  edtTitleMer.Text := FNewSupplierMerGroup.Title;
  GetDataBankMer;
  edtBankAccNameMer.Text := FNewSupplierMerGroup.BankAccountName;
  edtBankAccNoMer.Text := FNewSupplierMerGroup.BankAccountNo;
  }
end;

procedure TfrmDialogSupplier.LoadListcbpDeliverPO;
var
  sSQL: string;
begin
  sSQL := 'select TPKRMPO_ID, TPKRMPO_NAME '
          + ' from ref$tipe_kirim_PO ';
//  cQueryToComboObject(cbpDeliverPO,sSQL);
end;

procedure TfrmDialogSupplier.LoadListCBpPayment;
var
  sSQL: string;
begin
  sSQL := ' select TPBYR_ID,TPBYR_NAME '
          + ' from ref$tipe_pembayaran ';
//  cQueryToComboObject(cbpPayment,sSQL);

end;

procedure TfrmDialogSupplier.edtFeeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9',#8]) then
    Key := #0;
end;

procedure TfrmDialogSupplier.chkIsDifClick(Sender: TObject);
begin
  inherited;
  with chkIsDif do
  begin
    if Checked = True then
    begin
      edtAddrMer.Enabled := True;
      edtCityMer.Enabled := True;
      edtPhoneMer.Enabled := True;
      edtPostCodeMer.Enabled := True;
      edtFaxMer.Enabled := True;
      edtContactMer.Enabled := True;
      edtTitleMer.Enabled := True;
      edtBankCodeMer.Enabled := True;
      edtBankBranch.Enabled := True;
      edtBankAddrss.Enabled := True;
      cbpBankCodeMer.Enabled := True;
      edtBankAccNameMer.Enabled := True;
      edtBankAccNoMer.Enabled := True;

    end else if Checked = False then
    begin
      edtAddrMer.Enabled := False;
      edtCityMer.Enabled := False;
      edtPhoneMer.Enabled := False;
      edtPostCodeMer.Enabled := False;
      edtFaxMer.Enabled := False;
      edtContactMer.Enabled := False;
      edtTitleMer.Enabled := False;
      edtBankCodeMer.Enabled := False;
      edtBankBranch.Enabled := False;
      edtBankAddrss.Enabled := False;
      cbpBankCodeMer.Enabled := False;
      edtBankAccNameMer.Enabled := False;
      edtBankAccNoMer.Enabled := False;
    end;
  end;
end;

procedure TfrmDialogSupplier.GetDataBankMer;
var
  sSQL: string;
begin
  sSQL := 'select bank_code, bank_name'
//          + ' , BANK_BRANCH, BANK_ADDRESS
          + ' from bank'
;//          + ' where bank_id = ' + IntToStr(FNewSupplierMerGroup.Bank.ID);
  {with cOpenQuery(sSQL) do
  begin
    try
      if not Fields[0].IsNull then
      begin
        cbpBankCodeMer.Text := FieldByName('bank_code').AsString;
        edtBankCodeMer.Text := FieldByName('bank_name').AsString;
      end;
    finally
      Free;
    end;
  end;}
end;

function TfrmDialogSupplier.GetMerGroupName(aMerchanGrupKode: String): string;
var
  sSQL: string;
begin
  Result := '';
  sSQL := ' select MERCHANGRUP_NAME '
          + ' from ref$merchandise_grup '
          + '  where MERCHANGRUP_CODE = '
          + QuotedStr(Copy(cbpMerchGroup.Text, 1, Pos(cSepMerch, cbpMerchGroup.Text) - 1));
  {with cOpenQuery(sSQL) do
  begin
    try
      if not FieldByName('MERCHANGRUP_NAME').IsNull then
      begin
        Result  := FieldByName('MERCHANGRUP_NAME').AsString;
  
      end;
    finally
      Free
    end;
  end; }

end;

procedure TfrmDialogSupplier.LoadDataMerGroup(aMerchanGrupID: Integer);
var
  merchan_ID: Integer;
begin
  merchan_ID := aMerchanGrupID;
  aKodeLama := GetKodeLama(frmSupplier.edtKodeSupplier.Text, merchan_ID);
  {if FNewSupplierMerGroup.LoadByKode(aKodelama) then
  begin
    //LoadListCbpMerchGroupAdd;
    cSetItemAtComboObject(cbpMerchGroup,merchan_ID);
    cSetItemAtComboObject(cbpPayment,FNewSupplierMerGroup.TipePembayaran.ID);
    edtMerGrup.Text := GetMerGroupName(cbpMerchGroup.Text);
    edtTermOP.Text := IntToStr(FNewSupplierMerGroup.TOP);
    edtLeadTime.Text := IntToStr(FNewSupplierMerGroup.LeadTime);
    edtDisc.Value   := FNewSupplierMerGroup.Disc;
    cSetItemAtComboObject(cbpDeliverPO,FNewSupplierMerGroup.TipeKirimPO.ID);

    curedtCreditLmt.Value := FNewSupplierMerGroup.CreditLimit;
    edtExtdDesc.Text := FNewSupplierMerGroup.Description;
    curedtAPEndB.Value := FNewSupplierMerGroup.APEndingBalance;
    curedtCNBln.Value := FNewSupplierMerGroup.CNBalance;
    dtLastPurchs.Date := FNewSupplierMerGroup.LastPurchase;
    curedtPaymnt.Value := FNewSupplierMerGroup.LastPayment ;
    curedtOutsdPaymnt.Value := FNewSupplierMerGroup.OutStandingPayment;
    edtNoOfPO.Text := IntToStr(FNewSupplierMerGroup.NoOfPO);
    edtFee.Text := FloatToStr(FNewSupplierMerGroup.Fee);
    setCbbBKP;
    setCbbPPN;
    setCheckBox(chkFee, FNewSupplierMerGroup.IsFee4All);
    setCheckBox(chkEnableCN, FNewSupplierMerGroup.ISEnableCN);
    setCheckBox(chkMon, FNewSupplierMerGroup.IsMon);
    setCheckBox(chkTue, FNewSupplierMerGroup.IsTue);
    setCheckBox(chkWed, FNewSupplierMerGroup.IsWed);
    setCheckBox(chkThu, FNewSupplierMerGroup.IsThu);
    setCheckBox(chkFri, FNewSupplierMerGroup.IsFri);
    setCheckBox(chkSat, FNewSupplierMerGroup.IsSat);
    setCheckBox(chkSun, FNewSupplierMerGroup.IsSun);
    LoadDataSuplierForMerchEdit ;

  end;
  }
  LoadDataSupplier;
end;

procedure TfrmDialogSupplier.LoadListCbpMerchGroupAdd;
var
  sSQL: string;
begin
  sSQL := 'select MERCHANGRUP_ID,MERCHANGRUP_CODE || '+ QuotedStr(' '+ cSepMerch + ' ') + ' || MERCHANGRUP_NAME '
          + ' from ref$merchandise_grup ';

//  cQueryToComboObject(cbpMerchGroup,sSQL);

end;

procedure TfrmDialogSupplier.cbbPKPChange(Sender: TObject);
begin
  inherited;
  if cbbPKP.ItemIndex = 0 then
  begin
    edtTaxNo.Text := '';
    medtNPWP.Text := '';
  end;
end;

procedure TfrmDialogSupplier.edtSuppGrpNoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sSQL  : string;
begin
  inherited;
  if Key = vk_F5 then
  begin
    sSQL := 'SELECT GROUP_NO AS ID, GROUP_NAME AS NAMA, GROUP_DESCRIPTION'
          + ' AS "KETERANGAN"'
          + ' FROM SUPLIER_GROUP';
    {
    with cLookUp('Data Grup Suplier', sSQL) do
    begin
      try
        if Strings[0] <> '' then
        begin
          edtSuppGrpNo.Text := Strings[0];
          edtSuppGrpNm.Text := Strings[1]
        end;
      finally
        Free;
      end; 
    end;
    }
  end;

end;

procedure TfrmDialogSupplier.SetDaysValue(isChecked : Boolean);
begin
  // TODO -cMM: TfrmDialogSupplier.SetDaysValue default body inserted
  chkMon.Checked := isChecked;
  chkTue.Checked := isChecked;
  chkWed.Checked := isChecked;
  chkThu.Checked := isChecked;
  chkFri.Checked := isChecked;
  chkSat.Checked := isChecked;
  chkSun.Checked := isChecked;
end;

procedure TfrmDialogSupplier.edtSupNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  edtSupCode.Text := LeftCodeSuplier;
end;

function TfrmDialogSupplier.LeftCodeSuplier: string;
var
  sLeftCode : string;
  i         : Integer;
  iLen      : Integer;
  sSupNm    : string;
  sSep      : string;
begin
  sSep    := ' ';
  sSupNm  := Trim(edtSupName.Text);

  iLen      := 3;
  sLeftCode := Copy(sSupNm, 1, 1);

  i := 1;
  while Pos(sSep, sSupNm) > 0 do
  begin
    Inc(i);
    sLeftCode := sLeftCode + Copy(sSupNm, Pos(sSep, sSupNm) + 1, 1);
    sSupNm[Pos(sSep, sSupNm)] := '0';

    if i = iLen then
      Break;
  end;

  Result := UpperCase(sLeftCode);
end;

procedure TfrmDialogSupplier.edtSupNameExit(Sender: TObject);
var
  iSecond : Integer;
  iFirst  : Integer;
  sRight  : string;
  sCode   : string;
  sSQl    : string;
begin
  inherited;
  edtSupCode.Text := LeftCodeSuplier;

  sSQl := 'select a.SUP_CODE from SUPLIER a'
        + ' where a.SUP_CODE like '+ QuotedStr(edtSupCode.Text + '%')
        + ' order by a.SUP_CODE';
  iSecond := 0;
  {
  with cOpenQuery(sSQl) do
  begin
    try
      if not Fields[0].IsNull then
      begin
        while not Eof do
        begin
          sRight := Copy(Fields[0].AsString, Length(Trim(edtSupCode.Text)) + 1,
                  Length(Fields[0].AsString) - Length(Trim(edtSupCode.Text)));

          if TryStrToInt(sRight, iFirst) then
          begin
            if iFirst >  iSecond then
              iSecond := iFirst;
          end;

          next;
        end;

        sRight := inttostr(iSecond);
        sCode  := Trim(edtSupCode.Text) + uIntOpLead('0', lenSupCode -
                      Length(Trim(edtSupCode.Text)), StrToInt(sRight) + 1);

      end
      else
      begin
        sCode  := Trim(edtSupCode.Text) + uIntOpLead('0', lenSupCode -
                    Length(Trim(edtSupCode.Text)), 1);
      end;  

    finally
      Free;
      edtSupCode.Text := sCode;
    end;
  end;  }
end;

procedure TfrmDialogSupplier.cbbBKPChange(Sender: TObject);
begin
  inherited;
  if cbbBKP.ItemIndex = 0 then
    cbbPpn.ItemIndex := 0
  else
    cbbPpn.ItemIndex := 1;

end;

procedure TfrmDialogSupplier.LoadListCbpPpn;
var
  sSQL: string;
begin
  sSQL := ' SELECT PJK_ID, PJK_NAME '
          + ' FROM REF$PAJAK '
          + ' WHERE (PJK_NAME LIKE '+ QuotedStr('PPN %')
          + ' OR  PJK_NAME LIKE '+ QuotedStr('%PPN')
          + ' )'
          + ' ORDER BY PJK_CODE ';
//  cQueryToComboObject(cbbPpn, sSQL);

end;

procedure TfrmDialogSupplier.setCbbPPN;
begin
  {if FNewSupplierMerGroup.PjkId = 0 then
  begin
    if FNewSupplierMerGroup.IsBKP <> 0 then
      cbbPpn.ItemIndex := 1;
  end
  else
  begin
    cSetItemAtComboObject(cbbPpn ,FNewSupplierMerGroup.PjkId);
  end;
  }
end;

function TfrmDialogSupplier.SimpanSupplierExec: Boolean;
var
  strErr: string;
begin
  Result := False;
  Inc(FxGen);
  {
  try
    FSupplier.ExecuteGenerateSQL(FKodeLama);
    Result := True;

  except
    on E: EIBError do
    begin
      cRollbackTrans;

      if e.IBErrorCode = 335544665 then   //err primary ato unique key
      begin

        if FxGen > iMaxGen then
        begin
          strErr := GetForeignTable(e.Message);
          if strErr <> '' then
            CommonDlg.ShowError(strErr)
          else
            CommonDlg.ShowError(e.Message);

          exit;
        end;

        //generate ulang kode suplier
        edtSupNameExit(nil);
        FSupplier.Kode := edtSupCode.Text;
        //rekursif
        Result := SimpanSupplierExec;

      end
      else if e.IBErrorCode = 335544345 then //err lock conflict
      begin
        //wait 10 s until unlock
        cShowWaitWindow('Transaction waiting in 10s');
        Sleep(10000);
        cCloseWaitWindow;
        //rekursif
        Result := SimpanSupplierExec;
      end
      else
        CommonDlg.ShowError('Kode Eror '+ IntToStr(e.IBErrorCode) + #13
                           + ' Pengisian data gagal');

    end;
  end;}
end;

end.
