unit ufraDOKring;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Menus, StdCtrls, ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  Data.DB, cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxContainer, cxProgressBar;

type
  TfraDOKring = class(TFrame)
    pnlHeader: TPanel;
    Label1: TLabel;
    edNama: TEdit;
    rbDepan: TRadioButton;
    rbSemua: TRadioButton;
    pmLookup: TPopupMenu;
    ExporttoCSV1: TMenuItem;
    dlgSaveLookup: TSaveDialog;
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    cxlvMaster: TcxGridLevel;
    cxcolNomorDO: TcxGridDBColumn;
    cxcolNomorPO: TcxGridDBColumn;
    cxcolStatus: TcxGridDBColumn;
    cxcolNamaTrader: TcxGridDBColumn;
    pbLookup: TcxProgressBar;
    procedure cxGridViewDblClick(Sender: TObject);
    procedure ExporttoCSV1Click(Sender: TObject);
    procedure edNamaChange(Sender: TObject);
    procedure edNamaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgLookupKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FIsProcessing: Boolean;
    FIsStop: Boolean;
    FUnitID: Integer;
    { Private declarations }
  public
    procedure LoadData(ANama: String = ''; AIsDepan: Boolean = True);
    property IsProcessing: Boolean read FIsProcessing write FIsProcessing;
    property IsStop: Boolean read FIsStop write FIsStop;
    property UnitID: Integer read FUnitID write FUnitID;
    { Public declarations }
  end;

implementation

uses
  Math, ufrmTransaksiKring;

const
  _KolNomorDO: Integer = 0;
  _KolNomorPO: Integer = 1;
  _KolStatus: Integer = 2;
  _KolNamaTrader: Integer = 3;

{$R *.dfm}

procedure TfraDOKring.cxGridViewDblClick(Sender: TObject);
var
  lKey: Word;
begin
	if cxGridView.DataController.RecNo = 0 then Exit;
  if pbLookup.Position < 100 then Exit;

  Self.Visible := False;
  with (Self.Parent as TfrmTransaksiKring) do
  begin
    cxTransaksi.Visible := True;
	  pnlFooter.Visible := True;
    edNomorDO.Text := cxGridView.DataController.Values[0,cxGridView.DataController.RecNo];
    lKey := VK_RETURN;
    edNomorDOKeyDown(Sender,lKey,[]);
  end;    // with

end;

procedure TfraDOKring.ExporttoCSV1Click(Sender: TObject);
begin
  if dlgSaveLookup.Execute then
  begin
//    sgLookup.SaveToCSV(dlgSaveLookup.FileName);
    ShowMessage('Berhasil export ke:' + dlgSaveLookup.FileName);
  end;
end;

procedure TfraDOKring.LoadData(ANama: String = ''; AIsDepan: Boolean = True);
var
  iRecordCOunt: Integer;
  sSQL: string;
begin
  IsProcessing := True;
  sSQL := 'select a.doas_no, a.doas_poas_no, a.doas_status, b.trd_code, b.trd_name, b.trd_address '
    + 'from do_assgros a '
    + 'inner join trader b on a.doas_trd_id = b.trd_id and a.doas_trd_unt_id = b.trd_unt_id '
    + 'where a.doas_unt_id = ' + IntToStr(UnitID);

  if Trim(ANama) <> '' then
    if AIsDepan then
      sSQL := sSQL + ' and upper(b.trd_name) like ''' + UpperCase(ANama) + '%'' '
    else
      sSQL := sSQL + ' and upper(b.trd_name) like ''%' + UpperCase(ANama) + '%'' ';
  sSQL := sSQL + ' order by b.trd_name';
  {
  iRecordCOunt := 0;

  with sgLookup do
  begin
    FilterActive := False;
    ClearRows(1,RowCount-1);
    RowCount := 2;
    with cOpenQuery(sSQL) do
    begin
      try
        if not Eof then
        begin
          Last;
          iRecordCOunt := RecordCount;
          pbLookup.Visible := True;
          First; 
        end;
        
        while not eof do
        begin
          Cells[_KolNomorDO,RowCount-1] := Fields[0].AsString;
          Cells[_KolNomorPO,RowCount-1] := Fields[1].AsString;
          Cells[_KolStatus,RowCount-1] := Fields[2].AsString;
          Cells[_KolNamaTrader,RowCount-1] := Fields[3].AsString;

          if Fields[3].AsInteger = 0 then
            RowColor[RowCount-1] := clYellow;

          if Fields[4].AsInteger = 0 then
            RowColor[RowCount-1] := clRed;

          AutoSize := True;
          pbLookup.Position := Floor(((RowCount-1)/iRecordCOunt)*100);
          RowCount := RowCount + 1;
          Application.ProcessMessages;
          if IsStop then
          begin
            pbLookup.Position := 100;
            Break;
          end;
          Next;
        end;
      finally
        Free;
        pbLookup.Visible := False;
        IsProcessing := False;
      end;
    end;
  end;
  }
end;

procedure TfraDOKring.edNamaChange(Sender: TObject);
begin
  {
  with sgLookup do
  begin
    Filter.Clear;
    FilterActive := False;
    with Filter.Add do
    begin
      CaseSensitive := False;
      Condition := ';*' + edNama.Text + '*';
      Column := 1;
    end;
    FilterActive := True;
  end;
  }
end;

procedure TfraDOKring.edNamaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if (key in [VK_ESCAPE]) then
  begin
    sgLookupKeyDown(Sender,Key,Shift);
  end
  else if (key in [VK_RETURN]) then
  begin
    IsStop := False;
    if IsProcessing then
      IsStop := True
    else
      LoadData(Trim(edNama.Text),rbDepan.Checked);
  end
  else if (key in [VK_UP,VK_DOWN,33,34]) then
  begin
    cxGrid.SetFocus;
    if cxGridView.DataController.RowCount <= 1 then exit;
  end
  else if (key in [VK_F2]) then
  begin
    rbDepan.Checked := True;
  end
  else if (key in [VK_F3]) then
  begin
    rbSemua.Checked := True;
  end;
end;

procedure TfraDOKring.sgLookupKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IsStop := False;
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
  end
  else if Key in [VK_ESCAPE] then
  begin
    Self.Visible := False;
    with (Self.Parent as TfrmTransaksiKring) do
    begin
      cxTransaksi.Visible := True;
      pnlFooter.Visible := True;
      edNomorDO.SetFocus;
      edNomorDO.SelectAll;
    end;
  end
	else if Key = VK_RETURN then
  begin
    IsStop := True;
    cxGridViewDblClick(Sender);
  end  
	else if Key in [VK_MULTIPLY,Ord('*')] then
  begin
    //IsStop := True;
  end;
end;

end.
