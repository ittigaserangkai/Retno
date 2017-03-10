unit ufrmDialogMemberShip;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialogBrowse, ufraFooterDialog2Button, ExtCtrls,StdCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, AdvUtil, AdvCombo, ColCombo, ufraFooterDialog3Button, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxLabel, cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogMemberShip = class(TfrmMasterDialogBrowse)
    pnl1: TPanel;
    lblInput: TLabel;
    lblComboGrid: TLabel;
    lbl9: TLabel;
    lbl8: TLabel;
    lbl1: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    edtCompTypeName: TEdit;
    edtCompName: TEdit;
    edtAdrress: TEdit;
    edtNPWP: TEdit;
    edtRefNo: TEdit;
    edtKelurahan: TEdit;
    edtCity: TEdit;
    edtPostCode: TEdit;
    edtTelephone: TEdit;
    edtFaxNo: TEdit;
    cbpCompType: TcxExtLookupComboBox;
    cbbDocStatus: TComboBox;
    cbpReference: TcxExtLookupComboBox;
    lbl3: TLabel;
    dtRegister: TcxDateEdit;
    pnl2: TPanel;
    lblAddRow: TcxLabel;
    lblDeleteRow: TcxLabel;
    lblDetilPersonal: TcxLabel;
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn4: TcxGridDBColumn;
    cxGridViewColumn5: TcxGridDBColumn;
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure strgGrid1CanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure strgGrid1ComboObjectChange(Sender: TObject; ACol, ARow,
      AItemIndex: Integer; ASelection: String; AObject: TObject);
    procedure strgGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCompNameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbpCompTypeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbpReferenceKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRefNoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNPWPKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAdrressKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtRegisterKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtKelurahanKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCityKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPostCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTelephoneKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFaxNoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbbDocStatusKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure lblDeleteRowClick(Sender: TObject);
    procedure cbpCompTypeChange(Sender: TObject);
    procedure strgGrid1CellValidate(Sender: TObject; ACol, ARow: Integer;
      var Value: String; var Valid: Boolean);
    procedure lblDetilPersonalClick(Sender: TObject);
    procedure lblAddRowClick(Sender: TObject);
  private
    { Private declarations }
    dataCompanyType,dataReference: TDataSet;
//    isComplete: SmallInt;
    ReferenceID, TypePershID: Integer;
//    tempMidFix: string;
    FListOfMemberID: TStringList;
    FIndexMemberId: Integer;
		FIsMainExist: Boolean;
    FLastCardNo: String;
    FMemberTypeIDList: TStrings;
    FMemberTypeList: TStrings;
    FTipeDokumen: String;
    FTipePerusahaan: String;
    procedure LoadDropDownData(ACombo: TcxExtLookupComboBox; AColsOfData: Integer);
        overload;
    procedure GetDataEdit;
    procedure showDataEdit();
    procedure ParseCompanyType;
    procedure ParseReference;
    procedure PersonalIdentity;
    function checkEmpty(): Boolean;
//    function AddDetilMember(): Boolean;
    function ConstructCardNo: string;
    procedure LoadDropDownData(ACombo: TcxExtLookupComboBox; AData: TDataSet);
        overload;
    procedure SetListOfMemberID(const Value: TStringList);
  public
    { Public declarations }
    FormMode: TFormMode;
    MemberGroID, UntID: Integer;
    jmlMember: Integer;
    IsProcessSuccessfull: Boolean;
		procedure IsiRow(ARow: Integer);
		function StrToIntTry(AString: String): Integer;
		function StrToFloatTry(AString: String): Double;
		property IsMainExist: Boolean read FIsMainExist write FIsMainExist;
    property LastCardNo: String read FLastCardNo write FLastCardNo;
    property MemberTypeIDList: TStrings read FMemberTypeIDList write
        FMemberTypeIDList;
    property MemberTypeList: TStrings read FMemberTypeList write FMemberTypeList;
    property TipeDokumen: String read FTipeDokumen write FTipeDokumen;
    property TipePerusahaan: String read FTipePerusahaan write FTipePerusahaan;
  published
    property ListOfMemberID: TStringList read FListOfMemberID write SetListOfMemberID;
    property IndexMemberId: Integer read FIndexMemberId write FIndexMemberId;
  end;

var
  frmDialogMemberShip: TfrmDialogMemberShip;

implementation

uses uTSCommonDlg, uConstanta, uAppUtils,
  ufrmDialogFamilyMember, ufrmDialogPersonalMember, ufrmSearchTypeMember,
  ufrmSearchCompanyMember, Math, uRetnoUnit, ufrmMemberShip;

