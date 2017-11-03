unit ufrmCustomerVoucher;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, ActnList, uRetnoUnit,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Menus, System.Actions, ufraFooter4Button, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC;

type
  TfrmCustomerVoucher = class(TfrmMasterBrowse)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure ParseHeaderGrid();
    procedure ParseDataGrid();
  public
    function IsHaveAggrement(aKode:String): Boolean;
    { Public declarations }
  end;

var
  frmCustomerVoucher: TfrmCustomerVoucher;

implementation

uses  ufrmDialogCustomerVoucher, uTSCommonDlg, DateUtils;

{$R *.dfm}

procedure TfrmCustomerVoucher.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmCustomerVoucher.FormCreate(Sender: TObject);
begin
  inherited;
  Self.Caption := 'CUSTOMER VOUCHER';
  lblHeader.Caption := Self.Caption;
  actRefreshExecute(Self);
end;

procedure TfrmCustomerVoucher.FormDestroy(Sender: TObject);
begin
  inherited;
  frmCustomerVoucher := nil;
end;

procedure TfrmCustomerVoucher.actAddExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogCostumerVoucher) then
    Application.CreateForm(TfrmDialogCostumerVoucher, frmDialogCostumerVoucher);
  frmDialogCostumerVoucher.Caption := 'Add Data Customer';
  frmDialogCostumerVoucher.FormMode:=fmAdd;

  SetFormPropertyAndShowDialog(frmDialogCostumerVoucher);

  if (frmDialogCostumerVoucher.IsProcessSuccessfull) then
  begin
    actRefreshExecute(Self);
   // CommonDlg.ShowConfirmSuccessfull(atAdd);
  end;

  frmDialogCostumerVoucher.Free;
  cxGrid.SetFocus;
end;

procedure TfrmCustomerVoucher.actEditExecute(Sender: TObject);
begin
  inherited;
//  if strgGrid.Cells[5,strgGrid.Row]='' then Exit;
//  if not Assigned(frmDialogCostumerVoucher) then
//    Application.CreateForm(TfrmDialogCostumerVoucher, frmDialogCostumerVoucher);
//  frmDialogCostumerVoucher.Caption := 'Edit Data Customer';
//  frmDialogCostumerVoucher.FormMode:=fmEdit;
//  frmDialogCostumerVoucher.DataCustomerId:=StrToInt(strgGrid.Cells[5,strgGrid.row]);
//
//  SetFormPropertyAndShowDialog(frmDialogCostumerVoucher);
//
//  if (frmDialogCostumerVoucher.IsProcessSuccessfull) then
//  begin
//    actRefreshCustomerVoucherExecute(Self);
//  //  CommonDlg.ShowConfirmSuccessfull(atEdit);
//  end;
//
//
//  frmDialogCostumerVoucher.Free;
//  strgGrid.SetFocus;
end;

procedure TfrmCustomerVoucher.actRefreshExecute(Sender: TObject);
begin
  inherited;
  ParseDataGrid();
end;

procedure TfrmCustomerVoucher.ParseHeaderGrid();
begin
//  with strgGrid do
//  begin
//    Clear;
//    RowCount:= 2;
//    ColCount:= 5;
//    Cells[0,0]:= 'CODE';
//    Cells[1,0]:= 'NAME';
//    Cells[2,0]:= 'ADDRESS';
//    Cells[3,0]:= 'TELEPHONE';
//    Cells[4,0]:= 'CONTACT PERSON';
//  //  Cells[5,0]:= 'ID';
//    AutoSize:= True;
//  end;
end;

procedure TfrmCustomerVoucher.ParseDataGrid;
var //data: TResultDataSet;
    //arr: TArr;
    i: Integer;
    sQ:string;
begin
  ParseHeaderGrid;
  sQ:='SELECT * FROM CUSTOMER_VOUCHER '+
//    'WHERE CUSTV_UNT_ID ='+IntToStr(MasterNewUnit.ID)+
    ' ORDER BY CUSTV_CODE';
//  with cOpenQuery(sQ) do
//  try
//  with strgGrid do
//  begin
//    if not IsEmpty then
//    begin
//     // RowCount:= RecordCount+1;
//      i:=0;
//      while not Eof do
//      begin
//        if i>0 then
//          AddRow;
//        Inc(i);
//          Cells[0,i]:= FieldValues['CUSTV_CODE'];
//          Cells[1,i]:= FieldValues['CUSTV_NAME'];
//          Cells[2,i]:= FieldValues['CUSTV_ADDRESS'];
//          Cells[3,i]:= FieldValues['CUSTV_TELP'];
//          Cells[4,i]:= FieldValues['CUSTV_CONTACT_PERSON'];
//          Cells[5,i]:= FieldValues['CUSTV_ID'];
//        Next;
//      end;
//      AutoSize:= True;
//    end;
//  end;
//  finally
//    free;
//  end;

end;

procedure TfrmCustomerVoucher.FormShow(Sender: TObject);
begin
  inherited;
  cxGrid.SetFocus;
end;

function TfrmCustomerVoucher.IsHaveAggrement(aKode:String): Boolean; 
var
sSQL:string;
begin
  Result := False;


  sSQL :='SELECT * FROM AGREEMENT_VOUCHER '+
         'WHERE AGRV_CUSTV_CODE='+QuotedStr(aKode)+
//         ' AND AGRV_UNT_ID = '+IntToStr(MasterNewUnit.ID)+' '+
         'ORDER BY AGRV_NO';
//  with cOpenQuery(sSQL) do
//  try
//  with strgGrid do
//  begin
//    if not IsEmpty then
//    begin
//      Result := True;
//      Exit;
//    end;
//  end;
//  finally
//    free;
//  end;
end;

end.
