unit ufrmShift;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, ActnList,
  cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, System.Actions,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC;

type
  TfrmShift = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure ParseHeaderGrid;
    procedure ParseDataGrid;
  public
    { Public declarations }
  end;

var
  frmShift: TfrmShift;

implementation

uses  uTSCommonDlg, ufrmDialogShift, uConstanta;

{$R *.dfm}

procedure TfrmShift.actAddExecute(Sender: TObject);
begin
  inherited;
  if not assigned(frmDialogShift) then
    Application.CreateForm(TfrmDialogShift, frmDialogShift);

  frmDialogShift.FormMode := fmAdd;
  frmDialogShift.Caption := 'Add Shift';

  SetFormPropertyAndShowDialog(frmDialogShift);

  if (frmDialogShift.IsProcessSuccessfull) then
  begin
    actRefreshExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atAdd);
  end;
  frmDialogShift.Free;
end;

procedure TfrmShift.ParseHeaderGrid;
begin
  {with strgGrid do
  begin
    Clear;
    RowCount := 2;
    ColCount := 4;
    Cells[0,0] := 'NO.';
    Cells[1,0] := 'CODE';
    Cells[2,0] := 'START TIME';
    Cells[3,0] := 'END TIME';

    FixedRows := 1;
    AutoSize := true;
  end;
  }
end;

procedure TfrmShift.ParseDataGrid;
var intI: Integer;
    data: TDataSet;
begin
  ParseHeaderGrid;
  {
  if not Assigned(Shift) then
    Shift := TShift.Create;

  data := Shift.GetListShift(masternewunit.id);

  if data.RecordCount > 0 then
  begin
    //initiate
    intI := 1;
    data.First;

    with strgGrid, data do
    begin
      RowCount:= RecordCount+1;
      while not(Eof) do
      begin
        Cells[0,intI] := IntToStr(intI) + '.';
        Cells[1,intI] := FieldByName('SHIFT_NAME').AsString;
        Cells[2,intI] := FormatDateTime('hh : nn : ss',FieldByName('SHIFT_START_TIME').AsDateTime);
        Cells[3,intI] := FormatDateTime('hh : nn : ss',FieldByName('SHIFT_END_TIME').AsDateTime);
        Cells[4,intI] := IntToStr(FieldByName('SHIFT_ID').AsInteger);
        Cells[5,intI] := DateTimeToStr(FieldByName('SHIFT_START_TIME').AsDateTime);
        Cells[6,intI] := DateTimeToStr(FieldByName('SHIFT_END_TIME').AsDateTime);
        Inc(intI);
        Next;
      end;
      AutoSize := true;
    end;
  end
  else
  begin
     with strgGrid do
     begin
        Cells[0,1] := ' ';
        Cells[1,1] := ' ';
        Cells[2,1] := ' ';
        Cells[3,1] := ' ';
     end;
  end;
  }
end;

procedure TfrmShift.actEditExecute(Sender: TObject);
begin
  inherited;
  {if strgGrid.Cells[0,strgGrid.Row] = ' ' then Exit;

  if not Assigned(frmDialogShift) then
    Application.CreateForm(TfrmDialogShift, frmDialogShift);

  with frmDialogShift do
  begin
    FormMode := fmEdit;
    frmSuiMasterDialog.Caption := 'Edit Shift';
    IDShift  := StrToInt(strgGrid.Cells[4,strgGrid.Row]);
    SetFormPropertyAndShowDialog(frmDialogShift);

    if (IsProcessSuccessfull) then
    begin
      actRefreshExecute(Self);
      CommonDlg.ShowConfirmSuccessfull(atEdit);
    end;
    Free;
  end;
  }
end;

procedure TfrmShift.actRefreshExecute(Sender: TObject);
begin
  inherited;
  ParseDataGrid;
end;

procedure TfrmShift.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmShift.FormCreate(Sender: TObject);
begin
  inherited;
  Self.Caption := 'Shift';
  lblHeader.Caption := 'SHIFT';
  actRefreshExecute(Self);
end;

procedure TfrmShift.FormDestroy(Sender: TObject);
begin
  inherited;
  frmShift := nil;
end;

end.




