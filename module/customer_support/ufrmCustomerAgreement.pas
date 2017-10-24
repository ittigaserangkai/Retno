unit ufrmCustomerAgreement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls, Grids,
  BaseGrid, ActnList,
  cxGridCustomTableView, ufrmMasterBrowse, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  System.Actions, ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC;

type
  TfrmCustomerAgreement = class(TfrmMasterBrowse)
    pnl1: TPanel;
    edtName: TEdit;
    edtContact: TEdit;
    edtPhone: TEdit;
    edtAddress: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    lbl3: TLabel;
    lblSearchCompany: TLinkLabel;
    Label1: TLabel;
    edtCode: TEdit;
    btnValidate: TcxButton;
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodeChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure edtCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnValidateClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAddClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure cxGridViewEditing(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; var AAllow: Boolean);
  private
    FCustomerId: Integer;
    procedure ParseHeaderGrid();
    procedure ParseDataGrid();
  public
    property CustomerId: Integer read FCustomerId;
  end;

var
  frmCustomerAgreement: TfrmCustomerAgreement;

implementation

uses  uConn, ufrmDialogCustomerAgreement,
  uTSCommonDlg, uConstanta, ufrmSearchDataCustomer;

{$R *.dfm}

procedure TfrmCustomerAgreement.FormActivate(Sender: TObject);
begin
  inherited;
  //frmMain.CreateMenu((Sender as TForm));
end;

procedure TfrmCustomerAgreement.FormShow(Sender: TObject);
begin
  inherited;
  edtCode.Text:='';
  edtCode.SetFocus;
end;

procedure TfrmCustomerAgreement.edtCodeKeyPress(Sender: TObject;
  var Key: Char);
var data: TDataSet;
    arr: TArr;
begin
  inherited;
  if Key = Chr(VK_RETURN) then
  begin
    SetLength(arr,1);
    arr[0].tipe:= ptstring;
    arr[0].data:= edtcode.Text;
//    data:= DataCustomer.GetListCustomer(arr);
    if not data.IsEmpty then
    begin
      edtName.Text:= data.fieldbyname('CUSTV_NAME').AsString;
      edtAddress.Text:= data.fieldbyname('CUSTV_ADDRESS').AsString;
      edtPhone.Text:= data.fieldbyname('CUSTV_TELP').AsString;
      edtContact.Text:= data.fieldbyname('CUSTV_CONTACT_PERSON').AsString;
      FCustomerId:= data.fieldbyname('CUSTV_ID').AsInteger;
      ParseDataGrid;
    end;
  end;
end;

procedure TfrmCustomerAgreement.edtCodeChange(Sender: TObject);
begin
  inherited;
  edtName.Clear;
  edtContact.Clear;
  edtPhone.Clear;
  edtAddress.Clear;
  ParseHeaderGrid;
end;

procedure TfrmCustomerAgreement.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ////frmMain.DestroyMenu((Sender as TForm));
  Action := caFree;
end;

procedure TfrmCustomerAgreement.FormCreate(Sender: TObject);
begin
  inherited;
  Self.Caption := 'CUSTOMER AGREEMENT';
  lblHeader.Caption := Self.Caption;
  actRefreshExecute(Self);
end;

procedure TfrmCustomerAgreement.FormDestroy(Sender: TObject);
begin
  inherited;
  frmCustomerAgreement := nil;
end;

procedure TfrmCustomerAgreement.actRefreshExecute(Sender: TObject);
begin
  inherited;
  ParseDataGrid();
end;

procedure TfrmCustomerAgreement.edtCodeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key in [VK_UP,VK_DOWN]) then
    cxGrid.SetFocus;
end;

procedure TfrmCustomerAgreement.ParseHeaderGrid();
begin
  with cxGridView.DataController do
  begin
//    Clear;
//    RowCount:= 2;
//    ColCount:= 6;
//    Cells[0,0]:= 'NO';
//    Cells[1,0]:= 'DATE';
//    Cells[2,0]:= 'TOTAL';
//    Cells[3,0]:= 'DUE DATE';
//    Cells[4,0]:= 'STATUS';
//    Cells[5,0]:= 'VALIDATE';
//    AutoSize:= True;
  end;
end;

procedure TfrmCustomerAgreement.ParseDataGrid;
var data: TDataSet;
    arr: TArr;
    i: Integer;
begin
  ParseHeaderGrid;
  SetLength(arr,1);
  arr[0].tipe:= ptString;
  arr[0].data:= edtCode.Text;
