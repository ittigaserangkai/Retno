unit ufraStockCard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DateUtils, Math, ComCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxLabel, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, uAppUtils;

type
  TfraStockCard = class(TFrame)
    pnl4: TPanel;
    pnl1: TPanel;
    cbbBulan: TComboBox;
    lbl1: TLabel;
    pnl2: TPanel;
    lblClose: TcxLabel;
    btnRefresh: TButton;
    Label1: TLabel;
    lblUOM: TLabel;
    btnCetak: TButton;
    cxGridViewToko: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid: TcxGrid;
    cxGridLevel2: TcxGridLevel;
    cxGridViewBonus: TcxGridDBTableView;
    cxGridViewTokoColumn1: TcxGridDBColumn;
    cxGridViewTokoColumn2: TcxGridDBColumn;
    cxGridViewTokoColumn3: TcxGridDBColumn;
    cxGridViewTokoColumn4: TcxGridDBColumn;
    cxGridViewTokoColumn5: TcxGridDBColumn;
    cxGridViewTokoColumn6: TcxGridDBColumn;
    cxGridViewTokoColumn7: TcxGridDBColumn;
    cxGridViewTokoColumn8: TcxGridDBColumn;
    cxGridViewBonusColumn1: TcxGridDBColumn;
    cxGridViewBonusColumn2: TcxGridDBColumn;
    cxGridViewBonusColumn3: TcxGridDBColumn;
    cxGridViewBonusColumn4: TcxGridDBColumn;
    cxGridViewBonusColumn5: TcxGridDBColumn;
    cxGridViewBonusColumn6: TcxGridDBColumn;
    spnedtTahun: TcxSpinEdit;

    procedure lblCloseClick(Sender: TObject);
    procedure cbbBulanChange(Sender: TObject);
    procedure spnedtTahunKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnCetakClick(Sender: TObject);
  private
    FProductCode: string;
    { Private declarations }
    procedure ParseDataGrid();
    procedure SetProductCode(const Value: string);
    procedure SetAllValue;
  public
    FSelfUnitId: Integer;
    FSelfUsername : string;
    fselfFullname : string;
    procedure SetupSGHeader();
    procedure ShowStockCard(AProductCode: String);
    procedure UpdateDataSaldoAwal();
  published
    property ProductCode: string read FProductCode write SetProductCode;
  end;

var
  fraStockCard: TfraStockCard;

const
  _KolNoBukti       : Integer = 1;
//  _KolUOM           : Integer = 2;
  _KolTanggal       : Integer = 2;
  _KolTipeTransaksi : Integer = 3;
  _KolQtyMutasi     : Integer = 4;
  _KolQtySaldo      : Integer = 5;
  _KolRpMutasi      : Integer = 6;
  _KolRpSaldo       : Integer = 7;
  _kolGudangAsal    : Integer = 8;
  _kolGudangTujuan  : Integer = 9;

implementation

uses uConn, ufrmProduct, uRetnounit;

{$R *.dfm}

procedure TfraStockCard.lblCloseClick(Sender: TObject);
begin
  fraStockCard.Parent := nil;  
  frmProduct.SetActiveFooter5Button(True);
end;

procedure TfraStockCard.SetAllValue;
begin
  {
  if not assigned(StockCard) then
    StockCard := TStockCard.Create;
  with StockCard do
  begin
    PeriodeBulan:= cbbBulan.ItemIndex+1;
    PeriodeTahun:= Floor(spnedtTahun.Value);
    Stock:= cbbStockFor.Text;
    ProductCode:= Self.ProductCode;
    UnitId := MasterNewUnit.ID;
    intedtBeginning.Value:= ValueBeginning;
    intedtReceiving.Value:= ValueReceiving;
    intedtTransferIn.Value:= ValueTransferIn;
    intedtCN.Value:= ValueCN;
    intedtDN.Value:= ValueDN;
    intedtRetur.Value:= ValueRetur;
    intedtSales.Value:= ValueSales;
    intedtTransferOut.Value:= ValueTransferOut;
    intedtWastage.Value:= ValueWastage;
    intedtAdjustment.Value := ValueAdjustment;
    intedtStockOpname.Value := ValueStockOpname;
    intedtEnding.Value:= ValueEnding;
  end;
  }
end;

procedure TfraStockCard.ParseDataGrid;
//var //data  : TResultDataSet;
    //i     : Integer;
