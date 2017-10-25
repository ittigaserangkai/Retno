unit ufrmDialogMasterAgreement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls,
  Mask, StdCtrls, Grids,DateUtils,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxCurrencyEdit, cxTextEdit, cxMaskEdit, cxCalendar, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxPC;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogMasterAgreement = class(TfrmMasterDialog)
    pnl1: TPanel;
    lblInput: TLabel;
    lblComboGrid: TLabel;
    lbl9: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl10: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl1: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl6: TLabel;
    lbl13: TLabel;
    edtSupName: TEdit;
    edtCustName: TEdit;
    edtNoAgreement: TEdit;
    dtStart: TcxDateEdit;
    dtEnd: TcxDateEdit;
    edtDesc: TEdit;
    cbbPKP: TComboBox;
    cbbPPH: TComboBox;
    pnl2: TPanel;
    lbl5: TLabel;
    lbl14: TLabel;
    edtUnitPrice: TEdit;
    lblNewRow: TLabel;
    lblRemoveRow: TLabel;
    lblSearchProduct: TLabel;
    intedtInvoice: TcxCurrencyEdit;
    intedtPeriode: TcxCurrencyEdit;
    lblStaPro: TLabel;
    lblTipeBayar: TLabel;
    curredtTotal: TcxCurrencyEdit;
    cbCustCode: TcxLookupComboBox;
    cbSupCode: TcxLookupComboBox;
    pcDialogAgreement: TcxPageControl;
    tsKontrak: TcxTabSheet;
    cxGrid: TcxGrid;
    grdGridView: TcxGridDBTableView;
    cxcolGridViewColumn2: TcxGridDBColumn;
    cxcolGridViewColumn3: TcxGridDBColumn;
    cxcolGridViewColumn4: TcxGridDBColumn;
    cxcolGridViewColumn5: TcxGridDBColumn;
    grdlvlMaster: TcxGridLevel;
    tsJadwalInvoice: TcxTabSheet;
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
    cxcolDetilUnitPrice: TcxGridDBColumn;
    cxcolDetilSubTotal: TcxGridDBColumn;
    cbPeriode: TcxLookupComboBox;
    cbbTipeBayar: TComboBox;
    cbPajak: TComboBox;
    cbbStaPro: TComboBox;
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbpSupCodeCloseUp(Sender: TObject);
    procedure strgGridCellValidate(Sender: TObject; ACol, ARow: Integer;
      var Value: String; var Valid: Boolean);
    procedure strgGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbpSupCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbbPKPChange(Sender: TObject);
    procedure strgGridCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure cbpPeriodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure intedtPeriodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure cbpSupCodeKeyPress(Sender: TObject; var Key: Char);
    procedure intedtInvoiceExit(Sender: TObject);
    procedure cbCustCodeCloseUp(Sender: TObject);
    procedure cbpTipeBayarCloseUp(Sender: TObject);
    procedure cbpTipeBayarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbpPeriodeCloseUp(Sender: TObject);
    procedure cbpStaProCloseUp(Sender: TObject);
    procedure cbpStaProKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lblSearchProductClick(Sender: TObject);
    procedure cbCustCodeChange(Sender: TObject);
    procedure lblNewRowClick(Sender: TObject);
    procedure lblRemoveRowClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure footerDialogMasterbtnCloseClick(Sender: TObject);
    procedure dtStartExit(Sender: TObject);
    procedure cbpPajakChange(Sender: TObject);
    procedure strgGrid2GetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
  private
    { Private declarations }
    hariPeriode: Integer;
    isPKP,isPPN,isPPH: SmallInt;
    TOP: Integer;
    FIsPajak: Boolean;
    FPajakId: string;
    FPajakName: string;
    FCurrTipeProdukId: string;
    StaProID: Integer;

    procedure LoadDropDownData(ACombo: TcxLookupComboBox; aSQL: string);
    procedure showDataEdit();
    function checkEmpty(): Boolean;
    function SaveAgreement(aAgreementID: Integer=0): Boolean;
    function AddDetilAgreement(AGR_ID: Integer): Boolean;
    function AddJadwalAgreement(AGR_ID: Integer): Boolean;
//    function UpdateAgreement(): Boolean;
    function CountTotal(): Currency;
//    procedure LoadDataPajak;
    procedure CountEndEffectiveDate();
    function GetSQLsearchProjasByCode(AprojasCode: string): string;
    procedure SetIsPajak(const Value: Boolean);
    procedure SetPajakId(const Value: string);
    procedure SetPajakName(const Value: string);
    procedure SetCurrTipeProdukId(const Value: string);
  public
    { Public declarations }
    strDefaultPajakValue: string;
    TpByrID: Integer;
    PerID: Integer;
    dayScale: Real;
    FormMode: TFormMode;
    AgreementID: Integer;
    CustCode,SupCode,PerName: string;
    OldTermPeriode: Integer;
    OldPeriode: String;
    OldNoOfInvoice: Integer;
    OldInvoiceTotal: Double;
    IsProcessSuccessfull: Boolean;
    function getNewAgreementNo: string;
    property IsPajak: Boolean read FIsPajak write SetIsPajak;
    property PajakId: string read FPajakId write SetPajakId;
    property PajakName: string read FPajakName write SetPajakName;
    property CurrTipeProdukId: string read FCurrTipeProdukId write SetCurrTipeProdukId;
  end;

var
  frmDialogMasterAgreement: TfrmDialogMasterAgreement;

implementation
{$R *.dfm}

uses
  ufrmPopupSelectCustomer,  uTSCommonDlg, uConstanta,  Math, StrUtils;

const
     _KolCODE               : byte =  0;
     _KolDESCRIPTION        : byte =  1;
     _KolPRICE_PPN          : byte =  2;
     _KolQTY_ORDER          : byte =  3;
     _KolPROJAS_PRICE       : byte =  4;
     _KolSUB_TOTAL          : byte =  5;
     _KolTOTAL_AMOUNT       : byte =  6;
     _KolPER_DAYS           : byte =  7;
     _KolPJK_PPN            : byte =  8;
     _KolID_AGREEMENT       : byte =  9;
     _KolID_DETIL_AGREEMENT : byte = 10;

     _Kol2No                : byte = 0;
     _Kol2INVOICE_DATE      : byte = 1;
     _Kol2INVOICE_TERM      : byte = 2;
     _Kol2INVOICE_NO        : byte = 3;
     _Kol2INVOICE_DUEDATE   : byte = 4;
     _Kol2STATUS            : byte = 5;
     _Kol2TOTAL_INVOICE     : byte = 6;
     _Kol2ID_JDWL_AGREEMENT : byte = 7;
     _Kol2DESC_INVOICE      : byte = 8;
     _Kol2INVOICE_DATE_ID   : byte = 9;



