unit ufrmDialogActionList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, SUIForm,
  uActionListCust, StdCtrls;

type
  TfrmDialogActionList = class(TfrmMasterDialog)
    edtID: TEdit;
    edtNm: TEdit;
    edtDesc: TEdit;
    Suplier: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
  private
    { Private declarations }
    FActID    : Integer;
    FActLst   : TActionListCust;
    
    procedure ClearData;
    procedure SetData;
  public
    procedure ShowWithID(aUnitId: integer; aLoginID: integer; aActID: integer = 0);
    { Public declarations }
  end;

var
  frmDialogActionList: TfrmDialogActionList;

implementation

{$R *.dfm}
uses
  uRMSUnit, uGTSUICommonDlg;

procedure TfrmDialogActionList.ClearData;
begin
  edtID.Clear;
  edtNm.Clear;
  edtDesc.Clear;
end;

procedure TfrmDialogActionList.SetData;
begin
  if FActID <> 0 then
  begin
    if FActLst.LoadByID(FActID, DialogUnit) then
    begin
       edtID.Text   := IntToStr(FActLst.ActID);
       edtNm.Text   := FActLst.ActNm;
       edtDesc.Text := FActLst.ActDesc;
    end;  
  end;  

end;

procedure TfrmDialogActionList.ShowWithID(aUnitId: integer; aLoginID: integer;
    aActID: integer = 0);
begin
  DialogUnit   := aUnitId;
  FLoginID  := aLoginID;
  FActID    := aActID;

  SetData;
  Self.ShowModal;

end;

procedure TfrmDialogActionList.FormCreate(Sender: TObject);
begin
  inherited;
  FActLst := TActionListCust.Create(nil);
end;

procedure TfrmDialogActionList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action  := caFree;
end;

procedure TfrmDialogActionList.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FActLst);
  frmDialogActionList := nil;
end;

procedure TfrmDialogActionList.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;
  FActLst.UpdateData(edtDesc.Text, FActID, edtNm.Text, DialogUnit);

  if FActLst.SaveToDB then
  begin
    cCommitTrans;
    CommonDlg.ShowMessage('Sukses menyimpan data');

    if FActID <> 0 then
      Self.Close
    else
      ClearData;

  end
  else
  begin
    cRollbackTrans;
    CommonDlg.ShowError('Gagal menyimpan data!!');
  end;
end;

end.
