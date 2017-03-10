unit ufrmDialogKuponBotol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, SUIForm,
  StdCtrls, ComCtrls, JvDateTimePicker, Grids, BaseGrid, AdvGrid, Mask,
  JvToolEdit, JclStrings, JvEdit, AdvCGrid,
  AdvEdit, AdvEdBtn, uNewKuponBotol, JvExStdCtrls, JvValidateEdit, AdvObj,
  JvExMask;

type
  TFormMode = (fmAdd, fmEdit);
  TfrmDialogKuponBotol = class(TfrmMasterDialog)
    pnl1: TPanel;
    pnl2: TPanel;
    lbl1: TLabel;
    Label1: TLabel;
    edtNoTransaction: TEdit;
    lblComboGrid: TLabel;
    Label2: TLabel;
    edtMemberName: TEdit;
    dtpTanggal: TJvDateEdit;
    strgGrid: TAdvColumnGrid;
    Label3: TLabel;
    edtDescription: TEdit;
    Panel1: TPanel;
    lbl2: TLabel;
    curredtTotalPrice: TJvValidateEdit;
    edtMemberCode: TAdvEditBtn;
    procedure FormShow(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure strgGridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure edtMemberCodeChange(Sender: TObject);
    procedure strgGridCellValidate(Sender: TObject; ACol, ARow: Integer;
      var Value: String; var Valid: Boolean);
    procedure edtMemberCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtDescriptionKeyPress(Sender: TObject; var Key: Char);
    procedure edtMemberCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridKeyPress(Sender: TObject; var Key: Char);
    procedure strgGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridEllipsClick(Sender: TObject; ACol, ARow: Integer;
      var S: String);
    procedure edtMemberCodeClickBtn(Sender: TObject);
    procedure edtMemberCodeEnter(Sender: TObject);
    procedure edtMemberCodeExit(Sender: TObject);
    procedure strgGridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure footerDialogMasterbtnCloseClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FIsProcessSuccessfull : boolean;
    FFormMode             : TFormMode;
    FVoucherID            : Integer;
    FKuponBtlOld          : TKuponBotolNew;
    FNewKuponBotol        : TKuponBotolNew;
    function LookUpGalon(ARow: Integer): TStrings;
    procedure LookUpMember;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure PrepareAdd;
    procedure PrepareEdit;
    procedure ParseHeaderGrid;
//    procedure PrintKuponBotol(KodeTrans: String);
    function SaveKuponBotol: boolean;
    function SumColAdvColGrd(advColGrd : TAdvColumnGrid; ColVal, ColParm: Integer;
                              sFltr : string): Double ;
    procedure HitungHargaRow(ARow : Integer);
    procedure HitungTotalItem;


  public
    TotalQty: Currency;
    NoTransaksi: String;
    MemberId: Integer;
    function IsiRow(APLUSat: TStrings; ARow: Integer): Boolean;
    procedure ResetRow(ARow: Integer);
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
    property VoucherID: Integer read FVoucherID write FVoucherID;
  end;

var
  frmDialogKuponBotol: TfrmDialogKuponBotol;

implementation

uses uKuponBotol, ufrmSearchProduct, ufrmSearchMember, uConn,
  uSearchMember, DB, uGTSUICommonDlg,  ufrmKuponBotol, uAssgros,
  uSpell, ufrmDialogPrintPreview, uRMSUnit, uNewBarang, uNewBarangHargaJual,
  StrUtils, uNewMembership;

const
  _KolPLU                 : Integer = 0;
  _KolNmBrg               : Integer = 1;
  _KolUom                 : Integer = 2;
  _KolQty                 : Integer = 3;
  _KolHrg                 : Integer = 4;
  _KolDisc                : Integer = 5;
  _KolHrgKrgDisc          : Integer = 6;
  _KolHrgTotal            : Integer = 7;
  _KolIDOld               : Integer = 8;

{$R *.dfm}

function TfrmDialogKuponBotol.SumColAdvColGrd(advColGrd : TAdvColumnGrid; ColVal,
                              ColParm: Integer;  sFltr : string): Double ;
var
  i: Integer;

begin
  Result := 0;

  for i := advColGrd.FixedRows to advColGrd.RowCount - 1 do
  begin
    if Trim(advColGrd.Cells[ColParm, i]) <> sFltr then
      Result := Result + advColGrd.Floats[ColVal,i];
  end;
end;


procedure TfrmDialogKuponBotol.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogKuponBotol.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogKuponBotol.PrepareAdd;
var
  sSQL: string;
//  data: TResultDataSet;
begin
  VoucherID := 0;
  dtpTanggal.Date:= cGetServerTime;

//  with TKuponBotolNew.Create(Self,FLoginId,dialogunit) do
//  begin
//    try
      NoTransaksi := FNewKuponBotol.GenerateVoucherNo(dtpTanggal.Date,dialogunit);
//    finally
//    	Free;
//    end;
//  end;
  edtNoTransaction.Text := NoTransaksi;

  edtMemberCode.Clear;
  edtMemberName.Clear;
  edtMemberCode.Text := getGlobalVar('POS_DEF_CUST');

  sSQL := 'SELECT MEMBER_ID, MEMBER_CARD_NO, MEMBER_NAME, TPMEMBER_NAME '
    + 'FROM MEMBER '
    + ' INNER JOIN REF$TIPE_MEMBER ON (TPMEMBER_ID=MEMBER_TPMEMBER_ID) '
    + ' WHERE MEMBER_UNT_ID = ' + IntToStr(dialogunit)
    + ' AND (MEMBER_IS_ACTIVE = 1) '
    + ' AND MEMBER_CARD_NO = ' + Quot(edtMemberCode.Text);

  with cOpenQuery(sSQL) do
  begin
    try
      if not Eof then
      begin
        edtMemberName.Text := FieldByName('MEMBER_NAME').AsString;
        MemberID := FieldByName('MEMBER_ID').AsInteger;
      end;
    finally
      Free;
    end;
  end;

//  if not data.IsEmpty then
//  try
//    begin
//      edtMemberName.Text := data.FieldByName('MEMBER_NAME').AsString;
//      MemberID := data.FieldByName('MEMBER_ID').AsInteger;
//    end;
//  finally
//    FreeAndNil(data);
//  end;

  edtDescription.Clear;
  ParseHeaderGrid;

  edtMemberCode.SetFocus;
end;

procedure TfrmDialogKuponBotol.PrepareEdit;
var
  cEnter: Char;
	sSQL      : string;
  unit_id,i : Integer;
//  data: TResultDataSet;
begin
  FNewKuponBotol.LoadByNO(NoTransaksi, dialogunit);

  FKuponBtlOld := TKuponBotolNew.CreateWithUser(self, FLoginId, FLoginUnitId);
  FKuponBtlOld.LoadByNO(NoTransaksi, dialogunit);

  edtMemberCode.Text := FKuponBtlOld.Member.CardNo; 
  cEnter := #13;
  edtMemberCodeKeyPress(edtMemberCode, cEnter);

  VoucherID := 0;
  ParseHeaderGrid;

  unit_id := dialogunit;
  sSQL := 'SELECT * '
  	+ 'FROM TRANS_KUPON_BOTOL '
    + ' INNER JOIN MEMBER ON (MEMBER_ID=TKB_MEMBER_ID) AND (MEMBER_UNT_ID=TKB_MEMBER_UNT_ID) '
    + ' WHERE TKB_NO = ' + Quot(NoTransaksi)
    + ' AND TKB_UNT_ID = ' + IntToStr(unit_id);

  with cOpenQuery(sSQL) do
  begin
    try
      if not Eof then
      begin
        dtpTanggal.Date       := fieldByName('TKB_DATE').AsDateTime;
        edtNoTransaction.Text := NoTransaksi;
        edtMemberCode.Text    := fieldbyName('MEMBER_CARD_NO').AsString;
        edtMemberName.Text    := fieldbyName('MEMBER_NAME').AsString;
        edtDescription.Text   := fieldbyName('TKB_DESCRIPTION').AsString;
      end;
    finally
      Free;
    end;
  end;

//	try
//    if not (data.IsEmpty) then
//    begin
//      dtpTanggal.Date := data.fieldByName('TKB_DATE').AsDateTime;
//      edtNoTransaction.Text := NoTransaksi;
//      edtMemberCode.Text := data.fieldbyName('MEMBER_CARD_NO').AsString;
//      edtMemberName.Text := data.fieldbyName('MEMBER_NAME').AsString;
//      edtDescription.Text := data.fieldbyName('TKB_DESCRIPTION').AsString;
//    end;
//  finally
//    FreeAndNil(data);
//  end;

  sSQL := 'SELECT * '
  	+ 'FROM TRANS_KUPON_BOTOL_DETIL '
    + ' INNER JOIN BARANG ON (BRG_CODE=TKBD_BRG_CODE)  '
    + ' WHERE TKBD_TKB_NO = ' + Quot(NoTransaksi)
    + ' AND TKBD_TKB_UNT_ID = ' + IntToStr(unit_id);

  with cOpenQuery(sSQL) do
  begin
    try
      with strgGrid do
      begin
        i := 1;
        while not Eof do
        begin
          Cells[_KolPLU,i]        := fieldByName('TKBD_BRG_CODE').AsString;
          Cells[_KolNmBrg,i]      := fieldByName('BRG_ALIAS').AsString;
          Cells[_KolUom,i]        := fieldByName('TKBD_SAT_CODE').AsString;
          Cells[_KolQty,i]        := CurrToStr(fieldByName('TKBD_QTY').AsCurrency);
          Cells[_KolHrg,i]        := FormatFloat('#,##0.00',
                                      fieldByName('TKBD_SELL_PRICE').AsCurrency);
          Cells[_KolDisc,i]       := FormatFloat('#,##0.00',
                                      fieldByName('TKBD_DISC').AsCurrency);
          Cells[_KolHrgKrgDisc,i] := FormatFloat('#,##0.00',
                                      fieldByName('TKBD_SELL_PRICE_DISC').AsCurrency);
          Cells[_KolHrgTotal,i]   := FormatFloat('#,##0.00',
                                      fieldByName('TKBD_TOTAL_SELL_PRICE_DISC').AsCurrency);
          Cells[_KolIDOld, i]      := fieldByName('TKBD_ID').AsString;
          Next;
          i := i + 1;
        end;
        FloatingFooter.ColumnCalc[_KolQty]      := acSUM;
        FloatingFooter.ColumnCalc[_KolHrgTotal] := acSUM;

        AutoSize  := true;

        curredtTotalPrice.Value := SumColAdvColGrd(strgGrid, _KolHrgTotal,
                                      _KolPLU, '');
        ColWidths[_KolIDOld]    := 0;
      end;

    finally
      Free;
    end;
  end;
  VoucherID := 1;



//  try
//    if not (data.IsEmpty) then
//    begin
//      with strgGrid do
//      begin
//        i := 1;
//        data.First;
//        while not data.Eof do
//        begin
//          Cells[_KolPLU,i]        := data.fieldByName('TKBD_BRG_CODE').AsString;
//          Cells[_KolNmBrg,i]      := data.fieldByName('BRG_ALIAS').AsString;
//          Cells[_KolUom,i]        := data.fieldByName('TKBD_SAT_CODE').AsString;
//          Cells[_KolQty,i]        := CurrToStr(data.fieldByName('TKBD_QTY').AsCurrency);
//          Cells[_KolHrg,i]        := FormatFloat('#,##0.00',
//                                      data.fieldByName('TKBD_SELL_PRICE').AsCurrency);
////          Alignments[4,i] := taRightJustify;
//          Cells[_KolDisc,i]       := FormatFloat('#,##0.00', data.fieldByName('TKBD_DISC').AsCurrency);
////          Alignments[5,i] := taRightJustify;
//          Cells[_KolHrgKrgDisc,i] := FormatFloat('#,##0.00', data.fieldByName('TKBD_SELL_PRICE_DISC').AsCurrency);
////          Alignments[6,i] := taRightJustify;
//          Cells[_KolHrgTotal,i] := FormatFloat('#,##0.00', data.fieldByName('TKBD_TOTAL_SELL_PRICE_DISC').AsCurrency);
////          Alignments[7,i] := taRightJustify;
//
//
////          Alignments[3,RowCount-1] := taRightJustify;
////          TotalQty := StrToCurr(Cells[3,RowCount-1]);
//
////          Alignments[7,RowCount-1] := taRightJustify;
////          curredtTotalPrice.Value := StrToCurr(Cells[7,RowCount-1]);
//
////            Alignments[_KolPLU, i]        := taLeftJustify;
////            Alignments[_KolNmBrg, i]      := taLeftJustify;
////            Alignments[_KolUom, i]        := taLeftJustify;
////            Alignments[_KolQty, i]        := taRightJustify;
////            Alignments[_KolHrg, i]        := taRightJustify;
////            Alignments[_KolDisc, i]       := taRightJustify;
////            Alignments[_KolHrgKrgDisc, i] := taRightJustify;
////            Alignments[_KolHrgTotal, i]   := taRightJustify;
//
//          // hidden;
////          Cells[10,i] := CurrToStr(data.fieldByName('TKBD_SELL_PRICE').AsCurrency);
////          Cells[11,i] := CurrToStr(data.fieldByName('TKBD_DISC').AsCurrency);
////          Cells[12,i] := CurrToStr(data.fieldByName('TKBD_SELL_PRICE_DISC').AsCurrency);
////          Cells[13,i] := CurrToStr(data.fieldByName('TKBD_TOTAL_SELL_PRICE_DISC').AsCurrency);
//          Cells[_KolIDOld, i] := data.fieldByName('TKBD_ID').AsString;
//          data.Next;
//          i := i + 1;
//        end;
//        FloatingFooter.ColumnCalc[_KolQty]      := acSUM;
//        FloatingFooter.ColumnCalc[_KolHrgTotal] := acSUM;
//
//        AutoSize  := true;
//
//        curredtTotalPrice.Value := SumColAdvColGrd(strgGrid, _KolHrgTotal,
//                                      _KolPLU, '');
//        ColWidths[_KolIDOld]    := 0;
//      end;
//
//    end;
//	finally
//    FreeAndNil(data);
//  end;
//  VoucherID := 1;
end;

procedure TfrmDialogKuponBotol.FormShow(Sender: TObject);
//var
//	sSQL: string;
//  data: TResultDataSet;
//  intUnitID: Integer;
begin
  inherited;
  if FormMode = fmAdd then
    PrepareAdd
  else
    PrepareEdit;

end;

procedure TfrmDialogKuponBotol.ParseHeaderGrid;
begin
  with strgGrid do
  begin
    Clear;
    RowCount := 22;
    Cells[_KolPLU, 0]         := 'PLU';
    Cells[_KolNmBrg, 0]       := 'PRODUCT NAME';
    Cells[_KolUom, 0]         := 'UOM';
    Cells[_KolQty, 0]         := 'QTY';
    Cells[_KolHrg, 0]         := 'SELL PRICE';
    Cells[_KolDisc, 0]        := 'DISC (Rp)';
    Cells[_KolHrgKrgDisc, 0]  := 'SELL PRICE DISC';
    Cells[_KolHrgTotal,0]     := 'TOTAL PRICE';

    ColCount := ColCount + 1;
    ColWidths[_KolIDOld] := 0;
    FixedRows := 1;
    FixedCols := 0;
  end;
end;

procedure TfrmDialogKuponBotol.footerDialogMasterbtnSaveClick(
  Sender: TObject);
//    arrParam: TArr;
//    countI: Integer;
begin

  if edtMemberName.Text = '' then
  begin
    CommonDlg.ShowErrorEmpty('MEMBER');
    edtMemberCode.SetFocus;
    edtMemberCode.SelectAll;
    Exit;
  end;

  if (curredtTotalPrice.Value < 1) then
  begin
    CommonDlg.ShowError('There is no transaction is open.');
    edtMemberCode.SetFocus;
    edtMemberCode.SelectAll;
    exit;
  end;
  {
  if not Assigned(KuponBotol) then
    KuponBotol := TKuponBotol.Create;

  if FormMode=fmAdd then
  begin
    IsProcessSuccessfull := SaveKuponBotol;
    PrintKuponBotol(edtNoTransaction.Text);
  end
  else
  begin
    IsProcessSuccessfull := UpdateKuponBotol;
  end;
  }

  if not IsValidDateKarenaEOD(dialogunit,dtpTanggal.Date,FMasterIsStore) then
    Begin
    Exit;
    Close;
    End;

  IsProcessSuccessfull := SaveKuponBotol;
  if IsProcessSuccessfull then
  begin
    CommonDlg.ShowConfirmSuccessfull(atAdd);
    Close;
  end;

end;

procedure TfrmDialogKuponBotol.strgGridCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  if ACol in [0,3] then
    CanEdit := True
  else
    CanEdit := False;
end;

procedure TfrmDialogKuponBotol.edtMemberCodeChange(Sender: TObject);
begin
  inherited;
  edtMemberName.Clear;
end;

procedure TfrmDialogKuponBotol.strgGridCellValidate(Sender: TObject; ACol,
  ARow: Integer; var Value: String; var Valid: Boolean);
var
  sKodeUom  : string;
  iNcount   : Integer;
  sKOdeBrg  : string;
  i         : Integer;
  lstStr    : TStrings;
//  iQty          : Integer;
//  dTotal        : Double;
//  dHargaJualDisc: Double;
//  dDiscNominal  : Double;
//  dHargaJual    : Double;
//  iTmp          : integer;

begin
  inherited;   
  lstStr := TStringList.Create;
  try
    case ACol of
    0: begin
  //      with strgGrid do
  //      begin



          lstStr.Add(StrPadLeft(trim(Value),6,'0'));
          lstStr.Add(strgGrid.Cells[_KolUom, ARow]);
          Valid  := IsiRow(lstStr, ARow);
  //      end;
        sKOdeBrg  := 'inisialisasi';
        sKodeUom  := 'inisialisasi';

        if  trim(Value) <> '' then
        begin
          sKOdeBrg  := StrPadLeft((trim(Value)),6,'0');
          Value     := StrPadLeft((trim(Value)),6,'0');
        end;

        if  trim(strgGrid.Cells[_KolUom, ARow]) <> '' then
          sKodeUom := trim(strgGrid.Cells[_KolUom, ARow]);

        iNcount   := 0;
        for i := strgGrid.FixedRows to strgGrid.RowCount - 1 do
        begin
          if (Trim(strgGrid.Cells[_KolPLU, i]) = sKOdeBrg) and
              (Trim(strgGrid.Cells[_KolUom, i]) = sKodeUom) then
            Inc(iNcount);

          if iNcount > 1 then
          begin
            CommonDlg.ShowMessage('Ada data barang dengan UOM yang sama');
            iNcount := 0;
            ResetRow(ARow);
            Valid   := False;
          end;
        end;

       end;
    3: begin
  //      with strgGrid do
  //      begin
  //        if TryStrToInt(Value, iTmp) then
  //          Ints[_KolQty, ARow] := iTmp;
  //        else
  //        begin
  //          Value := '1';
  //          iTmp  := 1;
  //        end;
  //      end;
        HitungHargaRow(ARow);
        strgGrid.Col      := _KolPLU;
        strgGrid.Col      := _KolQty;
        strgGrid.EditMode := False;

      end;
    5: begin
  //      with strgGrid do
  //      begin
  //        if TryStrToInt(Value, iTmp) then
  //          Ints[_KolQty, ARow] := iTmp
  //        else
  //          Value := '1';
  //
  //      end;

      end;
    end;
  finally
    lstStr.Free;
  end;


  HitungHargaRow(ARow);
  HitungTotalItem;
end;

procedure TfrmDialogKuponBotol.edtMemberCodeKeyPress(Sender: TObject;
  var Key: Char);
var dataMember: TResultDataSet;
    arrParam: TArr;
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    SetLength(arrParam,1);
    arrParam[0].tipe := ptString;
    arrParam[0].data := edtMemberCode.Text;
    dataMember := SearchMember.GetListMemberbyCode(arrParam);
    if not (dataMember.IsEmpty) then
    begin
      edtMemberCode.Text := dataMember.FieldByName('MEMBER_CARD_NO').AsString;
      edtMemberName.Text := dataMember.FieldByName('MEMBER_NAME').AsString;
      MemberID := dataMember.FieldByName('MEMBER_ID').AsInteger;
      edtDescription.SetFocus;
      edtDescription.SelectAll;
    end
    else
    begin
      CommonDlg.ShowError('Member is not active or not valid.');
      edtMemberCode.SetFocus;
      edtMemberCode.SelectAll;
    end;
  end;
end;

procedure TfrmDialogKuponBotol.edtDescriptionKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key=Chr(VK_RETURN)) then
  begin
    with strgGrid do
    begin
      Row := 1;
      Col := 0;
      SetFocus;
    end;
  end;
