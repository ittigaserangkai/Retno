unit ufrmPayment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, EnhEdit, AdvEdit, advlued, Mask,
  ufraLookUpCC, uRMSUnit, uSpell, 
  uNewBarang, uNewTipeBarang;

type
  VoucherDetail = record
    Nomor  : string;
    Jumlah : Integer;
    Nilai  : Currency;
  end;

type
  TfrmPayment = class(TForm)
    pnlTotal: TPanel;
    lblTotal: TLabel;
    lbl1: TLabel;
    Panel12: TPanel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    edtTotalBelanja: TEnhancedEdit;
    edtDiscGMCNominal: TEnhancedEdit;
    edtBrgDiscGMC: TEnhancedEdit;
    edtDiscGMCPersen: TEnhancedEdit;
    pnlPayment: TPanel;
    lblResetVoucher: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl9: TLabel;
    bvl1: TBevel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl16: TLabel;
    bvl2: TBevel;
    Label16: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    lblCashback: TLabel;
    Label32: TLabel;
    strgTmpVoucher: TStringGrid;
    strgTempLainLain: TStringGrid;
    pnlPembulatan: TPanel;
    LblPembulatan: TLabel;
    Label18: TLabel;
    Panel10: TPanel;
    Edit1: TEdit;
    edtNilaiBayar: TEnhancedEdit;
    edtNilaiTunai: TAdvLUEdit;
    edtChargeCreditCard: TAdvLUEdit;
    edtNilaiCC: TAdvLUEdit;
    edtNomorCC: TAdvMaskEdit;
    edtBotolValue: TAdvLUEdit;
    edtGoroValue: TAdvLUEdit;
    edtVoucherValue: TAdvLUEdit;
    edtJenisKartuCode: TAdvEdit;
    edtJenisKartuName: TAdvEdit;
    edtNoOtorisasiCC: TAdvEdit;
    edtNoTransBotol: TAdvEdit;
    edtNoVoucher: TAdvEdit;
    edtCashBack: TAdvLUEdit;
    fraLookUpCC: TfraLookUpCC;
    edtPilihan: TAdvEdit;
    mmoBackup: TMemo;
    mmoTemp: TMemo;
    mmoHeadStruk: TMemo;
    mmoIsiStruk: TMemo;
    mmoFooterStruk: TMemo;
    edtSisaUang: TAdvLUEdit;
    mmoIsiCB: TMemo;
    edtBotolQty: TAdvLUEdit;
    edtGoroQty: TAdvLUEdit;
    edtVoucherQty: TAdvLUEdit;
    tmrInfo: TTimer;
    pnlInfo: TPanel;
    lblInfo: TLabel;
    edtCCDisc: TAdvLUEdit;
    edtCCDiscNominal: TAdvLUEdit;
    Label1: TLabel;
    edtBayarCC: TAdvLUEdit;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtNilaiTunaiChange(Sender: TObject);
    procedure edtNilaiCCChange(Sender: TObject);
    procedure edtJenisKartuCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fraLookUpCCsgLookupKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure fraLookUpCCedNamaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtJenisKartuCodeExit(Sender: TObject);
    procedure edtPilihanKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNilaiCCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomorCCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNoOtorisasiCCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNilaiTunaiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNoTransBotolKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCashBackKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNilaiCCExit(Sender: TObject);
    procedure edtCashBackExit(Sender: TObject);
    procedure edtNoTransBotolExit(Sender: TObject);
    procedure tmrInfoTimer(Sender: TObject);
    procedure edtNoVoucherKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNoVoucherExit(Sender: TObject);
    procedure edtVoucherQtyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtVoucherValueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edtNoTransBotolKeyPress(Sender: TObject; var Key: Char);
    procedure edtBayarCCChange(Sender: TObject);
    procedure edtBayarCCExit(Sender: TObject);
    procedure edtBayarCCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtGoroQtyKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtGoroValueKeyDown(Sender: TObject; var Key: Word; Shift:
        TShiftState);
  private
    FCardID: Integer;
		FCashBackNilai: Currency;
		FCashNilai: Currency;
		FCCCharge: Currency;
    FCCChargePersen: Currency;
    FCCLimit: Currency;
		FCCNilai: Currency;
    FCC_Minimum: Currency;
    FCashback_Minimum: Currency;
    FCashback_Kelipatan: Currency;
    FCashback_Maximum: Currency;
    FCCBayar: Currency;
    FCCDisc: Double;
    FCCDiscNominal: Currency;
    FSisaUang_Maksimum: Currency;
		FDiscAMCPersen: Double;
		FDiscAMCRupiah: Currency;
    FIsCashbackCard: Boolean;
    FIsCreditCard: Boolean;
    FKonstantaPembulatan: Currency;
		FPembulatan: Currency;
    FShowFooterKembalian: Integer;
		FSisaUang: Currency;
		FTotalBarangAMC: Currency;
    FTotalBarangPPN: Currency;
    FTotalBarangCC: Currency;
		FTotalBayar: Currency;
		FTotalBelanja: Currency;
    FVoucherLainJumlah: TStrings;
    FVoucherLainNilai: TStrings;
    FVoucherAssalaamNomor: TStrings;
    FVoucherAssalaamJumlah: TStrings;
    FVoucherAssalaamNilai: TStrings;
    FVoucherLainJumlahTotal: Double;
    FVoucherLainNilaiTotal: Double;
    FTipeIDConcession: Integer;
    FIsConcession: Boolean;
    FIsSaved: Boolean;
    FNewBarang: TNewBarang;
    procedure ClearCCForm;
    function GetAmountNonJB(aRow: Integer): Double;
		function GetDiscAMCRupiah: Currency;
    function GetNewBarang: TNewBarang;
		function GetPembulatan: Currency;
		function GetTotalBayar: Currency;
    function GetVoucherLainJumlah: TStrings;
    function GetVoucherLainNilai: TStrings;
    function GetVoucherAssalaamNomor: TStrings;
    function GetVoucherAssalaamJumlah: TStrings;
    function GetVoucherAssalaamNilai: TStrings;
    procedure LoadCreditCard(ACode: String);
    //procedure LineReceived(Sender : TLineSocketBase; const line : string;
    //          complete : Boolean);
    procedure ParsingPrintStrukTrans;
    procedure SetCCDisc(const Value: Double);
    procedure SetCCDiscNominal(const Value: Currency);
    property IsSaved: Boolean read FIsSaved write FIsSaved;
  public
    procedure AddVoucherAssalaam(AVoucherNo: String; AVoucherNilai: Double);
    procedure AddVoucherLain(AVoucherQty, AVoucherNilai: Double);
    function CekPLUQtyInGrid(APLU: String; AQTY: Integer): Boolean;
    function GetCCChargePersen: Double;
		function GetKonstantaPembulatan: Currency;
    function GetKuponBotolStatus(ANoTransaksi: String): Integer;
    function GetVoucherStatus(ANoVoucher: String): Integer;
    function GetSisaBayar(AExclude: Double = 0): Currency;
    function Get_Qty_Precision: string;
    function HitungCCCharge: Currency;
		procedure HitungSisaUang;
		procedure ResetAll;
    procedure ShowCashBack;
    procedure HideCashBack;
    procedure HideInfo;
    //procedure LineReceived(Sender : TLineSocketBase; const line : string;
    //          complete : Boolean);
    procedure ParsingPrintCardValidasi;
    procedure ParsingPrintConsValidasi;
    procedure ResetVoucher;
    function SaveToDB: Boolean;
    procedure ShowInfo(AInfo: String; ALabelColor: TColor = clRed;
        ABackgroundColor: TColor = clYellow);
		procedure ShowTotalBayar;
    procedure UpdateDataLokal(ATotalBelanja, ATotalBarangAMC: Currency;
        ADiscAMCPersen: Double; ATotalBarangCC: Currency; ATotalBarangPPN:
        Currency);
    property CardID: Integer read FCardID write FCardID;
    property TipeIDConcession: Integer read FTipeIDConcession write
        FTipeIDConcession;
		property CashBackNilai: Currency read FCashBackNilai write FCashBackNilai;
		property CashNilai: Currency read FCashNilai write FCashNilai;
		property CCCharge: Currency read FCCCharge write FCCCharge;
    property CCChargePersen: Currency read FCCChargePersen write FCCChargePersen;
    property CCLimit: Currency read FCCLimit write FCCLimit;
		property CCNilai: Currency read FCCNilai write FCCNilai;
    property CC_Minimum: Currency read FCC_Minimum write FCC_Minimum;
    property Cashback_Minimum: Currency read FCashback_Minimum write
        FCashback_Minimum;
    property Cashback_Kelipatan: Currency read FCashback_Kelipatan write
        FCashback_Kelipatan;
    property Cashback_Maximum: Currency read FCashback_Maximum write
        FCashback_Maximum;
    property CCBayar: Currency read FCCBayar write FCCBayar;
    property CCDisc: Double read FCCDisc write SetCCDisc;
    property CCDiscNominal: Currency read FCCDiscNominal write SetCCDiscNominal;
    property SisaUang_Maksimum: Currency read FSisaUang_Maksimum write
        FSisaUang_Maksimum;
		property DiscAMCPersen: Double read FDiscAMCPersen write FDiscAMCPersen;
		property DiscAMCRupiah: Currency read GetDiscAMCRupiah write FDiscAMCRupiah;
    property IsCashbackCard: Boolean read FIsCashbackCard write FIsCashbackCard;
    property IsCreditCard: Boolean read FIsCreditCard write FIsCreditCard;
    property IsConcession: Boolean read FIsConcession write FIsConcession;
    property KonstantaPembulatan: Currency read FKonstantaPembulatan write
        FKonstantaPembulatan;
    property NewBarang: TNewBarang read GetNewBarang write FNewBarang;
		property Pembulatan: Currency read GetPembulatan write FPembulatan;
    property ShowFooterKembalian: Integer read FShowFooterKembalian write
        FShowFooterKembalian;
		property SisaUang: Currency read FSisaUang write FSisaUang;
		property TotalBarangAMC: Currency read FTotalBarangAMC write FTotalBarangAMC;
    property TotalBarangPPN: Currency read FTotalBarangPPN write FTotalBarangPPN;
    property TotalBarangCC: Currency read FTotalBarangCC write FTotalBarangCC;
		property TotalBayar: Currency read GetTotalBayar write FTotalBayar;
		property TotalBelanja: Currency read FTotalBelanja write FTotalBelanja;
    property VoucherLainJumlah: TStrings read GetVoucherLainJumlah write
        FVoucherLainJumlah;
    property VoucherLainNilai: TStrings read GetVoucherLainNilai write
        FVoucherLainNilai;
    property VoucherAssalaamNomor: TStrings read GetVoucherAssalaamNomor write
        FVoucherAssalaamNomor;
    property VoucherAssalaamJumlah: TStrings read GetVoucherAssalaamJumlah write
        FVoucherAssalaamJumlah;
    property VoucherAssalaamNilai: TStrings read GetVoucherAssalaamNilai write
        FVoucherAssalaamNilai;
    property VoucherLainJumlahTotal: Double read FVoucherLainJumlahTotal write
        FVoucherLainJumlahTotal;
    property VoucherLainNilaiTotal: Double read FVoucherLainNilaiTotal write
        FVoucherLainNilaiTotal;
  end;

var
  frmPayment: TfrmPayment;
  iEdit : Integer;

implementation

uses
  uGTSUICommonDlg, Math, ufrmMain, DB, ufrmTransaksi, AdvCGrid, StrUtils, uConstanta,
  AdvGrid, BaseGrid, HPHELP, DateUtils, uPosTransaction, uVoucherLain,
  uBarangStockSirkulasi, IBQuery;

{$R *.dfm}

procedure TfrmPayment.AddVoucherAssalaam(AVoucherNo: String; AVoucherNilai:
    Double);
begin
  VoucherAssalaamNomor.Add(AVoucherNo);
  VoucherAssalaamJumlah.Add('1');
  VoucherAssalaamNilai.Add(FloatToStr(AVoucherNilai));
end;

