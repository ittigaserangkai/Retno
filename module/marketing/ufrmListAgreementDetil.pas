unit ufrmListAgreementDetil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ufrmMasterBrowse, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, System.Actions,
  Vcl.ActnList, ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, cxPC;

type
  TfrmListAgreementDetil = class(TfrmMasterBrowse)
    lbl9: TLabel;
    pnlTop: TPanel;
    lbl3: TLabel;
    lbl8: TLabel;
    btnShowList: TcxButton;
    edtmemberNo1: TEdit;
    edtMemberNo2: TEdit;
    cxcolDate: TcxGridDBColumn;
    cxcolJournalNo: TcxGridDBColumn;
    cxcolDateEntry: TcxGridDBColumn;
    cxcolJournalCode: TcxGridDBColumn;
    cxcolReferenceNo: TcxGridDBColumn;
    cxcolDescription: TcxGridDBColumn;
    cxcolPosted: TcxGridDBColumn;
    procedure actPrintExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure btnShowListClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure edtmemberNo1KeyPress(Sender: TObject; var Key: Char);
    procedure edtMemberNo2KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtmemberNo1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMemberNo2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure ParseHeaderGrid;
    procedure FetchAgreementDetilList;
  public
    { Public declarations }
  end;

var
  frmListAgreementDetil: TfrmListAgreementDetil;

implementation
{$R *.dfm}

uses
  uTSCommonDlg;

const
    _Kol_NO : Byte = 0;
    _Kol_CUST_CODE : Byte = 1;
    _Kol_CUST_NAME : Byte = 2;
    _Kol_AGREEMENT_NO : Byte = 3;
    _Kol_PERIODE : Byte = 4;
    _Kol_DESCRIPTION : Byte = 5;
    _Kol_TOTAL_AGREEMENT : Byte = 6;
    _Kol_TOTAL_ACCRUAL : Byte = 7;
    _Kol_TOTAL_INVOICE : Byte = 8;
    _Kol_TOTAL_PAYMENT : Byte = 9;



procedure TfrmListAgreementDetil.actPrintExecute(Sender: TObject);
begin
  inherited;
//  if Mastercompany.ID = 0 then
//  begin
//    CommonDlg.ShowErrorEmpty('Company Name');
//    Exit;
//  end;
//
//  if MasterNewUnit.ID = 0 then
//  begin
//    CommonDlg.ShowErrorEmpty('Unit Store');
//    Exit;
//  end;
//
//  sSQL :=
//    'SELECT ' +
//        'CUST.CUST_CODE,CUST.CUST_NAME,AG.AGR_NO,AG.AGR_DESCRIPTION,' +
//        'AG.AGR_DATE_START,AG.AGR_DATE_END, SUM(AGRD.AGRD_TOTAL) AS AGRD_TOTAL,' +
//        'SUM(AGRJ.AGRJDWL_INV_TOTAL) AS AGRJDWL_INV_TOTAL,' +
//        'SUM(AGRJ.AGRJDWL_ACCRU_TOTAL) AS AGRJDWL_ACCRU_TOTAL,' +
//        'SUM(INPAY.INVPAY_TOTAL_PAYMENT) AS INVPAY_TOTAL_PAYMENT' +
//    ' FROM AGREEMENT AG' +
//    ' LEFT JOIN CUSTOMER CUST ON CUST.CUST_CODE=AG.AGR_CUST_CODE' +
//        ' AND CUST.CUST_UNT_ID=AG.AGR_CUST_UNT_ID' +
//    ' LEFT JOIN AGREEMENT_DETIL AGRD ON AG.AGR_ID=AGRD.AGRD_AGR_ID' +
//        ' AND AG.AGR_UNT_ID=AGRD.AGRD_AGR_UNT_ID' +
//    ' LEFT JOIN AGREEMENT_JADWAL AGRJ ON AG.AGR_ID=AGRJ.AGRJDWL_AGR_ID' +
//        ' AND AG.AGR_UNT_ID=AGRJ.AGRJDWL_AGR_UNT_ID' +
//    ' LEFT JOIN INVOICE_PAYMENT INPAY ON AGRJ.AGRJDWL_ID=INPAY.INVPAY_AGRJDWL_ID' +
//        ' AND AGRJ.AGRJDWL_UNT_ID=INPAY.INVPAY_AGRJDWL_UNT_ID' +
//    ' WHERE AG.AGR_UNT_ID = ' + IntToStr(MasterNewUnit.ID) +
//    ' AND (UPPER(CUST.CUST_CODE) BETWEEN UPPER(' + QuotedStr(edtmemberNo1.Text) + ')' +
//    ' AND UPPER(' + QuotedStr(edtmemberNo2.Text) + ')) ' +
//    ' GROUP BY CUST_CODE, CUST_NAME, AGR_NO, AGR_DESCRIPTION,' +
//        ' AGR_DATE_START, AGR_DATE_END ' +
//    ' ORDER BY CUST.CUST_CODE, CUST_NAME, AGR_NO, AGR_DESCRIPTION,' +
//        ' AGR_DATE_START, AGR_DATE_END';
//
//  frVariables.Variable['loginname']    := FLoginFullname;
//  frVariables.Variable['unitname']     := MasterNewUnit.Nama;
//  frVariables.Variable['memberNo1']    := edtmemberNo1.Text;
//  frVariables.Variable['memberNo2']    := edtmemberNo2.Text;
//  frVariables.Variable['LoginRole']    := FLoginRole;
//
//  dmReportNew.EksekusiReport('frListAgreementDetil',sSQL);
end;

