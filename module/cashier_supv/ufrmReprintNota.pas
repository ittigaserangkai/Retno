unit ufrmReprintNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, ActnList, Printers, ComCtrls,
  DateUtils, System.Actions, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  dxCore, cxDateUtils, Vcl.Menus, cxCurrencyEdit, ufraFooter4Button, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC;

type
  TfrmReprintNota = class(TfrmMasterBrowse)
    dlgOpenFile: TOpenDialog;
    dlgPntSetNota: TPrinterSetupDialog;
    pnlMain: TPanel;
    lbl1: TLabel;
    edtFileNota: TEdit;
    pnl1: TPanel;
    lbl2: TLabel;
    edtOthersTransNo: TEdit;
    pnl3: TPanel;
    lbl3: TLabel;
    edtMemberCode: TEdit;
    edtMemberName: TEdit;
    edtTotal: TcxCurrencyEdit;
    lbl4: TLabel;
    mmoBackup: TMemo;
    mmoTemp: TMemo;
    mmoHeadStruk: TMemo;
    mmoIsiStruk: TMemo;
    mmoFooterStruk: TMemo;
    mmoIsiCB: TMemo;
    edtNilaiTunai: TcxCurrencyEdit;
    edtNilaiCC: TcxCurrencyEdit;
    edtDiscGMCNominal: TcxCurrencyEdit;
    edtDiscGMCPersen: TcxCurrencyEdit;
    edtTotalDiscGMC: TcxCurrencyEdit;
    edtPembulatan: TcxCurrencyEdit;
    edtTotalBayar: TcxCurrencyEdit;
    edtChargeCC: TcxCurrencyEdit;
    edtCashback: TcxCurrencyEdit;
    edtKembali: TcxCurrencyEdit;
    edtJenisKartu: TEdit;
    edtNoKartu: TEdit;
    edtNoOtorisasi: TEdit;
    edtKodeKartu: TEdit;
    edtDiscCCNominal: TcxCurrencyEdit;
    tsPrintOthersDay: TcxTabSheet;
    tsTemp: TcxTabSheet;
    cxgrdOtherDay: TcxGrid;
    grdOtherDay: TcxGridDBTableView;
    grdlvlOtherDay: TcxGridLevel;
    procedure actAddExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtOthersTransNoChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FParamList: TStringList;
    FPathFileNota: string;
//    FTransDate: TDate;
//    FPosCode, FCsrCode, FCsrName: String;
//    FBrgAMC, FTtlBlj, FDiscPersen, FDiscNominal, FTtlBayar, FChrgCard : Real;
//    FJnsKartu, FNoKartu, FOtorisasi : string;
//    FVcrB, FVcrA, FVcrL, FColie, FTotal,
//    FCash, FCard, FVchr, FKembali, FPembulatan: Real;
    procedure SetParamList(const Value: TStringList);
    procedure SetPathFileNota(const Value: string);
    procedure ParseHeaderGrid;
    { Private declarations }
  public
    procedure PrintStruk(sTransNo: String);
    procedure RePrintStruk(sTransNo: string);
    property ParamList: TStringList read FParamList write SetParamList;
    property PathFileNota: string read FPathFileNota write SetPathFileNota;
  end;

var
  frmReprintNota: TfrmReprintNota;
  sNoTrans : String;
  isCetak  : Boolean;

implementation

uses uTSCommonDlg,  uTSINIFile, udmReport, ufrmDialogPrintPreview, uAppUtils,
     uRetnoUnit, uSpell, uConstanta, HPHelp, Math;

{$R *.dfm}

procedure TfrmReprintNota.actAddExecute(Sender: TObject);
var
   sSQL : string;
   data : TDataSet;
