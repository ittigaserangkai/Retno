unit ufrmMasterDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufraFooterDialog2Button, ExtCtrls;

type
  TfrmMasterDialog = class(TForm)
    pnlBody: TPanel;
    footerDialogMaster: TfraFooterDialog2Button;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure GetAndRunButton(AButtonName: string);
  public
    { Public declarations }
  end;

var
  frmMasterDialog: TfrmMasterDialog;

implementation

{$R *.dfm}

procedure TfrmMasterDialog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMasterDialog.FormDestroy(Sender: TObject);
begin
  frmMasterDialog := nil;
end;

procedure TfrmMasterDialog.GetAndRunButton(AButtonName: string);
var
  i,j: word;
  btnFoo: TcxButton;
begin
  for i:=0 to ComponentCount-1 do
    if (Components[i] is TfraFooterDialog2Button) then
    begin
      for j:=0 to components[i].ComponentCount-1 do
        if (components[i].Components[j].Name = AButtonName) then
        begin
          btnFoo := components[i].Components[j] as TcxButton;
          btnFoo.Click;
          exit;
        end;
    end;
end;

procedure TfrmMasterDialog.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key = VK_RETURN)and(ssctrl in Shift) then
    GetAndRunButton('btnSave');
  if(Key = VK_ESCAPE) then
    GetAndRunButton('btnClose');
end;

end.
