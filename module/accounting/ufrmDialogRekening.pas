unit ufrmDialogRekening;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, uConn, StdCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxMaskEdit, cxButtonEdit, cxTextEdit, cxCurrencyEdit, uClientClasses,
  uModRekening,  uDMClient, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, uDbutils, DBClient, Vcl.Samples.Spin,
  cxSpinEdit, ufraFooterDialog3Button, System.Actions, Vcl.ActnList,
  uInterface;

type
  TStatusForm = (frNew, frEdit);
  TfrmDialogRekening = class(TfrmMasterDialog, iCrudable)
    lbl1: TLabel;
    lbl2: TLabel;
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
    dbAccountGroup: TcxExtLookupComboBox;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
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
    procedure edbParentCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edbParentCodeClickBtn(Sender: TObject);
    procedure dbAccountGroupKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbParentCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkplKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chkbsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure intedtLevelPropertiesEditValueChanged(Sender: TObject);
  private
    FCDS: TClientDataSet;
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

uses  uConstanta, uTSCommonDlg, uRetnoUnit, DB, StrUtils, uAppUtils, uDXUtils,
  ufrmProductType;

{$R *.dfm}

procedure TfrmDialogRekening.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.ConfirmHapus then Exit;
  Try
    DMClient.CrudClient.DeleteFromDB(ModRekening);
    Self.ModalResult := mrOK;
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
  Except
    TAppUtils.Error(ER_DELETE_FAILED);
    Raise
  End;
  Self.Close;
end;

procedure TfrmDialogRekening.actSaveExecute(Sender: TObject);
begin
  inherited;
  SimpanData();
end;

procedure TfrmDialogRekening.FormCreate(Sender: TObject);
begin
  inherited;
  dbParentCode.Properties.LoadFromCDS(CDSRekening,'REKENING_ID', 'REK_NAME', ['REKENING_ID', 'REK_LEVEL'] , self);
  dbParentCode.Properties.SetMultiPurposeLookup;
  dbAccountGroup.Properties.LoadFromCDS(CDSRekeningGroup,'REF$GRUP_REKENING_ID', 'GROREK_NAME', ['REF$GRUP_REKENING_ID'] , self);
  dbAccountGroup.Properties.SetMultiPurposeLookup;

  intedtLevelPropertiesEditValueChanged(Self);

  self.ClearByTag([0]);
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
  if (Key = VK_RETURN) and (edtRekCode.Text <> '') then
    edtRekName.SetFocus;
end;

procedure TfrmDialogRekening.edtRekNameKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) and (edtRekName.Text <> '') then
    edtDescription.SetFocus;
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

procedure TfrmDialogRekening.intedtLevelPropertiesEditValueChanged(
  Sender: TObject);
var
  lDS: TClientDataSet;
begin
  inherited;
//  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.Rekening_GetDSLookupLvl(intedtLevel.Value), Self);
//  dbParentCode.Properties.LoadFromCDS(FCDS,'REKENING_ID', 'REK_NAME', ['REKENING_ID', 'REK_LEVEL'] , self);

  lDS := dbParentCode.CDS;
  if not Assigned(lDS) then exit;
end;

procedure TfrmDialogRekening.edtDescriptionKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) and (edtDescription.Text <> '') then
    dbAccountGroup.SetFocus;
end;

procedure TfrmDialogRekening.chkbsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
    chkIsDebet.SetFocus;
end;

procedure TfrmDialogRekening.chkIsDebetKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
    chkIsLeaf.SetFocus;
end;

procedure TfrmDialogRekening.chkplKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
    chkIsDebet.SetFocus;
end;

procedure TfrmDialogRekening.dbAccountGroupKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
    dbParentCode.SetFocus;
end;

procedure TfrmDialogRekening.dbParentCodeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
    chkbs.SetFocus;
end;

function TfrmDialogRekening.ChekEmptyValue: Boolean;
begin
  Result := False;
  if (edtRekCode.Text = '') then
  begin
    TAppUtils.Warning('Account Code Tidak Boleh Kosong');
    edtRekCode.SetFocus;
    Exit;
  end;

  if (edtRekName.Text = '') then
  begin
    TAppUtils.Warning('Nama Rekening Tidak Boleh Kosong');
    edtRekName.SetFocus;
    Exit;
  end;

  if (dbAccountGroup.Text = '') then
  begin
    TAppUtils.Warning('Account Group Tidak Boleh Kosong');
    dbAccountGroup.SetFocus;
    Exit;
  end;

  if (dbParentCode.Text = '') then
  begin
    TAppUtils.Warning('Parent Code Tidak Boleh Kosong');
    dbParentCode.SetFocus;
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
begin
  inherited;
//  if intedtLevel.Value = 0 then exit;
////  KodeGrupRekId := cGetIDfromCombo(cmbAccountType, cmbAccountType.ItemIndex);
//
//  s := 'SELECT REK_CODE as KODE, REK_NAME as NAMAREKENING FROM REKENING'
//     + ' WHERE REK_LEVEL < ' + VarToStr(intedtLevel.EditValue)
//     + ' AND REK_IS_LEAF = 0'
//     + ' AND REK_COMP_ID = ' + IntToStr(DialogCompany)
//     + ' AND REK_GROREK_ID = ' + IntToStr(KodeGrupRekId);
////  with clookup('Daftar Rekening', s) do
////  begin
////    Try
////      if Strings[0] = '' then Exit;
////      edbParentCode.Text := Strings[0];
////
////    Finally
////      Free;
////    End;
////  end;
end;

function TfrmDialogRekening.GetCDSRekening: tclientDataset;
begin
  if not assigned(FCDSRekening) then
    fCDSRekening := Tdbutils.DSToCDS(DsProvider.Rekening_GetDSLookupLvl, self);
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

procedure TfrmDialogRekening.LoadData(ID: String);
begin
  if Assigned(fModRekening) then FreeAndNil(fModRekening);
  fModRekening := Crud.Retrieve(TModRekening.ClassName, ID) as TModRekening;

  edtRekCode.Text := ModRekening.REK_CODE;
  edtRekName.Text := ModRekening.REK_NAME;
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
  ModRekening.REK_DESCRIPTION := edtDescription.Text;
  ModRekening.RekeningGroup := TModRekeningGroup.CreateID(dbAccountGroup.EditValue);
  ModRekening.REK_PARENT := TModRekening.CreateID(dbParentCode.EditValue);
  ModRekening.REK_IS_DEBET := isDebet;
  ModRekening.REK_IS_LEAF := isLeaf;
  ModRekening.REK_IS_GROUP := isGroup;
  try
    Crud.SaveToDB(MODRekening);
    TAppUtils.Information('Simpan Berhasil.');
    ModalResult := mrOK;
  except
    TAppUtils.Error('Gagal Menyimpan Data.');
    edtRekCode.SetFocus;
    Raise
  end;
end;

end.