const
  _KolCardNo:	Integer = 0;
  _KolName: Integer = 1;
  _KolIsMain: Integer = 2;
  _KolTPMemberName: Integer = 3;
  _KolIsWNI: Integer = 4;
  _KolPlaceOfBirth: Integer = 5;
  _KolDateOfBirth: Integer = 6;
  _KolKTPNo: Integer = 7;
  _KolSex: Integer = 8;
  _KolAgama: Integer = 9;
  _KolAddress: Integer = 10;
  _KolRT: Integer = 11;
  _KolRW: Integer = 12;
  _KolKelurahan: Integer = 13;
  _KolKecamatan: Integer = 14;
  _KolKota: Integer = 15;
  _KolPostCode: Integer = 16;
  _KolTelp: Integer = 17;
  _KolIsMarried: Integer = 18;
  _KolJmlTanggungan: Integer = 19;
  _KolPendapatan: Integer = 20;
  _KolGrupMemberID: Integer = 21;
  _KolGrupMemberUnitID: Integer = 22;
  _KolIsValid: Integer = 23;
  _KolIsActive: Integer = 24;
  _KolTypeMemberID: Integer = 25;
  _KolTypeMemberUnitID: Integer = 26;
  _KolLoginID: Integer = 27;
  _KolMemberID: Integer = 28;
  _KolAgamaID: Integer = 29;

{$R *.dfm}

function TfrmDialogMemberShip.checkEmpty(): Boolean;
var countI: Integer;

begin
  Result := True;



  if FormMode = fmAdd then
  begin

  end;

  //checking for empty field
  //Member
  if edtCompName.Text = '' then
  begin
    CommonDlg.ShowErrorEmpty('Company Name');
    edtCompName.SetFocus;
    Result := False;
    Exit;
  end;

  if cbpCompType.Text = '' then
  begin
    CommonDlg.ShowErrorEmpty('Company Type');
    cbpCompType.SetFocus;
    Result := False;
    Exit;
  end;

//  if strgGrid1.Cells[0, 1] = '' then
  begin
    CommonDlg.ShowError('A group member must have at least one member');
    cbbDocStatus.SetFocus;
    Result := False;
    Exit;
  end;  
  {
  if strgGrid1.RowCount > 1 then
  begin
    for countI := 1 to strgGrid1.RowCount -1 do
    if strgGrid1.Cells[1,1] = '' then
    begin
      CommonDlg.ShowErrorEmpty('MEMBER NAME');
      Result := False;
      strgGrid1.SetFocus;
      Exit;
    end
    else
    if strgGrid1.Cells[3,1] = '' then
    begin
      CommonDlg.ShowErrorEmpty('TYPE MEMBER');
      Result := False;
      strgGrid1.SetFocus;
      Exit;
    end;
  end;
   }
end;

procedure TfrmDialogMemberShip.footerDialogMasterbtnSaveClick(
  Sender: TObject);
var
  iTpPrshId: Integer;
  iDocId: Integer;
	dtDateOfBirth: TDateTime;
	i: Integer;
begin
  if not (checkEmpty) then Exit;

  if (FormMode=fmAdd) then
  Begin
//    if not IsValidDateKarenaEOD(dialogunit,dtRegister.Date,FMasterIsStore) then
    Begin
      Exit;
    End;
  End;
  {
  with TRef_GrupMember.CreateWithUser(Self,FLoginId,dialogunit) do
  begin
    try
	  if not TryStrToInt(cbpReference.Cells[cbpReference.Col,cbpReference.Row], iDocId ) then
      begin
        CommonDlg.ShowError('ID Referensi Dokumen tidak diketahui');
        exit;
      end;

      if not TryStrToInt( cbpCompType.Cells[cbpCompType.Col,cbpCompType.Row], iTpPrshId) then
      begin
        CommonDlg.ShowError('Perusahaan id tidak diketahui');
        exit;
      end;
	  
      UpdateData(edtAdrress.Text,
        iDocId,
		MemberGroID,
        edtRefNo.Text,
        cbbDocStatus.ItemIndex,
        edtKelurahan.Text,
        edtPostCode.Text,
        edtCity.Text,
        edtCompName.Text,
        edtFaxNo.Text,
        edtNPWP.Text,
        edtTelephone.Text,
        iTpPrshId,
		dialogunit);
      IsProcessSuccessfull := SaveToDB;
      MemberGroID := ID;
    finally
      Free;
    end;
  end;

  if IsProcessSuccessfull then
  begin
    for i := 1 to strgGrid1.RowCount - 1 do
    begin
      with TMember.CreateWithUser(Self,FLoginId,dialogunit) do
      begin
        try

          with strgGrid1 do
          begin
            dtDateOfBirth := 0;
            if Cells[_KolDateOfBirth,i] <> '' then
              dtDateOfBirth := StrToFloat(Cells[_KolDateOfBirth,i]);// StrToDate(Cells[_KolDateOfBirth,i]);
          
            UpdateData(Cells[_KolAddress,i],
              StrToIntTry(Cells[_KolAgamaID,i]),
              Cells[_KolCardNo,i],
              dtDateOfBirth,
              MemberGroID,
              StrToIntTry(Cells[_KolMemberID,i]),
              //StrToIntTry(Cells[_KolIsActive,i]),
              0,
              IfThen(Cells[_KolIsMain,i] = 'MAIN',1,0),
              IfThen(Cells[_KolIsMarried,i] = '',0,StrToIntTry(Cells[_KolIsMarried,i])),
              IfThen(Cells[_KolIsValid,i] = '',0, StrToIntTry(Cells[_KolIsValid,i])),
              IfThen(Cells[_KolIsWNI,i] = '',1,StrToIntTry(Cells[_KolIsWNI,i])),
              StrToIntTry(Cells[_KolJmlTanggungan,i]),
              Cells[_KolKecamatan,i],
              Cells[_KolKelurahan,i],
              Cells[_KolKota,i],
              Cells[_KolKTPNo,i],
              Cells[_KolName,i], //name
              dialogunit, //unit id
              StrToFloatTry(Cells[_KolPendapatan,i]), //pendapatan
              Cells[_KolPlaceOfBirth,i], //place of birth
              Cells[_KolPostCode,i], //poscode
              dtRegister.Date, //registered date
              Cells[_KolRT,i], //rt
              Cells[_KolRW,i], //rw
              IfThen(Cells[_KolSex,i] = '',0,StrToIntTry(Cells[_KolSex,i])), //sex
              Cells[_KolTelp,i], //telp
              StrToIntTry(Cells[_KolTypeMemberID,i]) //tipemember id
              );
          end;
          IsProcessSuccessfull := SaveToDB;
          if not IsProcessSuccessfull then
          begin
            Break;
          end;
        finally
          Free;
        end;
      end;
    end;
  end;
  }
  if IsProcessSuccessfull then
  begin
