unit ufrmSearchMember;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, SUIForm,
  Grids, BaseGrid, AdvGrid, SUIButton, StdCtrls, uConn;

type
  TModul = (tmListOmzet, tmNone);
  TfrmDialogSearchMember = class(TfrmMasterDialog)
    pnl1: TPanel;
    lbl2: TLabel;
    edtKodeMember: TEdit;
    pnl2: TPanel;
    strgGrid: TAdvStringGrid;
    edtMemberName: TEdit;
    lbl1: TLabel;
    btnSearch: TsuiButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure edtMemberNameChange(Sender: TObject);
    procedure edtKodeMemberKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSearchClick(Sender: TObject);
    procedure edtKodeMemberChange(Sender: TObject);
    procedure edtKodeMemberEnter(Sender: TObject);
    procedure edtMemberNameEnter(Sender: TObject);
    procedure edtMemberNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure strgGridDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure strgGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtKodeMemberKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMemberNameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSearchExit(Sender: TObject);
    procedure btnSearchEnter(Sender: TObject);
    procedure footerDialogMasterbtnSaveEnter(Sender: TObject);
    procedure footerDialogMasterbtnCloseEnter(Sender: TObject);
    procedure footerDialogMasterbtnCloseExit(Sender: TObject);
    procedure footerDialogMasterbtnSaveExit(Sender: TObject);
  private
    FIsProcessSuccessfull: boolean;
    FSearchMode: Byte;
    FMemberCode: String;
    FMemberName: String;
    FModul: TModul; //0: member code; 1: member name
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure FindDataOnGrid(AText: String);
    procedure FindDataFromDB(AText: String; ASearchType: Byte = 0);
    procedure SetModul(const Value: TModul);
  public
    { Public declarations }
    untID,MemberID: Integer;

  published
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
    property MemberCode: String read FMemberCode write FMemberCode;
    property MemberName: String read FMemberName write FMemberName;
    property Modul: TModul read FModul write SetModul;
  end;

var
  frmDialogSearchMember: TfrmDialogSearchMember;

implementation

uses uSearchMember, suithemes;

{$R *.dfm}

procedure TfrmDialogSearchMember.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogSearchMember.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogSearchMember := nil;
end;

procedure TfrmDialogSearchMember.FormShow(Sender: TObject);
begin
//  FindDataFromDB('%%');
  if Modul = tmListOmzet then
    edtKodeMember.MaxLength:= 8;
end;
procedure TfrmDialogSearchMember.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogSearchMember.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  IsProcessSuccessfull := True;
  Close;
end;

procedure TfrmDialogSearchMember.FindDataOnGrid(AText: String);
var
  resPoint: TPoint;
begin
  if (AText <> '') then
  begin
    resPoint := strgGrid.Find(Point(0,0),AText,[fnIncludeFixed]);
    if (resPoint.Y <> -1) then
    begin
      strgGrid.ScrollInView(resPoint.X, resPoint.Y);
      strgGrid.SelectRows(resPoint.Y, 1);
    end;
  end;
end;

procedure TfrmDialogSearchMember.edtMemberNameChange(Sender: TObject);
begin
  FindDataOnGrid(edtMemberName.Text);
end;

procedure TfrmDialogSearchMember.FindDataFromDB(AText: String; ASearchType:
    Byte = 0);
var dataMember: TResultDataSet;
    i, countData: integer;
    arrParam: TArr;
begin
  SetLength(arrParam,1);
  arrParam[0].tipe := ptString;
  arrParam[0].data := AText;
  arrParam[0].data := '%' + AText + '%';
//  dataMember := SearchMember.GetListMember(arrParam);
  dataMember := TResultDataSet.Create(Self); 
  if Modul = tmListOmzet then
//     dataMember:= SearchMember.GetListTrader(AText, ASearchType)
  else
     dataMember:= SearchMember.GetListMember(AText,ASearchType);

  countData := dataMember.RecordCount;

  with strgGrid do
  begin
    Clear;
    RowCount := countData + 1;
    ColCount := 2;
    strgGrid.Cells[0, 0]:= 'MEMBER CODE';
    strgGrid.Cells[1, 0]:= 'MEMBER NAME';

    if RowCount > 1 then
    begin
      i := 1;
      while not dataMember.Eof do
      begin
        with strgGrid do
        begin
          if Modul = tmListOmzet then
          begin
            Cells[0, i] := dataMember.FieldByName('TRD_CODE').AsString;
            Cells[1, i] := dataMember.FieldByName('TRD_NAME').AsString;
            Cells[2, i] := dataMember.FieldByName('TRD_ID').AsString;
          end else
          begin
            Cells[0, i] := dataMember.FieldByName('MEMBER_CARD_NO').AsString;
            Cells[1, i] := dataMember.FieldByName('MEMBER_NAME').AsString;
            Cells[2, i] := dataMember.FieldByName('MEMBER_ID').AsString;
            Cells[3, i] := dataMember.FieldByName('GROMEMBER_NAME').AsString;
            Cells[4, i] := dataMember.FieldByName('MEMBER_ADDRESS').AsString;
            Cells[5, i] := dataMember.FieldByName('GROMEMBER_NPWP').AsString;
            Cells[6, i] := dataMember.FieldByName('MEMBER_IS_VALID').AsString;
          end;
        end;
        Inc(i);
        dataMember.Next;
        Application.ProcessMessages;
      end;
    end
    else
    begin
      RowCount := 2;
      Cells[0, 1] := '';
    end;
    FixedRows := 1;
    AutoSize := true;
  end;
  MemberCode:= strgGrid.Cells[0, 1];