end;

procedure TfrmDialogKuponBotol.edtMemberCodeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
//var
//  isValid: integer;
begin
  if (Key = VK_F5) then
  begin
    {if not Assigned(frmDialogSearchMember) then
      frmDialogSearchMember := TfrmDialogSearchMember.Create(Application);

    if frmDialogSearchMember.IsProcessSuccessfull = True then
    begin
      isValid := StrToInt(frmDialogSearchMember.strgGrid.Cells[6,frmDialogSearchMember.strgGrid.Row]);
      if (isValid = 1) then
      begin
        edtMemberCode.Text := frmDialogSearchMember.strgGrid.Cells[0,frmDialogSearchMember.strgGrid.Row];
        edtMemberName.Text := frmDialogSearchMember.strgGrid.Cells[1,frmDialogSearchMember.strgGrid.Row];
        MemberID := StrToInt(frmDialogSearchMember.strgGrid.Cells[2,frmDialogSearchMember.strgGrid.Row]);
        edtDescription.SetFocus;
        edtDescription.SelectAll;
      end
      else
      begin
        CommonDlg.ShowError('Member is not valid.');
        edtMemberCode.Text := '';
        edtMemberName.Text := '';
        MemberId := 0;
        edtMemberCode.SetFocus;
      end;
    end;

    frmDialogSearchMember.Free;
    }
    edtMemberCodeClickBtn(nil);
  end;
