unit ufrmInvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ActnList, ufrmMasterBrowse,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Menus, cxCurrencyEdit, System.Actions,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  cxButtonEdit;

type
  TfrmInvoice = class(TfrmMasterBrowse)
    pnlTop: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    edtCustomer: TEdit;
    edtSuplier: TEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    dtRecv: TcxDateEdit;
    lbl7: TLabel;
    edtInvoiceNo: TEdit;
    lbl9: TLabel;
    edtInvoiceDesc: TEdit;
    edtStatusInvoice: TEdit;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    pnl1: TPanel;
    edtDescription: TEdit;
    lbl14: TLabel;
    btnViewInvoice: TcxButton;
    edbCustomerCode: TcxButtonEdit;
    edbSupplierCode: TcxButtonEdit;
    edbAgreementNo: TcxButtonEdit;
    curredtTotalAgreement: TcxCurrencyEdit;
    edbInvoiceSchedule: TcxButtonEdit;
    curredtTotalSubTotal: TcxCurrencyEdit;
    curredtTotalPPN: TcxCurrencyEdit;
    curredtTotalPPH23: TcxCurrencyEdit;
    curredtTotal: TcxCurrencyEdit;
    cxcolCode: TcxGridDBColumn;
    cxcolDESCRIPTION: TcxGridDBColumn;
    cxcolQTY: TcxGridDBColumn;
    cxcolUOM: TcxGridDBColumn;
    cxcolHARGA: TcxGridDBColumn;
    procedure actPrintExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure FormShow(Sender: TObject);
    procedure btnViewInvoiceClick(Sender: TObject);
    procedure edbCustomerCodeClickBtn(Sender: TObject);
    procedure edbCustomerCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edbCustomerCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edbSupplierCodeClickBtn(Sender: TObject);
    procedure edbSupplierCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edbAgreementNoClickBtn(Sender: TObject);
    procedure edbAgreementNoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edbInvoiceScheduleClickBtn(Sender: TObject);
    procedure edbInvoiceScheduleKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actRefreshExecute(Sender: TObject);
  private
    FPeriodeCnt: Integer;
    FPeriodeName: string;
    FStaproName: string;
    FEndDate: TDateTime;
    FIsPeriodeFiskalAktif: Boolean;
    FParamList: TStringList;
    FPeriodeNo: Integer;
    FResult: Boolean;
    FThFiskal: Integer;
    procedure ClearFormAgreement;
    procedure ClearFormInvoice;
    procedure ClearFormInvoiceDetail;
    function GenerateDescription(ARow: Integer): string;
    procedure ParseComboCustomer;
    procedure ParseDataInvoice;
    procedure ParseDataInvoiceDetil;
    procedure ParseDataAgreementDetil;
    procedure SetPeriodeCnt(const Value: Integer);
    procedure SetPeriodeName(const Value: string);
    procedure SetStaproName(const Value: string);
    procedure SetEndDate(const Value: TDateTime);
    procedure SetIsPeriodeFiskalAktif(const Value: Boolean);
    procedure SetParamList(const Value: TStringList);
    procedure SetResult(const Value: Boolean);
  protected
    FAgreementID: Integer;
    FAgreementJadwalID: Integer;
    procedure ClearForm;
  public
    function GetPeriodJurnal: TDateTime; dynamic;
    function GetSQLLookUpInvoice: string; dynamic;
    procedure ParseDataTahunAndPeriodeFiskal(aDate : TDateTime);
    function SaveDataJurnal(aNoBukti : String; aUnitID : Integer; aNoInvoice :
        String; var aJournalNo : String): Boolean;
    procedure SetRekeningPiutang(aID : Integer; aUnitID : Integer; var
        aKodeRekDebet : String; var aKodeRekCredit : String);
    property PeriodeName: string read FPeriodeName write SetPeriodeName;
    property PeriodeCnt: Integer read FPeriodeCnt write SetPeriodeCnt;
    property StaproName: string read FStaproName write SetStaproName;
    property EndDate: TDateTime read FEndDate write SetEndDate;
    property IsPeriodeFiskalAktif: Boolean read FIsPeriodeFiskalAktif write
        SetIsPeriodeFiskalAktif;
    property ParamList: TStringList read FParamList write SetParamList;
    property Result: Boolean read FResult write SetResult;
  end;

var
  frmInvoice: TfrmInvoice;


implementation
{$R *.dfm}

