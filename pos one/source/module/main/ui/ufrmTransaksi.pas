unit ufrmTransaksi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, EnhEdit, Grids, ExtCtrls, BaseGrid, AdvGrid, AdvCGrid,
  uGTSUICommonDlg, ufraLookupBarang, ufraMember, ufrmPayment, Menus, Buttons,
  ActnList, DB, DBTables;
//  AdvEdBtn, AdvEdit, AdvMoneyEdit, JvComponent, JvEnterTab

type
  TfrmTransaksi = class(TForm)
    pnl1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edNoTrnTerakhir: TEnhancedEdit;
    edNoPelanggan: TEnhancedEdit;
    edNamaPelanggan: TEnhancedEdit;
    sgTransaksi: TAdvColumnGrid;
    lbl1: TLabel;
    lblHargaKontrabon: TLabel;
    edHargaKontrabon: TEnhancedEdit;
    pnlFooter: TPanel;
    btnHapus: TButton;
    btnBayar: TButton;
    btnReset: TButton;
    pnlTotal: TPanel;
    lblTotal: TLabel;
    lbl2: TLabel;
    pnlInfo: TPanel;
    lblInfo: TLabel;
    tmrInfo: TTimer;
    edPLU: TEdit;
    fraLookupBarang: TfraLookupBarang;
    fraMember: TfraMember;
    sgHeader: TAdvColumnGrid;
    lbl3: TLabel;
    pnlotorisasi: TPanel;
    lbl4: TLabel;
    lbl5: TLabel;
    bvl1: TBevel;
    lbl6: TLabel;
    edtUsername: TEdit;
    edtPassword: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    ActionList1: TActionList;
    procedure sgTransaksiGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure FormCreate(Sender: TObject);
    procedure edPLUKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tmrInfoTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edHargaKontrabonKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgTransaksiCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure sgTransaksiGetEditorType(Sender: TObject; ACol,
      ARow: Integer; var AEditor: TEditorType);
    procedure edPLUEnter(Sender: TObject);
    procedure edPLUExit(Sender: TObject);
    procedure sgTransaksiCellValidate(Sender: TObject; ACol, ARow: Integer;
      var Value: String; var Valid: Boolean);
    procedure sgTransaksiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edNoPelangganKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edNoPelangganExit(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnBayarClick(Sender: TObject);
    procedure sgTransaksiGetFloatFormat(Sender: TObject; ACol,
      ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure edtUsernameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelClick(Sender: TObject);
    procedure sgTransaksiDblClick(Sender: TObject);
    procedure sgTransaksiSelectCell(Sender: TObject; ACol, ARow: Integer; var
        CanSelect: Boolean);
  private
    FCCUoMs: TStrings;
		FDiscAMCPersen: Double;
    FIsEditMode: Boolean;
    FMemberCode: String;
    FTrMemberID: Integer;
    FProductCount: Double;
    FTipeMemberID: Integer;
    FTotalColie: Integer;
    FTotalRupiah: Currency;
		FTotalRupiahBarangAMC: Currency;
    FTotalRupiahBarangPPN: Currency;
    FTotalRupiahBarangCC: Currency;
    FServerDateTime    : TDatetime;
    FTotalRupiahBarangBKP: Currency;
    FTotalRupiahBarangDPP: Currency;
    FTotalRupiahBarangBebasPPN: Currency;
    FTotalRupiahBarangDiscount: Currency;
    sValueBefore: string;
    procedure CalculateManualDisc(var Value: String; var Valid: Boolean; Row:
        Integer);
    function GetCCUoMs: TStrings;
		function GetDiscAMCPersen: Double;
    procedure SaveTransactionToCSV(ASaveDetail: Boolean = true; ASaveHeader:
        Boolean = true);
    procedure SavePendingToCSV(AMemberCode: String);
//    procedure LoadPendingFromCSV(AMemberCode: String);
  public
    Transaksi_ID: Integer;
    Brs: Integer;
    DiscOto: double;
    sDiscManBefore: String;

    function FindInGrid(aPLU: String; aProductCount: Double; aUoM: String): Integer;
    procedure FocusToPLUEdit;
    function GetDefaultMember: String;
		function GetTotalHarga(ARow: Integer): Double;
    function GetSellPriceWithTax(ARow: Integer): Double;
    function GetDiscItemAMCRp(ARow: Integer): Double;
    function HitungTotalRupiah: Currency;
    procedure SetGridHeader_Transaksi;
    procedure ShowInfo(AInfo: String);
    procedure HideInfo;
		function HitungTotalRupiahBarangAMC: Currency;
    function HitungTotalRupiahBarangPPN: Currency;
    function HitungTotalRupiahBarangBKP: Currency;
    function HitungTotalRupiahBarangDPP: Currency;
    function HitungTotalRupiahBarangBebasPPN: Currency;
    function HitungTotalRupiahBarangDiscount: Currency;
    function IsCCUoM(AUoM: String): Boolean;
    function LoadByPLU(aPLU_Qty: String; aUoM: String = ''; aIsLookupActive:
        Boolean = True; aIsLoadFromPending: Boolean = False; aDiscMan: Double = 0;
        aDiscOto: string = ''): Integer;
    procedure LoadMember(AMemberNo: String);
    procedure ResetTransaction;
    function SaveToDBPending: Boolean;
    procedure ShowPayment;
    procedure ActiveGrid;
    property CCUoMs: TStrings read GetCCUoMs write FCCUoMs;
		property DiscAMCPersen: Double read GetDiscAMCPersen write FDiscAMCPersen;
    property MemberCode: String read FMemberCode write FMemberCode;
    property TrMemberID: Integer read FTrMemberID write FTrMemberID;
    property TotalColie: Integer read FTotalColie write FTotalColie;
    property TotalRupiah: Currency read FTotalRupiah write FTotalRupiah;
		property TotalRupiahBarangAMC: Currency read FTotalRupiahBarangAMC write
				FTotalRupiahBarangAMC;
    property TotalRupiahBarangPPN: Currency read FTotalRupiahBarangPPN write
        FTotalRupiahBarangPPN;
    property TotalRupiahBarangBKP: Currency read FTotalRupiahBarangBKP write
        FTotalRupiahBarangBKP;
    property TotalRupiahBarangDPP: Currency read FTotalRupiahBarangDPP write
        FTotalRupiahBarangDPP;
    property TotalRupiahBarangBebasPPN: Currency read FTotalRupiahBarangBebasPPN write
        FTotalRupiahBarangBebasPPN;
    property TotalRupiahBarangDiscount: Currency read FTotalRupiahBarangDiscount write
        FTotalRupiahBarangDiscount;
    property TotalRupiahBarangCC: Currency read FTotalRupiahBarangCC write
        FTotalRupiahBarangCC;
  end;

var
  frmTransaksi: TfrmTransaksi;

implementation

uses
  uNewBarang, ufrmMain, uNewBarangHargaJual, Math, uRMSUnit, uConstanta,
  StrUtils, uPosTransaction, uDiscountMember;
//  ufrmLookupBarang, uNewPajak

{$R *.dfm}

procedure TfrmTransaksi.SetGridHeader_Transaksi;
begin
  with sgTransaksi do
  begin
    UnHideColumnsAll;
    ColCount := _ColCount;

    Cells[0,0]                := 'No';
    Cells[_KolPLU,0]          := 'PLU';
    Cells[_KolNamaBarang,0]   := 'Nama Barang';
    Cells[_KolJumlah,0]       := 'Jumlah';
    Cells[_KolUOM,0]          := 'UoM';
    Cells[_KolHarga,0]        := 'Harga';
    Cells[_KolDisc,0]         := 'Disc';
    Cells[_KolDiscMan,0]      := 'Manual Disc';
    Cells[_KolDiscManForm,0]  := 'Manual Disc';
    Cells[_KolTotal,0]        := 'Total';
    Cells[_KolIsDecimal,0]    := 'IsDecimal';
    Cells[_KolIsDiscGMC,0]    := 'IsDiscGMC';
    Cells[_KolIsMailer,0]     := 'IsMailer';
    Cells[_KolPPN,0]          := 'PPN';
    Cells[_KolPPNBM,0]        := 'PPNBM';
    Cells[_KolIsCharge,0]     := 'IsCharge';
    Cells[_KolCOGS,0]         := 'COGS';
    Cells[_KolLastCost,0]     := 'LastCost';
    Cells[_KolIsBKP,0]        := 'IsBKP';
    Cells[_KolBHJID,0]        := 'BHJID';
    Cells[_KolHargaExcPajak,0]:= 'HargaExcPajak';
    Cells[_KolTipeBarang,0]   := 'TipeBarang';
    Cells[_KolHargaAvg,0]     := 'HargaAvg';
    Cells[_KolMaxDiscQTY,0]   := 'MaxDiscQTY';
    Cells[_KolPairCode,0]     := 'PairCode';
    Cells[_KolIsGalon,0]      := 'IsGalon';
    Cells[_KolDetailID,0]     := 'DetailID';
    Cells[_Koldiscoto,0]      := 'Otorisasi';
    Cells[_KolIsKontrabon,0]  := 'IsKontrabon';

    {$IFDEF TSN}
    Cells[_KolDiscP,0]      := 'Disc %';
    {$ENDIF}

    FixedRows := 1;

    ColWidths[0]              := 32;
    ColWidths[_KolPLU]        := 10 + (10 * igProd_Code_Length);
    ColWidths[_KolNamaBarang] := 250;
    ColWidths[_KolJumlah]     := 50 + (10 * Abs(igQty_Precision));
    ColWidths[_KolUOM]        := 40;
    ColWidths[_KolHarga]      := 100 + (10 * Abs(igPrice_Precision));
    ColWidths[_KolDisc]       := 50 + (10 * Abs(igPrice_Precision));
    //ColWidths[_KolDiscMan]    := 80 + (10 * Abs(igPrice_Precision));
    ColWidths[_KolDiscManForm]    := 80 + (10 * Abs(igPrice_Precision));
    ColWidths[_KolTotal]      := 120;

  end;
end;

procedure TfrmTransaksi.sgTransaksiGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then
  begin
    HAlign := taCenter;
  end
  else
  begin
    if ACol in [0,_KolJumlah,_KolHarga,_KolDisc,_KolDiscMan,_KolTotal,_KolDiscManForm] then
      HAlign := taRightJustify
    else
      HAlign := taLeftJustify;
  end;
end;

procedure TfrmTransaksi.FormCreate(Sender: TObject);
begin
  try
//    if FileExists(cGetAppPath + 'trans_header.csv') then
//    begin
//      sgHeader.LoadFromCSV(cGetAppPath + 'trans_header.csv');
//      edNoPelanggan.Text := sgHeader.Cells[0,0];
//    end;
//    if FileExists(cGetAppPath + 'trans_detail.csv') then
//    begin
//	    sgTransaksi.LoadFromCSV(cGetAppPath + 'trans_detail.csv');
//  	  sgTransaksi.AutoNumberCol(0);
//    	HitungTotalRupiah;
//    end;

//    if (edNoPelanggan.Text = '') or (edNoPelanggan.Text = '0') then
//      LoadMember(GetDefaultMember)
//    else
//      LoadMember(edNoPelanggan.Text);

//    LoadPendingFromCSV(edNoPelanggan.Text);
    FServerDateTime      := cGetServerDateTime;
    edNoTrnTerakhir.Text := frmMain.GetTransactionNo(frmMain.FPOSCode, FServerDateTime);
  finally
    SetGridHeader_Transaksi;
    edPLU.Text := '';
  end;
end;

procedure TfrmTransaksi.edPLUKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  HideInfo;
  if(Key = VK_ESCAPE)then
  begin
    edPLU.Text := '';
    edNoPelanggan.SetFocus;
    Exit;
  end
  else
  if (Key = VK_UP) then
  begin
    sgTransaksi.SetFocus;
    sgTransaksi.Col := _KolJumlah;
    sgTransaksi.Row := sgTransaksi.RowCount - 2;
  end
  else
  if (Key = VK_F5) then
  begin
    sgTransaksi.Visible := False;
    pnlFooter.Visible := False;
    with fraLookupBarang do
    begin
      UnitID  := frmMain.UnitID;
      Align   := alClient;
      Visible := True;
      SetPanelHeaderEnable(True);
      edNamaBarang.SetFocus;
      edNamaBarang.SelectAll;
    end;    // with
  end
  else if Key = VK_F12 then
  begin
    btnResetClick(btnReset);
  end
  else
  if(Key = VK_RETURN)and(edPLU.Text <> '') then
  begin
    edPLU.Enabled := False;
		LoadByPLU(edPLU.Text);
//    edPLU.Enabled := True;
    if (not edHargaKontrabon.Focused) and (not fraLookupBarang.Showing) then
      begin
         edPLU.Enabled := True;
         edPLU.SetFocus
      end
    else
    if (fraLookupBarang.Showing) then
       fraLookupBarang.sgBarang.SetFocus;

  end
  else
  if Key in [VK_F9] then
  begin
    //ShowForm(TfrmPayment,wsMaximized);
    ShowPayment;
  end
  else
  if (Key in [Ord('P'), Ord('p')]) and (ssShift in Shift) and (ssCtrl in Shift)then
  begin
    if sgTransaksi.Cells[_KolPLU,1] = '' then Exit;
    if not SaveToDBPending then
    begin
         CommonDlg.ShowError('Gagal menyimpan Transaksi Pending !');
    end;
    btnResetClick(Sender);

  end;

end;

function TfrmTransaksi.HitungTotalRupiah: Currency;
var
  sPrec: string;
  i: Integer;
begin
  Result               := 0;
  TotalRupiahBarangAMC := 0;
  TotalRupiahBarangCC  := 0;
  TotalColie           := 0;
  TotalRupiah          := 0;

  with sgTransaksi do
  begin
    for i := 1 to RowCount - 1 do    // Iterate
    begin
      if Columns[_KolPLU].Rows[i] = '' then Continue;

      Result := Result + (Columns[_KolTotal].Floats[i]); //Ceil
      TotalColie := TotalColie + Round(Columns[_KolJumlah].Floats[i]);

      if (Columns[_KolIsDiscGMC].Rows[i] = '1')
        and (Columns[_KolJumlah].Floats[i] <= Columns[_KolMaxDiscQTY].Floats[i]) then
      begin
				TotalRupiahBarangAMC := TotalRupiahBarangAMC + (Columns[_KolTotal].Floats[i]); //Ceil
      end;

      if (Columns[_KolIsMailer].Rows[i] = '1')
        or (IsCCUoM(Columns[_KolUoM].Rows[i])) then
				TotalRupiahBarangCC := TotalRupiahBarangCC + (Columns[_KolTotal].Floats[i]); //Ceil
    end;    // for
  end;    // with

  TotalRupiah := Result;
  sPrec       :=  IfThen(igPrice_Precision<0, '.' + StringOfChar('0', Abs(igPrice_Precision)), '');
  lblTotal.Caption := 'Rp. ' + FormatCurr('#,##0'+sPrec, Result) + ' ';
end;

procedure TfrmTransaksi.ShowInfo(AInfo: String);
begin
  lblInfo.Caption := AInfo;
  tmrInfo.Enabled := True;
  pnlInfo.Visible := True;
end;

procedure TfrmTransaksi.HideInfo;
begin
  if pnlInfo.Visible then
  begin
    lblInfo.Caption := '';
    tmrInfo.Enabled := False;
    pnlInfo.Visible := False;
  end;
end;

procedure TfrmTransaksi.tmrInfoTimer(Sender: TObject);
begin
  lblInfo.Visible := not lblInfo.Visible;
end;

procedure TfrmTransaksi.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  if CommonDlg.Confirm('Apakah Anda ingin menutup form ' + Self.Caption + '?') = mrYes then
//  begin
    Action := caFree;
//  end
//  else
//  begin
//    Action := caNone;
//  end;
end;

procedure TfrmTransaksi.FormShow(Sender: TObject);
begin
  {$IFDEF RMS}
  sgTransaksi.HideColumn(_KolDiscMan);
  {$ENDIF}
  sgTransaksi.HideColumns(_KolIsDecimal, _ColCount);
  if (edNoPelanggan.Text = '') or (edNoPelanggan.Text = '0') then
    LoadMember(GetDefaultMember)
  else
    LoadMember(edNoPelanggan.Text);

  sValueBefore := '';
end;

procedure TfrmTransaksi.edHargaKontrabonKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if sgTransaksi.Cells[_KolPLU, sgTransaksi.RowCount-1] <> '' then
     sgTransaksi.Row := sgTransaksi.RowCount-1
  else
     sgTransaksi.Row := sgTransaksi.RowCount-2;

  if (Key = VK_RETURN)
  	and (edHargaKontrabon.Text <> '')
    and (edHargaKontrabon.Text <> '0')
    and (edHargaKontrabon.Value <> 0) then
  begin
    HideInfo;
    with sgTransaksi do
    begin
      Columns[_KolHargaExcPajak].Floats[Row] := RoundTo((edHargaKontrabon.Value / 1.1), igPrice_Precision);
      Columns[_KolHarga].Floats[Row]   := RoundTo(edHargaKontrabon.Value, igPrice_Precision);
//      Columns[_KolHarga].Floats[Row] := GetSellPriceWithTax(Row);
      Columns[_KolTotal].Floats[Row]   := GetTotalHarga(Row);

      lblHargaKontrabon.Visible := False;
      edHargaKontrabon.Visible  := False;
      sgTransaksi.Enabled       := True;
      edPLU.Enabled             := True;
      if Row = (RowCount-1) then
         RowCount := RowCount + 1;
      Row := RowCount - 1;
      AutoNumberCol(0);
      HitungTotalRupiah;
      edHargaKontrabon.Text := '0';
      edPLU.Clear;
      FocusToPLUEdit;
      SaveTransactionToCSV;
    end;    // with
  end
  else if (Key = VK_RETURN)
  	and ((edHargaKontrabon.Text = '')
    or (edHargaKontrabon.Text = '0')
    or (edHargaKontrabon.Value = 0)) then
  begin
    ShowInfo('Harga tidak valid');
  end;
end;

procedure TfrmTransaksi.sgTransaksiCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  if (ACol in [_KolJumlah,_KolDiscMan,_KolDiscManForm]) and (sgTransaksi.Cells[_KolPLU,ARow] <> '') then
    CanEdit := True
  else
    CanEdit := False;
end;

procedure TfrmTransaksi.sgTransaksiGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
  if (ACol = _KolJumlah) or (ACol = _KolDiscMan)  then
    AEditor := edFloat;
end;

procedure TfrmTransaksi.edPLUEnter(Sender: TObject);
begin
  edPLU.Color := clYellow;
end;

procedure TfrmTransaksi.edPLUExit(Sender: TObject);
begin
  edPLU.Color := clWindow;
end;

function TfrmTransaksi.FindInGrid(aPLU: String; aProductCount: Double; aUoM:
    String): Integer;
var
	i: Integer;
begin
	Result := 0;

  for i := 1 to sgTransaksi.RowCount - 1 do
  begin
    if (sgTransaksi.Cells[_KolPLU,i] = aPLU)
    and (sgTransaksi.Cells[_KolUOM,i] = aUoM) then
    begin
      sgTransaksi.Columns[_KolJumlah].Floats[i] := sgTransaksi.Columns[_KolJumlah].Floats[i] + AProductCount;
      sgTransaksi.Columns[_KolTotal].Floats[i] := GetTotalHarga(i);
      HitungTotalRupiah;
      Result := i;
      Break;
    end;
  end;
end;

procedure TfrmTransaksi.FocusToPLUEdit;
begin
  if edPLU.Enabled then
  begin
    edPLU.SetFocus;
    edPLU.SelectAll;
  end;
end;

function TfrmTransaksi.GetDefaultMember: String;
begin
  Result := '';
  Result := getGlobalVar('POS_DEF_CUST');
end;

function TfrmTransaksi.GetTotalHarga(ARow: Integer): Double;
var
	dTotalHargaGross: Double;
begin
//	Result := 0;
  with sgTransaksi do
  begin
    dTotalHargaGross := (Columns[_KolHarga].Floats[ARow] * Columns[_KolJumlah].Floats[ARow]);
    Result := RoundTo(dTotalHargaGross - (Columns[_KolDisc].Floats[ARow] * Columns[_KolJumlah].Floats[ARow]) - (Columns[_KolDiscMan].Floats[ARow] * Columns[_KolJumlah].Floats[ARow]) , igPrice_Precision); //Ceil

{
	  Result := (((100 - Columns[_KolDisc].Floats[ARow])/100) * dTotalHargaGross) +
    	((dTotalHargaGross * Columns[_KolPPN].Floats[ARow]) / 100) +
    	((dTotalHargaGross * Columns[_KolPPNBM].Floats[ARow]) / 100);
}
	end;
end;

function TfrmTransaksi.GetSellPriceWithTax(ARow: Integer): Double;
var
  dTotalHargaGross: Double;
begin
//  Result := 0;
  with sgTransaksi do
  begin
    dTotalHargaGross := (Columns[_KolHargaExcPajak].Floats[ARow]);
    Result := RoundTo(dTotalHargaGross + (((dTotalHargaGross * Columns[_KolPPN].Floats[ARow]) / 100) +
      ((dTotalHargaGross * Columns[_KolPPNBM].Floats[ARow]) / 100)), igPrice_Precision);
  end;
end;

function TfrmTransaksi.LoadByPLU(aPLU_Qty: String; aUoM: String = '';
    aIsLookupActive: Boolean = True; aIsLoadFromPending: Boolean = False;
    aDiscMan: Double = 0; aDiscOto: string = ''): Integer;
var
//  sUOMLastPurchase: string;
//  dLastPurchas: Double;
  sPLUPasangan     : String;
	IsDecimalVerified: Boolean;
	isValidPLU       : Boolean;
	isActivePLU      : Boolean;
	isBarangFound    : Boolean;
	sTemp            : string;
	sPLU             : string;
	isBintang        : Boolean;
	i, j             : Integer;
	iFoundInGrid     : Integer;
  isBarcodeUsed    : boolean;
  isBHJExist       : boolean;
begin
  Result            := 0;
	FProductCount     := 1;
	isBintang         := False;
//	isBarangFound     := False;
	isActivePLU       := False;
	IsDecimalVerified := False;
	isValidPLU        := False;
  isBarcodeUsed     := False;
  isBHJExist        := False;
  iFoundInGrid      := 0;
	j := 0;
	i := pos('*', aPLU_Qty);
  if i>0 then
  begin
    j := i + 1;
    isBintang := True;
  end;

	if isBintang then
	begin
		sTemp := '';

		{tambahan untuk produk count}
		for i := 1 to (j - 2) do
		begin
			if (aPLU_Qty[i] = '*') and (i = 1) then
				sTemp := '1'
			else
				sTemp:= sTemp + aPLU_Qty[i];
		end;

		try
      if sTemp='' then
        FProductCount := 1
      else
      	FProductCount := StrToFloat(sTemp);
		except
			FProductCount := 1;
		end;

    if FProductCount <= 0 then
    begin
      ShowInfo('Jumlah barang tidak valid');
      edPLU.SelectAll;
      Exit;
    end;

		sTemp := '';

		for i := j to Length(aPLU_Qty) do
			sPLU:= sPLU + aPLU_Qty[i];
	end
	else
		sPLU:= aPLU_Qty;

	if Length(sPLU) < igProd_Code_Length then
	begin
    sTemp := StringOfChar('0', igProd_Code_Length);   //'000000'
		try
			sPLU := FormatFloat(sTemp,StrToFloat(sPLU));
		except
		end;
	end;

  sPLUPasangan := '';
	with TNewBarang.Create(Self) do
	begin
		try
      if System.Length(sPLU) = igProd_Code_Length then
      begin
      	isBarangFound := LoadByKode(sPLU);
      end
      else
      begin
      	isBarangFound := LoadByBarcodeNew(sPLU);
        isBarcodeUsed := True;
      end;

			if isBarangFound then
			begin
				isBarangFound := True;

				if IsActive = 1 then
					isActivePLU := True
				else
					isActivePLU := False;

				if IsValidate = 1 then
					isValidPLU := True
				else
					isValidPLU := False;

				//check QTY
				IsDecimalVerified := True;
				if IsDecimal = 0 then
				begin
					if (FProductCount - Floor(FProductCount)) > 0 then
					begin
						IsDecimalVerified := False;
					end;
				end;

				if (isActivePLU) and (isValidPLU) and (IsDecimalVerified) then
//				if (isValidPLU) and (IsDecimalVerified) then
				begin
					with sgTransaksi do
					begin
						with TBarangHargaJual.Create(Self) do
						begin
							try
								isBarangFound := False;  //too many 'if' will kill u :(
                if isBarcodeUsed then
                begin
                    if LoadBarangBarcodeUom(sPLU,2) then
                       isBHJExist := True;
                end
                else
                if (aUoM <> '') then
                begin
                    if LoadBarangHargaJualTermurahUOM(Kode,2,frmMain.UnitID,aUoM) then
                       isBHJExist := True;
                end
                else
                begin
                    //jika input dr EdPLU, ada byk UOM -> tmplkan lookup frame
                    if (CountBarangHargaJual(Kode,2,frmMain.UnitID)>1) and aIsLookupActive then
                    begin
                      with fraLookupBarang do
                      begin
                        UnitID  := frmMain.UnitID;
                        Align   := alBottom;
                        Visible := True;
                        Height  := 150;
                        edNamaBarang.Text := Alias;
                        IsStop := False;
                        if IsProcessing then
                          IsStop := True
                        else
                          LoadBarangByPLU(sPLU);
                        Exit;
                      end;    // with
                    end
                    else
                    begin
                    if LoadBarangHargaJualTermurah(Kode,2,frmMain.UnitID) then
                       isBHJExist := True
                    end
                end;

                if isBHJExist then
                begin
                	if (SellPrice <> 0) and (IsDecimal = 0) then
                  begin
                    //cari di grid
                    iFoundInGrid := FindInGrid(Kode,FProductCount,NewUOM.UOM);
                    if iFoundInGrid > 0 then
                    begin
                       Result := iFoundInGrid;
                       sPLUPasangan := Cells[_KolPairCode, iFoundInGrid];
                    end;
                  end;

                  if iFoundInGrid = 0 then
                  begin
                    Result   := RowCount-1;
                    //Cells[0,RowCount-1] := IntToStr(RowCount-1);
                    Cells[_KolPLU,RowCount-1]               := Kode;
                    Cells[_KolNamaBarang,RowCount-1]        := Alias;
                    Columns[_KolIsDecimal].Ints[RowCount-1] := IsDecimal;
                    Columns[_KolIsDiscGMC].Ints[RowCount-1] := IsDiscGMC;
                    Columns[_KolIsMailer].Rows[RowCount-1]  := IntToStr(IsMailer);
                    if IsCCUoM(NewUOM.UOM) then
                    begin
                      Columns[_KolIsCharge].Rows[RowCount-1] := '1';
                    end
                    else
                    begin
                      Columns[_KolIsCharge].Rows[RowCount-1] := '0';
                    end;

                    Columns[_KolMaxDiscQTY].Floats[RowCount-1] := MaxQtyDisc;
                    Columns[_KolPPN].Floats[RowCount-1]        := NewPajak.PPN;
                    Columns[_KolPPNBM].Floats[RowCount-1]      := 0;   // ketoke mmg ga pernah PPNBM > 0
//                    Columns[_KolCOGS].Floats[RowCount-1]       := BarangTransaksi.COGS;
//                    Columns[_KolLastCost].Floats[RowCount-1]   := BarangTransaksi.LastCost;
                   // GetLastPurchasePrice(dLastPurchas,sUOMLastPurchase );
                    Columns[_KolCOGS].Floats[RowCount-1]       := GetHargaAVG(NewUOM.UOM);
                    Columns[_KolLastCost].Floats[RowCount-1]   := NewBarang.HargaLastCost;
                    Columns[_KolBHJID].Ints[RowCount-1]        := ID;
                    Columns[_KolTipeBarang].Ints[RowCount-1]   := TipeBarangID;
                    Columns[_KolHargaAvg].Floats[RowCount-1]   := GetHargaAVG(NewUOM.UOM);

                    if (NewPajak.PPN > 0) or (NewPajak.PPNBM > 0) then
                      Columns[_KolIsBKP].Ints[RowCount-1] := 1
                    else
                      Columns[_KolIsBKP].Ints[RowCount-1] := 0;

                    Columns[_KolJumlah].Floats[RowCount-1]        := FProductCount;
                    Columns[_KolUOM].Rows[RowCount-1]             := NewUOM.UOM;

                    Columns[_KolHargaExcPajak].Floats[RowCount-1] := RoundTo(SellPrice / ((NewPajak.PPN + 100) / 100), igPrice_Precision);
                    Columns[_KolHarga].Floats[RowCount-1]         := RoundTo(SellPrice, igPrice_Precision);  //inc Tax
//                    Columns[_KolHarga].Floats[RowCount-1]         := GetSellPriceWithTax(RowCount-1);
                    Columns[_KolDisc].Floats[RowCount-1]          := RoundTo(DiscNominal, igPrice_Precision);
                    Columns[_KolDiscMan].Floats[RowCount-1]       := RoundTo(aDiscMan, igPrice_Precision);
                    Columns[_KolDiscManForm].Floats[RowCount-1]   := RoundTo(aDiscMan, igPrice_Precision);
                    Columns[_Koldiscoto].Rows[RowCount-1]         := aDiscOto;

                    if SellPrice = 0 then
                      Columns[_KolIsKontrabon].Ints[RowCount-1]   := 1
                    else
                      Columns[_KolIsKontrabon].Ints[RowCount-1]   := 0;

                    {$IFDEF TSN}
                    Columns[_KolDiscP].Floats[RowCount-1]         := (DiscPersen);
                    {$ENDIF}
                    Columns[_KolTotal].Floats[RowCount-1]         := GetTotalHarga(RowCount-1);

                    sPLUPasangan := BarangGalon.Kode;
                    Cells[_KolPairCode, RowCount-1]        := sPLUPasangan;
                    Columns[_KolIsGalon].Ints[RowCount-1]  := IsGalon;
                    Columns[_KolDetailID].Ints[RowCount-1] := 0;

                    RowCount := RowCount + 1;
                    Row      := RowCount - 1;
                    AutoNumberCol(0);
                  end;
									if (iFoundInGrid = 0) and (SellPrice = 0)
                  and (aIsLookupActive) then
									begin
										lblHargaKontrabon.Visible  := True;
										edHargaKontrabon.Visible   := True;
										edPLU.Enabled              := False;
                    sgTransaksi.Enabled        := False;
                    //clear ketika nilai di ambil
										//edHargaKontrabon.Text      := '0';
										edHargaKontrabon.SetFocus;
										edHargaKontrabon.SelectAll;
									end
									else
									begin
										HitungTotalRupiah;
										edPLU.Clear;
										FocusToPLUEdit;
                    SaveTransactionToCSV;
                    edPLU.Enabled := True;
									end;
									isBarangFound := True;
								end
							finally
								Free;
							end;  // try/finally
						end;    // with
					end;
				end;
			end;
		finally
			Free;
		end;  // try/finally
	end;

	FocusToPLUEdit;
	if not isBarangFound then
	begin
    ShowInfo('Barang tidak ditemukan');
		FocusToPLUEdit;
    Exit;
	end
//Barang tidak aktif tidak bisa dijual.
	else if not isActivePLU then
	begin
		ShowInfo('Barang tidak aktif');
		FocusToPLUEdit;
    Exit;
	end
	else if not isValidPLU then
	begin
		ShowInfo('Barang tidak valid');
		FocusToPLUEdit;
    Exit;
	end
	else if not IsDecimalVerified then
	begin
		ShowInfo('Jumlah barang ini tidak boleh desimal');
		FocusToPLUEdit;
    Exit;
	end
  else if isBarcodeUsed and (not isBHJExist) then
	begin
		ShowInfo('Harga Barang Barcode tidak ditemukan');
		FocusToPLUEdit;
    Exit;
	end;

  if (sPLUPasangan<>'') {and (aIsLoadFromPending)} then
  begin
    edPLU.Text := FloatToStr(FProductCount) + '*' + sPLUPasangan;
    LoadByPLU(edPLU.Text);
//    LoadByPLU(sPLUPasangan);
  end;
  //SaveTransactionToCSV;
end;

procedure TfrmTransaksi.sgTransaksiCellValidate(Sender: TObject; ACol,
  ARow: Integer; var Value: String; var Valid: Boolean);
var
  dValue: Double;
begin
  HideInfo;
  if ACol = _KolJumlah then
  begin
    FIsEditMode := True;
    Valid := True;
    dValue := sgTransaksi.Floats[ACol, ARow];
    if dValue <= 0 then
    begin
      Valid := False;
      ShowInfo('Jumlah barang tidak valid');
      Exit;
    end;

    if sgTransaksi.Cells[_KolIsDecimal,ARow] = '0' then
    begin
      if (dValue - Floor(dValue)) > 0 then
      begin
        Valid := False;
      end;
    end;

    if not Valid then
    begin
      ShowInfo('Jumlah barang ini tidak boleh desimal');
    end
    else
    begin
      with sgTransaksi do
      begin
        //Columns[_KolTotal].Floats[ARow] := ((100 - Columns[_KolDisc].Floats[ARow])/100) * (Columns[_KolHarga].Floats[ARow] * Columns[_KolJumlah].Floats[ARow]);
        Columns[_KolTotal].Floats[ARow] := GetTotalHarga(ARow);

        HitungTotalRupiah;
        sgTransaksi.Col := _KolPLU;
        sgTransaksi.Row := sgTransaksi.RowCount - 1;
        Value := '';
        FocusToPLUEdit;

        SaveTransactionToCSV;
      end;    // with
    end;
  end;

  if ACol = _KolDiscManForm then
  begin
    if sgTransaksi.Columns[_KolDisc].Floats[ARow] <> 0 then
    begin
      Valid := False;
      ShowInfo('Barang telah didiskon, tidak bisa dilakukan Manual Disc.');
    end else
    if sgTransaksi.Columns[_KolIsKontrabon].Ints[ARow] = 1 then
    begin
      Valid := False;
      ShowInfo('Barang Joint Business, tidak bisa dilakukan Manual Disc.');
    end else
    begin
      CalculateManualDisc(Value, Valid, ARow)
    end;

  end;

  {
  if ACol = _KolDiscMan then
  begin
    FIsEditMode := True;

                 pnlotorisasi.Left      := (Screen.ActiveForm.Width div 2)-(pnlotorisasi.Width div 2);
                 pnlotorisasi.Visible   := True;
                 edtUsername.SetFocus;
                 Brs              := ARow;
                 DiscOto          := sgTransaksi.Floats[ACol, ARow];
                 Valid            := False;
                 pnlFooter.Enabled:= False;
                 dValue           := sgTransaksi.Floats[ACol, ARow];
                // sgTransaksi.Enabled :=False;
                 //fraFooter5Button1.btnUpdate.Enabled := False;

    if dValue <= 0 then
    begin
      Valid := False;
      ShowInfo('Discount tidak valid');
      Exit;
    end;

//    if sgTransaksi.Cells[_KolIsDecimal,ARow] = '0' then
//    begin
//      if (dValue - Floor(dValue)) > 0 then
//      begin
//        Valid := False;
//      end;
//    end;

//    if not Valid then
//    begin
//      ShowInfo('Jumlah barang ini tidak boleh desimal');
//    end
//    else
//    begin
//      with sgTransaksi do
//      begin
//        //Columns[_KolTotal].Floats[ARow] := ((100 - Columns[_KolDisc].Floats[ARow])/100) * (Columns[_KolHarga].Floats[ARow] * Columns[_KolJumlah].Floats[ARow]);
//        Columns[_KolTotal].Floats[ARow] := GetTotalHarga(ARow);
//
//        HitungTotalRupiah;
//        sgTransaksi.Col := _KolPLU;
//        sgTransaksi.Row := sgTransaksi.RowCount - 1;
//        Value := '';
//        FocusToPLUEdit;
//
//        SaveTransactionToCSV;
//      end;    // with
    //end;
  end;     }

end;

procedure TfrmTransaksi.sgTransaksiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Key = VK_DOWN) or (Key = 34)) and (sgTransaksi.Row = sgTransaksi.RowCount-1) then
  begin
    if fraLookupBarang.Showing then
       fraLookupBarang.sgBarang.SetFocus;
  end
  else
  if Key = VK_RETURN then
  begin
