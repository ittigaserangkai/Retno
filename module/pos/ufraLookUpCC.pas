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
    pnlHeader: TPanel;
    Label1: TLabel;
    edNama: TEdit;
    Panel1: TPanel;
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    cxlvMaster: TcxGridLevel;
    cxcolKode: TcxGridDBColumn;
    cxcolNama: TcxGridDBColumn;
    procedure cxGridViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edNamaChange(Sender: TObject);
    procedure edNamaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FCC_Code: String;
    procedure SetGridColumn;
    { Private declarations }
  public
    procedure LoadData(AUnitID: Integer; aIsPaymentKring : Integer);
    procedure SetGrid;
    property CC_Code: String read FCC_Code write FCC_Code;
    { Public declarations }
  end;

implementation

const
  _KolKode: Integer = 0;
  _KolNama: Integer = 1;
  _ColCount: Integer = 2;

{$R *.dfm}

procedure TfraLookUpCC.cxGridViewKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  CC_Code := cxGridView.DataController.Values[_KolKode, cxGridView.DataController.RecNo];
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

procedure TfraLookUpCC.LoadData(AUnitID: Integer; aIsPaymentKring : Integer);
var
  sFilterCC: string;
  sSQL: string;
begin
  CC_Code := '';
  SetGrid;

  if aIsPaymentKring = 1 then
    sFilterCC := ' and CARD_IS_KRING = ' + IntToStr(aIsPaymentKring)
  else
    sFilterCC := ' and (CARD_IS_KRING = 0 or CARD_IS_KRING is null)';

  sSQL := 'select card_code, card_name '
    + ' from ref$credit_card '
    + ' where card_unt_id = ' + IntToStr(AUnitID)
    + ' and CARD_IS_ACTIVE = 1' // BP Was Here
    + sFilterCC
    + ' order by card_code';

  {
  with cOpenQuery(sSQL) do
  begin
    try
      while not eof do
      begin
        with sgLookup do
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
    DataController.Values[_KolKode, 0] := 'Kode';
    DataController.Values[_KolNama, 0] := 'Nama Kartu';
    Columns[_KolKode].Width := 50;
    Columns[_KolNama].Width := 160;
  end;
end;

procedure TfraLookUpCC.edNamaChange(Sender: TObject);
begin
  with cxGridView.DataController do
  begin
    Filter.Clear;
    Filter.Active := False;
    with Filter do
    begin
//      CaseSensitive := False;
//      Condition := ';*' + edNama.Text + '*';
//      Column := _KolNama;
    end;
    Filter.Active := True;
  end;
end;

procedure TfraLookUpCC.edNamaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key in [VK_UP,VK_DOWN,33,34]) then
  begin
    cxGrid.SetFocus;
    if cxGridView.DataController.RowCount <= 1 then exit;
  end;
end;

end.
