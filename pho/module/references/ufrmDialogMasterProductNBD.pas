unit ufrmDialogMasterProductNBD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, StdCtrls, ufraFooterDialog2Button, ExtCtrls,
  SUIForm, JvLabel, JvEdit,  cbxbase, dblup1a, uConn, uNewProduk_Jasa,
  JvValidateEdit, JvExStdCtrls;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogMasterProductNBD = class(TfrmMasterDialog)
    lbl1: TLabel;
    lbl2: TLabel;
    edtCode: TEdit;
    edtName: TEdit;
    lbl3: TLabel;
    edtProdTypeName: TEdit;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    cbbBKP: TComboBox;
    cbpUOMNBD: TColumnComboBox;
    cbpProdType: TColumnComboBox;
    edtPrice: TJvValidateEdit;
    lbl7: TLabel;
    cbpPeriode: TColumnComboBox;
    lbl8: TLabel;
    cbpPajak: TColumnComboBox;
    edtUOMDesc: TEdit;
    edJml: TJvValidateEdit;
    Label1: TLabel;
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure cbpProdTypeCloseUp(Sender: TObject);
    procedure cbpUOMNBDCloseUp(Sender: TObject);
    procedure cbpPeriodeCloseUp(Sender: TObject);
    procedure cbpPajakCloseUp(Sender: TObject);
    procedure cbbBKPChange(Sender: TObject);
    procedure edtPriceEnter(Sender: TObject);
  private
    FIsProcessSuccessfull: boolean;
    FMasterProductNBDId: string;
    FFormMode: TFormMode;
    dataProdType,dataUOMNBD: TResultDataSet;
    dataPajak,dataPeriode: TResultDataSet;
    idTPPRO,idPeriode,idPajak: Integer;

    FNewProduk_Jasa : TNewProduk_Jasa;
    procedure LoadDropDownData(ACombo: TColumnComboBox; AColsOfData: Integer);
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure SetMasterProductNBDId(const Value: string);
    procedure ShowDataEdit(AMasterProductNBDId: string);
    procedure PrepareAddData();
    function checkEmpty: Boolean;
    function SaveMasterProductNBDNewClass: boolean;
  public
    { Public declarations }
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property MasterProductNBDId: string read FMasterProductNBDId write SetMasterProductNBDId;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogMasterProductNBD: TfrmDialogMasterProductNBD;

implementation

uses uTSCommonDlg,  uRetnoUnit, uNewTipeProduk, uNewPeriode, uNewPajak,
     uNewRefSatuan_NBD, math;

{$R *.dfm}

{ TfrmDialogMasterProductNBD }

procedure TfrmDialogMasterProductNBD.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogMasterProductNBD.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogMasterProductNBD.SetMasterProductNBDId(const Value: string);
begin
  FMasterProductNBDId := Value;
end;

procedure TfrmDialogMasterProductNBD.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;
  if checkEmpty = False then Exit;

  try
    FIsProcessSuccessfull := SaveMasterProductNBDNewClass;
    if FIsProcessSuccessfull then
    begin
      cCommitTrans;
      Close;
    end
    else
    begin
      cRollbackTrans;
    end;
  except

  end;

{  if (FormMode = fmAdd) then
  begin
    FIsProcessSuccessfull := SaveMasterProductNBDNewClass;
    if FIsProcessSuccessfull then
      Close;
  end;
  else
  begin
    FIsProcessSuccessfull := UpdateMasterProductNBD;
    if FIsProcessSuccessfull then
      Close;
  end; // end if
}
end;

procedure TfrmDialogMasterProductNBD.FormShow(Sender: TObject);
//var
//   arrParam: TArr;
begin
  inherited;
{  if not Assigned(ProductTypeNBD) then ProductTypeNBD := TProductTypeNBD.Create;
  if not Assigned(Satuan_NBD) then Satuan_NBD := TSatuan_NBD.Create;
  if not Assigned(Periode) then Periode := TPeriode.Create;
  if not Assigned(Pajak) then Pajak := TPajak.Create;
}
  FNewProduk_Jasa := TNewProduk_Jasa.CreateWithUser(self, FLoginId, FLoginUnitId);
                  //ProductTypeNBD
  dataProdType := GetDataProductTypeNBD(DialogUnit);
  dataProdType.Last;
  LoadDropDownData(cbpProdType,dataProdType.RecordCount);

  dataUOMNBD := GetListSatuan_NBD(DialogUnit);
  dataUOMNBD.Last;
  LoadDropDownData(cbpUOMNBD,dataUOMNBD.RecordCount);
                 //Periode
  dataPeriode := GetListDataPeriode(DialogUnit);
  dataPeriode.Last;
  LoadDropDownData(cbpPeriode,dataPeriode.RecordCount);

  dataPajak := GetDataPajak(DialogUnit);
  dataPajak.Last;
  LoadDropDownData(cbpPajak,dataPajak.RecordCount);

  if (FFormMode = fmEdit) then
    ShowDataEdit(MasterProductNBDId)
  else
    PrepareAddData();
