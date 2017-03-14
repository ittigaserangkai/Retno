unit ufrmDialogUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, StdCtrls,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogUser = class(TfrmMasterDialog)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    edtLogin: TEdit;
    edtPassword: TEdit;
    edtConfirm: TEdit;
    edtFullName: TEdit;
    cbbStatus: TComboBox;
    edtDescription: TEdit;
    cbbGroup: TComboBox;
    Label1: TLabel;
    edtUbahPO: TEdit;
    Label2: TLabel;
    cbbOtoQtySo: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure edtUbahPOKeyPress(Sender: TObject; var Key: Char);
    procedure edtUbahPOChange(Sender: TObject);
  private
    FIsProcessSuccessfull: boolean;
    FFormMode: TFormMode;
    FUserId: integer;
    FGrupId: array of Integer;
    FNamaLama: string;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure SetUserId(const Value: integer);
    function SaveUser: boolean;
    function UpdateUser: boolean;
    procedure showDataEdit;
    procedure prepareAddData;
    procedure LoadDataGrup;
  public
    function CekDataExist(aNama:String): Boolean;
    property NamaLama: string read FNamaLama write FNamaLama;
    { Public declarations }
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property UserId: integer read FUserId write SetUserId;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogUser: TfrmDialogUser;
  iUbahPO: Integer;

implementation

uses uConn, DB, uTSCommonDlg, uRetnoUnit, ufrmUser;

{$R *.dfm}

function TfrmDialogUser.CekDataExist(aNama:String): Boolean;
var
  sSQL: string;
begin
//  Result := False;
  sSQL := 'Select * from AUT$USER '
        + 'where USR_USERNAME = ' +QuotedStr(aNama);
//  with cOpenQuery(sSQL) do
//  begin
//    if recordcount>0 then
//    Result := True
//    else
//    Result := False;
//  end
end;

procedure TfrmDialogUser.SetFormMode(const Value: TFormMode);
begin
  FFormMode:= Value;
end;

procedure TfrmDialogUser.SetIsProcessSuccessfull(const Value: boolean);
begin
  FIsProcessSuccessfull:= Value;
end;

procedure TfrmDialogUser.SetUserId(const Value: integer);
begin
  FUserId:= Value;
end;

function TfrmDialogUser.SaveUser: boolean;
var
  ssSQL: TStrings;
   //arrParam : TArr;
   //sSQL1,sSQL2: String;
begin
  result := false;
  if edtLogin.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('LOGIN');
    edtLogin.SetFocus;
    Exit;
  end;

  if edtPassword.Text<>edtConfirm.Text then
  begin
    CommonDlg.ShowError('Confirmation password not valid');
    edtPassword.SetFocus;
    Exit;
  end;

  if CekDataExist(edtLogin.Text) then
  begin
    if NamaLama <> edtLogin.Text then
    begin
      CommonDlg.ShowError('Login Name Telah Digunakan');
      Exit;
    end
  end;

//  if not assigned(User) then
//    User := TUser.Create;
//  UserId:= User.NextUserId;

 { // set param for table user
  SetLength(arrParam,8);
  arrParam[0].tipe := ptInteger;
  arrParam[0].data := UserId;
  arrParam[1].tipe := ptInteger;
  arrParam[1].data := DialogUnit;
  arrParam[2].tipe := ptString;
  arrParam[2].data := edtFullName.Text;
  arrParam[3].tipe := ptString;
  arrParam[3].data := edtLogin.Text;
  arrParam[4].tipe := ptString;
  arrParam[4].data := edtPassword.Text;
  arrParam[5].tipe := ptInteger;
  arrParam[5].data := cbbStatus.ItemIndex;
  arrParam[6].tipe := ptString;
  arrParam[6].data := edtDescription.Text;
  arrParam[7].tipe := ptInteger;
  arrParam[7].data := StrToInt(edtUbahPO.Text);
  //input data to table user
  User.InputDataUser(arrParam);

  // set param for table user_group
  SetLength(arrParam,4);
  arrParam[0].tipe := ptInteger;
  arrParam[0].data := UserId;
  arrParam[1].tipe := ptInteger;
  arrParam[1].data := DialogUnit;
  arrParam[2].tipe := ptInteger;
  arrParam[2].data := FGrupId[cbbGroup.ItemIndex];
  arrParam[3].tipe := ptInteger;
  arrParam[3].data := DialogUnit;
  //input data to table user_group
  result := User.InputDataGroupUser(arrParam);}
  ssSQL := TStringList.Create;
  ssSQL.Add('INSERT INTO AUT$USER(USR_ID,USR_UNT_ID,USR_FULLNAME, '
        + ' USR_USERNAME,USR_PASSWD,USR_STATUS,USR_DESCRIPTION,OTOQTYPO,MAXUBAHPO) '
        + 'VALUES('
        + IntToStr(UserId) +','
        + IntToStr(DialogUnit)+','
        + QuotedStr(edtFullName.Text) +','
        + QuotedStr(edtLogin.Text)+','
        + QuotedStr(edtPassword.Text)+','
        + IntToStr(cbbStatus.ItemIndex)+','
        + QuotedStr(edtDescription.Text)+','
        + IntToStr(cbbOtoQtySo.ItemIndex)+','
        + IntToStr(iUbahPO)+')');
