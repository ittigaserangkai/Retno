unit ufrmDaftarCompetitor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, ActnList, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  System.Actions, ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC;

type
  TfrmDaftarCompetitor = class(TfrmMasterBrowse)
    actlstDaftarCompetitor: TActionList;
    actAddDaftarKompetitor: TAction;
    actEditDaftarKompetitor: TAction;
    actDeleteDaftarKompetitor: TAction;
    actRefreshDaftarKompetitor: TAction;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAddClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private

  public

    iIdCompetitor: Integer;
  end;

var
  frmDaftarCompetitor: TfrmDaftarCompetitor;

implementation

uses udmMain, ufrmDialogDaftarKompetitor, uTSCommonDlg, uConstanta;

{$R *.dfm}

procedure TfrmDaftarCompetitor.FormShow(Sender: TObject);
begin
  inherited;
  lblHeader.Caption:='COMPETITOR MASTER';
  actRefreshExecute(Self);
end;

procedure TfrmDaftarCompetitor.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDaftarCompetitor := nil;
end;

procedure TfrmDaftarCompetitor.actAddExecute(Sender: TObject);
begin
  inherited;
//  if MasterNewUnit.ID = 0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    Exit;
  end;
  if not Assigned(frmDialogDaftarKompetitor) then
    Application.CreateForm(TfrmDialogDaftarKompetitor, frmDialogDaftarKompetitor);
  frmDialogDaftarKompetitor.Caption := 'Add List Competitor';
  frmDialogDaftarKompetitor.FormMode := fmAdd;
  SetFormPropertyAndShowDialog(frmDialogDaftarKompetitor);
  frmDialogDaftarKompetitor.ComptId := 0;

  if (frmDialogDaftarKompetitor.IsProcessSuccessfull) then
  begin
    actRefreshExecute(Self);
    CommonDlg.ShowConfirm(atAdd);
  end;

  frmDialogDaftarKompetitor.Free;
end;

procedure TfrmDaftarCompetitor.actEditExecute(Sender: TObject);
begin
  inherited;
  {if strgGrid.Cells[3,strgGrid.row]='0' then Exit;
  if MasterNewUnit.ID = 0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    Exit;
  end;
  if not Assigned(frmDialogDaftarKompetitor) then
    Application.CreateForm(TfrmDialogDaftarKompetitor, frmDialogDaftarKompetitor);
  frmDialogDaftarKompetitor.frmSuiMasterDialog.Caption := 'Edit List Competitor';
  frmDialogDaftarKompetitor.FormMode := fmEdit;
  frmDialogDaftarKompetitor.ComptId := strgGrid.ints[3,strgGrid.Row];

  SetFormPropertyAndShowDialog(frmDialogDaftarKompetitor);
  if (frmDialogDaftarKompetitor.IsProcessSuccessfull) then
  begin
    actRefreshDaftarKompetitorExecute(Self);
    CommonDlg.ShowConfirm(atEdit);
  end;
  }
  frmDialogDaftarKompetitor.Free;
end;

procedure TfrmDaftarCompetitor.actRefreshExecute(Sender: TObject);
var
  data: TDataSet;
  i: Integer;
begin
  inherited;
  {
  if not assigned(DaftarCompetitor) then
    DaftarCompetitor := TDaftarCompetitor.Create;

  data := DaftarCompetitor.GetDataCompetitor(MasterNewUnit.ID);
  with strgGrid do
  begin
    Clear;
    ColCount := 4;
    RowCount := data.RecordCount+1;
    Cells[0, 0] := 'Competitor Code';
    Cells[1, 0] := 'Competitor Name';
    Cells[2, 0] := 'Is Active';
    Cells[3, 0] := 'ID';
    i:=1;
    if RowCount>1 then
    with data do
    while not Eof do
    begin
      Cells[0, i] := FieldByName('KOMPT_CODE').AsString;
      Cells[1, i] := FieldByName('KOMPT_NAME').AsString;
      if (FieldByName('KOMPT_IS_ACTIVE').AsInteger=1) then
        Cells[2, i] := 'YES'
      else
        Cells[2, i] := 'NO';
      Cells[3, i] := inttostr(FieldByName('KOMPT_ID').AsInteger);
      i:=i+1;
      Next;
    end
    else
    begin
      RowCount:=2;
      Cells[0, 1] := ' ';
      Cells[1, 1] := ' ';
      Cells[2, 1] := ' ';
      Cells[3, 1] := '0';
    end;
    FixedRows := 1;
    AutoSize := true;
    strgGrid.ColWidths[3]:=0;
  end;
  }
end;

procedure TfrmDaftarCompetitor.btnAddClick(Sender: TObject);
begin
  inherited;
  if MasterCompany.ID = 0 then
  begin
    CommonDlg.ShowError(ER_COMPANY_NOT_SPECIFIC);
    Exit;
  end;
  actAddExecute(Self);
end;

procedure TfrmDaftarCompetitor.btnPrintClick(Sender: TObject);
begin
  inherited;
  actRefreshExecute(Self);
end;

procedure TfrmDaftarCompetitor.btnUpdateClick(Sender: TObject);
begin
  inherited;
  if MasterCompany.ID = 0 then
  begin
    CommonDlg.ShowError(ER_COMPANY_NOT_SPECIFIC);
    Exit;
  end;
  actEditExecute(Self);
end;

procedure TfrmDaftarCompetitor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.


