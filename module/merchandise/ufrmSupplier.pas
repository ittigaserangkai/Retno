unit ufrmSupplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls, DB,
  ActnList, Menus, uConstanta, uRetnounit, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  System.Actions, cxCurrencyEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxStyles, cxClasses, cxButtonEdit;

type
  TRefreshMode = (refFormShow, refEdit);

  TfrmSupplier = class(TfrmMaster)
    lbl2: TLabel;
    lbl3: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl10: TLabel;
    lbEnCreateCN: TLabel;
    Label1: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    edtSupName: TEdit;
    edtAddr: TEdit;
    edtCity: TEdit;
    lbl18: TLabel;
    edtPostcode: TEdit;
    edtPhone: TEdit;
    lbl19: TLabel;
    edtFaxNo: TEdit;
    edtContactPerson: TEdit;
    edtSuplierTipe: TEdit;
    edtPKP: TEdit;
    edtNPWP: TEdit;
    chkEnableCN: TCheckBox;
    edtExtendDescr: TEdit;
    edtBankCode: TEdit;
    edtBankName: TEdit;
    edtBankAccName: TEdit;
    dtUserCreate: TcxDateEdit;
    lbl20: TLabel;
    edtUserCreate: TEdit;
    edtAPEndingBlnc: TcxCurrencyEdit;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    edtTittle: TEdit;
    edtCreditLimt: TcxCurrencyEdit;
    edtTypePaymnt: TEdit;
    edtTermPayment: TEdit;
    lbl27: TLabel;
    lbl28: TLabel;
    edtLeadTime: TEdit;
    edtDeliverPO: TEdit;
    edtBankAccNo: TEdit;
    bvl1: TBevel;
    lblDayOfPO: TcxLabel;
    lbl30: TLabel;
    lbl31: TcxLabel;
    lbl32: TLabel;
    lbl33: TLabel;
    edtNoOfPO: TEdit;
    lbl34: TLabel;
    lbl35: TLabel;
    bvl2: TBevel;
    edtLastPayment: TcxCurrencyEdit;
    fraFooter5Button1: TfraFooter5Button;
    actlstSupplier: TActionList;
    actAddSupplier: TAction;
    actEditSupplier: TAction;
    actDeleteSupplier: TAction;
    actRefreshSupplier: TAction;
    lbl36: TLabel;
    edtTaxNo: TEdit;
    lbl37: TLabel;
    edtMerchGroupName: TEdit;
    dtLastPurchase: TcxDateEdit;
    edtCNBalance: TcxCurrencyEdit;
    lbl9: TLabel;
    edtOutstandingpayment: TcxCurrencyEdit;
    edtDayOfPO: TEdit;
    ppmn1: TPopupMenu;
    AddSupplier1: TMenuItem;
    AddMerchandiseGroup1: TMenuItem;
    edtUserModify: TEdit;
    Label2: TLabel;
    dtUserModify: TcxDateEdit;
    Label3: TLabel;
    edtBKP: TEdit;
    Label4: TLabel;
    actUpdateBank: TAction;
    Label5: TLabel;
    edtKodeSupplier: TcxButtonEdit;
    edtJenisPeruhaan: TEdit;
    cbpMerchanGroup: TComboBox;
    ppmn2: TPopupMenu;
    DeleteSuplier: TMenuItem;
    DeleteMErchandise: TMenuItem;
    Label6: TLabel;
    edtBankBranch: TEdit;
    Label7: TLabel;
    edtBankAddrss: TEdit;
    chkSupIsActive: TCheckBox;
    edtDisc: TcxCurrencyEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label8: TLabel;
    edtNpwpAlamat: TEdit;

    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actAddSupplierExecute(Sender: TObject);
    procedure actEditSupplierExecute(Sender: TObject);
    procedure actRefreshSupplierExecute(Sender: TObject);
    procedure fraFooter5Button1btnRefreshClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actUpdateBankExecute(Sender: TObject);
    procedure edtKodeSupplierClickBtn(Sender: TObject);
    procedure edtKodeSupplierKeyPress(Sender: TObject; var Key: Char);
    procedure edtKodeSupplierKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure AddSupplier1Click(Sender: TObject);
    procedure AddMerchandiseGroup1Click(Sender: TObject);
    procedure actDeleteSupplierExecute(Sender: TObject);
    procedure DeleteSuplierClick(Sender: TObject);
    procedure DeleteMErchandiseClick(Sender: TObject);
    procedure lblDayOfPOClick(Sender: TObject);
    procedure lbl31Click(Sender: TObject);
    procedure cbpMerchanGroupChange(Sender: TObject);
    procedure fraFooter5Button1btnCloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
