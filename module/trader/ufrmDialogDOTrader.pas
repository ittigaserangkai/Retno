unit ufrmDialogDOAsgross;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, JvEdit, Grids, BaseGrid, AdvGrid,
  JvLabel, cbxbase, dblup1a, StdCtrls, Mask, JvToolEdit,
  ufraFooterDialog2Button, ExtCtrls, SUIForm, DB, Jclstrings, uRMSUnit,
  uPOAssgrosNew, AdvObj, JvExStdCtrls, JvValidateEdit, JvExMask, AdvUtil,
  AdvCombo, ColCombo, System.Actions, Vcl.ActnList, ufraFooterDialog3Button;

type
  TFormMode = (fmAddDOAssgros, fmDetilDO, fmRealisasi, fmEditRealisasi, fmDetil, fmDetilRealisasi);

  TfrmDialogDOAsGross = class(TfrmMasterDialog)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl7: TLabel;
    lbl4: TLabel;
    dtTgl: TJvDateEdit;
    edtTraderName: TEdit;
    edtDONo: TEdit;
    edtDesc: TEdit;
    cbpTraderCode: TColumnComboBox;
    pnl2: TPanel;
    strgGrid: TAdvStringGrid;
    edtStatus: TEdit;
    dtReceipt: TJvDateEdit;
    lbldtReceipt: TLabel;
    Label1: TLabel;
    edtTipeMember: TEdit;
    Panel1: TPanel;
    pnl3: TPanel;
    lbl5: TLabel;
    edtDiskonMemberPersen: TEdit;
    lbl6: TLabel;
    curredtTotalDO: TJvValidateEdit;
    edtSubTotal: TJvValidateEdit;
    edtNominalKenaDiskon: TJvValidateEdit;
    edtDiskonMemberRp: TJvValidateEdit;
    Label2: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl8: TLabel;
    edtMaxDiskon: TJvValidateEdit;
    Label3: TLabel;
    edtLeadTime: TEdit;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblTambahClick(Sender: TObject);
    procedure lblDeleteRowClick(Sender: TObject);
    procedure strgGridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure strgGridCellValidate(Sender: TObject; ACol, ARow: Integer;
      var Value: String; var Valid: Boolean);
    procedure cbpTraderCodeChange(Sender: TObject);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure strgGridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure strgGridKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    FIsProcessSuccessfull : boolean;
    FFormMode: TFormMode;
    FIsBerhasilSimpan: Boolean;
    FNoPOReferenced: String;
    //FDONo,
    FTraderCode: string;
    FTradeId,
    FTradeUnitId : Integer;
    //FTraderTOP : Integer;
    FNoDOReferenced: String;
    //FListDOAsgrossDetilID: array of integer;

    //crTotalPPn: Currency;                 // Sum of PPn
    ///crTotalPPnBM: Currency;               // Sum of PPnBM
    //crTotalDiscMember: Currency;
    //crTotalDiscHarga: Currency;
    //crSubTotal: Currency;                 // price * qty before tax & disc
    //crTotal: Currency;                    // sum of price after execution
    //sho: Integer;

    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    { Private declarations }
    function SaveDOAssgros: Boolean;
    procedure PrepareFormAddDoAssGros;
    procedure PrepareFormEditRealisasiDO;
    procedure ParseHeaderGrid;
    procedure ClearForm;
    {procedure LoadDataBarangDanHarga(aBaris : Integer; aBrgCode : String; aBrgAlias
        : String; aBrgUOM : String; aBrgPrice : Double; aDisc : Double; aPPNPersen
        : Double; aPPNRp : Double);
    }
    procedure LoadDataHeaderPOKring(aNoDO : String; aTgl : TDateTime; aStatus :
        String; aTraderCode : String; aTraderName : String; aTotal  : Double;
        aLeadTime: integer);
    procedure LoadDataHeaderDOAssgross(aNoBUkti : String ; aTglBukti : TDateTime;
        aTglReal : TDateTime; aKodeTrader : String; aNamaTrader : String;
        aTipemember : String; aDescription : String; aStatus : String; aLeadTime:
        integer);
    procedure SetPPNDanDiscMemberFromPrevTrans(aKodeBarang : String; aKodeSatuan :
        String; aPOAssgros : TPO_ASSGROS; var aPPN : Double; var aDiscMember :
        Double; var aQty : Double);

  public
    procedure AturLebarKolom;
    function checkQtyCtrlEnter: Boolean;
    procedure DIstribusiDiscMember(aDiscountPersen : Double);
    function GetNominalKenaDiskon: Double;
    procedure IsiDataNominalDOKring;
    procedure IsiKringDetail(aBaris : Integer; aBrgCode : String; aBrgAlias :
        String; aBrgUOM : String; aBrgPrice : Double; aDisc : Double; aDiscMember :
        Double;  aPPNPersen : Double; aPPNRupiah : Double; aQty : Double; aQtyDO :
        Double;  aIsAMC : Integer; aDiscMemberReal : Double; aIsDecimal : Integer;
        aHargaAverage: double; aLastCost: Double);
    procedure PrepareRealisasiDO;
    { Public declarations }
    procedure SetAllComponentReadOnly;
    procedure SetHargaAverage;
    procedure ShowDetailDo(aFM : TFormMode);
    property IsBerhasilSimpan: Boolean read FIsBerhasilSimpan write
        FIsBerhasilSimpan;
    //property NoDO: String read FDONo write FDONo;
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
    property NoPOReferenced: String read FNoPOReferenced write FNoPOReferenced;
    property NoDOReferenced: String read FNoDOReferenced write FNoDOReferenced;
  end;

