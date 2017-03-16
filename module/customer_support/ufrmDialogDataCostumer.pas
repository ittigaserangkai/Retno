unit ufrmDialogDataCostumer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, SUIForm,
  StdCtrls;

type
  TFormMode = (fmAdd, fmEdit);
  TfrmDialogDataCostumer = class(TfrmMasterDialog)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edtName: TEdit;
    edtContact: TEdit;
    edtAddress: TEdit;
    edtPhone: TEdit;
    Label1: TLabel;
    edtCode: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure edtCodeKeyPress(Sender: TObject; var Key: Char);
  private
    FFormMode: TFormMode;
    FIsProcessSuccessfull: boolean;
    FDataCustomerId: Integer;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure SetDataCustomerId(const Value: Integer);
    procedure showDataEdit(Id: Integer);
    procedure prepareAddData;
    function  SaveData: boolean;
    function  UpdateData: boolean;
  public
    { Public declarations }
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
    property DataCustomerId: Integer read FDataCustomerId write SetDataCustomerId;
  end;

var
  frmDialogDataCostumer: TfrmDialogDataCostumer;

implementation

uses uConn, uDataCustomer,  uGTSUICommonDlg;

{$R *.dfm}

procedure TfrmDialogDataCostumer.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogDataCostumer.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogDataCostumer.SetDataCustomerId(const Value: Integer);
begin
  FDataCustomerId:=Value;
end;

procedure TfrmDialogDataCostumer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogDataCostumer.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogDataCostumer := nil;
end;

procedure TfrmDialogDataCostumer.showDataEdit(Id: Integer);
var data: TResultDataSet;
    arr: TArr;
begin
  SetLength(arr,1);
  arr[0].tipe:= ptInteger;
  arr[0].data:= Id;
  if not assigned(DataCustomer) then
    DataCustomer := TDataCustomer.Create;
  data:= DataCustomer.GetListCustomer(arr);
  edtCode.Text:= data.fieldbyname('CUSTV_CODE').AsString;
  edtName.Text:= data.fieldbyname('CUSTV_NAME').AsString;
  edtAddress.Text:= data.fieldbyname('CUSTV_ADDRESS').AsString;
  edtPhone.Text:= data.fieldbyname('CUSTV_TELP').AsString;
  edtContact.Text:= data.fieldbyname('CUSTV_CONTACT_PERSON').AsString;
end;

procedure TfrmDialogDataCostumer.prepareAddData;
begin
  edtCode.Clear;
  edtName.Clear;
  edtContact.Clear;
  edtAddress.Clear;
  edtPhone.Clear;
end;

procedure TfrmDialogDataCostumer.FormShow(Sender: TObject);
begin
  inherited;
  if (FFormMode = fmEdit) then
    showDataEdit(FDataCustomerId)
  else
    prepareAddData();
  edtCode.SetFocus;
end;

function TfrmDialogDataCostumer.SaveData: boolean;
var arrParam: TArr;
begin
  if not assigned(DataCustomer) then
    DataCustomer := TDataCustomer.Create;
  SetLength(arrParam,6);
  arrParam[0].tipe := ptString;
  arrParam[0].data := edtCode.Text;
  arrParam[1].tipe := ptString;
  arrParam[1].data := edtName.Text;
  arrParam[2].tipe := ptString;
  arrParam[2].data := edtAddress.Text;
  arrParam[3].tipe := ptString;
  arrParam[3].data := edtPhone.Text;
  arrParam[4].tipe := ptString;
  arrParam[4].data := edtContact.Text;
  arrParam[5].tipe := ptInteger;
  arrParam[5].data := FLoginId;
  try
    Result:= DataCustomer.InputDataCustomer(arrParam);
  except
    Result:= False;
  end;
end;

function TfrmDialogDataCostumer.UpdateData: boolean;
var arrParam: TArr;
begin
  if not assigned(DataCustomer) then
    DataCustomer := TDataCustomer.Create;
  SetLength(arrParam,7);
  arrParam[0].tipe := ptString;
  arrParam[0].data := edtCode.Text;
  arrParam[1].tipe := ptString;
  arrParam[1].data := edtName.Text;
  arrParam[2].tipe := ptString;
  arrParam[2].data := edtAddress.Text;
  arrParam[3].tipe := ptString;
  arrParam[3].data := edtPhone.Text;
  arrParam[4].tipe := ptString;
  arrParam[4].data := edtContact.Text;
  arrParam[5].tipe := ptInteger;
  arrParam[5].data := FLoginId;
  arrParam[6].tipe := ptInteger;
  arrParam[6].data := DataCustomerId;
  try
    Result:= DataCustomer.UpdateDataCustomer(arrParam);
  except
    Result:= False;
  end;
end;

procedure TfrmDialogDataCostumer.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;
  if edtCode.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('Customer Code');
    edtCode.SetFocus;
    Exit;
  end;
  if edtName.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('Customer Name');
    edtName.SetFocus;
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

procedure TfrmDialogDataCostumer.edtCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = Chr(VK_RETURN) then
  begin
    if(Sender as TEdit).Name = 'edtCode' then
      edtName.SetFocus
    else
    if(Sender as TEdit).Name = 'edtName' then
      edtContact.SetFocus
    else
    if(Sender as TEdit).Name = 'edtContact' then
      edtPhone.SetFocus
    else
    if(Sender as TEdit).Name = 'edtPhone' then
      edtAddress.SetFocus
    else
      footerDialogMaster.btnSave.SetFocus;
  end;
end;

end.


