unit ufrmResetCashier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, uConstanta, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, ComCtrls, dxCore, cxDateUtils, Menus, System.Actions,
  ActnList, ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  Datasnap.DBClient, System.Generics.Collections, uModApp, uModBeginningBalance;

type
  TfrmResetCashier = class(TfrmMasterBrowse)
    pnl1: TPanel;
    pnl3: TPanel;
    btnResetCashier: TcxButton;
    btnUnResetCashier: TcxButton;
    actResetCashier: TAction;
    actUnResetCashier: TAction;
    edtShift: TcxTextEdit;
    lblClearAll: TcxLabel;
    lblCheckAll: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actResetCashierExecute(Sender: TObject);
    procedure actUnResetCashierExecute(Sender: TObject);
    procedure edtShiftEnter(Sender: TObject);
    procedure lblCheckAllClick(Sender: TObject);
    procedure lblClearAllClick(Sender: TObject);
    procedure edtShiftExit(Sender: TObject);
    procedure edtShiftKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lblCheckAllMouseEnter(Sender: TObject);
    procedure lblCheckAllMouseLeave(Sender: TObject);
    procedure lblClearAllMouseEnter(Sender: TObject);
    procedure lblClearAllMouseLeave(Sender: TObject);
    procedure dtAkhirFilterPropertiesEditValueChanged(Sender: TObject);
  private
//    dataBeginningBlnc: TDataSet;
    FCDS: TClientDataSet;
    procedure ChangeResetStatus(AReset: string);
    function IsShiftExist: Boolean;
//    datacashier: TResultDataSet;
    procedure ParseHeaderGrid;
    procedure ParseDataGrid();
    procedure WM_STORE_MESSAGE_Handle(var msg: TMessage); message WM_STORE_MESSAGE;
    property CDS: TClientDataSet read FCDS write FCDS;
  public
    procedure RefreshData; override;
  end;

var
  frmResetCashier: TfrmResetCashier;

implementation

{$R *.dfm}

uses
  uTSCommonDlg, uRetnoUnit, uAppUtils, uModShift, uDMClient, uDBUtils, uDXUtils;

const
{

POS CODE
CASHIER NAME
TRANSACTION NO
LAST COUNTER NO
LAST TRANSACTION NO
FINAL PAYMENT
IS RESET
}
  _KolCheck     : Integer = 0;
  _KolPosCode   : Integer = 1;
  _KolCashier   : Integer = 2;
  _kolTrans     : Integer = 3;
  _kolLCounter  : Integer = 4;
  _kolLTransNo  : Integer = 5;
  _kolFPay      : Integer = 6;
  _kolStatusFP  : Integer = 7;
  _KolisReset   : Integer = 8;
  _kolClosed    : Integer = 9;
  _kolBalId     : Integer = 10;
  _kolPosIsAct  : Integer = 11;
  _kolPosIp     : Integer = 12;
  _kolPosTerml  : Integer = 13;
  _colCount     : Integer = 9;
  _rowCount     : Integer = 2;
  _fixedRow     : Integer = 1;

procedure TfrmResetCashier.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'RESET CASHIER';
end;

procedure TfrmResetCashier.FormDestroy(Sender: TObject);
begin
  inherited;
  frmResetCashier := nil;
end;

procedure TfrmResetCashier.ParseDataGrid;
//var
//  intI: Integer;
//  aIsReset: Boolean;
//  ssQL: string;
//  tempTransc: string;
begin