procedure TfrmPayment.AddVoucherLain(AVoucherQty, AVoucherNilai: Double);
begin
  VoucherLainJumlah.Add(FloatToStr(AVoucherQty));
  VoucherLainNilai.Add(FloatToStr(AVoucherNilai));
  VoucherLainJumlahTotal := VoucherLainJumlahTotal + AVoucherQty;
  VoucherLainNilaiTotal := VoucherLainNilaiTotal + (AVoucherNilai * AVoucherQty);
end;

function TfrmPayment.CekPLUQtyInGrid(APLU: String; AQTY: Integer): Boolean;
var
  i: Integer;
begin
  Result := False;
  with frmTransaksi.sgTransaksi do
  begin
    for i := 1 to RowCount - 1 do    // Iterate
    begin
      if Columns[_KolPLU].Rows[i] = '' then Continue;
      if Trim(Columns[_KolPLU].Rows[i]) = Trim(APLU) then
      begin
        if Columns[_KolJumlah].Floats[i] >= AQTY then
        begin
          Result := True;
          Break;
        end;  
      end;
    end;    // for
  end;    // with
end;

procedure TfrmPayment.ClearCCForm;
begin
  CCChargePersen := 0;
  CCLimit := 0;
  CCCharge := 0;
  CCNilai := 0;
  IsCashbackCard := False;

  edtJenisKartuCode.Clear;
  edtJenisKartuName.Clear;
  edtChargeCreditCard.FloatValue := 0;
  edtNilaiCC.FloatValue := 0;
  edtCashBack.FloatValue := 0;
end;

procedure TfrmPayment.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //frmTransaksi.edNoPelanggan.Text := '';
  //frmTransaksi.edNoPelanggan.Text := '0';
  if not assigned(frmTransaksi) then
    frmTransaksi.FormShow(frmTransaksi);
  Action := caFree;  
end;

function TfrmPayment.GetDiscAMCRupiah: Currency;
begin
  FDiscAMCRupiah := 0;
  try
	  FDiscAMCRupiah := (TotalBarangAMC * DiscAMCPersen) / 100;
  except
  end;
	Result := FDiscAMCRupiah;
end;

function TfrmPayment.GetKonstantaPembulatan: Currency;
begin
	Result := KonstantaPembulatan;
end;

function TfrmPayment.GetPembulatan: Currency;
begin
  {
  FPembulatan := 0;
  try
    if CCNilai = 0 then
    begin
      dTemp := TotalBayar / GetKonstantaPembulatan;
      dTemp := dTemp + 0.5;
      dTemp := Round(dTemp) * GetKonstantaPembulatan;
      FPembulatan := 0;
    end;  
  except
  end;
  }
	Result := FPembulatan;
end;

function TfrmPayment.GetTotalBayar: Currency;
var
	dTemp: Currency;
begin
  FTotalBayar := 0;
  try
    FTotalBayar := (TotalBelanja + CCCharge)
    	- (DiscAMCRupiah + edtBotolValue.FloatValue + edtGoroValue.FloatValue + VoucherLainNilaiTotal )
  except
  end;

  FTotalBayar := Ceil(FTotalBayar);
  Pembulatan := 0;
  try
    if edtJenisKartuName.Text = '' then
    begin
      dTemp := FTotalBayar / GetKonstantaPembulatan;
//      dTemp := dTemp + 0.5;
//      dTemp := RoundTo(dTemp);
      dTemp := Ceil(dTemp);
      dTemp := dTemp * GetKonstantaPembulatan;
      Pembulatan := dTemp - FTotalBayar;
      FTotalBayar := dTemp;
    end;
  except
  end;

	Result := FTotalBayar;
end;

procedure TfrmPayment.HitungSisaUang;
begin
	SisaUang := (edtNilaiTunai.FloatValue + edtBayarCC.FloatValue)-(edtNilaiBayar.Value);
  if SisaUang < 0 then
  begin
    edtSisaUang.Color := clRed;
    edtSisaUang.Font.Color := clBlue;
  end
  else
  begin
    edtSisaUang.Color := clGreen;
    edtSisaUang.Font.Color := clYellow;
  end;

  //edtSisaUang.FloatValue := SisaUang;
  edtSisaUang.Text := FormatFloat('#,##0.00',SisaUang);
end;

procedure TfrmPayment.ResetAll;
begin
	TotalBelanja := 0;
  TotalBarangAMC := 0;
  TotalBarangPPN := 0;
  DiscAMCPersen := 0;
  CashNilai := 0;
  CCNilai := 0;
  CCCharge := 0;
  CashBackNilai := 0;
  SisaUang := 0;
  Pembulatan := 0;
  CashBackNilai := 0;
  TotalBayar := 0;

  edtTotalBelanja.Value := RoundTo(TotalBelanja, 0);
  edtBrgDiscGMC.Value := TotalBarangAMC;
  edtDiscGMCPersen.Value := DiscAMCPersen;
  edtDiscGMCNominal.Value := DiscAMCRupiah;
  

  edtNilaiTunai.FloatValue := CashNilai;

  edtJenisKartuCode.Clear;
  edtJenisKartuName.Clear;
  edtChargeCreditCard.FloatValue := CCCharge;
  edtNilaiCC.FloatValue := CCNilai;
  edtNomorCC.Clear;
  edtNoOtorisasiCC.Clear;
  edtCashBack.FloatValue := CashBackNilai;

  edtNoTransBotol.Clear;
  edtNoTransBotolExit(edtNoTransBotol);
  ResetVoucher;
  
  ShowTotalBayar;
end;

procedure TfrmPayment.UpdateDataLokal(ATotalBelanja, ATotalBarangAMC: Currency;
    ADiscAMCPersen: Double; ATotalBarangCC: Currency; ATotalBarangPPN:
    Currency);
begin
  ResetAll;

  TotalBelanja      := ATotalBelanja;
  TotalBarangAMC    := ATotalBarangAMC;
  TotalBarangCC     := ATotalBarangCC;
  DiscAMCPersen     := ADiscAMCPersen;
  TotalBarangPPN    := ATotalBarangPPN;

	edtTotalBelanja.Value   := Ceil(TotalBelanja);
  edtBrgDiscGMC.Value     := TotalBarangAMC;
  edtDiscGMCPersen.Value  := DiscAMCPersen;
  edtDiscGMCNominal.Value := Floor(DiscAMCRupiah);

//  if DiscAMCRupiah < edtDiscGMCNominal.Value then
//  edtDiscGMCNominal.Value := edtDiscGMCNominal.Value-1;

  ShowTotalBayar;
  HitungSisaUang;

  edtPilihan.SetFocus;
  edtPilihan.SelectAll;
end;

procedure TfrmPayment.edtNilaiTunaiChange(Sender: TObject);
begin
  CashNilai := edtNilaiTunai.FloatValue;
  HitungSisaUang;
end;

procedure TfrmPayment.ShowTotalBayar;
var
  sPrec: string;
begin
  sPrec       := '';
	edtNilaiBayar.Value := TotalBayar;

  pnlPembulatan.Visible := False;
  LblPembulatan.Caption := FormatCurr('#,##0' + sPrec,0);
  if Pembulatan > 0 then
  begin
    pnlPembulatan.Visible := True;
    LblPembulatan.Caption := FormatCurr('#,##0' + sPrec,Pembulatan);
  end;

  HitungSisaUang;
end;

procedure TfrmPayment.edtNilaiCCChange(Sender: TObject);
begin
//  if iEdit = 0 then
//  begin             
//    CCNilai                 := edtNilaiCC.FloatValue;
//    iEdit                   := 1;
//    ShowTotalBayar;
//  end
//  else
//  begin          
//    CCNilai                 := edtNilaiCC.FloatValue;
//    CCDiscNominal           := (CCDisc/100)*CCNilai;
//    edtCCDiscNominal.Text   := FormatFloat('#,##0',CCDiscNominal);
//    ShowTotalBayar;
//  end;
//  HitungSisaUang;
end;

function TfrmPayment.GetCCChargePersen: Double;
begin
  Result := CCChargePersen;
end;

function TfrmPayment.HitungCCCharge: Currency;
begin
  Result := 0;
  try
    Result := Ceil(TotalBarangCC * GetCCChargePersen() / 100);
  except
  end;
  CCCharge := Result;
end;

procedure TfrmPayment.edtJenisKartuCodeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key in [VK_ESCAPE] then
  begin
    edtPilihan.SetFocus;
  end
  else if Key in [VK_F5] then
  begin
    fraLookUpCC.Visible := True;
    fraLookUpCC.edNama.SetFocus;
  end
  else if Key in [VK_RETURN] then
  begin
//    edtBayarCC.SetFocus;
    LoadCreditCard(edtJenisKartuCode.Text);
    if edtJenisKartuName.Text = '' then
    begin
      edtPilihan.SetFocus;
    end
    else
    begin
      edtBayarCC.SetFocus; 
    end;
  end;
end;

procedure TfrmPayment.fraLookUpCCsgLookupKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  fraLookUpCC.sgLookupKeyDown(Sender,Key,Shift);
  if Key in [VK_ESCAPE] then
  begin
    fraLookUpCC.Visible := False;
    edtJenisKartuCode.SetFocus;
    edtJenisKartuCode.SelectAll;
  end
  else if Key in [VK_RETURN] then
  begin  
    fraLookUpCC.Visible := False;
    edtJenisKartuCode.Text := fraLookUpCC.CC_Code;

    edtJenisKartuCodeExit(edtJenisKartuCode);
    edtBayarCC.SetFocus;
    edtBayarCC.SelectAll;
    iEdit := 0;
  end;
end;

procedure TfrmPayment.FormCreate(Sender: TObject);
begin
  fraLookUpCC.LoadData(frmMain.UnitID, 0);
  try
    //CC_Minimum := StrToCurr(getGlobalVar('POS_CC_MIN'));
    Cashback_Minimum    := StrToCurr(getGlobalVar('POS_CASHBACK_MIN'));
    SisaUang_Maksimum   := StrToCurr(getGlobalVar('POS_SISAUANG_MAX'));
    Cashback_Kelipatan  := StrToCurr(getGlobalVar('POS_CASHBACK_KELIPATAN'));
    Cashback_Maximum    := StrToCurr(getGlobalVar('POS_CASHBACK_MAX'));
    KonstantaPembulatan := StrToCurr(getGlobalVar('POS_PEMBULATAN'));
    ShowFooterKembalian := StrToInt(getGlobalVar('POS_SHOW_SISAKEMBALIAN'));
    TipeIDConcession    := StrToInt(getGlobalVar('POS_CONCESSION'));
  except
  end;
end;

procedure TfrmPayment.fraLookUpCCedNamaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  fraLookUpCC.edNamaKeyDown(Sender,Key,Shift);
  if Key in [VK_ESCAPE] then
  begin
    fraLookUpCC.Visible := False;
    edtJenisKartuCode.SetFocus;
    edtJenisKartuCode.SelectAll;
  end;
end;

procedure TfrmPayment.LoadCreditCard(ACode: String);
var
  sSQL: string;
begin
  sSQL := 'select card_code, card_name, card_limit, card_charge, '
    +' card_is_cashback, card_is_credit, card_id, CARD_DISCOUNT'
    + ' from ref$credit_card '
    + ' where card_unt_id = ' + IntToStr(frmMain.UnitID)
    + ' and CARD_IS_ACTIVE = 1' // BP Was Here
    + ' and (CARD_IS_KRING = 0 or CARD_IS_KRING is null)'
    + ' and card_code = ' + QuotedStr(ACode)
    + ' order by card_code';

  ClearCCForm;
  with cOpenQuery(sSQL) do
  begin
    try
      if not eof then
      begin
        HideCashBack;
        CardID                 := Fields[6].AsInteger;
        edtJenisKartuCode.Text := Fields[0].AsString;
        edtJenisKartuName.Text := Fields[1].AsString;
        CCChargePersen         := Fields[3].AsCurrency;
        CCLimit                := Fields[2].AsCurrency;
        CCDisc                 := Fields[7].AsFloat;
        edtCCDisc.FloatValue   := CCDisc;
        edtNilaiCC.FloatValue  := 0;




        
        if Fields[5].AsInteger = 1 then
          IsCreditCard := True
        else
          IsCreditCard := False;     
        edtChargeCreditCard.FloatValue := HitungCCCharge;

        CCBayar               := TotalBayar-edtNilaiTunai.FloatValue;
        edtBayarCC.Text       := FormatFloat('#,##0',CCBayar);
        if CCDisc <> 0 then
        begin
