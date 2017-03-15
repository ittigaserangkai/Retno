unit ufrmDialogSubGroup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, uInterface, uModBarang;

type
  TfrmDialogSubGroup = class(TfrmMasterDialog, ICRUDAble)
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FModMerchandiseGroup: TModMerchandiseGroup;
    function GetModMerchandiseGroup: TModMerchandiseGroup;
    function ValidateData: Boolean;
    { Private declarations }
  public
    procedure LoadData(AID: String);
    procedure SaveData;
    property ModMerchandiseGroup: TModMerchandiseGroup read GetModMerchandiseGroup
        write FModMerchandiseGroup;
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
    DMCLient.CrudClient.DeleteFromDB(ModMerchandiseGroup);
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
//  cxLookupMerchan.LoadFromDS(DMClient.DSProviderClient.Merchandise_GetDSLookup,
//      'REF$MERCHANDISE_ID','MERCHAN_NAME' ,['REF$MERCHANDISE_ID'], Self);
//
//  Self.AssignKeyDownEvent;
end;

function TfrmDialogSubGroup.GetModMerchandiseGroup: TModMerchandiseGroup;
begin
  if not Assigned(FModMerchandiseGroup) then
    FModMerchandiseGroup := TModMerchandiseGroup.Create;
  Result := FModMerchandiseGroup;
end;

procedure TfrmDialogSubGroup.LoadData(AID: String);
begin
  if Assigned(FModMerchandiseGroup) then FreeAndNil(FModMerchandiseGroup);
  FModMerchandiseGroup := DMClient.CrudClient.Retrieve(TModMerchandiseGroup.ClassName, aID) as TModMerchandiseGroup;
//  edtCode.Text    := ModMerchandiseGroup.MERCHANGRUP_CODE;
//  edtName.Text    := ModMerchandiseGroup.MERCHANGRUP_NAME;
//  cxLookupMerchan.EditValue := ModMerchandiseGroup.Merchandise.ID;
end;

procedure TfrmDialogSubGroup.SaveData;
begin
//  ModMerchandiseGroup.MERCHANGRUP_CODE := edtCode.Text;
//  ModMerchandiseGroup.MERCHANGRUP_NAME := edtName.Text;
//  ModMerchandiseGroup.Merchandise := TModMerchandise.CreateID(cxLookupMerchan.EditValue);
  Try
    ModMerchandiseGroup.ID         := DMClient.CrudClient.SaveToDBID(ModMerchandiseGroup);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  End;

end;

function TfrmDialogSubGroup.ValidateData: Boolean;
begin
//  Result := False;
//  if VarIsNull(cxLookupMerchan.EditValue) then
//  begin
//    TAppUtils.Error('Merchandise wajib dipilih');
//    exit;
//  end;
//  if edtCode.Text = '' then
//  begin
//    TAppUtils.Error('Kode tidak boleh kosong');
//    exit;
//  end;
//  if edtName.Text = '' then
//  begin
//    TAppUtils.Error('Nama tidak boleh kosong');
//    exit;
//  end;
//  Result := True;
end;

end.