function TfrmDialogMasterAgreement.AddJadwalAgreement(AGR_ID: Integer): Boolean;
var
    countI: Integer;
    tempDate: TDateTime;
    {tempJmlPer,}tempJmlInv: Integer;
    tempInvNo: string;
    tempTotal: Currency;
    myDate: TDateTime;
    AGRJDWL_ID: Integer;
begin
  //init
//  Result := False;

  tempJmlInv := Round(intedtInvoice.Value);

  tempTotal := CountTotal / intedtInvoice.Value;

  tempDate := dtStart.Date;
  myDate   := dtStart.Date;

  if tempJmlInv > 0 then
  for countI := 1 to tempJmlInv do
  begin
    if IsValidDate(YearOf(myDate),MonthOf(myDate) + 1,DayOf(dtEnd.Date)) then
    begin
      myDate := EncodeDate(YearOf(myDate),MonthOf(myDate) + 1,DayOf(dtEnd.Date));
    end
    else
    begin
      if MonthOf(myDate) + 1 > 12 then
        myDate := EncodeDate(YearOf(myDate) + 1,1,DayOf(dtEnd.Date))
      else
        myDate := EncodeDate(YearOf(myDate),MonthOf(myDate) + 1,
                              DaysInAMonth(YearOf(myDate),MonthOf(myDate) + 1));
    end;

//    if (strgGrid2.Ints[_Kol2ID_JDWL_AGREEMENT, countI]=0) or (AGR_ID=0) then
//    begin
//        AGRJDWL_ID := 0;
//        tempInvNo  := GetInvoiceNumber(DialogUnit, tempDate);
//    end
//    else
//    begin
//        AGRJDWL_ID := strgGrid2.Ints[_Kol2ID_JDWL_AGREEMENT, countI];
//        tempInvNo  := strgGrid2.Cells[_Kol2INVOICE_NO, countI];
//    end;
//
//    FNewMasterAgreement.UpdateNewAgreementJadwals(myDate, '',
//                 '', '', tempTotal, AGRJDWL_ID, tempDate, edtDesc.Text, tempDate + TOP,
//                 0, 0, tempInvNo, 0, (countI), tempTotal, DialogUnit,
//                 StaProID, DialogUnit);

    if IsValidDate(YearOf(tempDate),MonthOf(tempDate) + 1,DayOf(tempDate)) then
    begin
      tempDate := EncodeDate(YearOf(tempDate),MonthOf(tempDate) + 1,DayOf(dtStart.Date));
    end
    else
    begin
      if MonthOf(tempDate) + 1 > 12 then
        tempDate := EncodeDate(YearOf(tempDate) + 1,1,DayOf(dtStart.Date))
      else
        tempDate := EncodeDate(YearOf(tempDate),MonthOf(tempDate) + 1,
                                DaysInAMonth(YearOf(tempDate),MonthOf(tempDate) + 1));
    end;
  end;
   
  Result := True;
end;

function TfrmDialogMasterAgreement.AddDetilAgreement(AGR_ID: Integer): Boolean;
var AGRD_ID: Integer;
    intI: Integer;
    QTY_ORDER: Double;
    UNIT_PRICE, UNIT_PRICE_PPN, SUBTOTAL,TOTAL: Currency;
    PROJAS_CODE: string;
    staCek: Boolean;
begin
  //init
  Result := False;
//  if strgGrid.RowCount = 1 then
//  begin
//    Result := True;
//  end
//  else
//  for intI := 1 to strgGrid.RowCount-1 do //dimulai dari row k2 [setelah header]
//  begin
//    if Trim(strgGrid.Cells[_KolCODE, intI]) = '' then
//    begin
//      Continue;
//    end;
//    PROJAS_CODE := strgGrid.Cells[_KolCODE,intI];
//    try
//      QTY_ORDER := (strgGrid.Floats[_KolQTY_ORDER,intI]);
//    except
//      QTY_ORDER := 0;
//    end;
//    try
//      UNIT_PRICE := (strgGrid.Floats[_KolPROJAS_PRICE,intI]);
//    except
//      UNIT_PRICE := 0;
//    end;
//    try
//      SUBTOTAL := (strgGrid.Floats[_KolSUB_TOTAL,intI]);
//    except
//      SUBTOTAL := 0;
//    end;
//    try
//      TOTAL := (strgGrid.Floats[_KolTOTAL_AMOUNT,intI]);
//    except
//      TOTAL := 0;
//    end;
//    try
//      if (strgGrid.Ints[_KolID_DETIL_AGREEMENT,intI] = 0) or (AGR_ID=0) then
//         AGRD_ID := 0
//      else
//         AGRD_ID := StrToInt(strgGrid.Cells[_KolID_DETIL_AGREEMENT,intI]);
//    except
//      AGRD_ID := 0;
//    end;
//    strgGrid.GetCheckBoxState(_KolPRICE_PPN,intI,staCek);
//    try
//      if staCek then
//         UNIT_PRICE_PPN := (strgGrid.Floats[_KolPJK_PPN,intI])
//      else
//         UNIT_PRICE_PPN := 0;
//    except
//      UNIT_PRICE_PPN := 10; //change with search to default
//    end;
//
//    FNewMasterAgreement.UpdateNewMasterAgreementItems(
//                  AGRD_ID, DialogUnit, UNIT_PRICE,UNIT_PRICE_PPN,
//                  PROJAS_CODE, DialogUnit, QTY_ORDER,SUBTOTAL,TOTAL
//      );
//    Result := True;
//  end;

end;

function TfrmDialogMasterAgreement.SaveAgreement(aAgreementID: Integer=0):
    Boolean;
var {tempResult1,}tempResult2,tempResult3: Boolean;
    iSup_Unt_ID: Integer;
begin
//  if not Assigned(MasterAgreement) then MasterAgreement := TMasterAgreement.Create;

//  AGR_ID := MasterAgreement.GetLastIDAgreement;
{  tempResult1 := MasterAgreement.InputDataMasterAgreement
  (AGR_ID, DialogUnit,edtNoAgreement.Text,dtStart.Date,dtEnd.Date,intedtPeriode.Value,
   PerID,intedtInvoice.Value,
   isPKP,isPPN,isPPH,edtDesc.Text,CustCode,FLoginId, PajakId, DialogUnit);
}
  Result := False;
//  if AgreementID>0 then
//     FNewMasterAgreement.LoadByID(aAgreementID, DialogUnit);
  if Trim(cbSupCode.Text)='' then
     iSup_Unt_ID := 0
  else iSup_Unt_ID := DialogUnit;

//  FNewMasterAgreement.UpdateData(CustCode, DialogUnit, dtEnd.Date,
//             dtStart.Date, aAgreementID, intedtInvoice.Value,
//             isPKP, StrToInt(PajakId), PerID, cbpSupCode.Text,
//             iSup_Unt_ID, TpByrID, DialogUnit, edtNoAgreement.Text,
//             DialogUnit, intedtPeriode.Value, DialogUnit, DialogUnit,
//             isPPN, isPPH, edtDesc.Text);

  tempResult2 := AddDetilAgreement(aAgreementID);