//    sgTransaksiEditingDone(Self);
    if FIsEditMode then
    begin
      FIsEditMode := False;
    end
    else
    begin
      sgTransaksi.Col := _KolPLU;
      sgTransaksi.Row := sgTransaksi.RowCount - 1;
      FocusToPLUEdit;
    end;
  end
  else if Key = VK_F12 then
  begin
    btnResetClick(btnReset);
  end
  else if Key = VK_DELETE then
  begin
    with sgTransaksi do
    begin
      if Row < RowCount - 1 then
      begin
        if CommonDlg.Confirm('Apakah Anda yakin akan menghapus PLU: '
          + Cells[_KolPLU,Row] + ' - ' + Cells[_KolNamaBarang,Row]) = mrYes then
        begin
          ClearRows(Row,1);
          RemoveRows(Row,1);
          AutoNumberCol(0);
          HitungTotalRupiah;
          SaveTransactionToCSV;
        end;
      end;
    end;    // with
  end
  else if Key in [VK_F9] then
  begin
    //ShowForm(TfrmPayment,wsMaximized);
    ShowPayment;
  end;

end;

procedure TfrmTransaksi.edNoPelangganKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key in [VK_RETURN] then
  begin
    FocusToPLUEdit;
  end
  else if Key = VK_F12 then
  begin
    btnResetClick(btnReset);
  end
  else if (Key = VK_F5) then
  begin
    sgTransaksi.Visible := False;
    pnlFooter.Visible := False;
    with fraMember do
    begin
      UnitID := frmMain.UnitID;
      Align := alClient;
      Visible := True;
      edNama.SetFocus;
      edNama.SelectAll;
    end;    // with
  end
  else if Key in [VK_F9] then
  begin
    //ShowForm(TfrmPayment,wsMaximized);
    ShowPayment;
  end;
