unit ufrmElectricInvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, ComCtrls, StdCtrls, ExtCtrls, ActnList, DB,
  System.Actions, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxContainer, dxCore,
  cxDateUtils, Vcl.Menus, ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox;

type
  dataInvoice = record
    ELINV_ELECTR_ID : Integer;
    ELINV_ELECTR_UNT_ID : Integer;
    ELINV_FACTOR : Double;
    ELINV_COST_SAT_ABODEMEN : Currency;
    ELINV_COST_SAT_USE : Currency;
    ELINV_ELECTRIC_USE : Double;
    ELINV_COST_ABODEMEN : Currency;
    ELINV_COST_USE : Currency;
    ELINV_TTBL : Currency;
    ELINV_PJU : Currency;
    ELINV_ELCUST_ID : Integer;
    ELINV_ELCUST_UNT_ID : Integer;
  end;

  TfrmElectricInvoice = class(TfrmMasterBrowse)
    pnl1: TPanel;
    lblComboGrid: TLabel;
    btnShow: TcxButton;
    dtpPeriode: TDateTimePicker;
    cbPilih: TComboBox;
    lblPilih: TLabel;
    cxcolNo: TcxGridDBColumn;
    cxcolInvoice: TcxGridDBColumn;
    cxcolCustomerCode: TcxGridDBColumn;
    cxcolCustomerName: TcxGridDBColumn;
    cxcolGroup: TcxGridDBColumn;
    cxcolPower: TcxGridDBColumn;
    cxcolAbodemen: TcxGridDBColumn;
    cxcolUsageRate: TcxGridDBColumn;
    cxcolAbodemenCost: TcxGridDBColumn;
    cxcolUsageCost: TcxGridDBColumn;
    cxcolTTLBCost: TcxGridDBColumn;
    cxcolPJUCost: TcxGridDBColumn;
    cxcolTotalCost: TcxGridDBColumn;
    actPaymentElectricInvoice: TAction;
    cb1: TcxExtLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure dtpPeriodeChange(Sender: TObject);
    procedure actPaymentElectricInvoiceExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
  private
    { Private declarations }
    fELINV_COST_ABODEMEN: Double;
    fELINV_COST_SAT_ABODEMEN: Double;
    fELINV_COST_SAT_USE: Double;
    fELINV_COST_USE: Double;
    fELINV_DUE_DATE: TDateTime;
    fELINV_ELCUST_ID: Integer; fELINV_ELCUST_UNT_ID: Integer;
    fELINV_ELECTRIC_USE: Double;
    fELINV_ELECTR_ID: Integer; fELINV_ELECTR_UNT_ID: Integer;
    fELINV_FACTOR: Double;
    fELINV_GROUP: string;
    fELINV_IS_PAYMENT: Integer;
    fELINV_IS_PRINT: Integer;
    fELINV_NUMBER: string;
    fELINV_PERIOD: TDateTime;
    fELINV_PJU: Double;
    fELINV_POWER: Double;
    fELINV_TTBL: Double;
    FIsPeriodeFiskalAktif: Boolean;
//    fID: Integer;
    fNewUnit_ID: Integer;
    FPeriodeNo: Integer;
    FThFiskal: Integer;
    procedure ElectricalUseToGrid(dataListAddElectricInvoice: TDataset);
    function GetListAddElectricInvoice(aPeriode: TDateTime): string;
    function GetListElectricInvoiceByPeriode(aPeriode: TDateTime; aStatus :
        Integer; aUnit_ID : Integer): string;
    function GetListPrintElectricInvoiceByPeriode: string;
    function GetMaxInvoiceNumber(aPeriode: TDateTime; aUnit_ID : Integer): string;
    procedure ParseDataTahunAndPeriodeFiskal(aDate : TDateTime);
    function SaveDataJurnal(aNobukti : String; aUnitID : Integer; aDeskripsi :
        String; aRefNo : String; aKodeJurnal : String): Boolean;
    procedure SetIsPeriodeFiskalAktif(const Value: Boolean);
  public
    property IsPeriodeFiskalAktif: Boolean read FIsPeriodeFiskalAktif write
        SetIsPeriodeFiskalAktif;
    { Public declarations }
  end;

var
  frmElectricInvoice: TfrmElectricInvoice;

  list_add_invoice : array of dataInvoice;
  InvoicePeriode: TDate;

implementation
{$R *.dfm}

uses
  uConstanta, uTSCommonDlg, udmReport, uAppUtils;

var
    max_no_invoice: Integer;

const
     _KolNo: Integer = 0;
     _KolNoInvoice: Integer = 1;
     _KolCustomerCode: Integer = 2;
     _KolCustomerName: Integer = 3;
     _KolGroup: Integer = 4;
     _KolPower: Integer = 5;
     _KolAbodemen: Integer = 6;
     _KolUsageRate: Integer = 7;
     _KolCostAbodemen: Integer = 8;
     _KolCostUsage: Integer = 9;
     _KolCostTTLB: Integer = 10;
     _KolCostPJU: Integer = 11;
     _KolCostTotal: Integer = 12;
     _KolELINV_ID: Integer = 13;

procedure TfrmElectricInvoice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  Action:= caFree;
end;

procedure TfrmElectricInvoice.FormDestroy(Sender: TObject);
begin
  inherited;

  frmElectricInvoice:= nil;
end;

procedure TfrmElectricInvoice.FormCreate(Sender: TObject);
var i: Integer;
begin
  inherited;
  lblHeader.Caption := 'Electric Invoice';

//  if not Assigned(FNewElectric_Invoice) then
//      FNewElectric_Invoice:= TNewElectric_Invoice.CreateWithUser(Self, FLoginId, FLoginUnitId);
//
//  for i:= 0 to strgElectricInvoice.ColCount-1 do begin
//    strgElectricInvoice.Alignments[i,0]:= taCenter;
//  end;
//
//  dtpPeriode.Date:= Now;
//  with fraFooter4Button1 do
//  begin                   //maaf, penampung temporary
//    btnAdd.AutoSize    := btnAdd.Enabled;
//    btnUpdate.AutoSize := btnUpdate.Enabled;
//    btnDelete.AutoSize := btnDelete.Enabled;
//  end;
//  fraFooter4Button1.btnUpdate.Enabled:= False;
end;

