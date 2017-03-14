unit ufrmDialogPOFromAssgros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, SUIForm,
  StdCtrls, Mask, JvToolEdit, JvLabel, Grids, BaseGrid, AdvGrid, JvEdit,
  JclStrings, cbxbase, dblup1a, ImgList, frxClass, uPOAssgrosNew, uRMSUnit,DateUtils,
  EditBtn, Math, ActnList, AdvObj, JvExControls, JvExStdCtrls, JvValidateEdit,
  JvExMask;

type
  TFormMode = (fmAdd, fmEdit);
  TModul    = (mPOFromAssgros, mPriceConf, mNone);
  TfrmDialogPOFromAssgros = class(TfrmMasterDialog)
    pnl1: TPanel;
    pnl2: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    dtTgl: TJvDateEdit;
    edtTraderName: TEdit;
    lbl7: TLabel;
    lbl4: TLabel;
    edtStatus: TEdit;
    edtLeadTime: TEdit;
    lbl5: TLabel;
    lbl8: TLabel;
    lbl10: TLabel;
    edtTOP: TEdit;
    lbl9: TLabel;
    lbl6: TLabel;
    edtPONo: TEdit;
    strgGrid: TAdvStringGrid;
    pnl3: TPanel;
    lbl11: TLabel;
    edtKodeBarang: TEdit;
    edtTraderType: TEdit;
    curredtTotalPO: TJvValidateEdit;
    lblDeleteRow: TJvLabel;
    edtQty: TJvValidateEdit;
    lbl12: TLabel;
    cbbTraderType: TComboBox;
    lblIsMember: TLabel;
    chkAppend: TCheckBox;
    cbTipeHarga: TComboBox;
    btnLoadCSV: TButton;
    cbbUom: TComboBox;
    cbTraderCode: TEditBtn;
    img1: TImage;
    lblQty: TLabel;
    lblHarga: TLabel;
    edtBarang: TEdit;
    edtHarga: TJvValidateEdit;
    Label1: TLabel;
    edtplafon: TJvValidateEdit;
    edttampung: TJvValidateEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblTambahClick(Sender: TObject);
    procedure dtTglKeyPress(Sender: TObject; var Key: Char);
    procedure edtTraderNameKeyPress(Sender: TObject; var Key: Char);
    procedure lblDeleteRowClick(Sender: TObject);
    procedure strgGridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure strgGridCellValidate(Sender: TObject; ACol, ARow: Integer;
      var Value: String; var Valid: Boolean);
    procedure dtTglKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
                              procedure cbbTraderTypeChange(Sender: TObject);
    procedure cbbTraderTypeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure chkAppendClick(Sender: TObject);
    procedure cbTipeHargaChange(Sender: TObject);
    procedure cbTipeHargaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure strgGridGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure cbTraderCodeButtonClick(Sender: TObject);
    procedure cbTraderCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLoadCSVClick(Sender: TObject);
    procedure cbTraderCodeClickBtn(Sender: TObject);
    procedure cbTraderCodeChange(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtHargaKeyPress(Sender: TObject; var Key: Char);
    procedure strgGridKeyPress(Sender: TObject; var Key: Char);
  private
    nn          : Integer;
//    CurState    : Integer;
//    NextState   : Integer;


    FIsProcessSuccessfull : boolean;
    FFormMode   : TFormMode;

    FIsDecimal  : Integer;
    TraderId    : Integer;
    Traderuntid : Integer; 
    BrgCode,
    BrgAlias,
    BrgName     : string;
    BrgUnitID   : Integer;
    BrgHarga    : Currency;
    BrgTipeBarang : integer;
    BrgTipeHarga : integer;

    DiscPersen  : Currency;
    DiscNominal : Currency;
    BrgHargaAfterDisc : Currency;

    BrgIsDiscGMC : Integer;
    FCogs: Double;

    FModul        : TModul;
    FNomorPO      : string;
    FTipeMemberId : Integer;
    FIsMember     : Boolean;
    FLastCost     : Double;
    Fscale        : Double;
    Fmarkup       : Double;
    FUomLastPurchase: string;
    FxIDGen       : Integer;


    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure ParseHeaderGrid;
    procedure PrepareFormAdd;
    procedure PrepareFormEdit;
    procedure ClearForm;
    procedure ClearTraderNm;
    procedure SavePOAssgros;
    procedure ParseDataTipeHarga;
    function ExplodeBarcode: string;
    procedure SetModul(const Value: TModul);
    procedure PrintPriceConf;
    procedure CurTotalPo;
    function GetDataVariable: Boolean;
    procedure Harga;
    procedure HideCol;
    procedure KodeBarang(Key: Word);
    procedure SaveTempDataPOAssgros;
    function SetDataGrid: Boolean;
    procedure SetHarga(aVisible: Boolean);
    procedure SetUomJual;
    procedure LookUpData(Sender:TObject; Key: Word);
    procedure Qty;
    procedure SetNoUrut;
    procedure Uom;
  public
    function AdaPLUYangQTYnyaNol: Boolean;
    function GenerateNoPO(aDate : TDateTime; aUnitCode : String; aUnitID :
        integer): string;
    function GetPlafonTrader(aid : Integer; aUnitID : Integer): Double;
    procedure IsiDiscMember;
    procedure ShowPriceConfirmation(aID : Integer);
    { Public declarations }
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
    property NomorPO: string read FNomorPO write FNomorPO;
    property Modul: TModul read FModul write SetModul;
  end;

var
  frmDialogPOFromAssgros: TfrmDialogPOFromAssgros;
 
  iIDTipeHarga : Integer;

const
  _KolNo          : integer = 0;
  _KolKode        : Integer = 1;
  _KolAlias       : Integer = 2;
  _KolSatCode     : Integer = 3;
  _KolHarga       : Integer = 4;
  _KolDiscMember  : Integer = 5;
  _KolQTY         : Integer = 6;
  _KolTOtalHarga  : Integer = 7;
  _KolDiscGMC     : Integer = 8;
  _KolIsDesimal   : Integer = 9;
  _kolDiscPersen  : Integer = 10;
  _kolSellPrice   : integer = 11;
  _kolSellPriceD  : integer = 12;
  _kolSellPriceT  : Integer = 13;
  _kolPpn         : Integer = 14;
  _kolPpnBM       : Integer = 15;
  _kolOpenValue   : Integer = 16;
  _kolCogs        : Integer = 17;
  _kolLastCost    : Integer = 18;
  _ColCount       : Integer = 16;



  MaxIdGen        : Integer = 5;

implementation

uses 
//  uConn, uAssgros, ufrmSearchProduct, uProduct, DB,
  uGTSUICommonDlg, uConstanta, ufrmMain, StrUtils, uMemberShip, uNewBarang,
  uNewBarangHargaJual, uNewAssgros, uReferencesOfMember, ufrmPOFromAssgros,
  udmReportNew, uIntOp, IB, DB;

const
  COMBO_OPSI_TRADER_ASSGROS = 'ASSGROS';
  COMBO_OPSI_TRADER_ASLM_TRD = 'ASSALAAM DAN TRADER';
  COMBO_OPSI_TRADER_MEMBER = 'MEMBER';

  FileNmHeader : string = 'TempPOAssgrosHeader.txt';

{$R *.dfm}

function TfrmDialogPOFromAssgros.AdaPLUYangQTYnyaNol: Boolean;
var
  i: Integer;
begin
  Result := False;

  for i := strgGrid.FixedRows to strgGrid.RowCount - nn do
  begin
    if strgGrid.Cells[_KolQTY, i] = '0' then
    begin
      Result := True;
      CommonDlg.ShowMessage('Barang : ' + strgGrid.Cells[_KolAlias, i] + ' qty nya masih nol');
      Exit;
    end;
  end;

end;

procedure TfrmDialogPOFromAssgros.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogPOFromAssgros.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogPOFromAssgros := nil;
end;

procedure TfrmDialogPOFromAssgros.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogPOFromAssgros.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogPOFromAssgros.footerDialogMasterbtnSaveClick(
  Sender: TObject);
var
  FTrader : TNewAssgros;
  i       : integer;
  s       : string;
begin
  inherited;
  FTrader := TNewAssgros.Create(Self);
  for i := strgGrid.FixedRows to strgGrid.RowCount - nn do
  begin
    if strgGrid.Floats[_KolHarga, i] <= 0 then
      Exit
  end;

  if Trim(cbTraderCode.Text) = '' then
    exit;

  if strgGrid.EditMode = True then
    Exit;

  if not IsValidDateKarenaEOD(dialogUnit,dtTgl.Date,FMasterIsStore) then
    Exit;
    
  if (FFormMode = fmAdd) then
  begin
    if (edtplafon.Value < curredtTotalPO.Value) then
      begin
        CommonDlg.ShowMessage('Total PO melebihi Plafon');
        Exit;
      end;
  end
  else
  begin
     if (edtplafon.Value < (curredtTotalPO.Value-edttampung.Value)) then
      begin
        CommonDlg.ShowMessage('Total PO melebihi Plafon');
        Exit;
      end;
  end;

  try
    Self.Enabled := False;

    if Modul = mPOFromAssgros then
    begin
      if strgGrid.Cells[_KolKode, strgGrid.FixedRows] = '' then
      begin
        CommonDlg.ShowMessage('Inputkan detail PO terlebih dahulu');
        Exit;
      end;

//      if AdaPLUYangSama then Exit;
      if AdaPLUYangQTYnyaNol then Exit;


      // Simpan Data
      SavePOAssgros;

      // Update Plafon Trader
         if (FFormMode = fmAdd) then
             s := FTrader.GetSQLUpdatePlafon(TraderId,Traderuntid,curredtTotalPO.Value)
         else
             s := FTrader.GetSQLUpdatePlafon(TraderId,Traderuntid,curredtTotalPO.Value-edttampung.Value);

        if not cExecSQL(s, False, FTrader.GetHeaderFlag) then
           begin
              cRollbackTrans;
              Exit;
           end;




    end
    else if Modul = mPriceConf then
      PrintPriceConf;

  finally
    Self.Enabled := True;
  end;

end;

procedure TfrmDialogPOFromAssgros.FormShow(Sender: TObject);
begin
  inherited;
  FNomorPO    := '';
  FxIDGen     := 0;

  if strgGrid.FloatingFooter.Visible then
    nn := 2
  else
    nn := 1;

  dtTgl.Date := now;
  cbbTraderType.Clear;
  cbbTraderType.Items.Add(COMBO_OPSI_TRADER_ASSGROS);
  cbbTraderType.Items.Add(COMBO_OPSI_TRADER_ASLM_TRD);
  cbbTraderType.Items.Add(COMBO_OPSI_TRADER_MEMBER);

  FIsMember := false;
  if Modul = mPOFromAssgros then
  begin
    if (FFormMode = fmAdd) then
    begin
      PrepareFormAdd;
      cbbTraderType.ItemIndex := 0;
      cbbTraderTypeChange(Self);
      edtPONo.SetFocus;
    end
    else
      PrepareFormEdit;
  end
  else
  begin
    PrepareFormAdd;
    edtStatus.ReadOnly      := True;
    edtLeadTime.ReadOnly    := True;
    edtTOP.ReadOnly         := True;
    curredtTotalPO.ReadOnly := True;
    chkAppend.Visible       := False;

    frmSuiMasterDialog.Caption          := 'Price Confirmation';
    footerDialogMaster.btnSave.Caption  := 'Print';
    footerDialogMaster.lbl4.Caption     := 'Ctrl + P [Print]';
    footerDialogMaster.btnSave.Glyph    := img1.Picture.Bitmap;

    cbbTraderType.ItemIndex := 2;

    cbbTraderTypeChange(Self);
    cbbTraderType.SetFocus;
  end;
  strgGrid.FloatingFooter.Height := 1;

  iIDTipeHarga := cbTipeHarga.ItemIndex;

end;

procedure TfrmDialogPOFromAssgros.lblTambahClick(Sender: TObject);
begin
  strgGrid.AddRow;
end;

procedure TfrmDialogPOFromAssgros.ParseHeaderGrid;
begin
  with strgGrid do
  begin
    Clear;
    ColCount := _ColCount;
    RowCount := 2;

    Cells[_KolKode,0]       := 'PLU';
    Cells[_KolNo,0]         := 'NO';
    Cells[_KolAlias,0]      := 'PRODUCT NAME';
    Cells[_KolSatCode,0]    := 'UOM';
    Cells[_KolHarga,0]      := 'PRICE';
    Cells[_KolDiscMember,0] := 'DISC. MEMBER';
    Cells[_KolQTY,0]        := 'QTY';
    Cells[_KolTOtalHarga,0] := 'TOTAL PRICE';
    Cells[_KolDiscGMC,0]    := 'IS AMC';
    Cells[_KolIsDesimal,0]  := 'IS Descimal';
    Cells[_kolDiscPersen,0] := 'DISC %';
    Cells[_kolSellPrice,0]  := 'SELL PRICE';
    Cells[_kolSellPriceD,0] := 'SELL PRICE DISC';
    Cells[_kolSellPriceT,0] := 'SELL PRICE TOT';
    Cells[_kolPpn,0]        := 'PPN';
    Cells[_kolPpnBM,0]      := 'PPNBM';  

    FixedRows := 1;
    AutoSize  := true;
  end;
  HideCol;
end;

procedure TfrmDialogPOFromAssgros.dtTglKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = Chr(VK_RETURN)) then
    cbbTraderType.SetFocus;