end;

procedure TfrmTransaksi.LoadMember(AMemberNo: String);
var
  sSQL: string;
begin
  HideInfo;
  if AMemberNo = '' then
    AMemberNo := GetDefaultMember;

  edNoPelanggan.Text := AMemberNo;
  edNamaPelanggan.Clear;
  FTipeMemberID := -1;
  TrMemberID := -1;
  MemberCode := '';

  sSQL := 'select member_card_no, member_name, member_tpmember_id, '
    + 'member_is_valid, member_is_active, member_id '
    + 'from member '
    + 'where member_card_no = ' + Quot(AMemberNo)
    + ' and member_unt_id = ' + IntToStr(frmMain.UnitID);
  with cOpenQuery(sSQL) do
  begin
    try
      if not eof then
      begin
        if Fields[3].AsInteger = 0 then
        begin
          ShowInfo('Data member tersebut TIDAK VALID');
        end
        else if Fields[4].AsInteger = 0 then
        begin
          ShowInfo('Data member tersebut TIDAK AKTIF');
        end
        else
        begin
          edNamaPelanggan.Text := Fields[1].AsString;
          FTipeMemberID := Fields[2].AsInteger;
          TrMemberID := Fields[5].AsInteger;
          MemberCode := Fields[0].AsString;

          sgHeader.Cells[0,0] := edNoPelanggan.Text;
          sgHeader.Cells[1,0] := edNamaPelanggan.Text;
          SaveTransactionToCSV(False);
        end;
      end
      else
      begin
        ShowInfo('Data member tersebut TIDAK DITEMUKAN');
      end;
    finally
      Free;
    end;
  end;