//  ssSQL.SaveToFile('E:\Destin\Neko2\SQL.TXT');
  ssSQL.Add('INSERT INTO AUT$USER_GROUP(UG_USR_ID,UG_USR_UNT_ID,UG_GRO_ID,UG_GRO_UNT_ID) '
        + 'VALUES('
        + IntToStr(UserId) +','
        + IntToStr(DialogUnit)+','
        + IntToStr(FGrupId[cbbGroup.ItemIndex])+','
        + IntToStr(DialogUnit)+')');
  {try
    if kExecuteSQLs(User.GetHeaderFlag, ssSQL) then
    begin
      if SimpanBlob(ssSQL,1) then
      begin
        cCommitTrans;
        CommonDlg.ShowMessage('Berhasil Menyimpan Data');
//        btnShowPOClick(Self);
        Result := True;
      end else begin
        cRollbackTrans;
        CommonDlg.ShowError('Gagal Menyimpan Data');
        Result := False;
      end;
    end else begin
      cRollbackTrans;
      CommonDlg.ShowError('Gagal Menyimpan Data');
      Result := False;
    end;
  finally
    cRollbackTrans;
    ssSQL.Free;
  end;  }
end;

function TfrmDialogUser.UpdateUser: boolean;
var //arrParam : TArr;
  ssSQL: TStrings;
begin
  result := false;
  if edtLogin.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('LOGIN');
    edtLogin.SetFocus;
    Exit;
  end;

  if edtPassword.Text<>edtConfirm.Text then
  begin
    CommonDlg.ShowError('Confirmation password not valid');
    edtPassword.SetFocus;
    Exit;
  end;

  
  if CekDataExist(edtLogin.Text) then
  begin
    if NamaLama <> edtLogin.Text then
    begin
      CommonDlg.ShowError('Login Name Telah Digunakan');
      Exit;
    end
  end;

  if edtUbahPO.Text='' then
  iUbahPO := 0;

  {if not assigned(User) then
    User := TUser.Create;

  // set param for table user
  SetLength(arrParam,8);
  arrParam[0].tipe := ptString;
  arrParam[0].data := edtFullName.Text;
  arrParam[1].tipe := ptString;
  arrParam[1].data := edtLogin.Text;
  arrParam[2].tipe := ptString;
  arrParam[2].data := edtPassword.Text;
  arrParam[3].tipe := ptInteger;
  arrParam[3].data := cbbStatus.ItemIndex;
  arrParam[4].tipe := ptString;
  arrParam[4].data := edtDescription.Text;
  arrParam[5].tipe := ptInteger;
  arrParam[5].data := StrToInt(edtUbahPO.Text);
  arrParam[6].tipe := ptInteger;
  arrParam[6].data := UserId;
  arrParam[7].tipe := ptInteger;
  arrParam[7].data := DialogUnit;
  //update data in table user
  User.UpdateDataUser(arrParam);

  // set param for table user_group
  SetLength(arrParam,4);
  arrParam[0].tipe := ptInteger;
  arrParam[0].data := FGrupId[cbbGroup.ItemIndex];
  arrParam[1].tipe := ptInteger;
  arrParam[1].data := DialogUnit;
  arrParam[2].tipe := ptInteger;
  arrParam[2].data := UserId;
  arrParam[3].tipe := ptInteger;
  arrParam[3].data := DialogUnit;
  //update data in table user_group
  result := User.UpdateDataGroupUser(arrParam);}

  ssSQL := TStringList.Create;
  ssSQL.Add('UPDATE AUT$USER SET USR_FULLNAME='+QuotedStr(edtFullName.Text)
           +' ,USR_USERNAME='+QuotedStr(edtLogin.Text)
           +' ,USR_PASSWD='+ QuotedStr(edtPassword.Text)
           +' ,USR_STATUS='+ IntToStr(cbbStatus.ItemIndex)
           +' ,USR_DESCRIPTION='+ QuotedStr(edtDescription.Text)
           +' ,MAXUBAHPO='+ IntToStr(iUbahPO)
           +' ,OTOQTYPO='+ IntToStr(cbbOtoQtySo.ItemIndex)
           +' WHERE (USR_ID='+ IntToStr(UserId)
           +' AND USR_UNT_ID='+ IntToStr(DialogUnit) +')');
  ssSQL.Add('UPDATE AUT$USER_GROUP SET UG_GRO_ID='+IntToStr(FGrupId[cbbGroup.ItemIndex])
           +' ,UG_GRO_UNT_ID=' +IntToStr(DialogUnit)
           +' WHERE (UG_USR_ID='+ IntToStr(UserId)
           +' AND UG_USR_UNT_ID='+ IntToStr(DialogUnit)+')');
  {
  try
    if kExecuteSQLs(User.GetHeaderFlag ,ssSQL) then
    begin
      if SimpanBlob(ssSQL,1) then
      begin
        cCommitTrans;
        CommonDlg.ShowMessage('Berhasil Menyimpan Data');
//        btnShowPOClick(Self);  
        Result := True;
      end else begin
        cRollbackTrans;
        CommonDlg.ShowError('Gagal Menyimpan Data');
        Result := False;
      end;
    end else begin
      cRollbackTrans;
      CommonDlg.ShowError('Gagal Menyimpan Data');
      Result := False;
    end;
  finally
    cRollbackTrans;
    ssSQL.Free;
  end;
  }
