unit ufrmDialogBeginningBalancePOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ExtCtrls, StdCtrls, System.Actions, Vcl.ActnList,
  ufraFooterDialog3Button, cxGraphics, cxControls, cxLookAndFeels, Data.DB,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxCurrencyEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, uClientClasses, uInterface, uModBeginningBalance,
  Datasnap.DBClient;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogBeginBalancePOS = class(TfrmMasterDialog, ICRUDAble)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    cbpCashierID: TcxExtLookupComboBox;
    curredtBeginBalance: TcxCurrencyEdit;
    cbpPosCode: TcxExtLookupComboBox;
    edtCashierName: TcxTextEdit;
    edtDescrp: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbpCashierIDCloseUp(Sender: TObject);
    procedure curredtBeginBalanceEnter(Sender: TObject);
    procedure cbpCashierIDPropertiesEditValueChanged(Sender: TObject);
  private
    FKasirUsrNm : string;
    dataUser,dataSetupPos: TDataSet;
    FCDSSetupPOS: TClientDataSet;
    FCDSUser: TClientDataSet;
    procedure ClearForm;
    procedure InitLookUp;
    function IsValidate: Boolean;
    procedure LoadDropDownData(ACombo: TcxExtLookupComboBox; AColsOfData: Integer; aTgl :
        TDateTime);
    procedure SavingData;
  public
    Balance_ID: Integer;
    Balance_Shift_ID: Integer;
    Balance_Shift_Date: TDateTime;
    PosCode,CashierID, CashierName: string;
    Modal: Currency;
    Descrpt: string;
    FModBalance: TModBeginningBalance;
    function GetModBalance: TModBeginningBalance;
    procedure LoadData(AID: string);
    property ModBalance: TModBeginningBalance read GetModBalance write FModBalance;
//    FTgl: TDateTime;
  published
  end;

var
  frmDialogBeginBalancePOS: TfrmDialogBeginBalancePOS;

implementation

uses
  uConstanta, uTSCommonDlg, uRetnoUnit, ufrmBeginningBalancePOS, uDXUtils,
  uDMClient, uAppUtils, uModSetupPOS, uModAuthUser, uDBUtils, uModShift,
  uModelHelper;

{$R *.dfm}

procedure TfrmDialogBeginBalancePOS.FormCreate(Sender: TObject);
begin
  inherited;
  ClearForm;
  InitLookUp;
  Self.AssignKeyDownEvent;
  curredtBeginBalance.EditValue := 200000;
end;

procedure TfrmDialogBeginBalancePOS.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if TAppUtils.Confirm(CONF_VALIDATE_FOR_DELETE) then
  begin
    try
      DMClient.CrudClient.DeleteFromDB(ModBalance);
      TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
      ModalResult := mrOk;
    except
      TAppUtils.Error(ER_DELETE_FAILED);
      raise;
    end;
  end;
  {
  if (strgGrid.Cells[_kolBegBal_ID,strgGrid.Row] = '0') or (strgGrid.Cells[_kolPosCode,strgGrid.Row] = '') then Exit;

  if IsBeginningBalanceUsed(StrToInt(strgGrid.Cells[_kolBegBal_ID,strgGrid.Row]),masternewunit.id) then
  begin
    CommonDlg.ShowMessage('Kasir sudah transaksi, tidak bisa dihapus.');
    Exit;
  end;

  if (CommonDlg.Confirm('Are you sure you wish to delete POS Beginning Balance (POS CODE: '+ strgGrid.Cells[1,strgGrid.Row] +')?') = mrYes) then
  begin
    with TBeginningBalance.Create(Self) do
    begin
      try
        if LoadByID(StrToInt(strgGrid.Cells[_kolBegBal_ID,strgGrid.Row]),masternewunit.id) then
        begin
          if RemoveFromDB then
          begin
            cCommitTrans;
            CommonDlg.ShowMessage(CONF_DELETE_SUCCESSFULLY);
            actRefreshBeginBalancePOSExecute(Self);
          end
          else
          begin
            cRollbackTrans;
            CommonDlg.ShowMessage(CONF_COULD_NOT_DELETE);
          end;
        end;
      finally
        Free;
      end;
    end;
  end;  //end confirm
  }
end;

procedure TfrmDialogBeginBalancePOS.actSaveExecute(Sender: TObject);
begin
  inherited;
  if IsValidate then
    SavingData;
end;

procedure TfrmDialogBeginBalancePOS.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogBeginBalancePOS := nil;
end;