begin
  {with strgGrid do
  begin
    Clear;
    RowCount := 2;
    ColCount := 4;
    Cells[0,0] := 'DATE';
    Cells[1,0] := 'IN';
    Cells[2,0] := 'OUT';
    Cells[3,0] := 'SALDO';
    Assert(StockCard <> nil);

    data:= StockCard.GetListStockCard;
    if not data.IsEmpty then
      with data do
      begin
        RowCount:= data.RecordCount+1;
        i:=1;
        while not Eof do
        begin
          Cells[0,i] := FormatDateTime('dd MMMM yyyy', fieldbyname('PSC_DATE').AsDateTime);
          if cbbStockFor.Text='All' then
          begin
            Cells[1,i] := FloatToStr(data.fieldbyname('PSC_QTY_IN').AsFloat);
            Cells[2,i] := FloatToStr(data.fieldbyname('PSC_QTY_OUT').AsFloat);
            Cells[3,i] := FloatToStr(data.fieldbyname('PSC_QTY_SALDO').AsFloat);
          end
          else if cbbStockFor.Text='Common' then
          begin
            Cells[1,i] := FloatToStr(data.fieldbyname('PSC_QTY_COMMON_IN').AsFloat);
            Cells[2,i] := FloatToStr(data.fieldbyname('PSC_QTY_COMMON_OUT').AsFloat);
            Cells[3,i] := FloatToStr(data.fieldbyname('PSC_QTY_SALDO_COMMON').AsFloat);
          end
          else if cbbStockFor.Text='Trader' then
          begin
            Cells[1,i] := FloatToStr(data.fieldbyname('PSC_QTY_TRADER_IN').AsFloat);
            Cells[2,i] := FloatToStr(data.fieldbyname('PSC_QTY_TRADER_OUT').AsFloat);
            Cells[3,i] := FloatToStr(data.fieldbyname('PSC_QTY_SALDO_TRADER').AsFloat);
          end
          else if cbbStockFor.Text='Asgross' then
          begin
            Cells[1,i] := FloatToStr(data.fieldbyname('PSC_QTY_ASSGROS_IN').AsFloat);
            Cells[2,i] := FloatToStr(data.fieldbyname('PSC_QTY_ASSGROS_OUT').AsFloat);
            Cells[3,i] := FloatToStr(data.fieldbyname('PSC_QTY_SALDO_ASSGROS').AsFloat);
          end;

          Cells[4,i] := fieldbyname('PSC_DOC_NO').AsString;
          Cells[5,i] := fieldbyname('PSC_TRANS_TYPE').AsString;
          Cells[6,i] := fieldbyname('PSC_DESCRIPTION').AsString;
          Inc(i);
          Next;
        end;
      end;
    AutoSize:= True;
    OnClick(Self);
  end;
  }
end;

procedure TfraStockCard.SetProductCode(const Value: string);
begin
  FProductCode := Value;
end;

procedure TfraStockCard.ShowStockCard(AProductCode: String);
begin
  cbbBulan.ItemIndex  := MonthOf(Now)-1;
  spnedtTahun.Value   := YearOf(Now);
  SetAllValue;
  ParseDataGrid;
  cbbBulan.SetFocus;

//  SetupSGHeader(advstrngrdNonBonus);
//  SetupSGHeader(advstrngrdBonus);

  btnRefreshClick(nil);
end;

procedure TfraStockCard.cbbBulanChange(Sender: TObject);
begin
  SetAllValue;
  ParseDataGrid;
end;

procedure TfraStockCard.spnedtTahunKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    SetAllValue;
    ParseDataGrid;
  end;
end;

procedure TfraStockCard.btnRefreshClick(Sender: TObject);
var
//  Grd: TAdvStringGrid;
  iBaris: Integer;
  dtAkhir: TDateTime;
  dtAwal: TDateTime;
  sSQL: String;
begin
//  ClearAdvStringGrid(advstrngrdNonBonus);
//  ClearAdvStringGrid(advstrngrdBonus);
  dtAwal := StartOfAMonth(Floor(spnedtTahun.Value),cbbBulan.ItemIndex + 1);
  dtAkhir := EndOfTheMonth(dtAwal);

//  sSQL := 'select NOBUKTI,TIPETRANSAKSI,ISBONUSFORBONUS, TANGGAL, Qty,RUPIAH'
//          + ' from SP_KARTOK(' + Quot(frmProduct.cbpProductCode.Text) + ',' + IntToStr(MasterNewUnit.ID) + ',' + QuotD(dtAwal) + ',' + QuotD(dtAkhir) + ')';