end;

procedure TfrmDialogPOFromAssgros.edtTraderNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = Chr(VK_RETURN)) then
  begin
    edtKodeBarang.Text := '';
    edtKodeBarang.SetFocus;
  end;
end;

procedure TfrmDialogPOFromAssgros.PrepareFormAdd;
begin
  ClearForm;
  ParseDataTipeHarga;
  dtTgl.Date      := cGetServerTime;
  edtStatus.Text  := 'OPEN';
  edtPONo.Text    := GenerateNoPO(dtTgl.Date, FDialogUnitCOde, DialogUnit);
end;

procedure TfrmDialogPOFromAssgros.PrepareFormEdit;
var
  i           : Integer;
  FPOAssGross : TPO_ASSGROS;
begin
  try
    FPOAssGross := TPO_ASSGROS.Create(nil);

    ParseDataTipeHarga;

    if FPOAssGross.LoadByNo(edtPONo.Text, dialogUnit) then
    begin
      FNomorPO              := FPOAssGross.POAS_NO;
      dtTgl.Date            := FPOAssGross.POAS_DATE;
      edtStatus.Text        := FPOAssGross.POAS_STATUS;
      edtLeadTime.Text      := IntToStr(FPOAssGross.POAS_LEAD_TIME);
      edtTOP.Text           := IntToStr(FPOAssGross.POAS_TOP);
      curredtTotalPO.Value  := FPOAssGross.POAS_TOTAL;
      edttampung.Value      := FPOAssGross.POAS_TOTAL;
      TraderId              := FPOAssGross.Trader.ID;

      edtplafon.Value       := GetPlafonTrader(FPOAssGross.Trader.ID,FPOAssGross.POAS_TRD_UNT_ID);

      if FPOAssGross.Trader.Member.FTPMEMBER_ID <> 9 then // jk bukan member
        cbbTraderType.ItemIndex := 2
      else if FPOAssGross.Trader.IsAssgros = 1 then
        cbbTraderType.ItemIndex := 0
      else
        cbbTraderType.ItemIndex := 1;

      cbTraderCode.Text   := FPOAssGross.Trader.Kode;
      edtTraderName.Text  := FPOAssGross.Trader.Nama;
      FTipeMemberId       := FPOAssGross.Trader.Member.TPMEMBER.ID;

      if FTipeMemberId <> 9 then
      begin
        lblIsMember.Visible := True;
        lblIsMember.Caption := FPOAssGross.Trader.Member.TPMEMBER.NAME;
      end
      else
        lblIsMember.Visible := False;

      BrgTipeHarga := FPOAssGross.TPHRG_ID;

      cSetItemAtComboObject(cbTipeHarga, BrgTipeHarga);
      ParseHeaderGrid;

      with strgGrid do
      begin
        for i := 0 to FPOAssGross.PO_ASSGROS_DETILS.Count - 1 do
        begin
          AddRow;

          Cells[_KolKode,i+1]       := FPOAssGross.PO_ASSGROS_DETILS[i].POASD_BARANG.Kode;
          Cells[_KolAlias,i+1]      := FPOAssGross.PO_ASSGROS_DETILS[i].POASD_BARANG.Alias;
          Cells[_KolSatCode,i+1]    := FPOAssGross.PO_ASSGROS_DETILS[i].POASD_SAT_CODE;
          Cells[_KolHarga,i+1]      := FloatToStr(FPOAssGross.PO_ASSGROS_DETILS[i].POASD_SELL_PRICE_DISC);
          Cells[_KolDiscMember,i+1] := FloatToStr(FPOAssGross.PO_ASSGROS_DETILS[i].POASD_DISC_MEMBER);
          Cells[_KolQTY,i+1]        := FloatToStr(FPOAssGross.PO_ASSGROS_DETILS[i].POASD_QTY);
          Cells[_KolTOtalHarga,i+1] := FloatToStr(FPOAssGross.PO_ASSGROS_DETILS[i].POASD_TOTAL_PRICE);

          BrgIsDiscGMC  := FPOAssGross.PO_ASSGROS_DETILS[i].POASD_BARANG.IsDiscGMC;
          if cbbTraderType.ItemIndex = 2 then
          begin
            // jk termasuk crazy price, mk ga ad disc member
            if BrgTipeHarga <> 1 then
            begin
              if BrgIsDiscGMC = 1 then
              begin
                AddCheckBox(_KolDiscGMC, i+1, True, True);
                SetCheckBoxState(_KolDiscGMC, i+1, True);
              end
              else
              begin
                AddCheckBox(_KolDiscGMC, i+1, False, False);
                SetCheckBoxState(_KolDiscGMC, i+1, False);
              end;
            end
            else
            begin
              AddCheckBox(_KolDiscGMC, i+1, False, False);
              SetCheckBoxState(_KolDiscGMC, i+1, False);
            end;
          end
          else
          begin
            AddCheckBox(_KolDiscGMC, i+1, False, False);
            SetCheckBoxState(_KolDiscGMC, i+1, False);
          end;

          Cells[_kolDiscPersen, i+1]  := FloatToStr(FPOAssGross.PO_ASSGROS_DETILS[i].POASD_DISC);
          Cells[_kolSellPrice, i+1]   := FloatToStr(FPOAssGross.PO_ASSGROS_DETILS[i].POASD_SELL_PRICE);
          Cells[_kolPpn, i+1]         := FloatToStr(FPOAssGross.PO_ASSGROS_DETILS[i].POASD_PPN);
          Cells[_kolPpnBM, i+1]       := FloatToStr(FPOAssGross.PO_ASSGROS_DETILS[i].POASD_PPNBM);
