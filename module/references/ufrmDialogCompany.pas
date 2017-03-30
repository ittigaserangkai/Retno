unit ufrmDialogCompany;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, uInterface, uModCompany,
  Vcl.StdCtrls;

type
  TfrmDialogCompany = class(TfrmMasterDialog, ICRUDAble)
    lblCode: TLabel;
    edtCode: TEdit;
    edtName: TEdit;
    lblLblName: TLabel;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCompany: TModCompany;
    function GetCompany: TModCompany;
    property Company: TModCompany read GetCompany write FCompany;
    { Private declarations }
  public
    procedure LoadData(AID : String);
    { Public declarations }
  end;

var
  frmDialogCompany: TfrmDialogCompany;

implementation
uses
  uAppUtils, uDXUtils, System.DateUtils, uDBUtils, uDMClient, uTSCommonDlg;

{$R *.dfm}

procedure TfrmDialogCompany.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if TAppUtils.ConfirmHapus then
  begin
    if DMClient.CrudClient.DeleteFromDB(FCompany) then
      Self.ModalResult := mrOk;
  end;
end;

procedure TfrmDialogCompany.actSaveExecute(Sender: TObject);
begin
  inherited;
  if edtCode.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('CODE');
    edtCode.SetFocus;
    Exit;
  end;
  if edtName.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('NAME');
    edtName.SetFocus;
    Exit;
  end;


  if TAppUtils.ConfirmSimpan then
  begin
    try
      Company.COMP_CODE := edtCode.Text;
      Company.COMP_NAME := edtName.Text;

      if DMClient.CrudClient.SaveToDB(FCompany) then
        ModalResult := mrOk;
    except
      raise;
    end;


  end;
end;

procedure TfrmDialogCompany.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
end;

function TfrmDialogCompany.GetCompany: TModCompany;
begin
  if FCompany =nil then
    FCompany := TModCompany.Create;

  Result := FCompany;
end;

procedure TfrmDialogCompany.LoadData(AID : String);
begin
  FreeAndNil(FCompany);

  edtCode.Text := '';
  edtName.Text := '';

  FCompany  := DMClient.CrudClient.Retrieve(TModCompany.ClassName, AID) as TModCompany;
  if FCompany <> nil then
  begin
    edtCode.Text := FCompany.COMP_CODE;
    edtName.Text := FCompany.COMP_NAME;
  end;

end;

end.