//          CCBayar               := TotalBayar-edtNilaiTunai.FloatValue;
//          edtBayarCC.Text       := FormatFloat('#,##0',CCBayar);
          CCDiscNominal         := (CCDisc/100)*(CCBayar);
          CCDiscNominal         := Floor(CCDiscNominal);
          edtCCDiscNominal.Text := FormatFloat('#,##0',CCDiscNominal);
          iEdit                 := 0;
        end
        else
        CCDiscNominal := 0;

        HitungSisaUang;


        if Fields[4].AsInteger = 1 then
        begin
          IsCashbackCard := True;
          ShowCashBack;
        end;
      end;// else
      //  ClearCCForm;
    finally
      Free;
    end;
  end;
  ShowTotalBayar;
end;

procedure TfrmPayment.ShowCashBack;
begin
  lblCashback.Visible := True;
  edtCashBack.Visible := True;
end;

procedure TfrmPayment.HideCashBack;
begin
  lblCashback.Visible := False;
  edtCashBack.Visible := False;
  edtCashBack.FloatValue := 0;
end;

procedure TfrmPayment.edtJenisKartuCodeExit(Sender: TObject);
begin
  CCDisc                  := 0;
  CCDiscNominal           := 0;
  CCBayar                 := 0;
  edtBayarCC.Text         := '0';
  edtCCDisc.Text          := '0';
  edtCCDiscNominal.Text   := '0';

  LoadCreditCard(edtJenisKartuCode.Text);
  if (edtJenisKartuName.Text <> '') then
  begin
    edtNilaiCC.Text := FormatFloat('#,##0',CCBayar-CCDiscNominal);
    iEdit := 0;
  end;
end;

procedure TfrmPayment.edtPilihanKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  HideInfo;
//  if ((Key = VK_RETURN) or (Key = VK_TAB)) and (edtPilihan.Text<>'') then
//     Key := Ord(edtPilihan.Text[1]);
  case Key of    //
    Ord('1'), VK_NUMPAD1:
    begin
      //edtNilaiTunai.Text := FormatFloat('#,##0',edtNilaiBayar.Value - edtNilaiCC.FloatValue);
//      edtNilaiTunai.Text := FormatFloat('#,##0',GetSisaBayar(edtNilaiTunai.FloatValue));
      edtNilaiTunai.Text := FormatFloat('#,##0',edtNilaiBayar.Value-edtBayarCC.FloatValue);
      edtNilaiTunai.SetFocus;
      edtNilaiTunai.SelectAll;
    end;
    Ord('2'), VK_NUMPAD2:
    begin
      {//ditutup karena untuk debit card gak ada batas minimal
      if (edtNilaiBayar.Value - edtNilaiTunai.FloatValue) < CC_Minimum  then
      begin
        CommonDlg.ShowError(CREDIT_CARD_MINIMUM + FormatFloat('#,##0',CC_Minimum));
        edtPilihan.SelectAll;
        Exit;
      end;
      }
      edtJenisKartuCode.SetFocus;
      edtJenisKartuCode.SelectAll;
    end;
    VK_F12:
    begin
      if CommonDlg.Confirm('Apakah Anda yakin me-reset voucher?') = mrYes then
      begin
        ResetVoucher;
      end;
    end;
    Ord('3'), VK_NUMPAD3:
    begin
      if GetSisaBayar(edtBotolValue.FloatValue) > 0 then
      begin
        edtNoTransBotol.SetFocus;
        edtNoTransBotol.SelectAll;
      end;
    end;
    Ord('C'):
    begin
      if SisaUang >= 0 then
      begin
        if SisaUang <= SisaUang_Maksimum then
        begin
          cShowWaitWindow('Mencetak Struk');
          Application.ProcessMessages;
          try
            if SaveToDB then
            begin

              ParsingPrintStrukTrans;

              frmTransaksi.Transaksi_ID := 0;
              {$IFDEF TSN}
              if IsConcession then
                 ParsingPrintConsValidasi;
              {$ENDIF}
              frmTransaksi.ResetTransaction;
              frmTransaksi.edNoPelanggan.Text := frmTransaksi.GetDefaultMember;

              Self.Close;
            end;
          finally
            cCloseWaitWindow;
          end;
        end
        else
        begin
          //CommonDlg.ShowError(MSG_MAX_KEMBALIAN + FormatCurr('#,##0',SisaUang_Maksimum));
          ShowInfo(MSG_MAX_KEMBALIAN + FormatCurr('#,##0',SisaUang_Maksimum));
          Exit;
        end;
      end
      else
      begin
        //CommonDlg.ShowError(MSG_PAYMENT_NOT_VALID);
        ShowInfo(MSG_PAYMENT_NOT_VALID);
        Exit;
      end;
    end;
    {$IFDEF TSN}
    Ord('P'):
    begin
      if SisaUang >= 0 then
      begin
        if SisaUang <= SisaUang_Maksimum then
        begin
          cShowWaitWindow('Bayar tanpa cetak Struk');
          Application.ProcessMessages;
          try
            if SaveToDB then
            begin
              frmTransaksi.Transaksi_ID := 0;
              frmTransaksi.ResetTransaction;

              frmTransaksi.edNoPelanggan.Text := '';
              frmTransaksi.edNoPelanggan.Text := '0';

              Self.Close;
            end;
          finally
            cCloseWaitWindow;
          end
        end
        else
        begin
          //CommonDlg.ShowError(MSG_MAX_KEMBALIAN + FormatCurr('#,##0',SisaUang_Maksimum));
          ShowInfo(MSG_MAX_KEMBALIAN + FormatCurr('#,##0',SisaUang_Maksimum));
          Exit;
        end;
      end
      else
      begin
        //CommonDlg.ShowError(MSG_PAYMENT_NOT_VALID);
        ShowInfo(MSG_PAYMENT_NOT_VALID);
        Exit;
      end;
    end;
    {$ENDIF}
    VK_ESCAPE:
    begin
      Self.Close;
    end;
  end;    // case
end;

procedure TfrmPayment.edtNilaiCCKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_ESCAPE] then
  begin
    edtJenisKartuCode.SetFocus;
  end;
end;

procedure TfrmPayment.edtNomorCCKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_ESCAPE] then
  begin
    edtNilaiCC.SetFocus;
  end;
end;

procedure TfrmPayment.edtNoOtorisasiCCKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key in [VK_ESCAPE] then
  begin
    edtNomorCC.SetFocus;
  end
  else if Key in [VK_RETURN] then
  begin
    if edtCashBack.Visible then
      edtCashBack.SetFocus
    else
      edtPilihan.SetFocus;
  end;
end;

procedure TfrmPayment.edtNilaiTunaiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_ESCAPE] then
  begin
    edtPilihan.SetFocus;
  end
  else if Key in [VK_RETURN] then
  begin
    edtPilihan.SetFocus;
  end;
end;

procedure TfrmPayment.edtNoTransBotolKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key in [VK_ESCAPE] then
  begin
    edtPilihan.SetFocus;
  end;
end;

procedure TfrmPayment.edtCashBackKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_ESCAPE] then
  begin
    edtNoOtorisasiCC.SetFocus;
  end
  else if Key in [VK_RETURN] then
  begin
    edtPilihan.SetFocus;
  end;
end;

procedure TfrmPayment.ParsingPrintStrukTrans;
var
  i: Integer;
  isShowTotal: Boolean;
//  outFile: string;
  sTemp, sTerbilang: string;
  iRow: integer;
  aSpell: TSpell;
  DiscPersen : Double;
  dTotalNonJB: Double;
  lPosTrans: TPOSTransaction;
  lQ: TIBQuery;
  sDiscPersen : String;
  sPrice: string;