uses
  uTSCommonDlg, uConstanta, udmReport, ufrmPopupSelectCustomer,
  ufrmDialogViewInvoice, uRetnoUnit;


const
  _KolProductCode : Integer = 0;
  _KolDeskripsi   : Integer = 1;
  _KolQTY         : Integer = 2;
  _KolUOM         : Integer = 3;
  _KolTotal       : Integer = 4;
  _KolUOMName     : Integer = 5;

procedure TfrmInvoice.actPrintExecute(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  if (edtInvoiceNo.Text = '') then
  begin
    CommonDlg.ShowError('Invoice Number is Empty');
    Exit;
  end;

  {if not IsPeriodeFiskalOpen then
  begin
    CommonDlg.ShowError('Fiskal Periode is Close');
    Exit;
  end;  }

//  sSQL := 'SELECT c.AGRJDWL_INV_TERM_NO, a.AGRD_PROJAS_CODE, d.PROJAS_NAME,'
//        + ' a.AGRD_QTY, d.PROJAS_SATNBD_CODE, e.SATNBD_NAME,'
//        + ' c.AGRJDWL_INV_TOTAL AS TOTAL, c.AGRJDWL_INV_NO,'
//        + ' b.AGR_NO, f.CUST_NAME, f.CUST_ADDRESS, f.CUST_CONTACT_PERSON,'
//        + ' f.CUST_TITLE, f.CUST_DESCRIPTION, b.AGR_PER_CNT,'
//        + ' c.AGRJDWL_INV_DATE AS START_DATE, g.PER_NAME,'
//        + ' c.AGRJDWL_INV_DATE + (b.AGR_PER_CNT * g.PER_DAYS) AS END_DATE,'
//        + ' (a.AGRD_SUBTOTAL) * 100 / (100 + h.PJK_PPN) as AGRD_SUBTOTAL,'
//        + ' (a.AGRD_SUBTOTAL - (a.AGRD_SUBTOTAL * 100 / (DIF(b.AGR_IS_PPH23, h.PJK_PPN, 0) + 100))) AS PPH23,'
//        + ' (a.AGRD_SUBTOTAL - (a.AGRD_SUBTOTAL * 100 / (100 + h.PJK_PPN))) AS PPN'
//        + ' FROM AGREEMENT_DETIL a INNER JOIN AGREEMENT b ON b.AGR_ID = a.AGRD_AGR_ID'
//        + ' AND b.AGR_UNT_ID = a.AGRD_AGR_UNT_ID'
//        + ' LEFT JOIN AGREEMENT_JADWAL c ON c.AGRJDWL_AGR_ID = b.AGR_ID'
//        + ' AND c.AGRJDWL_AGR_UNT_ID = b.AGR_UNT_ID'
//        + ' LEFT JOIN PRODUK_JASA d ON d.PROJAS_CODE = a.AGRD_PROJAS_CODE'
//        + ' AND d.PROJAS_UNT_ID = a.AGRD_PROJAS_UNT_ID'
//        + ' LEFT JOIN REF$SATUAN_NBD e ON e.SATNBD_CODE = d.PROJAS_SATNBD_CODE '
//        + ' AND e.SATNBD_UNT_ID = d.PROJAS_SATNBD_UNT_ID'
//        + ' LEFT JOIN CUSTOMER f ON f.CUST_CODE = b.AGR_CUST_CODE'
//        + ' AND f.CUST_UNT_ID = b.AGR_CUST_UNT_ID'
//        + ' LEFT JOIN REF$PERIODE g ON g.PER_ID = b.AGR_PER_ID'
//        + ' AND g.PER_UNT_ID = b.AGR_PER_UNT_ID'
//        + ' LEFT JOIN REF$PAJAK h ON h.PJK_ID = b.AGR_PJK_ID'
//        + ' AND h.PJK_UNT_ID = b.AGR_PJK_UNT_ID'
//        + ' WHERE c.AGRJDWL_ID    = ' + IntToStr(FAgreementJadwalID)
//        + ' AND c.AGRJDWL_INV_NO = ' + Quot(edtInvoiceNo.Text)
//        + ' AND c.AGRJDWL_UNT_ID = ' + IntToStr(MasterNewUnit.ID);
//
//  dmReportNew.EksekusiReport('frInvoiceSewa', sSQL, '', True, 8);

//  if uNewMasterAgreement.UpdateAgreementJadwalPrint(FAgreementJadwalID, MasterNewUnit.ID, 1) then
//  begin
      //if SaveDataJurnal(edbAgreementNo.Text, MasterNewUnit.ID, edtInvoiceNo.Text) then
//        cCommitTrans;
      {else
      begin
        cRollbackTrans;
        CommonDlg.ShowError('Gagal Eksekusi Jurnal Invoice');
        Exit;
      end;  }
//  end
//  else
//  begin
//      cRollbackTrans;
//      CommonDlg.ShowError('Gagal mengupdate status printed');
//      Exit;
//  end;

  sSQL := 'SELECT c.AGRJDWL_INV_TERM_NO, a.AGRD_PROJAS_CODE, d.PROJAS_NAME,'
        + ' a.AGRD_QTY, d.PROJAS_SATNBD_CODE, e.SATNBD_NAME,'
        + ' c.AGRJDWL_INV_TOTAL AS TOTAL, c.AGRJDWL_INV_NO,'
        + ' b.AGR_NO, f.CUST_NAME, f.CUST_ADDRESS, f.CUST_CONTACT_PERSON,'
        + ' f.CUST_TITLE, f.CUST_DESCRIPTION, b.AGR_PER_CNT,'
        + ' c.AGRJDWL_INV_DATE AS START_DATE, g.PER_NAME,'
        + ' c.AGRJDWL_INV_DATE + (b.AGR_PER_CNT * g.PER_DAYS) AS END_DATE,'
        + ' a.AGRD_SUBTOTAL,b.AGR_IS_PPN,b.AGR_IS_PPH23,h.PJK_PPN,'
        + FloatToStr(curredtTotalAgreement.Value) + ' as totagr,' + QuotedStr(edtInvoiceDesc.Text) + 'as invdesc'
        + ' FROM AGREEMENT_DETIL a INNER JOIN AGREEMENT b ON b.AGR_ID = a.AGRD_AGR_ID'
        + ' AND b.AGR_UNT_ID = a.AGRD_AGR_UNT_ID'
        + ' LEFT JOIN AGREEMENT_JADWAL c ON c.AGRJDWL_AGR_ID = b.AGR_ID'
        + ' AND c.AGRJDWL_AGR_UNT_ID = b.AGR_UNT_ID'
        + ' LEFT JOIN PRODUK_JASA d ON d.PROJAS_CODE = a.AGRD_PROJAS_CODE'
        + ' AND d.PROJAS_UNT_ID = a.AGRD_PROJAS_UNT_ID'
        + ' LEFT JOIN REF$SATUAN_NBD e ON e.SATNBD_CODE = d.PROJAS_SATNBD_CODE '
        + ' AND e.SATNBD_UNT_ID = d.PROJAS_SATNBD_UNT_ID'
        + ' LEFT JOIN CUSTOMER f ON f.CUST_CODE = b.AGR_CUST_CODE'
        + ' AND f.CUST_UNT_ID = b.AGR_CUST_UNT_ID'
        + ' LEFT JOIN REF$PERIODE g ON g.PER_ID = b.AGR_PER_ID'
        + ' AND g.PER_UNT_ID = b.AGR_PER_UNT_ID'
        + ' LEFT JOIN REF$PAJAK h ON h.PJK_ID = b.AGR_PJK_ID'
        + ' AND h.PJK_UNT_ID = b.AGR_PJK_UNT_ID'
        + ' WHERE c.AGRJDWL_ID    = ' + IntToStr(FAgreementJadwalID)
        + ' AND c.AGRJDWL_INV_NO = ' + QuotedStr(edtInvoiceNo.Text) ;
//        + ' AND c.AGRJDWL_UNT_ID = ' + IntToStr(MasterNewUnit.ID);

//  dmReportNew.EksekusiReport('frInvoiceSewaNew', sSQL, '', True, 8);

  //exit;
  //////////////////////////
  {if not Assigned(ParamList) then
    ParamList := TStringList.Create;

  ParamList.Add(frmMain.cbbUnit.Text);

  if not Assigned(frmDialogPrintPreview) then
    frmDialogPrintPreview:= TfrmDialogPrintPreview.Create(Application);

  with  frmDialogPrintPreview do
  begin
    ListParams:= ParamList;
    RecordSet := GetDataInvoiceByInvoiceNo(edtInvoiceNo.Text);
    FilePath  := FFilePathReport + 'frInvoice.fr3';
  end;

  frmDialogPrintPreview.Free;

//  with dmReport do
//  begin
//    Params := ParamList;
//    frxDBDataset.DataSet := GetDataInvoiceByInvoiceNo(edtInvoiceNo.Text);
//    pMainReport.LoadFromFile(ExtractFilePath(Application.ExeName) + '/template/frInvoice.fr3');
//    pMainReport.ShowReport;
//  end;

  SetLength(arrParam, 2);
  arrParam[0].tipe := ptInteger;
  arrParam[0].data := 1;
  arrParam[1].tipe := ptString;
  //arrParam[1].data := cbpInvoiceSchedule.Cells[0, cbpInvoiceSchedule.Row];

  if not Assigned(Invoice) then
    Invoice := TInvoice.Create;

  Invoice.UpdateDataAgreementJadwalById(arrParam);}
end;

procedure TfrmInvoice.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmInvoice.FormDestroy(Sender: TObject);
begin
  inherited;
  frmInvoice := nil;
  frmInvoice.Free
end;

procedure TfrmInvoice.ParseComboCustomer;
//var dataCustomer: TResultDataSet;
begin
{  dataCustomer := GetListCustomerByUnitId(MasterNewUnit.ID);

  with cbpCustomer do
  begin
    ClearGridData;
    ColCount := 3;
    dataCustomer.Last;
    if not dataCustomer.IsEmpty then
    begin
      RowCount := dataCustomer.RecordCount + 1;
      AddRow(['Id', 'Customer Code', 'Customer Name']);
      dataCustomer.First;
      while not (dataCustomer.Eof) do
      begin
        AddRow([dataCustomer.FieldByName('CUST_ID').AsString,
          dataCustomer.FieldByName('CUST_CODE').AsString,
          dataCustomer.FieldByName('CUST_NAME').AsString]);
        dataCustomer.Next;
      end;
    end
    else
    begin
      RowCount := 2;
      AddRow(['Id', 'Customer Code', 'Customer Name']);
      AddRow(['1', ' ', ' ']);
    end;

    FixedRows := 1;
    SizeGridToData;
    Text := '';
  end;
  }
end;

procedure TfrmInvoice.ParseDataInvoice;
var
  s: string;
begin
  if (edbAgreementNo.Text = '') then
     Exit;

  s := GetSQLLookUpInvoice;
//  with clookup('Daftar Schedule Invoice', s) do
//  begin
//    Try
//      if Strings[0] = '' then Exit;
//      ClearFormInvoiceDetail;
//      edbInvoiceSchedule.Text := Strings[1];
//      dtRecv.Date             := StrToDate(Strings[2]);
//      edtInvoiceNo.Text       := Strings[0];
//      FAgreementJadwalID      := StrToInt(Strings[3]);
//
//      ParseDataInvoiceDetil;
//      edtInvoiceDesc.Text     := 'Tagihan Ke - ' + Strings[1] + ' (' + IntToStr(PeriodeCnt) + ' ' + PeriodeName + ')';
//      edtStatusInvoice.Text   := StaproName;
//
//      ParseDataAgreementDetil;
//
//    Finally
//      Free;
//    End;
//  end;
end;

procedure TfrmInvoice.ParseDataInvoiceDetil;
var
  dPPN: Double;
  dSubTotal: Double;
  s: string;
  isPPH23: Boolean;
begin

//  s := GetDetailInvoiceByTermNo(StrToInt(edbInvoiceSchedule.Text), FAgreementID, MasterNewUnit.ID);
//  with copenquery(s) do
//  begin
//    Try
//      if not Eof then
//      begin
//        //curredtTotalSubTotal.Value := FieldByName('AGRJDWL_INV_TOTAL').AsCurrency;
//
//        if FieldByName('AGR_IS_PPH23').AsInteger = 0 then
//          isPPH23 := False
//        else
//          isPPH23 := True;
//
//        if FieldByName('AGR_IS_PPN').AsInteger = 0 then
//        begin
//          dSubTotal := FieldByName('AGRJDWL_INV_TOTAL').AsFloat;
//          dPPN      := 0;
//        end
//        else
//        begin
//          dSubTotal := (FieldByName('AGRJDWL_INV_TOTAL').AsFloat * 100) / (FieldByName('PJK_PPN').AsFloat + 100);
//          dPPN := FieldByName('AGRJDWL_INV_TOTAL').AsFloat - dSubTotal;
//        end;
//        curredtTotalSubTotal.Value := dSubTotal;
//        curredtTotalPPN.Value      := dPPN;
//
//        if isPPH23 then
//          curredtTotalPPH23.Value := (curredtTotalSubTotal.Value * 0.1) // Fix 10% dulu
//        else
//          curredtTotalPPH23.Value := 0;
//
//        curredtTotal.Value := curredtTotalSubTotal.Value + curredtTotalPPN.Value + curredtTotalPPH23.Value;
//
//        PeriodeName := FieldByName('PER_NAME').AsString;
//        PeriodeCnt  := FieldByName('AGR_PER_CNT').AsInteger;
//        StaproName  := FieldByName('STAPRO_NAME').AsString;
//        EndDate     := FieldByName('END_DATE').AsDateTime;
//      end;
//    Finally
//      Free;
//    End
//  end;

end;

procedure TfrmInvoice.SetPeriodeCnt(const Value: Integer);
begin
  FPeriodeCnt := Value;
end;

procedure TfrmInvoice.SetPeriodeName(const Value: string);
begin
  FPeriodeName := Value;
end;

procedure TfrmInvoice.SetStaproName(const Value: string);
begin
  FStaproName := Value;
end;

procedure TfrmInvoice.SetEndDate(const Value: TDateTime);
begin
  FEndDate := Value;
end;

procedure TfrmInvoice.ParseDataAgreementDetil;
var
  s: string;
  i: Integer;
begin
//  s := GetAgreementDetailByAgreementID(FAgreementID, MasterNewUnit.ID);
//  with copenquery(s) do
//  begin
//    Try
//      i := 0;
//      while not eof do
//      begin
//        Inc(i);
//        strgGrid.Cells[_KolProductCode, i]   := FieldByName('AGRD_PROJAS_CODE').AsString;
//        strgGrid.Cells[_KolDeskripsi, i]     := FieldByName('PROJAS_NAME').AsString;
//        strgGrid.Ints[_KolQTY, i]            := FieldByName('AGRD_QTY').AsInteger;
//        strgGrid.Cells[_KolUOM, i]           := FieldByName('PROJAS_SATNBD_CODE').AsString;
//        strgGrid.Floats[_KolTotal, i]        := FieldByName('AGRD_SUBTOTAL').AsFloat;
//        strgGrid.Cells[_KolUOMName, i]       := FieldByName('SATNBD_NAME').AsString;
//
//        Next;
//
//        if not Eof then strgGrid.AddRow;
//      end;
//      edtDescription.Text := GenerateDescription(1);
//      strgGrid.AutoSizeColumns(True, 5);
//      strgGrid.ColWidths[_KolUOMName] := 0;
//      strgGrid.ColWidths[_KolTotal] := 120;
//
//    Finally
//      Free;
//    End;
//  end;

end;

function TfrmInvoice.GenerateDescription(ARow: Integer): string;
begin
//  Result := strgGrid.Cells[2, ARow] + ' ' + strgGrid.Cells[5, ARow] + ' ' +
//            strgGrid.Cells[1, ARow] + ' (' + DateToStr(dtRecv.Date) + ' - ' +
//            DateToStr(EndDate) + ')';
end;

procedure TfrmInvoice.strgGridRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  edtDescription.Text := GenerateDescription(NewRow);
end;

procedure TfrmInvoice.SetParamList(const Value: TStringList);
begin
  FParamList := Value;
end;

procedure TfrmInvoice.FormCreate(Sender: TObject);
begin
  inherited;
  ParamList := TStringList.Create;
end;

procedure TfrmInvoice.strgGridGetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;     
  FloatFormat := '%.3n';
  if (ACol in [_KolQTY]) and (ARow > 0) then
    IsFloat := True
  else
  if (ACol in [_KolTotal]) and (ARow > 0) then
  begin
    FloatFormat := '%.2n';
    IsFloat := True;
  end
  else
    IsFloat := False;
//  FloatFormat := '%0.2n';
//  if ACol in [_KolTotal] then
//    IsFloat := True
//  else
//    IsFloat := False;
end;

procedure TfrmInvoice.FormShow(Sender: TObject);
begin
  inherited;
  ParseComboCustomer;
  ParseDataTahunAndPeriodeFiskal(GetPeriodJurnal);
  edbCustomerCode.Text := '';
  ClearForm;
end;

procedure TfrmInvoice.btnViewInvoiceClick(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogViewInvoice) then
    frmDialogViewInvoice := TfrmDialogViewInvoice.Create(Application);

  SetFormPropertyAndShowDialog(frmDialogViewInvoice);

  frmDialogViewInvoice.Free;
end;

procedure TfrmInvoice.edbCustomerCodeClickBtn(Sender: TObject);
begin
  inherited;
//  with cLookUp('Daftar Customer',
//       TNewCustomer.GetListCustomerByUnitIdSQL(MasterNewUnit.ID)) do
//  begin
//    try
//      if Strings[0] = '' then Exit;
//      ClearForm;
//      edbCustomerCode.Text := Strings[0];
//      edtCustomer.Text     := Strings[1];
//      edbSupplierCode.Text := '';
//      edtSuplier.Text      := '';
//      curredtTotalAgreement.Value := 0;
//      //ParseComboSuplierByCustomerCode(edbCustomerCode.Text);
//      //ParseDataAgreement;
//    finally
//      Free;
//    end;
//
//  end;

end;

procedure TfrmInvoice.edbCustomerCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

procedure TfrmInvoice.edbCustomerCodeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) then
  Begin
    edbCustomerCodeClickBtn(Sender);
  end
  Else if (Key = VK_Return) then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
  End;
