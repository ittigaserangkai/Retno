unit ufrmDialogShift;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ExtCtrls,
  ComCtrls, StdCtrls, System.Actions, Vcl.ActnList, ufraFooterDialog3Button;

type
  TFormMode = (fmAdd, fmEdit);
  TfrmDialogShift = class(TfrmMasterDialog)
    edtNameShift: TLabeledEdit;
    dtpStart: TDateTimePicker;
    dtpEnd: TDateTimePicker;
    Label1: TLabel;
    lbl1: TLabel;
    procedure actDeleteExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
  private
    FIsProcessSuccessfull: boolean;
    FFormMode: TFormMode;
    FIDShift: Integer;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure SetIDShift(const Value: Integer);
    procedure PrepareAdd;
    procedure PrepareEdit;
  public
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
    property IDShift: Integer read FIDShift write SetIDShift;
  end;

var
  frmDialogShift: TfrmDialogShift;

implementation

uses ufrmShift, uTSCommonDlg, uRetnoUnit;

{$R *.dfm}

procedure TfrmDialogShift.actDeleteExecute(Sender: TObject);
begin
  inherited;
  {
  if strgGrid.Cells[0,strgGrid.Row] = ' ' then Exit
  else
    if (CommonDlg.Confirm('Are you sure you wish to delete Shift(Code: '+ strgGrid.Cells[1,strgGrid.Row]+')?') = mrYes) then
    begin
      with TNewShift.Create(Self) do
      begin
        try
          if LoadByID(strgGrid.Ints[4,strgGrid.Row],masternewunit.id) then
          begin
            if RemoveFromDB then
            begin
              cCommitTrans;
              CommonDlg.ShowMessage(CONF_DELETE_SUCCESSFULLY);
              actRefreshShiftExecute(Self);
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
    end; //end confirm
    }
end;

procedure TfrmDialogShift.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogShift.SetIsProcessSuccessfull(const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogShift.SetIDShift(const Value: Integer);
begin
  FIDShift := Value;
end;

procedure TfrmDialogShift.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogShift.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogShift := nil;
end;

procedure TfrmDialogShift.PrepareAdd;
begin
  edtNameShift.Clear;
end;

procedure TfrmDialogShift.PrepareEdit;
begin
  {edtNameShift.Text:= frmShift.strgGrid.Cells[1,frmShift.strgGrid.Row];
  dtpStart.DateTime:= StrToDateTime(frmShift.strgGrid.Cells[5,frmShift.strgGrid.Row]);
  dtpEnd.DateTime:= StrToDateTime(frmShift.strgGrid.Cells[6,frmShift.strgGrid.Row]);
  }
end;

procedure TfrmDialogShift.FormShow(Sender: TObject);
begin
  inherited;
  if FormMode=fmAdd then
  begin
    PrepareAdd;
    IDShift := -1;
  end
  else
    PrepareEdit;
  edtNameShift.SelectAll;
end;

procedure TfrmDialogShift.footerDialogMasterbtnSaveClick(Sender: TObject);
begin
  inherited;
  {
  if not IsValidDateKarenaEOD(dialogunit,cGetServerTime,FMasterIsStore) then
    Exit;

  if edtNameShift.Text = '' then
  begin
    CommonDlg.ShowErrorEmpty('SHIFT NAME');
    edtNameShift.SetFocus;
    Exit;
  end;

  with TNewShift.Create(Self) do
  begin
    try
      UpdateData(dialogunit,
        dtpEnd.DateTime,
        IDShift,
        edtNameShift.Text,
        dtpStart.DateTime);
      IsProcessSuccessfull := SaveToDB;
      if IsProcessSuccessfull then
      begin
        cCommitTrans;
        //CommonDlg.ShowMessage(CONF_SAVE_SUCCESSFULLY);
      end
      else
      begin
        cRollbackTrans;
        //CommonDlg.ShowError(CONF_SAVE_FAILED);
      end;    
    finally
      Free;
    	// free resources
    end;  // try/finally
  end;
  Close;
  }
end;

end.