//  if (OldTermPeriode=intedtPeriode.Value)And(OldPeriode=cbpPeriode.Value)
//  And(OldNoOfInvoice=intedtInvoice.Value)And(OldInvoiceTotal=curredtTotal.Value) then
//     tempResult3 := True
//  else
     tempResult3 := AddJadwalAgreement(aAgreementID);

//  try
//  if tempResult2 and tempResult3 then
//    if FNewMasterAgreement.SaveToDB then
//    begin
//      cCommitTrans;
//      edtDesc.Text := '';
//      Result := True;
//    end
//    else
//    begin
//      cRollbackTrans;
//      Result := False;
//    end
//  else
//  begin
//      CommonDlg.ShowError('Gagal Menyimpan Sebagian Data Detail');
//      Result := False;
//  end;
//  finally
//    if Not Result then
//      CommonDlg.ShowError('Gagal Menyimpan Data');
//    cRollBackTrans;
//    Close;
//  end;

end;

function TfrmDialogMasterAgreement.checkEmpty(): Boolean;
var countChk: Integer;
    projasCode: string;
    errorField: string;
begin
  //init
  Result := True;
  errorField := ' ';
  //checking for empty field
  //agreement
  if cbCustCode.Text = '' then
  begin
    errorField := 'CUSTOMER CODE, ';
    cbCustCode.SetFocus;
    Result:= False;
  end;
  if edtNoAgreement.Text = '' then
  begin
    errorField := errorField + 'NO. AGREEMENT, ';
    edtNoAgreement.SetFocus;
    Result:= False;
  end;
  if (cbPeriode.Text = '') or (PerID = 0) then
  begin
    errorField := errorField + 'PERIODE, ';
    cbPeriode.SetFocus;
    Result:= False;
  end;

  if Result = False then
  begin
    SetLength(errorField,Length(errorField)-2);
    CommonDlg.ShowErrorEmpty(errorField);
    Exit;
  end;

  //detil agreement
//  if strgGrid.RowCount > 1 then
//  begin
//    for countChk := 2 to strgGrid.RowCount do
//    begin
//      projasCode := strgGrid.Cells[_KolCODE,countChk-1];
//      if countChk = 2 then
//      begin
//        if projasCode = '' then
//        begin
//          strgGrid.SelectRows(1,1);
//          strgGrid.RemoveSelectedRows;
//        end
//        else
//        begin
//          with cOpenQuery(GetSQLsearchProjasByCode(projasCode), False) do
//          begin
//            try
//              Last;
//              if RecordCount < 1 then
//              begin
//                CommonDlg.ShowError(' PRODUCT '+ projasCode +' IS NOT LISTED ');
//                Result := False;
//                Exit;
//              end;
//
//            finally
//              Free;
//            end;
//          end;
//        end; //else '' projas
//      end
//      else
//      begin
//        with cOpenQuery(GetSQLsearchProjasByCode(projasCode), False) do
//        begin
//          try
//            Last;
//            if RecordCount < 1 then
//            begin
//              CommonDlg.ShowError(' PRODUCT '+ projasCode +' IS NOT LISTED ');
//              Result := False;
//              Exit;
//            end;
//
//          finally
//            Free;
//          end;
//        end;
//      end;
//    end; // for to do
//
//  end; //f strgrid.rowcnt

  //jadwal agreement
end;

procedure TfrmDialogMasterAgreement.footerDialogMasterbtnSaveClick(
  Sender: TObject);
//var
//  IDLokal: Integer;

begin
  if not (checkEmpty) then Exit;

  if cbbPKP.Text = 'PKP' then
    isPKP := 1
  else
    isPKP := 0;

  if cbbPPH.Text = 'PPH' then
    isPPH := 1
  else
    isPPH := 0;

  Try
    Self.Enabled := False;
    if (FormMode = fmAdd) then
    begin
      IsProcessSuccessfull := SaveAgreement;
    end
    else //edit mode
    begin
      IsProcessSuccessfull := SaveAgreement(AgreementID);
    end;
  Finally
      Self.Enabled := True;
  End;

  if IsProcessSuccessfull then
    Close;
end;

procedure TfrmDialogMasterAgreement.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = Ord('T')) and (ssctrl in Shift) then
  begin
//    if strgGrid.Cells[_KolCODE,strgGrid.RowCount-1] = '' then
//    begin
//      CommonDlg.ShowErrorEmpty('PRODUCT CODE');
//      strgGrid.SetFocus;
//      Exit;
//    end
//    else
//    begin
//       lbl18Click(Sender);
//    end;
//  end
//  else if (Key = Ord('R')) and (ssctrl in Shift) then
//  begin
//    if strgGrid.RowCount = 2 then
//    begin
//      strgGrid.ClearRows(1, 1);
//      CurrTipeProdukId := '';
//    end
//    else
//      strgGrid.RemoveSelectedRows;
//
//    curredtTotal.Text := FormatCurr('##,##0.00', CountTotal);
  end
  else if (Key = VK_ESCAPE) then
  begin
      footerDialogMasterbtnCloseClick(Sender);
  end;

end;

procedure TfrmDialogMasterAgreement.showDataEdit();
begin
//  cbPeriode.Value      := PerName;
//  cbPajak.Value        := PajakName;
//  cbPajak.SearchValue  := PajakName;
//  cbPajak.DoSearch;
//  PajakId               := cbpPajak.Cells[0, cbpPajak.Row];

  edtNoAgreement.SetFocus;
end;

procedure TfrmDialogMasterAgreement.FormShow(Sender: TObject);
begin
  inherited;
  if FormMode = fmAdd then
  begin
//    dtStart.Date        := cGetServerTime;
//    dtEnd.Date          := cGetServerTime;
    edtNoAgreement.Text := getNewAgreementNo;

    //Supplier
//    LoadDropDownData(cbpSupCode, GetListSuplierByUnitId(DialogUnit));
  end
  else if (FormMode = fmEdit) then
  begin
  end;