end;

procedure TfrmDialogUser.showDataEdit;
var data : TDataSet;
    i    : Integer;
begin
//  if not assigned(User) then
//    User := TUser.Create;
//  data:= User.SearchDataUser(UserId);
//  edtLogin.Text         := data.fieldbyname('USR_USERNAME').AsString;
//  edtPassword.Text      := data.fieldbyname('USR_PASSWD').AsString;
//  edtConfirm.Text       := data.fieldbyname('USR_PASSWD').AsString;
//  edtFullName.Text      := data.fieldbyname('USR_FULLNAME').AsString;
//  edtDescription.Text   := data.fieldbyname('USR_DESCRIPTION').AsString;
//  cbbStatus.ItemIndex   := data.fieldbyname('USR_STATUS').AsInteger;
//  cbbOtoQtySo.ItemIndex := data.fieldbyname('OTOQTYPO').AsInteger;
//  edtUbahPO.Text        := IntToStr(data.fieldbyname('MAXUBAHPO').AsInteger);
//  for i:=(cbbGroup.Items.Count-1) downto 0 do
//  begin
//    cbbGroup.ItemIndex:= i;
//    if cbbGroup.Text=data.fieldbyname('GRO_NAME').AsString then
//      Break;
//  end;
end;

procedure TfrmDialogUser.prepareAddData;
begin
  edtLogin.Clear;
  edtPassword.Clear;
  edtConfirm.Clear;
  edtFullName.Clear;
  edtDescription.Clear;
  cbbStatus.ItemIndex:=0;
  cbbGroup.ItemIndex:=0;

  edtUbahPO.Text := '0';
end;

procedure TfrmDialogUser.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:= caFree;
end;

procedure TfrmDialogUser.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogUser:= nil;
end;

procedure TfrmDialogUser.LoadDataGrup;
var data : TDataSet;
    i    : Integer;
begin
//  if not assigned(User) then
//    User := TUser.Create;
//  data:= User.GetDataUserGrupByUnt(DialogUnit);
//  SetLength(FGrupId,data.RecordCount);
//  cbbGroup.Items.Clear;
//  for i:=0 to data.RecordCount-1 do
//  begin
//    cbbGroup.Items.Add(data.fieldbyname('GRO_NAME').AsString);
//    FGrupId[i]:= data.fieldbyname('GRO_ID').AsInteger;
//    data.Next;
//  end;
end;

procedure TfrmDialogUser.FormShow(Sender: TObject);
begin
  inherited;
  LoadDataGrup;
  if (FFormMode = fmEdit) then
    showDataEdit
  else
    prepareAddData();
  edtLogin.SetFocus;
end;

procedure TfrmDialogUser.footerDialogMasterbtnSaveClick(Sender: TObject);
begin
  inherited;
  if (FormMode = fmAdd) then
  begin
    FIsProcessSuccessfull := SaveUser;
    if FIsProcessSuccessfull then
      Close;
  end
  else
  begin
    FIsProcessSuccessfull := UpdateUser;
    if FIsProcessSuccessfull then
      Close;
  end; // end if
end;

procedure TfrmDialogUser.edtUbahPOKeyPress(Sender: TObject; var Key: Char);
begin
//  inherited;
//  if not (Key in ['0'..'9',Chr(VK_DELETE), Chr(VK_BACK)]) then
  if not (CharInSet(Key, ['0'..'9',Chr(VK_DELETE), Chr(VK_BACK)])) then
    Key := #0
end;

procedure TfrmDialogUser.edtUbahPOChange(Sender: TObject);
begin
//  inherited;
   iUbahPO := StrToInt(edtUbahPO.Text)
end;

end.
