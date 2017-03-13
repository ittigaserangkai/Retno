unit ufrmDialogDaftarKompetitor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ufraFooterDialog2Button, ExtCtrls, ufrmMasterDialog,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxRadioGroup, cxGroupBox, System.Actions, Vcl.ActnList,
  ufraFooterDialog3Button;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogDaftarKompetitor = class(TfrmMasterDialog)
    lbl1: TLabel;
    edtNama: TEdit;
    Label1: TLabel;
    sgrpbxStatus: TcxGroupBox;
    rbAktif: TcxRadioButton;
    rbNoAktif: TcxRadioButton;
    lbl2: TLabel;
    edtCompCode: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure footerDialog1btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FIsProcessSuccessfull: boolean;
    FComptId: Integer;
    FFormMode: TFormMode;
    procedure SetComptId(const Value: Integer);
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure ClearFormDialog;
    procedure ShowEditCompetitor(ACompetitorId: integer);
  public
    { Public declarations }
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property ComptId: Integer read FComptId write SetComptId;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogDaftarKompetitor: TfrmDialogDaftarKompetitor;

implementation

uses uTSCommonDlg, ufrmDaftarCompetitor, SysConst, DB,
  uConn,  uRetnoUnit, uConstanta;

{$R *.dfm}

procedure TfrmDialogDaftarKompetitor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmDialogDaftarKompetitor.FormDestroy(Sender: TObject);
begin
  frmDialogDaftarKompetitor := nil;
end;

procedure TfrmDialogDaftarKompetitor.footerDialog1btnSaveClick(
  Sender: TObject);
var
  Aktif: Byte;
//  Kompetitor : TKompetitor;
begin
//  Kompetitor := TKompetitor.Create(nil);
  if edtCompCode.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('CODE');
    edtNama.SetFocus;
    Exit;
  end;
  if edtNama.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('NAME');
    edtNama.SetFocus;
    Exit;
  end;

  if rbAktif.Checked then
    Aktif:=1
  else
    Aktif:=0;
  {
  if not assigned(DaftarCompetitor) then DaftarCompetitor := TDaftarCompetitor.Create;
  if Kompetitor.idKodeExits(edtCompCode.Text, DialogUnit, ComptId)
  then
  begin
    CommonDlg.ShowError(ER_EXIST);
    Exit
  end
  else
  begin
    Kompetitor.updatedata( ComptId,
                   Aktif,
                   edtCompCode.Text,
                   edtNama.Text,
                   DialogUnit);
  if Kompetitor.ExecuteGenerateSQL then
      cCommitTrans
  else
      cRollbackTrans;
  frmDaftarCompetitor.actRefreshDaftarKompetitorExecute(Self);
  Close;
  end
   }
end;

procedure TfrmDialogDaftarKompetitor.SetComptId(const Value: Integer);
begin
  FComptId := Value;
end;

procedure TfrmDialogDaftarKompetitor.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogDaftarKompetitor.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogDaftarKompetitor.FormShow(Sender: TObject);
begin
  if (FFormMode = fmAdd) then
    ClearFormDialog()
  else
    ShowEditCompetitor(FComptId);
end;

procedure TfrmDialogDaftarKompetitor.ClearFormDialog;
begin
  edtNama.Text := '';
  edtCompCode.Text := '';
  rbAktif.Checked := true;
  edtCompCode.SetFocus;
end;

procedure TfrmDialogDaftarKompetitor.ShowEditCompetitor(ACompetitorId: integer);
var
  rcData: TDataSet;
begin
  {if not Assigned(DaftarCompetitor) then
    DaftarCompetitor := TDaftarCompetitor.Create;

  rcData := DaftarCompetitor.SearchDataCompetitor(ACompetitorId);
  with rcData do
  begin
    edtCompCode.Text := fieldbyname('KOMPT_CODE').AsString;
    edtNama.Text := fieldbyname('KOMPT_NAME').AsString;
    if fieldbyname('KOMPT_IS_ACTIVE').AsInteger=1 then
      rbAktif.Checked := true
    else
      rbNoAktif.Checked := true;
  end; // end with
  edtCompCode.SetFocus;
  }
end;

end.
