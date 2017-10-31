unit ufraMember;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ExtCtrls, Menus, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  cxProgressBar;

type
  TfraMember = class(TFrame)
    cxcolAktif: TcxGridColumn;
    cxcolAlamat: TcxGridColumn;
    cxcolKode: TcxGridColumn;
    cxcolNama: TcxGridColumn;
    cxcolValid: TcxGridColumn;
    cxGrid: TcxGrid;
    edNama: TEdit;
    grdlvlLookupMember: TcxGridLevel;
    Label1: TLabel;
    pbLookup: TcxProgressBar;
    pnlHeader: TPanel;
    rbDepan: TRadioButton;
    rbSemua: TRadioButton;
    sgLookup: TcxGridTableView;
    procedure edNamaChange(Sender: TObject);
    procedure edNamaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgLookupDblClick(Sender: TObject);
    procedure sgLookupKeyDown(Sender: TObject; var Key: Word; Shift:
        TShiftState);
  private
    FIsProcessing: Boolean;
    FIsStop: Boolean;
    FUnitID: string;
  public
    procedure LoadData(ANama: String = ''; AIsDepan: Boolean = True);
    property IsProcessing: Boolean read FIsProcessing write FIsProcessing;
    property IsStop: Boolean read FIsStop write FIsStop;
    property UnitID: string read FUnitID write FUnitID;
  end;

implementation

uses
  StrUtils, Math, ufrmTransaksi, udmMain, uDXUtils;

const
  _KolKode: Integer = 0;
  _KolNama: Integer = 1;
  _KolAlamat: Integer = 2;
  _KolIsAktif: Integer = 3;
  _KolIsValid: Integer = 4;

{$R *.dfm}

procedure TfraMember.edNamaChange(Sender: TObject);
begin
{
  with sgLookup.DataController do
  begin
    Filter.Clear;
    Filter.Active := False;
    Filter.Options := [];
    Filter.PercentWildcard := '*';
    Filter.FilterText := ';*' + edNama.Text + '*';
    Filter.SupportedLike := True;
    KeyFieldNames := sgLookup.Columns[_KolNama].Caption;
    Filter.Active := True;
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
    if sgLookup.DataController.RowCount > 0 then
      sgLookup.Controller.FocusedRowIndex := 0;
//    if sgLookup.DataController.RowCount <= 1 then exit;
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
  sSQL := 'select member_card_no Kode, '
        + ' member_name Nama, '
        + ' member_address Alamat, '
        + ' member_is_valid Aktif, '
        + ' member_is_active Valid '
        + ' from member ';
//        + ' where member_unt_id = ' + IntToStr(UnitID);

  if Trim(ANama) <> '' then
  begin
    if AIsDepan then
      sSQL := sSQL + ' where upper(member_name) like ''' + UpperCase(ANama) + '%'' '
    else
      sSQL := sSQL + ' where upper(member_name) like ''%' + UpperCase(ANama) + '%'' ';
  end;
  sSQL := sSQL + ' order by member_name';

  iRecordCOunt := 0;

  sgLookup.DataController.Filter.Active := False;
  sgLookup.DataController.Filter.Clear;
//    sgLookup.DataController.ClearDetails;
//    RowCount := 2;
  sgLookup.ClearRows;

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
        sgLookup.DataController.AppendRecord;
        sgLookup.DataController.Values[sgLookup.DataController.RowCount-1,_KolKode]    := Fields[0].AsString;
        sgLookup.DataController.Values[sgLookup.DataController.RowCount-1,_KolNama]    := Fields[1].AsString;
        sgLookup.DataController.Values[sgLookup.DataController.RowCount-1,_KolAlamat]  := Fields[2].AsString;
        sgLookup.DataController.Values[sgLookup.DataController.RowCount-1,_KolIsAktif] := IfThen(Fields[4].AsInteger = 1,'Ya','Tidak');
        sgLookup.DataController.Values[sgLookup.DataController.RowCount-1,_KolIsValid] := IfThen(Fields[3].AsInteger = 1,'Ya','Tidak');

//          if Fields[3].AsInteger = 0 then
//            RowColor[RowCount-1] := clYellow;

//          if Fields[4].AsInteger = 0 then
//            RowColor[RowCount-1] := clRed;

//        AutoSize := True;
        pbLookup.Position := Floor(((sgLookup.DataController.RowCount-1)/iRecordCOunt)*100);
        Application.ProcessMessages;
        if IsStop then
        begin
          pbLookup.Position := 100;
          Break;
        end;
        Next;
      end;
      sgLookup.ApplyBestFit();
    finally
      Free;
      pbLookup.Visible := False;
      IsProcessing := False;
    end;
  end;

end;

procedure TfraMember.sgLookupDblClick(Sender: TObject);
begin
//	if sgLookup.DataController.RecNo = 0 then Exit;
//  if pbLookup.Position < 100 then Exit;

  Self.Visible := False;
  with (Self.Parent as TfrmTransaksi) do
  begin
    cxTransaksi.Visible := True;
    pnlFooter.Visible := True;
    edNoPelanggan.Text := sgLookup.DataController.Values[sgLookup.DataController.FocusedRowIndex, _KolKode];
    edNoPelangganExit(edNoPelanggan);
    FocusToPLUEdit;
  end;    // with
end;

procedure TfraMember.sgLookupKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  IsStop := False;
  if ((Key = VK_UP) or (Key = 33)) and (sgLookup.DataController.FocusedRowIndex = 0) then
  begin
    edNama.SetFocus;
    edNama.SelectAll;
    Exit;
  end
  else
  if ((Key = VK_DOWN) or (Key = 34)) and (sgLookup.DataController.FocusedRowIndex = (sgLookup.DataController.RowCount-1)) then
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