//    cCommitTrans;
    frmMemberShip.edtCompName.Text := edtCompName.Text;
    frmMemberShip.btnShowClick(frmMemberShip.btnShow);
    Close;
  end
  else
  begin
//    cRollbackTrans;
  end;

end;
                                 
procedure TfrmDialogMemberShip.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = Ord('T')) and (ssctrl in Shift) then             //dulunya Ctrl N
  begin
    lblAddRowClick(Sender);
  end
  else
  if (Key = Ord('D')) and (ssctrl in Shift) then          //dulunya F1
  begin
    lblDetilPersonalClick(Sender);
  end
  else
  if (Key = Ord('R')) and (ssctrl in Shift) then
  begin
    lblDeleteRowClick(Sender);
  end;

  if (Key = VK_RETURN) and (ssctrl in Shift) then
  begin
    footerDialogMasterbtnSaveClick(Sender);
  end;

end;

procedure TfrmDialogMemberShip.showDataEdit();
begin
  GetDataEdit;
//  cbpCompType.Value := cbpCompType.Text;
//  cbpReference.Value := cbpReference.Text;
  ParseCompanyType;
  ParseReference;
end;

procedure TfrmDialogMemberShip.FormShow(Sender: TObject);
var //arrParam: TArr;
  dsTemp: TDataSet;
  sSQL: string;
//  dataPerush: TDataSet;
begin
  inherited;
  //if not Assigned(MemberShip) then MemberShip := TMemberShip.Create;

  if MemberTypeList = nil then
    MemberTypeList := TStringList.Create;

  if MemberTypeIDList = nil then
    MemberTypeIDList := TStringList.Create;

  MemberTypeList.Clear;
  MemberTypeIDList.Clear;
  
  sSQL := 'SELECT TPMEMBER_ID, TPMEMBER_NAME '
    + ' FROM REF$TIPE_MEMBER '
    + ' ORDER BY TPMEMBER_ID';
  {with cOpenQuery(sSQL) do
  begin
    try
      while not eof do
      begin
        MemberTypeIDList.Add(Fields[0].AsString);
        MemberTypeList.Add(Fields[1].AsString);
        
        Next;
      end;
    finally
      Free;
    end;   
  end;                                  

  sSQL := 'SELECT * '
    + 'FROM REF$TIPE_PERUSAHAAN '
    + 'ORDER BY TPPERSH_CODE';
  dsTemp := cOpenQuery(sSQL);
  try
    LoadDropDownData(cbpCompType,dsTemp);
  finally
    FreeAndNil(dsTemp);
  end;  // try/finally

  sSQL := 'SELECT * FROM REF$DOCUMENT ' 
    + ' ORDER BY DOC_NAME';
  dsTemp := cOpenQuery(sSQL);
  try
    LoadDropDownData(cbpReference,dsTemp);
  finally
    FreeAndNil(dsTemp);
  end;  // try/finally

  if FormMode = fmEdit then
  begin
    showDataEdit();
    strgGrid1.Col:= 1;
    strgGrid1.SetFocus;
  end else
    edtCompName.SetFocus;}
end;

procedure TfrmDialogMemberShip.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FMemberTypeList);
  FreeAndNil(FMemberTypeIDList);
  frmDialogMemberShip := nil;
  frmDialogMemberShip.Free;
end;

procedure TfrmDialogMemberShip.LoadDropDownData(ACombo: TcxExtLookupComboBox;
    AColsOfData: Integer);
begin
  {Flush the old data}
//  ACombo.ClearGridData;

  {Make sure the allocated storage is big enough}
  if AColsOfData < 1 then AColsOfData := 1;
