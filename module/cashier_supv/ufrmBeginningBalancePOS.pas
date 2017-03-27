unit ufrmBeginningBalancePOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, ActnList, Mask,
  System.Actions, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Menus, cxCurrencyEdit, ufraFooter4Button, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC;

type
  TfrmBeginningBalancePOS = class(TfrmMasterBrowse)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    dt1: TcxDateEdit;
    pnl3: TPanel;
    lbl3: TLabel;
    edtCashierName: TEdit;
    edtSupervisorID: TEdit;
    lbl4: TLabel;
    lbl5: TLabel;
    curredtGrandTot: TcxCurrencyEdit;
    edtShift: TEdit;
    btnPrint: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure dt1AcceptDate(Sender: TObject; var ADate: TDateTime;
      var Action: Boolean);
    procedure FormShow(Sender: TObject);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure edtShiftKeyPress(Sender: TObject; var Key: Char);
    procedure edtShiftChange(Sender: TObject);
    procedure edtShiftExit(Sender: TObject);
    procedure edtShiftEnter(Sender: TObject);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure actPrintExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
  private
    dataBeginningBlnc: TDataSet;
    bufShift: String;
    function IsBeginningBalanceUsed(aBalance_ID, aUnitID: Integer): Boolean;
    procedure ParseHeaderGrid(jmlData: Integer);
    procedure ParseDataGrid();
    procedure prepareAdd();
    procedure prepareEdit();
  public
    { Public declarations }
  end;

var
  frmBeginningBalancePOS: TfrmBeginningBalancePOS;

implementation

uses ufrmDialogBeginningBalancePOS, uTSCommonDlg,
   uConstanta, uRetnoUnit, udmReport;

const
      _Caption      : String = 'SETTING POS BEGINNING BALANCE';
      _kolNo        : Integer = 0;
      _kolPosCode   : Integer = 1;
      _kolCashierName: Integer = 2;
      _kolBegBal    : Integer = 3;
      _kolDesc      : Integer = 4;
      _kolBegBal_ID : Integer = 5;
      _kolUser_ID   : Integer = 6;

{$R *.dfm}

procedure TfrmBeginningBalancePOS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ////frmMain.DestroyMenu((Sender as TForm));
  Action := caFree;
end;

procedure TfrmBeginningBalancePOS.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := _Caption;
  edtCashierName.Clear;
  edtSupervisorID.Clear;
  curredtGrandTot.Value:= 0;
  dt1.Date := now;
  edtShift.Text := '';
  ParseDataGrid;
end;

procedure TfrmBeginningBalancePOS.FormDestroy(Sender: TObject);
begin
  inherited;
  frmBeginningBalancePOS := nil;
end;

procedure TfrmBeginningBalancePOS.actAddExecute(Sender: TObject);
begin
  inherited;
  if (dt1.Date = null) then Exit;

  if edtShift.Text = '' then
  begin
    CommonDlg.ShowMessage('Shift harap di isi dulu');
    edtShift.SetFocus;
    Exit;
  end;

  prepareAdd();

  if (frmDialogBeginBalancePOS.IsProcessSuccessfull) then
  begin
    actRefreshExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atAdd);
  end;

  frmDialogBeginBalancePOS.Free;
end;

procedure TfrmBeginningBalancePOS.actEditExecute(Sender: TObject);
begin
  inherited;
  {if (strgGrid.Cells[_kolBegBal_ID,strgGrid.Row] = '0') or (strgGrid.Cells[_kolPosCode,strgGrid.Row] = '') then Exit;

  if IsBeginningBalanceUsed(StrToInt(strgGrid.Cells[_kolBegBal_ID,strgGrid.Row]),masternewunit.id) then
  begin
    CommonDlg.ShowMessage('Kasir sudah transaksi, tidak bisa diedit.');
    Exit;
  end;

  prepareEdit();

  if (frmDialogBeginBalancePOS.IsProcessSuccessfull) then
  begin
    actRefreshBeginBalancePOSExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atEdit);
  end;
  frmDialogBeginBalancePOS.Free;
  }
end;

procedure TfrmBeginningBalancePOS.dt1AcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
begin
  actRefreshExecute(Self);
