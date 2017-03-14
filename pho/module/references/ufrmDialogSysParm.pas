unit ufrmDialogSysParm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, StdCtrls,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button;

type
  TfrmDialogSysParm = class(TfrmMasterDialog)
    Label9: TLabel;
    edtId: TEdit;
    edtNm: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    edtValue: TEdit;
    Label2: TLabel;
    edtGroup: TEdit;
    edtDesc: TEdit;
    Label3: TLabel;
    procedure actDeleteExecute(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    Fid       : Integer;
//    FSysParm  : TSysParm;

    procedure SetData;
    procedure ClearData;
  public
    { Public declarations }
    procedure ShowWithId(aId: integer = 0);
  end;

var
  frmDialogSysParm: TfrmDialogSysParm;

implementation

{$R *.dfm}
uses uTSCommonDlg, uRetnoUnit;

procedure TfrmDialogSysParm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  /// tanya ke user dl mas, apakah yakin akan hapus DB
  {
  if MessageDlg('Apakah yakin akan menghapus System Parameter ' +
          strgGrid.Cells[_KolNm , iy] + ' ?',
          mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    if FSysParm.LoadByID(strgGrid.Ints[_kolId, iy]) then
    begin
      try
        if FSysParm.RemoveFromDB then
        begin
          cCommitTrans;
          CommonDlg.ShowMessage('Sukses Hapus System Parameter');
          GetRec;
        end
        else
        begin
          cRollbackTrans;
          CommonDlg.ShowError('Gagal Hapus System Parameter');
        end;
      finally
        cRollbackTrans;
      end;
    end
    else
    begin
       CommonDlg.ShowConfirmGlobal ('Data yang dihapus tidak ada!');
    end;
  end;
  }
end;

procedure TfrmDialogSysParm.SetData;
begin
  if FId <> 0 then
  begin
  {  if FSysParm.LoadById(FId) then
    begin
      edtId.Text    := IntToStr(FSysParm.ParId);
      edtNm.Text    := FSysParm.ParNm;
      edtValue.Text := FSysParm.ParValue;
      edtGroup.Text := FSysParm.ParGroup;
      edtDesc.Text  := FSysParm.ParDesc;
    end;
    }
  end
  else
  begin
      ClearData;
  end;
end;

procedure TfrmDialogSysParm.ClearData;
begin
  edtId.Clear;
  edtNm.Clear;
  edtValue.Clear;
  edtGroup.Clear;
  edtDesc.Clear;
end;

procedure TfrmDialogSysParm.ShowWithId(aId: integer = 0);
begin
  FId := aId;
//  FSysParm := TSysParm.Create(nil);
  SetData;
  Self.ShowModal;
end;

procedure TfrmDialogSysParm.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;
  {
  try
    with FSysParm do
    begin
      UpdateData(edtDesc.Text, edtGroup.Text, Fid,
                  edtNm.Text, edtValue.Text);

      if not SaveToDB then
      begin
        cRollbackTrans;
        CommonDlg.ShowError('Gagal Simpan Data System Parameter.');
      end
      else
      begin
        cCommitTrans;
        CommonDlg.ShowMessage('Data System Parameter telah disimpan.');
        Close;
      end;

    end;

  finally
    cRollbackTrans;
  end;
  }
end;

procedure TfrmDialogSysParm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action  := caFree;
  inherited;
end;

procedure TfrmDialogSysParm.FormDestroy(Sender: TObject);
begin
//  FreeAndNil(FSysParm);
  frmDialogSysParm  := nil;
  inherited;

end;

end.
