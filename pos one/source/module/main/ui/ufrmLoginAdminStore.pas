unit ufrmLoginAdminStore;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SUIButton, StdCtrls, ExtCtrls, SUIForm, JvLabel, ActnList, AppEvnts,
  uGTINIFile;

const
  LOGIN_PAGE = 'Default';
  ERRORLOGIN_PAGE = 'Dialog';
  CONNECTION_PAGE = 'Setting';

type
  TfrmLoginAdminStore = class(TForm)
    frmSuiLogin: TsuiForm;
    lblSetKoneksi: TJvLabel;
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
    btnLogin: TsuiButton;
    btnCancel: TsuiButton;
    actLogin: TAction;
    actCancel: TAction;
    actSetConn: TAction;
    imgnb2: TImage;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lblTry: TJvLabel;
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
    lblSave: TJvLabel;
    cmbRole: TComboBox;
    Label1: TLabel;
    btnOpenDialog: TsuiButton;
    suiButton1: TsuiButton;
    actSave: TAction;
    procedure actLoginExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actSetConnExecute(Sender: TObject);
    procedure lblTryClick(Sender: TObject);
    procedure btnOpenDialogClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSaveExecute(Sender: TObject);
    procedure cmbRoleKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLoginEnter(Sender: TObject);
    procedure btnCancelEnter(Sender: TObject);
    procedure btnCancelExit(Sender: TObject);
    procedure btnLoginExit(Sender: TObject);
    procedure btnOpenDialogEnter(Sender: TObject);
    procedure btnOpenDialogExit(Sender: TObject);
    procedure suiButton1Exit(Sender: TObject);
    procedure suiButton1Enter(Sender: TObject);
    procedure nbLoginDblClick(Sender: TObject);
  private
    FIsForSetting: boolean;
    FLoginID: Integer;
    FLoginUntID: Integer;
    FLoginUserName: string;
    FUnitID: Integer;
    { Private declarations }
    procedure SwitchPage(APageActive: string);
    procedure SetIsForSetting(const Value: boolean);
  public
    { Public declarations }            
    property IsForSetting: boolean read FIsForSetting write SetIsForSetting;
    property LoginID: Integer read FLoginID write FLoginID;
    property LoginUntID: Integer read FLoginUntID write FLoginUntID;
    property LoginUserName: string read FLoginUserName write FLoginUserName;
    property UnitID: Integer read FUnitID write FUnitID;
    function ShowFormLogin(APageActive: string): boolean;
  end;

var
  frmLoginAdminStore: TfrmLoginAdminStore;
  LoginSuccessfull: boolean;

implementation

uses uConn, uGTEncDec, uLogin,  uConstanta, urmsunit, suithemes, ufrmMain;

{$R *.dfm}

procedure TfrmLoginAdminStore.actLoginExecute(Sender: TObject);
//var
//  UnitID: Integer;
begin
  LoginSuccessfull := False;

  if not assigned(Login) then
    Login := TLogin.Create;



  with Login do
  begin
    UserLogin := LowerCase(edtUsername.Text);
    PasswordLogin := LowerCase(edtPassword.Text);

    // check is user has been registered
    if (IsUserRegistered) then
    begin
      Self.LoginID       := UserId;
      Self.LoginUntID    := UnitID;
      Self.UnitID        := unitID;
      Self.LoginUserName := UserLogin;

      LoginSuccessfull := true;
      Close;
    end
    else
    begin
      SwitchPage(ERRORLOGIN_PAGE);
    end; // end if
  end; // end with
end;

procedure TfrmLoginAdminStore.actCancelExecute(Sender: TObject);
begin
  LoginSuccessfull := false;
  Close;
end;

procedure TfrmLoginAdminStore.actSetConnExecute(Sender: TObject);
begin
  SwitchPage(CONNECTION_PAGE);
end;

procedure TfrmLoginAdminStore.lblTryClick(Sender: TObject);
begin
  SwitchPage(LOGIN_PAGE);
end;

procedure TfrmLoginAdminStore.btnOpenDialogClick(Sender: TObject);
begin
  if (dlgOpenFile.Execute) then
    edtDatabase.Text := dlgOpenFile.FileName;
end;

procedure TfrmLoginAdminStore.FormCreate(Sender: TObject);
begin
  KeyPreview := true;
end;

procedure TfrmLoginAdminStore.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (nbLogin.ActivePage = ERRORLOGIN_PAGE) then
    if (Key = VK_RETURN) then
      SwitchPage(LOGIN_PAGE);

  if (nbLogin.ActivePage = CONNECTION_PAGE) then
    if (Key = VK_RETURN) then
      actSave.Execute;
