unit ufrmDialogTrader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ExtCtrls, StdCtrls, ComCtrls,
  uRetnoUnit, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, cxTextEdit,
  cxCurrencyEdit, System.Actions, Vcl.ActnList, ufraFooterDialog3Button,
  cxButtonEdit;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogTrader = class(TfrmMasterDialog)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    edtCode: TEdit;
    edtName: TEdit;
    edtAddress: TEdit;
    edtContactPerson: TEdit;
    edtTelp: TEdit;
    edtFax: TEdit;
    edtNPWP: TEdit;
    lbl10: TLabel;
    lbl11: TLabel;
    intedtLeadtime: TcxCurrencyEdit;
    intedtTOP: TcxCurrencyEdit;
    lbl12: TLabel;
    edtDesc: TEdit;
    bvl1: TBevel;
    lbl13: TLabel;
    edtMemberName: TEdit;
    edtMemberCode: TEdit;
    lblComboGrid: TLabel;
    cbpTipeByr: TcxExtLookupComboBox;
    edtTipeByar: TcxButtonEdit;
    Label1: TLabel;
    cbJenis: TComboBox;
    lbl14: TLabel;
    edtCreditLimit: TcxCurrencyEdit;
    procedure actDeleteExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure edtCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtNameKeyPress(Sender: TObject; var Key: Char);
    procedure edtAddressKeyPress(Sender: TObject; var Key: Char);
    procedure edtContactPersonKeyPress(Sender: TObject; var Key: Char);
    procedure edtTelpKeyPress(Sender: TObject; var Key: Char);
    procedure edtFaxKeyPress(Sender: TObject; var Key: Char);
    procedure edtNPWPKeyPress(Sender: TObject; var Key: Char);
    procedure intedtTOPKeyPress(Sender: TObject; var Key: Char);
    procedure edtDescKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edtMemberCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbpTipeByrChange(Sender: TObject);
    procedure edtTipeByarClickBtn(Sender: TObject);
    procedure edtTipeByarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure intedtTOPExit(Sender: TObject);
  private
    FIsProcessSuccessfull: boolean;
    FFormMode: TFormMode;
    FMemberID: Integer;
    FTipeByrId: Integer;
    FTipeByr: string;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    function checkEmpty(): Boolean;
    procedure LoadTipeBayar;
    procedure SetTipeByrId(const Value: Integer);
    procedure SetTipeByr(const Value: string);
  public
    { Public declarations }
    TraderID,MemberId: Integer;
    subCode,MemberCode,MemberName: string;
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
    property TipeBayarId:Integer  read FTipeByrId write SetTipeByrId;
    property TipeBayar:string  read FTipeByr write SetTipeByr;
  end;

var
  frmDialogTrader: TfrmDialogTrader;

implementation

uses uTSCommonDlg, DB, ufrmTrader, uAppUtils;

const
  BOUND_COMBO_TEXT = 7;

{$R *.dfm}

procedure TfrmDialogTrader.actDeleteExecute(Sender: TObject);

var
  aKode: string;
  simpan : Boolean;
begin
  inherited;
  simpan := false;
  if (CommonDlg.Confirm('Are you sure you wish to delete Trader (Trader Code: '+')?') = mrYes) then
  begin
  end;
end;

procedure TfrmDialogTrader.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogTrader.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogTrader := nil;
end;

procedure TfrmDialogTrader.footerDialogMasterbtnSaveClick(
  Sender: TObject);
var
  isTrader: Integer;
  IDLokal: Integer;
begin
  inherited;
  if cbJenis.Text = 'TRADER' then
  begin
    isTrader := 1;
  end
  else begin
    isTrader := 0;
  end;

  if FormMode = fmAdd then
  begin
    IDLokal := 0;
  end
  else begin
  end;
end;