//  data:= CustomerAgreement.GetListCustomerAgreement(arr);
//  with strgGrid, data do
//  begin
//    if not IsEmpty then
//    begin
//      RowCount:= RecordCount+1;
//      i:=0;
//      while not Eof do
//      begin
//        Inc(i);
//        Cells[0,i]:= fieldbyname('AGRV_NO').AsString;
//        Cells[1,i]:= FormatDateTime('dd/MM/yyyy',fieldbyname('AGRV_DATE').AsDateTime);
//        Cells[2,i]:= FormatFloat('#,##0.00	',fieldbyname('AGRV_TOTAL').AsFloat);
//        Cells[3,i]:= FormatDateTime('dd/MM/yyyy',fieldbyname('AGRV_DUE_DATE').AsDateTime);
//        Cells[4,i]:= fieldbyname('AGRV_STATUS').AsString;
//        AddCheckBox(5,i,False,False);
//        if fieldbyname('AGRV_STATUS').AsString<>'OPEN' then
//          SetCheckBoxState(5,i,True)
//        else
//          SetCheckBoxState(5,i,False);
//        //Cells[5,i] := fieldbyname('ARGV_STATUS').AsString;
//        Cells[6,i]:= IntToStr(fieldbyname('AGRV_ID').AsInteger);
//        Next;
//      end;
//      AutoSize:= True;
//    end;
//  end;
end;

procedure TfrmCustomerAgreement.btnValidateClick(Sender: TObject);
var arr: TArr;
    i: Integer;
    State,isValidate: Boolean;
begin
  inherited;
  State:= False;
  isValidate:= False;
//  for i:=1 to strgGrid.RowCount-1 do
//  begin
//    if(strgGrid.Cells[4,i]='OPEN')then
//    begin
//      strgGrid.GetCheckBoxState(5,i,State);
//      if(State)then
//      begin
//        SetLength(arr,2);
//        arr[0].tipe:= ptString;
//        arr[0].data:= 'VALID';
//        arr[1].tipe:= ptInteger;
//        arr[1].data:= strgGrid.Cells[6,strgGrid.Row];
//        if not assigned(CustomerAgreement) then
//          CustomerAgreement := TCustomerAgreement.Create;
//        isValidate:= CustomerAgreement.ValidateCustomerAgreement(arr);
//      end;
//    end;
//  end;
  if isValidate then
  begin
    actRefreshExecute(Self);
    CommonDlg.ShowConfirmGlobal(CONF_VALIDATE_SUCCESSFULLY);
  end;
  cxGrid.SetFocus;
end;

procedure TfrmCustomerAgreement.btnAddClick(Sender: TObject);
begin
  inherited;
  if edtName.Text='' then
  begin
    edtCode.SetFocus;
    Exit;
  end;
  if not Assigned(frmDialogCustomerAgreement) then
    Application.CreateForm(TfrmDialogCustomerAgreement, frmDialogCustomerAgreement);
  frmDialogCustomerAgreement.Caption := 'Add Data Customer';
  frmDialogCustomerAgreement.FormMode:=fmAdd;

  SetFormPropertyAndShowDialog(frmDialogCustomerAgreement);
  if (frmDialogCustomerAgreement.IsProcessSuccessfull) then
  begin
    actRefreshExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atAdd);
  end;

  frmDialogCustomerAgreement.Free;
  cxGrid.SetFocus;

end;

procedure TfrmCustomerAgreement.btnSearchClick(Sender: TObject);
begin
  inherited;
  if not Assigned(frmSearchDataCustomer) then
    Application.CreateForm(TfrmSearchDataCustomer, frmSearchDataCustomer);

  SetFormPropertyAndShowDialog(frmSearchDataCustomer);
end;

procedure TfrmCustomerAgreement.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F5 then
    btnSearch.Click;
end;

procedure TfrmCustomerAgreement.btnUpdateClick(Sender: TObject);
begin
  inherited;
  if edtName.Text='' then
  begin
    edtCode.SetFocus;
    Exit;
  end;
//  if strgGrid.Cells[6,strgGrid.Row]='' then Exit;
//  if strgGrid.Cells[5,strgGrid.Row]<>'OPEN' then
//  begin
//    CommonDlg.ShowConfirmGlobal(CONF_COULD_NOT_EDIT);
//    strgGrid.SetFocus;
//    Exit;
//  end;
  if not Assigned(frmDialogCustomerAgreement) then
    Application.CreateForm(TfrmDialogCustomerAgreement, frmDialogCustomerAgreement);
  frmDialogCustomerAgreement.Caption := 'Edit Data Customer';
  frmDialogCustomerAgreement.FormMode:=fmEdit;
//  frmDialogCustomerAgreement.CustAgreementId:=StrToInt(strgGrid.Cells[6,strgGrid.row]);

  SetFormPropertyAndShowDialog(frmDialogCustomerAgreement);
  if (frmDialogCustomerAgreement.IsProcessSuccessfull) then
  begin
    actRefreshExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atEdit);
  end;

  frmDialogCustomerAgreement.Free;
  cxGrid.SetFocus;
end;

procedure TfrmCustomerAgreement.cxGridViewEditing(Sender:
    TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  inherited;
//  if ACol=5 then CanEdit:= True;
//  if strgGrid.Cells[4,ARow]<>'OPEN' then
//    strgGrid.SetCheckBoxState(ACol,ARow,True);

end;

end.

