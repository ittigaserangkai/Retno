unit ufraLookUpCC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid;

type
  TfraLookUpCC = class(TFrame)
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    cxlvMaster: TcxGridLevel;
    edNama: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    pnlHeader: TPanel;
    procedure cxGridViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edNamaChange(Sender: TObject);
    procedure edNamaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FCC_Code: String;
    procedure SetGridColumn;
  public
    procedure LoadData(aIsPaymentKring: Integer);
    procedure SetGrid;
    property CC_Code: String read FCC_Code write FCC_Code;
  end;

implementation

uses
  udmMain, uDXUtils;

const
  _KolKode: Integer = 0;
  _KolNama: Integer = 1;
  _ColCount: Integer = 2;

{$R *.dfm}

procedure TfraLookUpCC.cxGridViewKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  CC_Code := cxGridView.DataController.Values[cxGridView.DataController.FocusedRecordIndex, _KolKode];
  if ((Key = VK_UP) or (Key = 33)) and (cxGridView.DataController.RecNo = 1) then
  begin
    edNama.SetFocus;
    edNama.SelectAll;
    Exit;
  end
  else
  if ((Key = VK_DOWN) or (Key = 34)) and (cxGridView.DataController.RecNo = (cxGridView.DataController.RowCount-1)) then
  begin
    edNama.SetFocus;
    edNama.SelectAll;
    Exit;
  end
  else
  if Key = VK_F5 then
  begin
    edNama.SetFocus;
    edNama.SelectAll;
  end;
end;

procedure TfraLookUpCC.edNamaChange(Sender: TObject);
begin
//  with cxGridView.DataController do
//  begin
//    Filter.Clear;
//    Filter.Active := False;
//    Filter.Options := [fcoCaseInsensitive];
//    Filter.PercentWildcard := '*';
//    Filter.FilterText := ';*' + edNama.Text + '*';
//    Filter.SupportedLike := True;
//    KeyFieldNames := cxGridView.Columns[_KolNama].Caption;
//    Filter.Active := True;
//  end;
end;

procedure TfraLookUpCC.edNamaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key in [VK_UP,VK_DOWN,33,34]) then
  begin
    cxGrid.SetFocus;
    if cxGridView.DataController.RowCount <= 0 then exit;
  end
  else if (key in [VK_RETURN]) then
  begin
    with cxGridView.DataController do
    begin
      Filter.Clear;
      Filter.Active := False;
      Filter.Options := [fcoCaseInsensitive];
      Filter.PercentWildcard := '*';
      Filter.FilterText := ';*' + edNama.Text + '*';
      Filter.SupportedLike := True;
      KeyFieldNames := cxGridView.Columns[_KolNama].Caption;
      Filter.Active := True;
    end;
  end;
end;

procedure TfraLookUpCC.LoadData(aIsPaymentKring: Integer);
var
  sFilterCC: string;
  sSQL: string;
begin
  CC_Code := '';
//  SetGrid;

  if aIsPaymentKring = 1 then
    sFilterCC := ' and CARD_IS_KRING = ' + IntToStr(aIsPaymentKring)
  else
    sFilterCC := ' and (CARD_IS_KRING = 0 or CARD_IS_KRING is null)';

  sSQL := 'select card_code as Kode, card_name as Nama '
        + ' from ref$credit_card '
//        + ' where card_unt_id = ' + IntToStr(AUnitID)
        + ' where CARD_IS_ACTIVE = 1' // BP Was Here
        + sFilterCC
        + ' order by card_code';
{
  with cOpenQuery(sSQL) do
  begin
    try
      while not eof do
      begin
        with cxGridView do
        begin
          Columns[_KolKode].Rows[RowCount-1] := Fields[0].AsString;
          Columns[_KolNama].Rows[RowCount-1] := Fields[1].AsString;
          RowCount := RowCount + 1;
        end;    // with

        Next;
      end;
    finally
      Free;
    end;
  end;
}

  cxGridView.LoadFromCDS(cOpenDataset(sSQL));
end;

procedure TfraLookUpCC.SetGrid;
begin
  with cxGridView.DataController do
  begin
//    cClearGrid(sgLookup,True);
//    cxGridView.ColumnCount := _ColCount;
//    RowCount := 2;
    SetGridColumn;
  end;    // with
end;

procedure TfraLookUpCC.SetGridColumn;
begin
  with cxGridView do
  begin
    DataController.Values[0, _KolKode] := 'Kode';
    DataController.Values[0, _KolNama] := 'Nama Kartu';
    Columns[_KolKode].Width := 50;
    Columns[_KolNama].Width := 160;
  end;
end;

end.