var
  frmDialogDOAsGross: TfrmDialogDOAsGross;

const
  _KolKode           : Integer = 1;
  _KolNama           : Integer = 2;
  _KolUOM            : Integer = 3;
  _KolPrice          : Integer = 4;
  _KolDisc           : Integer = 5;
  _KolPriceMinusDisc : Integer = 6;
  _kolQty            : Integer = 7;
  _KolDiscMember     : Integer = 8;
  _KolQtyDo          : Integer = 9;
  _KolDiscMemberReal : Integer = 10;
  _KolPPN            : Integer = 11;
  _KolPPNRP          : Integer = 12;
  _KolTotal          : Integer = 13;
  _KolIsAMC          : Integer = 14;
  _KolIsDecmal       : Integer = 15;
  _kolHargaAverage   : Integer = 16;
  _kolLastCost       : Integer = 17;
  _KolAVG            : Integer = 23;


implementation

uses uGTSUICommonDlg, uConn, uSearchPO, uConstanta,
  ufrmDOForAsGross, uProduct,  uDOAssgros,
  uNewBarang, uNewAssgros;

const
  STATUS_PO_CLOSE       = 'CLOSE';
  STATUS_DO_DELIVERED   = 'DELIVERED';
  STATUS_DO_RECEIPT     = 'RECEIPT';
  STATUS_DO_INVOICING   = 'INVOICING';

{$R *.dfm}

procedure TfrmDialogDOAsGross.AturLebarKolom;
begin
  with strgGrid do
  begin
    AutoSizeColumns(True,5);
    ColWidths[_KolPrice]          := 100;
    ColWidths[_KolPriceMinusDisc] := 100;
    ColWidths[_KolDisc]           := 100;
    ColWidths[_KolDiscMember]     := 100;
    ColWidths[_KolTotal]          := 100;

    //
    ColWidths[_KolPPN]            := 0;
    ColWidths[_KolPPNRP]          := 0;
    ColWidths[_KolIsDecmal]       := 0;
    //ColWidths[_KolDiscMember]     := 0;
    //ColWidths[_KolDiscMemberReal] := 0;
    ColWidths[_KolPriceMinusDisc] := 0;

  end;
end;

procedure TfrmDialogDOAsGross.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogDOAsGross.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogDOAsGross := nil;
end;

procedure TfrmDialogDOAsGross.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogDOAsGross.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogDOAsGross.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;

  edtDONo.SetFocus;
  if checkQtyCtrlEnter then
    exit;

  if FormMode in [fmAddDOAssgros] then
  begin
    if not IsValidDateKarenaEOD(dialogunit,dtTgl.Date,FMasterIsStore) then
      Exit;
  end else begin

  end;    

  try
    Self.Enabled := False;
    cShowWaitWindow('Simpan Data Delivery Order');

    DIstribusiDiscMember(StrToFloat(edtDiskonMemberPersen.Text));
    if (SaveDOAssgros) then
    begin
      cCommitTrans;

      cCloseWaitWindow;
      IsBerhasilSimpan := True;
      Close;
    end else
    begin
      cRollbackTrans;
      CommonDlg.ShowError('Gagal Menyimpan Data');
    end;
  finally
    Self.Enabled := True;
    cRollbackTrans;
    cCloseWaitWindow;
    frmDoForAsGross.btnShowClick(nil);
    
  end;

end;

procedure TfrmDialogDOAsGross.FormShow(Sender: TObject);
begin
  inherited;
  IsBerhasilSimpan  := False;
  dtTgl.Date        := cGetServerTime;
  dtReceipt.Date    := cGetServerTime;
  
  ParseHeaderGrid;
  if (FFormMode = fmAddDOAssgros) then
  begin
    PrepareFormAddDoAssGros;

  end else if (FFormMode in [fmDetilRealisasi, fmDetilDO]) then
  begin
    ShowDetailDo(FFormMode);
    SetAllComponentReadOnly;

    footerDialogMaster.lbl4.Visible    := False;
    footerDialogMaster.btnSave.Visible := False;
  end else if (FFormMode = fmRealisasi) then
  begin
    PrepareRealisasiDO;
  end else begin // edit DO Realisaisi
    PrepareFormEditRealisasiDO;
  end;  

  AturLebarKolom;
end;

function TfrmDialogDOAsGross.SaveDOAssgros: Boolean;
var
  dHargaAverage: Double;
  sDONo: string;
  dDiscMemberReal: Double;
  dPPNBM: Double;
  //dSellPriceDisc: Double;
  dSellPrice: Double;
  dPPN: Double;
  dLastCost: Double;
  dDiscMember: Double;
  dDisc: Double;
  sUOM: string;
  sKodeBrg: string;
  i: Integer;
  dQtyReceipt: Double;
  dQtyDO: Double;
  iStatusDO: Integer;
  FDOAssGros : TDO_ASSGROS;
  //i : Integer;
  dTglReceipt : TDateTime;
begin
  Result := False;
  FDOAssGros := TDO_ASSGROS.Create(nil);
  try
    iStatusDO := 0;
    dTglReceipt  := 0;
    if FormMode = fmDetilRealisasi then
    begin
      iStatusDO := 1;
//      SetHargaAverage;
      dTglReceipt := dtReceipt.Date;
    end;

    if FormMode = fmRealisasi then
    begin
      iStatusDO := 1;
