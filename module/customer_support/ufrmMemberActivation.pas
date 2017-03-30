unit ufrmMemberActivation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, ActnList, Mask,
  System.Actions, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, cxButtonEdit, cxCurrencyEdit,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC;

type
  TfrmMemberActivation = class(TfrmMasterBrowse)
    pnl1: TPanel;
    actlst1: TActionList;
    lblCheckAll: TcxLabel;
    lblClearAll: TcxLabel;
    actMemberActivation: TAction;
    pnl4: TPanel;
    lbl5: TLabel;
    lbl4: TLabel;
    lbl3: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    edtDocStatus: TEdit;
    dtValidFrom: TcxDateEdit;
    dtValidTo: TcxDateEdit;
    dtRegister: TcxDateEdit;
    edtPrintedStatus: TEdit;
    edtCompName: TEdit;
    pnl2: TPanel;
    lbl17: TLabel;
    lbl2: TLabel;
    edtMemberCardFee: TcxCurrencyEdit;
    rbByMember: TRadioButton;
    rbBySelected: TRadioButton;
    edtCardNo: TcxButtonEdit;
    edCompany: TcxButtonEdit;
    mmo1: TMemo;
    procedure actAddExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure lblCheckAllClick(Sender: TObject);
    procedure lblClearAllClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure FormShow(Sender: TObject);
    procedure strgGridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure edtCardNoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCardNoClickBtn(Sender: TObject);
    procedure edtCardNoEnter(Sender: TObject);
    procedure edtCardNoExit(Sender: TObject);
    procedure edCompanyEnter(Sender: TObject);
    procedure edCompanyExit(Sender: TObject);
    procedure edCompanyClickBtn(Sender: TObject);
  private
    dataMemberActivate: TDataSet;
    FJmlBulanValid: Integer;
    untID : Integer;
//    FMemberGrupID: Integer;
    tempCanEdit: Boolean;
//    FMemberGrupName: String;
//    function checkIsValid(dateFrom,dateTo: TDateTime): SmallInt;
    procedure ParseHeaderGrid(jmlData: Integer);
    procedure ParseDataGrid();
    procedure ParseDetailRow(ARow: Integer);
    procedure ClearFormComponent;
    procedure LookUpMember;
    procedure LookUpMemberGrup;
  public
    { Public declarations }
  end;

var
  frmMemberActivation: TfrmMemberActivation;

implementation

uses uTSCommonDlg, uConstanta, ufrmSearchCardNo, DateUtils;

{$R *.dfm}
{
// isi kolom grid
ID CARD NO.
MEMBER NAME
CARD TYPE
TYPE MEMBER
STATUS
}

procedure TfrmMemberActivation.actAddExecute(Sender: TObject);
var
  chkStatue{,ActiveStatue1,ActiveStatue2}: Boolean;
	iIsAktivasi: SmallInt;
	iIsReaktivasi: SmallInt;
	dFeeReaktivasi: Double;
	dFeeAktivasi: Double;
  IsProcessSuccessfull: Boolean;
  intI: Integer;
  MemberID: Integer;
  sPesan : String;
  found : Boolean;