//  ssQL := 'SELECT SP.*, FP.FINPAYMENT_GRAND_TOTAL, AU.USR_FULLNAME,'
//        + '   BB.BALANCE_ID, BB.BALANCE_STATUS, S.SHIFT_NAME, FP.FINPAYMENT_BALANCE_ID'
//        + ' FROM SETUPPOS SP'
//        + ' INNER JOIN BEGINNING_BALANCE BB ON BB.BALANCE_SETUPPOS_ID = SP.SETUPPOS_ID'
//        + '   AND BB.BALANCE_SETUPPOS_UNT_ID = SP.SETUPPOS_UNT_ID'
//        + ' INNER JOIN SHIFT S ON S.SHIFT_ID = BB.BALANCE_SHIFT_ID'
//        + '   AND S.SHIFT_UNT_ID = BB.BALANCE_SHIFT_UNT_ID'
//        + ' LEFT JOIN FINAL_PAYMENT FP ON FP.FINPAYMENT_BALANCE_ID = BB.BALANCE_ID'
//        + '   AND FP.FINPAYMENT_BALANCE_UNT_ID = BB.BALANCE_UNT_ID'
//        + ' LEFT JOIN AUT$USER AU ON AU.USR_ID = BB.BALANCE_USR_ID'
//        + '   AND AU.USR_UNT_ID=BB.BALANCE_USR_UNT_ID'
//        + ' WHERE BB.BALANCE_SHIFT_DATE = '+ TAppUtils.QuotD(dtActivate.Date)
//        + '   AND BB.BALANCE_UNT_ID = '+ IntToStr(MasterNewUnit)
////        + '   and BB.BALANCE_STATUS = ''CLOSE'''
////        + '   and sp.SETUPPOS_IS_RESET = 0'
//        + ' ORDER BY SP.SETUPPOS_TERMINAL_CODE';
  {
  ParseHeaderGrid;
  with cOpenQuery(ssQL) do
  begin
    try
      //initiate
      intI := strgGrid.FixedRows;
      while not Eof do
      begin
        if  intI > strgGrid.FixedRows then
          strgGrid.AddRow;

        strgGrid.AddCheckBox(_KolCheck,intI,False,False);
        strgGrid.Cells[_KolPosCode,intI] := FieldByName('SETUPPOS_TERMINAL_CODE').AsString
                                          + ' (SHIFT ' + FieldByName('SHIFT_NAME').AsString + ')';
        strgGrid.Cells[_KolCashier,intI] := FieldByName('USR_FULLNAME').AsString;
        strgGrid.Cells[_kolTrans,intI]   := FieldByName('SETUPPOS_NO_TRANSAKSI').AsString;
        strgGrid.Cells[_kolLCounter,intI]:= FieldByName('SETUPPOS_COUNTER_NO').AsString;

        //========format transc no.=============================================
        tempTransc := strgGrid.Cells[_kolTrans,intI];
        if StrToInt(strgGrid.Cells[_kolLCounter,intI]) < 10 then SetLength(tempTransc,11)
        else if StrToInt(strgGrid.Cells[_kolLCounter,intI]) < 100 then SetLength(tempTransc,10)
        else if StrToInt(strgGrid.Cells[_kolLCounter,intI]) < 1000 then SetLength(tempTransc,9)
        else SetLength(tempTransc,8);
        //========format transc no.=============================================

        strgGrid.Cells[_kolLTransNo,intI] := tempTransc + strgGrid.Cells[_kolLCounter,intI];
        strgGrid.Cells[_kolFPay,intI]     := FieldByName('FINPAYMENT_GRAND_TOTAL').AsString;
        strgGrid.Cells[_kolStatusFP,intI] := FieldByName('BALANCE_STATUS').AsString;

        if FieldByName('SETUPPOS_IS_RESET').AsInteger = 1 then
          aIsReset := True
        else
          aIsReset := False;

        strgGrid.AddCheckBox(_KolisReset,intI,aIsReset,False);

        strgGrid.Cells[_kolBalId,intI]    := FieldByName('BALANCE_ID').AsString;
        strgGrid.Cells[_kolPosIsAct,intI] := IntToStr(FieldByName('SETUPPOS_IS_ACTIVE').AsInteger);
        strgGrid.Cells[_kolPosIp,intI]    := FieldByName('SETUPPOS_IP').AsString;
        strgGrid.Cells[_kolPosTerml,intI] := FieldByName('SETUPPOS_TERMINAL_CODE').AsString;
        strgGrid.Cells[_kolClosed,intI]   := IntToStr(FieldByName('FINPAYMENT_BALANCE_ID').AsInteger);

        Inc(intI);
        Next;
      end;  
    finally
      Free;
    end;
  end;  

  strgGrid.AutoSize := true;
   }
