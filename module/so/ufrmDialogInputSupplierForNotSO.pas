unit ufrmDialogInputSupplierForNotSO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, StdCtrls, cbxbase, dblup1a, uConn,
  ufraFooterDialog2Button, ExtCtrls, SUIForm, uInputSupplierForNotSO,
  EditBtn, uRMSUnit, uRMSBaseClass, uGTSUICommonDlg;

type
  TFormMode = (fmAdd, fmEdit);
  TfrmDialogInputSupplierForNotSO = class(TfrmMasterDialog)
    lbl1: TLabel;
    lbl2: TLabel;
    cbpCode: TColumnComboBox;
    edtName: TEdit;
    edtKode: TEditBtn;
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbpCodeChange(Sender: TObject);
    procedure cbpCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbpCodeCloseUp(Sender: TObject);
    procedure cbpCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtKodeClickBtn(Sender: TObject);
    procedure edtKodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtKodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtKodeExit(Sender: TObject);
  private
    FIsProcessSuccessfull: boolean;
    FFormMode: TFormMode;
    FSuplierBlacklistId: Integer;
    isCodeChange: Boolean;
    dataCodeSuplier: TResultDataSet;
    { Private declarations }
    procedure SetFormMode(const Value: TFormMode);
    procedure SetSuplierBlacklistId(const Value: Integer);
    procedure prepareAddData;
    procedure LoadDropDownData(ACombo: TColumnComboBox; AColsOfData: Integer);
    function SaveData: boolean;
    function UpdateData: boolean;
    procedure SetIsProcessSuccessfull(const Value: boolean);
  public
    procedure CekKodeExist;
    { Public declarations }
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property SuplierBlacklistId: Integer read FSuplierBlacklistId write SetSuplierBlacklistId;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogInputSupplierForNotSO: TfrmDialogInputSupplierForNotSO;

implementation

uses uDataCombo, DB,  uSearchSupplier, ufrmInputSupplierForNotSO;

{$R *.dfm}

procedure TfrmDialogInputSupplierForNotSO.LoadDropDownData(ACombo: TColumnComboBox; AColsOfData: Integer);
begin
    {Flush the old data}
    ACombo.ClearGridData;

    {Make sure the allocated storage is big enough}
    if AColsOfData>0 then
      ACombo.RowCount := AColsOfData+1
    else
      ACombo.RowCount := 2;
    ACombo.ColCount := 3;
    ACombo.AddRow(['','CODE','NAME']);
    if dataCodeSuplier <> nil then
    while not dataCodeSuplier.Eof do
    begin
      try
        ACombo.AddRow([dataCodeSuplier.FieldByName('SUP_CODE').AsString,
                       dataCodeSuplier.FieldByName('SUP_CODE').AsString,
                       dataCodeSuplier.FieldByName('SUP_NAME').AsString]);
      except
      end;
      dataCodeSuplier.Next;
    end
    else
      try
        ACombo.AddRow(['0',' ',' ']);
      except
      end;
    ACombo.FixedRows:=1;
    {Now shring the grid so its just big enough for the data}
    ACombo.SizeGridToData;
end;

function TfrmDialogInputSupplierForNotSO.SaveData: boolean;
var //cek: Boolean;
  i: Integer;
  aSQL: string;
  //iSQL: string;
  aID: Integer;
  sSQL: string;
    //arrParam: TArr;
begin
  inherited;
  Result := False;

  aSQL := 'select SOSB_SUP_CODE from SO_SUPLIER_BLACKLIST where SOSB_UNT_ID = '
          + IntToStr(dialogunit)
          + ' and SOSB_SUP_CODE = ' + QuotedStr(edtKode.Text);

  with cOpenQuery(aSQL) do
  begin
    for i := 1 to frmInputSupplierForNotSO.strgGrid.RowCount - 1 do
    begin
      if FieldByName('SOSB_SUP_CODE').AsString <> ''  then
      begin
        CommonDlg.ShowError('Data Suplier Sudah Ada');
        Exit;
      end;
    end;
  end;


  aID := cGetNextID('GEN_SO_SUPLIER_BLACKLIST_ID');

  sSQL := 'insert into SO_SUPLIER_BLACKLIST'
          + '(SOSB_ID'
          + ',SOSB_UNT_ID'
          + ', SOSB_SUP_CODE'
          + ') values ( '
          + inttostr(aID) + ', '
          + inttostr(dialogunit) + ', '
          + QuotedStr(edtKode.text)
          + '); ';

  try
    if not cExecSQL(sSQL,False,SuplierBlackList.GetHeaderFlag) then
    begin
      cRollbackTrans;
      CommonDlg.ShowError('Data Gagal Disimpan');
      Exit;
    end else if not SimpanBlob(sSQL,1) then
    begin
      cRollbackTrans;
      CommonDlg.ShowError('Data Gagal Disimpan');
      Exit;
    end
    else begin
     // CekKodeExist;
      cCommitTrans;
      CommonDlg.ShowMessage('Data Berhasil Disimpan');
      frmInputSupplierForNotSO.actRefreshSupplierForNotSOExecute(Self);
      Close;
    end;
  finally
    cRollbackTrans;
  end;

 { if not assigned(SuplierBlackList) then
    SuplierBlackList := TSuplierBlackList.Create;
  cek:= SuplierBlackList.CekDataSuplierBlackList(cbpCode.Text);
  if cek then
  begin
    // set param
    SetLength(arrParam,3);
    arrParam[0].tipe := ptString;
    arrParam[0].data := cbpCode.Text;
    arrParam[1].tipe := ptInteger;
    arrParam[1].data := FLoginId;
    arrParam[2].tipe := ptDateTime;
    arrParam[2].data := Now;
    Result:= SuplierBlackList.InputDataSuplierBlackList(arrParam);
  end
  else
  begin
    CommonDlg.ShowMessage(1,'Information','supplier already in list.', mtInfo);
    Result:= False;
  end;  }

  
