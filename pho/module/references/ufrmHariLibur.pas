unit ufrmHariLibur;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter5Button, Grids, DB,
  uConn, ActnList, System.Actions;

type
  TfrmHariLibur = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    actlstHariLibur: TActionList;
    actAddHariLibur: TAction;
    actEditHariLibur: TAction;
    actDeleteHariLibur: TAction;
    actRefreshHariLibur: TAction;
    procedure actAddHariLiburExecute(Sender: TObject);
    procedure actEditHariLiburExecute(Sender: TObject);
    procedure actDeleteHariLiburExecute(Sender: TObject);
    procedure actRefreshHariLiburExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
//    FNewDayyOff : TNewDayOff;

    function GetData(): TDataSet;
  public
    { Public declarations }
  end;

var
  frmHariLibur: TfrmHariLibur;

implementation

uses uConstanta,  uTSCommonDlg, ufrmDialogHariLibur;//, uHariLibur;

{$R *.dfm}

{ TfrmHariLibur }

function TfrmHariLibur.GetData: TDataSet;
var IdUnt : Integer;
begin
  // inisiate business model
//  if not assigned(HariLibur) then
//    HariLibur := THariLibur.Create;

  // check is Unit Id specified?
{  if MasterNewUnit.ID <> 0 then
  begin
    IdUnt := MasterNewUnit.ID;
  end
  else
    IdUnt := 0;
 }
//  Result := HariLibur.GetListDataHariLibur(IdUnt);
end;

procedure TfrmHariLibur.actAddHariLiburExecute(Sender: TObject);
begin
  inherited;
//  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    //frmMain.cbbUnit.SetFocus;
    Exit;
  end;
//  if(MasterNewUnit.ID <> 0) then
  begin
    if not Assigned(frmDialogHariLibur) then
      Application.CreateForm(TfrmDialogHariLibur, frmDialogHariLibur);

    frmDialogHariLibur.Caption := 'Add Day Off';
    frmDialogHariLibur.FormMode := fmAdd;

    SetFormPropertyAndShowDialog(frmDialogHariLibur);
    if (frmDialogHariLibur.IsProcessSuccessfull) then
    begin
      actRefreshHariLiburExecute(Self);
      CommonDlg.ShowConfirm(atAdd);
    end;
  end
;//  else
//    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);

  frmDialogHariLibur.Free;
end;

procedure TfrmHariLibur.actEditHariLiburExecute(Sender: TObject);
begin
  inherited;
  // check is Unit Id is specified?
//  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    //frmMain.cbbUnit.SetFocus;
    Exit;
  end;

//  if (MasterNewUnit.ID <> 0) then
  begin
  // if strgGrid.Cells[0,strgGrid.row]= '' then Exit;

    if not Assigned(frmDialogHariLibur) then
      Application.CreateForm(TfrmDialogHariLibur, frmDialogHariLibur);

      frmDialogHariLibur.Caption := 'Edit Day Off';
      frmDialogHariLibur.FormMode := fmEdit;
//      frmDialogHariLibur.HariLiburId := StrToInt(strgGrid.Cells[2,strgGrid.row]);
      SetFormPropertyAndShowDialog(frmDialogHariLibur);
   // if (frmDialogHariLibur.IsProcessSuccessfull) then
    //begin
    //  actRefreshHariLiburExecute(Self);
    //  CommonDlg.ShowConfirm(atEdit);
   // end
  end;
   // else
//    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);

    frmDialogHariLibur.Free;
end;

procedure TfrmHariLibur.actDeleteHariLiburExecute(Sender: TObject);
begin
  inherited;
  try
//    if strgGrid.Cells[0,strgGrid.row]=' ' then Exit;

//    if MasterNewUnit.ID=0 then
    begin
      CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
      //frmMain.cbbUnit.SetFocus;
      Exit;
    end;
//    if (CommonDlg.Confirm('Are you sure you wish to delete Day Off (Name: '+strgGrid.Cells[1,strgGrid.row]+ ' : ' +strgGrid.Cells[2,strgGrid.row]+') ?') = mrYes) then
    begin
      // todo: put your code to delete data here..
      // code goes here..
{      if not assigned(HariLibur) then
        HariLibur := THariLibur.Create;

      if HariLibur.DeleteDataHariLibur(StrToInt(strgGrid.Cells[2,strgGrid.row])) then
      begin
      if FNewDayyOff.RemoveFromDB then
      begin
        CommonDlg.ShowMessage('Data Berhasil DiHapus');
      end
      else begin
        CommonDlg.ShowError('Data Gagal DiHapus');
      end;
     end;
 }   end;
  finally
    frmHariLibur.fraFooter5Button1.btnRefresh.Click;
  end;
end;

procedure TfrmHariLibur.actRefreshHariLiburExecute(Sender: TObject);
var
    dataHariLibur: TDataSet;
    i,countData: Integer;
begin
  inherited;
  dataHariLibur := GetData();
  countData := dataHariLibur.RecordCount;
//  with strgGrid do
//  begin
//    Clear;
//    RowCount := countData+1;
//    ColCount := 2;
//
//    Cells[0, 0] := 'DATE';
//    Cells[1, 0] := 'NAME';
//
//    if (RowCount > 1) then
//    begin
//      i := 1;
//      while not dataHariLibur.Eof do
//      begin
//        Cells[0, i] := dataHariLibur.FieldByName('LBR_DATE').AsString;
//        Cells[1, i] := dataHariLibur.FieldByName('LBR_NAME').AsString;
//        Cells[2, i] := dataHariLibur.FieldByName('LBR_ID').AsString;
//
//        Inc(i);
//        dataHariLibur.Next;
//      end;
//    end
//    else
//    begin
//      RowCount := 2;
//      Cells[0, 1] := ' ';
//      Cells[1, 1] := ' ';
//    end;
//
//    FixedRows := 1;
//    AutoSize := true;
//  end;
end;

procedure TfrmHariLibur.FormDestroy(Sender: TObject);
begin
  inherited;
  frmHariLibur := nil;
end;

procedure TfrmHariLibur.FormShow(Sender: TObject);
begin
  inherited;

  lblHeader.Caption := 'DAY OFF';
  actRefreshHariLiburExecute(Self);
end;

procedure TfrmHariLibur.FormActivate(Sender: TObject);
begin
  inherited;
  //frmMain.CreateMenu((sender as TForm));
end;

procedure TfrmHariLibur.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //frmMain.DestroyMenu((sender as TForm));
end;

procedure TfrmHariLibur.FormCreate(Sender: TObject);
begin
  inherited;
//  FNewDayyOff := TNewDayOff.Create(self);

end;

end.
