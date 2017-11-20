unit ufrmDialogMaintenancePassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls,
  StdCtrls, System.Actions, Vcl.ActnList, ufraFooterDialog3Button,
  ufrmMasterDialogBrowse, uDXUtils, uInterface, uDBUtils, uClientClasses,
  uDMClient, uModAuthUser, uAppUtils;

type                         
  TfrmDialogMaintenancePassword = class(TfrmMasterDialog, iCrudable)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edtUserName: TEdit;
    edtFullname: TEdit;
    cbbLevel: TComboBox;
    edtPasswd: TEdit;
    chkStatus: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FCrud: TCrudClient;
    FModAuthUser: TModAuthUser;
    function GetCrud: TCrudClient;
    function GetModAuthUser: TModAuthUser;
    procedure SimpanData;
    property Crud: TCrudClient read GetCrud write FCrud;
    property ModAuthUser: TModAuthUser read GetModAuthUser write FModAuthUser;
    { Private declarations }
  public
    procedure LoadData(AID: String);
  published
  end;

var
  frmDialogMaintenancePassword: TfrmDialogMaintenancePassword;

implementation

uses uTSCommonDlg;

{$R *.dfm}

procedure TfrmDialogMaintenancePassword.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

function TfrmDialogMaintenancePassword.GetCrud: TCrudClient;
begin
  if not Assigned(FCrud) then
    fCrud := TCrudClient.Create(DMClient.RestConn, FALSE);
  Result := FCrud;
end;

function TfrmDialogMaintenancePassword.GetModAuthUser: TModAuthUser;
begin
  if not Assigned(FModAuthUser) then FModAuthUser := TModAuthUser.Create;

  Result := FModAuthUser;
end;

procedure TfrmDialogMaintenancePassword.LoadData(AID: String);
var lEvent : TNotifyEvent;
begin
  try
    
  finally

  end;
end;

procedure TfrmDialogMaintenancePassword.SimpanData;
begin
  //ModAuthUser.MEMBER_IS_VALID                 := 0;
  try
    Crud.SaveToDB(ModAuthUser);
    TAppUtils.Information('Simpan Berhasil.');
    Self.ModalResult := mrOK;
  except
    TAppUtils.Error('Gagal Menyimpan Data.');
    Raise
  end;
end;

end.
