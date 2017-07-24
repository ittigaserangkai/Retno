unit ufrmTransaksiPending;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid;

type
  TfrmTransaksiPending = class(TForm)
    btnClose: TButton;
    btnRefresh: TButton;
    cxTransaksi: TcxGrid;
    sgTransaksi: TcxGridDBTableView;
    cxcolNo: TcxGridDBColumn;
    cxcolPLU: TcxGridDBColumn;
    cxcolNamaBarang: TcxGridDBColumn;
    cxcolJumlah: TcxGridDBColumn;
    cxcolHarga: TcxGridDBColumn;
    cxcolDisc: TcxGridDBColumn;
    grdlvlTransaksi: TcxGridLevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sgTransaksiDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRefreshClick(Sender: TObject);
  private
    procedure LoadPendingFromDBwSQL(AMemberCode: String);
    procedure RefreshTransPending;
  public
    procedure LoadPendingFromDBwClass(AMemberCode: String);
  end;

var
  frmTransaksiPending: TfrmTransaksiPending;

implementation

uses
  uConstanta, ufrmMain, ufrmTransaksi, uTSCommonDlg, uDXUtils,
  uNewPosTransaction, udmMain;

const
   _Kol_No                  : Byte = 0;
   _Kol_MEMBER_CARD_NO      : Byte = 1;
   _Kol_MEMBER_NAME         : Byte = 2;
   _Kol_TRANS_NO            : Byte = 3;
   _Kol_TRANS_DATE          : Byte = 4;
   _Kol_TRANS_TOTAL         : Byte = 5;
   _Kol_TRANS_IS_ACTIVE     : Byte = 6;
   _Kol_TRANS_ID            : Byte = 7;
   _Kol_TRANS_MEMBER_ID     : Byte = 8;
   _Kol_TRANS_MEMBER_UNT_ID : Byte = 9;

{$R *.dfm}

procedure TfrmTransaksiPending.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	Action := caFree;
  frmMain.miTransactionEndUserClick(Self);
end;

procedure TfrmTransaksiPending.btnCloseClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmTransaksiPending.LoadPendingFromDBwClass(AMemberCode: String);
var
  i: Integer;
  iTransID : Integer;
//  fPOSTransaction : TPOSTransaction;
  sPLU, sQty, sUoM: String;
begin
  frmMain.miTransactionEndUserClick(frmMain.miTransactionEndUser);
  try
    with sgTransaksi.DataController do
    begin
      frmTransaksi.edNoPelanggan.Text := Values[RecNo, _Kol_MEMBER_CARD_NO];
      if (frmTransaksi.edNoPelanggan.Text = '') or (frmTransaksi.edNoPelanggan.Text = '0') then
        frmTransaksi.LoadMember(frmTransaksi.GetDefaultMember)
      else
        frmTransaksi.LoadMember(frmTransaksi.edNoPelanggan.Text);
      frmTransaksi.edNoTrnTerakhir.Text := Values[RecNo, _Kol_TRANS_NO];
      TryStrToInt(Values[RecNo, _Kol_TRANS_ID], iTransID);
    end;
  finally
    frmTransaksi.SetGridHeader_Transaksi;
    frmTransaksi.edPLU.Text := '';
  end;

  {
  if iTransID > 0 then
  begin
    fPOSTransaction := TPOSTransaction.Create(Self);
    try
      frmTransaksi.sgTransaksi.UnHideColumns(_KolIsDecimal, _ColCount-1);
      frmTransaksi.sgTransaksi.ClearRows(1,frmTransaksi.sgTransaksi.RowCount-2);
      if fPOSTransaction.LoadByID(iTransID, frmMain.UnitID) then
      begin
        frmTransaksi.sgTransaksi.RowCount := 2;
        with fPOSTransaction.POSTransactionItems do
        begin
          for i:=0 to Count-1 do
          begin
            if frmTransaksi.sgTransaksi.Cells[_KolPLU, frmTransaksi.sgTransaksi.RowCount-1]<>'' then
               frmTransaksi.sgTransaksi.RowCount := frmTransaksi.sgTransaksi.RowCount + 1;
            sQty     := FloatToStr(POSTransactionItem[i].Qty);
            sPLU     := POSTransactionItem[i].BarangCode;
            sUoM     := POSTransactionItem[i].BarangHargaJual.NewUOM.Nama;
            frmTransaksi.LoadByPLU(
                sQty + '*' + sPLU,
                sUoM, False, True);
          end;
        end;
        frmTransaksi.sgTransaksi.AutoNumberCol(0);
        frmTransaksi.sgTransaksi.HideColumns(_KolIsDecimal, _ColCount-1);
        frmTransaksi.HitungTotalRupiah;
      end;
    finally
      //SetGridHeader_Transaksi;
      frmTransaksi.edPLU.Text := '';
      fPOSTransaction.Free;
    end;
  end;
  }
end;


procedure TfrmTransaksiPending.FormShow(Sender: TObject);
begin
  RefreshTransPending;
  cxTransaksi.SetFocus;
end;

procedure TfrmTransaksiPending.LoadPendingFromDBwSQL(AMemberCode: String);
var
  iTransID, iRow_Detail : Integer;
  sPLU, sQty, sUoM: String;
  fBHJSellPrice, fTransDSellPrice : Double;
  aKeyPress : Word;
  fDiscMan: Double;
  sDiscOto: string;
