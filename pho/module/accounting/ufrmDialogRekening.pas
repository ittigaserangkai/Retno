unit ufrmDialogRekening;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, uConn, StdCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxMaskEdit, cxButtonEdit, cxTextEdit, cxCurrencyEdit, uClientClasses,
  uModRekening,  uDMClient, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, uDbutils, DBClient, Vcl.Samples.Spin,
  cxSpinEdit, ufraFooterDialog3Button;

type
  TStatusForm = (frNew, frEdit);
  TfrmDialogRekening = class(TfrmMasterDialog)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    chkIsDebet: TCheckBox;
    chkIsLeaf: TCheckBox;
    edtRekCode: TEdit;
    edtRekName: TEdit;
    edtDescription: TEdit;
    lbl6: TLabel;
    lblGroup: TLabel;
    chkbs: TRadioButton;
    chkpl: TRadioButton;
    dbParentCode: TcxExtLookupComboBox;
    intedtLevel: TcxSpinEdit;
    dbAccountGroup: TcxExtLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtRekCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRekNameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure intedtLevelKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescriptionKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkIsDebetKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure edbParentCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edbParentCodeClickBtn(Sender: TObject);
  private
    FCDSRekening: tclientDataset;
    FCDSRekeningGroup: tclientDataset;
    FCrud: TCrudClient;
    FDsProvider: TDSProviderClient;
    FFormMode: TFormMode;
    FIsProcessSuccesfull: Boolean;
    FStatusForm: TStatusForm;
    FKodeGrupRekId: Integer;
    FModRekening: TModRekening;
    FRekCode: string;
    FParentCode: string;
    function ChekEmptyValue: Boolean;
    function GetCDSRekening: tclientDataset;
    function GetCDSRekeningGroup: tclientDataset;
    function GetCrud: TCrudClient;
    function GetDsProvider: TDSProviderClient;
    function GetModRekening: TModRekening;
//    function SaveDataRekening: Boolean;
//    function UpdateDataRekening: Boolean;
    procedure ParseDataRekening;
    procedure ParseComboGrupRekening;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccesfull(const Value: Boolean);
    procedure SetStatusForm(const Value: TStatusForm);
    procedure SetKodeGrupRekId(const Value: Integer);
    procedure SetRekCode(const Value: string);
    procedure SetParentCode(const Value: string);
    procedure SimpanData;
    property CDSRekening: tclientDataset read GetCDSRekening write FCDSRekening;
    property CDSRekeningGroup: tclientDataset read GetCDSRekeningGroup write
        FCDSRekeningGroup;
    property Crud: TCrudClient read GetCrud write FCrud;
    property DsProvider: TDSProviderClient read GetDsProvider write FDsProvider;
    property ModRekening: TModRekening read GetModRekening write FModRekening;
  public
    procedure HapusRekIfada(jenis : string; aheaderid : Integer);
    procedure LoadData(ID: String);
    property IsProcessSuccesfull: Boolean read FIsProcessSuccesfull write SetIsProcessSuccesfull;
    property StatusForm: TStatusForm read FStatusForm write SetStatusForm;
    property KodeGrupRekId: Integer read FKodeGrupRekId write SetKodeGrupRekId;
    property RekCode: string read FRekCode write SetRekCode;
    property ParentCode: string read FParentCode write SetParentCode;
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
  end;

var
  frmDialogRekening: TfrmDialogRekening;

implementation

uses  uConstanta, uTSCommonDlg, uRetnoUnit, DB, StrUtils, uAppUtils, uDXUtils;

{$R *.dfm}

procedure TfrmDialogRekening.FormCreate(Sender: TObject);
begin
  inherited;
  dbParentCode.Properties.LoadFromCDS(CDSRekening,'REKENING_ID', 'REK_NAME', ['REKENING_ID'] , self);
  dbParentCode.Properties.SetMultiPurposeLookup;
  dbAccountGroup.Properties.LoadFromCDS(CDSRekeningGroup,'REF$GRUP_REKENING_ID', 'GROREK_NAME', ['REF$GRUP_REKENING_ID'] , self);
  dbAccountGroup.Properties.SetMultiPurposeLookup;
end;

procedure TfrmDialogRekening.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogRekening.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogRekening := nil;
  frmDialogRekening.Free;
