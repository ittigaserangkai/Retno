unit ufrmDialogSatuan_NBD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, 
  StdCtrls, ufraFooterDialog3Button;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogSatuan_NBD = class(TfrmMasterDialog)
    lbl1: TLabel;
    edtCode: TEdit;
    Lbl2: TLabel;
    edtName: TEdit;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
  private
    FIsProcessSuccessfull: boolean;
    FSatuan_NBDId: string;
    FFormMode: TFormMode;
//    FNewSatuan_NBD: TNewSatuan_NBD;
    { Private declarations }
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: Boolean);
    procedure SetSatuan_NBDId(const Value: string);
    procedure showDataEdit(strUomCode: string);
    procedure prepareAddData;
  public
    { Public declarations }
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property Satuan_NBDId: string read FSatuan_NBDId write SetSatuan_NBDId;
    property IsProcessSuccessfull: Boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogSatuan_NBD: TfrmDialogSatuan_NBD;

implementation

uses uTSCommonDlg, uConn,  uConstanta;

{$R *.dfm}

procedure TfrmDialogSatuan_NBD.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogSatuan_NBD.SetIsProcessSuccessfull(const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogSatuan_NBD.SetSatuan_NBDId(const Value: string);
begin
  FSatuan_NBDId := Value;
end;

procedure TfrmDialogSatuan_NBD.showDataEdit(strUomCode: string);
begin

//  FNewSatuan_NBD.LoadByCode(strUomCode, DialogUnit);
//
//  edtCode.Text := FNewSatuan_NBD.CODE;
//  edtName.Text := FNewSatuan_NBD.NAME;

end;

procedure TfrmDialogSatuan_NBD.prepareAddData;
begin
  edtCode.Clear;
  edtName.Clear;
end;

procedure TfrmDialogSatuan_NBD.FormDestroy(Sender: TObject);
begin
  inherited;
//  FNewSatuan_NBD.Free;
  frmDialogSatuan_NBD := nil;
end;

procedure TfrmDialogSatuan_NBD.FormShow(Sender: TObject);
begin
  inherited;
//  FNewSatuan_NBD := TNewSatuan_NBD.CreateWithUer(self, FLoginId, DialogUnit);
  if (FFormMode = fmEdit) then
    showDataEdit(Satuan_NBDId)
  else
    prepareAddData();
end;

procedure TfrmDialogSatuan_NBD.footerDialogMasterbtnSaveClick(Sender: TObject);
begin
  inherited;

  if edtCode.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('CODE');
    edtCode.SetFocus;
    Exit;
  end;
  if edtName.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('NAME');
    edtName.SetFocus;
    Exit;
  end;

//  FNewSatuan_NBD.UpdateData(edtCode.Text, now, now, '', edtName.Text,
//                 FLoginUnitId, FLoginUnitId, FLoginId, FLoginId, DialogUnit);
  if (FormMode = fmAdd) then
  begin
//    FIsProcessSuccessfull := SaveSatuan_NBD;
//    FIsProcessSuccessfull := FNewSatuan_NBD.SaveToDB('', DialogUnit);
    if FIsProcessSuccessfull then
      Close
    else
        CommonDlg.ShowError(ER_INSERT_FAILED);

  end
  else
  begin
//    FIsProcessSuccessfull := UpdateSatuan_NBD;
//    FIsProcessSuccessfull := FNewSatuan_NBD.SaveToDB(Satuan_NBDId, DialogUnit);
    if FIsProcessSuccessfull then
      Close
    else
        CommonDlg.ShowError(ER_UPDATE_FAILED);
  end;
end;

end.