begin
  inherited;
  sPesan := '';
  if dtValidFrom.Date < EncodeDate(2000,12,1) then
  begin
    CommonDlg.ShowError('Date Valid From ' + ER_EMPTY);
    dtValidFrom.SetFocus;
    Exit;
  end;

  if dtValidTo.Date < EncodeDate(2000,12,1) then
  begin
    CommonDlg.ShowError('Date Valid To ' + ER_EMPTY);
    dtValidTo.SetFocus;
    Exit;
  end;
  {
  if not IsValidDateKarenaEOD(masternewunit.id,cGetServerTime,FMasterIsStore) then
    Exit;

  if not Assigned(MemberActivation) then MemberActivation := TMemberActivation.Create;
  IsProcessSuccessfull := False;

  found := False;
  for intI := strgGrid.FixedRows to strgGrid.RowCount-1 do
  begin
    strgGrid.GetCheckBoxState(0,strgGrid.Row,chkStatue);
    if chkStatue then
      found := True;
  end;
  if not found then
  begin
    CommonDlg.ShowError('Tidak ada Member Yang dipilih (check)');
    exit;
  end;

  if strgGrid.RowCount > 1 then
  for intI := 1 to strgGrid.RowCount - 1 do
  begin
    if strgGrid.Cells[1,intI] = '' then Continue;
    if Trim(strgGrid.Cells[5,intI]) = 'ACTIVE' then
    begin
      sPesan :=  sPesan + #13 + 'Status Member : ' + strgGrid.Cells[2,intI] + ' sudah Aktif';
      Continue;
    end;

    strgGrid.SelectRows(intI,1);
    strgGrid.GetCheckBoxState(0,strgGrid.Row,chkStatue);
    MemberID := StrToInt(strgGrid.Cells[6,intI]);

    if chkStatue then
    begin
      with TNewMemberActivation.CreateWithUser(Self,FLoginId,masternewunit.id) do
      begin
        try
					dFeeAktivasi := 0;
          dFeeReaktivasi := 0;
          iIsReaktivasi := 0;
          iIsAktivasi := 0;
          if strgGrid.Cells[14,intI] = '1' then
          begin
            dFeeReaktivasi := StrToFloat(strgGrid.Cells[12,intI]);
            iIsReaktivasi := 1;
          end
          else
          begin
            dFeeAktivasi := StrToFloat(strgGrid.Cells[12,intI]);
            iIsAktivasi := 1;
          end;

          UpdateData(dFeeAktivasi,
          	dFeeReaktivasi,
            0,
            iIsAktivasi,
            StrToInt(strgGrid.Cells[13,intI]),
            iIsReaktivasi,
            MemberID,
            masternewunit.id,
            dtValidFrom.Date,
            dtValidTo.Date);

          if SaveToDB then
          begin
          	IsProcessSuccessfull := Member.SetActiveAndValidSaveToDB;
          end;
        finally
          Free;
        end;
      end;

    end;
  end; // for to do

  if IsProcessSuccessfull then
  begin
    cCommitTrans;
    CommonDlg.ShowConfirmGlobal('Berhasil Menyimpan Data');
	  ClearFormComponent;
  end
  else
  begin
    cRollbackTrans;
    if sPesan <> '' then
      CommonDlg.ShowError('Gagal Menyimpan Data' +sPesan)
    else
      CommonDlg.ShowError('Gagal Menyimpan Data' )
  end;}

end;


procedure TfrmMemberActivation.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmMemberActivation.FormCreate(Sender: TObject);
begin
  inherited;
  {
  arrParam := nil;
  arrVar := ADConn.ExecuteSPAsOne('PR_SYS$GET_UNIT_ID', arrParam, 1);

  untID := arrVar[0];
  }

  untID := masternewunit;
  lblHeader.Caption := 'MEMBER ACTIVATION';
end;

procedure TfrmMemberActivation.FormDestroy(Sender: TObject);
begin
  inherited;
  frmMemberActivation := nil;
end;

procedure TfrmMemberActivation.ParseDataGrid;
var intI: Integer;
  sSQL: string;
