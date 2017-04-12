unit ufrmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit;

type
  TfrmLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    sbLogin: TStatusBar;
    edCashierID: TcxTextEdit;
    edNama: TcxTextEdit;
    edPassword: TcxTextEdit;
    tmrLogin: TTimer;
    procedure tmrLoginTimer(Sender: TObject);
    procedure edCashierIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edPasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FBalanceID: Integer;
    FPassword: String;
    FUserID: Integer;
    { Private declarations }
  public
    property BalanceID: Integer read FBalanceID write FBalanceID;
    property Password: String read FPassword write FPassword;
    property UserID: Integer read FUserID write FUserID;
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  ufrmMain, uTSCommonDlg, DB, uAppUtils;

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
  case Key of    //
    VK_RETURN:
    begin
      {$IFDEF TSN}
      frmLogin.Caption := 'Selamat Datang di TSN POS System';
      edCashierID.Text := Trim(edCashierID.Text);
      {$ELSE}
      try
        frmLogin.Caption := 'Selamat Datang di Assaalaam POS System';
        edCashierID.Text := TAppUtils.StrPadRight('',4 - Length(edCashierID.Text),'0') + edCashierID.Text;
      except
      end;
      {$ENDIF}
//      dServerDate := cGetServerDateTime;

      sSQL := 'select a.usr_fullname, a.usr_passwd, a.usr_id, b.balance_id '
        + 'from aut$user a '
        + ' inner join beginning_balance b on a.usr_id = b.balance_usr_id '
        + '  and a.usr_unt_id = b.balance_usr_unt_id '
        + '  and a.usr_username = ' + QuotedStr(edCashierID.Text)
        + '  and a.usr_unt_id = ' + IntToStr(frmMain.UnitID)
        + '  and b.balance_shift_date = ' + TAppUtils.QuotD(dServerDate)
        + '  and b.BALANCE_STATUS = ' + QuotedStr('OPEN')
        + ' inner join setuppos c on b.balance_setuppos_id = c.setuppos_id '
        + '  and b.balance_setuppos_unt_id = c.setuppos_unt_id '
        + '  and c.setuppos_terminal_code = ' + QuotedStr(frmMain.FPOSCode)
        + '  and c.setuppos_is_active = 1 '
        + ' inner join shift d on b.balance_shift_id = d.shift_id '
        + '  and b.balance_shift_unt_id = d.shift_unt_id '
        + '  and cast(d.shift_start_time as time) <= ' + QuotedStr(FormatDateTime('hh:nn:ss', dServerDate))
        + '  and cast(d.shift_end_time as time) >= ' + QuotedStr(FormatDateTime('hh:nn:ss', dServerDate));

      edNama.Clear;
      Password := '';
      UserID := -1;
      {
      with cOpenQuery(sSQL) do
      begin
        try
          if not eof then
          begin
            edNama.Text := Fields[0].AsString;
            Password    := Fields[1].AsString;
            UserID      := Fields[2].AsInteger;
            BalanceID   := Fields[3].AsInteger;
            edPassword.SelectAll;
            edPassword.SetFocus;
          end
          else
          begin
            edNama.Text := 'Kasir Tidak Aktif ! ( ' + FormatDateTime('dd-MM-yy hh:nn:ss', dServerDate) + ')';
            edCashierID.SelectAll;
          end;
        finally
          Free;
        end;
      end;
      }
    end;
  end;    // case
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
      if UserID > 0 then
      begin
        if edPassword.Text = Password then
        begin
          with frmMain do
          begin
            FCashierCode        := edCashierID.Text;
            FCashierName        := edNama.Text;
            FBeginningBalanceID := BalanceID;
            UserID              := Self.UserID;
//            LoginUsername       := edCashierID.Text;
//            LoginUnitId         := frmMain.UnitID;
            EnableMenu;
            miTransactionPending1Click(miTransactionPending1);
//            miTransactionEndUserClick(miTransactionEndUser);
            sbMain.Panels[3].Text := 'Cashier : ' + FCashierCode + ' - ' + FCashierName;
          end;
          Self.Close;
        end
        else
        begin
          CommonDlg.ShowError('Password Anda salah');
        end;  
      end;  
    end;    
  end;    // case
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  sbLogin.Panels[2].Text := 'POS Code: ' + frmMain.FPOSCode;
end;

procedure TfrmLogin.FormDestroy(Sender: TObject);
begin
     frmLogin := nil;
end;

end.