//          Cells[_kolCogs, i+1]        := FloatToStr(FPOAssGross.PO_ASSGROS_DETILS[i].POASD_COGS);
//          Cells[_kolLastCost, i+1]    := FloatToStr(FPOAssGross.PO_ASSGROS_DETILS[i].POASD_LAST_COST);

          AutoSize := true;
//          strgGrid.FloatingFooter.ColumnCalc[_KolTOtalHarga] := acSUM;
//          curredtTotalPO.Value := strgGrid.Floats[_KolTOtalHarga,strgGrid.RowCount - 1];
          CurTotalPo;
        end;
        AutoSizeColumns(True, 5);
//        HapusBarisKosong(strgGrid,0);
      end;

    end;
    setNoUrut;
    HideCol;
  finally
    if FPOAssGross <> nil then FreeAndNil(FPOAssGross);
  end;

end;

procedure TfrmDialogPOFromAssgros.ClearForm;
begin

  ClearTraderNm;
  edtTraderType.Text    := '';
  edtStatus.Text        := '';
  edtLeadTime.Text      := '';
  edtTOP.Text           := '';
  curredtTotalPO.Value  := 0.00;
  edtKodeBarang.Text    := '';
  edtQty.Value          := 1;

  ParseHeaderGrid;
end;


procedure TfrmDialogPOFromAssgros.lblDeleteRowClick(Sender: TObject);
begin
  if strgGrid.RowCount >= 3 then
    strgGrid.RemoveRows(strgGrid.Row,1)
  else
    strgGrid.Rows[strgGrid.Row].Clear;

  SaveTempDataPOAssgros;
  CurTotalPo;
  SetNoUrut;
end;

procedure TfrmDialogPOFromAssgros.strgGridCanEditCell(Sender: TObject;
  ARow, ACol: Integer; var CanEdit: Boolean);
begin
  if (ACol = _KolQTY) then
    CanEdit := true
//  else if (ACol = _KolHarga) and (ARow = strgGrid.RowCount - nn) then
//    CanEdit := True
  else
    CanEdit := false;
end;

procedure TfrmDialogPOFromAssgros.strgGridCellValidate(Sender: TObject;
  ACol, ARow: Integer; var Value: String; var Valid: Boolean);
var
  iOut        : Integer;
  qty         : double;
  totalPrice  : Currency;

begin
  Application.ProcessMessages;
  if ACol in [_KolQTY, _KolHarga] then
  begin
    if (ACol=_KolQTY) then
    begin
//      if strgGrid.Cells[_KolQTY,ARow] = '' then strgGrid.Cells[_KolQTY,ARow] := '0';
      if trim(Value) = '' then Value := '0';

//      qty := (strgGrid.Floats[_KolQTY,ARow]);
      if TryStrToFloat(Value, qty) then
      begin

        if qty < 0 then
        begin
          CommonDlg.ShowError('Quantity must be greater or equal than zero!!');
          valid := false;
          exit;
        end;



        if (strgGrid.Ints[_KolIsDesimal, ARow] = 0)  and (qty > 0) then
        begin
          if not TryStrToInt(FloatToStr(qty), iOut) then
          begin

            qty   := Floor(qty);
            if qty = 0 then
            begin
              qty   := 1;
            end;
            Value := FloatToStr(qty);

          end;
        end;

        totalPrice := qty * strgGrid.Floats[_KolHarga,ARow];
        strgGrid.Cells[_KolTOtalHarga,ARow] := CurrToStr(totalPrice);

        Value := FloatToStr(qty);
        strgGrid.Cells[_KolQTY,ARow] := Value;

      end
      else
      begin
        Valid := False;
        exit;
      end;


    end;

//    with TNewBarang.Create(Self) do
//    begin
//      try
//        if LoadByKode(strgGrid.Cells[_KolKode, ARow], dialogUnit) then
//        begin
//          FCogs           := GetHargaAVG(strgGrid.Cells[_KolUOM, ARow]);
//          GetLastPurchasePrice(FLastCost, FUomLastPurchase);
//          strgGrid.Cells[_kolCogs, ARow]      := CurrToStr(FCogs);
//          strgGrid.Cells[_kolLastCost, ARow]  := CurrToStr(FLastCost);
//        end
//      finally
//        Free;
//
//      end;
//    end;
//    else if ACol = _KolHarga then
//    begin
//      //barang kontrabon harga 0
//      strgGrid.Cells[_KolTOtalHarga, ARow]  := FloatToStr(strgGrid.Floats[_KolHarga, ARow]
//                                                * strgGrid.Floats[_KolQTY, ARow]);
//      strgGrid.Cells[_kolSellPrice, ARow]:= strgGrid.Cells[_KolHarga, ARow];
//    end;

    IsiDiscMember;

//    AutoSize := true;
//    strgGrid.FloatingFooter.ColumnCalc[_KolTOtalHarga] := acSUM;
//    curredtTotalPO.Value := strgGrid.Floats[_KolTOtalHarga,strgGrid.RowCount - 1];
    CurTotalPo;

    edtKodeBarang.SelectAll;
    SaveTempDataPOAssgros;
    HideCol;
  end;
  strgGrid.Refresh;

end;

procedure TfrmDialogPOFromAssgros.SavePOAssgros;
var
  FPOAssgros    : TPO_Assgros;
  i             : integer;
//  PONo          : string;
  DTot          : Double;
  DTotDiscMbr   : Double;
  dTotSub       : Double;
begin
  try
    FPOAssgros := TPO_ASSGROS.Create(nil);

    dTot        := 0;
    DTotDiscMbr := 0;
    dTotSub     := 0;
    for i := strgGrid.FixedRows to strgGrid.RowCount - nn do
    begin
      dTot        := dTot + strgGrid.Floats[_KolTOtalHarga, i];
      DTotDiscMbr := DTotDiscMbr + strgGrid.Floats[_KolDiscMember, i];
      dTotSub     := dTotSub + ((strgGrid.Floats[_KolHarga, i] - strgGrid.Floats[_KolDiscMember, i])
                                  * strgGrid.Floats[_KolQTY, i]);
    end;


    with FPOAssgros do
    begin
      if not chkAppend.Checked then
      begin
        UpdateData(dtTgl.Date,
                   dtTgl.Date,
                   '',
                   0, //disc perse total
                   DTotDiscMbr,
                   StrToInt(edtLeadTime.Text),
                   edtPONo.Text,
                   0, //ppn total
                   0,//ppnbm total
                   edtStatus.Text, //status
                   dTotSub,
                   StrToInt(edtTOP.Text),
                   DTot,
                   TraderId,
                   dialogUnit,
                   dialogUnit,
                   0, //valid date
                   BrgTipeHarga,
                   dialogUnit);

        PO_ASSGROS_DETILS.Clear;

        for i := strgGrid.FixedRows to strgGrid.RowCount - nn do
        begin
          if (strgGrid.Cells[_KolKode,i] = '') then
            Continue;

          with TNewBarang.Create(Self) do
          begin
            try
              if LoadByKode(strgGrid.Cells[_KolKode, i]) then
              begin
                FCogs           := GetHargaAVG(strgGrid.Cells[_KolUOM, i]);
                GetLastPurchasePrice(FLastCost, FUomLastPurchase);
                strgGrid.Cells[_kolCogs, i]      := CurrToStr(FCogs);
                strgGrid.Cells[_kolLastCost, i]  := CurrToStr(FLastCost);
              end
            finally
              Free;

            end;
          end;

          UpdatePO_ASSGROS_DETILS(Trim(strgGrid.Cells[_KolKode,i]),
                                  dialogUnit,
                                  strgGrid.Floats[_kolCogs, i],  //cogs
                                  (strgGrid.Floats[_kolDiscPersen,i]), //APOASD_DISC
                                  (strgGrid.Floats[_KolDiscMember,i]),
                                  0,
                                  strgGrid.Floats[_kolLastCost,i], //last cost
                                  edtPONo.Text,
                                  dialogUnit,
                                  (strgGrid.Floats[_kolPpn,i]),  //ppn
                                  (strgGrid.Floats[_kolPpnBM,i]),  //ppnbm
                                  (strgGrid.Floats[_KolQTY,i]),
                                  Trim(strgGrid.Cells[_KolSatCode,i]),
                                  dialogUnit,
                                  (strgGrid.Floats[_kolSellPrice,i]),  //sell price
                                  (strgGrid.Floats[_KolHarga,i]), //sell price disk
                                  '',
                                  dialogUnit,
                                  (strgGrid.Floats[_KolTOtalHarga,i]),
                                  dialogUnit);

        end;
      end;

      try
        Inc(FxIDGen);
        SaveToDB(FNomorPO);
        cCommitTrans;
        FIsProcessSuccessfull := True;
        FNomorPO  := edtPONo.Text;
      except
        on E: EIBError do
        begin
          cRollbackTrans;

          if e.IBErrorCode = 335544665 then
          begin

            if FxIDGen > MaxIdGen then
            begin
              CommonDlg.ShowError(e.Message);
              FIsProcessSuccessfull := False;
              exit;
            end;
            edtPONo.Text := GenerateNoPO(dtTgl.Date, FDialogUnitCOde, DialogUnit);
            SavePOAssgros;
          end
          else
            CommonDlg.ShowError(e.Message);

        end;
      end;
    end;

  finally
    if FIsProcessSuccessfull then Close;
    if FPOAssgros <> nil then FreeAndNil(FPOAssgros);
  end;



end;

