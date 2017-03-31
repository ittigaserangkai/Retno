{*------------------------------------------------------------------------------
  Unit Name: uCommonDlg
  Description: A SUI wrapper so dialog stuff will be encapsulated, and thus be
  flexibel in implementation. We can create our own 3D dialog box, with a
  jumping OK button. Imagine that, what could be more fun than that.
  A jumping OK button, yay!

  @author neofreko
  @author didit a
  @version 11-Feb-2005
  @version 12-April-2006 modif to be general class. It may be use on many project. ;)
  @version 12-April-2006 u should change constanta to modif this message box.
  @bug -
------------------------------------------------------------------------------*}
unit uGTSUICommonDlg;

interface

uses
  Dialogs, Controls, Forms, SUIDlg, SUIThemes;

type
  TMessageType = (mtError, mtInfo, mtConfirm, mtNone);
  TActionType = (atAdd, atEdit, atDelete);

  TCommonDlg = class
  private
    FMessageDialog: TsuiMessageDialog;
    procedure InitiateProperties(pButtonCount: integer; pIcon: TsuiIconType;
      pCaption, pMessage: string);
    //procedure Destroy;
  public
    procedure ShowMessage(msg: string); overload;
    function ShowMessage(pBtnCount: integer; pCaption, pMessage: string;
      pType: TMessageType): TModalResult; overload;
    procedure ShowError(msg: string);
    procedure ShowErrorEmpty(AField: string);
    procedure ShowStoppedProcess(AField: string);
    procedure ShowConfirmSuccessfull(AType: TActionType);  
    procedure ShowConfirmGlobal(AMsg: string);
    procedure ShowConfirm(AType: TActionType);
    function Confirm(msg: string): TModalResult;
  end;

const
  CommonUIStyle: TsuiUIStyle = BlueGlass;

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
function TCommonDlg.Confirm(msg: string): TModalResult;
begin
  InitiateProperties(2, suiHelp, 'Confirmation', msg);
  Result := FMessageDialog.ShowModal;

  //result := SUIMsgDlg(msg, caption, mtConfirmation, [mbYes, mbNo], BlueGlass)
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
  InitiateProperties(1, suiStop, 'Error', msg);
  FMessageDialog.ShowModal;
end;

procedure TCommonDlg.ShowMessage(msg: string);
begin
  InitiateProperties(1, suiInformation, 'Message', msg);
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
  pMessage: string; pType: TMessageType): TModalResult;
begin
  case pType of
  mtError   : InitiateProperties(pBtnCount, suiStop, pCaption, pMessage);
  mtConfirm : InitiateProperties(pBtnCount, suiHelp, pCaption, pMessage);
  mtInfo    : InitiateProperties(pBtnCount, suiInformation, pCaption, pMessage);
  else
    InitiateProperties(pBtnCount, suiNone, pCaption, pMessage);
  end;

  Result := FMessageDialog.ShowModal;
end;

{procedure TCommonDlg.Destroy;
begin
  if assigned(FMessageDialog) then
  begin
    FMessageDialog.Free;
    FMessageDialog := nil;
  end;
end;
}
{*
  Initiate Message dialog.
  Set common properties that build this message box.

  @author didit a
  @version 12-04-2006
*}
procedure TCommonDlg.InitiateProperties(pButtonCount: integer;
  pIcon: TsuiIconType; pCaption, pMessage: string);
begin
  if not assigned(FMessageDialog) then
    FMessageDialog := TsuiMessageDialog.Create(Application);

  with FMessageDialog do
  begin
    Font.Name := 'Trebuchet MS';
    Position := poMainFormCenter;
    UIStyle := CommonUIStyle;
    ButtonCount := pButtonCount;
    Button1Caption := BUTTON_CAPTION1;
    Button1ModalResult := mrYes;
    Button2Caption := BUTTON_CAPTION2;
    Button2ModalResult := mrNo;
    Button3Caption := BUTTON_CAPTION3;
    Button3ModalResult := mrCancel;
    Caption := MESSAGE_CAPTION + pCaption;
    IconType := pIcon;
    Text := pMessage;
  end;
end;

procedure TCommonDlg.ShowErrorEmpty(AField: string);
begin
  InitiateProperties(1, suiStop, 'Error', AField + ER_EMPTY);
  FMessageDialog.ShowModal;
end;

procedure TCommonDlg.ShowConfirmSuccessfull(AType: TActionType);
begin
  case AType of
    atAdd: InitiateProperties(1, suiInformation, 'Information', CONF_ADD_SUCCESSFULLY);
    atEdit: InitiateProperties(1, suiInformation, 'Information', CONF_EDIT_SUCCESSFULLY);
    atDelete: InitiateProperties(1, suiInformation, 'Information', CONF_DELETE_SUCCESSFULLY);
  end;
  FMessageDialog.ShowModal;
end;

procedure TCommonDlg.ShowConfirmGlobal(AMsg: string);
begin
  InitiateProperties(1, suiInformation, 'Information', AMsg);  
  FMessageDialog.ShowModal;
end;

procedure TCommonDlg.ShowStoppedProcess(AField: string);
begin
  InitiateProperties(1, suiStop, 'Error', ER_STOPPED + AField);
  FMessageDialog.ShowModal;
end;

procedure TCommonDlg.ShowConfirm(AType: TActionType);
begin
  case AType of
    atAdd: InitiateProperties(1, suiInformation, 'Information', CONF_ADD_SUCCESSFULLY);
    atEdit: InitiateProperties(1, suiInformation, 'Information', CONF_EDIT_SUCCESSFULLY);
    atDelete: InitiateProperties(1, suiInformation, 'Information', CONF_DELETE_SUCCESSFULLY);
  end;
  FMessageDialog.ShowModal;
end;

initialization
 CommonDlg := TCommonDlg.Create;
end.