//    FSuplier : TNewSupplier;
//    FNewUnit: TUnit;
//    FsuplierMerchGroup : TNewSupplierMerGroup;

  public
    { Public declarations }
//    dataSUPMerchanGrup: TreeDataSuplierMerchanGrup;
    FRefreshMode: TRefreshMode;
    SKode: string;
    iMerchanGroup_ID: Integer;
    isMerchandise : Boolean;
    isSuplier : Boolean;
    isInsert : Integer;
    SKodeMerchan : String;
    //==var 4 update=====================================================
    SupCode4update,SUPMG_SUB_CODE: string;
    UntID4update,IDBankSup4update,SupType4update: Integer;
    MerID4update,IDBankMer4update,TypePay4update,Deliver4update: Integer;
    IsPKP4update,IsBKP4update,IsDiff4update: Integer;
    //==var 4 update=====================================================

    //===================================================================#
    dataCompany: TDataSet;
    dataSuplier: TDataSet;
    dataCodeSuplier: TDataSet;
//    dataIDMerchanGrup: TreeDataMerchantGroup;
    dataTipePersh: TDataSet;
    isMon,isTue,isWed,isThu,isFri,isSat,isSun: ShortInt;
    //===================================================================#
    FIsProcessSuccessfull: boolean;
    modeInsert: Integer;
    function getBKP(IsBKP: Integer): string;
    function GetDataforDeliverPO(aTipePengiriman: Integer): string;
    function GetDAtaForTipePayment(aTipePembayaran: Integer): string;
    procedure GetDataMerchandiseGroup(aKodeMerchanGroup: string);
    function getKodeMerchandise(KodeSuplier: string; merchanID: Integer): string;
    function GetListKodeMerchandise(aKodeSuplier: string): TStrings;
    function GetUserNameByID(aOP_Create : Integer; aUnitID : Integer): string;
    procedure LoadDataMerchandise(aKodeMer : String);
    procedure LoadDataSupplier(aKode: string);
    procedure LoadedtOfPO;
    function LoadListcbpMerchGroup(aSupKode: String): Boolean;
    procedure SetActiveFooter5Button(AIsActive: boolean);
    procedure setchkEnableCN(IsEnableCN : Integer);

  end;

var
  frmSupplier: TfrmSupplier;
  FoundSup,FoundMer: Boolean;

implementation

uses ufrmDayOfPO, ufrmOutstandingPO, uTSCommonDlg, ufrmDialogSupplier,
  ufrmSearchSupplier, ufraHistoriPOByProduct;

{$R *.dfm}

procedure TfrmSupplier.FormDestroy(Sender: TObject);
begin
  inherited;
  frmSupplier := nil;
end;

procedure TfrmSupplier.FormCreate(Sender: TObject);
begin
  inherited;
//  DecimalSeparator := '.';
//  ThousandSeparator := ',';
  with FormatSettings do
  begin
    CurrencyString := '';
    CurrencyFormat := 2;
    CurrencyDecimals := 2;
    UntID4update := 0;
//    FSuplier := TNewSupplier.Create(Self);
//    FNewUnit := TUnit.Create(Self);
//    FsuplierMerchGroup := TNewSupplierMerGroup.Create(Self);
  end;
end;

procedure TfrmSupplier.actAddSupplierExecute(Sender: TObject);
begin
  ppmn1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmSupplier.actEditSupplierExecute(Sender: TObject);
