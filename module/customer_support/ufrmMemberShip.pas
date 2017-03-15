unit ufrmMemberShip;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls, Mask,
  ActnList, uConn, uConstanta, ufrmSearchCompanyMember, ufrmMasterBrowse,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, System.Actions,
  cxCurrencyEdit, cxClasses, ufraFooter4Button, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxGridCustomView, cxGrid, dxBarBuiltInMenu, cxPC;

type
  TfrmMemberShip = class(TfrmMasterBrowse)
    pnl1: TPanel;
    lblInput: TLabel;
    edtCompTypeName: TEdit;
    actlst1: TActionList;
    actAddMemberShip: TAction;
    actEditMemberShip: TAction;
    actDeleteMemberShip: TAction;
    actRefreshMemberShip: TAction;
    pnl2: TPanel;
    lbl5: TLabel;
    edtCardStatus: TEdit;
    edtTotalMain: TEdit;
    lbl2: TLabel;
    lblComboGrid: TLabel;
    edtCompName: TEdit;
    lbl9: TLabel;
    lbl8: TLabel;
    edtAddress: TEdit;
    lbl1: TLabel;
    edtNPWP: TEdit;
    edtCompType: TEdit;
    edtRefNoType: TEdit;
    edtRefNo: TEdit;
    dtValidFrom: TcxDateEdit;
    lbl4: TLabel;
    dtValidTo: TcxDateEdit;
    lbl3: TLabel;
    dtRegister: TcxDateEdit;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl10: TLabel;
    edtKelurahan: TEdit;
    edtCity: TEdit;
    edtPostCode: TEdit;
    edtTelephone: TEdit;
    lbl11: TLabel;
    lbl12: TLabel;
    edtFaxNo: TEdit;
    lbl13: TLabel;
    edtDocStatus: TEdit;
    edtPrintedStatus: TEdit;
    lbl14: TLabel;
    lbl15: TLabel;
    edtTotalSuppl: TEdit;
    lbl16: TLabel;
    lblDispPersonal: TcxLabel;
    lblDispFamily: TcxLabel;
    edtMemberStatus: TEdit;
    lbl17: TLabel;
    edtTotalTransaction: TcxCurrencyEdit;
    lbl18: TLabel;
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    cxGridViewColumn4: TcxGridDBColumn;
    cxGridViewColumn5: TcxGridDBColumn;
    btnShow: TcxButton;
    cxTabSheet1: TcxTabSheet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actAddMemberShipExecute(Sender: TObject);
    procedure actEditMemberShipExecute(Sender: TObject);
    procedure actDeleteMemberShipExecute(Sender: TObject);
    procedure actRefreshMemberShipExecute(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnShowClick(Sender: TObject);
    procedure strgGrid1RowChanging(Sender: TObject; OldRow,
      NewRow: Integer; var Allow: Boolean);
    procedure edtCompNameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure lblDispPersonalClick(Sender: TObject);
    procedure lblDispFamilyClick(Sender: TObject);
  private
    { Private declarations }
    FSelfUnitID, MemberGroID, totalMain, totalSuppl: Integer;
    compName,canEdit, CardNo: string;
    dataCompanyMember, dataMemberShip: TDataSet;
    FSearchFor: TSearchFor;
    procedure ParseHeaderGrid(jmlData: Integer);
    procedure ParseDataGrid;
    procedure prepareAdd();
    procedure prepareEdit();
    procedure clearView();
    procedure SetSearchFor(const Value: TSearchFor);
  public
    { Public declarations }
  published
    property  SearchFor: TSearchFor read FSearchFor write SetSearchFor;
  end;

var
  frmMemberShip: TfrmMemberShip;

implementation

uses ufrmDialogMemberShip, uTSCommonDlg,
  ufrmPopupFamilyMember, ufrmPopupPersonalMember, uRetnoUnit;

{$R *.dfm}

procedure TfrmMemberShip.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmMemberShip.FormDestroy(Sender: TObject);
begin
  inherited;
  frmMemberShip := nil;
end;

procedure TfrmMemberShip.clearView();
begin
  edtCompName.Text := '';
  edtCompType.Text := '';
  edtCompTypeName.Text := '';
  edtRefNoType.Text := '';
  edtRefNo.Text := '';
  edtNPWP.Text := '';
  edtAddress.Text := '';
  edtKelurahan.Text := '';
  edtCity.Text := '';
  edtPostCode.Text := '';
  edtTelephone.Text := '';
  edtFaxNo.Text := '';
  edtDocStatus.Text := '';

  edtCompName.SetFocus;
  compName := '';
  canEdit := 'no';
end;

procedure TfrmMemberShip.FormShow(Sender: TObject);
var
  dsTemp: TDataSet;
  sSQL: string;
begin
  inherited;
  sSQL := 'SELECT RGM.GROMEMBER_ID, RGM.GROMEMBER_NAME '
    + ' FROM REF$GRUP_MEMBER RGM '
//    + ' WHERE RGM.GROMEMBER_UNT_ID = ' + IntToStr(masternewunit.id)
    + ' AND RGM.GROMEMBER_TPPERSH_ID = 11 '
    + ' ORDER BY RGM.GROMEMBER_ID ASC';
//  dsTemp := cOpenQuery(sSQL);

  try
    if not dsTemp.IsEmpty then
    begin
      dsTemp.First;
      MemberGroID := dsTemp.FieldByName('GROMEMBER_ID').AsInteger;
      edtCompName.Text := dsTemp.FieldByName('GROMEMBER_NAME').AsString;
    end;
  finally
    FreeAndNil(dsTemp);
  end;  // try/finally

  SearchFor:= sfCompany;
  lblHeader.Caption := 'List MemberShip';
  canEdit := 'no';
  edtCompName.SetFocus;
end;

procedure TfrmMemberShip.actAddMemberShipExecute(
  Sender: TObject);
begin
  prepareAdd();

  if (frmDialogMemberShip.IsProcessSuccessfull) then
  begin
    actRefreshMemberShipExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atAdd);
  end;
  frmDialogMemberShip.Free;