function TfrmElectricInvoice.GetListAddElectricInvoice(aPeriode: TDateTime):
    string;
var
   SQL_GET_LIST_ADD_ELECTRIC_INVOICE_BY_PERIODE : string;
begin
  // TODO -cMM: TfrmElectricInvoice.GetListAddElectricInvoice default body inserted
  SQL_GET_LIST_ADD_ELECTRIC_INVOICE_BY_PERIODE :=
    'SELECT C.CUST_CODE, C.CUST_NAME, C.CUST_ADDRESS, C.CUST_CITY, C.CUST_POST_CODE, ' +
      'EC.ELCUST_ID, EC.ELCUST_UNT_ID, EC.ELCUST_KAVLING_CODE, EU.ELEC_BEGIN_STAND, ' +
      'EU.ELEC_END_STAND, ER.ELECTR_ID, ER.ELECTR_UNT_ID, ER.ELECTR_GROUP, ' +
      'ER.ELECTR_POWER, ER.ELECTR_FACTOR, ER.ELECTR_COST_ABODEMEN, ER.ELECTR_COST_USE, ' +
      'EU.ELEC_RATE_PER_KWH,EU.ELEC_COST  '+
    'FROM ELECTRIC_USE EU ' +
      'LEFT JOIN ELECTRIC_CUSTOMER EC ON EU.ELEC_ELCUST_ID = EC.ELCUST_ID ' +
      'LEFT JOIN CUSTOMER C ON EC.ELCUST_CUST_ID = C.CUST_ID ' +
      'LEFT JOIN ELECTRIC_RATE ER ON EC.ELCUST_ELECTR_ID = ER.ELECTR_ID ' +
    'WHERE EU.ELEC_PERIOD = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', aPeriode)) + //:ELEC_PERIOD ' +
      ' AND EU.ELEC_ELCUST_ID NOT IN (' +
      ' SELECT ELINV_ELCUST_ID ' +
      ' FROM ELECTRIC_INVOICE ' +
      ' WHERE ELINV_PERIOD = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', aPeriode)) + ')' +//:ELINV_PERIOD) ' +
    ' ORDER BY C.CUST_CODE ASC';

//  Result := IBConn.GetAllDataAsArray(SQL_GET_LIST_ADD_ELECTRIC_INVOICE_BY_PERIODE, AParam);
  Result := SQL_GET_LIST_ADD_ELECTRIC_INVOICE_BY_PERIODE;
end;

function TfrmElectricInvoice.GetListPrintElectricInvoiceByPeriode: string;
var
   SQL_GET_LIST_PRINT_ELECTRIC_INVOICE_BY_PERIODE : string;
