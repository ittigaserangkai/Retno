unit ufrmMaster;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ActnList, uConstanta, cxButtons, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid;

type
  TfrmMaster = class(TForm)
    pnlBody: TPanel;
    pnlHeader: TPanel;
    lblHeader: TLabel;
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    TList: TStrings;
    procedure GetUserModule;
  protected
    procedure DecorateFooter(var grid: TcxGridDBTableView; c, r: integer);
  public
    procedure Authenticate;
    procedure GetAndRunButton(AButtonName: string);
  end;

var
  frmMaster: TfrmMaster;

implementation

uses udmMain, ufrmMain, ufraFooter5Button;

{$R *.dfm}

procedure TfrmMaster.FormDestroy(Sender: TObject);
begin
//  if frmMaster.ModalResult = ShowModal then
//    frmMain.pnlHeader.Show;

  TList.Free;
  frmMaster := nil;
end;

procedure TfrmMaster.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

  if frmMain.MDIChildCount = 1 then
    frmMain.pnlHeader.Show;
end;

procedure TfrmMaster.Authenticate;
var
  i: word;
  idx: integer;
begin
  GetUserModule;
  for i := 0 to ComponentCount-1 do
    if Components[i] is TAction then begin
      idx := TList.IndexOf(Components[i].Name);
      if idx <> -1 then
        (Components[i] as TAction).Enabled := true
      else
        (Components[i] as TAction).Enabled := false;
    end;
end;

procedure TfrmMaster.GetUserModule;
var
  strNama: string;
begin
  strNama := Name;
{  with dmMain.qrMultiPurpose do begin
    SQL.Text :=
      'SELECT m.mod_action FROM aut$module m ' +
      'LEFT JOIN aut$group_module gm ON m.mod_id = gm.gmod_mod_id ' +
      'LEFT JOIN aut$user_group ug ON gm.gmod_gro_id = ug.ug_gro_id ' +
      'LEFT JOIN aut$user u ON ug.ug_usr_id = u.usr_id ' +
      'WHERE m.mod_name = :module AND u.usr_username = :username';
    Params[0].AsString := strNama;
    Params[1].AsString := frmMain.LoginUsername;
    Open;
    if not IsEmpty then
      while not Eof do begin
        TList.Add(Fields[0].AsString);
        Next;
      end;
  end;
  }
end;

procedure TfrmMaster.FormCreate(Sender: TObject);
begin
  KeyPreview := true;
  TList := TStringList.Create;
end;

procedure TfrmMaster.FormShow(Sender: TObject);
begin
  Authenticate;
//  frmMain.pnlHeader.Hide;
end;

procedure TfrmMaster.GetAndRunButton(AButtonName: string);
var
  i,j: word;
  btnFoo: TcxButton;
begin
  for i:=0 to ComponentCount-1 do
    if (Components[i] is TfraFooter5Button) then
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

procedure TfrmMaster.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key = Ord('C'))and(ssctrl in Shift) then
    GetAndRunButton('btnAdd')
  else if(Key = Ord('E'))and(ssctrl in Shift) then
    GetAndRunButton('btnUpdate')
  else if(Key = VK_DELETE)and(ssctrl in Shift) then
    GetAndRunButton('btnDelete')
  else if(Key = VK_F5)and(ssctrl in Shift) then
    GetAndRunButton('btnRefresh')
  else if(Key = Ord('U'))and(ssCtrl in Shift)and(ssShift in Shift)then
    try
//      frmMain.cbbUnit.SetFocus;
    except
    end;
end;

procedure TfrmMaster.FormActivate(Sender: TObject);
begin  
//  frmMain.lbl1.Visible := true;
//  frmMain.cbbUnit.Visible := true;
  frmMain.pnlHeader.Visible := False;
end;

procedure TfrmMaster.DecorateFooter(var grid: TcxGridDBTableView; c, r: integer);
begin
  with grid do begin
{    FloatingFooter.ColumnCalc[c] := acSUM;

    Cells[c, r] := FormatCell(Cells[c, r]);
    Cells[c, r] := FormatCurr('#,##0.##', StrToCurr(Cells[c, r]));

    FontStyles[c, r] := FontStyles[c, r] + [fsBold];

    Alignments[c, r] := taRightJustify;
}
  end;
end;

end.
