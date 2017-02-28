unit ufrmIGRADesc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls, Grids,
  BaseGrid, AdvGrid, ActnList, uConn;

type
  TfrmIGRADesc = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    strgGrid: TAdvStringGrid;
    actlstIGRADesc: TActionList;
    actAddIGRADesc: TAction;
    actEditIGRADesc: TAction;
    actDeleteIGRADesc: TAction;
    actRefreshIGRADesc: TAction;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actEditIGRADescExecute(Sender: TObject);
    procedure actAddIGRADescExecute(Sender: TObject);
    procedure actDeleteIGRADescExecute(Sender: TObject);
    procedure actRefreshIGRADescExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function GetData(): TDataSet;
  public
    { Public declarations }
  end;

var
  frmIGRADesc: TfrmIGRADesc;

implementation

uses uTSCommonDlg, ufrmDialogIGRADesc, uIGRADesc,  uConstanta;

{$R *.dfm}

procedure TfrmIGRADesc.FormDestroy(Sender: TObject);
begin
  inherited;
  frmIGRADesc := nil;
end;

procedure TfrmIGRADesc.FormShow(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'IGRA DESCRIPTIONS';
  actRefreshIGRADescExecute(Self);
end;

procedure TfrmIGRADesc.actEditIGRADescExecute(Sender: TObject);
begin
  // check is Unit Id is specified?
  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    //frmMain.cbbUnit.SetFocus;
    Exit;
  end;
  if(MasterNewUnit.ID <> 0) then
  begin
    if strgGrid.Cells[0,strgGrid.row]=' ' then Exit;
    if not Assigned(frmDialogIGRADesc) then
      Application.CreateForm(TfrmDialogIGRADesc, frmDialogIGRADesc);

    frmDialogIGRADesc.frmSuiMasterDialog.Caption := 'Edit IGRA DESCRIPTIONS';
    frmDialogIGRADesc.FormMode := fmEdit;
    frmDialogIGRADesc.code := strgGrid.Cells[0,strgGrid.Row];
    frmDialogIGRADesc.descrp := strgGrid.Cells[1,strgGrid.Row];
    frmDialogIGRADesc.IGRADescId := StrToInt(strgGrid.Cells[2,strgGrid.Row]);

    SetFormPropertyAndShowDialog(frmDialogIGRADesc);
    if (frmDialogIGRADesc.IsProcessSuccessfull) then
    begin
      actRefreshIGRADescExecute(Self);
      CommonDlg.ShowConfirm(atEdit);
    end;
  end
  else
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);

  frmDialogIGRADesc.Free;
end;

procedure TfrmIGRADesc.actAddIGRADescExecute(Sender: TObject);
begin
  // check is Unit Id is specified?
  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    //frmMain.cbbUnit.SetFocus;
    Exit;
  end;
  if(MasterNewUnit.ID <> 0) then
  begin
    if not Assigned(frmDialogIGRADesc) then
      Application.CreateForm(TfrmDialogIGRADesc, frmDialogIGRADesc);

    frmDialogIGRADesc.frmSuiMasterDialog.Caption := 'Add IGRA DESCRIPTIONS';
    frmDialogIGRADesc.FormMode := fmAdd;
    frmDialogIGRADesc.IGRADescId := StrToInt(strgGrid.Cells[2,strgGrid.Row]);

    SetFormPropertyAndShowDialog(frmDialogIGRADesc);
    if (frmDialogIGRADesc.IsProcessSuccessfull) then
    begin
     actRefreshIGRADescExecute(Self);
     CommonDlg.ShowConfirm(atAdd);
    end;
  end
  else
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);

  frmDialogIGRADesc.Free;
end;

procedure TfrmIGRADesc.actDeleteIGRADescExecute(Sender: TObject);
begin
  if strgGrid.Cells[0,strgGrid.row]=' ' then Exit;
  if (CommonDlg.Confirm('Are you sure you wish to delete IGRA DESCRIPTIONS ('+strgGrid.Cells[0,strgGrid.row]+')?') = mrYes) then
  begin
    // todo: put your code to delete data here..
    // code goes here..
    if not assigned(IGRADesc) then
      IGRADesc := TIGRADesc.Create;

    if IGRADesc.DeleteIGRADesc(StrToInt(strgGrid.Cells[2,strgGrid.row]),MasterNewUnit.ID) then
    begin
      actRefreshIGRADescExecute(Self);
      CommonDlg.ShowConfirm(atDelete);
    end;
  end;
end;

function TfrmIGRADesc.GetData(): TDataSet;
begin
  // inisiate the business model
  if not assigned(IGRADesc) then
    IGRADesc := TIGRADesc.Create;

    Result := IGRADesc.GetListDataIGRADesc(MasterNewUnit.ID)
end;

procedure TfrmIGRADesc.actRefreshIGRADescExecute(Sender: TObject);
var
  dataIGRADesc: TDataSet;
  i, countData:Integer;
begin
  dataIGRADesc := GetData();
  countData := dataIGRADesc.RecordCount;
  with strgGrid do
  begin
    Clear;
    RowCount := countData+1;
    ColCount := 2;

    Cells[0,0]:=' CODE ';
    Cells[1,0]:=' DESCRIPTIONS ';

    if RowCount > 1 then
    begin
      i := 1;
      while not dataIGRADesc.Eof do
      begin
        Cells[0, i] := dataIGRADesc.FieldByName('IGRKET_CODE').AsString;
        Cells[1, i] := dataIGRADesc.FieldByName('IGRKET_DESCRIPTION').AsString;
        Cells[2, i] := dataIGRADesc.FieldByName('IGRKET_ID').AsString;

        dataIGRADesc.Next;
        Inc(i);
      end;
    end
    else
    begin
      RowCount := 2;
      Cells[0, 1] := ' ';
      Cells[1, 1] := ' ';
      Cells[2, 1] := '0';
    end;

    FixedRows := 1;
    AutoSize := true;
  end;
  //=== R ====
end;

procedure TfrmIGRADesc.FormActivate(Sender: TObject);
begin
  inherited;
  //frmMain.CreateMenu((sender as TForm));
end;

procedure TfrmIGRADesc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //frmMain.DestroyMenu((sender as TForm));
end;

end.
