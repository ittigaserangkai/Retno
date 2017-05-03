unit ufrmDialogMerk;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, uInterface, uModBarang,
  Vcl.StdCtrls;

type
  TfrmDialogMerk = class(TfrmMasterDialog, ICRUDAble)
    Label1: TLabel;
    edNama: TEdit;
    edDescription: TEdit;
    lbl1: TLabel;
    procedure actDeleteExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
  private
    FModMerk: TModMerk;
    function GetModMerk: TModMerk;
    { Private declarations }
  public
    procedure LoadData(AID: String);
    function SaveData: Boolean;
    property ModMerk: TModMerk read GetModMerk write FModMerk;
    { Public declarations }
  end;

var
  frmDialogMerk: TfrmDialogMerk;

implementation

uses
  uDMClient, uDXUtils, uApputils, uConstanta;


{$R *.dfm}

procedure TfrmDialogMerk.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm(CONF_VALIDATE_FOR_DELETE) then exit;
  Try
    DMCLient.CrudClient.DeleteFromDB(ModMerk);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.ModalResult := mrOK;
  except
    TAppUtils.Error(ER_DELETE_FAILED);
    raise;
  End;
end;

procedure TfrmDialogMerk.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
end;

procedure TfrmDialogMerk.actSaveExecute(Sender: TObject);
begin
  inherited;
  if SaveData then
    Self.ModalResult := mrOk;
end;

function TfrmDialogMerk.GetModMerk: TModMerk;
begin
  if not Assigned(FModMerk) then
    FModMerk := TModMerk.Create;
  Result := FModMerk;
end;

procedure TfrmDialogMerk.LoadData(AID: String);
begin
  if Assigned(FModMerk) then FreeAndNil(FModMerk);
  FModMerk := DMClient.CrudClient.Retrieve(TModMerk.ClassName, aID) as TModMerk;
  edNama.Text         := ModMerk.MERK_NAME;
  edDescription.Text  := ModMerk.MERK_DESCRIPTION;
end;

function TfrmDialogMerk.SaveData: Boolean;
begin
  Result := False;

  if not ValidateEmptyCtrl([1]) then
    Exit;

  ModMerk.MERK_NAME        := edNama.Text;
  ModMerk.MERK_DESCRIPTION := edDescription.Text;
  Try
    ModMerk.ID             := DMClient.CrudClient.SaveToDBID(ModMerk);
    if ModMerk.ID <> '' then
    begin
      Result := True;
      TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    end;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  End;

end;

end.
