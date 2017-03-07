unit ufrmDialogMasterCustomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, StdCtrls, ufraFooterDialog2Button, ExtCtrls,
  uConn, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogMasterCustomer = class(TfrmMasterDialog)
    Panel1: TPanel;
    lbl5: TLabel;
    lbl1: TLabel;
    edtCustCode: TEdit;
    edtCustName: TEdit;
    lbl12: TLabel;
    edtContactPerson: TEdit;
    lbl8: TLabel;
    edtTitle: TEdit;
    Panel2: TPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl7: TLabel;
    lbl11: TLabel;
    edtAddress: TEdit;
    edtCity: TEdit;
    edtTelephone: TEdit;
    edtPostCode: TEdit;
    edtFaxNo: TEdit;
    Panel3: TPanel;
    lbl13: TLabel;
    lbl15: TLabel;
    cbbPKP: TComboBox;
    edtTaxNo: TEdit;
    lbl14: TLabel;
    lbl16: TLabel;
    cbbPPH: TComboBox;
    edtNPWP: TEdit;
    lbl23: TLabel;
    lbl24: TLabel;
    lbl27: TLabel;
    edtTermOP: TEdit;
    cbpTypeOfPay: TComboBox;
    Panel4: TPanel;
    lbl10: TLabel;
    edtCustDesc: TEdit;
    chkPrincipal: TCheckBox;
    lblSubCode: TLabel;
    edtSupName: TEdit;
    edtSupMGCode: TcxButtonEdit;
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure chkPrincipalClick(Sender: TObject);
    procedure edtSupMGCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtSupMGCodeExit(Sender: TObject);
    procedure edtSupMGCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSupMGCodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    FMasterCustomerId : Integer;

//    FNewCustomer: TNewCustomer;

    function GetIsBKP: Integer;
    function GetIsPPH: Integer;
    function IsBisaLanjut: Boolean;
    procedure ShowDataEdit(AMasterCustomerId: Integer);
    procedure PrepareAddData();
    function SaveMasterCustomer(aCustomer_ID: integer = 0): boolean;
    procedure SetDataAlamat(aCustomerSewa: Integer);
    procedure SetDataKodeDanNamaCustomer(aCustomerSewa: Integer);
    procedure SetDataKontakPerson(aCustomerSewa: Integer);
    procedure SetDataPajak(aCustomerSewa: Integer);
    procedure SetDataPrincipal(aCustomerSewa: Integer);
    procedure SetDataTipeBayar(aCustomerSewa: Integer);
  public
    function GetIsPrincipal: Integer;
    function GetMasterCustomerId: Integer;
    function getTOP: Integer;
    function IsDataSubMGValid(aSubSupCode : String; aUnitID : Integer): Boolean;
    function IsKodeCustomerDouble(aSubSupCode : String; aUnitID : Integer;
        aExSubSupId : Integer): Boolean;
    procedure LoadDataTipePembayaran(aUnitID : Integer);
    procedure SetMasterCustomerId(const Value: Integer);
    { Public declarations }
  published
  end;

var
  frmDialogMasterCustomer: TfrmDialogMasterCustomer;

implementation

uses uTSCommonDlg, uRetnoUnit, ufrmSearchRekening;

{$R *.dfm}    

procedure TfrmDialogMasterCustomer.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;
  if not IsBisaLanjut then
    Exit;

  if SaveMasterCustomer(FMasterCustomerId) then
    Close;
end;

function TfrmDialogMasterCustomer.SaveMasterCustomer(aCustomer_ID: integer =
    0): boolean;
//  sSUPMG:      string;
//  P: Integer;
//  idTPPAY: Integer;
begin
  Result := False;
  {FNewCustomer.UpdateData(
               edtAddress.Text,
               edtCustDesc.Text,
               edtFaxNo.Text,
               aCustomer_ID,
               GetIsBKP,
               GetIsPPH,
               GetIsPrincipal,
               edtCustCode.Text,
               edtPostCode.Text,
               edtContactPerson.Text,
               edtCity.Text,
               edtTaxNo.Text,
               edtCustName.Text,
               DialogUnit,
               edtNPWP.Text,
               edtSupMGCode.Text,
               edtTelephone.Text,
               cGetIDfromCombo(cbpTypeOfPay),
               edtTitle.Text,
               getTOP );

  try
    if not FNewCustomer.ExecuteGenerateSQL then
    begin
      cRollbackTrans;
      CommonDlg.ShowError('Gagal Menyimpan Data');
    end else
    begin
      Result := True;
      cCommitTrans;
      CommonDlg.ShowMessage('Berhasil Menyimpan Data');
    end;
  finally
    cRollbackTrans;
  end;
   }
end;

procedure TfrmDialogMasterCustomer.FormShow(Sender: TObject);
begin
  inherited;
