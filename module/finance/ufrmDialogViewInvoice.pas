unit ufrmDialogViewInvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, StdCtrls, ufraFooterDialog2Button, ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxCurrencyEdit, System.Actions, Vcl.ActnList, ufraFooterDialog3Button,
  Vcl.Menus, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxButtons;

type
  TfrmDialogViewInvoice = class(TfrmMasterDialog)
    pnl1: TPanel;
    pnl2: TPanel;
    lbl1: TLabel;
    edtInvoiceNo: TEdit;
    lbl2: TLabel;
    edtCustomer: TEdit;
    btnSearch: TcxButton;
    lbl3: TLabel;
    edtAgreementNo: TEdit;
    lbl4: TLabel;
    curredtTotalAgreement: TcxCurrencyEdit;
    lbl5: TLabel;
    edtNoJadwal: TEdit;
    lbl6: TLabel;
    edtInvoiceDate: TEdit;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    curredtTotal: TcxCurrencyEdit;
    curredtTotalPPH23: TcxCurrencyEdit;
    curredtTotalPPN: TcxCurrencyEdit;
    curredtTotalSubTotal: TcxCurrencyEdit;
    lbl8: TLabel;
    edtStatus: TEdit;
    lbl9: TLabel;
    edtDescription: TEdit;
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    cxcolCode: TcxGridDBColumn;
    cxcolDescription: TcxGridDBColumn;
    cxcolQTY: TcxGridDBColumn;
    cxlvMaster: TcxGridLevel;
    cxcolUOM: TcxGridDBColumn;
    cxcolTotal: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure edtInvoiceNoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSearchClick(Sender: TObject);
  private
    FAgreementId: string;
    FAgreementJadwalId: string;
//    function GetSQLUpDown(aKey: Word; aAgrJdlID: string): string;
    procedure ParseDataHeader;
    procedure ParseDataHeaderUpDown(Key: Word);
    procedure ParseDataAgreementDetil;
  public
    property AgreementId: string read FAgreementId write FAgreementId;
    property AgreementJadwalId: string read FAgreementJadwalId write FAgreementJadwalId;
  end;

var
  frmDialogViewInvoice: TfrmDialogViewInvoice;

implementation
{$R *.dfm}

uses
  uRetnoUnit;



procedure TfrmDialogViewInvoice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogViewInvoice.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogViewInvoice := nil;
end;

procedure TfrmDialogViewInvoice.ParseDataHeader;
var
//  isPPH23: Boolean;
  s: string;
begin
  s:= 'SELECT CUST.CUST_CODE || '' | '' || CUST.CUST_NAME AS CUST_NAME,'
    + ' A.AGR_NO, SUM(AD.AGRD_TOTAL) AS TOTAL_AGREEMENT,'
    + ' AJ.AGRJDWL_INV_TERM_NO, AJ.AGRJDWL_INV_DATE,'
    + ' AJ.AGRJDWL_INV_DESCRIPTION, A.AGR_IS_PPH23, AJ.AGRJDWL_ID,'
    + ' P.PJK_PPN, SP.STAPRO_NAME, A.AGR_ID, AJ.AGRJDWL_INV_TOTAL FROM AGREEMENT_JADWAL AJ'
    + ' LEFT JOIN AGREEMENT A ON A.AGR_ID = AJ.AGRJDWL_AGR_ID'
    + '     AND A.AGR_UNT_ID = AJ.AGRJDWL_AGR_UNT_ID'
    + ' LEFT JOIN AGREEMENT_DETIL AD ON AD.AGRD_AGR_ID = A.AGR_ID'
    + '     AND AD.AGRD_AGR_UNT_ID = A.AGR_UNT_ID'
    + ' LEFT JOIN CUSTOMER CUST ON CUST.CUST_CODE = A.AGR_CUST_CODE'
    + '     AND CUST.CUST_UNT_ID = A.AGR_CUST_UNT_ID'
    + ' LEFT JOIN REF$PAJAK P ON P.PJK_ID = A.AGR_PJK_ID'
    + '     AND P.PJK_UNT_ID = A.AGR_PJK_UNT_ID'
    + ' LEFT JOIN REF$STATUS_PROSES SP ON SP.STAPRO_ID = AJ.AGRJDWL_STAPRO_ID_INV'
    + '     AND SP.STAPRO_UNT_ID = AJ.AGRJDWL_STAPRO_UNT_ID_INV'
    + ' WHERE AJ.AGRJDWL_INV_NO = '+ QuotedStr(edtInvoiceNo.Text)
    + ' AND AJ.AGRJDWL_UNT_ID = '+ IntToStr(DialogUnit)
    + ' GROUP BY A.AGR_ID, A.AGR_NO, CUST.CUST_CODE, CUST.CUST_NAME,'
    + ' AJ.AGRJDWL_INV_TERM_NO, AJ.AGRJDWL_INV_DATE,'
    + ' AJ.AGRJDWL_INV_DESCRIPTION, A.AGR_IS_PPH23, AJ.AGRJDWL_ID,'
    + ' P.PJK_PPN, SP.STAPRO_NAME, AJ.AGRJDWL_INV_TOTAL ';