begin
  inherited;
  {
  if pgcBrowse.properties.activepage = tsBrowse then
  begin
    if edtFileNota.Text='' then
    begin
      CommonDlg.ShowMessage('Masukkan No Transaksi');
      edtFileNota.SetFocus;
    end
    else
    begin
      sSQL := 'SELECT TD.TRANSD_BRG_CODE as "Kode Barang", '
            + ' B.BRG_ALIAS as "Nama Barang", '
            + ' TD.TRANSD_QTY as "QTY", '
              + ' CEIL(TD.TRANSD_SELL_PRICE_DISC) AS "Harga(+ PPN)", '
  //            + ' CEIL(TD.TRANSD_SELL_PRICE) AS "Harga(+ PPN)", '
            + ' TD.TRANSD_TOTAL_CEIL as "Total" '
            + ' FROM TRANSAKSI_DETIL TD '
            + ' LEFT OUTER JOIN TRANSAKSI T ON (TD.TRANSD_TRANS_NO = T.TRANS_NO) '
            + ' AND (TD.TRANSD_TRANS_UNT_ID = T.TRANS_UNT_ID) '
            + ' LEFT OUTER JOIN BARANG B ON (TD.TRANSD_BRG_CODE = B.BRG_CODE) '
            + ' WHERE T.TRANS_NO = ' + QuotedStr(edtFileNota.Text)
            + ' AND cast(T.TRANS_DATE as date) = ' + TAppUtils.QuotD(Date);

      cQueryToGrid(sSQL,AdvColumnGrid2);
      with cOpenQuery(sSQL) do
      begin
        try
        if recordcount>0 then
          iscetak := True
        else
          isCetak := False;
        finally
            Free;
        end;
      end;
    end
  end
  else
  begin
    if edtOthersTransNo.Text='' then
    begin
      CommonDlg.ShowMessage('Masukkan No Transaksi');
      edtOthersTransNo.SetFocus;
    end
    else
    begin
      sSQL := 'SELECT TD.TRANSD_BRG_CODE as "Kode Barang", '
              + ' B.BRG_ALIAS as "Nama Barang", '
              + ' TD.TRANSD_QTY as "QTY", '
              + ' CEIL(TD.TRANSD_SELL_PRICE_DISC) AS "Harga(+ PPN)", '
  //            + ' CEIL(TD.TRANSD_SELL_PRICE) AS "Harga(+ PPN)", '
              + ' TD.TRANSD_TOTAL_CEIL as "Total" '
              + ' FROM TRANSAKSI_DETIL TD '
              + ' LEFT OUTER JOIN TRANSAKSI T ON (TD.TRANSD_TRANS_NO = T.TRANS_NO) '
              + ' AND (TD.TRANSD_TRANS_UNT_ID = T.TRANS_UNT_ID) '
              + ' LEFT OUTER JOIN BARANG B ON (TD.TRANSD_BRG_CODE = B.BRG_CODE) '
              + ' WHERE T.TRANS_NO = ' + QuotedStr(edtOthersTransNo.Text);
      cQueryToGrid(sSQL,AdvColumnGrid1);
      with cOpenQuery(sSQL) do
      begin
        try
        if recordcount>0 then
          iscetak := True
        else
          isCetak := False;
        finally
            Free;
        end;
      end;
    end;
  AdvColumnGrid1.AutoSize         := True;
  AdvColumnGrid1.ColWidths[5]     := 100;

  if not Assigned(ReprintNota) then
    ReprintNota := TReprintNota.Create;
  SetLength(arrParam,1);
  arrParam[0].tipe:= ptString;
  arrParam[0].data:= edtFileNota.Text;
  data:= ReprintNota.GetListDataTransaction(arrParam);
  if not data.IsEmpty then
  begin
    edtMemberCode.Text       := data.fieldbyname('member_card_no').AsString;
    edtMemberName.Text       := data.fieldbyname('member_name').AsString;
    edtTotalDiscGMC.Value    := data.fieldbyname('TRANS_TOTAL_DISC_GMC').AsCurrency;
    edtDiscGMCNominal.Value  := data.fieldbyname('trans_disc_gmc_nominal').AsCurrency;
    edtDiscGMCPersen.Text    := data.fieldbyname('trans_disc_gmc_persen').AsString;
    edtTotalBayar.Value      := data.fieldbyname('TRANS_TOTAL_BAYAR').AsCurrency;
    edtPembulatan.Value      := data.fieldbyname('TRANS_PEMBULAT').AsCurrency;
    edtNilaiTunai.Value      := data.fieldbyname('TRANS_BAYAR_CASH').AsCurrency;
    edtNilaiCC.Value         := data.fieldbyname('trans_bayar_card').AsCurrency;
    edtJenisKartu.Text       := data.fieldbyname('card_name').AsString;
    edtNoKartu.Text          := data.fieldbyname('transc_nomor').AsString;
    edtNoOtorisasi.Text      := data.fieldbyname('transc_no_otorisasi').AsString;
    edtKodeKartu.Text        := data.fieldbyname('CARD_CODE').AsString;
    edtChargeCC.Value        := data.fieldbyname('transc_charge').AsCurrency;
    edtDiscCCNominal.Value   := data.fieldbyname('TRANS_DISC_CARD').AsCurrency;

    edtTotal.Value:= AdvColumnGrid2.ColumnSum(5,1,AdvColumnGrid2.RowCount-1);//-data.fieldbyname('TRANS_DISC_CARD').AsCurrency;
    end;
  end;
  }
