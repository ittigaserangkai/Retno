unit ufrmDialogDaftarKompetitor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ufrmMasterDialog, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxRadioGroup,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button, uClientClasses,
  uInterface, uModKompetitor;

type
  TfrmDialogDaftarKompetitor = class(TfrmMasterDialog, ICRUDAble)
    chkIsActive: TCheckBox;
    edtCompCode: TEdit;
    edtNama: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FDSClient: TDSProviderClient;
    FModKompetitor: TModKompetitor;
    procedure ClearForm;
    function GetDSClient: TDSProviderClient;
    function GetModKompetitor: TModKompetitor;
    function IsValidate: Boolean;
    procedure SavingData;
    property DSClient: TDSProviderClient read GetDSClient write FDSClient;
    property ModKompetitor: TModKompetitor read GetModKompetitor write
        FModKompetitor;
  public
    procedure LoadData(AID: string);
  end;

var
  frmDialogDaftarKompetitor: TfrmDialogDaftarKompetitor;

implementation

uses
  uTSCommonDlg, DB, uConstanta, uAppUtils, uDMClient;

{$R *.dfm}

procedure TfrmDialogDaftarKompetitor.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if TAppUtils.Confirm(CONF_VALIDATE_FOR_DELETE) then
  begin
    DMClient.CrudClient.DeleteFromDB(ModKompetitor);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.Close;
  end;
end;

procedure TfrmDialogDaftarKompetitor.actSaveExecute(Sender: TObject);
begin
  inherited;
  if IsValidate then
    SavingData;
end;

procedure TfrmDialogDaftarKompetitor.ClearForm;
begin
  edtCompCode.Clear;
  edtNama.Clear;
  chkIsActive.Checked   := True;
end;

procedure TfrmDialogDaftarKompetitor.FormCreate(Sender: TObject);
begin
  inherited;
  ClearForm;
  Self.AssignKeyDownEvent;
end;

procedure TfrmDialogDaftarKompetitor.FormDestroy(Sender: TObject);
begin
  frmDialogDaftarKompetitor := nil;
end;

function TfrmDialogDaftarKompetitor.GetDSClient: TDSProviderClient;
begin
  if not Assigned(FDSClient) then
    FDSClient := TDSProviderClient.Create(DMClient.RestConn);
  Result := FDSClient;
end;

function TfrmDialogDaftarKompetitor.GetModKompetitor: TModKompetitor;
begin
  if not Assigned(FModKompetitor) then
    FModKompetitor := TModKompetitor.Create;
  Result := FModKompetitor;
end;

function TfrmDialogDaftarKompetitor.IsValidate: Boolean;
begin
  Result := False;

  if edtCompCode.Text = '' then
  begin
    TAppUtils.Warning('Competitor Code belum diisi');
    exit;
  end else
  if edtNama.Text = '' then
  begin
    TAppUtils.Warning('Competitor Name belum diisi');
    exit;
  end else
    Result := True;
end;

procedure TfrmDialogDaftarKompetitor.LoadData(AID: string);
begin
  if Assigned(FModKompetitor) then
    FreeAndNil(FModKompetitor);

  FModKompetitor := DMClient.CrudClient.Retrieve(TModKompetitor.ClassName, AID) as TModKompetitor;

  edtCompCode.Text    := ModKompetitor.KOMPT_CODE;
  edtNama.Text        := ModKompetitor.KOMPT_NAME;
  chkIsActive.Checked := ModKompetitor.KOMPT_IS_ACTIVE = 1;
end;

procedure TfrmDialogDaftarKompetitor.SavingData;
begin
  ModKompetitor.KOMPT_CODE         := edtCompCode.Text;
  ModKompetitor.KOMPT_NAME         := edtNama.Text;
  ModKompetitor.KOMPT_IS_ACTIVE    := TAppUtils.BoolToInt(chkIsActive.Checked);

  Try
    DMClient.CrudClient.SaveToDB(ModKompetitor);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    ModalResult := mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    Raise;
  End;
end;

end.