//  with cOpenQuery(s) do
//  begin
//    try
//      if not IsEmpty then
//      begin
//        edtCustomer.Text            := fieldbyname('CUST_NAME').AsString;
//        edtAgreementNo.Text         := fieldbyname('AGR_NO').AsString;
//        edtNoJadwal.Text            := fieldbyname('AGRJDWL_INV_TERM_NO').AsString;
//        edtInvoiceDate.Text         := fieldbyname('AGRJDWL_INV_DATE').AsString;
//        edtStatus.Text              := fieldbyname('STAPRO_NAME').AsString;
//        edtDescription.Text         := fieldbyname('AGRJDWL_INV_DESCRIPTION').AsString;
//        curredtTotalAgreement.Value := fieldbyname('TOTAL_AGREEMENT').AsCurrency;
//        curredtTotalSubTotal.Value  := fieldbyname('AGRJDWL_INV_TOTAL').AsCurrency;
//
//        if FieldByName('AGR_IS_PPH23').AsInteger = 0 then
//          isPPH23 := False
//        else
//          isPPH23 := True;
//
//        curredtTotalPPN.Value := (curredtTotalSubTotal.Value * FieldByName('PJK_PPN').AsCurrency) / 100;
//
//        if isPPH23 then
//          curredtTotalPPH23.Value := curredtTotalPPN.Value
//        else
//          curredtTotalPPH23.Value := 0;
//
//        curredtTotal.Value := curredtTotalSubTotal.Value + curredtTotalPPN.Value - curredtTotalPPH23.Value;
//        AgreementId := fieldbyname('AGR_ID').AsString;
//        AgreementJadwalId := fieldbyname('AGRJDWL_ID').AsString;
//
//      end
//      else
//      begin
//        edtCustomer.Clear;
//        edtAgreementNo.Clear;
//        edtNoJadwal.Clear;
//        edtInvoiceDate.Clear;
//        edtStatus.Clear;
//        edtDescription.Clear;
//        curredtTotalAgreement.Value := 0;
//        curredtTotalSubTotal.Value := 0;
//        curredtTotalPPN.Value := 0;
//        curredtTotalPPH23.Value := 0;
//        curredtTotal.Value := 0;
//      end;
//
//    finally
//      Free;
//    end;
//  end;
end;

procedure TfrmDialogViewInvoice.edtInvoiceNoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F5 then
    btnSearchClick(Self);

  if Key = VK_RETURN then
  begin
    ParseDataHeader;
    ParseDataAgreementDetil;
  end;

  if (Key = VK_PRIOR) or (Key = VK_NEXT) then
  begin
    ParseDataHeaderUpDown(Key);
    ParseDataAgreementDetil;
  end;   
end;

procedure TfrmDialogViewInvoice.ParseDataHeaderUpDown(Key: Word);
//var
//  isPPH23: Boolean;
begin

