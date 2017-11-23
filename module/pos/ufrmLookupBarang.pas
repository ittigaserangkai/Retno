unit ufrmLookupBarang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Types, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxTextEdit, cxCurrencyEdit, cxContainer,
  Vcl.ExtCtrls, Vcl.Menus, cxProgressBar, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.StdCtrls,
  Datasnap.DBClient, Data.DB, cxDBData, cxGridDBTableView, uDBUtils;

type
  TfrmLookupBarang = class(TForm)
    pnlHeader: TPanel;
    lblNamaBarang: TLabel;
    edNamaBarang: TEdit;
    rbDepan: TRadioButton;
    rbSemua: TRadioButton;
    pnlInfo: TPanel;
    lblInfo: TLabel;
    cxGrid: TcxGrid;
    sgBarang: TcxGridTableView;
    sgBarangColumn1: TcxGridColumn;
    sgBarangColumn2: TcxGridColumn;
    sgBarangColumn3: TcxGridColumn;
    sgBarangColumn4: TcxGridColumn;
    sgBarangColumn5: TcxGridColumn;
    sgBarangColumn6: TcxGridColumn;
    sgBarangColumn7: TcxGridColumn;
    grdLvlBarang: TcxGridLevel;
    pbBarang: TcxProgressBar;
    tmrInfo: TTimer;
    cxGrdBarang: TcxGridDBTableView;
    cxGrdBarangColumn1: TcxGridDBColumn;
    cxGrdBarangColumn2: TcxGridDBColumn;
    cxGrdBarangColumn3: TcxGridDBColumn;
    cxGrdBarangColumn4: TcxGridDBColumn;
    cxGrdBarangColumn5: TcxGridDBColumn;
    cxGrdBarangColumn6: TcxGridDBColumn;
    cxGrdBarangColumn7: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    procedure cxGrdBarangDblClick(Sender: TObject);
    procedure cxGrdBarangKeyDown(Sender: TObject; var Key: Word; Shift:
        TShiftState);
    procedure edNamaBarangChange(Sender: TObject);
    procedure edNamaBarangKeyDown(Sender: TObject; var Key: Word; Shift:
        TShiftState);
    procedure FormShow(Sender: TObject);
    procedure tmrInfoTimer(Sender: TObject);
  private
    FBarangHargaJualID: string;
    FCDS: TClientDataSet;
    FIsProcessing: Boolean;
    FIsStop: Boolean;
    FPLU: string;
    FUnitID: string;
    FUOM: string;
    FUOMID: string;
    property CDS: TClientDataSet read FCDS write FCDS;
    { Private declarations }
  public
    procedure HideInfo;
    procedure LoadBarang(ANamaBarang: String = ''; AIsDepan: Boolean = True);
    procedure SetPanelHeaderEnable(aIsEnable: Boolean);
    procedure ShowInfo(AInfo: String);
    class function CreateAt(aContainer: TWinControl; aPLU: String = ''):
        TfrmLookupBarang;
    procedure LoadData;
    procedure SelectItem;
    property BarangHargaJualID: string read FBarangHargaJualID write
        FBarangHargaJualID;
    property IsProcessing: Boolean read FIsProcessing write FIsProcessing;
    property IsStop: Boolean read FIsStop write FIsStop;
    property PLU: string read FPLU write FPLU;
    property UnitID: string read FUnitID write FUnitID;
    property UOM: string read FUOM write FUOM;
    property UOMID: string read FUOMID write FUOMID;
    { Public declarations }
  end;

var
  frmLookupBarang: TfrmLookupBarang;


implementation

uses
  Math, ufrmTransaksi, udmMain, uDXUtils, ufrmMain, uDMClient;

const
  _KolPLU         : Integer = 0;
  _KolSatuan      : Integer = 1;
  _KolNamaBarang  : Integer = 2;
  _KolHargaDasar  : Integer = 3;
  _KolDiskon      : Integer = 4;
  _KolHargaBersih : Integer = 5;
  _KolIsActive    : Integer = 6;

{$R *.dfm}

procedure TfrmLookupBarang.edNamaBarangChange(Sender: TObject);
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

procedure TfrmLookupBarang.edNamaBarangKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  HideInfo;
  if (key in [VK_ESCAPE]) then
  begin
    cxGrdBarangKeyDown(Sender, Key, Shift);
//    sgBarangKeyDown(Sender,Key,Shift);
  end
  else if (key in [VK_RETURN]) then
    LoadData()
  else if (key in [VK_UP,VK_DOWN,33,34]) then
  begin
    cxGrid.SetFocus;
