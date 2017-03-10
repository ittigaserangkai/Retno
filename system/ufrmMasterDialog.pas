unit ufrmMasterDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufraFooterDialog3Button, ExtCtrls, ActnList, System.Actions;

type
  TfrmMasterDialog = class(TForm)
    pnlBody: TPanel;
    footerDialogMaster: TfraFooterDialog3Button;
    actlstMasterDialog: TActionList;
    actDelete: TAction;
    actSave: TAction;
    actCancel: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FDialogCompany: Integer;
    FDialogUnit: Integer;
    TList: TStrings;
    procedure Authenticate;
    procedure GetAndRunButton(AButtonName: string); dynamic;
    procedure GetUserModule;
  public
    FDialogUnitCOde: string;
    FDialogUnitName: string;
    { Public declarations }

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
    property DialogCompany: Integer read FDialogCompany write SetDialogCompany;
    property DialogUnit: Integer read FDialogUnit write SetDialogUnit;

  end;

var
  frmMasterDialog: TfrmMasterDialog;

implementation

uses udmMain;

{$R *.dfm}

procedure TfrmMasterDialog.Authenticate;
var
  i: word;
  idx: integer;
begin
  GetUserModule;

  for i := 0 to ComponentCount-1 do
  begin
    if Components[i] is TAction then
    begin
      idx := TList.IndexOf(LowerCase(Components[i].Name));
      if idx <> -1 then
        (Components[i] as TAction).Enabled := true
      else
        (Components[i] as TAction).Enabled := false;
    end;
  end;

end;

procedure TfrmMasterDialog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree
end;

procedure TfrmMasterDialog.FormDestroy(Sender: TObject);
begin
  frmMasterDialog := nil;
end;

procedure TfrmMasterDialog.GetAndRunButton(AButtonName: string);
var
  i,j: word;
//  btnFoo: TsuiButton;
begin
  for i:=0 to ComponentCount-1 do
    if (Components[i] is TfraFooterDialog3Button) then
    begin
      for j:=0 to components[i].ComponentCount-1 do
        if (components[i].Components[j].Name = AButtonName) then
        begin
//          btnFoo := components[i].Components[j] as TsuiButton;
//          btnFoo.Click;
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

procedure TfrmMasterDialog.FormCreate(Sender: TObject);
begin
  TList             := TStringList.Create;
  FormatSettings.DecimalSeparator  := '.';
  FormatSettings.ThousandSeparator := ',';
  FormatSettings.CurrencyString    := 'Rp';
 end;

procedure TfrmMasterDialog.GetUserModule;
var
  sTipe: string;
  sSQL    : string;
  strNama : string;
begin
  strNama := Name;
  sTipe   := 'View';

  sSQL  := 'SELECT MOD.MOD_ACTION '
         + ' FROM AUT$MENU_STRUCTURE MS '
         + ' LEFT OUTER JOIN AUT$MENU M ON (MS.MENUS_ID = M.MENU_ID) '
         + ' AND (MS.MENUS_UNT_ID = M.MENU_UNT_ID) '
         + ' LEFT OUTER JOIN AUT$USER_GROUP UG ON (M.MENU_GRO_ID = UG.UG_GRO_ID) '
         + ' AND (M.MENU_GRO_UNT_ID = UG.UG_GRO_UNT_ID) '
         + ' LEFT OUTER JOIN AUT$USER U ON (UG.UG_USR_ID = U.USR_ID) '
         + ' AND (UG.UG_USR_UNT_ID = U.USR_UNT_ID) '
         + ' INNER JOIN AUT$MODULE MOD ON (MS.MENUS_MOD_ID = MOD.MOD_ID) '
         + ' AND (MS.MENUS_MOD_UNT_ID = MOD.MOD_UNT_ID) '
         + ' WHERE U.USR_USERNAME = '+ QuotedStr(FLoginUsername)
         + ' AND U.USR_UNT_ID = '+ IntToStr(FLoginUnitId)
         + ' AND MOD.MOD_LABEL <> ' + QuotedStr(sTipe)
         + ' AND UPPER(MOD.MOD_NAME) = ' + QuotedStr(UpperCase(strNama));
         
  with dmMain.qrMultiPurpose do
  begin
    SQL.Text := sSQL;

    Open;
    while not Eof do
    begin
      TList.Add(LowerCase(Fields[0].AsString));
      Next;
    end;
  end;
end;

procedure TfrmMasterDialog.SetDialogCompany(const Value: Integer);
begin
  FDialogCompany := Value;
end;

procedure TfrmMasterDialog.SetDialogUnit(const Value: Integer);
begin
  FDialogUnit := Value;
end;


procedure TfrmMasterDialog.FormShow(Sender: TObject);
begin
//    Authenticate;
end;

end.