begin
  frmDialogSupplier := TfrmDialogSupplier.Create(Self);
  with frmDialogSupplier do
  begin
    IsInsert := 0;

    KodeLama := edtKodeSupplier.Text;
    FormMode := fmAddSup;
    
    isMerchandise     := True;
    chkAllMer.Enabled := False;
   // edtKodeSupplierExit(nil);
  end;
  SetFormPropertyAndShowDialog(frmDialogSupplier);
end;

procedure TfrmSupplier.actRefreshSupplierExecute(Sender: TObject);
begin
  inherited;
//  edtKodeSupplierClickBtn(nil);
end;


procedure TfrmSupplier.fraFooter5Button1btnRefreshClick(Sender: TObject);
begin
  inherited;
  FRefreshMode := refFormShow;
  actRefreshSupplierExecute(self);
end;

procedure TfrmSupplier.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //frmMain.cbbUnit.Visible := True;
  //frmMain.lbl1.Visible := True;
//  frmMain.DestroyMenu((sender as TForm));
end;


procedure TfrmSupplier.SetActiveFooter5Button(AIsActive: boolean);
begin
end;

procedure TfrmSupplier.actUpdateBankExecute(Sender: TObject);
begin
  inherited;
  // Dipake saat dialog supp show
end;

procedure TfrmSupplier.LoadDataSupplier(aKode: string);
begin
  {with FSuplier do
  begin
    if LoadByKode(aKode) then
    begin
      edtKodeSupplier.tEXT  := aKode;
      edtSupName.Text       := Nama;
      edtJenisPeruhaan.Text := GetTipePerusahaan;
      edtAddr.Text          := Alamat;
      edtCity.Text          := Kota;
      edtPhone.Text         := Telpon;
      edtPostcode.Text      := KodePos;
      edtContactPerson.Text := KontakPerson;
      edtFaxNo.Text         := Fax;
      edtSuplierTipe.Text   := TipeSupplier.Nama;
      edtTittle.Text        := Title;

      if IsPKP = 1 then
        edtPKP.Text         := 'PKP'
      else
        edtPKP.Text         := 'NON PKP';

      edtTaxNo.Text         := LRTax;
      edtNPWP.Text          := NPWP;
      edtBankCode.Text      := GetKodeBank;
      edtBankName.Text      := GetNamaBank;
      edtBankBranch.Text    := CabangBank;// Bank.Cabang;
      edtBankAddrss.Text    := AlamatBank;//Bank.Alamat;
      edtBankAccName.Text   := RekNama;
      edtBankAccNo.Text     := RekBank;

      dtUserCreate.Date     := DATE_CREATE;
      dtUserModify.Date     := DATE_MODIFIED;
      edtUserCreate.Text    := GetUserNameByID(OP_CREATE,OPC_UNITID);
      edtUserModify.Text    := GetUserNameByID(OP_MODIFIED,OPM_UNITID);
      //edtSupName.SetFocus;
      chkSupIsActive.Checked  := SupIsActive;
      edtNpwpAlamat.Text      := NpwpAlamat;
    end
    else
    begin
      edtSupName.Text := '';
      edtJenisPeruhaan.Text := '';
      edtAddr.Text := '';
      edtCity.Text := '';
      edtPhone.Text := '';
      edtPostcode.Text := '';
      edtContactPerson.Text := '';
      edtFaxNo.Text := Fax;
      edtSuplierTipe.Text := '';
      edtTittle.Text := '';

      edtPKP.Text := '';

      edtTaxNo.Text := '';
      edtNPWP.Text := '';
      edtBankCode.Text := '';
      edtBankName.Text := '';
      edtBankAccName.Text := '';
      edtBankAccNo.Text := '';

      dtUserCreate.Date     := cGetServerTime;
      dtUserModify.Date     := cGetServerTime;
      edtUserCreate.Text    := '';
      edtUserModify.Text    := '';

    end;
  end; }
end;

procedure TfrmSupplier.edtKodeSupplierClickBtn(Sender: TObject);
var
  sSQL: String;