end;

procedure TfrmDialogKuponBotol.LookUpMember;
var
  i: Integer;
  chKey: Char;
  sSQL: string;
begin
  sSQL := 'SELECT MEMBER_NAME, MEMBER_CARD_NO, MEMBER_ADDRESS '
    + 'FROM MEMBER '
    + 'WHERE MEMBER_UNT_ID = ' + IntToStr(dialogunit);  
  with cLookUp('Daftar Member',sSQL) do
  begin
    try
      if Strings[0] <> '' then
      begin
        edtMemberCodeEnter(edtMemberCode);
        edtMemberCode.Text := Strings[1];
        chKey := Chr(VK_RETURN);
        edtMemberCodeKeyPress(Self,chKey);
      end
      else
      begin
        for i := strgGrid.FixedRows to strgGrid.RowCount - 1 do
        begin
          ResetRow(i);
        end;        
      end;
    finally
      Free;
    end;
  end;    // with;
end;

procedure TfrmDialogKuponBotol.strgGridKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (strgGrid.Col in [3,5]) then
  begin
    if not (Key in ['0'..'9', ',', Chr(VK_BACK)]) then
      Key := #0
  end;

end;

procedure TfrmDialogKuponBotol.strgGridKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
//var
//  curTotal: Currency;
begin
  if (Key = VK_F5) then
  begin
    with strgGrid do
    begin
      if (Col = 0) then
      begin
        IsiRow(LookUpGalon(strgGrid.Row),strgGrid.Row);
      end;
    end;
  end