end;

procedure TfrmInvoice.ClearForm;
begin
  edbSupplierCode.Clear;
  edtSuplier.Clear;
  edbCustomerCode.Clear;
  edtCustomer.Clear;
  
  ClearFormAgreement;
end;

procedure TfrmInvoice.ClearFormAgreement;
begin
  edbAgreementNo.Clear;
  curredtTotalAgreement.Clear;
  FAgreementID := 0;
  ClearFormInvoice;
end;

procedure TfrmInvoice.ClearFormInvoice;
begin
  edbInvoiceSchedule.Clear;
  FAgreementJadwalID := 0;
  ClearFormInvoiceDetail;
end;

procedure TfrmInvoice.ClearFormInvoiceDetail;
begin
  dtRecv.Clear;
  edtInvoiceNo.Clear;
  edtInvoiceDesc.Clear;
  edtStatusInvoice.Clear;
  
  curredtTotalSubTotal.Value := 0;
  curredtTotalPPN.Value      := 0;
  curredtTotalPPH23.Value    := 0;
  curredtTotal.Value         := 0;
  edtDescription.Clear;
  
//  ClearAdvStringGrid(strgGrid);
//  strgGrid.ColWidths[_KolUOMName] := 0;
end;

procedure TfrmInvoice.edbSupplierCodeClickBtn(Sender: TObject);
var
  s: string;