//  FNewCustomer := TNewCustomer.CreateWithUser(Self, FLoginId, FLoginUnitId);
  LoadDataTipePembayaran(DialogUnit);

  if FMasterCustomerId > 0 then
    ShowDataEdit(FMasterCustomerId)
  else
    PrepareAddData();

  edtCustCode.SetFocus;  
end;

procedure TfrmDialogMasterCustomer.ShowDataEdit(AMasterCustomerId: Integer);
begin
//  if FNewCustomer.LoadByID(FMasterCustomerId, DialogUnit) then
//  begin
//    SetDataKodeDanNamaCustomer(FNewCustomer);
//    SetDataPajak(FNewCustomer);
//    SetDataTipeBayar(FNewCustomer);
//
//    edtTermOP.Text        := IntToStr(FNewCustomer.TOP);
//    edtCustDesc.Text      := FNewCustomer.Deskripsi;
//
//    SetDataAlamat(FNewCustomer);
//    SetDataKontakPerson(FNewCustomer);
//    SetDataPrincipal(FNewCustomer);
//  end;
end;

procedure TfrmDialogMasterCustomer.PrepareAddData;
begin

end;

procedure TfrmDialogMasterCustomer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogMasterCustomer.FormDestroy(Sender: TObject);
begin
  inherited;
//  FNewCustomer.Free;
  frmDialogMasterCustomer := nil;
end;



procedure TfrmDialogMasterCustomer.chkPrincipalClick(Sender: TObject);
begin
  inherited;
  if chkPrincipal.Checked then
  begin
    lblSubCode.Visible   := True;
    edtSupMGCode.Visible := True;
    edtSupName.Visible   := True;
  end
  else
  begin
    lblSubCode.Visible   := False;
    edtSupMGCode.Visible := False;
    edtSupName.Visible   := False;
  end

end;

procedure TfrmDialogMasterCustomer.edtSupMGCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);

end;

procedure TfrmDialogMasterCustomer.edtSupMGCodeExit(Sender: TObject);
begin
  inherited;
//  with TNewSupplierMerGroup.Create(Self) do
//  begin
//    try
//      if LoadByKode(edtSupMGCode.Text) then
//      begin
//        edtSupName.Text := Nama;
//      end else begin
//        edtSupName.Text := '';
//      end;
//    finally
//      Free;
//    end;
//  end;
end;

procedure TfrmDialogMasterCustomer.edtSupMGCodeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
   sSQL : String;
begin
  inherited;
  if (Key = VK_F5) then
  begin
    sSQL := 'select supmg_sub_code, supmg_name'
          + ' from suplier_merchan_grup';
          
//    with cLookUp('Daftar Sub Supplier', sSQL) do
//    begin
//      try
//        if Strings[0] <> '' then
//        begin
//          edtSupMGCode.Text := Strings[0];
//          edtSupName.Text := Strings[1];
//          edtSupMGCode.SetFocus;
//        end;
//      finally
//        Free;
//      end;
//    end;
  end; 
end;

procedure TfrmDialogMasterCustomer.edtSupMGCodePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
   sSQL : String;
begin
  inherited;
  sSQL := 'select supmg_sub_code, supmg_name'
          + ' from suplier_merchan_grup';
//  with cLookUp('Daftar Supplier', sSQL) do
//  begin
//    try
//      if Strings[0] <> '' then
//      begin
//        edtSupMGCode.Text := Strings[0];
//        edtSupName.Text := Strings[1];
//        edtSupMGCode.SetFocus;
//      end;
//    finally
//      Free;
//    end;
//  end;
end;

function TfrmDialogMasterCustomer.GetIsBKP: Integer;
begin
  if cbbPKP.Text = 'PKP' then
    Result := 1
  else
    Result := 0;
end;

function TfrmDialogMasterCustomer.GetIsPPH: Integer;
begin
  if cbbPPH.Text = 'PPH' then
    Result := 1
  else
    Result := 0;
end;

function TfrmDialogMasterCustomer.GetIsPrincipal: Integer;
begin
  if chkPrincipal.Checked then
    Result := 1
  else
    Result := 0;  
end;

function TfrmDialogMasterCustomer.GetMasterCustomerId: Integer;
begin
  Result := FMasterCustomerId;
end;

function TfrmDialogMasterCustomer.getTOP: Integer;
begin
  Result := StrToIntDef(edtTermOP.Text, 0);
end;

function TfrmDialogMasterCustomer.IsBisaLanjut: Boolean;
var
  iTOP: Integer;
