unit ufrmResetCashier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, uConstanta, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, Vcl.Mask,
  System.Actions, Vcl.ActnList, ufraFooter4Button,
  cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC;

type
  TfrmResetCashier = class(TfrmMasterBrowse)
    pnl1: TPanel;
    pnl2: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    edtShift: TEdit;
    dtActivate: TcxDateEdit;
    pnl3: TPanel;
    btnResetCashier: TcxButton;
    lbl8: TcxLabel;
    lbl3: TcxLabel;
    lbl4: TLabel;
    btnUnResetCashier: TcxButton;
    actResetCashier: TAction;
    actUnResetCashier: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actResetCashierExecute(Sender: TObject);
    procedure actUnResetCashierExecute(Sender: TObject);
    procedure edtShiftEnter(Sender: TObject);
    procedure lbl8Click(Sender: TObject);
    procedure lbl3Click(Sender: TObject);
    procedure edtShiftExit(Sender: TObject);
    procedure edtShiftChange(Sender: TObject);
    procedure edtShiftKeyPress(Sender: TObject; var Key: Char);
    procedure dtActivateChange(Sender: TObject);
    procedure dtActivateExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnUnResetCashierClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
//    datacashier: TResultDataSet;
    procedure ParseHeaderGrid;
    procedure ParseDataGrid();
    procedure WM_STORE_MESSAGE_Handle(var msg: TMessage); message WM_STORE_MESSAGE;
  public
    { Public declarations }
  end;

var
  frmResetCashier: TfrmResetCashier;

implementation

{$R *.dfm}

uses uTSCommonDlg, uRetnoUnit, uAppUtils;

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

procedure TfrmResetCashier.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//  frmMain.DestroyMenu((Sender as TForm));
  Action := caFree;
end;

procedure TfrmResetCashier.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'RESET CASHIER';
//  dtActivate.Date := ActivatePOS.getServerDate;
  ParseDataGrid;
end;

procedure TfrmResetCashier.FormDestroy(Sender: TObject);
begin
  inherited;
  frmResetCashier := nil;
end;

procedure TfrmResetCashier.ParseDataGrid;
var
  intI: Integer;
  aIsReset: Boolean;
  ssQL: string;
  tempTransc: string;
begin

  ssQL := 'SELECT SP.*, FP.FINPAYMENT_GRAND_TOTAL, AU.USR_FULLNAME,'
        + '   BB.BALANCE_ID, BB.BALANCE_STATUS, S.SHIFT_NAME, FP.FINPAYMENT_BALANCE_ID'
        + ' FROM SETUPPOS SP'
        + ' INNER JOIN BEGINNING_BALANCE BB ON BB.BALANCE_SETUPPOS_ID = SP.SETUPPOS_ID'
        + '   AND BB.BALANCE_SETUPPOS_UNT_ID = SP.SETUPPOS_UNT_ID'
        + ' INNER JOIN SHIFT S ON S.SHIFT_ID = BB.BALANCE_SHIFT_ID'
        + '   AND S.SHIFT_UNT_ID = BB.BALANCE_SHIFT_UNT_ID'
        + ' LEFT JOIN FINAL_PAYMENT FP ON FP.FINPAYMENT_BALANCE_ID = BB.BALANCE_ID'
        + '   AND FP.FINPAYMENT_BALANCE_UNT_ID = BB.BALANCE_UNT_ID'
        + ' LEFT JOIN AUT$USER AU ON AU.USR_ID = BB.BALANCE_USR_ID'
        + '   AND AU.USR_UNT_ID=BB.BALANCE_USR_UNT_ID'
        + ' WHERE BB.BALANCE_SHIFT_DATE = '+ TAppUtils.QuotD(dtActivate.Date)
        + '   AND BB.BALANCE_UNT_ID = '+ IntToStr(MasterNewUnit)
//        + '   and BB.BALANCE_STATUS = ''CLOSE'''
//        + '   and sp.SETUPPOS_IS_RESET = 0'
        + ' ORDER BY SP.SETUPPOS_TERMINAL_CODE';
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
var
  chkReset: Boolean;
  cKey: Char;
  iResetCount: Integer;
  isSuccess: boolean;
  PosIP: string;
  PosCode: string;
  chkStatus: Boolean;
  i: Integer;
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
end;

procedure TfrmResetCashier.actUnResetCashierExecute(Sender: TObject);
var
  chkReset: Boolean;
  chkStatus: Boolean;
  cKey: Char;
  PosIP: string;
  PosCode: string;
  i: Integer;
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
end;

procedure TfrmResetCashier.edtShiftEnter(Sender: TObject);
begin
  edtShift.SelectAll;
end;

procedure TfrmResetCashier.lbl8Click(Sender: TObject);
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
end;

procedure TfrmResetCashier.lbl3Click(Sender: TObject);
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
end;

procedure TfrmResetCashier.edtShiftExit(Sender: TObject);
begin
  inherited;
  ParseDataGrid;
end;

procedure TfrmResetCashier.edtShiftChange(Sender: TObject);
begin
  inherited;
  ParseHeaderGrid;
end;

procedure TfrmResetCashier.edtShiftKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key=(Chr(VK_RETURN)) then
    ParseDataGrid;
end;

procedure TfrmResetCashier.dtActivateChange(Sender: TObject);
begin
  inherited;
  ParseHeaderGrid;
end;

procedure TfrmResetCashier.dtActivateExit(Sender: TObject);
begin
  inherited;
  ParseDataGrid;
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

procedure TfrmResetCashier.btnUnResetCashierClick(Sender: TObject);
begin
  inherited;
  actUnResetCashierExecute(actUnResetCashier);
end;

procedure TfrmResetCashier.FormShow(Sender: TObject);
begin
  inherited;
  btnUnResetCashier.Enabled := True;
end;

end.
