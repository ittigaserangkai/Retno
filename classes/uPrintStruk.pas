unit uPrintStruk;

interface

uses
  System.Classes, uAppUtils, uModTransaksi, DateUtils, System.SysUtils,
  uModelHelper, System.StrUtils, uConstanta, udmMain, HPHELP, Winapi.Windows,
  Winapi.WinSpool, Vcl.Printers, Vcl.Dialogs;

type
  TPrintStruk = class(TObject)
  private
    FCashBackVal: Double;
    FPOSCode: String;
    FCashierCode: String;
    FIsCashBack: Boolean;
    FCashierName: String;
    FCreditCardAuthNo: String;
    FPaymentVal: Double;
    FKuponBotolVal: Double;
    FKuponBotolQty: Double;
    FCreditCardCharge: Double;
    FCreditCardDisc: Double;
    FChangeVal: Double;
    FCreditCardKind: string;
    FCreditCardNo: String;
    FVoucherVal: Double;
    FModTransaksi: TModTransaksi;
    FReprint: Boolean;
    FShowFooterKembalian: Boolean;
    //procedure LineReceived(Sender : TLineSocketBase; const line : string;
    //          complete : Boolean);
    function GenerateStruk: TStrings;
    function Get_Qty_Precision: string;
    procedure SetCreditCardKind(const Value: string);
  public
    constructor Create;
    //procedure LineReceived(Sender : TLineSocketBase; const line : string;
    //          complete : Boolean);
    procedure PrintStruk;
    procedure PrintCashBack;
    property CashBackVal: Double read FCashBackVal write FCashBackVal;
    property POSCode: String read FPOSCode write FPOSCode;
    property CashierCode: String read FCashierCode write FCashierCode;
    property IsCashBack: Boolean read FIsCashBack write FIsCashBack;
    property CashierName: String read FCashierName write FCashierName;
    property CreditCardAuthNo: String read FCreditCardAuthNo write
        FCreditCardAuthNo;
    property PaymentVal: Double read FPaymentVal write FPaymentVal;
    property KuponBotolVal: Double read FKuponBotolVal write FKuponBotolVal;
    property KuponBotolQty: Double read FKuponBotolQty write FKuponBotolQty;
    property CreditCardCharge: Double read FCreditCardCharge write
        FCreditCardCharge;
    property CreditCardDisc: Double read FCreditCardDisc write FCreditCardDisc;
    property ChangeVal: Double read FChangeVal write FChangeVal;
    property CreditCardKind: string read FCreditCardKind write SetCreditCardKind;
    property  CreditCardNo: String read FCreditCardNo write FCreditCardNo;
    property VoucherVal: Double read FVoucherVal write FVoucherVal;
    property ModTransaksi: TModTransaksi read FModTransaksi write FModTransaksi;
    property Reprint: Boolean read FReprint write FReprint;
    property ShowFooterKembalian: Boolean read FShowFooterKembalian write
        FShowFooterKembalian;
  end;

procedure PrintStrings(aSS: TStrings);

implementation

uses
  uModBarang, uSpell;

procedure PrintStrings(aSS: TStrings);
var
  Handle: THandle;
  N: DWORD;
  DocInfo1: TDocInfo1;
  DriverName: array [0..255] of char;
  DeviceName: array [0..255] of char;
  OutPut: array [0..255] of char;
  DeviceMode: Thandle;
//  i: Integer;
begin
  Printer.GetPrinter(DeviceName, DriverName, Output, DeviceMode);

  if not OpenPrinter(DeviceName, Handle, nil) then
  begin
    ShowMessage('error ' + IntToStr(GetLastError));
    Exit;
  end;

  with DocInfo1 do
  begin
    pDocName := PChar('test doc');
    pOutputFile := nil;
    pDataType := 'RAW';
  end;

  StartDocPrinter(Handle, 1, @DocInfo1);
  StartPagePrinter(Handle);

//  for i := 0 to aSS.Count-1 do
//    WritePrinter(Handle, PChar(aSS[i]), Length(aSS[i]), N);

  WritePrinter(Handle, PChar(aSS.Text), Length(aSS.Text)*SizeOf(Char), N);

  EndPagePrinter(Handle);
  EndDocPrinter(Handle);
  ClosePrinter(Handle);
end;

constructor TPrintStruk.Create;
begin
  inherited;
  Self.Reprint := False;
end;

function TPrintStruk.GenerateStruk: TStrings;
var
  i: Integer;
  isShowTotal: Boolean;
  lDetail: TModTransaksiDetil;
  lFileName: string;
  lModBarang: TModBarang;
  lSS: TStrings;
  sReportPath: string;
  sTemp: string;