end;

procedure TfrmTransaksi.edNoPelangganExit(Sender: TObject);
begin
  if Trim(edNoPelanggan.Text) <> Trim(MemberCode)  then
  begin
//    SavePendingToCSV(MemberCode);
  end;

  LoadMember(edNoPelanggan.Text);
  //HideInfo;
  if FTrMemberID = -1 then
  begin
    if not fraMember.Visible then
    begin
      edNoPelanggan.SetFocus;
      edNoPelanggan.SelectAll;
      //ShowInfo('Member tersebut tidak ditemukan');
    end;
  end
  else
  begin
//    LoadPendingFromCSV(MemberCode);
  end;
end;

procedure TfrmTransaksi.SaveTransactionToCSV(ASaveDetail: Boolean = true;
    ASaveHeader: Boolean = true);
begin
  if ASaveHeader then
  begin
    try
      sgHeader.SaveToCSV(cGetAppPath + 'trans_header.csv');
    finally

    end;
  end;

  if ASaveDetail then
  begin
    try
      sgTransaksi.UnHideColumns(_KolIsDecimal, _ColCount);
      sgTransaksi.SaveToCSV(cGetAppPath + 'trans_detail.csv');
      SavePendingToCSV(MemberCode);
      sgTransaksi.HideColumns(_KolIsDecimal, _ColCount);
    finally

    end;
  end;