end;

function TfrmLoginAdminStore.ShowFormLogin(APageActive: string): boolean;
begin
  SwitchPage(APageActive);
  Result := (ShowModal = mrOk);
end;

procedure TfrmLoginAdminStore.SwitchPage(APageActive: string);
begin
  nbLogin.ActivePage := APageActive;
  if (APageActive = CONNECTION_PAGE) then
  begin
    if not assigned(IBConn) then
      IBConn := TIBConnection.Create(CONFIG_FILE);
      
    with IBConn do
    begin
      edtHost.Text := DBHost;
      edtDatabase.Text := DBPath;
      edtUserDb.Text := UserIB;
      edtPasswordDb.Text := PasswordIB;
    end; // end with
  end; // end if
end;

procedure TfrmLoginAdminStore.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Login := nil;
  Login.Free;
//  Action := caFree;
end;

procedure TfrmLoginAdminStore.actSaveExecute(Sender: TObject);
var
  sIBServerPOS: string;
begin
  if not assigned(Login) then
    Login := TLogin.Create;

  if (Login.SaveConnectionFailed(edtUserDb.Text, edtPasswordDb.Text,
    cmbRole.Text, edtHost.Text, edtDatabase.Text)) then
    SwitchPage(CONNECTION_PAGE)
  else
  begin
    if (FIsForSetting) then
      Close
    else
    begin
      SwitchPage(LOGIN_PAGE);
      sIBServerPOS := _INIReadString(CONFIG_FILE,DB_POS,'DatabaseHost') + ':' + _INIReadString(CONFIG_FILE,DB_POS,'DatabasePath');
      frmMain.sbMain.Panels[1].Text := 'POS DB : ' + sIBServerPOS;
    end;
  end;
end;

procedure TfrmLoginAdminStore.cmbRoleKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [Chr(VK_UP), Chr(VK_DOWN), Chr(VK_RIGHT), Chr(VK_LEFT)]) then
    Key := #0;
end;

procedure TfrmLoginAdminStore.FormShow(Sender: TObject);
begin
  if not (FIsForSetting) then
  begin
    // try connect to database server
    if not assigned(IBConn) then
      IBConn := TIBConnection.Create(CONFIG_FILE);
    IBConn.Disconnect;
    IBConn.Connect;       
    edtTanggal.Text := DateToStr(Date);

    if (ConnectionFailed) then
    begin
      SwitchPage(CONNECTION_PAGE);
    end
    else
    begin
      SwitchPage(LOGIN_PAGE);
      if IsStoreDeveloperMode then
      begin
        edtUsername.Text := 'PO';
        edtPassword.Text := 'po';
        //actLoginExecute(nil);
      end;
    end; // end if
  end;
end;

procedure TfrmLoginAdminStore.SetIsForSetting(const Value: boolean);
begin
  FIsForSetting := Value;
end;

procedure TfrmLoginAdminStore.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Ord('S')) and (ssCtrl in Shift) then
  begin
    edtUsername.Text := 'so';
    edtPassword.Text := 'so';
    btnLogin.Click;
  end
  else if (Key = Ord('P')) and (ssCtrl in Shift) then
  begin
    edtUsername.Text := 'po';
    edtPassword.Text := 'po';
    btnLogin.Click;
  end
  else if (Key = Ord('G')) and (ssCtrl in Shift) then
  begin
    edtUsername.Text := 'gr';
    edtPassword.Text := 'gr';
    btnLogin.Click;
  end;

end;

procedure TfrmLoginAdminStore.btnLoginEnter(Sender: TObject);
begin
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmLoginAdminStore.btnCancelEnter(Sender: TObject);
begin
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmLoginAdminStore.btnCancelExit(Sender: TObject);
begin
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmLoginAdminStore.btnLoginExit(Sender: TObject);
begin
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmLoginAdminStore.btnOpenDialogEnter(Sender: TObject);
begin
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmLoginAdminStore.btnOpenDialogExit(Sender: TObject);
begin
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmLoginAdminStore.suiButton1Exit(Sender: TObject);
begin
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmLoginAdminStore.suiButton1Enter(Sender: TObject);
begin
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmLoginAdminStore.nbLoginDblClick(Sender: TObject);
begin
  edtUserName.Text := 'assgros';
  edtPassword.Text := 'assgros';
  actLoginExecute(Sender);
end;

initialization
  LoginSuccessfull := false;

end.




