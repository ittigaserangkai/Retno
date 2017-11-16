unit uTSCommonDlg;

interface

uses
  Dialogs, Controls, Forms, SysUtils, dxAlertWindow, ExtCtrls;

type
//  TMessageType = (mtError, mtInfo, mtConfirm, mtNone);
  TActionType = (atAdd, atEdit, atDelete);

  TCommonDlg = class
  private
    FalertMain: TdxAlertWindowManager;
    FMessageDialog: TForm;
    function FindWindowByCaption(const ACaption: string): TdxAlertWindow;
    procedure InitiateMessageProperties(pButtonCount: integer; pIcon: TMsgDlgType;
        pCaption, pMessage: string);
    procedure InitiateAlertProperties(pCaption: string);
    procedure NewAlert(aCaption, aMessage: string; pIcon: TMsgDlgType);
  public
    destructor Destroy; override;
    procedure ShowMessage(msg: string); overload;
    function ShowMessage(pBtnCount: integer; pCaption, pMessage: string;
      pType: TMsgDlgType): TModalResult; overload;
    procedure ShowError(msg: string);
    procedure ShowErrorEmpty(AField: string);
    procedure ShowConfirm(AType: TActionType);
    procedure ShowConfirmGlobal(AMsg: string);
    function Confirm(msg: string; noOfButton: integer = 2): TModalResult;
    procedure ShowErrorExist(AField, AValue: String);
    procedure ShowConfirmSuccessfull(AType: TActionType);
    procedure ShowInformationAlert(pCaption, pMessage: string; pIcon: TMsgDlgType =
        mtInformation);
  end;

var
  CommonDlg: TCommonDlg;

implementation

uses uConstanta {$IFDEF POS};{$ELSE}, uDMClient;{$ENDIF}

{ TCommonDlg }

{*
  Method confirm
  Description: Conformation dilaog wrapper, maybe I should made a lil bit more
  spesific. an OKCancel message dialog? A YesNoCancel? :p
  Example:
  CommonDlg.showMessage('foo'); // a showmessage clone

  IMPORTANT NOTE:
  CommonDlg is already created. No need to instantite it!

  @param msg, caption: string
  @return TModalResult mbYes, or mbNo
*}
function TCommonDlg.Confirm(msg: string; noOfButton: integer): TModalResult;
begin
  InitiateMessageProperties(noOfButton, mtConfirmation, 'Confirmation', msg);
  Result := FMessageDialog.ShowModal;
end;

{*
  Method showMessage
  Description: The old powerful misused as debuggin tool. Please welcome:
  our dialog bog of a lifetime, showmessage!

  @param msg: string
  @return None
  @version 12-02-2017 tsic (change to use TMessageDialog- NativeDelphi)
*}
procedure TCommonDlg.ShowError(msg: string);
begin
  InitiateMessageProperties(1, mtError, 'Error', msg);
  FMessageDialog.ShowModal;
end;

procedure TCommonDlg.ShowMessage(msg: string);
begin
  InitiateMessageProperties(1, mtInformation, 'Message', msg);
  FMessageDialog.ShowModal;
end;

{*
  Global function. Use this function, show message box with style
  order by TMessageType

  @author didit a
  @param pType: TMessageType -> mtError, mtInfo, mtConfirm, mtNone
  @result TModalResult: mrOk, mrNo, mrCancel
  @version 12-04-2006
*}
function TCommonDlg.ShowMessage(pBtnCount: integer; pCaption,
  pMessage: string; pType: TMsgDlgType): TModalResult;
begin
  case pType of
  mtError        : InitiateMessageProperties(pBtnCount, mtError, pCaption, pMessage);
  mtConfirmation : InitiateMessageProperties(pBtnCount, mtConfirmation, pCaption, pMessage);
  mtInformation  : InitiateMessageProperties(pBtnCount, mtInformation, pCaption, pMessage);
  else
    InitiateMessageProperties(pBtnCount, mtCustom, pCaption, pMessage);
  end;

  Result := FMessageDialog.ShowModal;
end;

destructor TCommonDlg.Destroy;
begin
  if assigned(FMessageDialog) then
  begin
    FMessageDialog.Free;
    FMessageDialog := nil;
  end;
  if Assigned(FalertMain) then
  begin
    FreeAndNil(FalertMain);
  end;
end;

function TCommonDlg.FindWindowByCaption(const ACaption: string): TdxAlertWindow;

  function IsWindowForMessagesGroup(AAlertWindow: TdxAlertWindow): Boolean;
  begin
    Result := (AAlertWindow <> nil) and (AAlertWindow.Tag = 1) and
      (AAlertWindow.VisibilityTransition <> awvtHiding);
  end;

var
  I: Integer;
begin
  Result := nil;
  for I := 0 to FalertMain.Count - 1 do
  begin
    Result := FalertMain.Items[I];
    if IsWindowForMessagesGroup(Result) and (Result.MessageList[0].Caption = ACaption) then
      Break
    else
      Result := nil;
  end;
end;

procedure TCommonDlg.InitiateMessageProperties(pButtonCount: integer; pIcon:
    TMsgDlgType; pCaption, pMessage: string);
var
  pButtons : TMsgDlgButtons;