end;


procedure TfrmDialogSearchMember.edtKodeMemberKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if(Key in [VK_UP,VK_DOWN,33,34])then
  begin
    strgGrid.SetFocus;
    strgGrid.Col := 0;
    strgGrid.Row := 1;
  end;
end;

procedure TfrmDialogSearchMember.strgGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ((Key = VK_UP) or (Key = 33)) and (strgGrid.Row = 1) then
  begin
    case FSearchMode of
      0: edtKodeMember.SetFocus;
      1: edtMemberName.SetFocus;
    end;
  end
  else
  if ((Key = VK_DOWN) or (Key = 34)) and (strgGrid.Row = (strgGrid.RowCount-1)) then
  begin
    case FSearchMode of
      0: edtKodeMember.SetFocus;
      1: edtMemberName.SetFocus;
    end;
  end;
{
  if(Key in [VK_UP,VK_DOWN,33,34])then
  //if (Key = Ord(VK_UP)) then
    if (strgGrid.Row = 1) then
    begin
      edtKodeMember.SetFocus;
      edtKodeMember.SelectAll;
    end;
}

end;

procedure TfrmDialogSearchMember.btnSearchClick(Sender: TObject);
begin
  case FSearchMode of
    0: //kode member
    begin
      FindDataFromDB(Trim(edtKodeMember.Text));
    end;
    1:
    begin
      FindDataFromDB('%' + Trim(edtMemberName.Text) + '%',FSearchMode);
    end;
  end;
end;

procedure TfrmDialogSearchMember.edtKodeMemberChange(Sender: TObject);
begin
  {if (Length(Trim(edtKodeMember.Text)) = 3) then
  begin
    FindDataFromDB(Trim(edtKodeMember.Text));
    FindDataOnGrid(Trim(edtKodeMember.Text));
  end
  else}
    FindDataOnGrid(edtKodeMember.Text);
end;

procedure TfrmDialogSearchMember.edtKodeMemberEnter(Sender: TObject);
begin
  inherited;
  FSearchMode := 0;
end;

procedure TfrmDialogSearchMember.edtMemberNameEnter(Sender: TObject);
begin
  inherited;
  FSearchMode := 1;
end;

procedure TfrmDialogSearchMember.edtMemberNameKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if(Key in [VK_UP,VK_DOWN,33,34])then
  begin
    strgGrid.SetFocus;
    strgGrid.Col := 0;
    strgGrid.Row := 1;
  end;
end;

procedure TfrmDialogSearchMember.strgGridRowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  FMemberCode := strgGrid.Cells[0, NewRow];
  FMemberName := strgGrid.Cells[1, NewRow];
end;

procedure TfrmDialogSearchMember.strgGridDblClickCell(Sender: TObject;
  ARow, ACol: Integer);
begin
  inherited;
  footerDialogMasterbtnSaveClick(Self);
end;

procedure TfrmDialogSearchMember.strgGridKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    footerDialogMaster.btnSave.Click;
end;

procedure TfrmDialogSearchMember.edtKodeMemberKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    if edtKodeMember.Text = '' then
      edtMemberName.SetFocus
    else
    begin
      strgGrid.SetFocus;
      strgGrid.Col := 0;
      strgGrid.Row := 1;
    end;
  end;
end;

procedure TfrmDialogSearchMember.edtMemberNameKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
if Key = VK_RETURN then
  begin
    if edtMemberName.Text <> '' then
    begin
      strgGrid.SetFocus;
      strgGrid.Col := 0;
      strgGrid.Row := 1;
    end;
  end;
end;

procedure TfrmDialogSearchMember.SetModul(const Value: TModul);
begin
  FModul := Value;
end;

procedure TfrmDialogSearchMember.btnSearchExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmDialogSearchMember.btnSearchEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmDialogSearchMember.footerDialogMasterbtnSaveEnter(
  Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmDialogSearchMember.footerDialogMasterbtnCloseEnter(
  Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmDialogSearchMember.footerDialogMasterbtnCloseExit(
  Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmDialogSearchMember.footerDialogMasterbtnSaveExit(
  Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

end.
