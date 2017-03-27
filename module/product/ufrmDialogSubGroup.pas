unit ufrmDialogSubGroup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, uInterface, uModBarang,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, Vcl.StdCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, uModSuplier;

type
  TfrmDialogSubGroup = class(TfrmMasterDialog, ICRUDAble)
    lbDivision: TLabel;
    cxLookupMerGroup: TcxExtLookupComboBox;
    edtCode: TEdit;
    lbKode: TLabel;
    lbNama: TLabel;
    edtName: TEdit;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FModSubGroup: TModSubGroup;
    function GetModSubGroup: TModSubGroup;
    function ValidateData: Boolean;
    { Private declarations }
  public
    procedure LoadData(AID: String);
    procedure SaveData;
    property ModSubGroup: TModSubGroup read GetModSubGroup write FModSubGroup;
    { Public declarations }
  end;

var
  frmDialogSubGroup: TfrmDialogSubGroup;

implementation

uses
  uAppUtils, uConstanta, uDMClient, uDXUtils;

{$R *.dfm}

procedure TfrmDialogSubGroup.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm(CONF_VALIDATE_FOR_DELETE) then exit;
  Try
    DMCLient.CrudClient.DeleteFromDB(ModSubGroup);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.ModalResult := mrOk;
    Self.Close;
  except
    TAppUtils.Error(ER_DELETE_FAILED);
    raise;
  End;
end;

procedure TfrmDialogSubGroup.actSaveExecute(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  SaveData;
  Self.ModalResult := mrOk;
end;

procedure TfrmDialogSubGroup.FormCreate(Sender: TObject);
begin
  inherited;
  cxLookupMerGroup.LoadFromDS(
    DMClient.DSProviderClient.MerchandiseGroup_GetDSLookup,
    'REF$MERCHANDISE_GRUP_ID','MERCHANGRUP_NAME' ,
    ['REF$MERCHANDISE_GRUP_ID','REF$MERCHANDISE_ID'], Self);

  Self.AssignKeyDownEvent;
end;

function TfrmDialogSubGroup.GetModSubGroup: TModSubGroup;
begin
  if not Assigned(FModSubGroup) then
    FModSubGroup := TModSubGroup.Create;
  Result := FModSubGroup;
end;

procedure TfrmDialogSubGroup.LoadData(AID: String);
begin
  if Assigned(FModSubGroup) then FreeAndNil(FModSubGroup);
  FModSubGroup := DMClient.CrudClient.Retrieve(TModSubGroup.ClassName, aID) as TModSubGroup;
  edtCode.Text    := ModSubGroup.SUBGRUP_CODE;
  edtName.Text    := ModSubGroup.SUBGRUP_NAME;
  cxLookupMerGroup.EditValue := ModSubGroup.MerchandiseGroup.ID;
end;

procedure TfrmDialogSubGroup.SaveData;
begin
  ModSubGroup.SUBGRUP_CODE := edtCode.Text;
  ModSubGroup.SUBGRUP_NAME := edtName.Text;
  ModSubGroup.MerchandiseGroup := TModMerchandiseGroup.CreateID(cxLookupMerGroup.EditValue);
  Try
    ModSubGroup.ID         := DMClient.CrudClient.SaveToDBID(ModSubGroup);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  End;

end;

function TfrmDialogSubGroup.ValidateData: Boolean;
begin
  Result := False;
  if VarIsNull(cxLookupMerGroup.EditValue) then
  begin
    TAppUtils.Error('Merchandise Group wajib dipilih');
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
