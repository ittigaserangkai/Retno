unit ufrmDialogPersonalMember;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCurrencyEdit, Vcl.StdCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, ufraFooterDialog3Button, DB, System.Actions, Vcl.ActnList,
  AdvCombo, ColCombo;

type
  TFormMode = (fmAdd, fmEdit);

  TModul = (mPopUpPersonalMember, mDialogMemberShip);
  
  TfrmDialogPersonalMember = class(TfrmMasterDialog)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    dtLahir: TcxDateEdit;
    edtTempatLhr: TEdit;
    edtNoIdentts: TEdit;
    edtAlamat: TEdit;
    edtRt: TEdit;
    edtKecamatan: TEdit;
    edtKelurahan: TEdit;
    edtRw: TEdit;
    edtKota: TEdit;
    edtPostCode: TEdit;
    edtTelp: TEdit;
    edtJmlTanggungan: TEdit;
    pnl3: TPanel;
    lbl4: TLabel;
    lbl5: TLabel;
    edtMemberName: TEdit;
    edtCardNo: TEdit;
    cbbGender: TComboBox;
    cbbWarganegara: TComboBox;
    cbpAgama0: TColumnComboBox;
    cbbStatus: TComboBox;
    edtPndptn: TcxCurrencyEdit;
    cbpAgama: TComboBox;
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtJmlTanggunganKeyPress(Sender: TObject; var Key: Char);
    procedure edtMemberNameKeyPress(Sender: TObject; var Key: Char);
    procedure edtCardNoKeyPress(Sender: TObject; var Key: Char);
    procedure cbbWarganegaraKeyPress(Sender: TObject; var Key: Char);
    procedure edtTempatLhrKeyPress(Sender: TObject; var Key: Char);
    procedure dtLahirKeyPress(Sender: TObject; var Key: Char);
    procedure edtNoIdenttsKeyPress(Sender: TObject; var Key: Char);
    procedure cbbGenderKeyPress(Sender: TObject; var Key: Char);
    procedure cbpAgamaKeyPress(Sender: TObject; var Key: Char);
    procedure edtAlamatKeyPress(Sender: TObject; var Key: Char);
    procedure edtRtKeyPress(Sender: TObject; var Key: Char);
    procedure edtRwKeyPress(Sender: TObject; var Key: Char);
    procedure edtKelurahanKeyPress(Sender: TObject; var Key: Char);
    procedure edtKecamatanKeyPress(Sender: TObject; var Key: Char);
    procedure edtKotaKeyPress(Sender: TObject; var Key: Char);
    procedure edtPostCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtTelpKeyPress(Sender: TObject; var Key: Char);
    procedure edtPndptnKeyPress(Sender: TObject; var Key: Char);
    procedure cbbStatusKeyPress(Sender: TObject; var Key: Char);
  private
    FAgama: String;
    FAgamaID: String;
    { Private declarations }
    FModul: TModul;
    function checkEmpty(): Boolean;
    function UpdateMember(): Boolean;
    procedure SendPersonalIdentity;
//    procedure LoadDropDownData(ACombo: TColumnComboBox; AColsOfData: Integer);
    procedure ParseDataPersonalMember(AId: Integer);
    procedure SetModul(const Value: TModul);
  public
    { Public declarations }
    FormMode: TFormMode;
    MemberID,
    FRow: Integer;
    dataAgama, dataStatus: TDataSet;
    IsProcessSuccessfull: Boolean;
    function GetIndexAgama(aNamaAgama:String): Integer;
    property Agama: String read FAgama write FAgama;
    property AgamaID: String read FAgamaID write FAgamaID;
  published
    property  Modul: TModul read FModul write SetModul;
  end;

var
  frmDialogPersonalMember: TfrmDialogPersonalMember;

implementation

uses uTSCommonDlg, uConstanta, ufrmDialogMemberShip, uRetnoUnit;

{$R *.dfm}