end;

function TfrmDialogInputSupplierForNotSO.UpdateData: boolean;
var // cek: Boolean;
  aSQL: string;
  i: Integer;
  sSQL: string;
  //  arrParam: TArr;
begin
  Result := False;
  
  sSQL := 'select count(SOSB_SUP_CODE) as Jumlah from SO_SUPLIER_BLACKLIST where SOSB_UNT_ID = '
          + IntToStr(dialogunit)
          + ' and SOSB_SUP_CODE = ' + QuotedStr(edtKode.Text)
          + ' and SOSB_ID <> ' + IntToStr(SuplierBlacklistId) ;

  with cOpenQuery(sSQL) do
  begin
    for i := 1 to frmInputSupplierForNotSO.strgGrid.RowCount - 1 do
    begin
      if FieldByName('Jumlah').AsInteger > 0  then
      begin
        CommonDlg.ShowError('Data Suplier Sudah Ada');
        Exit;
      end;
    end;
  end;



  aSQL := 'Update SO_SUPLIER_BLACKLIST set '
          + ' SOSB_SUP_CODE = ' + QuotedStr(edtKode.Text) + ' , '
          + ' where '
          + ' SOSB_ID = ' + IntToStr(SuplierBlacklistId)
          + ' and SOSB_UNT_ID = ' + IntToStr(dialogunit) + ';';

  try
    if not cExecSQL(aSQL,False,SuplierBlackList.GetHeaderFlag) then
    begin
      cRollbackTrans;
      CommonDlg.ShowError('Data Gagal Disimpan');
      Exit;
    end else if not SimpanBlob(sSQL,1) then
    begin
      cRollbackTrans;
      CommonDlg.ShowError('Data Gagal Disimpan');
      Exit;
    end
    else begin
     // CekKodeExist;
      cCommitTrans;
      CommonDlg.ShowMessage('Data Berhasil Disimpan');
      frmInputSupplierForNotSO.actRefreshSupplierForNotSOExecute(Self);
      close;
    end;
  finally
    cRollbackTrans;
  end;
 { if not assigned(SuplierBlackList) then
    SuplierBlackList := TSuplierBlackList.Create;
  cek:= SuplierBlackList.CekDataSuplierBlackList(cbpCode.Text);
  if cek then
  begin
    // set param
    SetLength(arrParam,4);
    arrParam[0].tipe := ptString;
    arrParam[0].data := cbpCode.Text;
    arrParam[1].tipe := ptInteger;
    arrParam[1].data := FLoginId;
    arrParam[2].tipe := ptDateTime;
    arrParam[2].data := Now;
    arrParam[3].tipe := ptInteger;
    arrParam[3].data := SuplierBlacklistId;
    result:=SuplierBlackList.UpdateDataSuplierBlackList(arrParam);
  end
  else
  begin
    CommonDlg.ShowMessage(1,'Information','supplier already in list.', mtInfo);
    Result:= False;
  end;   }
end;

procedure TfrmDialogInputSupplierForNotSO.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;

  if not IsValidDateKarenaEOD(dialogunit,cGetServerTime,Fmasterisstore) then
    Exit;

  if (FormMode = fmAdd) then
  begin
    FIsProcessSuccessfull := SaveData;
    if FIsProcessSuccessfull then
      Close;
  end
  else
  begin
    FIsProcessSuccessfull := UpdateData;
    if FIsProcessSuccessfull then
      Close;
  end; // end if
end;

procedure TfrmDialogInputSupplierForNotSO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogInputSupplierForNotSO.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogInputSupplierForNotSO := nil;
end;

procedure TfrmDialogInputSupplierForNotSO.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogInputSupplierForNotSO.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogInputSupplierForNotSO.SetSuplierBlacklistId(const Value: Integer);
begin
  FSuplierBlacklistId:=Value;
end;

