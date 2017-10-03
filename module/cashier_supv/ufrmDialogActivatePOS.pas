unit ufrmDialogActivatePOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, StdCtrls, ExtCtrls, Mask,
  uConstanta, ActnList, System.Actions, ufraFooterDialog3Button, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxMaskEdit, cxTextEdit, cxDropDownEdit,
  cxCalendar, uInterface, uClientClasses, uModSetupPOS;

type                             
  TFormMode = (fmAdd, fmEdit);
  
  TfrmDialogActivePOS = class(TfrmMasterDialog, ICRUDAble)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edtTerminalCode: TEdit;
    edtTranscNo: TEdit;
    edtCountNo: TEdit;
    dtSetupPOS: TcxDateEdit;
    lbl4: TLabel;
    Label1: TLabel;
    edmIPAddr: TcxMaskEdit;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtTranscNoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCountNoKeyPress(Sender: TObject; var Key: Char);
    procedure edtTerminalCodeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure jvpdrsPOSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FIsProcessSuccessfull: boolean;
    FFormMode: TFormMode;
    FModSetupPOS: TModSetupPOS;
    procedure ClearForm;
    function GenerateTransactionNo(APOSCode: String; ADate: TDateTime): string;
    function GetModSetupPOS: TModSetupPOS;
    function IsValidate: Boolean;
    procedure SavingData;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    property ModSetupPOS: TModSetupPOS read GetModSetupPOS write FModSetupPOS;
  public
    SetupPOS_ID: Integer;
    SetupPOS_Status: SmallInt;
    function IsKodePosSudahAda(aKodePOS : String; aTgl : TDateTime; aPosID :
        Integer; aUnitID : Integer): Boolean;
    procedure LoadData(AID: string);
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogActivePOS: TfrmDialogActivePOS;

implementation

uses
  DB, uAppUtils, uDMClient, uRetnoUnit;

{$R *.dfm}

procedure TfrmDialogActivePOS.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if TAppUtils.Confirm(CONF_VALIDATE_FOR_DELETE) then
  begin
    DMClient.CrudClient.DeleteFromDB(ModSetupPOS);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.Close;
  end;
  {if not IsValidDateKarenaEOD(masternewunit.id,cGetServerTime,FMasterIsStore) then
    Exit;

  if strgGrid.Cells[7,strgGrid.Row] = '0' then Exit
  else
    if (CommonDlg.Confirm('Are you sure you wish to delete POS (Code: '+ strgGrid.Cells[1,strgGrid.Row]+')?') = mrYes) then
    begin
      if strgGrid.Cells[5,strgGrid.Row] = 'ACTIVE' then
      begin
        CommonDlg.ShowStoppedProcess('POS has been activated');
        Exit;
      end;
      with TPOS.Create(Self) do
      begin
        try
          if LoadByID(strgGrid.Ints[7,strgGrid.Row],masternewunit.id) then
          begin
            if RemoveFromDB then
            begin
              cCommitTrans;
              CommonDlg.ShowMessage(CONF_DELETE_SUCCESSFULLY);
              actRefreshActivatePOSExecute(Self);
            end
            else
            begin
              cRollbackTrans;
              CommonDlg.ShowMessage(CONF_COULD_NOT_DELETE);
            end;
          end;
        finally
          Free;
        	// free resources
        end;  // try/finally
      end;    // with
    end; //end confirm
    }
end;

procedure TfrmDialogActivePOS.actSaveExecute(Sender: TObject);
begin
  inherited;
  if IsValidate then
    SavingData;

//  IsProcessSuccessfull := False;

//  if edtTerminalCode.Text = '' then
//  begin
//    CommonDlg.ShowErrorEmpty('POS CODE');
//    edtTerminalCode.SetFocus;
//    Exit;
//  end;
  {
  if not IsValidDateKarenaEOD(dialogunit,dt1.Date,FMasterIsStore) then
    Exit;

  if IsKodePosSudahAda(edtTerminalCode.Text, dt1.Date, SetupPOS_ID,dialogunit) then
  begin
    CommonDlg.ShowError('Kode POS Sudah Pernah Diinput');
    edtTerminalCode.SetFocus;
    Exit;
  end;

  try
    StrToInt(edtCountNo.Text);
  except
    edtCountNo.Text := '1';
  end;

  with TPOS.Create(Self) do
  begin
    try
      UpdateData(
        SetupPOS_ID,
        dialogunit,
        edtTerminalCode.Text,
        StrToInt(edtCountNo.Text),
        dt1.Date,
        jvpdrsPOS.Text,
        edtTranscNo.Text,
        False,
        True,
        FLoginId);

      IsProcessSuccessfull := SaveToDB;
      if IsProcessSuccessfull then
      begin
        cCommitTrans;
      end else
      begin
        cRollbackTrans;
      end;

    finally
      Free;
    end;
  end;
   }
//  Close;
end;

