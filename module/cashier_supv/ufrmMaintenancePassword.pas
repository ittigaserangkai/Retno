unit ufrmMaintenancePassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, ActnList, uConn, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView, System.Actions,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC;

type
  TfrmMaintenancePassword = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    dataUser: TDataSet;
    procedure OverridePrivileges;
    procedure ParseHeaderGrid(jmlData: Integer);
    procedure ParseDataGrid();
    procedure PrepareEdit();
  public
    { Public declarations }
  end;

var
  frmMaintenancePassword: TfrmMaintenancePassword;

implementation

uses ufrmDialogMaintenancePassword, uTSCommonDlg;

{$R *.dfm}

procedure TfrmMaintenancePassword.actAddExecute(Sender: TObject);
begin
  inherited;
  if not assigned(frmDialogMaintenancePassword) then
    Application.CreateForm(TfrmDialogMaintenancePassword, frmDialogMaintenancePassword);

  frmDialogMaintenancePassword.Caption := 'Add Cashier';
  frmDialogMaintenancePassword.FormMode := fmAdd;
  SetFormPropertyAndShowDialog(frmDialogMaintenancePassword);

  if (frmDialogMaintenancePassword.IsProcessSuccessfull) then
  begin
    actRefreshExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atAdd);
  end;

  frmDialogMaintenancePassword.Free;
end;

procedure TfrmMaintenancePassword.PrepareEdit();
begin
  {frmDialogMaintenancePassword.edtUserName.Text := strgGrid.Cells[1,strgGrid.Row];
  frmDialogMaintenancePassword.edtFullname.Text := strgGrid.Cells[2,strgGrid.Row];

  If strgGrid.Cells[7,strgGrid.Row] = '11' then
    frmDialogMaintenancePassword.cbbLevel.ItemIndex := 1
  else
    frmDialogMaintenancePassword.cbbLevel.ItemIndex := 0;

  if strgGrid.Cells[4,strgGrid.Row] = 'ACTIVE' then
     frmDialogMaintenancePassword.chkStatus.Checked := True
  else
     frmDialogMaintenancePassword.chkStatus.Checked := False;

  frmDialogMaintenancePassword.edtPasswd.Text := strgGrid.Cells[5,strgGrid.Row];
  frmDialogMaintenancePassword.User_ID := StrToInt(strgGrid.Cells[6,strgGrid.Row]);
  }
end;

procedure TfrmMaintenancePassword.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmMaintenancePassword.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'CASHIER AND PASSWORD MAINTENANCE';
  ParseDataGrid;
end;

procedure TfrmMaintenancePassword.FormDestroy(Sender: TObject);
begin
  inherited;
  frmMaintenancePassword := nil;
end;

procedure TfrmMaintenancePassword.ParseDataGrid;
var intI: Integer;
begin
  {if not Assigned(MaintenancePasswd) then MaintenancePasswd := TMaintenancePasswd.Create;

  dataUser := MaintenancePasswd.GetListDataMaintenancePasswd(masternewunit.id);

  ParseHeaderGrid(dataUser.RecordCount);

  if dataUser.RecordCount > 0 then
  begin
    //initiate
    intI := 1;
    dataUser.First;
    while not(dataUser.Eof) do
    begin
      with strgGrid do
      begin
        Cells[0,intI] := IntToStr(intI) + '.';
        Cells[1,intI] := dataUser.FieldByName('USR_USERNAME').AsString;
        Cells[2,intI] := dataUser.FieldByName('USR_FULLNAME').AsString;
        Cells[3,intI] := dataUser.FieldByName('GRO_NAME').AsString;

        if dataUser.FieldByName('USR_STATUS').AsInteger = 1 then
          Cells[4,intI] := 'ACTIVE'
        else Cells[4,intI] := 'NOT ACTIVE';

        Cells[5,intI] := dataUser.FieldByName('USR_PASSWD').AsString;
        Cells[6,intI] := dataUser.FieldByName('USR_ID').AsString;
        Cells[7,intI] := dataUser.FieldByName('UG_GRO_ID').AsString;

        AutoSize := true;
      end; //end with strggrid

      dataUser.Next;
      Inc(intI);
    end;// end while not eof
  end; //end if recordcount

  strgGrid.AutoSize := true;
  strgGrid.FixedRows := 1;
  }
end;

procedure TfrmMaintenancePassword.ParseHeaderGrid(jmlData: Integer);
begin
 { with strgGrid do
  begin
    Clear;
    RowCount := jmlData + 1;
    ColCount := 5;
    Cells[0,0] := 'NO.';
    Cells[1,0] := 'CASHIER ID';
    Cells[2,0] := 'FULLNAME';
    Cells[3,0] := 'CASHIER LEVEL';
    Cells[4,0] := 'STATUS';

    if jmlData < 1 then
    begin
      RowCount := 2;
      Cells[0,1] := ' ';
      Cells[1,1] := ' ';
      Cells[2,1] := ' ';
      Cells[3,1] := ' ';
      Cells[4,1] := ' ';
      Cells[5,1] := '0';
    end;

    FixedRows := 1;
    AutoSize := true;
  end;
  }
end;

procedure TfrmMaintenancePassword.actEditExecute(Sender: TObject);
begin
  inherited;
  {if strgGrid.Cells[5,strgGrid.Row] = '0' then Exit;

  if not assigned(frmDialogMaintenancePassword) then
      Application.CreateForm(TfrmDialogMaintenancePassword, frmDialogMaintenancePassword);

  frmDialogMaintenancePassword.Caption := 'Edit Cashier';
  frmDialogMaintenancePassword.FormMode := fmEdit;
  PrepareEdit();
  SetFormPropertyAndShowDialog(frmDialogMaintenancePassword);

  if (frmDialogMaintenancePassword.IsProcessSuccessfull) then
  begin
    actRefreshExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atEdit);
  end;

 frmDialogMaintenancePassword.Free;
 }
end;

procedure TfrmMaintenancePassword.actRefreshExecute(Sender: TObject);
begin
  inherited;
  ParseDataGrid();
end;

procedure TfrmMaintenancePassword.FormShow(Sender: TObject);
begin
  inherited;
  OverridePrivileges;
end;

procedure TfrmMaintenancePassword.OverridePrivileges;
begin
  //method ini utk override property bottom panel
  //karena versi ori aplikasi dikontrol dari user module di HO
  actAdd.Enabled := True;
  actEdit.Enabled := True;
  actPrint.Enabled := True;
  actRefresh.Enabled := True;
end;

end.