//  ACombo.RowCount := AColsOfData+1;
//  ACombo.ColCount := 3;

  {Load the data}
  {if Acombo = cbpCompType then
  begin
    ACombo.AddRow(['','CODE','NAME']);
    if dataCompanyType.RecordCount > 0 then
    begin
      while not dataCompanyType.Eof do
      begin
        try
          ACombo.AddRow([dataCompanyType.FieldByName('TPPERSH_ID').AsString,
                         dataCompanyType.FieldByName('TPPERSH_CODE').AsString,
                         dataCompanyType.FieldByName('TPPERSH_NAME').AsString]);
        except
        end;
        dataCompanyType.Next;
      end; //END WHILE

      dataCompanyType.First;
      while not dataCompanyType.Eof do
      begin
        if dataCompanyType.FieldByName('TPPERSH_IS_DEFAULT').AsInteger = 1 then
        begin
          cbpCompType.Value := dataCompanyType.FieldByName('TPPERSH_CODE').AsString;
          cbpCompType.Text := dataCompanyType.FieldByName('TPPERSH_CODE').AsString;
          Exit;
        end;
        dataCompanyType.Next;
      end;
    end //END <> NIL
    else
    begin
      ACombo.AddRow([' ',' ',' ']);
    end;
  end;

  if ACombo = cbpReference then
  begin
    ACombo.AddRow(['','REF NAME']);
    if dataReference.RecordCount > 0 then
    begin
      while not dataReference.Eof do
      begin
        try
          ACombo.AddRow([dataReference.FieldByName('DOC_ID').AsString,
                         dataReference.FieldByName('DOC_NAME').AsString]);
        except
        end;
        dataReference.Next;
      end;//while
    end//END <> NIL
    else
    begin
      ACombo.AddRow([' ',' ',' ']);
    end;
  end; //if acombo =cbp1
  }
  {Now shring the grid so its just big enough for the data}
//  ACombo.SizeGridToData;
  //trik to activate acombo
//  ACombo.FixedRows := 1;
end;

procedure TfrmDialogMemberShip.strgGrid1CanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  if (ACol in [1,2,3]) then
    CanEdit := true
  else
    CanEdit := false;
end;

procedure TfrmDialogMemberShip.strgGrid1ComboObjectChange(Sender: TObject;
  ACol, ARow, AItemIndex: Integer; ASelection: String; AObject: TObject);
//var
//	countI: Integer;
begin
  inherited;
  // can't have more than one's main card
  {if ACol = 2 then
  begin
    if strgGrid1.RowCount > 2 then
      if AItemIndex = 0 then
      begin
        if IsMainExist then
        begin
          CommonDlg.ShowError('Main card is already exist');
          strgGrid1.Combobox.ItemIndex := 1;
          strgGrid1.Cells[ACol,ARow] := strgGrid1.Combobox.Items[1];
          //strgGrid1.Cells[_KolIsMain, ARow] := '0';
          Exit;
        end
        else
        begin
          IsMainExist := True;
          //strgGrid1.Cells[_KolIsMain, ARow] := '1';
        end;
      end //main
      else
      if AItemIndex = 1 then //suplemen
      begin
      	//strgGrid1.Cells[_KolIsMain, ARow] := '0';
        if strgGrid1.Cells[ACol,ARow] = 'MAIN' then
        begin
          strgGrid1.Combobox.ItemIndex := 1;
          strgGrid1.Cells[ACol,ARow] := strgGrid1.Combobox.Items[1];
        	IsMainExist := False;
        end;
      end;
  end
  else
  if ACol = 3 then
  begin
    //strgGrid1.Cells[22,ARow] := MemberTypeIDList[AItemIndex];
    strgGrid1.Cells[_KolTypeMemberID,ARow] := MemberTypeIDList[AItemIndex];
  end; }
end;

procedure TfrmDialogMemberShip.strgGrid1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  //{$Message Warn 'Masih kurang where utk tipe member'}
  if Key = VK_F5 then
  begin
    if not Assigned(frmDialogSearchTypeMember) then
      frmDialogSearchTypeMember := TfrmDialogSearchTypeMember.Create(Self);

      frmDialogSearchTypeMember.DialogUnit := DialogUnit;
      frmDialogSearchTypeMember.ShowModal;

      if frmDialogSearchTypeMember.IsProcessSuccessfull then
      begin
//        strgGrid1.Cells[3,strgGrid1.Row] := IntToStr(frmDialogSearchTypeMember.TypeMemberID) +
//        '=' + frmDialogSearchTypeMember.TypeMemberName;
//        strgGrid1.Cells[22, strgGrid1.Row] := IntToStr(frmDialogSearchTypeMember.TypeMemberID);
      end;
      frmDialogSearchTypeMember.Free;
  end
  
end;

procedure TfrmDialogMemberShip.edtCompNameKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    cbbDocStatus.SetFocus;
end;

procedure TfrmDialogMemberShip.cbpCompTypeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    ParseCompanyType;
    cbpReference.SetFocus;
  end;
end;

procedure TfrmDialogMemberShip.ParseCompanyType;
begin
//  if cbpCompType.Row = 0 then Exit;
//
//  edtCompTypeName.Text := cbpCompType.Cells[2,cbpCompType.Row];
//
//
//  if not TryStrToInt(cbpCompType.Cells[0,cbpCompType.Row], TypePershID) then
//  begin
//    CommonDlg.ShowError('Perusahaan id tidak diketahui');
//    exit;
//  end;

end;

procedure TfrmDialogMemberShip.ParseReference;
begin
  try
