unit uSpecialKey;

interface
uses uConn, Forms, ExtCtrls, ufraFooter5Button, cxButtons, cxLabel;

type
  TSpecialKey = Class(TObject)
  private

  public
    constructor Create; overload;
    destructor Destroy; override;
    function ChekFrameAdded: Boolean;
    procedure SpecialKeyEscape(Sender: TObject; var isCloseForm: boolean);
    procedure SpecialKeyEnter(Sender: TObject);
    procedure SpecialKeyShiftEnter(Sender: TObject);
    procedure ExecuteLabelOnFrame(sLabel: string);
  end;

var
  SpecialKey: TSpecialKey;

implementation

uses DB, Classes;

{TSpecialKey}

constructor TSpecialKey.Create;
begin
  inherited;

end;

destructor TSpecialKey.Destroy;
begin
  SpecialKey.Free;
  inherited;
end;

function TSpecialKey.ChekFrameAdded: Boolean;
var i:Integer;
begin
  Result:= False;
  for i:=0 to Application.ComponentCount-1 do
  begin
    if(Application.Components[i].ClassParent = TFrame)and
      ((Application.Components[i] as TFrame).Parent<>nil)
    then
    begin
      Result:= True;
      Break;
    end;
  end;
end;

procedure TSpecialKey.SpecialKeyEscape(Sender: TObject; var isCloseForm: boolean);
var i           :Integer;
    tmpPanel    : TPanel;
    tmpButton   : TcxButton;
    tmpFra      : TfraFooter5Button;
begin
  isCloseForm:= True;
  for i:=0 to Application.ComponentCount-1 do
  begin
    if(Application.Components[i].ClassParent = TFrame)and
      ((Application.Components[i] as TFrame).Parent<>nil)
    then
    begin
      tmpPanel:= TPanel(Application.Components[i].FindComponent('pnlAddEdit'));
      if(tmpPanel<>nil)and(tmpPanel.Visible)then
      begin
        tmpButton:= TcxButton(Application.Components[i].FindComponent('btnCancel'));
        if tmpButton<>nil then
        begin
          tmpButton.Click;
          isCloseForm:= False;
        end;
      end
      else
      begin
        (Application.Components[i] as TFrame).Parent:= nil;
        isCloseForm:= False;
      end;
    end;
  end;
  if(isCloseForm)then
  begin
    tmpFra:= TfraFooter5Button((Sender as TForm).FindComponent('fraFooter5Button1'));
    if(not tmpFra.btnClose.Cancel)then
      tmpFra.btnClose.Click;
  end;
end;

procedure TSpecialKey.SpecialKeyEnter(Sender: TObject);
var i:Integer;
    tmpPanel: TPanel;
    tmpButton: TcxButton;
begin
  for i:=0 to Application.ComponentCount-1 do
  begin
    if(Application.Components[i].ClassParent = TFrame)and
      ((Application.Components[i] as TFrame).Parent<>nil)
    then
    begin
      tmpPanel:= TPanel(Application.Components[i].FindComponent('pnlAddEdit'));
      if(tmpPanel<>nil)and(tmpPanel.Visible)then
      begin
        tmpButton:= TcxButton(Application.Components[i].FindComponent('btnSave'));
        if tmpButton<>nil then
        begin
          tmpButton.Click;
        end;
      end;
    end;
  end;
end;

procedure TSpecialKey.SpecialKeyShiftEnter(Sender: TObject);
var i:Integer;
    tmpPanel: TPanel;
    tmpButton: TcxButton;
begin
  for i:=0 to Application.ComponentCount-1 do
  begin
    if(Application.Components[i].ClassParent = TFrame)and
      ((Application.Components[i] as TFrame).Parent<>nil)
    then
    begin
      tmpPanel:= TPanel(Application.Components[i].FindComponent('pnlAddEdit'));
      if(tmpPanel<>nil)and(tmpPanel.Visible)then
      begin
        tmpButton:= TcxButton(Application.Components[i].FindComponent('btnSave1'));
        if tmpButton<>nil then
        begin
          tmpButton.Click;
        end;
      end;
    end;
  end;
end;

procedure TSpecialKey.ExecuteLabelOnFrame(sLabel: string);
var i:Integer;
    tmpLabel: TcxLabel;
begin
  for i:=0 to Application.ComponentCount-1 do
  begin
    if(Application.Components[i].ClassParent = TFrame)and
      ((Application.Components[i] as TFrame).Parent<>nil)
    then
    begin
      tmpLabel:= TcxLabel(Application.Components[i].FindComponent(sLabel));
      if tmpLabel<>nil then
        tmpLabel.OnClick(Self);
    end;
  end;
end;

end.
