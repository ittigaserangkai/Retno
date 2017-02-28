unit ufrmSysParmCompTemp1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, Grids, BaseGrid, AdvGrid,
  AdvCGrid, ufraFooter5Button, ActnList, uRetnoUnit, ufrmDialogSysParmCompTemp,
  uSysParameterCompanyTemplate, uTSCommonDlg, uConstanta;

type
  TfrmSysParmCompTemp1 = class(TfrmMaster)
    frftr5btn1: TfraFooter5Button;
    advclmngrd1: TAdvColumnGrid;
    actlst1: TActionList;
    actadd: TAction;
    actedit: TAction;
    actdel: TAction;
    actrefresh: TAction;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actaddExecute(Sender: TObject);
    procedure actdelExecute(Sender: TObject);
    procedure acteditExecute(Sender: TObject);
    procedure actrefreshExecute(Sender: TObject);
    procedure advclmngrd1CanEditCell(Sender: TObject; ARow, ACol: Integer; var
        CanEdit: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FSysParmCompTemp : TSysParameterCompanyTemplate;
  public
    { Public declarations }
  end;

var
  frmSysParmCompTemp1: TfrmSysParmCompTemp1;

implementation

{$R *.dfm}

procedure TfrmSysParmCompTemp1.FormDestroy(Sender: TObject);
begin
  inherited;
  frmSysParmCompTemp1 := nil;
end;

procedure TfrmSysParmCompTemp1.FormCreate(Sender: TObject);
begin
  inherited;
  FSysParmCompTemp := TSysParameterCompanyTemplate.Create(Self);
end;

procedure TfrmSysParmCompTemp1.actaddExecute(Sender: TObject);
begin
  inherited;
  if (MasterNewUnit.ID = 0) then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    Exit;
  end else begin
    if not Assigned(frmDialogSysParmCompTemp) then
      Application.CreateForm(TfrmDialogSysParmCompTemp, frmDialogSysParmCompTemp);

      frmDialogSysParmCompTemp.frmSuiMasterDialog.Caption := 'Add Parameter Company Template';
      frmDialogSysParmCompTemp.FIDBaru := 0;

      SetFormPropertyAndShowDialog(frmDialogSysParmCompTemp);
      
      if (frmDialogSysParmCompTemp.isProcessSuccess) then
      begin
        actrefreshExecute(Self);
      end;
  end;

end;

procedure TfrmSysParmCompTemp1.actdelExecute(Sender: TObject);
var iID : Integer;
begin
  inherited;
  iID := advclmngrd1.Ints[1,advclmngrd1.row];
  FSysParmCompTemp.LoadByID(iID);

  if (CommonDlg.Confirm('Anda yakin akan menghapus data dengan dengan ID: '+ IntToStr(iID) +' ?') = mrYes) then
  begin
    try
      if FSysParmCompTemp.RemoveFromDB then
      begin
        cCommitTrans;
        CommonDlg.ShowMessage('Data berhasil dihapus');
        actrefreshExecute(Self);
        Exit
      end else
      begin
        cRollbackTrans;
        CommonDlg.ShowMessage('Data gagal dihapus');
      end;
    finally
      cRollbackTrans;
    end;
  end;
end;

procedure TfrmSysParmCompTemp1.acteditExecute(Sender: TObject);
begin
  inherited;
    if (MasterNewUnit.ID = 0) then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    Exit;
  end else begin
    if not Assigned(frmDialogSysParmCompTemp) then
      Application.CreateForm(TfrmDialogSysParmCompTemp, frmDialogSysParmCompTemp);

      frmDialogSysParmCompTemp.frmSuiMasterDialog.Caption := 'Add Parameter Company Template';
      frmDialogSysParmCompTemp.FIDBaru := advclmngrd1.Ints[1,advclmngrd1.Row];

      SetFormPropertyAndShowDialog(frmDialogSysParmCompTemp);
      if (frmDialogSysParmCompTemp.isProcessSuccess) then
      begin
        actrefreshExecute(Self);
      end;
  end;
end;

procedure TfrmSysParmCompTemp1.actrefreshExecute(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := 'SELECT PARCT_ID AS ID, PARCT_NAME AS NAMA,PARCT_DEFAULT AS DEFAULTVALUE,'
          + 'PARCT_GROUP AS GROUPPARAMETER, PARCT_DESCRIPTION AS DESCRIPTION '
          + 'FROM SYS$PARAMETER_COMP_TEMPLATE '
          + 'ORDER BY PARCT_ID ';

  cQueryToGrid(sSQL,advclmngrd1);
  advclmngrd1.AutoSizeColumns(True,1);
end;

procedure TfrmSysParmCompTemp1.advclmngrd1CanEditCell(Sender: TObject; ARow,
    ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  CanEdit := False;
end;

procedure TfrmSysParmCompTemp1.FormShow(Sender: TObject);
begin
  inherited;
  actrefreshExecute(Self);
end;

end.