//    ReferenceID := StrToInt(cbpReference.Cells[0,cbpReference.Row]);
  except
    //
  end;
end;

procedure TfrmDialogMemberShip.cbpReferenceKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    ParseReference;
    edtRefNo.SetFocus;
  end;  
end;

procedure TfrmDialogMemberShip.edtRefNoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    edtNPWP.SetFocus;
end;

procedure TfrmDialogMemberShip.edtNPWPKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    edtAdrress.SetFocus;
end;

procedure TfrmDialogMemberShip.edtAdrressKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    dtRegister.SetFocus;
end;

procedure TfrmDialogMemberShip.dtRegisterKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    edtKelurahan.SetFocus;
end;

procedure TfrmDialogMemberShip.edtKelurahanKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    edtCity.SetFocus;
end;

procedure TfrmDialogMemberShip.edtCityKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    edtPostCode.SetFocus;
end;

procedure TfrmDialogMemberShip.edtPostCodeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    edtTelephone.SetFocus;
end;

procedure TfrmDialogMemberShip.edtTelephoneKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    edtFaxNo.SetFocus;
end;

procedure TfrmDialogMemberShip.edtFaxNoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    cbbDocStatus.SetFocus;
end;

procedure TfrmDialogMemberShip.cbbDocStatusKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
//var memberId: string;
begin
  inherited;
  if Key = VK_RETURN then
  begin
    {if strgGrid1.Cells[0, 1] = '' then
    begin
      IsiRow(1);
    end;
    strgGrid1.SetFocus;}
  end;
end;

procedure TfrmDialogMemberShip.strgGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

procedure TfrmDialogMemberShip.lblDeleteRowClick(Sender: TObject);
var
  iMemberId: Integer;
begin
  inherited;
  {if Trim(strgGrid1.Cells[0,strgGrid1.Row]) = '' then Exit;
    
  if (CommonDlg.Confirm('Are you sure you wish to delete Card Number ( '+ strgGrid1.Cells[0, strgGrid1.Row] +')?') = mrYes) then
  begin
    with TMember.CreateWithUser(Self,FLoginId,dialogunit) do
    begin
      try
	    if not TryStrToInt(strgGrid1.Cells[_KolMemberID,strgGrid1.Row], iMemberId) then
        begin
          CommonDlg.ShowError('Member id tidak diketahui');
          exit;
        end;
		
        if LoadByID(iMemberId, dialogunit) then
        begin
          if RemoveFromDB then
          begin
            cCommitTrans;
            strgGrid1.ClearRows(strgGrid1.Row,1);
            strgGrid1.RemoveSelectedRows;

            if strgGrid1.RowCount = 1 then
            begin
              strgGrid1.RowCount := 2;
              strgGrid1.FixedRows := 1;
            end;
            CommonDlg.ShowMessage(CONF_DELETE_SUCCESSFULLY);
          end
          else
          begin
            cRollbackTrans;
            CommonDlg.ShowMessage(CONF_COULD_NOT_DELETE);
          end;
        end;        
      finally
        Free;
      end;
    end;    // with
  end;  }
end;

procedure TfrmDialogMemberShip.cbpCompTypeChange(Sender: TObject);
begin
  inherited;
//  edtCompTypeName.Text := cbpCompType.Cells[2,cbpCompType.Row];
end;

function TfrmDialogMemberShip.ConstructCardNo: string;
begin
//  if LastCardNo <> '' then
//    Result := TAppUtils.StrPadLeft(FloatToStr(StrToFloat(LastCardNo) + 1),11,'0')
//  else
//    Result := TMember.GetNewMemberCode(DialogUnit);

//  LastCardNo := Result;
end;

procedure TfrmDialogMemberShip.strgGrid1CellValidate(Sender: TObject; ACol,
  ARow: Integer; var Value: String; var Valid: Boolean);
begin
  inherited;
  case ACol of
    1 : if Value = '' then
        begin
          CommonDlg.ShowErrorEmpty('Member name');
          Valid:= False;
          Exit;
        end else
        begin
          if not Assigned(frmDialogPersonalMember) then
            frmDialogPersonalMember:= TfrmDialogPersonalMember.Create(Application);

          try
            frmDialogPersonalMember.Modul := mDialogMemberShip;
            frmDialogPersonalMember.FRow  := ARow;
            PersonalIdentity;

            frmDialogPersonalMember.DialogUnit := DialogUnit;
            frmDialogPersonalMember.ShowModal;
          finally
            frmDialogPersonalMember.Free;
          end;

          Valid:= True;
//          strgGrid1.Col:= 3;
//          strgGrid1.SetFocus;
        end;
    3000:  if Value = '5' then
        begin
          Value:= Value + '. GORO GOLD';
          Valid:= True;
//          ACol:= 3;
          SetFocus;
        end else if Value = '6' then
        begin
          Value:= Value + '. GORO GREEN';
          Valid:= True;
//          ACol:= 3;
          SetFocus;
        end else
        begin
          Valid:= False;
          Exit;
        end;
  end;
end;