procedure TfrmDialogTrader.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogTrader.SetIsProcessSuccessfull(const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogTrader.edtCodeKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
    edtName.SetFocus;
end;

procedure TfrmDialogTrader.edtNameKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
    edtAddress.SetFocus;
end;

procedure TfrmDialogTrader.edtAddressKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
    edtContactPerson.SetFocus;
end;

procedure TfrmDialogTrader.edtContactPersonKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
    edtTelp.SetFocus;
end;

procedure TfrmDialogTrader.edtTelpKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
    edtFax.SetFocus;
end;

procedure TfrmDialogTrader.edtFaxKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
    edtNPWP.SetFocus;
end;

procedure TfrmDialogTrader.edtNPWPKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
    intedtLeadtime.SetFocus;
end;

function TfrmDialogTrader.checkEmpty(): Boolean;
var
  Data: Integer;
  sSQL: string;
begin
  //init
  Result := True;
    sSQL := 'select max(TRD_ID) from TRADER WHERE TRD_UNT_ID = ' + IntToStr(dialogunit);
   {
   with cOpenQuery(sSQL) do
   begin
     try
      Fields[0].AsInteger := Fields[0].AsInteger
     except
      Fields[0].AsInteger := 1;
     end;
   end;
    }
   edtCode.Text := '133' + TAppUtils.StrPadLeft(IntToStr(data + 1), 5, '0');

end;

procedure TfrmDialogTrader.intedtTOPKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
    edtDesc.SetFocus;
end;

procedure TfrmDialogTrader.edtDescKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
    edtCode.SetFocus;
end;

procedure TfrmDialogTrader.FormShow(Sender: TObject);
var
  sSQL: string;
  IDLokal: Integer;
begin
  LoadTipeBayar;
  edtTipeByar.Text := '';

//  cbpTipeByr.Value := FTipeByr;

  if (FormMode = fmAdd) then
  begin
    if not(checkEmpty) then Exit;
  end
  else if (FormMode = fmEdit) then
  begin
   {
    IDLokal := StrToInt(frmTrader.strgGrid.Cells[14,frmTrader.strgGrid.Row]);

    begin
      sSQL := 'select member_card_no, member_name from member'
              + ' where member_id = ' + QuotedStr(frmTrader.strgGrid.Cells[15,frmTrader.strgGrid.Row])
              + ' and member_unt_id = ' + IntToStr(dialogunit);

      with cOpenQuery(sSQL) do
      begin
        edtMemberCode.Text := fieldByName('member_card_no').AsString;
        edtMemberName.Text := fieldByName('member_name').AsString;
      end;

      edtCode.Text := Trader.Kode;
      edtName.Text := Trader.Nama;
      edtAddress.Text := Trader.Alamat;
      edtFax.Text := Trader.Fax;
      edtContactPerson.Text := Trader.Kontak;
      edtTelp.Text := Trader.Telepon;
      edtNPWP.Text := Trader.NPWP;
      intedtLeadtime.Value := Trader.LeadTime;
      intedtTOP.Value := Trader.TOP;
      edtDesc.Text := Trader.Deskripsi;
      FMemberID := Trader.MemberID;
      FTipeByrId := Trader.TipebayarID;
      
      if FNewTipeBayar.LoadByID(Trader.TipebayarID) then
      begin
        cbpTipeByr.Value := FNewTipeBayar.Nama;
      end;

      if Trader.IsAssgros = 1 then
      begin
        cbJenis.ItemIndex := cbJenis.Items.IndexOf('ASSGROS')
      end
      else begin
        cbJenis.ItemIndex := cbJenis.Items.IndexOf('TRADER')
      end;

    end;
}
  end;

end;

procedure TfrmDialogTrader.edtMemberCodeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sSQL: string;
begin
  inherited;
  if Key = VK_RETURN then
  begin
    sSQL := ' select member_id, member_name from member '
            + ' where MEMBER_CARD_NO = ' + QuotedStr(edtMemberCode.Text)
            + ' and member_unt_id = ' + IntToStr(dialogunit);
    {
    with cOpenQuery(sSQL) do
    begin
      if not Fields[0].IsNull then
      begin
        edtMemberName.Text := FieldByName('MEMBER_NAME').AsString;
        FMemberID := StrToInt(FieldByName('MEMBER_ID').AsString);
      end else
      begin
        edtMemberCode.SelectAll;
        edtMemberName.Text := '';
        FMemberID := 0;
      end;
    end;
     }
  end;
end;

procedure TfrmDialogTrader.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sSQL: string;
begin
  inherited;
  if Key = VK_F5 then
  begin
    sSQL := 'select member_card_no as "NO MEMBER", member_name as "NAMA",member_id as "ID" from member'
            + ' where member_unt_id = ' + IntToStr(dialogunit);

    {with cLookUp('Data Member',sSQL) do
    begin
      if Strings[2] = '' then
      begin
        FMemberID := 0;
        Exit;
      end;

      edtMemberCode.Text := Strings[0];
      edtMemberName.Text := Strings[1];
      FMemberID := StrToInt(Strings[2]);
    end;
     }
  end;
end;

procedure TfrmDialogTrader.cbpTipeByrChange(Sender: TObject);
begin
  inherited;
//  FTipeByrId := StrToInt(cbpTipeByr.Cells[0,cbpTipeByr.Row]);

end;

procedure TfrmDialogTrader.SetTipeByrId(const Value: Integer);
begin
  FTipeByrId := Value;
end;

procedure TfrmDialogTrader.SetTipeByr(const Value: string);
begin
  FTipeByr := Value;
end;

procedure TfrmDialogTrader.edtTipeByarClickBtn(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := 'select TPBYR_NAME as "TIPE PEMBAYARAN", TPBYR_CODE as "KODE", '
          + ' TPBYR_ID as "ID"  from REF$TIPE_PEMBAYARAN';
  {
  with cLookUp('Data Pembayaran',sSQL) do
  begin
    if strings[2] = '' then
    begin
      Exit
    end;

    edtTipeByar.Text := Strings[0];
    FTipeByrId := StrToInt(Strings[2]);

  end;
  }
end;

procedure TfrmDialogTrader.edtTipeByarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F5 then
  begin
   // edtTipeByarClickBtn(Self);
  end;
end;

procedure TfrmDialogTrader.LoadTipeBayar;
//var
//  dataTipeByr: TResultDataSet;
begin
  {dataTipeByr := Trader.GetTipeBayar(dialogunit);
  with cbpTipeByr do
  begin
    ClearGridData;
    RowCount := dataTipeByr.RecordCount + 1;
    ColCount := 2;
    FixedRows := 1;
    AddRow(['ID','TIPE BAYAR']);
    while not dataTipeByr.Eof do
    begin
      AddRow([dataTipeByr.FieldByName('TPBYR_ID').AsString,dataTipeByr.FieldByName('TPBYR_NAME').AsString]);
      dataTipeByr.Next;
    end;
  end;
  }
end;

procedure TfrmDialogTrader.intedtTOPExit(Sender: TObject);
begin
  inherited;
  if (intedtTOP.Value <= 0) then
     edtCreditLimit.Value := 0;
end;

end.