end;

procedure TfrmDialogRekening.ParseComboGrupRekening;
var
  s : string;
begin
  s := 'SELECT GROREK_ID, GROREK_NAME FROM REF$GRUP_REKENING'
     + ' WHERE GROREK_COMP_ID = ' + IntToStr(DialogCompany);
//  cQueryToComboObject(cmbAccountType, s);

end;

procedure TfrmDialogRekening.ParseDataRekening;
//var
//  FRekening: TMasterRekening;
begin
  {FRekening := TMasterRekening.Create(nil);

  try
    Self.Enabled := False;

    if FRekening.LoadByKode(RekCode, DialogCompany) then
    begin
      edtRekCode.Text     := FRekening.REK_CODE;
      edtRekName.Text     := FRekening.REK_NAME;
      intedtLevel.Value   := FRekening.REK_LEVEL;
      edtDescription.Text := FRekening.REK_DESCRIPTION;
      cSetItemAtComboObject(cmbAccountType, FRekening.REK_GROREK_ID);
      edbParentCode.Text  := FRekening.REK_PARENT_CODE;

      if FRekening.REK_IS_DEBET = 0 then
        chkIsDebet.Checked := False
      else
        chkIsDebet.Checked := True;

      if FRekening.REK_IS_LEAF = 0 then
        chkIsLeaf.Checked := False
      else
        chkIsLeaf.Checked := True;

      if FRekening.REK_IS_GROUP = 1 then
         chkBS.Checked := True
      else if FRekening.REK_IS_GROUP = 2 then
         chkPL.Checked := True
      else
      begin                 
         chkbs.Checked := False;
         chkpl.Checked := False;
      end;

    end;

  finally
    if FRekening <> nil then FreeAndNil(FRekening);
    Self.Enabled := True;
  end; }
end;

procedure TfrmDialogRekening.SetIsProcessSuccesfull(const Value: Boolean);
begin
  FIsProcessSuccesfull := Value;
end;

procedure TfrmDialogRekening.SetKodeGrupRekId(const Value: Integer);
begin
  FKodeGrupRekId := Value;
end;

procedure TfrmDialogRekening.SetRekCode(const Value: string);
begin
  FRekCode := Value;
end;

procedure TfrmDialogRekening.SetStatusForm(const Value: TStatusForm);
begin
  FStatusForm := Value;
end;

procedure TfrmDialogRekening.FormShow(Sender: TObject);
begin
  inherited;
  ParseComboGrupRekening;

  case StatusForm of
    frNew:
    begin
      RekCode := '';
      edtRekCode.SetFocus;
    end;

    frEdit:
    begin
      ParseDataRekening;
      edtRekName.SetFocus;
    end;
  end;
end;

procedure TfrmDialogRekening.edtRekCodeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
    edtRekName.SetFocus;
end;

procedure TfrmDialogRekening.edtRekNameKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
    intedtLevel.SetFocus;
end;

procedure TfrmDialogRekening.intedtLevelKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
  begin
    edtDescription.SetFocus;
  end;
end;

procedure TfrmDialogRekening.edtDescriptionKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
    dbAccountGroup.SetFocus;
end;

procedure TfrmDialogRekening.chkIsDebetKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
    chkIsLeaf.SetFocus;
end;

procedure TfrmDialogRekening.footerDialogMasterbtnSaveClick(
  Sender: TObject);
//var
//  iRekParentCompID: Integer;
//  isLeaf  : Integer;
//  IsDebet : Integer;
//  IsGroup : Integer;
//  Rekening: TMasterRekening;
//  S      : string;
//  pDiv   : Integer;
//  pDetail: Integer;
//  sSql   : string;
begin
  inherited;
  SimpanData();
  Self.Close;
