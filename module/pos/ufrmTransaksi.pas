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
  uNewBarang, uNewBarangHargaJual, uNewPosTransaction, cxSpinEdit,
  ufrmLookupBarang, uAppUtils, uModBarang, uModelHelper, uModMember,
  ufrmLookupMember, uModTransaksi, uModUnit;

type
  TfrmTransaksi = class(TForm)
    pnl1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
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
    pnlContainer: TPanel;
    pnlBarCode: TPanel;
    lbl1: TLabel;
    edPLU: TEdit;
    lblHargaKontrabon: TLabel;
    edHargaKontrabon: TcxCurrencyEdit;
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
    Brs: Integer;
    DiscOto: double;
    FCCUoMs: TStrings;
    FDisableEvent: Boolean;
    FIsEditMode: Boolean;
    FModTransaksi: TModTransaksi;
    FModTipeHarga: TModTipeHarga;
    sValueBefore: string;
    Transaksi_ID: string;
    procedure ActiveGrid;
    procedure AutoNumberCol(Sender: TcxCustomGridTableItem; ARecord:
        TcxCustomGridRecord; var AText: string);
    procedure CalculateManualDisc(var Value: Variant; var Error: Boolean; Row:
        Integer);
    function GetCCUoMs: TStrings;
    procedure SaveTransactionToCSV(ASaveDetail: Boolean = true; ASaveHeader:
        Boolean = true);
    procedure SavePendingToCSV(AMemberCode: String);
    procedure colJumlahValidate(Sender: TObject; var DisplayValue: Variant; var
        ErrorText: TCaption; var Error: Boolean);
    procedure colDiscManualValidate(Sender: TObject; var DisplayValue: Variant; var
        ErrorText: TCaption; var Error: Boolean);
    procedure DoLookupBarang(aPLU: string = '');
    procedure DoLookupMember;
    function FindInGrid(BHJ: TModBarangHargaJual): Integer;
    function GetDCItem: TcxGridDataController;
    function GetModTransaksi: TModTransaksi;
    function GetModTipeHarga: TModTipeHarga;
    procedure LoadMember(AMemberNo: String);
    function SaveToDBPending: Boolean;
    procedure SetGridFormat_Column(aColIndex: Integer; aIsCurrency: Boolean = True;
        aEditing: Boolean = True);
    procedure SetGridHeader_Transaksi;
    function SetProductToGrid(aBarang: TModBarang; aBHJ: TModBarangHargaJual; aQTY:
        Double): Integer;
    procedure FocusToPLUEdit;
    function GetDefaultMember: String;
    function GetTotalHarga(ARow: Integer): Double;
    function HitungTotalRupiah: Currency;
    procedure HideInfo;
    function LoadByPLU(aPLU_Qty: String; aUoM: String = ''; aIsLookupActive:
        Boolean = False): Integer;
    procedure ResetTransaction(WithWarning: Boolean = False);
    function GetPLUAndQty(aPLUQTY: String; var aPLU, aQTY: string): TModBarang;
    procedure UpdateData;
    property CCUoMs: TStrings read GetCCUoMs write FCCUoMs;
    property DCItem: TcxGridDataController read GetDCItem;
    property DisableEvent: Boolean read FDisableEvent write FDisableEvent;
    property ModTipeHarga: TModTipeHarga read GetModTipeHarga write FModTipeHarga;
    property ModTransaksi: TModTransaksi read GetModTransaksi write FModTransaksi;
//    procedure LoadPendingFromCSV(AMemberCode: String);
  public
    function IsCCUoM(AUoM: String): Boolean;
    procedure LoadData(aID: string = '');
    procedure ShowInfo(AInfo: String);
    procedure ShowPayment;
  end;

var
  frmTransaksi: TfrmTransaksi;
  sgHeader: TStringList;

implementation

uses
  ufrmMain, Math, uConstanta, StrUtils, udmMain, uDXUtils, uDMClient,
  uModSatuan;

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
//      dxColumn.PropertiesClass := TcxTextEditProperties;
//      TcxTextEditProperties(dxColumn.Properties).ReadOnly := True;
    end;

    Columns[0].OnGetDisplayText       := AutoNumberCol;
    Columns[0].Caption                := 'No';
    Columns[_KolPLU].Caption          := 'PLU';
    Columns[_KolNamaBarang].Caption   := 'Nama Barang';
    Columns[_KolJumlah].Caption       := 'Jumlah';
    Columns[_KolUOM].Caption          := 'UoM';
    Columns[_KolHarga].Caption        := 'Harga';
    Columns[_KolDisc].Caption         := 'Disc';
    Columns[_KolDiscManForm].Caption  := 'Manual Disc';
    Columns[_KolDiscMan].Caption      := 'Manual Disc';
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

    Columns[_KolDiscManForm].Visible  := False;
    Columns[_KolDiscMan].Visible      := False;

    Columns[0].Width              := 32;
    Columns[_KolPLU].Width        := 10 + (10 * igProd_Code_Length);
    Columns[_KolNamaBarang].Width := 250;
    Columns[_KolJumlah].Width     := 50 + (10 * Abs(igQty_Precision));
    Columns[_KolUOM].Width        := 40;
    Columns[_KolHarga].Width      := 100 + (10 * Abs(igPrice_Precision));
    Columns[_KolDisc].Width       := 50 + (10 * Abs(igPrice_Precision));
    Columns[_KolDiscManForm].Width    := 80 + (10 * Abs(igPrice_Precision));
