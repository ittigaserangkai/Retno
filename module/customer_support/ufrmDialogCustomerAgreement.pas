unit ufrmDialogCustomerAgreement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, uInterface,
  StdCtrls, Mask, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxCurrencyEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button;
 
type
  TFormMode = (fmAdd, fmEdit);
  TfrmDialogCustomerAgreement = class(TfrmMasterDialog, ICRUDAble)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edtNo: TEdit;
    dtDate: TcxDateEdit;
    dtDueDate: TcxDateEdit;
    jvcuredtTotal: TcxCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtNoKeyPress(Sender: TObject; var Key: Char);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
  private
    FFormMode: TFormMode;
    FCustAgreementId: Integer;
    FIsProcessSuccessfull: boolean;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetCustAgreementId(const Value: Integer);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure showDataEdit(Id: Integer);
    procedure prepareAddData;
    function  SaveData: boolean;
    function  UpdateData: boolean;
  public
    procedure LoadData(AID : String);
    { Public declarations }
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property CustAgreementId: Integer read FCustAgreementId write SetCustAgreementId;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogCustomerAgreement: TfrmDialogCustomerAgreement;

implementation

uses uTSCommonDlg, uConn, ufrmCustomerAgreement, DB;

{$R *.dfm}

procedure TfrmDialogCustomerAgreement.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogCustomerAgreement.SetCustAgreementId(const Value: Integer);
begin
  FCustAgreementId:=Value;
end;

procedure TfrmDialogCustomerAgreement.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogCustomerAgreement.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogCustomerAgreement.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogCustomerAgreement := nil;
end;

procedure TfrmDialogCustomerAgreement.prepareAddData;
begin
  edtNo.Clear;
  dtDate.Date:= Now;
  jvcuredtTotal.Value:= 0;
  dtDueDate.Date:= Now;
end;

procedure TfrmDialogCustomerAgreement.showDataEdit(Id: Integer);
var data: TDataSet;
    arr: TArr;
begin
  SetLength(arr,1);
  arr[0].tipe:= ptInteger;
  arr[0].data:= Id;
//  if not assigned(CustomerAgreement) then
//    CustomerAgreement := TCustomerAgreement.Create;
//  data:= CustomerAgreement.GetListCustomerAgreement(arr);
  edtNo.Text:= data.fieldbyname('AGRV_NO').AsString;
  dtDate.Date:= data.fieldbyname('AGRV_DATE').AsDateTime;
  jvcuredtTotal.Value:= data.fieldbyname('AGRV_TOTAL').AsCurrency;
  dtDueDate.Date:= data.fieldbyname('AGRV_DUE_DATE').AsDateTime;
end;

procedure TfrmDialogCustomerAgreement.FormShow(Sender: TObject);
begin
  inherited;
  if (FFormMode = fmEdit) then
    showDataEdit(FCustAgreementId)
  else
    prepareAddData();
  edtNo.SetFocus;
end;

procedure TfrmDialogCustomerAgreement.edtNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = Chr(VK_RETURN) then
  begin
    if(Sender.ClassType=TEdit)and((Sender as TEdit).Name='edtNo') then
      dtDate.SetFocus
    else
    if(Sender.ClassType=TcxDateEdit)and((Sender as TcxDateEdit).Name='dtDate')then
      jvcuredtTotal.SetFocus
    else
    if(Sender.ClassType=TcxCurrencyEdit)and((Sender as TcxCurrencyEdit).Name='edtTotal')then
      dtDueDate.SetFocus
    else
      footerDialogMaster.btnSave.SetFocus;
  end;
end;

function TfrmDialogCustomerAgreement.SaveData: boolean;
var arrParam: TArr;
begin
//  if not assigned(CustomerAgreement) then
//    CustomerAgreement := TCustomerAgreement.Create;
  SetLength(arrParam,7);
  arrParam[0].tipe := ptString;
  arrParam[0].data := edtNo.Text;
  arrParam[1].tipe := ptDateTime;
  arrParam[1].data := dtDate.Date;
  arrParam[2].tipe := ptString;
  arrParam[2].data := frmCustomerAgreement.edtCode.Text;
  arrParam[3].tipe := ptCurrency;
  arrParam[3].data := jvcuredtTotal.Value;
  arrParam[4].tipe := ptDateTime;
  arrParam[4].data := dtDueDate.Date;
  arrParam[5].tipe := ptString;
  arrParam[5].data := 'OPEN';
  arrParam[6].tipe := ptInteger;
  arrParam[6].data := FLoginId;
  try
//    Result:= CustomerAgreement.InputCustomerAgreement(arrParam);
  except
    Result:= False;
  end;
end;

function TfrmDialogCustomerAgreement.UpdateData: boolean;
var arrParam: TArr;
begin
//  if not assigned(CustomerAgreement) then
//    CustomerAgreement := TCustomerAgreement.Create;
  SetLength(arrParam,6);
  arrParam[0].tipe := ptString;
  arrParam[0].data := edtNo.Text;
  arrParam[1].tipe := ptDateTime;
  arrParam[1].data := dtDate.Date;
  arrParam[2].tipe := ptCurrency;
  arrParam[2].data := jvcuredtTotal.Value;
  arrParam[3].tipe := ptDateTime;
  arrParam[3].data := dtDueDate.Date;
  arrParam[4].tipe := ptInteger;
  arrParam[4].data := FLoginId;
  arrParam[5].tipe := ptInteger;
  arrParam[5].data := CustAgreementId;
  try
//    Result:= CustomerAgreement.UpdateCustomerAgreement(arrParam);
  except
    Result:= False;
  end;
end;

procedure TfrmDialogCustomerAgreement.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;
  if edtNo.Text='' then
  begin
    CommonDlg.ShowErrorEmpty(lbl1.Caption);
    edtNo.SetFocus;
    Exit;
  end;
  if (FormMode = fmAdd) then
  begin
    FIsProcessSuccessfull := SaveData;
    if FIsProcessSuccessfull then
      Close;
  end
  else
  begin
    FIsProcessSuccessfull := UpdateData;
    if FIsProcessSuccessfull then
      Close;
  end; // end if
end;

procedure TfrmDialogCustomerAgreement.LoadData(AID : String);
begin
//  ClearByTag([0,1]);
//  edNoBukti.Text := 'Otomatis';
//  FreeAndNil(FCI);

//  if AID = '' then
//    Exit;
//
//  FCI := TModCustomerInvoice(DMClient.CrudCustomerInvoiceClient.Retrieve(TModCustomerInvoice.ClassName, AID));
//  if FCI = nil then
//    Exit;

end;

end.