end;

procedure TfrmReprintNota.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmReprintNota.FormDestroy(Sender: TObject);
begin
  inherited;
  frmReprintNota := nil;
  frmReprintNota.Free;
end;

procedure TfrmReprintNota.actPrintExecute(Sender: TObject);
begin
  inherited;
  {
  if pgcBrowse.properties.activepage = tsBrowse then
  begin
    if edtFileNota.Text='' then
    CommonDlg.ShowMessage('Masukkan No Transaksi')
    else
    begin
      if AdvColumnGrid2.RowCount<2 then
      CommonDlg.ShowMessage('Data Kosong');
      begin
        sNoTrans := edtFileNota.Text;
        if isCetak then
          RePrintStruk( edtFileNota.Text );
        //PrintStruk(edtFileNota.Text,AdvColumnGrid2);
      end;
    end;
  end
  else
  begin
    if edtOthersTransNo.Text='' then
    CommonDlg.ShowMessage('Masukkan No Transaksi')
    else
    begin
      if AdvColumnGrid1.RowCount<2 then
      CommonDlg.ShowMessage('Data Kosong');
      begin
        sNoTrans := edtOthersTransNo.Text;
        if isCetak then
          RePrintStruk(edtOthersTransNo.Text );
        //PrintStruk(edtOthersTransNo.Text,AdvColumnGrid1);
      end
    end
  end;
  }
end;

procedure TfrmReprintNota.actRefreshExecute(Sender: TObject);
var data      : TDataSet;
    sSQL      : string;
begin
  inherited;
  {
  if edtOthersTransNo.Text='' then
  begin
    CommonDlg.ShowMessage('Masukkan No Transaksi');
    edtOthersTransNo.SetFocus;
  end
  else
  begin
    sSQL := 'SELECT TD.TRANSD_BRG_CODE as "Kode Barang", '
            + ' B.BRG_ALIAS as "Nama Barang", '
            + ' TD.TRANSD_QTY as "QTY", '
            + ' CEIL(TD.TRANSD_SELL_PRICE_DISC) AS "Harga(+ PPN)", '
//            + ' CEIL(TD.TRANSD_SELL_PRICE) AS "Harga(+ PPN)", '
            + ' TD.TRANSD_TOTAL_CEIL as "Total" '
            + ' FROM TRANSAKSI_DETIL TD '
            + ' LEFT OUTER JOIN TRANSAKSI T ON (TD.TRANSD_TRANS_NO = T.TRANS_NO) '
            + ' AND (TD.TRANSD_TRANS_UNT_ID = T.TRANS_UNT_ID) '
            + ' LEFT OUTER JOIN BARANG B ON (TD.TRANSD_BRG_CODE = B.BRG_CODE) '
            + ' WHERE T.TRANS_NO = ' + QuotedStr(edtOthersTransNo.Text);

  cQueryToGrid(sSQL,AdvColumnGrid1);
  with cOpenQuery(sSQL) do
  begin
    try
    if recordcount>0 then
      iscetak := True
    else
      isCetak := False;
    finally
        Free;
    end;
  end;
  AdvColumnGrid1.AutoSize         := True;
  AdvColumnGrid1.ColWidths[5]     := 100;

  if not Assigned(ReprintNota) then
    ReprintNota := TReprintNota.Create;
  SetLength(arrParam,1);
  arrParam[0].tipe := ptString;
  arrParam[0].data := edtOthersTransNo.Text;
  data             := ReprintNota.GetListDataTransaction(arrParam);
  if not data.IsEmpty then
  begin
    edtMemberCode.Text       := data.fieldbyname('member_card_no').AsString;
    edtMemberName.Text       := data.fieldbyname('member_name').AsString;
    edtTotalDiscGMC.Value    := data.fieldbyname('TRANS_TOTAL_DISC_GMC').AsCurrency;
    edtDiscGMCNominal.Value  := data.fieldbyname('trans_disc_gmc_nominal').AsCurrency;
    edtDiscGMCPersen.Text    := data.fieldbyname('trans_disc_gmc_persen').AsString;
    edtTotalBayar.Value      := data.fieldbyname('TRANS_TOTAL_BAYAR').AsCurrency;
    edtPembulatan.Value      := data.fieldbyname('TRANS_PEMBULAT').AsCurrency;
    edtNilaiTunai.Value      := data.fieldbyname('TRANS_BAYAR_CASH').AsCurrency;
    edtNilaiCC.Value         := data.fieldbyname('trans_bayar_card').AsCurrency;
    edtJenisKartu.Text       := data.fieldbyname('card_name').AsString;
    edtNoKartu.Text          := data.fieldbyname('transc_nomor').AsString;
    edtNoOtorisasi.Text      := data.fieldbyname('transc_no_otorisasi').AsString;
    edtKodeKartu.Text        := data.fieldbyname('CARD_CODE').AsString;
    edtChargeCC.Value        := data.fieldbyname('transc_charge').AsCurrency;
    edtDiscCCNominal.Value   := data.fieldbyname('TRANS_DISC_CARD').AsCurrency;

    edtTotal.Value:= RoundTo(AdvColumnGrid1.ColumnSum(5,1,AdvColumnGrid1.RowCount-1),0);//-data.fieldbyname('TRANS_DISC_CARD').AsCurrency;
    end
  end;
  }
