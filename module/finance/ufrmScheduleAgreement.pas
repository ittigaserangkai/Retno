unit ufrmScheduleAgreement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,  Mask, ActnList, uRetnoUnit,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  System.Actions, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxButtonEdit, ufrmMasterBrowse, dxBarBuiltInMenu, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, Vcl.Menus,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, ufraFooter4Button,
  cxButtons, cxLabel, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxPC;

type
  TfrmScheduleAgreement = class(TfrmMasterBrowse)
    pnlTop: TPanel;
    lbl7: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    cbbStatus: TComboBox;
    btnShowList: TcxButton;
    cbbReport: TComboBox;
    lbl9: TLabel;
    chkAll: TCheckBox;
    edbProductCode: TcxButtonEdit;
    edtProductName: TEdit;
    cxcolAgreementNo: TcxGridDBColumn;
    cxcolDateStart: TcxGridDBColumn;
    cxcolDateEnd: TcxGridDBColumn;
    cxcolCustomerCode: TcxGridDBColumn;
    cxcolCustomerName: TcxGridDBColumn;
    cxcolDescription: TcxGridDBColumn;
    cxcolPosted: TcxGridDBColumn;
    procedure actAddExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actRefreshExecute(Sender: TObject);
    procedure btnShowListClick(Sender: TObject);
    procedure chkAllClick(Sender: TObject);
    procedure edbProductCodeClickBtn(Sender: TObject);
    procedure edbProductCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure printScheduleAgree;
    procedure ParseHeaderGrid;
    procedure ParseDataGrid;
    procedure GetStatus;
    function GetSQLDataInvoice: string;
    function GetDataInvoiceSQL: string;
  public
    { Public declarations }
  end;

var
  frmScheduleAgreement: TfrmScheduleAgreement;

implementation
{$R *.dfm}

uses
  udmReport, uTSCommonDlg, uConstanta, uAppUtils;

const
    _Kol_Date : Byte = 0;
    _Kol_Agreement_No : Byte = 1;
    _Kol_Cust_Code : Byte = 2;
    _Kol_Cust_Name : Byte = 3;
    _Kol_Status : Byte = 4;
    _Kol_Sub_Total : Byte = 5;



procedure TfrmScheduleAgreement.actAddExecute(Sender: TObject);
begin
  inherited;
//  if MasterNewUnit.ID = 0 then
  begin
    CommonDlg.ShowError(ER_UNIT_OR_COMPANY_NOT_SPECIFIC);
    Exit;
  end;

  if cbbReport.ItemIndex = -1 then
  begin
    CommonDlg.ShowError('Report type'+ER_EMPTY);
    cbbReport.SetFocus;
  end
  else
    printScheduleAgree;
end;

function TfrmScheduleAgreement.GetSQLDataInvoice: string;
var
  aJenisSewa, aStatus: String;
//  TypeOfSchedule: TScheduleType;
begin

  aJenisSewa := '';
  if not chkAll.Checked then
    aJenisSewa := ' AND PROJAS.PROJAS_CODE =' + QuotedStr(edbProductCode.Text);

  if cbbstatus.itemindex = 0 then
    aStatus:= '%'
  else
    aStatus:=cbbStatus.Text;

//  case cbbReport.ItemIndex of
//    1:  Begin
//           TypeOfSchedule := stACCRU;
//        End
//    else
//        Begin
//           TypeOfSchedule := stINVOICE;
//        End;
//  end;
//
//  Result:= GeSQLtDataReportSchedulAgreement(MasterNewUnit.ID, aJenisSewa, aStatus,
//           dtawalfilter.Date, dtakhirfilter.Date, TypeOfSchedule);
end;

procedure TfrmScheduleAgreement.printScheduleAgree;
var
  sSQL: string;
  ACol,
  ARow: Integer;
begin
  inherited;
  sSQL := GetDataInvoiceSQL;

//  ACol:= strgGridJournalList.Col;
//  ARow:= strgGridJournalList.Row;
//  if (ARow>0) then
//  begin
//    if Length(strgGridJournalList.Cells[ACol, ARow])=0 then
//      Exit
//    else
//    begin
//      frVariables.Variable['FJenisSewa']  := edbProductCode.text;
//      frVariables.Variable['FStatus']     := cbbStatus.Text;
//      frVariables.Variable['FReportType'] := cbbReport.Text;
//      frVariables.Variable['FDtStart']    := dtjournaldatestart.Date;
//      frVariables.Variable['FDtEnd']      := dtJournalDateEnd.Date;
//
//      frVariables.Variable['loginname']    := FLoginFullname;
//      frVariables.Variable['unitname']     := MasterNewUnit.Nama;
//
//    if cbbReport.itemindex = 1 then
//      dmReportNew.EksekusiReport('frListingAgreementAccrual',sSQL,'', True)
//    else
//      dmReportNew.EksekusiReport('frListingAgreementInvoice',sSQL,'', True);
//    end;
//  end;


