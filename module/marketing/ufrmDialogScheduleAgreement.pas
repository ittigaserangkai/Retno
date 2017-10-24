unit ufrmDialogScheduleAgreement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, StdCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxPC, cxTextEdit, cxCurrencyEdit, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button;

type
  TfrmDialogScheduleAgreement = class(TfrmMasterDialog)
    pnl2: TPanel;
    lbl5: TLabel;
    lbl2: TLabel;
    edtDescription: TEdit;
    curredtTotal: TcxCurrencyEdit;
    pcMasterAgreement2: TcxPageControl;
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
    tsJadwalAccrual: TcxTabSheet;
    cxgrd2: TcxGrid;
    grdAccrual: TcxGridDBTableView;
    cxcol8: TcxGridDBColumn;
    cxcol9: TcxGridDBColumn;
    cxcol10: TcxGridDBColumn;
    cxcol11: TcxGridDBColumn;
    cxcol12: TcxGridDBColumn;
    cxcol13: TcxGridDBColumn;
    grdlvlMaster2: TcxGridLevel;
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FIsProcessSuccessfull: boolean;
    FAgreementId: Integer;
    is_Save : Boolean;
    { Private declarations }
    function UpdateScheduleAgreement: Boolean;
    procedure SetIsProcessSuccessfull(const Value: Boolean);
    procedure SetAgreementId(const Value: Integer);
  public
    { Public declarations }
    untID: SmallInt;
  published
    property AgreementId: Integer read FAgreementId write SetAgreementId;
    property IsProcessSuccessfull: Boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogScheduleAgreement: TfrmDialogScheduleAgreement;

implementation

uses
  uTSCommonDlg, ufrmMain, DateUtils, uRetnoUnit;

const
     _Kol2No                    : byte = 0;
     _Kol2INVOICE_DATE          : byte = 1;
     _Kol2INVOICE_TERM          : byte = 2;
     _Kol2INVOICE_NO            : byte = 3;
     _Kol2INVOICE_DUEDATE       : byte = 4;
     _Kol2STATUS                : byte = 5;
     _Kol2TOTAL_INVOICE         : byte = 6;
     _Kol2ID_JDWL_AGREEMENT     : byte = 7;
     _Kol2DESC_INVOICE          : byte = 8;
     _Kol2INVOICE_DATE_ID       : byte = 9;
     _Kol2INVOICE_DUEDATE_ASAL  : byte = 10;
     _Kol2IS_PRINTED            : byte = 11;

     _Kol3No                    : byte = 0;
     _Kol3ACCRUAL_DATE          : byte = 1;
     _Kol3PERIODE               : byte = 2;
     _Kol3ACRRUAL_NO            : byte = 3;
     _Kol3STATUS                : byte = 4;
     _Kol3TOTALACCRUAL          : byte = 5;
     _Kol3ID_JDWL_AGREEMENT     : byte = 6;
     _Kol3DESC_ACRRUAL          : byte = 7;
     _Kol3ACCRUAL_DATE_ASAL     : byte = 8;

{$R *.dfm}

