unit ufrmMasterDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufraFooterDialog2Button, ExtCtrls, cxButtons;

type
  TfrmMasterDialog = class(TForm)
    pnlBody: TPanel;
    footerDialogMaster: TfraFooterDialog2Button;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FDialogCompany: Integer;
    FDialogUnit: Integer;
    { Private declarations }
    procedure GetAndRunButton(AButtonName: string);
  public
    FLoginFullname  : string;
    FLoginRole      : string;
    FLoginUsername  : string;
    FLoginId        : Integer;
    FLoginUnitId    : Integer;
    FMasterIsStore  : Integer;
    FLoginIsStore   : Integer;
    FFilePathReport : String;

    procedure SetDialogCompany(const Value: Integer);
    procedure SetDialogUnit(const Value: Integer);
    function SetFormPropertyAndShowDialog(aFrmMasterDialog : TFrmMasterDialog;
        aIsModal: Boolean = True): Boolean;
    property DialogCompany: Integer read FDialogCompany write SetDialogCompany;
    property DialogUnit: Integer read FDialogUnit write SetDialogUnit;
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

procedure TfrmMasterDialog.SetDialogCompany(const Value: Integer);
begin
  FDialogCompany := Value;
end;

procedure TfrmMasterDialog.SetDialogUnit(const Value: Integer);
begin
  FDialogUnit := Value;
end;

function TfrmMasterDialog.SetFormPropertyAndShowDialog(aFrmMasterDialog :
    TFrmMasterDialog; aIsModal: Boolean = True): Boolean;
begin
  Result := False;
  if Assigned(aFrmMasterDialog) then
  begin
    aFrmMasterDialog.FMasterIsStore   := FMasterIsStore;
    aFrmMasterDialog.FLoginFullname   := FLoginFullname;
    aFrmMasterDialog.FLoginRole       := FLoginRole;
    aFrmMasterDialog.FLoginUsername   := FLoginUsername;
    aFrmMasterDialog.FLoginId         := FLoginId;
    aFrmMasterDialog.FLoginUnitId     := FLoginUnitId;
    aFrmMasterDialog.FLoginIsStore    := FLoginIsStore;
    aFrmMasterDialog.FFilePathReport  := FFilePathReport;

    aFrmMasterDialog.DialogCompany := MasterCompany.ID;
    aFrmMasterDialog.DialogUnit := MasterNewUnit.ID;

    aFrmMasterDialog.FDialogUnitCOde  := MasterNewUnit.Kode;
    aFrmMasterDialog.FDialogUnitName  := MasterNewUnit.Nama;
    Result := True;
  end else begin
    CommonDlg.ShowError('Form Belum Dicreate' +#13 + 'Kesalahan Ada Pada Developer');
    Exit;
  end;

  if ((Result) and (aIsModal)) then
    aFrmMasterDialog.ShowModal
  else if (Result and (aIsModal = False)) then
    aFrmMasterDialog.Show
  else if not Result then
  begin
    CommonDlg.ShowError('Gagal Melakukan Setting Property Form');
    Exit;
  end;
end;

end.