sSQL := 'select NOBUKTI,TIPETRANSAKSI,ISBONUSFORBONUS, TANGGAL, Qty,RUPIAH,'
      + ' e.UNT_CODE AS UNITSRC, C.GUD_NAME AS "GUDSRC",'
      + ' f.UNT_CODE AS UNITDES, d.GUD_NAME AS "GUDDES"'
      + ' from SP_KARTOK(' + QuotedStr(frmProduct.cbpProductCode.Text) + ','
      + IntToStr(FSelfUnitId) + ',' + TAppUtils.QuotD(dtAwal) + ',' + TAppUtils.QuotD(dtAkhir)
      + ') a'
      + ' left join MUTASI_STOK b on a.nobukti = b.MSTOK_NO'
      + ' and b.MSTOK_UNT_ID = '+ IntToStr(FSelfUnitId)
      + ' left join GUDANG c on c.GUD_ID = b.MSTOK_SRC_GUD_ID'
      + ' and c.GUD_UNT_ID = b.MSTOK_SRC_GUD_UNT_ID'
      + ' left join gudang d on d.GUD_ID = b.MSTOK_DES_GUD_ID'
      + ' and d.GUD_UNT_ID = b.MSTOK_DES_GUD_UNT_ID'
      + ' left join AUT$UNIT e on c.GUD_UNT_ID = e.UNT_ID'
      + ' left join AUT$UNIT f on d.GUD_UNT_ID = f.UNT_ID';
{
  with cOpenQuery(sSQL) do
  begin
    try
      while not Eof do
      begin
        if (FieldByName('ISBONUSFORBONUS').AsInteger = 0) or (FieldByName('ISBONUSFORBONUS').IsNull)  then
          Grd := advstrngrdNonBonus
        else
          Grd := advstrngrdBonus;

        iBaris := Grd.RowCount - 1;
        with Grd do
        begin
          Cells[_KolNoBukti,iBaris]       := FieldByName('NOBUKTI').AsString;
          Cells[_KolTanggal,iBaris]       := FormatDateTime('DD/MM/YYYY hh:mm:ss', FieldByName('TANGGAL').AsDateTime);
          Cells[_KolTipeTransaksi,iBaris] := FieldByName('TIPETRANSAKSI').AsString;
          Cells[_KolQtyMutasi,iBaris]     := FormatFloat('0.000',FieldByName('Qty').AsFloat);
          Cells[_KolRpMutasi,iBaris]      := FormatFloat('0.000',FieldByName('Rupiah').AsFloat);

          if FieldByName('UNITSRC').AsString <> '' then
          begin
            Cells[_kolGudangAsal, iBaris]   := FieldByName('UNITSRC').AsString
                                          + ', '
                                          + FieldByName('GUDSRC').AsString;
            Cells[_kolGudangTujuan, iBaris] := FieldByName('UNITDES').AsString
                                          + ', '
                                          + FieldByName('GUDDES').AsString;
          end;
          Grd.AddRow;
        end;

        Next;
      end;

      UpdateDataSaldoAwal(advstrngrdNonBonus);
      UpdateDataSaldoAwal(advstrngrdBonus);
    finally
      advstrngrdNonBonus.AutoSizeColumns(True, 15);
      advstrngrdBonus.AutoSizeColumns(True, 15);
      advstrngrdNonBonus.ColWidths[0] := 0;
      advstrngrdBonus.ColWidths[0]    := 0;
      advstrngrdNonBonus.ColWidths[_KolRpMutasi] := 150;
      advstrngrdNonBonus.ColWidths[_KolRpSaldo]  := 150;
      advstrngrdBonus.ColWidths[_KolRpMutasi]    := 150;
      advstrngrdBonus.ColWidths[_KolRpSaldo]     := 150;
      frmProduct.actRefreshProductExecute(Self);
      lblUOM.Caption := frmProduct.edtUOMStockCode.Text;
      Free;
    end;
  end;
  }
end;