//      SetHargaAverage;
      dTglReceipt := dtReceipt.Date;
    end;
    if FormMode = fmEditRealisasi then
    begin
      iStatusDO := 1;
//      SetHargaAverage;
      dTglReceipt := dtReceipt.Date;
    end;


    with FDOAssGros do
    begin
      sDONo := NoDOReferenced;
      if NoDOReferenced = '' then
        sDONo := TDO_ASSGROS.GetNextNo(DialogUnit);
        
      UpdateData(0,
                 dialogunit,
                 0,
                 0,
                 0,
                 dialogunit,
                 dtTgl.Date,
                 dTglReceipt,
                 edtDesc.Text,
                 sDONo,
//                 edtDONo.Text,
                 '',
                 '',
                 '',
                 '',
                 FNoPOReferenced,
                 dialogunit,
                 edtStatus.Text,
                 FTradeId,
                 FTradeUnitId,
                 dialogunit,
                 STATUS_PO_CLOSE,
                 iStatusDO);

      DO_ASSGROS_DETILS.Clear;
      for i := 1 to strgGrid.RowCount - 1 do
      begin
        if edtStatus.Text = STATUS_DO_DELIVERED then
        begin
          dQtyDO          := strgGrid.Floats[_KolQtyDo, i];
          dQtyReceipt     := 0;
          dDiscMember     := strgGrid.Floats[_KolDiscMemberReal, i];
          dDiscMemberReal := 0;
        end else begin
          dQtyDO          := strgGrid.Floats[_kolQty, i];
          dQtyReceipt     := strgGrid.Floats[_KolQtyDo, i];     
          dDiscMember     := strgGrid.Floats[_KolDiscMember, i];
          dDiscMemberReal := strgGrid.Floats[_KolDiscMemberReal,i];
        end;
        
        sKodeBrg        := strgGrid.Cells[_KolKode, i];
        sUOM            := strgGrid.Cells[_KolUOM, i];
        dDisc           := strgGrid.Floats[_KolDisc, i];

//        dLastCost       := 0;
        dSellPrice      := strgGrid.Floats[_KolPrice,i];
        //dSellPriceDisc  := dSellPrice - dDisc;
        dPPN            := strgGrid.Floats[_KolPPN,i];
        dPPNBM          := 0; // pasti 0
        dHargaAverage   := strgGrid.Floats[_kolHargaAverage, i];
        dLastCost       := strgGrid.Floats[_kolLastCost, i];

        cShowWaitWindow('Insert Data ' + sKodeBrg);
        UpdateDO_ASSGROS_DETILS(sKodeBrg,
                                //GetHargaAVG(sKodeBrg,sUOM,dialogunit ),
                                dHargaAverage,
                                dDisc,
                                dDiscMember,
                                dDiscMemberReal,
                                edtDONo.Text,
                                dialogunit,
                                0,
                                dLastCost,
                                dPPN,
                                dPPNBM,
                                dQtyDO,
                                dQtyReceipt,
                                sUOM,
                                dSellPrice,
                                dialogunit);
      end;       

      if SaveToDB(NoDOReferenced) then
      begin
        Result := True;
      end;
    end;

  finally
    cCloseWaitWindow;
    FreeAndNil(FDOAssGros);
  end;
end;

procedure TfrmDialogDOAsGross.PrepareFormAddDoAssGros;
var
  iBaris: Integer;
  dDiscMember: Double;
  FPOAssgros: TPO_ASSGROS;
  //lastGenId : integer;
  i: Integer;
  //cSellPriceDisc: Currency;
begin
  ClearForm;
  try
    FPOAssgros := TPO_ASSGROS.Create(nil);

    if FPOAssgros.LoadByNo(NoPOReferenced, dialogunit) then
    begin
      LoadDataHeaderPOKring(TDO_ASSGROS.GetNextNo(DialogUnit), cGetServerTime, STATUS_DO_DELIVERED,
                          FPOAssgros.Trader.Kode, FPOAssgros.Trader.Nama,
                          FPOAssgros.POAS_TOTAL, FPOAssgros.Trader.LeadTime);
      //FNoPOReferenced := FPOAssgros.POAS_NO;
      FTradeId        := FPOAssgros.POAS_TRD_ID;
      FTradeUnitId    := FPOAssgros.POAS_TRD_UNT_ID;

      iBaris := 0;
      for i := 0 to FPOAssgros.PO_ASSGROS_DETILS.Count - 1 do
      begin
        cShowWaitWindow('Set Diskon Member ' + FPOAssgros.PO_ASSGROS_DETILS[i].POASD_BARANG.Kode);
        dDiscMember := 0;
        if FPOAssgros.PO_ASSGROS_DETILS[i].POASD_QTY <> 0 then
          dDiscMember := FPOAssgros.PO_ASSGROS_DETILS[i].POASD_DISC_MEMBER / FPOAssgros.PO_ASSGROS_DETILS[i].POASD_QTY; // tyt disc member dalam PO Detil itu sdh dikalikan Qty

        Inc(iBaris);
        IsiKringDetail(
          iBaris,
          FPOAssgros.PO_ASSGROS_DETILS[i].POASD_BARANG.Kode,
          FPOAssgros.PO_ASSGROS_DETILS[i].POASD_BARANG.Alias,
          FPOAssgros.PO_ASSGROS_DETILS[i].POASD_SAT_CODE,
          FPOAssgros.PO_ASSGROS_DETILS[i].POASD_SELL_PRICE,
          FPOAssgros.PO_ASSGROS_DETILS[i].POASD_SELL_PRICE * FPOAssgros.PO_ASSGROS_DETILS[i].POASD_DISC / 100 ,
          dDiscMember,
          FPOAssgros.PO_ASSGROS_DETILS[i].POASD_PPN,
          0,
          FPOAssgros.PO_ASSGROS_DETILS[i].POASD_QTY,
          FPOAssgros.PO_ASSGROS_DETILS[i].POASD_QTY,
          FPOAssgros.PO_ASSGROS_DETILS[i].POASD_BARANG.IsDiscGMC,
          dDiscMember,
          FPOAssgros.PO_ASSGROS_DETILS[i].POASD_BARANG.IsDecimal,
          FPOAssgros.PO_ASSGROS_DETILS[i].POASD_COGS,
          FPOAssgros.PO_ASSGROS_DETILS[i].POASD_LAST_COST);

        if i < FPOAssgros.PO_ASSGROS_DETILS.Count - 1 then
          strgGrid.AddRow;
      end;
    end;

    edtDesc.SetFocus;
    edtDesc.ReadOnly := False;
  finally
    cCloseWaitWindow;
    FreeAndNil(FPOAssgros);
  end;

  IsiDataNominalDOKring;
  strgGrid.AutoSizeColumns(True,8);
