unit ufrmSearchStatusKlrg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialogBrowse, ExtCtrls, StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  ufraFooterDialog3Button, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  Vcl.Menus, cxButtons, System.Actions, Vcl.ActnList;

type
  TModul = (tmMutasiStock, tmStatusKlrgIGRA, tmReturDmg, tmReturRep, tmDoForReplace, tmWastageDmg, tmWastageObrl, tmNull);
  TfrmDialogSearchStatusKlrg = class(TfrmMasterDialogBrowse)
    pnl1: TPanel;
    lbl2: TLabel;
    edtStatusKlrgName: TEdit;
    btnSearch: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure edtStatusKlrgNameChange(Sender: TObject);
    procedure edtStatusKlrgNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FIsProcessSuccessfull: boolean;
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure FindDataOnGrid(AText: String);
  public
    { Public declarations }
    StatusKlrgName: string;
    untID,StatusKlrgID: Integer;

  published
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogSearchStatusKlrg: TfrmDialogSearchStatusKlrg;

implementation

{$R *.dfm}

procedure TfrmDialogSearchStatusKlrg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogSearchStatusKlrg.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogSearchStatusKlrg := nil;
end;

procedure TfrmDialogSearchStatusKlrg.FormShow(Sender: TObject);
var dataBarang: TDataSet;
    i, countData: integer;
//    arrParam: TArr;
begin
  {arrParam := nil;
  dataBarang := SearchStatusKlrg.GetListStatusKlrg(arrParam);
  countData := dataBarang.RecordCount;

  with strgGrid do
  begin
    Clear;
    RowCount := countData + 1;
    ColCount := 1;
    Cells[0,0] := 'STATUS KELUARGA NAME';

    if RowCount > 1 then
    begin
      i := 1;
      while not dataBarang.Eof do
      begin
        with strgGrid do
        begin
          Cells[0, i] := dataBarang.FieldByName('STAKLRG_NAME').AsString;
          Cells[1, i] := dataBarang.FieldByName('STAKLRG_ID').AsString;
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
  end;             }
end;

procedure TfrmDialogSearchStatusKlrg.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogSearchStatusKlrg.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
//  StatusKlrgName := strgGrid.Cells[0,strgGrid.Row];
//  StatusKlrgID := StrToInt(strgGrid.Cells[1,strgGrid.Row]);
  IsProcessSuccessfull := True;
  Close;
end;

procedure TfrmDialogSearchStatusKlrg.FindDataOnGrid(AText: String);
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

procedure TfrmDialogSearchStatusKlrg.edtStatusKlrgNameChange(Sender: TObject);
begin
  FindDataOnGrid(edtStatusKlrgName.Text);
end;

procedure TfrmDialogSearchStatusKlrg.edtStatusKlrgNameKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key=VK_DOWN) then
    cxGrid.SetFocus;
end;

end.