//  {case StatusForm of
//    frNew:
//    begin
//      IsProcessSuccesfull := SaveDataRekening;
//
//      if IsProcessSuccesfull then
//        Close
//      else
//        CommonDlg.ShowError(ER_INSERT_FAILED);
//    end;
//    frEdit:
//    begin
//      IsProcessSuccesfull := UpdateDataRekening;
//
//      if IsProcessSuccesfull then
//        Close
//      else
//        CommonDlg.ShowError(ER_UPDATE_FAILED);
//    end;
//  end; }
//
//  try
//    ChekEmptyValue;
//    IsProcessSuccesfull := False;
//
//    Self.Enabled := False;
//
////    Rekening := TMasterRekening.Create(nil);
//
////    KodeGrupRekId := cGetIDfromCombo(cmbAccountType, cmbAccountType.ItemIndex);
//
//    if chkIsDebet.Checked then IsDebet := 1
//    else IsDebet := 0;
//
//    if chkIsLeaf.Checked then isLeaf := 1
//    else isLeaf := 0;
//
//    IsGroup := 0 ;
//    if chkBS.Checked then IsGroup := 1;
//    if chkPL.Checked then IsGroup := 2;
//
//
//
//    if intedtLevel.Value = 0 then iRekParentCompID := 0
//    else iRekParentCompID := DialogCompany;

//    Rekening.UpdateData(FLoginId, FLoginId,
//                        edtRekCode.Text, DialogCompany,
//                        edtDescription.Text, DialogCompany, KodeGrupRekId,
//                        IsDebet, isLeaf, intedtLevel.Value, edtRekName.Text,
//                        edbParentCode.Text, iRekParentCompID, Isgroup);

//    if Rekening.ExecuteGenerateSQL(RekCode) then
//    begin
//      cCommitTrans;
//      FIsProcessSuccesfull := True;
//    end
//    else
//    begin
//      cRollbackTrans;
//      FIsProcessSuccesfull := False;
//    end;
//
//    if (LeftStr(edtRekCode.Text,1) = '1') or (LeftStr(edtRekCode.Text,1) = '4') or (LeftStr(edtRekCode.Text,1) = '7') then
//        pDiv := 0
//    else
//        pDiv := 1;
//
//    if isLeaf = 1 then
//        pDetail := 0
//    else
//        pDetail := 1;
//
////
//    IF IsGroup = 1 then
//      begin
//        sSql := 'SELECT * FROM REKENING_BS WHERE REKBS_CODE = ' + Quot(Rekening.REK_CODE) + ' AND  REKBS_COMP_ID = ' + IntToStr( Rekening.REK_COMP_ID);
//        with cOpenQuery(sSQL) do
//        begin
//          try
//             if not FieldByName('REKBS_CODE').IsNull then
//              begin
//                HapusRekIfada('PL', Rekening.GetHeaderFlag);
//                S := 'update REKENING_BS set '
//                + ' OP_MODIFY = ' + IntToStr( FLoginId) + ','
//                + ' REKBS_DIVISION = ' + IntToStr( pDiv) + ','
//                + ' REKBS_IS_HEADER =' + IntToStr( pDetail) + ','
//                + ' REKBS_IS_SUB_TOTAL =' + IntToStr( pDetail)
//                + ' WHERE REKBS_CODE = ' + Quot(Rekening.REK_CODE) + ' AND  REKBS_COMP_ID = ' + IntToStr( Rekening.REK_COMP_ID) + ';';
//              end
//            else
//              S := 'Insert into REKENING_BS ( OP_CREATE, REKBS_CODE, REKBS_COMP_ID,REKBS_DIVISION,REKBS_IS_HEADER,REKBS_IS_SUB_TOTAL ) values ('
//              + IntToStr( FLoginId) + ', '
//              + Quot(Rekening.REK_CODE) + ','
//              + IntToStr( Rekening.REK_COMP_ID) + ','
//              + IntToStr( pDiv) + ','
//              + IntToStr( pDetail) + ','
//              + IntToStr( pDetail) + ');';
//          finally
//            Free;
//          end;
//        end;
//      end
//    else IF IsGroup = 2 Then
//      begin
//
//        sSql := 'SELECT * FROM REKENING_PL WHERE REKPL_CODE = ' + Quot(Rekening.REK_CODE) + ' AND  REKPL_COMP_ID = ' + IntToStr( Rekening.REK_COMP_ID);
//          with cOpenQuery(sSQL) do
//          begin
//            try
//              if not FieldByName('REKPL_CODE').IsNull then
//               begin
//                HapusRekIfada('BS', Rekening.GetHeaderFlag);
//                S := 'update REKENING_PL set '
//                + ' OP_MODIFY = ' + IntToStr( FLoginId) + ','
//                + ' REKPL_CODE = ' + Quot(Rekening.REK_CODE) + ','
//                + ' REKPL_COMP_ID = ' + IntToStr( Rekening.REK_COMP_ID) + ','
//                + ' REKPL_DIVISION = ' + IntToStr( pDiv) + ','
//                + ' REKPL_IS_HEADER =' + IntToStr( pDetail) + ','
//                + ' REKPL_IS_SUB_TOTAL =' + IntToStr( pDetail)
//                + ' WHERE REKPL_CODE = ' + Quot(Rekening.REK_CODE) + ' AND  REKPL_COMP_ID = ' + IntToStr( Rekening.REK_COMP_ID) + ';';
//               end
//             else
//              S := 'Insert into REKENING_PL ( OP_CREATE, REKPL_CODE, REKPL_COMP_ID,REKPL_DIVISION,REKPL_IS_HEADER,REKPL_IS_SUB_TOTAL ) values ('
//              + IntToStr( FLoginId) + ', '
//              + Quot(Rekening.REK_CODE) + ','
//              + IntToStr( Rekening.REK_COMP_ID) + ','
//              + IntToStr( pDiv) + ','
//              + IntToStr( pDetail) + ','
//              + IntToStr( pDetail) + ');';
//          finally
//            Free;
//          end;
//
//       end;
//      end;
//
//    if not cExecSQL(S, False, Rekening.GetHeaderFlag) then
//    begin
//      CommonDlg.ShowError('Data BS / PL Gagal Disimpan');
//      cRollbackTrans;
////      Exit;
////    end
////    else
////      cCommitTrans;
//
//
//  finally
//    Self.Enabled := True;
////    if Rekening <> Nil Then FreeAndNil(Rekening);
//    if FIsProcessSuccesfull then Close;
//  end;
end;