end;

function TfrmDialogKuponBotol.SaveKuponBotol: boolean;
var
  aidx            : Integer;
//  aNewKuponBotol  : TKuponBotolNew;
//  unit_id,
  i, j    : integer;
//  isSuccessHeader,
//  isSuccessDetil  : boolean;
//  cDecSep         : Char;
  sDateFormat     : string;
  dDiscNominalVw,
  dQty,
  dHargaJualVw,
  dHargaJualDiscVw,
  dTotalVw        : Double;
  sPlu, sUOM      : string;
  iIDOld          : integer;

begin
//  Result := false;
//  cDecSep := DecimalSeparator;
  sDateFormat := FormatSettings.ShortDateFormat;
//  FKuponBtlOld.KuponBotolItems.LoadByNO(edtNoTransaction.Text, dialogunit);

  if FKuponBtlOld <> nil then
  begin
    for i := strgGrid.FixedRows to strgGrid.RowCount - 1 do
    begin
      j := 0;
      while j < FKuponBtlOld.KuponBotolItems.Count do
      begin
        iIDOld  := FKuponBtlOld.KuponBotolItems[j].ID;

        if (iIDOld = strgGrid.Ints[_KolIDOld, i]) and
                  (Trim(strgGrid.Cells[_KolPLU, i]) <> '')  then
        begin
          FKuponBtlOld.KuponBotolItems.Delete(j);
          j := - 1;
        end;
        Inc(j);
      end;
    end;
  end;


  if not IsValidDateKarenaEOD(dialogunit,dtpTanggal.Date,FMasterIsStore) then
  Begin
    Result := false;
    Exit;
  End;

  try
    if FKuponBtlOld <> nil then
    begin
      if FKuponBtlOld.KuponBotolItems.Count <> 0 then
      begin
        if not FKuponBtlOld.RemoveFromDBItem(NoTransaksi ,dialogunit) then
        begin
          cRollbackTrans;
        end
        else
        begin
          cCommitTrans;
        end;
      end;
    end;
    finally
      cRollbackTrans;
    end;