begin
  inherited;
  sSQL := 'select sup_code as Kode, sup_name as Nama'
          + ' from suplier';
  {
  with cLookUp('Daftar Supplier', sSQL) do
  begin
    try
      if Strings[0] <> '' then
      begin
        edtKodeSupplier.Text := Strings[0];
        edtKodeSupplier.SetFocus;
        edtJenisPeruhaan.SetFocus;
      end;
    finally
      Free;
    end;
  end;
   }
    LoadDataSupplier(edtKodeSupplier.Text);
  if LoadListcbpMerchGroup(edtKodeSupplier.Text) then
    LoadDataMerchandise(cbpMerchanGroup.Text);

end;

procedure TfrmSupplier.edtKodeSupplierKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

procedure TfrmSupplier.edtKodeSupplierKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F5 then
      edtKodeSupplierClickBtn(Self)
  else if Key = VK_RETURN then
  begin
    LoadDataSupplier(edtKodeSupplier.Text);
    if LoadListcbpMerchGroup(edtKodeSupplier.Text) then
      LoadDataMerchandise(cbpMerchanGroup.Text);
  end;
    
end;

procedure TfrmSupplier.FormShow(Sender: TObject);
begin
  inherited;
//  ClearByTag(Self,[0]) ;
//  FNewUnit.ClearProperties;

  if FLoginIsStore = 1 then
    fraFooter5Button1.lbl1.Enabled := False
  else
    fraFooter5Button1.lbl1.Enabled := True;

  fraFooter5Button1.lbl2.Enabled := fraFooter5Button1.lbl1.Enabled;
  fraFooter5Button1.lbl3.Enabled := fraFooter5Button1.lbl1.Enabled;
  fraFooter5Button1.lbl4.Enabled := fraFooter5Button1.lbl1.Enabled;
  fraFooter5Button1.btnAdd.Enabled := fraFooter5Button1.lbl1.Enabled;
  fraFooter5Button1.btnUpdate.Enabled := fraFooter5Button1.lbl1.Enabled;
  fraFooter5Button1.btnDelete.Enabled := fraFooter5Button1.lbl1.Enabled; 
end;

procedure TfrmSupplier.AddSupplier1Click(Sender: TObject);
begin
  inherited;
  frmDialogSupplier := TfrmDialogSupplier.Create(Self);
  with frmDialogSupplier do
  begin
    FormMode := fmAddSup;
    isSuplier := True;
    isMerchandise := False;
    isInsert := 1;
  end;
  SetFormPropertyAndShowDialog(frmDialogSupplier);
  
end;

procedure TfrmSupplier.AddMerchandiseGroup1Click(Sender: TObject);
begin
  inherited;
  frmDialogSupplier := TfrmDialogSupplier.Create(Self);
  with frmDialogSupplier do
  begin
    isMerchandise := True;
    isSuplier := False;
    if edtKodeSupplier.Text = '' then
    begin
      CommonDlg.ShowMessage('Pilih suplier dulu');
      edtKodeSupplier.SetFocus;
      Exit;
    end;
    SKode := edtKodeSupplier.Text;
    
    isInsert := 1;
  end;
  SetFormPropertyAndShowDialog(frmDialogSupplier);

end;

function TfrmSupplier.LoadListcbpMerchGroup(aSupKode: String): Boolean;
var
  sSQL: string;
begin
  Result := False;
  sSQL := ' select b.merchangrup_ID, b.merchangrup_code '
          + ' from suplier_merchan_grup a, ref$merchandise_grup b '
          + ' where a.supmg_code = ' + QuotedStr(edtKodeSupplier.Text)

          + ' and b.merchangrup_id = a.supmg_merchangrup_id '

          + ' order by b.merchangrup_ID';
  {
  cQueryToComboObject(cbpMerchanGroup,sSQL);
  if cbpMerchanGroup.Items.Count <= 0 then
  begin
    ClearByTag(Self,[1]);
  end else
    Result := True;
    }
end;