end;

procedure TfrmReprintNota.SetParamList(const Value: TStringList);
begin
  FParamList := Value;
end;

procedure TfrmReprintNota.FormCreate(Sender: TObject);
begin
  inherited;
  ParamList := TStringList.Create;
end;

procedure TfrmReprintNota.SetPathFileNota(const Value: string);
begin
  FPathFileNota := Value;
end;

procedure TfrmReprintNota.FormShow(Sender: TObject);
begin
  inherited;
  edtFileNota.Clear;
  edtOthersTransNo.Clear;
  edtOthersTransNoChange(Self);
  ParseHeaderGrid;
  isCetak := False;
end;

procedure TfrmReprintNota.FormActivate(Sender: TObject);
begin
  inherited;
  frmReprintNota.Caption := 'REPRINT NOTA';
end;

procedure TfrmReprintNota.ParseHeaderGrid;
begin
//  with AdvColumnGrid1 do
//  begin
//    Clear;
//    ColCount := 5;
//    RowCount := 2;
//    Cells[0,0] := 'PLU';
//    Cells[1,0] := 'NAMA BARANG';
//    Cells[2,0] := 'QTY';
//    Cells[3,0] := 'HARGA(+ PPN)';
//    Cells[4,0] := 'TOTAL';
//
//    FixedRows := 1;
//    ClearRows(1,1);
//    AutoSize := True;
//  end;
end;

procedure TfrmReprintNota.edtOthersTransNoChange(Sender: TObject);
begin
  inherited;
  edtMemberCode.Clear;
  edtMemberName.Clear;
end;

procedure TfrmReprintNota.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key=VK_RETURN then
  begin
      actAddExecute(Self);
  end
  else if (Key = Ord('P')) and (ssctrl in Shift) then
  begin
     actPrintExecute(self);
  end;
end;

procedure TfrmReprintNota.PrintStruk(sTransNo: String);
var
  sTerbilang: string;
  isShowTotal: Boolean;
  IColie: Double;
  i: Integer;
  outFile: string;
  sTemp: string;
  iRow: integer;  
  aSpell: TSpell;
  voucher_Botol : double;
  voucher_Goro : double;
  voucher_Lain : double;
  sisaUang : Double;