procedure TfraStockCard.SetupSGHeader();
begin
{  with aSG do
  begin
    aSG.Cells[0,0]                  := 'No Bukti';
    aSG.Cells[_KolNoBukti,0]        := 'No Bukti';
    aSG.Cells[_KolTanggal,0]        := 'Tanggal';
    aSG.Cells[_KolTipeTransaksi,0]  := 'Tipe Transaksi';
    aSG.Cells[_KolQtyMutasi,0]      := 'Qty';
    aSG.Cells[_KolRpMutasi,0]       := 'Rupiah';

    aSG.Cells[_KolQtyMutasi,1]      := 'Qty';
    aSG.Cells[_KolRpMutasi,1]       := 'Rp';

    aSG.Cells[_KolQtySaldo,1]      := 'Saldo';
    aSG.Cells[_KolRpSaldo,1]       := 'Saldo';

    aSG.MergeCells(_kolGudangAsal,0,2,1);
    aSG.Cells[_kolGudangAsal,0]    := 'Mutasi';
    aSG.Cells[_kolGudangAsal,1]    := 'Asal';
    aSG.Cells[_kolGudangTujuan,1]  := 'Tujuan';

    aSG.MergeCells(_KolNoBukti,0,1,2);
    aSG.MergeCells(_KolTanggal,0,1,2);
    aSG.MergeCells(_KolTipeTransaksi,0,1,2);

    aSG.MergeCells(_KolQtyMutasi,0,2,1);
    aSG.MergeCells(_KolRpMutasi,0,2,1);

    aSG.ColWidths[_KolRpMutasi] := 150;
    aSG.ColWidths[_KolRpSaldo]  := 150;

  end;  }
end;

procedure TfraStockCard.UpdateDataSaldoAwal();
var
  dMutasi: Double;
  dSaldo: Double;
  i: Integer;
begin
  {for i := aSG.FixedRows to aSG.RowCount - 1 do
  begin
    if i = aSG.FixedRows then
    begin
      aSG.Cells[_KolQtySaldo,i] := aSG.Cells[_KolQtyMutasi,i];
      aSG.Cells[_KolRpSaldo,i]  := aSG.Cells[_KolRpMutasi,i];
    end else begin
      TryStrToFloat(aSG.Cells[_KolQtySaldo,i - 1], dSaldo);
      TryStrToFloat(aSG.Cells[_KolQtyMutasi,i], dMutasi);
      aSG.Cells[_KolQtySaldo,i] := FormatFloat('0.000',(dsaldo + dMutasi));

      TryStrToFloat(aSG.Cells[_KolRpSaldo,i - 1], dSaldo);
      TryStrToFloat(aSG.Cells[_KolRpMutasi,i], dMutasi);
      aSG.Cells[_KolRpSaldo,i]  := FloatToStr(dsaldo + dMutasi);
    end;
    if (Trim(aSG.Cells[_KolNoBukti,i]) = '') and (Trim(aSG.Cells[_KolQtySaldo,i]) <> '') then
      aSG.Rows[i].Clear;

  end; }
end;

procedure TfraStockCard.btnCetakClick(Sender: TObject);
var
  sSQL: String;
  dtAkhir: TDateTime;
  dtAwal: TDateTime;
begin
dtAwal := StartOfAMonth(Floor(spnedtTahun.Value),cbbBulan.ItemIndex + 1);
dtAkhir := EndOfTheMonth(dtAwal);
sSQL := 'select NOBUKTI,TIPETRANSAKSI,ISBONUSFORBONUS, TANGGAL, Qty,RUPIAH,'
      + ' e.UNT_CODE AS UNITSRC, C.GUD_NAME AS "GUDSRC",'
      + ' f.UNT_CODE AS UNITDES, d.GUD_NAME AS "GUDDES",'+ QuotedStr(lblUOM.Caption) + ' AS "UOM", '
      + QuotedStr(cbbBulan.Text) + ' AS "BULAN", '
      + QuotedStr(spnedtTahun.Text) + ' AS "TAHUN" '
      + ' from SP_KARTOK(' + QuotedStr(frmProduct.cbpProductCode.Text) + ','
      + IntToStr(FSelfUnitId) + ',' + TAppUtils.QuotD(dtAwal) + ',' + TAppUtils.QuotD(dtAkhir)
      + ') a'
      + ' left join MUTASI_STOK b on a.nobukti = b.MSTOK_NO'
      + ' and b.MSTOK_UNT_ID = '+ IntToStr(FSelfUnitId)
      + ' left join GUDANG c on c.GUD_ID = b.MSTOK_SRC_GUD_ID'
      + ' and c.GUD_UNT_ID = b.MSTOK_SRC_GUD_UNT_ID'
      + ' left join gudang d on d.GUD_ID = b.MSTOK_DES_GUD_ID'
      + ' and d.GUD_UNT_ID = b.MSTOK_DES_GUD_UNT_ID'
      + ' left join AUT$UNIT e on c.GUD_UNT_ID = e.UNT_ID'
      + ' left join AUT$UNIT f on d.GUD_UNT_ID = f.UNT_ID';
//  GetExCompanyHeader(cGetServerTime, cGetServerTime,FSelfUnitId,
//                          FSelfUsername, fselfFullname);
//  dmReportNew.EksekusiReport('frfKartuStock',ssql,'',True);

end;


end.