function TfrmSupplier.getBKP(IsBKP: Integer): string;
begin
  Result := '';
  if IsBKP = 0 then
    Result := 'NON-BKP'
  else
    Result := 'BKP';
end;

function TfrmSupplier.getKodeMerchandise(KodeSuplier: string; merchanID:
    Integer): string;
var
  sSQL: string;
begin
  Result := '';
  sSQL := ' select supmg_sub_code '
          + ' from suplier_merchan_grup '
          + ' where supmg_code = ' + QuotedStr(kodeSuplier)
          + ' and supMG_merchangrup_id = ' + IntToStr(merchanID);
  {
  with cOpenQuery(sSQL) do
  begin
    try
      if not FieldByName('supmg_sub_code').IsNull then
        Result := fieldByName('supmg_sub_code').AsString
      else
      begin
        ClearByTag(Self,[1]);
      end;
    finally

      Free;
    end;
  end;
  }
end;

procedure TfrmSupplier.setchkEnableCN(IsEnableCN : Integer);
begin
 if IsEnableCN = 1 then
  chkEnableCN.Checked := True
 else
  chkEnableCN.Checked := False;
end;

function TfrmSupplier.GetDataforDeliverPO(aTipePengiriman: Integer): string;
var
  sSQL: string;
begin
  Result := '' ;
  sSQL := ' select TPKRMPO_NAME '
          + ' from REF$TIPE_KIRIM_PO '
          + ' where TPKRMPO_ID = ' + IntToStr(aTipePengiriman);
  {with cOpenQuery(sSQL) do
  begin
    try
      if not FieldByName('TPKRMPO_NAME').IsNull then
        Result := FieldByName('TPKRMPO_NAME').AsString
      else
        CommonDlg.ShowMessage('Tipe pengiriman tidak ditemukan');
    finally
      Free
    end;
  end; }
end;

function TfrmSupplier.GetDAtaForTipePayment(aTipePembayaran: Integer): string;
var
  sSQL: string;
begin
  Result := '';
  sSQL := ' select TPBYR_NAME '
          + ' from REF$TIPE_PEMBAYARAN '
          + ' where TPBYR_ID = ' + IntToStr(aTipePembayaran);
  {
  with cOpenQuery(sSQL) do
  begin
    try
      if not FieldByName('TPBYR_NAME').IsNull then
        Result := FieldByName('TPBYR_NAME').AsString
      //else
      //  CommonDlg.ShowMessage('Tipe pembayaran tidak ditemukan');
    finally
      Free
    end;
  end; }
end;

procedure TfrmSupplier.GetDataMerchandiseGroup(aKodeMerchanGroup: string);
var
  sSQL: string;
begin
  sSQL := ' select MERCHANGRUP_NAME '
          + ' from ref$merchandise_grup '
          + '  where MERCHANGRUP_CODE = ' + QuotedStr(Trim(aKodeMerchanGroup));
  {with cOpenQuery(sSQL) do
  begin
    try
      if not FieldByName('MERCHANGRUP_NAME').IsNull then
      begin
        edtMerchGroupName.Text := FieldByName('MERCHANGRUP_NAME').AsString;
      end;
    finally
      Free
    end;
  end  }
end;

procedure TfrmSupplier.LoadDataMerchandise(aKodeMer : String);
var
  aKode: string;
begin
  if cbpMerchanGroup.Items.Count <= 0 then
    Exit;
  cbpMerchanGroup.ItemIndex := cbpMerchanGroup.Items.IndexOf(Trim(copy(aKodeMer,0,4)));
