unit ufrmSupplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls, DB,
  ActnList, Menus, uConstanta, uRetnounit, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  System.Actions, cxCurrencyEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxStyles, cxClasses, cxButtonEdit, ufrmMasterBrowse,
  dxBarBuiltInMenu, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDBData, ufraFooter4Button, cxButtons, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  uDXUtils, uDMClient, Datasnap.DBClient, ufrmDialogSupplier;

type
  TRefreshMode = (refFormShow, refEdit);

  TfrmSupplier = class(TfrmMasterBrowse)
    cxTabSheet1: TcxTabSheet;
    bvl1: TBevel;
    bvl2: TBevel;
    cbpMerchanGroup: TComboBox;
    chkEnableCN: TCheckBox;
    chkSupIsActive: TCheckBox;
    dtLastPurchase: TcxDateEdit;
    dtUserCreate: TcxDateEdit;
    dtUserModify: TcxDateEdit;
    edtAddr: TEdit;
    edtAPEndingBlnc: TcxCurrencyEdit;
    edtBankAccName: TEdit;
    edtBankAccNo: TEdit;
    edtBankAddrss: TEdit;
    edtBankBranch: TEdit;
    edtBankCode: TEdit;
    edtBankName: TEdit;
    edtBKP: TEdit;
    edtCity: TEdit;
    edtCNBalance: TcxCurrencyEdit;
    edtContactPerson: TEdit;
    edtCreditLimt: TcxCurrencyEdit;
    edtDayOfPO: TEdit;
    edtDeliverPO: TEdit;
    edtDisc: TcxCurrencyEdit;
    edtExtendDescr: TEdit;
    edtFaxNo: TEdit;
    edtJenisPeruhaan: TEdit;
    edtKodeSupplier: TcxButtonEdit;
    edtLastPayment: TcxCurrencyEdit;
    edtLeadTime: TEdit;
    edtMerchGroupName: TEdit;
    edtNoOfPO: TEdit;
    edtNPWP: TEdit;
    edtNpwpAlamat: TEdit;
    edtOutstandingpayment: TcxCurrencyEdit;
    edtPhone: TEdit;
    edtPKP: TEdit;
    edtPostcode: TEdit;
    edtSuplierTipe: TEdit;
    edtSupName: TEdit;
    edtTaxNo: TEdit;
    edtTermPayment: TEdit;
    edtTittle: TEdit;
    edtTypePaymnt: TEdit;
    edtUserCreate: TEdit;
    edtUserModify: TEdit;
    Label1: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lbEnCreateCN: TLabel;
    lbl10: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl2: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    lbl27: TLabel;
    lbl28: TLabel;
    lbl3: TLabel;
    lbl30: TLabel;
    lbl31: TcxLabel;
    lbl32: TLabel;
    lbl33: TLabel;
    lbl34: TLabel;
    lbl35: TLabel;
    lbl36: TLabel;
    lbl37: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lblDayOfPO: TcxLabel;
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    cxGridViewColumn4: TcxGridDBColumn;
    cxGridViewColumn5: TcxGridDBColumn;
    cxGridViewColumn6: TcxGridDBColumn;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
  public
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
    procedure RefreshData; override;
    procedure SetActiveFooter5Button(AIsActive: boolean);
    procedure setchkEnableCN(IsEnableCN : Integer);

  end;

var
  frmSupplier: TfrmSupplier;
  FoundSup,FoundMer: Boolean;

implementation

uses ufrmDayOfPO, ufrmOutstandingPO, uTSCommonDlg,
  ufrmSearchSupplier, ufraHistoriPOByProduct;

{$R *.dfm}


procedure TfrmSupplier.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogSupplier);
end;

procedure TfrmSupplier.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogSupplier,
  cxGridView.DS.FieldByName('SUPLIER_ID').AsString);
end;

procedure TfrmSupplier.SetActiveFooter5Button(AIsActive: boolean);
begin
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

procedure TfrmSupplier.RefreshData;
begin
  inherited;
  cxGridView.LoadFromDS(
    DMClient.DSProviderClient.Suplier_GetDSOverview(),Self);
end;

end.