procedure TfrmDialogActivePOS.ClearForm;
begin
  dtSetupPOS.Date := Now;
  edtTerminalCode.Clear;
  edtTranscNo.Clear;
  edtCountNo.Text := '0';
  edmIPAddr.Clear;
end;

procedure TfrmDialogActivePOS.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogActivePOS := nil;
end;

procedure TfrmDialogActivePOS.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogActivePOS.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogActivePOS.edtTranscNoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', Chr(VK_BACK), Chr(VK_DELETE)]) then
    Key := #0;
end;

procedure TfrmDialogActivePOS.edtCountNoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', Chr(VK_BACK), Chr(VK_DELETE)]) then
    Key := #0;
end;

procedure TfrmDialogActivePOS.edtTerminalCodeChange(Sender: TObject);
begin
  edtTranscNo.Text := GenerateTransactionNo(edtTerminalCode.Text, dtSetupPOS.Date);
end;

procedure TfrmDialogActivePOS.FormCreate(Sender: TObject);
begin
  inherited;
//  SetupPOS_ID := 0;
  ClearForm;
  Self.AssignKeyDownEvent;
end;

function TfrmDialogActivePOS.IsKodePosSudahAda(aKodePOS : String; aTgl :
    TDateTime; aPosID : Integer; aUnitID : Integer): Boolean;
var
  sSQL: string;
begin
  Result := False;

  sSQL := 'select count(setuppos_id) from setuppos'
        + ' where setuppos_terminal_code = ' + QuotedStr(aKodePOS)
        + ' and setuppos_date = ' + TAppUtils.QuotD(aTgl)
        + ' and setuppos_id <> ' + IntToStr(aPosID)
        + ' and setuppos_unt_id = ' + IntToStr(aUnitID);
  {
  with cOpenQuery(sSQL) do
  begin
    try
      if Fields[0].AsInteger > 0 then
        Result := True; 
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmDialogActivePOS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
  if (Key = VK_Return) and (ssCtrl in Shift) then
    actSaveExecute(Self);
  if (Key = VK_Escape) then
    actCancelExecute(Self);
end;

function TfrmDialogActivePOS.GenerateTransactionNo(APOSCode: String; ADate:
    TDateTime): string;
begin
  Result := APOSCode.PadRight(2,'0') + FormatDateTime('ddmmyy',ADate);
  Result := Result.PadRight(12,'0')
end;

function TfrmDialogActivePOS.GetModSetupPOS: TModSetupPOS;
begin
  if not Assigned(FModSetupPOS) then
    FModSetupPOS := TModSetupPOS.Create;

  Result := FModSetupPOS;
end;

function TfrmDialogActivePOS.IsValidate: Boolean;
begin
  Result := False;

  if edtTerminalCode.Text = '' then
  begin
    TAppUtils.Warning('POS Code belum diisi');
    exit;
  end else
    Result := True;
end;

procedure TfrmDialogActivePOS.jvpdrsPOSKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  inherited;
  if (Key = VK_Return) and (ssCtrl in Shift) then
    actSaveExecute(Self);
  if (Key = VK_Escape) then
  actCancelExecute(Self);
end;

procedure TfrmDialogActivePOS.LoadData(AID: string);
begin
  if Assigned(FModSetupPOS) then
    FreeAndNil(FModSetupPOS);

  FModSetupPOS := DMClient.CrudClient.Retrieve(TModSetupPOS.ClassName, AID) as TModSetupPOS;

  if AID = '' then
  begin
    ModSetupPOS.SETUPPOS_IS_ACTIVE     := 0;
    ModSetupPOS.SETUPPOS_IS_RESET      := 1;
  end;

  dtSetupPOS.Date       := ModSetupPOS.SETUPPOS_DATE;
  edtTerminalCode.Text  := ModSetupPOS.SETUPPOS_TERMINAL_CODE;
  edtTranscNo.Text      := ModSetupPOS.SETUPPOS_NO_TRANSAKSI;
  edtCountNo.Text       := IntToStr(ModSetupPOS.SETUPPOS_COUNTER_NO);
  edmIPAddr.Text        := ModSetupPOS.SETUPPOS_IP;
end;

procedure TfrmDialogActivePOS.SavingData;
begin
  ModSetupPOS.SETUPPOS_DATE          := dtSetupPOS.Date;
  ModSetupPOS.SETUPPOS_TERMINAL_CODE := edtTerminalCode.Text;
  ModSetupPOS.SETUPPOS_NO_TRANSAKSI  := edtTranscNo.Text;
  ModSetupPOS.SETUPPOS_COUNTER_NO    := StrToInt(edtCountNo.Text);
  ModSetupPOS.SETUPPOS_IP            := edmIPAddr.Text;
  ModSetupPOS.AUTUNIT                := TRetno.UnitStore;

  Try
    DMClient.CrudClient.SaveToDB(ModSetupPOS);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    ModalResult := mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    Raise;
  End;
end;

end.