begin
  {if not Assigned(MemberActivation) then MemberActivation := TMemberActivation.Create;

  if rbByMember.Checked then
  begin
    sSQL := 'SELECT MB.*, MA.*, TM.TPMEMBER_NAME, '
      + 'TM.TPMEMBER_FEE_REACTIVASI, TM.TPMEMBER_FEE_ACTIVASI, '
      + 'GM.GROMEMBER_NAME, GM.GROMEMBER_IS_COMPLETE '
      + 'FROM MEMBER MB '
      + ' INNER JOIN REF$TIPE_MEMBER TM ON TM.TPMEMBER_ID = MB.MEMBER_TPMEMBER_ID '
      + ' INNER JOIN REF$GRUP_MEMBER GM ON GM.GROMEMBER_ID = MB.MEMBER_GROMEMBER_ID '
      + '   AND GM.GROMEMBER_UNT_ID = MB.MEMBER_GROMEMBER_UNT_ID '
      + ' LEFT OUTER JOIN MEMBER_ACTIVASI MA ON MA.MEMBERACT_MEMBER_ID = MB.MEMBER_ID '
      + '   AND MA.MEMBERACT_MEMBER_UNT_ID = MB.MEMBER_UNT_ID '
      + '   AND MA.MEMBERACT_ID IN '
      + '     (SELECT MAX(MEMBERACT_ID) FROM MEMBER_ACTIVASI '
      + '      WHERE MEMBERACT_MEMBER_ID = MB.MEMBER_ID'
      + '        AND MEMBERACT_MEMBER_UNT_ID = MB.MEMBER_UNT_ID) '
      + 'WHERE MB.MEMBER_UNT_ID = ' + IntToStr(masternewunit.id)
      + ' AND MB.MEMBER_CARD_NO = ' + Quot(edtCardNo.Text)
      //+ ' AND MB.MEMBER_IS_ACTIVE = 1 '
      //+ ' AND MB.MEMBER_IS_VALID = 0 '
      //+ ' AND GM.GROMEMBER_ID = ' + IntToStr(FMemberGrupID)
      + ' ORDER BY MB.MEMBER_CARD_NO asc, MA.MEMBERACT_ID desc';
  end
  else
  begin
    sSQL := 'SELECT MB.*, MA.*, TM.TPMEMBER_NAME, '
      + 'TM.TPMEMBER_FEE_REACTIVASI, TM.TPMEMBER_FEE_ACTIVASI, '
      + 'GM.GROMEMBER_NAME, GM.GROMEMBER_IS_COMPLETE '
      + 'FROM MEMBER MB '
      + ' INNER JOIN REF$TIPE_MEMBER TM ON TM.TPMEMBER_ID = MB.MEMBER_TPMEMBER_ID '
      + ' INNER JOIN REF$GRUP_MEMBER GM ON GM.GROMEMBER_ID = MB.MEMBER_GROMEMBER_ID '
      + '   AND GM.GROMEMBER_UNT_ID = MB.MEMBER_GROMEMBER_UNT_ID '
      + ' LEFT OUTER JOIN MEMBER_ACTIVASI MA ON MA.MEMBERACT_MEMBER_ID = MB.MEMBER_ID '
      + '   AND MA.MEMBERACT_MEMBER_UNT_ID = MB.MEMBER_UNT_ID '
      + '   AND MA.MEMBERACT_ID IN '
      + '     (SELECT MAX(MEMBERACT_ID) FROM MEMBER_ACTIVASI '
      + '      WHERE MEMBERACT_MEMBER_ID = MB.MEMBER_ID'
      + '        AND MEMBERACT_MEMBER_UNT_ID = MB.MEMBER_UNT_ID) '
      + 'WHERE MB.MEMBER_UNT_ID = ' + IntToStr(masternewunit.id)
      //+ ' AND MB.MEMBER_CARD_NO = ' + Quot(edtCardNo.Text)
      //+ ' AND MB.MEMBER_IS_ACTIVE = 1 '
      //+ ' AND MB.MEMBER_IS_VALID = 0 '
      + ' AND GM.GROMEMBER_NAME = ' + Quot(edCompany.Text)
      + ' ORDER BY MB.MEMBER_CARD_NO asc, MA.MEMBERACT_ID desc';
  
  end;

  dataMemberActivate := cOpenQuery(sSQL);
  if not dataMemberActivate.Eof then
  begin
    dataMemberActivate.Last;
    dataMemberActivate.First;
  end;

  ParseHeaderGrid(dataMemberActivate.RecordCount);

  if dataMemberActivate.RecordCount > 0 then
  begin
    //initiate
    intI := 1;
    dataMemberActivate.First;

    while not(dataMemberActivate.Eof) do
    begin
      with strgGrid do
      begin
        AddCheckBox(0,intI,False,False);

        tempCanEdit := True;
        
        Cells[1,intI] := dataMemberActivate.FieldByName('MEMBER_CARD_NO').AsString;
        Cells[2,intI] := dataMemberActivate.FieldByName('MEMBER_NAME').AsString;

        if dataMemberActivate.FieldByName('MEMBER_IS_MAIN').AsInteger = 1 then
          Cells[3,intI] := 'MAIN'
        else
          Cells[3,intI] := 'SUPLEMEN';

        Cells[4,intI] := dataMemberActivate.FieldByName('TPMEMBER_NAME').AsString;

        if dataMemberActivate.FieldByName('MEMBER_IS_ACTIVE').AsInteger = 1 then
        begin
          Cells[5,intI] := 'ACTIVE';
        end
        else
        begin
          Cells[5,intI] := 'NOT ACTIVE';
        end;

        Cells[6,intI] := dataMemberActivate.FieldByName('MEMBER_ID').AsString;
        Cells[7,intI] := dataMemberActivate.FieldByName('GROMEMBER_NAME').AsString;
        if dataMemberActivate.FieldByName('GROMEMBER_IS_COMPLETE').AsInteger = 1 then
          Cells[8,intI] := 'COMPLETE'
        else
          Cells[8,intI] := 'INCOMPLETE';

        Cells[9,intI] := '0';
        if not dataMemberActivate.FieldByName('MEMBER_REGISTERED_DATE').IsNull then
          Cells[9,intI] := DateToStr(dataMemberActivate.FieldByName('MEMBER_REGISTERED_DATE').AsDateTime);
          
        Cells[10,intI] := '0';
        if not dataMemberActivate.FieldByName('MEMBERACT_VALID_DATE_FROM').IsNull then
          Dates[10,intI] := dataMemberActivate.FieldByName('MEMBERACT_VALID_DATE_FROM').AsDateTime;

        Cells[11,intI] := '0';
        if not dataMemberActivate.FieldByName('MEMBERACT_VALID_DATE_TO').IsNull then
          Dates[11,intI] := dataMemberActivate.FieldByName('MEMBERACT_VALID_DATE_TO').AsDateTime;

        if dataMemberActivate.FieldByName('MEMBERACT_IS_ACTIVASI').Value = Null then
        begin
          Cells[12,intI] := dataMemberActivate.FieldByName('TPMEMBER_FEE_ACTIVASI').AsString;
          Cells[14, intI] := '0'; // bagus ubah karena kebalik
        end
        else
        begin
          Cells[12,intI] := dataMemberActivate.FieldByName('TPMEMBER_FEE_REACTIVASI').AsString;
          Cells[14, intI] := '1';
        end;

        Cells[13,intI] := IntToStr(dataMemberActivate.FieldByName('MEMBERACT_IS_PRINT_CARD').AsInteger);
        Cells[15,intI] := dataMemberActivate.FieldByName('MEMBER_IS_VALID').AsString;
      end; //end with string grid

      dataMemberActivate.Next;
      Inc(intI);
    end; //end while not eof
    ParseDetailRow(1);
  end; // end if recordcount

  strgGrid.AutoSize := true;
  strgGrid.FixedRows := 1;
  strgGrid.AutoSizeColumns(True, 5);
  }
