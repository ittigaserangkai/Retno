unit ufrmDialogFinalPayment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, StdCtrls, ExtCtrls, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxMaskEdit, cxSpinEdit,
  cxTimeEdit, cxTextEdit, cxCurrencyEdit, uClientClasses, uModBeginningBalance,
  uModFinalPayment, Datasnap.DBClient, uInterface;

type
//  TFormMode = (fmAdd, fmEdit);

  TfrmDialogFinalPayment = class(TfrmMasterDialog, ICRUDAble)
    lbl4: TLabel;
    edtPOSCode: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    edtCashierID: TEdit;
    lbl3: TLabel;
    edtFinPay: TcxCurrencyEdit;
    edtClock: TcxTimeEdit;
    Timer1: TTimer;
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
//    dataBeginningBlnc: TDataSet;
    FCDS: TClientDataSet;
//    FDSClient: TDSProviderClient;
    FModBeginningBalance: TModBeginningBalance;
    FModFinalPayment: TModFinalPayment;
//    function GetDSClient: TDSProviderClient;
    function GetModBeginningBalance: TModBeginningBalance;
    function GetModFinalPayment: TModFinalPayment;
    function IsValidate: Boolean;
    procedure SavingData;
    property CDS: TClientDataSet read FCDS write FCDS;
//    property DSClient: TDSProviderClient read GetDSClient write FDSClient;
    property ModBeginningBalance: TModBeginningBalance read GetModBeginningBalance
        write FModBeginningBalance;
    property ModFinalPayment: TModFinalPayment read GetModFinalPayment write
        FModFinalPayment;
  public
    procedure LoadData(AID: string);
  published
  end;

var
  frmDialogFinalPayment: TfrmDialogFinalPayment;

implementation

uses
  uConn, uRetnoUnit, uTSCommonDlg, DB, uConstanta, uAppUtils, uDMClient,
  uDBUtils;

{$R *.dfm}

procedure TfrmDialogFinalPayment.actSaveExecute(Sender: TObject);
begin
  inherited;
  if IsValidate then
    SavingData;
end;

procedure TfrmDialogFinalPayment.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
end;

procedure TfrmDialogFinalPayment.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogFinalPayment := nil;
end;

//function TfrmDialogFinalPayment.GetDSClient: TDSProviderClient;
//begin
//  if not Assigned(FDSClient) then
//    FDSClient := TDSProviderClient.Create(DMClient.RestConn);
//  Result := FDSClient;
//end;

function TfrmDialogFinalPayment.GetModBeginningBalance: TModBeginningBalance;
begin
  if not Assigned(FModBeginningBalance) then
    FModBeginningBalance := TModBeginningBalance.Create;
  Result := FModBeginningBalance;
end;

function TfrmDialogFinalPayment.GetModFinalPayment: TModFinalPayment;
begin
  if not Assigned(FModFinalPayment) then
    FModFinalPayment := TModFinalPayment.Create;
  Result := FModFinalPayment;
end;

function TfrmDialogFinalPayment.IsValidate: Boolean;
begin
  Result := False;

  if edtFinPay.Value > (CDS.FieldByName('LAST_FINAL_PAYMENT').AsFloat + CDS.FieldByName('PHYSICAL').AsFloat) then
  begin
    CommonDlg.ShowError('Nilai final payment tidak boleh melebihi payment cash!');
    exit;
  end else
  if not ModBeginningBalance.SETUPPOS.SETUPPOS_IS_ACTIVE = 0 then
  begin
    CommonDlg.ShowError('POS ' + ModBeginningBalance.SETUPPOS.SETUPPOS_TERMINAL_CODE
                      + ' sudah tidak Active' + #13
                      + 'Final Payment Tidak Bisa Dilaksanakan');
    Exit;
  end else
    Result := True;
end;

procedure TfrmDialogFinalPayment.LoadData(AID: string);
begin
  if Assigned(FCDS) then FreeAndNil(FCDS);
  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.FinalPayment_GetDSByBeginningBalance(AID) ,Self );

  if Assigned(FModBeginningBalance) then
    FreeAndNil(FModBeginningBalance);
  FModBeginningBalance := DMClient.CrudClient.Retrieve(TModBeginningBalance.ClassName, CDS.FieldByName('BEGINNING_BALANCE_ID').AsString) as TModBeginningBalance;

  if Assigned(FModFinalPayment) then
    FreeAndNil(FModFinalPayment);
  if CDS.FieldByName('FINAL_PAYMENT_ID').AsString = '' then
  begin
    edtPOSCode.Text   := CDS.FieldByName('POS_CODE').AsString;
    edtCashierID.Text := CDS.FieldByName('CASHIER').AsString;
    edtFinPay.Value   := CDS.FieldByName('PHYSICAL').AsFloat;
  end else
  begin
    FModFinalPayment  := DMClient.CrudClient.Retrieve(TModFinalPayment.ClassName, CDS.FieldByName('FINAL_PAYMENT_ID').AsString) as TModFinalPayment;
    edtPOSCode.Text   := CDS.FieldByName('POS_CODE').AsString;
    edtCashierID.Text := CDS.FieldByName('CASHIER').AsString;
    edtFinPay.Value   := CDS.FieldByName('LAST_FINAL_PAYMENT').AsFloat;
  end;
end;

procedure TfrmDialogFinalPayment.SavingData;
begin
  ModFinalPayment.BEGINNING_BALANCE := ModBeginningBalance;
  ModFinalPayment.FINPAYMENT_TOTAL  := edtFinPay.Value;

  Try
    DMClient.CrudClient.SaveToDB(ModFinalPayment);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    ModalResult := mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    Raise;
  End;
end;

procedure TfrmDialogFinalPayment.Timer1Timer(Sender: TObject);
begin
  inherited;
  edtClock.Time := Now;
end;

end.