procedure TfrmListAgreementDetil.actRefreshExecute(Sender: TObject);
begin
  inherited;
    FetchAgreementDetilList;
end;

{ TfrmListAgreementDetil }

procedure TfrmListAgreementDetil.FetchAgreementDetilList;
var
  I: Integer;
begin
//  with cOpenQuery(GetSQLAgreementDetil(MasterNewUnit.ID, edtmemberNo1.Text, edtmemberNo2.Text), False) do
//  begin
//    try
//      Last;
//      with strgAgreementDetil do
//      begin
//        if RecordCount>0 then
//        begin
//          I:= 1;
//          RowCount:= RecordCount + I;
//
//          First;
//          while not Eof do
//          begin
//            Cells[_Kol_NO,I]          := IntToStr(I)+'.';
//            Cells[_Kol_CUST_CODE,I]   := FieldByName('CUST_CODE').AsString;
//            Cells[_Kol_CUST_NAME,I]   := FieldByName('CUST_NAME').AsString;
//            Cells[_Kol_AGREEMENT_NO,I]:= FieldByName('AGR_NO').AsString;
//            Cells[_Kol_PERIODE,I]     := FieldByName('AGR_DESCRIPTION').AsString;
//            Cells[_Kol_DESCRIPTION,I] := FieldByName('AGR_DATE_START').AsString
//                                  + ' - '+ FieldByName('AGR_DATE_END').AsString;
//            Cells[_Kol_TOTAL_AGREEMENT,I]:= FieldByName('AGRD_TOTAL').AsString;
//            Cells[_Kol_TOTAL_ACCRUAL,I]:= FieldByName('AGRJDWL_INV_TOTAL').AsString;
//            Cells[_Kol_TOTAL_INVOICE,I]:= FieldByName('AGRJDWL_ACCRU_TOTAL').AsString;
//            Cells[_Kol_TOTAL_PAYMENT,I]:= FieldByName('INVPAY_TOTAL_PAYMENT').AsString;
//
//            Inc(I);
//            Next;
//          end;
//          AutoSize:= True;
//        end;
//      end;
//
//    finally
//      Free;
//    end;
//  end;
end;


procedure TfrmListAgreementDetil.ParseHeaderGrid;
begin
//  with strgAgreementDetil do
//  begin
//    Clear;
//    RowCount:= 2;
//    ColCount:= 10;
//    Cells[_Kol_NO,0]:= 'NO';
//    Cells[_Kol_CUST_CODE,0]:= 'CUST CODE';
//    Cells[_Kol_CUST_NAME,0]:= 'CUST NAME';
//    Cells[_Kol_AGREEMENT_NO,0]:= 'AGREEMENT NO';
//    Cells[_Kol_PERIODE,0]:= 'PERIODE';
//    Cells[_Kol_DESCRIPTION,0]:= 'DESCRIPTION';
//    Cells[_Kol_TOTAL_AGREEMENT,0]:= 'TOTAL AGREEMENT';
//    Cells[_Kol_TOTAL_ACCRUAL,0]:= 'TOTAL ACCRUAL';
//    Cells[_Kol_TOTAL_INVOICE,0]:= 'TOTAL INVOICE';
//    Cells[_Kol_TOTAL_PAYMENT,0]:= 'TOTAL PAYMENT';
//    RowHeights[0]:= 35;
//    FixedRows:= 1;
//  end;


end;

procedure TfrmListAgreementDetil.btnShowListClick(Sender: TObject);
begin
  inherited;
//  if Mastercompany.ID = 0 then
//  begin
//    CommonDlg.ShowErrorEmpty('Company Name');
//    Exit;
//  end;
//
//  if MasterNewUnit.ID = 0 then
//  begin
//    CommonDlg.ShowErrorEmpty('Unit Store');
//    Exit;
//  end;
  FetchAgreementDetilList;
end;

procedure TfrmListAgreementDetil.FormShow(Sender: TObject);
begin
  inherited;
    edtmemberNo1.Clear;
    edtMemberNo2.Clear;
    ParseHeaderGrid;
end;

procedure TfrmListAgreementDetil.FormDestroy(Sender: TObject);
begin
  inherited;
  frmListAgreementDetil:= nil;
end;

procedure TfrmListAgreementDetil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:= caFree;
end;

procedure TfrmListAgreementDetil.FormActivate(Sender: TObject);
begin
  inherited;
    lblHeader.Caption:= 'LISTING AGREEMENT DETIL';
end;

procedure TfrmListAgreementDetil.edtmemberNo1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    Key:= UpCase(Key);
end;

procedure TfrmListAgreementDetil.edtMemberNo2KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    Key:= UpCase(Key);
end;

procedure TfrmListAgreementDetil.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = Ord('P')) and (ssctrl in Shift) then
    actPrintExecute(Sender);
end;

procedure TfrmListAgreementDetil.edtmemberNo1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F5 then
  begin
//    with cLookUp('Daftar Customer',
//         TNewCustomer.GetListCustomerByUnitIdSQL(MasterNewUnit.ID)) do
//    begin
//      try
//        if Strings[0] = '' then Exit;
//        edtmemberNo1.Text := Strings[0];
//      finally
//        Free;
//      end;
//    end;
  end;
end;

procedure TfrmListAgreementDetil.edtMemberNo2KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F5 then
  begin
//    with cLookUp('Daftar Customer',
//         TNewCustomer.GetListCustomerByUnitIdSQL(MasterNewUnit.ID)) do
//    begin
//      try
//        if Strings[0] = '' then Exit;
//        edtMemberNo2.Text := Strings[0];
//      finally
//        Free;
//      end;
//    end;
  end;

end;

end.