end;

procedure TfrmMemberShip.actEditMemberShipExecute(
  Sender: TObject);
begin
  if canEdit = 'no' then
  begin
    CommonDlg.ShowError('Please Select Proper Data !');
    edtCompName.SetFocus;
    Exit;
  end;

  prepareEdit();

  if (frmDialogMemberShip.IsProcessSuccessfull) then
  begin
    // put your code here
    // ...
    actRefreshMemberShipExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atEdit);
  end;
  frmDialogMemberShip.Free;
end;

procedure TfrmMemberShip.actDeleteMemberShipExecute(
  Sender: TObject);
//var arrParam: TArr;
begin
  if canEdit = 'no' then
  begin
    Exit;
  end;
  {
  if not IsValidDateKarenaEOD(masternewunit.id,cGetServerTime,FMasterIsStore) then
    Exit;

  if (CommonDlg.Confirm('Are you sure you wish to delete Company : '
    + edtCompName.Text + ' with all the members ?') = mrYes) then  //(Company Name: '+ edtCompName.Text +')?') = mrYes) then
  begin
    with TRef_GrupMember.CreateWithUser(Self,FLoginId,masternewunit.id) do
    begin
      try
        if LoadByID(MemberGroID,masternewunit.id) then
        begin
          if RemoveFromDB then
          begin
            cCommitTrans;

            actRefreshMemberShipExecute(Self);
            CommonDlg.ShowConfirmSuccessfull(atDelete);
          end
          else
          begin
            cRollbackTrans;
            CommonDlg.ShowError(CONF_COULD_NOT_DELETE);
          end;
        end;
      finally
      end;        
    end;    // with
  end;  }
end;

procedure TfrmMemberShip.actRefreshMemberShipExecute(Sender: TObject);
begin
  inherited;
  ParseDataGrid();
end;

//=========================

procedure TfrmMemberShip.ParseDataGrid;
var intI: Integer;
  sSQL: string;
  tempBool: Boolean;
  arrParam: TArr;
//  dataPerush: TDataSet;
begin
  //INIT
  totalMain := 0;
  totalSuppl := 0;
  MemberGroID := 0;