//    sgBarang.Controller.FocusedColumnIndex := _KolNamaBarang;
//    if sgBarang.DataController.RowCount > 0 then
//      sgBarang.Controller.FocusedRowIndex := 0;
//    if sgBarang.DataController.RowCount <= 1 then exit;
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

procedure TfrmLookupBarang.FormShow(Sender: TObject);
begin
  Self.SetFocus;
  Self.SetPanelHeaderEnable(True);
  Self.edNamaBarang.SetFocus;
  Self.edNamaBarang.SelectAll;
end;

procedure TfrmLookupBarang.HideInfo;
begin
  if pnlInfo.Visible then
  begin
    lblInfo.Caption := '';
    tmrInfo.Enabled := False;
    pnlInfo.Visible := False;
  end;
end;

procedure TfrmLookupBarang.LoadBarang(ANamaBarang: String = ''; AIsDepan:
    Boolean = True);
var
//  iRecordCOunt: Integer;
  sFilter: string;
begin
  IsProcessing := True;
  try
    sFilter := ANamaBarang + '%';
    if not AIsDepan then sFilter := '%' + sFilter;
    if Assigned(FCDS) then FreeAndNil(FCDS);
    FCDS := TDBUtils.DSToCDS(DMClient.POSClient.LookupBarang(sFilter), Self);
    cxGrdBarang.LoadFromCDS(FCDS);
    cxGrdBarang.SetVisibleColumns(['REF$SATUAN_ID'], false);
  finally
    IsProcessing := False;
  end;
  SetPanelHeaderEnable(True);

end;

procedure TfrmLookupBarang.SetPanelHeaderEnable(aIsEnable: Boolean);
begin
  lblNamaBarang.Enabled   := aIsEnable;
  edNamaBarang.Enabled    := aIsEnable;
  rbDepan.Enabled         := aIsEnable;
  rbSemua.Enabled         := aIsEnable;
end;

procedure TfrmLookupBarang.ShowInfo(AInfo: String);
begin
  Self.lblInfo.Caption := AInfo;
  Self.tmrInfo.Enabled := True;
  Self.pnlInfo.Visible := True;
end;

class function TfrmLookupBarang.CreateAt(aContainer: TWinControl; aPLU: String
    = ''): TfrmLookupBarang;
begin
  Result              := TfrmLookupBarang.Create(Application);
  Result.BoundsRect   := aContainer.BoundsRect;
  Result.Left         := aContainer.ClientToScreen(Point(0,0)).X;
  Result.Top          := aContainer.ClientToScreen(Point(0,0)).Y;
  Result.UNITID       := frmMain.UnitID;
  Result.BorderIcons  := [];
  Result.BorderStyle  := bsNone;

  if aPLU <> '' then
  begin
    Result.edNamaBarang.Text := aPLU;
    Result.LoadData;
  end;
end;

procedure TfrmLookupBarang.cxGrdBarangDblClick(Sender: TObject);
begin
  SelectItem;
end;

procedure TfrmLookupBarang.cxGrdBarangKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  if ((Key = VK_UP) or (Key = 33))
    and (cxGrdBarang.Controller.FocusedRowIndex = 0)
    and edNamaBarang.Enabled then
  begin
    edNamaBarang.SetFocus;
    edNamaBarang.SelectAll;
    Exit;
  end
  else
  if ((Key = VK_UP) or (Key = 33))
    and (cxGrdBarang.Controller.FocusedRowIndex = 0) then
  begin
    frmTransaksi.cxTransaksi.SetFocus;
    Exit;
  end
  else
  if ((Key = VK_DOWN) or (Key = 34))
    and (cxGrdBarang.Controller.FocusedRowIndex = (cxGrdBarang.DataController.RowCount-1))
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
    Self.ModalResult := mrCancel;
  end
  else if Key = VK_RETURN then
  begin
    IsStop := True;
    SelectItem;
  end
  else if Key in [VK_MULTIPLY,Ord('*')] then
  begin
    //IsStop := True;
  end;

end;

procedure TfrmLookupBarang.LoadData;
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
end;

procedure TfrmLookupBarang.SelectItem;
begin
  if not Assigned(FCDS) then exit;
  if FCDS.Eof then exit;
  PLU     := CDS.FieldByName('BRG_CODE').AsString;
  UOM     := CDS.FieldByName('SAT_CODE').AsString;
  UOMID   := CDS.FieldByName('REF$SATUAN_ID').AsString;
  Self.ModalResult    := mrOK;
end;

procedure TfrmLookupBarang.tmrInfoTimer(Sender: TObject);
begin
  Self.lblInfo.Visible := not Self.lblInfo.Visible;
end;

end.
