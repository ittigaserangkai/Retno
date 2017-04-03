unit ufrmPaymentKring;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ufraLookUpCC, Mask, AdvEdit, advlued, Grids,
  EnhEdit, Math, uRMSUnit, StrUtils;

type
  TfrmPaymentKring = class(TForm)
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
    edtNilaiBayar: TEnhancedEdit;
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
    pnlInfo: TPanel;
    lblInfo: TLabel;
    Panel10: TPanel;
    Edit1: TEdit;
    edtPilihan: TAdvEdit;
    tmrInfo: TTimer;
    Label2: TLabel;
    edtBayarCC: TAdvLUEdit;
    edtCCDiscNominal: TAdvLUEdit;
    Label1: TLabel;
    edtCCDisc: TAdvLUEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmrInfoTimer(Sender: TObject);
    procedure edtPilihanKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edtNilaiTunaiChange(Sender: TObject);
    procedure edtNilaiTunaiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtJenisKartuCodeExit(Sender: TObject);
    procedure edtJenisKartuCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNilaiCCChange(Sender: TObject);
    procedure edtNilaiCCExit(Sender: TObject);
    procedure edtNilaiCCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNoOtorisasiCCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCashBackExit(Sender: TObject);
    procedure edtCashBackKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fraLookUpCCsgLookupKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomorCCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBayarCCChange(Sender: TObject);
    procedure edtBayarCCExit(Sender: TObject);
    procedure edtBayarCCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fraLookUpCCedNamaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FCardID: Integer;
    FCashBackNilai: Currency;
    FCashback_Kelipatan: Currency;
    FCashback_Maximum: Currency;
    FCashback_Minimum: Currency;
    FCashNilai: Currency;
    FCCBayar: Currency;
    FCCCharge: Currency;
    FCCChargePersen: Currency;
    FCCDisc: Double;
    FCCDiscNominal: Currency;
    FCCLimit: Currency;
    FCCNilai: Currency;
    FCC_Minimum: Currency;
    FDiscAMCPersen: Double;
    FDiscAMCRupiah: Currency;
    FIsCashbackCard: Boolean;
    FIsCreditCard: Boolean;
    FKonstantaPembulatan: Currency;
    FPembulatan: Currency;
    FShowFooterKembalian: Integer;
    FSisaUang: Currency;
    FSisaUang_Maksimum: Currency;
    FTotalBarangAMC: Currency;
    FTotalBarangCC: Currency;
    FTotalBayar: Currency;
    FTotalBelanja: Currency;
    procedure ClearCCForm;
    function GetDiscAMCRupiah: Currency;
    function GetPembulatan: Currency;
    function GetTotalBayar: Currency;
    procedure LoadCreditCard(ACode: String);
    //procedure LineReceived(Sender : TLineSocketBase; const line : string;
    //          complete : Boolean);
    procedure ParsingPrintStrukTrans;
    procedure SetCCDisc(const Value: Double);
    procedure SetCCDiscNominal(const Value: Currency);
    { Private declarations }
  public
    function GetCCChargePersen: Double;
    function GetKonstantaPembulatan: Currency;
    function GetSisaBayar(AExclude: Double = 0): Currency;
    procedure HideCashBack;
    procedure HideInfo;
    function HitungCCCharge: Currency;
    procedure HitungSisaUang;
    procedure ResetAll;
    function SaveToDB: Boolean;
    procedure ShowCashBack;
    procedure ShowInfo(AInfo: String; ALabelColor: TColor = clRed;
        ABackgroundColor: TColor = clYellow);
    procedure ShowTotalBayar;
    property CardID: Integer read FCardID write FCardID;
    property CashBackNilai: Currency read FCashBackNilai write FCashBackNilai;
    property Cashback_Kelipatan: Currency read FCashback_Kelipatan write
        FCashback_Kelipatan;
    property Cashback_Maximum: Currency read FCashback_Maximum write
        FCashback_Maximum;
    property Cashback_Minimum: Currency read FCashback_Minimum write
        FCashback_Minimum;
    property CashNilai: Currency read FCashNilai write FCashNilai;
    property CCBayar: Currency read FCCBayar write FCCBayar;
    property CCCharge: Currency read FCCCharge write FCCCharge;
    property CCChargePersen: Currency read FCCChargePersen write FCCChargePersen;
    property CCDisc: Double read FCCDisc write SetCCDisc;
    property CCDiscNominal: Currency read FCCDiscNominal write SetCCDiscNominal;
    property CCLimit: Currency read FCCLimit write FCCLimit;
    property CCNilai: Currency read FCCNilai write FCCNilai;
    property CC_Minimum: Currency read FCC_Minimum write FCC_Minimum;
    property DiscAMCPersen: Double read FDiscAMCPersen write FDiscAMCPersen;
    property DiscAMCRupiah: Currency read GetDiscAMCRupiah write FDiscAMCRupiah;
    property IsCashbackCard: Boolean read FIsCashbackCard write FIsCashbackCard;
    property IsCreditCard: Boolean read FIsCreditCard write FIsCreditCard;
    property KonstantaPembulatan: Currency read FKonstantaPembulatan write
        FKonstantaPembulatan;
    property Pembulatan: Currency read GetPembulatan write FPembulatan;
    property ShowFooterKembalian: Integer read FShowFooterKembalian write
        FShowFooterKembalian;
    property SisaUang: Currency read FSisaUang write FSisaUang;
    property SisaUang_Maksimum: Currency read FSisaUang_Maksimum write
        FSisaUang_Maksimum;
    property TotalBarangAMC: Currency read FTotalBarangAMC write FTotalBarangAMC;
    property TotalBarangCC: Currency read FTotalBarangCC write FTotalBarangCC;
    property TotalBayar: Currency read GetTotalBayar write FTotalBayar;
    property TotalBelanja: Currency read FTotalBelanja write FTotalBelanja;
    { Public declarations }
    function Get_Qty_Precision: string;
  end;

