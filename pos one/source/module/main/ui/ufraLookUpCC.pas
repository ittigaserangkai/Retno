unit ufraLookUpCC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Grids, BaseGrid, AdvGrid, AdvCGrid, StdCtrls, ExtCtrls;

type
  TfraLookUpCC = class(TFrame)
    pnlHeader: TPanel;
    Label1: TLabel;
    edNama: TEdit;
    sgLookup: TAdvColumnGrid;
    Panel1: TPanel;
    procedure sgLookupCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure edNamaChange(Sender: TObject);
    procedure edNamaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgLookupKeyDown(Sender: TObject; var Key: Word;
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

uses
  uRMSUnit;

const
  _KolKode: Integer = 0;
  _KolNama: Integer = 1;
  _ColCount: Integer = 2;

{$R *.dfm}

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
end;

procedure TfraLookUpCC.SetGrid;
begin
  with sgLookup do
  begin
    cClearGrid(sgLookup,True);
    ColCount := _ColCount;
    RowCount := 2;

    SetGridColumn;
  end;    // with
end;

procedure TfraLookUpCC.SetGridColumn;
begin
  with sgLookup do
  begin
    Columns[_KolKode].Rows[0] := 'Kode';
    Columns[_KolNama].Rows[0] := 'Nama Kartu';

    ColWidths[_KolKode] := 50;
    ColWidths[_KolNama] := 160;
  end;
end;

procedure TfraLookUpCC.sgLookupCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := False;
end;

procedure TfraLookUpCC.edNamaChange(Sender: TObject);
begin
  with sgLookup do
  begin
    Filter.Clear;
    FilterActive := False;
    with Filter.Add do
    begin
      CaseSensitive := False;
      Condition := ';*' + edNama.Text + '*';
      Column := _KolNama;
    end;
    FilterActive := True;
  end;
end;

procedure TfraLookUpCC.edNamaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key in [VK_UP,VK_DOWN,33,34]) then
  begin
    sgLookup.SetFocus;
    if sgLookup.RowCount <= 1 then exit;
  end;
end;

procedure TfraLookUpCC.sgLookupKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CC_Code := sgLookup.Columns[_KolKode].Rows[sgLookup.Row];
  if ((Key = VK_UP) or (Key = 33)) and (sgLookup.Row = 1) then
  begin
    edNama.SetFocus;
    edNama.SelectAll;
    Exit;
  end
  else
  if ((Key = VK_DOWN) or (Key = 34)) and (sgLookup.Row = (sgLookup.RowCount-1)) then
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

end.
