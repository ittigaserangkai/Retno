unit ufrmDialogActivatePOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, StdCtrls, ExtCtrls, Mask,
  uConstanta, ActnList, System.Actions, ufraFooterDialog3Button, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxMaskEdit, cxTextEdit, cxDropDownEdit,
  cxCalendar;

type                             
  TFormMode = (fmAdd, fmEdit);
  
  TfrmDialogActivePOS = class(TfrmMasterDialog)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edtTerminalCode: TEdit;
    edtTranscNo: TEdit;
    edtCountNo: TEdit;
    dt1: TcxDateEdit;
    lbl4: TLabel;
    Label1: TLabel;
    edmIPAddr: TcxMaskEdit;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
  public
    SetupPOS_ID: Integer;
    SetupPOS_Status: SmallInt;
    function IsKodePosSudahAda(aKodePOS : String; aTgl : TDateTime; aPosID :
        Integer; aUnitID : Integer): Boolean;
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogActivePOS: TfrmDialogActivePOS;

implementation

uses uTSCommonDlg,  DB, uAppUtils;

{$R *.dfm}

procedure TfrmDialogActivePOS.actDeleteExecute(Sender: TObject);
begin
  inherited;
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
  IsProcessSuccessfull := False;

  if edtTerminalCode.Text = '' then
  begin
    CommonDlg.ShowErrorEmpty('POS CODE');
    edtTerminalCode.SetFocus;
    Exit;
  end;
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
  Close;
end;

procedure TfrmDialogActivePOS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
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
//  edtTranscNo.Text := TPOS.GenerateTransactionNo(edtTerminalCode.Text,dt1.Date);
end;

procedure TfrmDialogActivePOS.FormCreate(Sender: TObject);
begin
  inherited;
  SetupPOS_ID := 0;
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

procedure TfrmDialogActivePOS.jvpdrsPOSKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  inherited;
  if (Key = VK_Return) and (ssCtrl in Shift) then
    actSaveExecute(Self);
  if (Key = VK_Escape) then
  actCancelExecute(Self);
end;

end.





