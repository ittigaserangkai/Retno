unit ufrmDialogCreditCard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ExtCtrls, StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxCurrencyEdit, System.Actions, Vcl.ActnList, ufraFooterDialog3Button,
  uInterface, uModCreditCard, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, Datasnap.DBClient, uClientClasses;

type
  TfrmDialogCreditCard = class(TfrmMasterDialog, iCRUDAble)
    cboisCredit: TComboBox;
    chkIsActive: TCheckBox;
    chkIsCachBack: TCheckBox;
    chkIsKring: TCheckBox;
    cxLookupAccount: TcxExtLookupComboBox;
    cxLookupAccountCashBack: TcxExtLookupComboBox;
    edtCardCode: TEdit;
    edtCardName: TEdit;
    edtLimit: TcxCurrencyEdit;
    fedtCharge: TcxCurrencyEdit;
    fedtDisc: TcxCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure edtLimitEnter(Sender: TObject);
    procedure fedtChargeExit(Sender: TObject);
    procedure fedtDiscExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FCDSRekening: TClientDataSet;
    FDSClient: TDSProviderClient;
    FModCreditCard: TModCreditCard;
    procedure ClearForm;
    function GetCDSRekening: TClientDataSet;
    function GetDSClient: TDSProviderClient;
    function GetModCreditCard: TModCreditCard;
    function IsValidate: Boolean;
    procedure SavingData;
    property CDSRekening: TClientDataSet read GetCDSRekening write FCDSRekening;
    property DSClient: TDSProviderClient read GetDSClient write FDSClient;
    property ModCreditCard: TModCreditCard read GetModCreditCard write
        FModCreditCard;
  public
    procedure LoadData(AID: string);
  end;

var
  frmDialogCreditCard: TfrmDialogCreditCard;

implementation

uses
  uTSCommonDlg, uDXUtils, uDBUtils, uDMClient, uAppUtils, uConstanta,
  uModRekening;

{$R *.dfm}

procedure TfrmDialogCreditCard.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if TAppUtils.Confirm(CONF_VALIDATE_FOR_DELETE) then
  begin
    DMClient.CrudClient.DeleteFromDB(ModCreditCard);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.Close;
  end;
end;

procedure TfrmDialogCreditCard.actSaveExecute(Sender: TObject);
begin
  inherited;
  if IsValidate then
    SavingData;
end;

procedure TfrmDialogCreditCard.ClearForm;
begin
  edtCardCode.Clear;
  edtCardName.Clear;

  cboisCredit.ItemIndex := 0;
  edtLimit.Value        := 0;
  fedtCharge.Value      := 0;
  fedtDisc.Value        := 0;
  chkIsActive.Checked   := True;
  chkIsCachBack.Checked := False;
  chkIsKring.Checked    := False;
end;

procedure TfrmDialogCreditCard.edtLimitEnter(Sender: TObject);
begin
  inherited;
  edtLimit.SelectAll;
end;

procedure TfrmDialogCreditCard.fedtChargeExit(Sender: TObject);
begin
  inherited;
  if fedtCharge.Value > 100 then
    fedtCharge.Value := 100;
end;

procedure TfrmDialogCreditCard.fedtDiscExit(Sender: TObject);
begin
  inherited;
  if fedtDisc.Value > 100 then
    fedtDisc.Value := 100;
end;

procedure TfrmDialogCreditCard.FormCreate(Sender: TObject);
begin
  inherited;
  ClearForm;

  cxLookupAccount.Properties.LoadFromCDS(CDSRekening,'Rekening_ID','Rek_Name',['Rekening_ID'],Self);
  cxLookupAccount.Properties.SetMultiPurposeLookup;
  cxLookupAccountCashBack.Properties.LoadFromCDS(CDSRekening,'Rekening_ID','Rek_Name',['Rekening_ID'],Self);
  cxLookupAccountCashBack.Properties.SetMultiPurposeLookup;

  Self.AssignKeyDownEvent;
end;

procedure TfrmDialogCreditCard.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogCreditCard := nil;
end;