procedure TfrmDialogBeginBalancePOS.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;
  //init

  if(cbpPosCode.Text = '') then
  begin
    CommonDlg.ShowErrorEmpty('POS CODE');
    cbpPosCode.SetFocus;
    Exit;
  end;

  if(cbpCashierID.Text = '') then
  begin
    CommonDlg.ShowErrorEmpty('CASHIER ID');
    cbpCashierID.SetFocus;
    Exit;
  end;
  {
  if not IsValidDateKarenaEOD(dialogunit,frmBeginningBalancePOS.dt1.Date,FMasterIsStore) then
    Exit;

  IsProcessSuccessfull := False;

  with TBeginningBalance.CreateWithUser(Self,FLoginId,dialogunit) do
  begin
    try
      UpdateData(dialogunit,
        edtDescrp.Text,
        Balance_ID,
        StrToInt(CashierID),
        dialogunit,
        curredtBeginBalance.Value,
        StrToInt(cbpPosCode.Cells[0,cbpPosCode.Row]),
        Balance_Shift_ID,
        Balance_Shift_Date,
        'OPEN'
        );

      if IsPOSIniSudahDisettingBBnya and (FormMode=fmAdd) then
      begin
        CommonDlg.ShowError('POS Ini Sudah Disetting Beginning Balance-nya');
        cbpPosCode.SetFocus;
        Exit;
      end;

      if IsKasirIniSudahDisettingBBnya  and (FormMode=fmAdd) then
      begin
        CommonDlg.ShowError('Kasir Ini Sudah Disetting Beginning Balance-nya');
        cbpCashierID.SetFocus;
        Exit;
      end;

      if IsKasirIniSudahDiShiftLain and (FormMode=fmAdd) then
      begin
        CommonDlg.ShowError('Kasir Ini Sudah Digunakan di shift lain');
        cbpPosCode.SetFocus;
        Exit;
      end;

      IsProcessSuccessfull := SaveToDB;
      if IsProcessSuccessfull then
      begin
        cCommitTrans;
      end
      else
      begin
        cRollbackTrans;
      end;    
    finally
      Free;
    end;
  end;
   }
  Close;
end;

procedure TfrmDialogBeginBalancePOS.FormShow(Sender: TObject);
begin
  inherited;
  {if not Assigned(BeginningBalancePOS) then
    BeginningBalancePOS := TBeginningBalancePOS.Create;

  dataSetupPos := BeginningBalancePOS.GetListDataSetupPos(dialogunit);
  LoadDropDownData(cbpPosCode,dataSetupPos.RecordCount, Balance_Shift_Date);

  dataUser := BeginningBalancePOS.GetListDataUser(dialogunit);
  LoadDropDownData(cbpCashierID,dataUser.RecordCount, Balance_Shift_Date);

  if FormMode = fmEdit then
  begin
    cbpPosCode.Value    := PosCode;
    cbpPosCode.Enabled  := False;

    cbpCashierID.Text         := FKasirUsrNm;
    cbpCashierID.Enabled      := False;
    edtCashierName.Text       := CashierName;
    curredtBeginBalance.Value := Modal;
    edtDescrp.Text            := Descrpt;
  end
  else
  begin
    cbpCashierID.Enabled      := True;
    cbpPosCode.Enabled        := True;
    curredtBeginBalance.Value := BEGINNING_BALANCE_MODAL;
    edtDescrp.Text := '';
  end;
   }
end;

procedure TfrmDialogBeginBalancePOS.LoadDropDownData(ACombo: TcxExtLookupComboBox;
    AColsOfData: Integer; aTgl : TDateTime);
var
  sSQL: string;
begin
  {ACombo.ClearGridData;

  ACombo.RowCount := 2;
  ACombo.ColCount := 2;

  if ACombo = cbpCashierID then
  begin
    ACombo.AddRow(['ID','CASHIER ID', 'CASHIER NAME']);

    if dataUser.RecordCount > 0 then
    begin
      ACombo.RowCount := dataUser.RecordCount + 1;
      dataUser.First;
      while not dataUser.Eof do
      begin
        try
          ACombo.AddRow([dataUser.FieldByName('USR_ID').AsString,
                         dataUser.FieldByName('USR_USERNAME').AsString,
                         dataUser.FieldByName('USR_FULLNAME').AsString]);

          if (LowerCase(TcxExtLookupComboBox(ACombo).Name) = LowerCase('cbpCashierID'))
              and (FormMode = fmEdit) then
            if dataUser.FieldByName('USR_ID').AsInteger = StrToInt(CashierID) then
              FKasirUsrNm := dataUser.FieldByName('USR_USERNAME').AsString;

        except
        end;

        dataUser.Next;
      end;// end while
    end// if comptt
    else
    begin
      ACombo.RowCount := 2;
      ACombo.AddRow(['','']);
    end;

  end; //end if acombo

  if ACombo = cbpPosCode then
  begin
    ACombo.AddRow(['ID','POS CODE']);
    sSQL := 'SELECT SETUPPOS_ID, SETUPPOS_TERMINAL_CODE '
            + 'FROM SETUPPOS '
            + 'WHERE SETUPPOS_IS_ACTIVE = 1 '
            + ' and SETUPPOS_UNT_ID = ' + IntToStr(dialogunit)
            + ' and setuppos_date = ' + QuotD(aTgl)
            + ' ORDER BY SETUPPOS_TERMINAL_CODE';

    with cOpenQuery(sSQL) do
    begin
      try
        LAST;
        FIRST;
        if RecordCount > 0 then
        begin
          ACombo.RowCount := RecordCount + 1;
          dataSetupPos.First;
          while not Eof do
          begin
            try
              ACombo.AddRow([FieldByName('SETUPPOS_ID').AsString,
                             FieldByName('SETUPPOS_TERMINAL_CODE').AsString]);
            except
            end;

            Next;
          end;// end while
        end// if comptt
        else
        begin
          ACombo.RowCount := 2;
          ACombo.AddRow(['','']);
        end;

      finally
        Free;
      end;
    end;




  end; //end if acombo

  ACombo.SizeGridToData;
  ACombo.FixedRows:= 1;
  }