//procedure TfrmDialogPOFromAssgros.edtPONoKeyUp(Sender: TObject;
//  var Key: Word; Shift: TShiftState);
//var
//  data: TResultDataSet;
//begin
//  if (Key = VK_ESCAPE) then
//  begin
//    close;
//  end;
//
//  if (key = VK_RETURN) then
//  begin
//    if not chkAppend.Checked then
//    begin
//      dtTgl.SetFocus;
//      Exit
//    end;
//
//    edtPONo.Text := StrPadLeft(Trim(edtPONo.Text), 10, '0');
//    if not Assigned(PurchasingOrder) then
//      PurchasingOrder := TPurchasingOrder.Create;
//
//    data := PurchasingOrder.GetPOAssgrosByNoPO(edtPONo.Text);
//
//    if data.IsEmpty then
//    begin
//      CommonDlg.ShowError('PO Number Not Found');
//      edtPONo.SelectAll;
//      Exit;
//    end;
//
//    cbTipeHarga.SetFocus;
//
//    dtTgl.Date := data.FieldByName('POAS_DATE').AsDateTime;
//    if data.FieldByName('MEMBER_TPMEMBER_ID').AsInteger <> 9 then // jk bukan member
//      cbbTraderType.ItemIndex := 2
//    else if data.FieldByName('TRD_IS_ASSGROS').AsInteger = 1 then
//      cbbTraderType.ItemIndex := 0
//    else
//      cbbTraderType.ItemIndex := 1;
//
//    cbTraderCode.Text := data.FieldByName('TRD_CODE').AsString;
//    edtTraderName.Text := data.FieldByName('TRD_NAME').AsString;
//    edtStatus.Text := data.FieldByName('POAS_STATUS').AsString;
//    edtLeadTime.Text := data.FieldByName('POAS_LEAD_TIME').AsString;
//    edtTOP.Text := data.FieldByName('POAS_TOP').AsString;
//    curredtTotalPO.Value := data.FieldByName('POAS_TOTAL').AsCurrency;
//
//  end;
//end;

procedure TfrmDialogPOFromAssgros.dtTglKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
  begin
    edtPONo.SetFocus;
  end;
end;

procedure TfrmDialogPOFromAssgros.ParseDataTipeHarga;
var
  s: string;
begin

  s := 'Select TPHRG_ID, TPHRG_NAME From REF$TIPE_HARGA Order By TPHRG_NAME';
  cQueryToComboObject(cbTipeHarga, s);
  cbTipeHarga.ItemIndex := -1;
  cbTipeHarga.ItemIndex := 0;

end;

function TfrmDialogPOFromAssgros.ExplodeBarcode;
var
  strQty, strKode: string;
  iPos, i: Integer;
begin
  iPos := Pos('*', edtKodeBarang.Text);
  strQty := '';
  strKode := '';

  if iPos = 0 then
  begin
    strKode := edtKodeBarang.Text;
    edtKodeBarang.Text := '1*' + strKode;
    edtQty.Value := 1;

  end
  else if iPos = 1 then
  begin
    edtKodeBarang.Text := '1' + edtKodeBarang.Text;
    for i:=iPos+2 to Length(edtKodeBarang.Text) do
      strKode := strKode + edtKodeBarang.Text[i];
    edtQty.Value := 1;
  end
  else
  begin
    for i:=1 to iPos - 1 do
      strQty := strQty + edtKodeBarang.Text[i];
    for i:=iPos+1 to Length(edtKodeBarang.Text) do
      strKode := strKode + edtKodeBarang.Text[i];
    edtQty.Value := StrToFloat(strQty);
  end;
  if strKode = '' then
  Exit;
  Result := strKode;
end;

procedure TfrmDialogPOFromAssgros.cbbTraderTypeChange(Sender: TObject);
begin
  inherited;
  ClearTraderNm;
  lblIsMember.Visible := False;
  FTipeMemberId       := 0;
  TraderId            := 0;
  edtLeadTime.Text    := IntToStr(0);
  edtTOP.Text         := IntToStr(0);

  if cbbTraderType.ItemIndex = 2 then
    FIsMember := True
  else
    FIsMember := false;

 ParseHeaderGrid;


end;

procedure TfrmDialogPOFromAssgros.cbbTraderTypeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_DOWN then
    if (cbbTraderType.ItemIndex = -1) or (Trim(cbbTraderType.Text) = '') then
      cbbTraderType.ItemIndex := 0;

end;

