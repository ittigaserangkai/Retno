unit ufrmReturNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, ActnList, Menus,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, System.Actions, ufraFooter4Button, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC;

type
  TfrmReturNota = class(TfrmMasterBrowse)
    pm1: TPopupMenu;
    Cetak1: TMenuItem;
    Refresh1: TMenuItem;
    procedure actAddExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dtTglReturKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure strgGridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure Refresh1Click(Sender: TObject);
    procedure Cetak1Click(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fraFooter5Button1btnUpdateClick(Sender: TObject);
  private
    FUnitId: integer;
//    FNewTransaksiReturNota : TNewTransaksiReturNota;
    procedure ParseDataComboBox();
    procedure SetUnitId(const Value: integer);

  public
    function GetPotNoBukti(aNoBuktiSatuan : String  ): string;
    property UnitId: integer read FUnitId write SetUnitId;
  end;

var
  frmReturNota: TfrmReturNota;

//const
//  _KolNOPOS        : Integer = 0;
//  _KolTanggal      : Integer = 1;
//  _KolNOBUKTI      : Integer = 2;
//  _KolKode         : Integer = 3;
//  _KolSatuan       : Integer = 4;
//  _KolHarga        : Integer = 5;
//  _KolPPN          : Integer = 6;
//  _KolJumlah       : Integer = 7;
//  _KolHARGADISC    : Integer = 8;
//  _KolHARGADISCPPN : Integer = 9;

implementation

uses ufrmDialogReturNota, uTSCommonDlg;

{$R *.dfm}

procedure TfrmReturNota.actAddExecute(Sender: TObject);
begin
  inherited;
  if not assigned(frmDialogReturNota) then
    Application.CreateForm(TfrmDialogReturNota, frmDialogReturNota);

  frmDialogReturNota.Caption := 'Add Retur Nota';
  frmDialogReturNota.FormMode := fmAdd;
  SetFormPropertyAndShowDialog(frmDialogReturNota);
  actRefreshExecute(nil);
end;

procedure TfrmReturNota.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmReturNota.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'RETUR NOTA (CN)';
//  FNewTransaksiReturNota := TNewTransaksiReturNota.Create(Self);
end;

procedure TfrmReturNota.FormDestroy(Sender: TObject);
begin
  inherited;
  frmReturNota := nil;
end;

procedure TfrmReturNota.ParseDataComboBox;
//var
//  DataReturNota: TResultDataSet;
//  Params: TArr;
//  i: integer;
begin
//  if not Assigned(ReturNota) then
//    ReturNota := TReturNota.Create;

//  SetLength(Params, 1);
//  Params[0].tipe := ptDateTime;
//  Params[0].data := dtTglRetur.Date;
//  DataReturNota := ReturNota.GetReturNotaByDate(Params);

//  with cbpReturNota do
//  begin
//    ClearGridData;
//    ColCount := 3;
//    RowCount := 3;
//    AddRow(['Id', 'NOTA RETUR NO.','DATE']);
//
//    if (DataReturNota.RecordCount > 0) then
//    begin
//      RowCount := DataReturNota.RecordCount + 1;
//
//      with DataReturNota do
//      begin
//        i := 1;
//        while not eof do
//        begin
//          AddRow([Inttostr(i), FieldByName('TRANSRET_NO').AsString,
//            FormatDateTime('dd-mm-yyyy',FieldByName('TRANSRET_DATE').AsDateTime)]);
//          Next;
//          Inc(i);
//        end;
//      end;
//    end
//    else
//      AddRow(['', '','']);
//
//
//    FixedRows := 1;
//    SizeGridToData;
//    Text := '';
//  end;

end;

procedure TfrmReturNota.SetUnitId(const Value: integer);
begin
  FUnitId := Value;
end;

procedure TfrmReturNota.dtTglReturKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    ParseDataComboBox;
  end;
end;

procedure TfrmReturNota.FormShow(Sender: TObject);
begin
  inherited;
  actRefreshExecute(nil);
end;

procedure TfrmReturNota.strgGridCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  CanEdit := False;
end;

procedure TfrmReturNota.Refresh1Click(Sender: TObject);
begin
  inherited;
  actRefreshExecute(nil);
end;

procedure TfrmReturNota.Cetak1Click(Sender: TObject);
begin
  inherited;
  actPrintExecute(nil);
end;

procedure TfrmReturNota.actPrintExecute(Sender: TObject);
var
  sPotNoBukti : String;
  sNotrans    : String;
begin
  inherited;
  {sNotrans := strgGrid.Cells[1,strgGrid.Row];
  sPotNoBukti := GetPotNoBukti(strgGrid.Cells[3,strgGrid.Row]);
  DoSlipReturNota(sNotrans,  masternewunit.id, FLoginFullname, MasterNewunit.Nama, sPotNoBukti);
  }
end;

procedure TfrmReturNota.actRefreshExecute(Sender: TObject);
var
  //i: Integer;
  sSQL: string;
begin
  inherited;
  sSQL := 'select TRANSRET_TRANS_NO as NOPOS, TRANSRET_DATE as Tanggal, TRANSRET_NO as NOBUKTI, TRANSRET_BRG_CODE as Kode,'
          + ' TRANSRET_UOM as Satuan,TRANSRET_PRICE as Harga,PPN,TRANSRET_DISC_AMC AS DISCAMC, TRANSRET_QTY as QTY'
          + ' from TRANSAKSI_RETUR_NOTA'
          + ' where TRANSRET_unt_id = ' + IntToStr(masternewunit)
          + ' order by TRANSRET_DATE desc, TRANSRET_NO asc rows 50';
  {
  cQueryToGrid(sSQL, strgGrid);
  strgGrid.AutoSizeColumns(True, 10);
  }
end;

procedure TfrmReturNota.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
  if Key = VK_Escape then
  Close
  else if (Key = VK_F5) and (ssCtrl in Shift) then
  actRefreshExecute(Self)
  else if (Key = Ord('C')) and (ssCtrl in Shift) then
  actAddExecute(Self)
  else if (Key = Ord('P')) and (ssCtrl in Shift) then
  actPrintExecute(Self)
end;

procedure TfrmReturNota.fraFooter5Button1btnUpdateClick(Sender: TObject);
begin
  inherited;
  actPrintExecute(Self);
end;

function TfrmReturNota.GetPotNoBukti(aNoBuktiSatuan : String  ): string;
var
  iPos: Integer;
begin
  Result := aNoBuktiSatuan ;
  iPos := Pos('-',Result);
  if iPos > 0 then
    Result := Copy(Result, 1,iPos - 1);
end;

end.