end;

procedure TfrmTransaksi.btnResetClick(Sender: TObject);
begin
  if CommonDlg.Confirm('Apakah Anda yakin akan me-RESET transaksi? '
    + 'Data di tabel akan dibersihkan.') = mrNo then
  begin
    Exit;
  end;

  //edNoPelanggan.Clear;
  //edNoPelangganExit(edNoPelanggan);
  with sgTransaksi do
  begin
    ClearRows(1,RowCount-1);
    RowCount := 2;
    AutoNumberCol(0);
  end;    // with
  Transaksi_ID := 0;
  edPLU.Clear;
  edNoTrnTerakhir.Text := frmMain.GetTransactionNo(frmMain.FPOSCode, FServerDateTime);
  HitungTotalRupiah;
  SaveTransactionToCSV;
  SavePendingToCSV(MemberCode);
  FocusToPLUEdit;
end;

procedure TfrmTransaksi.btnBayarClick(Sender: TObject);
begin
  frmMain.mnPaymentClick(frmMain.mnPayment);
end;

function TfrmTransaksi.GetCCUoMs: TStrings;
var
  sSQL: string;
begin
//  Result := nil;
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

  Result := FCCUoMs;
end;

function TfrmTransaksi.GetDiscAMCPersen: Double;
var
	lDecimalSeparator: Char;
	sSQL: string;