begin
  inherited;
//  s := GetListSuplierByCustomerCodeSQL(edbCustomerCode.Text);
//  with clookup('Daftar Supplier', s) do
//  begin
//    Try
//      if Strings[0] = '' then Exit;
//      ClearFormAgreement;
//      edbSupplierCode.Text := Strings[0];
//      edtSuplier.Text      := Strings[1];
//
//    Finally
//      Free;
//    End;
//  end;

end;

procedure TfrmInvoice.edbSupplierCodeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) then
  Begin
    edbSupplierCodeClickBtn(Sender);
  end
  Else if (Key = VK_Return) then
  Begin
    edbAgreementNo.SetFocus;  
  End;
end;

procedure TfrmInvoice.edbAgreementNoClickBtn(Sender: TObject);
var
  s: string;
begin
  inherited;
//  s := GetListAgreementBySuplierCode(edbCustomerCode.Text, MasterNewUnit.ID, edbSupplierCode.Text);
//  with clookup('Daftar Agreement', s) do
//  begin
//    Try
//      if Strings[0] = '' then Exit;
//
//      edbAgreementNo.Text         := Strings[0];
//      curredtTotalAgreement.Value := Round(StrToCurr(Strings[3]) + 0.49);
//      FAgreementID                := StrToInt(Strings[4]);
//      ClearFormInvoice;
//
//    Finally
//      Free;
//    End;
//  end;