//  aNewKuponBotol:= TKuponBotolNew.Create(Self,FLoginId,dialogunit);
  with FNewKuponBotol do
  begin
      KuponBotolItems.Clear;

      TotalQty  := 0;
      for aidx := 1 to Pred(strgGrid.RowCount) do
      begin
        if (strgGrid.Cells[_KolPLU,aidx] <> '')
            and (StrToInt(strgGrid.Cells[_KolQty,aIdx]) > 0) then
        begin
          TotalQty := TotalQty +  strgGrid.Floats[_KolQty,aidx];
        end;
      end;

      UpdateData(dtpTanggal.Date,edtDescription.Text,VoucherID,0,MemberId,
                  edtNoTransaction.Text,
                 TotalQty,curredtTotalPrice.Value,'OPEN',dialogunit);

      with strgGrid do
      begin
        for aidx := 1 to Pred(RowCount) do
        begin
          if (Cells[_KolPLU,aidx] <> '')
            and (StrToInt(Cells[_KolQty,aIdx]) > 0) then
          begin

//            DecimalSeparator  := ',';
            sPlu              := Cells[_KolPLU,aidx];
            dDiscNominalVw    := Floats[_KolDisc,aidx];
            dQty              := Floats[_KolQty,aidx];
            sUOM              := Cells[_KolUom,aIdx];
            dHargaJualVw      := Floats[_KolHrg,aIdx];
            dHargaJualDiscVw  := Floats[_KolHrgKrgDisc,aidx];
            dTotalVw          := Floats[_KolHrgTotal,aidx];

            if Trim(Cells[_KolIDOld, aidx]) = '' then
              iIDOld := 0
            else
              iIDOld := Ints[_KolIDOld, aidx];