begin
  lSS := TStringList.Create;
  Result := TStringList.Create;
  try
    sReportPath := TAppUtils.GetAppPath;
    Result.Add('POS / Kasir : ' + POSCode + '/'
      + CashierCode + ' ' + CashierName);
    Result.Add('No Trans    : ' + TAppUtils.StrPadRight(ModTransaksi.TRANS_NO,18,' ')
      + FormatDateTime('dd/MM/yy',Now));
    if Assigned(ModTransaksi.MEMBER) then
      Result.Add('No Member   : '
        + TAppUtils.StrPadRight(ModTransaksi.MEMBER.MEMBER_CARD_NO,18,' ')
        + FormatDateTime('HH:nn:ss',Now));

    Result.Add(TAppUtils.StrPadRight('',41,'-'));

    lModBarang := TModBarang.Create;
    Try
      for lDetail in ModTransaksi.TransaksiDetils do
      begin
        if lDetail.TRANSD_BRG_CODE = '' then continue;
        lModBarang.ReloadByCode(lDetail.TRANSD_BRG_CODE);

        Result.Add(lModBarang.BRG_CODE + ' ' + LeftStr(lModBarang.BRG_NAME,40));
        sTemp := TAppUtils.StrPadLeftCut(FormatFloat('#,##'+ Get_Qty_Precision,lDetail.TRANSD_QTY),10,' ') + ' '
            + TAppUtils.StrPadRight(lDetail.TRANSD_SAT_CODE,5,' ') + 'x'
            + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',lDetail.TRANSD_SELL_PRICE_DISC),10,' ')
            + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',lDetail.TRANSD_TOTAL),13,' ');
        Result.Add(sTemp);
      end;
    Finally
      lModBarang.Free;
    End;
    sTemp := '';
    Result.Add(TAppUtils.StrPadRight('',40,'-'));

    Result.Add(TAppUtils.StrPadLeftCut('TOTAL BELANJA:',27,' ')
      + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',ModTransaksi.TRANS_TOTAL_TRANSACTION),13,' '));

    isShowTotal := False;
    //besok tambahkan param disini, jika 0 mau ditampilkan atau tidak terserah admin

    //ganti kupon & voucher
//    if (ModTransaksi.TRANS_DISC_GMC_NOMINAL <> 0) then
//    begin
//      Result.Add('*Brg Disc AMC'
//        + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',ModTransaksi.GetTotalBarangAMC),14,' '));
//
//      Result.Add(' Disc'
//        + TAppUtils.StrPadLeftCut(FormatFloat('#,##0.00%',ModTransaksi.TRANS_DISC_GMC_PERSEN),22,' ')
//        + TAppUtils.StrPadLeftCut(FormatFloat('-#,##0',ModTransaksi.TRANS_DISC_GMC_NOMINAL),13,' '));
//
//      isShowTotal := True;
//    end;

    if (CreditCardCharge > 0)then //apabila ada barang yg kena charge card
    begin
      Result.Add('@Card Charge'
        + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',CreditCardCharge),28,' '));

      isShowTotal := True;
    end else begin
    end;

    //voucher
    if (KuponBotolVal > 0) then
    begin
      Result.Add('VCR [B]' + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',KuponBotolVal),9,' '));
      if (VoucherVal = 0) then
      begin
        Result[Result.Count-1] := Result[Result.Count-1]
          + TAppUtils.StrPadLeftCut('TOT VCR:',11,' ')
          + TAppUtils.StrPadLeftCut(FormatFloat('-#,##0',(KuponBotolVal + VoucherVal)),13,' ');
      end;
      isShowTotal := True;
    end;

    if (VoucherVal > 0) then
    begin
      if (KuponBotolVal > 0) then
        Result.Add('    [L]' + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',VoucherVal),9,' '))
      else
        Result.Add('VCR [L]' + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',VoucherVal),9,' '));

      Result[Result.Count-1] := Result[Result.Count-1]
        + TAppUtils.StrPadLeftCut('TOT VCR:',11,' ')
        + TAppUtils.StrPadLeftCut(FormatFloat('-#,##0',(KuponBotolVal + VoucherVal)),13,' ');

      isShowTotal := True;
    end;

    if isShowTotal then
    begin
      Result.Add(TAppUtils.StrPadLeftCut('TOTAL:',27,' ')
        + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',PaymentVal),13,' '));
        //+ TAppUtils.StrPadLeftCut(FormatFloat('#,##0',edtTotalBelanja.Value - edtDiscGMCNominal.Value + edtChargeCreditCard.Value),13,' '));
    end;

    if ModTransaksi.TRANS_BAYAR_CARD <> 0 then //apabila ada pembayaran pakai CARD
    begin
      sTemp := TAppUtils.StrRemoveChar(CreditCardNo, ' ');
      sTemp := TAppUtils.StrRemoveChar(sTemp,'-');
      sTemp := TAppUtils.StrRemoveChar(sTemp,'*');

      Result.Add('Jns Kartu: ' + TAppUtils.StrPadRight(CreditCardKind,15,' '));
      Result.Add('No. Kartu: ' + TAppUtils.StrPadRight(sTemp,16,' '));
      Result.Add('Otorisasi: ' + TAppUtils.StrPadRight(CreditCardAuthNo,11,' ')
        + 'CARD:' + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',
        ModTransaksi.TRANS_BAYAR_CARD),13,' '));
      Result.Add(TAppUtils.StrPadLeftCut('DISC CARD:',27,' ')
      + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',CreditCardDisc),13,' '));

    end else begin
    end;

    if ModTransaksi.TRANS_BAYAR_CASH <> 0 then
    begin
      Result.Add(TAppUtils.StrPadLeftCut('CASH:',27,' ')
        + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',ModTransaksi.TRANS_BAYAR_CASH),13,' '));
    end;

    Result.Add(TAppUtils.StrPadRight('',27,' ') + TAppUtils.StrPadRight('',13,'-'));

    Result.Add('Colie' + TAppUtils.StrPadLeftCut(FormatFloat('#,##0', ModTransaksi.GetTotalColie),9,' ')
      + TAppUtils.StrPadLeftCut('Kembali:',13,' ') + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',

      ChangeVal),13,' '));
    Result.Add(TAppUtils.StrPadRight('',40,'-'));

    //Mencoba disini PAJAK !!!!
    Result.Add('BKP :' + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',ModTransaksi.GetSubTotal),7,' ')
      + TAppUtils.StrPadLeftCut('DISC :',21,' ') + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',ModTransaksi.GetDiscount),7,' '));
    Result.Add('DPP :' + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',ModTransaksi.GetDPP),7,' ')
      + TAppUtils.StrPadLeftCut('PPN :',21,' ') + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',ModTransaksi.GetPPN),7,' '));
    Result.Add('Bebas PPN :' + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',ModTransaksi.GetNonBKP),7,' '));

    Result.Add(TAppUtils.StrPadRight('',40,'-'));

    //sisa kembalian
//    if ShowFooterKembalian then
//    begin
//      sTemp := 'Sisa Kembalian: ' + FormatFloat('#,##0',Pembulatan);
//      Result.Add(TAppUtils.StrPadLeftCut(sTemp,Length(sTemp) + ((40 - Length(sTemp)) div 2),' '));
//    end;

    if (CashBackVal > 0) then
      lSS.LoadFromFile(sReportPath + 'utils\' + FILE_HEADER_CASHBACK)
    else
      lSS.LoadFromFile(sReportPath + 'utils\' + FILE_HEADER);

    Result.AddStrings(lSS);
    for i := lSS.Count + 1 to 4 do Result.Add('');


    lFileName := ModTransaksi.TRANS_NO + '.txt';
    if Reprint then lFileName := ModTransaksi.TRANS_NO + '_R.txt';
    Result.SaveToFile(TAppUtils.GetAppPath + lFileName);

  finally
    lSS.Free;
  end;
end;

procedure TPrintStruk.PrintStruk;
var
  lSS: TStrings;
begin
  lSS := GenerateStruk;
  Try
    PrintStrings(lSS);
    PrintCashBack;
  Finally
    lSS.Free;
  End;
end;

function TPrintStruk.Get_Qty_Precision: string;
var
   i : Smallint;
begin
   Result := '0.';
   for i := 1 to (igQty_Precision * -1) do
   begin
       Result := Result + '0';
   end;
end;

procedure TPrintStruk.PrintCashBack;
var
  aSpell: TSpell;
  lSS: TStrings;
  sReportPath: string;
  sTerbilang: string;
begin
  if (CashBackVal> 0) then
  begin
    lSS := TStringList.Create;
    aSpell := TSpell.Create;
    try
      sReportPath := TAppUtils.GetAppPath;
      lSS.Add('Tanggal / Jam : ' + FormatDateTime('dd/mm/yyyy',Now) + '  ' + FormatDateTime('HH:nn:ss',Now));
      lSS.Add('No.Transaksi  : ' + ModTransaksi.TRANS_NO);
      lSS.Add('POS / Kasir   : ' + POSCode + ' / ' + CashierCode + ' ' + CashierName);
      lSS.Add(TAppUtils.StrPadRight('',40,'-'));
      lSS.Add('Kode/Nama Kartu : ' + TAppUtils.StrPadRight(CreditCardKind,20,' '));
      lSS.Add('No. Kartu       : ' + TAppUtils.StrPadRight(CreditCardNo,20,' '));
      lSS.Add('No. Otorisasi   : ' + TAppUtils.StrPadRight(CreditCardAuthNo,16,' '));
      lSS.Add(TAppUtils.StrPadRight('',40,'-'));
      lSS.Add('Tot Pengambilan : ' + TAppUtils.StrPadRight(FloatToStr(CashBackVal),20,' '));
      lSS.Add('Terbilang       : ');
      sTerbilang := aSpell.Spell(FloatToStr(CashBackVal));
      lSS.Add('[' + sTerbilang + ']');

      lSS.SaveToFile(sReportPath + 'utils\' + FILE_FOOTER_CASHBACK);
      PrintFile(sReportPath + 'utils\' + FILE_FOOTER_CASHBACK);
    finally
      lSS.Free;
      aSpell.Free;
    end;
  end;
end;

procedure TPrintStruk.SetCreditCardKind(const Value: string);
begin
  FCreditCardKind := Value;
end;

end.