end;

procedure TfrmInvoice.edbAgreementNoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F5 then
    edbAgreementNoClickBtn(Self)
  else if Key = VK_RETURN then
    edbInvoiceSchedule.SetFocus;
    
end;

procedure TfrmInvoice.edbInvoiceScheduleClickBtn(Sender: TObject);
begin
  inherited;
  ParseDataInvoice;
end;

procedure TfrmInvoice.edbInvoiceScheduleKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F5 then
    edbInvoiceScheduleClickBtn(Self)
  else if Key = VK_RETURN then
    dtRecv.SetFocus;
end;

procedure TfrmInvoice.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = Ord('P')) and (ssctrl in Shift) then
    actPrintExecute(Self);

end;

procedure TfrmInvoice.ParseDataTahunAndPeriodeFiskal(aDate : TDateTime);
var
  dtEndDate: TDateTime;
  dtStartDate: TDateTime;
begin
  // TODO -cMM: TfrmInvoice.ParseDataTahunAndPeriodeFiskal default body inserted

  //IsPeriodeFiskalOpen := IsPeriodeAkuntansiOpen(ADate, 1, Mastercompany.ID, FThFiskal, FPeriodeNo);
//  IsPeriodeFiskalAktif := IsStatusPeriodeAkuntansiAktif(ADate, Mastercompany.ID, FThFiskal, FPeriodeNo, dtStartDate, dtEndDate);
end;

