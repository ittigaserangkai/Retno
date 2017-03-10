unit ufrmSearchTypeMember;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialogBrowse, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, ufraFooterDialog3Button, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid;

type
  TModul = (tmMutasiStock, tmTypeMemberIGRA, tmReturDmg, tmReturRep, tmDoForReplace, tmWastageDmg, tmWastageObrl, tmNull);
  TfrmDialogSearchTypeMember = class(TfrmMasterDialogBrowse)
    pnl1: TPanel;
    lbl2: TLabel;
    edtTypeMemberName: TEdit;
    btnSearch: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure edtTypeMemberNameChange(Sender: TObject);
    procedure edtTypeMemberNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridDblClickCell(Sender: TObject; ARow, ACol: Integer);
  private
    FIsProcessSuccessfull: boolean;
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure FindDataOnGrid(AText: String);
  public
    { Public declarations }
    TypeMemberName: string;
    untID,TypeMemberID: Integer;

  published
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogSearchTypeMember: TfrmDialogSearchTypeMember;

implementation

{$R *.dfm}

procedure TfrmDialogSearchTypeMember.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogSearchTypeMember.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogSearchTypeMember := nil;
end;

procedure TfrmDialogSearchTypeMember.FormShow(Sender: TObject);
var dataBarang: TDataSet;
    i, countData: integer;
//    arrParam: TArr;
begin
  {SetLength(arrParam,1);
  arrParam[0].tipe := ptInteger;
  arrParam[0].data := untID;
  dataBarang := SearchTypeMember.GetListTypeMemberBarang(arrParam);
  countData := dataBarang.RecordCount;

  with strgGrid do
  begin
    Clear;
    RowCount := countData + 1;
    ColCount := 1;
    Cells[0,0] := 'TYPE MEMBER NAME';

    if RowCount > 1 then
    begin
      i := 1;
      while not dataBarang.Eof do
      begin
        with strgGrid do
        begin
          Cells[0, i] := dataBarang.FieldByName('TPMEMBER_NAME').AsString;
          Cells[1, i] := dataBarang.FieldByName('TPMEMBER_ID').AsString;
        end;
        Inc(i);
        dataBarang.Next;
      end;
    end
    else
    begin
      RowCount := 2;
      Cells[0, 1] := '';
    end;
    FixedRows := 1;
    AutoSize := true;
  end; }
end;

procedure TfrmDialogSearchTypeMember.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogSearchTypeMember.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
//  TypeMemberName := strgGrid.Cells[0,strgGrid.Row];
//  TypeMemberID := StrToInt(strgGrid.Cells[1,strgGrid.Row]);
  IsProcessSuccessfull := True;
  Close;
end;

procedure TfrmDialogSearchTypeMember.FindDataOnGrid(AText: String);
var
  resPoint: TPoint;
begin
  if (AText <> '') then
  begin
//    resPoint := strgGrid.Find(Point(0,0),AText,[fnIncludeFixed]);
//    if (resPoint.Y <> -1) then
//    begin
//      strgGrid.ScrollInView(resPoint.X, resPoint.Y);
//      strgGrid.SelectRows(resPoint.Y, 1);
//    end;
  end;
end;

procedure TfrmDialogSearchTypeMember.edtTypeMemberNameChange(Sender: TObject);
begin
  FindDataOnGrid(edtTypeMemberName.Text);
end;

procedure TfrmDialogSearchTypeMember.edtTypeMemberNameKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DOWN) then
    cxGrid.SetFocus;
end;

procedure TfrmDialogSearchTypeMember.strgGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_UP) then
    if (cxGridView.DataController.Recno = 1) then
    begin
      edtTypeMemberName.SetFocus;
      edtTypeMemberName.SelectAll;
    end;
end;

procedure TfrmDialogSearchTypeMember.strgGridKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    footerDialogMasterbtnSaveClick(Sender);
end;

procedure TfrmDialogSearchTypeMember.strgGridDblClickCell(Sender: TObject;
  ARow, ACol: Integer);
begin
  inherited;
  footerDialogMasterbtnSaveClick(Sender);
end;

end.