//procedure TfrmDialogPersonalMember.LoadDropDownData(ACombo: TColumnComboBox;
//  AColsOfData: Integer);
//begin
//  {Flush the old data}
//  ACombo.ClearGridData;
//
//  {Make sure the allocated storage is big enough}
//  if AColsOfData < 1 then AColsOfData := 1;
//  ACombo.RowCount := AColsOfData+1;
//  ACombo.ColCount := 3;
//
//  {Load the data}
//  if Acombo = cbpAgama then
//  begin
//    ACombo.AddRow(['','RELIGION']);
//
//    if dataAgama.RecordCount > 0 then
//    begin
//      while not dataAgama.Eof do
//      begin
//        try
//          ACombo.AddRow([dataAgama.FieldByName('AGAMA_ID').AsString,
//                         dataAgama.FieldByName('AGAMA_NAME').AsString]);
//        except
//        end;
//        dataAgama.Next;
//      end; //END WHILE
//    end //END <> NIL
//    else
//    begin
//      ACombo.AddRow([' ',' ',' ']);
//    end;
//  end;
//
//  {Now shring the grid so its just big enough for the data}
//  ACombo.SizeGridToData;
//  //trik to activate acombo
//  ACombo.FixedRows := 1;
//end;

function TfrmDialogPersonalMember.UpdateMember(): Boolean;
var
//   arrParam: TArr;
    tempTanggungan: Integer;
    tempPndptn: Currency;
begin
  //init
  Result := False;

  try
    tempTanggungan := StrToInt(edtJmlTanggungan.Text);
  except
    tempTanggungan := 0;
  end;

  try
    tempPndptn := edtPndptn.Value;
  except
    tempPndptn := 0;
  end;

  {
  if not (checkEmpty()) then Exit;
  if not Assigned(MemberShip) then MemberShip := TMemberShip.Create;

  SetLength(arrParam,20);
  arrParam[0].tipe := ptString;
  arrParam[0].data := edtMemberName.Text;
  arrParam[1].tipe := ptString;
  arrParam[1].data := cbbWarganegara.ItemIndex;
  arrParam[2].tipe := ptString;
  arrParam[2].data := edtTempatLhr.Text;
  arrParam[3].tipe := ptDateTime;
  arrParam[3].data := dtLahir.Date;
  arrParam[4].tipe := ptString;
  arrParam[4].data := edtNoIdentts.Text;
  arrParam[5].tipe := ptString;
  arrParam[5].data := cbbGender.ItemIndex;
  arrParam[6].tipe := ptString;
  arrParam[6].data := cbpAgama.ItemIndex + 1;
  arrParam[7].tipe := ptString;
  arrParam[7].data := edtAlamat.Text;
  arrParam[8].tipe := ptString;
  arrParam[8].data := edtRt.Text;
  arrParam[9].tipe := ptString;
  arrParam[9].data := edtRw.Text;
  arrParam[10].tipe := ptString;
  arrParam[10].data := edtKelurahan.Text;
  arrParam[11].tipe := ptString;
  arrParam[11].data := edtKecamatan.Text;
  arrParam[12].tipe := ptString;
  arrParam[12].data := edtKota.Text;
  arrParam[13].tipe := ptString;
  arrParam[13].data := edtPostCode.Text;
  arrParam[14].tipe := ptString;
  arrParam[14].data := edtTelp.Text;
  arrParam[15].tipe := ptString;
  arrParam[15].data := cbbStatus.ItemIndex;
  arrParam[16].tipe := ptString;
  arrParam[16].data := tempTanggungan;
  arrParam[17].tipe := ptCurrency;
  arrParam[17].data := tempPndptn;
  arrParam[18].tipe := ptString;
  arrParam[18].data := FLoginId;
  arrParam[19].tipe := ptString;
  arrParam[19].data := MemberID;

  Result := MemberShip.UpdatePersonal(arrParam); }
end;

function TfrmDialogPersonalMember.checkEmpty(): Boolean;
begin
  Result := True;
  //checking for empty field
  if cbbWarganegara.Text = '' then
  begin
    CommonDlg.ShowErrorEmpty('WARGA NEGARA');
    cbpAgama.SetFocus;
    Result:= False;
    Exit;
  end
  else if cbpAgama.Text = '' then
  begin
    CommonDlg.ShowErrorEmpty('AGAMA');
    cbpAgama.SetFocus;
    Result:= False;
    Exit;
  end
  else if cbbGender.Text = '' then
  begin
    CommonDlg.ShowErrorEmpty('GENDER');
    cbbGender.SetFocus;
    Result:= False;
    Exit;
  end
  else if cbbStatus.Text = '' then
  begin
    CommonDlg.ShowErrorEmpty('STATUS');
    cbbStatus.SetFocus;
    Result:= False;
    Exit;
  end
end;

