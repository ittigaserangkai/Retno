unit ufrmLogin;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, uDXUtils, uDMClient,
  uRetnoUnit, uAppUtils, uModAuthUser;

type
  TfrmLogin = class(TForm)
    edtUsername: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    pnlLogin: TPanel;
    edtPassword: TEdit;
    procedure edtPasswordChange(Sender: TObject);
    procedure edtPasswordExit(Sender: TObject);
    procedure edtUsernameChange(Sender: TObject);
    procedure edtUsernameExit(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.edtPasswordChange(Sender: TObject);
begin
  edtPassword.PasswordChar := '*';
  edtPassword.Font.Color   := clBlack;

  if edtPassword.TextTrim = 'Password' then
  begin
    edtPassword.PasswordChar := #0;
    edtPassword.Font.Color   := cl3DLight;
  end;
end;

procedure TfrmLogin.edtPasswordExit(Sender: TObject);
begin
  edtPassword.Text := trim(edtPassword.Text);

  if edtPassword.Text = '' then
    edtPassword.Text := 'Password';

  if edtPassword.Text = 'Password' then
    edtPassword.Font.Color := cl3DLight
  else
    edtPassword.Font.Color := clBlack;
end;

procedure TfrmLogin.edtUsernameChange(Sender: TObject);
begin
  if edtUsername.Text = 'User name' then
    edtUsername.Font.Color := cl3DLight
  else
    edtUsername.Font.Color := clBlack;
end;

procedure TfrmLogin.edtUsernameExit(Sender: TObject);
begin
  edtUsername.Text := trim(edtUsername.Text);

  if edtUsername.Text = '' then
    edtUsername.Text := 'User name';



end;

procedure TfrmLogin.OKBtnClick(Sender: TObject);
begin
  if DMClient.CrudClient.DoLogin(edtUsername.TextRest, edtPassword.TextRest) then
  begin
    TRetno.UserApp := DMClient.CrudClient.RetrieveByCode(TModAuthUser.ClassName, edtUsername.TextRest) as TModAuthUser;
    ModalResult := mrOk;
  end else begin
    TAppUtils.Error('Login GAGAL !');
  end;


end;

end.
 