begin
  // TODO -cMM: TfrmElectricInvoice.GetListPrintElectricInvoiceByPeriode default body inserted
  SQL_GET_LIST_PRINT_ELECTRIC_INVOICE_BY_PERIODE :=
    'SELECT EI.ELINV_NUMBER, EI.ELINV_PERIOD, EI.ELINV_ELECTR_ID, EI.ELINV_GROUP, EI.ELINV_POWER, EI.ELINV_FACTOR, ' +
      'EI.ELINV_COST_SAT_ABODEMEN, EI.ELINV_COST_SAT_USE, EI.ELINV_ELECTRIC_USE, ' +
      'EI.ELINV_COST_ABODEMEN, EI.ELINV_COST_USE, EI.ELINV_TTBL, EI.ELINV_PJU, EI.ELINV_ELCUST_ID, ' +
      'C.CUST_CODE, C.CUST_NAME, C.CUST_ADDRESS, C.CUST_CITY, C.CUST_POST_CODE, ' +
      '(SELECT EU.ELEC_BEGIN_STAND FROM ELECTRIC_USE EU ' +
        'WHERE EU.ELEC_ELCUST_ID = EC.ELCUST_ID ' +
        'AND EU.ELEC_PERIOD = EI.ELINV_PERIOD) AS BEGIN_STAND, ' +
      '(SELECT EU.ELEC_END_STAND FROM ELECTRIC_USE EU ' +
        'WHERE EU.ELEC_ELCUST_ID = EC.ELCUST_ID ' +
        'AND EU.ELEC_PERIOD = EI.ELINV_PERIOD) AS END_STAND, ' +
      '(EI.ELINV_COST_ABODEMEN + EI.ELINV_COST_USE + EI.ELINV_TTBL + EI.ELINV_PJU) AS TOTAL_COST, ' +
      ''' '' AS TERBILANG ' +
    'FROM ELECTRIC_INVOICE EI ' +
      'LEFT JOIN ELECTRIC_RATE ER ON EI.ELINV_ELECTR_ID = ER.ELECTR_ID ' +
      'LEFT JOIN ELECTRIC_CUSTOMER EC ON EI.ELINV_ELCUST_ID = EC.ELCUST_ID ' +
      'LEFT JOIN CUSTOMER C ON EC.ELCUST_CUST_ID = C.CUST_ID ' +
    'WHERE EI.ELINV_PERIOD = :ELINV_PERIOD AND EI.ELINV_IS_PAYMENT = FALSE ' +
    'ORDER BY EI.ELINV_NUMBER ASC, C.CUST_CODE ASC, C.CUST_NAME ASC';
  Result := SQL_GET_LIST_PRINT_ELECTRIC_INVOICE_BY_PERIODE;
end;

function TfrmElectricInvoice.GetListElectricInvoiceByPeriode(aPeriode:
    TDateTime; aStatus : Integer; aUnit_ID : Integer): string;
var
  SQL_GET_LIST_ELECTRIC_INVOICE_BY_PERIODE : string;
begin
  // TODO -cMM: TfrmElectricInvoice.GetListElectricInvoiceByPeriode default body inserted
  SQL_GET_LIST_ELECTRIC_INVOICE_BY_PERIODE :=
    'SELECT EI.ELINV_NUMBER, EI.ELINV_ID, EI.ELINV_UNT_ID, EI.ELINV_PERIOD, EI.ELINV_DUE_DATE, EI.ELINV_ELECTR_ID, ' +
      'EI.ELINV_ELECTR_UNT_ID, EI.ELINV_GROUP, EI.ELINV_POWER, EI.ELINV_FACTOR, ' +
      'EI.ELINV_COST_SAT_ABODEMEN, EI.ELINV_COST_SAT_USE, EI.ELINV_ELECTRIC_USE, ' +
      'EI.ELINV_COST_ABODEMEN, EI.ELINV_COST_USE, EI.ELINV_TTBL, EI.ELINV_PJU, EI.ELINV_IS_PRINT, ' +
      'EI.ELINV_IS_PAYMENT, EI.ELINV_ELCUST_ID, EI.ELINV_ELCUST_UNT_ID, ER.ELECTR_ID, ' +
      'EI.ELINV_COST_SAT_ABODEMEN, EI.ELINV_COST_SAT_USE, ' +
      'ER.ELECTR_UNT_ID, C.CUST_CODE, C.CUST_NAME ' +
    'FROM ELECTRIC_INVOICE EI ' +
      'LEFT JOIN ELECTRIC_RATE ER ON EI.ELINV_ELECTR_ID = ER.ELECTR_ID ' +
      'LEFT JOIN ELECTRIC_CUSTOMER EC ON EI.ELINV_ELCUST_ID = EC.ELCUST_ID ' +
      'LEFT JOIN CUSTOMER C ON EC.ELCUST_CUST_ID = C.CUST_ID ' +
    'WHERE EI.ELINV_PERIOD = ' + TAppUtils.QuotD(aPeriode) + //:ELINV_PERIOD
    ' AND EI.ELINV_IS_PAYMENT = ' + IntToStr(aStatus) + //:STATUS ' +
    ' AND EI.ELINV_UNT_ID = ' + IntToStr(aUnit_ID) +
    ' ORDER BY C.CUST_CODE ASC';
//  Result := IBConn.GetAllDataAsArray(SQL_GET_LIST_ELECTRIC_INVOICE_BY_PERIODE, AParam);
  Result := SQL_GET_LIST_ELECTRIC_INVOICE_BY_PERIODE;
end;

function TfrmElectricInvoice.GetMaxInvoiceNumber(aPeriode: TDateTime; aUnit_ID
    : Integer): string;
var
   SQL_GET_MAX_INVOICE_NUMBER : string;
begin
  // TODO -cMM: TfrmElectricInvoice.GetMaxInvoiceNumber default body inserted
  SQL_GET_MAX_INVOICE_NUMBER :=
    'SELECT ELINV_NUMBER ' +
    'FROM ELECTRIC_INVOICE ' +
    'WHERE ELINV_PERIOD = ' + TAppUtils.QuotD(aPeriode) + //:ELINV_PERIOD ' +
    ' AND ELINV_UNT_ID = ' + IntToStr(aUnit_ID) +
    ' ORDER BY ELINV_NUMBER DESC ' +
    ' ROWS 1 TO 1';

  Result := SQL_GET_MAX_INVOICE_NUMBER;
end;

procedure TfrmElectricInvoice.btnShowClick(Sender: TObject);
var
  Year, Month, Day: Word;
  i, iStatus: Integer;
begin
  inherited;

  DecodeDate(dtpPeriode.Date, Year, Month, Day);

  if cbPilih.ItemIndex = 1 then
    iStatus := 1
  else
    iStatus := 0;

//  strgElectricInvoice.ClearNormalCells;
//  strgElectricInvoice.RowCount:= 2;
//  with cOpenQuery(GetListElectricInvoiceByPeriode(
//                        EncodeDate(Year, Month, 1), iStatus, MasterNewUnit.ID), False)do
//  begin
//    try
//      if not IsEmpty then
//      begin
//        with strgElectricInvoice do
//        begin
//          Last;
//          RowCount:= RecordCount + 1;
//          First;
//
//          for i:= 1 to RowCount-1 do
//          begin
//            if cbPilih.ItemIndex = 0 then
//               AddCheckBox(_KolNo,i,True,True);
//
//            Cells[_KolNo,i]             := IntToStr(i);
//            Alignments[_KolNo,i]        := taCenter;
//            Cells[_KolNoInvoice,i]      := FieldByName('ELINV_NUMBER').AsString;
//            Cells[_KolCustomerCode,i]   := FieldByName('cust_code').AsString;
//            Cells[_KolCustomerName,i]   := FieldByName('cust_name').AsString;
//            Cells[_KolGroup,i]          := FieldByName('ELINV_GROUP').AsString;
//
//            Cells[_KolPower,i]          := FieldByName('ELINV_POWER').AsString;
//            Alignments[_KolPower,i]     := taRightJustify;
//
//            Cells[_KolAbodemen,i]       := FormatCurr('#,##0.00', FieldByName('ELINV_COST_SAT_ABODEMEN').AsFloat);
//            Alignments[_KolAbodemen,i]  := taRightJustify;
//            Cells[_KolUsageRate,i]      := FormatCurr('#,##0.00',FieldByName('ELINV_COST_SAT_USE').AsFloat);
//            Alignments[_KolUsageRate,i] := taRightJustify;
//            Cells[_KolCostAbodemen,i]   := FormatCurr('#,##0.00',FieldByName('ELINV_COST_ABODEMEN').AsFloat);
//            Alignments[_KolCostAbodemen,i]:= taRightJustify;
//            Cells[_KolCostUsage,i]      := FormatCurr('#,##0.00',FieldByName('ELINV_COST_USE').AsFloat);
//            Alignments[_KolCostUsage,i] := taRightJustify;
//            Cells[_KolCostTTLB,i]       := FormatCurr('#,##0.00',FieldByName('ELINV_TTBL').AsFloat);
//            Alignments[_KolCostTTLB,i]  := taRightJustify;
//            Cells[_KolCostPJU,i]        := FormatCurr('#,##0.00',FieldByName('ELINV_PJU').AsFloat);
//            Alignments[_KolCostPJU,i]   := taRightJustify;
//            Cells[_KolCostTotal,i]      := FormatCurr('#,##0.00',
//                    FieldByName('ELINV_COST_ABODEMEN').AsFloat +
//                    FieldByName('ELINV_COST_USE').AsFloat +
//                    FieldByName('ELINV_TTBL').AsFloat +
//                    FieldByName('ELINV_PJU').AsFloat);
//            Alignments[_KolCostTotal,i] := taRightJustify;
//            Cells[_KolELINV_ID,i]       := FieldByName('ELINV_ID').AsString;
//
//            Next;
//          end;
//        end;
//
//        if fraFooter4Button1.btnUpdate.AutoSize then
//          fraFooter4Button1.btnUpdate.Enabled:= True;
//      end
//      else
//        fraFooter4Button1.btnUpdate.Enabled:= False;
//
//    finally
//      Free;
//    end;
//  end;
end;


procedure TfrmElectricInvoice.actAddExecute(Sender: TObject);
var
  bSuccess: Boolean;
  _isChecked: Boolean;
  i : Integer;
  Year, Month, Day: Word;
begin
  inherited;

//  if Mastercompany.ID = 0 then
//  begin
//    CommonDlg.ShowError(ER_COMPANY_NOT_SPECIFIC);
//    //frmMain.cbbCompCode.SetFocus;
//    Exit;
//  end
//  else if MasterNewUnit.ID = 0 then
//  begin
//    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
//    //frmMain.cbbUnit.SetFocus;
//    Exit;
//  end;
//
//  if not IsPeriodeFiskalAktif then
//  begin
//    CommonDlg.ShowError('Fiskal Periode is not aktif');
//    Exit;
//  end;
//
//  if fraFooter4Button1.btnAdd.Tag = 0 then
//  begin
//    if not Assigned(FNewElectric_Invoice) then
//    begin
//      //ElectricInvoice:= TElectricInvoice.Create;
//      FNewElectric_Invoice:= TNewElectric_Invoice.CreateWithUser(Self, FLoginId, FLoginUnitId);
//    end;
//    DecodeDate(dtpPeriode.Date, Year, Month, Day);
//
//    with cOpenQuery(GetMaxInvoiceNumber(EncodeDate(Year, Month, 1), MasterNewUnit.ID), False) do
//    begin
//      try
//        if not IsEmpty then
//          max_no_invoice:= StrToInt(Trim(Copy(FieldByName('elinv_number').AsString, 0, 3)))
//        else
//          max_no_invoice:= 0;
//
//      finally
//        Free;
//      end;
//    end;
//
//    InvoicePeriode:= EncodeDate(Year, Month, 1);
//
//    aIQ:= cOpenQuery(GetListAddElectricInvoice(InvoicePeriode), False);
//    try
//      if not aIQ.IsEmpty then
//      begin
//        fraFooter4Button1.btnAdd.Tag := 1;
//        fraFooter4Button1.btnAdd.Caption:= '&Save';
//        fraFooter4Button1.btnClose.Tag := 1;
//        fraFooter4Button1.btnClose.Caption:= 'Abort';
//        fraFooter4Button1.btnUpdate.Enabled:= False;
//        fraFooter4Button1.btnDelete.Enabled:= False;
//        btnShow.Enabled:= False;
//
//        ElectricalUseToGrid(aIQ);
//      end
//      else
//      begin
//        CommonDlg.ShowMessage('There''s nothing to add.');
//      end;
//
//    finally
//      Free;
//    end;
//
//
//  end
//  else
//  begin
//    if not IsValidDateForTransaction(dtpPeriode.Date) then Exit;
//
//    bSuccess := True;
//    with strgElectricInvoice do
//    begin
//      try
//        for i:= 1 to RowCount-1 do
//        begin
//          // insert ke tabel electric_invoice
//          GetCheckBoxState(_KolNo,i,_isChecked);
//          if _isChecked then
//          begin
//              FNewElectric_Invoice.ClearProperties;
//
//              if MasterNewUnit.ID < 1 then
//                fNewUnit_ID := 0
//              else
//                fNewUnit_ID := MasterNewUnit.ID;
//
//              DecodeDate(InvoicePeriode, Year, Month, Day);
//              max_no_invoice:= max_no_invoice + 1;
//
//              case max_no_invoice of
//                0..9:   fELINV_NUMBER := '00' + IntToStr(max_no_invoice) + '/LIST/' + IntToStr(Month) + '/' + IntToStr(Year);
//                10..99: fELINV_NUMBER := '0' + IntToStr(max_no_invoice) + '/LIST/' + IntToStr(Month) + '/' + IntToStr(Year);
//              else
//                        fELINV_NUMBER := IntToStr(max_no_invoice) + '/LIST/' + IntToStr(Month) + '/' + IntToStr(Year);
//              end;
//
//              fELINV_PERIOD := InvoicePeriode;
//              fELINV_ELECTR_ID := list_add_invoice[i-1].ELINV_ELECTR_ID;
//              fELINV_ELECTR_UNT_ID := list_add_invoice[i-1].ELINV_ELCUST_UNT_ID;
//              fELINV_GROUP := Cells[4,i];
//              fELINV_POWER := StrToFloat(Cells[5,i]);
//              fELINV_FACTOR := list_add_invoice[i-1].ELINV_FACTOR;
//              fELINV_COST_SAT_ABODEMEN := list_add_invoice[i-1].ELINV_COST_SAT_ABODEMEN;
//              fELINV_COST_SAT_USE := list_add_invoice[i-1].ELINV_COST_SAT_USE;
//              fELINV_ELECTRIC_USE := list_add_invoice[i-1].ELINV_ELECTRIC_USE;
//              fELINV_COST_ABODEMEN := list_add_invoice[i-1].ELINV_COST_ABODEMEN;
//              fELINV_COST_USE := list_add_invoice[i-1].ELINV_COST_USE;
//              fELINV_TTBL := list_add_invoice[i-1].ELINV_TTBL;
//              fELINV_PJU := list_add_invoice[i-1].ELINV_PJU;
//              fELINV_ELCUST_ID := list_add_invoice[i-1].ELINV_ELCUST_ID;
//              fELINV_ELCUST_UNT_ID := list_add_invoice[i-1].ELINV_ELCUST_UNT_ID;
//              //ElectricInvoice.AddElectricInvoice(arrParam);
//
//              FNewElectric_Invoice.UpdateData(fELINV_COST_ABODEMEN,
//                    fELINV_COST_SAT_ABODEMEN, fELINV_COST_SAT_USE,
//                    fELINV_COST_USE, fELINV_DUE_DATE, fELINV_ELCUST_ID, fELINV_ELCUST_UNT_ID, fELINV_ELECTRIC_USE,
//                    fELINV_ELECTR_ID, fELINV_ELECTR_UNT_ID,
//                    fELINV_FACTOR, fELINV_GROUP, fELINV_IS_PAYMENT,
//                    fELINV_IS_PRINT, fELINV_NUMBER, fELINV_PERIOD, fELINV_PJU, fELINV_POWER,
//                    fELINV_TTBL, 0, fNewUnit_ID);
//
//              if not FNewElectric_Invoice.SaveToDB then
//                bSuccess := False
//              else
//              begin
//                if not SaveDataJurnal(fELINV_NUMBER, fNewUnit_ID, 'INVOICE ELECTRIC '
//                            + strgElectricInvoice.Cells[3, i] + ' PERIODE '
//                            + FormatDateTime('MMMM yyyy', dtpPeriode.DateTime), fELINV_NUMBER,
//                                      getGlobalVar('DEF_JURNAL_INV_ELECTRIC')) then
//                  bSuccess := False;
//              end;
//              if not bSuccess then
//              begin
//                cRollbackTrans;
//                CommonDlg.ShowError('Cannot store to database.');
//                Break;
//              end;
//          end;
//        end;
//        //ElectricInvoice.Commit;
//        cCommitTrans;
//      finally
//        //ElectricInvoice.Rollback;
//        FNewElectric_Invoice.ClearProperties;
//        cRollbackTrans;
//      end;
//    end;
    fraFooter4Button1.btnAdd.Tag := 0;
    fraFooter4Button1.btnAdd.Caption:= '&Add';
    fraFooter4Button1.btnClose.Tag := 0;
    fraFooter4Button1.btnClose.Caption:= 'Close';
    btnShow.Enabled:= True;

//    if fraFooter4Button1.btnUpdate.AutoSize then
//       fraFooter4Button1.btnUpdate.Enabled:= True;
//
//    if fraFooter4Button1.btnDelete.AutoSize then
//       fraFooter4Button1.btnDelete.Enabled:= True;

    SetLength(list_add_invoice,0);
    btnShowClick(Self);
//  end;
end;

procedure TfrmElectricInvoice.actCloseExecute(Sender: TObject);
begin
  inherited;
  if fraFooter4Button1.btnAdd.Tag = 1 then
  begin
    fraFooter4Button1.btnAdd.Tag        := 0;
    fraFooter4Button1.btnAdd.Caption    := '&Add';
    fraFooter4Button1.btnClose.Tag      := 0;
    fraFooter4Button1.btnClose.Caption  := 'Close';
    btnShow.Enabled                    := True;

    btnShowClick(Self);
  end
  else
//    fraFooter4Button1.btnCloseClick(Sender);
end;

procedure TfrmElectricInvoice.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if(Key = Ord('P'))and(ssctrl in Shift) then
    GetAndRunButton('btnUpdate');
end;

procedure TfrmElectricInvoice.ElectricalUseToGrid(dataListAddElectricInvoice:
    TDataset);
var
  dPJU: Double;
  i: Integer;
  used_stand: Double;
  bea_beban: Double;
  bea_pemakaian: Double;
  bea_ttlb: Double;
  bea_pju: Double;
  total_bea: Double;
begin
//  try
//    dPJU := StrToFloat(getGlobalVar('PJU_PERSEN'));
//  except
//    CommonDlg.ShowError('Global Variabel PJU_PERSEN belum diset sama sekali, Defaultnya 9%');
//    dPJU := 9;
//  end;
//
//  with strgElectricInvoice do
//  begin
//    ClearNormalCells;
//    dataListAddElectricInvoice.Last;
//    RowCount:= dataListAddElectricInvoice.RecordCount + 1;
//    dataListAddElectricInvoice.First;
//    SetLength(list_add_invoice, dataListAddElectricInvoice.RecordCount);
//
//    for i:= 1 to RowCount-1 do begin
//      Cells[_KolNo,i] := IntToStr(i);
//      AddCheckBox(_KolNo,i,True,True);
//      CellProperties[_KolNo ,i].BrushColor:= clInfoBk;
//      Alignments[_KolNo,i] := taCenter;
//      Cells[_KolCustomerCode,i] := dataListAddElectricInvoice.FieldByName('CUST_CODE').AsString;
//      Cells[_KolCustomerName,i] := dataListAddElectricInvoice.FieldByName('CUST_NAME').AsString;
//      Cells[_KolGroup,i] := dataListAddElectricInvoice.FieldByName('ELECTR_GROUP').AsString;
//      Cells[_KolPower,i] := dataListAddElectricInvoice.FieldByName('ELECTR_POWER').AsString;
//      Alignments[_KolPower,i] := taRightJustify;
//
//      list_add_invoice[i-1].ELINV_ELECTR_ID := dataListAddElectricInvoice.FieldByName('ELECTR_ID').AsInteger;
//      list_add_invoice[i-1].ELINV_ELECTR_UNT_ID := dataListAddElectricInvoice.FieldByName('ELECTR_UNT_ID').AsInteger;
//      list_add_invoice[i-1].ELINV_FACTOR := dataListAddElectricInvoice.FieldByName('ELECTR_FACTOR').AsFloat;
//
//      Cells[_KolAbodemen,i] := FormatCurr('#,##0.00',dataListAddElectricInvoice.FieldByName('ELECTR_COST_ABODEMEN').AsFloat);
//      Alignments[_KolAbodemen,i] := taRightJustify;
//      list_add_invoice[i-1].ELINV_COST_SAT_ABODEMEN := dataListAddElectricInvoice.FieldByName('ELECTR_COST_ABODEMEN').AsFloat;
//
////      Cells[_KolUsageRate,i] := FormatCurr('#,##0.00',dataListAddElectricInvoice.FieldByName('ELECTR_COST_USE').AsFloat);
//      Cells[_KolUsageRate,i] := FormatCurr('#,##0.00',dataListAddElectricInvoice.FieldByName('ELEC_RATE_PER_KWH').AsFloat);
//      Alignments[_KolUsageRate,i] := taRightJustify;
////      list_add_invoice[i-1].ELINV_COST_SAT_USE := dataListAddElectricInvoice.FieldByName('ELECTR_COST_USE').AsFloat;
//      list_add_invoice[i-1].ELINV_COST_SAT_USE := dataListAddElectricInvoice.FieldByName('ELEC_RATE_PER_KWH').AsFloat;
//
//      bea_beban:= dataListAddElectricInvoice.FieldByName('ELECTR_COST_ABODEMEN').AsFloat *
//        dataListAddElectricInvoice.FieldByName('ELECTR_POWER').AsFloat / 1000;
//      Cells[_KolCostAbodemen ,i] := FormatCurr('#,##0.00', bea_beban);
//      Alignments[_KolCostAbodemen ,i] := taRightJustify;
//
//      if dataListAddElectricInvoice.FieldByName('ELEC_BEGIN_STAND').AsFloat > dataListAddElectricInvoice.FieldByName('ELEC_END_STAND').AsFloat then
//        used_stand := 0
//      else
//        used_stand := dataListAddElectricInvoice.FieldByName('ELEC_END_STAND').AsFloat - dataListAddElectricInvoice.FieldByName('ELEC_BEGIN_STAND').AsFloat;
////      bea_pemakaian:= dataListAddElectricInvoice.FieldByName('ELECTR_FACTOR').AsFloat *
////        dataListAddElectricInvoice.FieldByName('ELECTR_COST_USE').AsFloat * used_stand;
//
//
//      bea_pemakaian:= dataListAddElectricInvoice.FieldByName('ELEC_COST').AsFloat;
//
//
//      Cells[_KolCostUsage,i] := FormatCurr('#,##0.00', bea_pemakaian);
//      Alignments[_KolCostUsage,i] := taRightJustify;
//
//      list_add_invoice[i-1].ELINV_ELECTRIC_USE := used_stand;
//      list_add_invoice[i-1].ELINV_COST_ABODEMEN := bea_beban;
//      list_add_invoice[i-1].ELINV_COST_USE := bea_pemakaian;
//
//      bea_ttlb:= (bea_beban + bea_pemakaian) * 0 / 100; // konstanta PJU 0 %
//      Cells[_KolCostTTLB,i] := FormatCurr('#,##0.00', bea_ttlb);
//      Alignments[_KolCostTTLB,i] := taRightJustify;
//      list_add_invoice[i-1].ELINV_TTBL := bea_ttlb;
//
////      bea_pju:= (bea_beban + bea_pemakaian) * 9 / 100; // konstanta PJU 9 %
//      bea_pju:= (bea_beban + bea_pemakaian) * dPJU / 100; // konstanta PJU 9 %
//      Cells[_KolCostPJU,i] := FormatCurr('#,##0.00', bea_pju);
//      Alignments[_KolCostPJU,i] := taRightJustify;
//      list_add_invoice[i-1].ELINV_PJU := bea_pju;
//
//      total_bea:= bea_beban + bea_pemakaian + bea_ttlb + bea_pju;
//      Cells[_KolCostTotal,i] := FormatCurr('#,##0.00', total_bea);
//      Alignments[_KolCostTotal,i] := taRightJustify;
//
//      list_add_invoice[i-1].ELINV_ELCUST_ID := dataListAddElectricInvoice.FieldByName('ELCUST_ID').AsInteger;
//      list_add_invoice[i-1].ELINV_ELCUST_UNT_ID := dataListAddElectricInvoice.FieldByName('ELCUST_UNT_ID').AsInteger;
//
//      dataListAddElectricInvoice.Next;
//    end;
//  end;
end;

procedure TfrmElectricInvoice.FormShow(Sender: TObject);
begin
  inherited;

  ParseDataTahunAndPeriodeFiskal(dtpPeriode.DateTime);
end;

procedure TfrmElectricInvoice.ParseDataTahunAndPeriodeFiskal(aDate : TDateTime);
var
  dtEndDate: TDateTime;
  dtStartDate: TDateTime;
begin
  // TODO -cMM: TfrmElectricInvoice.ParseDataTahunAndPeriodeFiskal default body inserted
//  IsPeriodeFiskalAktif := IsStatusPeriodeAkuntansiAktif(ADate, Mastercompany.ID, FThFiskal, FPeriodeNo, dtStartDate, dtEndDate);
end;

function TfrmElectricInvoice.SaveDataJurnal(aNobukti : String; aUnitID :
    Integer; aDeskripsi : String; aRefNo : String; aKodeJurnal : String):
    Boolean;
var
  dTotalCredit: Double;
  dTotalDebet: Double;
  dHasilCredit: Double;
  dHasilDebet: Double;
  dCredit: Double;
  dDebet: Double;
  i: Integer;
  sJurnalNo: string;
  aIDJurnal: Integer;
  FKodeJurnalID: Integer;
//  FElectricInvoice: TNewElectric_Invoice;
//  FKodeJurnal: TNewRefKode_Jurnal;
//  FJurnal: TJurnal;
  fdtEOD : TDateTime;
begin
  // TODO -cMM: TfrmElectricInvoice.SaveDataJurnal default body inserted
  Result := False;
//  FJurnal := TJurnal.Create(nil);
//  FKodeJurnal := TNewRefKode_Jurnal.Create(nil);
//  FElectricInvoice := TNewElectric_Invoice.Create(nil);
//
//  try
//    InisialisasiMemoryData(dmReportNew.jvMemData);
//
//    if not FKodeJurnal.LoadByKode(aKodeJurnal, Mastercompany.ID) then
//    begin
//      raise Exception.Create('Kode GL Untuk Parameter Jurnal ' + aKodeJurnal + ' belum di Set Sama sekali, mohon lakukan setting dahulu terhadap KODE GL nya');
//    end;
//    FKodeJurnalID := FKodeJurnal.ID;
//
//    aIDJurnal := 0;
//    if FJurnal.LoadByNoRef(aRefNo, aUnitID, FElectricInvoice.GetHeaderFlag) then
//    begin
//      if FJurnal.JUR_IS_POSTED = 1 then
//      begin
//        CommonDlg.ShowMessage('Transaksi ini sudah diposting, tidak bisa di edit lagi');
//        Exit;
//      end;
//      sJurnalNo := FJurnal.JUR_NO;
//      aIDJurnal := FJurnal.JUR_ID;
//    end
//    else
//      sJurnalNo := FJurnal.GetJurnalNO(MasterNewUnit.ID, dtpPeriode.Date, FKodeJurnal.CODE);
//
//    if FElectricInvoice.LoadByNo(aNobukti, MasterNewUnit.ID) then
//    begin
//      for i := 0 to FKodeJurnal.STANDARJURNALDETAILS.Count - 1 do
//      begin
//        dDebet := 0;
//        dCredit := 0;
//
//        if UpperCase(FKodeJurnal.STANDARJURNALDETAILS[i].STDJD_TRANSACTION) = 'DEBET' then
//          dDebet := FElectricInvoice.GenerateJurnal(FKodeJurnal.STANDARJURNALDETAILS[i].FLAGRUMUS)
//        else
//          dCredit := FElectricInvoice.GenerateJurnal(FKodeJurnal.STANDARJURNALDETAILS[i].FLAGRUMUS);
//
//        SetNilaiDebetCredit(dDebet, dCredit, dHasilDebet, dHasilCredit);
//
//        IsiMemoryData(FKodeJurnal.STANDARJURNALDETAILS[i].STDJD_REK.REK_CODE,
//                      dHasilDebet,
//                      dHasilCredit,
//                      dmReportNew.jvMemData);
//      end;
//    end;
//
//    fdtEOD := GetLastEODDateHO + 1;
//    if (dtpPeriode.Date < fdtEOD) then
//    begin
//        CommonDlg.ShowMessage('Tanggal Invoice Electric kurang dari tanggal EOD, Transaksi akan di masukan ke jurnal Tanggal ' + FormatDateTime('DD MMMM yyyy', fdtEOD) );
//        dtpPeriode.Date:= fdtEOD;
//        sJurnalNo := FJurnal.GetJurnalNO(MasterNewUnit.ID, dtpPeriode.Date, FKodeJurnal.CODE);
//    end;
//
//    if IsDebetCreditBalance(dTotalDebet, dTotalCredit, dmReportNew.jvMemData) then
//    begin
//      FJurnal.UpdateData(FElectricInvoice.GetHeaderFlag,
//                         dTotalCredit,
//                         dtpPeriode.Date,
//                         dTotalDebet,
//                         aDeskripsi,
//                         IntToStr(FThFiskal),
//                         aIDJurnal,
//                         0,
//                         IntToStr(FPeriodeNo),
//                         0,
//                         aRefNo,
//                         aUnitID,
//                         sJurnalNo,
//                         FKodeJurnalID,
//                         Mastercompany.ID
//                         );
//
//       FJurnal.JurnalItems.Clear;
//
//       with dmReportNew do
//       begin
//         jvMemData.First;
//         while not jvMemData.Eof do
//         begin
//           if (jvMemData.FieldByName('Debet').AsFloat + jvMemData.FieldByName('Credit').AsFloat <> 0) then
//           begin
//             FJurnal.UpdateJurnalItems(1,
//                                       MasterNewUnit.ID,
//                                       jvMemData.FieldByName('Credit').AsFloat,
//                                       jvMemData.FieldByName('Debet').AsFloat,
//                                       aDeskripsi,
//                                       0,
//                                       GetIsDebet(jvMemData.FieldByName('Debet').AsFloat),
//                                       jvMemData.FieldByName('RekCode').AsString,
//                                       Mastercompany.ID,
//                                       MasterNewUnit.ID);
//
//           end;
//           jvMemData.Next;
//         end;
//       end;
//     end
//     else
//     begin
//       CommonDlg.ShowError('Jurnal Belum Balance Untuk Invoice ' + aNobukti);
//       Exit;
//     end;
//
//     Result := FJurnal.ExecuteGenerateSQL;
//
//  finally
//    if FJurnal <> nil then FreeAndNil(FJurnal);
//    if FKodeJurnal <> nil then FreeAndNil(FKodeJurnal);
//    if FElectricInvoice <> nil then FreeAndNil(FElectricInvoice);
//  end;
end;

procedure TfrmElectricInvoice.SetIsPeriodeFiskalAktif(const Value: Boolean);
begin
  FIsPeriodeFiskalAktif := Value;
end;

procedure TfrmElectricInvoice.dtpPeriodeChange(Sender: TObject);
begin
  inherited;
  ParseDataTahunAndPeriodeFiskal(dtpPeriode.DateTime);
end;

procedure TfrmElectricInvoice.actPaymentElectricInvoiceExecute(
  Sender: TObject);
var i           : Integer;
    bSuccess    : Boolean;
    _isChecked,
    _isChanged  : Boolean;
begin
  inherited;
//  i:= 1;
  _isChanged := False;
//  try
//    //ElectricInvoice.BeginTransaction;
//    FNewElectric_Invoice:= TNewElectric_Invoice.CreateWithUser(Self, FLoginId, FLoginUnitId);
//    for i := 1 to strgElectricInvoice.RowCount-1 do
//    begin
//      strgElectricInvoice.GetCheckBoxState(_KolNo,i,_isChecked);
//      if _isChecked then
//      begin
//        {SetLength(arrParam,2);
//        arrParam[0].tipe := ptInteger;
//        arrParam[0].data := StrToInt(strgElectricInvoice.Cells[13,i]);
//        arrParam[1].tipe := ptInteger;
//        arrParam[1].data := MasterNewUnit.ID;
//        ElectricInvoice.UpdatePaymentElectricInvoice(arrParam);}
//        FNewElectric_Invoice.LoadByID(strgElectricInvoice.Ints[_KolELINV_ID,i], MasterNewUnit.ID);
//        bSuccess := True;
//        //testing raise
//        if not FNewElectric_Invoice.UpdatePaymentElectricInvoice() then
//          bSuccess := False
//        else
//        begin
//          if not SaveDataJurnal(FNewElectric_Invoice.ELINV_NUMBER, FNewElectric_Invoice.ELINV_ELECTR_UNT_ID, 'CLAIM ELECTRIC ' + strgElectricInvoice.Cells[3, i] + ' PERIODE ' + FormatDateTime('MMMM yyyy', dtpPeriode.DateTime),
//                                'CLAIM ' + FNewElectric_Invoice.ELINV_NUMBER, getGlobalVar('DEF_JURNAL_CLAIM_ELECTRIC')) then
//            bSuccess := False;
//        end;
//
//        if not bSuccess then
//        begin
//          cRollbackTrans;
//          Break;
//        end;
//
//        _isChanged := True;
//      end;
//    end;
//    cCommitTrans;
//    if _isChanged then
//       CommonDlg.ShowConfirm(atEdit)
//    else
//       CommonDlg.ShowConfirmGlobal('There''s nothing to change.');
//  except
//    cRollbackTrans;
//    CommonDlg.ShowError('Cannot update to database.');
//  end;
//  btnShow.Click;

end;

procedure TfrmElectricInvoice.actPrintExecute(Sender: TObject);
//var
//    Year, Month, Day: Word;
//    mySpell: TSpell;
//    s: string;
//    sTerbilang, sTerbilang2 : string;
begin
  inherited;
//  DecodeDate(dtpPeriode.Date, Year, Month, Day);
//
//  s :=
//    'SELECT EI.ELINV_NUMBER, ' +
//      '(EI.ELINV_COST_ABODEMEN + EI.ELINV_COST_USE + EI.ELINV_TTBL + EI.ELINV_PJU) AS TOTAL_COST ' +
//    'FROM ELECTRIC_INVOICE EI ' +
//      'LEFT JOIN ELECTRIC_RATE ER ON EI.ELINV_ELECTR_ID = ER.ELECTR_ID ' +
//      'LEFT JOIN ELECTRIC_CUSTOMER EC ON EI.ELINV_ELCUST_ID = EC.ELCUST_ID ' +
//      'LEFT JOIN CUSTOMER C ON EC.ELCUST_CUST_ID = C.CUST_ID ' +
//    'WHERE EI.ELINV_PERIOD = ' + quotedStr(FormatDateTime('mm/dd/yyyy', EncodeDate(Year, Month, 1))) +
//    ' AND EI.ELINV_IS_PAYMENT = FALSE ' +
//    'ORDER BY EI.ELINV_NUMBER ASC, C.CUST_CODE ASC, C.CUST_NAME ASC';
//
//  with cOpenQuery(s) do
//  try
//     if not Eof then
//     begin
//       sTerbilang  := Terbilang(FieldByName('total_cost').AsInteger);
//       mySpell     := TSpell.Create;
//       sTerbilang2 := UpperCase(mySpell.Spell(CurrToStr(Round(FieldByName('total_cost').AsCurrency/100)*100)));
//     end;
//
//  finally
//     free;
//  end;
//
//  s :=  'SELECT ' + GetCompanyHeader(FLoginUsername, MasterNewUnit.Nama, dtpPeriode.Date, dtpPeriode.Date) +
//      Quot(sTerbilang) + ' as Terbilang,' + Quot(sTerbilang2) + ' as Terbilang2,' +
//      ' EI.ELINV_NUMBER, EI.ELINV_PERIOD, EI.ELINV_ELECTR_ID, EI.ELINV_GROUP, EI.ELINV_POWER, EI.ELINV_FACTOR, ' +
//      'EI.ELINV_COST_SAT_ABODEMEN, EI.ELINV_COST_SAT_USE, EI.ELINV_ELECTRIC_USE, ' +
//      'EI.ELINV_COST_ABODEMEN, EI.ELINV_COST_USE, EI.ELINV_TTBL, EI.ELINV_PJU, EI.ELINV_ELCUST_ID, ' +
//      'C.CUST_CODE, C.CUST_NAME, C.CUST_ADDRESS, C.CUST_CITY, C.CUST_POST_CODE, ' +
//      '(SELECT EU.ELEC_BEGIN_STAND FROM ELECTRIC_USE EU ' +
//        'WHERE EU.ELEC_ELCUST_ID = EC.ELCUST_ID ' +
//        'AND EU.ELEC_PERIOD = EI.ELINV_PERIOD) AS BEGIN_STAND, ' +
//      '(SELECT EU.ELEC_END_STAND FROM ELECTRIC_USE EU ' +
//        'WHERE EU.ELEC_ELCUST_ID = EC.ELCUST_ID ' +
//        'AND EU.ELEC_PERIOD = EI.ELINV_PERIOD) AS END_STAND, ' +
//      '(EI.ELINV_COST_ABODEMEN + EI.ELINV_COST_USE + EI.ELINV_TTBL + EI.ELINV_PJU) AS TOTAL_COST, ' +
//      ''' '' AS TERBILANG ' +
//    'FROM ELECTRIC_INVOICE EI ' +
//      'LEFT JOIN ELECTRIC_RATE ER ON EI.ELINV_ELECTR_ID = ER.ELECTR_ID ' +
//      'LEFT JOIN ELECTRIC_CUSTOMER EC ON EI.ELINV_ELCUST_ID = EC.ELCUST_ID ' +
//      'LEFT JOIN CUSTOMER C ON EC.ELCUST_CUST_ID = C.CUST_ID ' +
//    'WHERE EI.ELINV_PERIOD = ' + quotedStr(FormatDateTime('mm/dd/yyyy', EncodeDate(Year, Month, 1))) +
//    ' AND EI.ELINV_IS_PAYMENT = ' + IntToStr(cbPilih.ItemIndex) + //:STATUS ' +
//   // ' AND EI.ELINV_IS_PAYMENT = FALSE ' +
//    'ORDER BY EI.ELINV_NUMBER ASC, C.CUST_CODE ASC, C.CUST_NAME ASC';
//
//  dmReportNew.EksekusiReport('frInvoiceListrik', s, '', True);
end;

end.