end;

procedure TfrmDialogDOAsGross.PrepareFormEditRealisasiDO;
begin
  ShowDetailDo(FFormMode);
  edtDesc.SetFocus;
  edtDesc.ReadOnly := False;
end;

procedure TfrmDialogDOAsGross.ParseHeaderGrid;
begin
  with strgGrid do
  begin
    ColCount                    := 16;
    Cells[0, 0]                 := 'NO';
    Cells[_KolKode, 0]          := 'PLU';
    Cells[_KolNama, 0]          := 'PRODUCT NAME';
    Cells[_KolUOM, 0]           := 'UOM';
    Cells[_KolPrice, 0]         := 'PRICE';
    Cells[_KolPriceMinusDisc, 0]:= 'PRICE-DISC';

    if FormMode in [fmAddDOAssgros, fmDetilDO] then
    begin
      Cells[_kolQty, 0]           := 'QTY PO';
      Cells[_KolQtyDo, 0]         := 'QTY DO';
      Cells[_KolDiscMember, 0]    := 'DISC MEMBER PO';
      Cells[_KolDiscMemberReal, 0]:= 'DISC MEMBER DO';
      SetAllComponentReadOnly;
    end  else begin
      Cells[_kolQty,0]            := 'QTY DO';
      Cells[_KolQtyDo,0]          := 'QTY REAL';
      Cells[_KolDiscMember, 0]    := 'DISC MEMBER DO';
      Cells[_KolDiscMemberReal, 0]:= 'DISC MEMBER REAL';
    end;

    Cells[_KolDisc, 0]          := 'DISC';



    Cells[_KolPPN, 0]           := 'PPN %';
    Cells[_KolPPNRP, 0]         := 'PNN RP';
    Cells[_KolTotal, 0]         := 'TOTAL PRICE';
    Cells[_KolIsAMC, 0]         := 'IS AMC';
    Cells[_KolIsDecmal, 0]      := 'IS DECIMAL';

    FixedRows := 1;
    FixedCols := 1;
    AutoSize := True;
  end;
end;

procedure TfrmDialogDOAsGross.ClearForm;
begin
  cbpTraderCode.Text := '';
  with cbpTraderCode do
  begin
    ClearGridData;
    RowCount        := 0;
    Text            := '';
    ShowSpeedButton := false;
  end;

  edtTraderName.Text      := '';
  edtDesc.Text            := '';
  edtStatus.Text          := '';
  curredtTotalDO.Value    := 0.00;
  ClearAdvStringGrid(strgGrid);
  //FNoPOReferenced         := '';
  FTradeId                := 0;
end;

procedure TfrmDialogDOAsGross.lblTambahClick(Sender: TObject);
begin
  inherited;
  strgGrid.AddRow;
end;

procedure TfrmDialogDOAsGross.lblDeleteRowClick(Sender: TObject);
begin
  inherited;
  strgGrid.RemoveRows(strgGrid.Row,1);
end;

procedure TfrmDialogDOAsGross.strgGridCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  if FormMode in [fmDetil] then
    Exit;

  if (ACol = _KolQtyDo) then
    CanEdit := True
  else
    CanEdit := False;
end;

procedure TfrmDialogDOAsGross.strgGridCellValidate(Sender: TObject; ACol,
  ARow: Integer; var Value: String; var Valid: Boolean);
var
  dQtyInteger: Integer;
  IsBisaDecimal: Boolean;
  //aPriceDetil,
  //aTotalPriceDetil,
  //aTotalPrice : Currency;
  dQtyOld, dQtyReal : Real;
  dQtyFloat : Double;
  //i : Integer;