//    Columns[_KolDiscMan].Width    := 80 + (10 * Abs(igPrice_Precision));
    Columns[_KolTotal].Width      := 120;

    {
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
    }

    SetGridFormat_Column(_KolJumlah, False);
    SetGridFormat_Column(_KolHarga, True);
    SetGridFormat_Column(_KolDisc, True);
    SetGridFormat_Column(_KolDiscMan, False);
    SetGridFormat_Column(_KolDiscManForm, False);
    SetGridFormat_Column(_KolTotal, True);

    Columns[_KolJumlah].Properties.OnValidate := colJumlahValidate;
    Columns[_KolDiscManForm].Properties.OnValidate := colDiscManualValidate;
  end;
end;

procedure TfrmTransaksi.FormCreate(Sender: TObject);
begin
  DisableEvent := False;
  try
    sgHeader := TStringList.Create;
    LoadData();
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
    sgTransaksi.Controller.FocusedRowIndex := sgTransaksi.DataController.RowCount - 1;
  end
  else
  if (Key = VK_F5) then
  begin
    DoLookupBarang;
  end
  else if Key = VK_F12 then
  begin
    btnResetClick(btnReset);
  end
  else
  if(Key = VK_RETURN)and(edPLU.Text <> '') then
  begin
    if Length(edPLU.Text) < 6 then
      edPLU.Text := TAppUtils.StrPadLeft(edPLU.Text, 6 , '0');

    LoadByPLU(edPLU.Text);
    if (not edHargaKontrabon.Focused) then edPLU.SetFocus;
  end
  else
  if Key in [VK_F9] then
  begin
    ShowPayment;
  end
  else
  if (Key in [Ord('P'), Ord('p')]) and (ssShift in Shift) and (ssCtrl in Shift)then
  begin
    if sgTransaksi.DataController.RecordCount = 0 then exit;
    if sgTransaksi.DataController.Values[0, _KolPLU] = '' then Exit;
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
//  TotalRupiahBarangCC  := 0;
//  TotalColie           := 0;
//  TotalRupiah          := 0;

  with sgTransaksi.DataController do
  begin
    for i := 0 to RecordCount - 1 do    // Iterate
    begin
      if Values[i, _KolPLU] = '' then Continue;

      Result := Result + Values[i, _KolTotal]; //Ceil
//      TotalColie := TotalColie + Round(Values[i, _KolJumlah]);

//      if (Values[i, _KolIsDiscGMC] = '1')
//        and (Values[i, _KolJumlah] <= Values[i, _KolMaxDiscQTY]) then
//      begin
//				TotalRupiahBarangAMC := TotalRupiahBarangAMC + (Values[i, _KolTotal]); //Ceil
//      end;
//
//      if (Values[i, _KolIsMailer] = '1')
//        or (IsCCUoM(Values[i, _KolUoM])) then
//				TotalRupiahBarangCC := TotalRupiahBarangCC + (Values[i, _KolTotal]); //Ceil
    end;
  end;

//  TotalRupiah := Result;
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
  sgTransaksi.SetVisibleColumns(_KolIsDecimal, _ColCount, False);
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
           - (Values[ARow, _KolDiscMan] * Values[ARow, _KolJumlah]), igPrice_Precision); //Ceil

	  {Result := (((100 - Values[ARow, _KolDisc])/100) * dTotalHargaGross) +
    	((dTotalHargaGross * Values[ARow, _KolPPN]) / 100) +
    	((dTotalHargaGross * Values[ARow, _KolPPNBM]) / 100);
     }
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
    DoLookupMember;
  end
  else if Key in [VK_F9] then
  begin
    //ShowForm(TfrmPayment,wsMaximized);
    ShowPayment;
  end;
end;

procedure TfrmTransaksi.LoadMember(AMemberNo: String);
var
  lEvent: TNotifyEvent;
begin
  lEvent := edNoPelanggan.OnExit;
  Try
    edNoPelanggan.OnExit := nil;

    if not ModTransaksi.Member.ReloadByCode(aMemberNo) then
    begin
      ShowInfo('Data ModMember tersebut TIDAK DITEMUKAN');
      exit;
    end;

    if ModTransaksi.Member.MEMBER_IS_VALID = 0 then
    begin
      ShowInfo('Data ModMember tidak valid');
      exit;
    end;

    if ModTransaksi.Member.MEMBER_IS_ACTIVE = 0 then
    begin
      ShowInfo('Data ModMember tidak aktif');
      exit;
    end;
    edNoPelanggan.Text                  := ModTransaksi.Member.MEMBER_CARD_NO;
    edNamaPelanggan.Text                := ModTransaksi.Member.MEMBER_NAME;
    sgHeader.Values[edNoPelanggan.Text] := edNamaPelanggan.Text;
    SaveTransactionToCSV(False);
  Finally
    edNoPelanggan.OnExit := lEvent;
  End;
end;

procedure TfrmTransaksi.edNoPelangganExit(Sender: TObject);
begin
  edNoPelanggan.Style.Color := clWhite;
  if Trim(edNoPelanggan.Text) <> Trim(ModTransaksi.Member.MEMBER_CARD_NO)  then
    LoadMember(edNoPelanggan.Text);
end;

procedure TfrmTransaksi.SaveTransactionToCSV(ASaveDetail: Boolean = true;
    ASaveHeader: Boolean = true);
