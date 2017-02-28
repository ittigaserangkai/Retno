unit ufrmTipePerusahaan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter5Button, ActnList, uConn,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, System.Actions;

type
  TfrmTipePerusahaan = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    actlstTipeSupplier: TActionList;
    actAddTipePerusahaan: TAction;
    actEditTipePerusahaan: TAction;
    actDeleteTipePerusahaan: TAction;
    actRefreshTipePerusahaan: TAction;
    cxGridViewTipePerusahaan: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid: TcxGrid;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actAddTipePerusahaanExecute(Sender: TObject);
    procedure actEditTipePerusahaanExecute(Sender: TObject);
    procedure actDeleteTipePerusahaanExecute(Sender: TObject);
    procedure actRefreshTipePerusahaanExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    function GetData(): TDataSet;

  public
    { Public declarations }
  end;

var
  frmTipePerusahaan: TfrmTipePerusahaan;

implementation

uses uTSCommonDlg, ufrmDialogTipePerusahaan;

{$R *.dfm}

procedure TfrmTipePerusahaan.FormDestroy(Sender: TObject);
begin
  inherited;
  frmTipePerusahaan := nil;
end;

procedure TfrmTipePerusahaan.FormShow(Sender: TObject);
begin
  inherited;
  // no unit id must be specified, so hide the combo
//  frmMain.lbl1.Visible := False;
//  frmMain.cbbUnit.Visible := False;
  
  lblHeader.Caption := 'COMPANY TYPE';
  actRefreshTipePerusahaanExecute(Self);
end;

procedure TfrmTipePerusahaan.actAddTipePerusahaanExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogTipePerusahaan) then
    Application.CreateForm(TfrmDialogTipePerusahaan, frmDialogTipePerusahaan);

  frmDialogTipePerusahaan.Caption := 'Add Company Type';
  frmDialogTipePerusahaan.FormMode := fmAdd;

  SetFormPropertyAndShowDialog(frmDialogTipePerusahaan);
  if (frmDialogTipePerusahaan.IsProcessSuccessfull) then
  begin
    actRefreshTipePerusahaanExecute(Self);
    CommonDlg.ShowConfirm(atAdd);
  end;

  frmDialogTipePerusahaan.Free;
end;

procedure TfrmTipePerusahaan.actEditTipePerusahaanExecute(Sender: TObject);
begin
  inherited;
  // check is data available
//  if strgGrid.Cells[0,strgGrid.row]=' ' then Exit;

  if not Assigned(frmDialogTipePerusahaan) then
    Application.CreateForm(TfrmDialogTipePerusahaan, frmDialogTipePerusahaan);

  frmDialogTipePerusahaan.Caption := 'Edit Company Type';
  frmDialogTipePerusahaan.FormMode := fmEdit;
//  frmDialogTipePerusahaan.TipePerusahaanId := StrToInt(strgGrid.Cells[2,strgGrid.row]);

  SetFormPropertyAndShowDialog(frmDialogTipePerusahaan);
  if (frmDialogTipePerusahaan.IsProcessSuccessfull) then
  begin
    actRefreshTipePerusahaanExecute(Self);
    CommonDlg.ShowConfirm(atEdit);
  end;

  frmDialogTipePerusahaan.Free;
end;

procedure TfrmTipePerusahaan.actDeleteTipePerusahaanExecute(
  Sender: TObject);
begin
  inherited;
//  if strgGrid.Cells[0,strgGrid.row]=' ' then Exit;
  {
  if (CommonDlg.Confirm('Are you sure you wish to delete Company Type (Name: '+strgGrid.Cells[1,strgGrid.row]+')?') = mrYes) then
  begin
    // todo: put your code to delete data here..
    // code goes here..
    if not assigned(TipePerusahaan) then
      TipePerusahaan := TTipePerusahaan.Create;

    if TipePerusahaan.DeleteDataTipePerusahaan(StrToInt(strgGrid.Cells[2,strgGrid.row])) then
    begin
      actRefreshTipePerusahaanExecute(Self);
      CommonDlg.ShowConfirm(atDelete);
    end;
  end;
  }
end;

function TfrmTipePerusahaan.GetData(): TDataSet;
var
  arrParam: TArr;
begin
  arrParam := nil;
//  Result := TipePerusahaan.GetDataTipePerusahaan(arrParam);
end;

procedure TfrmTipePerusahaan.actRefreshTipePerusahaanExecute(Sender: TObject);
var dataTipePerusahaan: TDataSet;
    i, countData: Integer;
begin
  dataTipePerusahaan := GetData();
  countData := dataTipePerusahaan.RecordCount;
  {
  with strgGrid do
  begin
    Clear;
    RowCount := countData+1;
    ColCount := 2;

    Cells[0, 0] := 'CODE';
    Cells[1, 0] := 'NAME';

    if (RowCount > 1) then
    begin
      i := 1;
      while not dataTipePerusahaan.Eof do
      begin
        Cells[0, i] := dataTipePerusahaan.FieldByName('TPPERSH_CODE').AsString;
        Cells[1, i] := dataTipePerusahaan.FieldByName('TPPERSH_NAME').AsString;
        Cells[2, i] := dataTipePerusahaan.FieldByName('TPPERSH_ID').AsString;

        Inc(i);
        dataTipePerusahaan.Next;
      end;
    end
    else
    begin
      RowCount := 2;
      Cells[0, 1] := ' ';
      Cells[1, 1] := ' ';
    end;

    FixedRows := 1;
    AutoSize := true;
  end;
  }
end;

procedure TfrmTipePerusahaan.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //frmMain.lbl1.Visible := True;
  //frmMain.cbbUnit.Visible := True;
  //frmMain.DestroyMenu((sender as TForm));
end;

procedure TfrmTipePerusahaan.FormActivate(Sender: TObject);
begin
  inherited;
  // no unit id must be specified, so hide the combo
  //frmMain.lbl1.Visible := False;
  //frmMain.cbbUnit.Visible := False;
  //frmMain.cbbCompCode.Visible := False;
  //frmMain.lbl2.Visible := False;
  //frmMain.CreateMenu((sender as TForm));
end;

procedure TfrmTipePerusahaan.FormDeactivate(Sender: TObject);
begin
  inherited;
  // no unit id must be specified, so hide the combo
  //frmMain.lbl1.Visible := True;
  //frmMain.cbbUnit.Visible := True;
  //frmMain.cbbCompCode.Visible := True;
  //frmMain.lbl2.Visible := True;
end;

end.
