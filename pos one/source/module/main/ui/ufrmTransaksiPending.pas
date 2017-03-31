unit ufrmTransaksiPending;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, BaseGrid, AdvGrid, AdvCGrid, uRMSUnit;

type
  TfrmTransaksiPending = class(TForm)
    btnClose: TButton;
    sgTransaksi: TAdvColumnGrid;
    btnRefresh: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sgTransaksiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgTransaksiDblClick(Sender: TObject);
    procedure sgTransaksiGetFloatFormat(Sender: TObject; ACol,
      ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
    procedure sgTransaksiGetEditorType(Sender: TObject; ACol,
      ARow: Integer; var AEditor: TEditorType);
    procedure sgTransaksiCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
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

uses uConstanta, ufrmMain, uPosTransaction, ufrmTransaksi, DB, uGTSUICommonDlg;

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
  frmMain.miTransactionEndUserClick(frmMain.miTransactionEndUser);
end;

procedure TfrmTransaksiPending.btnCloseClick(Sender: TObject);
begin
	Self.Close;
end;

procedure TfrmTransaksiPending.LoadPendingFromDBwClass(AMemberCode: String);
var
  i: Integer;
  iTransID : Integer;
  fPOSTransaction : TPOSTransaction;
  sPLU, sQty, sUoM: String;
begin
  frmMain.miTransactionEndUserClick(frmMain.miTransactionEndUser);
  try
    with sgTransaksi do
    begin
      frmTransaksi.edNoPelanggan.Text := Cells[_Kol_MEMBER_CARD_NO, Row];
      if (frmTransaksi.edNoPelanggan.Text = '') or (frmTransaksi.edNoPelanggan.Text = '0') then
        frmTransaksi.LoadMember(frmTransaksi.GetDefaultMember)
      else
        frmTransaksi.LoadMember(frmTransaksi.edNoPelanggan.Text);
      frmTransaksi.edNoTrnTerakhir.Text := Cells[_Kol_TRANS_NO, Row];
      TryStrToInt(Cells[_Kol_TRANS_ID, Row], iTransID);
    end;
  finally
    frmTransaksi.SetGridHeader_Transaksi;
    frmTransaksi.edPLU.Text := '';
  end;


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

  //edNoTrnTerakhir.Text := frmMain.GetTransactionNo(frmMain.FPOSCode);
end;


procedure TfrmTransaksiPending.FormShow(Sender: TObject);
begin
  (*
  cQueryToGrid(GetListPendingTransByUserID(frmMain.UnitID, frmMain.UserID),
               sgTransaksi, True);
  if sgTransaksi.Cells[_Kol_MEMBER_CARD_NO, 1] = '' then
  begin
    frmTransaksi := GetFormByClass(TfrmTransaksi) as TfrmTransaksi;
    if frmTransaksi <> nil then
      CommonDlg.ShowMessage('Tidak ada Transaksi Pending');
    Close;
  end;
  sgTransaksi.AutoSizeColumns(True, 5);
  sgTransaksi.HideColumns(_Kol_TRANS_ID, sgTransaksi.ColCount-1);
  sgTransaksi.ColWidths[_Kol_TRANS_TOTAL] := 100;
  if sgTransaksi.Cells[_Kol_TRANS_NO, 1] <> '' then
  begin
     sgTransaksi.Row := 1;
     sgTransaksi.Col := 1;
  end;
  *)
  RefreshTransPending;
  sgTransaksi.SetFocus;
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
    with sgTransaksi do
    begin
      frmTransaksi.edNoPelanggan.Text := Cells[_Kol_MEMBER_CARD_NO, Row];
      if (frmTransaksi.edNoPelanggan.Text = '') or (frmTransaksi.edNoPelanggan.Text = '0') then
        frmTransaksi.LoadMember(frmTransaksi.GetDefaultMember)
      else
        frmTransaksi.LoadMember(frmTransaksi.edNoPelanggan.Text);
      frmTransaksi.edNoTrnTerakhir.Text := Cells[_Kol_TRANS_NO, Row];
      TryStrToInt(Cells[_Kol_TRANS_ID, Row], iTransID);
    end;
  finally
    frmTransaksi.SetGridHeader_Transaksi;
    frmTransaksi.edPLU.Text := '';
  end;

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
      {$IFDEF RMS}
      frmTransaksi.sgTransaksi.HideColumn(_KolDiscMan);
      {$ENDIF}
      frmTransaksi.sgTransaksi.HideColumns(_KolIsDecimal, _ColCount-1);
      frmTransaksi.HitungTotalRupiah;
    end;
    //SetGridHeader_Transaksi;
    frmTransaksi.edPLU.Text := '';
  end;
  frmTransaksi.Transaksi_ID := iTransID;

end;

procedure TfrmTransaksiPending.RefreshTransPending;
begin
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
  //sgTransaksi.HideColumns(_Kol_TRANS_ID, sgTransaksi.ColCount-1);
  HideColumnsGrid(sgTransaksi, _Kol_TRANS_ID, sgTransaksi.ColCount-1);
  sgTransaksi.ColWidths[_Kol_TRANS_TOTAL] := 100;
  if sgTransaksi.Cells[_Kol_TRANS_NO, 1] <> '' then
  begin
     sgTransaksi.Row := 1;
     sgTransaksi.Col := 1;
  end;
end;

procedure TfrmTransaksiPending.sgTransaksiKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	if Key = VK_RETURN then
  begin
    sgTransaksiDblClick(sgTransaksi);
  end
end;

procedure TfrmTransaksiPending.sgTransaksiDblClick(Sender: TObject);
begin
	if sgTransaksi.Row = 0 then Exit;

  LoadPendingFromDBwSQL('test');
  self.Close;
end;

procedure TfrmTransaksiPending.sgTransaksiGetFloatFormat(Sender: TObject;
  ACol, ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  if (ARow > 0) and (ACol > 0) then
  begin
    if ACol in [_Kol_TRANS_TOTAL] then
    begin
      FloatFormat := '%.n';
    end;
  end;
end;

procedure TfrmTransaksiPending.sgTransaksiGetEditorType(Sender: TObject;
  ACol, ARow: Integer; var AEditor: TEditorType);
begin
  if ACol = _Kol_TRANS_TOTAL then
    AEditor := edFloat;    
end;

procedure TfrmTransaksiPending.sgTransaksiCanEditCell(Sender: TObject;
  ARow, ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := False;
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
