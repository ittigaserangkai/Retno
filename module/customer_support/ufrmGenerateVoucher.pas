unit ufrmGenerateVoucher;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ActnList, strutils,  uConstanta,
  ufrmMasterBrowse, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, System.Actions,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC;

type
  TfrmGenerateVoucher = class(TfrmMasterBrowse)
    pnl2: TPanel;
    SaveDialog1: TSaveDialog;
    cxgrdVoucher: TcxGrid;
    grdVoucher: TcxGridDBTableView;
    grdlvlVoucher: TcxGridLevel;
    procedure actAddExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure strgAgreementRowChanging(Sender: TObject; OldRow,
      NewRow: Integer; var Allow: Boolean);
    procedure fraFooter5Button1btnRefreshClick(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgVoucherCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure strgVoucherClickCell(Sender: TObject; ARow, ACol: Integer);
  private
    VoucherID : Integer;
    iLastRow : Integer;
    procedure ParseDataGridDetilVoucher;
    procedure ParseHeaderGridAgreement;
    procedure ParseDataGridAgreement;
    procedure RefreshAgreement;
    procedure ParseHeaderGridVoucher;
    procedure ParseDataGridVoucher(MasterRow: Integer);
    procedure ParseHeaderGridDetilVoucher;
    procedure RefreshVoucher(Baris: Integer);
    function  SumTotalVoucher: Real;

//    procedure WM_STORE_MESSAGE_Handle(var msg: TMessage); message WM_STORE_MESSAGE;
  public
    FTotalVoucher: Real;
    function GetFilterCetak: string;
    procedure AggrementToTemp(aRow:Integer);
    procedure DetilVoucherToTemp;
    procedure VoucherToTemp(arow:Integer);
  end;

var
  frmGenerateVoucher: TfrmGenerateVoucher;


implementation

uses  ufrmDialogGenerateVoucher,
  uTSCommonDlg, ufrmPopupDetailVoucher, DateUtils ;

{$R *.dfm}
const
  _kolVchAll     : Integer = 0;
  _kolVchIssue   : Integer = 1;
  _kolVchStDate  : Integer = 2;
  _kolVchExDate  : Integer = 3;
  _kolVchNominal : Integer = 4;
  _kolVchQty     : Integer = 5;
  _kolVchTot     : Integer = 6;
  _kolVchId1     : Integer = 7;
  _kolVchSubTot  : Integer = 8;

  _kolAgreCusNm       : Integer = 0;
  _kolAgreDate        : Integer = 1;
  _kolAgreNo          : Integer = 2;
  _kolAgreTot         : Integer = 3;
  _kolAgreStatus      : Integer = 4;
  _kolAgreCusCode     : Integer = 5;
  _kolAgreCusCounter  : Integer = 6;
  _kolAgreCusTot      : Integer = 7;
  _kolAgreCusID       : Integer = 8;


procedure TfrmGenerateVoucher.actAddExecute(Sender: TObject);
begin
  inherited;
//  if strgAgreement.Floats[_kolAgreCusTot, strgAgreement.row] <= FTotalVoucher then
//  begin
//    CommonDlg.ShowConfirmGlobal(CONF_TOTAL_AGREEMENT);
//    strgAgreement.SetFocus;
//    Exit;
//  end;
//  if not Assigned(frmDialogGenerateVoucher) then
//    Application.CreateForm(TfrmDialogGenerateVoucher, frmDialogGenerateVoucher);
//
//  with TAgreementVoucher.Create(Self) do
//  begin
//    try
//      if not LoadByNo(strgAgreement.Cells[_kolAgreNo,strgAgreement.Row], MasterNewUnit.ID) then
//      begin
//        CommonDlg.ShowError('No Agreement Tidak Ditemukan');
//        Exit;
//      end;
//
//      frmDialogGenerateVoucher.AgrvNo             := NO;
//      frmDialogGenerateVoucher.CustCounter        :=
//            StrToInt(strgAgreement.Cells[_kolAgreCusCounter,strgAgreement.Row]);
//      frmDialogGenerateVoucher.CustCode           :=
//            strgAgreement.Cells[_kolAgreCusCode,strgAgreement.Row];
//      frmDialogGenerateVoucher.dtStartDate.Date   := cgetServerTime;
//      frmDialogGenerateVoucher.dtEndDate.Date     := due_date;
//      frmDialogGenerateVoucher.dtIssuedDate.Date  := cgetServerTime;
//      frmDialogGenerateVoucher.MaxVoucher         :=
//            strgAgreement.Floats[_kolAgreCusTot, strgAgreement.Row];
//      frmDialogGenerateVoucher.Voucher            := FTotalVoucher;
//      frmDialogGenerateVoucher.CustID             :=
//            strgAgreement.Ints[ _kolAgreCusID,frmGenerateVoucher.strgAgreement.Row];
//
//      SetFormPropertyAndShowDialog(frmDialogGenerateVoucher);
//    finally
//      Free;
//    end;
//  end;
//  if (frmDialogGenerateVoucher.IsProcessSuccessfull) then
//  begin
//    RefreshVoucher(strgAgreement.Row);
//    CommonDlg.ShowConfirmSuccessfull(atAdd);
//  end;
//
//  frmDialogGenerateVoucher.Free;
  cxGrid.SetFocus;
end;

procedure TfrmGenerateVoucher.FormActivate(Sender: TObject);
begin
  inherited;
  //frmMain.CreateMenu((Sender as TForm));
end;

procedure TfrmGenerateVoucher.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //frmMain.DestroyMenu((Sender as TForm));
  Action := caFree;
end;

procedure TfrmGenerateVoucher.FormCreate(Sender: TObject);
begin
  inherited;
  Self.Caption := 'GENERATE VOUCHER';
  lblHeader.Caption := Self.Caption;
  actRefreshExecute(Self);
end;

procedure TfrmGenerateVoucher.FormDestroy(Sender: TObject);
begin
  inherited;
  frmGenerateVoucher := nil;
end;

procedure TfrmGenerateVoucher.ParseHeaderGridAgreement;
begin
//  with cxGrid do
//  begin
//    Clear;
//    RowCount:= 2;
//    ColCount:= 5;
//    Cells[_kolAgreCusNm,0]  := 'CUSTOMER NAME';
//    Cells[_kolAgreDate,0]   := 'AGREEMENT DATE';
//    Cells[_kolAgreNo,0]     := 'AGREEMENT NO';
//    Cells[_kolAgreTot,0]    := 'AGREEMENT TOTAL';
//    Cells[_kolAgreStatus,0] := 'AGREEMENT STATUS';
//
//    AutoSize:= True;
//  end;
end;

procedure TfrmGenerateVoucher.ParseDataGridAgreement;
var
    sQ,tmp : string;
    i: Integer;
begin
  ParseHeaderGridAgreement;
  sQ:='SELECT CV.CUSTV_CODE, CV.CUSTV_NAME, CV.CUSTV_COUNTER, CV.CUSTV_ID, ' +
    'AV.AGRV_DATE, AV.AGRV_NO, AV.AGRV_TOTAL, AV.AGRV_STATUS ' +
    'FROM AGREEMENT_VOUCHER AV ' +
    'JOIN CUSTOMER_VOUCHER CV ON AV.AGRV_CUSTV_CODE=CV.CUSTV_CODE ' +
    'WHERE AV.AGRV_STATUS <> ''OPEN'' '+
//    'AND CV.CUSTV_UNT_ID ='+IntToStr(MasterNewUnit.ID)+
    'ORDER BY CV.CUSTV_NAME, AV.AGRV_DATE ';
//  with cOpenQuery(sQ) do
//    try
//    with strgAgreement do
//    begin
//      if not IsEmpty then
//      begin
//       // RowCount:= RecordCount+1;
//        i:=0;
//        tmp:='';
//        while not Eof do
//        begin
//          if i > 0 then
//            AddRow;
//
//          Inc(i);
//          {
//          if tmp<>FieldValues['CUSTV_NAME'] then
//          begin
//            Cells[0,i]:= FieldValues['CUSTV_NAME'];
//            tmp:= FieldValues['CUSTV_NAME'];
//          end
//          else
//            Cells[0,i]:= ' ';
//          }
//
//          Cells[_kolAgreCusNm,i]      := FieldValues['CUSTV_NAME'];
//          Cells[_kolAgreDate,i]       := FormatDateTime('dd/MM/yyyy',FieldValues['AGRV_DATE']);
//          Cells[_kolAgreNo,i]         := FieldValues['AGRV_NO'];
//          Cells[_kolAgreTot,i]        := FormatFloat('#,##0.00',FieldValues['AGRV_TOTAL']);
//          Cells[_kolAgreStatus,i]     := FieldValues['AGRV_STATUS'];
//          Cells[_kolAgreCusCode,i]    := FieldValues['CUSTV_CODE'];
//          Cells[_kolAgreCusCounter,i] := IntToStr(FieldValues['CUSTV_COUNTER']);
//          Cells[_kolAgreCusTot,i]     := FloatToStr(FieldValues['AGRV_TOTAL']);
//          Cells[_kolAgreCusID,i]      := IntToStr(FieldValues['CUSTV_ID']);
//
//          Next;
//        end;
//        AutoSize:= True;
//      end;
//    end;
//    finally
//      free;
//    end;
end;

procedure TfrmGenerateVoucher.RefreshAgreement;
begin
  ParseDataGridAgreement;
end;

procedure TfrmGenerateVoucher.ParseHeaderGridVoucher;
var
  i: Integer;
begin
//  with strgVoucher do
//  begin
//    Clear;
//    if RowCount > FixedRows + 1 then
//    begin
//      for i := RowCount - 1 downto FixedRows + 1 do
//      begin
//        RemoveRows(i, 1);
//      end;
//    end;
//
//    RowCount  := 2;
//    ColCount  := 7;
//    FixedRows := 1;
//    AddCheckBox(_kolVchAll,0,False,False);
//
//    Cells[_kolVchAll,0]     := 'ALL';
//    Cells[_kolVchIssue,0]   := 'ISSUED DATE';
//    Cells[_kolVchStDate,0]  := 'START DATE';
//    Cells[_kolVchExDate,0]  := 'EXPIRE DATE';
//    Cells[_kolVchNominal,0] := 'NOMINAL';
//    Cells[_kolVchQty,0]     := 'QUANTITY';
//    Cells[_kolVchTot,0]     := 'TOTAL';
//    Cells[_kolVchId1,1]     := '';
//    Cells[_kolVchSubTot,1]  := '';
//
//    AutoSize:= True;
//  end;
end;

procedure TfrmGenerateVoucher.ParseDataGridVoucher(MasterRow: Integer);
var
    i: Integer;
    sQ:string;
begin
  ParseHeaderGridVoucher;
//  sQ:='SELECT * FROM VOUCHER ' +
//    'WHERE VCR_AGRV_NO='''+strgAgreement.Cells[_kolAgreNo, MasterRow]+
//    ''' AND VCR_UNT_ID ='+inttostr(MasterNewUnit.ID)+' ORDER BY VCR_ISSUED_DATE ';
//  with cOpenQuery(sQ) do
//  try
//  with strgVoucher do
//  begin
//    if not IsEmpty then
//    begin
//     // RowCount:= RecordCount+1;
//      i := FixedRows;
//      while not Eof do
//      begin
//        if i > FixedRows then
//          AddRow;
//
//        AddCheckBox(_kolVchAll,i,False,False);
//        Cells[_kolVchIssue,i]   := FormatDateTime('dd/MM/yyyy',FieldValues['VCR_ISSUED_DATE']);
//        Cells[_kolVchStDate,i]  := FormatDateTime('dd/MM/yyyy',FieldValues['VCR_START_DATE']);
//        Cells[_kolVchExDate,i]  := FormatDateTime('dd/MM/yyyy',FieldValues['VCR_EXPIRE_DATE']);
//        Cells[_kolVchNominal,i] := FormatFloat('#,##0.00',FieldValues['VCR_NOMINAL']);
//        Cells[_kolVchQty,i]     := IntToStr(FieldValues['VCR_QTY']);
//        Cells[_kolVchTot,i]     := FormatFloat('#,##0.00',FieldValues['VCR_NOMINAL']
//                                  * FieldValues['VCR_QTY']);
//        Cells[_kolVchId1,i]     := IntToStr(FieldValues['VCR_ID']);
//        Cells[_kolVchSubTot,i]  := FloatToStr(FieldValues['VCR_NOMINAL']
//                                  * FieldValues['VCR_QTY']);
//        Inc(i);
//        Next;
//      end;
//      AutoSize  := True;
//    end;
//  end;
//  finally
//    free;
//  end;

  FTotalVoucher:= 0;
  FTotalVoucher:= SumTotalVoucher;
end;

procedure TfrmGenerateVoucher.RefreshVoucher(Baris: Integer);
begin
  ParseDataGridVoucher(Baris);
end;

procedure TfrmGenerateVoucher.actEditExecute(Sender: TObject);
begin
  inherited;
//  if strgVoucher.Cells[_kolVchId1,strgVoucher.Row]='' then Exit;
//  if not Assigned(frmPopupDetailVoucher) then
//    Application.CreateForm(TfrmPopupDetailVoucher, frmPopupDetailVoucher);
//  frmPopupDetailVoucher.VoucherId:= StrToInt(strgVoucher.Cells[_kolVchId1,strgVoucher.Row]);
//
  SetFormPropertyAndShowDialog(frmPopupDetailVoucher);
end;

function TfrmGenerateVoucher.SumTotalVoucher: Real;
var i: Integer;
    tmp: Real;
begin
//  tmp:= 0;
//  for i := strgVoucher.FixedRows to strgVoucher.RowCount - 1 do
//  begin
//    if strgVoucher.Cells[_kolVchSubTot,i]='' then
//      strgVoucher.Cells[_kolVchSubTot,i]:='0';
//
//    tmp:= tmp + strgVoucher.Floats[_kolVchSubTot,i];
//  end;
//  Result:= tmp;
end;

procedure TfrmGenerateVoucher.strgAgreementRowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  RefreshVoucher(NewRow);
end;

procedure TfrmGenerateVoucher.fraFooter5Button1btnRefreshClick(
  Sender: TObject);
begin
  inherited;
  actRefreshExecute(Self);
end;

procedure TfrmGenerateVoucher.actPrintExecute(Sender: TObject);
var
  iRow: Integer;
  i: Integer;
  sNamaSheet: string;
  sFilePath: string;
  sSQl: String;
  isChecked : Boolean;
begin
  
  inherited;
//  sSQl := 'SELECT ' + GetCompanyHeader(FLoginUsername, MasterNewUnit.Nama,Date,Date)
//          + 'CV.CUSTV_CODE, CV.CUSTV_NAME, CV.CUSTV_COUNTER, '
//          + ' CV.CUSTV_ID, AV.AGRV_DATE, AV.AGRV_NO, '
//          + ' AV.AGRV_TOTAL, AV.AGRV_STATUS,V.* '
//          + ' FROM AGREEMENT_VOUCHER AV '
//          + ' JOIN CUSTOMER_VOUCHER CV ON AV.AGRV_CUSTV_CODE=CV.CUSTV_CODE '
//          + ' Left Join VOUCHER V ON AV.AGRV_NO=V.VCR_AGRV_NO '
//          + ' WHERE AV.AGRV_STATUS <> ''OPEN'' AND CV.CUSTV_UNT_ID =3 '
//          + ' ORDER BY CV.CUSTV_NAME, AV.AGRV_DATE ';
//  dmReportNew.EksekusiReport('frGenerateVoucher',sSQl,'',True);
//  if (CommonDlg.Confirm('Apakah Anda Ingin export data VOUCHER  '
//          +  strgAgreement.Cells[_kolAgreNo, strgAgreement.Row] + ' ??') = mrYES) then
//      begin
//         if SaveDialog1.Execute then
//         begin
//           sFilePath  := SaveDialog1.FileName;
//           iRow       := strgAgreement.Row;
////           sNamaSheet := strgAgreement.Cells[2,iRow];
//           sNamaSheet := strgAgreement.Cells[_kolAgreNo, iRow];
//           sNamaSheet := StringReplace(sNamaSheet,'/','_',[rfReplaceAll, rfIgnoreCase]);
//           AggrementToTemp(strgAgreement.Row);
//           for i := 1 to strgVoucher.RowCount -1 do
//           begin
//             strgVoucher.GetCheckBoxState(_kolVchAll, i, isChecked);
//             if isChecked then
//             begin
//               VoucherToTemp(i);
//
//               if not TryStrToInt(strgVoucher.Cells[_kolVchId1,i], VoucherID) then
//               begin
//                CommonDlg.ShowError('Id Voucher Salah!');
//                Exit;
//               end;
////               VoucherID:= StrToInt(strgVoucher.Cells[6,i]);
//               ParseDataGridDetilVoucher;
//
//               DetilVoucherToTemp;
//             end;
//           end;
//           //TempGrid.ex
//           SaveDialog1.DefaultExt := 'CSV';
//           TempGrid.SaveToCSV(sFilePath);
////           for i := 1 to strgAgreement.RowCount-1 do
////           begin
////             sNamaSheet := strgAgreement.Cells[2,i];
////             sNamaSheet := StringReplace(sNamaSheet,'/','_',[rfReplaceAll, rfIgnoreCase]);
////             strgAgreement.Row := i;
////             strgVoucher.SaveToXLSSheet(sFilePath,sNamaSheet);
////           end;
////           strgAgreement.SaveToXLSSheet(sFilePath,'Agreement');
////           dmReportNew.frReport1.ExportTo(dmReportNew.frlxclxprt,sFilePath);
//         end
//      end
end;

procedure TfrmGenerateVoucher.actRefreshExecute(Sender: TObject);
begin
  inherited;
  RefreshAgreement;
//  RefreshVoucher(strgAgreement.Row);
end;

procedure TfrmGenerateVoucher.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
  if (Key = VK_ESCAPE) then
    Close
  else if (Key = Ord('C')) and (ssctrl in Shift) then
    actAddExecute(Self)
  else if (Key = VK_Delete) and (ssctrl in Shift) then
    actPrintExecute(Self)
  else if (Key = Ord('E')) and (ssctrl in Shift) then
    actEditExecute(Self)
  else if (Key = VK_F5) and (ssctrl in Shift) then
    actRefreshExecute(Self)
  else if (Key = Ord('P')) and (ssctrl in Shift) then
    actPrintExecute(Self)
end;

function TfrmGenerateVoucher.GetFilterCetak: string;
var
  isChecked: Boolean;
  i: Integer;
begin
//  Result := Quot('XXXX');
//  for i := 1 to strgVoucher.RowCount - 1 do
//  begin
//    strgVoucher.GetCheckBoxState(_kolVchAll, i, isChecked);
//
//    if isChecked then
//      Result := Result + ',' + (strgVoucher.Cells[_kolVchTot, i]);
//  end;
end;

procedure TfrmGenerateVoucher.ParseDataGridDetilVoucher;
var
    i: Integer;
begin
  ParseHeaderGridDetilVoucher;
//  with TVoucher.Create(Self) do
//  try
//    with strgGrid,VoucherDetils do
//    begin
//      LoadByID(VoucherID,MasterNewUnit.ID);
//      for i:=0 to Count-1 do
//      begin
//          if i>0 then
//            AddRow;
//
//          Cells[0,i+1]:= VoucherDetil[i].NO;
//          Cells[1,i+1]:= FormatFloat('#,##0.00',VoucherDetil[i].Nominal);
//          Cells[2,i+1]:= VoucherDetil[i].Status;
//      end;
//      AutoSize:= True;
//    end;
//  finally
//    free;
//  end;
end;

procedure TfrmGenerateVoucher.ParseHeaderGridDetilVoucher;
begin
//  with strgGrid do
//  begin
//    Clear;
//    RowCount:= 2;
//    ColCount:= 3;
//    Cells[0,0]:= 'NO';
//    Cells[1,0]:= 'NOMINAL';
//    Cells[2,0]:= 'STATUS';
//    AutoSize:= True;
//  end;
end;

procedure TfrmGenerateVoucher.strgVoucherCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  if (ACol = 0) and (ARow > 0) then
  CanEdit := True
  else
  CanEdit := False;
end;

procedure TfrmGenerateVoucher.strgVoucherClickCell(Sender: TObject; ARow,
  ACol: Integer);
var
  IsChecked : Boolean;
  i         : Integer;
begin
  inherited;
//  if (ARow < strgVoucher.FixedRows) and (ACol = 0) then
//  begin
//    strgVoucher.GetCheckBoxState(0, ARow, IsChecked);
//    for i := 0 to strgVoucher.RowCount - 1 do
//    begin
//      strgVoucher.SetCheckBoxState(0, i, not IsChecked)
//    end;
//
//  end;
end;

procedure TfrmGenerateVoucher.AggrementToTemp(aRow:Integer);
begin
//  TempGrid.RowCount := 1;
//  TempGrid.ColCount := 8;
//  cClearStringGrid(TempGrid,True);
//
//  //copi data dari grid agrement ke temp
//  with TempGrid do
//  begin
//    Cells[0,0] := strgAgreement.Cells[_kolAgreCusNm,0];
//    Cells[1,0] := strgAgreement.Cells[_kolAgreDate,0];
//    Cells[2,0] := strgAgreement.Cells[_kolAgreNo,0];
//    Cells[3,0] := strgAgreement.Cells[_kolAgreTot,0];
//    Cells[4,0] := strgAgreement.Cells[_kolAgreStatus,0];
//
//    AddRow;
//
//    Cells[0,1] := strgAgreement.Cells[_kolAgreCusNm,aRow];
//    Cells[1,1] := strgAgreement.Cells[_kolAgreDate,aRow];
//    Cells[2,1] := strgAgreement.Cells[_kolAgreNo,aRow];
//    Cells[3,1] := strgAgreement.Cells[_kolAgreTot,aRow];
//    Cells[4,1] := strgAgreement.Cells[_kolAgreStatus,aRow];
//
//  end;
//  iLastRow := 2;
end;

procedure TfrmGenerateVoucher.DetilVoucherToTemp;
var
  i: Integer;
begin
  iLastRow := iLastRow + 1;
//  for i := 0 to strgGrid.RowCount do
//  begin
//    with TempGrid do
//    begin
//      AddRow;
//      iLastRow := RowCount-1;
//      Cells[0,iLastRow] := strgGrid.Cells[0,i];
//      Cells[1,iLastRow] := strgGrid.Cells[1,i];
//      Cells[2,iLastRow] := strgGrid.Cells[2,i];
//    end;
//  end;
end;

procedure TfrmGenerateVoucher.VoucherToTemp(arow:Integer);
begin
  iLastRow := iLastRow + 2;
//  with TempGrid do
//  begin
//    AddRow;
//    AddRow;
//    iLastRow := RowCount-1;
//    Cells[0,iLastRow] := strgVoucher.Cells[_kolVchIssue,0];
//    Cells[1,iLastRow] := strgVoucher.Cells[_kolVchStDate,0];
//    Cells[2,iLastRow] := strgVoucher.Cells[_kolVchExDate,0];
//    Cells[3,iLastRow] := strgVoucher.Cells[_kolVchNominal,0];
//    Cells[4,iLastRow] := strgVoucher.Cells[_kolVchQty ,0];
//    Cells[5,iLastRow] := strgVoucher.Cells[_kolVchTot,0];
//    AddRow;
//    iLastRow := RowCount-1;
//    Cells[0,iLastRow] := strgVoucher.Cells[_kolVchIssue,aRow];
//    Cells[1,iLastRow] := strgVoucher.Cells[_kolVchStDate,aRow];
//    Cells[2,iLastRow] := strgVoucher.Cells[_kolVchExDate,aRow];
//    Cells[3,iLastRow] := strgVoucher.Cells[_kolVchNominal,aRow];
//    Cells[4,iLastRow] := strgVoucher.Cells[_kolVchQty,aRow];
//    Cells[5,iLastRow] := strgVoucher.Cells[_kolVchTot,aRow];


//  end;
end;

end.