//  LoadDropDownData(cbCustCode, GetListCustomerByUnitId(DialogUnit));
//
//  //Periode
//  LoadDropDownData(cbpPeriode, GetListDataPeriode(DialogUnit));
//  cbpPeriode.SearchValue := 'BULAN';
//  cbpPeriode.Value       := 'BULAN';
//  cbpPeriode.DoSearch;
//  PerID := StrToInt(cbpPeriode.Cells[0,cbpPeriode.Row]);
//
//  //refStatus_Proses
//  LoadDropDownData(cbpStaPro, GetListDataStatusProses(DialogUnit));
//  if cbpStaPro.RowCount>3 then
//  begin
//     cbpStaPro.Value       := 'OUTSTANDING';
//     cbpStaPro.SearchValue := cbpStaPro.Value;
//     cbpStaPro.CloseUp;
//     StaProID              := StrToInt(cbpStaPro.Cells[0, cbpStaPro.Row]);
//     cbpStaPro.Enabled     := True; ///False;
//  end;
//
//  LoadDropDownData(cbpTipeBayar, GetListDataTipePembayaran(DialogUnit));
//  cbpTipeBayar.SearchValue := 'CASH';
//  cbpTipeBayar.DoSearch;
//  TpByrID := StrToInt(cbpTipeBayar.Cells[0, cbpTipeBayar.Row]);
//
//  if TpByrID>=0 then
//    cbpTipeBayar.Value := 'CASH';
//
//  //Pajak
//  LoadDropDownData(cbpPajak, GetListPajakByUnitId(DialogUnit));
//  strDefaultPajakValue := GetDefaultPajak(DialogUnit);
//
//  cbpPajak.Value       := strDefaultPajakValue;
//  cbpPajak.SearchValue := strDefaultPajakValue;
//  cbpPajak.DoSearch;
//  PajakId := cbpPajak.Cells[0, cbpPajak.Row];
//
//  strgGrid.AddCheckBox(_KolPRICE_PPN,1,False,False);
//
//  //Fill Data Customer
//  if (CustCode<>'') and (cbCustCode.RowCount>0) then
//  begin
//    cbCustCode.Value       := CustCode;
//    cbCustCode.SearchValue := CustCode;
//    cbCustCode.DoSearch;
//    edtCustName.Text        := cbCustCode.Cells[2, cbCustCode.Row];
//    TryStrToInt(cbCustCode.Cells[3, cbCustCode.Row], TOP);
//
//    LoadDropDownData(cbpSupCode, GetListSuplierByCustomerCode(CustCode));
//
//    cbpSupCode.Value        := SupCode;
//    cbpSupCode.SearchValue  := SupCode;
//    cbpSupCode.DoSearch;
//    edtSupName.Text         := cbpSupCode.Cells[2, cbpSupCode.Row];
//  end;

  if FormMode = fmEdit then
    showDataEdit();

  tsKontrak.Show;
  CountEndEffectiveDate;

  CurrTipeProdukId := '';
end;

procedure TfrmDialogMasterAgreement.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogMasterAgreement := nil;
end;

procedure TfrmDialogMasterAgreement.LoadDropDownData(ACombo: TcxLookupComboBox;
    aSQL: string);
begin
//  {Flush the old data}
//  ACombo.ClearGridData;
//
//  ACombo.ColCount := 3;
//  {Load the data}
//  if Acombo = cbCustCode then
//  begin
//    ACombo.ColCount := 4;
//    with cOpenQuery(GetListCustomerByUnitId(DialogUnit), False)do
//    begin
//      try
//        Last;
//        {Make sure the allocated storage is big enough}
//        ACombo.RowCount := RecordCount + 1;
//        ACombo.AddRow(['ID','CODE','NAME', 'TOP']);
//
//        if RecordCount > 0 then
//        begin
//          First;
//          while not Eof do
//          begin
//            try
//              ACombo.AddRow([FieldByName('CUST_ID').AsString,
//                             FieldByName('CUST_CODE').AsString,
//                             FieldByName('CUST_NAME').AsString,
//                             FieldByName('CUST_TOP').AsString]);
//            except
//            end;
//
//            Next;
//          end;
//        end
//        else
//        begin
//          ACombo.RowCount := 2;
//          ACombo.AddRow([' ',' ',' ']);
//        end;
//
//      finally
//        Free;
//      end;
//    end;
//  end
//  else if ACombo = cbpSupCode then
//  begin
//    with cOpenQuery(GetListSuplierByUnitId(DialogUnit), False) do
//    begin
//      try
//        Last;
//        ACombo.RowCount := RecordCount + 1;
//        ACombo.AddRow(['','SUP CODE','SUP NAME']);
//
//        if RecordCount > 0 then
//        begin
//          First;
//          while not Eof do
//          begin
//            ACombo.AddRow(['', FieldByName('KODE SUPPLIER').AsString,
//                             FieldByName('NAMA SUPPLIER').AsString]);
//
//            Next;
//          end;
//        end
//        else
//        begin
//          ACombo.RowCount := 2;
//          ACombo.AddRow([' ',' ',' ']);
//        end;
//
//      finally
//        Free;
//      end;
//    end;
//  end
//  else if ACombo = cbpPeriode then
//  begin
//    with cOpenQuery(GetListDataPeriode(DialogUnit), False) do
//    begin
//      try
//        Last;
//        ACombo.RowCount := RecordCount + 1;
//        ACombo.AddRow(['ID','PERIODE']);
//
//        if RecordCount > 0 then
//        begin
//          First;
//          while not Eof do
//          begin
//            try
//              ACombo.AddRow([FieldByName('PER_ID').AsString,
//                             FieldByName('PER_NAME').AsString]);
//            except
//            end;
//
//            Next;
//          end;
//        end
//        else
//        begin
//          ACombo.RowCount := 2;
//          ACombo.AddRow([' ',' ',' ']);
//        end;
//
//      finally
//        Free;
//      end;
//    end;
//  end
//  else if ACombo = cbpPajak then
//  begin
//    with cOpenQuery(GetListPajakByUnitId(DialogUnit), False) do
//    begin
//      try
//        Last;
//        ACombo.RowCount := RecordCount + 1;
//        ACombo.AddRow(['ID', 'NAMA PAJAK','PPN','KODE']);
//
//        if RecordCount > 0 then
//        begin
//          First;
//          while not Eof do
//          begin
//            try
//              ACombo.AddRow([FieldByName('PJK_ID').AsString,
//                             FieldByName('PJK_NAME').AsString,
//                             FieldByName('PJK_PPN').AsString,
//                             FieldByName('PJK_CODE').AsString
//                             ]);
//            except
//            end;
//
//            Next;
//          end;
//        end
//        else
//        begin
//          ACombo.RowCount := 2;
//          ACombo.AddRow([' ',' ',' ']);
//        end;
//
//      finally
//        Free;
//      end;
//    end;
//  end
//  else if ACombo = cbpStaPro then
//  begin
//    with cOpenQuery(GetListDataStatusProses(DialogUnit), False) do
//    begin
//      try
//        Last;
//        ACombo.RowCount := RecordCount + 1;
//        ACombo.AddRow(['ID','STATUS PROSES']);
//
//        if RecordCount > 0 then
//        begin
//          First;
//          while not Eof do
//          begin
//            try
//              ACombo.AddRow([FieldByName('STAPRO_ID').AsString,
//                             FieldByName('STAPRO_NAME').AsString]);
//            except
//            end;
//
//            Next;
//          end;
//        end
//        else
//        begin
//          ACombo.RowCount := 2;
//          ACombo.AddRow([' ',' ']);
//        end;
//
//      finally
//        Free;
//      end;
//    end;
//  end
//  else if ACombo = cbpTipeBayar then
//  begin
//    with cOpenQuery(GetListDataTipePembayaran(DialogUnit), False) do
//    begin
//      try
//        Last;
//        ACombo.RowCount := RecordCount + 1;
//        ACombo.AddRow(['','Tipe Pembayaran']);
//
//        if RecordCount > 0 then
//        begin
//          First;
//          while not Eof do
//          begin
//            try
//              ACombo.AddRow([FieldByName('TPBYR_ID').AsString,
//                             FieldByName('TPBYR_NAME').AsString]);
//            except
//            end;
//
//            Next;
//          end;
//        end
//        else
//        begin
//          ACombo.RowCount := 2;
//          ACombo.AddRow([' ',' ']);
//        end;
//
//      finally
//        Free;
//      end;
//    end;
//  end;
//
//  {Now shring the grid so its just big enough for the data}
//  ACombo.SizeGridToData;
//  //trik to activate acombo
//  ACombo.FixedRows := 1;
end;