var
  frmPaymentKring: TfrmPaymentKring;  
  iEdit : Integer;

implementation

uses
  uGTSUICommonDlg, ufrmMain, uConstanta, ufrmTransaksiKring, uSpell, HPHELP, uDOAssgros;

{$R *.dfm}   


function TfrmPaymentKring.Get_Qty_Precision: string;
var
   i : Smallint;
begin
   Result := '0.';
   for i := 1 to (igQty_Precision * -1) do
   begin
       Result := Result + '0';
   end;
end;

procedure TfrmPaymentKring.ClearCCForm;
begin
  CCChargePersen := 0;
  CCLimit := 0;
  CCCharge := 0;
  CCNilai := 0;
  CardID := -1;
  IsCashbackCard := False;

  edtJenisKartuCode.Clear;
  edtJenisKartuName.Clear;
  edtChargeCreditCard.FloatValue := 0;
  edtNilaiCC.FloatValue := 0;
  edtCashBack.FloatValue := 0;
end;

procedure TfrmPaymentKring.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmPaymentKring.HideInfo;
begin
  if pnlInfo.Visible then
  begin
    lblInfo.Caption := '';
    tmrInfo.Enabled := False;
    pnlInfo.Visible := False;
  end;
end;

procedure TfrmPaymentKring.ShowInfo(AInfo: String; ALabelColor: TColor = clRed;
    ABackgroundColor: TColor = clYellow);
begin
  lblInfo.Caption := AInfo;
  lblInfo.Font.Color := ALabelColor;
  pnlInfo.Color := ABackgroundColor;
  tmrInfo.Enabled := True;
  pnlInfo.Visible := True;  
end;

procedure TfrmPaymentKring.tmrInfoTimer(Sender: TObject);
begin
  lblInfo.Visible := not lblInfo.Visible;
end;