//            DecimalSeparator := '.';

            UpdateKuponBotolItems( sPlu, dDiscNominalVw, 0, dQty, sUOM,
                dHargaJualVw, dHargaJualDiscVw, dTotalVw,
                dialogunit, FLoginId, iIDOld);

          end;
        end;
      end;

      Result := SaveToDB;

      if Result then
      begin
        cCommitTrans;
      end
      else
      begin
        cRollbackTrans;
      end;
  end;

//  DecimalSeparator := cDecSep;
  FormatSettings.ShortDateFormat := sDateFormat;

end;


//procedure TfrmDialogKuponBotol.PrintKuponBotol(KodeTrans: String);
//var
//  arrParam  : TArr;
//  dataKuponBotol : TResultDataSet;
//  ParamList : TStringList;
//  MySpell   : TSpell;
//begin
//
//  if not Assigned(KuponBotol) then
//    KuponBotol := TKuponBotol.Create;
//
//  if not Assigned(mySpell) then
//     mySpell := TSpell.Create;
//
//  SetLength(arrParam,1);
//  arrParam[0].tipe := ptString;
//  arrParam[0].data := KodeTrans;
//  dataKuponBotol := KuponBotol.searchKuponBotol(arrParam);
//
//  ParamList := TStringList.Create;
////  ParamList.Add(DateToStr(MasterAgreement.getServerDate)); //0
//  ParamList.Add(FLoginUsername); //0
//  DateSeparator:= '/';
//  ParamList.Add(FormatDateTime('dd/mm/yyyy', dtpTanggal.Date)); //1
//  ParamList.Add(KodeTrans); //2
//  ParamList.Add(dataKuponBotol.FieldByName('MEMBER_CARD_NO').AsString); //3
//
////  if dataKuponBotol.FieldByName('TKB_IS_PRINTED').Value = 1 then
////     ParamList.Add('<<<< ( Cetak Ulang ) >>>>') //4
////  else
//  ParamList.Add(''); //4
//
//  ParamList.Add(mySpell.Spell(CurrToStr(curredtTotalPrice.Value)) + ' Rupiah'); // 5
//  ParamList.Add(FDialogUnitName);
//
//  if not Assigned(frmDialogPrintPreview) then
//    frmDialogPrintPreview := TfrmDialogPrintPreview.Create(Application);
//  frmDialogPrintPreview.FilePath := FFilePathReport + 'frCetakKuponBotol.fr3';
//  frmDialogPrintPreview.ListParams := ParamList;
//  frmDialogPrintPreview.RecordSet := dataKuponBotol;
//  SetFormPropertyAndShowDialog(frmDialogPrintPreview);
//
//  frmDialogPrintPreview.Free;
//
//  FreeAndNil(ParamList);
//end;

procedure TfrmDialogKuponBotol.strgGridEllipsClick(Sender: TObject; ACol,
  ARow: Integer; var S: String);
var
//  bValid: Boolean;
  lstPLU: TStrings;