procedure TfrmDialogMasterAgreement.cbpSupCodeCloseUp(Sender: TObject);
begin
  if cbSupCode.ItemIndex>1 then
  begin
//    SupCode         := cbSupCode.Cells[1, cbpSupCode.Row];
//    cbSupCode.Text := SupCode;
//    edtSupName.Text := cbSupCode.Cells[2, cbpSupCode.Row];
  end;
end;

procedure TfrmDialogMasterAgreement.strgGridCellValidate(Sender: TObject;
  ACol, ARow: Integer; var Value: String; var Valid: Boolean);
var
    tempProjasCode: string;
    tempTotal: Currency;
//    countVal: Integer;
    staCek: Boolean;
    tempPrice, tempPricePPN: Currency;
    tempPPN: Real;
begin
//  if ACol = _KolCODE then
//  begin
//    tempProjasCode := strgGrid.Cells[_KolCODE,ARow];
//
//    with cOpenQuery(GetSQLsearchProjasByCode(tempProjasCode), False) do
//    begin
//      try
//        Last;
//        First;
//
//        if (ARow=strgGrid.FixedRows) and (strgGrid.Cells[_KolCODE, strgGrid.FixedRows+1]='') then
//        begin
//             CurrTipeProdukId := Fieldbyname('PROJAS_TPPRO_ID').AsString
//        end;
//
//        if (CurrTipeProdukId <> '') and
//            (CurrTipeProdukId <> Fieldbyname('PROJAS_TPPRO_ID').AsString) then
//        begin
//          CommonDlg.ShowError('Untuk Agreement No: ' + edtNoAgreement.Text +
//            ' Pilih Product dengan Type yang sama');
//          strgGrid.SetFocus;
//          strgGrid.Col := _KolCODE;
//        end
//        else
//        begin
//          if RecordCount > 0 then
//          begin
//            strgGrid.AddCheckBox(_KolPRICE_PPN, ARow, False, False);
//            strgGrid.Alignments[_KolPRICE_PPN, ARow]   := taCenter;
//            strgGrid.Cells[_KolDESCRIPTION,ARow]       := FieldByName('PROJAS_NAME').AsString;
//            strgGrid.Ints[_KolPER_DAYS,ARow]           := (FieldByName('PER_DAYS').AsInteger);
//            strgGrid.Floats[_KolPJK_PPN,ARow]          := (FieldByName('PJK_PPN').AsCurrency);
//            strgGrid.Floats[_KolPROJAS_PRICE,ARow]     := (FieldByName('PROJAS_PRICE').AsCurrency);
//
//            if (ARow = strgGrid.FixedRows) then
//              CurrTipeProdukId := Fieldbyname('PROJAS_TPPRO_ID').AsString;
//
//            try
//              tempPPN := (strgGrid.Floats[_KolPJK_PPN,ARow]);
//            except
//              tempPPN := 10; //change with search to default
//            end;
//
//            try
//              tempPrice := (strgGrid.Floats[_KolPROJAS_PRICE,ARow]);
//            except
//              tempPrice := 0;
//            end;
//
//            strgGrid.GetCheckBoxState(_KolPRICE_PPN,ARow,staCek);
//            if staCek then
//            begin
//              tempPricePPN := tempPrice / (1 + (tempPPN/100));
//            end
//            else
//              tempPricePPN := tempPrice;
//
//            strgGrid.Floats[_KolPROJAS_PRICE, ARow] := (tempPricePPN);
//
//            if strgGrid.Cells[_KolQTY_ORDER, ARow]='' then
//               strgGrid.Ints[_KolQTY_ORDER, ARow]      := 0;
//
//            strgGrid.Floats[_KolSUB_TOTAL,ARow]     := (tempPricePPN * (strgGrid.Floats[_KolQTY_ORDER, ARow]));
//            dayScale                                := intedtPeriode.Value;
//            strgGrid.Floats[_KolTOTAL_AMOUNT,ARow]  := dayScale*(strgGrid.Floats[_KolSUB_TOTAL,ARow]) ;
//            edtUnitPrice.Text                       := FormatCurr('##,##0.00', (strgGrid.Floats[_KolPROJAS_PRICE,strgGrid.Row]));
//
//            try
//               strgGridCheckBoxClick(Sender, _KolPRICE_PPN, ARow, False);
//            except
//
//            end;
//            strgGrid.Col := _KolQTY_ORDER;
//    //        if FormMode = fmAdd then
//      //      strgGrid.Col := 3;
//          end;
//        end;
//
//      finally
//        Free;
//      end;
//    end;
//  end
//  else if (ACol in [_KolQTY_ORDER, _KolPROJAS_PRICE]) then
//  begin
//    //jika subtotal = '' maka >> 0
//    if strgGrid.Cells[_KolSUB_TOTAL,ARow] = '' then
//      strgGrid.Floats[_KolSUB_TOTAL,ARow] := 0;
//
//    strgGrid.Floats[_KolSUB_TOTAL, ARow]   := (strgGrid.Floats[_KolQTY_ORDER, ARow] * strgGrid.Floats[_KolPROJAS_PRICE, ARow]);
//    strgGrid.Floats[_KolTOTAL_AMOUNT,ARow] := (Round(dayScale) * (strgGrid.Floats[_KolSUB_TOTAL,ARow]));
//
//    //sum total
//    tempTotal := CountTotal;
//
//    curredtTotal.Text := FormatCurr('##,##0.00',tempTotal);
//    //strgGrid.Col := _KolPRICE_PPN;
//    strgGrid.Alignments[_KolQTY_ORDER, ARow]    := taRightJustify;
//    strgGrid.Alignments[_KolSUB_TOTAL, ARow]    := taRightJustify;
//    strgGrid.Alignments[_KolTOTAL_AMOUNT, ARow] := taRightJustify;
//  end;
end;

procedure TfrmDialogMasterAgreement.strgGridKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
//var staCek: Boolean;
//    tempPrice,tempSubTotal: Currency;
//    tempPPN: Real;
begin
  if Key = VK_F5 then
  begin
       lblSearchProductClick(Sender);
  end; //if vk_f5