end;

procedure TfrmDialogMasterProductNBD.ShowDataEdit(AMasterProductNBDId: string);
//var
//  data: TResultDataSet;
begin
{  if not assigned(MasterProductNBD) then
    MasterProductNBD := TMasterProductNBD.Create;
  data:= MasterProductNBD.SearchDataMasterProductNBD(AMasterProductNBDId);
}

  //if data.RecordCount > 0 then
  if FNewProduk_Jasa.LoadByCODE(AMasterProductNBDId, DialogUnit) then
  begin
    edJml.Value   := FNewProduk_Jasa.Qty;
    edtCode.Text := FNewProduk_Jasa.CODE;
    edtName.Text := FNewProduk_Jasa.NAME;
    cbpProdType.Value := FNewProduk_Jasa.TPPRO.Kode;
    cbpProdType.CloseUp;
    cbbBKP.ItemIndex := FNewProduk_Jasa.IS_BKP; //data.Fieldbyname('PROJAS_IS_BKP').AsInteger;

    cbpUOMNBD.Value := FNewProduk_Jasa.SATNBD.CODE; // data.Fieldbyname('PROJAS_SATNBD_CODE').AsString;
    cbpUOMNBD.CloseUp;

    edtPrice.Value := FNewProduk_Jasa.PRICE; // data.Fieldbyname('PROJAS_PRICE').AsFloat;

    if cbbBKP.ItemIndex = 1 then
    begin
      // BKP, shows the tax value
      cbpPajak.Value := FNewProduk_Jasa.PJK.Nama;// data.Fieldbyname('PJK_NAME').AsString;
      cbpPajak.CloseUp;
    end
    else
      cbpPajak.Enabled := False;

    cbpPeriode.Value := FNewProduk_Jasa.PER.Per_Name;// data.Fieldbyname('PER_NAME').AsString;
    cbpPeriode.CloseUp;
  end;

end;

procedure TfrmDialogMasterProductNBD.PrepareAddData;
begin
  edtCode.Clear;
  edtName.Clear;
end;

procedure TfrmDialogMasterProductNBD.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogMasterProductNBD.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogMasterProductNBD := nil;
  FNewProduk_Jasa.Free;
end;

procedure TfrmDialogMasterProductNBD.LoadDropDownData(ACombo: TColumnComboBox;
  AColsOfData: Integer);
begin
  {Flush the old data}
  ACombo.ClearGridData;

  {Make sure the allocated storage is big enough}
  if AColsOfData > 0 then ACombo.RowCount := AColsOfData+1
  else ACombo.RowCount := 2;
  ACombo.ColCount := 3;

  {Load the data}
  if Acombo = cbpProdType then
  begin
    ACombo.AddRow(['0','CODE','NAME']);
    if dataProdType.RecordCount > 0 then
    begin
      dataProdType.First;
      while not dataProdType.Eof do
      begin
        try
          ACombo.AddRow([dataProdType.FieldByName('TPPRO_ID').AsString,
                         dataProdType.FieldByName('TPPRO_CODE').AsString,
                         dataProdType.FieldByName('TPPRO_NAME').AsString]);
        except
        end;
        dataProdType.Next;
      end; //END WHILE
    end //END <> NIL
    else
      ACombo.AddRow(['0','','']);
  end;

  if ACombo = cbpUOMNBD then
  begin
    ACombo.AddRow(['','CODE','NAME']);

    if dataUOMNBD.RecordCount > 0 then
    begin
      dataUOMNBD.First;
      while not dataUOMNBD.Eof do
      begin
        try
          ACombo.AddRow(['',dataUOMNBD.FieldByName('SATNBD_CODE').AsString,
                         dataUOMNBD.FieldByName('SATNBD_NAME').AsString]);
        except
        end;
        dataUOMNBD.Next;
      end;//while
    end//END <> NIL
    else
      ACombo.AddRow(['','','']);

  end; //if acombo =cbp1

  if ACombo = cbpPeriode then
  begin
    ACombo.AddRow(['0','NAME']);

    if dataPeriode.RecordCount > 0 then
    begin
      dataPeriode.First;
      while not dataPeriode.Eof do
      begin
        try
          ACombo.AddRow([dataPeriode.FieldByName('PER_ID').AsString,dataPeriode.FieldByName('PER_NAME').AsString]);
        except
        end;
        dataPeriode.Next;
      end;//while
    end//END <> NIL
    else
      ACombo.AddRow(['0','']);

  end; //if acombo =cbp1

  if ACombo = cbpPajak then
  begin
    ACombo.AddRow(['0','NAME']);

    if dataPajak.RecordCount > 0 then
    begin
      dataPajak.First;
      while not dataPajak.Eof do
      begin
        try
          ACombo.AddRow([dataPajak.FieldByName('PJK_ID').AsString,dataPajak.FieldByName('PJK_NAME').AsString]);
        except
        end;
        dataPajak.Next;
      end;//while
    end//END <> NIL
    else
      ACombo.AddRow(['0','']);

  end; //if acombo =cbp1

  {Now shring the grid so its just big enough for the data}
  ACombo.SizeGridToData;
  //trik to activate acombo
  ACombo.FixedRows := 1;
