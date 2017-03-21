unit ufrmMouselessMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ButtonGroup, Vcl.ExtCtrls,
  Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxGroupBox, cxRadioGroup, Vcl.Menus, System.Actions,
  Vcl.ActnList;

type
  TMyLabel = class(TLabel)
  private
    FMenuItem: TMenuItem;
    FNumber: Integer;
    procedure SetMenuItem(const Value: TMenuItem);
  public
    constructor Create(aOwner: TComponent; aMenu: TMenuItem; aNumber: Integer);
        reintroduce;
    property MenuItem: TMenuItem read FMenuItem write SetMenuItem;
    property Number: Integer read FNumber write FNumber;
  end;

  TMyPanel = class(TPanel)
  public
    constructor Create(aOwner: TComponent); reintroduce;
  end;

  TfrmMouselesMenu = class(TForm)
    pnlTop: TPanel;
    pnlBot: TPanel;
    pnlBody: TPanel;
    lbCTRLDel: TLabel;
    Label1: TLabel;
    edtPilihan: TEdit;
    lblCaption: TLabel;
    procedure edtPilihanKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtPilihanKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FCurrentMenu: TMenuItem;
    procedure AddLabel(aMenu: TMenuItem);
    procedure ClearMenu;
    procedure CloseExecute;
    procedure ExecuteMenu(aNumber: Integer);
    function GetCurrPanel: TMyPanel;
    function GetMyLabelCount: Integer;
    function GetMenuByNumber(aNumber: Integer): TMenuItem;
    function GetPanelCount: Integer;
    procedure InitMenu;
    procedure SetCurrentMenu(const Value: TMenuItem);
    { Private declarations }
  public
    procedure CreateContainer(NumOfMenu: Integer);
    procedure ShowMenu(aMenu: TMenuItem); overload;
    procedure ShowMenu(aMenu: TMainMenu); overload;
    property CurrentMenu: TMenuItem read FCurrentMenu write SetCurrentMenu;
    { Public declarations }
  end;


var
  frmMouselesMenu: TfrmMouselesMenu;

const
  _MaxItemRows : Integer = 8;

implementation

uses
  ufrmMain;

{$R *.dfm}

procedure TfrmMouselesMenu.AddLabel(aMenu: TMenuItem);
var
  aPanel: TMyPanel;
//  lLabel: TMyLabel;
begin
  //check current panel Body
  //check menu has action or onlick event

  if aMenu.Count = 0 then
    if not Assigned(aMenu.Action) then
      exit;

  aPanel := GetCurrPanel;
  if not Assigned(aPanel) then
    aPanel := TMyPanel.Create(pnlBody)
  else begin
    if aPanel.ControlCount > _MaxItemRows then
    begin
      aPanel := TMyPanel.Create(pnlBody);
    end;
  end;
//  lLabel :=
  TMyLabel.Create(aPanel, aMenu, GetMyLabelCount + 1);

end;

procedure TfrmMouselesMenu.ClearMenu;
var
  i: Integer;
  lCtrl: TControl;
begin
//  Application.ProcessMessages;
  Self.CurrentMenu := nil;
  for i := pnlBody.ControlCount-1 downto 0 do
  begin
    if pnlBody.Controls[i] is TMyPanel then
    begin
      lCtrl := pnlBody.Controls[i];
      pnlBody.RemoveControl( lCtrl );
      FreeAndNil(lCTRL);
    end;
  end;
end;

procedure TfrmMouselesMenu.CloseExecute;
begin
  if Self.CurrentMenu = nil then
    Self.Close
  else if Self.CurrentMenu.Parent = nil then
    Self.Close
  else
    ShowMenu(Self.CurrentMenu.Parent);
end;

procedure TfrmMouselesMenu.CreateContainer(NumOfMenu: Integer);
begin

end;

procedure TfrmMouselesMenu.edtPilihanKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Self.CloseExecute;
end;

procedure TfrmMouselesMenu.edtPilihanKeyPress(Sender: TObject; var Key: Char);
var
  Handled: Boolean;
begin
  Handled := False;
  If Key = #13 then
  begin
    If edtPilihan.Text  = '' then exit;
    ExecuteMenu(StrToInt(edtPilihan.Text));
    Handled := True;
  end else
  begin
    if (Self.GetMyLabelCount <= 9) and (CharInSet(Key, ['0'..'9'])) then
    begin
      ExecuteMenu(StrToInt(Key));
      Handled := True;
    end;
  end;

  if Handled  then
  begin
    Key := #0;
    edtPilihan.Clear;
  end;
end;

procedure TfrmMouselesMenu.ExecuteMenu(aNumber: Integer);
var
  mn: TMenuItem;
begin
  mn := GetMenuByNumber(aNumber);
  if mn = nil then
  begin
    MessageDlg('Nomor Menu Salah',mtError, [mbOK],0);
    exit;
  end;

  if mn.Count > 0 then
    ShowMenu(mn)
  else begin
    if mn.Action <> nil then
    begin
      mn.Action.Execute;
      Self.Close;
    end;
  end;
end;

procedure TfrmMouselesMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMouselesMenu.FormCreate(Sender: TObject);
begin
  InitMenu;
  ShowMenu(frmMain.mmMainMenu);
end;

procedure TfrmMouselesMenu.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  if Key = VK_ESCAPE then
    Self.Close;
end;

function TfrmMouselesMenu.GetCurrPanel: TMyPanel;
var
  i: Integer;
