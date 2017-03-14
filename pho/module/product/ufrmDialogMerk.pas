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
    procedure FormCreate(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
  private
    FModMerk: TModMerk;
    function GetModMerk: TModMerk;
    { Private declarations }
  public
    procedure LoadData(AID: String);
    procedure SaveData;
    property ModMerk: TModMerk read GetModMerk write FModMerk;
    { Public declarations }
  end;

var
  frmDialogMerk: TfrmDialogMerk;

implementation

uses
  uDMClient, uDXUtils;


{$R *.dfm}

procedure TfrmDialogMerk.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
end;

procedure TfrmDialogMerk.actSaveExecute(Sender: TObject);
begin
  inherited;
  SaveData;
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

procedure TfrmDialogMerk.SaveData;
begin
  ModMerk.MERK_NAME        := edNama.Text;
  ModMerk.MERK_DESCRIPTION := edDescription.Text;
  ModMerk.ID               := DMClient.CrudClient.SaveToDBID(ModMerk);
end;

end.
