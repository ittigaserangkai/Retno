unit ufrmUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ActnList, ufraFooter5Button,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, System.Actions, cxClasses;

type
  TfrmUser = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    actlstMerchandiseGroup: TActionList;
    actAddUser: TAction;
    actEditUser: TAction;
    actDeleteUser: TAction;
    actRefreshUser: TAction;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid: TcxGrid;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actAddUserExecute(Sender: TObject);
    procedure actEditUserExecute(Sender: TObject);
    procedure actDeleteUserExecute(Sender: TObject);
    procedure actRefreshUserExecute(Sender: TObject);
  private
    { Private declarations }
  public
    function RemoveFromDB(aKodeUser:Integer;aUnitID:Integer): Boolean;
    { Public declarations }
  end;

var
  frmUser: TfrmUser;

implementation

uses  uConn, uTSCommonDlg, ufrmDialogUser, uConstanta, uRetnoUnit;

{$R *.dfm}

procedure TfrmUser.FormActivate(Sender: TObject);
begin
  inherited;
  //frmMain.CreateMenu((sender as TForm));
end;

procedure TfrmUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  //frmMain.DestroyMenu((sender as TForm));
end;

procedure TfrmUser.FormDestroy(Sender: TObject);
begin
  inherited;
  frmUser := nil;
end;

procedure TfrmUser.FormShow(Sender: TObject);
begin
  inherited;
  lblHeader.Caption:='DATA USER';
  actRefreshUserExecute(Self);
end;

procedure TfrmUser.actAddUserExecute(Sender: TObject);
begin
  inherited;
//  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    ////frmMain.cbbUnit.SetFocus;
    Exit;
  end;
  if not Assigned(frmDialogUser) then
    Application.CreateForm(TfrmDialogUser, frmDialogUser);
  frmDialogUser.Caption := 'Add User';
  frmDialogUser.FormMode := fmAdd;
  frmDialogUser.NamaLama := '';
  frmDialogUser.UserId := 0;
  SetFormPropertyAndShowDialog(frmDialogUser);
  if (frmDialogUser.IsProcessSuccessfull) then
  begin
    actRefreshUserExecute(Self);
  end;

  frmDialogUser.Free;
end;

procedure TfrmUser.actEditUserExecute(Sender: TObject);
begin
  inherited;
//  ShowMessage(strgGrid.Cells[6,strgGrid.Row]);
//  if strgGrid.Cells[0,strgGrid.row]='' then Exit;
//  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    ////frmMain.cbbUnit.SetFocus;
    Exit;
  end;
  if not Assigned(frmDialogUser) then
    Application.CreateForm(TfrmDialogUser, frmDialogUser);
  frmDialogUser.Caption := 'Edit User';
  frmDialogUser.FormMode := fmEdit;
//  frmDialogUser.NamaLama := strgGrid.Cells[1,strgGrid.Row];
//  frmDialogUser.UserId := StrToInt(strgGrid.Cells[6,strgGrid.Row]);
  SetFormPropertyAndShowDialog(frmDialogUser);
  if (frmDialogUser.IsProcessSuccessfull) then
  begin
    actRefreshUserExecute(Self);
//    CommonDlg.ShowConfirm(atEdit);
  end;

  frmDialogUser.Free;
end;

procedure TfrmUser.actDeleteUserExecute(Sender: TObject);
//var //arrParam : TArr;
  //sSQL: string;
begin
  inherited;
//  if strgGrid.Cells[0,strgGrid.row]='' then Exit;
//  if (CommonDlg.Confirm('Are you sure you wish to delete User (Full Name: '+strgGrid.Cells[2,strgGrid.row]+')?') = mrYes) then
  begin
    {if not assigned(User) then
      User := TUser.Create;
    SetLength(arrParam,2);
    arrParam[0].tipe := ptInteger;
    arrParam[0].data := StrToInt(strgGrid.Cells[6,strgGrid.Row]);
    arrParam[1].tipe := ptInteger;
    arrParam[1].data := MasterNewUnit.ID; }

//    if RemoveFromDB(StrToInt(strgGrid.Cells[6,strgGrid.Row]),MasterNewUnit.ID) then
    begin
      actRefreshUserExecute(Self);
      CommonDlg.ShowConfirm(atDelete);
    end;
  end;
end;

procedure TfrmUser.actRefreshUserExecute(Sender: TObject);
var data: TDataSet;
    i: Integer;
begin
  inherited;
  {if not assigned(User) then
    User := TUser.Create;
  data := User.GetDataUser(MasterNewUnit.ID);
  with strgGrid do
  begin
    Clear;
    ColCount := 6;
    RowCount := data.RecordCount+1;

    Cells[0, 0] := 'USER GROUP';
    Cells[1, 0] := 'LOGIN';
    Cells[2, 0] := 'FULL NAME';
    Cells[3, 0] := 'STATUS';
    Cells[4, 0] := 'DESCRIPTION';   
    Cells[5, 0] := 'MAX UBAH QTY PO';

    i:=1;
    if RowCount>1 then
    with data do
    while not Eof do
    begin
      Cells[0, i] := FieldByName('GRO_NAME').AsString;
      Cells[1, i] := FieldByName('USR_USERNAME').AsString;
      Cells[2, i] := FieldByName('USR_FULLNAME').AsString;
      if FieldByName('USR_STATUS').AsInteger=1 then
        Cells[3, i] := 'ACTIVE'
      else
        Cells[3, i] := 'NOT ACTIVE';
      Cells[4, i] := FieldByName('USR_DESCRIPTION').AsString;  
      Cells[5, i] := IntToStr(FieldByName('MAXUBAHPO').AsInteger);
      Cells[6, i] := IntToStr(FieldByName('USR_ID').AsInteger);
      Cells[7, i] := IntToStr(FieldByName('USR_STATUS').AsInteger);
      i:=i+1;
      Next;
    end
    else
    begin
      RowCount:=2;
      ClearRows(1,1);
      Cells[6, 1] := '0';
      Cells[7, 1] := '0';
    end;
    FixedRows := 1;
    AutoSize := true;
  end;  }
end;

function TfrmUser.RemoveFromDB(aKodeUser:Integer;aUnitID:Integer): Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'DELETE FROM AUT$USER WHERE '
            + '(USR_ID='+IntToStr(aKodeUser)
            + ' AND USR_UNT_ID='+IntToStr(aUnitID)+')';
//  if cExecSQL(sSQL, False, User.GetHeaderFlag ) then
//    Result := SimpanBlob(sSQL, 1);
end;

end.
