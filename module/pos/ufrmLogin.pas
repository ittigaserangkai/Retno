unit ufrmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxGroupBox,
  dxGDIPlusClasses, uModAuthUser, uDMClient, uModBeginningBalance, cxLabel,
  uModelHelper;

type
  TfrmLogin = class(TForm)
    sbLogin: TStatusBar;
    tmrLogin: TTimer;
    cxGroupBox1: TcxGroupBox;
    lblUser: TLabel;
    edCashierID: TcxTextEdit;
    edNama: TcxTextEdit;
    edPassword: TcxTextEdit;
    Label2: TLabel;
    Image1: TImage;
    lblLogin: TcxLabel;
    procedure tmrLoginTimer(Sender: TObject);
    procedure edCashierIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edPasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FIsAuthSupervisor: Boolean;
    FAuthUser: TModAuthUser;
    FBeginningBalance: TModBeginningBalance;
    FBalanceID: string;
    function SetAuthUser(UserID: string): TModAuthUser;
    function SetAuthSupervisor(UserID: string): TModAuthUser;
    procedure SetIsAuthSupervisor(const Value: Boolean);
  public
    property IsAuthSupervisor: Boolean read FIsAuthSupervisor write
        SetIsAuthSupervisor;
    property AuthUser: TModAuthUser read FAuthUser write FAuthUser;
    property BalanceID: string read FBalanceID write FBalanceID;
    property BeginningBalance: TModBeginningBalance read FBeginningBalance write
        FBeginningBalance;
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  ufrmMain, uTSCommonDlg, DB, udmMain, uAppUtils;

{$R *.dfm}

procedure TfrmLogin.tmrLoginTimer(Sender: TObject);
begin
  sbLogin.Panels[0].Text := FormatDateTime('dd-MM-yyyy',Now);
  sbLogin.Panels[1].Text := FormatDateTime('hh:nn:ss',Now);
end;

procedure TfrmLogin.edCashierIDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sSQL: string;
  dServerDate : TDateTime;
begin
  if Key = VK_ESCAPE then
  begin
    Self.ModalResult := mrCancel;
  end;
  if Key = VK_RETURN then
  begin
    if IsAuthSupervisor then
      SetAuthSupervisor(edCashierID.Text)
    else
      SetAuthUser(edCashierID.Text);
  end;

//  dServerDate := cGetServerDateTime;
//  sSQL := 'select a.usr_fullname, a.usr_passwd, a.aut$user_id, b.beginning_balance_id '
//    + 'from aut$user a '
//    + ' inner join beginning_balance b on a.aut$user_id = b.aut$user_id '
//    + '  and a.usr_username = ' + QuotedStr(edCashierID.Text)
//    + '  and date(b.balance_shift_date) = ' + TAppUtils.QuotD(dServerDate)
//    + '  and b.BALANCE_STATUS = ' + QuotedStr('OPEN')
//    + ' inner join setuppos c on b.setuppos_id = c.setuppos_id '
//    + '  and b.aut$unit_id = c.aut$unit_id '
//    + '  and c.setuppos_terminal_code = ' + QuotedStr(frmMain.FPOSCode)
//    + '  and c.setuppos_is_active = 1 '
//    + ' inner join shift d on b.shift_id = d.shift_id '
//    + '  and time(d.shift_start_time) <= ' + QuotedStr(FormatDateTime('hh:nn:ss', dServerDate))
//    + '  and time(d.shift_end_time) >= ' + QuotedStr(FormatDateTime('hh:nn:ss', dServerDate));
//  edNama.Clear;
//  Password := '';
//  UserID := '';
//  with cOpenQuery(sSQL) do
//  begin
//    try
//      if not eof then
//      begin
//        edNama.Text := Fields[0].AsString;
//        Password    := Fields[1].AsString;
//        UserID      := Fields[2].AsString;
//        BalanceID   := Fields[3].AsString;
//        edPassword.SelectAll;
//        edPassword.SetFocus;
//      end
//      else
//      begin
//        edNama.Text := 'Kasir Tidak Aktif ! ( ' + FormatDateTime('dd-MM-yy hh:nn:ss', dServerDate) + ')';
//        edCashierID.SelectAll;
//      end;
//    finally
//      Free;
//    end;
//  end;

end;

procedure TfrmLogin.edPasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of    //
    VK_ESCAPE:
    begin
      edCashierID.SetFocus;
    end;
    VK_RETURN:
    begin
      if not Assigned(AuthUser) then exit;
      if edPassword.Text = AuthUser.USR_PASSWD then
      begin
        Self.ModalResult := mrOk;
      end else
        CommonDlg.ShowError('Password Anda salah');
    end;    
  end;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Action := caFree;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  sbLogin.Panels[2].Text := 'POS Code: ' + frmMain.FPOSCode;
  Self.Caption := 'Selamat Datang di Assaalaam POS System';
  Self.IsAuthSupervisor := False;
end;

procedure TfrmLogin.SetIsAuthSupervisor(const Value: Boolean);
begin
  if not Value then
  begin
    lblLogin.Caption  := 'Please Login';
    lblUser.Caption   := 'Cashier ID';
    Self.Caption      := 'Selamat Datang';
  end else
  begin
    lblLogin.Caption  := 'Login Supervisor';
    lblUser.Caption   := 'Supervisor ID';
    Self.Caption      := 'Otorisasi Supervisor';
  end;
  FIsAuthSupervisor := Value;
end;


function TfrmLogin.SetAuthUser(UserID: string): TModAuthUser;
begin
  edCashierID.Text := TAppUtils.StrPadRight('',4 - Length(edCashierID.Text),'0') + edCashierID.Text;

  FreeAndNil(FAuthUser);
  FAuthUser := DMClient.CrudClient.RetrieveByCode(TModAuthUser.ClassName, UserID) as TModAuthUser;
  if FAuthUser.ID = '' then
  begin
    CommonDlg.ShowError('User ' + UserID + ' tidak ditemukan di database');
    exit;
  end;
  edNama.Text := AuthUser.USR_FULLNAME;

  //set balance
  FreeAndNil(FBeginningBalance);
  FBeginningBalance := DMClient.POSClient.GetBeginningBalance(AuthUser.ID);
  if FBeginningBalance.ID = '' then
  begin
    CommonDlg.ShowError('Beginning Balance atas User ' + UserID + ' belum diset');
    exit;
  end;

  edPassword.SetFocus;
end;

function TfrmLogin.SetAuthSupervisor(UserID: string): TModAuthUser;
var
  lUG: TModAuthUserGroup;
  IsSpv: Boolean;
begin

  FreeAndNil(FAuthUser);
  FAuthUser := DMClient.CrudClient.RetrieveByCode(TModAuthUser.ClassName, UserID) as TModAuthUser;
  if FAuthUser.ID = '' then
  begin
    CommonDlg.ShowError('User ' + UserID + ' tidak ditemukan di database');
    exit;
  end;

  if AuthUser.Groups.Count = 0 then
  begin
    CommonDlg.ShowError('User ' + UserID + ' belum disetting group nya');
    exit;
  end;

  IsSpv := False;
  for lUG in AuthUser.Groups do
  begin
    lUG.GROUP.Reload(False);
    IsSpv := Uppercase(lUG.GROUP.GRO_NAME) = 'SPV';
    if IsSpv then break;
  end;

  if not IsSpv then
  begin
    CommonDlg.ShowError('User ' + UserID + ' bukan supervisor');
    exit;
  end;

  edNama.Text := AuthUser.USR_FULLNAME;
  edPassword.SetFocus;
end;

end.