begin
  If GetPanelCount > 0 then
  begin
//    Result := TMyPanel(pnlBody.Controls[GetPanelCount-1])
    for i := pnlBody.ControlCount-1 downto 0 do
    begin
      if pnlBody.Controls[i] Is TMyPanel then
      begin
        Result := pnlBody.Controls[i] as TMyPanel;
        Break;
      end;
    end;
  end else
    Result := nil;
end;

function TfrmMouselesMenu.GetMyLabelCount: Integer;
var
  i: Integer;
  pnl: TMyPanel;
begin
  Result := 0;
  for i := 0 to pnlBody.ControlCount-1 do
  begin
    if pnlBody.Controls[i] is TMyPanel then
    begin
      pnl := pnlBody.Controls[i] as TMyPanel;
      Result := Result + pnl.ControlCount;
    end;
  end;
end;

function TfrmMouselesMenu.GetMenuByNumber(aNumber: Integer): TMenuItem;
var
  i: Integer;
  j: Integer;
  pnl: TMyPanel;
begin
  Result := nil;
  for i := 0 to pnlBody.ControlCount-1 do
  begin
    if pnlBody.Controls[i] is TMyPanel then
    begin
      pnl := pnlBody.Controls[i] as TMyPanel;
      for j := 0 to pnl.ControlCount -1 do
      begin
        if pnl.Controls[j] is TMyLabel then
        begin
          if TMyLabel(pnl.Controls[j]).Number = aNumber then
          begin
            Result := TMyLabel(pnl.Controls[j]).MenuItem;
            Exit;
          end;
        end;
      end;
    end;
  end;
end;

function TfrmMouselesMenu.GetPanelCount: Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to pnlBody.ControlCount-1 do
  begin
    if pnlBody.Controls[i] is TMyPanel then
      Result := Result + 1;
  end;
end;

procedure TfrmMouselesMenu.InitMenu;
begin


end;

procedure TfrmMouselesMenu.SetCurrentMenu(const Value: TMenuItem);
begin
  FCurrentMenu := Value;
end;

procedure TfrmMouselesMenu.ShowMenu(aMenu: TMenuItem);
var
  i: Integer;

  procedure SetCaption(aMenu: TMenuItem);
  begin
    if aMenu.Parent <> nil then
    begin
      If aMenu.Parent.Name = '' then
        lblCaption.Caption := 'MAIN MENU >> ' + lblCaption.Caption
      else
        lblCaption.Caption := aMenu.Parent.Caption + ' >> ' + lblCaption.Caption;
      SetCaption(aMenu.Parent);
    end;
  end;

begin
  ClearMenu;
  for i := 0 to aMenu.Count-1 do
  begin
    AddLabel(aMenu.Items[i]);
  end;
  lblCaption.Caption := aMenu.Caption;
  If aMenu.Name = '' then lblCaption.Caption := 'MAIN MENU';
  SetCaption(aMenu);
  Self.CurrentMenu := aMenu;
end;

procedure TfrmMouselesMenu.ShowMenu(aMenu: TMainMenu);
var
  i: Integer;
begin
  ClearMenu;
  for i := 0 to aMenu.Items.Count-1 do
  begin
    AddLabel(aMenu.Items[i]);
  end;
  lblCaption.Caption := 'MAIN MENU';
  Self.CurrentMenu := nil;
end;

constructor TMyLabel.Create(aOwner: TComponent; aMenu: TMenuItem; aNumber:
    Integer);
begin
  inherited Create(aOwner);
  Self.AutoSize           := False;
  Self.Font.Name          := 'Trebuchet MS';
  Self.Font.Size          := 9;
  Self.Font.Style         := [fsBold]; //, fsUnderline];
  Self.Font.Color         := clNavy;
//  Self.Margins.Top        := 10;
//  Self.Margins.Bottom     := 10;
  Self.AlignWithMargins   := True;
  Self.MenuItem           := aMenu;
  Self.Number             := aNumber;
  Self.Caption            := IntTostr(aNumber) + '. ' + UpperCase(aMenu.Caption);
  Self.name               := 'lblMenu' + IntToStr(aNumber);
  Self.Parent             := TWinControl(aOwner);
  Self.Align              := alTop;
  Self.top                := TWinControl(aOwner).Height;
end;

procedure TMyLabel.SetMenuItem(const Value: TMenuItem);
begin
  FMenuItem := Value;
end;

constructor TMyPanel.Create(aOwner: TComponent);
var
  i: Integer;
  iCount: Integer;
  pnlBody: TPanel;
begin
  inherited Create(aOwner);
  pnlBody         := TPanel(aOwner);
  Self.Left       := pnlBody.Width;
  Self.Align      := alLeft;
  Self.BevelOuter := bvNone;
  if aOwner.InheritsFrom(TWinControl) then
    Self.Parent   := pnlBody;
  iCount := 0;
  for i := 0 to pnlBody.ControlCount-1 do
    if pnlBody.Controls[i] is TMyPanel then inc(iCount);
  if iCount = 0 then iCount := 1;
  Self.Name := 'pnlItem' + IntToStr(iCount);
  Self.Caption := '';

  for i := 0 to pnlBody.ControlCount-1 do
  begin
    if pnlBody.Controls[i] is TMyPanel then
      pnlBody.Controls[i].Width := Trunc(pnlBody.Width / iCount);
  end;
end;

end.