end;

procedure TfrmResetCashier.ParseHeaderGrid;
begin
  {
  with strgGrid do
  begin
    Clear;
    ColCount  := _colCount;//12;
    RowCount  := _rowCount;
    FixedRows := _fixedRow;
    Cells[_KolCheck,0]    := ' ';
    Cells[_KolPosCode,0]  := 'POS CODE';
    Cells[_KolCashier,0]  := 'CASHIER NAME';
    Cells[_kolTrans,0]    := 'TRANSACTION NO.';
    Cells[_kolLCounter,0] := 'LAST COUNTER NO.';
    Cells[_kolLTransNo,0] := 'LAST TRANSACTION NO.';
    Cells[_kolFPay,0]     := 'FINAL PAYMENT';
    Cells[_kolStatusFP,0] := 'STATUS FPAY.';
    Cells[_KolisReset,0]  := 'IS RESET';
    Cells[_kolClosed,0]   := 'IS CLOSED';

    Autosize := true;
  end;
  }
end;

procedure TfrmResetCashier.actResetCashierExecute(Sender: TObject);
//var
//  chkReset: Boolean;
//  cKey: Char;
//  iResetCount: Integer;
//  isSuccess: boolean;
//  PosIP: string;
//  PosCode: string;
//  chkStatus: Boolean;
//  i: Integer;
begin
  {
  if not IsValidDateKarenaEOD(MasterNewUnit.ID,dtActivate.Date,FMasterIsStore) then
    Exit;

  if (strgGrid.RowCount = _rowCount) and (strgGrid.Cells[_KolPosCode,_fixedRow] = '') then Exit; //tidak ada data

  if CommonDlg.Confirm(CONF_RESET_CASHIER) = mrYes then
  begin
    isSuccess := False;
    with strgGrid, frmMain do
    begin
      PosIP := '0';
      PosCode := '0';
      iResetCount := 0;
      for i:=_fixedRow to RowCount-1 do
      begin
        GetCheckBoxState(_KolCheck,i,chkStatus);
        GetCheckBoxState(_KolisReset,i,chkReset);
        //if(chkStatue)and(strgGrid.Cells[9,i]='0')then
        if (chkStatus) and (chkReset = False) then
        begin
          Inc(iResetCount);
          if(strgGrid.Cells[_kolStatusFP,i] = 'OPEN')then // belum melakukan final payment
          begin
            if(Cells[_kolPosIp,i] = '')then
              PosIP:= '0.0.0.0'
            else
              PosIP:= Cells[_kolPosIp,i];

            if(Cells[_kolPosTerml,i] = '')then
              PosCode:= '-'
            else
              PosCode:= Cells[_kolPosTerml,i];

            isSuccess := False;
            with TBeginningBalance.Create(Self) do
            begin
              if LoadByID(StrToInt(Cells[_kolBalId,i]),MasterNewUnit.ID) then
              begin
                UpdateStatus('CLOSE');
                isSuccess := SaveToDB;
              end;
            end;
            if not isSuccess then
              Break;
          end;
        end;
      end;

      if iResetCount > 0 then
      begin
        if (isSuccess) then
        begin
          cCommitTrans;
          CommonDlg.ShowMessage('Reset cashier successfully.');
          cKey  := Chr(VK_RETURN);
          edtShiftKeyPress(nil, cKey)
        end
        else
        begin
          cRollbackTrans;
          CommonDlg.ShowError('Reset cashier failed.');
        end;
      end;
    end;
  end;
  }
  if (CommonDlg.Confirm(CONF_RESET_CASHIER) = mrYes) then
  begin
    ChangeResetStatus('CLOSE');
  end;