end;

procedure TfrmDialogMasterAgreement.cbpSupCodeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
//var arrParam: TArr;
begin
  inherited;
  if Length(cbSupCode.Text) = 1 then
  begin
    supCode   := UpperCase(cbSupCode.Text);
//    LoadDropDownData(cbSupCode, GetListSuplierByUnitId(DialogUnit, supCode + '%'));
  end;

  if (Key = Word(Ord(VK_F5))) then
  begin

    if not Assigned(frmPopUpSelectCustomer) then
      frmPopUpSelectCustomer := TfrmPopUpSelectCustomer.Create(Application);

    frmPopUpSelectCustomer.Modul       := mMasterAgreement;
    frmPopUpSelectCustomer.SuplierCode := SupCode;

    frmPopUpSelectCustomer.ShowModal;

    if (frmPopUpSelectCustomer.IsProcessSuccessfull) then
    begin
      cbCustCode.Text := frmPopUpSelectCustomer.CustomerCode;
      cbCustCode.SetFocus;
//      cbCustCodeCloseUp(Self);
    end;

    frmPopUpSelectCustomer.Free;
  end; // end 13
end;

procedure TfrmDialogMasterAgreement.cbbPKPChange(Sender: TObject);
begin
  inherited;
  if cbbPKP.Text = 'PKP' then
  begin
//    cbbPPN.ItemIndex := 1;
//    cbpPajak.Enabled := True;
//    isPPN := 1;

    isPKP := 1;

    cbbPPH.Enabled := True;
    cbbPPH.ItemIndex := 1;
    if cbPajak.itemindex=1 then
       cbPajak.Text := 'PPN 10%';

    //** price PPN item ditutup dl.
    {if strgGrid.RowCount > 1 then
    for countI := 1 to strgGrid.RowCount-1 do
    begin
      strgGrid.AddCheckBox(_KolPRICE_PPN,countI,True,True);
      strgGrid.Alignments[_KolPRICE_PPN, countI]:= taCenter;
    end;
    }
    cbPajak.SetFocus;
  end
  else
  begin
//    cbbPPN.ItemIndex := 0;
//    cbpPajak.Enabled := False;
//    isPPN := 0;
    isPKP := 0;
    isPPH := 0;
//    PajakId := cbPajak.Cells[0, 1];

    cbbPPH.Enabled   := False;
    cbbPPH.ItemIndex := 0;
    cbPajak.Text   := 'NON PPN';

    {**
    if strgGrid.RowCount > 1 then
    for countI := 1 to strgGrid.RowCount-1 do
    begin
      strgGrid.AddCheckBox(_KolPRICE_PPN,countI,False,False);
      strgGrid.Alignments[_KolPRICE_PPN, countI]:= taCenter;
    end;
    }
  end;
end;

procedure TfrmDialogMasterAgreement.strgGridCheckBoxClick(Sender: TObject;
  ACol, ARow: Integer; State: Boolean);
var staCek: Boolean;
    tempPrice,tempSubTotal,tempTotal: Currency;
    tempPPN, tempQTY: Real;
    countVal: Integer;
begin
  if ACol = _KolPRICE_PPN then //qry total
  begin
//    try
//      strgGrid.Cells[_KolPJK_PPN,ARow] := cbpPajak.Cells[2, cbpPajak.Row];
//      tempPPN := StrToFloat(cbpPajak.Cells[2, cbpPajak.Row]);
//    except
//      tempPPN := 10; //change with search to default
//    end;
//    try
//      tempQTY := (strgGrid.Floats[_KolQTY_ORDER,ARow]);
//    except
//      tempQTY := 0;
//    end;
//    try
//      tempPrice := (strgGrid.Floats[_KolPROJAS_PRICE,ARow]);
//    except
//      tempPrice := 0;
//    end;
//    strgGrid.GetCheckBoxState(_KolPRICE_PPN,ARow,staCek);
//    if staCek then
//    begin
//      tempSubTotal := tempPrice / (1 + (tempPPN/100));
////      tempSubTotal := tempPrice * (100 / (tempPPN+100));
//    end
//    else tempSubTotal := tempPrice + (tempPrice * (tempPPN/100));
//
//    strgGrid.Cells[_KolPROJAS_PRICE,ARow] := CurrToStr(tempSubTotal) ;
//    tempTotal                             := tempSubTotal * tempQTY;
//    strgGrid.Cells[_KolSUB_TOTAL, ARow]   := CurrToStr(tempTotal);
//    strgGrid.Cells[_KolTOTAL_AMOUNT,ARow] := CurrToStr(Round(dayScale) * tempTotal);
//
//    //sum total
//    tempTotal := 0;
//    if strgGrid.RowCount > 1 then
//    for countVal := 1 to strgGrid.RowCount-1 do
//      tempTotal := tempTotal + (strgGrid.Floats[_KolTOTAL_AMOUNT,countVal]);
//
//    curredtTotal.Text := FormatCurr('##,##0.00',tempTotal);
//    // FormatedStringToFloat(strgGrid.Cells[_KolPROJAS_PRICE,strgGrid.Row])
//    edtUnitPrice.Text := FormatCurr('##,##0.00', tempSubTotal);
//    curredtTotal.Text := FormatCurr('##,##0.00', CountTotal);
  end;
end;

procedure TfrmDialogMasterAgreement.cbpPeriodeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = Word(Ord(VK_RETURN))) then
  begin
    cbpPeriodeCloseUp(Sender);
  end;

  CountEndEffectiveDate;
end;

procedure TfrmDialogMasterAgreement.CountEndEffectiveDate;
var {tempHariPer,} countI, tempPeriode: Integer;
    tempSubTotal{, tempQTY}: Currency;
//    tempDate: TDateTime;
    tempDay, tempMonth, tempYear: Word;
begin
  if (PerID = 0) then
    Exit;

  tempPeriode:= Round(intedtPeriode.Value);

  tempDay   := DayOf(dtStart.Date);
  tempMonth := MonthOf(dtStart.Date);
  tempYear  := YearOf(dtStart.Date);


  if cbPeriode.Text = 'BULAN' then
  begin
    tempMonth := tempMonth + tempPeriode;
    if tempMonth > 12 then
    begin
      tempYear  := tempYear + 1;
      tempMonth := tempMonth - 12;
    end;


    if IsValidDate(tempYear, tempMonth, tempDay) then
      dtEnd.Date := EncodeDate(tempYear, tempMonth, tempDay)
    else
      dtEnd.Date := EncodeDate(tempYear, tempMonth + 1, tempDay - 1 - DaysInMonth(EncodeDate(tempYear, tempMonth, 1)));
  end
  else
  begin
    dtEnd.Date := dtStart.Date + intedtPeriode.Value;
  end;


  hariPeriode := DaysBetween(dtEnd.Date, dtStart.Date);