end;

procedure TfrmBeginningBalancePOS.ParseHeaderGrid(jmlData: Integer);
begin
  {with strgGrid do
  begin
    Clear;
    RowCount := jmlData + 1;
    ColCount := 5;
    Cells[_kolNo,0] := 'NO.';
    Cells[_kolPosCode,0] := 'POS CODE';
    Cells[_kolCashierName,0] := 'CASHIER NAME';
    Cells[_kolBegBal,0] := 'BEGINNING BALANCE';
    Cells[_kolDesc,0] := 'DESCRIPTION';

    if jmlData < 1 then
    begin
      RowCount := 2;
      Cells[_kolNo,1] := '';
      Cells[_kolPosCode,1] := '';
      Cells[_kolCashierName,1] := '';
      Cells[_kolBegBal,1] := '';
      Cells[_kolDesc,1] := '';
      Cells[_kolBegBal_ID,1] := '0';
    end;

    FixedRows := 1;
    AutoSize := true;
  end;
  }
end;

procedure TfrmBeginningBalancePOS.ParseDataGrid;
var intI: Integer;
    tempBool: Boolean;
    grandTotal: Currency;
    sTemp : String;
begin
  if edtShift.Text='' then Exit;
  edtCashierName.Clear;
  edtSupervisorID.Clear;
  curredtGrandTot.Value:= 0;
  {
  if not Assigned(BeginningBalancePOS) then
    BeginningBalancePOS := TBeginningBalancePOS.Create;

  if not BeginningBalancePOS.CekShift(edtShift.Text, masternewunit.id, sTemp) then
  begin
    CommonDlg.ShowError(ER_SHIFT_NOT_FOUND);
    edtShift.Text:= bufShift;
    edtShift.SelectAll;
  end;
  lblHeader.Caption := _Caption + sTemp;

  dataBeginningBlnc := BeginningBalancePOS.GetListDataBeginningBalancePOS(dt1.Date,edtShift.Text,masternewunit.id);

  ParseHeaderGrid(dataBeginningBlnc.RecordCount);

  if dataBeginningBlnc.RecordCount > 0 then
  begin
    //initiate
    intI := 1;
    grandTotal := 0;
    dataBeginningBlnc.First;

    while not(dataBeginningBlnc.Eof) do
    begin
      with strgGrid do
      begin
        Cells[_kolNo,intI] := IntToStr(intI) + '.';
        Cells[_kolPosCode,intI] := dataBeginningBlnc.FieldByName('SETUPPOS_TERMINAL_CODE').AsString;
        Cells[_kolUser_ID,intI] := dataBeginningBlnc.FieldByName('BALANCE_USR_ID').AsString;
        Cells[_kolBegBal,intI] := dataBeginningBlnc.FieldByName('BALANCE_MODAL').AsString;
        Alignments[_kolBegBal,intI] := taRightJustify;
        if Cells[_kolBegBal,intI] <> '' then
          try
            grandTotal := grandTotal + StrToCurr(Cells[3,intI]);
          except
          end;
        Cells[_kolDesc,intI] := dataBeginningBlnc.FieldByName('BALANCE_DESCRIPTION').AsString;

        Cells[_kolBegBal_ID,intI] := dataBeginningBlnc.FieldByName('BALANCE_ID').AsString;
        Cells[_kolCashierName,intI] := dataBeginningBlnc.FieldByName('USR_FULLNAME').AsString;
      end; // end with strggrid

      Inc(intI);
      dataBeginningBlnc.Next;
    end; //while not eof
    curredtGrandTot.Value := grandTotal;
  end;// end if recordcount

  strgGrid.FixedRows := 1;
  strgGrid.AutoSize := true;

  tempBool := True;
  strgGridRowChanging(Self,0,1,tempBool);
  }
end;

procedure TfrmBeginningBalancePOS.FormShow(Sender: TObject);
begin
  inherited;
  edtShift.SetFocus;
end;

procedure TfrmBeginningBalancePOS.strgGridRowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
begin
//  edtCashierName.Text := strgGrid.Cells[_kolCashierName,NewRow];
  edtSupervisorID.Text := FLoginFullname;
end;