begin
	FDiscAMCPersen := 0;
  sSQL := 'select tpmember_name '
		+ 'from ref$tipe_member '
		+ 'where tpmember_id = ' + IntToStr(FTipeMemberID);

  with cOpenQuery(sSQL) do
  begin
    try
      if not eof then
      begin
        lDecimalSeparator := DecimalSeparator;
        DecimalSeparator := '.';
      	sSQL := 'select tpmember_discount '
          + 'from ref$tipe_member '
          + 'where tpmember_name = ' + Quot(Fields[0].AsString)
          + ' and tpmember_begin_value <= ' + CurrToStr(TotalRupiah)
          + ' and tpmember_end_value >= ' + CurrToStr(TotalRupiah);
        DecimalSeparator := lDecimalSeparator;
        with cOpenQuery(sSQL) do
        begin
          try
            if not eof then
            begin
              FDiscAMCPersen := Fields[0].AsFloat;
            end;
          finally
            Free;
          end;
        end;
      end;
    finally
      Free;
    end;
  end;
	Result := FDiscAMCPersen;
end;

function TfrmTransaksi.HitungTotalRupiahBarangAMC: Currency;
var
	i: Integer;
begin
	Result := 0;
  TotalRupiahBarangAMC := 0;

	with sgTransaksi do
	begin
		for i := 1 to RowCount - 2 do    // Iterate
		begin
      if (Columns[_KolIsDiscGMC].Rows[i] = '1')
        and (Columns[_KolJumlah].Floats[i] <= Columns[_KolMaxDiscQTY].Floats[i]) then
				Result := Result + Columns[_KolTotal].Floats[i];
		end;
	end;

  TotalRupiahBarangAMC := Result;
end;

function TfrmTransaksi.IsCCUoM(AUoM: String): Boolean;
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

procedure TfrmTransaksi.ResetTransaction;
begin
  //cClearGrid(sgTransaksi,False);
  sgTransaksi.ClearRows(1,sgTransaksi.RowCount-2);
  sgTransaksi.RowCount := 2;
  //edNoPelanggan.Text := GetDefaultMember;
  //edNoPelangganExit(edNoPelanggan);
  Transaksi_ID         := 0;
  edNoTrnTerakhir.Text := frmMain.GetTransactionNo(frmMain.FPOSCode, FServerDateTime);
  HitungTotalRupiah;
  edPLU.SetFocus;
  SaveTransactionToCSV;
end;

procedure TfrmTransaksi.SavePendingToCSV(AMemberCode: String);
begin
  try
    sgTransaksi.UnHideColumns(_KolIsDecimal,_KolMaxDiscQTY);
    sgTransaksi.SaveToCSV(cGetAppPath + 'trans_detail_' + AMemberCode + '.csv');
    sgTransaksi.HideColumns(_KolIsDecimal,_KolMaxDiscQTY);
  finally

  end;
end;

//procedure TfrmTransaksi.LoadPendingFromCSV(AMemberCode: String);
//var
//  sFile: String;
//begin
//  try
//    sFile := cGetAppPath + 'trans_detail_' + AMemberCode + '.csv';
//    if FileExists(sFile) then
//    begin
//      sgTransaksi.UnHideColumns(_KolIsDecimal, _ColCount-1);
//      sgTransaksi.ClearRows(1,sgTransaksi.RowCount-2);
//	    sgTransaksi.LoadFromCSV(sFile);
//  	  sgTransaksi.AutoNumberCol(0);
//      sgTransaksi.HideColumns(_KolIsDecimal, _ColCount-1);
//    	HitungTotalRupiah;
//    end;
//  finally
//    //SetGridHeader_Transaksi;
//    edPLU.Text := '';
//  end;
//
//  edNoTrnTerakhir.Text := frmMain.GetTransactionNo(frmMain.FPOSCode);
//end;

function TfrmTransaksi.SaveToDBPending: Boolean;
var
  dtTransaksi      : TDateTime;
  bIsBKP           : Boolean;
  bIsDiscAMC       : Boolean;
  i                : Integer;
  lDecimalSeparator: Char;
  ssSQL            : TStrings;
  iTrans_ID        : Integer;
begin
  Result            := False;
  lDecimalSeparator := DecimalSeparator;
  DecimalSeparator  := '.';

  ssSQL := TStringList.Create;
  try
      dtTransaksi := cGetServerTime;
      with TPOSTransaction.Create(Self) do
      begin
        try
          if LoadByTrans_No(edNoTrnTerakhir.Text, frmMain.UnitID) then
             iTrans_ID := ID
          else
              iTrans_ID := 0;

          UpdateData(TotalRupiahBarangCC,TotalRupiah,frmMain.FBeginningBalanceID,HitungTotalRupiahBarangAMC,
            self.DiscAMCPersen,iTrans_ID,True,TrMemberID,frmMain.UnitID,
            edNoTrnTerakhir.Text,0,dtTransaksi,0,
            0, self.TotalRupiahBarangPPN, TotalRupiah,'',nil,frmMain.UserID,0, 0, True);

          //TransactionCard.UpdateData

          with sgTransaksi do
          begin
            POSTransactionItems.Clear;
            for i := 1 to RowCount - 1 do
            begin
              if Cells[_KolPLU,i] = '' then Continue;

              bIsBKP := False;
              if Cells[_KolIsBKP,i] = '1' then
                bIsBKP := True;

              bIsDiscAMC := False;
              if Cells[_KolIsDiscGMC,i] = '1' then
                bIsDiscAMC := True;

              UpdatePOSTransactionItems(sgTransaksi.Columns[_KolBHJID].Ints[i], //Barang harga jual ID
                sgTransaksi.Columns[_KolCOGS].Floats[i], //COGS
                sgTransaksi.Ints[_KolDetailID, i], //Detail ID
                bIsBKP, bIsDiscAMC, //ID, IsBKP, IsDiscAMC
                sgTransaksi.Columns[_KolLastCost].Floats[i], //last cost
                sgTransaksi.Columns[_KolPPN].Floats[i], //PPN
                sgTransaksi.Columns[_KolPPNBM].Floats[i], //PPNBM
                sgTransaksi.Columns[_KolJumlah].Floats[i], //QTY
                sgTransaksi.Columns[_KolHarga].Floats[i], //SellPrice
                sgTransaksi.Columns[_KolHarga].Floats[i] - sgTransaksi.Columns[_KolDisc].Floats[i], //SellPriceDisc
                sgTransaksi.Columns[_KolTotal].Floats[i], //Total
                RoundTo(sgTransaksi.Columns[_KolJumlah].Floats[i] * sgTransaksi.Columns[_KolHargaExcPajak].Floats[i], igPrice_Precision), //totalb4tax
                (sgTransaksi.Columns[_KolTotal].Floats[i]), //total ceil
                edNoTrnTerakhir.Text,
                frmMain.UnitID,
                sgTransaksi.Cells[_KolPLU,i],
                sgTransaksi.Ints[_KolTipeBarang, i], GetDiscItemAMCRp(i),
                sgTransaksi.Cells[_KolUOM, i],
                0,
                sgTransaksi.Columns[_KolDiscMan].Floats[i],
                sgTransaksi.Cells[_Koldiscoto, i]);
                // discount cc
            end;
          end;    // with

          if SaveToDB then
          begin
              Result := True;
              cCommitTrans;
          end
          else
          begin
            cRollbackTrans;
          end;
        finally
          Free;
        end;
      end; // with
  finally
    DecimalSeparator := lDecimalSeparator;
    FreeAndNil(ssSQL);
  end;
