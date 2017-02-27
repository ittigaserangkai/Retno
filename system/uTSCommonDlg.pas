unit uTSCommonDlg;

interface

uses
  Dialogs, Controls, Forms, SysUtils;

type
//  TMessageType = (mtError, mtInfo, mtConfirm, mtNone);
  TActionType = (atAdd, atEdit, atDelete);

  TCommonDlg = class
  private
    FMessageDialog: TForm;
    procedure InitiateProperties(pButtonCount: integer; pIcon: TMsgDlgType;
      pCaption, pMessage: string);

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
  end;

var
  CommonDlg: TCommonDlg;

implementation

uses uConstanta;

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
  @version 12-04-2006 didit (change to use TsuiMessageDialog)
*}
function TCommonDlg.Confirm(msg: string; noOfButton: integer): TModalResult;
begin
  InitiateProperties(noOfButton, mtConfirmation, 'Confirmation', msg);
  Result := FMessageDialog.ShowModal;
end;

{*
  Method showMessage
  Description: The old powerful misused as debuggin tool. Please welcome:
  our dialog bog of a lifetime, showmessage!

  @param msg: string
  @return None
  @version 12-04-2006 didit (change to use TsuiMessageDialog)
*}
procedure TCommonDlg.ShowError(msg: string);
begin
  InitiateProperties(1, mtError, 'Error', msg);
  FMessageDialog.ShowModal;
end;

procedure TCommonDlg.ShowMessage(msg: string);
begin
  InitiateProperties(1, mtInformation, 'Message', msg);
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
  mtError        : InitiateProperties(pBtnCount, mtError, pCaption, pMessage);
  mtConfirmation : InitiateProperties(pBtnCount, mtConfirmation, pCaption, pMessage);
  mtInformation  : InitiateProperties(pBtnCount, mtInformation, pCaption, pMessage);
  else
    InitiateProperties(pBtnCount, mtCustom, pCaption, pMessage);
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
end;

procedure TCommonDlg.InitiateProperties(pButtonCount: integer;
  pIcon: TMsgDlgType; pCaption, pMessage: string);
var
  pButtons : TMsgDlgButtons;
begin
  case pButtonCount of
    1: pButtons := [mbYes];
    2: pButtons := [mbYes, mbNo];
    3: pButtons := [mbYes, mbNo, mbCancel];
  end;
  if not assigned(FMessageDialog) then
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
  InitiateProperties(1, mtWarning, 'Peringatan', AField + ER_EMPTY);
  FMessageDialog.ShowModal;
end;

procedure TCommonDlg.ShowConfirm(AType: TActionType);
begin
  case AType of
    atAdd: InitiateProperties(1, mtInformation, 'Informasi', CONF_ADD_SUCCESSFULLY);
    atEdit: InitiateProperties(1, mtInformation, 'Informasi', CONF_EDIT_SUCCESSFULLY);
    atDelete: InitiateProperties(1, mtInformation, 'Informasi', CONF_DELETE_SUCCESSFULLY);
  end;
  FMessageDialog.ShowModal;
end;

procedure TCommonDlg.ShowConfirmGlobal(AMsg: string);
begin
  InitiateProperties(1, mtInformation, 'Information', AMsg);
  FMessageDialog.ShowModal;
end;

procedure TCommonDlg.ShowErrorExist(AField, AValue: String);
begin
  InitiateProperties(1, mtWarning, 'Warning', AField + ' ' + QuotedStr(AValue) + ER_EXIST);
  FMessageDialog.ShowModal;
end;

procedure TCommonDlg.ShowConfirmSuccessfull(AType: TActionType);
begin
  case AType of
    atAdd: InitiateProperties(1, mtInformation, 'Information', CONF_ADD_SUCCESSFULLY);
    atEdit: InitiateProperties(1, mtInformation, 'Information', CONF_EDIT_SUCCESSFULLY);
    atDelete: InitiateProperties(1, mtInformation, 'Information', CONF_DELETE_SUCCESSFULLY);
  end;
  FMessageDialog.ShowModal;
end;

initialization
 CommonDlg := TCommonDlg.Create;
end.