end;

procedure TfrmResetCashier.actUnResetCashierExecute(Sender: TObject);
//var
//  chkReset: Boolean;
//  chkStatus: Boolean;
//  cKey: Char;
//  PosIP: string;
//  PosCode: string;
//  i: Integer;
begin
  {
  if not IsValidDateKarenaEOD(MasterNewUnit.ID, dtActivate.Date, FMasterIsStore) then
    Exit;

  if (strgGrid.RowCount = _rowCount) and (strgGrid.Cells[_KolPosCode,_fixedRow] = '') then
    Exit; //tidak ada data

  if (strgGrid.Cells[_kolStatusFP, strgGrid.Row] = 'OPEN') then // status cashier
  begin
    CommonDlg.ShowMessage('Cashier is OPEN');
    Exit;
  end;

  if (strgGrid.Ints[_kolClosed, strgGrid.Row] <> 0) then // belum closing payment
  begin
    CommonDlg.ShowMessage('Cashier was already CLOSING PAYMENT');
    Exit;
  end;

  strgGrid.GetCheckBoxState(_KolCheck, strgGrid.Row, chkStatus);
  strgGrid.GetCheckBoxState(_KolisReset, strgGrid.Row, chkReset);
  if (not chkStatus) and (chkReset = False) then
  begin
    if CommonDlg.Confirm(CONF_UNRESET_CASHIER) = mrYes then
    begin
      with strgGrid, frmMain do
      begin
        PosIP := '0';
        PosCode := '0';
        i := Row;

        if(Cells[_kolPosIp,i] = '')then
          PosIP := '0.0.0.0'
        else
          PosIP := Cells[_kolPosIp,i];

        if(Cells[_kolPosTerml,i] = '')then
          PosCode := '-'
        else
          PosCode := Cells[_kolPosTerml,i];

        with TBeginningBalance.Create(Self) do
        begin
          if LoadByID(StrToInt(Cells[_kolBalId,i]), MasterNewUnit.ID) then
          begin
            UpdateStatus('OPEN');
            if SaveToDB then
            begin
              cCommitTrans;
              CommonDlg.ShowMessage('UnReset cashier successfully.');
              cKey  := Chr(VK_RETURN);
              edtShiftKeyPress(nil, cKey)
            end
            else
            begin
              cRollbackTrans;
              CommonDlg.ShowError('UnReset cashier failed.');
            end;
          end;
        end;

      end;
    end;
  end
  else
  begin
    CommonDlg.ShowMessage('POS was reset');
    Exit;
  end;
  }
  if (CommonDlg.Confirm(CONF_UNRESET_CASHIER) = mrYes) then
  begin
    ChangeResetStatus('OPEN');
  end;
end;

procedure TfrmResetCashier.edtShiftEnter(Sender: TObject);
begin
  edtShift.SelectAll;
end;

procedure TfrmResetCashier.lblCheckAllClick(Sender: TObject);
var i: integer;
begin
  {with strgGrid do
  begin
    for i:= FixedRows to RowCount-1 do
    begin
      if Cells[_kolStatusFP, i] = 'OPEN' then
        SetCheckBoxState(_KolCheck,i,true);
    end;
  end;
  }
  CDS.First;
  while not CDS.Eof do
  begin
    CDS.Edit;
    CDS.FieldByName('CHECK').AsBoolean := True;
    CDS.Post;
    CDS.Next;
  end;
end;

procedure TfrmResetCashier.lblClearAllClick(Sender: TObject);
var i: integer;
begin
  {with strgGrid do
  begin
    for i:=FixedRows to RowCount-1 do
    begin
      SetCheckBoxState(_KolCheck,i,false);

    end;
  end;
  }
  CDS.First;
  while not CDS.Eof do
  begin
    CDS.Edit;
    CDS.FieldByName('CHECK').AsBoolean := False;
    CDS.Post;
    CDS.Next;
  end;
end;