begin
  inherited;
  dQtyOld := strgGrid.Floats[_kolQty, ARow];

  strgGrid.GetCheckBoxState(_KolIsDecmal, ARow, IsBisaDecimal);
  if IsBisaDecimal then
  begin
    if not TryStrToFloat(Value, dQtyFloat) then
    begin
      CommonDlg.ShowError('Format Angka Salah');
      Valid := False;
      Exit;
    end;
    dQtyReal := dQtyFloat;
  end else begin
    if not TryStrToInt(Value, dQtyInteger) then
    begin
      CommonDlg.ShowError('Format Angka Salah, Qty Untuk Baran ' + strgGrid.Cells[_KolKode,ARow] + ' Tidak Boleh Decimal');
      Valid := False;
      Exit;
    end;
    dQtyReal := dQtyInteger;
  end;

  if dQtyReal < 0 then
  begin
    CommonDlg.ShowError('Qty Harus Lebih Basar Sama Dengan 0 (Nol) !');
    valid := False;
    Exit;
  end;

  if dQtyReal > dQtyOld then
  begin
    CommonDlg.ShowError('Qty ' + strgGrid.Cells[_kolQtyDO,0] + ' Tidak Boleh Melebihi ' + strgGrid.Cells[_kolQty,0] + ' !');
    valid := False;
    Exit;
  end;

  {aPriceDetil := StrToCurr(strgGrid.Cells[4, ARow]);
  aTotalPriceDetil := aPriceDetil * dQtyReal;
  strgGrid.Cells[7, strgGrid.Row] := CurrToStr(aTotalPriceDetil);
  aTotalPrice := 0;
  for i:= 1 to strgGrid.RowCount-2 do
  begin
    aTotalPrice := aTotalPrice + StrToCurr(strgGrid.Cells[7, i]);
  end;

  strgGrid.Cells[4, ARow] := CurrToStr(aPriceDetil);
  strgGrid.Cells[7, ARow] := CurrToStr(aTotalPriceDetil);
  curredtTotalDO.Value := aTotalPrice;
  }
  Valid := True;

  strgGrid.Floats[_KolTotal,ARow] := strgGrid.Floats[_KolPriceMinusDisc,ARow] * dQtyReal;
  IsiDataNominalDOKring;
end;

procedure TfrmDialogDOAsGross.SetAllComponentReadOnly;
var
  i: integer;
begin
  for i:=0 to ComponentCount-1 do
    if Components[i] is TEdit then
      TEdit(Components[i]).ReadOnly := True
    else if Components[i] is TJvDateEdit then
      TJvDateEdit(Components[i]).ReadOnly := True
    else if Components[i] is TColumnComboBox then
      TColumnComboBox(Components[i]).ReadOnly := True
    else if Components[i] is TJvValidateEdit then
      TJvValidateEdit(Components[i]).ReadOnly := True;
end;

procedure TfrmDialogDOAsGross.cbpTraderCodeChange(Sender: TObject);
begin
  inherited;
  if FTraderCode <> '' then
    cbpTraderCode.Text := FTraderCode;
end;

function TfrmDialogDOAsGross.checkQtyCtrlEnter: Boolean;
var
  i : Integer;
begin
  Result  := False;
  for i:= strgGrid.FixedRows to strgGrid.RowCount - 1 do
  begin
    if strgGrid.Floats[_kolQty, i] < strgGrid.Floats[_KolQtyDo, i] then
    begin
      Result := True;
      exit;
    end;
  end;

end;

procedure TfrmDialogDOAsGross.DIstribusiDiscMember(aDiscountPersen : Double);
var
  dHargaPlusPPN: Double;
  //dPP: Double;
  dSisaDiskon: Double;
  IsKenaDiscMember: Boolean;
  i: Integer;
begin
  try
    dSisaDiskon := edtDiskonMemberRp.Value;
    for i := 1 to strgGrid.RowCount - 1 do
    begin

      strgGrid.Floats[_KolDiscMemberReal,i]     := 0;

      strgGrid.GetCheckBoxState(_KolIsAMC,i,IsKenaDiscMember);
      if (IsKenaDiscMember) and (strgGrid.Floats[_KolQtyDo,i] > 0) and (dSisaDiskon > 0) then
      begin
        if (dSisaDiskon / strgGrid.Floats[_KolQtyDo,i]) >= (aDiscountPersen / 100 * strgGrid.Floats[_KolPriceMinusDisc,i]) then
        begin
          strgGrid.Cells[_KolDiscMemberReal,i]  := FloatToStr(aDiscountPersen / 100 * strgGrid.Floats[_KolPriceMinusDisc,i]);
          dSisaDiskon                           := dSisaDiskon - (aDiscountPersen / 100 * strgGrid.Floats[_KolPriceMinusDisc,i] * strgGrid.Floats[_KolQtyDo,i]);
        end else begin
          strgGrid.Cells[_KolDiscMemberReal,i]  := FloatToStr((dSisaDiskon / strgGrid.Floats[_KolQtyDo,i]));
          dSisaDiskon                           := 0;
        end;


      end;
      if strgGrid.Floats[_KolPPN,i] = 0 then
        strgGrid.Floats[_KolPPNRP,i]  := 0
      else begin
        dHargaPlusPPN                 := (strgGrid.Floats[_KolPriceMinusDisc,i] -  strgGrid.Floats[_KolDiscMemberReal,i]);
        //dPP                           := dHargaPlusPPN / ((100 + strgGrid.Floats[_KolPPN,i]) / strgGrid.Floats[_KolPPN,i]);
        strgGrid.Floats[_KolPPNRP,i]  := dHargaPlusPPN * strgGrid.Floats[_KolPPN,i] / (100 + strgGrid.Floats[_KolPPN,i]);
      end;
    end;
  finally
    cCloseWaitWindow;
  end;
end;

function TfrmDialogDOAsGross.GetNominalKenaDiskon: Double;
var
  IsKenaDiskonMember: Boolean;
  i: Integer;
