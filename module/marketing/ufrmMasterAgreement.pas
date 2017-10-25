unit ufrmMasterAgreement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls, Mask,
  ActnList, uConstanta, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Vcl.Menus, cxControls, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxPC,
  System.Actions, cxCurrencyEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxButtons, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmMasterAgreement = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    pnl1: TPanel;
    lblInput: TLabel;
    edtSupName: TEdit;
    btnShow: TcxButton;
    actlst1: TActionList;
    actAddMasterAgreement: TAction;
    actEditMasterAgreement: TAction;
    actDeleteMasterAgreement: TAction;
    actRefreshMasterAgreement: TAction;
    pnl2: TPanel;
    lbl5: TLabel;
    edtUnitPrice: TEdit;
    lbl2: TLabel;
    lblPeriode2: TLabel;
    lblComboGrid: TLabel;
    edtCustName: TEdit;
    lbl9: TLabel;
    edtNoAgreement: TEdit;
    lbl3: TLabel;
    dtStart: TcxDateEdit;
    dtEnd: TcxDateEdit;
    lbl10: TLabel;
    lbl7: TLabel;
    edtPPH: TEdit;
    lbl8: TLabel;
    edtDesc: TEdit;
    lbl1: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    edtPPN: TEdit;
    edtPKP: TEdit;
    lblPeriode1: TLabel;
    lbl13: TLabel;
    lblF5: TLinkLabel;
    btnEditSchedule: TcxButton;
    actEditScheduleMasterAgreement: TAction;
    intedtInvoice: TcxCurrencyEdit;
    intedtPeriode: TcxCurrencyEdit;
    curredtTotal: TcxCurrencyEdit;
    pcMasterAgreement: TcxPageControl;
    tsKontrak: TcxTabSheet;
    tsJadwalInvoice: TcxTabSheet;
    tsJadwalAccrual: TcxTabSheet;
    cxGrid: TcxGrid;
    grdGridView: TcxGridDBTableView;
    cxcolGridViewColumn1: TcxGridDBColumn;
    cxcolGridViewColumn2: TcxGridDBColumn;
    cxcolGridViewColumn3: TcxGridDBColumn;
    cxcolGridViewColumn4: TcxGridDBColumn;
    cxcolGridViewColumn5: TcxGridDBColumn;
    grdlvlMaster: TcxGridLevel;
    cxgrd1: TcxGrid;
    grdInvoice: TcxGridDBTableView;
    cxcol1: TcxGridDBColumn;
    cxcol2: TcxGridDBColumn;
    cxcol3: TcxGridDBColumn;
    cxcol4: TcxGridDBColumn;
    cxcol5: TcxGridDBColumn;
    cxcol6: TcxGridDBColumn;
    cxcol7: TcxGridDBColumn;
    grdlvlMaster1: TcxGridLevel;
    cxgrd2: TcxGrid;
    grdAccrual: TcxGridDBTableView;
    cxcol8: TcxGridDBColumn;
    cxcol9: TcxGridDBColumn;
    cxcol10: TcxGridDBColumn;
    cxcol11: TcxGridDBColumn;
    cxcol12: TcxGridDBColumn;
    cxcol13: TcxGridDBColumn;
    grdlvlMaster2: TcxGridLevel;
    cbCustCode: TcxLookupComboBox;
    cbSupCode: TcxLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actAddMasterAgreementExecute(Sender: TObject);
    procedure actEditMasterAgreementExecute(Sender: TObject);
    procedure actDeleteMasterAgreementExecute(Sender: TObject);
    procedure actRefreshMasterAgreementExecute(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnShowClick(Sender: TObject);
    procedure cbpSupCodeCloseUp(Sender: TObject);
    procedure cbpSupCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tsJadwalInvoiceShow(Sender: TObject);
    procedure tsKontrakShow(Sender: TObject);
    procedure actEditScheduleMasterAgreementExecute(Sender: TObject);
    procedure tsJadwalAccrualShow(Sender: TObject);
    procedure lblF5Click(Sender: TObject);
    procedure fraFooter5Button1btnCloseClick(Sender: TObject);
    procedure strgGrid1GetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure strgGrid2GetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure strgGrid3GetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure edtNoAgreementKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbpCustCodeChange(Sender: TObject);
    procedure cbpCustCodeCloseUp(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    //dataMasterAgreement,dataDetilAgreement,dataJadwalAgreement: TResultDataSet;
    tempCustCode,tempSupCode, tempNoAgreement, tempPerName : string;
    AgreementID: Integer;
    tempTotal,tempTotalInv,tempTotalAccr: Currency;
    canEdit: string;
    FPajakId: string;
    FPajakName: string;
    FDayScale: Real;
    FPeriodeId: Integer;

    procedure ParseHeaderGrid(jmlData: Integer);
    procedure ParseDataGrid(isShowMessage: Boolean=True);
    procedure ParseHeaderGridJadwal(jmlData: Integer);
    procedure ParseDataGridJadwal();
    procedure prepareAdd();
    procedure prepareEdit();
    procedure LoadDropDownData(ACombo: TcxLookupComboBox; aSQL: string);
    procedure clearView(isCustClear: Boolean=True);
    procedure SetPajakId(const Value: string);
    procedure SetPajakName(const Value: string);
    procedure SetDayScale(const Value: Real);
    procedure SetPeriodeId(const Value: Integer);

  public
    { Public declarations }
    property PajakId: string read FPajakId write SetPajakId;
    property PajakName: string read FPajakName write SetPajakName;
    property DayScale: Real read FDayScale write SetDayScale;
    property PeriodeId: Integer read FPeriodeId write SetPeriodeId;
  end;

var
  frmMasterAgreement: TfrmMasterAgreement;

implementation

uses ufrmDialogMasterAgreement, uTSCommonDlg, ufrmPopupSelectCustomer,
  ufrmDialogScheduleAgreement, uRetnoUnit;

const
     _Kol1ProductCode          : byte = 0;
     _Kol1ProductDesc          : byte = 1;
     _Kol1QTYORDER             : byte = 2;
     _Kol1TOTALAMOUNT          : byte = 3;
     _Kol1PROJAS_PRICE         : byte = 4;
     _Kol1ID_AGREEMENT         : byte = 5;
     _Kol1ID_DETIL_AGREEMENT   : byte = 6;
     _Kol1PRICE_PPN            : byte = 7;
     _Kol1DETIL_SUBTOTAL       : byte = 8;

     _Kol2No                   : byte = 0;
     _Kol2INVOICE_DATE         : byte = 1;
     _Kol2INVOICE_TERM         : byte = 2;
     _Kol2INVOICE_NO           : byte = 3;
     _Kol2INVOICE_DUEDATE      : byte = 4;
     _Kol2STATUS               : byte = 5;
     _Kol2TOTAL_INVOICE        : byte = 6;
     _Kol2ID_JDWL_AGREEMENT    : byte = 7;
     _Kol2DESC_INVOICE         : byte = 8;
     _Kol2INVOICE_DATE_ID      : byte = 9;
     _Kol2INVOICE_DUEDATE_ASAL : byte = 10;
     _Kol2IS_PRINTED           : byte = 11;

     _Kol3No                   : byte = 0;
     _Kol3ACCRUAL_DATE         : byte = 1;
     _Kol3PERIODE              : byte = 2;
     _Kol3ACRRUAL_NO           : byte = 3;
     _Kol3STATUS               : byte = 4;
     _Kol3TOTALACCRUAL         : byte = 5;
     _Kol3ID_JDWL_AGREEMENT    : byte = 6;
     _Kol3DESC_ACRRUAL         : byte = 7;
     _Kol3ACCRUAL_DATE_ASAL    : byte = 8;

//punya si unit: ufrmDialogMasterAgreement
     _KolCODE                  : byte = 0;
     _KolDESCRIPTION           : byte = 1;
     _KolPRICE_PPN             : byte = 2;
     _KolQTY_ORDER             : byte = 3;
     _KolPROJAS_PRICE          : byte = 4;
     _KolSUB_TOTAL             : byte = 5;
     _KolTOTAL_AMOUNT          : byte = 6;
     _KolPER_DAYS              : byte = 7;
     _KolPJK_PPN               : byte = 8;
     _KolID_AGREEMENT          : byte = 9;
     _KolID_DETIL_AGREEMENT    : byte = 10;

{$R *.dfm}

procedure TfrmMasterAgreement.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmMasterAgreement.FormDestroy(Sender: TObject);
begin
  inherited;
  frmMasterAgreement := nil;
end;

procedure TfrmMasterAgreement.clearView(isCustClear: Boolean=True);
begin
  if isCustClear then
  begin
      cbCustCode.Text := '';
      edtCustName.Text := '';
      cbSupCode.Text  := '';
      edtSupName.Text  := '';
  end;
  edtNoAgreement.Text  := '';
  dtStart.Date         := Now;
  dtEnd.Date           := Now;
  intedtPeriode.Value  := 0;
  intedtInvoice.Value  := 0;
  edtPKP.Text          := '';
  edtPPN.Text          := '';
  edtPPH.Text          := '';
  edtDesc.Text         := '';
  edtUnitPrice.Text    := '0';
  curredtTotal.Value   := 0;

  cbCustCode.SetFocus;
  canEdit              := 'no';
end;

procedure TfrmMasterAgreement.FormShow(Sender: TObject);
begin
  inherited;

  lblHeader.Caption   := 'List Master Agreement';

//  LoadDropDownData(cbCustCode, GetListCustomerByUnitId(MasterNewUnit.ID));

//  LoadDropDownData(cbSupCode, GetListSuplierByUnitId(MasterNewUnit.ID, 'A%'));

  canEdit := 'no';
end;

procedure TfrmMasterAgreement.actAddMasterAgreementExecute(
  Sender: TObject);
begin
//  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    Exit;
  end;

  prepareAdd();

  if (frmDialogMasterAgreement.IsProcessSuccessfull) then
  begin
    // put your code here
    // ...

    edtNoAgreement.Text := frmDialogMasterAgreement.edtNoAgreement.Text;
    cbCustCode.Text    := frmDialogMasterAgreement.cbCustCode.Text;
    cbSupCode.Text     := frmDialogMasterAgreement.cbSupCode.Text;
    edtCustName.Text    := frmDialogMasterAgreement.edtCustName.Text;
    edtSupName.Text     := frmDialogMasterAgreement.edtSupName.Text;
    tempCustCode        := frmDialogMasterAgreement.cbCustCode.Text;
    tempSupCode         := frmDialogMasterAgreement.cbSupCode.Text;
    CommonDlg.ShowConfirm(atAdd);
    ParseDataGrid(False);
    cbSupCode.Text     := tempSupCode;
    //actRefreshMasterAgreementExecute(Self);
    frmDialogMasterAgreement.Free;
  end;
end;

procedure TfrmMasterAgreement.actEditMasterAgreementExecute(
  Sender: TObject);
var
  s: string;
begin
  if canEdit = 'no' then
  begin
    CommonDlg.ShowError('Please Select Proper Data !');
    cbCustCode.SetFocus;
    Exit;
  end;
//  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    Exit;
  end;

//  s := GetListInvoiceByPrinted(AgreementID, MasterNewUnit.ID, 0); //=ufrmInvoice :188
//  with cOpenQuery(s) do
//  try
//    while not Eof do
//    begin
//      if FieldByName('AGRJDWL_INV_IS_PRINTED').AsInteger = 1 then
//      begin
//        CommonDlg.ShowError('Data Agreement tidak bisa dirubah, karena sudah dicetak.');
//        edtNoAgreement.SetFocus;
//        Exit;
//      end;
//
//      if FieldByName('AGRJDWL_ACCRU_NO').AsString <> '' then
//      begin
//        CommonDlg.ShowError('Data Agreement tidak bisa dirubah, karena sudah ada proses accrual..');
//        edtNoAgreement.SetFocus;
//        Exit;
//      end;
//
//     Next;
//    End;
//  finally
//     Free;
//  end;

  ParseDataGridJadwal();
  curredtTotal.Value      := tempTotalInv;
  prepareEdit();

  if (frmDialogMasterAgreement.IsProcessSuccessfull) then
  begin
    // put your code here
    // ...
//    cCommitTrans;
    actRefreshMasterAgreementExecute(Self);
    CommonDlg.ShowConfirm(atEdit);
  end
  else
//    cRollbackTrans;

  frmDialogMasterAgreement.Free;
end;

procedure TfrmMasterAgreement.actDeleteMasterAgreementExecute(
  Sender: TObject);
var
  s: string;
begin
  if canEdit = 'no' then
  begin
    Exit;
  end;
  
//  s := GetListInvoiceByPrinted(AgreementID, MasterNewUnit.ID, 0); //=ufrmInvoice :188
//  with cOpenQuery(s) do
//  try
//    while not Eof do
//    begin
//      if FieldByName('AGRJDWL_INV_IS_PRINTED').AsInteger = 1 then
//      begin
//        CommonDlg.ShowError('Data Agreement tidak bisa dihapus, karena sudah dicetak.');
//        edtNoAgreement.SetFocus;
//        Exit;
//      end;
//
//      if FieldByName('AGRJDWL_ACCRU_NO').AsString <> '' then
//      begin
//        CommonDlg.ShowError('Data Agreement tidak bisa dihapus, karena sudah ada proses accrual..');
//        edtNoAgreement.SetFocus;
//        Exit;
//      end;
//
//     Next;
//    End;
//  finally
//     Free;
//  end;

  if (CommonDlg.Confirm('Are you sure you wish to delete Master Agreement (Agreement No.: '+ edtNoAgreement.Text +')?') = mrYes) then
  begin
    // put your code here
    // ...
//    if MasterAgreement.DeleteDataMasterAgreement(AgreementID) then
//    if AgreementID>0 then
//       FNewMasterAgreement.LoadByID(AgreementID, MasterNewUnit.ID)
//    else begin
//              CommonDlg.ShowErrorEmpty('No Data is Selected');
//         end;
//    if FNewMasterAgreement.RemoveFromDB then
//    begin
//      clearView;
//      cClearGrid(strgGrid1,False);
//      cClearGrid(strgGrid2,False);
//      cClearGrid(strgGrid3,False);
//
//      //actRefreshMasterAgreementExecute(Self);
//      CommonDlg.ShowConfirm(atDelete);
//    end;
  end;
end;

procedure TfrmMasterAgreement.actRefreshMasterAgreementExecute(
  Sender: TObject);
begin
  inherited;
  ParseDataGrid();
end;

//=========================

procedure TfrmMasterAgreement.ParseDataGrid(isShowMessage: Boolean=True);
var intI: Integer;
    tempBool: Boolean;
begin
  //init
  tempTotal := 0;
  AgreementID := 0;

//  if FNewMasterAgreement.LoadByCustCodeAndNoBukti(tempCustCode,tempSupCode,edtNoAgreement.Text, MasterNewUnit.ID) then
//  begin
//    dtStart.Date        := FNewMasterAgreement.Date_Start;
//    dtEnd.Date          := FNewMasterAgreement.Date_End;
//    intedtPeriode.Value := FNewMasterAgreement.Per_CNT;
//    lblPeriode1.Caption := FNewMasterAgreement.NewPer.Per_Name;
//    lblPeriode2.Caption := '/' + FNewMasterAgreement.NewPer.Per_Name;
//    intedtInvoice.Value := FNewMasterAgreement.Inv_CNT;
//    DayScale            := FNewMasterAgreement.Inv_CNT;
//    PeriodeId           := FNewMasterAgreement.NewPer.ID;
//
//    if FNewMasterAgreement.is_BKP = 1 then
//      edtPKP.Text := 'PKP'
//    else edtPKP.Text := 'NO PKP';
//    PajakId := IntToStr(FNewMasterAgreement.NewPajak.ID);
//    if FNewMasterAgreement.IS_PPN = 1 then
//    begin
//      edtPPN.Text := 'PPN';
//    end
//    else
//    begin
//      edtPPN.Text := 'NO PPN';
//    end;
//
//    if FNewMasterAgreement.IS_PPH23 = 1 then
//      edtPPH.Text := 'PPH'
//    else edtPPH.Text := 'NO PPH';
//
//    PajakName       := FNewMasterAgreement.NewPajak.Nama;
//    edtDesc.Text    := FNewMasterAgreement.Description;
//
//    AgreementID     := FNewMasterAgreement.ID;
//    tempPerName     := FNewMasterAgreement.NewPer.Per_Name;
//    tempNoAgreement := FNewMasterAgreement.NoBukti;
//    canEdit := 'yes';
//  end //masteragreement
//  else
//  begin
//    If (edtNoAgreement.Text<>'') and isShowMessage Then
//       CommonDlg.ShowError('Agreement Number ' + edtNoAgreement.Text +#13#10+ ER_NOT_FOUND);
//    //clearView(False);
//    cClearGrid(strgGrid1,False);
//    cClearGrid(strgGrid2,False);
//    cClearGrid(strgGrid3,False);
//    edtNoAgreement.SetFocus;
//    Exit;
//  end;

//    cClearGrid(strgGrid1,False);
//
//    ParseHeaderGrid(1);
//
//    for intI := 1 to FNewMasterAgreement.NewMasterAgreementItems.Count do
//    begin
//      with strgGrid1 do
//      begin
//        Cells[_Kol1ProductCode,intI]   := FNewMasterAgreement.NewMasterAgreementItems[intI-1].Projas_Code.CODE;
//        Cells[_Kol1ProductDesc,intI]   := FNewMasterAgreement.NewMasterAgreementItems[intI-1].Projas_Code.NAME;
//
//        Floats[_Kol1QTYORDER,intI]        := (FNewMasterAgreement.NewMasterAgreementItems[intI-1].QTY); //('AGRD_QTY').AsString;
//        Alignments[_Kol1QTYORDER,intI]    := taRightJustify;
//        Floats[_Kol1TOTALAMOUNT,intI]      := FNewMasterAgreement.NewMasterAgreementItems[intI-1].Total; //.FieldByName('AGRD_TOTAL').AsString;
//        Alignments[_Kol1TOTALAMOUNT,intI] := taRightJustify;
//        tempTotal                         := tempTotal +  FNewMasterAgreement.NewMasterAgreementItems[intI-1].Total;
//
//        Floats[_Kol1PROJAS_PRICE,intI]       := FNewMasterAgreement.NewMasterAgreementItems[intI-1].Price; //.FieldByName('PROJAS_PRICE').AsString;
//        Ints[_Kol1ID_AGREEMENT,intI]        := (FNewMasterAgreement.ID); //.FieldByName('AGRD_ID').AsString;
//        Ints[_Kol1ID_DETIL_AGREEMENT,intI]  := (FNewMasterAgreement.NewMasterAgreementItems[intI-1].ID);
//        Floats[_Kol1PRICE_PPN,intI]         := (FNewMasterAgreement.NewMasterAgreementItems[intI-1].Price_PPN);
//        Floats[_Kol1DETIL_SUBTOTAL,intI]    := (FNewMasterAgreement.NewMasterAgreementItems[intI-1].SubTotal); //.FieldByName('AGRD_SUBTOTAL').AsString;
//        if IntI < FNewMasterAgreement.NewMasterAgreementItems.Count then
//           AddRow;
//      end; //end with strggrid
//
//    end; //end for
//
//  with strgGrid1 do
//  begin
//    AutoSize  := true;
//    ColWidths[_Kol1PROJAS_PRICE]        := 0;
//    ColWidths[_Kol1ID_AGREEMENT]        := 0;
//    ColWidths[_Kol1ID_DETIL_AGREEMENT]  := 0;
//    ColWidths[_Kol1PRICE_PPN]           := 0;
//    ColWidths[_Kol1DETIL_SUBTOTAL]      := 0;
//  end;

  curredtTotal.Value  := tempTotal;

//  strgGrid1RowChanging(Self,0,1,tempBool);

  tsKontrak.Show;
end;

procedure TfrmMasterAgreement.ParseHeaderGrid(jmlData: Integer);
begin
//  with strgGrid1 do
//  begin
//    Clear;
//    FixedRows := 1;
//    RowCount := jmlData + 1;
//    ColCount := 9;
//    Cells[_Kol1ProductCode ,0] := 'PRODUCT CODE';
//    Cells[_Kol1ProductDesc ,0] := 'PRODUCT DESCRIPTION';
//    Cells[_Kol1QTYORDER ,0]    := 'QTY ORDER';
//    Cells[_Kol1TOTALAMOUNT,0]  := 'TOTAL AMOUNT';
//
//    if jmlData < 1 then
//    begin
//      RowCount := 2;
//      Cells[_Kol1ProductCode,1]  := '';
//      Cells[_Kol1ProductDesc,1]  := '';
//      Cells[_Kol1QTYORDER,1]     := '';
//      Cells[_Kol1TOTALAMOUNT,1]  := '';
//      Cells[_Kol1PROJAS_PRICE,1] := '';
//      Ints[_Kol1ID_AGREEMENT,1]  := 0; //ID AGREEMENT
//      Ints[_Kol1ID_DETIL_AGREEMENT,1] := 0; //ID DETIL AGREEMENT
//    end;
//    AutoSize  := true;
////    HideColumns(_Kol1PROJAS_PRICE, ColCount);
//  end;
end;

procedure TfrmMasterAgreement.ParseHeaderGridJadwal(jmlData: Integer);
begin
  // Invoice schedule
//  with strgGrid2 do
//  begin
//    Clear;
//    RowCount                   := jmlData + 1;
//    ColCount                   := 12;
//    Cells[_Kol2No,0]           := 'No.';
//    Cells[_Kol2INVOICE_DATE,0] := 'INVOICE DATE';
//    Cells[_Kol2INVOICE_TERM,0] := 'INVOICE TERM(s)';
//    Cells[_Kol2INVOICE_NO,0]   := 'INVOICE NO.      ';
//    Cells[_Kol2INVOICE_DUEDATE,0] := 'INVOICE DUE DATE';
//    Cells[_Kol2STATUS,0]          := 'STATUS';
//    Cells[_Kol2TOTAL_INVOICE,0]   := 'TOTAL INVOICE';
//
//    if jmlData < 1 then
//    begin
//      RowCount                    := 2;
//      Cells[_Kol2No,1]            := '';
//      Cells[_Kol2INVOICE_DATE,1]  := '';
//      Cells[_Kol2INVOICE_TERM,1]  := '';
//      Cells[_Kol2INVOICE_NO,1]    := '';
//      Cells[_Kol2INVOICE_DUEDATE,1]   := '';
//      Cells[_Kol2STATUS,1]            := '';
//      Cells[_Kol2TOTAL_INVOICE,1]     := '0';
//      Ints[_Kol2ID_JDWL_AGREEMENT,1]  := 0; //ID JDWL AGREEMENT
//      Cells[_Kol2DESC_INVOICE,1]      := ''; //inv description
//      Cells[_Kol2INVOICE_DATE_ID,1]   := '';
//      Cells[_Kol2INVOICE_DUEDATE_ASAL,1]  := '';
//      Cells[_Kol2IS_PRINTED,1]            := '';
//    end;
//    FixedRows := 1;
//    AutoSize := true;
////    HideColumns(_Kol2ID_JDWL_AGREEMENT, strgGrid2.ColCount);
//    ColWidths[_Kol2ID_JDWL_AGREEMENT]    := 0;
//    ColWidths[_Kol2DESC_INVOICE]         := 0;
//    ColWidths[_Kol2INVOICE_DATE_ID]      := 0;
//    ColWidths[_Kol2INVOICE_DUEDATE_ASAL] := 0;
//    ColWidths[_Kol2IS_PRINTED]           := 0;
//  end; //with strgGrid2
//
//  // Accrual schedule
//  with strgGrid3 do
//  begin
//    Clear;
//    RowCount                   := jmlData + 1;
//    ColCount                   := 9;
//    Cells[_Kol3No,0]           := 'No.';
//    Cells[_Kol3ACCRUAL_DATE,0] := 'ACCRUAL DATE';
//    Cells[_Kol3PERIODE,0]      := 'PERIODE';
//    Cells[_Kol3ACRRUAL_NO,0]   := 'ACRRUAL NO.       ';
//    Cells[_Kol3STATUS,0]       := 'STATUS';
//    Cells[_Kol3TOTALACCRUAL,0] := 'TOTAL ACCRUAL';
//
//    if jmlData < 1 then
//    begin
//      RowCount                       := 2;
//      Cells[_Kol3No,1]               := '';
//      Cells[_Kol3ACCRUAL_DATE,1]     := '';
//      Cells[_Kol3PERIODE,1]          := '';
//      Cells[_Kol3ACRRUAL_NO,1]       := '';
//      Cells[_Kol3STATUS,1]           := '';
//      Cells[_Kol3TOTALACCRUAL,1]     := '';
//      Ints[_Kol3ID_JDWL_AGREEMENT,1] := 0; //ID JDWL AGREEMENT
//      Cells[_Kol3DESC_ACRRUAL,1]     := ''; //accrual description
//      Cells[_Kol3ACCRUAL_DATE_ASAL,1]:= '';
//    end;
//    FixedRows := 1;
//    AutoSize  := true;
////    HideColumns(_Kol3ID_JDWL_AGREEMENT, strgGrid3.ColCount);
//    ColWidths[_Kol3ID_JDWL_AGREEMENT] := 0;
//    ColWidths[_Kol3DESC_ACRRUAL]      := 0;
//    ColWidths[_Kol3ACCRUAL_DATE_ASAL] := 0;
//  end; //with strgGrid3
end;

procedure TfrmMasterAgreement.ParseDataGridJadwal();
var intI: Integer;
    tempBool: Boolean;
begin
  //init
  tempTotalInv  := 0;
  tempTotalAccr := 0;

//  if FNewMasterAgreement = nil then Exit;
//  if FNewMasterAgreement.NewAgreementJadwals = nil then Exit;
//  ParseHeaderGridJadwal(FNewMasterAgreement.NewAgreementJadwals.Count);
//  if FNewMasterAgreement.NewAgreementJadwals.Count > 0 then
//  begin
//    //initiate
////    intI := 1;
//
//    //while not(dataJadwalAgreement.Eof) do
//    for IntI := 1 to FNewMasterAgreement.NewAgreementJadwals.Count do
//    begin
//      with strgGrid2 do
//      begin
//        Ints[_Kol2No,intI]                  := (intI);
//        Cells[_Kol2INVOICE_DATE,intI]       := DateToStr(FNewMasterAgreement.NewAgreementJadwals[intI-1].INV_DATE);
//        Cells[_Kol2INVOICE_TERM,intI]       := IntToStr(FNewMasterAgreement.NewAgreementJadwals[intI-1].Inv_TermNo);
//        Cells[_Kol2INVOICE_NO,intI]         := FNewMasterAgreement.NewAgreementJadwals[intI-1].INV_NO;
//        Cells[_Kol2INVOICE_DUEDATE,intI]    := DateToStr(FNewMasterAgreement.NewAgreementJadwals[intI-1].INV_DUE_DATE);
//        Cells[_Kol2STATUS,intI]             := FNewMasterAgreement.NewAgreementJadwals[intI-1].RefStatusProses.Nama;
//        Cells[_Kol2TOTAL_INVOICE,intI]      := FloatToStr(FNewMasterAgreement.NewAgreementJadwals[intI-1].INV_TOTAL);
//        Alignments[_Kol2TOTAL_INVOICE,intI] := taRightJustify;
//        tempTotalInv                        := tempTotalInv +  FNewMasterAgreement.NewAgreementJadwals[intI-1].INV_TOTAL;
//        Ints[_Kol2ID_JDWL_AGREEMENT,intI]   := (FNewMasterAgreement.NewAgreementJadwals[intI-1].ID);
//        Cells[_Kol2DESC_INVOICE,intI]       := FNewMasterAgreement.NewAgreementJadwals[intI-1].INV_DESCRIPTION;
//        Cells[_Kol2INVOICE_DATE_ID,intI]       := Cells[_Kol2INVOICE_DATE,intI];
//        Cells[_Kol2INVOICE_DUEDATE_ASAL,intI]  := Cells[_Kol2INVOICE_DUEDATE,intI];
//        Cells[_Kol2IS_PRINTED,intI]            := IntToStr(FNewMasterAgreement.NewAgreementJadwals[intI-1].INV_IS_PRINTED);
//      end; //end with strggrid 2
//
//      with strgGrid3 do
//      begin
//        Ints[_Kol3No,intI]                  := (intI);
//        Cells[_Kol3ACCRUAL_DATE,intI]       := DateToStr(FNewMasterAgreement.NewAgreementJadwals[intI-1].ACCRU_DATE);
//        Cells[_Kol3PERIODE,intI]            := DateToStr(FNewMasterAgreement.NewAgreementJadwals[intI-1].INV_DATE);
//        Cells[_Kol3ACRRUAL_NO,intI]         := FNewMasterAgreement.NewAgreementJadwals[intI-1].ACCRU_NO;
//        Cells[_Kol3STATUS,intI]             := FNewMasterAgreement.NewAgreementJadwals[intI-1].ACCRU_STATUS;
//        Cells[_Kol3TOTALACCRUAL,intI]       := FloatToStr(FNewMasterAgreement.NewAgreementJadwals[intI-1].ACCRU_TOTAL);
//        Alignments[_Kol3TOTALACCRUAL,intI]  := taRightJustify;
//        tempTotalAccr                       := tempTotalAccr +  FNewMasterAgreement.NewAgreementJadwals[intI-1].ACCRU_TOTAL;
//        Ints[_Kol3ID_JDWL_AGREEMENT,intI]   := (FNewMasterAgreement.NewAgreementJadwals[intI-1].ID);
//        Cells[_Kol3DESC_ACRRUAL,intI]       := FNewMasterAgreement.NewAgreementJadwals[intI-1].ACCRU_DESCRIPTION;
//        Cells[_Kol3ACCRUAL_DATE_ASAL,intI]  := Cells[_Kol3ACCRUAL_DATE,intI];
//      end; //end with strggrid 3
////      dataJadwalAgreement.Next;
//    end; //end while
//  end;
//
//  strgGrid2.AutoSize  := True;
//  strgGrid3.AutoSize  := True;
//  strgGrid2.ColWidths[_Kol2ID_JDWL_AGREEMENT]    := 0;
//  strgGrid2.ColWidths[_Kol2DESC_INVOICE]         := 0;
//  strgGrid2.ColWidths[_Kol2INVOICE_DATE_ID]      := 0;
//  strgGrid2.ColWidths[_Kol2INVOICE_DUEDATE_ASAL] := 0;
//  strgGrid2.ColWidths[_Kol2IS_PRINTED]           := 0;
//  strgGrid3.ColWidths[_Kol3ID_JDWL_AGREEMENT]    := 0;
//  strgGrid3.ColWidths[_Kol3DESC_ACRRUAL]         := 0;
//  strgGrid3.ColWidths[_Kol3ACCRUAL_DATE_ASAL]    := 0;
////  strgGrid2.HideColumns(_Kol2ID_JDWL_AGREEMENT, strgGrid2.ColCount);
////  strgGrid3.HideColumns(_Kol3ID_JDWL_AGREEMENT, strgGrid3.ColCount);
//
//  strgGrid1RowChanging(Self,0,1,tempBool);
end;


procedure TfrmMasterAgreement.prepareAdd();
begin
  if not assigned(frmDialogMasterAgreement) then
  Application.CreateForm(TfrmDialogMasterAgreement, frmDialogMasterAgreement);

  frmDialogMasterAgreement.Caption := 'Add Master Agreement';
  frmDialogMasterAgreement.FormMode                   := fmAdd;
  frmDialogMasterAgreement.CustCode                   := tempCustCode;
  frmDialogMasterAgreement.SupCode                    := tempSupCode;

  SetFormPropertyAndShowDialog(frmDialogMasterAgreement);
end;

procedure TfrmMasterAgreement.prepareEdit();
var countPrep, i: Integer;
    tvalu: string;
    tvald: Boolean;
begin
  if not assigned(frmDialogMasterAgreement) then
    Application.CreateForm(TfrmDialogMasterAgreement, frmDialogMasterAgreement);

  frmDialogMasterAgreement.Caption := 'Edit MASTER AGREEMENT';
  frmDialogMasterAgreement.FormMode                   := fmEdit;
  frmDialogMasterAgreement.AgreementID                := AgreementID;
  frmDialogMasterAgreement.CustCode                   := tempCustCode;
  frmDialogMasterAgreement.SupCode                    := tempSupCode;
  frmDialogMasterAgreement.PerName                    := tempPerName;
  frmDialogMasterAgreement.cbPeriode.Text            := lblPeriode1.Caption;
  frmDialogMasterAgreement.OldTermPeriode             := Round(intedtPeriode.Value);
  frmDialogMasterAgreement.OldPeriode                 := tempPerName;
  frmDialogMasterAgreement.OldNoOfInvoice             := Round(intedtInvoice.Value);
  frmDialogMasterAgreement.OldInvoiceTotal            := curredtTotal.Value;

  frmDialogMasterAgreement.edtNoAgreement.Text        := tempNoAgreement;
  frmDialogMasterAgreement.dtStart.Date               := dtStart.Date;
  frmDialogMasterAgreement.dtEnd.Date                 := dtEnd.Date;
  frmDialogMasterAgreement.intedtPeriode.Value        := intedtPeriode.Value;
  frmDialogMasterAgreement.intedtInvoice.Value        := intedtInvoice.Value;
  frmDialogMasterAgreement.PajakId                    := PajakId;
  frmDialogMasterAgreement.PajakName                  := PajakName;
  frmDialogMasterAgreement.PerID                      := PeriodeId;
  if edtPKP.Text = 'PKP' then
  begin
    frmDialogMasterAgreement.cbbPKP.ItemIndex := 1;
    frmDialogMasterAgreement.IsPajak          := True;
  end
  else
    frmDialogMasterAgreement.cbbPKP.ItemIndex := 0;

  frmDialogMasterAgreement.cbPajak.Text      := PajakName;
  if edtPPH.Text = 'PPH' then
    frmDialogMasterAgreement.cbbPPH.ItemIndex := 1
  else frmDialogMasterAgreement.cbbPPH.ItemIndex := 0;

  frmDialogMasterAgreement.edtDesc.Text      := edtDesc.Text;
  frmDialogMasterAgreement.curredtTotal.Text := FormatCurr('##,##0.00',curredtTotal.Value);

  //Detil Agreement
//  frmDialogMasterAgreement.strgGrid.RowCount := strgGrid1.RowCount;
//  frmDialogMasterAgreement.strgGrid.ColCount := 11;
//  if (strgGrid1.RowCount > 1) and (strgGrid1.Cells[0,1] <> '') then
//  for countPrep := 2 to strgGrid1.RowCount do
//  begin
//    with frmDialogMasterAgreement.strgGrid do
//    begin
//      Cells[_KolCODE ,countPrep - 1]            := strgGrid1.Cells[_Kol1ProductCode ,countPrep -1];
//      frmDialogMasterAgreement.strgGridCellValidate(Self,_KolCODE ,countPrep-1,tvalu,tvald);
////      AddCheckBox(_KolPRICE_PPN ,countPrep -1,True,True);
//      Cells[_KolQTY_ORDER ,countPrep - 1]       := strgGrid1.Cells[_Kol1QTYORDER ,countPrep -1];
//      Alignments[_KolQTY_ORDER , countPrep - 1] := taRightJustify;
//      Cells[_KolPRICE_PPN ,countPrep - 1]          := strgGrid1.Cells[_Kol1PRICE_PPN ,countPrep -1];
//      Cells[_KolPJK_PPN ,countPrep - 1]            := frmDialogMasterAgreement.cbpPajak.Cells[2, frmDialogMasterAgreement.cbpPajak.row];
//      Cells[_KolPROJAS_PRICE , countPrep - 1]      := strgGrid1.Cells[_Kol1PROJAS_PRICE ,countPrep -1];
//      Alignments[_KolPROJAS_PRICE , countPrep - 1] := taRightJustify;
//      Floats[_KolSUB_TOTAL ,countPrep - 1]         := (strgGrid1.Floats[_KolPROJAS_PRICE , countPrep - 1]*strgGrid1.Floats[_Kol1QTYORDER ,countPrep -1]);
//      Alignments[_KolSUB_TOTAL , countPrep - 1]    := taRightJustify;
//      Cells[_KolID_AGREEMENT, countPrep - 1]       := strgGrid1.Cells[_Kol1ID_AGREEMENT, countPrep - 1];
//      Cells[_KolID_DETIL_AGREEMENT, countPrep - 1] := strgGrid1.Cells[_Kol1ID_DETIL_AGREEMENT, countPrep - 1];
//    end;
//    frmDialogMasterAgreement.strgGrid.HideColumns(_KolPER_DAYS, _KolID_DETIL_AGREEMENT);
//    frmDialogMasterAgreement.strgGrid.Row := 1;
//    //frmDialogMasterAgreement.strgGridRowChanging(Self,0,1,tempBool);
//    frmDialogMasterAgreement.curredtTotal.Text := FormatCurr('##,##0.00',curredtTotal.Value);
//  end;
//
//  //Invoice Schedule
//  frmDialogMasterAgreement.strgGrid2.RowCount := strgGrid2.RowCount;
//  frmDialogMasterAgreement.strgGrid2.ColCount := strgGrid2.ColCount;
//  if (strgGrid2.RowCount > 1) and (strgGrid2.Cells[_Kol2No,1] <> '') then
//  for countPrep := 2 to strgGrid2.RowCount do
//  begin
//    with frmDialogMasterAgreement.strgGrid2 do
//    begin
//      for i := 0 to strgGrid2.ColCount-1 do
//      begin
//        Cells[i ,countPrep - 1]        := strgGrid2.Cells[i ,countPrep -1];
//        Alignments[i , countPrep - 1]  := strgGrid2.Alignments[i , countPrep - 1];
//      end;
//    end;
//  end;

  frmDialogMasterAgreement.dayScale := DayScale;

  SetFormPropertyAndShowDialog(frmDialogMasterAgreement);
end;

//=========================

procedure TfrmMasterAgreement.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 113 then
    tsKontrak.Show
  else if Key = 114 then
    tsJadwalInvoice.Show
  else if Key = 115 then
    tsJadwalAccrual.Show
  else if(Key = Ord('H'))and(ssctrl in Shift) and btnEditSchedule.Visible = True then
    actEditScheduleMasterAgreementExecute(Self)
  else if Key = VK_F2 then
  begin
    pcMasterAgreement.ActivePage := tsKontrak;
  end
  else if Key = VK_F3 then
  begin
    pcMasterAgreement.ActivePage := tsJadwalInvoice;
  end
  else if Key = VK_F4 then
  begin
    pcMasterAgreement.ActivePage := tsJadwalAccrual;
  end
  else if Key = VK_F5 then
  begin
//    if MasterNewUnit.ID=0 then
//    begin
//      CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
//      Exit;
//    end;
//
//    if not Assigned(frmDialogSearchNoAgreement) then
//      frmDialogSearchNoAgreement := TfrmDialogSearchNoAgreement.Create(Self);
//
//    frmDialogSearchNoAgreement.CustCode := cbpCustCode.Value;
//    frmDialogSearchNoAgreement.SupCode  := cbpSupCode.Value;
//
//    SetFormPropertyAndShowDialog(frmDialogSearchNoAgreement);
//
//    if frmDialogSearchNoAgreement.IsProcessSuccessfull = True then
//      edtNoAgreement.Text := frmDialogSearchNoAgreement.NoAgreement;
//
//    frmDialogSearchNoAgreement.Free;
  end;
end;

procedure TfrmMasterAgreement.btnShowClick(Sender: TObject);
begin
  inherited;
  ParseDataGrid();
end;

procedure TfrmMasterAgreement.LoadDropDownData(ACombo: TcxLookupComboBox; aSQL:
    string);
var
  AColsOfData: Integer;
begin
  {Flush the old data}
//  ACombo.ClearGridData;
//  ACombo.ColCount := 3;
//
//  {Load the data}
//  if Acombo = cbpCustCode then
//  begin
//    with cOpenQuery(aSQL, False) do
//    begin
//      try
//        Last;
//        AColsOfData:= RecordCount + 1;
//        ACombo.RowCount := AColsOfData;
//        ACombo.AddRow(['','CODE','NAME']);
//
//        if AColsOfData > 0 then
//        begin
//          First;
//          while not Eof do
//          begin
//            ACombo.AddRow(['',FieldByName('CUST_CODE').AsString,
//                             FieldByName('CUST_NAME').AsString]);
//
//            Next;
//          end;
//        end
//        else
//        begin
//          ACombo.AddRow([' ',' ',' ']);
//        end;
//
//      finally
//        Free;
//      end;
//    end;
//  end;
//
//  if ACombo = cbpSupCode then
//  begin
//    with cOpenQuery(asQL, False) do
//    begin
//      try
//        Last;
//        AColsOfData:= recordCount + 1;
//        ACombo.RowCount := AColsOfData;
//        ACombo.AddRow(['','CODE','NAME']);
//
//        if AColsOfData > 0 then
//        begin
//          First;
//          while not Eof do
//          begin
//            ACombo.AddRow(['', FieldByName('KODE SUPPLIER').AsString,
//                              FieldByName('NAMA SUPPLIER').AsString]);
//            Next;
//          end;
//        end
//        else
//        begin
//          ACombo.AddRow([' ',' ',' ']);
//        end;
//
//      finally
//        Free;
//      end;
//    end;
//
//  end;

  {Now shring the grid so its just big enough for the data}
//  ACombo.SizeGridToData;
  //trik to activate acombo
//  if ACombo.RowCount=1 then ACombo.RowCount := 2;
//  ACombo.FixedRows := 1;
end;

procedure TfrmMasterAgreement.cbpSupCodeCloseUp(Sender: TObject);
begin
  inherited;
//  edtSupName.Text := cbpSupCode.Cells[2, cbpSupCode.Row];
//  tempSupCode     := cbpSupCode.Cells[1, cbpSupCode.Row];
  cbSupCode.Text := tempSupCode;

  canEdit := 'no';
end;

procedure TfrmMasterAgreement.cbpSupCodeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
   supCode: string;
begin
  inherited;
  if Length(cbSupCode.Text) = 1 then
  begin
    supCode     := UpperCase(cbSupCode.Text);
//    LoadDropDownData(cbSupCode, GetListSuplierByUnitId(MasterNewUnit.ID, supCode + '%'));
  end;

  if Key = 13 then
  begin
    if not Assigned(frmPopUpSelectCustomer) then
      frmPopUpSelectCustomer := TfrmPopUpSelectCustomer.Create(Application);

    frmPopUpSelectCustomer.Modul       := mMasterAgreement;
    frmPopUpSelectCustomer.SuplierCode := tempSupCode;

    frmPopUpSelectCustomer.ShowModal;

    if (frmPopUpSelectCustomer.IsProcessSuccessfull) then
    begin
//      cbpCustCode.Value := frmPopUpSelectCustomer.CustomerCode;
      cbCustCode.SetFocus;
//      cbpCustCodeCloseUp(Self);
    end;

    frmPopUpSelectCustomer.Free;
  end; // end 13
end;

procedure TfrmMasterAgreement.tsJadwalInvoiceShow(Sender: TObject);
begin
  inherited;
  btnEditSchedule.Visible := True;
  ParseDataGridJadwal();
  curredtTotal.Value      := tempTotalInv;
end;

procedure TfrmMasterAgreement.tsKontrakShow(Sender: TObject);
begin
  inherited;
  btnEditSchedule.Visible := False;
  curredtTotal.Value      := tempTotal;

end;

procedure TfrmMasterAgreement.actEditScheduleMasterAgreementExecute(
  Sender: TObject);
var countI: Integer;
    tempBool: Boolean;
begin
  inherited;

  if canEdit = 'no' then
  begin
    CommonDlg.ShowError('Please Select Proper Data !');
    cbCustCode.SetFocus;
    Exit;
  end;
//  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    Exit;
  end;

  //======== showdataedit ======================================================
  if not Assigned(frmDialogScheduleAgreement) then
    frmDialogScheduleAgreement := TfrmDialogScheduleAgreement.Create(Self);

  frmDialogScheduleAgreement.AgreementId := AgreementID;
//  frmDialogScheduleAgreement.untID       := MasterNewUnit.ID;
//  with frmDialogScheduleAgreement.strgGrid2 do
//  begin
//    ColCount  := strgGrid2.ColCount;
//    RowCount  := strgGrid2.RowCount;
//    FixedRows := 1;
//    AutoSize  := True;
//    ColWidths[_Kol2ID_JDWL_AGREEMENT]    := 0;
//    ColWidths[_Kol2DESC_INVOICE]         := 0;
//    ColWidths[_Kol2INVOICE_DATE_ID]      := 0;
//    ColWidths[_Kol2INVOICE_DUEDATE_ASAL] := 0;
//    ColWidths[_Kol2IS_PRINTED]           := 0;
//  end;
  frmDialogScheduleAgreement.curredtTotal.Value := curredtTotal.Value;

//  for countI := 0 to strgGrid2.RowCount do
//  with frmDialogScheduleAgreement.strgGrid2 do
//  begin
//    Cells[_Kol2No,countI]                   := strgGrid2.Cells[_Kol2No,countI];
//    Cells[_Kol2INVOICE_DATE,countI]         := strgGrid2.Cells[_Kol2INVOICE_DATE,countI];
//    Colors[_Kol2INVOICE_DATE , countI]      := $00B9FFB9;
//    //simpan tanggal invoice Asli utk menentukan delete/edit record jadwal
//    Cells[_Kol2INVOICE_DATE_ID,countI]      := Cells[_Kol2INVOICE_DATE,countI];
//    Cells[_Kol2INVOICE_TERM,countI]         := strgGrid2.Cells[_Kol2INVOICE_TERM,countI];
//    Cells[_Kol2INVOICE_NO,countI]           := strgGrid2.Cells[_Kol2INVOICE_NO,countI];
//    Cells[_Kol2INVOICE_DUEDATE,countI]      := strgGrid2.Cells[_Kol2INVOICE_DUEDATE,countI];
//    Colors[_Kol2INVOICE_DUEDATE , countI]   := $00B9FFB9;
//    Cells[_Kol2STATUS,countI]               := strgGrid2.Cells[_Kol2STATUS,countI];
//    Cells[_Kol2TOTAL_INVOICE,countI]        := strgGrid2.Cells[_Kol2TOTAL_INVOICE,countI];
//    Alignments[_Kol2TOTAL_INVOICE, countI]  := taRightJustify;
//    Cells[_Kol2ID_JDWL_AGREEMENT,countI]    := strgGrid2.Cells[_Kol2ID_JDWL_AGREEMENT,countI];
//    Cells[_Kol2DESC_INVOICE,countI]         := strgGrid2.Cells[_Kol2DESC_INVOICE,countI];
//
//    Cells[_Kol2INVOICE_DUEDATE_ASAL,countI] := Cells[_Kol2INVOICE_DUEDATE,countI];
//    Cells[_Kol2IS_PRINTED,countI]           := strgGrid2.Cells[_Kol2IS_PRINTED,countI];
//  end;
//
//  with frmDialogScheduleAgreement.strgGrid3 do
//  begin
//    ColCount := strgGrid3.ColCount;
//    RowCount := strgGrid3.RowCount;
//    FixedRows := 1;
//    AutoSize  := True;
//    ColWidths[_Kol3ID_JDWL_AGREEMENT] := 0;
//    ColWidths[_Kol3DESC_ACRRUAL]      := 0;
//    ColWidths[_Kol3ACCRUAL_DATE_ASAL] := 0;
//  end;
//  for countI := 0 to strgGrid3.RowCount do
//  with frmDialogScheduleAgreement.strgGrid3 do
//  begin
//    Cells[_Kol3No,countI]                   := strgGrid3.Cells[_Kol3No,countI];
//    Cells[_Kol3ACCRUAL_DATE,countI]         := strgGrid3.Cells[_Kol3ACCRUAL_DATE,countI];
//    Colors[_Kol3ACCRUAL_DATE , countI]      := $00B9FFB9;
//    Cells[_Kol3PERIODE,countI]              := strgGrid3.Cells[_Kol3PERIODE,countI];
//    Cells[_Kol3ACRRUAL_NO,countI]           := strgGrid3.Cells[_Kol3ACRRUAL_NO,countI];
//    Cells[_Kol3STATUS,countI]               := strgGrid3.Cells[_Kol3STATUS,countI];
//    Cells[_Kol3TOTALACCRUAL,countI]         := strgGrid3.Cells[_Kol3TOTALACCRUAL,countI];
//    Alignments[_Kol3TOTALACCRUAL, countI]   := taRightJustify;
//    Cells[_Kol3ID_JDWL_AGREEMENT,countI]    := strgGrid3.Cells[_Kol3ID_JDWL_AGREEMENT,countI];
//    Cells[_Kol3DESC_ACRRUAL,countI]         := strgGrid3.Cells[_Kol3DESC_ACRRUAL,countI];
//    Cells[_Kol3ACCRUAL_DATE_ASAL,countI]    := Cells[_Kol3ACCRUAL_DATE,countI];
//  end;
//
//  frmDialogScheduleAgreement.Caption := 'EDIT SCHEDULE AGREEMENT';
//  frmDialogScheduleAgreement.strgGrid2RowChanging(Self,0,1,tempBool);

  SetFormPropertyAndShowDialog(frmDialogScheduleAgreement);
  //======== showdataedit ======================================================

  if (frmDialogScheduleAgreement.IsProcessSuccessfull) then
  begin
    // put your code here
    // ...
    actRefreshMasterAgreementExecute(Self);
  end;
// klo dialognya disini ga muncul, soale ketutup ama form dlgscheduleaggr
//  else
//    CommonDlg.ShowError('Gagal Menyimpan Data');
  frmDialogScheduleAgreement.Free;
  //
end;

procedure TfrmMasterAgreement.tsJadwalAccrualShow(Sender: TObject);
begin
  inherited;
  btnEditSchedule.Visible := True;
  ParseDataGridJadwal();
  curredtTotal.Value := tempTotalInv;
end;

procedure TfrmMasterAgreement.lblF5Click(Sender: TObject);
begin
//  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    Exit;
  end;

//  if not Assigned(frmDialogSearchNoAgreement) then
//    frmDialogSearchNoAgreement := TfrmDialogSearchNoAgreement.Create(Self);
//
//  frmDialogSearchNoAgreement.CustCode := cbpCustCode.Value;
//  frmDialogSearchNoAgreement.SupCode  := cbpSupCode.Value;
//
//  SetFormPropertyAndShowDialog(frmDialogSearchNoAgreement);
//
//  if frmDialogSearchNoAgreement.IsProcessSuccessfull = True then
//  begin
//    clearView(False);
//    cClearGrid(strgGrid1,False);
//    cClearGrid(strgGrid2,False);
//    cClearGrid(strgGrid3,False);
//    edtNoAgreement.Text := frmDialogSearchNoAgreement.NoAgreement;
//    edtNoAgreement.SetFocus;
//  end;
//
//  frmDialogSearchNoAgreement.Free;
end;

procedure TfrmMasterAgreement.SetPajakId(const Value: string);
begin
  FPajakId := Value;
end;

procedure TfrmMasterAgreement.SetPajakName(const Value: string);
begin
  FPajakName := Value;
end;

procedure TfrmMasterAgreement.SetDayScale(const Value: Real);
begin
  FDayScale := Value;
end;

procedure TfrmMasterAgreement.SetPeriodeId(const Value: Integer);
begin
  FPeriodeId := Value;
end;

procedure TfrmMasterAgreement.fraFooter5Button1btnCloseClick(
  Sender: TObject);
begin
  Try
    inherited;
    fraFooter5Button1.btnCloseClick(Sender);
  except
  end;

end;

procedure TfrmMasterAgreement.strgGrid1GetFloatFormat(Sender: TObject;
  ACol, ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  if ARow=0 then exit;
  FloatFormat := '%0.2n';
  if ACol in [_Kol1TOTALAMOUNT] then
    IsFloat := True
  else
    IsFloat := False;
end;

procedure TfrmMasterAgreement.strgGrid2GetFloatFormat(Sender: TObject;
  ACol, ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  if ARow=0 then exit;
  try
      FloatFormat := '%0.2n';
      if ACol in [_Kol2TOTAL_INVOICE] then
        IsFloat := True
      else
        IsFloat := False;
  except

  end;
end;

procedure TfrmMasterAgreement.strgGrid3GetFloatFormat(Sender: TObject;
  ACol, ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  if ARow=0 then exit;
  FloatFormat := '%0.2n';
  if ACol in [_Kol3TOTALACCRUAL] then
    IsFloat := True
  else
    IsFloat := False;
end;

procedure TfrmMasterAgreement.edtNoAgreementKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then btnShowClick(Self);
end;

procedure TfrmMasterAgreement.cbpCustCodeChange(Sender: TObject);
begin
   inherited;
//   cbSupCode.Value := '';
   edtSupName.Text  := '';

end;

procedure TfrmMasterAgreement.cbpCustCodeCloseUp(Sender: TObject);
begin
  inherited;
//    tempCustCode := cbpCustCode.Cells[1,cbpCustCode.Row];
    cbCustCode.Text := tempCustCode;
    canEdit := 'no';

//  with cOpenQuery(GetListSuplierByCustomerCode(tempCustCode, MasterNewUnit.ID), False) do
//  begin
//    try
//      if not IsEmpty then
//      begin
//        Last;
//        edtCustName.Text    := cbpCustCode.Cells[2, cbpCustCode.Row];
//        cbpSupCode.ClearGridData;
//        Last;
//        cbpSupCode.RowCount := RecordCount + 1;
//        cbpSupCode.AddRow(['','CODE','NAME']);
//
//        First;
//        while not Eof do
//        begin
//          cbpSupCode.AddRow(['', FieldByName('KODE SUPPLIER').AsString,
//                              FieldByName('NAMA SUPPLIER').AsString]);
//
//          Next;
//        end;
//
//        cbpSupCode.FixedRows := 1;
//        cbpSupCode.SizeGridToData;
//        First;
//        if FieldByName('CUST_SUP_CODE').AsString<>'' then
//        begin
//             cbpSupCode.Value := FieldByName('CUST_SUP_CODE').AsString;
//             edtSupName.Text  := FieldByName('NAMA SUPPLIER').AsString;
//             tempSupCode      := FieldByName('CUST_SUP_CODE').AsString;
//        end;
//      end;
//
//    finally
//      Free;
//    end;
//  end;
  edtNoAgreement.SetFocus;

end;

procedure TfrmMasterAgreement.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F5 then
  begin
    lblF5Click(Sender);
  end;

end;

end.