begin
  inherited;
  if ACol = 0 then
  begin
    lstPLU := LookUpGalon(ARow);
    S := lstPLU[0];
    strgGrid.Cells[_KolUom, ARow]:= lstPLU[1];
    lstPLU.Free;
//    S := LookUpGalon(ARow);
  end;

end;

procedure TfrmDialogKuponBotol.edtMemberCodeClickBtn(Sender: TObject);
begin
  inherited;
  LookUpMember;
end;

procedure TfrmDialogKuponBotol.edtMemberCodeEnter(Sender: TObject);
begin
  inherited;
  if edtMemberCode.Tag = 0 then
  begin
    edtMemberCode.Font.Style := [];
    edtMemberCode.Font.Color := clWindowText;
    edtMemberCode.Clear;
    edtMemberCode.Tag := 1;
  end;
end;

procedure TfrmDialogKuponBotol.edtMemberCodeExit(Sender: TObject);
begin
  inherited;
  if Trim(edtMemberCode.Text) = '' then
  begin
    edtMemberCode.Font.Style := [fsItalic];
    edtMemberCode.Font.Color := clSilver;
    edtMemberCode.Text := '[Input Card Number]';
    edtMemberCode.Tag := 0;
  end;
end;

function TfrmDialogKuponBotol.IsiRow(APLUSat: TStrings; ARow: Integer): Boolean;
var
//  dTotal: Double;
//  dHargaJualDisc: Double;
//  dDiscNominal: Double;
//  dHargaJual: Double;
//  iQty: Integer;
  sSQL: string;
begin
  Result := True;
  sSQL:= 'SELECT b.BRG_CODE, b.BRG_ALIAS, '
    + ' B.BRG_MERK, C.BHJ_SAT_CODE, '
    + ' c.BHJ_SELL_PRICE, c.BHJ_DISC_NOMINAL, c.BHJ_SELL_PRICE_DISC '
    + ' FROM BARANG B, BARANG_HARGA_JUAL C '
    + ' WHERE C.BHJ_UNT_ID = ' + IntToStr(dialogunit)
    + ' AND B.BRG_CODE = ' + Quot(APLUSat[0])