//  strgGrid1.ClearRows(1,strgGrid1.RowCount - 1);
//  strgGrid1.RowCount := 2;

//  if not Assigned(MemberShip) then MemberShip := TMemberShip.Create;

  sSQL := 'SELECT GM.*, TP.TPPERSH_CODE, TP.TPPERSH_NAME, DC.DOC_NAME '
    + 'FROM REF$GRUP_MEMBER GM '
    + ' LEFT OUTER JOIN REF$TIPE_PERUSAHAAN TP ON TP.TPPERSH_ID = GM.GROMEMBER_TPPERSH_ID '
    + ' LEFT OUTER JOIN REF$DOCUMENT DC ON DC.DOC_ID = GM.GROMEMBER_DOC_ID '
    + ' WHERE UPPER(GROMEMBER_NAME) LIKE ' + QuotedStr(UpperCase(edtCompName.Text))
;//    + ' AND GROMEMBER_UNT_ID = ' + IntToStr(masternewunit.id) ;

//  dataCompanyMember := cOpenQuery(sSQL);
  if not dataCompanyMember.Eof then
  begin
    dataCompanyMember.Last;
    dataCompanyMember.First;
  end;

  if dataCompanyMember.RecordCount > 0 then
  begin
    edtCompType.Text := dataCompanyMember.FieldByName('GROMEMBER_NAME').AsString;
    edtCompType.Text := dataCompanyMember.FieldByName('TPPERSH_CODE').AsString;
    edtCompTypeName.Text := dataCompanyMember.FieldByName('TPPERSH_NAME').AsString;
    edtRefNoType.Text  := dataCompanyMember.FieldByName('DOC_NAME').AsString;
    edtRefNo.Text  := dataCompanyMember.FieldByName('GROMEMBER_IDENTITY_NO').AsString;
    edtNPWP.Text  := dataCompanyMember.FieldByName('GROMEMBER_NPWP').AsString;
    edtAddress.Text  := dataCompanyMember.FieldByName('GROMEMBER_ADDRESS').AsString;
    edtKelurahan.Text  := dataCompanyMember.FieldByName('GROMEMBER_KELURAHAN').AsString;
    edtCity.Text  := dataCompanyMember.FieldByName('GROMEMBER_KOTA').AsString;
    edtPostCode.Text  := dataCompanyMember.FieldByName('GROMEMBER_KODE_POS').AsString;
    edtTelephone.Text  := dataCompanyMember.FieldByName('GROMEMBER_TELP').AsString;
    edtFaxNo.Text  := dataCompanyMember.FieldByName('GROMEMBER_NO_FAX').AsString;

    if dataCompanyMember.FieldByName('GROMEMBER_IS_COMPLETE').AsInteger = 1 then
      edtDocStatus.Text  := 'COMPLETE'
    else edtDocStatus.Text := 'INCOMPLETE';

    MemberGroID := dataCompanyMember.FieldByName('GROMEMBER_ID').AsInteger;
    compName := dataCompanyMember.FieldByName('GROMEMBER_NAME').AsString;
    canEdit := 'yes';

    //get jmlh type card
    SetLength(arrParam,1);
    arrParam[0].tipe := ptInteger;
    arrParam[0].data := MemberGroID;
//    totalMain := MemberShip.GetJmlMainCard(arrParam);
//    totalSuppl := MemberShip.GetJmlSupplCard(arrParam);

    if SearchFor = sfCompany then
    begin
      SetLength(arrParam,1);
      arrParam[0].tipe := ptInteger;
      arrParam[0].data := MemberGroID;
//      dataMemberShip := MemberShip.GetListMemberShip(arrParam);
    end else
    if SearchFor = sfMember then
    begin
      SetLength(arrParam,1);
      arrParam[0].tipe := ptString;
      arrParam[0].data := CardNo;