procedure TfrmBeginningBalancePOS.prepareAdd();
begin
  if not assigned(frmDialogBeginBalancePOS) then
    Application.CreateForm(TfrmDialogBeginBalancePOS, frmDialogBeginBalancePOS);

  frmDialogBeginBalancePOS.Caption := 'Add POS Beginning Balance';
  frmDialogBeginBalancePOS.FormMode := fmAdd;
  frmDialogBeginBalancePOS.Balance_ID := 0;

  frmDialogBeginBalancePOS.Balance_Shift_Date := dt1.Date;
//  if not assigned(BeginningBalancePOS) then
//    BeginningBalancePOS := TBeginningBalancePOS.Create;
//  frmDialogBeginBalancePOS.Balance_Shift_ID := BeginningBalancePOS.GetShiftId(edtShift.Text, masternewunit.id);

  SetFormPropertyAndShowDialog(frmDialogBeginBalancePOS);
end;

procedure TfrmBeginningBalancePOS.prepareEdit();
begin
  if not assigned(frmDialogBeginBalancePOS) then
    Application.CreateForm(TfrmDialogBeginBalancePOS, frmDialogBeginBalancePOS);

  frmDialogBeginBalancePOS.Caption := 'Edit POS Beginning Balance';
  frmDialogBeginBalancePOS.FormMode := fmEdit;
  {
  //setting var
  frmDialogBeginBalancePOS.Balance_ID := StrToInt(strgGrid.Cells[_kolBegBal_ID,strgGrid.Row]);
  frmDialogBeginBalancePOS.Balance_Shift_Date := dt1.Date;
  if not assigned(BeginningBalancePOS) then
    BeginningBalancePOS := TBeginningBalancePOS.Create;
  frmDialogBeginBalancePOS.Balance_Shift_ID := BeginningBalancePOS.GetShiftId(edtShift.Text, masternewunit.id);

  //write data edit
  frmDialogBeginBalancePOS.PosCode := strgGrid.Cells[_kolPosCode,strgGrid.Row];
  frmDialogBeginBalancePOS.CashierID := strgGrid.Cells[_kolUser_ID,strgGrid.Row];
  frmDialogBeginBalancePOS.CashierName := strgGrid.Cells[_kolCashierName,strgGrid.Row];
  frmDialogBeginBalancePOS.Modal := StrToCurr(strgGrid.Cells[_kolBegBal,strgGrid.Row]);
  frmDialogBeginBalancePOS.Descrpt := strgGrid.Cells[_kolDesc,strgGrid.Row];
  
  SetFormPropertyAndShowDialog(frmDialogBeginBalancePOS);
  }
end;

procedure TfrmBeginningBalancePOS.edtShiftKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = Chr(VK_RETURN) then
  begin
    edtShiftExit(Self);
  end 
end;

procedure TfrmBeginningBalancePOS.edtShiftChange(Sender: TObject);
begin
  inherited;
  edtCashierName.Clear;
  edtSupervisorID.Clear;
  curredtGrandTot.Value:= 0;
  ParseHeaderGrid(1);
end;

procedure TfrmBeginningBalancePOS.edtShiftExit(Sender: TObject);
begin
  inherited;
  if edtShift.Text <> '' then
    ParseDataGrid();
end;

procedure TfrmBeginningBalancePOS.edtShiftEnter(Sender: TObject);
begin
  inherited;
  bufShift:= edtShift.Text;
end;