end;

procedure TfrmTransaksi.sgTransaksiGetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  if (ARow > 0) and (ACol > 0) then
  begin
    if ACol in [_KolJumlah] then
    begin
      FloatFormat := '%.' + IntToStr(Abs(igQty_Precision)) + 'n';
//      FloatFormat := '%.3n';
    end
    else if ACol in [_KolDisc,_KolDiscMan] then
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

procedure TfrmTransaksi.ShowPayment;
begin
  //frmTransaksi := GetFormByClass(TfrmTransaksi) as TfrmTransaksi;
  if frmTransaksi <> nil then
  begin
    frmTransaksi.HitungTotalRupiah;
    if (frmTransaksi.TotalRupiah > 0) and (not frmTransaksi.edHargaKontrabon.Visible) then
    begin
      frmTransaksi.TotalRupiahBarangAMC      := frmTransaksi.HitungTotalRupiahBarangAMC;
      frmTransaksi.TotalRupiahBarangPPN      := frmTransaksi.HitungTotalRupiahBarangPPN;
      frmTransaksi.TotalRupiahBarangBKP      := frmTransaksi.HitungTotalRupiahBarangBKP;
      frmTransaksi.TotalRupiahBarangDPP      := frmTransaksi.HitungTotalRupiahBarangDPP;
      frmTransaksi.TotalRupiahBarangBebasPPN := frmTransaksi.HitungTotalRupiahBarangBebasPPN;
      frmTransaksi.TotalRupiahBarangDiscount := frmTransaksi.HitungTotalRupiahBarangDiscount;
      //DISINI
      frmPayment := (ShowForm(TfrmPayment,wsMaximized)) as TfrmPayment;
			frmPayment.UpdateDataLokal(frmTransaksi.TotalRupiah,frmTransaksi.TotalRupiahBarangAMC,
      	frmTransaksi.DiscAMCPersen,frmTransaksi.TotalRupiahBarangCC, frmTransaksi.TotalRupiahBarangPPN);
      frmPayment.ResetVoucher;
      frmPayment.ShowTotalBayar;
    end;
  end;
end;

procedure TfrmTransaksi.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CommonDlg.Confirm('Apakah Anda ingin menutup form ' + Self.Caption + '?') = mrYes then
  begin
    CanClose := True;
    if sgTransaksi.Cells[_KolPLU,1] = '' then Exit;

    if not SaveToDBPending then
    begin
         if CommonDlg.Confirm('Gagal menyimpan Transaksi Pending !, ' + #13#10
            + 'Apakah Anda ingin menutup form ' + Self.Caption + '?') = mrNo
         then     CanClose := False;

    end;
  end
  else
    CanClose := False;
end;

procedure TfrmTransaksi.FormDestroy(Sender: TObject);
begin
     frmTransaksi := nil;
end;

procedure TfrmTransaksi.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    if fraLookupBarang.Visible then
    begin
       fraLookupBarang.SetPanelHeaderEnable(True);
       fraLookupBarang.Visible := False;
    end
    else
    if fraMember.Visible then
    begin
       fraMember.Visible := False;
    end
    else if edHargaKontrabon.Visible then
    begin
      with sgTransaksi do
      begin
        Row := RowCount-2;
        ClearRows(Row,1);
        RemoveRows(Row,1);
        AutoNumberCol(0);
        HitungTotalRupiah;
        SaveTransactionToCSV;
        edHargaKontrabon.Visible  := False;
        lblHargaKontrabon.Visible := False;
        sgTransaksi.Enabled       := True;
        edPLU.Enabled             := True;
        edPLU.SetFocus;
      end;
    end
    else
       Close;
  end;
end;

function TfrmTransaksi.GetDiscItemAMCRp(ARow: Integer): Double;
var
   aDiscAMCPersen : Double;
begin
	Result := 0;
  aDiscAMCPersen := GetDiscAMCPersen;
  with sgTransaksi do
  begin
    if (Columns[_KolIsDiscGMC].Rows[ARow] = '1')
      and (Columns[_KolJumlah].Floats[ARow] <= Columns[_KolMaxDiscQTY].Floats[ARow]) then
      Result := (Floats[_KolHarga, ARow]-Floats[_KolDisc, ARow]) * (aDiscAMCPersen/100);
  end;
end;

function TfrmTransaksi.HitungTotalRupiahBarangPPN: Currency;
var
  i: Integer;
  dTotalHargaGross: Double;
begin
  Result := 0;
  with sgTransaksi do
  begin
    for i := 1 to RowCount - 2 do    // Iterate
    begin
      dTotalHargaGross := (Columns[_KolHargaExcPajak].Floats[i]);
      Result := Result + RoundTo(Columns[_KolJumlah].Floats[i] *
      (((dTotalHargaGross * Floats[_KolPPN, i]) / 100) +
        ((dTotalHargaGross * Floats[_KolPPNBM, i]) / 100)), igPrice_Precision);
    end;
  end;
  TotalRupiahBarangPPN := Result;
end;

procedure TfrmTransaksi.btnOkClick(Sender: TObject);
var
  sSql : string;
  i : Integer;
  sDiscount : String;
  sValue : String;
  dValue : Double;
//  DiscStrValue : String;
  IsPercent : Boolean;
begin
  sSql :='select a.* from aut$user a, aut$user_group b '
       + ' where a.usr_id=b.ug_usr_id and ug_gro_id=11'
       + ' and a.usr_unt_id = ' + IntToStr(frmMain.UnitID)
       + ' and usr_username =' + quot(edtUsername.Text);

  with cOpenQuery(sSql) do
  begin
    try
      if not Eof then
      begin
        if edtPassword.Text <> FieldByName('USR_PASSWD').AsString then
        begin
          CommonDlg.ShowMessage('Password salah');
//          sgTransaksi.Floats[_KolDiscManForm,brs] := 0;
//          sgTransaksi.Floats[_KolDiscMan,brs]     := 0;
          sgTransaksi.Cells[_KolDiscManForm,brs] := sValueBefore;
          sgTransaksi.Cells[_KolDiscMan,brs]     := sValueBefore;
          sgTransaksi.Floats[_KolTotal,brs]      := GetTotalHarga(brs);
          ActiveGrid;
          Exit;
        end;
      end
      else
      begin
        CommonDlg.ShowMessage('User ini tidak berhak melakukan discount manual');