function TfrmInvoice.SaveDataJurnal(aNoBukti : String; aUnitID : Integer;
    aNoInvoice : String; var aJournalNo : String): Boolean;
var
  sJurnalNo: string;
  sRekeningCredit: string;
  sRekeningDebet: string;
//  FMasterAgreement: TNewMasterAgreement;
//  FKodeJurnal: TNewRefKode_Jurnal;
//  FJurnal: TJurnal;
  dTotalCredit: Double;
  dTotalDebet: Double;
  dHasilCredit: Double;
  dHasilDebet: Double;
  i: Integer;
  dCredit: Double;
  dDebet: Double;
  FKodeJurnalID: Integer;
  aIDJurnal: Integer;
begin
  Result := False;
//  FJurnal := TJurnal.Create(nil);
//  FKodeJurnal := TNewRefKode_Jurnal.Create(nil);
//  FMasterAgreement := TNewMasterAgreement.Create(nil);
//
//  try
//    InisialisasiMemoryData(dmReportNew.jvMemData);
//
//    if not FKodeJurnal.LoadByKode(getGlobalVar('DEF_JURNAL_INVOICE_SEWA'), Mastercompany.ID) then
//    begin
//      raise Exception.Create('Kode GL Untuk Parameter Jurnal DEF_JURNAL_INVOICE_SEWA belum di Set Sama sekali, mohon lakukan setting dahulu terhadap KODE GL nya');
//    end;
//    FKodeJurnalID := FKodeJurnal.ID;
//
//    aIDJurnal := 0;
//    if FJurnal.LoadByNoRef(aNoInvoice, aUnitID, FMasterAgreement.GetHeaderFlag) then
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
//      sJurnalNo := FJurnal.GetJurnalNO(MasterNewUnit.ID, GetPeriodJurnal, FKodeJurnal.CODE);
//
//    aJournalNo := sJurnalNo;
//
//    if FMasterAgreement.LoadByNoBukti(aNoBukti, MasterNewUnit.ID) then
//    begin
//      SetRekeningPiutang(FAgreementJadwalID, aUnitID, sRekeningDebet, sRekeningCredit);
//
//      for i := 0 to FKodeJurnal.STANDARJURNALDETAILS.Count - 1 do
//      begin
//        dDebet := 0;
//        dCredit := 0;
//
//        if FKodeJurnal.STANDARJURNALDETAILS[i].FLAGRUMUS in [0, 1] then
//        begin
//          if UpperCase(FKodeJurnal.STANDARJURNALDETAILS[i].STDJD_TRANSACTION) = 'DEBET' then
//          begin
//            if sRekeningDebet <> FKodeJurnal.STANDARJURNALDETAILS[i].STDJD_REK.REK_CODE then
//              Continue;
//          end
//          else
//          begin
//            if sRekeningCredit <> FKodeJurnal.STANDARJURNALDETAILS[i].STDJD_REK.REK_CODE then
//              Continue;
//          end;
//        end;
//
//        if UpperCase(FKodeJurnal.STANDARJURNALDETAILS[i].STDJD_TRANSACTION) = 'DEBET' then
//          dDebet := FMasterAgreement.GenerateJurnalInvoice(FKodeJurnal.STANDARJURNALDETAILS[i].FLAGRUMUS, aNoInvoice, MasterNewUnit.ID)
//        else
//          dCredit := FMasterAgreement.GenerateJurnalInvoice(FKodeJurnal.STANDARJURNALDETAILS[i].FLAGRUMUS, aNoInvoice, MasterNewUnit.ID);
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
//    if IsDebetCreditBalance(dTotalDebet, dTotalCredit, dmReportNew.jvMemData) then
//    begin
//      FJurnal.UpdateData(FMasterAgreement.GetHeaderFlag,
//                         dTotalCredit,
//                         GetPeriodJurnal,
//                         dTotalDebet,
//                         edtInvoiceDesc.Text,
//                         IntToStr(FThFiskal),
//                         aIDJurnal,
//                         0,
//                         IntToStr(FPeriodeNo),
//                         0,
//                         aNoInvoice,
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
//                                       edtInvoiceDesc.Text,
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
//       CommonDlg.ShowError('Jurnal Belum Balance Untuk Invoice Ini');
//       Exit;
//     end;
//
//     Result := FJurnal.ExecuteGenerateSQL;
//
//  finally
//    if FJurnal <> nil then FreeAndNil(FJurnal);
//    if FKodeJurnal <> nil then FreeAndNil(FKodeJurnal);
//    if FMasterAgreement <> nil then FreeAndNil(FMasterAgreement);
//  end;
end;

