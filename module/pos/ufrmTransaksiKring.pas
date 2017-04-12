unit ufrmTransaksiKring;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uRetnoUnit, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxCurrencyEdit, cxTextEdit;

type
  TfrmTransaksiKring = class(TForm)
    pnlTotal: TPanel;
    lblTotal: TLabel;
    lbl2: TLabel;
    pnl1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    pnlFooter: TPanel;
    pnlInfo: TPanel;
    lblInfo: TLabel;
    Label4: TLabel;
    edNomorPO: TcxTextEdit;
    edNamaPelanggan: TcxTextEdit;
    edNomorDO: TcxTextEdit;
    tmrInfo: TTimer;
    Label3: TLabel;
    edNoTrnTerakhir: TcxCurrencyEdit;
    Label5: TLabel;
    edNoPelanggan: TcxTextEdit;
    cxTransaksi: TcxGrid;
    sgTransaksi: TcxGridDBTableView;
    cxcolNo: TcxGridDBColumn;
    cxcolPLU: TcxGridDBColumn;
    cxcolNamaBarang: TcxGridDBColumn;
    cxcolJumlah: TcxGridDBColumn;
    cxcolHarga: TcxGridDBColumn;
    cxcolDisc: TcxGridDBColumn;
    cxcolTotal: TcxGridDBColumn;
    cxcolIsDecimal: TcxGridDBColumn;
    grdlvlTransaksi: TcxGridLevel;
    procedure edNomorDOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure sgTransaksiCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure sgTransaksiGetFloatFormat(Sender: TObject; ACol,
      ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
    procedure tmrInfoTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FCCUoMs: TStrings;
    FTotalColie: Integer;
    FTotalRupiah: Currency;
    FTotalDiscAMC: Currency;
    FDiscAMC: Currency;
    FTotalRupiahBarangAMC: Currency;
    FTotalRupiahBarangCC: Currency;
    FServerDateTime: TDateTime;
    function GetCCUoMs: TStrings;
    { Private declarations }
  public
    procedure HideInfo;
    function HitungTotalRupiah: Currency;
    function IsCCUoM(AUoM: String): Boolean;
    procedure ResetTransaction;
    procedure SetupGridTransaksi;
    procedure ShowInfo(AInfo: String; ALabelColor: TColor = clRed;
        ABackgroundColor: TColor = clYellow);
    procedure ShowPayment;
    property CCUoMs: TStrings read GetCCUoMs write FCCUoMs;
    property TotalColie: Integer read FTotalColie write FTotalColie;
    property TotalRupiah: Currency read FTotalRupiah write FTotalRupiah;
    property TotalDiscAMC: Currency read FTotalDiscAMC write FTotalDiscAMC;
    property DiscAMC: Currency read FDiscAMC write FDiscAMC;
    property TotalRupiahBarangAMC: Currency read FTotalRupiahBarangAMC write
        FTotalRupiahBarangAMC;
    property TotalRupiahBarangCC: Currency read FTotalRupiahBarangCC write
        FTotalRupiahBarangCC;
    { Public declarations }
  end;

var
  frmTransaksiKring: TfrmTransaksiKring;

implementation

uses
  ufrmMain, uConstanta, Math, ufrmPaymentKring, ufrmTransaksi,
  ufrmPayment, StrUtils;

{$R *.dfm}

procedure TfrmTransaksiKring.edNomorDOKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  i: Integer;
  FDiscMember_ID, FDiscMember_Unt_ID : Integer;
  FMemMaxValue : double;
begin
  HideInfo;
  if Key in [VK_RETURN] then
  begin
    edNomorPO.Clear;
    edNamaPelanggan.Clear;
    edNoPelanggan.Clear;
    SetupGridTransaksi;

    {
    with TDO_ASSGROS.Create(Self) do
    begin
      try
        if LoadByDOAS_NO(edNomorDO.Text,frmMain.UnitID) then
        begin
          if DOAS_STATUS = 'RECEIPT' then
          begin
            edNomorPO.Text := DOAS_POAS_NO;
            edNoPelanggan.Text := DOAS_TRD.Kode;
            edNamaPelanggan.Text := DOAS_TRD.Nama;
            FDiscMember_ID     := DOAS_TRD.Member.FTPMember_ID;
            FDiscMember_Unt_ID := DOAS_TRD.unitID;
            DiscAMC            := 0;
            FMemMaxValue       := 0;
            with TDiscountMember.Create(Self) do
            begin
                try
                    if LoadByTypeDiscMemID(FDiscMember_ID, FDiscMember_Unt_ID, DOAS_TOTAL_RECIPT) then
                    begin
                       DiscAMC := DiscMemDiscount;
                       FMemMaxValue := DiscMemMaxVal;
                    end;
                finally
                   Free;
                end;
            end;

            TotalDiscAMC := 0;
            for i := 0 to DO_ASSGROS_DETILS.Count - 1 do    // Iterate
            begin
              with sgTransaksi do
              begin
                Columns[_KolPLU].Rows[RowCount-1]        := DO_ASSGROS_DETILS[i].DOASD_BRG_CODE;
                Columns[_KolNamaBarang].Rows[RowCount-1] := DO_ASSGROS_DETILS[i].DOASD_BRG.Alias;
                Columns[_KolUOM].Rows[RowCount-1]        := DO_ASSGROS_DETILS[i].DOASD_SAT_CODE;
                Columns[_KolIsMailer].Rows[RowCount-1]   := IntToStr(0);
                Columns[_KolJumlah].Floats[RowCount-1]   := DO_ASSGROS_DETILS[i].DOASD_QTY_RECEIPT;
                Columns[_KolHarga].Floats[RowCount-1]    := RoundTo(DO_ASSGROS_DETILS[i].DOASD_SELL_PRICE, igPrice_Precision);
                Columns[_KolDisc].Floats[RowCount-1]     := RoundTo(DO_ASSGROS_DETILS[i].DOASD_QTY_RECEIPT * RoundTo(DO_ASSGROS_DETILS[i].DOASD_SELL_PRICE - DO_ASSGROS_DETILS[i].DOASD_SELL_PRICE_DISC, igPrice_Precision), igPrice_Precision);
                Columns[_KolTotal].Floats[RowCount-1]    := RoundTo(DO_ASSGROS_DETILS[i].DOASD_SELL_PRICE_DISC, igPrice_Precision) * DO_ASSGROS_DETILS[i].DOASD_QTY_RECEIPT;
                TotalDiscAMC   := TotalDiscAMC + (DO_ASSGROS_DETILS[i].DOASD_DISC_MEMBER_RECEIPT * DO_ASSGROS_DETILS[i].DOASD_QTY_RECEIPT);
                RowCount := RowCount + 1;
              end;    // with
            end;    // for
            if TotalDiscAMC > FMemMaxValue then TotalDiscAMC := FMemMaxValue;
          end
          else
          if DOAS_STATUS = 'PAID' then
          begin
            ShowInfo('Nomor DO tersebut telah terbayar');
          end
          else
          if DOAS_STATUS = 'DELIVERED' then
          begin
            ShowInfo('Nomor DO tersebut belum direalisasi');
          end;
        end
        else
        begin
          ShowInfo('Nomor DO tersebut tidak ditemukan');
        end;
      finally
        Free;
        HitungTotalRupiah;
      end;
    end;    // with
    sgTransaksi.AutoNumberCol(0);
    }
  end
  else if Key in [VK_F9] then
  begin
    frmMain.mnPaymentClick(Sender);
    //ShowPayment;
  end;
end;

procedure TfrmTransaksiKring.SetupGridTransaksi;
begin
  {
  with sgTransaksi do
  begin
    UnHideColumnsAll;
    ClearRows(1,RowCount-1);
    RowCount                := 2;

    ColCount                := _ColCount;

    Cells[0,0]              := 'No';
    Cells[_KolPLU,0]        := 'PLU';
    Cells[_KolNamaBarang,0] := 'Nama Barang';
    Cells[_KolJumlah,0]     := 'Jumlah';
    Cells[_KolUOM,0]        := 'UoM';
    Cells[_KolHarga,0]      := 'Harga';
    Cells[_KolDisc,0]       := 'Disc';
    Cells[_KolTotal,0]      := 'Total';
    Cells[_KolIsDecimal,0]  := 'IsDecimal';
    Cells[_KolIsDiscGMC,0]  := 'IsDiscGMC';
    Cells[_KolIsMailer,0]   := 'IsMailer';
    Cells[_KolPPN,0]        := 'PPN';
    Cells[_KolPPNBM,0]      := 'PPNBM';
    Cells[_KolIsCharge,0]   := 'IsCharge';
    Cells[_KolMaxDiscQTY,0] := 'MaxDiscQTY';

    FixedRows := 1;
    FixedCols := 1;
    
    ColWidths[0]              := 32;
    ColWidths[_KolPLU]        := 10 + (10 * igProd_Code_Length);
    ColWidths[_KolNamaBarang] := 250;
    ColWidths[_KolJumlah]     := 45 + (10 * Abs(igQty_Precision));
    ColWidths[_KolUOM]        := 40;
    ColWidths[_KolHarga]      := 100 + (10 * Abs(igPrice_Precision));
    ColWidths[_KolDisc]       := 50 + (10 * Abs(igPrice_Precision));
    ColWidths[_KolTotal]      := 120;

    HideColumns(_KolIsDecimal, _ColCount);
  end;
  }
end;

procedure TfrmTransaksiKring.FormCreate(Sender: TObject);
begin
  SetupGridTransaksi;
//  FServerDateTime      := cGetServerDateTime;
  edNoTrnTerakhir.Text := frmMain.GetTransactionNo(frmMain.FPOSCode, FServerDateTime);
end;

procedure TfrmTransaksiKring.HideInfo;
begin
  if pnlInfo.Visible then
  begin
    lblInfo.Caption := '';
    tmrInfo.Enabled := False;
    pnlInfo.Visible := False;
  end;
end;

function TfrmTransaksiKring.HitungTotalRupiah: Currency;
var
  sPrec: string;
  i: Integer;
begin
  Result := 0;

  TotalRupiahBarangCC := 0;

  TotalRupiah := Result;
  {
  with sgTransaksi do
  begin
    for i := 1 to RowCount - 2 do    // Iterate
    begin
      if Columns[_KolPLU].Rows[i] = '' then Continue;

      Result := Result + (Columns[_KolTotal].Floats[i]);  //Ceil

      if (Columns[_KolIsMailer].Rows[i] = '1')
        or (IsCCUoM(Columns[_KolUoM].Rows[i])) then
        TotalRupiahBarangCC := TotalRupiahBarangCC + (Columns[_KolTotal].Floats[i]);//Ceil

    end;    // for
  end;    // with
   }
  TotalRupiah := Result;
  sPrec       := IfThen(igPrice_Precision<0, '.' + StringOfChar('0', Abs(igPrice_Precision)), '');
  lblTotal.Caption := 'Rp. ' + FormatCurr('#,##0' + sPrec,Result) + ' ';
  if DiscAMC > 0 then
     TotalRupiahBarangAMC := (TotalDiscAMC) * (100/DiscAMC)
  else
     TotalRupiahBarangAMC := 0;
end;

procedure TfrmTransaksiKring.sgTransaksiCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := False;
end;

procedure TfrmTransaksiKring.sgTransaksiGetFloatFormat(Sender: TObject;
  ACol, ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  if (ARow > 0) and (ACol > 0) then
  begin
    if ACol in [_KolJumlah] then
    begin
      FloatFormat := '%.' + IntToStr(Abs(igQty_Precision)) + 'n';
//      FloatFormat := '%.3n';
    end
    else if ACol in [_KolDisc] then
    begin
//      FloatFormat := '%.n';
      FloatFormat := '%.' + IntToStr(Abs(igPrice_Precision)) + 'n';
    end
    else if ACol in [_KolHarga, _KolTotal] then
    begin
      FloatFormat := '%.' + IntToStr(Abs(igPrice_Precision)) + 'n';
    end;
  end;
end;

procedure TfrmTransaksiKring.ShowInfo(AInfo: String; ALabelColor: TColor =
    clRed; ABackgroundColor: TColor = clYellow);
begin
  lblInfo.Caption    := AInfo;
  lblInfo.Font.Color := ALabelColor;
  pnlInfo.Color      := ABackgroundColor;
  tmrInfo.Enabled    := True;
  pnlInfo.Visible    := True;  
end;

procedure TfrmTransaksiKring.tmrInfoTimer(Sender: TObject);
begin
  lblInfo.Visible := not lblInfo.Visible;
end;

procedure TfrmTransaksiKring.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

function TfrmTransaksiKring.GetCCUoMs: TStrings;
var
  sSQL: string;
begin
  {
  try
    if FCCUoMs = nil then
    begin
      FCCUoMs := TStringList.Create;
      sSQL := 'select ccuom_sat_code '
        + ' from ccuom ';
      with cOpenQuery(sSQL) do
      begin
        try
          while not eof do
          begin
            FCCUoMs.Add(Fields[0].AsString);
            Next;
          end;
        finally
          Free;
        end;   
      end;                            
    end;
  except
  end;
   }
  Result := FCCUoMs;
end;

function TfrmTransaksiKring.IsCCUoM(AUoM: String): Boolean;
var
  i: Integer;
begin
  Result := False;

  for i := 0 to CCUoMs.Count - 1 do    // Iterate
  begin
    if UpperCase(CCUoMs[i]) = UpperCase(AUoM) then
    begin
      Result := True;
      Exit;
    end;  
  end;    // for
end;

procedure TfrmTransaksiKring.ResetTransaction;
begin
//  sgTransaksi.ClearRows(1,sgTransaksi.RowCount-2);
//  sgTransaksi.RowCount := 2;
  edNoTrnTerakhir.Text := frmMain.GetTransactionNo(frmMain.FPOSCode, FServerDateTime);
  HitungTotalRupiah;
  edNomorDO.Clear;
  edNomorPO.Clear;
  edNamaPelanggan.Clear;
  edNoPelanggan.Clear;
  edNomorDO.SetFocus;
end;

procedure TfrmTransaksiKring.ShowPayment;
begin
  if frmTransaksiKring <> nil then
  begin
    if (frmTransaksiKring.TotalRupiah > 0) then
    begin
      frmPaymentKring := (ShowForm(TfrmPaymentKring,wsMaximized)) as TfrmPaymentKring;
      frmPaymentKring.TotalBelanja := TotalRupiah;
      frmPaymentKring.TotalBarangCC := Self.TotalRupiahBarangCC;
      frmPaymentKring.DiscAMCRupiah := TotalDiscAMC;
      frmPaymentKring.DiscAMCPersen := DiscAMC;
      frmPaymentKring.TotalBarangAMC:= TotalRupiahBarangAMC;
      frmPaymentKring.ResetAll;
      frmPaymentKring.ShowTotalBayar;
    end;
  end;
end;

procedure TfrmTransaksiKring.FormDestroy(Sender: TObject);
begin
     frmTransaksiKring := nil;
end;

procedure TfrmTransaksiKring.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    Close;
  end
  else if (Key in [VK_F9]) and (Trim(sgTransaksi.datacontroller.values[_KolPLU, 1]) <> '') then
  begin
    ShowPayment;
  end;
end;

end.
