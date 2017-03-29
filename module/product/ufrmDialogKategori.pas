unit ufrmDialogKategori;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, uModBarang, uInterface,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, Vcl.StdCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, uModSuplier;

type
  TfrmDialogKategori = class(TfrmMasterDialog, ICRUDAble)
    lbDivision: TLabel;
    cxLookupSubGroup: TcxExtLookupComboBox;
    edtCode: TEdit;
    lbKode: TLabel;
    lbNama: TLabel;
    edtName: TEdit;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FModKategori: TModKategori;
    function GetModKategori: TModKategori;
    function ValidateData: Boolean;
    { Private declarations }
  public
    procedure LoadData(AID: String);
    procedure SaveData;
    property ModKategori: TModKategori read GetModKategori write FModKategori;
    { Public declarations }
  end;

var
  frmDialogKategori: TfrmDialogKategori;

implementation

uses
  uAppUtils, uConstanta, uDMClient, uDXUtils;

{$R *.dfm}

procedure TfrmDialogKategori.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm(CONF_VALIDATE_FOR_DELETE) then exit;
  Try
    DMCLient.CrudClient.DeleteFromDB(ModKategori);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.ModalResult := mrOk;
    Self.Close;
  except
    TAppUtils.Error(ER_DELETE_FAILED);
    raise;
  End;
end;

procedure TfrmDialogKategori.actSaveExecute(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  SaveData;
  Self.ModalResult := mrOk;
end;

procedure TfrmDialogKategori.FormCreate(Sender: TObject);
begin
  inherited;
  cxLookupSubGroup.LoadFromDS(
    DMClient.DSProviderClient.SubGroup_GetDSLookup,
    'REF$SUB_GRUP_ID','SUBGRUP_NAME' ,
    ['REF$MERCHANDISE_GRUP_ID','REF$SUB_GRUP_ID'], Self);

  Self.AssignKeyDownEvent;
end;

function TfrmDialogKategori.GetModKategori: TModKategori;
begin
  if not Assigned(FModKategori) then
    FModKategori := TModKategori.Create;
  Result := FModKategori;
end;

procedure TfrmDialogKategori.LoadData(AID: String);
begin
  if Assigned(FModKategori) then FreeAndNil(FModKategori);
  FModKategori := DMClient.CrudClient.Retrieve(TModKategori.ClassName, aID) as TModKategori;
  edtCode.Text    := ModKategori.KAT_CODE;
  edtName.Text    := ModKategori.KAT_NAME;
  cxLookupSubGroup.EditValue := ModKategori.SubGroup.ID;
end;

procedure TfrmDialogKategori.SaveData;
begin
  ModKategori.KAT_CODE := edtCode.Text;
  ModKategori.KAT_NAME := edtName.Text;
  ModKategori.SubGroup := TModSubGroup.CreateID(cxLookupSubGroup.EditValue);
  Try
    ModKategori.ID         := DMClient.CrudClient.SaveToDBID(ModKategori);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  End;
end;

function TfrmDialogKategori.ValidateData: Boolean;
begin
  Result := False;
  if VarIsNull(cxLookupSubGroup.EditValue) then
  begin
    TAppUtils.Error('Sub Group wajib dipilih');
    exit;
  end;
  if edtCode.Text = '' then
  begin
    TAppUtils.Error('Kode tidak boleh kosong');
    exit;
  end;
  if edtName.Text = '' then
  begin
    TAppUtils.Error('Nama tidak boleh kosong');
    exit;
  end;
  Result := True;
end;

end.