//      dataMemberShip := MemberShip.GetListMemberByCardNo(arrParam);
    end;

    ParseHeaderGrid(dataMemberShip.RecordCount);
    
    if dataMemberShip.RecordCount > 0 then
    begin
      //initiate
      intI := 1;
      dataMemberShip.First;
      while not (dataMemberShip.Eof) do
      begin
        {with strgGrid1 do
        begin
          Cells[0,intI] :=  dataMemberShip.FieldByName('MEMBER_CARD_NO').AsString;
          Cells[1,intI] :=  dataMemberShip.FieldByName('MEMBER_NAME').AsString;
          Cells[2,intI] :=  dataMemberShip.FieldByName('MEMBER_ADDRESS').AsString;

          if dataMemberShip.FieldByName('MEMBER_IS_MAIN').AsInteger = 1 then
            Cells[3,intI] :=  'MAIN'
          else
            Cells[3,intI] :=  'SUPLEMEN';
            
          Cells[4,intI] :=  dataMemberShip.FieldByName('TPMEMBER_NAME').AsString;
          Cells[5,intI] :=  dataMemberShip.FieldByName('MEMBER_ID').AsString;
          Cells[6,intI] :=  dataMemberShip.FieldByName('MEMBERACT_IS_PRINT_CARD').AsString;
          Cells[7,intI] :=  dataMemberShip.FieldByName('MEMBER_IS_VALID').AsString;
          Cells[8,intI] :=  dataMemberShip.FieldByName('MEMBER_REGISTERED_DATE').AsString;
          Cells[9,intI] :=  FormatDateTime(FormatSettings.ShortDateFormat, dataMemberShip.FieldByName('MEMBERACT_VALID_DATE_FROM').AsDateTime);
          Cells[10,intI] :=  FormatDateTime(FormatSettings.ShortDateFormat, dataMemberShip.FieldByName('MEMBERACT_VALID_DATE_TO').AsDateTime);
          Cells[11,intI] :=  dataMemberShip.FieldByName('MEMBER_IS_ACTIVE').AsString;
          Cells[12, intI] := dataMemberShip.FieldByName('MEMBER_TPMEMBER_ID').AsString;
        end; //end with strggrid
         }
        Inc(intI);
        dataMemberShip.Next;
      end; //end while
    end;

    edtTotalMain.Text := IntToStr(totalMain);
    edtTotalSuppl.Text := IntToStr(totalSuppl);

//    strgGrid1.FixedRows := 1;
//    strgGrid1.AutoSize := true;
//    strgGrid1RowChanging(Self,0,1,tempBool);
//    strgGrid1.SetFocus;
  end //company member
  else
    clearView();
end;

procedure TfrmMemberShip.ParseHeaderGrid(jmlData: Integer);
begin
  {with strgGrid1 do
  begin
    ClearRows(1,RowCount-1);
    RowCount := jmlData + 1;
    ColCount := 5;
    Cells[0,0] := 'CARD NO.';
    Cells[1,0] := 'MEMBER NAME';
    Cells[2,0] := 'MEMBER ADDRESS';
    Cells[3,0] := 'CARD TYPE';
    Cells[4,0] := 'MEMBER TYPE';

    if jmlData < 1 then
    begin
      RowCount := 2;
      Cells[0,1] := '';
      Cells[1,1] := '';
      Cells[2,1] := '';
      Cells[3,1] := '';
      Cells[4,1] := '';
      Cells[5,1] := '0';
      Cells[6,1] := ''; //PRINTED STS
      Cells[7,1] := ''; //CARD STS
      Cells[8,1] := '';  //REGISTER DATE
      Cells[9,1] := '';  //VALID FROM
      Cells[10,1] := '';  //VALID TO
    end;
    FixedRows := 1;
    AutoSize := true;
  end;}
end;


procedure TfrmMemberShip.prepareAdd();
begin
  if not assigned(frmDialogMemberShip) then
  Application.CreateForm(TfrmDialogMemberShip, frmDialogMemberShip);

//  if not Assigned(MemberShip) then MemberShip := TMemberShip.Create;

  frmDialogMemberShip.Caption := 'Add MemberShip';
  frmDialogMemberShip.FormMode := fmAdd;
  frmDialogMemberShip.DialogUnit := FSelfUnitID;