function TfrmDialogRekening.ChekEmptyValue: Boolean;
begin
  Result := False;
  if (edtRekCode.Text = '') then
  begin
    CommonDlg.ShowError('Rekening Code Is Empty');
    edtRekCode.SetFocus;
    Exit;
  end;


  if dbAccountGroup.Text = '' then
  begin
    CommonDlg.ShowError('Rekening Group Is Empty');
    dbAccountGroup.SetFocus;
    Exit;
  end;
  Result := True;
end;

procedure TfrmDialogRekening.SetParentCode(const Value: string);
begin
  FParentCode := Value;
end;

procedure TfrmDialogRekening.edbParentCodeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_DOWN) OR (Key = VK_F5) then
    edbParentCodeClickBtn(Self)
  else if (Key = VK_RETURN) then
    chkBS.SetFocus;
end;

procedure TfrmDialogRekening.edbParentCodeClickBtn(Sender: TObject);
var
  s: string;
begin
  inherited;
  if intedtLevel.Value = 0 then exit;
//  KodeGrupRekId := cGetIDfromCombo(cmbAccountType, cmbAccountType.ItemIndex);

  s := 'SELECT REK_CODE as KODE, REK_NAME as NAMAREKENING FROM REKENING'
     + ' WHERE REK_LEVEL < ' + VarToStr(intedtLevel.EditValue)
     + ' AND REK_IS_LEAF = 0'
     + ' AND REK_COMP_ID = ' + IntToStr(DialogCompany)
     + ' AND REK_GROREK_ID = ' + IntToStr(KodeGrupRekId);
//  with clookup('Daftar Rekening', s) do
//  begin
//    Try
//      if Strings[0] = '' then Exit;
//      edbParentCode.Text := Strings[0];
//
//    Finally
//      Free;
//    End;
//  end;
end;

function TfrmDialogRekening.GetCDSRekening: tclientDataset;
begin
  if not assigned(FCDSRekening) then
    fCDSRekening := Tdbutils.DSToCDS(DsProvider.Rekening_GetDSLookup, self);
  Result := FCDSRekening;
end;

function TfrmDialogRekening.GetCDSRekeningGroup: tclientDataset;
begin
  if not assigned(FCDSRekeningGroup) then
    FCDSRekeningGroup := Tdbutils.DSToCDS(DsProvider.GroupRekening_GetDSLookup, self);
  Result := FCDSRekeningGroup;
end;

