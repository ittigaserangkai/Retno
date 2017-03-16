unit ufrmListBigSupplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, ActnList,
  uRetnoUnit, Math, System.Actions,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, cxButtons,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  cxTextEdit, cxMaskEdit, cxCalendar, dxBarBuiltInMenu, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  ufraFooter4Button, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC;

type
  TfrmListBigSupplier = class(TfrmMasterBrowse)
    pnlTop: TPanel;
    lbl3: TLabel;
    lbl4: TLabel;
    dtTglFrom: TcxDateEdit;
    edtGroupName: TEdit;
    cbpGroup: TcxExtLookupComboBox;
    dtTglTo: TcxDateEdit;
    lbl5: TLabel;
    chkContrabon: TCheckBox;
    btnShow: TcxButton;
    btnCetak: TcxButton;
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    cxGridViewColumn4: TcxGridDBColumn;
    cxGridViewColumn5: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbpGroupKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbpGroupCloseUp(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
    procedure dtTglFromKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure dtTglFromChange(Sender: TObject);
    procedure dtTglToChange(Sender: TObject);
    procedure cbpGroupChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure strgGridClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure btnCetakClick(Sender: TObject);
  private
  public
//    procedure DelTemp(iTick: integer; aUnitID: integer);
    function GetListGrup: string;
//    procedure DelTemp(iTick: integer; aUnitID: integer);
    function GetListMerchan: string;
    function getSumSales(var aSalesLast, aSales : Currency): Boolean;
    { Public declarations }
  end;

var
  frmListBigSupplier: TfrmListBigSupplier;

implementation

uses StrUtils, uTSCommonDlg, DateUtils, uAppUtils;

const
    _Kol_GROUPCode          : Integer = 0;
    _Kol_GROUPName          : Integer = 1;
    _Kol_SupCode            : Integer = 2;
    _Kol_SupName            : Integer = 3;
    _Kol_QTY                : Integer = 4;
    _Kol_UOM                : Integer = 5;
    _Kol_SALES              : Integer = 6;
    _Kol_TOTALSALES         : Integer = 7;
    _Kol_Profit             : Integer = 8;
    _Kol_GP                 : Integer = 9;  //gross profit
    _Kol_COGS   : Integer = 10;
    _Kol_GC     : Integer = 11;  //gross cogs
    _kol_SL     : Integer = 12; //sales last
    _kol_TSL    : Integer = 13; //total sales last
    _kol_PL     : Integer = 14; //profit last
    _Kol_GPL    : Integer = 15; //gross profit last
    _kolMerId   : Integer = 16;
    _kolMerCode : Integer = 17;
    _kolMerNm   : Integer = 18;
    _kolid      : Integer = 19;
    _kolSubCode : Integer = 20;
    _kolSubNm   : Integer = 21;
    _kol_CL     : Integer = 22; //last cogs
    _Kol_GCL    : Integer = 23; //last gross cogs
    _fixedRow : Integer = 1;
    _ColCount : Integer = 10;
    _rowCount : Integer = 2;


{$R *.dfm}

procedure TfrmListBigSupplier.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmListBigSupplier.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'RANGKING SUPPLIER PER MERCHANDISING';
end;

procedure TfrmListBigSupplier.FormDestroy(Sender: TObject);
begin
  inherited;
//  frmListBigSupplier.Free;
  frmListBigSupplier := nil;
end;

procedure TfrmListBigSupplier.actPrintExecute(Sender: TObject);
//var
//  SS: TStrings;
//  i: Integer;
//  iGetTick: Integer;
//  sSQL: string;
begin
  inherited;

//  iGetTick  := GetTickCount;
//  SS        :=TStringList.Create;
  {
  try
    for i := strgGrid.FixedRows to strgGrid.RowCount - iax do
    begin
      sSQL  := 'INSERT INTO TEMP_LAPORAN (LAPORAN_ID, USER_ID, CHAR1,CHAR2,'
            + ' CHAR3, CHAR4, CHAR5, NUM1, NUM2, NUM3, NUM4, NUM5, NUM6, NUM7, NUM8,'
            + ' CHAR6, CHAR7, CHAR8, CHAR9)'
            + ' VALUES ('+ IntToStr(iGetTick) + ', '
            + IntToStr(MasterNewUnit.ID) + ', '
            + Quot(strgGrid.Cells[_kolSubCode, i]) + ', '
            + Quot(strgGrid.Cells[_kolSubNm, i]) + ', '
            + Quot(strgGrid.Cells[_kolMerId, i]) + ', '
            + Quot(strgGrid.Cells[_kolMerCode, i]) + ', '
            + Quot(strgGrid.Cells[_kolMerNm, i]) + ', '
            + strgGrid.Cells[_Kol_SALES, i] + ', '
            + strgGrid.Cells[_Kol_TOTALSALES, i] + ', '
            + strgGrid.Cells[_Kol_Profit, i] + ', '
            + strgGrid.Cells[_Kol_GP, i] + ', '
            + strgGrid.Cells[_kol_SL, i] + ', '
            + strgGrid.Cells[_kol_TSL, i] + ', '
            + strgGrid.Cells[_kol_PL, i] + ', '
            + strgGrid.Cells[_Kol_GPL, i] + ', '
            + Quot(strgGrid.Cells[_Kol_SupCode, i]) + ', '
            + Quot(strgGrid.Cells[_Kol_SupName, i]) + ','
            + Quot(Copy(strgGrid.Cells[_Kol_GROUPName, i], 1, Pos(' ', strgGrid.Cells[_Kol_GROUPName, i])))
            + ', '
            + Quot(Copy(strgGrid.Cells[_Kol_GROUPName, i], Pos(' ', strgGrid.Cells[_Kol_GROUPName, i]), Length(strgGrid.Cells[_Kol_GROUPName, i]) -  (Pos(' ', strgGrid.Cells[_Kol_GROUPName, i]) -1)))


            + '); ';

      SS.Append(sSQL);

    end;

    if kExecuteSQLsNoBlob(SS) then
    begin

      cCommitTrans;

      sSQL  := 'SELECT LAPORAN_ID AS ID, USER_ID AS USRID, CHAR1 as SUBGRUP_CODE,'
              + ' CHAR2 as SUBGRUP_NAME, CHAR3 as MERCHANGRUP_ID,'
              + ' CHAR4 as MERCHANGRUP_CODE, CHAR5 as MERCHANGRUP_NAME,'
              + ' CHAR6 as BRG_CODE, CHAR7 as BRG_NAME,'
              + ' CHAR8 as KAT_CODE, CHAR9 as KAT_NAME,'
              + ' NUM1 AS SALES, NUM2 AS PERSENSALES, NUM3 AS PROFIT,'
              + ' NUM4 AS PERSENPROFIT,'
              + ' NUM5 as SALES_LAST, NUM6 as PERSENSALES_LAST,'
              + ' NUM7 as PROFIT_LAST, NUM8 AS PERSENPROFIT_LAST'
              + ' from TEMP_LAPORAN'
              + ' where LAPORAN_ID = '+ IntToStr(iGetTick)
              + ' and USER_ID = ' + IntToStr(MasterNewUnit.ID)
              + ' ORDER BY CHAR3, CHAR8, CHAR6'
              ;
      if (cbpGroup.Cells[0,cbpGroup.Row] = '1') then
        frVariables.Variable['title']     := 'Peringkat 5 besar Supplier dengan nilai penjualan terbesar'
      else
      if (cbpGroup.Cells[0,cbpGroup.Row] = '2') then
        frVariables.Variable['title']     := 'Peringkat 10 besar Supplier dengan nilai penjualan terbesar'
      else
      if (cbpGroup.Cells[0,cbpGroup.Row] = '3') then
        frVariables.Variable['title']     := 'Peringkat 5 besar Supplier dengan nilai profit terbesar'
      else
      if (cbpGroup.Cells[0,cbpGroup.Row] = '4') then
        frVariables.Variable['title']     := 'Peringkat 10 besar Supplier dengan nilai profit terbesar';

      frVariables.Variable['dtTglFrom']    := dtTglFrom.Date;
      frVariables.Variable['dtTglTo']      := dtTglTo.Date;
      frVariables.Variable['loginname']    := FLoginFullname;
      frVariables.Variable['unitname']     := MasterNewUnit.Nama;

      dmReportNew.EksekusiReport('frListBigSupplier',sSQL,'');

    end;

  finally
    SS.Free;
    cExDelTmpLaporan(iGetTick, FLoginId);
    cCommitTrans;
  end;
  }
end;

procedure TfrmListBigSupplier.actRefreshExecute(Sender: TObject);
begin
  inherited;
//  LoadDropDownData(cbpGroup, GetListGrup());
end;

procedure TfrmListBigSupplier.FormShow(Sender: TObject);
begin
  inherited;

//  if strgGrid.FloatingFooter.Visible then
//    iax := 2
//  else
//    iax := 1;

//  dtTglFrom.Date := Now;
//  dtTglTo.Date   := Now;
//  FisListingOK   := False;
//  InisialisasiGrid;
//  actRefreshExecute(Self);
end;

procedure TfrmListBigSupplier.cbpGroupKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  lComboText: string;
begin
  inherited;
  if Key in [VK_UP, VK_DOWN, VK_RIGHT, VK_LEFT] then
    Exit;

  if Length(cbpGroup.Text) = 2 then
  begin
    lComboText := cbpGroup.Text;
//    LoadDropDownData(cbpGroup, GetListGrup());
    cbpGroup.Text := lComboText;
    cbpGroupCloseUp(Sender);
  end;
end;

procedure TfrmListBigSupplier.cbpGroupCloseUp(Sender: TObject);
begin
  inherited;
//  edtGroupName.Text := cbpGroup.Cells[2,cbpGroup.Row];
end;

procedure TfrmListBigSupplier.btnShowClick(Sender: TObject);
var
   sCaption : String;
begin
  inherited;
  if edtGroupName.Text = '' then
  begin
    CommonDlg.ShowError('Jenis Report belum dipilih');
    Exit;
  end;
  sCaption := btnShow.Caption;
  Try
     btnShow.Caption    := 'Please Wait..';
     btnShow.Font.Color := clBlue;
     btnShow.Enabled    := False;
//     InisialisasiGrid;
//     GetData;
//     FisListingOK    := True;
  Finally
    btnShow.Enabled := true;
    btnShow.Caption := sCaption;
    btnShow.Font.Color := clWindowText;
  End;
end;

procedure TfrmListBigSupplier.dtTglFromKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
//  if(Key = 13) then
//    ParseGridData();
//  FisListingOK    := True;
end;

function TfrmListBigSupplier.GetListGrup: string;
begin
  Result :=
    'SELECT MERCHANGRUP_ID, MERCHANGRUP_NAME '+
    ' FROM ref$merchandise_grup ' +
    ' ORDER BY MERCHANGRUP_ID';

end;

procedure TfrmListBigSupplier.strgGridGetFloatFormat(Sender: TObject;
  ACol, ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  if ACol in [_Kol_GROUPCode, _kolMerId, _kolMerCode, _kolMerNm, _kolid,
            _kolSubCode, _kolSubNm, _Kol_GROUPName, _Kol_SupCode, _Kol_SupName] then IsFloat := False;
  if IsFloat then FloatFormat := '%.2n';
end;

procedure TfrmListBigSupplier.dtTglFromChange(Sender: TObject);
begin
  inherited;
//  FisListingOK    := False;

end;

procedure TfrmListBigSupplier.dtTglToChange(Sender: TObject);
begin
  inherited;
//  FisListingOK    := False;

end;

procedure TfrmListBigSupplier.cbpGroupChange(Sender: TObject);
begin
  inherited;
//  FisListingOK    := False;
end;

function TfrmListBigSupplier.getSumSales(var aSalesLast, aSales : Currency):
    Boolean;
var
//  SUBG_MERG_ID: Integer;
  sSQL: string;
  _DateFrom, _DateTo: TDateTime;
begin
  Result    := False;
//  _DateFrom := dtTglFrom.Date;
//  _DateTo   := dtTglTo.Date;
//  sSQL      := '';
  //BY UNT
  {if (cbpGroup.Cells[0,cbpGroup.Row] = '-1') then
  begin
    // last periode
    // in range periode
    //dataSalesAnalys := PrintSalesAnalys.GetDataPrintSalesAnalysByIDUnt(arrParam);
    sSQL :=
      'SELECT SG1.SUBGRUP_MERCHANGRUP_ID, '+
      '(SELECT IIF(SUM(TD.TRANSD_TOTAL),SUM(TD.TRANSD_TOTAL),0) ' +
      'FROM TRANSAKSI_DETIL TD ' +
      'LEFT JOIN TRANSAKSI TR ON TR.TRANS_NO = TD.TRANSD_TRANS_NO ' +
      'LEFT JOIN BARANG BRG ON BRG.BRG_CODE = TD.TRANSD_BRG_CODE ' +
      'LEFT JOIN REF$KATEGORI KG ON KG.KAT_ID = BRG.BRG_KAT_ID ' +
      'LEFT JOIN REF$SUB_GRUP SG2 ON SG2.SUBGRUP_ID = KG.KAT_SUBGRUP_ID ' +
      'WHERE SG2.SUBGRUP_CODE = SG1.SUBGRUP_CODE ' +
      'AND TR.TRANS_DATE = ' + Quotd(_DateTo) + //:P_DATE_FROM_L1' +
      ') AS SALES_LAST, ' +
      '(SELECT IIF(SUM(TD.TRANSD_TOTAL),SUM(TD.TRANSD_TOTAL),0) '+
      'FROM TRANSAKSI_DETIL TD '+
      'LEFT JOIN TRANSAKSI TR ON TR.TRANS_NO = TD.TRANSD_TRANS_NO '+
      'LEFT JOIN BARANG BRG ON BRG.BRG_CODE = TD.TRANSD_BRG_CODE '+
      'LEFT JOIN REF$KATEGORI KG ON KG.KAT_ID = BRG.BRG_KAT_ID '+
      'LEFT JOIN REF$SUB_GRUP SG2 ON SG2.SUBGRUP_ID = KG.KAT_SUBGRUP_ID '+
      'WHERE SG2.SUBGRUP_CODE = SG1.SUBGRUP_CODE '+
      'AND TR.TRANS_DATE >= ' + Quotd(_DateFrom) + //:P_DATE_FROM1 '+
      ' AND TR.TRANS_DATE <= ' + Quotd(_DateTo) +
      ') AS SALES '+//:P_DATE_TO1)AS SALES, '+
      'FROM REF$SUB_GRUP SG1 ';
  end
  else
  // Get List DSA Per Grup
  if (cbpGroup.Cells[0,cbpGroup.Row] = '-2') then
  begin
    // last periode
    // in range periode
    //dataSalesAnalys := PrintSalesAnalys.GetDataPrintSalesAnalysByGrup(arrParam);

    sSQL :=
    'SELECT MERCHGRUP.MERCHANGRUP_ID, ' +
    '(SELECT IIF(SUM(TD.TRANSD_TOTAL),SUM(TD.TRANSD_TOTAL),0) ' +
        'FROM TRANSAKSI_DETIL TD ' +
        'LEFT JOIN TRANSAKSI TR ON TR.TRANS_NO = TD.TRANSD_TRANS_NO ' +
        'LEFT JOIN BARANG BRG ON BRG.BRG_CODE = TD.TRANSD_BRG_CODE ' +
        'LEFT JOIN REF$KATEGORI KG ON KG.KAT_ID = BRG.BRG_KAT_ID ' +
        'LEFT JOIN REF$SUB_GRUP SG2 ON SG2.SUBGRUP_ID = KG.KAT_SUBGRUP_ID ' +
        'LEFT JOIN REF$MERCHANDISE_GRUP MERCHGRUP1 ON MERCHGRUP.MERCHANGRUP_ID = SG2.SUBGRUP_MERCHANGRUP_ID ' +
        'WHERE MERCHGRUP1.MERCHANGRUP_ID = MERCHGRUP.MERCHANGRUP_ID AND ' +
        'TR.TRANS_DATE = ' + Quotd(_DateTo) + //:P_DATE_FROM_LAST1' +
        ') AS SALES_LAST, ' +
    '(SELECT IIF(SUM(TD.TRANSD_TOTAL),SUM(TD.TRANSD_TOTAL),0) ' +
        'FROM TRANSAKSI_DETIL TD ' +
        'LEFT JOIN TRANSAKSI TR ON TR.TRANS_NO = TD.TRANSD_TRANS_NO ' +
        'LEFT JOIN BARANG BRG ON BRG.BRG_CODE = TD.TRANSD_BRG_CODE ' +
        'LEFT JOIN REF$KATEGORI KG ON KG.KAT_ID = BRG.BRG_KAT_ID ' +
        'LEFT JOIN REF$SUB_GRUP SG2 ON SG2.SUBGRUP_ID = KG.KAT_SUBGRUP_ID ' +
        'LEFT JOIN REF$MERCHANDISE_GRUP MERCHGRUP1 ON MERCHGRUP.MERCHANGRUP_ID = SG2.SUBGRUP_MERCHANGRUP_ID ' +
        'WHERE MERCHGRUP1.MERCHANGRUP_ID = MERCHGRUP.MERCHANGRUP_ID AND ' +
        'TR.TRANS_DATE >= ' + Quotd(_DateFrom) + //:P_DATE_FROM' +
        'AND TR.TRANS_DATE <= ' + Quotd(_DateTo) +
        ') AS SALES ' +//:P_DATE_TO) AS SALES,' +
    'FROM REF$MERCHANDISE_GRUP MERCHGRUP';

  end
  else
  //by UNT & SUB GRUP
  begin
    SUBG_MERG_ID := StrToInt(cbpGroup.Cells[0,cbpGroup.Row]);
    // last periode
    // in range periode
    //dataSalesAnalys := PrintSalesAnalys.GetDataPrintSalesAnalysByGrupIDUnt(arrParam);
    sSQL :=
      'SELECT SG1.SUBGRUP_MERCHANGRUP_ID, '+
      '(SELECT IIF(SUM(TD.TRANSD_TOTAL),SUM(TD.TRANSD_TOTAL),0) ' +
          'FROM TRANSAKSI_DETIL TD ' +
          'LEFT JOIN TRANSAKSI TR ON TR.TRANS_NO = TD.TRANSD_TRANS_NO ' +
          'LEFT JOIN BARANG BRG ON BRG.BRG_CODE = TD.TRANSD_BRG_CODE ' +
          'LEFT JOIN REF$KATEGORI KG ON KG.KAT_ID = BRG.BRG_KAT_ID ' +
          'LEFT JOIN REF$SUB_GRUP SG2 ON SG2.SUBGRUP_ID = KG.KAT_SUBGRUP_ID ' +
          'WHERE SG2.SUBGRUP_CODE = SG1.SUBGRUP_CODE ' +
          'AND TR.TRANS_DATE = ' + Quotd(_DateTo) + //:P_DATE_FROM_L1' +
          ')AS SALES_LAST, ' +
      '(SELECT IIF(SUM(TD.TRANSD_TOTAL),SUM(TD.TRANSD_TOTAL),0) '+
          'FROM TRANSAKSI_DETIL TD '+
          'LEFT JOIN TRANSAKSI TR ON TR.TRANS_NO = TD.TRANSD_TRANS_NO '+
          'LEFT JOIN BARANG BRG ON BRG.BRG_CODE = TD.TRANSD_BRG_CODE '+
          'LEFT JOIN REF$KATEGORI KG ON KG.KAT_ID = BRG.BRG_KAT_ID '+
          'LEFT JOIN REF$SUB_GRUP SG2 ON SG2.SUBGRUP_ID = KG.KAT_SUBGRUP_ID '+
          'WHERE SG2.SUBGRUP_CODE = SG1.SUBGRUP_CODE '+
          'AND TR.TRANS_DATE >= ' + Quotd(_DateFrom) + //:P_DATE_FROM1 '+
          'AND TR.TRANS_DATE <= ' + Quotd(_DateTo) +
          ') AS SALES ' +//:P_DATE_TO1)AS SALES, '+
      'FROM REF$SUB_GRUP SG1 '+
      'WHERE (SG1.SUBGRUP_MERCHANGRUP_ID =' + IntToStr(SUBG_MERG_ID) + ')';
  end;
  aSalesLast := 0;
  aSales     := 0;
  with cOpenQuery(sSQL) do
  begin
      try
         while not Eof Do
         begin
           aSalesLast := aSalesLast + FieldByName('SALES_LAST').AsFloat;
           aSales     := aSales + FieldByName('SALES').AsFloat;
           Next;
         end;
         Result := True;
      Finally
         Free;
      End;
  end;
  }
end;

procedure TfrmListBigSupplier.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if(Key = Ord('P'))and(ssctrl in Shift) then
  begin
    if cbpGroup.Focused or dtTglFrom.Focused or dtTglTo.Focused then
      fraFooter4Button1.btnAdd.SetFocus;
    actPrintExecute(Self);
  end;
end;

function TfrmListBigSupplier.GetListMerchan: string;
begin
  Result :=
    'SELECT MERCHAN_ID, MERCHAN_CODE, MERCHAN_NAME '+
    ' FROM REF$MERCHANDISE ' +
    ' ORDER BY MERCHAN_CODE';
end;

procedure TfrmListBigSupplier.strgGridMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
//  if (strgGrid.CellRect(_Kol_GROUPCode,0).Left < X) and (X < strgGrid.CellRect(_Kol_GROUPCode,0).Right)  and
//      (strgGrid.CellRect(_Kol_GROUPCode,0).Top < Y) and (Y < strgGrid.CellRect(_Kol_GROUPCode,0).Bottom) then
//      Screen.Cursor := crHandPoint
//  else
    Screen.Cursor := crDefault;
end;

procedure TfrmListBigSupplier.strgGridClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  inherited;
  if (ARow = 0) and (ACol = _Kol_GROUPCode) then
  begin

//    strgGrid.SortByColumn(ACol);
//
//    if strgGrid.SortSettings.Direction = sdDescending then
//      strgGrid.SortSettings.Direction := sdAscending
//    else
//      strgGrid.SortSettings.Direction := sdDescending;
  end;
end;

procedure TfrmListBigSupplier.btnCetakClick(Sender: TObject);
//var
//  SS: TStrings;
//  i: Integer;
//  iGetTick: Integer;
//  sSQL: string;
begin
  inherited;

//  iGetTick  := GetTickCount;
//  SS        :=TStringList.Create;
  {
  try
    for i := strgGrid.FixedRows to strgGrid.RowCount - iax do
    begin
      sSQL  := 'INSERT INTO TEMP_LAPORAN (LAPORAN_ID, USER_ID, CHAR1,CHAR2,'
            + ' CHAR3, CHAR4, CHAR5, NUM1, NUM2, NUM3, NUM4, NUM5, NUM6, NUM7, NUM8,'
            + ' CHAR6, CHAR7, CHAR8, CHAR9, NUM9)'
            + ' VALUES ('+ IntToStr(iGetTick) + ', '
            + IntToStr(MasterNewUnit.ID) + ', '
            + Quot(strgGrid.Cells[_kolSubCode, i]) + ', '
            + Quot(strgGrid.Cells[_kolSubNm, i]) + ', '
            + Quot(strgGrid.Cells[_kolMerId, i]) + ', '
            + Quot(strgGrid.Cells[_kolMerCode, i]) + ', '
            + Quot(strgGrid.Cells[_kolMerNm, i]) + ', '
            + strgGrid.Cells[_Kol_SALES, i] + ', '
            + strgGrid.Cells[_Kol_TOTALSALES, i] + ', '
            + strgGrid.Cells[_Kol_Profit, i] + ', '
            + strgGrid.Cells[_Kol_GP, i] + ', '
            + strgGrid.Cells[_kol_SL, i] + ', '
            + strgGrid.Cells[_kol_TSL, i] + ', '
            + strgGrid.Cells[_kol_PL, i] + ', '
            + strgGrid.Cells[_Kol_GPL, i] + ', '
            + Quot(strgGrid.Cells[_Kol_SupCode, i]) + ', '
            + Quot(strgGrid.Cells[_Kol_SupName, i]) + ','
            + Quot(Copy(strgGrid.Cells[_Kol_GROUPName, i], 1, Pos(' ', strgGrid.Cells[_Kol_GROUPName, i])))
            + ', '
            + Quot(Copy(strgGrid.Cells[_Kol_GROUPName, i], Pos(' ', strgGrid.Cells[_Kol_GROUPName, i]), Length(strgGrid.Cells[_Kol_GROUPName, i]) -  (Pos(' ', strgGrid.Cells[_Kol_GROUPName, i]) -1)))
            + ',' + strgGrid.Cells[_Kol_QTY, i]
            + '); ';

      SS.Append(sSQL);

    end;

    if kExecuteSQLsNoBlob(SS) then
    begin

      cCommitTrans;

      sSQL  := 'SELECT LAPORAN_ID AS ID, USER_ID AS USRID, CHAR1 as SUBGRUP_CODE,'
              + ' CHAR2 as SUBGRUP_NAME, CHAR3 as MERCHANGRUP_ID,'
              + ' CHAR4 as MERCHANGRUP_CODE, CHAR5 as MERCHANGRUP_NAME,'
              + ' CHAR6 as BRG_CODE, CHAR7 as BRG_NAME,'
              + ' CHAR8 as KAT_CODE, CHAR9 as KAT_NAME,'
              + ' NUM1 AS SALES, NUM2 AS PERSENSALES, NUM3 AS PROFIT,'
              + ' NUM4 AS PERSENPROFIT,'
              + ' NUM5 as SALES_LAST, NUM6 as PERSENSALES_LAST,'
              + ' NUM7 as PROFIT_LAST, NUM8 AS PERSENPROFIT_LAST'
              + ' ,NUM9 as QTY'
              + ' from TEMP_LAPORAN'
              + ' where LAPORAN_ID = '+ IntToStr(iGetTick)
              + ' and USER_ID = ' + IntToStr(MasterNewUnit.ID)
              + ' ORDER BY CHAR3, CHAR8, CHAR6'
              ;
      if (cbpGroup.Cells[0,cbpGroup.Row] = '1') then
        frVariables.Variable['title']     := 'Peringkat 5 besar Supplier dengan nilai penjualan terbesar'
      else
      if (cbpGroup.Cells[0,cbpGroup.Row] = '2') then
        frVariables.Variable['title']     := 'Peringkat 10 besar Supplier dengan nilai penjualan terbesar'
      else
      if (cbpGroup.Cells[0,cbpGroup.Row] = '3') then
        frVariables.Variable['title']     := 'Peringkat 5 besar Supplier dengan nilai profit terbesar'
      else
      if (cbpGroup.Cells[0,cbpGroup.Row] = '4') then
        frVariables.Variable['title']     := 'Peringkat 10 besar Supplier dengan nilai profit terbesar';

      frVariables.Variable['dtTglFrom']    := dtTglFrom.Date;
      frVariables.Variable['dtTglTo']      := dtTglTo.Date;
      frVariables.Variable['loginname']    := FLoginUsername;
      frVariables.Variable['unitname']     := MasterNewUnit.Nama;

      dmReportNew.EksekusiReport('frListBigSupplier',sSQL,'');

    end;

  finally
    SS.Free;
    cExDelTmpLaporan(iGetTick, FLoginId);
    cCommitTrans;
  end;
  }
end;

end.