begin
  case pButtonCount of
    1: pButtons := [mbYes];
    2: pButtons := [mbYes, mbNo];
    3: pButtons := [mbYes, mbNo, mbCancel];
  end;

  if assigned(FMessageDialog) then
    FreeAndNil(FMessageDialog);

  FMessageDialog := CreateMessageDialog(pMessage, pIcon, pButtons);

  with FMessageDialog do
  begin
    Font.Name := 'Trebuchet MS';
    Position := poMainFormCenter;
    Caption := MESSAGE_CAPTION + pCaption;
//    Text := pMessage;
  end;
end;

procedure TCommonDlg.ShowErrorEmpty(AField: string);
begin
  InitiateMessageProperties(1, mtWarning, 'Peringatan', AField + ER_EMPTY);
  FMessageDialog.ShowModal;
end;

procedure TCommonDlg.ShowConfirm(AType: TActionType);
begin
  case AType of
    atAdd: InitiateMessageProperties(1, mtInformation, 'Informasi', CONF_ADD_SUCCESSFULLY);
    atEdit: InitiateMessageProperties(1, mtInformation, 'Informasi', CONF_EDIT_SUCCESSFULLY);
    atDelete: InitiateMessageProperties(1, mtInformation, 'Informasi', CONF_DELETE_SUCCESSFULLY);
  end;
  FMessageDialog.ShowModal;
end;

procedure TCommonDlg.ShowConfirmGlobal(AMsg: string);
begin
  InitiateMessageProperties(1, mtInformation, 'Information', AMsg);
  FMessageDialog.ShowModal;
end;

procedure TCommonDlg.ShowErrorExist(AField, AValue: String);
begin
  InitiateMessageProperties(1, mtWarning, 'Warning', AField + ' ' + QuotedStr(AValue) + ER_EXIST);
  FMessageDialog.ShowModal;
end;

procedure TCommonDlg.ShowConfirmSuccessfull(AType: TActionType);
begin
  case AType of
    atAdd: InitiateMessageProperties(1, mtInformation, 'Information', CONF_ADD_SUCCESSFULLY);
    atEdit: InitiateMessageProperties(1, mtInformation, 'Information', CONF_EDIT_SUCCESSFULLY);
    atDelete: InitiateMessageProperties(1, mtInformation, 'Information', CONF_DELETE_SUCCESSFULLY);
  end;
  FMessageDialog.ShowModal;
end;

procedure TCommonDlg.InitiateAlertProperties(pCaption: string);
begin
  if not assigned(FalertMain) then
  begin
    FalertMain := TdxAlertWindowManager.Create(nil);
  end;
  with FalertMain do
  begin
    OptionsBehavior.DisplayTime := 10000;
    OptionsMessage.Text.Font.Name := 'Trebuchet MS';
    OptionsMessage.Text.Font.Size := 10;
    {$IFNDEF POS}
    OptionsMessage.Images := DMClient.imgListIcon;
    {$ENDIF}
//    Position := poMainFormCenter;
//    Text := pMessage;
  end;
  pCaption := MESSAGE_CAPTION + pCaption;
end;

procedure TCommonDlg.NewAlert(aCaption, aMessage: string; pIcon: TMsgDlgType);
  const
    FormatTextMessage = 'Pesan:' + #13#10 + '%s.';
  var
    iMageIdx: integer;

  procedure ShowNewMessage(var AAlertWindow: TdxAlertWindow; const AMessageText:
      string; aCaption: string);
  begin
    if AAlertWindow = nil then
    begin
      AAlertWIndow := FalertMain.Show(ACaption, AMessageText, iMageIdx);
      AAlertWIndow.Tag := 1;
    end
    else
    begin
      AAlertWindow.MessageList.Add(ACaption, AMessageText, iMageIdx);
      AAlertWindow.RestartDisplayTimer;
    end;
  end;

  procedure AddNavigationInfoToMessage(AAlertWindow: TdxAlertWindow; AIndexMessage: Integer);
  begin
    AAlertWindow.MessageList[AIndexMessage].Text := AAlertWindow.MessageList[AIndexMessage].Text
      + #13#10 + #13#10 + 'Gunakan tombol navigasi dibawah untuk melihat pesan lainnya.';
  end;

var
  AMessageNumber: Integer;
  AAlertWindow: TdxAlertWindow;
begin
    case pIcon of
      mtWarning    : iMageIdx := 10;
      mtError      : iMageIdx := 12;
      mtInformation: iMageIdx := 19;
      mtConfirmation: iMageIdx := 16;
      mtCustom      : iMageIdx := 11;
    end;
    //sebetulnya bisa mengelompokan pesan , tp kok sering AV ???
    {AAlertWindow := FindWindowByCaption(aCaption);
    Inc(FMessageCounters[1]);
    AMessageNumber := FMessageCounters[1];
    ShowNewMessage(AAlertWindow, Format(FormatTextMessage, [AMessageNumber, aMessage]), aCaption);
    if AAlertWindow.MessageList.Count > 1 then
    begin
      AddNavigationInfoToMessage(AAlertWindow, AAlertWindow.MessageList.Count - 1);
      if AAlertWindow.MessageList.Count = 2 then
        AddNavigationInfoToMessage(AAlertWindow, 0);
    end;
    }

    FalertMain.Show(aCaption, Format(FormatTextMessage, [aMessage]), iMageIdx);
end;

procedure TCommonDlg.ShowInformationAlert(pCaption, pMessage: string; pIcon:
    TMsgDlgType = mtInformation);
begin
  InitiateAlertProperties(pCaption);
  NewAlert(pCaption, pMessage, pIcon);
end;

initialization
  CommonDlg := TCommonDlg.Create;
end.