procedure TfrmBeginningBalancePOS.strgGridGetFloatFormat(Sender: TObject;
  ACol, ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  FloatFormat:= '%.2n';
  if ACol = 3 then
    IsFloat:= True
  else IsFloat:= False;
end;

procedure TfrmBeginningBalancePOS.actPrintExecute(Sender: TObject);
var
  sSQL    : String;
  SS      : TStrings;
  _HeaderFlag : integer;
  sTemp : string;
begin
  inherited;
  _HeaderFlag := 4705;
  {
  sSQL := ' delete from TEMP_LAPORAN '
        + ' WHERE laporan_id = ' + IntToStr(_HeaderFlag)
        + ' AND user_id = ' + IntToStr(FLoginId) ;
  cExecSQL(sSQL, True , _HeaderFlag);

  SS := TStringList.Create;
  Self.Enabled := False;

  if not Assigned(BeginningBalancePOS) then
    BeginningBalancePOS := TBeginningBalancePOS.Create;

  if not BeginningBalancePOS.CekShift(edtShift.Text, masternewunit.id, sTemp) then
  begin
    CommonDlg.ShowError(ER_SHIFT_NOT_FOUND);
    edtShift.Text:= bufShift;
    edtShift.SelectAll;
  end;
  lblHeader.Caption := _Caption + sTemp;

  dataBeginningBlnc := BeginningBalancePOS.GetListDataBeginningBalancePOS(dt1.Date,edtShift.Text,masternewunit.id);
  dataBeginningBlnc.Last;

  if dataBeginningBlnc.RecordCount > 0 then
  begin
    //initiate
    dataBeginningBlnc.First;
  end;
  try
    with dataBeginningBlnc do
    while not(Eof) do
    begin
      sSQL:= 'INSERT INTO TEMP_LAPORAN (LAPORAN_ID, USER_ID, CHAR1, CHAR2, CHAR3,'
            + ' CHAR4, CHAR5, CHAR6,CHAR7, CHAR8, NUM1, NUM2, NUM3, NUM4'
            + ' ) VALUES ('
            + IntToStr(_HeaderFlag) + ', '
            + IntToStr(FLoginId) + ', '
            + Quot(edtShift.Text) + ', '
            + Quot(FieldByName('SETUPPOS_TERMINAL_CODE').AsString) + ', '
            + Quot(FieldByName('USR_FULLNAME').AsString) + ', '
            + Quot(FieldByName('BALANCE_DESCRIPTION').AsString) + ', '
            + Quot(FormatDateTime('dd-MM-yyyy', dt1.Date)) + ', '
            + Quot(FieldByName('SETUPPOS_NO_TRANSAKSI').AsString) + ', '
            + Quot(FieldByName('BALANCE_STATUS').AsString) + ', '
            + Quot(FieldByName('USR_USERNAME').AsString) + ', '
            + FloatToStr(FieldByName('BALANCE_MODAL').AsFloat) + ', '
            + FloatToStr(FieldByName('SHIFT_START_TIME').AsFloat) + ', '
            + FloatToStr(FieldByName('SHIFT_END_TIME').AsFloat) + ', '
            + IntToStr(FieldByName('BALANCE_ID').AsInteger)
            + ')';

      SS.Add(sSQL);
      dataBeginningBlnc.Next;
    end;
    if kExecuteSQLs(_HeaderFlag, SS) then
    begin
      cCommitTrans;
      GetExCompanyHeader(dt1.Date, dt1.Date, MasterNewUnit.ID, FLoginUsername, FLoginFullname);
      sSQL := 'SELECT '
          + ' laporan_id, user_id, char1 as "SHIFT", char2 as "POS",'
          + ' CHAR3 AS CASHIERNAME, CHAR4 AS Description, CHAR5 AS "tTIme", CHAR6 as "TranscNo",'
          + ' CHAR7 as Status,CHAR8 as CashierCode,'
          + ' num1 as Modal, num2 as SHIFT_START_TIME, num3 as SHIFT_END_TIME, '
          + ' num4 as BALANCE_ID '
          + ' FROM TEMP_LAPORAN'
          + ' WHERE laporan_id = ' + IntToStr(_HeaderFlag)
          + ' AND user_id = ' +  IntToStr(FLoginId)
          + ' ORDER BY num1';

      dmReportNew.EksekusiReport('CashierBeginningBal', sSQL,'',True);
    end;

  finally
    Self.Enabled  := True;
    SS.Free;
  end;
  }
end;

procedure TfrmBeginningBalancePOS.actRefreshExecute(Sender: TObject);
begin
  inherited;
  ParseDataGrid();
end;

function TfrmBeginningBalancePOS.IsBeginningBalanceUsed(aBalance_ID, aUnitID:
    Integer): Boolean;
begin
  {with TPOSTransaction.Create(Self) do
  begin
    try
      Result := IsBalanceUsed(aBalance_ID,aUnitID);
    finally
      Free;
    end;
  end;
  }
end;

end.


