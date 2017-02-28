unit ufrmDialogIGRADesc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, SUIForm,
  StdCtrls, uRetnoUnit;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogIGRADesc = class(TfrmMasterDialog)
    edtCode: TEdit;
    lbl1: TLabel;
    Label1: TLabel;
    edtDescrp: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FIsProcessSuccessfull: Boolean;
    FIGRADescId: Integer;
    FFormMode: TFormMode;
    { Private declarations }
    function SaveIGRADesc: Boolean;
    function UpdateIGRADesc: Boolean;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: Boolean);
    procedure SetIGRADescId(const Value: Integer);
    procedure showDataEdit(code,descrp: string);
    procedure prepareAddData;
  public
    code,descrp: string;
    { Public declarations }
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property IGRADescId: Integer read FIGRADescId write SetIGRADescId;
    property IsProcessSuccessfull: Boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogIGRADesc: TfrmDialogIGRADesc;

implementation

uses uIGRADesc, uTSCommonDlg, uConn;

{$R *.dfm}

procedure TfrmDialogIGRADesc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogIGRADesc.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogIGRADesc := nil;
end;

procedure TfrmDialogIGRADesc.footerDialogMasterbtnSaveClick(Sender: TObject);
begin
  if (FormMode = fmAdd) then
  begin
    FIsProcessSuccessfull := SaveIGRADesc;
    if FIsProcessSuccessfull then
      Close;
  end
  else
  begin
    FIsProcessSuccessfull := UpdateIGRADesc;
    if FIsProcessSuccessfull then
      Close;
  end;
end;

procedure TfrmDialogIGRADesc.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogIGRADesc.SetIsProcessSuccessfull(const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogIGRADesc.SetIGRADescId(const Value: integer);
begin
  FIGRADescId := Value;
end;

procedure TfrmDialogIGRADesc.FormShow(Sender: TObject);
begin
  inherited;
  if (FFormMode = fmEdit) then
    showDataEdit(code,descrp)
  else
    prepareAddData();
end;

procedure TfrmDialogIGRADesc.showDataEdit(code,descrp: string);
begin
  edtCode.Text := code;
  edtDescrp.Text := descrp;
end;

procedure TfrmDialogIGRADesc.prepareAddData;
begin
  edtCode.Clear;
  edtDescrp.Clear;
end;

function TfrmDialogIGRADesc.SaveIGRADesc: Boolean;
var fid : Integer;
begin
  Result := False;

  if edtCode.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('CODE');
    edtCode.SetFocus;
    Exit;
  end;
  if edtDescrp.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('DESCRIPTIONS');
    edtDescrp.SetFocus;
    Exit;
  end;

  if not assigned(IGRADesc) then
    IGRADesc := TIGRADesc.Create;

  if IGRADesc.IsCodeExist(edtCode.Text,DialogUnit) then
  begin
    CommonDlg.ShowErrorExist('CODE',edtCode.Text);
    edtCode.SetFocus;
    FreeAndNil(IGRADesc);
    Exit;
  end;
  fid := cGetNextID('GEN_IGRA_KETERANGAN_ID');
  Result:= IGRADesc.InsertIGRADesc(fid,DialogUnit,edtCode.Text,edtDescrp.Text,FLoginId);
end;

function TfrmDialogIGRADesc.UpdateIGRADesc: Boolean;
begin
  Result := false;

  if edtCode.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('CODE');
    edtCode.SetFocus;
    Exit;
  end;
  if edtDescrp.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('DESCRIPTIONS');
    edtDescrp.SetFocus;
    Exit;
  end;

  if not assigned(IGRADesc) then
    IGRADesc := TIGRADesc.Create;

  if IGRADesc.IsCodeExist(edtCode.Text,DialogUnit,IGRADescId) then
  begin
    CommonDlg.ShowErrorExist('CODE',edtCode.Text);
    edtCode.SetFocus;
    FreeAndNil(IGRADesc);
    Exit;
  end;

  Result:=IGRADesc.UpdateIGRADesc(DialogUnit,edtCode.Text,edtDescrp.Text,FLoginId,IGRADescId);
end;

end.
