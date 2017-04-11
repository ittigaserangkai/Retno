unit ufraMember;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ExtCtrls, Menus, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, cxProgressBar;

type
  TfraMember = class(TFrame)
    pbLookup: TcxProgressBar;
    pnlHeader: TPanel;
    Label1: TLabel;
    edNama: TEdit;
    pmLookup: TPopupMenu;
    ExporttoCSV1: TMenuItem;
    dlgSaveLookup: TSaveDialog;
    rbDepan: TRadioButton;
    rbSemua: TRadioButton;
    cxGrid: TcxGrid;
    sgLookup: TcxGridDBTableView;
    grdlvlLookupMember: TcxGridLevel;
    cxcolKode: TcxGridDBColumn;
    cxcolNama: TcxGridDBColumn;
    cxcolAlamat: TcxGridDBColumn;
    cxcolAktif: TcxGridDBColumn;
    cxcolValid: TcxGridDBColumn;
    procedure edNamaChange(Sender: TObject);
    procedure edNamaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ExporttoCSV1Click(Sender: TObject);
    procedure sgLookupDblClick(Sender: TObject);
    procedure sgLookupKeyDown(Sender: TObject; var Key: Word; Shift:
        TShiftState);
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
  uRetnoUnit, StrUtils, Math, ufrmTransaksi;

const
  _KolKode: Integer = 0;
  _KolNama: Integer = 1;
  _KolAlamat: Integer = 2;
  _KolIsAktif: Integer = 3;
  _KolIsValid: Integer = 4;


{$R *.dfm}

procedure TfraMember.edNamaChange(Sender: TObject);
begin
  {with sgLookup do
  begin
    Filtering.Clear;
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

procedure TfraMember.edNamaKeyDown(Sender: TObject; var Key: Word;
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
    if sgLookup.DataController.RowCount <= 1 then exit;
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

procedure TfraMember.LoadData(ANama: String = ''; AIsDepan: Boolean = True);
var
  iRecordCOunt: Integer;
  sSQL: string;
begin
  IsProcessing := True;
  sSQL := 'select member_card_no, member_name, member_address, '
    + 'member_is_valid, member_is_active '
    + 'from member '
    + 'where member_unt_id = ' + IntToStr(UnitID);

  if Trim(ANama) <> '' then
    if AIsDepan then
      sSQL := sSQL + ' and upper(member_name) like ''' + UpperCase(ANama) + '%'' '
    else
      sSQL := sSQL + ' and upper(member_name) like ''%' + UpperCase(ANama) + '%'' ';
  sSQL := sSQL + ' order by member_name';
  
  iRecordCOunt := 0;
  {
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
          Cells[_KolKode,RowCount-1] := Fields[0].AsString;
          Cells[_KolNama,RowCount-1] := Fields[1].AsString;
          Cells[_KolAlamat,RowCount-1] := Fields[2].AsString;
          Cells[_KolIsAktif,RowCount-1] := IfThen(Fields[4].AsInteger = 1,'Ya','Tidak');
          Cells[_KolIsValid,RowCount-1] := IfThen(Fields[3].AsInteger = 1,'Ya','Tidak');

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

procedure TfraMember.ExporttoCSV1Click(Sender: TObject);
begin
  if dlgSaveLookup.Execute then
  begin
//    sgLookup.SaveToCSV(dlgSaveLookup.FileName);
    ShowMessage('Berhasil export ke:' + dlgSaveLookup.FileName);
  end;  
end;

procedure TfraMember.sgLookupDblClick(Sender: TObject);
begin
	if sgLookup.DataController.RecNo = 0 then Exit;
  if pbLookup.Position < 100 then Exit;

  Self.Visible := False;
  with (Self.Parent as TfrmTransaksi) do
  begin
    cxTransaksi.Visible := True;
	  pnlFooter.Visible := True;
    edNoPelanggan.Text := sgLookup.DataController.Values[0,sgLookup.DataController.RecNo];
    edNoPelangganExit(edNoPelanggan);
    FocusToPLUEdit;
  end;    // with
end;

procedure TfraMember.sgLookupKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  IsStop := False;
  if ((Key = VK_UP) or (Key = 33)) and (sgLookup.DataController.RecNo = 1) then
  begin
    edNama.SetFocus;
    edNama.SelectAll;
    Exit;
  end
  else
  if ((Key = VK_DOWN) or (Key = 34)) and (sgLookup.DataController.RecNo = (sgLookup.DataController.RowCount-1)) then
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
    with (Self.Parent as TfrmTransaksi) do
    begin
      cxTransaksi.Visible := True;
      pnlFooter.Visible := True;
      edNoPelanggan.SetFocus;
      edNoPelanggan.SelectAll;
    end;
  end
	else if Key = VK_RETURN then
  begin
    IsStop := True;
    sgLookupDblClick(sgLookup);
  end
	else if Key in [VK_MULTIPLY,Ord('*')] then
  begin
    //IsStop := True;
  end;

end;

end.