function TfrmDialogCreditCard.GetCDSRekening: TClientDataSet;
begin
  if not Assigned(FCDSRekening) then
  begin
    FCDSRekening := TDBUtils.DSToCDS(DSClient.Rekening_GetDSLookup, Self );
  end;
  Result := FCDSRekening;
end;

function TfrmDialogCreditCard.GetDSClient: TDSProviderClient;
begin
  if not Assigned(FDSClient) then
    FDSClient := TDSProviderClient.Create(DMClient.RestConn);
  Result := FDSClient;
end;

function TfrmDialogCreditCard.GetModCreditCard: TModCreditCard;
begin
  if not Assigned(FModCreditCard) then
    FModCreditCard := TModCreditCard.Create;
  Result := FModCreditCard;
end;

function TfrmDialogCreditCard.IsValidate: Boolean;
begin
  Result := False;

  if edtCardCode.Text = '' then
  begin
    TAppUtils.Warning('Card Code belum diisi');
    exit;
  end else
  if edtCardName.Text = '' then
  begin
    TAppUtils.Warning('Card Name belum diisi');
    exit;
  end else
    Result := True;
end;

procedure TfrmDialogCreditCard.LoadData(AID: string);
begin
  if Assigned(FModCreditCard) then
    FreeAndNil(FModCreditCard);

  FModCreditCard := DMClient.CrudClient.Retrieve(TModCreditCard.ClassName, AID) as TModCreditCard;

  edtCardCode.Text      := ModCreditCard.CARD_CODE;
  edtCardName.Text      := ModCreditCard.CARD_NAME;
  cboisCredit.ItemIndex := ModCreditCard.CARD_IS_CREDIT;
  edtLimit.Value        := ModCreditCard.CARD_LIMIT;
  fedtCharge.Value      := ModCreditCard.CARD_CHARGE;
  fedtDisc.Value        := ModCreditCard.CARD_DISCOUNT;
  chkIsActive.Checked   := ModCreditCard.CARD_IS_ACTIVE = 1;
  chkIsCachBack.Checked := ModCreditCard.CARD_IS_CASHBACK = 1;
  chkIsKring.Checked    := ModCreditCard.CARD_IS_KRING = 1;

  if Assigned(ModCreditCard.REKENING) then
    cxLookupAccount.EditValue := ModCreditCard.REKENING.ID;
  if Assigned(ModCreditCard.REKENING_CASH_BACK) then
    cxLookupAccountCashBack.EditValue := ModCreditCard.REKENING_CASH_BACK.ID;
end;

procedure TfrmDialogCreditCard.SavingData;
begin
  ModCreditCard.CARD_CODE         := edtCardCode.Text;
  ModCreditCard.CARD_NAME         := edtCardName.Text;
  ModCreditCard.CARD_IS_CREDIT    := cboisCredit.ItemIndex;
  ModCreditCard.CARD_LIMIT        := edtLimit.Value;
  ModCreditCard.CARD_CHARGE       := fedtCharge.Value;
  ModCreditCard.CARD_DISCOUNT     := fedtDisc.Value;
  ModCreditCard.CARD_IS_ACTIVE    := TAppUtils.BoolToInt(chkIsActive.Checked);
  ModCreditCard.CARD_IS_CASHBACK  := TAppUtils.BoolToInt(chkIsCachBack.Checked);
  ModCreditCard.CARD_IS_KRING     := TAppUtils.BoolToInt(chkIsKring.Checked);

  if not VarIsNull(cxLookupAccount.EditValue) then
  begin
    ModCreditCard.REKENING := TModRekening.CreateID(cxLookupAccount.EditValue);
  end;

  if not VarIsNull(cxLookupAccountCashBack.EditValue) then
  begin
    ModCreditCard.REKENING_CASH_BACK := TModRekening.CreateID(cxLookupAccountCashBack.EditValue);
  end;

  Try
    DMClient.CrudClient.SaveToDB(ModCreditCard);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    ModalResult := mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    Raise;
  End;
end;

end.