end;

procedure TfrmDialogBeginBalancePOS.cbpCashierIDCloseUp(Sender: TObject);
begin
  inherited;
//  CashierID := cbpCashierID.Cells[0,cbpCashierID.Row];
end;

procedure TfrmDialogBeginBalancePOS.cbpCashierIDPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  edtCashierName.EditValue := FCDSUser.FieldByName('USR_FULLNAME').AsString;
end;

procedure TfrmDialogBeginBalancePOS.ClearForm;
begin
  ClearByTag([0]);

  ModBalance.BALANCE_SHIFT_DATE := frmBeginningBalancePOS.dtAkhirFilter.Date;
  ModBalance.BALANCE_STATUS     := 'OPEN';
  ModBalance.ISJOURNALIZED      := 0;
  ModBalance.SHIFT              := TModShift.CreateID(frmBeginningBalancePOS.FShiftID);
end;

procedure TfrmDialogBeginBalancePOS.curredtBeginBalanceEnter(
  Sender: TObject);
begin
  inherited;
  curredtBeginBalance.SelectAll;
end;

function TfrmDialogBeginBalancePOS.GetModBalance: TModBeginningBalance;
begin
  if not Assigned(FModBalance) then
    FModBalance := TModBeginningBalance.Create;
  Result := FModBalance;
end;

procedure TfrmDialogBeginBalancePOS.InitLookUp;
begin
  FCDSUser := TDBUtils.DSToCDS(DMClient.DSProviderClient.AutUser_GetDSLookUp('OPERATOR POS'), Self);
  cbpCashierID.LoadFromCDS(FCDSUser,'AUT$USER_ID','CASHIER_NAME',['AUT$USER_ID','USR_FULLNAME'],Self);

  FCDSSetupPOS := TDBUtils.DSToCDS(DMClient.DSProviderClient.SetupPOS_GetDSLookUp(ModBalance.BALANCE_SHIFT_DATE, TRetno.UnitStore.ID), Self);
  cbpPosCode.LoadFromCDS(FCDSSetupPOS,'SETUPPOS_ID','POS_CODE',['SETUPPOS_ID'],Self);
end;

function TfrmDialogBeginBalancePOS.IsValidate: Boolean;
begin
  Result := False;

  if VarIsNull(cbpPosCode.EditValue) then
  begin
    TAppUtils.Warning('POS CODE belum diisi');
    exit;
  end else
  if VarIsNull(cbpCashierID.EditValue) then
  begin
    TAppUtils.Warning('CASHIER ID belum diisi');
    exit;
  end else
    Result := True;
end;

procedure TfrmDialogBeginBalancePOS.LoadData(AID: string);
begin
  if Assigned(FModBalance) then
    FreeAndNil(FModBalance);

  FModBalance := DMClient.CrudClient.Retrieve(TModBeginningBalance.ClassName, AID) as TModBeginningBalance;

  ModBalance.AUTUSER.Reload();
  cbpPosCode.EditValue          := ModBalance.SETUPPOS.ID;
  cbpCashierID.EditValue        := ModBalance.AUTUSER.ID;
  edtCashierName.EditValue      := ModBalance.AUTUSER.USR_FULLNAME;
  curredtBeginBalance.EditValue := ModBalance.BALANCE_MODAL;
  edtDescrp.EditValue           := ModBalance.BALANCE_DESCRIPTION;
end;

procedure TfrmDialogBeginBalancePOS.SavingData;
begin
  ModBalance.SETUPPOS             := TModSetupPOS.CreateID(cbpPosCode.EditValue);
  ModBalance.AUTUSER              := TModAuthUser.CreateID(cbpCashierID.EditValue);
  ModBalance.BALANCE_MODAL        := curredtBeginBalance.EditValue;
  ModBalance.BALANCE_DESCRIPTION  := VarToStr(edtDescrp.EditValue);
  ModBalance.AUTUNIT              := TRetno.UnitStore;

  Try
    DMClient.CrudClient.SaveToDB(ModBalance);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    ModalResult := mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    Raise;
  End;
end;

end.