function TfrmDialogRekening.GetCrud: TCrudClient;
begin
  if not Assigned(FCrud) then
    fCrud := TCrudClient.Create(DMClient.RestConn, FALSE);
  Result := FCrud;
end;

function TfrmDialogRekening.GetDsProvider: TDSProviderClient;
begin
  if not assigned(FDsProvider) then
    FDsProvider := TDSProviderClient.Create(DmClient.RestConn,False);
  Result := FDsProvider;
end;

function TfrmDialogRekening.GetModRekening: TModRekening;
begin
  if not Assigned(FModRekening) then
    FModRekening := TModRekening.Create();
  Result := FModRekening;
end;

procedure TfrmDialogRekening.HapusRekIfada(jenis : string; aheaderid : Integer);
var
  sSql : string;
begin
   if jenis='BS' then
      begin
       sSql := ' delete from rekening_bs where'
             + ' rekbs_code = ' + QuotedStr(Trim(edtRekCode.Text))
             + ' and rekbs_comp_id = ' + IntToStr(DialogCompany);
      end
   else if jenis='PL' then
      begin
       sSql := ' delete from rekening_pl where'
             + ' rekpl_code = ' + QuotedStr(Trim(edtRekCode.Text))
             + ' and rekpl_comp_id = ' + IntToStr(DialogCompany);
      end;
//    if not cExecSQL(sSql, False, aheaderid) then
//    begin
//      CommonDlg.ShowError('Gagal Hapus');
//      cRollbackTrans;
//      Exit;
//    end;

end;

procedure TfrmDialogRekening.LoadData(ID: String);
begin
  if Assigned(fModRekening) then FreeAndNil(fModRekening);
  fModRekening := Crud.Retrieve(TModRekening.ClassName, ID) as TModRekening;

  edtRekCode.Text := ModRekening.REK_CODE;
  edtRekName.Text := ModRekening.REK_NAME;
  intedtLevel.Value := ModRekening.REK_CODE;
  edtDescription.Text := ModRekening.REK_DESCRIPTION;
  if Assigned(ModRekening.RekeningGroup) then
    dbAccountGroup.EditValue := ModRekening.RekeningGroup.ID;
  if Assigned(ModRekening.REK_PARENT) then
    dbParentCode.EditValue := ModRekening.REK_PARENT.ID;
  if ModRekening.REK_IS_GROUP = 1 then chkbs.Checked := true else chkpl.Checked := true;
  if ModRekening.REK_IS_DEBET = 1 then cHKisDebet.Checked := true else cHKisDebet.Checked := false;
  if ModRekening.REK_IS_LEAF = 1 then cHKisLeaf.Checked := true else cHKisLeaf.Checked := false;
end;

{ TfrmDialogRekening }

procedure TfrmDialogRekening.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogRekening.SimpanData;
var
  isLeaf  : Integer;
  IsDebet : Integer;
  IsGroup : Integer;
begin
  try
    if not ChekEmptyValue then exit;
    IsProcessSuccesfull := False;

    Self.Enabled := False;

    if chkIsDebet.Checked then IsDebet := 1
    else IsDebet := 0;

    if chkIsLeaf.Checked then isLeaf := 1
    else isLeaf := 0;

    IsGroup := 0 ;
    if chkBS.Checked then IsGroup := 1;
    if chkPL.Checked then IsGroup := 2;

  finally
    Self.Enabled := True;
    if FIsProcessSuccesfull then Close;
  end;
  ModRekening.REK_CODE := edtRekCode.Text;
  ModRekening.REK_NAME := edtRekName.Text;
  ModRekening.REK_LEVEL := intedtLevel.Value;
  ModRekening.REK_DESCRIPTION := edtDescription.Text;
  ModRekening.RekeningGroup := TModRekeningGroup.CreateID(dbAccountGroup.EditValue);
  ModRekening.REK_PARENT := TModRekening.CreateID(dbParentCode.EditValue);
  ModRekening.REK_IS_DEBET := isDebet;
  ModRekening.REK_IS_LEAF := isLeaf;
  ModRekening.REK_IS_GROUP := isGroup;
  try
    Crud.SaveToDB(MODRekening);
    TAppUtils.Information('Simpan Berhasil.');
  except
    TAppUtils.Error('Gagal Menyimpan Data.');
    Raise
  end;
end;

end.
