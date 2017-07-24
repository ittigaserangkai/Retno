unit ufraLookupBarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Menus, cxGraphics, Vcl.ExtCtrls,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxContainer, cxProgressBar, cxTextEdit;

type
  TfraLookupBarang = class(TFrame)
    pnlHeader: TPanel;
    edNamaBarang: TEdit;
    lblNamaBarang: TLabel;
    pmLookup: TPopupMenu;
    rbDepan: TRadioButton;
    rbSemua: TRadioButton;
    pnlInfo: TPanel;
    lblInfo: TLabel;
    tmrInfo: TTimer;
    cxGrid: TcxGrid;
    grdlvlLookupMember: TcxGridLevel;
    pbBarang: TcxProgressBar;
    sgBarang: TcxGridTableView;
    sgBarangColumn1: TcxGridColumn;
    sgBarangColumn2: TcxGridColumn;
    sgBarangColumn3: TcxGridColumn;
    sgBarangColumn4: TcxGridColumn;
    sgBarangColumn5: TcxGridColumn;
    sgBarangColumn6: TcxGridColumn;
    procedure edNamaBarangKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edNamaBarangChange(Sender: TObject);
    procedure sgBarangDblClick(Sender: TObject);
    procedure sgBarangKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sgBarangTopRecordIndexChanged(Sender: TObject);
    procedure tmrInfoTimer(Sender: TObject);
  private
    FIsStop: Boolean;
    FIsProcessing: Boolean;
		FPLU: string;
    FUOM: string;
    FUnitID: Integer;
    { Private declarations }
  public
    procedure HideInfo;
    procedure LoadBarang(ANamaBarang: String = ''; AIsDepan: Boolean = True);
    procedure LoadBarangByPLU(aPLU: String = '');
    procedure SetPanelHeaderEnable(aIsEnable: Boolean);
    procedure ShowInfo(AInfo: String);
    property IsStop: Boolean read FIsStop write FIsStop;
    property IsProcessing: Boolean read FIsProcessing write FIsProcessing;
		property PLU: string read FPLU write FPLU;
    property UOM: string read FUOM write FUOM;
    property UnitID: Integer read FUnitID write FUnitID;
    { Public declarations }
  end;

implementation

uses
  Math, ufrmTransaksi, udmMain, uDXUtils;

const
  _KolPLU         : Integer = 0;
  _KolSatuan      : Integer = 1;
  _KolNamaBarang  : Integer = 2;
  _KolHargaDasar  : Integer = 3;
  _KolDiskon      : Integer = 4;
  _KolHargaBersih : Integer = 5;

{$R *.dfm}

procedure TfraLookupBarang.LoadBarang(ANamaBarang: String = ''; AIsDepan:
    Boolean = True);
var
	iRecordCOunt: Integer;
	sSQL: string;
begin
  IsProcessing          := True;
  SetPanelHeaderEnable(True);
  (*TODO: extracted code
  lblNamaBarang.Enabled := True;
  *)

  sSQL := 'select distinct a.brg_code, b.BHJ_SAT_CODE, a.brg_name, '
        + ' b.BHJ_SELL_PRICE, b.BHJ_DISC_NOMINAL, b.BHJ_SELL_PRICE_DISC '
        + 'from barang a '
        + 'inner join barang_harga_jual b on a.brg_code = b.bhj_brg_code '
// Sementara di non aktifkan
//        + ' and a.brg_is_active = 1 '
        + ' and a.brg_is_validate = 1';
  if Trim(ANamaBarang) <> '' then
    if AIsDepan then
    	sSQL := sSQL + ' and upper(a.brg_name) like ''' + UpperCase(ANamaBarang) + '%'' '
    else
      sSQL := sSQL + ' and upper(a.brg_name) like ''%' + UpperCase(ANamaBarang) + '%'' ';
  sSQL := sSQL + ' order by a.brg_name';

  iRecordCOunt := 0;

  sgBarang.DataController.Filter.Active := False;
  sgBarang.DataController.Filter.Clear;
