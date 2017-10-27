unit ufrmDialogGenerateVoucher;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, StdCtrls, Mask,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxCurrencyEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, System.Actions, Vcl.ActnList,
  ufraFooterDialog3Button;

type
  TfrmDialogGenerateVoucher = class(TfrmMasterDialog)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    dtIssuedDate: TcxDateEdit;
    dtStartDate: TcxDateEdit;
    dtEndDate: TcxDateEdit;
    jvcuredtNominal: TcxCurrencyEdit;
    intedtQty: TcxCurrencyEdit;
    lbl6: TLabel;
    edtPrefix: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FIsProcessSuccessfull: boolean;
    FAgrvNo: string;
//    FVoucherId: Integer;
    FCustCounter: Integer;
    FCustCode: String;
    FCustID: Integer;
    FMaxVoucher: Double;
    FVoucher: Double;
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure SetAgrvNo(const Value: String);
    procedure SetCustCounter(const Value: Integer);
    procedure SetCustCode(const Value: String);
    function SaveMasterVoucher(aPrefix : String): Boolean;
//    function  GenerateVoucherDetil: Boolean;
  public
    function GetLastDetilNo(aUntID:Integer; aPrefix : String): Integer;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
    property AgrvNo: string read FAgrvNo write SetAgrvNo;
    property CustCounter: Integer read FCustCounter write SetCustCounter;
    property CustCode: String read FCustCode write SetCustCode;
    property CustID: Integer read FCustID write FCustID;
    property MaxVoucher: Double read FMaxVoucher write FMaxVoucher;
    property Voucher: Double read FVoucher write FVoucher;
  end;

var
  frmDialogGenerateVoucher: TfrmDialogGenerateVoucher;

implementation
{$R *.dfm}

uses
  uTSCommonDlg, uConstanta;



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
  edtPrefix.Text        := '';
  jvcuredtNominal.Value := 0;
  intedtQty.Value       := 0;
  
  edtPrefix.SetFocus;
end;

function TfrmDialogGenerateVoucher.SaveMasterVoucher(aPrefix : String): Boolean;
var
  iLastNo: Integer;
  sQ,aNo,tmpCode:String;
//  cv:TCustomerVoucher;
  i   : Integer;
begin
  Result := False;

  if jvcuredtNominal.Value <= 0 then
  begin
    CommonDlg.ShowError('Nominal <= 0');
    jvcuredtNominal.SetFocus;
    Exit;
  end;

  if intedtQty.Value <= 0 then
  begin
    CommonDlg.ShowError('Jumlah Voucher <= 0');
    intedtQty.SetFocus;
    Exit;
  end;

//  cv:=TCustomerVoucher.CreateWithUser(self,FLoginId);
//  with TVoucher.CreateWithUser(self,FLoginId) do
//  try
//
//
//    UpdateData(AgrvNo,DialogUnit,0,0,dtEndDate.Date,0,dtIssuedDate.Date,
//      DialogUnit,jvcuredtNominal.Value,0,0,FLoginId,0,intedtQty.Value,
//      dtStartDate.Date, aPrefix);
//
//      tmpCode := CustCode;
//
//    sQ:='SELECT CV.CUSTV_COUNTER FROM CUSTOMER_VOUCHER CV ' +
//    'INNER JOIN AGREEMENT_VOUCHER AV ON AV.AGRV_CUSTV_CODE = CV.CUSTV_CODE ' +
//    '    AND AV.AGRV_CUSTV_UNT_ID = CV.CUSTV_UNT_ID ' +
//    '    AND AV.AGRV_NO = '+quot(AgrvNo)+' AND AV.AGRV_UNT_ID ='+inttostr(DialogUnit);
//
//      with cOpenQuery(sQ) do
//      try
//        CustCounter :=FieldValues['CUSTV_COUNTER'];
//      finally
//        Free;
//      end;
//
//      iLastNo := GetLastDetilNo(DialogUnit, aPrefix);
//
//      for i:=0 to intedtQty.Value-1 do
//      begin
//        aNo := aPrefix + StrPadLeft(IntToStr(i+iLastNo+1),5,'0');
//        UpdateVoucherDetails(0,0,0,aNo,jvcuredtNominal.Value,0,0,0,FLoginId,'','OPEN',DialogUnit);
//      end;
//
//    if not cv.LoadByID(CustID,DialogUnit) then
//    begin
//      CommonDlg.ShowError('Data tdk ditemukan...');
//      Result:=False;
//      Exit;
//    end;
//
//    cv.UpdateData(cv.ADDRESS,cv.CODE,cv.CONTACT_PERSON,CustCounter,cv.ID,cv.NAME,
//       DialogUnit,cv.TELP);
//
//    if SaveToDB and cv.SaveToDB then
//    begin
//      cCommitTrans;
//      CommonDlg.ShowConfirmGlobal('Simpan sukses...');
//      Result:=True;
//    end
//    else
//    begin
//      cRollbackTrans;
//      CommonDlg.ShowError('Error Simpan...');
//      Result:=False;
//    end;
//  finally
//    Free;
//    cv.Free;
//  end;

