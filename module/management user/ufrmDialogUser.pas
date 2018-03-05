unit ufrmDialogUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, StdCtrls,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button, uAppUtils,
  uModApp, uDXUtils, uModAuthUser, uInterface, uDMClient, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxClasses,
  cxGridLevel, cxGrid, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxGridCustomView, cxGridCustomTableView, cxGridTableView;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogUser = class(TfrmMasterDialog, ICRUDAble)
    DataUser: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edtLogin: TEdit;
    edtPassword: TEdit;
    edtConfirm: TEdit;
    edtFullName: TEdit;
    cbbStatus: TComboBox;
    edtDescription: TEdit;
    cxgrdlvlMenu: TcxGridLevel;
    cxgrdMenu: TcxGrid;
    cxGridTableMenu: TcxGridTableView;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FUser: TModAuthUser;
    function GetUser: TModAuthUser;
    property User: TModAuthUser read GetUser write FUser;
  public
    procedure LoadData(AID: String);
    { Public declarations }
  published
  end;

var
  frmDialogUser: TfrmDialogUser;
  iUbahPO: Integer;

implementation

uses uConn, DB, uTSCommonDlg, uRetnoUnit, ufrmUser;

{$R *.dfm}

procedure TfrmDialogUser.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin akan menghapus data ?') then
    Exit;

  if DMClient.CrudClient.DeleteFromDB(FUser) then
  begin
    TAppUtils.InformationBerhasilHapus;
    LoadData('');
  end;
end;

procedure TfrmDialogUser.actSaveExecute(Sender: TObject);
begin
  inherited;
  if not ValidateEmptyCtrl([1]) then
    Exit;

  if edtPassword.Text <> edtConfirm.Text then
  begin
    TAppUtils.Warning('Password dan Konfirmasi Beda');
    Exit;
  end;

  User.USR_FULLNAME     := edtFullName.Text;
  User.USR_USERNAME     := edtLogin.Text;
  User.USR_PASSWD       := edtPassword.Text;
  User.USR_STATUS       := cbbStatus.ItemIndex;
  User.USR_DESCRIPTION  := edtDescription.Text;

  if DMClient.CrudClient.SaveToDB(User) then
  begin
    TAppUtils.InformationBerhasilSimpan;
    LoadData('');
  end;
end;

procedure TfrmDialogUser.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:= caFree;
end;

function TfrmDialogUser.GetUser: TModAuthUser;
begin
  if FUser = nil then
    FUser := TModAuthUser.Create;

  Result := FUser;
end;

procedure TfrmDialogUser.LoadData(AID: String);
begin
  ClearByTag([0,1]);
  cxGridTableMenu.ClearRows;

  if AID = '' then
    Exit;

  FreeAndNil(FUser);
  FUser := DMClient.CrudClient.Retrieve(TModAuthUser.ClassName, AID) as TModAuthUser;
  if FUser <> nil then
  begin
    edtLogin.Text := FUser.USR_USERNAME;
    edtPassword.Text := FUser.USR_PASSWD;
    edtConfirm.Text := FUser.USR_PASSWD;
    edtFullName.Text := FUser.USR_FULLNAME;
    cbbStatus.ItemIndex := FUser.USR_STATUS;
    edtDescription.Text := FUser.USR_DESCRIPTION;
  end;

//  DMClient.DSProviderClient.Menu_GetDSLookup()
end;

end.