//    sgBarang.DataController.ClearDetails;
//    RowCount := 2;
  sgBarang.ClearRows;
  with cOpenQuery(sSQL) do
  begin
    try
      if not Eof then
      begin
        Last;
        iRecordCOunt := RecordCount;
        pbBarang.Visible := True;
        First;
      end;

      while not eof do
      begin
        sgBarang.DataController.AppendRecord;
        sgBarang.DataController.Values[sgBarang.DataController.RowCount-1,_KolPLU]        := FieldByName('brg_code').AsString;
        sgBarang.DataController.Values[sgBarang.DataController.RowCount-1,_KolSatuan]     := FieldByName('BHJ_SAT_CODE').AsString;
        sgBarang.DataController.Values[sgBarang.DataController.RowCount-1,_KolNamaBarang] := FieldByName('brg_name').AsString;
        sgBarang.DataController.Values[sgBarang.DataController.RowCount-1,_KolHargaDasar] := FieldByName('BHJ_SELL_PRICE').AsFloat;
        sgBarang.DataController.Values[sgBarang.DataController.RowCount-1,_KolDiskon]     := FieldByName('BHJ_DISC_NOMINAL').AsFloat;
        sgBarang.DataController.Values[sgBarang.DataController.RowCount-1,_KolHargaBersih]:= FieldByName('BHJ_SELL_PRICE_DISC').AsFloat;

//			    AutoSize          := True;
        pbBarang.Position := Floor(((sgBarang.DataController.RowCount-1)/iRecordCOunt)*100);
        if IsStop then
        begin
          pbBarang.Position := 100;
          IsStop := False;
          Break;
        end;
        Application.ProcessMessages;
        Next;
      end;
      sgBarang.ApplyBestFit();
    finally
      Free;
      pbBarang.Visible := False;
      IsProcessing := False;
    end;
  end;

end;

procedure TfraLookupBarang.edNamaBarangKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  HideInfo;
	if (key in [VK_ESCAPE]) then
  begin
    sgBarangKeyDown(Sender,Key,Shift);
  end
  else if (key in [VK_RETURN]) then
  begin
    if edNamaBarang.Text = '' then
    begin
      if Assigned(frmTransaksi) then
      begin
        Self.ShowInfo('Harap Ketikkan Terlebih dahulu minimal 1 Huruf pada Nama Barang utk melakukan pencarian !!');
      end;
      exit;
    end;                                                                                                                    
    IsStop := False;
    if IsProcessing then
      IsStop := True
    else
      LoadBarang(Trim(edNamaBarang.Text),rbDepan.Checked);
  end
  else if (key in [VK_UP,VK_DOWN,33,34]) then
  begin
    sgBarang.Controller.FocusedColumnIndex := _KolNamaBarang;
    cxGrid.SetFocus;
    if sgBarang.DataController.RowCount <= 1 then exit;
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

procedure TfraLookupBarang.edNamaBarangChange(Sender: TObject);
begin
  {with sgBarang do
  begin
    Filter.Clear;
    FilterActive := False;
    with Filter.Add do
    begin
      CaseSensitive := False;
      Condition := ';*' + edNamaBarang.Text + '*';
      Column := 2;
    end;
    FilterActive := True;
  end;
  }
end;

procedure TfraLookupBarang.HideInfo;
begin
  if pnlInfo.Visible then
  begin
    lblInfo.Caption := '';
    tmrInfo.Enabled := False;
    pnlInfo.Visible := False;
  end;
end;

procedure TfraLookupBarang.LoadBarangByPLU(aPLU: String = '');
var
  iRecordCOunt: Integer;
  sSQL: string;
begin
  IsProcessing          := True;
  SetPanelHeaderEnable(False);
  sSQL := 'select distinct a.brg_code, b.BHJ_SAT_CODE, a.brg_alias '
        + ' b.BHJ_SELL_PRICE, b.BHJ_DISC_NOMINAL, b.BHJ_SELL_PRICE_DISC '
        + 'from barang a '
        + 'inner join barang_harga_jual b on a.brg_code = b.bhj_brg_code '
//      + ' and a.brg_is_active = 1 '
        + ' and a.brg_is_validate = 1';
  if Trim(aPLU) <> '' then
      sSQL := sSQL + 'and (a.brg_code) like ' + QuotedStr(aPLU);
  sSQL := sSQL + ' order by a.brg_alias';
  
  iRecordCOunt := 0;
  {
  with sgBarang do
  begin
    FilterActive := False;
    Filter.Clear;

    ClearRows(1,RowCount-1);
    RowCount := 2;
    with cOpenQuery(sSQL) do
    begin
      try
        if not Eof then
        begin
          Last;
          iRecordCOunt := RecordCount;
          pbBarang.Visible := True;
          First;
        end;

        while not eof do
        begin
          Cells[_KolPLU,RowCount-1]          := FieldByName('brg_code').AsString;
        	Cells[_KolSatuan,RowCount-1]       := FieldByName('BHJ_SAT_CODE').AsString;
        	Cells[_KolNamaBarang,RowCount-1]   := FieldByName('brg_name').AsString;
          Floats[_KolHargaDasar,RowCount-1]  := FieldByName('BHJ_SELL_PRICE').AsFloat;
          Floats[_KolDiskon,RowCount-1]      := FieldByName('BHJ_DISC_NOMINAL').AsFloat;
          Floats[_KolHargaBersih,RowCount-1] := FieldByName('BHJ_SELL_PRICE_DISC').AsFloat;

          AutoSize          := True;
          pbBarang.Position := Floor(((RowCount-1)/iRecordCOunt)*100);
          if IsStop then
          begin
            pbBarang.Position := 100;
            IsStop := False;
            Break;
          end;
          Application.ProcessMessages;
          Next;
          if not Eof then
             AddRow;
        end;
      finally
        Free;
        pbBarang.Visible  := False;
        IsProcessing      := False;
      end;
    end;
  end;
  }