procedure TfrmPaymentKring.edtPilihanKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  HideInfo;
  case Key of    //
    Ord('1'), VK_NUMPAD1:
    begin
      CommonDlg.ShowMessage('Maaf Tipe pembayaran Kring/Trader hanya menggunakan kartu (2)');
      Exit;
      edtNilaiTunai.Text := FormatFloat('#,##0',GetSisaBayar(edtNilaiTunai.FloatValue));
      edtNilaiTunai.SetFocus;
      edtNilaiTunai.SelectAll;
    end;
    Ord('2'), VK_NUMPAD2:
    begin
      //ditutup karena untuk debit card gak ada batas minimal
      if (edtNilaiBayar.Value - edtNilaiTunai.FloatValue) < CCLimit  then
      begin
        CommonDlg.ShowError(MSG_CREDIT_CARD_MINIMUM + FormatFloat('#,##0',CCLimit));
        edtPilihan.SelectAll;
        Exit;
      end;
        
      edtJenisKartuCode.SetFocus;
      edtJenisKartuCode.SelectAll;
    end;
    VK_F12:
    begin
      if CommonDlg.Confirm('Apakah Anda yakin me-reset voucher?') = mrYes then
      begin
        //ResetVoucher;
      end;  
    end;
    Ord('3'), VK_NUMPAD3:
    begin
      CommonDlg.ShowMessage('Maaf Tipe pembayaran Kring/Trader hanya menggunakan kartu (2)');
      Exit;
    end;
    Ord('C'):
    begin
      if SisaUang >= 0 then
      begin
        if SisaUang <= SisaUang_Maksimum then
        begin
          if SaveToDB then
          begin
            ParsingPrintStrukTrans;
            frmTransaksiKring.ResetTransaction;
            Self.Close;
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
    VK_ESCAPE:
    begin
      Self.Close;
    end;
  end;    // case
end;

function TfrmPaymentKring.GetKonstantaPembulatan: Currency;
begin
  Result := KonstantaPembulatan;
end;

function TfrmPaymentKring.GetPembulatan: Currency;
//var
//  dTemp: Currency;
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

function TfrmPaymentKring.GetTotalBayar: Currency;
var
  dTemp: Currency;
begin
  FTotalBayar := 0;
  try
    FTotalBayar := (TotalBelanja + edtChargeCreditCard.FloatValue)
      - (edtDiscGMCNominal.Value)
  except
  end;

  FTotalBayar := Ceil(FTotalBayar);
  Pembulatan := 0;
  try
    if edtJenisKartuName.Text = '' then
    begin
//      FTotalBayar := Ceil(FTotalBayar);
      dTemp       := FTotalBayar / GetKonstantaPembulatan;
      dTemp       := dTemp + 0.5;
      dTemp       := Round(dTemp) * GetKonstantaPembulatan;
      Pembulatan  := dTemp - FTotalBayar;
      FTotalBayar := dTemp;
    end;
  except
  end;

  Result := FTotalBayar;
end;

procedure TfrmPaymentKring.HitungSisaUang;
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

procedure TfrmPaymentKring.ShowTotalBayar;
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

procedure TfrmPaymentKring.FormCreate(Sender: TObject);
begin
  fraLookUpCC.LoadData(frmMain.UnitID, 1);
  try
    CC_Minimum := StrToCurr(getGlobalVar('POS_CC_MIN'));
    Cashback_Minimum := StrToCurr(getGlobalVar('POS_CASHBACK_MIN'));
    SisaUang_Maksimum := StrToCurr(getGlobalVar('POS_SISAUANG_MAX'));
    Cashback_Kelipatan := StrToCurr(getGlobalVar('POS_CASHBACK_KELIPATAN'));
    Cashback_Maximum := StrToCurr(getGlobalVar('POS_CASHBACK_MAX'));
    KonstantaPembulatan := StrToCurr(getGlobalVar('POS_PEMBULATAN'));
    ShowFooterKembalian := StrToInt(getGlobalVar('POS_SHOW_SISAKEMBALIAN'));
  except
  end;
end;

function TfrmPaymentKring.GetDiscAMCRupiah: Currency;
begin
  FDiscAMCRupiah := 0;
  try
    FDiscAMCRupiah := (TotalBarangAMC * DiscAMCPersen) / 100;
  except
  end;
  Result := FDiscAMCRupiah;
end;

