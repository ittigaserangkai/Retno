unit ufrmDialogBank;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, uInterface,
  StdCtrls, uRetnoUnit, uTSBaseClass, uModBank, uDMClient, uClientClasses,
  uDXUtils, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, DBClient, uDBUtils, uAppUtils,
  ufraFooterDialog3Button, System.Actions, Vcl.ActnList, cxCurrencyEdit;

type
  TfrmDialogBank = class(TfrmMasterDialog, ICRUDAble)
    lbl1: TLabel;
    Lbl2: TLabel;
    lbl3: TLabel;
    Label1: TLabel;
    edtName: TEdit;
    edtBranch: TEdit;
    edtAddress: TEdit;
    edtCode: TEdit;
    gbRekening: TGroupBox;
    lbl4: TLabel;
    lbl5: TLabel;
    edtRekKode: TEdit;
    edtDescription: TEdit;
    cxLookupAccount: TcxExtLookupComboBox;
    procedure actSaveExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtRekKodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnDeleteClick(Sender: TObject);
    procedure cxLookupAccountPropertiesEditValueChanged(Sender: TObject);
  private
    FCDSRekening: TClientDataSet;
    FDSClient: TDSProviderClient;
//    FBank : TBank;
    FKodeLama : string;
    FModBank: TModBank;
    function GetCDSRekening: TClientDataSet;
    function GetDSClient: TDSProviderClient;
    function GetModBank: TModBank;
    procedure prepareAddData;
    procedure SimpanData;
    function ValidateData: Boolean;
    property CDSRekening: TClientDataSet read GetCDSRekening write FCDSRekening;
    property DSClient: TDSProviderClient read GetDSClient write FDSClient;
    property ModBank: TModBank read GetModBank write FModBank;
  public
    procedure LoadData(AID: String);
    { Public declarations }
  published
  end;

var
  frmDialogBank: TfrmDialogBank;
  IDLokal : Integer;
implementation

uses uTSCommonDlg, ufrmBank, uModRekening;

{$R *.dfm}

procedure TfrmDialogBank.actSaveExecute(Sender: TObject);
begin
  inherited;
  if ValidateData then SimpanData;
end;

procedure TfrmDialogBank.prepareAddData;
begin
  edtCode.Clear;
  edtName.Clear;
  edtBranch.Clear;
  edtAddress.Clear;
end;

procedure TfrmDialogBank.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogBank := nil;
end;

procedure TfrmDialogBank.FormCreate(Sender: TObject);
begin
  inherited;
//  FBank := uNewBank.TBank.Create(self);
  prepareAddData();
  cxLookupAccount.Properties.LoadFromCDS(CDSRekening,'Rekening_ID','Rek_CODE',['Rekening_ID','REF$GRUP_REKENING_ID'],Self);
  cxLookupAccount.Properties.SetMultiPurposeLookup;

  AssignKeyDownEvent;
end;

procedure TfrmDialogBank.btnDeleteClick(Sender: TObject);
begin
  inherited;
  if TAppUtils.Confirm('Yakin hapus data?') then
  begin
    DMClient.CrudClient.DeleteFromDB(ModBank);
    TAppUtils.Information('Terhapus');
    Self.Close;
  end;
end;

procedure TfrmDialogBank.cxLookupAccountPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  edtDescription.Text := cxLookupAccount.DS.FieldByName('REK_NAME').AsString;
end;

procedure TfrmDialogBank.edtRekKodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sSQL: string;
begin
  inherited;
  if Key = VK_F5 then
  begin
    edtRekKode.Clear;
{      sSQL := 'select r.rek_code, r.rek_name, gr.GROREK_NAME, gr.GROREK_DESCRIPTION '
           + ' from rekening r '
           + ' Left Outer join REF$GRUP_REKENING gr on r.REK_GROREK_ID=gr.GROREK_ID and r.REK_GROREK_COMP_ID=gr.GROREK_COMP_ID'
           + ' where r.REK_COMP_ID = ' + IntToStr(DialogCompany)
           + ' and r.REK_IS_LEAF = 1 and Upper(gr.GROREK_NAME) in (''ASSETS'', ''CASH'')';
    with cLookUp('Daftar Rekening', sSQL) do
    begin
      try
        if Strings[0] = '' then Exit;
        edtRekKode.Text := Strings[0];
      finally
        Free;
      end;
    end;}
  end;

end;

function TfrmDialogBank.GetCDSRekening: TClientDataSet;
begin
  if not Assigned(FCDSRekening) then
  begin
    FCDSRekening := TDBUtils.DSToCDS( DSClient.Rekening_GetDSLookup, Self );
  end;
  Result := FCDSRekening;
end;

function TfrmDialogBank.GetDSClient: TDSProviderClient;
begin
  if not Assigned(FDSClient) then
    FDSClient := TDSProviderClient.Create(DMClient.RestConn);
  Result := FDSClient;
end;

function TfrmDialogBank.GetModBank: TModBank;
begin
  if not Assigned(FModBank) then
    FModBank := TModBank.Create;
  Result := FModBank;
end;

procedure TfrmDialogBank.LoadData(AID: String);
begin
  if Assigned(FModBank) then FreeAndNil(FModBank);
  FModBank := DMCLient.CrudClient.Retrieve(TModBank.ClassName, AID) as TModBank;

  edtCode.Text := ModBank.BANK_CODE;
  edtName.Text := ModBank.BANK_NAME;
  edtBranch.Text := ModBank.BANK_BRANCH;
  edtDescription.Text := ModBank.BANK_DESCRIPTION;
  edtAddress.Text := ModBank.BANK_ADDRESS;
  if Assigned(ModBank.REKENING) then
    if ModBank.REKENING.ID <> '' then
      cxLookupAccount.EditValue := ModBank.REKENING.ID;
end;

procedure TfrmDialogBank.SimpanData;
var
  lModRekening: TModRekening;
begin
  ModBank.BANK_CODE := edtCode.Text;
  ModBank.BANK_NAME := edtName.Text;
  ModBank.BANK_BRANCH := edtBranch.Text;
  ModBank.BANK_DESCRIPTION := edtDescription.Text;
  ModBank.BANK_ADDRESS := edtAddress.Text;
  if not VarIsNull(cxLookupAccount.EditValue) then
  begin
    ModBank.REKENING := TModRekening.CreateID(cxLookupAccount.EditValue);
  end;
  Try
    DMClient.CrudClient.SaveToDB(ModBank);
    TAppUtils.Information('Data Bank Berhasil Disimpan');
    ModalResult := mrOk;
  except
    TAppUtils.Error('Gagal Menyimpan Data Bank');
    Raise;
  End;

end;

function TfrmDialogBank.ValidateData: Boolean;
begin
  Result := False;
  if edtCode.Text = '' then
  begin
    TAppUtils.Warning('Kode Bank Belum Diset');
    exit;
  end;
  if edtName.Text = '' then
  begin
    TAppUtils.Warning('Nama Bank Belum Diset');
    exit;
  end;
  if VarIsNull(cxLookupAccount.EditValue) then
  begin
    TAppUtils.Warning('Rekening Bank Belum Diset');
    exit;
  end;
  if not Result then Result := True;

end;

end.
