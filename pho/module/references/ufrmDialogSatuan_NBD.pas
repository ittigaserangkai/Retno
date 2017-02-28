unit ufrmDialogSatuan_NBD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, 
  StdCtrls, uNewRefSatuan_NBD;

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
    FNewSatuan_NBD: TNewSatuan_NBD;
    { Private declarations }
    //function SaveSatuan_NBD: Boolean;
    //function UpdateSatuan_NBD: Boolean;
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

uses uSatuan_NBD, uTSCommonDlg, uConn,  uConstanta;

{$R *.dfm}

{function TfrmDialogSatuan_NBD.SaveSatuan_NBD: Boolean;
var
  arrParam: TArr;
begin
  Result := false;

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

  if not assigned(Satuan_NBD) then
    Satuan_NBD := TSatuan_NBD.Create;

  // set param
  SetLength(arrParam,4);
  arrParam[0].tipe := ptString;
  arrParam[0].data := edtCode.Text;
  arrParam[1].tipe := ptString;
  arrParam[1].data := edtName.Text;
  arrParam[2].tipe := ptString;
  arrParam[2].data := DialogUnit;
  arrParam[3].tipe := ptString;
  arrParam[3].data := FLoginId;

  // execute script
  Result := Satuan_NBD.InsertDataSatuan_NBD(arrParam);
end;
}
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

{function TfrmDialogSatuan_NBD.UpdateSatuan_NBD: Boolean;
var
  arrParam: TArr;
begin
  Result := false;

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

  if not assigned(Satuan_NBD) then
    Satuan_NBD := TSatuan_NBD.Create;

  // set param
  SetLength(arrParam,5);
  arrParam[0].tipe := ptString;
  arrParam[0].data := edtCode.Text;
  arrParam[1].tipe := ptString;
  arrParam[1].data := edtName.Text;
  arrParam[2].tipe := ptString;
  arrParam[2].data := DialogUnit;
  arrParam[3].tipe := ptString;
  arrParam[3].data := FLoginId;
  arrParam[4].tipe := ptString;
  arrParam[4].data := Satuan_NBDId;

  // execute script
  Result := Satuan_NBD.UpdateDataSatuan_NBD(arrParam);
end;
}

procedure TfrmDialogSatuan_NBD.showDataEdit(strUomCode: string);
//var //dataSatuan_NBD: TDataSet;
    //arrParam: TArr;
begin
  // set params
//  SetLength(arrParam, 1);
//  arrParam[0].tipe := ptString;
//  arrParam[0].data := strUomCode;
//  dataSatuan_NBD := Satuan_NBD.SearchDataSatuan_NBD(arrParam);
//
//  edtCode.Text := dataSatuan_NBD.FieldByName('SATNBD_CODE').AsString;
//  edtName.Text := dataSatuan_NBD.FieldByName('SATNBD_NAME').AsString;

  FNewSatuan_NBD.LoadByCode(strUomCode, DialogUnit);

  edtCode.Text := FNewSatuan_NBD.CODE;
  edtName.Text := FNewSatuan_NBD.NAME;

end;

procedure TfrmDialogSatuan_NBD.prepareAddData;
begin
  edtCode.Clear;
  edtName.Clear;
end;

procedure TfrmDialogSatuan_NBD.FormDestroy(Sender: TObject);
begin
  inherited;
  FNewSatuan_NBD.Free;
  frmDialogSatuan_NBD := nil;
end;

procedure TfrmDialogSatuan_NBD.FormShow(Sender: TObject);
begin
  inherited;
  FNewSatuan_NBD := TNewSatuan_NBD.CreateWithUer(self, FLoginId, DialogUnit);
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

  FNewSatuan_NBD.UpdateData(edtCode.Text, now, now, '', edtName.Text,
                 FLoginUnitId, FLoginUnitId, FLoginId, FLoginId, DialogUnit);
  if (FormMode = fmAdd) then
  begin
//    FIsProcessSuccessfull := SaveSatuan_NBD;
    FIsProcessSuccessfull := FNewSatuan_NBD.SaveToDB('', DialogUnit);
    if FIsProcessSuccessfull then
      Close
    else
        CommonDlg.ShowError(ER_INSERT_FAILED);

  end
  else
  begin
//    FIsProcessSuccessfull := UpdateSatuan_NBD;
    FIsProcessSuccessfull := FNewSatuan_NBD.SaveToDB(Satuan_NBDId, DialogUnit);
    if FIsProcessSuccessfull then
      Close
    else
        CommonDlg.ShowError(ER_UPDATE_FAILED);
  end;
end;

end.