//  iMerchanGroup_ID := cGetIDfromCombo(cbpMerchanGroup);
  aKode :=  getKodeMerchandise(edtKodeSupplier.Text,iMerchanGroup_ID);
  {
  if FsuplierMerchGroup.LoadByKode(aKode) then
  begin
    edtTypePaymnt.Text := GetDAtaForTipePayment(FsuplierMerchGroup.TipePembayaran.ID);
    edtTermPayment.Text := IntToStr(FsuplierMerchGroup.TOP);
    edtLeadTime.Text := IntToStr(FsuplierMerchGroup.LeadTime);
    edtNoOfPO.Text := IntToStr(FsuplierMerchGroup.NoOfPO);
    edtDeliverPO.Text := GetDataforDeliverPO(FsuplierMerchGroup.TipeKirimPO.ID);
    edtCreditLimt.Value := FsuplierMerchGroup.CreditLimit;
    edtAPEndingBlnc.Value := FsuplierMerchGroup.GetAPEndingBalance(cGetServerTime);
    edtCNBalance.Value := FsuplierMerchGroup.GetCNBalance(cGetServerTime);
    dtLastPurchase.Date := FsuplierMerchGroup.GetLastPurchase;
    edtLastPayment.Value := FsuplierMerchGroup.GetLastPayment;
    edtOutstandingpayment.Value := FsuplierMerchGroup.GetOUTSTANDINGPAYMENT(cGetServerTime);
    edtBKP.Text := getBKP(FsuplierMerchGroup.IsBKP);
    setchkEnableCN(FsuplierMerchGroup.ISEnableCN);
    edtExtendDescr.Text := FsuplierMerchGroup.Description;
    GetDataMerchandiseGroup(cbpMerchanGroup.Text);
    edtDisc.Value := FsuplierMerchGroup.Disc;

    LoadedtOfPO;
  end else begin
    //CommonDlg.ShowMessage('Data Supplier merchandise tidak ditemukan ');
    ClearByTag(Self,[1]);
  end;}
end;

procedure TfrmSupplier.LoadedtOfPO;
var
  sData: string;
  i: Integer;
begin
  edtDayOfPO.Text := '';
  sData := '';
  {
  if FsuplierMerchGroup.IsSun = 1 then
    sData := sData + 'Mg, ';
  if FsuplierMerchGroup.IsMon = 1 then
    sData := sData + 'Sn, ';
  if FsuplierMerchGroup.IsTue = 1 then
    sData := sData + 'Sl, ';
  if FsuplierMerchGroup.IsThu = 1 then
    sData := sData + 'Km, ';
  if FsuplierMerchGroup.IsWed = 1 then
    sData := sData + 'Rb, ';
  if FsuplierMerchGroup.IsFri = 1 then
    sData := sData + 'Jm, ';
  if FsuplierMerchGroup.IsSat = 1 then
    sData := sData + 'Sb, ';
     }
  sData := Trim(sData);
  for i := 1 to Length(sData) - 1do
  begin
    edtDayOfPO.Text := edtDayOfPO.Text + sData[i];
  end;
end;

procedure TfrmSupplier.actDeleteSupplierExecute(Sender: TObject);
begin
  inherited;
  ppmn2.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmSupplier.DeleteSuplierClick(Sender: TObject);
var
  KodeSuplier: string;
  ListKodeMErchandise: TStrings;
  i: Integer;
begin
  inherited;
  KodeSuplier := edtKodeSupplier.Text;
  if (CommonDlg.Confirm('Anda Yakin ingin menghapus data suplier : ' + edtSupName.Text + ' ? ') = mrYes) then
  begin
    {
     if FSuplier.LoadByKode(KodeSuplier) then
      begin
         FSuplier.RemoveFromDB;
         ClearByTag(Self,[0]);
         CommonDlg.ShowMessage('Berhasil menghapus data Suplier');
      end;

      ListKodeMErchandise := GetListKodeMerchandise(KodeSuplier);
      if ListKodeMErchandise.Count > 0 then
      begin
        for i := 0 to ListKodeMErchandise.Count - 1 do
        begin
          if FsuplierMerchGroup.LoadByKode(ListKodeMErchandise[i]) then
          begin
          if FsuplierMerchGroup.RemoveFromDB then
            CommonDlg.ShowMessage('Berhasil menghapus data merchandise');
          end else
            CommonDlg.ShowMessage('gagal menghapus data merchandise');
        end;
        ClearByTag(Self,[1]);

    end; }
  end;
end;

