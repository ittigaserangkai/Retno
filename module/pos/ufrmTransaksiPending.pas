unit ufrmTransaksiPending;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, uDMClient, uAppUtils;

type
  TfrmTransaksiPending = class(TForm)
    btnClose: TButton;
    btnRefresh: TButton;
    cxTransaksi: TcxGrid;
    sgTransaksi: TcxGridDBTableView;
    grdlvlTransaksi: TcxGridLevel;
    sgTransaksiColumn1: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sgTransaksiDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRefreshClick(Sender: TObject);
    procedure sgTransaksiColumn1GetDisplayText(Sender: TcxCustomGridTableItem;
        ARecord: TcxCustomGridRecord; var AText: string);
    procedure sgTransaksiKeyDown(Sender: TObject; var Key: Word; Shift:
        TShiftState);
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
//   _Kol_TRANS_MEMBER_UNT_ID : Byte = 9;

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
  iTransID : string;
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
//      TryStrToInt(Values[RecNo, _Kol_TRANS_ID], iTransID);
      iTransID := VarToStr(Values[RecNo, _Kol_TRANS_ID]);
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
  iTransID : string;
  iRow_Detail : Integer;
  sPLU, sQty, sUoM: string;
  fBHJSellPrice, fTransDSellPrice : Double;
  aKeyPress : Word;
  fDiscMan: Double;
  sDiscOto: string;
begin
  frmMain.miTransactionEndUserClick(frmMain.miTransactionEndUser);
  try
    with sgTransaksi.DataController do
    begin
      frmTransaksi.edNoPelanggan.Text := Values[FocusedRecordIndex, _Kol_MEMBER_CARD_NO];
      if (frmTransaksi.edNoPelanggan.Text = '') or (frmTransaksi.edNoPelanggan.Text = '0') then
        frmTransaksi.LoadMember(frmTransaksi.GetDefaultMember)
      else
        frmTransaksi.LoadMember(frmTransaksi.edNoPelanggan.Text);
      frmTransaksi.edNoTrnTerakhir.Text := Values[FocusedRecordIndex, _Kol_TRANS_NO];
//      TryStrToInt(Values[FocusedRecordIndex, _Kol_TRANS_ID], iTransID);
      iTransID := VarToStr(Values[FocusedRecordIndex, _Kol_TRANS_ID]);
    end;
  finally
//    frmTransaksi.SetGridHeader_Transaksi;
    frmTransaksi.edPLU.Text := '';
  end;

  if iTransID <> '' then
  begin
    frmTransaksi.sgTransaksi.ClearRows;
    with cOpenQuery(GetListPendingTransDetailByHeaderID(iTransID)) do
    begin
      aKeyPress := VK_RETURN;
      Try
        while not EoF do
        begin
          if frmTransaksi.FindInGridOld(FieldByName('TransD_Brg_Code').AsString,0,
              FieldByName('Sat_Code').AsString) = -1 then
          begin
            if frmTransaksi.sgTransaksi.DataController.Values[frmTransaksi.sgTransaksi.DataController.RecordCount-1,_KolPLU]<>'' then
//               frmTransaksi.sgTransaksi.DataController.Append;
            sQty             := FieldByName('TransD_Qty').AsString;
            sPLU             := FieldByName('TransD_Brg_Code').AsString;
            sUoM             := FieldByName('Sat_Code').AsString;
            fBHJSellPrice    := FieldByName('BHJ_SELL_PRICE').AsFloat;
            fTransDSellPrice := FieldByName('TRANSD_SELL_PRICE').AsFloat;
            fDiscMan         := FieldByName('TRANSD_DISC_MAN').AsFloat;
            sDiscOto         := FieldByName('OTO_CODE').AsString;
            iRow_Detail      := frmTransaksi.LoadByPLU(
                                      sQty + '*' + sPLU,
                                      sUoM, False, False, fDiscMan, sDiscoto);
            if iRow_Detail >= 0 then
              frmTransaksi.sgTransaksi.DataController.Values[iRow_Detail, _KolDetailID] := FieldByName('TRANSAKSI_DETIL_ID').AsString;

            if fBHJSellPrice = 0 then
            begin
              frmTransaksi.edHargaKontrabon.Text := FloatToStr(fTransDSellPrice);
              frmTransaksi.edHargaKontrabonKeyDown(frmTransaksi, aKeyPress, []);
              frmTransaksi.sgTransaksi.DataController.Values[iRow_Detail, _KolIsKontrabon] := 1;
            end;
          end;
            Next;
        end;
      Finally
        Free;
      end;

//      {$IFDEF RMS}
//      frmTransaksi.sgTransaksi.SetVisibleColumns(_KolDiscMan, _KolDiscMan, False);
//      {$ENDIF}
//      frmTransaksi.sgTransaksi.SetVisibleColumns(_KolIsDecimal, _ColCount, False);

      frmTransaksi.HitungTotalRupiah;
    end;
    frmTransaksi.edPLU.Text := '';
  end;
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
//  sgTransaksi.LoadFromCDS(cOpenDataset(GetListPendingTransByUserIDAndDate(frmMain.UserID, cGetServerDateTime)));
  if frmMain.AuthUser.ID = '' then
    Raise Exception.Create('User Login belum ada');

  sgTransaksi.LoadFromDS(
    DMCLient.POSClient.GetListPendingTransByUserIDAndDate(frmMain.AuthUser.ID, Now()), Self
  );
  if sgTransaksi.DataController.RecordCount = 0 then
  begin
    frmTransaksi := GetFormByClass(TfrmTransaksi) as TfrmTransaksi;
    if frmTransaksi <> nil then
      TAppUtils.Information('Tidak ada Transaksi Pending');
//      CommonDlg.ShowMessage('Tidak ada Transaksi Pending');
    Close;
  end else
  begin
    sgTransaksi.SetVisibleColumns(_Kol_TRANS_IS_ACTIVE, _Kol_TRANS_MEMBER_ID, False);
  end;
//  sgTransaksi.SetVisibleColumns(['_Kol_TRANS_ID'],False);
//  sgTransaksi.SetColumnsWidth(['_Kol_TRANS_TOTAL'],100);
end;

procedure TfrmTransaksiPending.sgTransaksiDblClick(Sender: TObject);
begin
//	if sgTransaksi.DataController.RecNo = 0 then Exit;

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

procedure TfrmTransaksiPending.sgTransaksiColumn1GetDisplayText(Sender:
    TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
var
  Row: Integer;
begin
  Row := Sender.GridView.DataController.GetRowIndexByRecordIndex(ARecord.RecordIndex, False);
  AText := IntToStr(Row+1);
end;

procedure TfrmTransaksiPending.sgTransaksiKeyDown(Sender: TObject; var Key:
    Word; Shift: TShiftState);
begin
	if Key = VK_RETURN then
  begin
    sgTransaksiDblClick(sgTransaksi);
  end
end;

end.