procedure TfrmResetCashier.edtShiftExit(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TfrmResetCashier.edtShiftKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key=(Chr(VK_RETURN)) then
    RefreshData;
end;

procedure TfrmResetCashier.dtAkhirFilterPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TfrmResetCashier.WM_STORE_MESSAGE_Handle(var msg: TMessage);
begin
  case msg.WParam of
    STORE_REFRESH_RESET_CASHIER: ParseDataGrid;
  end;
end;

procedure TfrmResetCashier.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (ssctrl in Shift) and (Key = VK_RETURN) then
    actResetCashierExecute(Self)
  else if (ssShift in Shift) and (Key = VK_RETURN) then
    actUnResetCashierExecute(Self);
end;

procedure TfrmResetCashier.ChangeResetStatus(AReset: string);
var
  lListBalance: TObjectList<TModApp>;
  lModBalance: TModBeginningBalance;
begin
  lListBalance := TObjectList<TModApp>.Create();
  try
    CDS.First;
    while not CDS.Eof do
    begin
      if CDS.FieldByName('CHECK').AsBoolean = True then
      begin
        lModBalance := DMClient.CrudClient.Retrieve(TModBeginningBalance.ClassName, CDS.FieldByName('BEGINNING_BALANCE_ID').AsString) as TModBeginningBalance;
        if lModBalance.BALANCE_STATUS <> AReset then
        begin
          lModBalance.BALANCE_STATUS := AReset;
          lListBalance.Add(lModBalance);
        end;
      end;
      CDS.Next;
    end;

    if DMClient.CrudClient.SaveBatch(lListBalance) then
    begin
      FreeAndNil(lListBalance);
      TAppUtils.Information(CONF_EDIT_SUCCESSFULLY, False);
      RefreshData;
    end;
  except
    TAppUtils.Error(ER_UPDATE_FAILED);
    raise;
  end;
end;

function TfrmResetCashier.IsShiftExist: Boolean;
var
  lModShift: TModShift;
begin
  Result := False;
  lModShift := TModShift.Create;
  try
    lModShift := DMClient.CrudClient.RetrieveByCode(TModShift.ClassName, edtShift.EditValue) as TModShift;

    if lModShift.ID = '' then
    begin
      TAppUtils.Error(ER_SHIFT_NOT_FOUND);
      edtShift.SetFocus;
    end else
    begin
      Result   := True;
    end;
  finally
    lModShift.Free;
  end;
end;

procedure TfrmResetCashier.lblCheckAllMouseEnter(Sender: TObject);
begin
  inherited;
  lblCheckAll.Style.TextStyle := [fsUnderline];
end;

procedure TfrmResetCashier.lblCheckAllMouseLeave(Sender: TObject);
begin
  inherited;
  lblCheckAll.Style.TextStyle := [];
end;

procedure TfrmResetCashier.lblClearAllMouseEnter(Sender: TObject);
begin
  inherited;
  lblClearAll.Style.TextStyle := [fsUnderline];
end;

procedure TfrmResetCashier.lblClearAllMouseLeave(Sender: TObject);
begin
  inherited;
  lblClearAll.Style.TextStyle := [];
end;

procedure TfrmResetCashier.RefreshData;
begin
  inherited;
  if edtShift.Text = '' then
    Exit
  else if not IsShiftExist then
    Exit;

  if Assigned(FCDS) then FreeAndNil(FCDS);
  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.ResetCashier_GetDSOverview(dtAkhirFilter.Date, edtShift.EditValue, TRetno.UnitStore.ID) ,Self );
  cxGridView.LoadFromCDS(CDS);
  cxGridView.SetVisibleColumns(['BEGINNING_BALANCE_ID','FINAL_PAYMENT_ID','SHIFT_NAME','BALANCE_SHIFT_DATE','AUT$UNIT_ID'],False);
  cxGridView.SetReadOnlyAllColumns(True);
  cxGridView.SetReadOnlyColumns(['CHECK'],False);
end;

end.
