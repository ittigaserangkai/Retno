unit ufrmDialogMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls,
  StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, System.Actions, Vcl.ActnList, ufraFooterDialog3Button;

type
  TfrmDialogMenu = class(TfrmMasterDialog)
    lbl2: TLabel;
    Label8: TLabel;
    lbl3: TLabel;
    Label1: TLabel;
    edtMenuCaption: TEdit;
    edtMenuNm: TEdit;
    edtMenuPrtNm: TEdit;
    lblMenuNo: TLabel;
    Label2: TLabel;
    edtModID: TEdit;
    edtModNm: TEdit;
    edtMenuPrtID: TEdit;
    edtMenuID: TcxButtonEdit;
    edtMenuNo: TcxButtonEdit;
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure edtModIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMenuPrtIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtMenuIDPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtMenuNoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
//    FmenuStr  : TMenuStructure;
//    FLoginID  : Integer;
    FMenuID   : integer;
    procedure ClearData;
    procedure SetData;
  public
//    procedure ShowWithID(aMenuID: integer = 0);
    property MenuID: Integer read FMenuID write FMenuID;
    { Public declarations }
  end;

var
  frmDialogMenu: TfrmDialogMenu;

implementation

{$R *.dfm}
uses
  uRetnoUnit, uTSCommonDlg, DB;

procedure TfrmDialogMenu.ClearData;
begin
  edtModID.Clear;
  edtModNm.Clear;
  edtMenuPrtID.Clear;
  edtMenuPrtNm.Clear;
  edtMenuID.Clear;
  edtMenuNm.Clear;
  edtMenuCaption.Clear;
  edtMenuNo.Clear;
end;

procedure TfrmDialogMenu.footerDialogMasterbtnSaveClick(Sender: TObject);
var
  iModId: Integer;
  sPrnt     : Integer;
  sMenuId   : string;
  sMenuUnt  : string;
begin
  inherited;

  sPrnt := 1;
  if (Trim(edtMenuPrtID.Text) = '') or ( Trim(edtMenuPrtID.Text)='0') then
    sPrnt := 0;

//  if (Trim(edtModID.Text) ='')  then
//    Exit;

  if sPrnt = 0 then
    begin
      sMenuId   := 'null';
      sMenuUnt  := 'null';
    end
  else
  begin
    sMenuId   := edtMenuPrtID.Text;
    sMenuUnt  := IntToStr(DialogUnit);
  end;
  
  if (edtModID.Text = '') or (edtModID.Text = '0') then
  begin
  iModId       := 0;
  end
  else  
  begin
  iModId       := StrToInt(edtModID.Text);
  end;

//  FmenuStr.UpdateData(edtMenuCaption.Text, FMenuID,
//        edtMenuNm.Text, StrToInt(edtMenuNo.Text), sMenuId,
//        DialogUnit, sMenuUnt, iModId, DialogUnit);

//  try
//    if FmenuStr.SaveToDB then
//    begin
//      cCommitTrans;
//      CommonDlg.ShowMessage('Data telah tersimpan');
//
//      if FMenuID <> 0 then
//        Self.Close;
//
//      ClearData;
//    end
//    else
//    begin
//      CommonDlg.ShowError('Gagal simpan data');
//    end;
//  finally
//    cRollbackTrans;
//  end;

end;

procedure TfrmDialogMenu.SetData;
begin
  if FMenuID <> 0 then
  begin
//    if FmenuStr.LoadByID(FMenuID, DialogUnit) then
//    begin
//      edtMenuID.Text      := IntToStr(FmenuStr.MenuID);
//      edtMenuNm.Text      := FmenuStr.MenuNm;
//      edtMenuCaption.Text := FmenuStr.MenuCaption;
//      edtMenuNo.Text      := IntToStr(FmenuStr.MenuNo);
//      edtModID.Text       := IntToStr(FmenuStr.Module.ModID);
//      edtModNm.Text       := FmenuStr.Module.ModNm;
//
//      try
////        edtMenuPrtID.Text   := IntToStr(FmenuStr.MenuID);
//        edtMenuPrtID.Text   := IntToStr(FmenuStr.MenuStruct.MenuID);
//        edtMenuPrtNm.Text   := FmenuStr.MenuStruct.MenuNm;
//      except
//        edtMenuPrtID.Text   := '0';
//        edtMenuPrtNm.Text   := '';
//      end;

      edtMenuID.Enabled := False;
    end;
//  end
//  else
//  begin
//    edtMenuID.Enabled := True;
//  end;
end;

//procedure TfrmDialogMenu.ShowWithID(aMenuID: integer = 0);
//begin
////  DialogUnit := aUnitId;
//  FMenuID := aMenuID;
//  SetData;
//
////  Self.ShowModal;
//end;

procedure TfrmDialogMenu.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action  := caFree;
end;

procedure TfrmDialogMenu.FormDestroy(Sender: TObject);
begin
//  FreeAndNil(FmenuStr);
  frmDialogMenu := nil;
  inherited;

end;

procedure TfrmDialogMenu.edtModIDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = vk_F5 then
  begin
//    GetDataIdNm('Get Module', getSQLModuleLIst(DialogUnit, 0, False), edtModID, edtModNm );
  end;
end;

procedure TfrmDialogMenu.edtMenuPrtIDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = vk_f5 then
  begin                                               
//    GetDataIdNm('Get Menu', GetSQLMenuParent(DialogUnit), edtMenuPrtID, edtMenuPrtNm);
  end;
end;

procedure TfrmDialogMenu.edtMenuIDPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  sSQL: String;
begin
  sSQL := 'select max(MENUS_ID) from AUT$MENU_STRUCTURE';
//  with cOpenQuery(sSQL) do
//  Begin
//    Try
//      edtMenuID.Text := IntToStr(Fields[0].AsInteger+1);
//    Finally
//      Free;
//    End;
//  End;

end;

procedure TfrmDialogMenu.edtMenuNoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  No: Integer;
  sSQL : string;
begin
  if edtMenuPrtID.Text = '' then
  begin
    edtMenuNo.Text  := '1';
    exit;
  end;

  sSQL := 'select max(a.menus_no)'
       + ' from aut$menu_structure a'
       + ' where a.menus_parent_menu_id='
       + QuotedStr(edtMenuPrtID.Text);

//  with cOpenQuery(sSQL) do
//  Begin
//    Try
//      if FieldByName('MAX').IsNull then
//      No := 1
//      else
//      No := FieldByName('MAX').AsInteger+1;
//      edtMenuNo.Text := IntToStr(Fields[0].AsInteger+1);
//    Finally
//      Free;
//    End;
//  End;
  edtMenuNo.Text := IntToStr(No);
end;

procedure TfrmDialogMenu.FormCreate(Sender: TObject);
begin
  inherited;
//  FmenuStr  := TMenuStructure.Create(nil);
end;

procedure TfrmDialogMenu.FormShow(Sender: TObject);
begin
  inherited;
  SetData;
end;

end.