procedure TfrmDialogPersonalMember.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  if not (checkEmpty) then Exit;

  if Modul = mPopUpPersonalMember then
    IsProcessSuccessfull := UpdateMember
  else if Modul = mDialogMemberShip then
    SendPersonalIdentity;
  Close;
end;

procedure TfrmDialogPersonalMember.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogPersonalMember := nil;
  frmDialogPersonalMember.Free;
end;

procedure TfrmDialogPersonalMember.FormShow(Sender: TObject);
var // arrParam: TArr;
  sSQL: String;
begin
  inherited;
//  if not Assigned(MemberShip) then MemberShip := TMemberShip.Create;

  sSQL := 'SELECT AGAMA_ID, AGAMA_NAME FROM REF$AGAMA ORDER BY AGAMA_ID';
//  cQueryToComboObject(cbpAgama,sSQL);

  ParseDataPersonalMember(MemberID);
end;

procedure TfrmDialogPersonalMember.edtJmlTanggunganKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', Chr(VK_DELETE), Chr(VK_BACK)]) then Key := #0;
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;
  Key   := UpCase(Key);  
end;

function TfrmDialogPersonalMember.GetIndexAgama(aNamaAgama:String): Integer;
var
  sSQL: String;
begin
  //Result := 0;
  sSQL := 'select a.AGAMA_ID '
       + ' from REF$AGAMA a where a.AGAMA_NAME = '
       + QuotedStr(aNamaAgama);
  {with cOpenQuery(sSQL) do
  Begin
    Try
      Result := Fields[0].AsInteger;
    Finally
      Free;
    End;
  End;}
end;

procedure TfrmDialogPersonalMember.ParseDataPersonalMember(AId: Integer);
var
//   arrParam: TArr;
    dataPersonalMember: TDataSet;
begin
  {
  if not Assigned(MemberShip) then
    MemberShip := TMemberShip.Create;

  SetLength(arrParam, 1);
  arrParam[0].tipe := ptInteger;
  arrParam[0].data := AId;

  dataPersonalMember := MemberShip.GetListDetilPersonal(arrParam);

  if not dataPersonalMember.IsEmpty then
  begin
    edtMemberName.Text   := dataPersonalMember.FieldByName('MEMBER_NAME').AsString;
    edtCardNo.Text       := dataPersonalMember.FieldByName('MEMBER_CARD_NO').AsString;
    cbbWarganegara.ItemIndex := dataPersonalMember.FieldByName('MEMBER_IS_WNI').AsInteger;
    edtTempatLhr.Text        := dataPersonalMember.FieldByName('MEMBER_PLACE_OF_BIRTH').AsString;
    dtLahir.Date         := dataPersonalMember.FieldByName('MEMBER_DATE_OF_BIRTH').AsDateTime;
    edtNoIdentts.Text    := dataPersonalMember.FieldByName('MEMBER_KTP_NO').AsString;
    cbbGender.ItemIndex  := dataPersonalMember.FieldByName('MEMBER_SEX').AsInteger;
    cbpAgama.ItemIndex   := GetIndexAgama(dataPersonalMember.FieldByName('AGAMA_NAME').AsString) - 1;
    edtAlamat.Text       := dataPersonalMember.FieldByName('MEMBER_ADDRESS').AsString;
    edtRt.Text           := dataPersonalMember.FieldByName('MEMBER_RT').AsString;
    edtRw.Text           := dataPersonalMember.FieldByName('MEMBER_RW').AsString;
    edtKelurahan.Text    := dataPersonalMember.FieldByName('MEMBER_KELURAHAN').AsString;
    edtKecamatan.Text    := dataPersonalMember.FieldByName('MEMBER_KECAMATAN').AsString;
    edtKota.Text         := dataPersonalMember.FieldByName('MEMBER_KOTA').AsString;
    edtPostCode.Text     := dataPersonalMember.FieldByName('MEMBER_POST_CODE').AsString;
    edtTelp.Text         := dataPersonalMember.FieldByName('MEMBER_TELP').AsString;
    cbbStatus.ItemIndex  := dataPersonalMember.FieldByName('MEMBER_IS_MARRIED').AsInteger;
    edtJmlTanggungan.Text := dataPersonalMember.FieldByName('MEMBER_JML_TANGGUNGAN').AsString;
    edtPndptn.Value       := dataPersonalMember.FieldByName('MEMBER_PENDAPATAN').AsCurrency;
  end; }
end;

procedure TfrmDialogPersonalMember.SetModul(const Value: TModul);
begin
  FModul := Value;