end;

procedure TfrmScheduleAgreement.FormShow(Sender: TObject);
begin
  inherited;
    dtAwalFilter.Date := Now - 5;
    dtAkhirFilter.Date := Now;
    GetStatus;
    frmScheduleAgreement.Caption := 'Listing Schedule';
    lblheader.caption := 'LISTING SCHEDULE';
    ParseHeaderGrid;
    cbbStatus.itemindex    := 0;
    cbbReport.ItemIndex    := 0;
    edbProductCode.Text    := '';
end;

procedure TfrmScheduleAgreement.FormDestroy(Sender: TObject);
begin
  inherited;
    frmScheduleAgreement:= nil;
end;

procedure TfrmScheduleAgreement.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
     action:= cafree;
end;

procedure TfrmScheduleAgreement.actRefreshExecute(Sender: TObject);
begin
  inherited;
    GetStatus;
    cbbStatus.ItemIndex:= 0;
end;

procedure TfrmScheduleAgreement.btnShowListClick(Sender: TObject);
begin
  inherited;
//  if MasterNewUnit.ID = 0 then
  begin
    CommonDlg.ShowError(ER_UNIT_OR_COMPANY_NOT_SPECIFIC);
    Exit;
  end;

  if cbbReport.ItemIndex = -1 then
  begin
    CommonDlg.ShowError('Report type'+ER_EMPTY);
    cbbReport.SetFocus;
  end
  else
    ParseDataGrid;
end;

procedure TfrmScheduleAgreement.ParseDataGrid;
var
  i     : Integer;
begin
//  strgGridJournalList.Clear;
//  ParseHeaderGrid;
//
//  with cOpenQuery(GetSQLDataInvoice) do
//  begin
//    try
//      Last;
//      if RecordCount > 0 then
//      begin
//        i:= 1;
//        strgGridJournalList.RowCount:= RecordCount + i;
//
//        First;
//        while not Eof do
//        begin
//          if cbbReport.ItemIndex = 1 then
//          begin
//            strgGridJournalList.Cells[_Kol_Date, i]:=         FieldByName('AGRJDWL_ACCRU_DATE').AsString;
//            strgGridJournalList.Cells[_Kol_Agreement_No, i]:= FieldByName('AGRJDWL_ACCRU_NO').AsString;
//          end
//          else
//          if cbbReport.ItemIndex = 0 then
//          begin
//            strgGridJournalList.Cells[_Kol_Date, i]:=         FieldByName('AGRJDWL_INV_DATE').AsString;
//            strgGridJournalList.Cells[_Kol_Agreement_No, i]:= FieldByName('AGRJDWL_INV_NO').AsString;
//          end;
//
//          strgGridJournalList.Cells[_Kol_Cust_Code, i]:=  FieldByName('CUST_CODE').AsString;
//          strgGridJournalList.Cells[_Kol_Cust_Name, i]:=  FieldByName('CUST_NAME').AsString;
//          strgGridJournalList.Cells[_Kol_Status, i]:=     FieldByName('AGRJDWL_ACCRU_STATUS').AsString;
//          strgGridJournalList.Cells[_Kol_Sub_Total, i]:=  FieldByName('AGRD_SUBTOTAL').AsString;
//
//          Next;
//          Inc(i);
//        end;
//      end;
//
//    finally
//      Free;
//    end;
//  end;
end;

procedure TfrmScheduleAgreement.ParseHeaderGrid;
begin
//  with strgGridJournalList do
//  begin
//    colcount:= 6;
//    rowcount:= 14;
//    cells[_Kol_Date,0]:= 'Date';
//    cells[_Kol_Agreement_No,0]:= 'Agreement No';
//    cells[_Kol_Cust_Code,0]:= 'Cust. Code';
//    cells[_Kol_Cust_Name,0]:= 'Cust. Name';
//    cells[_Kol_Status,0]:= 'Status';
//    cells[_Kol_Sub_Total,0]:= 'Sub Total';
//    fixedrows:=1;
//  end;
end;