//  with cOpenQuery(GetSQLUpDown(Key, AgreementJadwalId)) do
//  begin
//    try
//      if not IsEmpty then
//      begin
//        edtInvoiceNo.Text := fieldbyname('AGRJDWL_INV_NO').AsString;
//        edtCustomer.Text := fieldbyname('CUST_NAME').AsString;
//        edtAgreementNo.Text := fieldbyname('AGR_NO').AsString;
//        edtNoJadwal.Text := fieldbyname('AGRJDWL_INV_TERM_NO').AsString;
//        edtInvoiceDate.Text := fieldbyname('AGRJDWL_INV_DATE').AsString;
//        edtStatus.Text := fieldbyname('STAPRO_NAME').AsString;
//        edtDescription.Text := fieldbyname('AGRJDWL_INV_DESCRIPTION').AsString;
//        curredtTotalAgreement.Value := fieldbyname('TOTAL_AGREEMENT').AsCurrency;
//        curredtTotalSubTotal.Value := fieldbyname('AGRJDWL_INV_TOTAL').AsCurrency;
//
//        if FieldByName('AGR_IS_PPH23').AsInteger = 0 then
//          isPPH23 := False
//        else
//          isPPH23 := True;
//
//        curredtTotalPPN.Value := (curredtTotalSubTotal.Value * FieldByName('PJK_PPN').AsCurrency) / 100;
//
//        if isPPH23 then
//          curredtTotalPPH23.Value := curredtTotalPPN.Value
//        else
//          curredtTotalPPH23.Value := 0;
//
//        curredtTotal.Value := curredtTotalSubTotal.Value + curredtTotalPPN.Value - curredtTotalPPH23.Value;
//        AgreementId := fieldbyname('AGR_ID').AsString;
//        AgreementJadwalId := fieldbyname('AGRJDWL_ID').AsString;
//      end
//      else
//      begin
//        edtInvoiceNo.Clear;
//        edtCustomer.Clear;
//        edtAgreementNo.Clear;
//        edtNoJadwal.Clear;
//        edtInvoiceDate.Clear;
//        edtStatus.Clear;
//        edtDescription.Clear;
//        curredtTotalAgreement.Value := 0;
//        curredtTotalSubTotal.Value := 0;
//        curredtTotalPPN.Value := 0;
//        curredtTotalPPH23.Value := 0;
//        curredtTotal.Value := 0;
//      end;
//
//    finally
//      Free;
//    end;
//  end;
end;

procedure TfrmDialogViewInvoice.ParseDataAgreementDetil;
var
//  i: Integer;
  s: string;
begin
  s:= 'SELECT AGRD.AGRD_PROJAS_CODE, PROJAS.PROJAS_NAME, AGRD.AGRD_QTY,'
    + ' PROJAS.PROJAS_SATNBD_CODE, SATNBD.SATNBD_NAME,'
    + ' AGRD.AGRD_QTY * AGRD.AGRD_SUBTOTAL AS AGRD_SUBTOTAL'
    + ' FROM AGREEMENT_DETIL AGRD'
    + ' LEFT JOIN AGREEMENT AGR ON AGR.AGR_ID = AGRD.AGRD_AGR_ID'
    + '     AND AGR.AGR_UNT_ID = AGRD.AGRD_AGR_UNT_ID'
    + ' LEFT JOIN PRODUK_JASA PROJAS ON PROJAS.PROJAS_CODE = AGRD.AGRD_PROJAS_CODE'
    + '     AND PROJAS.PROJAS_UNT_ID = AGRD.AGRD_PROJAS_UNT_ID'
    + ' LEFT JOIN REF$SATUAN_NBD SATNBD ON SATNBD.SATNBD_CODE = PROJAS.PROJAS_SATNBD_CODE'
    + '     AND SATNBD.SATNBD_UNT_ID = PROJAS.PROJAS_SATNBD_UNT_ID'
    + ' WHERE AGRD.AGRD_AGR_ID = '+ QuotedStr(AgreementId)
    + ' AND AGRD.AGRD_UNT_ID = '+ IntToStr(DialogUnit);

//  with strgGrid do
//  begin
//    with cOpenQuery(s, False) do
//    begin
//      try
//        if not IsEmpty then
//        begin
//          Last;
//          strgGrid.RowCount := RecordCount + 1;
//
//          i := 1;
//          First;
//          while not Eof do
//          begin
//            Cells[0, i] := FieldByName('AGRD_PROJAS_CODE').AsString;
//            Cells[1, i] := FieldByName('AGRD_QTY').AsString
//                          + ' ' + FieldByName('SATNBD_NAME').AsString
//                          + ' ' + FieldByName('PROJAS_NAME').AsString;
//            Cells[2, i] := FieldByName('AGRD_QTY').AsString;
//            Cells[3, i] := FieldByName('PROJAS_SATNBD_CODE').AsString;
//            Cells[4, i] := FieldByName('AGRD_SUBTOTAL').AsString;
//            Alignments[4, i] := taRightJustify;
//            Cells[5, i] := FieldByName('SATNBD_NAME').AsString;
//
//            Inc(i);
//            Next;
//          end;
//        end
//        else
//        begin
//          RowCount := 2;
//          Cells[0, 1] := '';
//          Cells[1, 1] := '';
//          Cells[2, 1] := '';
//          Cells[3, 1] := '';
//          Cells[4, 1] := '';
//          Cells[5, 1] := '';
//        end;
//
//      finally
//        Free;
//      end;
//    end;
//
//    AutoSize := True;
//    FixedRows := 1;
//  end;
end;

