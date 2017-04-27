unit ufrmDialogMerchandise;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  ufrmMasterDialog, System.Actions, Vcl.ActnList, ufraFooterDialog3Button,
  Vcl.ExtCtrls, Vcl.StdCtrls, uModBarang, uInterface, uModSuplier;

type
  TfrmDialogMerchandise = class(TfrmMasterDialog, ICRUDAble)
    lbKode: TLabel;
    edtCode: TEdit;
    edtName: TEdit;
    lbNama: TLabel;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FModMerchandise: TModMerchandise;
    function GetModMerchandise: TModMerchandise;
    { Private declarations }
  public
    procedure LoadData(AID: String);
    procedure SaveData;
    property ModMerchandise: TModMerchandise read GetModMerchandise write
        FModMerchandise;
    { Public declarations }
  end;

var
  frmDialogMerchandise: TfrmDialogMerchandise;

implementation

uses
  uDMClient, uDXUtils, uApputils, uConstanta;

{$R *.dfm}

procedure TfrmDialogMerchandise.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm(CONF_VALIDATE_FOR_DELETE) then exit;
  Try
    DMCLient.CrudClient.DeleteFromDB(ModMerchandise);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.Close;
  except
    TAppUtils.Error(ER_DELETE_FAILED);
    raise;
  End;
end;

procedure TfrmDialogMerchandise.actSaveExecute(Sender: TObject);
begin
  inherited;
  SaveData;
  Self.ModalResult := mrOk;
end;

procedure TfrmDialogMerchandise.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
end;

function TfrmDialogMerchandise.GetModMerchandise: TModMerchandise;
begin
  if not Assigned(FModMerchandise) then
    FModMerchandise := TModMerchandise.Create;
  Result := FModMerchandise;
end;

procedure TfrmDialogMerchandise.LoadData(AID: String);
begin
  if Assigned(FModMerchandise) then FreeAndNil(FModMerchandise);
  FModMerchandise := DMClient.CrudClient.Retrieve(TModMerchandise.ClassName, aID) as TModMerchandise;
  edtCode.Text    := ModMerchandise.MERCHAN_CODE;
  edtName.Text    := ModMerchandise.MERCHAN_NAME;
end;

procedure TfrmDialogMerchandise.SaveData;
begin
  if not ValidateEmptyCtrl then exit;
  ModMerchandise.MERCHAN_CODE := edtCode.Text;
  ModMerchandise.MERCHAN_NAME := edtName.Text;
  Try
    ModMerchandise.ID         := DMClient.CrudClient.SaveToDBID(ModMerchandise);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  End;

end;

end.