end;

procedure TfrmMemberActivation.ParseHeaderGrid(jmlData: Integer);
begin
  {
  with strgGrid do
  begin
    Clear;
    RowCount := jmlData + 1;
    ColCount := 6;
    Cells[0,0] := '';
    Cells[1,0] := 'ID CARD NO.';
    Cells[2,0] := 'MEMBER NAME';
    Cells[3,0] := 'CARD TYPE';
    Cells[4,0] := 'MEMBER TYPE';
    Cells[5,0] := 'STATUS';

    if jmlData < 1 then
    begin
      RowCount := 2;
      AddCheckBox(0,1,False,False);
      Cells[1,1] := '';
      Cells[2,1] := '';
      Cells[3,1] := '';
      Cells[4,1] := '';
      Cells[5,1] := '';
      Cells[6,1] := '0'; //ID
      Cells[7,1] := ''; //COMP/GROMEMBER NAME
      Cells[8,1] := ''; //DOC STAT
      Cells[9,1] := '0'; //REG DATE
      Cells[10,1] := '0'; //VLD FROM
      Cells[11,1] := '0'; //VLD TO
      Cells[12,1] := '0'; //CARD FEE
      Cells[13,1] := ''; //PRINTD STAT
    end;

    FixedRows := 1;
    AutoSize := true;
  end;
  }