procedure TfrmDialogPOFromAssgros.strgGridGetFloatFormat(Sender: TObject;
  ACol, ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;      
  FloatFormat := '%.3n';
  if (ACol in [_KolQTY]) and (ARow > 0) then
    IsFloat := True
  else
  if (ACol in [_KolHarga, _KolTOtalHarga, _KolDiscMember]) and (ARow > 0) then
  begin
    FloatFormat := '%.2n';
    IsFloat := True;
  end
  else
    IsFloat := False;

//  FloatFormat := '%.3n';
//  if (ACol in [_KolHarga, _KolTOtalHarga, _KolDiscMember]) then
//    IsFloat := True
//  else
//    IsFloat := False;
end;

procedure TfrmDialogPOFromAssgros.chkAppendClick(Sender: TObject);
begin
  inherited;
  if chkAppend.Checked then
  begin
    edtPONo.ReadOnly := False;
    dtTgl.ReadOnly := True;
    cbbTraderType.Enabled := false;
    cbTraderCode.Enabled := False;
    edtTraderName.ReadOnly := True;
    edtStatus.ReadOnly := True;
    edtLeadTime.ReadOnly := true;
    edtTOP.ReadOnly := True;
    curredtTotalPO.ReadOnly := True;
  end
  else
  begin
    edtPONo.ReadOnly := True;
    dtTgl.ReadOnly := False;
    cbbTraderType.Enabled := True;
    cbTraderCode.Enabled := True;
    edtTraderName.ReadOnly := False;
    edtStatus.ReadOnly := False;
    edtLeadTime.ReadOnly := False;
    edtTOP.ReadOnly := False;
    curredtTotalPO.ReadOnly := False;
  end;
end;

procedure TfrmDialogPOFromAssgros.SetModul(const Value: TModul);
begin
  FModul := Value;
end;

procedure TfrmDialogPOFromAssgros.PrintPriceConf;
begin
  ShowPriceConfirmation(GetTickCount);
end;


function TfrmDialogPOFromAssgros.GenerateNoPO(aDate : TDateTime; aUnitCode :
    String; aUnitID : integer): string;
var
  iUrutan: Integer;
  s: string;
begin
  Result := '';

  s := 'Select POAS_NO from PO_ASSGROS Where POAS_NO Like ' + Quot(aUnitCode + '%')
     + ' and POAS_UNT_ID = ' + IntToStr(aUnitID)
     + ' And POAS_DATE Between ' + QuotD(StartOfTheMonth(aDate))
     + ' And ' + QuotD(EndOfTheMonth(aDate))
     + ' Order By POAS_NO Desc Rows 1';
  with copenquery(s) do
  begin
    Try
      iUrutan := 0;
      if not Eof then
      begin
        if not Fields[0].IsNull then
          iUrutan := StrToInt(RightStr(Fields[0].AsString, 4));
      end;
      Inc(iUrutan);

      Result := aUnitCode + '/' + FormatDateTime('YYYYMM', aDate) + '/' + StrPadLeft(IntToStr(iUrutan),4,'0');
    Finally
      Free;
    End
  end;
end;

procedure TfrmDialogPOFromAssgros.cbTipeHargaChange(Sender: TObject);
var
  iIDTipeHargaNew: Integer;
begin
  inherited;
  iIDTipeHargaNew := cbTipeHarga.ItemIndex;
  if iIDTipeHarga <> iIDTipeHargaNew then
    begin
      if (CommonDlg.Confirm('Grid akan dikosongkan.') = mrYES) then
        begin
          ClearTraderNm;
          ParseHeaderGrid;

          BrgTipeHarga          := 0;
          curredtTotalPO.Value  := 0;

          if cbTipeHarga.Text <> '' then
            BrgTipeHarga := cGetIDfromCombo(cbTipeHarga, cbTipeHarga.ItemIndex);
          iIDTipeHarga := cbTipeHarga.ItemIndex;
        end
      else
        cbTipeHarga.ItemIndex := iIDTipeHarga;
    end;

end;

procedure TfrmDialogPOFromAssgros.cbTipeHargaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
  begin
    if (Trim(cbTipeHarga.Text) <> '') then
    begin
      BrgTipeHarga := cGetIDfromCombo(cbTipeHarga, cbTipeHarga.ItemIndex);
      edtKodeBarang.SetFocus;
      edtKodeBarang.SelectAll;
    end;
  end;
end;

procedure TfrmDialogPOFromAssgros.strgGridGetAlignment(Sender: TObject;
  ARow, ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  inherited;   

  HAlign := taLeftJustify;
  if (ARow < strgGrid.FixedRows) or (ACol = _KolDiscGMC) then 
  begin
    HAlign := taCenter;
  end
  else
  begin
    if ACol in [_KolQTY, _KolHarga, _KolTOtalHarga, _KolDiscMember] then
    begin
      HAlign := taRightJustify;
    end;
  end;

end;

procedure TfrmDialogPOFromAssgros.strgGridGetEditorType(Sender: TObject;
  ACol, ARow: Integer; var AEditor: TEditorType);
begin
  inherited;
  if ACol = _KolQTY then
  begin
    if strgGrid.Cells[_KolIsDesimal, ARow] = '1' then
      AEditor := edFloat
    else
      AEditor := edNumeric;
  end;

end;

procedure TfrmDialogPOFromAssgros.cbTraderCodeButtonClick(Sender: TObject);
var
  FTrader: TNewAssgros;
  sKriteria: string;
  s: string;
begin
  inherited;

  if cbbTraderType.ItemIndex = 0 then
    sKriteria := ' and c.TPMEMBER_ID = 9 And a.TRD_IS_ASSGROS = 1'
  else if cbbTraderType.ItemIndex = 1 then
    sKriteria := ' and c.TPMEMBER_ID = 9 And a.TRD_IS_ASSGROS = 0'
  else
    sKriteria := ' and a.TRD_MEMBER_ID IS NULL OR c.TPMEMBER_ID <> 9';

  s := 'SELECT a.TRD_CODE, a.TRD_NAME, c.TPMEMBER_NAME, a.TRD_SISA_PLAFON'
     + ' FROM TRADER a'
     + ' LEFT JOIN MEMBER b ON b.MEMBER_ID = a.TRD_MEMBER_ID'
     + ' AND b.MEMBER_UNT_ID = a.TRD_MEMBER_UNT_ID'
     + ' LEFT JOIN REF$TIPE_MEMBER c ON c.TPMEMBER_ID = b.MEMBER_TPMEMBER_ID'
     + ' WHERE a.TRD_MEMBER_UNT_ID = ' + IntToStr(DialogUnit)
     + sKriteria;
  with clookup('Daftar Trader/Member', s) do
  begin
    Try
      if Strings[0] = '' then Exit;
      cbTraderCode.Text := Strings[0];

      FTrader := TNewAssgros.Create(Self);
      lblIsMember.Visible := false;
      if FTrader.LoadByKode(cbTraderCode.Text, dialogUnit) then
      begin
        if cbbTraderType.ItemIndex = 2 then // Jika member
        begin
          lblIsMember.Caption := Strings[2];
          lblIsMember.Visible := True;
          FTipeMemberId := FTrader.Member.TPMEMBER.ID;
        end
        else
          FTipeMemberId := 9;

        TraderId := FTrader.ID;
        Traderuntid:=FTrader.unitID;
        edtTraderName.Text := FTrader.Nama;
        edtLeadTime.Text := IntToStr(FTrader.LeadTime);
        edtTOP.Text := IntToStr(FTrader.TOP);
        edtplafon.Value:= FTrader.SisaPlafon;
        if (FTrader.IsAssgros = 1) then
          edtTraderType.Text := 'ASSGROS'
        else
          edtTraderType.Text := 'TRADER';

        cbTipeHarga.SetFocus;
      end;

    Finally
      Free;
    End;
  end;

end;

procedure TfrmDialogPOFromAssgros.cbTraderCodeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = VK_DOWN) or (Key = vk_F5) then
    cbTraderCodeButtonClick(Self)
  else if Key = vk_return then
    edtKodeBarang.SetFocus;
end;

procedure TfrmDialogPOFromAssgros.SaveTempDataPOAssgros;
var
  SS  : TStrings;
begin
  SS := TStringList.Create;
  try
    strgGrid.SaveToCSV(cGetAppPath + 'TempPOAssgros.csv');
    SS.Append(cbTipeHarga.Text);
    SS.SaveToFile(cGetAppPath + FileNmHeader);
  finally
    SS.Free;
  end;

end;

procedure TfrmDialogPOFromAssgros.btnLoadCSVClick(Sender: TObject);
var
  i     : Integer;
  SS    : TStrings;
  stmp  : string;
begin
  inherited;
  ss  := TStringList.Create;
  try
    stmp  := cbTipeHarga.Text;
    SS.LoadFromFile(cGetAppPath + FileNmHeader);
    for i := 0 to cbTipeHarga.Items.Count - 1 do
    begin
      if LowerCase(trim(cbTipeHarga.Items.Strings[i])) = LowerCase(trim(SS.Strings[0])) then
      begin

        if LowerCase(Trim(stmp)) <> LowerCase(trim(SS.Strings[0])) then
        begin
          CommonDlg.ShowMessage('Tipe harga pada file data tidak sama!!');
        end;

        cbTipeHarga.ItemIndex := i;
        Break;
      end;
    end;

    ParseHeaderGrid;
    strgGrid.LoadFromCSV(cGetAppPath + 'TempPOAssgros.csv');
    for i := strgGrid.RowCount - nn downto strgGrid.FixedRows do
    begin
      strgGrid.AddCheckBox(_KolDiscGMC, i,True, True);
      if strgGrid.Cells[_KolDiscGMC,i] = 'N' then
        strgGrid.SetCheckBoxState(_KolDiscGMC,i, False)
      else
        strgGrid.SetCheckBoxState(_KolDiscGMC,i, True);

      if Trim(strgGrid.Cells[_KolKode,i]) = '' then
      begin
        strgGrid.Row := i;
        strgGrid.Rows[i].Clear;
        if strgGrid.RowCount > 1 then
          strgGrid.RemoveSelectedRows;
      end;
    end;

  finally
    SS.Free;
  end;

  strgGrid.Rows[strgGrid.RowCount - 1].Clear;
//  strgGrid.FloatingFooter.ColumnCalc[_KolTOtalHarga] := acSUM;
  CurTotalPo;
  HideCol;
  iIDTipeHarga := cbTipeHarga.ItemIndex;

end;

procedure TfrmDialogPOFromAssgros.IsiDiscMember;
var
  s                 : string;
  aBeginDisc        : Double;
  aEndDisc          : Double;
  aDiscMember       : Double;
  dNilaiDiscMember  : Double;
  dSubTotal         : Double;
  dTotal            : Double;
  i                 : Integer;
  dMaxDisc          : Double;
  isBreak           : Boolean;
  isGmc             : Boolean;
begin
  dTotal := 0;
  for i := strgGrid.FixedRows to strgGrid.RowCount - nn do
  begin
    strgGrid.GetCheckBoxState(_KolDiscGMC, i, isGmc);

    if isGmc then
      dTotal := dTotal + (StrToFloat(strgGrid.Cells[_KolHarga, i]) * StrToFloat(strgGrid.Cells[_KolQTY, i]));
  end;


  s := 'Select DISCMEMBER_BEGIN_VALUE, DISCMEMBER_END_VALUE, DISCMEMBER_DISCOUNT'
   + ' FROM REF$DISC_MEMBER'
   + ' WHERE DISCMEMBER_TPMEMBER_ID = ' + IntToStr(FTipeMemberId)
   + ' AND DISCMEMBER_TPMEMBER_UNTID = ' + IntToStr(dialogUnit)
   + ' order by DISCMEMBER_BEGIN_VALUE';

  with cOpenQuery(s) do
  begin
    try
      while not Eof do
      begin
        aBeginDisc := FieldByName('DISCMEMBER_BEGIN_VALUE').AsFloat;
        aEndDisc := FieldByName('DISCMEMBER_END_VALUE').AsFloat;
        aDiscMember := FieldByName('DISCMEMBER_DISCOUNT').AsFloat;


        for i := strgGrid.FixedRows to strgGrid.RowCount - nn do
        begin
          strgGrid.Cells[_KolDiscMember, i] := '0';
        end;

        if ((dTotal >= aBeginDisc) and (dTotal <= aEndDisc)) or (dTotal > aEndDisc)  then
        begin

          dMaxDisc  := 0;
          isBreak   := False;
          for i := strgGrid.FixedRows to strgGrid.RowCount - nn do
          begin
            strgGrid.GetCheckBoxState(_KolDiscGMC, i, isGmc);

            if isGmc then
            begin
              dNilaiDiscMember := StrToFloat(strgGrid.Cells[_kolHarga, i]) *
                                  strgGrid.Ints[_KolQTY, i] * aDiscMember / 100;

              if (dMaxDisc + dNilaiDiscMember) > (aDiscMember * aEndDisc /100) then
              begin
                dNilaiDiscMember := (aDiscMember * aEndDisc /100) - dMaxDisc;

                isBreak := True;
              end;
              dSubTotal :=  StrToFloat(strgGrid.Cells[_kolHarga, i]) *
                            strgGrid.Ints[_KolQTY, i] - dNilaiDiscMember;
              strgGrid.Cells[_KolDiscMember, i] := FloatToStr(dNilaiDiscMember);

              strgGrid.Cells[_KolTOtalHarga, i] := FloatToStr(dSubTotal);

              dMaxDisc  := dMaxDisc + dNilaiDiscMember;

              if isBreak then
                Break;

            end;
          end;
        end;

        Next;
      end;

    finally
      Free;
    end;

  end;

end;

procedure TfrmDialogPOFromAssgros.cbTraderCodeClickBtn(Sender: TObject);
var
  FTrader: TNewAssgros;
  sKriteria: string;
  s: string;
begin
  inherited;

  if cbbTraderType.ItemIndex = 0 then
    sKriteria := ' WHERE c.TPMEMBER_ID = 9 And a.TRD_IS_ASSGROS = 1'
    //sKriteria := ' WHERE a.TRD_IS_ASSGROS = 1'
  else if cbbTraderType.ItemIndex = 1 then
    sKriteria := ' WHERE c.TPMEMBER_ID = 8 And a.TRD_IS_ASSGROS = 0'
    //sKriteria := ' WHERE a.TRD_IS_ASSGROS = 0'
  else
    sKriteria := ' WHERE (a.TRD_MEMBER_ID IS NULL OR c.TPMEMBER_ID not in (8,9))';

  s := 'SELECT a.TRD_CODE, a.TRD_NAME, c.TPMEMBER_NAME'
     + ' FROM TRADER a'
     + ' LEFT JOIN MEMBER b ON b.MEMBER_ID = a.TRD_MEMBER_ID'
     + ' AND b.MEMBER_UNT_ID = a.TRD_MEMBER_UNT_ID'
     + ' LEFT JOIN REF$TIPE_MEMBER c ON c.TPMEMBER_ID = b.MEMBER_TPMEMBER_ID'
     + sKriteria
     + ' and a.TRD_MEMBER_UNT_ID = ' + IntToStr(DialogUnit)
     + ' and b.MEMBER_IS_ACTIVE = 1'
     + ' and b.MEMBER_IS_VALID = 1';

  with clookup('Daftar Trader/Member', s) do
  begin
    Try
      if Strings[0] = '' then Exit;
      cbTraderCode.Text := Strings[0];

      FTrader             := TNewAssgros.Create(Self);
      lblIsMember.Visible := false;
      if FTrader.LoadByKode(cbTraderCode.Text, dialogUnit) then
      begin
        if cbbTraderType.ItemIndex = 2 then // Jika member
        begin
          lblIsMember.Caption := Strings[2];
          lblIsMember.Visible := True;
          FTipeMemberId       := FTrader.Member.TPMEMBER.ID;
        end
        else
          FTipeMemberId := 9;

        TraderId            := FTrader.ID;
        Traderuntid         := FTrader.unitID;
        edtTraderName.Text  := FTrader.Nama;
        edtLeadTime.Text    := IntToStr(FTrader.LeadTime);
        edtTOP.Text         := IntToStr(FTrader.TOP);
        edtplafon.Value:= FTrader.SisaPlafon;
        if (FTrader.IsAssgros = 1) then
          edtTraderType.Text := 'ASSGROS'
        else
          edtTraderType.Text := 'TRADER';

        cbTipeHarga.SetFocus;
      end;

    Finally
      Free;
    End;
  end;

end;

function TfrmDialogPOFromAssgros.GetDataVariable: Boolean;
var
  sSqL: string;
begin
  BrgTipeHarga := cGetIDfromCombo(cbTipeHarga, cbTipeHarga.ItemIndex);
  Result  := True;
    try

      with TNewBarang.Create(Self) do
      begin
        try
          if LoadByKode(BrgCode) then
          begin
            BrgUnitID         := dialogUnit;
            BrgAlias          := Alias;
            BrgTipeBarang     := TipeBarangID;
            BrgName           := Nama;
            BrgIsDiscGMC      := IsDiscGMC;
            FIsDecimal        := IsDecimal;
            FCogs             := GetHargaAVG(cbbUom.Text);
            edtBarang.Text    := BrgCode + ' | ' + BrgName;

            GetLastPurchasePrice(FLastCost, FUomLastPurchase);

            if  (BrgTipeHarga =2) or (BrgTipeHarga =1) then
            begin
              sSqL := 'SELECT BHJ_SELL_PRICE, BHJ_DISC_PERSEN,'
                    + ' BHJ_DISC_NOMINAL, BHJ_SELL_PRICE_DISC '
                    + ' FROM BARANG_HARGA_JUAL'
                    + ' WHERE BHJ_BRG_CODE = '+ Quot(BrgCode)
                    + ' AND BHJ_TPHRG_ID = '+ IntToStr(BrgTipeHarga)
                    + ' AND BHJ_SAT_CODE = '+ Quot(cbbuom.text)
                    + ' ORDER BY DATE_CREATE';
              with cOpenQuery(sSqL) do
              begin
                try
                  if not Eof then
                  begin
                    BrgHarga          := fieldByName('BHJ_SELL_PRICE').AsCurrency;
                    DiscPersen        := fieldByName('BHJ_DISC_PERSEN').AsCurrency;
                    DiscNominal       := fieldByName('BHJ_DISC_NOMINAL').AsCurrency;
                    BrgHargaAfterDisc := fieldByName('BHJ_SELL_PRICE_DISC').AsCurrency;
                  end
                  else
                  begin
                    BrgHargaAfterDisc := 0;
                  end;
                finally
                  Free;
                end;
              end;

            end
            else
            begin


              sSqL := 'SELECT KONVSAT_SCALE FROM REF$KONVERSI_SATUAN'
                    + ' WHERE KONVSAT_BRG_CODE = '+ Quot(BrgCode)
                    + ' AND KONVSAT_SAT_CODE_FROM = '+ Quot(cbbuom.text);
              with cOpenQuery(sSqL) do
              begin
                try
                  if not Eof then
                  begin
                    Fscale := fieldByName('KONVSAT_SCALE').AsFloat;
                  end
                  else
                  begin
                    Fscale := 1;
                  end;
                finally
                  Free;
                end;
              end;

              sSqL := 'SELECT TPHRG_MARKUP FROM REF$TIPE_HARGA'
                    + ' WHERE TPHRG_ID = '+ IntToStr(BrgTipeHarga);
              with cOpenQuery(sSqL) do
              begin
                try
                  if not Eof then
                  begin
                    FMarkup := fieldByName('TPHRG_MARKUP').AsFloat;
                  end
                  else
                  begin
                    FMarkup := 0;
                  end;
                finally
                  Free;
                end;
              end;
                BrgHargaAfterDisc := ((HargaLastCost-HargaNilaiRafaksi)*Fscale) + ((HargaLastCost-HargaNilaiRafaksi)*Fscale*fmarkup/100);
            end;

            if BrgHargaAfterDisc = 0 then
            begin
//                  strgGridCanEditCell(Self, strgGrid.RowCount - nn, _KolHarga, canEdit);
              BrgHarga    := 0;
              DiscPersen  := 0;
              DiscNominal := 0;
              Result      := False;
            end;

          end
          else
          begin
            CommonDlg.ShowError('Data tidak ditemukan!!');
            Result  := False;
          end;
        finally
          Free;
        end;
      end;
    finally
      SaveTempDataPOAssgros;
    end;
end;

procedure TfrmDialogPOFromAssgros.SetUomJual;
var
  S     : string;
  sKode : string;
begin

  if cGetIDfromCombo(cbTipeHarga, cbTipeHarga.ItemIndex) = 2 then
  begin
    sKode := ExplodeBarcode;
    if Length(sKode) > igProd_Code_Length then
        s := 'SELECT c.KONVSAT_BRG_CODE, c.KONVSAT_SAT_CODE_FROM'
          + ' FROM REF$KONVERSI_SATUAN c, BARANG_HARGA_JUAL a, barang b'
          + ' where c.KONVSAT_BRG_CODE = a.BHJ_BRG_CODE'
          + ' and c.KONVSAT_SAT_CODE_FROM = a.BHJ_SAT_CODE'
          + ' and b.BRG_CODE = a.BHJ_BRG_CODE'
          + ' and b.BRG_IS_ACTIVE = 1'
          + ' and a.BHJ_TPHRG_ID = '+ IntToStr(cGetIDfromCombo(cbTipeHarga, cbTipeHarga.ItemIndex))
          + ' and c.KONVSAT_BARCODE = '+ Quot(sKode)

    else
    begin
      if Length(sKode) < igProd_Code_Length then
      begin
        sKode := uIntOpLead('0', igProd_Code_Length, StrToInt(sKode));
      end;

      s  := 'select a.BHJ_BRG_CODE as Kode, c.BRG_ALIAS as Nama,'
            + ' a.BHJ_SAT_CODE "UOM JUAL", c.BRG_SAT_CODE_STOCK as "UOM STOCK",'
            + ' a.BHJ_SELL_PRICE as "HARGA",'
            + ' a.BHJ_DISC_PERSEN AS "DISCOUNT %", a.BHJ_DISC_NOMINAL AS "DISCOUNT",'
            + ' a.BHJ_SELL_PRICE_DISC'
            + ' from BARANG_HARGA_JUAL a , REF$TIPE_HARGA b, barang c'
            + ' where a.BHJ_TPHRG_ID=b.TPHRG_ID'
            + ' AND (c.BRG_CODE = a.BHJ_BRG_CODE )'
            + ' and a.BHJ_TPHRG_ID = ' + IntToStr(cGetIDfromCombo(cbTipeHarga, cbTipeHarga.ItemIndex))
            + ' and a.BHJ_BRG_CODE = '+ Quot(sKode)
            + ' AND c.BRG_IS_ACTIVE = 1'
            + ' and a.BHJ_UNT_ID = '+ IntToStr(dialogUnit);
    end;
  end
  else
  begin
    sKode := ExplodeBarcode;
    if Length(sKode) > igProd_Code_Length then
        s := 'SELECT c.KONVSAT_BRG_CODE, c.KONVSAT_SAT_CODE_FROM'
          + ' FROM REF$KONVERSI_SATUAN c, barang b'
          + ' where c.KONVSAT_BRG_CODE = b.BRG_CODE'
          + ' and b.BRG_IS_ACTIVE = 1'
          + ' and c.KONVSAT_BARCODE = '+ Quot(sKode)
    else
    begin
      if Length(sKode) < igProd_Code_Length then
      begin
        sKode := uIntOpLead('0', igProd_Code_Length, StrToInt(sKode));
      end;

      s := 'SELECT c.KONVSAT_BRG_CODE, c.KONVSAT_SAT_CODE_FROM'
          + ' FROM REF$KONVERSI_SATUAN c, barang b'
          + ' where c.KONVSAT_BRG_CODE = b.BRG_CODE'
          + ' and b.BRG_IS_ACTIVE = 1'
          + ' and c.KONVSAT_BRG_CODE  = '+ Quot(sKode)
    end;
  end;
  with cOpenQuery(s) do
  begin
    try
      cbbUom.Clear;
      while not Eof do
      begin
        BrgCode  := Fields[0].AsString; //uom berbeda, kode barang tetap =
        cbbUom.Items.Add(Fields[2].AsString);
        Next;
      end;

      if cbbUom.Items.Count > 0 then
        cbbUom.ItemIndex  := 0;

    finally
      Free;
    end;
  end;
end;

procedure TfrmDialogPOFromAssgros.CurTotalPo;
begin
  
  curredtTotalPO.Value := strgGrid.ColumnSum(_KolTOtalHarga,
                          strgGrid.FixedRows, strgGrid.RowCount - nn);
end;

procedure TfrmDialogPOFromAssgros.ShowPriceConfirmation(aID : Integer);
var
  SS: TStrings;
  i: Integer;
  sSQL: string;
begin
  SS := TStringList.Create;
  try
    Self.Enabled := False;
    for i := 1 to strgGrid.RowCount - 1 do
    begin
      if Trim(strgGrid.Cells[_KolKode,i]) = '' then
        Continue;

      sSQL := 'Insert Into TEMP_LAPORAN (LAPORAN_ID,user_id,char1,char2,char3,'
              + ' char4,char5,char6,num1,num2,num3,num4) values('
              + IntToStr(aID) + ','
              + IntToStr(aID) + ','
              + Quot(cbTraderCode.Text) + ','
              + Quot(edtTraderName.Text) + ','
              + Quot(cbTipeHarga.Text) + ','
              + Quot(strgGrid.Cells[_KolKode,i]) + ','
              + Quot(strgGrid.Cells[_KolAlias,i]) + ','
              + Quot(strgGrid.Cells[_KolSatCode,i]) + ','

              + FormatFloat('0.00',strgGrid.Floats[_KolHarga,i]) + ','
              + FormatFloat('0.00',strgGrid.Floats[_KolDiscMember,i]) + ','
              + FormatFloat('0.00',strgGrid.Floats[_KolQTY,i]) + ','
              + FormatFloat('0.00',strgGrid.Floats[_KolTOtalHarga,i]) + ');';
      SS.Add(sSQL);
    end;

    if kExecuteSQLsNoBlob(SS) then
    begin
       sSQL := ' select ' + GetCompanyHeader(FLoginUsername, FDialogUnitName,cGetServerTime,cGetServerTime)
               + 'char1 as KodeTrader, char2 as NamaTrader, char3 as TipeHarga, char4 as KodeBrg,'
               + ' char5 as NamaBarang, char6 as Satuan, num1 as Harga, num2 as Diskon, num3 as Qty,num4 as Total'
               + ' from TEMP_LAPORAN'
               + ' where LAPORAN_ID = ' + IntToStr(aID)
               + ' and user_ID = ' + IntToStr(aID);

       dmReportNew.EksekusiReport('PriceConfirmation',sSQL,'',True);
    end
    else
      cRollbackTrans;
  finally
    cRollbackTrans;
    SS.Free;
    Self.Enabled := True;
  end;

end;

procedure TfrmDialogPOFromAssgros.cbTraderCodeChange(Sender: TObject);
begin
  inherited;
  ParseHeaderGrid;
end;

procedure TfrmDialogPOFromAssgros.ClearTraderNm;
begin
  cbTraderCode.Clear;
  edtTraderName.Clear;
end;

procedure TfrmDialogPOFromAssgros.HideCol;
begin
  strgGrid.ColWidths[_KolIsDesimal]   := 0;
  strgGrid.ColWidths[_kolDiscPersen]  := 0;
  strgGrid.ColWidths[_kolSellPrice]   := 0;
  strgGrid.ColWidths[_kolSellPriceD]  := 0;
  strgGrid.ColWidths[_kolSellPriceT]  := 0;
  strgGrid.ColWidths[_kolPpn]         := 0;
  strgGrid.ColWidths[_kolPpnBM]       := 0;

end;

procedure TfrmDialogPOFromAssgros.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
//  if(Key = Ord('R')) and (ssctrl in Shift) and (strgGrid.Focused) then
//    lblDeleteRowClick(Self)
//  else if (Key = Ord('P'))and(ssctrl in Shift) and (Modul = mPriceConf) then
//    PrintPriceConf
//  else if(Key = VK_RETURN) and (ssctrl in Shift) then
//    footerDialogMasterbtnSaveClick(Self)
//  else if Key = vk_escape then
//    footerDialogMasterbtnCloseClick(self)
//  else if ((Key = VK_RETURN) and (not (ssctrl in Shift))) or
//          (Key  in [VK_UP , VK_F5, VK_DOWN, VK_NEXT]) then
//    LookUpData(ActiveControl, Key);

end;

  procedure TfrmDialogPOFromAssgros.LookUpData(Sender:TObject; Key: Word);
begin
  if Sender = edtKodeBarang then
  begin
    KodeBarang(Key);
  end
  else if (Sender = cbbUom) and (Key = VK_RETURN)  then
  begin
    Uom;
  end
  else if (Sender = edtQty) and (Key = VK_RETURN) then
  begin
    Qty;
  end
  else if (Sender = edtHarga) and (Key = VK_RETURN) then
  begin
    harga;
  end
  else if (Sender = strgGrid ) and (Key = VK_NEXT) then
  begin
    edtKodeBarang.SetFocus;
  end;

end;

function TfrmDialogPOFromAssgros.SetDataGrid: Boolean;
var
  sSQl        : string;
  dQTY        : Double;
  isExist     : Boolean;
  totalPrice  : Currency;
  cPPn        : Currency;
  cPPnBM      : Currency;
  iRow        : integer;
  iOut        : integer;
begin
  Result  := False;
    if (FIsDecimal = 0)  and (edtQty.Value > 0) then
    begin
      if not TryStrToInt(edtQty.Text, iOut) then
      begin

        edtQty.Value := Floor(edtQty.Value);

        if edtQty.Value = 0 then
          edtQty.Value := 1;

      end;
    end;

    if (edtQty.Value < 0) then
      Exit;
  if (cGetIDfromCombo(cbTipeHarga, cbTipeHarga.ItemIndex) = 2) or (cGetIDfromCombo(cbTipeHarga, cbTipeHarga.ItemIndex) = 1) then
    sSQl := 'SELECT BHJ.BHJ_ID, BHJ.BHJ_SELL_PRICE, BHJ.BHJ_SELL_PRICE_DISC, '
          + ' BHJ.BHJ_DISC_PERSEN, BHJ.BHJ_SAT_CODE, BHJ.BHJ_TPHRG_ID, '
          + ' RP.PJK_PPN, RP.PJK_PPNBM '
          + ' FROM BARANG_HARGA_JUAL BHJ '
          + ' INNER JOIN BARANG B '
          + ' ON B.BRG_CODE = BHJ.BHJ_BRG_CODE '
          + ' INNER JOIN REF$PAJAK RP '
          + ' ON RP.PJK_ID = B.BRG_PJK_ID '
          + ' WHERE (BHJ.BHJ_BRG_CODE = ' + Quot(BrgCode) + ')'
          + ' AND (BHJ_TPHRG_ID = '+ IntToStr(BrgTipeHarga) + ')'
//          + ' AND (BHJ_CONV_VALUE<=:PQTY) '
          + ' AND BHJ_SAT_CODE = '+ Quot(cbbUom.Text)
          + ' ORDER BY BHJ_CONV_VALUE DESC '
  else
    sSQl := 'SELECT B.BRG_CODE, B.BRG_LASTCOST,(B.BRG_LASTCOST-B.BRG_NILAI_RAFAKSI) HRG_DISC, '
          + ' B.BRG_NILAI_RAFAKSI, B.BRG_SAT_CODE_STOCK,'
          + ' RP.PJK_PPN, RP.PJK_PPNBM '
          + ' FROM BARANG B'
          + ' INNER JOIN REF$PAJAK RP '
          + ' ON RP.PJK_ID = B.BRG_PJK_ID '
          + ' WHERE (B.BRG_CODE = ' + Quot(BrgCode) + ')'
          + ' ORDER BY BRG_CODE DESC ';



    with cOpenQuery(sSQl) do
    begin
      if (RecordCount > 0) then
      begin
          isExist := False;
          //jika plu yang dimasukan sudah terdaftar pada grid maka tambahkan qty
          //dan barang tidak open value (harga barang = 0)
          for iRow := strgGrid.FixedRows to strgGrid.RowCount - nn do
          begin
            if (Trim(strgGrid.Cells[_kolkode, iRow]) = BrgCode) and
               (Trim(strgGrid.Cells[_KolSatCode, iRow]) = Trim(cbbUom.Text)) and
               (BrgHarga <> 0)  then
            begin
              isExist := True;
              Break;
            end;
          end;

          if isExist then
            strgGrid.Row := iRow
          else
          begin
            strgGrid.AddRow;
            First;
            for iRow := strgGrid.FixedRows to strgGrid.RowCount - nn do
              if Trim(strgGrid.Cells[_kolkode, iRow]) = '' then
                Break;
            strgGrid.Row := iRow;
          end;

          with strgGrid do
          begin
            if cbbTraderType.ItemIndex = 2 then // Jika member, disc = true
            begin
              // jk termasuk crazy price, mk ga ad disc member
              if BrgTipeHarga <> 1 then
                if BrgIsDiscGMC = 1 then
                begin
                  AddCheckBox(_KolDiscGMC, Row, True, True);
                  SetCheckBoxState(_KolDiscGMC, Row, True);
                end
                else
                begin
                  AddCheckBox(_KolDiscGMC, Row, False, False);
                  SetCheckBoxState(_KolDiscGMC, Row, False);
                end
              else
              begin
                AddCheckBox(_KolDiscGMC, Row, False, False);
                SetCheckBoxState(_KolDiscGMC, Row, False);
              end
            end
            else
            begin
              AddCheckBox(_KolDiscGMC, Row, False, False);
              SetCheckBoxState(_KolDiscGMC, Row, False);
            end;

            Cells[_KolKode,Row]   := BrgCode;
            Cells[_KolAlias,Row]  := BrgAlias;
            Cells[_KolSatCode,Row]:= cbbUom.Text;
            Cells[_KolHarga,Row]  := FloatToStr(BrgHargaAfterDisc);

            Cells[_KolDiscMember, Row] := '0';

            TryStrToFloat(Cells[_KolQTY,Row], dQTY);
            dQTY                := dQTY + edtQty.Value;
            Cells[_KolQTY,Row]  := FloatToStr(dQTY);

            totalPrice := dQTY * BrgHargaAfterDisc ;
            Cells[_KolTOtalHarga,Row] := CurrToStr(totalPrice);

            Cells[_KolIsDesimal, Row] := IntToStr(FIsDecimal);

            if (BrgTipeHarga = 2) or (BrgTipeHarga = 1) then
            begin
                Cells[_kolDiscPersen,Row]  := CurrToStr(FieldByName('BHJ_DISC_PERSEN').AsCurrency);
                Cells[_kolSellPrice,Row]  := CurrToStr(FieldByName('BHJ_SELL_PRICE').AsCurrency);
                Cells[_kolSellPriceD,Row] := CurrToStr(FieldByName('BHJ_SELL_PRICE_DISC').AsCurrency);
            end
            else
            begin
                Cells[_kolDiscPersen,Row]  := FloatToStr(0);
                Cells[_kolSellPrice,Row]  := FloatToStr(BrgHargaAfterDisc);
                Cells[_kolSellPriceD,Row] := FloatToStr(BrgHargaAfterDisc);
            end;
            Cells[_kolSellPriceT,Row] := CurrToStr(totalPrice);

            cPPn                      := FieldByName('PJK_PPN').AsCurrency;
            Cells[_kolPpn, Row]       := CurrToStr(cPPn);
            cPPnBM                    := FieldByName('PJK_PPNBM').AsCurrency;
            Cells[_kolPpnBM, Row]     := CurrToStr(cPPnBM);
//            Cells[_kolCogs, Row]      := CurrToStr(FCogs);
//            Cells[_kolLastCost, Row]  := CurrToStr(FLastCost);

            if BrgHarga = 0 then
            begin
              BrgHarga  := BrgHargaAfterDisc;
              strgGrid.Cells[_kolSellPrice, Row]:= strgGrid.Cells[_KolHarga, Row];
            end;

//            if BrgHarga = 0 then
//              Cells[_kolOpenValue, Row] := '1'
//            else
//              Cells[_kolOpenValue, Row] := '1';


            AutoSizeColumns(True, 5);
//            strgGrid.FloatingFooter.ColumnCalc[_KolTOtalHarga] := acSUM;
//            curredtTotalPO.Value := strgGrid.Floats[_KolTOtalHarga,strgGrid.RowCount - 1];
            CurTotalPo;

            Row       := Row + 1;
            Col       := 0;
            AutoSize  := True;
          end;

        IsiDiscMember;
//        strgGrid.FloatingFooter.ColumnCalc[_KolTOtalHarga] := acSUM;
//        curredtTotalPO.Value := strgGrid.Floats[_KolTOtalHarga,strgGrid.RowCount - 1];
        CurTotalPo;

        edtKodeBarang.Clear;
        cbbUom.Clear;
        edtQty.Value := 1;

        edtKodeBarang.SetFocus;

      end
      else
      begin
        CommonDlg.ShowMessage('Harga ' + BrgCode + ' | ' + BrgName
                              + ' Untuk Tipe Harga ' + cbTipeHarga.Text
                              + ' belum di set');
        Exit;
      end;
    end;

      SetNoUrut;
      SaveTempDataPOAssgros;
      edtKodeBarang.SetFocus ;
      HideCol;
  Result  := True;
end;

procedure TfrmDialogPOFromAssgros.SetHarga(aVisible: Boolean);
begin
  lblQty.Visible    := aVisible;
  lblHarga.Visible  := aVisible;
  edtQty.Visible    := aVisible;
  edtHarga.Visible  := aVisible;
  edtBarang.Visible := aVisible;
end;



procedure TfrmDialogPOFromAssgros.Harga;
begin
  if edtHarga.Value <= 0  then
    exit;

  BrgHargaAfterDisc := edtHarga.Value;
  if SetDataGrid then
  begin
    SetHarga(False);
    edtHarga.Clear;
    edtBarang.Clear;
  end;

end;

procedure TfrmDialogPOFromAssgros.KodeBarang(Key: Word);
var
  s: string;
begin
    if (Key = VK_UP) then
    begin
      strgGrid.Col := _KolQTY;
      strgGrid.Row := strgGrid.RowCount - 1;
      strgGrid.SetFocus;
    end
    else if (Key = VK_RETURN) then
    begin
      if Trim(cbTraderCode.Text) = '' then
      begin
        CommonDlg.ShowError('Trader harus diisi!');
        cbTraderCode.SetFocus;
        Exit;
      end;  
      if Trim(edtKodeBarang.Text) = '' then
        Exit;

      SetHarga(False);
      SetUomJual;
      if cbbUom.Items.Count = 0 then

//        CommonDlg.ShowError('Data selling price tipe '+ cbpTipeHarga.Text + ' tidak ada!')
        CommonDlg.ShowError('Gagal Input Data!'+#13
                          + 'PLU status nya non aktive atau tidak memiliki selling price' )
      else
      if cbbUom.Items.Count > 1 then
        cbbUom.SetFocus
      else
      if cbbUom.Items.Count = 1 then
        Qty;
//        edtQtyKeyDown(Self, Key, Shift);

    end
    else if (Key = VK_F5) or (Key = VK_DOWN) then
    begin
      s := 'Select BRG_CODE as KODE, BRG_NAME as NAMA, BRG_MERK as MERK,'
          + ' BRG_ALIAS as ALIAS, BRG_CATALOG as KATALOG'
          + ' From BARANG '
          + ' WHERE BRG_IS_ACTIVE = 1';
  
      BrgCode  := '';
      with clookup('Daftar PLU', s) do
      begin
        Try
          if Strings[0] = '' then
            Exit;
  
  //        aStrTmp   := Trim(edtKodeBarang.Text);
  //        aLength   := Length(aStrTmp);
  //
  //        if (Length(aStrTmp) <> 0) and (aStrTmp[aLength] = '*') then
  //          edtKodeBarang.Text := edtKodeBarang.Text + Strings[0]
  //        else
            edtKodeBarang.Text := '1*' + Strings[0];
  
          SetUomJual;
        Finally
          Free;
        End;
      end;
    end;
end;

procedure TfrmDialogPOFromAssgros.Qty;
begin
  if lblHarga.Visible then
  begin
    edtHarga.SetFocus;
    exit;
  end;

  if not GetDataVariable then
  begin
    SetHarga(True);
    edtQty.SetFocus;
    Exit;
  end;
  SetDataGrid;

end;

procedure TfrmDialogPOFromAssgros.Uom;
begin
    edtKodeBarang.SetFocus;
    qty;
end;

procedure TfrmDialogPOFromAssgros.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if(Key = Ord('R')) and (ssctrl in Shift) and (strgGrid.Focused) then
    lblDeleteRowClick(Self);
  if (Key = Ord('P'))and(ssctrl in Shift) and (Modul = mPriceConf) then
    PrintPriceConf;
  if(Key = VK_RETURN) and (ssctrl in Shift) then
  begin
    if strgGrid.EditMode then
    strgGrid.EditMode := False;
    footerDialogMasterbtnSaveClick(Self);
  end;
  if Key = vk_escape then
    footerDialogMasterbtnCloseClick(self);
  if ((Key = VK_RETURN) and (not (ssctrl in Shift))) or
          (Key  in [VK_UP , VK_F5, VK_DOWN, VK_NEXT]) then
    LookUpData(ActiveControl, Key);
end;

procedure TfrmDialogPOFromAssgros.SetNoUrut;
var
  j: Integer;
  i: Integer;
begin
  j := 1;
  for i := strgGrid.FixedRows to strgGrid.RowCount - strgGrid.FixedFooters do
  begin
    strgGrid.Cells[_KolNo, i] := IntToStr(j);
    Inc(j);
  end;  
end;

procedure TfrmDialogPOFromAssgros.edtHargaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not(Key in['0'..'9', FormatSettings.DecimalSeparator, Chr(VK_BACK)]) then
    Key:=#0;
end;

function TfrmDialogPOFromAssgros.GetPlafonTrader(aid : Integer; aUnitID :
    Integer): Double;
var
  s: string;
begin
  Result := 0;

  s := 'Select TRD_SISA_PLAFON FROM TRADER Where'
     + ' TRD_ID = '+IntToStr(aid)
     + ' AND TRD_UNT_ID = '+IntToStr(aUnitID);
  with copenquery(s) do
  begin
    Try
      if not Eof then
      begin
        if not Fields[0].IsNull then
          Result:= Fields[0].AsFloat;
      end;
    Finally
      Free;
    End
  end;
end;


procedure TfrmDialogPOFromAssgros.strgGridKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) And (strgGrid.Col = _KolQTY) and (not strgGrid.EditMode) then
  begin
//    strgGrid.EditMode := False;
    edtKodeBarang.SetFocus;
  end;
end;

end.