procedure TfrmInvoice.SetRekeningPiutang(aID : Integer; aUnitID : Integer; var
    aKodeRekDebet : String; var aKodeRekCredit : String);
var
  S: string;
begin
  // TODO -cMM: TfrmInvoice.SetRekeningPiutang default body inserted
  aKodeRekDebet  := '';
  aKodeRekCredit := '';

  S := 'SELECT e.TPPRO_REK_DEBET, e.TPPRO_REK_CREDIT'
        + ' FROM AGREEMENT_JADWAL a LEFT JOIN AGREEMENT b ON b.AGR_ID = a.AGRJDWL_AGR_ID'
        + ' AND b.AGR_UNT_ID = a.AGRJDWL_AGR_UNT_ID'
        + ' LEFT JOIN AGREEMENT_DETIL c ON c.AGRD_AGR_ID  = b.AGR_ID'
        + ' AND c.AGRD_AGR_UNT_ID = b.AGR_UNT_ID'
        + ' LEFT JOIN PRODUK_JASA d ON d.PROJAS_CODE = c.AGRD_PROJAS_CODE'
        + ' AND d.PROJAS_UNT_ID = c.AGRD_PROJAS_UNT_ID'
        + ' LEFT JOIN REF$TIPE_PRODUK e ON e.TPPRO_ID = d.PROJAS_TPPRO_ID'
        + ' AND e.TPPRO_UNT_ID = d.PROJAS_TPPRO_UNT_ID'
        + ' WHERE a.AGRJDWL_ID = ' + IntToStr(aID)
        + ' AND a.AGRJDWL_UNT_ID = ' + IntToStr(aUnitID);
