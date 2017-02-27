unit ufrmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SUIButton, StdCtrls, ExtCtrls, ActnList,
  AppEvnts, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  cxControls, cxContainer, cxEdit, cxLabel, cxButtons, System.Actions;

const
  LOGIN_PAGE = 'Default';
  ERRORLOGIN_PAGE = 'Dialog';
  CONNECTION_PAGE = 'Setting';

type
  TfrmLogin = class(TForm)
    bvl1: TBevel;
    nbLogin: TNotebook;
    lblTanggal: TLabel;
    ActionList1: TActionList;
    imgIcon: TImage;
    lbl1: TLabel;
    lbl2: TLabel;
    edtUsername: TEdit;
    edtPassword: TEdit;
    edtTanggal: TEdit;
    lbl3: TLabel;
    actLogin: TAction;
    actCancel: TAction;
    actSetConn: TAction;
    imgnb2: TImage;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    actOnCreate: TAction;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    edtHost: TEdit;
    edtDatabase: TEdit;
    dlgOpenFile: TOpenDialog;
    edtUserDb: TEdit;
    edtPasswordDb: TEdit;
    cmbRole: TComboBox;
    Label1: TLabel;
    actSave: TAction;
    tmr1: TTimer;
    btnSave: TcxButton;
    lblSetKoneksi: TcxLabel;
    lbltry: TcxLabel;
    btnOpenDialog: TcxButton;
    btnLogin: TcxButton;
    cxButton1: TcxButton;
    procedure actLoginExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actSetConnExecute(Sender: TObject);
    procedure lblTryClick(Sender: TObject);
    procedure btnOpenDialogClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSaveExecute(Sender: TObject);
    procedure cmbRoleKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tmr1Timer(Sender: TObject);
  private
    FIsForSetting: boolean;
    FLoginFullName: string;
    FLoginID: Integer;
    FLoginUntID: Integer;
    FLoginUserName: string;
    isPasswordChecked: Boolean;
    { Private declarations }
    procedure SwitchPage(APageActive: string);
    procedure SetIsForSetting(const Value: boolean);
  public
    { Public declarations }
    property IsForSetting: boolean read FIsForSetting write SetIsForSetting;
    property LoginFullName: string read FLoginFullName write FLoginFullName;
    property LoginID: Integer read FLoginID write FLoginID;
    property LoginUntID: Integer read FLoginUntID write FLoginUntID;
    property LoginUserName: string read FLoginUserName write FLoginUserName;
    function ShowFormLogin(APageActive: string): boolean;
  end;

var
  frmLogin: TfrmLogin;
  LoginSuccessfull: boolean;

implementation

uses uConstanta;

{$R *.dfm}

procedure TfrmLogin.actLoginExecute(Sender: TObject);
begin
  if (edtPassword.Text = '') then
  begin
    if isPasswordChecked = False then
    begin
      edtPassword.SetFocus;
      isPasswordChecked := True;
      Exit;
    end;
  end;

  LoginSuccessfull := false;
  
{  if not assigned(Login) then
    Login := TLogin.Create;

  with Login do
  begin
    UserLogin := edtUsername.Text;
    PasswordLogin := edtPassword.Text;
    // check is user has been registered
    if (IsUserRegistered) then
    begin
      LoginID           := UserId;
      LoginUntID        := UserUnitId;
      LoginUserName     := Username;
      LoginFullName     := Fullname;
      Close;

      LoginSuccessfull := true;

    end
    else
    begin
      SwitchPage(ERRORLOGIN_PAGE);
    end; // end if
  end; // end with  }
end;

procedure TfrmLogin.actCancelExecute(Sender: TObject);
begin
  LoginSuccessfull := false;
  Close;
end;

procedure TfrmLogin.actSetConnExecute(Sender: TObject);
begin
  SwitchPage(CONNECTION_PAGE);
end;

procedure TfrmLogin.lblTryClick(Sender: TObject);
begin
  SwitchPage(LOGIN_PAGE);
end;

procedure TfrmLogin.btnOpenDialogClick(Sender: TObject);
begin
  if (dlgOpenFile.Execute) then
    edtDatabase.Text := dlgOpenFile.FileName;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  KeyPreview := true;
end;

function TfrmLogin.ShowFormLogin(APageActive: string): boolean;
begin
  SwitchPage(APageActive);
  Result := (ShowModal = mrOk);
end;

procedure TfrmLogin.SwitchPage(APageActive: string);
begin
  nbLogin.ActivePage := APageActive;
  if (APageActive = CONNECTION_PAGE) then
  begin
{    if not assigned(ADConn) then
      ADConn := TSConnection.Create(CONFIG_FILE);

    with ADConn do
    begin
      edtHost.Text := DBHost;
      edtDatabase.Text := DBPath;
      edtUserDb.Text := UserIB;
      edtPasswordDb.Text := PasswordIB;
    end; // end with
    }
  end; // end if
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Login := nil;
//  Login.Free;
end;

procedure TfrmLogin.actSaveExecute(Sender: TObject);
begin
{  if not assigned(Login) then
    Login := TLogin.Create;

  if (Login.SaveConnectionFailed(edtUserDb.Text, edtPasswordDb.Text,
    cmbRole.Text, edtHost.Text, edtDatabase.Text)) then
    SwitchPage(CONNECTION_PAGE)
  else
  begin
    if (FIsForSetting) then
      Close
    else
      SwitchPage(LOGIN_PAGE);
  end;
  }
end;

procedure TfrmLogin.cmbRoleKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [Chr(VK_UP), Chr(VK_DOWN), Chr(VK_RIGHT), Chr(VK_LEFT)]) then
    Key := #0;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin

  if not (FIsForSetting) then
  begin
    // try connect to database server
{    if not assigned(ADConn) then
      ADConn := TSConnection.Create(CONFIG_FILE);
    ADConn.Disconnect;
    ADConn.Connect;
    edtTanggal.Text := DateToStr(Date);

    if (ConnectionFailed) then
    begin
      SwitchPage(CONNECTION_PAGE);
    end
    else
    begin
      if IsHODeveloperMode then
        tmr1.Enabled := True;
        
      SwitchPage(LOGIN_PAGE);
    end; // end if
    }
  end;
  isPasswordChecked := False;
end;

procedure TfrmLogin.SetIsForSetting(const Value: boolean);
begin
  FIsForSetting := Value;
end;

procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (nbLogin.ActivePage = ERRORLOGIN_PAGE) then
  begin
    if (Key = VK_RETURN) then
    begin
      isPasswordChecked := False; 
      SwitchPage(LOGIN_PAGE);
    end;
  end;

  if (nbLogin.ActivePage = CONNECTION_PAGE) then
  begin
    if (Key = VK_RETURN) then
      actSave.Execute;
  end;
end;

procedure TfrmLogin.tmr1Timer(Sender: TObject);
begin
{  if IsHODeveloperMode then
  begin
    edtUsername.Text := _INIReadString(CONFIG_FILE, 'LOGIN', 'user');
    edtPassword.Text := _INIReadString(CONFIG_FILE, 'LOGIN', 'password');
    if Trim(edtUsername.Text) <> '' then
    begin

      if _INIReadString(CONFIG_FILE, 'LOGIN', 'islangsung') = '1' then
        actLoginExecute(nil);

      tmr1.Enabled := False;
    end;
  end;}
end;

initialization
  LoginSuccessfull := false;

end.