begin
  if ASaveHeader then
    sgHeader.SaveToFile(ExtractFilePath(application.ExeName) + 'trans_header.csv');

  if ASaveDetail then
    SavePendingToCSV(ModTransaksi.Member.MEMBER_CARD_NO);

end;

procedure TfrmTransaksi.btnResetClick(Sender: TObject);
begin
  ResetTransaction(True);
end;

procedure TfrmTransaksi.btnBayarClick(Sender: TObject);
begin
  frmMain.mnPaymentClick(frmMain.mnPayment);
end;

function TfrmTransaksi.GetCCUoMs: TStrings;
//var
//  sSQL: string;
begin
//  Result := nil;
  FCCUoMs := TStringList.Create;
//  try
//    if FCCUoMs = nil then
//    begin
//      FCCUoMs := TStringList.Create;
//      sSQL := 'select ccuom_sat_code '
//        + ' from ccuom ';
//
//      with cOpenQuery(sSQL) do
//      begin
//        try
//          while not eof do
//          begin
//            FCCUoMs.Add(Fields[0].AsString);
//            Next;
//          end;
//        finally
//          Free;
//        end;
//      end;
//
//    end;
//  except
//  end;
//
  Result := FCCUoMs;
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
begin
//  Result            := False;
//  if not ValidateData then exit;
  UpdateData;
  ModTransaksi.TRANS_IS_PENDING := 1;
  Try
    ModTransaksi.ID           := DMClient.CRUDPOSClient.SaveToDBID(ModTransaksi);
    ModTransaksi.ObjectState  := 3;
    Result                    := True;
  except
    on E:Exception do
    begin
      TAppUtils.ShowException(E);
      Result          := False;
    end;
  End;
end;

procedure TfrmTransaksi.ShowPayment;
var
  lfrm: TfrmPayment;
begin
  lfrm := TfrmPayment.CreateAt(Self);
  DisableEvent := True;
  Try
    UpdateData();
    lfrm.LoadData(Self.ModTransaksi);
    if lfrm.ShowModal = mrOK then //done safe
    begin
      ResetTransaction();
    end;

  Finally
    DisableEvent := False;
    lFrm.Free;
  End;

  //frmTransaksi := GetFormByClass(TfrmTransaksi) as TfrmTransaksi;
//  if frmTransaksi <> nil then
//  begin
//    frmTransaksi.HitungTotalRupiah;
//    if (frmTransaksi.TotalRupiah > 0) and (not frmTransaksi.edHargaKontrabon.Visible) then
//    begin
//      frmTransaksi.TotalRupiahBarangAMC      := frmTransaksi.HitungTotalRupiahBarangAMC;
//      frmTransaksi.TotalRupiahBarangPPN      := frmTransaksi.HitungTotalRupiahBarangPPN;
//      frmTransaksi.TotalRupiahBarangBKP      := frmTransaksi.HitungTotalRupiahBarangBKP;
//      frmTransaksi.TotalRupiahBarangDPP      := frmTransaksi.HitungTotalRupiahBarangDPP;
//      frmTransaksi.TotalRupiahBarangBebasPPN := frmTransaksi.HitungTotalRupiahBarangBebasPPN;
//      frmTransaksi.TotalRupiahBarangDiscount := frmTransaksi.HitungTotalRupiahBarangDiscount;
//      //DISINI
//      frmPayment := (ShowForm(TfrmPayment,wsMaximized)) as TfrmPayment;
//			frmPayment.UpdateDataLokal(frmTransaksi.TotalRupiah,frmTransaksi.TotalRupiahBarangAMC,
//      	frmTransaksi.DiscAMCPersen,frmTransaksi.TotalRupiahBarangCC, frmTransaksi.TotalRupiahBarangPPN);
//      frmPayment.ResetVoucher;
//      frmPayment.ShowTotalBayar;
//    end;
//  end;
end;

procedure TfrmTransaksi.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DisableEvent then exit;
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
    if edHargaKontrabon.Visible then
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
       + ' where a.usr_id = b.ug_usr_id and ug_gro_id=11'
       + ' and a.usr_unt_id = ' + QuotedStr(frmMain.UnitID)
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
          sgTransaksi.DataController.Values[brs, _KolTotal]       := GetTotalHarga(brs);
          ActiveGrid;
          Exit;
        end;
      end
      else
      begin
        CommonDlg.ShowMessage('User ini tidak berhak melakukan discount manual');
        sgTransaksi.DataController.Values[brs, _KolDiscManForm] := sValueBefore;
        sgTransaksi.DataController.Values[brs, _KolDiscMan]     := sValueBefore;
        sgTransaksi.DataController.Values[brs, _KolTotal]       := GetTotalHarga(brs);
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