procedure TfrmDialogInputSupplierForNotSO.prepareAddData;
begin
  edtName.Text:=cbpCode.Cells[2,1];
  {try
    iIdUnt:=StrToInt(cbpCode.Cells[0,1]);
  except
    iIdUnt:=0;
  end;}
end;

procedure TfrmDialogInputSupplierForNotSO.FormShow(Sender: TObject);
var
  Kode: string;
  sSQL: string;
begin
  inherited;
  edtKode.Text := '';

  Kode := frmInputSupplierForNotSO.strgGrid.Cells[0,frmInputSupplierForNotSO.strgGrid.Row];

  sSQL := 'select *  from SO_SUPLIER_BLACKLIST where SOSB_SUP_CODE = ' + QuotedStr(Kode);

  with cOpenQuery(sSQL) do
  begin

    if (FFormMode = fmEdit) then
    begin
     // showDataEdit(FSuplierBlacklistId);
      edtKode.Text := fieldByName('SOSB_SUP_CODE').AsString;
      edtName.Text := frmInputSupplierForNotSO.strgGrid.Cells[1,frmInputSupplierForNotSO.strgGrid.Row];
    end
    else begin
      prepareAddData();
      isCodeChange:=False;
    end;
 end;
end;

procedure TfrmDialogInputSupplierForNotSO.cbpCodeChange(Sender: TObject);
begin
  inherited;
{  edtName.Text:=cbpCode.Cells[2,cbpCode.Row];
  try
    iIdUnt:=StrToInt(cbpCode.Cells[0,cbpCode.Row]);
  except
    iIdUnt:=0;
  end;}
  isCodeChange:=True;
end;

procedure TfrmDialogInputSupplierForNotSO.cbpCodeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if(not(isCodeChange))then
  begin
    if(Key=VK_ESCAPE)then
      footerDialogMaster.btnClose.Click
    else if(Key=VK_RETURN)then
      footerDialogMaster.btnSave.Click;
  end
  else if(isCodeChange)and(Key in [VK_ESCAPE,VK_RETURN]) then
    isCodeChange:=False;
end;

procedure TfrmDialogInputSupplierForNotSO.cbpCodeCloseUp(Sender: TObject);
begin
  inherited;
  //edtName.Text:=cbpCode.Cells[2,cbpCode.Row];
  isCodeChange:=True;
end;

procedure TfrmDialogInputSupplierForNotSO.cbpCodeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var supCode: string;
begin
  inherited;
  if Length(cbpCode.Text) = 1 then
  begin
    supCode := UpperCase(cbpCode.Text) + '%';

    dataCodeSuplier := uSearchSupplier.SearchSupplier.GetDataSupplier(supCode);
    LoadDropDownData(cbpCode,dataCodeSuplier.RecordCount);
  end; //if length
end;

procedure TfrmDialogInputSupplierForNotSO.CekKodeExist;
var
  i: Integer;
  sSQL: string;
begin
  sSQL := 'select SOSB_SUP_CODE from SO_SUPLIER_BLACKLIST where SOSB_UNT_ID = '
          + IntToStr(dialogunit)
          + ' and SOSB_SUP_CODE = ' + QuotedStr(edtKode.Text);

  with cOpenQuery(sSQL) do
  begin
    for i := 1 to frmInputSupplierForNotSO.strgGrid.RowCount - 1 do
    begin
      if FieldByName('SOSB_SUP_CODE').AsString <> ''  then
      begin
        CommonDlg.ShowError('Data Suplier Sudah Ada');
        Exit;
      end;
    end;
  end;
end;

procedure TfrmDialogInputSupplierForNotSO.edtKodeClickBtn(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := 'select sup_code, sup_name '
       + ' from suplier ';

  with cLookUp('Data Suplier',sSQL) do
  begin
     if Strings[0] = '' then
     begin
       Exit;
     end;

     edtKode.Text := Strings[0];
     edtName.Text := Strings[1];
  end;
end;

procedure TfrmDialogInputSupplierForNotSO.edtKodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

procedure TfrmDialogInputSupplierForNotSO.edtKodeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
  Begin
    Perform(WM_NEXTDLGCTL,0,0)
  End;
end;

procedure TfrmDialogInputSupplierForNotSO.edtKodeExit(Sender: TObject);
var
  sSQL: String;
begin
  inherited;

  sSQL := 'select sup_code, sup_name from suplier where sup_code = '
       + Quot(edtKode.Text) ;

  with cOpenQuery(sSQL) do
  begin
    try
       if Fields[0].AsString = '' then
       begin
         edtKode.Text := '';
         edtName.Text := 'Kode Supplier Salah !';
         footerDialogMaster.btnSave.Enabled := False;
         Exit;
       end else
       Begin
         edtKode.Text := Fields[0].AsString;
         edtName.Text := Fields[1].AsString;
         footerDialogMaster.btnSave.Enabled := True;
       end;
    finally
      Free;
    End;
  end;
//  edtName.SetFocus;

end;

end.