procedure TfrmDialogViewInvoice.btnSearchClick(Sender: TObject);
begin
  inherited;
//  if not Assigned(frmDialogSearchInvoice) then
//    frmDialogSearchInvoice := TfrmDialogSearchInvoice.Create(Application);
//
//  frmDialogSearchInvoice.DialogCompany := DialogCompany;
//  frmDialogSearchInvoice.DialogUnit := DialogUnit;
//
//  frmDialogSearchInvoice.ShowModal;
//  edtInvoiceNo.Text := frmDialogSearchInvoice.InvoiceNo;
//  edtInvoiceNo.SetFocus;
//
//  frmDialogSearchInvoice.Free;
end;

//function TfrmDialogViewInvoice.GetSQLUpDown(aKey: Word; aAgrJdlID: string):
//    string;
//var
//  s: string;
//  sOrder: string;
//begin
//  s:= 'SELECT AJ.AGRJDWL_INV_NO, CUST.CUST_CODE || '' | '' || CUST.CUST_NAME AS CUST_NAME,'
//    + ' A.AGR_NO, SUM(AD.AGRD_TOTAL) AS TOTAL_AGREEMENT,'
//    + ' AJ.AGRJDWL_INV_TERM_NO, AJ.AGRJDWL_INV_DATE,'
//    + ' AJ.AGRJDWL_INV_DESCRIPTION, A.AGR_IS_PPH23, AJ.AGRJDWL_ID,'
//    + ' P.PJK_PPN, SP.STAPRO_NAME, A.AGR_ID, AJ.AGRJDWL_INV_TOTAL FROM AGREEMENT_JADWAL AJ'
//    + ' LEFT JOIN AGREEMENT A ON A.AGR_ID = AJ.AGRJDWL_AGR_ID'
//    + '     AND A.AGR_UNT_ID = AJ.AGRJDWL_AGR_UNT_ID'
//    + ' LEFT JOIN AGREEMENT_DETIL AD ON AD.AGRD_AGR_ID = A.AGR_ID'
//    + '     AND AD.AGRD_AGR_UNT_ID = A.AGR_UNT_ID'
//    + ' LEFT JOIN CUSTOMER CUST ON CUST.CUST_CODE = A.AGR_CUST_CODE'
//    + '     AND CUST.CUST_UNT_ID = A.AGR_CUST_UNT_ID'
//    + ' LEFT JOIN REF$PAJAK P ON P.PJK_ID = A.AGR_PJK_ID'
//    + '     AND P.PJK_UNT_ID = A.AGR_PJK_UNT_ID'
//    + ' LEFT JOIN REF$STATUS_PROSES SP ON SP.STAPRO_ID = AJ.AGRJDWL_STAPRO_ID_INV'
//    + '     AND SP.STAPRO_UNT_ID = AJ.AGRJDWL_STAPRO_UNT_ID_INV';
//
//  if aKey = VK_PRIOR then
//  begin
//    s:= s
//      + ' WHERE AJ.AGRJDWL_ID < '+ aAgrJdlID;
//
//    sOrder:= ' ORDER BY AJ.AGRJDWL_ID DESC ROWS 1 TO 1 ';
//  end
//  else if aKey = VK_NEXT then
//  begin
//    s:= s
//      + ' WHERE AJ.AGRJDWL_ID > '+ aAgrJdlID;
//
//    sOrder:=  'ORDER BY AJ.AGRJDWL_ID ASC ROWS 1 TO 1 ';
//  end;
//
//  Result:= s
//          + ' AND AJ.AGRJDWL_UNT_ID = '+ IntToStr(DialogUnit)
//          + ' GROUP BY A.AGR_ID, A.AGR_NO, CUST.CUST_CODE, CUST.CUST_NAME,'
//          + ' AJ.AGRJDWL_INV_TERM_NO, AJ.AGRJDWL_INV_DATE,'
//          + ' AJ.AGRJDWL_INV_DESCRIPTION, A.AGR_IS_PPH23, AJ.AGRJDWL_ID,'
//          + ' P.PJK_PPN, SP.STAPRO_NAME, AJ.AGRJDWL_INV_NO, AJ.AGRJDWL_INV_TOTAL'
//          + sOrder;
//end;

end.