procedure TfrmDialogMemberShip.PersonalIdentity;
begin
  {
  frmDialogPersonalMember.edtCardNo.Text      := strgGrid1.Cells[0, strgGrid1.Row];
  frmDialogPersonalMember.edtMemberName.Text  := strgGrid1.Cells[1, strgGrid1.Row];
  
  if strgGrid1.Cells[4, strgGrid1.Row] = '' then
    frmDialogPersonalMember.cbbWarganegara.ItemIndex := 0
  else
    frmDialogPersonalMember.cbbWarganegara.ItemIndex := StrToInt(strgGrid1.Cells[4, strgGrid1.Row]);

  frmDialogPersonalMember.edtTempatLhr.Text   := strgGrid1.Cells[5, strgGrid1.Row];

  if strgGrid1.Cells[6, strgGrid1.Row] = '' then
    frmDialogPersonalMember.dtLahir.Date      := Now
  else
    frmDialogPersonalMember.dtLahir.Date      := StrToFloat(strgGrid1.Cells[6, strgGrid1.Row]); //StrToDate(strgGrid1.Cells[6, strgGrid1.Row]);

  frmDialogPersonalMember.edtNoIdentts.Text   := strgGrid1.Cells[7, strgGrid1.Row];
  
  if strgGrid1.Cells[8, strgGrid1.Row] = '' then
    frmDialogPersonalMember.cbbGender.ItemIndex := 0
  else
    frmDialogPersonalMember.cbbGender.ItemIndex := StrToInt(strgGrid1.Cells[8, strgGrid1.Row]);

  if Trim(strgGrid1.Cells[_KolAgamaID, strgGrid1.Row]) = '' then
  begin
    frmDialogPersonalMember.cbpAgama.Text := '';
    frmDialogPersonalMember.AgamaID := ''; 
    frmDialogPersonalMember.Agama := ''; 
  end
  else
  begin
    frmDialogPersonalMember.cbpAgama.Text := strgGrid1.Cells[_KolAgama, strgGrid1.Row];
    frmDialogPersonalMember.AgamaID := strgGrid1.Cells[_KolAgamaID, strgGrid1.Row];
    frmDialogPersonalMember.Agama := strgGrid1.Cells[_KolAgama, strgGrid1.Row]; 
  end;


  frmDialogPersonalMember.edtAlamat.Text      := strgGrid1.Cells[10, strgGrid1.Row];
  frmDialogPersonalMember.edtRt.Text          := strgGrid1.Cells[11, strgGrid1.Row];
  frmDialogPersonalMember.edtRw.Text          := strgGrid1.Cells[12, strgGrid1.Row];
  frmDialogPersonalMember.edtKelurahan.Text   := strgGrid1.Cells[13, strgGrid1.Row];
  frmDialogPersonalMember.edtKecamatan.Text   := strgGrid1.Cells[14, strgGrid1.Row];
  frmDialogPersonalMember.edtKota.Text        := strgGrid1.Cells[15, strgGrid1.Row];
  frmDialogPersonalMember.edtPostCode.Text    := strgGrid1.Cells[16, strgGrid1.Row];
  frmDialogPersonalMember.edtTelp.Text        := strgGrid1.Cells[17, strgGrid1.Row];
  
  if strgGrid1.Cells[18, strgGrid1.Row] = '' then
    frmDialogPersonalMember.cbbStatus.ItemIndex := 0
  else
    frmDialogPersonalMember.cbbStatus.ItemIndex := StrToInt(strgGrid1.Cells[18, strgGrid1.Row]);

  frmDialogPersonalMember.edtJmlTanggungan.Text:= strgGrid1.Cells[19, strgGrid1.Row];
  frmDialogPersonalMember.edtPndptn.Text      := strgGrid1.Cells[20, strgGrid1.Row];
  }
end;

procedure TfrmDialogMemberShip.lblDetilPersonalClick(Sender: TObject);
begin
  inherited;
  {if (strgGrid1.RowCount > 1) and (strgGrid1.Cells[0, strgGrid1.Row] <> '') then
  begin
    if not Assigned(frmDialogPersonalMember) then
      frmDialogPersonalMember:= TfrmDialogPersonalMember.Create(Application);

    try
      frmDialogPersonalMember.Modul := mDialogMemberShip;
      frmDialogPersonalMember.FRow  := strgGrid1.Row;
      PersonalIdentity;

      frmDialogPersonalMember.DialogUnit := DialogUnit;
      frmDialogPersonalMember.ShowModal;
    finally
      frmDialogPersonalMember.Free;
    end;

    strgGrid1.Col:= 3;
    strgGrid1.SetFocus;
  end; }
end;

procedure TfrmDialogMemberShip.GetDataEdit;

  function DetilMember(IDMember: String): TDataSet;
  var
		sSQL: string;
  begin
    sSQL := 'SELECT MB.*, AG.AGAMA_NAME, TM.TPMEMBER_NAME '
      + 'FROM MEMBER MB '
      + 'LEFT JOIN REF$AGAMA AG ON AG.AGAMA_ID = MB.MEMBER_AGAMA_ID '
      + 'LEFT JOIN REF$TIPE_MEMBER TM ON TM.TPMEMBER_ID = MB.MEMBER_TPMEMBER_ID '
      + 'WHERE MB.MEMBER_ID = ' + IDMember;