end;

procedure TfrmMemberActivation.actRefreshExecute(Sender: TObject);
begin
  inherited;
  ParseDataGrid();
end;

procedure TfrmMemberActivation.lblCheckAllClick(Sender: TObject);
var i: Integer;
begin
  // put your code here
  {
  with strgGrid do
  begin
    for i:=0 to RowCount-1 do
    begin
      SetCheckBoxState(0,i,true);
    end;
  end;
  }
end;

procedure TfrmMemberActivation.lblClearAllClick(Sender: TObject);
var i: Integer;
begin
  // put your code here
  {with strgGrid do
  begin
    for i:=0 to RowCount-1 do
    begin
      SetCheckBoxState(0,i,False);
    end;
  end;
  }
end;

procedure TfrmMemberActivation.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = Vk_F5 then
  begin
    LookUpMember
  end
  else if Key = VK_F9 then
  begin
    actAddExecute(Self);
  end
  else if (UpperCase(Chr(Key)) = 'F') and (ssCtrl in Shift) then
  begin
//    grdFindMember.Execute;
  end;

end;

procedure TfrmMemberActivation.strgGridRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  inherited;
//  if strgGrid.Cells[1, NewRow] <> '' then
    ParseDetailRow(NewRow);
end;

procedure TfrmMemberActivation.FormShow(Sender: TObject);
begin
  inherited;
  try
//    FJmlBulanValid := StrToInt(getGlobalVar('MEMBER_VALID_MONTH'));
  except
    FJmlBulanValid := 12;
  end;
//  dtValidFrom.Date := cGetServerTime;
  dtValidTo.Date := IncMonth(dtValidFrom.Date,FJmlBulanValid);
  dtValidTo.Date := IncDay(dtValidTo.Date,-1);
  edtCardNo.SetFocus;
end;

procedure TfrmMemberActivation.strgGridCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  if ACol = 0 then CanEdit := tempCanEdit;
end;

procedure TfrmMemberActivation.edtCardNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then ParseDataGrid();
end;

procedure TfrmMemberActivation.ParseDetailRow(ARow: Integer);
begin
  {
  if strgGrid.Cells[1,ARow] = '' then Exit;
  
  edtCompName.Text := strgGrid.Cells[7, ARow];
  edtDocStatus.Text := strgGrid.Cells[8, ARow];
  dtRegister.Date := StrToDate(strgGrid.Cells[9, ARow]);
  edtMemberCardFee.Value := StrToCurr(strgGrid.Cells[12, ARow]);
  if strgGrid.Cells[13, ARow] = '1' then
    edtPrintedStatus.Text := 'PRINTED'
  else
    edtPrintedStatus.Text := 'NOT PRINTED';

  if strgGrid.Cells[15, ARow]='1' then
  begin
    if (Trim(strgGrid.Cells[10, ARow]) <> '') or (Trim(strgGrid.Cells[10, ARow]) <> '0') then
      dtValidFrom.Date := strgGrid.Dates[10, ARow] //StrToDate(strgGrid.Cells[10, ARow])
    else
      dtValidFrom.Date := cGetServerTime;

    if (Trim(strgGrid.Cells[11, ARow]) <> '') or (Trim(strgGrid.Cells[11, ARow]) <> '0') then
      dtValidTo.Date  := strgGrid.Dates[11, ARow] //StrToDate(strgGrid.Cells[11, ARow])
    else
      dtValidTo.Date  := IncYear(dtValidFrom.Date,FJmlBulanValid);

    fraFooter5Button1.btnAdd.Caption:= 'Reactivate'
  end else
  begin
    dtValidFrom.Text:= '  -  -    ';
    dtValidTo.Text  := '  -  -    ';
    fraFooter5Button1.btnAdd.Caption:= 'Activate';
  end;
  }