begin
  frmMain.miTransactionEndUserClick(frmMain.miTransactionEndUser);
  try
    with sgTransaksi.DataController do
    begin
      frmTransaksi.edNoPelanggan.Text := Values[_Kol_MEMBER_CARD_NO, RecNo];
      if (frmTransaksi.edNoPelanggan.Text = '') or (frmTransaksi.edNoPelanggan.Text = '0') then
        frmTransaksi.LoadMember(frmTransaksi.GetDefaultMember)
      else
        frmTransaksi.LoadMember(frmTransaksi.edNoPelanggan.Text);
      frmTransaksi.edNoTrnTerakhir.Text := Values[_Kol_TRANS_NO, RecNo];
      TryStrToInt(Values[_Kol_TRANS_ID, RecNo], iTransID);
    end;
  finally
    frmTransaksi.SetGridHeader_Transaksi;
    frmTransaksi.edPLU.Text := '';
  end;
  {
  if iTransID > 0 then
  begin
    frmTransaksi.sgTransaksi.UnHideColumns(_KolIsDecimal, _ColCount-1);
    frmTransaksi.sgTransaksi.ClearRows(1,frmTransaksi.sgTransaksi.RowCount-2);
    frmTransaksi.sgTransaksi.RowCount := 2;
    with cOpenQuery(GetListPendingTransDetailByHeaderID(frmMain.UnitID, iTransID)) do
    begin
      aKeyPress := VK_RETURN;
      Try
        while not EoF do
        begin
          if frmTransaksi.FindInGrid(FieldByName('TransD_Brg_Code').AsString,0,
              FieldByName('BHJ_Sat_Code').AsString) = 0 then
          begin
            if frmTransaksi.sgTransaksi.Cells[_KolPLU, frmTransaksi.sgTransaksi.RowCount-1]<>'' then
               frmTransaksi.sgTransaksi.RowCount := frmTransaksi.sgTransaksi.RowCount + 1;
            sQty             := FieldByName('TransD_Qty').AsString;
            sPLU             := FieldByName('TransD_Brg_Code').AsString;
            sUoM             := FieldByName('BHJ_Sat_Code').AsString;
            fBHJSellPrice    := FieldByName('BHJ_SELL_PRICE').AsFloat;
            fTransDSellPrice := FieldByName('TRANSD_SELL_PRICE').AsFloat;
            fDiscMan         := FieldByName('TRANSD_DISC_MAN').AsFloat;
            sDiscOto         := FieldByName('OTO_CODE').AsString;
            iRow_Detail      := frmTransaksi.LoadByPLU(
                                      sQty + '*' + sPLU,
                                      sUoM, False, False, fDiscMan, sDiscoto);
            if iRow_Detail > 0 then
              frmTransaksi.sgTransaksi.Ints[_KolDetailID, iRow_Detail] := FieldByName('TRANSD_ID').AsInteger;

            if fBHJSellPrice=0 then
            begin
              frmTransaksi.edHargaKontrabon.Text := FloatToStr(fTransDSellPrice);
              frmTransaksi.edHargaKontrabonKeyDown(frmTransaksi, aKeyPress, []);
              frmTransaksi.sgTransaksi.Ints[_KolIsKontrabon, iRow_Detail] := 1;
            end;
          end;
            Next;
        end;
      Finally
        Free;
      end;
      frmTransaksi.sgTransaksi.AutoNumberCol(0);
//      {$IFDEF RMS}
//      frmTransaksi.sgTransaksi.HideColumn(_KolDiscMan);
//      {$ENDIF}
//      frmTransaksi.sgTransaksi.HideColumns(_KolIsDecimal, _ColCount-1);
//      frmTransaksi.HitungTotalRupiah;
//    end;
//    frmTransaksi.edPLU.Text := '';
//  end;
  frmTransaksi.Transaksi_ID := iTransID;
end;

procedure TfrmTransaksiPending.RefreshTransPending;
begin
  {
  cQueryToGrid(GetListPendingTransByUserIDAndDate(frmMain.UnitID, frmMain.UserID, cGetServerTime),
               sgTransaksi, True);
  if sgTransaksi.Cells[_Kol_MEMBER_CARD_NO, 1] = '' then
  begin
    frmTransaksi := GetFormByClass(TfrmTransaksi) as TfrmTransaksi;
    if frmTransaksi <> nil then
      CommonDlg.ShowMessage('Tidak ada Transaksi Pending');
    Close;
  end;
  sgTransaksi.AutoSizeColumns(True, 5);
  HideColumnsGrid(sgTransaksi, _Kol_TRANS_ID, sgTransaksi.ColCount-1);
  sgTransaksi.ColWidths[_Kol_TRANS_TOTAL] := 100;
  if sgTransaksi.Cells[_Kol_TRANS_NO, 1] <> '' then
  begin
     sgTransaksi.Row := 1;
     sgTransaksi.Col := 1;
  end;
  }
  sgTransaksi.LoadFromCDS(cOpenDataset(GetListPendingTransByUserIDAndDate(frmMain.UnitID, frmMain.UserID, cGetServerDateTime)));
  if sgTransaksi.DataController.RecordCount = 0 then
  begin
    frmTransaksi := GetFormByClass(TfrmTransaksi) as TfrmTransaksi;
    if frmTransaksi <> nil then
      CommonDlg.ShowMessage('Tidak ada Transaksi Pending');
    Close;
  end;
//  sgTransaksi.SetVisibleColumns(['_Kol_TRANS_ID'],False);
//  sgTransaksi.SetColumnsWidth(['_Kol_TRANS_TOTAL'],100);
end;

procedure TfrmTransaksiPending.sgTransaksiDblClick(Sender: TObject);
begin
	if sgTransaksi.DataController.RecNo = 0 then Exit;

  LoadPendingFromDBwSQL('test');
  self.Close;
end;

procedure TfrmTransaksiPending.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    RefreshTransPending;
  end;
end;

procedure TfrmTransaksiPending.btnRefreshClick(Sender: TObject);
begin
  RefreshTransPending;
end;

end.