end;

procedure TfrmDialogMasterProductNBD.cbpProdTypeCloseUp(Sender: TObject);
begin
  inherited;
  edtProdTypeName.Text := cbpProdType.Cells[2,cbpProdType.Row];
  try
    idTPPRO := StrToInt(cbpProdType.Cells[0,cbpProdType.Row]);
  except
    idTPPRO := 0;
  end;
end;

procedure TfrmDialogMasterProductNBD.cbpUOMNBDCloseUp(Sender: TObject);
begin
  inherited;
  edtUOMDesc.Text := cbpUOMNBD.Cells[2,cbpUOMNBD.Row];
end;

procedure TfrmDialogMasterProductNBD.cbpPeriodeCloseUp(Sender: TObject);
begin
  inherited;
  idPeriode := StrToInt(cbpPeriode.Cells[0,cbpPeriode.Row]);
end;

procedure TfrmDialogMasterProductNBD.cbpPajakCloseUp(Sender: TObject);
begin
  inherited;
  idPajak := StrToInt(cbpPajak.Cells[0,cbpPajak.Row]);
end;

procedure TfrmDialogMasterProductNBD.cbbBKPChange(Sender: TObject);
begin
  inherited;
  if cbbBKP.ItemIndex = 0 then
  begin
    // non BKP produk then not necessary for choosing tax type
    cbpPajak.Enabled := False;
    cbpPajak.Text := '';
  end
  else
    cbpPajak.Enabled := True;
end;

function TfrmDialogMasterProductNBD.checkEmpty: Boolean;
var errorField: string;
begin
  //init
  Result := True;
  errorField := ' ';
  if edtCode.Text='' then
  begin
    edtCode.SetFocus;
    Result := False;
    errorField := 'PRODUCT CODE, ';
  end;
  if edtName.Text='' then
  begin
    edtName.SetFocus;
    Result := False;
    errorField := errorField + 'PRODUCT NAME, ';
  end;
  if cbpProdType.Text='' then
  begin
    cbpProdType.SetFocus;
    Result := False;
    errorField := errorField + 'PRODUCT TYPE, ';
  end;
  if (cbpPajak.Text='') and (cbbBKP.Text = 'BKP') then
  begin
    cbpPajak.SetFocus;
    Result := False;
    errorField := errorField + 'TAX, ';
  end;
  if cbpUOMNBD.Text='' then
  begin
    cbpUOMNBD.SetFocus;
    Result := False;
    errorField := errorField + 'UOM NBD, ';
  end;
  if cbpPeriode.Text='' then
  begin
    cbpPeriode.SetFocus;
    Result := False;
    errorField := errorField + 'PERIODE,';
  end;
  if Result = False then
  begin
    SetLength(errorField,Length(errorField)-2); //menghapus tanda koma
    CommonDlg.ShowErrorEmpty(errorField);
  end;
end;

procedure TfrmDialogMasterProductNBD.edtPriceEnter(Sender: TObject);
begin
  inherited;
  edtPrice.SelectAll;
end;

function TfrmDialogMasterProductNBD.SaveMasterProductNBDNewClass: boolean;
var
  iBKP, UntIDPajak : integer;
begin
  // set param
  if cbbBKP.Text = 'BKP' then
  begin
     iBKP := 1;
     UntIDPajak := DialogUnit;
  end
  else
  begin
     iBKP := 0;
     idPajak := 0;
     UntIDPajak := 0;
  end;

  FNewProduk_Jasa.UpdateData(edtCode.Text, now(), now(), 0, iBKP, edtName.Text,
            FLoginUnitId, 0, FLoginId, 0, idPeriode, DialogUnit, idPajak,
            edtPrice.Value, cbpUOMNBD.Value, DialogUnit, idTPPRO, DialogUnit,
            Floor(edJml.Value)
            );

  try                                            //kode produk lama
    result:= FNewProduk_Jasa.SaveToDB(MasterProductNBDId, DialogUnit);
    if Result then
    begin
      cCommitTrans;
    end else
    begin
      cRollbackTrans;
      CommonDlg.ShowError('Gagal Menyimpan Data');
    end;
  finally
    cRollBackTrans;
  end;

end;

end.