//  if (strgGrid.RowCount >= 2) and (strgGrid.Cells[_KolCODE, 1] <> '') then
//  for countI := 1 to strgGrid.RowCount-1  do
//  begin
//    try
//      tempSubTotal := (strgGrid.Floats[_KolSUB_TOTAL,countI]);
//    except
//      tempSubTotal := 0;
//    end;
//
//      dayScale := intedtPeriode.Value;
//
//    strgGrid.Cells[_KolTOTAL_AMOUNT,countI] := CurrToStr(dayScale * tempSubTotal);
//  end;// end for count to rowcount
  curredtTotal.Text := FormatCurr('##,##0.00',CountTotal);
end;

procedure TfrmDialogMasterAgreement.intedtPeriodeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    if (PerID = 0) then
      cbPeriode.SetFocus
    else
      CountEndEffectiveDate;
  end;
end;

procedure TfrmDialogMasterAgreement.SetIsPajak(const Value: Boolean);
begin
  FIsPajak := Value;
end;

procedure TfrmDialogMasterAgreement.SetPajakId(const Value: string);
begin
  FPajakId := Value;
end;

procedure TfrmDialogMasterAgreement.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogMasterAgreement.SetPajakName(const Value: string);
begin
  FPajakName := Value;
end;

procedure TfrmDialogMasterAgreement.strgGridGetFloatFormat(Sender: TObject;
  ACol, ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  FloatFormat := '%0.2n';
  if (ARow>0) and (ACol in [_KolPROJAS_PRICE, _KolSUB_TOTAL,_KolTOTAL_AMOUNT]) then //, _KolPROJAS_PRICE] then
    IsFloat := True
  else
    IsFloat := False;
end;

procedure TfrmDialogMasterAgreement.SetCurrTipeProdukId(
  const Value: string);
begin
  FCurrTipeProdukId := Value;
end;

procedure TfrmDialogMasterAgreement.cbpSupCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

function TfrmDialogMasterAgreement.CountTotal: Currency;
var cTemp: Currency;
    i: Integer;
begin
  cTemp := 0;

//  for i := 1 to strgGrid.RowCount - 1 do
//  begin
//    if strgGrid.Cells[_KolTOTAL_AMOUNT, i] <> '' then
//      cTemp := cTemp + (strgGrid.Floats[_KolTOTAL_AMOUNT, i]);
//  end;

  Result := cTemp;
end;

procedure TfrmDialogMasterAgreement.intedtInvoiceExit(Sender: TObject);
begin
  inherited;
  if intedtInvoice.Value > intedtPeriode.Value then
  begin
    CommonDlg.ShowError('Invoice can not be bigger than Term Periode');
    intedtInvoice.Value := intedtPeriode.Value;
    intedtPeriode.SetFocus;
  end;
end;

procedure TfrmDialogMasterAgreement.cbCustCodeCloseUp(Sender: TObject);
var
  aMasterCustomerId: Integer;
begin
  inherited;
//    if (cbCustCode.Text = '') or (cbCustCode.Value = ' ') then exit;
//    edtCustName.Text := cbCustCode.Cells[2, cbCustCode.Row];
//    try
//      TOP := StrToInt(cbCustCode.Cells[3, cbCustCode.Row]);
//    except
//      TOP := 0;
//    end;
//    CustCode := cbCustCode.Cells[1, cbCustCode.Row];
//    cbCustCode.Text := CustCode;
//
//    //Supplier
//    LoadDropDownData(cbpSupCode, GetListSuplierByCustomerCode(CustCode));

//    FNewCustomer := TNewCustomer.CreateWithUser(Self, FLoginId, fLoginUnitId);
//    If TryStrToInt(cbCustCode.Cells[0, cbCustCode.Row], aMasterCustomerId) then
//    begin
//      if FNewCustomer.LoadByID(aMasterCustomerId, DialogUnit) then
//      begin
//          cbbPKP.ItemIndex := FNewCustomer.IsPKP;
//          cbbPPH.ItemIndex := FNewCustomer.ISPPH23;
//          cbbPKPChange(Sender);
//          if FNewCustomer.TipeBayar.Nama<>'' then
//          begin
//              cbpTipeBayar.Value := FNewCustomer.TipeBayar.Nama;
//          end;
//      End;
//    end;
//    FNewCustomer.Free;
    CountEndEffectiveDate;
    edtNoAgreement.SetFocus;


end;

procedure TfrmDialogMasterAgreement.cbpTipeBayarCloseUp(Sender: TObject);
begin
  inherited;
//    cbTipeBayar.Text := cbTipeBayar.Cells[1,cbTipeBayar.Row];
//    try
//      TpByrID := StrToInt(cbTipeBayar.Cells[0,cbTipeBayar.Row]);
//    except
//      TpByrID := 0;
//    end;
end;

procedure TfrmDialogMasterAgreement.cbpTipeBayarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
  begin
       cbpTipeBayarCloseUp(Sender);
  end;
end;

procedure TfrmDialogMasterAgreement.cbpPeriodeCloseUp(Sender: TObject);
begin
  inherited;
//    cbPeriode.Text := cbPeriode.Cells[1,cbPeriode.Row];
//    try
//      PerID := StrToInt(cbPeriode.Cells[0,cbPeriode.Row]);
//    except
//      PerID := 0;
//    end;
end;

procedure TfrmDialogMasterAgreement.cbpStaProCloseUp(Sender: TObject);
begin
  inherited;
//    cbStaPro.Text := cbStaPro.Cells[1,cbStaPro.Row];
//    try
//      StaProID := StrToInt(cbStaPro.Cells[0,cbStaPro.Row]);
//    except
//      StaProID := 0;
//    end;
end;

procedure TfrmDialogMasterAgreement.cbpStaProKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
  begin
    cbpStaProCloseUp(Sender);
  end;

end;

procedure TfrmDialogMasterAgreement.lblSearchProductClick(Sender: TObject);
var
  tempProjasCode: string;
begin
  inherited;
//    if not Assigned(frmDialogSearchProductNBD) then
//      frmDialogSearchProductNBD := TfrmDialogSearchProductNBD.Create(Self);
//
//      frmDialogSearchProductNBD.DialogUnit := DialogUnit;
//      frmDialogSearchProductNBD.DialogCompany := DialogCompany;
//
//      frmDialogSearchProductNBD.ShowModal;
//
//      if frmDialogSearchProductNBD.IsProcessSuccessfull then
//      begin
//        tempProjasCode := frmDialogSearchProductNBD.ProductNBDCode;
//
//        with cOpenQuery(GetSQLsearchProjasByCode(tempProjasCode), False) do
//        begin
//          try
//
//            if (strgGrid.Row=strgGrid.FixedRows) and
//                (strgGrid.Cells[_KolCODE, strgGrid.FixedRows+1]='') then
//            begin
//                 CurrTipeProdukId := Fieldbyname('PROJAS_TPPRO_ID').AsString
//            end;
//
//            if (CurrTipeProdukId <> '') and
//                (CurrTipeProdukId <> Fieldbyname('PROJAS_TPPRO_ID').AsString) and
//                (strgGrid.RowCount>2) then
//            begin
//              CommonDlg.ShowError('For Agreement No: ' + edtNoAgreement.Text +
//                ' Select Product With Same Type');
//              strgGrid.SetFocus;
//              strgGrid.Col := _KolCODE;
//              Exit;
//            end;
//
//            dayScale := intedtPeriode.Value;
//            strgGrid.Cells[_KolCODE,strgGrid.Row]            := frmDialogSearchProductNBD.ProductNBDCode;
//            strgGrid.Cells[_KolDESCRIPTION,strgGrid.Row]     := frmDialogSearchProductNBD.ProductNBDName;
//            strgGrid.Cells[_KolPER_DAYS,strgGrid.Row]        := frmDialogSearchProductNBD.ProductNBDDays;
//            strgGrid.Alignments[_KolPRICE_PPN, strgGrid.Row] := taCenter;
//            strgGrid.AddCheckBox(_KolPRICE_PPN, strgGrid.Row, False, False);
//    //        if CommonDlg.Confirm('Change Product Property ?')=mrYes  then
//            begin
//                //=========================================================================
//                strgGrid.Cells[_KolPER_DAYS,strgGrid.Row]     := frmDialogSearchProductNBD.ProductNBDDays;
//                strgGrid.Cells[_KolPJK_PPN,strgGrid.Row]      := frmDialogSearchProductNBD.ProductNBDPPN;
//                strgGrid.Cells[_KolPROJAS_PRICE,strgGrid.Row] := frmDialogSearchProductNBD.ProductNBDPrice;
//                //=========================================================================
//                strgGridCheckBoxClick(Sender, _KolPRICE_PPN, strgGrid.Row, False);
//            end;

//          finally
//            Free;
//          end;
//        end;
//      end; //if is succesful
end;

procedure TfrmDialogMasterAgreement.cbCustCodeChange(Sender: TObject);
begin
  inherited;
    cbSupCode.Text  := '';
    edtSupName.Text := '';
end;

procedure TfrmDialogMasterAgreement.lblNewRowClick(Sender: TObject);
begin
  inherited;
//  strgGrid.AddRow;
//  strgGrid.AddCheckBox(_KolPRICE_PPN, strgGrid.Row + 1, False, False);
//  strgGrid.Alignments[_KolPRICE_PPN, strgGrid.Row + 1]:= taCenter;
end;

procedure TfrmDialogMasterAgreement.lblRemoveRowClick(Sender: TObject);
var
  iBaris: Integer;
begin
  inherited;
//    if strgGrid.RowCount <= 2 then
//    begin
//      iBaris:=strgGrid.Row;
//      strgGrid.AddRow;
//      strgGrid.Rows[iBaris].Clear;
//      strgGrid.RemoveRows(ibaris,1);
//    end
//    else begin
//      strgGrid.Rows[strgGrid.Row].Clear;
//      strgGrid.RemoveSelectedRows;
//    end;
end;

procedure TfrmDialogMasterAgreement.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = Ord('T')) and (ssCtrl in Shift) then
  Begin
    lblNewRowClick(sender);
  End;

  if (key = Ord('R')) and (ssCtrl in Shift) then
  Begin
    lblRemoveRowClick(sender);
  End;
