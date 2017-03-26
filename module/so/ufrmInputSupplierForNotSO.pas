unit ufrmInputSupplierForNotSO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, ActnList, System.Actions,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Menus, ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC;

type
  TfrmInputSupplierForNotSO = class(TfrmMasterBrowse)
    pnlKeterangan: TPanel;
    procedure actAddExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInputSupplierForNotSO: TfrmInputSupplierForNotSO;

implementation

uses ufrmDialogInputSupplierForNotSO, uTSCommonDlg;

{$R *.dfm}

procedure TfrmInputSupplierForNotSO.actAddExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogInputSupplierForNotSO) then
    Application.CreateForm(TfrmDialogInputSupplierForNotSO, frmDialogInputSupplierForNotSO);
  frmDialogInputSupplierForNotSO.Caption := 'Add Supplier For Not SO';
  frmDialogInputSupplierForNotSO.FormMode:=fmAdd;

  SetFormPropertyAndShowDialog(frmDialogInputSupplierForNotSO);
  if (frmDialogInputSupplierForNotSO.IsProcessSuccessfull) then
  begin
    actRefreshExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atAdd);
  end;

  frmDialogInputSupplierForNotSO.Free;
end;

procedure TfrmInputSupplierForNotSO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmInputSupplierForNotSO.FormDestroy(Sender: TObject);
begin
  inherited;
  frmInputSupplierForNotSO := nil;
end;

procedure TfrmInputSupplierForNotSO.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'INPUT SUPPLIER NOT FOR SO';
  actRefreshExecute(Self);
end;

procedure TfrmInputSupplierForNotSO.actEditExecute(Sender: TObject);
begin
  inherited;
//  if strgGrid.Cells[2,strgGrid.Row]='0' then Exit;
  if not Assigned(frmDialogInputSupplierForNotSO) then
    Application.CreateForm(TfrmDialogInputSupplierForNotSO, frmDialogInputSupplierForNotSO);
  frmDialogInputSupplierForNotSO.Caption := 'Edit Supplier For Not SO';
  frmDialogInputSupplierForNotSO.FormMode:=fmEdit;
//  frmDialogInputSupplierForNotSO.SuplierBlacklistId:=StrToInt(strgGrid.Cells[2,strgGrid.row]);

  SetFormPropertyAndShowDialog(frmDialogInputSupplierForNotSO);
  if (frmDialogInputSupplierForNotSO.IsProcessSuccessfull) then
  begin
    actRefreshExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atEdit);
  end;

  frmDialogInputSupplierForNotSO.Free;
end;

procedure TfrmInputSupplierForNotSO.actRefreshExecute(Sender: TObject);
var data: TDataSet;
    i: Integer;
begin
  {if not assigned(SuplierBlackList) then
    SuplierBlackList := TSuplierBlackList.Create;

  //Set Data
  data:= SuplierBlackList.Data;
  with strgGrid do
  begin
    Clear;
    ColCount := 2;
    RowCount := data.RecordCount+1;

    Cells[0, 0] := 'SUPPLIER CODE';
    Cells[1, 0] := 'SUPPLIER NAME';

    if RowCount>1 then
    with data do
    begin
      i:=1;
      while not Eof do
      begin
        Cells[0, i] := data.fieldbyname('SOSB_SUP_CODE').AsString;
        Cells[1, i] := data.fieldbyname('SUP_NAME').AsString;
        Cells[2, i] := IntToStr(data.fieldbyname('SOSB_ID').AsInteger);
        i:=i+1;
        Next;
      end;
    end
    else
    begin
      RowCount:=2;
      Cells[0, 1] := ' ';
      Cells[1, 1] := ' ';
      Cells[2, 1] := '0';
      Cells[3, 1] := '0';
    end;
    AutoSize:=True;
    FixedRows:=1;
  end;
  }
end;

procedure TfrmInputSupplierForNotSO.FormActivate(Sender: TObject);
begin
  inherited;
  frmInputSupplierForNotSO.Caption := 'INPUT SUPPLIER NOT FOR SO';
end;

end.