begin
  Result := False;

  if edtCustCode.Text = '' then
  begin
    CommonDlg.ShowErrorEmpty('CUSTOMER CODE');
    edtCustCode.SetFocus;
    Exit;
  end;

  if edtCustName.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('CUSTOMER NAME');
    edtCustName.SetFocus;
    Exit;
  end;

  iTOP := StrToIntDef(edtTermOP.Text, 0);
  if iTOP < 1 then
  begin
    CommonDlg.ShowErrorEmpty('TOP');
    edtTermOP.SetFocus;
    Exit;
  end;

  if chkPrincipal.Checked then
  begin
    if not IsDataSubMGValid(edtSupMGCode.Text, DialogUnit) then
    begin
      CommonDlg.ShowErrorEmpty('SUB CODE');
      edtSupMGCode.SetFocus;
      Exit;
    end;
  end;

  if IsKodeCustomerDouble(edtCustCode.Text, DialogUnit, FMasterCustomerId) then
  begin
    CommonDlg.ShowErrorExist('KODE CUSTOMER', edtCustCode.Text);
    edtCustCode.SetFocus;
    Exit;
  end;
  
  Result := True;
end;

function TfrmDialogMasterCustomer.IsDataSubMGValid(aSubSupCode : String;
    aUnitID : Integer): Boolean;
begin
  Result := False;
//  with TNewSupplierMerGroup.Create(Self) do
//  begin
//    try
//      if LoadByKode(edtSupMGCode.Text) then
//      begin
//        Result := True;
//      end;
//    finally
//      Free;
//    end;
//  end;
end;

function TfrmDialogMasterCustomer.IsKodeCustomerDouble(aSubSupCode : String;
    aUnitID : Integer; aExSubSupId : Integer): Boolean;
var
  sSQL: string;
begin
  Result := False;
  sSQL := 'select count(cust_id)'
          + ' from customer'
          + ' where cust_unt_id = ' + IntToStr(aUnitID)
          + ' and cust_code = ' + QuotedStr(aSubSupCode)
          + ' and cust_id <> ' + IntToStr(aExSubSupId);

//  with cOpenQuery(sSQL) do
//  begin
//    try
//      while not EOF do
//      begin
//        if Fields[0].AsInteger > 0 then
//        begin
//          Result := True;
//          Exit;
//        end;
//
//        Next;
//      end;
//    finally
//      Free;
//    end;
//  end;


end;

procedure TfrmDialogMasterCustomer.LoadDataTipePembayaran(aUnitID : Integer);
var
  sSQL: string;
begin
  sSQL := 'select tpbyr_id, tpbyr_name'
          + ' from REF$TIPE_PEMBAYARAN'
          + ' order by tpbyr_name';

//  cQueryToComboObject(cbpTypeOfPay, sSQL);
end;

procedure TfrmDialogMasterCustomer.SetDataAlamat(aCustomerSewa: Integer);
begin
//  edtAddress.Text       := aCustomerSewa.Alamat;
//  edtCity.Text          := aCustomerSewa.Kota;
//  edtTelephone.Text     := aCustomerSewa.Telepon;
//  edtPostCode.Text      := aCustomerSewa.KodePos;
//  edtFaxNo.Text         := aCustomerSewa.Fax;
end;

procedure TfrmDialogMasterCustomer.SetDataKodeDanNamaCustomer(aCustomerSewa:
    Integer);
begin
//  edtCustCode.Text := aCustomerSewa.Kode;
//  edtCustName.Text := aCustomerSewa.Nama;
end;

procedure TfrmDialogMasterCustomer.SetDataKontakPerson(aCustomerSewa: Integer);
begin
//  edtContactPerson.Text := aCustomerSewa.KontakPerson;
//  edtTitle.Text         := aCustomerSewa.Title;
end;

procedure TfrmDialogMasterCustomer.SetDataPajak(aCustomerSewa: Integer);
begin
//  cbbPKP.ItemIndex := aCustomerSewa.IsPKP;
//  edtTaxNo.Text    := aCustomerSewa.LRTax;
//  cbbPPH.ItemIndex := aCustomerSewa.ISPPH23;
//  edtNPWP.Text     := aCustomerSewa.NPWP;
end;

procedure TfrmDialogMasterCustomer.SetDataPrincipal(aCustomerSewa: Integer);
begin
//  if (FNewCustomer.ISPRINCIPAL = 1) then
//  begin
//    chkPrincipal.Checked := True;
//    lblSubCode.Visible   := True;
//    edtSupMGCode.Visible := True;
//    edtSupName.Visible   := True;
//
//    edtSupMGCode.Text    := FNewCustomer.SUPMGSUBCODE.Kode;
//    edtSupName.Text      := FNewCustomer.SUPMGSUBCODE.Nama;
//  end
//  else
  begin
    chkPrincipal.Checked := False;
    lblSubCode.Visible   := False;
    edtSupMGCode.Visible := False;
    edtSupName.Visible   := False;
  end;
end;

procedure TfrmDialogMasterCustomer.SetDataTipeBayar(aCustomerSewa: Integer);
begin
//  cSetItemAtComboObject(cbpTypeOfPay,aCustomerSewa.TipeBayar.ID);
end;

procedure TfrmDialogMasterCustomer.SetMasterCustomerId(const Value: Integer);
begin
  FMasterCustomerId := Value; 
end;

end.