begin
  Result := 0;
  for i := 1 to strgGrid.RowCount - 1 do
  begin
    strgGrid.GetCheckBoxState(_KolIsAMC,i, IsKenaDiskonMember);
    if IsKenaDiskonMember then
    begin
      Result := Result + (strgGrid.Floats[_KolPriceMinusDisc,i] * strgGrid.Floats[_KolQtyDo,i]);
    end;
  end;

  

end;

procedure TfrmDialogDOAsGross.IsiDataNominalDOKring;
var
  dDiskonMemberRp: Double;
  dTotalDO: Double;
  dDiskonMemberPersen: Double;
  dNominalKenasDiskonMember: Double;
  dSubTotal: Double;
  i: Integer;
begin
  dSubTotal                 := 0;
  dDiskonMemberPersen       := 0;

  for i := 1 to strgGrid.RowCount - 1 do
  begin
    dSubTotal := dSubTotal + (strgGrid.Floats[_KolPriceMinusDisc,i] * strgGrid.Floats[_KolQtyDo,i]);
  end;

  dNominalKenasDiskonMember   := GetNominalKenaDiskon;
  edtMaxDiskon.Value          := GetMaximalDiskonMember(cbpTraderCode.Text,dialogunit,dNominalKenasDiskonMember,dDiskonMemberPersen);

  if dNominalKenasDiskonMember >= edtMaxDiskon.Value then
    dDiskonMemberRp             := edtMaxDiskon.Value * dDiskonMemberPersen / 100
  else
    dDiskonMemberRp             := dNominalKenasDiskonMember * dDiskonMemberPersen / 100;

  dTotalDO                    := dSubTotal - dDiskonMemberRp;
  edtDiskonMemberPersen.Text  := FloatToStr(dDiskonMemberPersen);
  edtSubTotal.Value           := dSubTotal;
  edtNominalKenaDiskon.Value  := dNominalKenasDiskonMember;
  edtDiskonMemberRp.Value     := dDiskonMemberRp;
  curredtTotalDO.Value        := dTotalDO;

end;

procedure TfrmDialogDOAsGross.IsiKringDetail(aBaris : Integer; aBrgCode :
    String; aBrgAlias : String; aBrgUOM : String; aBrgPrice : Double; aDisc :
    Double; aDiscMember : Double;  aPPNPersen : Double; aPPNRupiah : Double;
    aQty : Double; aQtyDO : Double;  aIsAMC : Integer; aDiscMemberReal :
    Double; aIsDecimal : Integer; aHargaAverage: double; aLastCost: Double);
begin
  with strgGrid do
  begin
    Ints[0,aBaris]                    := aBaris;
    Cells[_KolKode, aBaris]           := aBrgCode;
    Cells[_KolNama, aBaris]           := aBrgAlias;
    Cells[_KolUOM, aBaris]            := aBrgUOM;
    Floats[_KolPrice, aBaris]         := aBrgPrice;
    Floats[_KolDisc, aBaris]          := aDisc;
    Floats[_KolPriceMinusDisc, aBaris]:= aBrgPrice - aDisc;
    Floats[_KolDiscMember, aBaris]    := aDiscMember;
    Floats[_KolDiscMemberReal,aBaris] := aDiscMemberReal;
    Floats[_KolPPN, aBaris]           := aPPNPersen;
    Floats[_KolPPNRP, aBaris]         := 0; // nol dulu nanti diisi pada saat mau simpan// aPPNBMPersen / 100 * Floats[_KolPriceMinusDisc, aBaris];
    Floats[_kolQty, aBaris]           := aQty;
    Floats[_KolQtyDo, aBaris]         := aQtyDO;
    //Floats[_KolTotal, aBaris]         := (Floats[_KolPriceMinusDisc, aBaris]  - aDiscMember) * aQty;
    Floats[_KolTotal, aBaris]         := (Floats[_KolPriceMinusDisc, aBaris]) * aQtyDO;

    AddCheckBox(_KolIsAMC,aBaris, True, True);
    SetCheckBoxState(_KolIsAMC, aBaris, aIsAMC = 1);

    AddCheckBox(_KolIsDecmal, aBaris, True, True);
    SetCheckBoxState(_KolIsDecmal, aBaris, aIsDecimal = 1);

    Floats[_kolHargaAverage, aBaris]  := aHargaAverage;
    Floats[_kolLastCost, aBaris]      := aLastCost;
  end;
end;

{procedure TfrmDialogDOAsGross.LoadDataBarangDanHarga(aBaris : Integer; aBrgCode
    : String; aBrgAlias : String; aBrgUOM : String; aBrgPrice : Double; aDisc :
    Double; aPPNPersen : Double; aPPNRp : Double);
begin
  strgGrid.Ints[0, aBaris]                  := aBaris;
  strgGrid.Cells[_KolKode, aBaris]          := aBrgCode;
  strgGrid.Cells[_KolNama, aBaris]          := aBrgAlias;
  strgGrid.Cells[_KolUOM, aBaris]           := aBrgUOM;
  strgGrid.Floats[_KolPrice, aBaris]        := aBrgPrice;
  strgGrid.Floats[_KolDisc, aBaris]         := aDisc;
  strgGrid.Floats[_KolPPN, aBaris]          := aPPNPersen;
  strgGrid.Floats[_KolPPNRP, aBaris]        := aPPNRp;
end;
}

procedure TfrmDialogDOAsGross.LoadDataHeaderPOKring(aNoDO : String; aTgl :
    TDateTime; aStatus : String; aTraderCode : String; aTraderName : String;
    aTotal  : Double; aLeadTime: integer);