end;

procedure TfrmDialogMasterAgreement.footerDialogMasterbtnCloseClick(
  Sender: TObject);
begin
  inherited;
  Self.ModalResult := mrCancel;
  if grdGridView.DataController.RecordCount > 0then
  if CommonDlg.Confirm('Apakah Anda ingin menutup form ' + Self.Caption + '?') = mrNo then
  begin
    Self.ModalResult := mrNone;
  end;

end;

function TfrmDialogMasterAgreement.getNewAgreementNo: string;
var
  sSQL, aFormat : String;
  iLastNo, iLengthFormat : integer;
begin
  iLastNo := 0;
//  aFormat := getGlobalVar('MAGM_NO');
  if aFormat='' then
     aFormat := '"AGM"YYMM';
  aFormat := FormatDateTime(aFormat, dtStart.Date);
  iLengthFormat := Length(aFormat);
  sSQL    := 'Select AGR_NO from AGREEMENT '
          +  ' where AGR_NO like ' + QuotedStr('%'+aFormat+'%')
          +  ' order by AGR_NO Desc';  //tak mengenal Company
//  with cOpenQuery(sSQL) do
//  begin
//    try
//        if not FieldByName('AGR_NO').IsNull then
//          iLastNo := StrToInt(RightStr(fieldbyname('AGR_NO').AsString,
//                         Length(fieldbyname('AGR_NO').AsString)-iLengthFormat));
//    finally
//      Free;
//    end;
//  end;
//  Result := aFormat + StrPadLeft(IntToStr(iLastNo+1), 10-iLengthFormat, '0');
end;

procedure TfrmDialogMasterAgreement.dtStartExit(Sender: TObject);
begin
  inherited;
  if FormMode = fmAdd then
     edtNoAgreement.Text := getNewAgreementNo;

end;

procedure TfrmDialogMasterAgreement.cbpPajakChange(Sender: TObject);
var
  i : integer;
  sPajakCode : String;
begin
  inherited;
  if (cbPajak.ItemIndex = 1) AND (isPKP = 1) then
  begin
    CommonDlg.ShowError('Customer is PKP' + #13#10
                +'Please Check your data');
  end;

//  PajakId    := cbPajak.Cells[0, cbPajak.Row];
//  sPajakCode := cbPajak.Cells[3, cbPajak.Row];
  if sPajakCode <> '0' then
    isPPN := 1
  else
    isPPN := 0;  

//  with strgGrid do
//  begin
//    for i := 1 to RowCount-1 do
//    begin
//        Cells[_KolPJK_PPN, i] := cbpPajak.Cells[2, cbpPajak.Row];
//    end;
//  end;

end;

function TfrmDialogMasterAgreement.GetSQLsearchProjasByCode(AprojasCode:
    string): string;
begin
  Result :=  'SELECT PJ.*, PER.PER_NAME, PER.PER_DAYS, PJK.PJK_PPN'
        + ' FROM PRODUK_JASA PJ'
        + ' LEFT JOIN REF$PERIODE PER ON PER.PER_ID = PJ.PROJAS_PER_ID'
        + ' LEFT JOIN REF$PAJAK PJK ON PJK.PJK_ID = PJ.PROJAS_PJK_ID'
        + ' WHERE PJ.PROJAS_UNT_ID = '+ IntToStr(DialogUnit)
        + ' AND PJ.PROJAS_CODE = '+ QuotedStr(AprojasCode)
        + ' ORDER BY PJ.PROJAS_CODE';
end;

procedure TfrmDialogMasterAgreement.strgGrid2GetFloatFormat(
  Sender: TObject; ACol, ARow: Integer; var IsFloat: Boolean;
  var FloatFormat: String);
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

end.
