unit ufrmDialogGroupSubGroupCategory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, SUITabControl, ufraFooterDialog2Button,
  ExtCtrls, SUIForm, JvEdit, StdCtrls, SUIPageControl,
  cbxbase, dblup1a, uConn, uGroup, uSubGroup, uKategori, JvExStdCtrls,
  JvValidateEdit;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogGroupSubGroupCategory = class(TfrmMasterDialog)
    pcContent: TsuiPageControl;
    tsGroup: TsuiTabSheet;
    edtGroupName: TEdit;
    edtGroupCode: TEdit;
    lblCode: TLabel;
    lblName: TLabel;
    lblMarkUp: TLabel;
    edtGroupMarkup: TJvValidateEdit;
    tsSubGroup: TsuiTabSheet;
    lblGroupName: TLabel;
    lbl5: TLabel;
    cbbGroup: TComboBox;
    edtSubGrupCode: TEdit;
    tsCategory: TsuiTabSheet;
    lbl6: TLabel;
    cbbGroup1: TComboBox;
    lbl7: TLabel;
    cbbSubGroup: TComboBox;
    lbl8: TLabel;
    edtCategoryName: TEdit;
    edtCategoryCode: TEdit;
    lbl9: TLabel;
    edtSubGrupName: TEdit;
    lbl10: TLabel;
    lblRekeningCode: TLabel;
    cbpRekCode: TColumnComboBox;
    cbbMerchan: TComboBox;
    lblMerchandise: TLabel;
    edSafetyStock: TJvValidateEdit;
    lbl13: TLabel;
    lbl14: TLabel;
    edtGrsProfit: TJvValidateEdit;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbbGroup1Change(Sender: TObject);
    procedure edtGroupMarkupEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edSafetyStockKeyPress(Sender: TObject; var Key: Char);
  private
    FIsProcessSuccessfull: boolean;
    FFormMode: TFormMode;
    arrIdMerchan,arrIdGrup,arrIdGrup1,arrIdSubGrup: array of Integer;
    FGroup: TGroup;
    FKategori: TKategori;
    FSubGroup: TSubGroup;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    function SaveData: boolean;
    function UpdateData: boolean;
    function GetListRekening: TResultDataSet;
    procedure prepareAddData;
    procedure showDataEdit;
    procedure ParseDataRekening;
    function SaveDataGroup: Boolean;
    function SaveSubGroup: Boolean;
    { Private declarations }
  public
    { Public declarations }
    idGrup,IdSubGrup,IdKategori: Integer;
    function SaveDataKategori: Boolean;
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogGroupSubGroupCategory: TfrmDialogGroupSubGroupCategory;
  ID : Integer;
implementation

uses uGroups, uTSCommonDlg, uProduct, DB, 
  ufrmGroupSubGroupCategory, AdvGrid, uRetnoUnit;

{$R *.dfm}

procedure TfrmDialogGroupSubGroupCategory.prepareAddData;
var i:Integer;
begin
  for i:=0 to cbbGroup.Items.Count-1 do
    if arrIdGrup[i]=idGrup then
    begin
      cbbGroup.ItemIndex:=i;
      Break;
    end;
  for i:=0 to cbbGroup1.Items.Count-1 do
    if arrIdGrup1[i]=idGrup then
    begin
      cbbGroup1.ItemIndex:=i;
      Break;
    end;
  cbbGroup1Change(Self);
  for i:=0 to cbbSubGroup.Items.Count-1 do
    if arrIdSubGrup[i]=IdSubGrup then
    begin
      cbbSubGroup.ItemIndex:=i;
      Break;
    end;
end;

procedure TfrmDialogGroupSubGroupCategory.showDataEdit;
var
    i: Integer;