begin
  edtDONo.Text          := aNoDO;
  dtTgl.Date            := aTgl;
  edtStatus.Text        := aStatus;
  cbpTraderCode.Text    := aTraderCode;
  edtTraderName.Text    := aTraderName;
  edtLeadTime.Text      := ' '+ IntToStr(aLeadTime);
end;

procedure TfrmDialogDOAsGross.LoadDataHeaderDOAssgross(aNoBUkti : String ;
    aTglBukti : TDateTime;  aTglReal : TDateTime; aKodeTrader : String;
    aNamaTrader : String;  aTipemember : String; aDescription : String; aStatus
    : String; aLeadTime: integer);
begin
  edtDONo.Text        := aNoBUkti;
  dtTgl.date          := aTglBukti;
  dtReceipt.date      := aTglReal;
  cbpTraderCode.Text  := aKodeTrader;
  edtTraderName.Text  := aNamaTrader;
  edtDesc.Text        := aDescription;
  edtStatus.Text      := aStatus;
  edtTipeMember.Text  := aTipemember;
  edtLeadTime.Text    := ' '+ IntToStr(aLeadTime);
end;

procedure TfrmDialogDOAsGross.SetHargaAverage;
var
  s: string;
  i: Integer;
  sKriteria: string;
begin
  // TODO -cMM: TfrmDialogDOAsGross.SetHargaAverage default body inserted
  sKriteria := '';
  for i := 1 to strgGrid.RowCount - 2 do
  begin
    if strgGrid.Cells[_KolKode, i] <> '' then
    begin
       sKriteria := sKriteria + Quot(strgGrid.Cells[_KolKode, i]) + ','
    end;
  end;

  if sKriteria <> '' then
  begin
    sKriteria := StrLeft(sKriteria, Length(sKriteria)-1);

    s := 'Select BRG_CODE, BRG_HARGA_AVERAGE FROM BARANG '
       + ' WHERE BRG_CODE in ( ' + sKriteria + ')';
    with cOpenQuery(s) do
    begin
      try
        while not Eof do begin
          for i := 1 to strgGrid.RowCount - 2 do
          begin
            if FieldByName('BRG_CODE').AsString = strgGrid.Cells[_KolKode, i] then
            begin
              strgGrid.Floats[_KolAVG, i] := FieldByName('BRG_HARGA_AVERAGE').AsFloat;
            end;
          end;

          Next;
        end;

      finally
        Free;
      end;
    end;

  end;

end;

procedure TfrmDialogDOAsGross.strgGridGetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;


  if (ACol in [_KolDiscMember, _KolPPN, _KolPPNRP, _KolPriceMinusDisc, _KolDiscMemberReal,_kolQty,_KolQtyDo]) then
  begin
    FloatFormat := '%.3n';
    IsFloat := True;
  end else if (ACol in [_KolDisc, _KolPrice, _KolTotal]) then
  begin
    FloatFormat := '%.2n';
    IsFloat := True;
  end else
    IsFloat := False;

end;

procedure TfrmDialogDOAsGross.strgGridGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  inherited;
  if ARow = 0 then HAlign := taCenter
  else begin
    if (ACol in [_KolPrice,_KolDisc, _KolDiscMember, _KolPPN, _KolPPNRP, _KolTotal,_KolPriceMinusDisc, _KolDiscMemberReal, _kolQty, _KolQtyDo]) then
      HAlign := taRightJustify
    else if (ACol in [_KolUOM, _KolKode, _KolIsAMC, _KolIsDecmal]) then
      HAlign := taCenter
    else  
      HAlign := taLeftJustify;
  end;


end;

procedure TfrmDialogDOAsGross.strgGridKeyPress(Sender: TObject;
  var Key: Char);
var
  IsBisaDecimal: Boolean;
begin
  inherited;

  if strgGrid.Col in [_KolQtyDo] then
  begin
    strgGrid.GetCheckBoxState(_KolIsDecmal, strgGrid.Row, IsBisaDecimal);

    if IsBisaDecimal then
    begin
      if not (Key in ['0'..'9',Chr(VK_BACK), FormatSettings.DecimalSeparator, Chr(VK_RETURN)]) then
        Key := #0;
    end else begin
      if not (Key in ['0'..'9',Chr(VK_BACK), Chr(VK_RETURN)]) then
        Key := #0;
    end;    
  end;
end;

procedure TfrmDialogDOAsGross.Button1Click(Sender: TObject);
begin
  inherited;
  //DIstribusiDiscMember(StrToFloat(edtDiskonMemberPersen.Text));
end;

procedure TfrmDialogDOAsGross.PrepareRealisasiDO;
begin
  ShowDetailDo(FFormMode);
  edtDesc.SetFocus;
  edtDesc.ReadOnly := False;
end;

procedure TfrmDialogDOAsGross.SetPPNDanDiscMemberFromPrevTrans(aKodeBarang :
    String; aKodeSatuan : String; aPOAssgros : TPO_ASSGROS; var aPPN : Double;
    var aDiscMember : Double; var aQty : Double);
var
  j: Integer;