procedure TfrmTransaksi.CalculateManualDisc(var Value: Variant; var Error:
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
    ShowInfo('Discount tidak Error');
    Error := True;
  end
  else
  begin
    if dValue < 0 then
    begin
      ShowInfo('Discount tidak boleh negatif');
      Error := True;
    end;
    If (IsPercent) and (dValue > 100) then
    begin
      ShowInfo('Prosentase Discount tidak boleh melebihi 100');
      Error := True;
    end
    else
      Error := False;
  end;

  If not Error then
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

procedure TfrmTransaksi.SetGridFormat_Column(aColIndex: Integer; aIsCurrency:
    Boolean = True; aEditing: Boolean = True);
begin
  try
    with sgTransaksi.Columns[aColIndex] do
    begin
      Options.Editing := aEditing;
      PropertiesClass := TcxCurrencyEditProperties;
      with TcxCurrencyEditProperties(Properties) do
      begin
        ImmediatePost := True;
        Alignment.Horz := taRightJustify;
        UseThousandSeparator := True;
        ValidationOptions := [];
        if aIsCurrency then
        begin
//          DecimalPlaces := igQty_Precision;
          DisplayFormat := ',0.00';
        end
        else
        begin
//          DecimalPlaces := igPrice_Precision;
          DisplayFormat := ',0.###';
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

procedure TfrmTransaksi.colJumlahValidate(Sender: TObject; var DisplayValue:
    Variant; var ErrorText: TCaption; var Error: Boolean);
var
  ARow: Integer;
begin
  ARow := sgTransaksi.DataController.FocusedRecordIndex;

  HideInfo;
  FIsEditMode := True;
  sgTransaksi.Focused := True;

  if DisplayValue <= 0 then
  begin
    Error := True;
    DisplayValue := sgTransaksi.DataController.Values[ARow,_KolJumlah];
    ShowInfo('Jumlah barang tidak valid');
    Exit;
  end;

  if sgTransaksi.DataController.Values[ARow,_KolIsDecimal] = '0' then
  begin
    if (DisplayValue - Floor(DisplayValue)) > 0 then
    begin
      Error := True;
    end;
  end;

  if Error then
  begin
    ShowInfo('Jumlah barang ini tidak boleh desimal');
  end
  else
  begin
    sgTransaksi.DataController.Values[ARow,_KolJumlah]:= DisplayValue;
    sgTransaksi.DataController.Values[ARow,_KolTotal] := GetTotalHarga(ARow);

    HitungTotalRupiah;
    sgTransaksi.Focused := True;
//    sgTransaksi.Controller.FocusedRowIndex    := sgTransaksi.DataController.RowCount-1;
//    sgTransaksi.Controller.FocusedColumnIndex := _KolPLU;
    FocusToPLUEdit;

    SaveTransactionToCSV;
  end;
end;

procedure TfrmTransaksi.colDiscManualValidate(Sender: TObject; var
    DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  ARow: Integer;
begin
  ARow := sgTransaksi.DataController.FocusedRecordIndex;

  if sgTransaksi.DataController.Values[ARow,_KolDisc] <> 0 then
  begin
    Error := True;
    ShowInfo('Barang telah didiskon, tidak bisa dilakukan Manual Disc.');
  end else
  if sgTransaksi.DataController.Values[ARow,_KolIsKontrabon] = 1 then
  begin
    Error := True;
    ShowInfo('Barang Joint Business, tidak bisa dilakukan Manual Disc.');
  end else
  begin
    CalculateManualDisc(DisplayValue, Error, ARow)
  end;
end;

procedure TfrmTransaksi.DoLookupBarang(aPLU: string = '');
var
  lfrm: TfrmLookupBarang;
begin
  lfrm := TfrmLookupBarang.CreateAt(pnlContainer);
  try
    if lfrm.ShowModal = mrOK then
    begin
//      edPLU.Text          := Copy(edPLU.Text, 1, Pos('*', edPLU.Text)) + lfrm.PLU; //??
      edPLU.Text          := lfrm.PLU;
      LoadByPLU(edPLU.Text, lfrm.UOM);
    end;
  finally
    edPLU.SetFocus;
    FreeAndNil(lfrm);
  end;
end;

procedure TfrmTransaksi.DoLookupMember;
var
  lfrm: TfrmLookupMember;
begin
  lfrm := TfrmLookupMember.CreateAt(pnlContainer);
  try
    if lfrm.ShowModal = mrOK then
    begin
      LoadMember(lfrm.MemberCode);
      edPLU.SetFocus;
    end;
  finally
    FreeAndNil(lfrm);
  end;
end;

function TfrmTransaksi.FindInGrid(BHJ: TModBarangHargaJual): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to sgTransaksi.DataController.RecordCount - 1 do
  begin
    if (sgTransaksi.DataController.Values[i, _KolBHJID] = BHJ.ID) then
    begin
      Result := i;
      Break;
    end;
  end;
end;

function TfrmTransaksi.GetDCItem: TcxGridDataController;
begin
  Result := sgTransaksi.DataController;
end;

function TfrmTransaksi.GetModTransaksi: TModTransaksi;
begin
  if not Assigned(FModTransaksi) then
  begin
    FModTransaksi := TModTransaksi.Create;
    FModTransaksi.MEMBER := TModMember.Create;
  end;
  Result := FModTransaksi;
end;

function TfrmTransaksi.GetModTipeHarga: TModTipeHarga;
begin
  if not Assigned(FModTipeHarga) then
    FModTipeHarga := DMClient.CrudClient.RetrieveByCode(TModTipeHarga.ClassName, 'H004') as TModTipeHarga;
  Result := FModTipeHarga;
end;

function TfrmTransaksi.LoadByPLU(aPLU_Qty: String; aUoM: String = '';
    aIsLookupActive: Boolean = False): Integer;
var
  BHJ: TModBarangHargaJual;
  lModBarang: TModBarang;
  lPLU: string;
  lQTY: Double;
  strQTY: string;
  function ValidatePLU: Boolean;
  begin
    Result := False;
    try
      if (lQTY<0) then
      begin
        ShowInfo('Jumlah Barang tidak valid');
        exit;
      end else if lModBarang.ID = '' then
      begin
        ShowInfo('PLU / Barcode tidak ditemukan di database');
        exit;
      end else if lModBarang.BRG_IS_ACTIVE <> 1 then
      begin
        ShowInfo('Barang tidak aktif');
        exit;
//      end else if lModBarang.BRG_IS_VALIDATE <> 1 then
//      begin
//        ShowInfo('Barang tidak valid');
//        exit;
      end else if BHJ = nil then
      begin
        ShowInfo('Harga Jual Barcode belum ditemukan');
        exit;
      end else if (lModBarang.HargaJual.Count = 0) then
      begin
        ShowInfo('Barang tidak memiliki harga jual');
        exit;
      end;
    finally
      if not Result then FocusToPLUEdit;
    end;
    if not Result then Result := True;
  end;

  function GetHargaJual: TModBarangHargaJual;
  var
    lModSatuan: TModSatuan;
    lfrm : TfrmLookupBarang;
  begin
    Result := nil;
    if lModBarang.HasBarCode(lPLU) then //dari barcode
      Result := lModBarang.GetHargaJual(lPLU, ModTipeHarga.ID)
    else if aUOM <> '' then  //barcode tidak ditemukan & satuan di definiskan
    begin
      lModSatuan := DMClient.CRUDClient.RetrieveByCode(TModSatuan.ClassName, aUOM) as TModSatuan;
      try
        Result := lModBarang.GetHargaJual(lPLU, ModTipeHarga.ID, lModSatuan.ID);
      finally
        lModSatuan.Free;
      end;
    end else //hanya dapat info PLU
    begin
      if lModBarang.HargaJual.Count > 1 then
      begin
        lfrm := TfrmLookupBarang.CreateAt(pnlContainer, lModBarang.BRG_NAME);
        try
          if lfrm.ShowModal = mrOK then
            Result := lModBarang.GetHargaJual(lfrm.PLU, ModTipeHarga.ID, lfrm.UOMID);
        finally
          lfrm.Free;
        end;
      end
      else if lModBarang.HargaJual.Count = 1 then
        Result := lModBarang.HargaJual[0];
    end;
    if Assigned(Result) then
      Result.Satuan.Reload();
  end;

begin
  Result  := -1;
  edPLU.Enabled := False;
  try
    lModBarang := GetPLUAndQty(aPLU_QTY, lPLU, strQTY);
    lQTY := 1;
    if strQTY <> '' then TryStrToFloat(strQTY, lQTY);
    try
      BHJ     := GetHargaJual;
      if not ValidatePLU then exit;

      Result  := SetProductToGrid(lModBarang, BHJ, lQTY);
      if (BHJ.BHJ_SELL_PRICE = 0) and (aIsLookupActive) then
      begin
        lblHargaKontrabon.Visible  := True;
        edHargaKontrabon.Visible   := True;
        edPLU.Enabled              := False;
        cxTransaksi.Enabled        := False;
        edHargaKontrabon.SetFocus;
        edHargaKontrabon.SelectAll;
      end else  begin
        HitungTotalRupiah;
        edPLU.Clear;
        FocusToPLUEdit;
        SaveTransactionToCSV;
        edPLU.Enabled := True;
      end;
      if lModBarang.BRG_GALON_CODE <> '' then
        LoadByPLU(lModBarang.BRG_GALON_CODE);
    finally
      FreeAndNil(lModBarang);
    end;
  finally
    edPLU.Enabled := True;
  end;
end;

procedure TfrmTransaksi.sgTransaksiEditing(Sender: TcxCustomGridTableView;
    AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  if (AItem.Index in [_KolJumlah,_KolDiscMan,_KolDiscManForm])
     and (sgTransaksi.DataController.Values[(Sender as TcxGridTableView).Controller.FocusedRecordIndex, _KolPLU] <> '') then
    AAllow := True
  else
    AAllow := False;
end;

procedure TfrmTransaksi.sgTransaksiInitEdit(Sender: TcxCustomGridTableView;
    AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit);
var
  ACol, ARow : integer;
begin
  ACol := (Sender as TcxGridTableView).Controller.FocusedColumnIndex;
  ARow := (Sender as TcxGridTableView).Controller.FocusedRecordIndex;
  {
  if (ACol = _KolJumlah) or (ACol = _KolDiscMan)  then
    (Sender as TcxGridTableView).Controller.EditingController.ShowEdit(AItem);// := edFloat;
  if (ARow > 0) and (ACol > 0) then
  begin
    if ACol in [_KolJumlah] then
    begin
      TcxCurrencyEditProperties((Sender as TcxGridTableView).Columns[_KolJumlah].Properties).DisplayFormat := '%.' + IntToStr(Abs(igQty_Precision)) + 'n';
    end
    else if ACol in [_KolDisc,_KolDiscMan] then
    begin
      TcxCurrencyEditProperties((Sender as TcxGridTableView).Columns[_KolDisc].Properties).DisplayFormat := '%.' + IntToStr(Abs(igPrice_Precision)) + 'n';
      TcxCurrencyEditProperties((Sender as TcxGridTableView).Columns[_KolDiscMan].Properties).DisplayFormat := '%.' + IntToStr(Abs(igPrice_Precision)) + 'n';
    end
    else if ACol in [_KolHarga, _KolTotal] then
    begin
      TcxCurrencyEditProperties((Sender as TcxGridTableView).Columns[_KolHarga].Properties).DisplayFormat := '%.' + IntToStr(Abs(igPrice_Precision)) + 'n';
      TcxCurrencyEditProperties((Sender as TcxGridTableView).Columns[_KolTotal].Properties).DisplayFormat := '%.' + IntToStr(Abs(igPrice_Precision)) + 'n';
    end;
  end;
  }
  if ACol = _KolDiscManForm then
  begin
    if not pnlotorisasi.Visible then
    begin
      sValueBefore := (Sender as TcxGridTableView).DataController.Values[Arow,ACol];
    end;
  end;
end;

procedure TfrmTransaksi.sgTransaksiKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  if ((Key = VK_DOWN) or (Key = 34))
     and (sgTransaksi.DataController.FocusedRecordIndex = sgTransaksi.DataController.RecordCount-1) then
  begin
//    if fraLookupBarang.Showing then
//       fraLookupBarang.cxGrid.SetFocus;
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
//      if Controller.FocusedRecordIndex < DataController.RecordCount - 1 then
//      begin
        if CommonDlg.Confirm('Apakah Anda yakin akan menghapus PLU: '
          + DataController.Values[Controller.FocusedRecordIndex, _KolPLU] + ' - '
          + DataController.Values[Controller.FocusedRecordIndex, _KolNamaBarang]) = mrYes then
        begin
          DataController.DeleteFocused;
          HitungTotalRupiah;
          SaveTransactionToCSV;
        end;
//      end;
    end;    // with
  end
  else if Key in [VK_F9] then
  begin
    //ShowForm(TfrmPayment,wsMaximized);
    ShowPayment;
  end;
end;


function TfrmTransaksi.SetProductToGrid(aBarang: TModBarang; aBHJ:
    TModBarangHargaJual; aQTY: Double): Integer;
begin
  Result  := FindInGrid(aBHJ);
  if Result < 0 then Result := DCItem.AppendRecord;
  DCItem.Values[Result, _KolPLU]            := aBarang.BRG_CODE;
  DCItem.Values[Result, _KolNamaBarang]     := aBarang.BRG_NAME;
  DCItem.Values[Result, _KolIsDecimal]      := aBarang.BRG_IS_DECIMAL;
  DCItem.Values[Result, _KolIsDiscGMC]      := aBarang.BRG_IS_DISC_GMC;
  DCItem.Values[Result, _KolIsMailer]       := aBHJ.BHJ_IS_MAILER;
  DCItem.Values[Result, _KolIsCharge]       := 0;

  //    if IsCCUoM(NewUOM.UOM) then   //belum tahu
  //      DCItem.Values[Result, _KolIsCharge] := 1;

  aBarang.RefPajak.Reload();
  DCItem.Values[Result, _KolMaxDiscQTY]     := aBHJ.BHJ_MAX_QTY_DISC;
  DCItem.Values[Result, _KolPPN]            := aBarang.RefPajak.PJK_PPN;
  DCItem.Values[Result, _KolPPNBM]          := aBarang.RefPajak.PJK_PPNBM;
  DCItem.Values[Result, _KolCOGS]           := aBarang.GetHargaAvg(aBHJ.Satuan.ID);
  DCItem.Values[Result, _KolLastCost]       := aBarang.GetLastCost(aBHJ.Satuan.ID);
  DCItem.Values[Result, _KolBHJID]          := aBHJ.ID;
  DCItem.Values[Result, _KolTipeBarang]     := aBarang.TipeBarang.ID;
  DCItem.Values[Result, _KolHargaAvg]       := DCItem.Values[Result, _KolCOGS];
  if aBarang.RefPajak.PJK_PPN <> 0 then DCItem.Values[Result, _KolIsBKP] := 1;
  DCItem.Values[Result, _KolJumlah]         := VarToFLoat(DCItem.Values[Result, _KolJumlah]) + aQTY;
  DCItem.Values[Result, _KolUOM]            := aBHJ.Satuan.SAT_CODE;
  DCItem.Values[Result, _KolHargaExcPajak]
    := RoundTo(aBHJ.BHJ_SELL_PRICE / ((aBarang.RefPajak.PJK_PPN + 100) / 100), igPrice_Precision);
  DCItem.Values[Result, _KolHarga]          := RoundTo(aBHJ.BHJ_SELL_PRICE, igPrice_Precision);  //inc Tax
  DCItem.Values[Result, _KolDisc]           := RoundTo(aBHJ.BHJ_DISC_NOMINAL, igPrice_Precision);
  DCItem.Values[Result, _KolDiscMan]        := 0; //tidak dipakai di goro
  DCItem.Values[Result, _KolDiscManForm]    := 0; //tidak dipakai di goro
  DCItem.Values[Result, _Koldiscoto]        := ''; //aDiscOto;
  if aBHJ.BHJ_SELL_PRICE = 0 then
    DCItem.Values[Result, _KolIsKontrabon]  := 1
  else
    DCItem.Values[Result, _KolIsKontrabon]  := 0;
  DCItem.Values[Result, _KolTotal]          := GetTotalHarga(Result);
  DCItem.Values[Result, _KolPairCode]       := aBarang.BRG_GALON_CODE;
  DCItem.Values[Result, _KolIsGalon]        := aBarang.BRG_IS_GALON;
  DCItem.Values[Result, _KolDetailID]       := '';
end;


procedure TfrmTransaksi.UpdateData;
var
  i: Integer;
  lItem: TModTransaksiDetil;
begin
//  ModTransaksi.MEMBER                   := ModMember;
  ModTransaksi.AUTUNIT                  := TModUnit.CreateID(frmMain.UnitID);
  ModTransaksi.TRANS_DATE               := DMClient.POSClient.GetServerDate();
  ModTransaksi.TRANS_BAYAR_CARD         := 0;
  ModTransaksi.TRANS_BAYAR_CASH         := 0;
  ModTransaksi.TRANS_DISC_CARD          := 0;
  ModTransaksi.TRANS_NO                 := edNoTrnTerakhir.Text;
  ModTransaksi.TRANS_TOTAL_BAYAR        := 0;
  ModTransaksi.TRANS_TOTAL_TRANSACTION  := 0;
  ModTransaksi.TRANS_TOTAL_PPN          := 0;
  ModTransaksi.OP_CREATE                := frmMain.AuthUser;
  ModTransaksi.BALANCE                  := frmMain.BeginningBalance;
  ModTransaksi.TransaksiDetils.Clear;

  for i := 0 to DCItem.RecordCount-1 do
  begin
    lItem                           := TModTransaksiDetil.Create;
    lItem.BARANG_HARGA_JUAL         := TModBarangHargaJual.CreateID(DCItem.Values[i, _KolBHJID]);
    lItem.TIPEBARANG                := TModTipeBarang.CreateID(DCItem.Values[i, _KolTipeBarang]);
    lItem.TRANSD_BRG_CODE           := VarToStr(DCItem.Values[i, _KolPLU]);
    lItem.TRANSD_COGS               := VarToFloat(DCItem.Values[i, _KolHargaAvg]);
    lItem.TRANSD_SAT_CODE           := VarToStr(DCItem.Values[i, _KolUOM]);
    lItem.TRANSD_SELL_PRICE         := VarToFloat(DCItem.Values[i, _KolHarga]);
    lItem.TRANSD_SELL_PRICE_DISC    := lItem.TRANSD_SELL_PRICE - VarToFloat(DCItem.Values[i, _KolDisc]);
    lItem.TRANSD_PPN                := VarToFloat(DCItem.Values[i, _KolPPN]);
    lItem.TRANSD_PPNBM              := VarToFloat(DCItem.Values[i, _KolPPNBM]);
    lItem.TRANSD_LAST_COST          := VarToFloat(DCItem.Values[i, _KolLastCost]);
    lItem.TRANSD_TOTAL              := VarToFloat(DCItem.Values[i, _KolTotal]);
    lItem.TRANSD_TRANS_NO           := ModTransaksi.TRANS_NO;
    lItem.TRANSD_COGS               := VarToFloat(DCItem.Values[i, _KolCOGS]);
    lItem.TRANSD_QTY                := VarToFloat(DCItem.Values[i, _KolJumlah]);
    lItem.TRANSD_IS_BKP             := VarToInt(DCItem.Values[i, _KolIsBKP]);
    lItem.TRANSD_TOTAL_B4_TAX       := lItem.GetDPP;
    lItem.TRANSD_BRG_IS_PJK_INCLUDE := 1;
    lItem.TRANSD_DISC_CARD          := 0; //set later
    ModTransaksi.TRANS_TOTAL_TRANSACTION
      := ModTransaksi.TRANS_TOTAL_TRANSACTION + lItem.TRANSD_TOTAL;
    ModTransaksi.TransaksiDetils.Add(lItem);
  end;

  Self.HitungTotalRupiah;
end;

procedure TfrmTransaksi.LoadData(aID: string = '');
var
  i: Integer;
  lItem: TModTransaksiDetil;
  lModBarang: TModBarang;
begin

  if aID <> '' then
  begin
    ModTransaksi := DMClient.CRUDPOSClient.Retrieve(TModTransaksi.ClassName, aID) as TModTransaksi;
    ModTransaksi.MEMBER.Reload();
  end else
  begin
    if Assigned(FModTransaksi) then FreeAndNil(FModTransaksi); //reset;
    ModTransaksi.TRANS_NO := DMClient.POSClient.GetTransactionNo(frmMain.FPOSCode, frmMain.UnitID);
    ModTransaksi.MEMBER.ReloadByCode(GetDefaultMember);
  end;

  edNoTrnTerakhir.Text                := ModTransaksi.TRANS_NO;
  edNoPelanggan.Text                  := ModTransaksi.Member.MEMBER_CARD_NO;
  edNamaPelanggan.Text                := ModTransaksi.Member.MEMBER_NAME;
  sgHeader.Values[edNoPelanggan.Text] := edNamaPelanggan.Text;

  lModBarang := TModBarang.Create;
  Try

    for lItem in ModTransaksi.TransaksiDetils do
    begin
      i := DCItem.AppendRecord;
      lModBarang.ReloadByCode(lItem.TRANSD_BRG_CODE);
      lModBarang.RefPajak.Reload();
      lItem.BARANG_HARGA_JUAL.Reload(False);
      DCItem.Values[i, _KolBHJID]         := lItem.BARANG_HARGA_JUAL.ID;
      DCItem.Values[i, _KolNamaBarang]    := lModBarang.BRG_NAME;
      DCItem.Values[i, _KolTipeBarang]    := Self.ModTipeHarga.ID;
      DCItem.Values[i, _KolPLU]           := lItem.TRANSD_BRG_CODE;
      DCItem.Values[i, _KolCOGS]          := lItem.TRANSD_COGS;
      DCItem.Values[i, _KolHargaAvg]      := lItem.TRANSD_COGS;
      DCItem.Values[i, _KolUOM]           := lItem.TRANSD_SAT_CODE;
      DCItem.Values[i, _KolHarga]         := lItem.TRANSD_SELL_PRICE;
      DCItem.Values[i, _KolDisc]          := lItem.TRANSD_SELL_PRICE - lItem.TRANSD_SELL_PRICE_DISC;
      DCItem.Values[i, _KolPPN]           := lItem.TRANSD_PPN;
      DCItem.Values[i, _KolPPNBM]         := lItem.TRANSD_PPNBM;
//      DCItem.Values[i, _KolTotal]         := lItem.TRANSD_TOTAL;
      DCItem.Values[i, _KolLastCost]      := lItem.TRANSD_LAST_COST;
      DCItem.Values[i, _KolJumlah]        := lItem.TRANSD_QTY;
      DCItem.Values[i, _KolIsBKP]         := lItem.TRANSD_IS_BKP;
      DCItem.Values[i, _KolMaxDiscQTY]    := lItem.BARANG_HARGA_JUAL.BHJ_MAX_QTY_DISC;
      DCItem.Values[i, _KolIsBKP]         := 0;
      if lModBarang.RefPajak.PJK_PPN <> 0 then DCItem.Values[i, _KolIsBKP] := 1;
      DCItem.Values[i, _KolHargaExcPajak]
        := RoundTo(lItem.BARANG_HARGA_JUAL.BHJ_SELL_PRICE /
          ((lModBarang.RefPajak.PJK_PPN + 100) / 100), igPrice_Precision);
      DCItem.Values[i, _KolDiscMan]        := 0; //tidak dipakai di goro
      DCItem.Values[i, _KolDiscManForm]    := 0; //tidak dipakai di goro
      DCItem.Values[i, _Koldiscoto]        := ''; //aDiscOto;
      if lItem.BARANG_HARGA_JUAL.BHJ_SELL_PRICE = 0 then
        DCItem.Values[i, _KolIsKontrabon]  := 1
      else
        DCItem.Values[i, _KolIsKontrabon]  := 0;
      DCItem.Values[i, _KolTotal]          := GetTotalHarga(i);
      DCItem.Values[i, _KolPairCode]       := lModBarang.BRG_GALON_CODE;
      DCItem.Values[i, _KolIsGalon]        := lModBarang.BRG_IS_GALON;
      DCItem.Values[i, _KolDetailID]       := '';

    end;
    HitungTotalRupiah;
  Finally
    FreeAndNil(lModBarang);
  End;
end;

procedure TfrmTransaksi.ResetTransaction(WithWarning: Boolean = False);
begin
  if WithWarning then
    if CommonDlg.Confirm('Apakah Anda yakin akan me-RESET transaksi? '
      + 'Data di tabel akan dibersihkan.') = mrNo then
    begin
      Exit;
    end;

  If Assigned(FModTransaksi) then FreeAndNil(FModTransaksi);
  sgTransaksi.ClearRows;
  Transaksi_ID := '';
  edPLU.Clear;
  edNoTrnTerakhir.Text := DMClient.POSClient.GetTransactionNo(frmMain.FPOSCode, frmMain.UnitID);
  HitungTotalRupiah;
  SaveTransactionToCSV;
  SavePendingToCSV(ModTransaksi.Member.MEMBER_CARD_NO);
  FocusToPLUEdit;
end;

function TfrmTransaksi.GetPLUAndQty(aPLUQTY: String; var aPLU, aQTY: string):
    TModBarang;
begin
  if Pos('*', aPLUQTY) > 0 then //via PLU
  begin
    aPLU    := TAppUtils.SplitLeftStr(aPLUQTY, '*');
    Result  := DMClient.CRUDBarangClient.RetrievePOS(aPLU);
    aQTY    := TAppUtils.SplitRightStr(aPLUQTY, '*');
  end else if DMClient.POSClient.HasBarcode(aPLUQTY) then //has barcode
  begin
    aPLU := aPLUQTY;
    Result    := DMClient.CRUDBarangClient.RetrievePOS(aPLU);
  end else //PLU
  begin
    aPLU    := LeftStr(aPLUQTY, 6);
    Result  := DMClient.CRUDBarangClient.RetrievePOS(aPLU);
    aQTY    := StringReplace(aPLUQTY, aPLU,'',[]);

    //PLU has decimal
    if (aQTY <> '') and (Result.BRG_IS_DECIMAL = 1) then
    begin
      if Copy(aQTY,3,3) <> '' then
        aQTY := LeftStr(aQTY, 2) + '.' + Copy(aQTY,3,3);
    end;
  end;
end;

end.

//To DO :
//Ganti cOpenQuery ke DSProvider Rest -> done
//Ganti Lookup Barang from frame to Dialog -> done
//Ganti Lookup Member from frame to Dialog -> done
//Set Ke Grid via Object -> Grid -> done
//UpdateData -> done
//SaveDB to Pending -> done

//LoadData ->
//Setting Discount ->