begin
  {
  if not Assigned(ReprintNota) then
    ReprintNota := TReprintNota.Create;

  SetLength(arrParam,1);
  arrParam[0].tipe   := ptString;
  arrParam[0].data   := sTransNo;
  voucher_Botol      := ReprintNota.GetValueVoucherBotol(arrParam);
  voucher_Goro       := ReprintNota.GetValueVoucher(arrParam);
  voucher_Lain       := ReprintNota.GetValueVoucherLain(arrParam);

  mmoBackup.Clear;
  mmoTemp.Clear;

  //awal input data header struk
  outFile := cGetAppPath + 'Utils\' + FILE_HEAD_STRUK;
  if (FileExists(outFile)) then
     DeleteFile(PChar(outFile));
  mmoHeadStruk.Clear;

  with cOpenQuery('SELECT T.trans_no, M.member_card_no, M.member_name, T.trans_date, ' +
    'T.trans_total_transaction, T.trans_total_disc_gmc,T.trans_disc_gmc_persen, ' +
    'T.trans_disc_gmc_nominal, T.trans_total_bayar, T.trans_pembulat, ' +
    'T.trans_bayar_cash, T.trans_bayar_card, TC.transc_charge,  ' +
    'TC.transc_nomor, TC.transc_no_otorisasi, CC.card_name, ' +
    'S.setuppos_terminal_code, AU.usr_username ,AU.usr_fullname ' +
    'FROM transaksi T ' +
    'LEFT JOIN MEMBER M ON T.trans_member_id=M.member_id AND T.trans_member_unt_id=M.member_unt_id ' +
    'LEFT JOIN beginning_balance BB ON T.trans_balance_id=BB.balance_id AND T.trans_balance_unt_id=BB.balance_unt_id ' +
    'LEFT JOIN setuppos S ON BB.balance_setuppos_id=S.setuppos_id AND BB.balance_setuppos_unt_id=S.setuppos_unt_id ' +
    'LEFT JOIN aut$user AU ON BB.balance_usr_id=AU.usr_id AND BB.balance_usr_unt_id=AU.usr_unt_id ' +
    'LEFT JOIN transaksi_card TC ON T.trans_no=TC.transc_trans_no AND T.trans_unt_id=TC.transc_trans_unt_id ' +
    'LEFT JOIN ref$credit_card CC ON TC.transc_card_id=CC.card_id AND TC.transc_card_unt_id=CC.card_unt_id ' +
    'WHERE T.trans_no=' + QuotedStr(sTransNo)) do
  begin
      try
        mmoHeadStruk.Lines.Add(('POS / Kasir : ' + fieldbyname('setuppos_terminal_code').AsString)
        +' / ' + fieldbyname('usr_username').AsString + '  '+fieldbyname('usr_fullname').AsString);
        mmoHeadStruk.Lines.Add('No Trans    : ' + StrPadRight(sTransNo,18,' ') + FormatDateTime('dd/MM/yy',Now));
        mmoHeadStruk.Lines.Add('No Member   : ' + StrPadRight(fieldbyname('member_card_no').AsString,18,' ') + FormatDateTime('HH:nn:ss',Now));
        mmoHeadStruk.Lines.SaveToFile(outFile);
        mmoBackup.Lines.AddStrings(mmoHeadStruk.Lines);
        Application.ProcessMessages;
        //akhir input data header struk
      finally
        Free;
      end;
  end;
  //awal input data isi struk
  outFile := cGetAppPath + 'Utils\' + FILE_ISI_STRUK;
  if (FileExists(outFile)) then
     DeleteFile(PChar(outFile));

  mmoIsiStruk.Clear;
  mmoIsiStruk.Lines.Add(StrPadRight('',40,'-'));
  iRow := Grid.RowCount - 1;
  with Grid do
  begin
  for i := 1 to iRow do
  begin
    if (Cells[1,i] <> '') then
    begin
      sTemp := ' *';
      mmoIsiStruk.Lines.Add(Cells[1,i] + sTemp + Cells[2,i]);
      sTemp := StrPadLeftCut(FormatFloat('#,##0.000',Columns[3].Floats[i]),10,' ') + ' '
        + StrPadLeftCut(FormatFloat('#,##0',Columns[4].Floats[i]),10,' ')
        + StrPadLeftCut(FormatFloat('#,##0',Columns[5].Floats[i]),13,' ');
      mmoIsiStruk.Lines.Add(sTemp);
    end;
  end;
  end;
  
  sTemp := '';
  mmoIsiStruk.Lines.Add(StrPadRight('',40,'-'));
  mmoIsiStruk.Lines.SaveToFile(outFile);
  
  mmoBackup.Lines.AddStrings(mmoIsiStruk.Lines);
  Application.ProcessMessages;
  //akhir input data isi struk


  //input data footer struk
  outFile := cGetAppPath + 'Utils\' + FILE_FOOTER_STRUK;
  if (FileExists(outFile)) then
     DeleteFile(PChar(outFile));

  mmoFooterStruk.Clear;
  mmoFooterStruk.Lines.Add(StrPadLeftCut('TOTAL BELANJA:',27,' ')
    + StrPadLeftCut(FormatFloat('#,##0',edtTotal.Value),13,' '));

  isShowTotal := False;

    if (edtDiscGMCNominal.Value <> 0) then
  begin
    mmoFooterStruk.Lines.Add('*Brg Disc AMC'
      + StrPadLeftCut(FormatFloat('#,##0',edtTotalDiscGMC.Value),14,' '));

    mmoFooterStruk.Lines.Add(' Disc'
      + StrPadLeftCut(FormatFloat('#,##0.00%',edtDiscGMCPersen.Value),22,' ')
      + StrPadLeftCut(FormatFloat('-#,##0',edtDiscGMCNominal.Value),13,' '));

    isShowTotal := True;
  end;

    if (edtNilaiCC.Value > 0)
    and (edtChargeCC.Value > 0) then //apabila ada barang yg kena charge card
  begin
    mmoFooterStruk.Lines.Add('@Card Charge'
      + StrPadLeftCut(FormatFloat('#,##0',edtChargeCC.value),28,' '));

    isShowTotal := True;
  end else begin
  end;

  if (voucher_Botol > 0) then
  begin
    mmoFooterStruk.Lines.Add('VCR [B]' + StrPadLeftCut(FormatFloat('#,##0',voucher_Botol),9,' '));
    if (voucher_Goro = 0)
      and (voucher_Lain = 0) then
    begin
      mmoFooterStruk.Lines[mmoFooterStruk.Lines.Count-1] := mmoFooterStruk.Lines[mmoFooterStruk.Lines.Count-1]
        + StrPadLeftCut('TOT VCR:',11,' ')
        + StrPadLeftCut(FormatFloat('-#,##0',(voucher_Botol + voucher_Goro + voucher_Lain)),13,' ');
    end;
    isShowTotal := True;
  end;

   if (voucher_Goro > 0) then
  begin
    if (voucher_Botol > 0) then
      mmoFooterStruk.Lines.Add('    [A]' + StrPadLeftCut(FormatFloat('#,##0',voucher_Goro),9,' '))
    else
      mmoFooterStruk.Lines.Add('VCR [A]' + StrPadLeftCut(FormatFloat('#,##0',voucher_Goro),9,' '));

    if (voucher_Lain = 0) then
    begin
      mmoFooterStruk.Lines.Add('');
      mmoFooterStruk.Lines[mmoFooterStruk.Lines.Count-1] := mmoFooterStruk.Lines[mmoFooterStruk.Lines.Count-1]
        + StrPadLeftCut('TOT VCR:',11,' ')
        + StrPadLeftCut(FormatFloat('-#,##0',(voucher_Botol + voucher_Goro + voucher_Lain)),13,' ');
    end;
    isShowTotal := True;
  end;
  if (voucher_Lain > 0) then
  begin
    if (voucher_Botol > 0)
      or (voucher_Goro > 0) then
      mmoFooterStruk.Lines.Add('    [L]' + StrPadLeftCut(FormatFloat('#,##0',voucher_Lain),9,' '))
    else
      mmoFooterStruk.Lines.Add('VCR [L]' + StrPadLeftCut(FormatFloat('#,##0',voucher_Lain),9,' '));

      mmoFooterStruk.Lines.Add('');
      mmoFooterStruk.Lines[mmoFooterStruk.Lines.Count-1] := mmoFooterStruk.Lines[mmoFooterStruk.Lines.Count-1]
      + StrPadLeftCut('TOT VCR:',11,' ')
      + StrPadLeftCut(FormatFloat('-#,##0',(voucher_Botol + voucher_Goro + voucher_Lain)),13,' ');

    isShowTotal := True;
  end;

    if isShowTotal then
  begin    
    mmoFooterStruk.Lines.Add(StrPadLeftCut('TOTAL :',27,' ')
      + StrPadLeftCut(FormatFloat('#,##0',edtTotalBayar.Value),13,' '));
  end;

  if edtNilaiCC.Value <> 0 then //apabila ada pembayaran pakai CARD
  begin
    mmoFooterStruk.Lines.Add('');
    mmoFooterStruk.Lines.Add('Jns Kartu: ' + StrPadRight(edtJenisKartu.Text,15,' '));
    mmoFooterStruk.Lines.Add('No. Kartu: ' + StrPadRight(edtNoKartu.Text,16,' '));
    mmoFooterStruk.Lines.Add('Otorisasi: ' + StrPadRight(edtNoOtorisasi.Text,11,' ')
      + 'CARD:' + StrPadLeftCut(FormatFloat('#,##0',edtNilaiCC.Value),13,' '));
    mmoFooterStruk.Lines.Add('');
    mmoFooterStruk.Lines.Add(StrPadLeftCut('DISC CARD:',27,' ')
    + StrPadLeftCut(FormatFloat('#,##0',edtDiscCCNominal.Value),13,' '));
  sisaUang := (edtNilaiTunai.Value+edtNilaiCC.Value+edtDiscCCNominal.Value)-edtTotalBayar.Value;
  end
  else
  begin 
  sisaUang := edtNilaiTunai.Value-edtTotalBayar.Value;
  end;

  if edtNilaiTunai.Value <> 0 then
  begin
    mmoFooterStruk.Lines.Add(StrPadLeftCut('CASH:',27,' ')
      + StrPadLeftCut(FormatFloat('#,##0',edtNilaiTunai.Value),13,' '));
  end;

  mmoFooterStruk.Lines.Add(StrPadRight('',27,' ') + StrPadRight('',13,'-'));

  IColie := AdvColumnGrid1.ColumnSum(3,1,AdvColumnGrid1.RowCount-1);
  mmoFooterStruk.Lines.Add('Colie' + StrPadLeftCut(CurrToStr(IColie),9,' ')
  + StrPadLeftCut('Kembali:',13,' ') + StrPadLeftCut(FormatFloat('#,##0',sisaUang),13,' '));
  mmoFooterStruk.Lines.Add(StrPadRight('',40,'-'));

  begin
    sTemp := 'Sisa Kembalian: ' + FormatFloat('#,##0',edtPembulatan.Value);
    mmoFooterStruk.Lines.Add(StrPadLeftCut(sTemp,Length(sTemp) + ((40 - Length(sTemp)) div 2),' '));
    mmoTemp.Clear;
    mmoTemp.Lines.LoadFromFile(cGetAppPath + 'utils\' + FILE_FOOTER_SISA);
    mmoFooterStruk.Lines.AddStrings(mmoTemp.Lines);
  end;

  mmoTemp.Lines.LoadFromFile(cGetAppPath + 'utils\' + FILE_FOOTER);
  mmoFooterStruk.Lines.AddStrings(mmoTemp.Lines);
  mmoBackup.Lines.AddStrings(mmoFooterStruk.Lines);
  Application.ProcessMessages;

  with cOpenQuery('select tc.transc_cashback_nilai, cc.card_is_credit, '
                  + 'cc.card_name '
                  + 'from transaksi_card tc '
                  + 'join ref$credit_card cc on tc.transc_card_id = cc.card_id '
                  + 'and tc.transc_trans_unt_id = cc.card_unt_id '
                  + 'where tc.transc_trans_no = '+ QuotedStr(sTransNo)
                  + 'and tc.transc_trans_unt_id = '+ IntToStr(masternewunit.id)
                  + 'and cc.card_is_cashback = 1 ') do
  begin
      try
        if RecordCount>0 then
        edtCashback.Value := fieldbyname('transc_cashback_nilai').Value
        else
        edtCashback.Value :=0
      finally
        Free;
      end;
  end;


  outFile := cGetAppPath + 'utils\' + 'POS_STRUK.TXT';
  mmoBackup.Lines.SaveToFile(outFile);


  if edtCashBack.Value > 0 then
  begin
    aSpell := TSpell.Create;
    mmoTemp.Lines.LoadFromFile(cGetAppPath + 'utils\' + FILE_HEADER_CASHBACK);
    mmoBackup.Lines.AddStrings(mmoTemp.Lines);


    outFile := cGetAppPath + 'utils\' + FILE_ISI_CASHBACK;
    if (FileExists(outFile)) then
       DeleteFile(PChar(outFile));
    //Parsing data isi struk cashback
    mmoIsiCB.Clear;

    with cOpenQuery('SELECT T.trans_no, M.member_card_no, M.member_name, T.trans_date, ' +
    'T.trans_total_transaction, T.trans_total_disc_gmc,T.trans_disc_gmc_persen, ' +
    'T.trans_disc_gmc_nominal, T.trans_total_bayar, T.trans_pembulat, ' +
    'T.trans_bayar_cash, T.trans_bayar_card, TC.transc_charge,  ' +
    'TC.transc_nomor, TC.transc_no_otorisasi, CC.card_name,TC.TRANSC_CASHBACK_NILAI, ' +
    'S.setuppos_terminal_code, AU.usr_username ,AU.usr_fullname ' +
    'FROM transaksi T ' +
    'LEFT JOIN MEMBER M ON T.trans_member_id=M.member_id AND T.trans_member_unt_id=M.member_unt_id ' +
    'LEFT JOIN beginning_balance BB ON T.trans_balance_id=BB.balance_id AND T.trans_balance_unt_id=BB.balance_unt_id ' +
    'LEFT JOIN setuppos S ON BB.balance_setuppos_id=S.setuppos_id AND BB.balance_setuppos_unt_id=S.setuppos_unt_id ' +
    'LEFT JOIN aut$user AU ON BB.balance_usr_id=AU.usr_id AND BB.balance_usr_unt_id=AU.usr_unt_id ' +
    'LEFT JOIN transaksi_card TC ON T.trans_no=TC.transc_trans_no AND T.trans_unt_id=TC.transc_trans_unt_id ' +
    'LEFT JOIN ref$credit_card CC ON TC.transc_card_id=CC.card_id AND TC.transc_card_unt_id=CC.card_unt_id ' +
    'WHERE T.trans_no=' + QuotedStr(sTransNo)) do
    begin
      try

    mmoIsiCB.Lines.Add('Tanggal / Jam : ' + FormatDateTime('dd/mm/yyyy',Now) + '  ' + FormatDateTime('HH:nn:ss',Now));
    mmoIsiCB.Lines.Add('No.Transaksi  : ' + sTransNo);
    mmoIsiCB.Lines.Add(('POS / Kasir : ' + fieldbyname('setuppos_terminal_code').AsString)
    +' / ' + fieldbyname('usr_username').AsString + '  '+fieldbyname('usr_fullname').AsString);
    mmoIsiCB.Lines.Add(StrPadRight('',40,'-'));
    mmoIsiCB.Lines.Add('Kode/Nama Kartu : ' + StrPadRight(edtKodeKartu.Text,4,' ') + ' ' +
                         StrPadRight(edtJenisKartu.Text,16,' '));
    mmoIsiCB.Lines.Add('No. Kartu       : ' + StrPadRight(edtNoKartu.Text,20,' '));
    mmoIsiCB.Lines.Add('No. Otorisasi   : ' + strPadRight(edtNoOtorisasi.Text,16,' '));
    mmoIsiCB.Lines.Add(StrPadRight('',40,'-'));
    mmoIsiCB.Lines.Add('Tot Pengambilan : ' + StrPadRight(edtCashBack.Text,20,' '));
    mmoIsiCB.Lines.Add('Terbilang       : ');
    sTerbilang := aSpell.Spell(CurrToStr(edtCashBack.Value));
    mmoIsiCB.Lines.Add('[' + sTerbilang + ' Rupiah ]');
    mmoIsiCB.Lines.SaveToFile(outFile);
//    PrintFile(outFile);
    mmoBackup.Lines.AddStrings(mmoIsiCB.Lines);
    Application.ProcessMessages;
      finally
        Free;
      end;
      end;




//    PrintFile(cGetAppPath + 'utils\' + FILE_FOOTER_CASHBACK);
    mmoTemp.Clear;
    mmoTemp.Lines.LoadFromFile(cGetAppPath + 'utils\' + FILE_FOOTER_CASHBACK);
    mmoBackup.Lines.AddStrings(mmoTemp.Lines);
    mmoBackup.Lines.SaveToFile(cGetAppPath + 'utils\' + 'POS_STRUK.TXT');
    Application.ProcessMessages;

    aSpell.Destroy;
//    PrintFile(cGetAppPath + 'utils\' + FILE_HEADER_CASHBACK);
  end;
  try              
    outFile := cGetAppPath + 'utils\' + 'POS_STRUK.TXT';
    PrintFile(outFile);
  except
    CommonDlg.ShowError('Gagal mencetak struk');
  end;
  }
end;

procedure TfrmReprintNota.RePrintStruk(sTransNo: string);
//var
//  lPosTrans: TPOSTransaction;
begin
  {
  lPosTrans := TPOSTransaction.Create(Self);
  Try
    lPosTrans.LoadByTrans_No(sTransNo, MasterNewUnit.ID);

    If Assigned(lPosTrans.Trans_Struk) then
      PrintStrings(lPosTrans.Trans_Struk)
    else
      PrintStruk(sTransNO, ColumnGrid1);

  Finally
    lPosTrans.Free;
  end;
  }
end;

end.