//  frmDialogMemberShip.dtRegister.Date := cGetServerTime;
  frmDialogMemberShip.MemberGroID := 0;
  SetFormPropertyAndShowDialog(frmDialogMemberShip);
end;

procedure TfrmMemberShip.prepareEdit();
var
  countPrep: Integer;
  MemberIDList: TStringList;
begin
  if not assigned(frmDialogMemberShip) then
    Application.CreateForm(TfrmDialogMemberShip, frmDialogMemberShip);

  frmDialogMemberShip.Caption := 'Edit MemberShip';
  frmDialogMemberShip.FormMode := fmEdit;
  frmDialogMemberShip.MemberGroID := MemberGroID;
  frmDialogMemberShip.DialogUnit := FSelfUnitID;
//  frmDialogMemberShip.jmlMember := strgGrid1.RowCount - 1;

  frmDialogMemberShip.edtCompName.Text := compName;
  frmDialogMemberShip.TipePerusahaan := edtCompType.Text;
  frmDialogMemberShip.TipeDokumen := edtRefNoType.Text;
  frmDialogMemberShip.edtRefNo.Text := edtRefNo.Text;
  frmDialogMemberShip.edtNPWP.Text := edtNPWP.Text;
  frmDialogMemberShip.edtAdrress.Text := edtAddress.Text;
  frmDialogMemberShip.dtRegister.Date := dtRegister.Date;
  frmDialogMemberShip.edtKelurahan.Text := edtKelurahan.Text;
  frmDialogMemberShip.edtCity.Text := edtCity.Text;
  frmDialogMemberShip.edtPostCode.Text := edtPostCode.Text;
  frmDialogMemberShip.edtTelephone.Text := edtTelephone.Text;
  frmDialogMemberShip.edtFaxNo.Text := edtFaxNo.Text;

  if edtDocStatus.Text = 'COMPLETE' then
    frmDialogMemberShip.cbbDocStatus.ItemIndex := 1
  else frmDialogMemberShip.cbbDocStatus.ItemIndex := 0;
  {
  frmDialogMemberShip.strgGrid1.RowCount := strgGrid1.RowCount;

  MemberIDList:= TStringList.Create;
  if (strgGrid1.RowCount > 1) and (strgGrid1.Cells[0,1] <> '') then
  begin                             
    for countPrep := 1 to strgGrid1.RowCount-1 do
      MemberIDList.Add(strgGrid1.Cells[5, countPrep]);
  end;
  frmDialogMemberShip.ListOfMemberID:= MemberIDList;
  frmDialogMemberShip.IndexMemberId := strgGrid1.Row - 1;
  SetFormPropertyAndShowDialog(frmDialogMemberShip);
  }
end;

procedure TfrmMemberShip.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F1 then
  begin
    lblDispPersonalClick(Self);
  end
  else if Key = VK_F2 then
  begin
    lblDispFamilyClick(Self);
  end
  else if (UpperCase(Chr(Key)) = 'F') and (ssCtrl in Shift) then
  begin
//    grdFindMember.Execute;
  end
  else if (UpperCase(Chr(Key)) = 'C') and (ssCtrl in Shift) then
  begin
    actAddMemberShipExecute(Sender);
  end
  else if (UpperCase(Chr(Key)) = 'E') and (ssCtrl in Shift) then
  begin
    actEditMemberShipExecute(Sender);
  end
  else if (Key = VK_DELETE) and (ssCtrl in Shift) then
  begin
    actAddMemberShipExecute(Sender);
  end
end;

procedure TfrmMemberShip.btnShowClick(Sender: TObject);
begin
  SearchFor:= sfCompany;
  actRefreshMemberShipExecute(Self);
end;

procedure TfrmMemberShip.strgGrid1RowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
var
  iOut: Integer;