procedure TfrmScheduleAgreement.GetStatus;
begin
//  with cOpenQuery(GetSQLStatusAgreement(MasterNewUnit.ID)) do
//  begin
//    try
//      Last;
//      cbbStatus.Clear;
//      cbbStatus.Items.Add('--All--');
//      if not IsEmpty then
//      begin
//
//        First;
//        while not Eof do
//        begin
//          cbbStatus.Items.Add(FieldByName('AGRJDWL_ACCRU_STATUS').AsString);
//          Next;
//        end;
//      end;
//
//    finally
//      Free;
//    end;
//  end;
end;

function TfrmScheduleAgreement.GetDataInvoiceSQL: string;
var
  aJenisSewa, aStatus: String;
begin
//  aUnit_Id:=MasterNewUnit.ID;

  aJenisSewa := '';
  if not chkAll.Checked then
    aJenisSewa := ' AND PROJAS.PROJAS_CODE = ' + QuotedStr(edbProductCode.Text);


  if cbbstatus.itemindex = 0 then
    aStatus:= '%'
  else
    aStatus:=cbbStatus.Text;

  Result :=
    'SELECT DISTINCT AGR.AGR_NO, AGRJ.*, CUST.CUST_CODE, CUST.CUST_NAME, AGRD.AGRD_SUBTOTAL' + #13#10
    + ' FROM AGREEMENT_JADWAL AGRJ' + #13#10
    + ' INNER JOIN AGREEMENT AGR ON AGR.AGR_ID = AGRJ.AGRJDWL_AGR_ID AND AGR.AGR_UNT_ID = AGRJ.AGRJDWL_AGR_UNT_ID' + #13#10
    + ' INNER JOIN AGREEMENT_DETIL AGRD ON AGRD.AGRD_AGR_ID = AGR.AGR_ID AND AGRD.AGRD_AGR_UNT_ID = AGR.AGR_UNT_ID' + #13#10
    + ' INNER JOIN CUSTOMER CUST ON AGR.AGR_CUST_CODE=CUST.CUST_CODE AND AGR.AGR_CUST_UNT_ID=CUST.CUST_UNT_ID' + #13#10
    + ' INNER JOIN  PRODUK_JASA PROJAS on AGRD.AGRD_PROJAS_CODE = PROJAS.PROJAS_CODE AND AGRD.AGRD_UNT_ID = PROJAS.PROJAS_UNT_ID' + #13#10
//    + ' WHERE AGRJ.AGRJDWL_UNT_ID= ' + IntToStr(MasterNewUnit.ID)
    + aJenisSewa
    + ' AND AGRJ.AGRJDWL_ACCRU_STATUS LIKE ' + QuotedStr(aStatus) + ' AND ' + #13#10;

  case cbbReport.ItemIndex of
    1:  Begin
           Result := Result +
               '(AGRJ.AGRJDWL_ACCRU_DATE BETWEEN ' + TAppUtils.QuotD(dtAwalFilter.Date) + ' AND ' + TAppUtils.QuotD(dtAkhirFilter.Date, True) + ') ORDER BY AGRJ.AGRJDWL_INV_DATE ASC';
        End
    else
        Begin
           Result := Result +
               '(AGRJ.AGRJDWL_INV_DATE BETWEEN ' + TAppUtils.QuotD(dtAwalFilter.Date) + ' AND ' + TAppUtils.QuotD(dtAkhirFilter.Date, True) + ') ORDER BY AGRJ.AGRJDWL_INV_DATE ASC';
        End;
  end;
end;

procedure TfrmScheduleAgreement.chkAllClick(Sender: TObject);
begin
  inherited;
  if chkAll.Checked then edbProductCode.Enabled := False
  else edbProductCode.Enabled := True;
end;

procedure TfrmScheduleAgreement.edbProductCodeClickBtn(Sender: TObject);
var
  s: string;
begin
  inherited;
//  s := GetSQLProductAgreement(MasterNewUnit.ID);
//  with clookup('Daftar Produk Sewa', s) do
//  begin
//    Try
//      if Strings[0] = '' then Exit;
//      edbProductCode.Text := Strings[0];
//      edtProductName.Text := Strings[1];
//      cbbStatus.SetFocus;
//    Finally
//      Free;
//    End;
//  end;
end;

procedure TfrmScheduleAgreement.edbProductCodeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F5 then
    edbProductCodeClickBtn(Self);
    
end;

end.