//    Result := cOpenQuery(sSQL);
  end;

  procedure FetchDetilMember(AData: TDataSet);
  begin
    if not AData.IsEmpty then
    begin
      {strgGrid1.AddRow;
      strgGrid1.Cells[0, strgGrid1.RowCount-1]:= AData.FieldByName('MEMBER_CARD_NO').AsString;
      strgGrid1.Cells[1, strgGrid1.RowCount-1]:= AData.FieldByName('MEMBER_NAME').AsString;
      if AData.FieldByName('MEMBER_IS_MAIN').AsInteger = 1 then
      begin
        strgGrid1.Cells[2,strgGrid1.RowCount-1] :=  'MAIN';
        IsMainExist := True;
      end
      else
      begin
        strgGrid1.Cells[2,strgGrid1.RowCount-1] :=  'SUPLEMEN';
      end;

      strgGrid1.Cells[3,strgGrid1.RowCount-1] :=  AData.FieldByName('TPMEMBER_NAME').AsString;

      strgGrid1.Cells[4, strgGrid1.RowCount-1]:= AData.FieldByName('MEMBER_IS_WNI').AsString;
      strgGrid1.Cells[5, strgGrid1.RowCount-1]:= AData.FieldByName('MEMBER_PLACE_OF_BIRTH').AsString;
      strgGrid1.Cells[6, strgGrid1.RowCount-1]:= FloatToStr(AData.FieldByName('MEMBER_DATE_OF_BIRTH').AsFloat);
      strgGrid1.Cells[7, strgGrid1.RowCount-1]:= AData.FieldByName('MEMBER_KTP_NO').AsString;
      strgGrid1.Cells[8, strgGrid1.RowCount-1]:= AData.FieldByName('MEMBER_SEX').AsString;
      strgGrid1.Cells[_KolAgamaID, strgGrid1.RowCount-1] := AData.FieldByName('MEMBER_AGAMA_ID').AsString;
      strgGrid1.Cells[_KolAgama, strgGrid1.RowCount-1] := AData.FieldByName('AGAMA_NAME').AsString;
      strgGrid1.Cells[10, strgGrid1.RowCount-1]:= AData.FieldByName('MEMBER_ADDRESS').AsString;
      strgGrid1.Cells[11, strgGrid1.RowCount-1]:= AData.FieldByName('MEMBER_RT').AsString;
      strgGrid1.Cells[12, strgGrid1.RowCount-1]:= AData.FieldByName('MEMBER_RW').AsString;
      strgGrid1.Cells[13, strgGrid1.RowCount-1]:= AData.FieldByName('MEMBER_KELURAHAN').AsString;
      strgGrid1.Cells[14, strgGrid1.RowCount-1]:= AData.FieldByName('MEMBER_KECAMATAN').AsString;
      strgGrid1.Cells[15, strgGrid1.RowCount-1]:= AData.FieldByName('MEMBER_KOTA').AsString;
      strgGrid1.Cells[16, strgGrid1.RowCount-1]:= AData.FieldByName('MEMBER_POST_CODE').AsString;
      strgGrid1.Cells[17, strgGrid1.RowCount-1]:= AData.FieldByName('MEMBER_TELP').AsString;
      strgGrid1.Cells[18, strgGrid1.RowCount-1]:= AData.FieldByName('MEMBER_IS_MARRIED').AsString;
      strgGrid1.Cells[19, strgGrid1.RowCount-1]:= AData.FieldByName('MEMBER_JML_TANGGUNGAN').AsString;
      strgGrid1.Cells[20, strgGrid1.RowCount-1]:= AData.FieldByName('MEMBER_PENDAPATAN').AsString;
      strgGrid1.Cells[_KolGrupMemberID, strgGrid1.RowCount-1]:= AData.FieldByName('MEMBER_GROMEMBER_ID').AsString;
      strgGrid1.Cells[_KolGrupMemberUnitID, strgGrid1.RowCount-1]:= AData.FieldByName('MEMBER_GROMEMBER_UNT_ID').AsString;
      strgGrid1.Cells[_KolIsValid, strgGrid1.RowCount-1]:= AData.FieldByName('MEMBER_IS_VALID').AsString;
      strgGrid1.Cells[_KolIsActive, strgGrid1.RowCount-1]:= AData.FieldByName('MEMBER_IS_ACTIVE').AsString;
      strgGrid1.Cells[_KolTypeMemberID, strgGrid1.RowCount-1]:= AData.FieldByName('MEMBER_TPMEMBER_ID').AsString;
      strgGrid1.Cells[_KolMemberID, strgGrid1.RowCount-1]:= AData.FieldByName('MEMBER_ID').AsString;
      }
    end
  end;

var
  I: Integer;
  DataMember: TDataSet;
begin
  cbpCompType.Text := TipePerusahaan;
  cbpCompTypeChange(cbpCompType);
  cbpReference.Text := TipeDokumen;
  
//  strgGrid1.RowCount := 1;
  if ListOfMemberID <> nil then
  begin
    for I:= 0 to ListOfMemberID.Count-1 do
    begin
      DataMember:= DetilMember(ListOfMemberID[i]);
      FetchDetilMember(DataMember);
    end;
  end
  else
  begin
