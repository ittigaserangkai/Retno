unit ufrmDialogBank;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls,
  StdCtrls, uRetnoUnit, uTSBaseClass, uModBank, uDMClient, uClientClasses,
  uDXUtils, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, DBClient, uDBUtils, uAppUtils;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogBank = class(TfrmMasterDialog)
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
    chkAllUnit: TCheckBox;
    cxLookupAccount: TcxExtLookupComboBox;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtRekKodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSaveClick(Sender: TObject);
  private
    FIsProcessSuccessfull: Boolean;
    FBankId: Integer;
    FCDSRekening: TClientDataSet;
    FCrud: TCrudClient;
    FDSClient: TDSProviderClient;
    FFormMode: TFormMode;
//    FBank : TBank;
    FKodeLama : string;
    FModBank: TModBank;
    function GetCDSRekening: TClientDataSet;
    function GetCrud: TCrudClient;
    function GetDSClient: TDSProviderClient;
    function GetModBank: TModBank;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: Boolean);
    procedure SetBankId(const Value: Integer);
    procedure prepareAddData;
    procedure SimpanData;
    function ValidateData: Boolean;
    property CDSRekening: TClientDataSet read GetCDSRekening write FCDSRekening;
    property Crud: TCrudClient read GetCrud write FCrud;
    property DSClient: TDSProviderClient read GetDSClient write FDSClient;
    property ModBank: TModBank read GetModBank write FModBank;
  public
    procedure LoadData(ID: string);
    { Public declarations }
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property BankId: Integer read FBankId write SetBankId;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogBank: TfrmDialogBank;
  IDLokal : Integer;
implementation

uses uTSCommonDlg, ufrmBank, uModAccount;

{$R *.dfm}

procedure TfrmDialogBank.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogBank.SetIsProcessSuccessfull(const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogBank.SetBankId(const Value: Integer);
begin
  FBankId := Value;
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

procedure TfrmDialogBank.FormShow(Sender: TObject);
begin
  inherited;
  if (FFormMode = fmEdit) then
  begin
//    FKodeLama := frmBank.strgGrid.Cells[0,frmBank.strgGrid.Row];
//    IDLokal := StrToInt(frmBank.strgGrid.Cells[4,frmBank.strgGrid.Row]);
//    if FBank.LoadByID(IDLokal) then
    begin
//      edtCode.text := FBank.Kode;
//      edtName.Text := FBank.Nama;
//      edtBranch.Text := FBank.Cabang;
//      edtAddress.Text := FBank.Alamat;
//      edtRekKode.Text := FBank.REK_CODE;
//      edtDescription.Text := FBank.Description;
    end;
  end
   // showDataEdit(BankId)
  else begin
    prepareAddData();
  end;
end;

procedure TfrmDialogBank.footerDialogMasterbtnSaveClick(Sender: TObject);
begin
  inherited;
  if (FormMode = fmAdd) then
  begin
  //  FIsProcessSuccessfull := SaveBank;
  //  if FIsProcessSuccessfull then
  //    Close;
  IDLokal := 0;
  end else
  begin
   // FIsProcessSuccessfull := UpdateBank;
    //if FIsProcessSuccessfull then
    //  Close;
//    IDLokal := StrToInt(frmBank.strgGrid.Cells[4,frmBank.strgGrid.Row]);
  end; // end if

  if edtCode.Text = '' then
  begin
    CommonDlg.ShowError('Kode Belum Diisi');
    edtCode.SetFocus;
    Exit;
  end;

  if edtName.Text = '' then
  begin
    CommonDlg.ShowError('Nama Belum Diisi');
    edtName.SetFocus;
    Exit;
  end;

  if edtBranch.Text = '' then
  begin
    CommonDlg.ShowError('Cabang Belum Diisi');
    edtBranch.SetFocus;
    Exit;
  end;

  if edtAddress.Text = '' then
  begin
    CommonDlg.ShowError('Alamat Belum Diisi');
    edtAddress.SetFocus;
    Exit;
  end;
  if Trim(edtRekKode.Text)<>'' then
  begin
//    if TBank.CekBankRekKode(DialogUnit, edtCode.Text, edtRekKode.Text) then
    begin
      CommonDlg.ShowError('Kode Rekening/Akun sudah digunakan oleh Bank lain.');
      edtRekKode.SetFocus;
      Exit;
    end;
  end;

{
  FBank.UpdateData(edtAddress.Text,
                    edtBranch.Text,
                    IDLokal,
                    edtCode.Text,
                    edtName.Text,
                    DialogUnit,
                    edtDescription.Text,
                    edtRekKode.Text,
                    DialogCompany
                    );
  if FBank.SaveToDB(FKodeLama) then
  begin
    cCommitTrans;
    CommonDlg.ShowMessage('Berhasil Menyimpan Data');
    frmBank.actRefreshBankExecute(Self);
    Close;
  end
  else
  begin
    cRollbackTrans;
    CommonDlg.ShowError('Data Gagal Disimpan');
    Exit;
  end;
}
end;

procedure TfrmDialogBank.FormCreate(Sender: TObject);
begin
  inherited;
//  FBank := uNewBank.TBank.Create(self);
  cxLookupAccount.Properties.LoadFromCDS(CDSRekening,'Rekening_ID','Rek_Name',['Rekening_ID'],Self);
  cxLookupAccount.Properties.SetMultiPurposeLookup;
end;

procedure TfrmDialogBank.btnSaveClick(Sender: TObject);
begin
  inherited;
  if ValidateData then SimpanData;
  Self.Close;

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

function TfrmDialogBank.GetCrud: TCrudClient;
begin
  if not Assigned(FCrud) then
    FCrud := TCrudClient.Create(DMClient.RestConn);
  Result := FCrud;
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

procedure TfrmDialogBank.LoadData(ID: string);
begin
  if Assigned(FModBank) then FreeAndNil(FModBank);
  FModBank := Crud.Retrieve(TModBank.ClassName, ID) as TModBank;

  edtCode.Text := ModBank.BANK_CODE;
  edtName.Text := ModBank.BANK_NAME;
  edtBranch.Text := ModBank.BANK_BRANCH;
  edtDescription.Text := ModBank.BANK_DESCRIPTION;
  edtAddress.Text := ModBank.BANK_ADDRESS;

  if Assigned(ModBank.BANK_REKENING) then
    cxLookupAccount.EditValue := ModBank.BANK_REKENING.ID;

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
    ModBank.BANK_REKENING := TModRekening.CreateID(cxLookupAccount.EditValue);
  end;

  Try
    Crud.SaveToDB(ModBank);
    TAppUtils.Information('Data Bank Berhasil Disimpan');


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