begin
  inherited;
  {if strgGrid1.Cells[6,NewRow] = '1' then
    edtPrintedStatus.Text := 'PRINTED'
  else edtPrintedStatus.Text := 'NOT PRINTED';

  if strgGrid1.Cells[7,NewRow] = '1' then
    edtCardStatus.Text := 'VALID'
  else edtCardStatus.Text := 'INVALID';

  if strgGrid1.Cells[11,NewRow] = '1' then
    edtMemberStatus.Text := 'ACTIVE'
  else edtMemberStatus.Text := 'NOT ACTIVE';

  try
    if (strgGrid1.Cells[8,NewRow] <> '') then
      dtRegister.Date := StrToDate(strgGrid1.Cells[8,NewRow]);
  except
    Exit;
  end;

  try
    if (strgGrid1.Cells[9,NewRow] <> '') then
      dtValidFrom.Date := StrToDate(strgGrid1.Cells[9,NewRow]);
  except
    Exit;
  end;
  
  if TryStrToInt(strgGrid1.Cells[5, NewRow], iOut ) then
    edtTotalTransaction.Value:= MemberShip.GetMemberTotalTransaction(iOut)
  else
  begin
    CommonDlg.ShowError('Member id tidak diketahui');
    exit;
  end;
  try
    if (strgGrid1.Cells[10,NewRow] <> '') then
      dtValidTo.Date := StrToDate(strgGrid1.Cells[10,NewRow]);
  except
    Exit
  end;
  }
end;

procedure TfrmMemberShip.edtCompNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sSQL: string;
begin
  inherited;
  if Key = VK_RETURN then
    btnShowClick(Self)
  else
  if Key = VK_F5 then
  begin
    sSQL := 'SELECT GROMEMBER_NAME AS NAME, GROMEMBER_ADDRESS AS ADDRESS, '
      + ' GROMEMBER_KELURAHAN AS KELURAHAN, GROMEMBER_KOTA AS KOTA '
      + ' FROM REF$GRUP_MEMBER '
;//      + ' WHERE GROMEMBER_UNT_ID = ' + IntToStr(masternewunit.id);  //AND GROMEMBER_TPPERSH_ID = 11 '+ // perusahaan
    {with cLookUp('Daftar Grup',sSQL) do
    begin
      try
        if Strings[0] <> '' then
        begin
          edtCompName.Text := Strings[0];
        end;
      finally
      end;
    end;    // with
    }
  end;
end;

procedure TfrmMemberShip.FormCreate(Sender: TObject);
begin
  inherited;
//  FSelfUnitID:= masternewunit.id;
end;

procedure TfrmMemberShip.lblDispPersonalClick(Sender: TObject);
var
  iOut: Integer;
begin
  inherited;
  if canEdit = 'no' then Exit;

    if not Assigned(frmPopupPersonalMember) then
      frmPopupPersonalMember := TfrmPopupPersonalMember.Create(Self);

{    if TryStrToInt(strgGrid1.Cells[5, strgGrid1.Row], iOut ) then
      frmPopupPersonalMember.MemberID := iOut
    else
    begin
      CommonDlg.ShowError('Member id tidak diketahui');
      exit;
    end;
 }
    frmPopupPersonalMember.FSelfUnitID := FSelfUnitID;
    frmPopupPersonalMember.ShowModal;
end;

procedure TfrmMemberShip.lblDispFamilyClick(Sender: TObject);
var
  iOut: Integer;
begin
  inherited;
  if canEdit = 'no' then Exit;

    if not Assigned(frmPopupFamilyMember) then
      frmPopupFamilyMember := TfrmPopupFamilyMember.Create(Self);
  {
	if TryStrToInt(strgGrid1.Cells[5, strgGrid1.Row], iOut ) then
      frmPopupFamilyMember.MemberID := iOut
    else
    begin
      CommonDlg.ShowError('Member id tidak diketahui');
      exit;
    end;

    frmPopupFamilyMember.FSelfUnitID := MasterNewUnit.ID;
    frmPopupFamilyMember.edtMemberName.Text := strgGrid1.Cells[1,strgGrid1.Row];
    frmPopupFamilyMember.edtCardNo.Text := strgGrid1.Cells[0,strgGrid1.Row];
  }
    frmPopupFamilyMember.ShowModal;
end;

procedure TfrmMemberShip.SetSearchFor(const Value: TSearchFor);
begin
  FSearchFor := Value;
end;

end.