function TfrmSupplier.GetListKodeMerchandise(aKodeSuplier: string): TStrings;
var
  sSQL: string;
begin
  Result := TStringList.Create;

  sSQL := ' select SupMG_Sub_Code '
          + ' from suplier_merchan_grup '
          + ' where SupMG_code = ' + QuotedStr(aKodeSuplier);
  {
  with cOpenQuery(sSQL) do
  begin
    while not Eof do
    begin
      Result.Add(FieldByName('SupMG_Sub_Code').AsString);
      Next;
    end;
  end;        
   }
end;

procedure TfrmSupplier.DeleteMErchandiseClick(Sender: TObject);
var
  kodeMErchan: string;
begin
  inherited;
  {
  iMerchanGroup_ID := cGetIDfromCombo(cbpMerchanGroup);
  kodeMErchan := getKodeMerchandise(edtKodeSupplier.Text, iMerchanGroup_ID);
  if FsuplierMerchGroup.LoadByKode(kodeMErchan) then
  begin
    if not FsuplierMerchGroup.IsPunyaBarangSupplier then
    begin
      if FsuplierMerchGroup.RemoveFromDB then
      begin
        CommonDlg.ShowMessage('Berhasil menghapus data');
        ClearByTag(Self,[1]);
      end;
    end else begin
      CommonDlg.ShowMessage('Merchandize Ini Sudah Punya Barang');
      Exit;
    end;
  end else begin
    CommonDlg.ShowMessage('Tidak bisa load data merchandise group' );
  end;
   }
  LoadListcbpMerchGroup(edtKodeSupplier.Text);
  LoadDataMerchandise(cbpMerchanGroup.Text);


end;

procedure TfrmSupplier.lblDayOfPOClick(Sender: TObject);
begin
  inherited;
//  SKodeMerchan := getKodeMerchandise(edtKodeSupplier.Text,cGetIDfromCombo(cbpMerchanGroup));
  frmDayofPO := TfrmDayofPO.Create(Self);
  frmDayofPO.ShowModal;
end;

procedure TfrmSupplier.lbl31Click(Sender: TObject);
var
  sKodeSupMG: string;
  iMerchanGroup_ID: Integer;
begin
  inherited;
  with TfrmOutstandingPO.Create(Self) do
  try
//    iMerchanGroup_ID := cGetIDfromCombo(cbpMerchanGroup);
    sKodeSupMG :=  getKodeMerchandise(edtKodeSupplier.Text,iMerchanGroup_ID);
    ShowDataPOOutStanding(sKodeSupMG);
    ShowModal;
  finally
    Free;
  end;

end;

procedure TfrmSupplier.cbpMerchanGroupChange(Sender: TObject);
begin
  inherited;
//  ClearByTag(Self,[1]);
  LoadDataMerchandise(cbpMerchanGroup.Text);
end;

procedure TfrmSupplier.fraFooter5Button1btnCloseClick(Sender: TObject);
begin
  inherited;
  fraFooter5Button1.btnCloseClick(Sender);

end;

procedure TfrmSupplier.FormActivate(Sender: TObject);
begin
  inherited;
  //LoadDataSupplier(edtKodeSupplier.Text, MasterNewUnit.ID);
end;

function TfrmSupplier.GetUserNameByID(aOP_Create : Integer; aUnitID : Integer):
    string;
var
  sSQL: string;
begin
  Result := '';
  sSQL := 'select upper(USR_FULLNAME) as Nama from AUT$USER'
          + ' where usr_id = ' + IntToStr(aOP_Create)
          + ' and usr_unt_id = ' + IntToStr(aUnitID);
  {
  with cOpenQuery(sSQL) do
  begin
    try
      while not Eof do
      begin
        Result := FieldByName('nama').AsString;

        Next;
      end;
    finally
      Free;
    end;
  end; }
end;

procedure TfrmSupplier.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ssCtrl in Shift then
  begin
    if (Key = Ord('D')) then
      lblDayOfPOClick(nil)
    else if (Key = Ord('P')) then
      lbl31Click(nil);
  end;
end;

end.
