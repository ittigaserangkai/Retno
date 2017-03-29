unit ufrmDialogReturNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialogBrowse, ExtCtrls, StdCtrls,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, cxButtonEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit, cxCurrencyEdit, cxLabel,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid;

type               
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogReturNota = class(TfrmMasterDialogBrowse)
    pnl1: TPanel;
    dtReturDate: TcxDateEdit;
    lbl1: TLabel;
    lbl3: TLabel;
    edtMemberCode: TEdit;
    lbl5: TLabel;
    edtMemberName: TEdit;
    edtReturNote: TEdit;
    lbl4: TLabel;
    pnl3: TPanel;
    lbl8: TcxLabel;
    lbl7: TLabel;
    curredtTotalRetur: TcxCurrencyEdit;
    edtNoTrans: TcxButtonEdit;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure strgGridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridCellValidate(Sender: TObject; ACol, ARow: Integer;
      var Value: String; var Valid: Boolean);
    procedure lbl8Click(Sender: TObject);
    procedure strgGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNoTransClickBtn(Sender: TObject);
    procedure strgGridEnter(Sender: TObject);
    procedure strgGridExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNoTransKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNoTransChange(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
  private
    FIsProcessSuccessfull: boolean;
    FFormMode: TFormMode;
    FnoRetur: string;
    procedure AturLebarKolom;
    //FNewTransaksiReturNota : TNewTransaksiReturNota;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure ParseHeaderGrid();
    procedure ShowPaymentReturNota();
    procedure InisialisasiForm;
    //procedure ParseDataTransactByNo(ATransactNo: string);
    //procedure ParseTransNoListOnCombo(ATransactNo: string; ADate: TDateTime);
    //function SaveTransaksiReturNota: boolean;
    procedure SetnoRetur(const Value: string);
  public
    TransactNo: string;
    isEdit : Boolean;
    function IsAdaDataDouble: Boolean;
    function IsQtyCukup(aMaxQty : Double; aQty : Double ; aTransdID : Integer;
        aUnitID : Integer; aExcludeNoBukti :String): Boolean;
    procedure JumlahkanTotalRetur;
    procedure LoadDataDetailTransaksi(aTransDID : Integer; aBrgCode : string;
        aUnitID : Integer; aRow : Integer);
    procedure LoadDataTransaksi(aNoBukti : String ; aUnitID : Integer);
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
    property noRetur: string read FnoRetur write SetnoRetur;
  end;

var
  frmDialogReturNota: TfrmDialogReturNota;

implementation

uses ufrmSearchProduct, ufraPaymentReturNota, uTSCommonDlg, uConstanta,
    Math;

const
{Kode
Nama
UOM
Harga (Disc)
Disc AMC
PPN
Qty POS
Qty Retur
Total
Is Decimal
Total
}
  _KOlTransdID : Integer = 10;
  _KolIsDecimal: Integer = 9;
  _KOlTotal    : Integer = 8;
  _KolQtyRetur : Integer = 7;
  _KolQtyBeli  : Integer = 6;
  _KolPPN      : Integer = 5;
  _KolDiscAMC  : Integer = 4;
  _KolHargaDisc: Integer = 3;
  _KolUOM      : Integer = 2;
  _KolBrgName  : Integer = 1;
  _KolBrgCode  : Integer = 0;


{$R *.dfm}

procedure TfrmDialogReturNota.AturLebarKolom;
begin
//  strgGrid.AutoSizeColumns(True,10);
//  strgGrid.ColWidths[_KOlTransdID]  := 0;
//  strgGrid.ColWidths[_KolIsDecimal] := 0;
end;

procedure TfrmDialogReturNota.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  if assigned(fraPaymentReturNota) then
    fraPaymentReturNota.Parent := nil;
end;

procedure TfrmDialogReturNota.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogReturNota := nil;
end;

procedure TfrmDialogReturNota.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogReturNota.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogReturNota.ParseHeaderGrid;
begin
  {
  with strgGrid do
  begin
    Clear;
    ColCount := 12;
    RowCount := 10;
    Cells[_KolBrgCode,0]  := 'KODE';
    Cells[_KolBrgName,0]  := 'NAMA';
    Cells[_KolUOM,0]      := 'SATUAN';
    Cells[_KolHarga,0]    := 'HARGA';
    Cells[_KolHargaDisc,0]:= 'HARGA DISC';
    Cells[_KolPPN,0]      := 'PPN';
    Cells[_KolQtyBeli,0]  := 'QTY POS';
    Cells[_KolQtyRetur,0] := 'QTY CN';
    Cells[_KolTotal,0]    := 'TOTAL HARGA';
    Cells[_KolTotalDisc,0]:= 'TOTAL HARGA DISC';
    Cells[_KOlTransdID,0] := 'TRANSD_ID';
    Cells[_KolIsDecimal,0]:= 'IS DECIMAL';

    FixedRows := 1;
    AutoSize := true;
  end;
  }
end;

procedure TfrmDialogReturNota.FormShow(Sender: TObject);
begin
  inherited;
  InisialisasiForm;
end;

procedure TfrmDialogReturNota.strgGridCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  if (ACol in [_KolQtyRetur]) then
    CanEdit := True
  else
    CanEdit := false;
end;

procedure TfrmDialogReturNota.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //inherited;
  if (Key = VK_F9) then
    ShowPaymentReturNota;
  if (Key = VK_F3) then
    if assigned(fraPaymentReturNota) then
      if (fraPaymentReturNota.Showing) then
        CommonDlg.ShowConfirmGlobal(PRINT_PAYMENT_RETUR_NOTA);
end;

procedure TfrmDialogReturNota.strgGridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {if (Key = VK_F5) then
  begin
    with strgGrid do
    begin

      if (Col in [0,1]) then
      begin
        if not assigned(frmDialogSearchProduct) then
          frmDialogSearchProduct := TfrmDialogSearchProduct.Create(Application);
        frmDialogSearchProduct.Modul := tmReturNota;
        frmDialogSearchProduct.GlobalParam := TransactNo;
        if (frmDialogSearchProduct.IsProcessSuccessfull) then
        begin
          with frmDialogSearchProduct do
          begin
            Cells[0,Row] := ProductCode;
            Cells[1,Row] := ProductName;
            Cells[2,Row] := FormatFloat('#,##0.000', StrToFloat(QtySell));
            Alignments[2,Row] := taRightJustify;
            Cells[3,Row] := '0';
            Alignments[3,Row] := taRightJustify;
            Cells[4,Row] := FormatFloat('#,##0.00', StrToCurr(SellPriceDisc));
            Alignments[4,Row] := taRightJustify;
            Cells[5,Row] := FormatFloat('#,##0.00', 0.00);
            Alignments[5,Row] := taRightJustify;
            // hidden;
            Cells[10,Row] := QtySell;
            Cells[11,Row] := SellPriceDisc;

            Col := 3;
            Row := Row;
          end;
          SetFocus;
        end;
        frmDialogSearchProduct.Free;
      end;

    end;
  end;
  }
end;

procedure TfrmDialogReturNota.strgGridCellValidate(Sender: TObject; ACol,
  ARow: Integer; var Value: String; var Valid: Boolean);
var
  iValue: Integer;
  dValue: Double;
begin
  {if ACol in [_KolQtyRetur] then
  begin
    if strgGrid.Ints[_KolIsDecimal,ARow] = 1 then
    begin
      Valid := TryStrToFloat(Value, dValue);
    end else begin
      Valid := TryStrToInt(Value, iValue);
      dValue:= iValue;
    end;

    if Valid then
      Valid := strgGrid.Floats[_KolQtyBeli,ARow] >= dValue;

    if Valid then
    begin
      strgGrid.Floats[_KOlTotal,ARow] := (strgGrid.Floats[_KolHargaDisc,ARow] - strgGrid.Floats[_KolDiscAMC,ARow]) * strgGrid.Floats[_KolQtyRetur,ARow];
      JumlahkanTotalRetur;
    end;
  end;
  }
end;

procedure TfrmDialogReturNota.ShowPaymentReturNota;
begin
  if not assigned(fraPaymentReturNota) then
    fraPaymentReturNota := TfraPaymentNotaRetur.Create(Application);

  fraPaymentReturNota.Parent := pnlBody;
  fraPaymentReturNota.Align := alClient;
  fraPaymentReturNota.ParseDataComboBox;
  fraPaymentReturNota.ParseDataCard;
  fraPaymentReturNota.cbp1.SetFocus;
end;

procedure TfrmDialogReturNota.lbl8Click(Sender: TObject);
begin
  ShowPaymentReturNota;
end;

procedure TfrmDialogReturNota.InisialisasiForm;
begin
  ParseHeaderGrid;
  if (frmDialogReturNota.isEdit = False) then
  begin
//    dtReturDate.Date        := cGetServerTime;
    edtMemberCode.Text      := '';
    edtMemberName.Text      := '';
    edtReturNote.Text       := '';
    edtNoTrans.Text         := '';
//    cClearGrid(strgGrid, False);
  end else begin

  end;

  AturLebarKolom;
end;


procedure TfrmDialogReturNota.strgGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sSQL: string;
  dQTY, dQTYRetur : Integer;
begin
  if Key = VK_F5 then
  begin
    sSQL := 'select a.transd_id, a.transd_brg_code, c.brg_alias, b.bhj_sat_code,a.transd_qty, a.transd_total, '
            + ' sum(d.transret_qty) as retur_qty, sum(cast(d.transret_price * d.transret_qty as double precision)) as retur_total'
            + ' from transaksi_detil a'
            + ' inner join barang_harga_jual b on a.transd_bhj_id = b.bhj_id and a.transd_bhj_unt_id = b.bhj_unt_id'
            + ' inner join barang c on a.transd_brg_code = c.brg_code'
            + ' left join TRANSAKSI_RETUR_NOTA d on d.transret_transd_id = a.transd_id'
            + ' where a.transd_trans_no = ' + QuotedStr(edtNoTrans.Text)
            + ' and a.transd_trans_unt_id = ' + IntToStr(dialogunit)
            + ' group by a.transd_id, a.transd_brg_code, c.brg_alias, b.bhj_sat_code,a.transd_qty, a.transd_total';
    {
    with cLookUp('Datar Barang', sSQL) do
    begin
      try
        if Strings[0] = '' then
          Exit;

        TryStrToInt(Strings[4], dQTY);
        TryStrToInt(Strings[6], dQTYRetur);
        if dQTYRetur>=dQTY then
        begin
          CommonDlg.ShowMessage('QTY Barang sudah habis di Retur');
          exit;
        end;

            LoadDataDetailTransaksi(StrToInt(Strings[0]), Strings[1], dialogunit, strgGrid.row);
            AturLebarKolom;

      finally
        Free;
      end;
    end;

    }

  end;
end;

procedure TfrmDialogReturNota.SetnoRetur(const Value: string);
begin
  FnoRetur := Value;
end;

procedure TfrmDialogReturNota.edtNoTransClickBtn(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := 'select a.trans_no,a.trans_date, b.member_card_no, b.member_name'
          + ' from transaksi a, member b'
          + ' where a.trans_member_id = b.member_id'
          + ' and a.trans_member_unt_id = b.member_unt_id'
          + ' and a.trans_unt_id = ' + IntToStr(dialogunit);
  {
  with cLookUp('Daftar Transaksi', sSQL,200,2,True) do
  begin
    try
      if Strings[0] = '' then
        Exit;

      edtNoTrans.Text := Strings[0];
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmDialogReturNota.LoadDataDetailTransaksi(aTransDID : Integer;
    aBrgCode : string; aUnitID : Integer; aRow : Integer);
var
  sSQL: string;
begin
  sSQL := 'select a.transd_id, a.transd_brg_code, c.brg_alias, b.bhj_sat_code, '
            + ' a.transd_qty, a.transd_sell_price_disc, '
            + ' (a.transd_qty * a.transd_sell_price_disc) as Total, '
            + ' a.transd_PPN,a.TRANSD_SELL_PRICE,c.BRG_IS_DECIMAL,TRANSD_DISC_GMC_NOMINAL,TRANSD_DISC_MAN '
            + ' from transaksi_detil a, barang_harga_jual b, barang c'
            + ' where a.transd_id = ' + IntToStr(aTransDID)
            + ' and a.transd_trans_unt_id = ' + IntToStr(aUnitID)
            + ' and a.transd_brg_code = ' + QuotedStr(aBrgCode)
            + ' and a.transd_bhj_id = b.bhj_id'
            + ' and a.transd_bhj_unt_id = b.bhj_unt_id'
            + ' and a.transd_brg_code = c.brg_code';
  {
  with cOpenQuery(sSQL) do
  begin
    try
      if not IsEmpty then
      begin
        strgGrid.Columns[_KolBrgCode].Rows[aRow]    := FieldByName('transd_brg_code').AsString;
        strgGrid.Columns[_KolBrgName].Rows[aRow]    := FieldByName('brg_alias').AsString;
        strgGrid.Columns[_KolUOM].Rows[aRow]        := FieldByName('bhj_sat_code').AsString;
        strgGrid.Columns[_KolHargaDisc].Floats[aRow]:= FieldByName('TRANSD_SELL_PRICE_DISC').AsFloat - FieldByName('TRANSD_DISC_MAN').AsFloat;
        strgGrid.Columns[_KolPPN].Floats[aRow]      := FieldByName('transd_ppn').AsFloat;
        strgGrid.Columns[_KolQtyBeli].Floats[aRow]  := FieldByName('transd_qty').AsFloat;
        strgGrid.Columns[_KOlTransdID].Ints[aRow]   := FieldByName('transd_id').AsInteger;
        strgGrid.Columns[_KolIsDecimal].Ints[aRow]  := FieldByName('BRG_IS_DECIMAL').AsInteger ;
        strgGrid.Columns[_KolDiscAMC].Floats[aRow]  := FieldByName('TRANSD_DISC_GMC_NOMINAL').AsFloat ;
        strgGrid.Columns[_KolQtyRetur].Floats[aRow] := 0;
        strgGrid.Columns[_KOlTotal].Floats[aRow]    := 0;
      end;
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmDialogReturNota.LoadDataTransaksi(aNoBukti : String ; aUnitID :
    Integer);
var
  sNamaMember: string;
  sKodeMember: string;
begin
  {with TPOSTransaction.Create(nil) do
  begin
    try
      LoadByTrans_No(aNoBukti, aUnitID);
      GetMember(sKodeMember, sNamaMember);
      edtMemberCode.Text := sKodeMember;
      edtMemberName.Text := sNamaMember;
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmDialogReturNota.strgGridEnter(Sender: TObject);
begin
  inherited;
//  strgGrid.Color := clInfoBk;
end;

procedure TfrmDialogReturNota.strgGridExit(Sender: TObject);
begin
  inherited;
//  strgGrid.Color := clWhite;
end;

procedure TfrmDialogReturNota.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //inherited;
  {
  case Key of
    VK_RETURN:begin
              if ActiveControl.ClassType = TAdvColumnGrid then
              begin
                 if (ssCtrl in Shift) then
                 begin
                   footerDialogMasterbtnSaveClick(self);
                 end else if strgGrid.Col + 1 > strgGrid.ColCount - 1 then
                 begin
                   if Trim(strgGrid.Cells[_KolBrgCode,strgGrid.Row]) <> '' then
                   begin
                     if strgGrid.Row = strgGrid.RowCount - 1 then
                     begin
                       strgGrid.AddRow;
                       strgGrid.Row := strgGrid.RowCount - 1;
                     end else begin
                       strgGrid.Row := strgGrid.Row + 1;
                     end;
                   end;

                   strgGrid.Col := 0 ;
                 end else
                   strgGrid.Col := strgGrid.Col + 1;
              end else if (ssCtrl in Shift) then
              begin
                footerDialogMasterbtnSaveClick(self);
              end else if (ActiveControl.ClassType <> TcxLabel) then
                 SelectNext(ActiveControl,True,True);
              end;

    Ord('T'): begin
                if (ssCtrl in Shift) and
                   (ActiveControl.ClassType=TAdvColumnGrid) then
                begin
                   if strgGrid.Row = strgGrid.RowCount - 1 then
                   begin
                     strgGrid.AddRow;
                     strgGrid.Row := strgGrid.RowCount - 1;
                   end else begin
                     strgGrid.Row := strgGrid.Row + 1;
                   end;
                   strgGrid.Col := 0;
                end;
              end;
    Ord('R'): begin
                if (ssCtrl in Shift) and
                   (ActiveControl.ClassType=TAdvColumnGrid) then
                begin
                 if strgGrid.RowCount > 2 then
                   strgGrid.RemoveSelectedRows
                 else if strgGrid.RowCount = 2 then
                   cClearGrid(strgGrid,False);
                end;
              end;

    VK_ESCAPE: begin
                 Close;
               end;
    
  end;
  }
end;

procedure TfrmDialogReturNota.edtNoTransKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    LoadDataTransaksi(edtNoTrans.Text, dialogunit)
  else if Key = VK_F5 then
    edtNoTransClickBtn(nil);
end;

procedure TfrmDialogReturNota.JumlahkanTotalRetur;
var
  i: Integer;
  dJumlah: Double;
begin
  dJumlah     := 0;
  {for i := 1 to strgGrid.RowCount - 1 do
  begin
    dJumlah := dJumlah + strgGrid.Floats[_KolTotal,i];
  end;
  }
  curredtTotalRetur.Value := dJumlah;
end;

procedure TfrmDialogReturNota.edtNoTransChange(Sender: TObject);
begin
  inherited;
//  cClearGrid(strgGrid, False);
end;

procedure TfrmDialogReturNota.footerDialogMasterbtnSaveClick(
  Sender: TObject);
var
//  lUnit: TUnit;
  sNoBukti: string;
  IsMasuk: Boolean;
  dtRetur: TDateTime;
//  LReturNota: TNewTransaksiReturNota;
  i: Integer;
begin
  inherited;
  if CommonDlg.Confirm('Anda Yakin Akan Menyimpan Data?') = mrNo then
    Exit;

  if IsAdaDataDouble then
  begin
    CommonDlg.ShowError('Ada Kode Barang Dan Satuan Yang Double');
    Exit;
  end;

  IsMasuk           := False;
  {
  LReturNota        := TNewTransaksiReturNota.Create(nil);
  lUnit             := TUnit.Create(nil);
  try
    if not lUnit.LoadByID(dialogunit) then
    begin
      CommonDlg.ShowError('Unit Tidak Ditemukan, Transaksi Gagal !');
      Exit;
    end;

    dtRetur   := cGetServerTime;
    sNoBukti := LReturNota.GetNextNoBukti(dialogunit);
    for i := 1 to strgGrid.RowCount - 1 do
    begin
      if Trim(strgGrid.Cells[_KolBrgCode,i]) = '' then
        Continue;

      if strgGrid.Floats[_KolQtyRetur,i]<=0then
      begin
        CommonDlg.ShowMessage('Baris : ' + inttostr(i) +' QTY Retur Masih 0');
        exit;
      end;

      strgGrid.Row := i;
      if not IsQtyCukup(strgGrid.Columns[_KolQtyBeli].Floats[i],
                    strgGrid.Columns[_KolQtyRetur].Floats[i],
                    strgGrid.Columns[_KOlTransdID].Ints[i],
                    dialogunit,
                    sNoBukti) then
      begin
        CommonDlg.ShowError('QTY Baris Ke ' + IntToStr(i)+ ' Tidak Cukup'
                            +#13 + 'Cek Transaksi Retur Nota Lainnya');
        Exit;
      end;


      IsMasuk := True;
      LReturNota.ClearProperties;
      LReturNota.UpdateData(
        dialogunit,
        strgGrid.Columns[_KolBrgCode].Rows[i],
        1,
        dtRetur,
        edtReturNote.Text,
        sNoBukti + '-' + StrPadLeft(IntToStr(i),2,'0'),
        strgGrid.Columns[_KolHargaDisc].Floats[i],
        strgGrid.Columns[_KolQtyRetur].Floats[i],
        edtNoTrans.Text,
        dialogunit,
        dialogunit,
        False ,
        strgGrid.Columns[_KolUOM].Rows[i],
        strgGrid.Columns[_KolPPN].Floats[i],
        0,
        strgGrid.Columns[_KOlTransdID].Ints[i],
        dialogunit,
        strgGrid.Columns[_KolDiscAMC].Floats[i]
        );

      if not LReturNota.SaveToDB then
      begin
        cRollbackTrans;
        CommonDlg.ShowError('Gagal Menyimpan Data');
        Exit;
      end;
    end;

    if IsMasuk then
    begin
      cCommitTrans;
      if CommonDlg.Confirm('Berhasil Menyimpan Data, Apakah Anda Akan Mencetak Slip?') = mrYES then
      begin
        DoSlipReturNota(edtNoTrans.Text, dialogunit, FLoginFullname, FDialogUnitName, sNoBukti);
      end;

      Close;
    end else begin
      CommonDlg.ShowMessage('Tidak Ada Data Yang Disimpan');
    end;
  finally
    LReturNota.Free;
    FreeAndNil(lUnit);
    cRollbackTrans;
  end;
    }
end;

function TfrmDialogReturNota.IsAdaDataDouble: Boolean;
var
  j: Integer;
  i: Integer;
begin
  Result := False;
  {
  for i := 1 to strgGrid.RowCount - 1 do
  begin
    strgGrid.Row := i;
    for j := i + 1 to strgGrid.RowCount - 1 do
    begin
      if (strgGrid.Cells[_KOlTransdID,i] = strgGrid.Cells[_KOlTransdID,j]) then
      begin
        Result := True;
        Exit;
      end;
    end;
  end;
  }
end;

function TfrmDialogReturNota.IsQtyCukup(aMaxQty : Double; aQty : Double ;
    aTransdID : Integer; aUnitID : Integer; aExcludeNoBukti :String): Boolean;
var
  dQTYSdhRetur: Double;
  sSQL: string;
begin
  Result := True;
  sSQL   := 'select sum(transret_qty) as QTY'
            + ' from transaksi_retur_nota'
            + ' where transret_transd_id = ' + IntToStr(aTransdID)
            + ' and transret_no not like ' + QuotedStr(aExcludeNoBukti);
  {with cOpenQuery(sSQL) do
  begin
    try
      dQTYSdhRetur := 0;
      if not FieldByName('qty').IsNull then
        dQTYSdhRetur := FieldByName('qty').AsFloat;
    finally
      Free;
    end;
  end;
  }
  if (dQTYSdhRetur + aQty) > aMaxQty then
    Result := False;
end;

end.