begin
  dTotalNonJB := 0;
  HideInfo;
  mmoBackup.Clear;
  mmoTemp.Clear;
  //mmoBackup.Lines.LoadFromFile(cGetAppPath + 'utils\' + FILE_HEADER);
  //Application.ProcessMessages;

  //outFile := cGetAppPath + 'utils\' + FILE_HEAD_STRUK;
  //if (FileExists(outFile)) then
     //DeleteFile(PChar(outFile));

  {Parsing data head struk}
  mmoHeadStruk.Clear;
  mmoHeadStruk.Lines.Add('POS / Kasir : ' + frmMain.FPOSCode + '/' + frmMain.FCashierCode + ' ' + frmMain.FCashierName);
  mmoHeadStruk.Lines.Add('No Trans    : ' + StrPadRight(frmTransaksi.edNoTrnTerakhir.Text,18,' ') + FormatDateTime('dd/MM/yy',Now));
  mmoHeadStruk.Lines.Add('No Member   : ' + StrPadRight(frmTransaksi.edNoPelanggan.Text,18,' ') + FormatDateTime('HH:nn:ss',Now));
  //mmoHeadStruk.Lines.SaveToFile(outFile);

  mmoBackup.Lines.AddStrings(mmoHeadStruk.Lines);
  Application.ProcessMessages;

  //outFile := cGetAppPath + 'utils\' + FILE_ISI_STRUK;
  //if (FileExists(outFile)) then
     //DeleteFile(PChar(outFile));

  mmoIsiStruk.Clear;
  mmoIsiStruk.Lines.Add(StrPadRight('',41,'-'));
  iRow := frmTransaksi.sgTransaksi.RowCount - 1;
  with frmTransaksi.sgTransaksi do
  begin
  for i := 1 to iRow do
  begin
    if (Cells[_KolPLU,i] <> '') then
    begin
      sTemp := ' ';
      if CCNilai <> 0 then
      begin
        if (Cells[_KolIsMailer,i] = '1') or (Cells[_KolIsCharge,i] = '1')  then //kalo barang kena charge CC kasih @ di depan PLU
          sTemp := '@';
      end;

      if edtDiscGMCNominal.Value <> 0 then
      begin
        if Cells[_KolIsDiscGMC,i] = '1' then //kalo barang discon AMC kasih bintang di depan PLU
          sTemp := sTemp + '*'
        else
          sTemp := sTemp + ' '
      end
      else
        sTemp := sTemp + ' ';

      mmoIsiStruk.Lines.Add(Cells[_KolPLU,i] + sTemp + LeftStr(Cells[_KolNamaBarang,i],40));
      {$IFDEF TSN}
        sTemp := StrPadLeftCut(FormatFloat('#,##'+Get_Qty_Precision,Columns[_KolJumlah].Floats[i]),8,' ') + ' ';
        sTemp := sTemp + StrPadRight(Cells[_KolUOM,i],5,' ') + 'x';
        sPrice := IfThen(Columns[_KolDisc].Floats[i]>0,
            FormatFloat('#,##0',Columns[_KolHarga].Floats[i]) + '-' + FormatFloat('#,#0',Columns[_KolDiscP].Floats[i])+'%',
            FormatFloat('#,##0',Columns[_KolHarga].Floats[i]-Columns[_KolDisc].Floats[i]));

        if Columns[_KolDiscMan].Floats[i] > 0 then
        begin
          DiscPersen  := RoundTo(Floats[_KolDiscMan,i] / Floats[_KolHarga,i] * 100, -2);
          sDiscPersen := '-' +  FormatFloat('#,#0',DiscPersen) + '%';
          sPrice := sPrice + sDiscPersen;
        end;

        sTemp := sTemp + StrPadLeftCut(sPrice,12,' ');
        sTemp := sTemp + StrPadLeftCut(FormatFloat('#,##0',Columns[_KolTotal].Floats[i]),13,' ');

        mmoIsiStruk.Lines.Add(sTemp);
        dTotalNonJB := dTotalNonJB + GetAmountNonJB(i);
      {$ELSE}
        sTemp := StrPadLeftCut(FormatFloat('#,##'+Get_Qty_Precision,Columns[_KolJumlah].Floats[i]),10,' ') + ' '
          + StrPadRight(Cells[_KolUOM,i],5,' ') + 'x'
          + StrPadLeftCut(FormatFloat('#,##0',Columns[_KolHarga].Floats[i]-Columns[_KolDisc].Floats[i]),10,' ')
          + StrPadLeftCut(FormatFloat('#,##0',Columns[_KolTotal].Floats[i]+(Columns[_KolDiscMan].Floats[i]*Columns[_KolJumlah].Floats[i])),13,' ');

        mmoIsiStruk.Lines.Add(sTemp);
        if Columns[_KolDiscMan].Floats[i] > 0 then
        begin
            DiscPersen  :=  RoundTo(Floats[_KolDiscMan,i] / Floats[_KolHarga,i] * 100, -2);
            sDiscPersen := '(' + FloatToStr(DiscPersen) + '%)';
            While Length(sDiscPersen) < 10 do
            begin
              sDiscPersen :=  sDiscPersen + ' ';
            end;
            sTemp :='Disc Manual ' + sDiscPersen + StrPadLeftCut(FormatFloat('#,##0',Columns[_KolDiscMan].Floats[i]*Columns[_KolJumlah].Floats[i]),18,' ');
            mmoIsiStruk.Lines.Add(sTemp);
        end;
      {$ENDIF}
    end;
  end;
  end;

  sTemp := '';
  mmoIsiStruk.Lines.Add(StrPadRight('',40,'-'));
  //mmoIsiStruk.Lines.SaveToFile(outFile);

  mmoBackup.Lines.AddStrings(mmoIsiStruk.Lines);
  Application.ProcessMessages;

  //outFile := cGetAppPath + 'utils\' + FILE_FOOTER_STRUK;
  //if (FileExists(outFile)) then
     //DeleteFile(PChar(outFile));

  //Parsing data footer struk
  mmoFooterStruk.Clear;
  mmoFooterStruk.Lines.Add(StrPadLeftCut('TOTAL BELANJA:',27,' ')
    + StrPadLeftCut(FormatFloat('#,##0',edtTotalBelanja.Value),13,' '));

  isShowTotal := False;

  //besok tambahkan param disini, jika 0 mau ditampilkan atau tidak terserah admin
  if (edtDiscGMCNominal.Value <> 0) then
  begin
    mmoFooterStruk.Lines.Add('*Brg Disc AMC'
      + StrPadLeftCut(FormatFloat('#,##0',edtBrgDiscGMC.Value),14,' '));

    mmoFooterStruk.Lines.Add(' Disc'
      + StrPadLeftCut(FormatFloat('#,##0.00%',edtDiscGMCPersen.Value),22,' ')
      + StrPadLeftCut(FormatFloat('-#,##0',edtDiscGMCNominal.Value),13,' '));

    isShowTotal := True;
  end;

  if (edtNilaiCC.FloatValue > 0)
    and (edtChargeCreditCard.FloatValue > 0) then //apabila ada barang yg kena charge card
  begin
    mmoFooterStruk.Lines.Add('@Card Charge'
      + StrPadLeftCut(FormatFloat('#,##0',edtChargeCreditCard.FloatValue),28,' '));

    isShowTotal := True;
  end else begin
  end;

  //voucher
  if (edtBotolValue.FloatValue > 0) then
  begin
    mmoFooterStruk.Lines.Add('VCR [B]' + StrPadLeftCut(FormatFloat('#,##0',edtBotolValue.FloatValue),9,' '));
    if (edtGoroValue.FloatValue = 0)
      and (edtVoucherValue.FloatValue = 0) then
    begin
      mmoFooterStruk.Lines[mmoFooterStruk.Lines.Count-1] := mmoFooterStruk.Lines[mmoFooterStruk.Lines.Count-1]
        + StrPadLeftCut('TOT VCR:',11,' ')
        + StrPadLeftCut(FormatFloat('-#,##0',(edtBotolValue.FloatValue + edtGoroValue.FloatValue + edtVoucherValue.FloatValue)),13,' ');
    end;
    isShowTotal := True;
  end;
  if (edtGoroValue.FloatValue > 0) then
  begin
    if (edtBotolValue.FloatValue > 0) then
      mmoFooterStruk.Lines.Add('    [A]' + StrPadLeftCut(FormatFloat('#,##0',edtGoroValue.FloatValue),9,' '))
    else
      mmoFooterStruk.Lines.Add('VCR [A]' + StrPadLeftCut(FormatFloat('#,##0',edtGoroValue.FloatValue),9,' '));

    if (edtVoucherValue.FloatValue = 0) then
    begin
      mmoFooterStruk.Lines[mmoFooterStruk.Lines.Count-1] := mmoFooterStruk.Lines[mmoFooterStruk.Lines.Count-1]
        + StrPadLeftCut('TOT VCR:',11,' ')
        + StrPadLeftCut(FormatFloat('-#,##0',(edtBotolValue.FloatValue + edtGoroValue.FloatValue + edtVoucherValue.FloatValue)),13,' ');
    end;
    isShowTotal := True;
  end;
  if (edtVoucherValue.FloatValue > 0) then
  begin
    if (edtBotolValue.FloatValue > 0)
      or (edtGoroValue.FloatValue > 0) then
      mmoFooterStruk.Lines.Add('    [L]' + StrPadLeftCut(FormatFloat('#,##0',edtVoucherValue.FloatValue),9,' '))
    else
      mmoFooterStruk.Lines.Add('VCR [L]' + StrPadLeftCut(FormatFloat('#,##0',edtVoucherValue.FloatValue),9,' '));

    mmoFooterStruk.Lines[mmoFooterStruk.Lines.Count-1] := mmoFooterStruk.Lines[mmoFooterStruk.Lines.Count-1]
      + StrPadLeftCut('TOT VCR:',11,' ')
      + StrPadLeftCut(FormatFloat('-#,##0',(edtBotolValue.FloatValue + edtGoroValue.FloatValue + edtVoucherValue.FloatValue)),13,' ');

    isShowTotal := True;
  end;

  if isShowTotal then
  begin
    mmoFooterStruk.Lines.Add(StrPadLeftCut('TOTAL:',27,' ')
      + StrPadLeftCut(FormatFloat('#,##0',edtNilaiBayar.Value),13,' '));
      //+ StrPadLeftCut(FormatFloat('#,##0',edtTotalBelanja.Value - edtDiscGMCNominal.Value + edtChargeCreditCard.FloatValue),13,' '));
  end;

  if edtNilaiCC.FloatValue <> 0 then //apabila ada pembayaran pakai CARD
  begin
    sTemp := StrRemoveChar(edtNomorCC.Text, ' ');
    sTemp := StrRemoveChar(sTemp,'-');
    sTemp := StrRemoveChar(sTemp,'*');

    mmoFooterStruk.Lines.Add('Jns Kartu: ' + StrPadRight(edtJenisKartuName.Text,15,' '));
    mmoFooterStruk.Lines.Add('No. Kartu: ' + StrPadRight(sTemp,16,' '));
    mmoFooterStruk.Lines.Add('Otorisasi: ' + StrPadRight(edtNoOtorisasiCC.Text,11,' ')
      + 'CARD:' + StrPadLeftCut(FormatFloat('#,##0',edtNilaiCC.FloatValue),13,' '));
    mmoFooterStruk.Lines.Add(StrPadLeftCut('DISC CARD:',27,' ')
    + StrPadLeftCut(FormatFloat('#,##0',edtCCDiscNominal.FloatValue),13,' '));

  end else begin
  end;

  if edtNilaiTunai.FloatValue <> 0 then
  begin
    mmoFooterStruk.Lines.Add(StrPadLeftCut('CASH:',27,' ')
      + StrPadLeftCut(FormatFloat('#,##0',edtNilaiTunai.FloatValue),13,' '));
  end;

  mmoFooterStruk.Lines.Add(StrPadRight('',27,' ') + StrPadRight('',13,'-'));

  mmoFooterStruk.Lines.Add('Colie' + StrPadLeftCut(FormatFloat('#,##0', frmTransaksi.TotalColie),9,' ')
    + StrPadLeftCut('Kembali:',13,' ') + StrPadLeftCut(FormatFloat('#,##0',edtSisaUang.FloatValue),13,' '));
  mmoFooterStruk.Lines.Add(StrPadRight('',40,'-'));

  //Mencoba disini PAJAK !!!!
  mmoFooterStruk.Lines.Add('BKP :' + StrPadLeftCut(FormatFloat('#,##0',frmTransaksi.TotalRupiahBarangBKP),7,' ')
    + StrPadLeftCut('DISC :',21,' ') + StrPadLeftCut(FormatFloat('#,##0',frmTransaksi.TotalRupiahBarangDiscount),7,' '));
  mmoFooterStruk.Lines.Add('DPP :' + StrPadLeftCut(FormatFloat('#,##0',frmTransaksi.TotalRupiahBarangDPP),7,' ')
    + StrPadLeftCut('PPN :',21,' ') + StrPadLeftCut(FormatFloat('#,##0',frmTransaksi.TotalRupiahBarangPPN),7,' '));
  mmoFooterStruk.Lines.Add('Bebas PPN :' + StrPadLeftCut(FormatFloat('#,##0',frmTransaksi.TotalRupiahBarangBebasPPN),7,' '));

  mmoFooterStruk.Lines.Add(StrPadRight('',40,'-'));

  //sisa kembalian
  if ShowFooterKembalian = 1 then
  begin
    sTemp := 'Sisa Kembalian: ' + FormatFloat('#,##0',Pembulatan);
    mmoFooterStruk.Lines.Add(StrPadLeftCut(sTemp,Length(sTemp) + ((40 - Length(sTemp)) div 2),' '));
    mmoTemp.Clear;
    mmoTemp.Lines.LoadFromFile(cGetAppPath + 'utils\' + FILE_FOOTER_SISA);
    mmoFooterStruk.Lines.AddStrings(mmoTemp.Lines);
  end;

  //PROMO TSN
  {
  if dTotalNonJB >= 200000 then
  begin
    mmoFooterStruk.Lines.Add(StrPadRight('',40,'-'));
    mmoFooterStruk.Lines.Add('        SELAMAT ANDA MENDAPATKAN        ');

    if dTotalNonJB < 300000 then
      mmoFooterStruk.Lines.Add('               MUG CANTIK               ')
    else if (dTotalNonJB >= 300000) and (dTotalNonJB < 400000) then
      mmoFooterStruk.Lines.Add('               JAM DINDING              ')
    else if dTotalNonJB >= 400000 then
      mmoFooterStruk.Lines.Add('                 PAYUNG                 ');

    mmoFooterStruk.Lines.Add('                                        ');
    mmoFooterStruk.Lines.Add('   SEGERA TUKARKAN POTONGAN STRUK INI   ');
    mmoFooterStruk.Lines.Add('                DI KASIR                ');
    mmoFooterStruk.Lines.Add(StrPadRight('',40,'-'));
  end;
  }
  lQ := cOpenQuery('SELECT FOOTER FROM SP_HADIAH('+ Quot(frmTransaksi.edNoTrnTerakhir.Text) +')');
  try
    while not lQ.Eof do
    begin
      mmoFooterStruk.Lines.Add(lQ.FieldbyName('FOOTER').AsString);
      lQ.Next;
    end;
  finally
    lQ.Free;
  end;

  mmoTemp.Lines.LoadFromFile(cGetAppPath + 'utils\' + FILE_FOOTER);
  mmoFooterStruk.Lines.AddStrings(mmoTemp.Lines);
  mmoBackup.Lines.AddStrings(mmoFooterStruk.Lines);
  Application.ProcessMessages;

  if (edtCashBack.Visible) and (edtCashBack.FloatValue > 0) then
  begin
    mmoTemp.Lines.LoadFromFile(cGetAppPath + 'utils\' + FILE_HEADER_CASHBACK);
  end
  else
  begin
    mmoTemp.Lines.LoadFromFile(cGetAppPath + 'utils\' + FILE_HEADER);
  end;
  mmoBackup.Lines.AddStrings(mmoTemp.Lines);
  for i := mmoTemp.Lines.Count + 1 to 4 do    // Iterate
  begin
    mmoBackup.Lines.Add('');
  end;    // for
  //mmoBackup.Lines.Delete(mmoBackup.Lines.Count-1);
  Application.ProcessMessages;


  try
    begin
      //PrintFile(outFile);
      //outFile := cGetAppPath + 'utils\' + 'POS_STRUK.TXT';
      //mmoBackup.Lines.SaveToFile(outFile);

      lPosTrans := TPOSTransaction.Create(Self);
      Try
        Try
          lPosTrans.UpdateTransStruk(mmoBackup.Lines, frmTransaksi.Transaksi_ID);
        except
        end;
      Finally
        lPosTrans.Free;
      end;

      PrintStrings(mmoBackup.Lines);
    end;
  except
    //CommonDlg.ShowError('Gagal mencetak struk');
    ShowInfo('Gagal mencetak struk');
  end;
 {
  mmoFooterStruk.Lines.Add('');
  if FPromoTrans.Count > 0 then
    mmoFooterStruk.Lines.Add(arrSpasi[(47 - Length(PROMO_PREFIX)) div 2] + PROMO_PREFIX);

  for i := 0 to FPromoTrans.Count - 1 do
  begin
    mmoFooterStruk.Lines.Add(arrSpasi[(47 - Length(FPromoTrans[i])) div 2] + FPromoTrans[i]);
  end;
  mmoFooterStruk.Lines.Add('');

  //mmoFooterStruk.Lines.SaveToFile(outFile);
  //PrintFile(FApplicationDir + 'utils\' + FILE_FOOTER_STRUK);
  //add by didit: 02102007
  mmoBackup.Lines.AddStrings(mmoFooterStruk.Lines);
  Application.ProcessMessages;

  //PrintFile(FApplicationDir + 'utils\' + FILE_FOOTER);
  //add by didit: 02102007
  mmoTemp.Lines.LoadFromFile(FApplicationDir + 'utils\' + FILE_FOOTER);
  mmoBackup.Lines.AddStrings(mmoTemp.Lines);
  Application.ProcessMessages;
}

  //add by didit: 12112007 print struk cashback---------------------------------
  if (edtCashBack.Visible) and (edtCashBack.FloatValue > 0) then
  begin
    CommonDlg.ShowMessage('Tekan OK untuk mulai mencetak struk cashback');
    aSpell := TSpell.Create;

    //outFile := cGetAppPath + 'utils\' + FILE_ISI_CASHBACK;
    //if (FileExists(outFile)) then
       //DeleteFile(PChar(outFile));

    //Parsing data isi struk cashback
    mmoIsiCB.Clear;
    mmoIsiCB.Lines.Add('Tanggal / Jam : ' + FormatDateTime('dd/mm/yyyy',Now) + '  ' + FormatDateTime('HH:nn:ss',Now));
    mmoIsiCB.Lines.Add('No.Transaksi  : ' + frmTransaksi.edNoTrnTerakhir.Text);
    mmoIsiCB.Lines.Add('POS / Kasir   : ' + frmMain.FPOSCode + ' / ' + frmMain.FCashierCode + ' ' + frmMain.FCashierName);
    mmoIsiCB.Lines.Add(StrPadRight('',40,'-'));
    mmoIsiCB.Lines.Add('Kode/Nama Kartu : ' + StrPadRight(edtJenisKartuCode.Text,4,' ') + ' ' +
                         StrPadRight(edtJenisKartuName.Text,16,' '));
    mmoIsiCB.Lines.Add('No. Kartu       : ' + StrPadRight(edtNomorCC.Text,20,' '));
    mmoIsiCB.Lines.Add('No. Otorisasi   : ' + strPadRight(edtNoOtorisasiCC.Text,16,' '));
    mmoIsiCB.Lines.Add(StrPadRight('',40,'-'));
    mmoIsiCB.Lines.Add('Tot Pengambilan : ' + StrPadRight(edtCashBack.Text,20,' '));
    mmoIsiCB.Lines.Add('Terbilang       : ');
    sTerbilang := aSpell.Spell(edtCashBack.Text);
    mmoIsiCB.Lines.Add('[' + sTerbilang + ']');

    //mmoIsiCB.Lines.SaveToFile(outFile);
    //PrintFile(outFile);
    PrintStrings(mmoIsiCB.Lines);
    mmoBackup.Lines.AddStrings(mmoIsiCB.Lines);
    Application.ProcessMessages;

    PrintFile(cGetAppPath + 'utils\' + FILE_FOOTER_CASHBACK);
    mmoTemp.Clear;
    mmoTemp.Lines.LoadFromFile(cGetAppPath + 'utils\' + FILE_FOOTER_CASHBACK);
    mmoBackup.Lines.AddStrings(mmoTemp.Lines);
    //mmoBackup.Lines.SaveToFile(cGetAppPath + 'utils\' + 'POS_STRUK.TXT');
    Application.ProcessMessages;

    aSpell.Destroy;
    PrintStrings(mmoBackup.Lines);
    //PrintFile(cGetAppPath + 'utils\' + FILE_HEADER_CASHBACK);
  end;
  //----------------------- end print struk cashback ---------------------------
{
  //add by didit: 02102007
  //save struk to file for backup
  try
    PathBackup := FPathBackupStruk+'\'+FPOSCode+'\'+
                  FormatDateTime('yyyymmdd', DateLocalPOS)+'\';
    if not directoryexists(PathBackup) then
      ForceDirectories(PathBackup);
    outFile := PathBackup+RightStr(edtNoTrnTerakhir.Text,4)+'.txt';
    //if (FileExists(outFile)) then
     // DeleteFile(PChar(outFile));
    mmoBackup.Lines.SaveToFile(outFile);
  except
    //mmoTemp.Free;
    //mmoBackup.Free;
  end;
}
end;

function TfrmPayment.SaveToDB: Boolean;
var
  dItemsDiscCard: Double;
  dtTransaksi: TDateTime;
  lBarangStokSirkulasi: TBarangStockSirkulasiItems;
	bIsBKP: Boolean;
	bIsDiscAMC: Boolean;
  i: Integer;
  lDecimalSeparator: Char;
  ssSQL: TStrings;
begin
  //Tambahan agar tidak menyimpan berulang-ulang jika gagal print;
  if IsSaved then
  begin
    Result := True;
    Exit;
  end;

  Result := False;
  lDecimalSeparator := DecimalSeparator;
  DecimalSeparator := '.';

  ssSQL := TStringList.Create;
  try
    with frmTransaksi do
    begin
      if GetKuponBotolStatus(edtNoTransBotol.Text) = 1 then
      begin
        ShowInfo('Kupon botol sudah pernah digunakan');
        edtNoTransBotol.SetFocus;
        Exit;
      end;

      for i := 0 to VoucherAssalaamNomor.Count - 1 do    // Iterate
      begin
        if GetVoucherStatus(VoucherAssalaamNomor[i]) = 1 then
        begin
          ShowInfo('Voucher berikut sudah pernah digunakan: ' + VoucherAssalaamNomor[i]);
          edtPilihan.SetFocus;
          Exit;
        end;
      end;    // for
                 
      dtTransaksi := cGetServerTime;
      with TPOSTransaction.Create(Self) do
      begin
      	try
          If Trim(frmTransaksi.edNoTrnTerakhir.Text) = '' then
            frmTransaksi.edNoTrnTerakhir.Text := frmMain.GetTransactionNo(frmMain.FPOSCode, cGetServerDateTime);

        	UpdateData(edtNilaiCC.FloatValue,edtNilaiTunai.FloatValue,frmMain.FBeginningBalanceID,edtDiscGMCNominal.Value,
          	edtDiscGMCPersen.Value,frmTransaksi.Transaksi_ID,True,frmTransaksi.TrMemberID,frmMain.UnitID,
            frmTransaksi.edNoTrnTerakhir.Text,Self.Pembulatan,dtTransaksi,Self.TotalBayar,
            edtBrgDiscGMC.Value, Self.TotalBarangPPN,Self.TotalBelanja,edtNoTransBotol.Text,VoucherAssalaamNomor, frmMain.UserID,CCDiscNominal);

          if CCNilai > 0 then
          begin
            {
            procedure TPOSTransactionCard.UpdateData(ACardID: Integer;
              ACashbackCharge: Double; ACashbackNilai: Double;
              ACharge: Double;
              AID: Integer; AIsActive: Boolean;
              ANewUnit_ID: Integer;
              ANilai: Double;
              ANomor: string;
              ANoOtorisasi: string;
              ATransNo: string);
            }
            TransactionCard.UpdateData(CardID,
              0, edtCashBack.FloatValue,
              edtChargeCreditCard.FloatValue,
              0, True,
              frmMain.UnitID,
              edtNilaiCC.FloatValue,
              edtNomorCC.Text,
              edtNoOtorisasiCC.Text,
              frmTransaksi.edNoTrnTerakhir.Text);
          end;

          for i := 0 to Self.VoucherLainJumlah.Count - 1 do    // Iterate
          begin
            with VoucherLains.Add.VoucherLain do
            begin
              UpdateData(0,True,frmMain.UnitID,
                StrToInt(Self.VoucherLainJumlah[i]),
                (StrToInt(Self.VoucherLainJumlah[i]) * StrToFloat(Self.VoucherLainNilai[i])),
                frmTransaksi.edNoTrnTerakhir.Text,
                StrToFloat(Self.VoucherLainNilai[i]));
            end;
          end;    // for

          //new simpan ke stock sirkulasi
          lBarangStokSirkulasi := TBarangStockSirkulasiItems.Create(TBarangStockSirkulasiItem);

          //ShowMessage(IntToStr(frmTransaksi.sgTransaksi.RowCount));
          with frmTransaksi.sgTransaksi do
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

              if edtJenisKartuName.Text <> '' then
              begin
                dItemsDiscCard := (CCDisc/100)* (Columns[_KolHarga].Floats[i] - Columns[_KolDisc].Floats[i]);
              end
              else
              begin
                dItemsDiscCard := 0;
              end;

              UpdatePOSTransactionItems(Columns[_KolBHJID].Ints[i], //Barang harga jual ID
                Columns[_KolCOGS].Floats[i], //COGS
                Ints[_KolDetailID, i], //ID
                bIsBKP, bIsDiscAMC, //ID, IsBKP, IsDiscAMC
                Columns[_KolLastCost].Floats[i], //last cost
                Columns[_KolPPN].Floats[i], //PPN
                Columns[_KolPPNBM].Floats[i], //PPNBM
                Columns[_KolJumlah].Floats[i], //QTY
                Columns[_KolHarga].Floats[i], //SellPrice
                Columns[_KolHarga].Floats[i] - Columns[_KolDisc].Floats[i], //SellPriceDisc
                Columns[_KolTotal].Floats[i], //Total
                Columns[_KolJumlah].Floats[i] * Columns[_KolHargaExcPajak].Floats[i], //totalb4tax
                (Columns[_KolTotal].Floats[i]), //total ceil
                frmTransaksi.edNoTrnTerakhir.Text,
                frmMain.UnitID,
                frmTransaksi.sgTransaksi.Cells[_KolPLU,i],  //BrgCode
                Ints[_KolTipeBarang, i], // Tipe Barang
                GetDiscItemAMCRp(i),
                Cells[_KolUOM, i],
                dItemsDiscCard, //disc Card
                Columns[_KolDiscMan].Floats[i],
                Cells[_Koldiscoto, i]);

              {$IFDEF TSN}
              if (TipeIDConcession = Ints[_KolTipeBarang, i]) then
                 IsConcession := True;
              {$ENDIF}
              with lBarangStokSirkulasi do
              begin
                with Add do
                begin
                  UpdateData(TPOSTransaction.GetHeaderFlag,
                    0,0,0,
                    'POS Transaction',
                    Cells[_KolPLU,i],
                    frmMain.UnitID,
                    Cells[_KolUom,i],
                    frmTransaksi.edNoTrnTerakhir.Text,
                    0 - Columns[_KolJumlah].Floats[i],
                    dtTransaksi,
                    'POS',
                    0);
                  HargaTransaksi := Columns[_KolHargaAvg].Floats[i];
                end;
              end;    // with
            end;
          end;    // with


          Try
            if SaveAllToDB then
            begin
            //  if lBarangStokSirkulasi.SaveToDatabase(frmTransaksi.edNoTrnTerakhir.Text,frmMain.UnitID) then
           //   begin

                cCommitTrans;
                Result := True;
                IsSaved := True;

         //     end
          //    else
           //   begin
          //      cRollbackTrans;
          //    end;
              //CommonDlg.ShowMessage('Sukses menyimpan ke database');
            end
          finally
            cRollbackTrans;
          end;

          frmTransaksi.Transaksi_ID := ID;
        finally
        	Free;
        end;
      end;


      {
			Exit;

      iTransID := cGetNextID('GEN_POS_TRANS_ID');
      sSQL := 'insert into transact (trans_id, trans_date, trans_no, trans_cash_id, '
        + 'trans_shift_code, trans_member_id, trans_total, trans_total_amc,  '
        + 'trans_disc_amc_persen, trans_disc_amc_nominal, trans_pembulat, '
        + 'trans_bayar_cash, trans_bayar_card, trans_payback, trans_is_active) values ('
        + IntToStr(iTransID) + ','
        + QuotD(Now) + ','
        + Quot(edNoTrnTerakhir.Text) + ',1,'
        + Quot('01') + ','
        + IntToStr(MemberID) + ','
        + CurrToStr(TotalRupiah) + ','
        + CurrToStr(TotalRupiahBarangAMC) + ','
        + CurrToStr(DiscAMCPersen) + ','
        + CurrToStr(DiscAMCRupiah) + ','
        + CurrToStr(Pembulatan) + ','
        + CurrToStr(CashNilai) + ','
        + CurrToStr(CCNilai) + ','
        + CurrToStr(edtCashBack.FloatValue) + ',1);';
      ssSQL.Add(sSQL);

      for i := 1 to sgTransaksi.RowCount - 1 do    // Iterate
      begin
        if sgTransaksi.Cells[_KolPLU,i] = '' then Continue;
          
        iTransDetID := cGetNextID('GEN_POS_TRANS_DETAIL_ID');
        sSQL := 'insert into transdet (transd_id, transd_trans_id, '
          + 'transd_price, transd_disc_persen, transd_price_disc, transd_qty, '
          + 'transd_total_price, transd_is_brg_amc, transd_brg_code, '
          + 'transd_brg_ppn, transd_brg_ppnbm, transd_is_active) values ('
          + IntToStr(iTransDetID) + ','
          + IntToStr(iTransID) + ','
          + FloatToStr(sgTransaksi.Columns[_KolHarga].Floats[i]) + ','
          + FloatToStr((sgTransaksi.Columns[_KolDisc].Floats[i] / sgTransaksi.Columns[_KolHarga].Floats[i]) * 100) + ','
          + FloatToStr(sgTransaksi.Columns[_KolHarga].Floats[i] - sgTransaksi.Columns[_KolDisc].Floats[i]) + ','
          + FloatToStr(sgTransaksi.Columns[_KolJumlah].Floats[i]) + ','
          + FloatToStr(sgTransaksi.Columns[_KolTotal].Floats[i]) + ','
          + IntToStr(sgTransaksi.Columns[_KolIsDiscGMC].Ints[i]) + ','
          + sgTransaksi.Columns[_KolPLU].Rows[i] + ','
          + FloatToStr(sgTransaksi.Columns[_KolPPN].Floats[i]) + ','
          + FloatToStr(sgTransaksi.Columns[_KolPPNBM].Floats[i]) + ',1);';

        ssSQL.Add(sSQL);
      end;    // for

      sSQL := 'update setuppos '
        + ' set setuppos_counter_no = ' + IntToStr(StrToInt(RightStr(edNoTrnTerakhir.Text,3)))
        + ' where setuppos_terminal_code = ' + Quot(frmMain.FPOSCode)
        + ' and setuppos_unt_id = ' + IntToStr(frmMain.UnitID) + ';';
      ssSQL.Add(sSQL);
      }
    end;    // with

    {
    ssSQL.SaveToFile(cGetAppPath + 'SQL_Transaction.SQL');

    if kExecuteSQLs(ssSQL,'Menyimpan data transaksi') then
    begin
      cCommitTrans;
      Result := True;
    end;
    }
  finally
    DecimalSeparator := lDecimalSeparator;
    FreeAndNil(ssSQL);
  end;
end;

procedure TfrmPayment.edtNilaiCCExit(Sender: TObject);
begin
  //with trew
  HideInfo;
//  if CCDisc <> 0 then
//  begin
//    edtCCDiscNominal.Text := CurrToStr((CCDisc/100)*(TotalBayar-edtNilaiCC.FloatValue));
//  end
//  else
//  begin
//    edtCCDiscNominal.Text := '0';
//  end;


  if edtNilaiCC.FloatValue = 0 then
  begin
    edtJenisKartuCode.Clear;
    edtJenisKartuName.Clear;
    edtChargeCreditCard.FloatValue := 0;
    HideCashBack;
    //edtNomorCC.Clear;
    //edtNoOtorisasiCC.Clear;
    ShowTotalBayar;

    edtPilihan.SetFocus;
    Exit;
  end;

  if IsCreditCard then
  begin
    if ((edtNilaiCC.FloatValue) < CCLimit) and (edtNilaiCC.FloatValue <> 0) then
    begin
      //CommonDlg.ShowError(MSG_CREDIT_CARD_MINIMUM + FormatFloat('#,##0',CC_Minimum));
      ShowInfo(MSG_CREDIT_CARD_MINIMUM + FormatFloat('#,##0',CCLimit));
      edtNilaiCC.SetFocus;
      edtNilaiCC.SelectAll;
      Exit;
    end;
  end
  else //Debit Card
    if ((CCLimit>0) and (edtNilaiCC.FloatValue < CCLimit) and (edtNilaiCC.FloatValue <> 0)) then
    begin
      ShowInfo(MSG_CREDIT_CARD_MINIMUM + FormatFloat('#,##0',CCLimit) + ' [DebitCard = ' + edtJenisKartuName.Text + ']');
      edtNilaiCC.SetFocus;
      edtNilaiCC.SelectAll;
      Exit;
    end;

  //if (edtNilaiCC.FloatValue) > (edtNilaiBayar.Value - edtNilaiTunai.FloatValue) then
//  if (edtNilaiCC.FloatValue) > (GetSisaBayar(edtNilaiCC.FloatValue)) then      
  if (edtNilaiCC.FloatValue) > (edtNilaiBayar.Value) then
  begin
    //CommonDlg.ShowError(MSG_CREDIT_CARD_MAXIMUM);
    ShowInfo(MSG_CREDIT_CARD_MAXIMUM);
    edtNilaiCC.SetFocus;
    edtNilaiCC.SelectAll;
    Exit;
  end;

  if (edtNilaiCC.FloatValue >= Cashback_Minimum) and (IsCashbackCard) then
  begin
    ShowCashBack;
  end
  else
  begin
    HideCashBack;
  end;
end;

procedure TfrmPayment.edtCashBackExit(Sender: TObject);
begin
  HideInfo;
  CashBackNilai := edtCashBack.FloatValue;
  if edtCashBack.FloatValue = 0 then Exit;
    
  if (edtCashBack.FloatValue > Cashback_Maximum) then
  begin
    ShowInfo(MSG_CASHBACK_MAXIMUM + FormatFloat('#,##0',Cashback_Maximum));
    edtCashBack.SetFocus;
    edtCashBack.SelectAll;
    Exit;
  end;    

  if (Ceil(edtCashBack.FloatValue) mod Ceil(Cashback_Kelipatan)) <> 0 then
  begin
    //CommonDlg.ShowError(CASHBACK_KELIPATAN_INVALID + FormatFloat('#,##0',Cashback_Kelipatan));
    ShowInfo(MSG_CASHBACK_KELIPATAN_INVALID + FormatFloat('#,##0',Cashback_Kelipatan));
    edtCashBack.SetFocus;
    edtCashBack.SelectAll;
    Exit;
  end;    
end;

procedure TfrmPayment.edtNoTransBotolExit(Sender: TObject);
var
  sSQL: string;
begin
  HideInfo;
  //cari di trans botol
  edtBotolQty.FloatValue := 0;
  edtBotolValue.FloatValue := 0;
  ShowTotalBayar;
  
  if Trim(edtNoTransBotol.Text) = '' then
  begin
  end
  else
  begin
    sSQL := 'select a.tkb_status, sum(b.tkbd_qty) as qty, '
      + 'sum(b.tkbd_total_sell_price_disc) as harga '
      + 'from trans_kupon_botol a '
      + 'inner join trans_kupon_botol_detil b on a.tkb_no = b.tkbd_tkb_no '
      + '  and a.tkb_unt_id = b.tkbd_tkb_unt_id '
      + '  and a.tkb_unt_id = ' + IntToStr(frmMain.UnitID)
      + '  and a.tkb_no = ' + Quot(edtNoTransBotol.Text)
      + ' group by a.tkb_status';

    with cOpenQuery(sSQL) do
    begin
      try
        if not eof then
        begin
          if UpperCase(Fields[0].AsString) = 'CLOSE' then
          begin
            ShowInfo('No voucher botol tersebut sudah pernah digunakan');
            edtNoTransBotol.SetFocus;
            edtNoTransBotol.SelectAll;
            Exit;
          end
          else if UpperCase(Fields[0].AsString) = 'PENDING' then
          begin
            ShowInfo('No voucher botol tersebut status pending');
            edtNoTransBotol.SetFocus;
            edtNoTransBotol.SelectAll;
            Exit;
          end
          else
          begin
            if Fields[2].AsFloat > edtNilaiBayar.Value then
            begin
              ShowInfo('Nilai voucher tidak boleh melebihi total belanja');
              edtNoTransBotol.SetFocus;
              edtNoTransBotol.SelectAll;
              Exit;
            end
            else
            begin
              //cek di kupon botol
              //semua PLU di kupon botol harus ada di transaksi POS dan PLU transaksi POS harus >= kupon
              sSQL := 'select b.tkbd_brg_code, b.tkbd_qty '
                + 'from trans_kupon_botol a '
                + 'inner join trans_kupon_botol_detil b on a.tkb_no = b.tkbd_tkb_no '
                + '  and a.tkb_unt_id = b.tkbd_tkb_unt_id '
                + '  and a.tkb_unt_id = ' + IntToStr(frmMain.UnitID)
                + '  and a.tkb_no = ' + Quot(edtNoTransBotol.Text);

              with cOpenQuery(sSQL) do
              begin
                try
                  while not eof do
                  begin
                    if not CekPLUQtyInGrid(Fields[0].AsString,Fields[1].AsInteger) then
                    begin
                      ShowInfo('PLU : ' + Fields[0].AsString
                        + ' tidak ada atau QTY dalam transaksi < ' + FormatFloat('#,##0',Fields[1].AsInteger));
                      edtNoTransBotol.SetFocus;
                      edtNoTransBotol.SelectAll;
                      Exit;
                    end;
                    Next;
                  end;
                finally
                  Free;
                end;
              end;

              edtBotolQty.FloatValue := Fields[1].AsInteger;
              edtBotolValue.FloatValue := Fields[2].AsFloat;
              ShowTotalBayar;
            end;
          end;
        end
        else
        begin
          ShowInfo('No voucher botol tersebut tidak ditemukan');
          edtNoTransBotol.SetFocus;
          edtNoTransBotol.SelectAll;
        end;  
      finally
        Free;
      end;   
    end;                            
  end;
end;

function TfrmPayment.GetKuponBotolStatus(ANoTransaksi: String): Integer;
var
  sSQL: string;
begin
  Result := -1;
  sSQL := 'select a.tkb_status, sum(b.tkbd_qty) as qty, '
    + 'sum(b.tkbd_total_sell_price_disc) as harga '
    + 'from trans_kupon_botol a '
    + 'inner join trans_kupon_botol_detil b on a.tkb_no = b.tkbd_tkb_no '
    + '  and a.tkb_unt_id = b.tkbd_tkb_unt_id '
    + '  and a.tkb_unt_id = ' + IntToStr(frmMain.UnitID)
    + '  and a.tkb_no = ' + Quot(ANoTransaksi)
    + ' group by a.tkb_status';

  with cOpenQuery(sSQL) do
  begin
    try
      if not eof then
      begin
        if UpperCase(Fields[0].AsString) = 'CLOSE' then
          Result := 1
        else if UpperCase(Fields[0].AsString) = 'OPEN' then
          Result := 0;
      end;
    finally
      Free;
    end;   
  end;                            
end;

function TfrmPayment.GetSisaBayar(AExclude: Double = 0): Currency;
begin
  if (edtNilaiCC.FloatValue <> 0) or (edtNilaiCC.Text <> '') then
  Result := (TotalBayar)
    - (edtNilaiTunai.FloatValue + edtNilaiCC.FloatValue + edtCCDiscNominal.FloatValue)
    + AExclude
  else
  Result := (edtNilaiBayar.Value)
    - (edtNilaiTunai.FloatValue + edtNilaiCC.FloatValue + edtCCDiscNominal.FloatValue)
    + AExclude;
  if (edtChargeCreditCard.FloatValue <> 0) or (edtChargeCreditCard.Text <> '') then
  Result := Result + edtChargeCreditCard.FloatValue;
end;

function TfrmPayment.GetVoucherLainJumlah: TStrings;
begin
  if FVoucherLainJumlah = nil then
  begin
    FVoucherLainJumlah := TStringList.Create;
  end;
    
  Result := FVoucherLainJumlah;
end;

function TfrmPayment.GetVoucherLainNilai: TStrings;
begin
  if FVoucherLainNilai = nil then
  begin
    FVoucherLainNilai := TStringList.Create;
  end;
    
  Result := FVoucherLainNilai;
end;

function TfrmPayment.GetVoucherAssalaamNomor: TStrings;
begin
  if FVoucherAssalaamNomor = nil then
  begin
    FVoucherAssalaamNomor := TStringList.Create;
  end;
    
  Result := FVoucherAssalaamNomor;
end;

function TfrmPayment.GetVoucherAssalaamJumlah: TStrings;
begin
  if FVoucherAssalaamJumlah = nil then
  begin
    FVoucherAssalaamJumlah := TStringList.Create;
  end;
    
  Result := FVoucherAssalaamJumlah;
end;

function TfrmPayment.GetVoucherAssalaamNilai: TStrings;
begin
  if FVoucherAssalaamJumlah = nil then
  begin
    FVoucherAssalaamJumlah := TStringList.Create;
  end;
    
  Result := FVoucherAssalaamJumlah;
end;

procedure TfrmPayment.HideInfo;
begin
  if pnlInfo.Visible then
  begin
    lblInfo.Caption := '';
    tmrInfo.Enabled := False;
    pnlInfo.Visible := False;
  end;
end;

procedure TfrmPayment.ShowInfo(AInfo: String; ALabelColor: TColor = clRed;
    ABackgroundColor: TColor = clYellow);
begin
  lblInfo.Caption := AInfo;
  lblInfo.Font.Color := ALabelColor;
  pnlInfo.Color := ABackgroundColor;
  tmrInfo.Enabled := True;
  pnlInfo.Visible := True;  
end;

procedure TfrmPayment.tmrInfoTimer(Sender: TObject);
begin
  lblInfo.Visible := not lblInfo.Visible;
end;

procedure TfrmPayment.edtNoVoucherKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_ESCAPE] then
  begin
    edtNoTransBotol.SetFocus;
  end
  else if Key in [VK_F12] then
  begin
    if CommonDlg.Confirm('Apakah Anda yakin me-reset voucher?') = mrYes then
    begin
      ResetVoucher;
    end;
  end;
end;

procedure TfrmPayment.edtNoVoucherExit(Sender: TObject);
var
  dtServerTime: TDateTime;
  sSQL: string;
  i   : integer;
  sNamaVoucher : String;
begin
  HideInfo;
  {$IFDEF TSN}
  sNamaVoucher := '';
  {$ELSE}
  sNamaVoucher := 'Assaalaam';
  {$ENDIF}
  //cari di voucher
  dtServerTime := cGetServerTime;
  if Trim(edtNoVoucher.Text) = '' then
  begin
    //edtGoroQty.FloatValue := 0;
    //edtGoroValue.FloatValue := 0;
    ShowTotalBayar;
  end
  else
  begin
    //get retur value
    if LeftStr(edtNoVoucher.Text,3) = 'RN/' then
    begin
      for i := 0 to VoucherAssalaamNomor.Count - 1 do    // Iterate
      begin
        if (VoucherAssalaamNomor[i] = edtNoVoucher.Text) then
        begin
          ShowInfo('Retur berikut sudah dimasukkan: ' + VoucherAssalaamNomor[i]);
          edtNoVoucher.SetFocus;
          Exit;
        end;
      end;    // for
      sSQL := 'select TRANSRET_POS_TRANS_NO as Nomor, '
            + ' TRANSRET_TOTAL_PRICE as Harga '
            + ' from TRANSAKSI_RETUR_NOTA '
            + ' where TRANSRET_UNT_ID = ' + IntToStr(frmMain.UnitID)
            + ' and TRANSRET_NO = ' + Quot(edtNoVoucher.Text);

      with cOpenQuery(sSQL) do
      begin
        try
          if not eof then
          begin
            if Trim(FieldByName('Nomor').AsString) <> '' then
            begin
              ShowInfo('No Retur tersebut sudah pernah digunakan');
              edtNoVoucher.SetFocus;
              edtNoVoucher.SelectAll;
              Exit;
            end
            else
            begin
              if FieldByName('Harga').AsFloat > edtNilaiBayar.Value then
              begin
                ShowInfo('Nilai Retur tidak boleh melebihi total belanja');
                edtNoVoucher.SetFocus;
                edtNoVoucher.SelectAll;
                Exit;
              end
              else
              begin
                AddVoucherAssalaam(edtNoVoucher.Text,FieldByName('Harga').AsFloat);
                edtGoroQty.FloatValue := edtGoroQty.FloatValue + 1;
                edtGoroValue.FloatValue := edtGoroValue.FloatValue + FieldByName('Harga').AsFloat;
                ShowTotalBayar;
                ShowInfo('No Retur berhasil: ' + edtNoVoucher.Text
                  + ' Rp. ' + FormatFloat('#,##0',FieldByName('Harga').AsFloat),clGreen);
                edtNoVoucher.Clear;
                edtNoVoucher.SetFocus;
              end;
            end;
          end
          else
          begin
            ShowInfo('No Voucher ' + sNamaVoucher + ' tersebut tidak ditemukan');
            edtNoVoucher.SetFocus;
            edtNoVoucher.SelectAll;
          end;
        finally
          Free;
        end;
      end;
    end
    else
    begin
      for i := 0 to VoucherAssalaamNomor.Count - 1 do    // Iterate
      begin
        if (VoucherAssalaamNomor[i] = edtNoVoucher.Text) then
        begin
          ShowInfo('Voucher berikut sudah dimasukkan: ' + VoucherAssalaamNomor[i]);
          edtNoVoucher.SetFocus;
          Exit;
        end;
      end;    // for
      sSQL := 'select b.vcrd_status, a.vcr_start_date, a.vcr_expire_date, '
            + 'sum(b.vcrd_nominal) as harga '
            + 'from voucher a '
            + 'inner join voucher_detil b on a.vcr_id = b.vcrd_vcr_id '
            + '  and a.vcr_unt_id = b.vcrd_vcr_unt_id '
            + '  and a.vcr_unt_id = ' + IntToStr(frmMain.UnitID)
            + '  and b.vcrd_no = ' + Quot(edtNoVoucher.Text)
            + ' group by b.vcrd_status, a.vcr_start_date, a.vcr_expire_date';

      with cOpenQuery(sSQL) do
      begin
        try
          if not eof then
          begin
            if UpperCase(Fields[0].AsString) = 'CLOSE' then
            begin
              ShowInfo('No Voucher ' + sNamaVoucher + ' tersebut sudah pernah digunakan');
              edtNoVoucher.SetFocus;
              edtNoVoucher.SelectAll;
              Exit;
            end
            else if DateOf(Fields[1].AsDateTime) > DateOf(dtServerTime) then
            begin
              ShowInfo('No Voucher ' + sNamaVoucher + ' tersebut baru akan berlaku tanggal: '
                + FormatDateTime('dd MMMM yyyy',Fields[1].AsDateTime));
              edtNoVoucher.SetFocus;
              edtNoVoucher.SelectAll;
              Exit;
            end
            else if DateOf(Fields[2].AsDateTime) < DateOf(dtServerTime) then
            begin
              ShowInfo('No Voucher ' + sNamaVoucher + ' tersebut telah expired tanggal: '
                + FormatDateTime('dd MMMM yyyy',Fields[2].AsDateTime));
              edtNoVoucher.SetFocus;
              edtNoVoucher.SelectAll;
              Exit;
            end
            else
            begin
              if Fields[3].AsFloat > edtNilaiBayar.Value then
              begin
                ShowInfo('Nilai voucher tidak boleh melebihi total belanja');
                edtNoVoucher.SetFocus;
                edtNoVoucher.SelectAll;
                Exit;
              end
              else
              begin
                AddVoucherAssalaam(edtNoVoucher.Text,Fields[3].AsFloat);
                edtGoroQty.FloatValue := edtGoroQty.FloatValue + 1;
                edtGoroValue.FloatValue := edtGoroValue.FloatValue + Fields[3].AsFloat;
                ShowTotalBayar;
                ShowInfo('No Voucher ' + sNamaVoucher + ' berhasil: ' + edtNoVoucher.Text
                  + ' Rp. ' + FormatFloat('#,##0',Fields[3].AsFloat),clGreen);
                edtNoVoucher.Clear;
                edtNoVoucher.SetFocus;
              end;
            end;
          end
          else
          begin
            ShowInfo('No Voucher ' + sNamaVoucher + ' tersebut tidak ditemukan');
            edtNoVoucher.SetFocus;
            edtNoVoucher.SelectAll;
          end;
        finally
          Free;
        end;
      end;
    end;
  end;
end;

procedure TfrmPayment.edtVoucherQtyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_ESCAPE] then
  begin
    edtNoVoucher.SetFocus;
  end
  else if Key in [VK_F12] then
  begin
    if CommonDlg.Confirm('Apakah Anda yakin me-reset voucher?') = mrYes then
    begin
      ResetVoucher;
    end;
  end
  else if Key in [VK_RETURN] then
  begin
    if (edtVoucherQty.Text = '')
      or (edtVoucherQty.Text = '0') then
    begin
      edtVoucherQty.FloatValue := VoucherLainJumlahTotal;
      edtVoucherValue.FloatValue := VoucherLainNilaiTotal;
      edtPilihan.SetFocus;
      edtPilihan.SelectAll;
    end
    else
    begin
      edtVoucherValue.SetFocus;
      edtVoucherValue.Clear;
    end;
  end;
end;

procedure TfrmPayment.ResetVoucher;
begin
  edtNoTransBotol.Clear;
  edtBotolQty.FloatValue := 0;
  edtBotolValue.FloatValue := 0;

  VoucherAssalaamNomor.Clear;
  VoucherAssalaamJumlah.Clear;
  VoucherAssalaamNilai.Clear;
  edtNoVoucher.Clear;
  edtGoroQty.FloatValue := 0;
  edtGoroValue.FloatValue := 0;

  edtVoucherQty.FloatValue := 0;
  edtVoucherValue.FloatValue := 0;
  VoucherLainJumlahTotal := 0;
  VoucherLainNilaiTotal := 0;
  VoucherLainNilai.Clear;
  VoucherLainJumlah.Clear;

  ShowTotalBayar;
end;

procedure TfrmPayment.edtVoucherValueKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key in [VK_ESCAPE] then
  begin
    edtVoucherQty.Clear;
    edtVoucherQty.SetFocus;
  end
  else if Key in [VK_F12] then
  begin
    if CommonDlg.Confirm('Apakah Anda yakin me-reset voucher?') = mrYes then
    begin
      ResetVoucher;
    end;
  end
  else if Key in [VK_RETURN] then
  begin
    if (edtVoucherQty.Text = '')
      or (edtVoucherQty.Text = '0')
      or (edtVoucherValue.Text = '')
      or (edtVoucherValue.Text = '0') then
    begin
      edtVoucherQty.FloatValue := VoucherLainJumlahTotal;
      edtVoucherValue.FloatValue := VoucherLainNilaiTotal;
      ShowTotalBayar;
      edtPilihan.SetFocus;
      Exit;
    end;

    if edtVoucherValue.FloatValue > edtNilaiBayar.Value then
    begin
      ShowInfo('Nilai voucher tidak boleh melebihi total belanja');
      edtVoucherValue.SetFocus;
      edtVoucherValue.SelectAll;
      Exit;
    end
    else
    begin
      AddVoucherLain(edtVoucherQty.FloatValue,edtVoucherValue.FloatValue);

      edtVoucherQty.FloatValue := VoucherLainJumlahTotal;
      edtVoucherValue.FloatValue := VoucherLainNilaiTotal;
      ShowTotalBayar;

      edtVoucherQty.Clear;
      edtVoucherQty.SetFocus;
    end;
  end;
end;

procedure TfrmPayment.FormShow(Sender: TObject);
begin
  ResetVoucher;
  ShowTotalBayar;
  IsConcession := False;
  IsSaved := False;
end;

function TfrmPayment.GetVoucherStatus(ANoVoucher: String): Integer;
var
  sSQL: string;
begin
  Result := -1;
  sSQL := 'select b.vcrd_status '
    + 'from voucher a '
    + 'inner join voucher_detil b on a.vcr_id = b.vcrd_vcr_id '
    + '  and a.vcr_unt_id = b.vcrd_vcr_unt_id '
    + '  and a.vcr_unt_id = ' + IntToStr(frmMain.UnitID)
    + '  and b.vcrd_no = ' + Quot(ANoVoucher);

  with cOpenQuery(sSQL) do
  begin
    try
      if not eof then
      begin
        if UpperCase(Fields[0].AsString) = 'CLOSE' then
          Result := 1
        else if UpperCase(Fields[0].AsString) = 'OPEN' then
          Result := 0;
      end;
    finally
      Free;
    end;   
  end;
end;

procedure TfrmPayment.edtNoTransBotolKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := UpCase(Key);
end;

function TfrmPayment.Get_Qty_Precision: string;
var
   i : Smallint;
begin
   Result := '0.';
   for i := 1 to (igQty_Precision * -1) do
   begin
       Result := Result + '0';
   end;
end;

procedure TfrmPayment.SetCCDisc(const Value: Double);
begin
  if FCCDisc <> Value then
  begin
    FCCDisc := Value;
  end;
end;

procedure TfrmPayment.SetCCDiscNominal(const Value: Currency);
begin
  if FCCDiscNominal <> Value then
  begin
    FCCDiscNominal := Value;
  end;
end;

procedure TfrmPayment.edtBayarCCChange(Sender: TObject);
begin
  CCBayar                   := edtBayarCC.FloatValue;
  CCDiscNominal             := Floor((CCDisc/100)*CCBayar);
  CCNilai                   := CCBayar-CCDiscNominal;
  edtCCDiscNominal.Text     := FormatFloat('#,##0',CCDiscNominal);
  edtNilaiCC.Text           := FormatFloat('#,##0',CCNilai);
  ShowTotalBayar;
  HitungSisaUang;
end;

procedure TfrmPayment.edtBayarCCExit(Sender: TObject);
begin
  if pnlInfo.Visible then
  begin
    HideInfo;
    edtJenisKartuCode.Clear;
    edtJenisKartuName.Clear;
    edtChargeCreditCard.FloatValue  := 0;
    edtBayarCC.FloatValue           := 0;
    edtNilaiCC.FloatValue           := 0;
    edtNilaiBayar.Text              := '0';
    edtCCDiscNominal.FloatValue     := 0;
  end;


  if edtBayarCC.FloatValue = 0 then
  begin
    edtJenisKartuCode.Clear;
    edtJenisKartuName.Clear;
    edtChargeCreditCard.FloatValue := 0;
    CCCharge := 0;
    CCChargePersen := 0;
    CCNilai := 0;
    HideCashBack;
    ShowTotalBayar;

    edtPilihan.SetFocus;
    Exit;
  end;

  if IsCreditCard then
  begin
    if ((edtNilaiCC.FloatValue) < CCLimit) and (edtNilaiCC.FloatValue <> 0) then
    begin
      ShowInfo(MSG_CREDIT_CARD_MINIMUM + FormatFloat('#,##0',CCLimit));
      edtBayarCC.SetFocus;
      edtBayarCC.SelectAll;
      Exit;
    end;
  end
  else //Debit Card
    if ((CCLimit>0) and (edtNilaiCC.FloatValue < CCLimit) and (edtNilaiCC.FloatValue <> 0)) then
    begin
      ShowInfo(MSG_CREDIT_CARD_MINIMUM + FormatFloat('#,##0',CCLimit) + ' [DebitCard = ' + edtJenisKartuName.Text + ']');
      edtBayarCC.SetFocus;
      edtBayarCC.SelectAll;
      Exit;
    end;

  if (edtNilaiCC.FloatValue) > (edtNilaiBayar.Value) then
  begin
    ShowInfo(MSG_CREDIT_CARD_MAXIMUM);
    edtBayarCC.SetFocus;
    edtBayarCC.SelectAll;
    Exit;
  end;

  if (edtNilaiCC.FloatValue >= Cashback_Minimum) and (IsCashbackCard) then
  begin
    ShowCashBack;
  end
  else
  begin
    HideCashBack;
  end;
end;

procedure TfrmPayment.edtBayarCCKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_ESCAPE] then
  begin
    edtJenisKartuCode.SetFocus;
  end
  else if Key in [VK_RETURN, VK_Tab] then
  begin
    edtNilaiCC.SetFocus;
  end;

end;

procedure TfrmPayment.edtGoroQtyKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  if Key in [VK_F12] then
  begin
    if CommonDlg.Confirm('Apakah Anda yakin me-reset voucher?') = mrYes then
    begin
      ResetVoucher;
    end;
  end
end;

procedure TfrmPayment.edtGoroValueKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  if Key in [VK_F12] then
  begin
    if CommonDlg.Confirm('Apakah Anda yakin me-reset voucher?') = mrYes then
    begin
      ResetVoucher;
    end;
  end;
end;

function TfrmPayment.GetAmountNonJB(aRow: Integer): Double;
begin
  Result := 0;
  if NewBarang.LoadByKode(frmTransaksi.sgTransaksi.Columns[_KolPLU].Rows[aRow]) then
  begin
    if Trim(UpperCase(NewBarang.TipeBarang.Kode)) <> 'JB' then
      Result := frmTransaksi.sgTransaksi.Columns[_KolTotal].Floats[aRow];
  end;
end;

function TfrmPayment.GetNewBarang: TNewBarang;
begin
  if FNewBarang = nil then
    FNewBarang := TNewBarang.Create(Self);

  Result := FNewBarang;
end;

procedure TfrmPayment.ParsingPrintCardValidasi;
var
  outFile: string;
  aSpell: TSpell;
begin
  HideInfo;
  mmoBackup.Clear;
  mmoTemp.Clear;
//  if edtNilaiCC.FloatValue <> 0 then //Validasi apabila ada pembayaran pakai CARD
  if CommonDlg.ShowMessage(2, 'Cetak Validasi', 'Transaksi Kartu ' + #13#10 +
                          'Tekan Enter/Yes untuk mencetak validasi Kartu !', mtConfirm) = mrYes then
  begin
    aSpell := TSpell.Create;

    outFile := cGetAppPath + 'utils\' + FILE_VALIDASI;
    if (FileExists(outFile)) then
       DeleteFile(PChar(outFile));

    mmoIsiCB.Clear;
    mmoIsiCB.Lines.Add('Tanggal / Jam : ' + FormatDateTime('dd/mm/yyyy',Now) + '  ' + FormatDateTime('HH:nn:ss',Now));
    mmoIsiCB.Lines.Add('No.Transaksi  : ' + frmTransaksi.edNoTrnTerakhir.Text);
    mmoIsiCB.Lines.Add('POS / Kasir   : ' + frmMain.FPOSCode + ' / ' + frmMain.FCashierCode + ' ' + frmMain.FCashierName);
    mmoIsiCB.Lines.Add(StrPadRight('',40,'-'));
    mmoIsiCB.Lines.Add('Kode/Nama Kartu : ' + StrPadRight(edtJenisKartuCode.Text,4,' ') + ' ' +
                         StrPadRight(edtJenisKartuName.Text,16,' '));
    mmoIsiCB.Lines.Add('No. Kartu       : ' + StrPadRight(edtNomorCC.Text,20,' '));
    mmoIsiCB.Lines.Add('No. Otorisasi   : ' + strPadRight(edtNoOtorisasiCC.Text,16,' '));
    mmoIsiCB.Lines.Add(StrPadRight('',40,'-'));

    mmoIsiCB.Lines.SaveToFile(outFile);
    PrintFile(outFile);
    Application.ProcessMessages;

    aSpell.Destroy;
  end;
  //----------------------- end print validasi  ---------------------------

end;

procedure TfrmPayment.ParsingPrintConsValidasi;
var
  i: Integer;
  outFile, sTemp: string;
  iRow: integer;
  aSpell: TSpell;
begin
  HideInfo;
  mmoBackup.Clear;
  mmoTemp.Clear;

  if CommonDlg.ShowMessage(2, 'Cetak Validasi', 'Transaksi Concession ' + #13#10 +
                          'Tekan Enter/Yes untuk mencetak validasi struk !', mtConfirm) = mrYes then
  begin
    aSpell := TSpell.Create;

    outFile := cGetAppPath + 'utils\' + FILE_VALIDASI;
    if (FileExists(outFile)) then
       DeleteFile(PChar(outFile));

    mmoIsiCB.Clear;
    mmoIsiCB.Lines.Add('Tanggal / Jam : ' + FormatDateTime('dd/mm/yyyy',Now) + '  ' + FormatDateTime('HH:nn:ss',Now));
    mmoIsiCB.Lines.Add('No.Transaksi  : ' + frmTransaksi.edNoTrnTerakhir.Text);
    mmoIsiCB.Lines.Add('POS / Kasir   : ' + frmMain.FPOSCode + ' / ' + frmMain.FCashierCode + ' ' + frmMain.FCashierName);
    mmoIsiCB.Lines.Add(StrPadRight('',40,'-'));

    mmoIsiCB.Lines.SaveToFile(outFile);
    Application.ProcessMessages;

    aSpell.Destroy;

    mmoIsiCB.Lines.SaveToFile(outFile);

    outFile := cGetAppPath + 'utils\' + FILE_ISI_STRUK;
    if (FileExists(outFile)) then
       DeleteFile(PChar(outFile));

    mmoIsiStruk.Clear;
    iRow := frmTransaksi.sgTransaksi.RowCount - 1;
    with frmTransaksi.sgTransaksi do
    begin
    for i := 1 to iRow do
    begin
      if (Cells[_KolPLU,i] <> '') and (Ints[_KolTipeBarang,i] = TipeIDConcession)  then //kalo barang jenis JB
      begin
        sTemp := '&';
        mmoIsiStruk.Lines.Add(Cells[_KolPLU,i] + sTemp + Cells[_KolNamaBarang,i]);
        sTemp := StrPadLeftCut(FormatFloat('#,##'+Get_Qty_Precision,Columns[_KolJumlah].Floats[i]),8,' ') + ' '
          + StrPadRight(Cells[_KolUOM,i],5,' ') + 'x'
          + IfThen(Columns[_KolDisc].Floats[i]>0,
            StrPadLeftCut(FormatFloat('#,##0',Columns[_KolHarga].Floats[i]) + '-'+FormatFloat('#,#0',Columns[_KolDiscP].Floats[i])+'%',12,' '),
            StrPadLeftCut(FormatFloat('#,##0',Columns[_KolHarga].Floats[i]-Columns[_KolDisc].Floats[i]),12,' '))
          + StrPadLeftCut(FormatFloat('#,##0',Columns[_KolTotal].Floats[i]),13,' ');
        mmoIsiStruk.Lines.Add(sTemp);
      end;
    end;
    end;

    sTemp := '';
    mmoIsiStruk.Lines.Add(StrPadRight('',40,'-'));
    mmoIsiStruk.Lines.SaveToFile(outFile);

    mmoBackup.Lines.AddStrings(mmoIsiCB.Lines);
    mmoBackup.Lines.AddStrings(mmoIsiStruk.Lines);
    Application.ProcessMessages;

    mmoBackup.Lines.Add('');

    Application.ProcessMessages;

    outFile := cGetAppPath + 'utils\' + 'POS_VALID.TXT';
    mmoBackup.Lines.SaveToFile(outFile);
    try
      begin
      PrintFile(outFile);
      end;
    except
      //CommonDlg.ShowError('Gagal mencetak struk');
      ShowInfo('Gagal mencetak struk');
    end;
  end;

end;

end.