//        sgTransaksi.Floats[_KolDiscManForm,brs] := 0;
//        sgTransaksi.Floats[_KolDiscMan,brs]     := 0;
        sgTransaksi.Cells[_KolDiscManForm,brs] := sValueBefore;
        sgTransaksi.Cells[_KolDiscMan,brs]     := sValueBefore;
        sgTransaksi.Floats[_KolTotal,brs]      := GetTotalHarga(brs);
        ActiveGrid;
        Exit;
      end;
    finally
      Free;
    end;
  end;

  pnlotorisasi.Visible := False;
  //Mencoba Man. Disc All by PKL
  {
  if  (Application.MessageBox('Apakah Discount untuk seluruh barang ?','Options',MB_YesNo=ID_Yes) then
  begin
    sDiscount := sgTransaksi.Columns[_KolDiscManForm].Rows[sgTransaksi.Row];
    for i := 1 to sgTransaksi.RowCount - 1 do
    begin
      if sgTransaksi.Columns[_KolPLU].Rows[i] <> '' then
      begin
        sgTransaksi.Columns[_KolDiscManForm].Rows[i] := sDiscount;
        Value        := sgTransaksi.Columns[_KolDiscManForm].Rows[sgTransaksi.Row];
        DiscStrValue := StringReplace(Value, '*', '%', [rfReplaceAll]);

        If TryStrToFloat(DiscStrValue,dValue) then
        begin
          sgTransaksi.Columns[_KolTotal].Floats[i] := ((100 - sgTransaksi.Columns[_KolDisc].Floats[i])/100) *
           (sgTransaksi.Columns[_KolHarga].Floats[i] * sgTransaksi.Columns[_KolJumlah].Floats[i]) -
           (sgTransaksi.Columns[_KolDiscManForm].Floats[i] * sgTransaksi.Columns[_KolJumlah].Floats[i]);
        end
        else
        begin
          sgTransaksi.Columns[_KolTotal].Floats[i] := ((100 - sgTransaksi.Columns[_KolDisc].Floats[i])/100) *
           ((100 - sgTransaksi.Columns[_KolDiscManForm].Floats[i])/100) *
           (sgTransaksi.Columns[_KolHarga].Floats[i] * sgTransaksi.Columns[_KolJumlah].Floats[i]);
        end;
      end;
    end;
  end;
  }

  if (Application.MessageBox( 'Apakah Discount untuk seluruh barang ?',
                              'Options',
                              MB_YesNo Or MB_ICONQUESTION Or MB_DEFBUTTON2)=ID_Yes) then
  begin
    sDiscount := sgTransaksi.Cells[_KolDiscManForm,brs];
    for i := 1 to sgTransaksi.RowCount - 1 do
    begin
      if sgTransaksi.Cells[_KolPLU,i] <> '' then
      begin
        if (sgTransaksi.Floats[_KolDisc,i] = 0) and (sgTransaksi.Ints[_KolIsKontrabon,i] = 0) then
        begin
          sValue    := StringReplace(sDiscount, '*', '%', [rfReplaceAll]);
          IsPercent := Pos('%', sValue) > 0;
          sValue    := StringReplace(sValue, '%', '', [rfReplaceAll]);
          if not TryStrToFloat(sValue,dValue) then
            dValue  := 0;
          If IsPercent then
            dValue  := dValue/100 * sgTransaksi.Floats[_KolHarga,i];

          sgTransaksi.Cells[_KolDiscManForm,i] := sDiscount;
          sgTransaksi.Floats[_KolDiscMan,i]    := dValue;
          sgTransaksi.Floats[_KolTotal,i]      := GetTotalHarga(i);
          sgTransaksi.Cells[_Koldiscoto,i]     := edtUsername.Text;
        end;
      end;
    end;
  end
  else
  begin
    sgTransaksi.Cells[_Koldiscoto,brs]  := edtUsername.Text;
    sgTransaksi.Floats[_KolDiscMan,brs] := DiscOto;
    sgTransaksi.Floats[_KolTotal,brs]   := GetTotalHarga(brs);
  end;
  ActiveGrid;

  with sgTransaksi do
  begin
    //Columns[_KolTotal].Floats[ARow] := ((100 - Columns[_KolDisc].Floats[ARow])/100) * (Columns[_KolHarga].Floats[ARow] * Columns[_KolJumlah].Floats[ARow]);

    //Columns[_KolTotal].Floats[brs] := GetTotalHarga(brs);
    HitungTotalRupiah;
    sgTransaksi.Col := _KolPLU;
    sgTransaksi.Row := sgTransaksi.RowCount - 1;
    // Value := '';
    FocusToPLUEdit;

    SaveTransactionToCSV;
  end;
end;


procedure TfrmTransaksi.ActiveGrid;
begin
  edtUsername.Text      := '';
  edtPassword.Text      := '';
  pnlotorisasi.Visible  := False;
  pnlFooter.Enabled     := True;
  sgTransaksi.Enabled   := True;
  sgTransaksi.SetFocus;
end;

procedure TfrmTransaksi.edtUsernameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key = VK_RETURN)and(edtUsername.Text <> '') then
  begin
    edtPassword.SetFocus;
  end;
end;

procedure TfrmTransaksi.edtPasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    btnOk.SetFocus;
  end;
end;

procedure TfrmTransaksi.btnCancelClick(Sender: TObject);
begin
//  sgTransaksi.Floats[_KolDiscManForm,brs] := 0;
//  sgTransaksi.Floats[_KolDiscMan,brs]     := 0;
  sgTransaksi.Cells[_KolDiscManForm,brs] := sValueBefore;
  sgTransaksi.Cells[_KolDiscMan,brs]     := sValueBefore;
  sgTransaksi.Floats[_KolTotal,brs]      := GetTotalHarga(brs);
  ActiveGrid;
end;

procedure TfrmTransaksi.CalculateManualDisc(var Value: String; var Valid:
    Boolean; Row: Integer);
var
  dValue : Double;
  IsPercent : Boolean;
  DiscStrValue : String;
begin
  Value        := StringReplace(Value, '*', '%', [rfReplaceAll]);
  DiscStrValue := StringReplace(Value, '%', '', [rfReplaceAll]);
  IsPercent    := Pos('%', Value) > 0;

  If not TryStrToFloat(DiscStrValue, dValue) then
  begin
    ShowInfo('Discount tidak valid');
    Valid := False;
  end
  else
  begin
    if dValue < 0 then
    begin
      ShowInfo('Discount tidak boleh negatif');
      Valid := False;
    end;
    If (IsPercent) and (dValue > 100) then
    begin
      ShowInfo('Prosentase Discount tidak boleh melebihi 100');
      Valid := False;
    end
    else
      Valid := True;
  end;
  If Valid then
  begin
    if dValue < 0 then
    begin
      pnlotorisasi.Visible := False;
    end
    else
    begin
      If IsPercent then
        dValue    := dValue/100 * sgTransaksi.Floats[_KolHarga, Row];

      DiscOto     := dValue;
      FIsEditMode := True;

      pnlotorisasi.Left      := (Screen.ActiveForm.Width div 2)-(pnlotorisasi.Width div 2);
      pnlotorisasi.Visible   := True;
      edtUsername.SetFocus;
      Brs                    := Row;
    end;
  end;
end;

procedure TfrmTransaksi.sgTransaksiDblClick(Sender: TObject);
begin
  //ShowMessage(Inttostr(sgTransaksi.Col));
end;

function TfrmTransaksi.HitungTotalRupiahBarangBKP: Currency;
var
  i: Integer;
begin
  Result := 0;
  with sgTransaksi do
  begin
  for i := 1 to RowCount - 1 do
    begin
      if Columns[_KolIsBKP].Rows[i] = '1' then
      begin
        Result := Result + RoundTo(Columns[_KolTotal].Floats[i], igPrice_Precision);
      end;
    end;
  end;
  TotalRupiahBarangBKP := Result;
end;

function TfrmTransaksi.HitungTotalRupiahBarangDPP: Currency;
begin
  Result := 0;
  begin
    Result := Result + RoundTo(TotalRupiahBarangBKP - TotalRupiahBarangPPN, igPrice_Precision);
  end;
  TotalRupiahBarangDPP := Result;
end;

function TfrmTransaksi.HitungTotalRupiahBarangBebasPPN: Currency;
begin
  Result := 0;
  begin
    Result := Result + RoundTo(TotalRupiah - TotalRupiahBarangBKP, igPrice_Precision);
  end;
  TotalRupiahBarangBebasPPN := Result;
end;

function TfrmTransaksi.HitungTotalRupiahBarangDiscount: Currency;
var
  i: Integer;
  ValueDM: String;
  dValue: Double;
  DiscMstrValue: String;
begin
  Result := 0;
  with sgTransaksi do
  begin
    for i := 1 to RowCount - 1 do
    begin
      if Columns[_KolPLU].Rows[i] <> '' then
      begin
        ValueDM := Columns[_KolDiscManForm].Rows[i];
        DiscMstrValue := StringReplace(ValueDM, '*', '%', [rfReplaceAll]);

        if TryStrToFloat(DiscMstrValue,dValue) then
        begin
          Result := Result + RoundTo(Columns[_KolJumlah].Floats[i] * (Columns[_KolDisc].Floats[i]+
            Columns[_KolDiscManForm].Floats[i]), igPrice_Precision);
        end
        else
        begin
          Result := Result + RoundTo(Columns[_KolJumlah].Floats[i] * (Columns[_KolDisc].Floats[i]+
            ((Columns[_KolDiscManForm].Floats[i]/100)*Columns[_KolHarga].Floats[i])), igPrice_Precision);
        end;
      end;
    end;
  end;
  TotalRupiahBarangDiscount := Result;
end;

procedure TfrmTransaksi.sgTransaksiSelectCell(Sender: TObject; ACol, ARow:
    Integer; var CanSelect: Boolean);
begin
  if ACol = _KolDiscManForm then
  begin
    if not pnlotorisasi.Visible then
    begin
      sValueBefore := sgTransaksi.Cells[ACol,Arow];
    end;
  end;
end;

end.