procedure TfrmDialogScheduleAgreement.SetIsProcessSuccessfull(const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogScheduleAgreement.SetAgreementId(const Value: Integer);
begin
  FAgreementId := Value;
end;

function TfrmDialogScheduleAgreement.UpdateScheduleAgreement: Boolean;
var countI: Integer;
    tempInvNo, tempACCRU_NO, tempACCRU_Status: String;
    InvoiceDate, tempDate, tempAccrDate: TDateTime;
    AGRJDWL_ID, StaProID: Integer;
    tempTotal, tempACCRU_TOTAL: Currency;
begin
  //init
//  Result := false;

  is_Save := False;
//  for countI := 1 to strgGrid2.RowCount-1 do
//  begin
//    if (strgGrid2.Cells[_Kol2IS_PRINTED, countI]='1')
//    and ((strgGrid2.Cells[_Kol2INVOICE_DATE,countI]<>strgGrid2.Cells[_Kol2INVOICE_DATE_ID,countI])
//    or (strgGrid2.Cells[_Kol2INVOICE_DUEDATE,countI]<>strgGrid2.Cells[_Kol2INVOICE_DUEDATE_ASAL,countI])
//    or (strgGrid3.Cells[_Kol3ACCRUAL_DATE,countI]<>strgGrid3.Cells[_Kol3ACCRUAL_DATE_ASAL,countI])) then
//    begin
//        CommonDlg.ShowError('Invoice ' + strgGrid2.Cells[_Kol2INVOICE_NO,countI] + ' tidak dapat dirubah karena telah dicetak.');
//        strgGrid2.Cells[_Kol2INVOICE_DATE,countI]     := strgGrid2.Cells[_Kol2INVOICE_DATE_ID,countI];
//        strgGrid2.Cells[_Kol2INVOICE_DUEDATE,countI]  := strgGrid2.Cells[_Kol2INVOICE_DUEDATE_ASAL,countI];
//        strgGrid3.Cells[_Kol3ACCRUAL_DATE,countI]     := strgGrid3.Cells[_Kol3ACCRUAL_DATE_ASAL,countI];
//        Continue;
//    end;
//
//    if (strgGrid2.Cells[_Kol2INVOICE_DATE,countI]=strgGrid2.Cells[_Kol2INVOICE_DATE_ID,countI])
//    and (strgGrid2.Cells[_Kol2INVOICE_DUEDATE,countI]=strgGrid2.Cells[_Kol2INVOICE_DUEDATE_ASAL,countI])
//    and (strgGrid3.Cells[_Kol3ACCRUAL_DATE,countI]=strgGrid3.Cells[_Kol3ACCRUAL_DATE_ASAL,countI]) then
//    begin
//        //Tidak perlu disimpan. tidak dirubah
//        Continue;
//    end;
//
//    if (strgGrid3.Cells[_Kol3ACRRUAL_NO, countI] <> '') then
//    begin
//        CommonDlg.ShowError('Invoice ' + strgGrid2.Cells[_Kol2INVOICE_NO,countI] + ' tidak dapat dirubah karena sudah ada proses accrual..');
//        strgGrid2.Cells[_Kol2INVOICE_DATE,countI]     := strgGrid2.Cells[_Kol2INVOICE_DATE_ID,countI];
//        strgGrid2.Cells[_Kol2INVOICE_DUEDATE,countI]  := strgGrid2.Cells[_Kol2INVOICE_DUEDATE_ASAL,countI];
//        strgGrid3.Cells[_Kol3ACCRUAL_DATE,countI]     := strgGrid3.Cells[_Kol3ACCRUAL_DATE_ASAL,countI];
//        Continue;
//    end;
//
//    is_Save := True;
//  end;
//  if not is_Save then
//  begin
//     Result := True;
//     Exit;
//  end;
//
//  FNewMasterAgreement := TNewMasterAgreement.CreateWithUser(Self, FLoginId, FLoginUnitId);
//  Try
//      if AgreementID>0 then
//         FNewMasterAgreement.LoadByID(AgreementId, untID);
//      FNewMasterAgreement.NewAgreementJadwals.Clear;
//      if strgGrid2.RowCount > 1 then
//      for countI := 1 to strgGrid2.RowCount-1 do
//      begin
//        InvoiceDate := StrToDate(strgGrid2.Cells[_Kol2INVOICE_DATE,countI]);
//        tempDate := StrToDate(strgGrid2.Cells[_Kol2INVOICE_DATE_ID,countI]);
//        if (MonthOf(InvoiceDate)=MonthOf(tempDate)) And (YearOf(InvoiceDate)=YearOf(tempDate)) then
//        begin
//           Try
//              AGRJDWL_ID := StrToInt(strgGrid2.Cells[_Kol2ID_JDWL_AGREEMENT,countI]);
//           Except
//             AGRJDWL_ID := 0;
//           End;
//        end
//        else
//        begin
//          AGRJDWL_ID := 0;
//        End;
//
//        //arrVar := IBConn.ExecuteSPAsOne('FUNC_GET_INV_NUMBER', arrParamInvoice, 1);
//        if AGRJDWL_ID=0 then
//           tempInvNo := GetInvoiceNumber(UntID, InvoiceDate)
//        else
//           tempInvNo := strgGrid2.Cells[_Kol2INVOICE_NO,countI];
//
//        //arrParam[3].data := countI; // ?? AGRJDWL_INV_TERM_NO
//        InvoiceDate := StrToDate(strgGrid2.Cells[_Kol2INVOICE_DATE,countI]);
//        tempDate := StrToDate(strgGrid2.Cells[_Kol2INVOICE_DUEDATE,countI]);
//        tempAccrDate := StrToDate(strgGrid3.Cells[_Kol3ACCRUAL_DATE,countI]);
//        tempACCRU_NO := strgGrid3.Cells[_Kol3ACRRUAL_NO,countI]; //IntToStr(countI);
//        tempACCRU_Status := strgGrid3.Cells[_Kol3STATUS,countI]; //IntToStr(countI);
//        //arrParam[9].data := frmMain.LoginId;
//        tempTotal := StrToCurr(strgGrid2.Cells[_Kol2TOTAL_INVOICE,countI]);
//        tempACCRU_TOTAL := StrToCurr(strgGrid3.Cells[_Kol3TOTALACCRUAL,countI]);
//        StaProID := 2;
//        //arrParam[13].data := frmMain.UnitId;
//
//
//        FNewMasterAgreement.UpdateNewAgreementJadwals(tempAccrDate, '',
//                     tempACCRU_NO, tempACCRU_Status, tempACCRU_TOTAL, AGRJDWL_ID, InvoiceDate,
//                     edtDescription.Text, tempDate,
//                     0, 0, tempInvNo, 0, (countI), tempTotal, UntID,
//                     StaProID, UntID);
//
//      end;
//      //Result := ScheduleAgreement.InsertDataScheduleAgreement(arrParam);
//      Result := FNewMasterAgreement.SaveToDBJadwals;
//  Finally
//    FNewMasterAgreement.Free;
//  end;
end;

procedure TfrmDialogScheduleAgreement.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogScheduleAgreement := nil;
end;

procedure TfrmDialogScheduleAgreement.footerDialogMasterbtnSaveClick(Sender: TObject);
begin
  inherited;

  FIsProcessSuccessfull := UpdateScheduleAgreement;
  if FIsProcessSuccessfull then
  begin
//    cCommitTrans;
    if is_Save then
       CommonDlg.ShowConfirm(atEdit);
    Close;
  end
  else
  begin
//    cRollbackTrans;
    CommonDlg.ShowError('Gagal Menyimpan Data');
  end;

end;

procedure TfrmDialogScheduleAgreement.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = 114 then
    tsJadwalInvoice.Show
  else if Key = 115 then
    tsJadwalAccrual.Show;
end;

end.
