unit ufrmDialogGenerateVoucher;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, SUIForm,
  StdCtrls, JvEdit, Mask, JvToolEdit, JclStrings, JvExStdCtrls,
  JvValidateEdit, JvExMask;

type
  TfrmDialogGenerateVoucher = class(TfrmMasterDialog)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    dtIssuedDate: TJvDateEdit;
    dtStartDate: TJvDateEdit;
    dtEndDate: TJvDateEdit;
    jvcuredtNominal: TJvValidateEdit;
    intedtQty: TJvValidateEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
  private
    FIsProcessSuccessfull: boolean;
    FAgrvNo: string;
    FVoucherId: Integer;
    FCustCounter: Integer;
    FCustCode: String;
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure SetAgrvNo(const Value: String);
    procedure SetCustCounter(const Value: Integer);
    procedure SetCustCode(const Value: String);
    function  SaveMasterVoucher: Boolean;
    function  GenerateVoucherDetil: Boolean;
  public
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
    property AgrvNo: string read FAgrvNo write SetAgrvNo;
    property CustCounter: Integer read FCustCounter write SetCustCounter;
    property CustCode: String read FCustCode write SetCustCode;
  end;

var
  frmDialogGenerateVoucher: TfrmDialogGenerateVoucher;

implementation

uses uConn, uGenerateVoucher,  ufrmGenerateVoucher,
  uGTSUICommonDlg, uConstanta, uDataCustomer;

{$R *.dfm}

procedure TfrmDialogGenerateVoucher.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogGenerateVoucher.SetAgrvNo(const Value: String);
begin
  FAgrvNo:= Value;
end;

procedure TfrmDialogGenerateVoucher.SetCustCounter(const Value: Integer);
begin
  FCustCounter:= Value;
end;

procedure TfrmDialogGenerateVoucher.SetCustCode(const Value: String);
begin
  FCustCode:= Value;
end;

procedure TfrmDialogGenerateVoucher.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogGenerateVoucher.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogGenerateVoucher := nil;
end;

procedure TfrmDialogGenerateVoucher.FormShow(Sender: TObject);
begin
  inherited;
  dtIssuedDate.Date:= Now;
  jvcuredtNominal.Value:= 0;
  intedtQty.Value:= 0;
  dtStartDate.Date:= Now;
  dtEndDate.Date:= Now;
  dtIssuedDate.SetFocus;
end;

function TfrmDialogGenerateVoucher.SaveMasterVoucher: Boolean;
var AParam: TArr;
begin
  if not assigned(GenerateVoucher) then
    GenerateVoucher := TGenerateVoucher.Create;
  SetLength(AParam,8);
  AParam[0].tipe:= ptDateTime;
  AParam[0].data:= dtIssuedDate.Date;
  AParam[1].tipe:= ptCurrency;
  AParam[1].data:= jvcuredtNominal.Value;
  AParam[2].tipe:= ptInteger;
  AParam[2].data:= intedtQty.Value;
  AParam[3].tipe:= ptDateTime;
  AParam[3].data:= dtStartDate.Date;
  AParam[4].tipe:= ptDateTime;
  AParam[4].data:= dtEndDate.Date;
  AParam[5].tipe:= ptInteger;
  AParam[5].data:= FLoginId;
  AParam[6].tipe:= ptString;
  AParam[6].data:= AgrvNo;
  AParam[7].tipe:= ptInteger;
  AParam[7].data:= FVoucherId;
  try
    Result:= GenerateVoucher.InputVoucher(AParam);
  except
    Result:= False;
  end;
end;

function TfrmDialogGenerateVoucher.GenerateVoucherDetil: Boolean;
var arrParam: TArr;
    tmpCode: array [0..1] of char;
    i: Integer;
begin
  if not assigned(GenerateVoucher) then
    GenerateVoucher := TGenerateVoucher.Create;
  StrLCopy(tmpCode,PChar(CustCode),2);
  for i:=1 to intedtQty.Value do
  begin
    CustCounter:= CustCounter+1;
    SetLength(arrParam,5);
    arrParam[0].tipe:= ptInteger;
    arrParam[0].data:= FVoucherId;
    arrParam[1].tipe:= ptString;
    arrParam[1].data:= 'VCR'+UpperCase(tmpCode)+StrPadLeft(IntToStr(CustCounter),11,'0');
    arrParam[2].tipe:= ptCurrency;
    arrParam[2].data:= jvcuredtNominal.Value;
    arrParam[3].tipe:= ptString;
    arrParam[3].data:= 'OPEN';
    arrParam[4].tipe:= ptInteger;
    arrParam[4].data:= FLoginId;
    try
      GenerateVoucher.GenerateDetilVoucher(arrParam);
    except
      
    end;
  end;
  if not assigned(DataCustomer) then
    DataCustomer := TDataCustomer.Create;
  SetLength(arrParam,2);
  arrParam[0].tipe:= ptInteger;
  arrParam[0].data:= CustCounter;
  arrParam[1].tipe:= ptInteger;
  arrParam[1].data:= StrToInt(frmGenerateVoucher.strgAgreement.Cells[8,frmGenerateVoucher.strgAgreement.Row]);
  Result:= DataCustomer.UpdateDataCustomerCounter(arrParam);
end;

procedure TfrmDialogGenerateVoucher.footerDialogMasterbtnSaveClick(
  Sender: TObject);
var tmp: Real;
begin
  inherited;
  tmp:= (frmGenerateVoucher.FTotalVoucher+(jvcuredtNominal.Value*intedtQty.Value));
  if StrToFloat(frmGenerateVoucher.strgAgreement.Cells[7,frmGenerateVoucher.strgAgreement.row])<
     tmp then
  begin
    CommonDlg.ShowConfirmGlobal(CONF_TOTAL_AGREEMENT);
    jvcuredtNominal.SetFocus;
    Exit;
  end;
  if not assigned(GenerateVoucher) then
    GenerateVoucher := TGenerateVoucher.Create;
  FVoucherId:= GenerateVoucher.GetVoucherId;
  if SaveMasterVoucher then
    FIsProcessSuccessfull:= GenerateVoucherDetil
  else
    FIsProcessSuccessfull:= False;
  Close;
end;

end.