begin


  with FGroup do
  begin
    if LoadByID(idGrup) then
    begin
      edtGroupCode.Text := Kode;
      edtGroupName.Text := Nama;
      edtGroupMarkup.Value := DefaultMarkUp;
      cbpRekCode.Value := KodeRek;

      for i:=0 to cbbMerchan.Items.Count-1 do
      if arrIdMerchan[i] = MerchanID then
      begin
        cbbMerchan.ItemIndex := i;
        Break;
      end;

    end else begin
      edtGroupCode.Text := '';
      edtGroupName.Text := '';
      edtGroupMarkup.Value := 0;
      cbpRekCode.Value := '';
    end;
  end;

  with FSubGroup do
  begin
    if LoadByID(IdSubGrup) then
    begin
      edtSubGrupCode.Text     := Kode;
      edtSubGrupName.Text     := Nama;
      edSafetyStock.Value     := SafetyStock;
      edtGrsProfit.Value      := GrsProfit;

      for i := 0 to cbbGroup.Items.Count-1 do
      if arrIdGrup[i] = Group.ID then
      begin
        cbbGroup.ItemIndex := i;
        Break;
      end;
    end;
  end;

  with FKategori do
  begin
    if LoadByID(IdKategori) then
    begin
      edtCategoryName.Text  := Nama;
      edtCategoryCode.Text  := Kode;

      for i:=0 to cbbGroup1.Items.Count-1 do
      if arrIdGrup1[i] = SubGroup.Group.ID then
      begin
        cbbGroup1.ItemIndex:=i;
        Break;
      end;
      cbbGroup1Change(Self);

      for i:=0 to cbbSubGroup.Items.Count-1 do
        if arrIdSubGrup[i]= SubGroup.ID then
        begin
          cbbSubGroup.ItemIndex:=i;
          Break;
        end;
    end else begin
      edtCategoryName.Text := Nama;
      edtCategoryCode.Text := Kode;
    end;
  end;


end;

function TfrmDialogGroupSubGroupCategory.SaveData: boolean;
begin
  result := false;

  if pcContent.ActivePage = tsGroup then
  begin
    Result := SaveDataGroup;
  end
  else if pcContent.ActivePage = tsSubGroup then
  begin
    Result := SaveSubGroup;
  end
  else if pcContent.ActivePage = tsCategory then
  begin
    result:= SaveDataKategori;
  end;
end;

function TfrmDialogGroupSubGroupCategory.UpdateData: boolean;
begin
  result := false;

  if not assigned(Groups) then
    Groups := TGroups.Create;


  if pcContent.ActivePage = tsGroup then
  begin
    Result := SaveDataGroup;
  end
  else if pcContent.ActivePage=tsSubGroup then
  begin
    result:= SaveSubGroup;
  end
  else if pcContent.ActivePage=tsCategory then
  begin
    result:= SaveDataKategori;
  end;
end;

procedure TfrmDialogGroupSubGroupCategory.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogGroupSubGroupCategory.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogGroupSubGroupCategory := nil;
end;