end;

procedure TfrmMemberActivation.ClearFormComponent;
begin
  edtCardNo.Clear;
//  strgGrid.RowCount := 2;
//  strgGrid.ClearRows(1, strgGrid.RowCount);
  edtCompName.Clear;
  edtDocStatus.Clear;
  dtRegister.Clear;
  dtValidFrom.Clear;
  dtValidTo.Clear;
  edtMemberCardFee.Value := 0;
  edtPrintedStatus.Clear;
end;

procedure TfrmMemberActivation.LookUpMember;
var
  sSQL: string;
begin
  sSQL := 'SELECT MEMBER_NAME, MEMBER_CARD_NO, MEMBER_ADDRESS '
    + 'FROM MEMBER '
    + 'WHERE MEMBER_UNT_ID = ' + IntToStr(masternewunit);
  {
  with cLookUp('Daftar Member',sSQL) do
  begin
    try
      if Strings[0] <> '' then
      begin
        edtCardNo.Text := Strings[1];
      end;  
    finally
      Free;
    end;
  end;    // with;
  }
end;

procedure TfrmMemberActivation.edtCardNoClickBtn(Sender: TObject);
begin
  inherited;
  LookUpMember;
end;

procedure TfrmMemberActivation.edtCardNoEnter(Sender: TObject);
begin
  inherited;
  rbByMember.Checked := True;
  if edtCardNo.Tag = 0 then
  begin
    edtCardNo.Style.Font.Style := [];
    edtCardNo.Style.Font.Color := clWindowText;
    edtCardNo.Clear;
    edtCardNo.Tag := 1;
  end;
end;

procedure TfrmMemberActivation.edtCardNoExit(Sender: TObject);
begin
  inherited;
  if Trim(edtCardNo.Text) = '' then
  begin
    edtCardNo.Style.Font.Style := [fsItalic];
    edtCardNo.Style.Font.Color := clSilver;
    edtCardNo.Text := '[Input Card Number]';
    edtCardNo.Tag := 0;
  end;
end;

procedure TfrmMemberActivation.edCompanyEnter(Sender: TObject);
begin
  inherited;
  rbBySelected.Checked := True;
  if edCompany.Tag = 0 then
  begin
    edCompany.Style.Font.Style := [];
    edCompany.Style.Font.Color := clWindowText;
    edCompany.Clear;
    edCompany.Tag := 1;
  end;
end;

procedure TfrmMemberActivation.edCompanyExit(Sender: TObject);
begin
  inherited;
  if Trim(edCompany.Text) = '' then
  begin
    edCompany.Style.Font.Style := [fsItalic];
    edCompany.Style.Font.Color := clSilver;
    edCompany.Text := '[Select Company]';
    edCompany.Tag := 0;
  end;
end;

procedure TfrmMemberActivation.LookUpMemberGrup;
var
  sSQL: string;
begin
  sSQL := 'SELECT GROMEMBER_NAME, GROMEMBER_ADDRESS, GROMEMBER_KELURAHAN, GROMEMBER_KOTA '
    + 'FROM REF$GRUP_MEMBER '
    + 'WHERE GROMEMBER_UNT_ID = ' + IntToStr(masternewunit);
  {
  with cLookUp('Daftar Grup Member',sSQL) do
  begin
    try
      if Strings[0] <> '' then
      begin
        edCompany.Text := Strings[0];
      end;  
    finally
      Free;
    end;
  end;    // with;
  }
end;

procedure TfrmMemberActivation.edCompanyClickBtn(Sender: TObject);
begin
  inherited;
  LookUpMemberGrup;
end;

end.