begin
  aPPN        := 0;
  aDiscMember := 0;
  aQty        := 0;
  for j := 0 to aPOAssgros.PO_ASSGROS_DETILS.Count - 1 do
  begin
    if (aKodeBarang = aPOAssgros.PO_ASSGROS_DETILS[j].POASD_BRG_CODE) and
       (aKodeSatuan = aPOAssgros.PO_ASSGROS_DETILS[j].POASD_SAT_CODE) then
    begin
      aPPN := aPOAssgros.PO_ASSGROS_DETILS[j].POASD_PPN;
      aQty := aPOAssgros.PO_ASSGROS_DETILS[j].POASD_QTY;
  
      if aQty > 0 then
        aDiscMember:= aPOAssgros.PO_ASSGROS_DETILS[j].POASD_DISC_MEMBER / aQty;
  
      Exit;
    end;
  end;
end;

procedure TfrmDialogDOAsGross.ShowDetailDo(aFM : TFormMode);
var
  dDiscMemberJadi: Double;
  dQtyJadi: Double;
  dQtyAwal: Double;
  LPOAssGros: TPO_ASSGROS;
  //j: Integer;
  dDiscMemberAwal: Double;
  dPPNPersenPO: Double;
  i: Integer;
  iBaris: Integer;
begin
  ClearForm;
  with TDO_ASSGROS.Create(Self) do
  begin
    LPOAssGros := TPO_ASSGROS.Create(Self);
    try
      if LoadByDOAS_NO(NoDOReferenced, dialogunit) then
      begin
        FTradeId        := DOAS_TRD.ID;
        FTradeUnitId    := DOAS_TRD_UNT.ID;
        NoPOReferenced  := DOAS_POAS_NO;

        if not LPOAssGros.LoadByNo(DOAS_POAS_NO, DOAS_POAS_UNT.ID) then
        begin
          CommonDlg.ShowError('PO Kring Dari DO Kring Ini Tidak Ditemukan');
          Exit;
        end;


        LoadDataHeaderDOAssgross(DOAS_NO,DOAS_DATE,DOAS_DATE_RECEIPT,DOAS_TRD.Kode, DOAS_TRD.Nama,
                    DOAS_TRD.Member.TPMember.NAME, DOAS_DESCRIPTION,
                    DOAS_STATUS, DOAS_TRD.LeadTime);


        iBaris := 0;
        for i := 0 to DO_ASSGROS_DETILS.Count - 1 do
        begin
          cShowWaitWindow('Load Data ' + DO_ASSGROS_DETILS[i].DOASD_BRG.Kode);
          SetPPNDanDiscMemberFromPrevTrans(DO_ASSGROS_DETILS[i].DOASD_BRG.Kode, DO_ASSGROS_DETILS[i].DOASD_SAT_CODE, LPOAssGros, dPPNPersenPO, dDiscMemberAwal, dQtyAwal);
          dDiscMemberJadi := 0;
          dQtyJadi        := 0;

          if aFM in [fmDetilDO ]then
          begin
            dQtyJadi := DO_ASSGROS_DETILS[i].DOASD_QTY;
            dDiscMemberJadi := DO_ASSGROS_DETILS[i].DOASD_DISC_MEMBER;
            edtStatus.Text  := DOAS_STATUS;
          end else if aFM in [fmRealisasi] then
          begin
            dQtyAwal        := DO_ASSGROS_DETILS[i].DOASD_QTY;
            dQtyJadi        := DO_ASSGROS_DETILS[i].DOASD_QTY;
            dDiscMemberAwal := DO_ASSGROS_DETILS[i].DOASD_DISC_MEMBER;
            dDiscMemberJadi := DO_ASSGROS_DETILS[i].DOASD_DISC_MEMBER;
            edtStatus.Text  := STATUS_DO_RECEIPT;
          end else if aFM in [fmDetilRealisasi,fmEditRealisasi] then
          begin
            dQtyAwal        := DO_ASSGROS_DETILS[i].DOASD_QTY;
            dQtyJadi        := DO_ASSGROS_DETILS[i].DOASD_QTY_RECEIPT;
            dDiscMemberAwal := DO_ASSGROS_DETILS[i].DOASD_DISC_MEMBER;
            dDiscMemberJadi := DO_ASSGROS_DETILS[i].DOASD_DISC_MEMBER_RECEIPT;
            edtStatus.Text  := STATUS_DO_RECEIPT;
          end;



          Inc(iBaris);
          IsiKringDetail(
            iBaris,
            DO_ASSGROS_DETILS[i].DOASD_BRG.Kode,
            DO_ASSGROS_DETILS[i].DOASD_BRG.Alias,
            DO_ASSGROS_DETILS[i].DOASD_SAT_CODE,
            DO_ASSGROS_DETILS[i].DOASD_SELL_PRICE,
            DO_ASSGROS_DETILS[i].DOASD_DISC,
            dDiscMemberAwal,
            dPPNPersenPO,
            DO_ASSGROS_DETILS[i].DOASD_PPN,
            dQtyAwal,
            dQtyJadi,
            DO_ASSGROS_DETILS[i].DOASD_BRG.IsDiscGMC,
            dDiscMemberJadi,
            DO_ASSGROS_DETILS[i].DOASD_BRG.IsDecimal,
            DO_ASSGROS_DETILS[i].DOASD_COGS,
            DO_ASSGROS_DETILS[i].DOASD_LAST_COST
            );

          if i < DO_ASSGROS_DETILS.Count - 1 then
            strgGrid.AddRow;
            
        end;
        IsiDataNominalDOKring;
        DIstribusiDiscMember(StrToFloat(edtDiskonMemberPersen.Text));
        AturLebarKolom;
      end else begin
        FreeAndNil(frmDialogDOAsGross);
      end;
    finally
      Free;
      FreeAndNil(LPOAssGros);
      cCloseWaitWindow;
    end;
  end;
end;

end.




