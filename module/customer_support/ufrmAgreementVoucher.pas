unit ufrmAgreementVoucher;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls, ufrmMasterBrowse,
  ActnList, System.Actions, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, ufraFooter4Button, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC;

type
  TfrmAgreementVoucher = class(TfrmMasterBrowse)
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
    pnl2: TPanel;
    btnValidate: TcxButton;
    cxButton1: TcxButton;
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
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lblSearchCompanyClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FCustomerId: Integer;
    procedure ParseHeaderGrid();
    procedure ParseDataGrid();
  public
    property CustomerId: Integer read FCustomerId;
  end;

var
  frmAgreementVoucher: TfrmAgreementVoucher;

implementation

{$R *.dfm}

uses
  ufrmDialogAgreementVoucher, uTSCommonDlg, uConstanta, ufrmSearchDataCustomer;


procedure TfrmAgreementVoucher.FormActivate(Sender: TObject);
begin
  inherited;
  //frmMain.CreateMenu((Sender as TForm));
end;

procedure TfrmAgreementVoucher.FormShow(Sender: TObject);
begin
  inherited;
  edtCode.Text:='';
  edtCode.SetFocus;
end;

procedure TfrmAgreementVoucher.edtCodeKeyPress(Sender: TObject;
  var Key: Char);
//var //data: TResultDataSet;
    //arr: TArr;
begin
  inherited;
  if Key = Chr(VK_RETURN) then
  begin
//  with TCustomerVoucher.Create(self) do
//  try
//    if not LoadByCode(edtcode.Text,MasterNewUnit.ID) then
//    begin
//      CommonDlg.ShowError('Data tdk ditemukan...');
//      Exit;
//    end;
//      edtName.Text:= NAME;
//      edtAddress.Text:=ADDRESS;
//      edtPhone.Text:=TELP;
//      edtContact.Text:=CONTACT_PERSON;
//      FCustomerId:=ID;
//      ParseDataGrid;
//  finally
//    Free;
//  end;
  end;
end;

procedure TfrmAgreementVoucher.edtCodeChange(Sender: TObject);
begin
  inherited;
  edtName.Clear;
  edtContact.Clear;
  edtPhone.Clear;
  edtAddress.Clear;
  ParseHeaderGrid;
end;

procedure TfrmAgreementVoucher.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //frmMain.DestroyMenu((Sender as TForm));
  Action := caFree;
end;

procedure TfrmAgreementVoucher.FormCreate(Sender: TObject);
begin
  inherited;
  Self.Caption := 'AGREEMENT VOUCHER';
  lblHeader.Caption := Self.Caption;
  actRefreshExecute(Self);
end;

procedure TfrmAgreementVoucher.FormDestroy(Sender: TObject);
begin
  inherited;
  frmAgreementVoucher := nil;
end;

procedure TfrmAgreementVoucher.actRefreshExecute(Sender: TObject);
begin
  inherited;
  ParseDataGrid();
end;

procedure TfrmAgreementVoucher.edtCodeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key in [VK_UP,VK_DOWN]) then
    cxGrid.SetFocus;
end;

procedure TfrmAgreementVoucher.ParseHeaderGrid();
begin
//  with strgGrid do
//  begin
//    Clear;
//    RowCount:= 2;
//    ColCount:= 8;
//    Cells[0,0]:= 'NO';
//    Cells[1,0]:= 'DATE';
//    Cells[2,0]:= 'TOTAL';
//    Cells[3,0]:= 'DISC (%)';
//    Cells[4,0]:= 'TOTAL AFTER DISC';
//    Cells[5,0]:= 'DUE DATE';
//    Cells[6,0]:= 'STATUS';
//    Cells[7,0]:= 'VALIDATE';
//    AutoSize:= True;
//  end;
end;

procedure TfrmAgreementVoucher.ParseDataGrid;
var
    i: Integer;
sQ:string;
begin
  ParseHeaderGrid;
  sQ:='SELECT * FROM AGREEMENT_VOUCHER '+
    'WHERE AGRV_CUSTV_CODE='+QuotedStr(edtCode.Text)+
//    ' AND AGRV_UNT_ID = '+IntToStr(MasterNewUnit.ID)+' '+
    'ORDER BY AGRV_NO';
//  with cOpenQuery(sQ) do
//  try
//  with strgGrid do
//  begin
//    if not IsEmpty then
//    begin
//      //RowCount:= RecordCount+1;
//      i:=0;
//      while not Eof do
//      begin
//        if i>0 then
//          AddRow;
//        Inc(i);
//        Cells[0,i]:= FieldValues['AGRV_NO'];
//        Cells[1,i]:= FormatDateTime('dd/MM/yyyy',FieldValues['AGRV_DATE']);
//        Cells[2,i]:= FormatFloat('#,##0.00',FieldValues['AGRV_TOTAL']);
//        Cells[3,i]:= FormatFloat('#,##0.00',FieldValues['AGRV_DISC']);
//        Cells[4,i]:= FormatFloat('#,##0.00',FieldValues['AGRV_TOTAL_AFTER_DISC']);
//        Cells[5,i]:= FormatDateTime('dd/MM/yyyy',FieldValues['AGRV_DUE_DATE']);
//        Cells[6,i]:= FieldValues['AGRV_STATUS'];
//        AddCheckBox(7,i,False,False);
//        if FieldValues['AGRV_STATUS']<>'OPEN' then
//          SetCheckBoxState(7,i,True)
//        else
//          SetCheckBoxState(7,i,False);
//        //Cells[5,i] := fieldbyname('ARGV_STATUS').AsString;
//        Cells[8,i]:= IntToStr(FieldValues['AGRV_ID']);
//        Next;
//      end;
//      AutoSize:= True;
//    end;
//  end;
//  finally
//    free;
//  end;

end;

procedure TfrmAgreementVoucher.btnValidateClick(Sender: TObject);
var
    i: Integer;
    b,isValidate: Boolean;
begin
  inherited;
//  State:= False;
//  isValidate:= False;
//  for i := 1 to strgGrid.RowCount-1 do
//  begin
//    if(strgGrid.Cells[6,i]='OPEN')then
//    begin
//      strgGrid.GetCheckBoxState(7,i,b);
//      if(b)then
//      begin
//
//  with TAgreementVoucher.CreateWithUser(self,FLoginId) do
//  try
//    if not LoadByID(StrToInt(strgGrid.Cells[8,i]),MasterNewUnit.ID) then
//    begin
//      CommonDlg.ShowError('Data tdk ditemukan...');
//      isValidate:=False;
//      Exit;
//    end;
//    UpdateData(CUSTV.NewUnit.ID,CUSTV.CODE,DATE,
//      DISC,DUE_DATE,ID,NewUnit.ID,NO,'VALID',
//      TOTAL,TOTAL_AFTER_DISC);
//    if SaveToDB then
//    begin
//      cCommitTrans;
//      CommonDlg.ShowConfirmGlobal('Simpan sukses...');
//      isValidate:=True;
//    end
//    else
//    begin
//      cRollbackTrans;
//      CommonDlg.ShowError('Error Simpan...');
//      isValidate:=False;
//    end;
//  finally
//    Free;
//  end;

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

procedure TfrmAgreementVoucher.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F5 then
    btnSearch.Click;
end;

procedure TfrmAgreementVoucher.lblSearchCompanyClick(Sender: TObject);
var
  iKeyF5: Word;
begin
  inherited;

  iKeyF5 := VK_F5;
  FormKeyDown(Sender,iKeyF5,[ssShift]);
end;

procedure TfrmAgreementVoucher.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  // u add,edit,del,dll
end;

end.
