unit ufrmElectricPayment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, ComCtrls, ActnList, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, dxCore, cxDateUtils, Vcl.Menus, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxCurrencyEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, System.Actions,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxCalendar, cxLabel,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxPC;

type
  TfrmElectricPayment = class(TfrmMasterBrowse)
    pnlTop: TPanel;
    lbl6: TLabel;
    lbl1: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl8: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    cbpCustomerCode: TcxExtLookupComboBox;
    edtCustomerName: TEdit;
    edtPaymentNo: TEdit;
    edtDescription: TEdit;
    edtAmountInvoice: TcxCurrencyEdit;
    edtTotalPayment: TcxCurrencyEdit;
    cbpInvoiceNo: TcxExtLookupComboBox;
    lbl2: TLabel;
    dtpRecv: TDateTimePicker;
    lbl3: TLabel;
    cbpBankAccount: TcxExtLookupComboBox;
    edtBankAccount: TEdit;
    btnShow: TcxButton;
    cxcolNo: TcxGridDBColumn;
    cxcolBankAccount: TcxGridDBColumn;
    cxcolDocument: TcxGridDBColumn;
    cxcolReceiptDate: TcxGridDBColumn;
    cxcolAmount: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure fraFooter4Button1btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbpCustomerCodeChange(Sender: TObject);
    procedure cbpInvoiceNoChange(Sender: TObject);
    procedure cbpBankAccountChange(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnShowClick(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
  private
    { Private declarations }
    JournalCode : string;
    JournalID : Integer;
    NoRekening : string;
    PaymentId: Integer;
    company_id, unit_id, customer_id, InvoiceId, InvoiceUnitId, RekCompanyId: Integer;
    procedure SetInputComponents(Disable: Boolean);
    procedure ClearAllControls;
    procedure ShowDataElectricPayment;
    procedure FillComboCustomer(aUnit_Id: Integer);
    procedure FillComboInvoice(CustomerId: Integer);
    procedure FillComboBankAccount(aCompany_Id: Integer);
  public
    { Public declarations }
  end;

var
  frmElectricPayment: TfrmElectricPayment;

implementation
{$R *.dfm}

uses
  uConn,  uTSCommonDlg, uConstanta, udmReport, ufrmDialogPrintPreview;

var arrParam: TArr;
    arrInvoiceUnitId, arrRekeningCompanyId, arrPaymentId: array of Integer;
    arrAmountInvoice: array of Currency;
    max_payment_no: Int64;

procedure TfrmElectricPayment.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  Action:= caFree;
end;

procedure TfrmElectricPayment.FormDestroy(Sender: TObject);
begin
  inherited;
  frmElectricPayment:= nil;
end;

procedure TfrmElectricPayment.fraFooter4Button1btnCloseClick(
  Sender: TObject);
begin
  inherited;

  if fraFooter4Button1.btnAdd.Tag = 1 then
  begin
    fraFooter4Button1.btnAdd.Tag := 0;
    fraFooter4Button1.btnAdd.Caption:= '&Add';
    fraFooter4Button1.btnClose.Tag := 0;
    fraFooter4Button1.btnClose.Caption:= 'Close';
    fraFooter4Button1.btnUpdate.Enabled:= True;
    btnShow.Enabled:= True;
    SetInputComponents(True);
    ClearAllControls;
  end
  else if fraFooter4Button1.btnUpdate.Tag = 1 then
  begin
    fraFooter4Button1.btnUpdate.Tag := 0;
    fraFooter4Button1.btnUpdate.Caption:= '&Edit';
    fraFooter4Button1.btnClose.Tag := 0;
    fraFooter4Button1.btnClose.Caption:= 'Close';
    fraFooter4Button1.btnAdd.Enabled:= True;
    btnShow.Enabled:= True;
    SetInputComponents(True);
    ClearAllControls;
  end
end;

procedure TfrmElectricPayment.FormShow(Sender: TObject);
var i: Integer;
begin
  inherited;

  // kode jurnal dibikin constanta
  JournalCode := 'R007';
  JournalID   := 103;


  dtpRecv.Date:= Now;
  SetInputComponents(True);
end;

procedure TfrmElectricPayment.SetInputComponents(Disable: Boolean);
var i: Integer;
begin
  with pnlTop do
  begin
    for i:= 0 to ControlCount-1 do
    begin
      if Disable and not (Controls[i] is TLabel) and not (Controls[i] is TcxButton) then
      begin
        Controls[i].Enabled:= False;
      end
      else if not Disable then
        if not (Controls[i] is TcxButton) then
          Controls[i].Enabled:= True
        else
          Controls[i].Enabled:= False;
    end;
  end;
end;

procedure TfrmElectricPayment.cbpCustomerCodeChange(Sender: TObject);
begin
  inherited;

  edtAmountInvoice.Value:= 0;
  edtAmountInvoice.Clear;

//  if cbpCustomerCode.Row > 0 then
//  begin
//    edtCustomerName.Text:= cbpCustomerCode.Cells[2, cbpCustomerCode.Row];
//    FillComboInvoice(StrToInt(cbpCustomerCode.Cells[0,cbpCustomerCode.Row]));
//    ShowDataElectricPayment;
//  end
//  else
  begin
    edtCustomerName.Text:= '';
  end;
end;

procedure TfrmElectricPayment.cbpInvoiceNoChange(Sender: TObject);
begin
  inherited;

//  if cbpInvoiceNo.Row > 0 then
//  begin
//    if (cbpInvoiceNo.Cells[0, cbpInvoiceNo.Row] <> '') and
//    (cbpInvoiceNo.Cells[0, cbpInvoiceNo.Row] <> 'Id') and (Length(arrAmountInvoice)  > 0)then
//    begin
//      edtAmountInvoice.Value := arrAmountInvoice[cbpInvoiceNo.Row-1];
//      InvoiceId              := StrToInt(cbpInvoiceNo.Cells[0, cbpInvoiceNo.Row]);
//      InvoiceUnitId          := arrInvoiceUnitId[cbpInvoiceNo.Row-1];
//    end
//    else
//    begin
//      edtAmountInvoice.Value:= 0;
//      edtAmountInvoice.Clear;
//    end;
//  end
//  else
//   begin
//    edtAmountInvoice.Value:= 0;
//    edtAmountInvoice.Clear;
//  end;
end;

procedure TfrmElectricPayment.ClearAllControls;
begin
  cbpCustomerCode.Clear;
  edtCustomerName.Clear;
  cbpInvoiceNo.Clear;
  dtpRecv.Date:= Now;
  edtPaymentNo.Clear;
  edtDescription.Clear;
  cbpBankAccount.Clear;
  edtBankAccount.Clear;
  edtAmountInvoice.Clear;
  edtTotalPayment.Clear;
end;

procedure TfrmElectricPayment.cbpBankAccountChange(Sender: TObject);
begin
  inherited;
//
//  if cbpBankAccount.Row > 0 then
//  begin
//    edtBankAccount.Text:= cbpBankAccount.Cells[2, cbpBankAccount.Row];
//    NoRekening:= cbpBankAccount.Cells[1, cbpBankAccount.Row];
//    RekCompanyId:= arrRekeningCompanyId[cbpBankAccount.Row-1];
//  end
//  else
//  begin
//    edtBankAccount.Text:= '';
//  end;
end;

procedure TfrmElectricPayment.ShowDataElectricPayment;
var
    i: Integer;
  sSQL: string;
begin
  sSQL:= 'select c.cust_name, rkj.kdjur_code, rkj.kdjur_name, rkj.kdjur_comp_id,'
      + ' ep.elpay_document_no, ep.elpay_date, ep.elpay_description, ep.elpay_amount_payment,'
      + ' b.bank_name, ep.ELPAY_ID, r.rek_code'
      + ' from electric_payment ep'
      + ' left join electric_invoice ei on ep.elpay_elinv_id = ei.elinv_id'
      + ' left join electric_customer ec on ei.elinv_elcust_id = ec.elcust_id'
      + ' left join customer c on ec.elcust_cust_id = c.cust_id'
      + ' left join ref$kode_jurnal rkj on ep.elpay_kdjur_id = rkj.kdjur_id'
      + ' left join rekening r on ep.elpay_rek_code_bank = r.rek_code'
      + ' left join bank b on r.rek_code = b.bank_rek_code'
//      + ' where ec.ELCUST_ID = '+ cbpCustomerCode.Cells[0,cbpCustomerCode.Row];

//  strgGrid.ClearNormalCells;
//  strgGrid.RowCount:= 2;
//
//  with cOpenQuery(sSQL, False) do
//  begin
//    try
//      if not IsEmpty then
//      begin
//        with strgGrid do
//        begin
//          ClearNormalCells;
//          Last;
//          RowCount:= RecordCount + 1;
//          SetLength(arrPaymentId, RecordCount);
//          i:= 1;
//
//          First;
//          while not Eof do
//          begin
//            Cells[0,i]        := IntToStr(i);
//            Alignments[0,i]   := taCenter;
//            Cells[1,i]        := FieldByName('bank_name').AsString;
//            Cells[2,i]        := FieldByName('elpay_document_no').AsString;
//            Cells[3,i]        := FormatDateTime('dd mmmm yyyy', FieldByName('elpay_date').AsDateTime);
//            Cells[4,i]        := FormatCurr('#,##0.00', FieldByName('elpay_amount_payment').AsFloat);
//            Alignments[4,i]   := taRightJustify;
//            arrPaymentId[i-1] := FieldByName('ELPAY_ID').AsInteger;
//
//            Inc(i);
//            Next;
//          end;
//        end;
//
//        strgGridClickCell(Self,1,0);
//
//      end
//      else
//      begin
//        SetLength(arrPaymentId,0);
//      end;
//
//    finally
//      Free;
//    end;
//  end;
end;

procedure TfrmElectricPayment.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if (Key = Ord('P')) and (ssctrl in Shift) then
    GetAndRunButton('btnDelete');
end;

procedure TfrmElectricPayment.btnShowClick(Sender: TObject);
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
//  if cbpCustomerCode.Enabled then
//  begin
//    cbpCustomerCodeChange(Self);
//  end
//  else
//  begin
//    cbpCustomerCode.Enabled:= True;
//    FillComboCustomer(MasterNewUnit.ID);
//    cbpCustomerCode.SetFocus;
//    edtCustomerName.Enabled:= True;
//  end;
end;

procedure TfrmElectricPayment.FillComboBankAccount(aCompany_Id: Integer);
var
    i : Integer;
  sSQL: string;
begin
  sSQL:= 'select b.BANK_ID, b.BANK_CODE, b.BANK_NAME, r.REK_CODE, r.REK_COMP_ID'
      + ' from bank b'
      + ' left join rekening r on b.bank_rek_code = r.rek_code'
      + ' where b.BANK_REK_CODE is not null'
      + ' and r.REK_COMP_ID = '+ IntToStr(aCompany_Id)
      + ' order by b.BANK_CODE asc';

  // isi list combo box bank account
//  with cbpBankAccount do
//  begin
//    ClearGridData;
//    ColCount := 3;
//
//    with cOpenQuery(sSQL, False) do
//    begin
//      try
//        Last;
//        if not IsEmpty then
//        begin
//          First;
//          SetLength(arrRekeningCompanyId, RecordCount);
//          i:= 0;
//          RowCount := RecordCount + 1;
//          AddRow(['Id', 'Rekening Code', 'Bank Name']);
//
//          while not Eof do
//          begin
//            AddRow([FieldByName('BANK_ID').AsString,
//              FieldByName('REK_CODE').AsString,
//              FieldByName('BANK_NAME').AsString]);
//            arrRekeningCompanyId[i]:= FieldByName('REK_COMP_ID').AsInteger;
//
//            Inc(i);
//            Next;
//          end;
//        end
//        else
//        begin
//          SetLength(arrRekeningCompanyId, 0);
//          RowCount := 2;
//          AddRow(['Id', 'Rekening Code', 'Bank Name']);
//          AddRow(['', ' ', ' ']);
//        end;
//
//      finally
//        Free;
//      end;
//    end;
//
//    FixedRows := 1;
//    SizeGridToData;
//    Text := '';
//  end;
end;

procedure TfrmElectricPayment.FillComboInvoice(CustomerId: Integer);
var
    i : Integer;
  sSQL: string;
begin

//  if (cbpCustomerCode.Cells[0,cbpCustomerCode.Row] <> '') and
//     (cbpCustomerCode.Cells[0,cbpCustomerCode.Row] <> 'Id') then
//  begin
//    sSQL:= 'select ELINV_ID, ELINV_UNT_ID, ELINV_NUMBER,'
//      + ' (ELINV_COST_ABODEMEN + ELINV_COST_USE +'
//      + ' ELINV_TTBL + ELINV_PJU) AS total_invoice'
//      + ' from electric_invoice'
//      + ' where ELINV_IS_PAYMENT = 0'
//      + ' and ELINV_ELCUST_ID = '+ cbpCustomerCode.Cells[0,cbpCustomerCode.Row];
//
//    // isi list combo box electric invoice
//    with cbpInvoiceNo do
//    begin
//      ClearGridData;
//      ColCount := 2;
//
//      with cOpenQuery(sSQL, False) do
//      begin
//        try
//          if not IsEmpty then
//          begin
//            Last;
//            ReadOnly:= False;
//            First;
//            SetLength(arrInvoiceUnitId, RecordCount);
//            SetLength(arrAmountInvoice, RecordCount);
//            i:= 0;
//
//            RowCount := RecordCount + 1;
//            AddRow(['Id', 'Invoice No']);
//
//            while not Eof do
//            begin
//              arrInvoiceUnitId[i]:= FieldByName('ELINV_UNT_ID').AsInteger;
//              arrAmountInvoice[i]:= FieldByName('total_invoice').AsCurrency;
//              Inc(i);
//
//              AddRow([FieldByName('ELINV_ID').AsString,
//                FieldByName('ELINV_NUMBER').AsString]);
//
//              Next;
//            end;
//          end
//          else
//          begin
//            SetLength(arrInvoiceUnitId, 0);
//            SetLength(arrAmountInvoice, 0);
//            RowCount := 2;
//            AddRow(['Id', 'Invoice No']);
//            AddRow(['', ' ']);
//            ReadOnly:= True;
//          end;
//
//        finally
//          Free;
//        end;
//      end;
//
//      FixedRows := 1;
//      SizeGridToData;
//      Text := '';
//    end;
//  end;
end;

procedure TfrmElectricPayment.FillComboCustomer(aUnit_Id: Integer);
var
  sSQL: string;
begin
  sSQL:= 'select ec.ELCUST_ID, c.CUST_ID, c.CUST_CODE, c.CUST_NAME'
      + ' from electric_customer ec'
      + ' left join customer c on ec.elcust_cust_id = c.cust_id'
      + ' where ec.ELCUST_UNT_ID = '+ IntToStr(aUnit_Id)
      + ' order by c.CUST_CODE asc';

 // isi list combo box electric customer
//  with cbpCustomerCode do
//  begin
//    ClearGridData;
//    ColCount := 3;
//
//    with cOpenQuery(sSQL, False) do
//    begin
//      try
//        Last;
//        if not IsEmpty then
//        begin
//          First;
//          RowCount := RecordCount + 1;
//          AddRow(['Id', 'Customer Code', 'Customer Name']);
//
//          while not Eof do
//          begin
//            AddRow([FieldByName('ELCUST_ID').AsString,
//              FieldByName('CUST_CODE').AsString,
//              FieldByName('CUST_NAME').AsString]);
//
//            Next;
//          end;
//        end
//        else
//        begin
//          RowCount := 2;
//          AddRow(['Id', 'Customer Code', 'Customer Name']);
//          AddRow(['', ' ', ' ']);
//        end;
//
//      finally
//        Free;
//      end;
//    end;
//
//    FixedRows := 1;
//    SizeGridToData;
//    Text := '';
//  end;
end;

procedure TfrmElectricPayment.actAddExecute(Sender: TObject);
begin
  inherited;
//
//  if Mastercompany.ID = 0 then begin
//    CommonDlg.ShowError(ER_COMPANY_NOT_SPECIFIC);
//    //frmMain.cbbCompCode.SetFocus;
//    Exit;
//  end
//  else if MasterNewUnit.ID = 0 then begin
//    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
//    //frmMain.cbbUnit.SetFocus;
//    Exit;
//  end;
//
//  if not Assigned(ElectricPayment) then
//    ElectricPayment:= TElectricPayment.Create;
//
//  if fraFooter4Button1.btnAdd.Tag = 0 then begin
//    fraFooter4Button1.btnAdd.Tag := 1;
//    fraFooter4Button1.btnAdd.Caption:= '&Save';
//    fraFooter4Button1.btnClose.Tag := 1;
//    fraFooter4Button1.btnClose.Caption:= 'Abort';
//    fraFooter4Button1.btnUpdate.Enabled:= False;
//    SetInputComponents(False);
//
//    strgGrid.ClearNormalCells;
//    strgGrid.RowCount:= 2;
//
//    FillComboCustomer(MasterNewUnit.ID);
//
//    SetLength(arrParam,0);
//    dataPaymentNo:= ElectricPayment.GetMaxPaymentNo(arrParam);
//    if not dataPaymentNo.IsEmpty then begin
//      if dataPaymentNo.FieldByName('max_no').Value <> Null then
//        max_payment_no:= StrToInt(dataPaymentNo.FieldByName('max_no').AsString)
//      else
//        max_payment_no:= 0;
//    end
//    else
//      max_payment_no:= 0;
//
//    edtPaymentNo.Text:= StrPadLeft(IntToStr(max_payment_no + 1), 10, '0');
//
//    FillComboBankAccount(Mastercompany.ID);
//  end
//  else begin
//    if (Trim(cbpInvoiceNo.Cells[0, cbpInvoiceNo.Row]) = '') or
//    (cbpInvoiceNo.Cells[0, cbpInvoiceNo.Row] = 'Id') then begin
//      CommonDlg.ShowError('Invoice No cannot be empty.');
//      cbpInvoiceNo.SetFocus;
//      Exit;
//    end;
//
//    if (Trim(cbpCustomerCode.Cells[0, cbpCustomerCode.Row]) = '') or
//    (cbpCustomerCode.Cells[0, cbpCustomerCode.Row] = 'Id') then begin
//      CommonDlg.ShowError('Customer must be specific.');
//      cbpCustomerCode.SetFocus;
//      Exit;
//    end;
//
//    try
//      ElectricPayment.BeginTransaction;
//
//      // insert ke tabel electric_payment
//      SetLength(arrParam,15);
//      arrParam[0].tipe := ptInteger;
//      if MasterNewUnit.ID < 1 then
//        arrParam[0].data := 0
//      else
//        arrParam[0].data := MasterNewUnit.ID;
//      arrParam[1].tipe := ptInteger;
//      arrParam[1].data := StrToInt(cbpInvoiceNo.Cells[0, cbpInvoiceNo.Row]);
//      arrParam[2].tipe := ptInteger;
//      arrParam[2].data := arrInvoiceUnitId[cbpInvoiceNo.Row-1];
//      arrParam[3].tipe := ptDateTime;
//      arrParam[3].data := dtpRecv.Date;
//      arrParam[4].tipe := ptString;
//      arrParam[4].data := edtPaymentNo.Text;
//      arrParam[5].tipe := ptInteger;
//      arrParam[5].data := JournalID;
//      arrParam[6].tipe := ptInteger;
//      arrParam[6].data := Mastercompany.ID;
//      arrParam[7].tipe := ptCurrency;
//      arrParam[7].data := edtTotalPayment.Value;
//      arrParam[8].tipe := ptString;
//      arrParam[8].data := edtDescription.Text;
//      arrParam[9].tipe := ptString;
//      arrParam[9].data := cbpBankAccount.Cells[1, cbpBankAccount.Row];
//      arrParam[10].tipe := ptInteger;
//      arrParam[10].data := arrRekeningCompanyId[cbpBankAccount.Row-1];
//      arrParam[11].tipe := ptString;
//      arrParam[11].data := cbpBankAccount.Cells[1, cbpBankAccount.Row];
//      arrParam[12].tipe := ptInteger;
//      arrParam[12].data := arrRekeningCompanyId[cbpBankAccount.Row-1];
//      arrParam[13].tipe := ptInteger;
//      arrParam[13].data := FLoginId;
//      arrParam[14].tipe := ptDateTime;
//      arrParam[14].data := Date;
//      ElectricPayment.AddElectricPayment(arrParam);
//
//      // ubah status is_payment
//      SetLength(arrParam,1);
//      arrParam[0].tipe := ptInteger;
//      arrParam[0].data := StrToInt(cbpInvoiceNo.Cells[0, cbpInvoiceNo.Row]);
//      ElectricPayment.EditStatusIsPayment(arrParam);
//
//      ElectricPayment.Commit;
//    except
//      ElectricPayment.Rollback;
//      CommonDlg.ShowError('Cannot store to database.');
//    end;
//
//    fraFooter4Button1.btnAdd.Tag := 0;
//    fraFooter4Button1.btnAdd.Caption:= '&Add';
//    fraFooter4Button1.btnClose.Tag := 0;
//    fraFooter4Button1.btnClose.Caption:= 'Close';
//    fraFooter4Button1.btnUpdate.Enabled:= True;
//    SetInputComponents(True);
//    ClearAllControls;
//    btnShow.Enabled:= True;
//  end;
end;

procedure TfrmElectricPayment.actPrintExecute(Sender: TObject);
var ParamList: TStringList;
  separatorTanggal: Char;
    dataElectricPayment: TDataSet;
begin
  inherited;

//  if strgGrid.Cells[0,1] <> '' then
//  begin
//    if not Assigned(mySpell) then
//      mySpell := TSpell.Create;
//
//    separatorTanggal:= DateSeparator;
//    DateSeparator:= '/';
//
//    if not Assigned(ElectricPayment) then
//      ElectricPayment:= TElectricPayment.Create;
//
//    SetLength(arrParam,1);
//    arrParam[0].tipe := ptInteger;
//    arrParam[0].data := PaymentId;
//    dataElectricPayment:= ElectricPayment.GetListPaymentByPaymentId(arrParam);
//
//    ParamList := TStringList.Create;
//    if not dataElectricPayment.IsEmpty then
//    begin
//      ParamList.Add(StrPadLeft(IntToStr(dataElectricPayment.FieldByName('kdjur_comp_id').AsInteger),2,'0')); //1
//      ParamList.Add(UpperCase(mySpell.Spell(dataElectricPayment.FieldByName('elpay_amount_payment').AsString))); //2
//    end
//    else
//    begin
//      ParamList.Add(''); //1
//      ParamList.Add(''); //2
//    end;
//    ParamList.Add(FLoginUsername); //3
//    ParamList.Add(MasterNewUnit.Nama); //4
//
//    if not Assigned(frmDialogPrintPreview) then
//      frmDialogPrintPreview:= TfrmDialogPrintPreview.Create(Application);
//
//    with frmDialogPrintPreview do
//    begin
//      ListParams:= ParamList;
//      RecordSet := dataElectricPayment;
//      FilePath  := FFilePathReport + 'frElectricPayment.fr3';
//      SetFormPropertyAndShowDialog(frmDialogPrintPreview);
//    end;
//
//    FreeAndNil(ParamList);
//    FreeAndNil(mySpell);
//    frmDialogPrintPreview.Free;
//
//
//    DateSeparator:= separatorTanggal;
//  end;
end;

end.