//  with copenquery(s) do
//  begin
//    Try
//      if not eof then
//      begin
//        aKodeRekDebet := FieldByName('TPPRO_REK_DEBET').AsString;
//        aKodeRekCredit := FieldByName('TPPRO_REK_CREDIT').AsString;
//
//      end;
//
//    Finally
//      Free;
//    End
//  end;
end;

procedure TfrmInvoice.SetResult(const Value: Boolean);
begin
  FResult := Value;
end;

procedure TfrmInvoice.SetIsPeriodeFiskalAktif(const Value: Boolean);
begin
  FIsPeriodeFiskalAktif := Value;
end;

procedure TfrmInvoice.actRefreshExecute(Sender: TObject);
begin
  inherited;
  if (Mastercompany.ID = 0) then
  begin
    CommonDlg.ShowError(ER_UNIT_OR_COMPANY_NOT_SPECIFIC);
    ////frmMain.cbbCompCode.SetFocus;
    Exit;
  end;

//  if (MasterNewUnit.ID = 0) then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    Exit;
  end;

  ParseComboCustomer;
end;

function TfrmInvoice.GetPeriodJurnal: TDateTime;
begin
  // TODO -cMM: TfrmInvoice.GetPeriodJurnal default body inserted
  Result := dtRecv.Date;
end;

function TfrmInvoice.GetSQLLookUpInvoice: string;
begin
  // TODO -cMM: TfrmInvoice.GetSQLLookUpInvoice default body inserted
//  Result := GetListInvoiceByAgreementID(FAgreementID, MasterNewUnit.ID, 1);;
end;

end.