end;

procedure TfraLookupBarang.SetPanelHeaderEnable(aIsEnable: Boolean);
begin
  lblNamaBarang.Enabled   := aIsEnable;
  edNamaBarang.Enabled    := aIsEnable;
  rbDepan.Enabled         := aIsEnable;
  rbSemua.Enabled         := aIsEnable;
end;

procedure TfraLookupBarang.sgBarangDblClick(Sender: TObject);
begin
  PLU := '';
  UOM := '';
	if sgBarang.Controller.FocusedRowIndex = 0 then Exit;
//  if pbBarang.Position < 100 then Exit;

  PLU          := sgBarang.DataController.Values[sgBarang.Controller.FocusedRowIndex, _KolPLU];
  UOM          := sgBarang.DataController.Values[sgBarang.Controller.FocusedRowIndex, _KolSatuan];
  Self.Visible := False;

  with (Self.Parent as TfrmTransaksi) do
  begin
    cxTransaksi.Visible := True;
	  pnlFooter.Visible   := True;
    edPLU.Text          := Copy(edPLU.Text, 1, Pos('*', edPLU.Text)) + PLU;
    LoadByPLU(edPLU.Text, UOM, True);
  end;    // with
  SetPanelHeaderEnable(True);

end;

procedure TfraLookupBarang.sgBarangKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  if ((Key = VK_UP) or (Key = 33)) and (sgBarang.Controller.FocusedRowIndex = 1) and edNamaBarang.Enabled then
  begin
    edNamaBarang.SetFocus;
    edNamaBarang.SelectAll;
    Exit;
  end
  else
  if ((Key = VK_UP) or (Key = 33)) and (sgBarang.Controller.FocusedRowIndex = 1) then
  begin
    frmTransaksi.cxTransaksi.SetFocus;
    Exit;
  end
  else
  if ((Key = VK_DOWN) or (Key = 34)) and (sgBarang.Controller.FocusedRowIndex = (sgBarang.DataController.RowCount-1))
  and edNamaBarang.Enabled then
  begin
    edNamaBarang.SetFocus;
    edNamaBarang.SelectAll;
    Exit;
  end
  else
  if (Key = VK_F5) and edNamaBarang.Enabled then
  begin
    edNamaBarang.SetFocus;
    edNamaBarang.SelectAll;
  end
  else if (Key in [VK_ESCAPE])  then
  begin
    PLU := '';
    UOM := '';
    Self.Visible := False;
    with (Self.Parent as TfrmTransaksi) do
    begin
      cxTransaksi.Visible := True;
      pnlFooter.Visible := True;
      edPLU.SetFocus;
      edPLU.SelectAll;
    end;
  end
	else if Key = VK_RETURN then
  begin
    IsStop := True;
    sgBarangDblClick(sgBarang);
  end
	else if Key in [VK_MULTIPLY,Ord('*')] then
  begin
    //IsStop := True;
  end;

end;

procedure TfraLookupBarang.sgBarangTopRecordIndexChanged(Sender: TObject);
//var
//  i: Integer;
begin
{
  with sgBarang do
  begin
    for i := 0 to ColCount - 1 do    // Iterate
    begin
      CellProperties[i,OldRow].FontSize := 8;
      CellProperties[i,OldRow].FontColor := clBlack;
      RepaintRow(OldRow);

      CellProperties[i,NewRow].FontSize := 10;
      CellProperties[i,NewRow].FontColor := clRed;
      RepaintRow(NewRow);
    end;    // for
  end;
}
end;

procedure TfraLookupBarang.ShowInfo(AInfo: String);
begin
  Self.lblInfo.Caption := AInfo;
  Self.tmrInfo.Enabled := True;
  Self.pnlInfo.Visible := True;
end;

procedure TfraLookupBarang.tmrInfoTimer(Sender: TObject);
begin
  Self.lblInfo.Visible := not Self.lblInfo.Visible;
end;

end.