//    + ' AND B.BRG_IS_GALON = 1 '
    + ' AND C.BHJ_TPHRG_ID = 2 '
    + ' AND C.BHJ_BRG_CODE = B.BRG_CODE ';

  with cOpenQuery(sSQL) do
  begin
    try
      if not eof then
      begin
        with strgGrid do
        begin
          Cells[_KolPLU,ARow]   := FieldByName('BRG_CODE').AsString;
          Cells[_KolNmBrg,ARow] := FieldByName('BRG_ALIAS').AsString;
          Cells[_KolUom,ARow]   := {APLUSat[1];//}FieldByName('BHJ_SAT_CODE').AsString;

//          if TryStrToInt(Trim(Cells[_KolQty,ARow]), iQty) then
//          begin
//            if iQty = 0 then iQty := 1;
//          end
//          else
//            iQty := 1;

          Cells[_KolHrg,ARow]   := FloatToStr(FieldByName('BHJ_SELL_PRICE').AsFloat);
          Cells[_KolDisc,ARow]  := FloatToStr(FieldByName('BHJ_DISC_NOMINAL').AsFloat);
          cells[_KolQty,ARow]   := '0';
//          HitungHargaRow(ARow);

          Result := True;
        end;
      end
      else
      begin
        ResetRow(ARow);
      end;
    finally
      Free;
    end;
  end;
end;

procedure TfrmDialogKuponBotol.HitungTotalItem;
begin
  strgGrid.FloatingFooter.ColumnCalc[_KolQty] := acSUM;
  strgGrid.FloatingFooter.ColumnCalc[_KolHrgTotal] := acSUM;
  curredtTotalPrice.Value := SumColAdvColGrd(strgGrid, _KolHrgTotal,_KolPLU, '');
end;

procedure TfrmDialogKuponBotol.HitungHargaRow(ARow : Integer);
var
  dTotal          : Double;
  dHargaJualDisc  : Double;
  dDiscNominal    : Double;
  dHargaJual      : Double;
  iQty            : Double;
begin
  iQty            := strgGrid.Ints[_KolQty,ARow];
  dHargaJual      := strgGrid.Floats[_KolHrg,ARow];
  dDiscNominal    := strgGrid.Floats[_KolDisc,ARow];
  dHargaJualDisc  := dHargaJual - dDiscNominal;
  dTotal          := dHargaJualDisc * iQty;

  strgGrid.Cells[_KolHrgKrgDisc,ARow] := FloatToStr(dHargaJualDisc);
  strgGrid.Cells[_KolHrgTotal,ARow] := FloatToStr(dTotal);

end;  

function TfrmDialogKuponBotol.LookUpGalon(ARow: Integer): TStrings;
var
  sSQL      : string;
  lstResult : TStrings;
  sTipeBarang : String;
begin
  sTipeBarang := '0001';
  lstResult := TStringList.create;
  lstResult.Add('');
  lstResult.Add('');

  sSQL:= 'SELECT b.BRG_CODE as PLU, b.BRG_ALIAS as "NAMA BARANG", '
    + ' C.BHJ_SAT_CODE AS UOM, '
    + ' c.BHJ_SELL_PRICE AS "HARGA JUAL" ' //, c.BHJ_DISC_NOMINAL, c.BHJ_SELL_PRICE_DISC '
    + ' FROM BARANG B, BARANG_HARGA_JUAL C,REF$TIPE_BARANG RTB '
    + ' WHERE C.BHJ_UNT_ID = ' + IntToStr(dialogunit)
//    + ' AND B.BRG_IS_GALON = 1 '
    + ' AND C.BHJ_TPHRG_ID = 2 '
    + ' AND C.BHJ_BRG_CODE = B.BRG_CODE '
    + ' AND B.BRG_TPBRG_ID = RTB.TPBRG_ID '
    + ' AND RTB.TPBRG_CODE = ' + Quot(sTipeBarang);

  with cLookUp('DAFTAR GALON', sSQL, 999, 0) do
  begin
    try
      with strgGrid do
      begin
        if Strings[0] <> '' then
        begin
          lstResult.Clear;
          lstResult.Add(Strings[0]);  
          lstResult.Add(Strings[2]);
//          ShowMessage(Strings[1] +', '+ Strings[2]);
          //IsiRow(Strings[0],ARow);
        end;
      end;
    finally
    	// free resources
      Free;
    end;  // try/finally
  end;

  Result:= lstResult;

end;

procedure TfrmDialogKuponBotol.ResetRow(ARow: Integer);
begin
  with strgGrid do
  begin
    Cells[_KolPLU,ARow] := '';
    Cells[_KolNmBrg,ARow] := '';
    Cells[_KolUom,ARow] := '';
    Cells[_KolQty,ARow] := '';
    Cells[_KolHrg,ARow] := '';
    Cells[_KolDisc,ARow] := '';
    Cells[_KolHrgKrgDisc,ARow] := '';
    Cells[_KolHrgTotal,ARow] := '';
  end;
end;

procedure TfrmDialogKuponBotol.strgGridGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  inherited;
  HAlign := taLeftJustify;
  if ARow = 0 then
    HAlign := taCenter
  else
  begin
    if ACol in [_KolQty, _KolHrg, _KolDisc,
      _KolHrgKrgDisc, _KolHrgTotal] then
    begin
      HAlign := taRightJustify
    end;
  end;

end;

procedure TfrmDialogKuponBotol.strgGridGetFloatFormat(Sender: TObject;
  ACol, ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;    
  FloatFormat := '%.3n';
  if (ACol in [_KolQty]) and (ARow > 0) then
    IsFloat := True
  else
  if (ACol in [_KolHrg,_KolDisc,_KolHrgKrgDisc,_KolHrgTotal]) and (ARow > 0) then
  begin
    FloatFormat := '%.2n';
    IsFloat := True;
  end
  else
    IsFloat := False;

//  if ACol in [_KolQty,_KolHrg,_KolDisc,
//    _KolHrgKrgDisc,_KolHrgTotal] then
//  begin
//    FloatFormat := '%.n';
//  end;
end;

procedure TfrmDialogKuponBotol.FormCreate(Sender: TObject);
begin
  inherited;
  FNewKuponBotol:= TKuponBotolNew.CreateWithUser(Self,FLoginId,dialogunit);
end;

procedure TfrmDialogKuponBotol.FormDestroy(Sender: TObject);
begin

  {FreeAndNil(FNewKuponBotol);
  if FKuponBtlOld <> nil then
    FreeAndNil(FKuponBtlOld);

//    FNewKuponBotol.Free ;
//  if FKuponBtlOld <> nil then
//    FKuponBtlOld.Free;
   }
   
end;

procedure TfrmDialogKuponBotol.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //if CommonDlg.Confirm('Anda Yakin Akan Menutup Form Ini ?') = mrYes then
  //begin
    Action := caFree;
    frmDialogKuponBotol := nil;
  //end else begin
  //  Action := caNone;
  //end;
end;

procedure TfrmDialogKuponBotol.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
  if ssCtrl in Shift then
  begin
    if Key = Ord('R') then
    begin
      with strgGrid do
      begin
        if RowCount > 3 then
        begin
          Rows[strgGrid.Row].Clear;
          RemoveSelectedRows;
        end
        else  
        begin
          Rows[strgGrid.Row].Clear;
          RemoveSelectedRows;
          AddRow;
        end
      end;
    end
    else  
    if Key = Ord('T') then
    begin
         strgGrid.AddRow;
    end 
    else if(Key = VK_RETURN) then
    begin
      footerDialogMasterbtnSaveClick(Sender);
    end
  end
//  else if(Key = VK_RETURN)and(ssctrl in Shift) then
//  begin
//    footerDialogMasterbtnSaveClick(Sender);
//  end
  else if Key = VK_ESCAPE then
  begin
    footerDialogMasterbtnCloseClick(Sender);
  end;
end;

procedure TfrmDialogKuponBotol.footerDialogMasterbtnCloseClick(
  Sender: TObject);
begin
  inherited;
  IsProcessSuccessfull := False;
end;

procedure TfrmDialogKuponBotol.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;

end;

end.