procedure TfrmPaymentKring.ResetAll;
begin
  //TotalBelanja := 0;
  //TotalBarangAMC := 0;
  //DiscAMCPersen := 0;
  CashNilai := 0;
  CCNilai := 0;
  CCCharge := 0;
  CashBackNilai := 0;
  SisaUang := 0;
  Pembulatan := 0;
  CashBackNilai := 0;
  TotalBayar := 0;

  edtTotalBelanja.Value := Ceil(TotalBelanja);
  edtBrgDiscGMC.Value := TotalBarangAMC;
  edtDiscGMCPersen.Value := DiscAMCPersen;
  edtDiscGMCNominal.Value := Floor(DiscAMCRupiah);

  if DiscAMCRupiah < edtDiscGMCNominal.Value then
  edtDiscGMCNominal.Value := edtDiscGMCNominal.Value-1;


  edtNilaiTunai.FloatValue := CashNilai;

  edtJenisKartuCode.Clear;
  edtJenisKartuName.Clear;
  edtChargeCreditCard.FloatValue := CCCharge;
  edtNilaiCC.FloatValue := CCNilai;
  edtNomorCC.Clear;
  edtNoOtorisasiCC.Clear;
  edtCashBack.FloatValue := CashBackNilai;

  
  ShowTotalBayar;
end;

procedure TfrmPaymentKring.edtNilaiTunaiChange(Sender: TObject);
begin
  CashNilai := edtNilaiTunai.FloatValue;
  HitungSisaUang;
end;

procedure TfrmPaymentKring.edtNilaiTunaiKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
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

procedure TfrmPaymentKring.HideCashBack;
begin
  lblCashback.Visible := False;
  edtCashBack.Visible := False;
  edtCashBack.FloatValue := 0;
end;

procedure TfrmPaymentKring.LoadCreditCard(ACode: String);
var
  sSQL: string;
begin
  sSQL := 'select card_code, card_name, card_limit, card_charge, '
    +' card_is_cashback, card_is_credit, card_id, CARD_DISCOUNT '
    + ' from ref$credit_card '
    + ' where card_unt_id = ' + IntToStr(frmMain.UnitID)
    + ' and CARD_IS_ACTIVE = 1' // BP Was Here
    + ' and CARD_IS_KRING = 1' // BP Was Here
    + ' and card_code = ' + QuotedStr(ACode)
    + ' order by card_code';

  ClearCCForm;
  with cOpenQuery(sSQL) do
  begin
    try
      if not eof then                                                  
      begin
        HideCashBack;
        CardID                  := Fields[6].AsInteger;
        edtJenisKartuCode.Text  := Fields[0].AsString;
        edtJenisKartuName.Text  := Fields[1].AsString;
        CCChargePersen          := Fields[3].AsCurrency;
        CCLimit                 := Fields[2].AsCurrency;
        CCDisc                 := Fields[7].AsFloat;
        edtCCDisc.FloatValue   := CCDisc;
        edtNilaiCC.FloatValue  := 0;


        if Fields[5].AsInteger = 1 then
          IsCreditCard := True
        else
          IsCreditCard := False;

        edtChargeCreditCard.FloatValue := HitungCCCharge;

        CCBayar               := TotalBayar-edtNilaiTunai.FloatValue;
        edtBayarCC.Text       := FormatFloat('#,##0' ,CCBayar);
        if CCDisc <> 0 then
        begin
//          CCBayar               := TotalBayar-edtNilaiTunai.FloatValue;
//          edtBayarCC.Text       := FormatFloat('#,##0',CCBayar);
          CCDiscNominal         := (CCDisc/100)*(CCBayar);
          CCDiscNominal         := Floor(CCDiscNominal);
          edtCCDiscNominal.Text := FormatFloat('#,##0', CCDiscNominal);
          iEdit                 := 0;
        end
        else
        CCDiscNominal := 0;

        HitungSisaUang;

        if Fields[4].AsInteger = 1 then
        begin
          IsCashbackCard := True;
          ShowCashBack;
        end;// else
          //ClearCCForm;
      end;
    finally
      Free;
    end;
  end;
  ShowTotalBayar;
end;

procedure TfrmPaymentKring.ShowCashBack;
begin
  lblCashback.Visible := True;
  edtCashBack.Visible := True;
end;

procedure TfrmPaymentKring.edtJenisKartuCodeExit(Sender: TObject);
begin
  CCDisc                  := 0;
  CCDiscNominal           := 0;
  CCBayar                 := 0;
  edtBayarCC.Text         := '0';
  edtCCDisc.Text          := '0';
  edtCCDiscNominal.Text   := '0';

  LoadCreditCard(edtJenisKartuCode.Text);
  if edtJenisKartuName.Text <> '' then
  begin
    edtNilaiCC.Text := FormatFloat('#,##0',CCBayar-CCDiscNominal);
    iEdit := 0;
  end;