procedure TfrmDialogGroupSubGroupCategory.SetFormMode(
  const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogGroupSubGroupCategory.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogGroupSubGroupCategory.footerDialogMasterbtnSaveClick(
  Sender: TObject);
//var
//  IsCanEdit: Boolean;
begin
  try
    if (FormMode = fmAdd) then
    begin
      idGrup := 0;
      IdSubGrup := 0;
      IdKategori := 0;
      FIsProcessSuccessfull := SaveData;
      if FIsProcessSuccessfull then
      begin
        FGroup.ClearProperties;
        FSubGroup.ClearProperties;

        Close;
      end;
    end
    else begin
      //idGrup := StrToInt(frmGroupSubGroupCategory.strgGroup.Cells[4,frmGroupSubGroupCategory.strgGroup.Row]);
      //IdSubGrup := StrToInt(frmGroupSubGroupCategory.strgSubGroup.Cells[2,frmGroupSubGroupCategory.strgGroup.Row]);
      //IdKategori := StrToInt(frmGroupSubGroupCategory.strgCategory.Cells[2,frmGroupSubGroupCategory.strgGroup.Row]);
      FIsProcessSuccessfull := UpdateData;
      if FIsProcessSuccessfull then
      begin
        FGroup.ClearProperties;
        FSubGroup.ClearProperties;

        Close;
      end;
    end; // end if
  finally
    frmGroupSubGroupCategory.fraFooter5Button1.btnRefresh.Click;
    //frmGroupSubGroupCategory.strgGroupSelectCell(nil, frmGroupSubGroupCategory.strgGroup.Col, frmGroupSubGroupCategory.strgGroup.Row, IsCanEdit);
    //frmGroupSubGroupCategory.strgSubGroupSelectCell(nil, frmGroupSubGroupCategory.strgSubGroup.Col, frmGroupSubGroupCategory.strgSubGroup.Row, IsCanEdit);
    //frmGroupSubGroupCategory.strgCategorySelectCell(nil, frmGroupSubGroupCategory.strgCategory.Col, frmGroupSubGroupCategory.strgCategory.Row, IsCanEdit);
  end;
end;

procedure TfrmDialogGroupSubGroupCategory.FormShow(Sender: TObject);
var i: Integer;
    data: TResultDataSet;
begin
  inherited;
  if not assigned(Groups) then
    Groups := TGroups.Create;

  {Set cbbGroup}
  cbbGroup.Clear;
  cbbGroup1.Clear;
  data:= Groups.GetDataGroup();
  SetLength(arrIdGrup,data.RecordCount);
  SetLength(arrIdGrup1,data.RecordCount);

  i:=0;
  with data do
  begin
    while not Eof do
    begin
      cbbGroup.Items.Add(fieldbyname('Grup_Name').AsString);
      arrIdGrup[i]:= fieldbyname('Grup_Id').AsInteger;
      cbbGroup1.Items.Add(fieldbyname('Grup_Name').AsString);
      arrIdGrup1[i]:= fieldbyname('Grup_Id').AsInteger;
      Next;
      Inc(i);
    end;
  end;

  {Parsing merchandise}
  data:= Groups.GetDataMerchandise();
  SetLength(arrIdMerchan,data.RecordCount);
  i:=0;
  with data do
  begin
    while not Eof do
    begin
      cbbMerchan.Items.Add(fieldbyname('MERCHAN_NAME').AsString);
      arrIdMerchan[i]:= fieldbyname('MERCHAN_ID').AsInteger;
      Next;
      Inc(i);
    end;
  end;

  ParseDataRekening;

  if (FFormMode = fmEdit) then
    showDataEdit
  else
    prepareAddData;
end;

procedure TfrmDialogGroupSubGroupCategory.cbbGroup1Change(Sender: TObject);
var i: Integer;
    data: TResultDataSet;
begin
  inherited;
  {Set cbbSubGroup}
  cbbSubGroup.Clear;
  data:=Groups.GetDataSubGroup(arrIdGrup1[cbbGroup1.ItemIndex]);
  SetLength(arrIdSubGrup,data.RecordCount);
  i:=0;
  with data do
  begin
    while not Eof do
    begin
      cbbSubGroup.Items.Add(data.fieldbyname('SUBGRUP_NAME').AsString);
      arrIdSubGrup[i]:=data.fieldbyname('SUBGRUP_ID').AsInteger;
      Next;
      Inc(i);
    end;
  end;
  cbbSubGroup.ItemIndex:=0;
end;

function TfrmDialogGroupSubGroupCategory.GetListRekening: TResultDataSet;
var arrParam: TArr;
begin
  SetLength(arrParam, 2);
  arrParam[0].tipe := ptString;
  arrParam[0].data := '1%';
  arrParam[1].tipe := ptInteger;
  arrParam[1].data := DialogCompany;

  if not Assigned(Groups) then
    Groups := TGroups.Create;

  Result := Groups.GetDataRekening(arrParam);
end;

procedure TfrmDialogGroupSubGroupCategory.ParseDataRekening;
var dataRekening: TResultDataSet;
begin
  dataRekening := GetListRekening;

  with cbpRekCode do
  begin
    if not dataRekening.IsEmpty then
    begin
      RowCount := dataRekening.RecordCount + 1;
      AddRow(['Id', 'Rekening Code', 'Rekening Name']);

      while not dataRekening.Eof do
      begin
        AddRow(['1', dataRekening.FieldByName('REK_CODE').AsString,
          dataRekening.FieldByName('REK_NAME').AsString]);

        dataRekening.Next;
      end;
    end
    else
    begin
      RowCount := 2;
      AddRow(['Id', 'Rekening Code', 'Rekening Name']);
      AddRow([' ', ' ', ' ']);
    end;

    SizeGridToData;
    FixedRows := 1;
    Text := '';
  end;
end;

procedure TfrmDialogGroupSubGroupCategory.edtGroupMarkupEnter(
  Sender: TObject);
begin
  inherited;
  edtGroupMarkup.SelectAll;
end;

procedure TfrmDialogGroupSubGroupCategory.FormCreate(Sender: TObject);
begin
  inherited;
  FGroup := TGroup.Create(Self);
  FSubGroup := TSubGroup.Create(Self);
  FKategori := TKategori.Create(Self);
end;

function TfrmDialogGroupSubGroupCategory.SaveDataGroup: Boolean;
//var
//SS: TStrings;
begin
  Result := False;

  if edtGroupCode.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('CODE');
    edtGroupCode.SetFocus;
    Exit;
  end
  else if edtGroupName.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('NAME');
    edtGroupName.SetFocus;
    Exit;
  end;

  if FGroup.LoadByCode(edtGroupCode.Text) then
  begin
    if idGrup <> FGroup.ID then
    begin
      CommonDlg.ShowError('Kode tidak boleh sama!');
      Exit;
    end;  
  end;

  FGroup.ClearProperties;
  FGroup.UpdateData(
            DialogCompany,
            edtGroupMarkup.Value,
            idGrup,
            edtGroupCode.Text,
            cbpRekCode.Text,
            arrIdMerchan[cbbMerchan.ItemIndex],
            edtGroupName.Text
            );

   try
     if FGroup.ExecuteGenerateSQL(IntToStr(idGrup)) then
     begin
        cCommitTrans;
        //CommonDlg.ShowMessage('Data Berhasil Disimpan');
        Result := True;
     end else
     begin
        cRollbackTrans;
        //CommonDlg.ShowError('Data Gagal Disimpan');
        Exit;
     end;
      //SS := GenerateSQL;
      //SS.SaveToFile(cGetAppPath + 'Group.txt');
      //Result:= kExecuteSQLs(SS, 'Simpan Data Group');
   finally
      cRollbackTrans;
     // SS.Free;
   end;
end;

function TfrmDialogGroupSubGroupCategory.SaveSubGroup: Boolean;
//var
//  SS: TStrings;
begin
  Result := False;
  if edtSubGrupCode.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('CODE');
    edtSubGrupCode.SetFocus;
    Exit;
  end
  else if edtSubGrupName.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('NAME');
    edtSubGrupName.SetFocus;
    Exit;
  end;

  if FSubGroup.LoadByKode(edtSubGrupCode.Text) then
  begin
    if IdSubGrup <> FSubGroup.ID then
    begin
      CommonDlg.ShowError('Kode tidak boleh sama');
      exit;
    end;  
  end;

    FSubGroup.ClearProperties;
    FSubGroup.UpdateData(
        arrIdGrup[cbbGroup.ItemIndex],
        IdSubGrup,
        edtSubGrupCode.Text,
        edtSubGrupName.Text,
        edSafetyStock.Value,
        edtGrsProfit.Value
      );
  try
    if FSubGroup.ExecuteGenerateSQL(IntToStr(IdSubGrup)) then
    begin
      cCommitTrans;
      Result := True;
    end else
    begin
      cRollbackTrans;
      //CommonDlg.ShowError('Data Gagal Disimpan');
      Exit;
    end;
     // SS := GenerateSQL;

    //  SS.SaveToFile(cGetAppPath + 'SubGroup.txt');
    //  Result := kExecuteSQLs(SS, 'Simpan Data Sub Group');
    finally
      cRollbackTrans;
    //  SS.Free;
    end;
end;

procedure TfrmDialogGroupSubGroupCategory.edSafetyStockKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9',#8]) then
    Key := #0; 
end;

function TfrmDialogGroupSubGroupCategory.SaveDataKategori: Boolean;
//var
//  SS: TStrings;
begin
  Result := False;

  if edtCategoryCode.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('CODE');
    edtCategoryCode.SetFocus;
    Exit;
  end
  else if edtCategoryName.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('NAME');
    edtCategoryName.SetFocus;
    Exit;
  end;

  if FKategori.LoadByKode(edtCategoryCode.Text) then
  begin
    if IdKategori <> FKategori.ID then
    begin
      CommonDlg.ShowError('Kode tidak boleh sama!');
      exit;
    end;
  end;  

  FKategori.ClearProperties;
  FKategori.UpdateData(
    IdKategori,
    edtCategoryCode.Text,
    edtCategoryName.Text,
    arrIdSubGrup[cbbSubGroup.ItemIndex]
  );
    try
      //SS := GenerateSQL;
      if FKategori.ExecuteGenerateSQL(IntToStr(IdKategori)) then
      begin
        cCommitTrans;
        //CommonDlg.ShowMessage('Data Berhasil Disimpan');
        Result := True;
      end
      else begin
        cRollbackTrans;
        //CommonDlg.ShowMessage('Data Gagal Disimpan');
        Exit;
      end;
   //     SS.SaveToFile(cGetAppPath + 'Kategori.txt');
    //    Result:= kExecuteSQLs(SS, 'Simpan Data Kategori');
    finally
      cRollbackTrans;
    //  SS.Free;
    end;
end;

end.