//    strgGrid1.AddRow;
//    IsiRow(strgGrid1.RowCount - 1);
  end;

//  strgGrid1.FixedRows:= 1;
//  strgGrid1.Col:= 0;
//  strgGrid1.SetFocus;
end;

procedure TfrmDialogMemberShip.IsiRow(ARow: Integer);
begin
  {strgGrid1.Cells[0, ARow] := ConstructCardNo;
  if not IsMainExist then
  begin 
	  //strgGrid1.Cells[2, ARow] := 'MAIN';
    strgGrid1.Cells[_KolIsMain, ARow] := 'MAIN';
    IsMainExist := True;
  end
  else
  begin
  	//strgGrid1.Cells[2, ARow] := 'SUPLEMEN';
    strgGrid1.Cells[_KolIsMain, ARow] := 'SUPLEMEN';
  end;  
  if MemberTypeList.Count > 0 then
  begin
    strgGrid1.Cells[3, ARow] := MemberTypeList[0];
    strgGrid1.Cells[_KolTypeMemberID, ARow] := MemberTypeIDList[0];
  end;
  strgGrid1.Cells[_KolMemberID, ARow] := '0';
  strgGrid1.Combobox.ItemIndex:= 0;

  strgGrid1.Row := ARow;
  strgGrid1.Col := 1; }
end;

procedure TfrmDialogMemberShip.LoadDropDownData(ACombo: TcxExtLookupComboBox; AData:
    TDataSet);
begin
//  ACombo.ClearGridData;

  //Make sure the allocated storage is big enough
  if not AData.Eof then
  begin
    AData.Last;
    AData.First;
//    ACombo.RowCount := AData.RecordCount + 1;
  end
  else
//    ACombo.RowCount := 2;

//  ACombo.ColCount := 3;

  //Load the data
  {
  if ACombo = cbpCompType then
  begin
    ACombo.AddRow(['','CODE','NAME']);
    if AData.RecordCount > 0 then
    begin
      while not AData.Eof do
      begin
        try
          ACombo.AddRow([AData.FieldByName('TPPERSH_ID').AsString,
                         AData.FieldByName('TPPERSH_CODE').AsString,
                         AData.FieldByName('TPPERSH_NAME').AsString]);
        except
        end;
        AData.Next;
      end; //END WHILE

      AData.First;
      while not AData.Eof do
      begin
        if AData.FieldByName('TPPERSH_IS_DEFAULT').AsInteger = 1 then
        begin
          cbpCompType.Value := AData.FieldByName('TPPERSH_CODE').AsString;
          cbpCompType.Text := AData.FieldByName('TPPERSH_CODE').AsString;
          Exit;
        end;
        AData.Next;
      end;
    end //END <> NIL
    else
    begin
      ACombo.AddRow([' ',' ',' ']);
    end;
  end;

  if ACombo = cbpReference then
  begin
    ACombo.AddRow(['','REF NAME']);
    if AData.RecordCount > 0 then
    begin
      while not AData.Eof do
      begin
        try
          ACombo.AddRow([AData.FieldByName('DOC_ID').AsString,
                         AData.FieldByName('DOC_NAME').AsString]);
        except
        end;
        AData.Next;
      end;//while
    end//END <> NIL
    else
    begin
      ACombo.AddRow([' ',' ',' ']);
    end;
  end; //if acombo =cbp1

  //Now shring the grid so its just big enough for the data
  ACombo.SizeGridToData;
  //trik to activate acombo
  ACombo.FixedRows := 1;
  }
end;

procedure TfrmDialogMemberShip.SetListOfMemberID(const Value: TStringList);
begin
  FListOfMemberID := Value;
end;

function TfrmDialogMemberShip.StrToIntTry(AString: String): Integer;
begin
	Result := -1;
  try
    if Trim(AString) <> '' then
    begin
      Result := StrToInt(AString);
    end;
  except
  end;
end;

function TfrmDialogMemberShip.StrToFloatTry(AString: String): Double;
begin
	Result := 0;
	try
		if Trim(AString) <> '' then
		begin
			Result := StrToFloat(AString);
		end;
	except
	end;
end;

procedure TfrmDialogMemberShip.lblAddRowClick(Sender: TObject);
begin
  inherited;
  {
  with strgGrid1 do
  begin
    if (RowCount = 2) and (Cells[0,1] = '') then
    begin
      IsiRow(RowCount - 1);
      Exit;
    end;   
  end;
      
  if strgGrid1.Cells[1,strgGrid1.RowCount-1] = '' then
  begin
    CommonDlg.ShowErrorEmpty('MEMBER NAME');
    strgGrid1.SetFocus;
    Exit;
  end
  else if strgGrid1.Cells[3,strgGrid1.RowCount-1] = '' then
  begin
    CommonDlg.ShowErrorEmpty('MEMBER TYPE');
    strgGrid1.SetFocus;
    Exit;
  end
  else
  begin
    strgGrid1.AddRow;
    IsiRow(strgGrid1.RowCount - 1);
  end;
  strgGrid1.SetFocus;
  }
end;

end.





