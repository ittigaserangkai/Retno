unit ufrmDialogModule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, StdCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button;

type
  TfrmDialogModule = class(TfrmMasterDialog)
    Label4: TLabel;
    edtModName: TEdit;
    edtModCaption: TEdit;
    Label7: TLabel;
    Suplier: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    edtModAction: TEdit;
    cboModLbl: TComboBox;
    Label1: TLabel;
    edtModIconPath: TEdit;
    edtModID: TcxButtonEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtModActionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edtModIDPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    FModId  : Integer;
//    FMdl    : TModule;
    procedure ClearData;
    procedure SetData;
  public
    property ModId: Integer read FModId write FModId;
    { Public declarations }
  end;

var
  frmDialogModule: TfrmDialogModule;

implementation

{$R *.dfm}
uses
  uRetnoUnit, uTSCommonDlg;

procedure TfrmDialogModule.ClearData;
begin
  edtModID.Clear;
  edtModName.Clear;
  edtModCaption.Clear;
  edtModAction.Clear;
  edtModIconPath.Clear;
  cboModLbl.ItemIndex := -1;
end;

procedure TfrmDialogModule.SetData;
var
  i : Integer;
begin
  if FModId <> 0 then
  begin
//    if FMdl.LoadByID(FModId, DialogUnit) then
//    begin
//      edtModID.Text       := IntToStr(FMdl.ModID);
//      edtModName.Text     := FMdl.ModNm;
//      edtModCaption.Text  := FMdl.ModCaption;
//      edtModAction.Text   := FMdl.ModAction;
//
//      for i := 0 to cboModLbl.Items.Count - 1 do
//      begin
//        if LowerCase(Trim(cboModLbl.Items.Strings[i])) = LowerCase(Trim(FMdl.ModLbl)) then
//        begin
//          cboModLbl.ItemIndex := i;
//          Break;
//        end;
//      end;
//
//      edtModID.Enabled  := False;
//    end;
  end
  else
  begin
    edtModID.Enabled  := True;
  end;  
end;


procedure TfrmDialogModule.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action  := caFree;
end;

procedure TfrmDialogModule.FormDestroy(Sender: TObject);
begin
//  FreeAndNil(FMdl);
  frmDialogModule := nil;
  inherited;

end;

procedure TfrmDialogModule.footerDialogMasterbtnSaveClick(Sender: TObject);
var
  sLabel    : String;

begin
  inherited;
  if (edtModID.Text = '') or (cboModLbl.ItemIndex = -1)  then
    exit;

//  if cboModLbl.ItemIndex = 0 then sLabel := 'Add';
//  if cboModLbl.ItemIndex = 1 then sLabel := 'Edit';
//  if cboModLbl.ItemIndex = 2 then sLabel := 'Delete';
//  if cboModLbl.ItemIndex = 3 then sLabel := 'Refresh';
//  if cboModLbl.ItemIndex = 4 then sLabel := 'View';
//  if cboModLbl.ItemIndex = 5 then sLabel := 'Posted';
//  if cboModLbl.ItemIndex = 6 then sLabel := 'Form';
  sLabel := cboModLbl.Text;

//  FMdl.UpdateData(edtModAction.Text, edtModCaption.Text, edtModIconPath.Text,
//            FModId, sLabel, edtModName.Text, DialogUnit);

//  try
//    if FMdl.SaveToDB then
//    begin
//      cCommitTrans;
//      CommonDlg.ShowMessage('Sukses simpan data');
//
//      if FModId <> 0 then
//        self.Close;
//
//      ClearData;
//    end
//    else
//    begin
//      cRollbackTrans;
//      CommonDlg.ShowError('Gagal simpan data');
//    end;
//  finally
//    cRollbackTrans;
//  end;

end;

procedure TfrmDialogModule.FormCreate(Sender: TObject);
begin
  inherited;
//  FMdl  := TModule.Create(nil);
end;

procedure TfrmDialogModule.edtModActionKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sSQL  : string;
begin
  inherited;
if Key = vk_F5 then
  begin
    sSQL  := 'SELECT ACT_NAME, ACT_DESC'
          + ' FROM ACTION_LIST'
          + ' WHERE ACT_UNT = '+ IntToStr(DialogUnit);
//    with cLookUp('Get Action List', sSQL) do
//    begin
//      try
//        edtModAction.Text := Strings[0];
//      finally
//        Free;
//      end;
//    end;


  end;
end;

procedure TfrmDialogModule.edtModIDPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  sSQL: String;
begin

  sSQL := 'select max(MOD_ID) from AUT$MODULE';
//  with cOpenQuery(sSQL) do
//  Begin
//    Try
//      edtModID.Text := IntToStr(Fields[0].AsInteger+1);
//    Finally
//      Free;
//    End;
//  End;
end;

procedure TfrmDialogModule.FormShow(Sender: TObject);
begin
  inherited;
  SetData;
end;

end.