end;

procedure TfrmDialogPersonalMember.SendPersonalIdentity;
begin
  {
  frmDialogMemberShip.strgGrid1.Cells[0, FRow]:= edtCardNo.Text;
  frmDialogMemberShip.strgGrid1.Cells[1, FRow]:= edtMemberName.Text;
  frmDialogMemberShip.strgGrid1.Cells[4, FRow]:= IntToStr(cbbWarganegara.ItemIndex);
  frmDialogMemberShip.strgGrid1.Cells[5, FRow]:= edtTempatLhr.Text;
  frmDialogMemberShip.strgGrid1.Cells[6, FRow]:= FloatToStr(dtLahir.Date); // DateToStr(dtLahir.Date);
  frmDialogMemberShip.strgGrid1.Cells[7, FRow]:= edtNoIdentts.Text;
  frmDialogMemberShip.strgGrid1.Cells[8, FRow]:= IntToStr(cbbGender.ItemIndex);
  frmDialogMemberShip.strgGrid1.Cells[9, FRow]:= cbpAgama.Text;
  frmDialogMemberShip.strgGrid1.Cells[29, FRow]:= IntToStr(cbpAgama.ItemIndex);
  frmDialogMemberShip.strgGrid1.Cells[10, FRow]:= edtAlamat.Text;
  frmDialogMemberShip.strgGrid1.Cells[11, FRow]:= edtRt.Text;
  frmDialogMemberShip.strgGrid1.Cells[12, FRow]:= edtRw.Text;
  frmDialogMemberShip.strgGrid1.Cells[13, FRow]:= edtKelurahan.Text;
  frmDialogMemberShip.strgGrid1.Cells[14, FRow]:= edtKecamatan.Text;
  frmDialogMemberShip.strgGrid1.Cells[15, FRow]:= edtKota.Text;
  frmDialogMemberShip.strgGrid1.Cells[16, FRow]:= edtPostCode.Text;
  frmDialogMemberShip.strgGrid1.Cells[17, FRow]:= edtTelp.Text;
  frmDialogMemberShip.strgGrid1.Cells[18, FRow]:= IntToStr(cbbStatus.ItemIndex);
  frmDialogMemberShip.strgGrid1.Cells[19, FRow]:= edtJmlTanggungan.Text;
  frmDialogMemberShip.strgGrid1.Cells[20, FRow]:= CurrToStr(edtPndptn.Value);
  }
end;

procedure TfrmDialogPersonalMember.edtMemberNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;
  Key := UpCase(Key);

end;

procedure TfrmDialogPersonalMember.edtCardNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;
  Key := UpCase(Key);

end;

procedure TfrmDialogPersonalMember.cbbWarganegaraKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;
  Key := UpCase(Key);

end;

procedure TfrmDialogPersonalMember.edtTempatLhrKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;
  Key := UpCase(Key);

end;

procedure TfrmDialogPersonalMember.dtLahirKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;
  Key := UpCase(Key);

end;

procedure TfrmDialogPersonalMember.edtNoIdenttsKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;
  Key := UpCase(Key);

end;

procedure TfrmDialogPersonalMember.cbbGenderKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;
  Key := UpCase(Key);

end;

procedure TfrmDialogPersonalMember.cbpAgamaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;
  Key := UpCase(Key);

end;

procedure TfrmDialogPersonalMember.edtAlamatKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;
  Key := UpCase(Key);

end;

procedure TfrmDialogPersonalMember.edtRtKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;
  Key := UpCase(Key);

end;

procedure TfrmDialogPersonalMember.edtRwKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;
  Key := UpCase(Key);

end;

procedure TfrmDialogPersonalMember.edtKelurahanKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;
  Key := UpCase(Key);

end;

procedure TfrmDialogPersonalMember.edtKecamatanKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;
  Key := UpCase(Key);

end;

procedure TfrmDialogPersonalMember.edtKotaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;
  Key := UpCase(Key);

end;

procedure TfrmDialogPersonalMember.edtPostCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;
  Key := UpCase(Key);

end;

procedure TfrmDialogPersonalMember.edtTelpKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;
  Key := UpCase(Key);

end;

procedure TfrmDialogPersonalMember.edtPndptnKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;
  Key := UpCase(Key);

end;

procedure TfrmDialogPersonalMember.cbbStatusKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;
  Key := UpCase(Key);

end;

end.