//    edtNilaiCC.Text := FormatFloat('#,##0',GetSisaBayar(edtNilaiCC.FloatValue));
end;

procedure TfrmPaymentKring.edtJenisKartuCodeKeyDown(Sender: TObject;
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
    edtBayarCC.SetFocus;
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

function TfrmPaymentKring.GetCCChargePersen: Double;
begin
  Result := CCChargePersen;
end;

function TfrmPaymentKring.GetSisaBayar(AExclude: Double = 0): Currency;
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
//  Result := edtNilaiBayar.Value
//    - (edtNilaiTunai.FloatValue + edtNilaiCC.FloatValue)
//    + AExclude;
end;

function TfrmPaymentKring.HitungCCCharge: Currency;
begin
  Result := 0;
  try
    Result := Ceil(TotalBarangCC * GetCCChargePersen() / 100);  
  except
  end;
  CCCharge := Result;
end;

procedure TfrmPaymentKring.edtNilaiCCChange(Sender: TObject);
begin
  CCNilai := edtNilaiCC.FloatValue;
  ShowTotalBayar;
  HitungSisaUang;
end;

procedure TfrmPaymentKring.edtNilaiCCExit(Sender: TObject);
begin
  HideInfo;
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
    if ((edtNilaiCC.FloatValue) < CC_Minimum) and (edtNilaiCC.FloatValue <> 0) then
    begin
      //CommonDlg.ShowError(MSG_CREDIT_CARD_MINIMUM + FormatFloat('#,##0',CC_Minimum));
      ShowInfo(MSG_CREDIT_CARD_MINIMUM + FormatFloat('#,##0',CC_Minimum));
      edtNilaiCC.SetFocus;
      edtNilaiCC.SelectAll;
      Exit;
    end;

  //if (edtNilaiCC.FloatValue) > (edtNilaiBayar.Value - edtNilaiTunai.FloatValue) then
  if (edtNilaiCC.FloatValue) > (GetSisaBayar(edtNilaiCC.FloatValue)) then
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

procedure TfrmPaymentKring.edtNilaiCCKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key in [VK_ESCAPE] then
  begin
    edtJenisKartuCode.SetFocus;
  end;
end;

procedure TfrmPaymentKring.edtNoOtorisasiCCKeyDown(Sender: TObject;
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

procedure TfrmPaymentKring.edtCashBackExit(Sender: TObject);
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

procedure TfrmPaymentKring.edtCashBackKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
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

procedure TfrmPaymentKring.ParsingPrintStrukTrans;
var
  i: Integer;
  isShowTotal: Boolean;
  outFile, sTemp, sTerbilang: string;
  iRow: integer;
  aSpell: TSpell;
begin
  HideInfo;
  mmoBackup.Clear;
  mmoTemp.Clear;

  outFile := cGetAppPath + 'utils\' + FILE_HEAD_STRUK;
  if (FileExists(outFile)) then
     DeleteFile(PChar(outFile));

  {Parsing data head struk}  
  mmoHeadStruk.Clear;
  mmoHeadStruk.Lines.Add('POS / Kasir : ' + frmMain.FPOSCode + '/' + frmMain.FCashierCode + ' ' + frmMain.FCashierName);
  mmoHeadStruk.Lines.Add('No Trans    : ' + StrPadRight(frmTransaksiKring.edNoTrnTerakhir.Text,18,' ') + FormatDateTime('dd/MM/yy',Now));
  mmoHeadStruk.Lines.Add('No AMC      : ' + StrPadRight(frmTransaksiKring.edNoPelanggan.Text,18,' ') + FormatDateTime('HH:nn:ss',Now));
  mmoHeadStruk.Lines.SaveToFile(outFile);

  mmoBackup.Lines.AddStrings(mmoHeadStruk.Lines);
  Application.ProcessMessages;

  outFile := cGetAppPath + 'utils\' + FILE_ISI_STRUK;
  if (FileExists(outFile)) then
     DeleteFile(PChar(outFile));

  mmoIsiStruk.Clear;
  mmoIsiStruk.Lines.Add(StrPadRight('',40,'-'));
  iRow := frmTransaksiKring.sgTransaksi.RowCount - 1;
  with frmTransaksiKring.sgTransaksi do
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
        if Cells[_KolIsDiscGMC,i] = '1' then //kalo barang discon GMC kasih bintang di depan PLU
          sTemp := sTemp + '*'
        else
          sTemp := sTemp + ' '
      end
      else
        sTemp := sTemp + ' ';

      mmoIsiStruk.Lines.Add(Cells[_KolPLU,i] + sTemp + Cells[_KolNamaBarang,i]);
      sTemp := StrPadLeftCut(FormatFloat('#,##'+Get_Qty_Precision,Columns[_KolJumlah].Floats[i]),10,' ') + ' '
        + StrPadRight(Cells[_KolUOM,i],5,' ') + 'x'
        + StrPadLeftCut(FormatFloat('#,##0',Columns[_KolHarga].Floats[i]-Columns[_KolDisc].Floats[i]),10,' ')
        + StrPadLeftCut(FormatFloat('#,##0',Columns[_KolTotal].Floats[i]),13,' ');
      mmoIsiStruk.Lines.Add(sTemp);
    end;
  end;
  end;
  
  sTemp := '';
  mmoIsiStruk.Lines.Add(StrPadRight('',40,'-'));
  mmoIsiStruk.Lines.SaveToFile(outFile);
  //PrintFile(outFile);

  mmoBackup.Lines.AddStrings(mmoIsiStruk.Lines);
  Application.ProcessMessages;

  outFile := cGetAppPath + 'utils\' + FILE_FOOTER_STRUK;
  if (FileExists(outFile)) then
     DeleteFile(PChar(outFile));

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

  end else begin
  end;

  if edtNilaiTunai.FloatValue <> 0 then
  begin
    mmoFooterStruk.Lines.Add(StrPadLeftCut('CASH:',27,' ')
      + StrPadLeftCut(FormatFloat('#,##0',edtNilaiTunai.FloatValue),13,' '));
  end;

  mmoFooterStruk.Lines.Add(StrPadRight('',27,' ') + StrPadRight('',13,'-'));

  mmoFooterStruk.Lines.Add('Colie' + StrPadLeftCut(FormatFloat('#,##0', frmTransaksiKring.TotalColie),9,' ')
    + StrPadLeftCut('Kembali:',13,' ') + StrPadLeftCut(FormatFloat('#,##0',edtSisaUang.FloatValue),13,' '));
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

  outFile := cGetAppPath + 'utils\' + 'POS_STRUK.TXT';
  mmoBackup.Lines.SaveToFile(outFile);
  try
    PrintFile(outFile);
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

  mmoFooterStruk.Lines.SaveToFile(outFile);
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

    outFile := cGetAppPath + 'utils\' + FILE_ISI_CASHBACK;
    if (FileExists(outFile)) then
       DeleteFile(PChar(outFile));
    //Parsing data isi struk cashback
    mmoIsiCB.Clear;
    mmoIsiCB.Lines.Add('Tanggal / Jam : ' + FormatDateTime('dd/mm/yyyy',Now) + '  ' + FormatDateTime('HH:nn:ss',Now));
    mmoIsiCB.Lines.Add('No.Transaksi  : ' + frmTransaksiKring.edNoTrnTerakhir.Text);
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

    mmoIsiCB.Lines.SaveToFile(outFile);
    PrintFile(outFile);
    mmoBackup.Lines.AddStrings(mmoIsiCB.Lines);
    Application.ProcessMessages;

    PrintFile(cGetAppPath + 'utils\' + FILE_FOOTER_CASHBACK);
    mmoTemp.Clear;
    mmoTemp.Lines.LoadFromFile(cGetAppPath + 'utils\' + FILE_FOOTER_CASHBACK);
    mmoBackup.Lines.AddStrings(mmoTemp.Lines);
    mmoBackup.Lines.SaveToFile(cGetAppPath + 'utils\' + 'POS_STRUK.TXT');
    Application.ProcessMessages;

    aSpell.Destroy;
    PrintFile(cGetAppPath + 'utils\' + FILE_HEADER_CASHBACK);
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
    if (FileExists(outFile)) then
      DeleteFile(PChar(outFile));
    mmoBackup.Lines.SaveToFile(outFile);
  except
    //mmoTemp.Free;
    //mmoBackup.Free;
  end;
}
end;

function TfrmPaymentKring.SaveToDB: Boolean;
var
	sSQL: string;
begin
  Result := False;

  with TDO_ASSGROS.Create(Self) do
  begin
    try
      if LoadByDOAS_NO(frmTransaksiKring.edNomorDO.Text,frmMain.UnitID) then
      begin
        DOAS_DATE_RECEIPT := cGetServerTime;
        DOAS_NO_TRAKSAKSI := frmTransaksiKring.edNoTrnTerakhir.Text;
        DOAS_BALANCE_ID := frmMain.FBeginningBalanceID;
        //DOAS_BALANCE_UNT := DOAS_UNT;
        DOAS_CASH := edtNilaiTunai.FloatValue;
        DOAS_CREDIT_CARD := CardID;
        if edtNilaiCC.FloatValue > 0 then
        begin
          DOAS_CARD := edtNilaiCC.FloatValue;
          DOAS_NO_CARD := edtNomorCC.Text;
          //DOAS_CREDIT_CARD_UNT := DOAS_UNT;
          DOAS_OTORISASI := edtNoOtorisasiCC.Text;
        end;
        //Result := SaveToDB(frmTransaksiKring.edNomorDO.Text);
        if UpdatePaymentToDB(frmTransaksiKring.edNoTrnTerakhir.Text) then
        begin
          if UpdateBarangStockSirkulasi then
          begin
              sSQL := 'update setuppos '
                + ' set setuppos_counter_no = ' + IntToStr(StrToInt(RightStr(DOAS_NO_TRAKSAKSI,3)))
                + ' where setuppos_terminal_code = ' + Quot(frmMain.FPOSCode)
                + ' and setuppos_unt_id = ' + IntToStr(frmMain.UnitID) + ';';

              if cExecSQL(sSQL) then
              begin
                if SimpanBlob(sSQL,TDO_ASSGROS.GetHeaderFlag) then
                  Result := True;
              end;
          end;
        end;

        if Result then
        begin
          cCommitTrans;
        end
        else
        begin
          cRollbackTrans;
        end;
      end;
    finally
      Free;
    end;   
  end;    // with
end;

procedure TfrmPaymentKring.fraLookUpCCsgLookupKeyDown(Sender: TObject;
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
//    edtNilaiCC.SetFocus;
//    edtNilaiCC.SelectAll;
    edtBayarCC.SetFocus;
    edtBayarCC.SelectAll;
  end;
end;

procedure TfrmPaymentKring.edtNomorCCKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key in [VK_ESCAPE] then
  begin
    edtNilaiCC.SetFocus;
  end;
end;

procedure TfrmPaymentKring.SetCCDisc(const Value: Double);
begin
  if FCCDisc <> Value then
  begin
    FCCDisc := Value;
  end;
end;

procedure TfrmPaymentKring.SetCCDiscNominal(const Value: Currency);
begin
  if FCCDiscNominal <> Value then
  begin
    FCCDiscNominal := Value;
  end;
end;

procedure TfrmPaymentKring.edtBayarCCChange(Sender: TObject);
begin
  CCBayar                   := edtBayarCC.FloatValue;
  CCDiscNominal             := Floor((CCDisc/100)*CCBayar);
  CCNilai                   := CCBayar-CCDiscNominal;
  edtCCDiscNominal.Text     := FormatFloat('#,##0',CCDiscNominal);
  edtNilaiCC.Text           := FormatFloat('#,##0',CCNilai);
  ShowTotalBayar;
  HitungSisaUang;
end;

procedure TfrmPaymentKring.edtBayarCCExit(Sender: TObject);
begin
  HideInfo;

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

procedure TfrmPaymentKring.edtBayarCCKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key in [VK_ESCAPE] then
  begin
    edtJenisKartuCode.SetFocus;
  end;
end;

procedure TfrmPaymentKring.fraLookUpCCedNamaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  fraLookUpCC.edNamaKeyDown(Sender, Key, Shift);
  if Key in [VK_ESCAPE] then
  begin
    fraLookUpCC.Visible := False;
    edtJenisKartuCode.SetFocus;
    edtJenisKartuCode.SelectAll;
  end;

end;

end.