end;

//function TfrmDialogGenerateVoucher.GenerateVoucherDetil: Boolean;
//var arrParam: TArr;
//    //tmpCode: array [0..1] of char;
//    tmpCode: string;
//    i: Integer;
//begin
//
//  { **********************
//  if not assigned(GenerateVoucher) then
//    GenerateVoucher := TGenerateVoucher.Create;
//  //StrLCopy(tmpCode,PChar(CustCode),2);
//  tmpCode := CustCode;
//  
//  SetLength(arrParam, 2);
//  arrParam[0].tipe := ptString;
//  arrParam[0].data := AgrvNo;
//  arrParam[1].tipe := ptInteger;
//  arrParam[1].data := DialogUnit;
//  CustCounter := GenerateVoucher.GetVoucherCounterByAgreementVoucherNo(arrParam);
//
//  for i:=1 to intedtQty.Value do
//  begin
//    CustCounter:= CustCounter+1;
//    SetLength(arrParam,7);
//    arrParam[0].tipe:= ptInteger;
//    arrParam[0].data:= FVoucherId;
//    arrParam[1].tipe:= ptString;
//    arrParam[1].data:= 'VCR'+UpperCase(tmpCode)+ IntToStr(CurrentYear) +StrPadLeft(IntToStr(CustCounter),7,'0');
//    arrParam[2].tipe:= ptCurrency;
//    arrParam[2].data:= jvcuredtNominal.Value;
//    arrParam[3].tipe:= ptString;
//    arrParam[3].data:= 'OPEN';
//    arrParam[4].tipe:= ptInteger;
//    arrParam[4].data:= FLoginId;
//    arrParam[5].tipe := ptInteger;
//    arrParam[5].data := DialogUnit;
//    arrParam[6].tipe := ptInteger;
//    arrParam[6].data := DialogUnit;
//    try
//      GenerateVoucher.GenerateDetilVoucher(arrParam);
//    except
//
//    end;
//  end;
//  if not assigned(CustomerVoucher) then
//    CustomerVoucher := TCustomerVoucher.Create;
//  SetLength(arrParam,3);
//  arrParam[0].tipe:= ptInteger;
//  arrParam[0].data:= CustCounter;
//  arrParam[1].tipe:= ptInteger;
//  arrParam[1].data:= StrToInt(frmGenerateVoucher.strgAgreement.Cells[8,frmGenerateVoucher.strgAgreement.Row]);
//  arrParam[2].tipe := ptInteger;
//  arrParam[2].data := DialogUnit;
//  Result:= CustomerVoucher.UpdateCustomerVoucherCounter(arrParam);
//  }
//end;

procedure TfrmDialogGenerateVoucher.footerDialogMasterbtnSaveClick(
  Sender: TObject);
var tmp: Real;
begin
  inherited;
  if Trim(edtPrefix.Text) = '' then
  begin
    CommonDlg.ShowError('Prefix No Voucher Belum Diisi');
    edtPrefix.SetFocus;
    Exit;
  end;

  tmp:= FVoucher + (jvcuredtNominal.Value*intedtQty.Value);
  if tmp > FMaxVoucher then
  begin
    CommonDlg.ShowConfirmGlobal(CONF_TOTAL_AGREEMENT);
    jvcuredtNominal.SetFocus;
    Exit;
  end;

  if SaveMasterVoucher(edtPrefix.Text) then
  begin
    FIsProcessSuccessfull:= True  ;
    Close;
  end else
    FIsProcessSuccessfull:= False;

end;

procedure TfrmDialogGenerateVoucher.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) and (ActiveControl <> footerDialogMaster.btnClose) and (ActiveControl <> footerDialogMaster.btnSave) and not (ssCtrl in Shift)then
    SelectNext(ActiveControl,True,True);
end;

procedure TfrmDialogGenerateVoucher.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  // ini u/ close
end;

function TfrmDialogGenerateVoucher.GetLastDetilNo(aUntID:Integer; aPrefix :
    String): Integer;
var
  sNo: string;
  sSQL: String;
begin
  Result := 0;
  sSQL := 'Select VCRD_NO '
          + ' from VOUCHER_DETIL a, voucher b'
          + ' where a.VCRD_VCR_ID = b.VCR_ID'
          + ' and a.VCRD_VCR_UNT_ID = b.VCR_UNT_ID'
          + ' and a.VCRD_UNT_ID = ' + IntToStr(aUntID)
          + ' and b.VCR_PREFIX = ' + QuotedStr(aPrefix)
          + ' Order by a.VCRD_NO Desc';
//  with cOpenQuery(sSQL) do
//  Begin
//    try
//      if not Eof then
//        begin
//          sNo    := StrRight(fieldbyname('VCRD_NO').AsString,5);
//          TryStrToInt(sNo, Result);
//        end;
//    finally
//      Free;
//    end;
//  end
end;

end.
