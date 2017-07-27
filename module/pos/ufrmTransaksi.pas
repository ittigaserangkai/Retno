unit ufrmTransaksi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uTSCommonDlg, ufraLookupBarang, ufraMember,
  ufrmPayment, Menus, Buttons, ActnList, DB, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, System.Actions,
  cxTextEdit, cxCurrencyEdit, cxGridCustomTableView, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  uNewBarang, uNewBarangHargaJual, uNewPosTransaction;

type
  TfrmTransaksi = class(TForm)
    pnl1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbl1: TLabel;
    lblHargaKontrabon: TLabel;
    edHargaKontrabon: TcxCurrencyEdit;
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
    cxTransaksi: TcxGrid;
    grdlvlTransaksi: TcxGridLevel;
    edNoPelanggan: TcxTextEdit;
    edNamaPelanggan: TcxTextEdit;
    edNoTrnTerakhir: TcxTextEdit;
    sgTransaksi: TcxGridTableView;
    cxStyleRepository1: TcxStyleRepository;
    cxStyleGreen: TcxStyle;
    cxStyleBold: TcxStyle;
    procedure FormCreate(Sender: TObject);
    procedure edPLUKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tmrInfoTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edHargaKontrabonKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edPLUEnter(Sender: TObject);
    procedure edPLUExit(Sender: TObject);
    procedure edNoPelangganKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edNoPelangganExit(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnBayarClick(Sender: TObject);
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
    procedure edNoPelangganEnter(Sender: TObject);
    procedure sgTransaksiEditing(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; var AAllow: Boolean);
    procedure sgTransaksiInitEdit(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; AEdit: TcxCustomEdit);
    procedure sgTransaksiKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
    procedure AutoNumberCol(Sender: TcxCustomGridTableItem; ARecord:
        TcxCustomGridRecord; var AText: string);
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
    procedure SetGridFormat_Column(aColIndex: Integer; aIsCurrency: Boolean = True);
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
  sgHeader: TStringList;

implementation

uses
  ufrmMain, Math, uConstanta, StrUtils, udmMain, uDXUtils;

{$R *.dfm}

procedure TfrmTransaksi.SetGridHeader_Transaksi;
var
  i: integer;
  dxColumn: TcxGridColumn;
begin
  with sgTransaksi do
  begin
//    UnHideColumnsAll;
//    ColCount := _ColCount;
    for i := 0 to _ColCount do
    begin
      dxColumn := CreateColumn;
      dxColumn.HeaderAlignmentHorz := taCenter;
      dxColumn.Styles.Header := cxStyleBold;
    end;
    Columns[0].OnGetDisplayText := AutoNumberCol;
    Columns[0].Caption                := 'No';
    Columns[_KolPLU].Caption          := 'PLU';
    Columns[_KolNamaBarang].Caption   := 'Nama Barang';
    Columns[_KolJumlah].Caption       := 'Jumlah';
    Columns[_KolUOM].Caption          := 'UoM';
    Columns[_KolHarga].Caption        := 'Harga';
    Columns[_KolDisc].Caption         := 'Disc';
    Columns[_KolDiscMan].Caption      := 'Manual Disc';
    Columns[_KolDiscManForm].Caption  := 'Manual Disc';
    Columns[_KolTotal].Caption        := 'Total';
    Columns[_KolIsDecimal].Caption    := 'IsDecimal';
    Columns[_KolIsDiscGMC].Caption    := 'IsDiscGMC';
    Columns[_KolIsMailer].Caption     := 'IsMailer';
    Columns[_KolPPN].Caption          := 'PPN';
    Columns[_KolPPNBM].Caption        := 'PPNBM';
    Columns[_KolIsCharge].Caption     := 'IsCharge';
    Columns[_KolCOGS].Caption         := 'COGS';
    Columns[_KolLastCost].Caption     := 'LastCost';
    Columns[_KolIsBKP].Caption        := 'IsBKP';
    Columns[_KolBHJID].Caption        := 'BHJID';
    Columns[_KolHargaExcPajak].Caption:= 'HargaExcPajak';
    Columns[_KolTipeBarang].Caption   := 'TipeBarang';
    Columns[_KolHargaAvg].Caption     := 'HargaAvg';
    Columns[_KolMaxDiscQTY].Caption   := 'MaxDiscQTY';
    Columns[_KolPairCode].Caption     := 'PairCode';
    Columns[_KolIsGalon].Caption      := 'IsGalon';
    Columns[_KolDetailID].Caption     := 'DetailID';
    Columns[_Koldiscoto].Caption      := 'Otorisasi';
    Columns[_KolIsKontrabon].Caption  := 'IsKontrabon';

    {$IFDEF TSN}
    Columns[_KolDiscP].Caption      := 'Disc %';
    {$ENDIF}

//    FixedRows := 1;

    Columns[0].Width              := 32;
    Columns[_KolPLU].Width        := 10 + (10 * igProd_Code_Length);
    Columns[_KolNamaBarang].Width := 250;
    Columns[_KolJumlah].Width     := 50 + (10 * Abs(igQty_Precision));
    Columns[_KolUOM].Width        := 40;
    Columns[_KolHarga].Width      := 100 + (10 * Abs(igPrice_Precision));
    Columns[_KolDisc].Width       := 50 + (10 * Abs(igPrice_Precision));
    //Columns[_KolDiscMan].Width    := 80 + (10 * Abs(igPrice_Precision));
    Columns[_KolDiscManForm].Width    := 80 + (10 * Abs(igPrice_Precision));
    Columns[_KolTotal].Width      := 120;

    with Columns[0] do
    begin
      PropertiesClass := TcxCurrencyEditProperties;
      with TcxCurrencyEditProperties(Properties) do
      begin
        Alignment.Horz := taRightJustify;
        DecimalPlaces := 0;
        DisplayFormat := '0"."';
        Editing       := False;
//        ReadOnly      := True;
        UseThousandSeparator := True;
      end;
//      OnGetDisplayText := AutoNumberCol;
    end;
    SetGridFormat_Column(_KolJumlah, False);
    SetGridFormat_Column(_KolHarga, True);
    SetGridFormat_Column(_KolDisc, False);
    SetGridFormat_Column(_KolDiscMan, False);
    SetGridFormat_Column(_KolDiscManForm, False);
    SetGridFormat_Column(_KolTotal, True);
  end;
end;

procedure TfrmTransaksi.FormCreate(Sender: TObject);
begin
  try
    FServerDateTime      := cGetServerDateTime;
    edNoTrnTerakhir.Text := frmMain.GetTransactionNo(frmMain.FPOSCode, FServerDateTime);
    sgHeader := TStringList.Create;
    SetGridHeader_Transaksi;
  finally
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
    cxTransaksi.SetFocus;
    sgTransaksi.Controller.FocusedColumnIndex := _KolJumlah;
    sgTransaksi.Controller.FocusedRecordIndex := sgTransaksi.DataController.RecordCount - 2;
  end
  else
  if (Key = VK_F5) then
  begin
    cxTransaksi.Visible := False;
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
       fraLookupBarang.cxGrid.SetFocus;

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
    if sgTransaksi.DataController.Values[1, _KolPLU] = '' then Exit;
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

  with sgTransaksi.DataController do
  begin
    for i := 0 to RecordCount - 1 do    // Iterate
    begin
      if Values[i, _KolPLU] = '' then Continue;

      Result := Result + (Values[i, _KolTotal]); //Ceil
      TotalColie := TotalColie + Round(Values[i, _KolJumlah]);

      if (Values[i, _KolIsDiscGMC] = '1')
        and (Values[i, _KolJumlah] <= Values[i, _KolMaxDiscQTY]) then
      begin
				TotalRupiahBarangAMC := TotalRupiahBarangAMC + (Values[i, _KolTotal]); //Ceil
      end;

      if (Values[i, _KolIsMailer] = '1')
        or (IsCCUoM(Values[i, _KolUoM])) then
				TotalRupiahBarangCC := TotalRupiahBarangCC + (Values[i, _KolTotal]); //Ceil
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
  sgTransaksi.SetVisibleColumns(_KolIsDecimal, 1, False);
  {$ENDIF}
  sgTransaksi.SetVisibleColumns(_KolIsDecimal, _ColCount, False);

  if (edNoPelanggan.Text = '') or (edNoPelanggan.Text = '0') then
    LoadMember(GetDefaultMember)
  else
    LoadMember(edNoPelanggan.Text);

  sValueBefore := '';

end;

procedure TfrmTransaksi.edHargaKontrabonKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  if sgTransaksi.DataController.Values[sgTransaksi.DataController.RecordCount-1, _KolPLU] <> '' then
     sgTransaksi.DataController.FocusedRecordIndex := sgTransaksi.DataController.RecordCount-1
  else
     sgTransaksi.DataController.FocusedRecordIndex := sgTransaksi.DataController.RecordCount-2;

  if (Key = VK_RETURN)
  	and (edHargaKontrabon.Text <> '')
    and (edHargaKontrabon.Text <> '0')
    and (edHargaKontrabon.Value <> 0) then
  begin
    HideInfo;
    with sgTransaksi do
    begin
      DataController.Values[DataController.FocusedRecordIndex, _KolHargaExcPajak] := RoundTo((edHargaKontrabon.Value / 1.1), igPrice_Precision);
      DataController.Values[DataController.FocusedRecordIndex, _KolHarga] := RoundTo(edHargaKontrabon.Value, igPrice_Precision);
//      Columns[_KolHarga].Floats[Row] := GetSellPriceWithTax(Row);
      DataController.Values[DataController.FocusedRecordIndex, _KolTotal] := GetTotalHarga(DataController.FocusedRecordIndex);

      lblHargaKontrabon.Visible := False;
      edHargaKontrabon.Visible  := False;
      cxTransaksi.Enabled       := True;
      edPLU.Enabled             := True;
//      if DataController.RecNo = (DataController.RecordCount-1) then
//         DataController.RecordCount := DataController.RecordCount + 1;
      DataController.FocusedRecordIndex := DataController.RecordCount - 1;
//      AutoNumberCol(0);
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
	Result := -1;

  for i := 0 to sgTransaksi.DataController.RecordCount - 1 do
  begin
    if (sgTransaksi.DataController.Values[i, _KolPLU] = aPLU)
    and (sgTransaksi.DataController.Values[i, _KolUOM] = aUoM) then
    begin
      sgTransaksi.DataController.Values[i, _KolJumlah] := sgTransaksi.DataController.Values[i, _KolJumlah] + AProductCount;
      sgTransaksi.DataController.Values[i, _KolTotal] := GetTotalHarga(i);
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
  Result := dmMain.getGlobalVar('POS_DEF_CUST');
end;

function TfrmTransaksi.GetTotalHarga(ARow: Integer): Double;
var
	dTotalHargaGross: Double;
begin
//	Result := 0;
  with sgTransaksi.DataController do
  begin
    dTotalHargaGross := (Values[ARow, _KolHarga] * Values[ARow, _KolJumlah]);
    Result := RoundTo(dTotalHargaGross - (Values[ARow, _KolDisc] * Values[ARow, _KolJumlah])
           - (Values[ARow, _KolDiscMan] * Values[ARow, _KolJumlah]) , igPrice_Precision); //Ceil

	  {Result := (((100 - Values[ARow, _KolDisc])/100) * dTotalHargaGross) +
    	((dTotalHargaGross * Values[ARow, _KolPPN]) / 100) +
    	((dTotalHargaGross * Values[ARow, _KolPPNBM]) / 100);
     }
	end;
end;

function TfrmTransaksi.GetSellPriceWithTax(ARow: Integer): Double;
var
  dTotalHargaGross: Double;
begin
//  Result := 0;
  with sgTransaksi.DataController do
  begin
    dTotalHargaGross := (Values[ARow, _KolHargaExcPajak]);
    Result := RoundTo(dTotalHargaGross + (((dTotalHargaGross * Values[ARow, _KolPPN]) / 100) +
      ((dTotalHargaGross * Values[ARow, _KolPPNBM]) / 100)), igPrice_Precision);
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
  iRowCount        : integer;
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
  iFoundInGrid      := -1;
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
                    if iFoundInGrid > -1 then
                    begin
                       Result := iFoundInGrid;
                       sPLUPasangan := DataController.Values[iFoundInGrid, _KolPairCode];
                    end;
                  end;

                  if iFoundInGrid < 0 then
                  begin
                    DataController.AppendRecord;
                    Result   := DataController.RecordCount-1;
                    //DataController.Values[0,RowCount-1] := IntToStr(RowCount-1);
                    DataController.Values[Result, _KolPLU]               := Kode;
                    DataController.Values[Result, _KolNamaBarang]        := Alias;
                    DataController.Values[Result, _KolIsDecimal] := IsDecimal;
                    DataController.Values[Result, _KolIsDiscGMC] := IsDiscGMC;
                    DataController.Values[Result, _KolIsMailer]  := IntToStr(IsMailer);
                    if IsCCUoM(NewUOM.UOM) then
                    begin
                      DataController.Values[Result, _KolIsCharge] := '1';
                    end
                    else
                    begin
                      DataController.Values[Result, _KolIsCharge] := '0';
                    end;

                    DataController.Values[Result, _KolMaxDiscQTY] := MaxQtyDisc;
                    DataController.Values[Result, _KolPPN]        := NewPajak.PPN;
                    DataController.Values[Result, _KolPPNBM]      := 0;   // ketoke mmg ga pernah PPNBM > 0
//                    Columns[_KolCOGS].Floats[RowCount-1]       := BarangTransaksi.COGS;
//                    Columns[_KolLastCost].Floats[RowCount-1]   := BarangTransaksi.LastCost;
                   // GetLastPurchasePrice(dLastPurchas,sUOMLastPurchase );
                    DataController.Values[Result, _KolCOGS]       := GetHargaAVG(NewUOM.UOM);
                    DataController.Values[Result, _KolLastCost]   := NewBarang.HargaLastCost;
                    DataController.Values[Result, _KolBHJID]        := ID;
                    DataController.Values[Result, _KolTipeBarang]   := TipeBarangID;
                    DataController.Values[Result, _KolHargaAvg]   := GetHargaAVG(NewUOM.UOM);

                    if (NewPajak.PPN > 0) or (NewPajak.PPNBM > 0) then
                      DataController.Values[Result, _KolIsBKP] := 1
                    else
                      DataController.Values[Result, _KolIsBKP] := 0;

                    DataController.Values[Result, _KolJumlah]        := FProductCount;
                    DataController.Values[Result, _KolUOM]             := NewUOM.UOM;

                    DataController.Values[Result, _KolHargaExcPajak] := RoundTo(SellPrice / ((NewPajak.PPN + 100) / 100), igPrice_Precision);
                    DataController.Values[Result, _KolHarga]         := RoundTo(SellPrice, igPrice_Precision);  //inc Tax
//                    Columns[_KolHarga].Floats[RowCount-1]         := GetSellPriceWithTax(RowCount-1);
                    DataController.Values[Result, _KolDisc]          := RoundTo(DiscNominal, igPrice_Precision);
                    DataController.Values[Result, _KolDiscMan]       := RoundTo(aDiscMan, igPrice_Precision);
                    DataController.Values[Result, _KolDiscManForm]   := RoundTo(aDiscMan, igPrice_Precision);
                    DataController.Values[Result, _Koldiscoto]         := aDiscOto;

                    if SellPrice = 0 then
                      DataController.Values[Result, _KolIsKontrabon]   := 1
                    else
                      DataController.Values[Result, _KolIsKontrabon]   := 0;

                    {$IFDEF TSN}
                    DataController.Values[Result, _KolDiscP]         := (DiscPersen);
                    {$ENDIF}
                    DataController.Values[Result, _KolTotal]         := GetTotalHarga(Result);

                    sPLUPasangan := BarangGalon.Kode;
                    DataController.Values[Result, _KolPairCode]        := sPLUPasangan;
                    DataController.Values[Result, _KolIsGalon]  := IsGalon;
                    DataController.Values[Result, _KolDetailID] := 0;

//                    RowCount := RowCount + 1;
//                    Row      := RowCount - 1;
//                    AutoNumberCol(0);
                  end;
									if (iFoundInGrid = 0) and (SellPrice = 0)
                  and (aIsLookupActive) then
									begin
										lblHargaKontrabon.Visible  := True;
										edHargaKontrabon.Visible   := True;
										edPLU.Enabled              := False;
                    cxTransaksi.Enabled        := False;
                    //clear ketika nilai di ambil
										//edHargaKontrabon.Text      := '0';
										edHargaKontrabon.SetFocus;
										edHargaKontrabon.SelectAll;
									end
									else
									begin
//										HitungTotalRupiah;
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
    cxTransaksi.Visible := False;
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
    + 'where member_card_no = ' + QuotedStr(AMemberNo)
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

          sgHeader.Values[edNoPelanggan.Text] := edNamaPelanggan.Text;
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
  edNoPelanggan.Style.Color := clWhite;
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
      sgHeader.SaveToFile(ExtractFilePath(application.ExeName) + 'trans_header.csv');
    finally

    end;
  end;

  if ASaveDetail then
  begin
    try
//      sgTransaksi.UnHideColumns(_KolIsDecimal, _ColCount);
//      sgTransaksi.SaveToCSV(cGetAppPath + 'trans_detail.csv');
      SavePendingToCSV(MemberCode);
//      sgTransaksi.HideColumns(_KolIsDecimal, _ColCount);
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
    ClearRows;//ClearFields(1,DataController.RecordCount-1);
//    RowCount := 2;
//    AutoNumberCol(0);
  end;    // with
  sgTransaksi.ClearRows;
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
        lDecimalSeparator := FormatSettings.DecimalSeparator;
        FormatSettings.DecimalSeparator := '.';
      	sSQL := 'select tpmember_discount '
          + 'from ref$tipe_member '
          + 'where tpmember_name = ' + QuotedStr(Fields[0].AsString)
          + ' and tpmember_begin_value <= ' + CurrToStr(TotalRupiah)
          + ' and tpmember_end_value >= ' + CurrToStr(TotalRupiah);
        FormatSettings.DecimalSeparator := lDecimalSeparator;
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

	with sgTransaksi.DataController do
	begin
		for i := 1 to RecordCount-1 do    // Iterate
		begin
      if (Values[i, _KolIsDiscGMC] = '1')
        and (Values[i, _KolJumlah] <= Values[i, _KolMaxDiscQTY]) then
				Result := Result + Values[i, _KolTotal];
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
//  sgTransaksi.ClearRows(1,sgTransaksi.RowCount-2);
//  sgTransaksi.RowCount := 2;
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
//    sgTransaksi.UnHideColumns(_KolIsDecimal,_KolMaxDiscQTY);
//    sgTransaksi.SaveToCSV(cGetAppPath + 'trans_detail_' + AMemberCode + '.csv');
//    sgTransaksi.HideColumns(_KolIsDecimal,_KolMaxDiscQTY);
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

  lDecimalSeparator := FormatSettings.DecimalSeparator;
  FormatSettings.DecimalSeparator  := '.';

  ssSQL := TStringList.Create;
  try
      dtTransaksi := cGetServerDateTime;
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
            for i := 1 to DataController.RecordCount - 1 do
            begin
              if DataController.Values[i, _KolPLU] = '' then Continue;

              bIsBKP := False;
              if DataController.Values[i, _KolIsBKP] = '1' then
                bIsBKP := True;

              bIsDiscAMC := False;
              if DataController.Values[i, _KolIsDiscGMC] = '1' then
                bIsDiscAMC := True;

              UpdatePOSTransactionItems(DataController.Values[i, _KolBHJID], //Barang harga jual ID
                DataController.Values[i, _KolCOGS], //COGS
                DataController.Values[i, _KolDetailID], //Detail ID
                bIsBKP, bIsDiscAMC, //ID, IsBKP, IsDiscAMC
                DataController.Values[i, _KolLastCost], //last cost
                DataController.Values[i, _KolPPN], //PPN
                DataController.Values[i, _KolPPNBM], //PPNBM
                DataController.Values[i, _KolJumlah], //QTY
                DataController.Values[i, _KolHarga], //SellPrice
                DataController.Values[i, _KolHarga] - DataController.Values[i, _KolDisc], //SellPriceDisc
                DataController.Values[i, _KolTotal], //Total
                RoundTo(DataController.Values[i, _KolJumlah] * DataController.Values[i, _KolHargaExcPajak], igPrice_Precision), //totalb4tax
                (DataController.Values[i, _KolTotal]), //total ceil
                edNoTrnTerakhir.Text,
                frmMain.UnitID,
                DataController.Values[i, _KolPLU],
                DataController.Values[i, _KolTipeBarang], GetDiscItemAMCRp(i),
                DataController.Values[i, _KolUOM],
                0,
                DataController.Values[i, _KolDiscMan],
                DataController.Values[i, _Koldiscoto]);
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
    FormatSettings.DecimalSeparator := lDecimalSeparator;
    FreeAndNil(ssSQL);
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
    try
//      if sgTransaksi.DataController.Values[1, _KolPLU] = '' then Exit;
      if sgTransaksi.DataController.RecordCount=0 then Exit;
    finally
    end;

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
  if Assigned(sgHeader) then
     FreeAndNil(sgHeader);
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
        DataController.FocusedRecordIndex := DataController.RecordCount-2;
        ClearRows;
//        AutoNumberCol(0);
        HitungTotalRupiah;
        SaveTransactionToCSV;
        edHargaKontrabon.Visible  := False;
        lblHargaKontrabon.Visible := False;
        cxTransaksi.Enabled       := True;
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
  with sgTransaksi.DataController do
  begin
    if (Values[ARow, _KolIsDiscGMC] = '1')
      and (Values[ARow, _KolJumlah] <= Values[ARow, _KolMaxDiscQTY]) then
      Result := (Values[ARow, _KolHarga]-Values[ARow, _KolDisc]) * (aDiscAMCPersen/100);
  end;
end;

function TfrmTransaksi.HitungTotalRupiahBarangPPN: Currency;
var
  i: Integer;
  dTotalHargaGross: Double;
begin
  Result := 0;
  with sgTransaksi.DataController do
  begin
    for i := 0 to RecordCount - 1 do    // Iterate
    begin
      dTotalHargaGross := (Values[i, _KolHargaExcPajak]);
      Result := Result + RoundTo(Values[i, _KolJumlah] *
      (((dTotalHargaGross * Values[i, _KolPPN]) / 100) +
        ((dTotalHargaGross * Values[i, _KolPPNBM]) / 100)), igPrice_Precision);
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
       + ' and usr_username =' + QuotedStr(edtUsername.Text);

  with cOpenQuery(sSql) do
  begin
    try
      if not Eof then
      begin
        if edtPassword.Text <> FieldByName('USR_PASSWD').AsString then
        begin
          CommonDlg.ShowMessage('Password salah');
          sgTransaksi.DataController.Values[brs, _KolDiscManForm] := sValueBefore;
          sgTransaksi.DataController.Values[brs, _KolDiscMan]     := sValueBefore;
          sgTransaksi.DataController.Values[brs, _KolTotal]      := GetTotalHarga(brs);
          ActiveGrid;
          Exit;
        end;
      end
      else
      begin
        CommonDlg.ShowMessage('User ini tidak berhak melakukan discount manual');
        sgTransaksi.DataController.Values[brs, _KolDiscManForm] := sValueBefore;
        sgTransaksi.DataController.Values[brs, _KolDiscMan]     := sValueBefore;
        sgTransaksi.DataController.Values[brs, _KolTotal]      := GetTotalHarga(brs);
        ActiveGrid;
        Exit;
      end;
    finally
      Free;
    end;
  end;
  pnlotorisasi.Visible := False;

  if (Application.MessageBox( 'Apakah Discount untuk seluruh barang ?',
                              'Options',
                              MB_YesNo Or MB_ICONQUESTION Or MB_DEFBUTTON2)=ID_Yes) then
  begin
    sDiscount := sgTransaksi.DataController.Values[brs, _KolDiscManForm];
    for i := 1 to sgTransaksi.DataController.RecordCount - 1 do
    begin
      if sgTransaksi.DataController.Values[i, _KolPLU] <> '' then
      begin
        if (sgTransaksi.DataController.Values[i, _KolDisc] = 0) and (sgTransaksi.DataController.Values[i, _KolIsKontrabon] = 0) then
        begin
          sValue    := StringReplace(sDiscount, '*', '%', [rfReplaceAll]);
          IsPercent := Pos('%', sValue) > 0;
          sValue    := StringReplace(sValue, '%', '', [rfReplaceAll]);
          if not TryStrToFloat(sValue,dValue) then
            dValue  := 0;
          If IsPercent then
            dValue  := dValue/100 * sgTransaksi.DataController.Values[i, _KolHarga];

          sgTransaksi.DataController.Values[i, _KolDiscManForm] := sDiscount;
          sgTransaksi.DataController.Values[i, _KolDiscMan]    := dValue;
          sgTransaksi.DataController.Values[i, _KolTotal]      := GetTotalHarga(i);
          sgTransaksi.DataController.Values[i, _Koldiscoto]     := edtUsername.Text;
        end;
      end;
    end;
  end
  else
  begin
    sgTransaksi.DataController.Values[brs, _Koldiscoto]  := edtUsername.Text;
    sgTransaksi.DataController.Values[brs, _KolDiscMan] := DiscOto;
    sgTransaksi.DataController.Values[brs, _KolTotal]   := GetTotalHarga(brs);
  end;
  ActiveGrid;

  with sgTransaksi do
  begin
    HitungTotalRupiah;
    Controller.FocusedColumnIndex := _KolPLU;
    Controller.FocusedRecordIndex    := sgTransaksi.DataController.RecordCount - 1;
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
  cxTransaksi.Enabled   := True;
  cxTransaksi.SetFocus;
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
  sgTransaksi.DataController.Values[brs, _KolDiscManForm] := sValueBefore;
  sgTransaksi.DataController.Values[brs, _KolDiscMan]     := sValueBefore;
  sgTransaksi.DataController.Values[brs, _KolTotal]      := GetTotalHarga(brs);
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
        dValue    := dValue/100 * sgTransaksi.DataController.Values[Row, _KolHarga];

      DiscOto     := dValue;
      FIsEditMode := True;

      pnlotorisasi.Left      := (Screen.ActiveForm.Width div 2)-(pnlotorisasi.Width div 2);
      pnlotorisasi.Visible   := True;
      edtUsername.SetFocus;
      Brs                    := Row;
    end;
  end;
end;

procedure TfrmTransaksi.edNoPelangganEnter(Sender: TObject);
begin
  edNoPelanggan.Style.Color := clYellow;
end;

function TfrmTransaksi.HitungTotalRupiahBarangBKP: Currency;
var
  i: Integer;
begin
  Result := 0;
  with sgTransaksi.DataController do
  begin
  for i := 0 to RecordCount - 1 do
    begin
      if Values[i, _KolIsBKP] = '1' then
      begin
        Result := Result + RoundTo(Values[i, _KolTotal], igPrice_Precision);
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
  with sgTransaksi.DataController do
  begin
    for i := 0 to RecordCount - 1 do
    begin
      if Values[i, _KolPLU] <> '' then
      begin
        ValueDM := Values[i, _KolDiscManForm];
        DiscMstrValue := StringReplace(ValueDM, '*', '%', [rfReplaceAll]);

        if TryStrToFloat(DiscMstrValue,dValue) then
        begin
          Result := Result + RoundTo(Values[i, _KolJumlah] * (Values[i, _KolDisc]+
            Values[i, _KolDiscManForm]), igPrice_Precision);
        end
        else
        begin
          Result := Result + RoundTo(Values[i, _KolJumlah] * (Values[i, _KolDisc]+
            ((Values[i, _KolDiscManForm]/100)*Values[i, _KolHarga])), igPrice_Precision);
        end;
      end;
    end;
  end;
  TotalRupiahBarangDiscount := Result;
end;

procedure TfrmTransaksi.SetGridFormat_Column(aColIndex: Integer; aIsCurrency:
    Boolean = True);
begin
  try
      with sgTransaksi.Columns[aColIndex] do
      begin
        PropertiesClass := TcxCurrencyEditProperties;
        with TcxCurrencyEditProperties(Properties) do
        begin
          Alignment.Horz := taRightJustify;
          UseThousandSeparator := True;
          if aIsCurrency then
          begin
            DecimalPlaces := igQty_Precision;
            DisplayFormat := ',0.###';
          end
          else
          begin
            DecimalPlaces := igPrice_Precision;
            DisplayFormat := ',0.00';
          end;
        end;
      end;
  finally
  end;
end;

procedure TfrmTransaksi.AutoNumberCol(Sender: TcxCustomGridTableItem; ARecord:
    TcxCustomGridRecord; var AText: string);
var
  Row: Integer;
begin
  Row := Sender.GridView.DataController.GetRowIndexByRecordIndex(ARecord.RecordIndex, False);
  AText := IntToStr(Row+1);
end;

procedure TfrmTransaksi.sgTransaksiEditing(Sender: TcxCustomGridTableView; AItem:
    TcxCustomGridTableItem; var AAllow: Boolean);
begin
  if (Sender.Controller.FocusedRecordIndex in [_KolJumlah,_KolDiscMan,_KolDiscManForm])
     and (sgTransaksi.DataController.Values[AItem.Index, _KolPLU] <> '') then
    AAllow := True
  else
    AAllow := False;
end;

procedure TfrmTransaksi.sgTransaksiInitEdit(Sender: TcxCustomGridTableView; AItem:
    TcxCustomGridTableItem; AEdit: TcxCustomEdit);
var
  ACol, ARow : integer;
begin
  ACol := sgTransaksi.Controller.FocusedColumnIndex;
  ARow := sgTransaksi.Controller.FocusedRecordIndex;
  if (ACol = _KolJumlah) or (ACol = _KolDiscMan)  then
    sgTransaksi.Controller.EditingController.ShowEdit(AItem);// := edFloat;
  if (ARow > 0) and (ACol > 0) then
  begin
    if ACol in [_KolJumlah] then
    begin
      TcxCurrencyEditProperties(sgTransaksi.Columns[_KolJumlah].Properties).DisplayFormat := '%.' + IntToStr(Abs(igQty_Precision)) + 'n';
    end
    else if ACol in [_KolDisc,_KolDiscMan] then
    begin
      TcxCurrencyEditProperties(sgTransaksi.Columns[_KolDisc].Properties).DisplayFormat := '%.' + IntToStr(Abs(igPrice_Precision)) + 'n';
      TcxCurrencyEditProperties(sgTransaksi.Columns[_KolDiscMan].Properties).DisplayFormat := '%.' + IntToStr(Abs(igPrice_Precision)) + 'n';
    end
    else if ACol in [_KolHarga, _KolTotal] then
    begin
      TcxCurrencyEditProperties(sgTransaksi.Columns[_KolHarga].Properties).DisplayFormat := '%.' + IntToStr(Abs(igPrice_Precision)) + 'n';
      TcxCurrencyEditProperties(sgTransaksi.Columns[_KolTotal].Properties).DisplayFormat := '%.' + IntToStr(Abs(igPrice_Precision)) + 'n';
    end;
  end;
  if ACol = _KolDiscManForm then
  begin
    if not pnlotorisasi.Visible then
    begin
      sValueBefore := sgTransaksi.DataController.Values[ACol,Arow];
    end;
  end;

end;

procedure TfrmTransaksi.sgTransaksiKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  if ((Key = VK_DOWN) or (Key = 34))
     and (sgTransaksi.DataController.FocusedRecordIndex = sgTransaksi.DataController.RecordCount-1) then
  begin
    if fraLookupBarang.Showing then
       fraLookupBarang.cxGrid.SetFocus;
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
      sgTransaksi.Controller.FocusedColumnIndex := _KolPLU;
      sgTransaksi.Controller.FocusedRecordIndex := sgTransaksi.DataController.RecordCount - 1;
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
      if Controller.FocusedRecordIndex < DataController.RecordCount - 1 then
      begin
        if CommonDlg.Confirm('Apakah Anda yakin akan menghapus PLU: '
          + DataController.Values[Controller.FocusedRecordIndex, _KolPLU] + ' - '
          + DataController.Values[Controller.FocusedRecordIndex, _KolNamaBarang]) = mrYes then
        begin
          ClearRows;
//          AutoNumberCol(0);
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

end.
