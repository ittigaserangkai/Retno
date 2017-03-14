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
    { Private declarations }
    FSumSales,
    FSumSalesLast : Currency;
    FisListingOK  : Boolean;
//    dataSalesAnalys: TResultDataSet;
    iax: Integer;
    procedure GetData;
    procedure LoadDropDownData(ACombo: TcxExtLookupComboBox; sSQL: String);
    procedure ParseGridData;
    procedure ParseHeaderGrid();
    function getDataSalesAnalys: string;
    function GetSQLDSAPos(aMerchan_ID: Integer; isContrabon: Boolean; isLast:
        Boolean = False): string;
    function GetSQLDSAKring(aMerchan_ID: Integer; isContrabon: Boolean; isLast:
        Boolean = False): string;
    procedure InisialisasiGrid;
    procedure SetData(aSql: string; isLast: Boolean = False);
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
var
  SS: TStrings;
  i: Integer;
  iGetTick: Integer;
  sSQL: string;
begin
  inherited;

  iGetTick  := GetTickCount;
  SS        :=TStringList.Create;
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
  LoadDropDownData(cbpGroup, GetListGrup());
end;

procedure TfrmListBigSupplier.LoadDropDownData(ACombo: TcxExtLookupComboBox; sSQL:
    String);
begin
  {Flush the old data}
//  ACombo.ClearGridData;

  {Make sure the allocated storage is big enough}
//  ACombo.RowCount := 5;
//  ACombo.ColCount := 2;

  {Load the data}
//  if ACombo = cbpGroup then
//  begin
//    ACombo.AddRow(['','NAME','DESCRIPTION']);
//    ACombo.AddRow(['1','TOP 5','Peringkat 5 besar Supplier dengan nilai penjualan terbesar']);
//    ACombo.AddRow(['2','TOP 10','Peringkat 10 besar Supplier dengan nilai penjualan terbesar']);
//    ACombo.AddRow(['3','TOP 5','Peringkat 5 besar Supplier dengan nilai profit terbesar']);
//    ACombo.AddRow(['4','TOP 10','Peringkat 10 besar Supplier dengan nilai profit terbesar']);
//  end; //end if acombo

  {Now shring the grid so its just big enough for the data}
//  ACombo.SizeGridToData;
//  ACombo.FixedRows:= 1;
end;//R

procedure TfrmListBigSupplier.FormShow(Sender: TObject);
begin
  inherited;

//  if strgGrid.FloatingFooter.Visible then
//    iax := 2
//  else
    iax := 1;

  dtTglFrom.Date := Now;
  dtTglTo.Date   := Now;
  FisListingOK   := False;
  InisialisasiGrid;
  actRefreshExecute(Self);
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
    LoadDropDownData(cbpGroup, GetListGrup());
    cbpGroup.Text := lComboText;
    cbpGroupCloseUp(Sender);
  end;
end;

procedure TfrmListBigSupplier.ParseGridData;
var countI: Integer;
    currSales, currProfit: Currency;
    persenSales, persenProfit: Real;
    sSQL : String;
begin
  sSQL := getDataSalesAnalys();

  ParseHeaderGrid();
  {
  with cOpenQuery(sSQL) do
  Begin
      Try
        If Not EOF then
        begin
          with strgGrid do
          begin
            countI        := 1;
            FSumSales     := 0.0;
            FSumSalesLast := 0.0;
            while not(Eof) do
            begin
              FSumSales := FSumSales + FieldByName('SALES').AsCurrency;
              FSumSalesLast := FSumSalesLast + FieldByName('SALES_LAST').AsCurrency;
              Next;
              countI := countI + 1;
            end;
            RowCount := countI + 1;

            First;
            countI := 1;
            while not(Eof) do
            begin
                Cells[_Kol_GROUPCode,countI] := FieldByName('MERCHAN_CODE').AsString + ' ' +
                                   FieldByName('MERCHAN_NAME').AsString;
              Cells[_Kol_SALES,countI] := FormatCurr('#,##0.00', FieldByName('SALES').AsCurrency);
              currSales       := FieldByName('SALES').AsCurrency;
              currProfit      := FieldByName('BFRPROFIT').AsCurrency;
              if FSumSales = 0 then
                persenSales := 0
              else
                persenSales := currSales / FSumSales * 100;

              if (currSales = 0) then
                persenProfit := 0
              else
                persenProfit := ((currSales - currProfit) / currSales) * 100;
              Cells[_Kol_TOTALSALES,countI] := FormatFloat('0.#0',persenSales);
              Cells[_Kol_COGS,countI]       := FormatCurr('#,##0.00',currSales - currProfit);
              Cells[_Kol_GC,countI]         := FormatFloat('0.#0',persenProfit);

              Inc(countI);
              Next;
            end;
            FixedRows := 1;
            AutoSize  := True;
          end; //with strgrd
          strgGrid.Cells[_Kol_GROUPCode, strgGrid.RowCount-1] := 'T O T A L';
          strgGrid.FloatingFooter.ColumnCalc[_Kol_SALES]  := acSUM;
          strgGrid.FloatingFooter.ColumnCalc[_Kol_COGS] := acSUM;
        end // recordcount > 0
        else
        begin
          with strgGrid do
          begin
            ClearNormalCells;
            RowCount                 := 3;
            Cells[_Kol_GROUPCode,1]   := '';
            Cells[_Kol_SALES,1]      := '';
            Cells[_Kol_TOTALSALES,1] := '';
            Cells[_Kol_COGS,1]     := '';
            Cells[_Kol_GC,1]         := '';

            FixedRows := 1;
            AutoSize  := True;
          end; //with strgrd
        end;
      Finally
          Free;
      End;
  End;
  }
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
     InisialisasiGrid;
     GetData;
     FisListingOK    := True;
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
  if(Key = 13) then
    ParseGridData();
  FisListingOK    := True;
end;

function TfrmListBigSupplier.getDataSalesAnalys: string;
var
  SUBG_MERG_ID: Integer;
  sSQL: string;
  _DateFrom, _DateTo: TDateTime;
begin
  _DateFrom := dtTglFrom.Date;
  _DateTo   := dtTglTo.Date;
  sSQL      := '';
  //BY UNT                        x
  {if (cbpGroup.Cells[0,cbpGroup.Row] = '-1') then
  begin
    // last periode
    // in range periode
    sSQL := ' select * ' +
            ' from PROC_TR$DSA_ALL(' +
            Quotd(_DateFrom) + ', ' +
            Quotd(_DateTo) + ', ' +
            IntToStr(MasterNewUnit.ID) +
            ');';
  end
  else
  // Get List DSA Per Grup
  if (cbpGroup.Cells[0,cbpGroup.Row] = '-2') then
  begin
    // last periode
    // in range periode
    sSQL := ' select * ' +
            ' from PROC_TR$DSA_ALL_BYGROUP(' +
            Quotd(_DateFrom) + ', ' +
            Quotd(_DateTo) + ', ' +
            IntToStr(MasterNewUnit.ID) +
            ');';

  end
  else
  //by UNT & SUB GRUP
  begin
    SUBG_MERG_ID := StrToInt(cbpGroup.Cells[0,cbpGroup.Row]);
    // last periode
    // in range periode
    //dataSalesAnalys := PrintSalesAnalys.GetDataPrintSalesAnalysByGrupIDUnt(arrParam);
    sSQL := ' select * ' +
            ' from PROC_TR$DSA_BYGROUP(' +
            Quotd(_DateFrom) + ', ' +
            Quotd(_DateTo) + ', ' +
            IntToStr(SUBG_MERG_ID) + ', ' +
            IntToStr(MasterNewUnit.ID) +
            ');';
  end;
  }
  Result := sSQL;
end;

function TfrmListBigSupplier.GetListGrup: string;
begin
  Result :=
    'SELECT MERCHANGRUP_ID, MERCHANGRUP_NAME '+
    ' FROM ref$merchandise_grup ' +
    ' ORDER BY MERCHANGRUP_ID';

end;

procedure TfrmListBigSupplier.ParseHeaderGrid;
begin
//  if cbpGroup.Cells[0, cbpGroup.Row] = '-2' then
//    strgGrid.Cells[_Kol_GROUPCode, 0] := 'GROUP'
//  else
//    strgGrid.Cells[_Kol_GROUPCode, 0] := 'SUB GROUP CODE & NAME';
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
  FisListingOK    := False;

end;

procedure TfrmListBigSupplier.dtTglToChange(Sender: TObject);
begin
  inherited;
  FisListingOK    := False;

end;

procedure TfrmListBigSupplier.cbpGroupChange(Sender: TObject);
begin
  inherited;
  FisListingOK    := False;
end;

procedure TfrmListBigSupplier.GetData;
var
  isSorting: Boolean;
  dNilai: Double;
  sKodeMer: string;
  aTmp1: Double;
  aTmp: Double;
  aSumSalesLast : Double;
  aSumSales     : Double;
  i, j, k, iKol : Integer;
begin
  {
  strgGrid.Enabled  := False;
  try
    with cOpenQuery(GetListMerchan()) do
    begin
      Try
        while not EoF do
        begin
          if (chkContrabon.Checked) then
          begin
            SetData(GetSQLDSAPos(FieldByName('MERCHAN_ID').AsInteger,True));
            SetData(GetSQLDSAKring(FieldByName('MERCHAN_ID').AsInteger,True));

            SetData(GetSQLDSAPos(FieldByName('MERCHAN_ID').AsInteger,True, True), True);
            SetData(GetSQLDSAKring(FieldByName('MERCHAN_ID').AsInteger,True, True), True);
          end
          else
          begin
            SetData(GetSQLDSAPos(FieldByName('MERCHAN_ID').AsInteger, False));
            SetData(GetSQLDSAKring(FieldByName('MERCHAN_ID').AsInteger,False));

            SetData(GetSQLDSAPos(FieldByName('MERCHAN_ID').AsInteger,False, True), True);
            SetData(GetSQLDSAKring(FieldByName('MERCHAN_ID').AsInteger,False, True), True);
          end;
          Next;
        end;
      Finally
        Free;
      end;
    end;

    //Sorting and Filtering
    i := strgGrid.FixedRows;
    k := 1;
    isSorting := True;
    while (k <= 100) and isSorting do
    begin
      isSorting := False;
      while (i < strgGrid.RowCount) do
      begin
        sKodeMer := strgGrid.Cells[_Kol_GROUPCode, i];

        if (cbpGroup.Cells[0,cbpGroup.Row] = '1') or (cbpGroup.Cells[0,cbpGroup.Row] = '2') then
           iKol := _Kol_SALES
        else
           iKol := _Kol_Profit;
        dNilai   := strgGrid.Floats[iKol, i];
        j := i + 1;
        if (sKodeMer = strgGrid.Cells[_Kol_GROUPCode, j])
        and (dNilai < strgGrid.Floats[iKol, j])
        then
        begin
          strgGrid.SwapRows(i, j);
          isSorting := True;
        end
        else
        if (sKodeMer <> strgGrid.Cells[_Kol_GROUPCode, j]) then
        begin
          sKodeMer := strgGrid.Cells[_Kol_GROUPCode, j];
        end;
        i := i + 1;
      end;
      i := strgGrid.FixedRows;
      k := k + 1;
    end;

    i := strgGrid.FixedRows;
    while (i < strgGrid.RowCount) do
    begin
        k := i + 1;
        if (cbpGroup.Cells[0,cbpGroup.Row] = '1') or (cbpGroup.Cells[0,cbpGroup.Row] = '3') then
           j := i + 5
        else
           j := i + 10;
        sKodeMer := strgGrid.Cells[_Kol_GROUPCode, i];
        while (sKodeMer<>'') and (sKodeMer = strgGrid.Cells[_Kol_GROUPCode, k]) do
        begin
          if k >= j then
             strgGrid.RemoveRows(k, 1)
          else
            k := k + 1;
        end;
        i := k;
    end;

    strgGrid.FloatingFooter.ColumnCalc[_Kol_SALES]  := acSUM;
    strgGrid.FloatingFooter.ColumnCalc[_Kol_COGS]   := acSUM;
    strgGrid.FloatingFooter.ColumnCalc[_kol_SL]     := acSUM;
    strgGrid.AutoSize := True;

    aSumSales     := strgGrid.Floats[_Kol_SALES, strgGrid.RowCount -1];
    aSumSalesLast := strgGrid.Floats[_kol_SL, strgGrid.RowCount -1];

    if aSumSales = 0 then  aSumSales := 1;
    if aSumSalesLast = 0 then  aSumSalesLast := 1;

    for i := strgGrid.FixedRows to strgGrid.RowCount - iax do
    begin
      //cek data bernilai string '' ganti dengan 0
      if strgGrid.Cells[_Kol_SALES, i] = '' then  strgGrid.Ints[_Kol_SALES, i] := 0;
      if strgGrid.Cells[_kol_SL, i] = ''    then  strgGrid.Ints[_kol_SL, i] := 0;
      if strgGrid.Cells[_kol_PL, i] = ''    then  strgGrid.Ints[_kol_PL, i] := 0;
      if strgGrid.Cells[_kol_CL, i] = ''    then  strgGrid.Ints[_kol_CL, i] := 0;

      //itung profit
      strgGrid.Floats[_Kol_Profit, i] := strgGrid.Floats[_Kol_SALES, i] - strgGrid.Floats[_Kol_COGS, i];
      strgGrid.Floats[_kol_PL, i]     := strgGrid.Floats[_kol_SL, i] - strgGrid.Floats[_kol_CL, i ];
      //itung gross
      strgGrid.Floats[_Kol_TOTALSALES, i] :=  strgGrid.Floats[_Kol_SALES, i] /aSumSales * 100;
      strgGrid.Floats[_Kol_GC, i]         :=  strgGrid.Floats[_Kol_COGS, i] /aSumSales * 100;

      if strgGrid.Floats[_Kol_SALES, i] = 0 then
      begin
        aTmp  := 1;
        aTmp1 := 0;
      end
      else
      begin
        aTmp  := strgGrid.Floats[_Kol_SALES, i];
        aTmp1 := strgGrid.Floats[_Kol_Profit, i];
      end;

      strgGrid.Floats[_Kol_GP, i]         :=  aTmp1 /aTmp  * 100;

      //last
      strgGrid.Floats[_kol_TSL, i] :=  strgGrid.Floats[_kol_SL, i] /aSumSalesLast * 100;
      strgGrid.Floats[_Kol_GCL, i] :=  strgGrid.Floats[_kol_CL, i] /aSumSalesLast * 100;
      strgGrid.Floats[_Kol_GPL, i] :=  strgGrid.Floats[_kol_PL, i] /aSumSalesLast * 100;
    end;
  finally
    strgGrid.FloatingFooter.ColumnCalc[_Kol_Profit]  := acSUM;
    strgGrid.Enabled  := True;
  end;
   }
end;

function TfrmListBigSupplier.GetSQLDSAPos(aMerchan_ID: Integer; isContrabon:
    Boolean; isLast: Boolean = False): string;
var
  sTipeCode: string;
  sFltrKat: string;
  sGrpBy2: string;
  sGrpBy1: string;
  sdate: string;
  sSQL: string;
  sJoin: string;
  sKolom: string;
  sTipeBrg: string;
  sOrderBy: String;
begin
  //6
  if isContrabon then
  begin
    sTipeBrg  := ' IN ';
    sKolom    := ', sum(a.TRANSD_QTY * (a.TRANSD_SELL_PRICE_DISC - (a.TRANSD_PPN/100)*(a.TRANSD_SELL_PRICE - (a.TRANSD_SELL_PRICE - (a.TRANSD_SELL_PRICE_DISC/(a.TRANSD_PPN/100+1)))))) as Profit';
  end
  else
  begin
    sTipeBrg  := ' NOT IN ';
    sKolom    := ', sum(a.TRANSD_COGS * a.TRANSD_QTY) as Profit';
  end;

  if isLast then
    sdate := ' and ExtractDate(b.TRANS_DATE) = ' + TAppUtils.QuotD(dtTglTo.Date)
  else
    sdate := ' and ExtractDate(b.TRANS_DATE) BETWEEN '+  TAppUtils.QuotD(dtTglFrom.Date)
          + ' and '+ TAppUtils.QuotD(dtTglTo.Date);

//  if (cbpGroup.Cells[0,cbpGroup.Row] = '1') then
  begin
    sGrpBy1 := ' g.MERCHAN_ID, g.MERCHAN_CODE, g.MERCHAN_NAME, s.SUP_CODE, s.SUP_NAME';
    sGrpBy2  := ' ';
    sJoin   := ' left outer join barang_suplier bs on d.BRG_CODE=bs.BRGSUP_BRG_CODE and bs.BRGSUP_IS_PRIMARY = 1'
            + ' left outer join suplier s on bs.BRGSUP_SUP_CODE=s.SUP_CODE '
  end;
  {
  if (cbpGroup.Cells[0,cbpGroup.Row] = '1') then
     sOrderBy := ' 8 Desc Rows 5'
  else if (cbpGroup.Cells[0,cbpGroup.Row] = '2') then
     sOrderBy := ' 8 Desc Rows 10'
  else if (cbpGroup.Cells[0,cbpGroup.Row] = '3') then
     sOrderBy := ' 6 Desc Rows 5'
  else if (cbpGroup.Cells[0,cbpGroup.Row] = '4') then
     sOrderBy := ' 6 Desc Rows 10';
  }
  sSQL := 'select'
      + sGrpBy1
      + sGrpBy2
      + sKolom
      + ', sum(a.TRANSD_QTY) as QTY, a.TRANSD_SAT_CODE as SAT_CODE'
      + ', sum(a.TRANSD_QTY * (a.TRANSD_SELL_PRICE_DISC - (a.TRANSD_PPN/100)*(a.TRANSD_SELL_PRICE - (a.TRANSD_SELL_PRICE - (a.TRANSD_SELL_PRICE_DISC/(a.TRANSD_PPN/100+1)))))) as sales'
      + ' from TRANSAKSI_DETIL a'
      + ' inner join TRANSAKSI b on a.TRANSD_TRANS_NO = b.TRANS_NO'
      + ' and a.TRANSD_TRANS_UNT_ID = b.TRANS_UNT_ID'
//      + ' and b.TRANS_UNT_ID = '+ IntToStr(MasterNewUnit.ID)
      + ' and b.TRANS_IS_PENDING = 0'
      + sdate
      + ' inner join REF$TIPE_BARANG c on a.TRANSD_TPBRG_ID = c.TPBRG_ID'
      + ' and c.TPBRG_CODE '+ sTipeBrg
      + ' ( select TPBRG_CODE from REF$TIPE_BARANG'
      + ' where ISPATRACONTRABON = 1'
      + sTipeCode
      + ' )'
      + ' inner join barang d on  a.TRANSD_BRG_CODE = d.BRG_CODE'
      + ' and d.BRG_MERCHAN_ID = ' + IntToStr(aMerchan_ID)
      + ' inner join REF$MERCHANDISE g on d.BRG_MERCHAN_ID=g.MERCHAN_ID '
      + sJoin
      + sFltrKat
      + ' Group By '
      + sGrpBy1
      + sGrpBy2
      + ',a.TRANSD_SAT_CODE'
      + ' Order By '
      + sOrderBy;

  Result := sSQL;
end;

function TfrmListBigSupplier.GetSQLDSAKring(aMerchan_ID: Integer; isContrabon:
    Boolean; isLast: Boolean = False): string;
var
  sTipeCode: string;
  sFltrKat: string;
  sGrpBy2: string;
  sGrpBy1: string;
  sdate: string;
  sSQL: string;
  sJoin: string;
  sKolom: string;
  sTipeBrg: string;
  sOrderBy: String;
begin
  if isContrabon then
  begin
    sTipeBrg  := ' IN ';
    sKolom    := ', sum(a.POASD_QTY *(a.POASD_SELL_PRICE_DISC - ((a.POASD_PPN/100)*(a.POASD_SELL_PRICE - (a.POASD_SELL_PRICE - (a.POASD_SELL_PRICE_DISC/(a.POASD_PPN/100+1))) ) ))) as Profit';
  end
  else
  begin
    sTipeBrg  := ' NOT IN ';
    sKolom    := ', sum(a.POASD_COGS * a.POASD_QTY) as Profit';
  end;

  if isLast then
    sdate := ' and ExtractDate(b.POAS_DATE) = ' + TAppUtils.QuotD(dtTglTo.Date)
  else
    sdate := ' and ExtractDate(b.POAS_DATE) BETWEEN '+  TAppUtils.QuotD(dtTglFrom.Date)
          + ' and '+ TAppUtils.QuotD(dtTglTo.Date);

//  if (cbpGroup.Cells[0,cbpGroup.Row] = '-1') then
  begin
    sGrpBy1  := ' g.MERCHAN_ID, g.MERCHAN_CODE, g.MERCHAN_NAME, s.SUP_CODE, s.SUP_NAME ';
    sGrpBy2 := '';
    sJoin   := ' left outer join barang_suplier bs on brg.BRG_CODE=bs.BRGSUP_BRG_CODE and bs.BRGSUP_IS_PRIMARY = 1'
            + ' left outer join suplier s on bs.BRGSUP_SUP_CODE=s.SUP_CODE'
  end;
  {
  if (cbpGroup.Cells[0,cbpGroup.Row] = '1') then
     sOrderBy := ' 8 Desc Rows 5'
  else if (cbpGroup.Cells[0,cbpGroup.Row] = '2') then
     sOrderBy := ' 8 Desc Rows 10'
  else if (cbpGroup.Cells[0,cbpGroup.Row] = '3') then
     sOrderBy := ' 6 Desc Rows 5'
  else if (cbpGroup.Cells[0,cbpGroup.Row] = '4') then
     sOrderBy := ' 6 Desc Rows 10';
  }
  sSQL := 'select'
      + sGrpBy1
      + sGrpBy2
      + sKolom
      + ', sum(a.POASD_QTY) as QTY, a.POASD_SAT_CODE as SAT_CODE'
      + ', sum(a.POASD_QTY *(a.POASD_SELL_PRICE_DISC - ((a.POASD_PPN/100)*(a.POASD_SELL_PRICE - (a.POASD_SELL_PRICE - (a.POASD_SELL_PRICE_DISC/(a.POASD_PPN/100+1))) ) ))) as Sales'
      + ' from PO_ASSGROS_DETIL a'
      + ' inner join PO_ASSGROS b on a.POASD_POAS_NO = b.POAS_NO'
      + ' and a.POASD_POAS_UNT_ID = b.POAS_UNT_ID'
//      + ' and b.POAS_UNT_ID = '+ IntToStr(MasterNewUnit.ID)
      + sdate
      + ' inner join barang brg on a.POASD_BRG_CODE = brg.BRG_CODE'
      + ' and brg.BRG_MERCHAN_ID = ' + IntToStr(aMerchan_ID)
      + ' inner join REF$TIPE_BARANG d on brg.BRG_TPBRG_ID = d.TPBRG_ID'
      + ' and d.TPBRG_CODE '+ sTipeBrg
      + ' ( select TPBRG_CODE from REF$TIPE_BARANG'
      + ' where ISPATRACONTRABON = 1'
      + sTipeCode
      + ' )'
      + ' inner join REF$MERCHANDISE g on brg.BRG_MERCHAN_ID=g.MERCHAN_ID '
      + sJoin
      + sFltrKat
      + ' Group By '
      + sGrpBy1
      + sGrpBy2
      + ', a.POASD_SAT_CODE'
      + ' Order By '
      + sOrderBy;

  Result := sSQL;
end;

function TfrmListBigSupplier.getSumSales(var aSalesLast, aSales : Currency):
    Boolean;
var
  SUBG_MERG_ID: Integer;
  sSQL: string;
  _DateFrom, _DateTo: TDateTime;
begin
  //Result    := False;
  _DateFrom := dtTglFrom.Date;
  _DateTo   := dtTglTo.Date;
  sSQL      := '';
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

procedure TfrmListBigSupplier.InisialisasiGrid;
begin
  {with strgGrid do
  begin
    cClearStringGrid(strgGrid, True);
    Clear;
    RowCount  := _rowCount;
    ColCount  := _ColCount;
    FixedRows := _fixedRow;
    FloatingFooter.Visible := True;

    Cells[_Kol_GROUPCode, 0]   := 'MERCHANDISING GROUP CODE';
    Cells[_Kol_GROUPName, 0 ]  := 'NAME';
    Cells[_Kol_SupCode, 0]     := 'SUPPLIER CODE';
    Cells[_Kol_SupName, 0]     := 'SUPPLIERNAME NAME';
    Cells[_Kol_QTY, 0]         := 'Q T Y';
    Cells[_Kol_SALES, 0]      := 'S A L E S';
    Cells[_Kol_TOTALSALES, 0] := '% TOTAL';
    Cells[_Kol_Profit, 0]     := 'PROFIT';
    Cells[_Kol_GP, 0]         := '% G P';
    Cells[_Kol_COGS, 0]       := 'COGS';
    Cells[_Kol_GC, 0]         := '% G COGS';

  end;
  }
end;

procedure TfrmListBigSupplier.SetData(aSql: string; isLast: Boolean = False);
var 
  aSales: Double;
  aCOGS: Double;
  i: Integer;
begin
  {with cOpenQuery(aSql) do
  begin
    try
      while not Eof do
      begin
        for i := strgGrid.FixedRows to strgGrid.RowCount - 1 do
        begin

          try
            if FieldByName('Profit').IsNull then
              aCOGS := 0
            else
              aCOGS := FieldByName('Profit').AsFloat;

            if FieldByName('sales').IsNull then
              aSales := 0
            else
              aSales := FieldByName('sales').AsFloat;

            if strgGrid.Cells[_kolid, i] = FieldByName('SUP_CODE').AsString then
            begin
              if isLast then
              begin
                strgGrid.Floats[_kol_CL, i] := strgGrid.Floats[_kol_CL, i] + aCOGS;
                strgGrid.Floats[_kol_SL, i] := strgGrid.Floats[_kol_SL, i] + aSales;
                strgGrid.Floats[_Kol_QTY, i] := strgGrid.Floats[_Kol_QTY, i] + FieldByName('QTY').AsFloat;
              end
              else
              begin
                strgGrid.Floats[_Kol_COGS, i] := strgGrid.Floats[_Kol_COGS, i] + aCOGS;
                strgGrid.Floats[_Kol_SALES, i] := strgGrid.Floats[_Kol_SALES, i] + aSales;
                strgGrid.Floats[_Kol_QTY, i] := strgGrid.Floats[_Kol_QTY, i] + FieldByName('QTY').AsFloat;
              end;

              Break;
            end;

            if (i = strgGrid.RowCount - 1) then
            begin
              if isLast then
              begin
                strgGrid.Floats[_kol_CL, i] := aCOGS;
                strgGrid.Floats[_kol_SL, i] := aSales;
              end
              else
              begin
                strgGrid.AddRow;
                strgGrid.Cells[_kolid, i]      := FieldByName('SUP_CODE').AsString;

                strgGrid.Cells[_kolSubCode, i]  := FieldByName('SUP_CODE').AsString;
                strgGrid.Cells[_kolSubNm, i]    := FieldByName('SUP_NAME').AsString;
              

                strgGrid.Cells[_Kol_GROUPCode, i]  := FieldByName('MERCHAN_CODE').AsString;
                strgGrid.Cells[_Kol_GROUPName, i]  := FieldByName('MERCHAN_NAME').AsString;
                strgGrid.Cells[_Kol_SupCode, i]   := FieldByName('SUP_CODE').AsString;
                strgGrid.Cells[_Kol_SupName, i]     := FieldByName('SUP_NAME').AsString;

                strgGrid.Floats[_Kol_COGS, i]   := aCOGS;
                strgGrid.Floats[_Kol_SALES, i]  := aSales;
                strgGrid.Floats[_Kol_QTY, i]    := FieldByName('QTY').AsFloat;
                strgGrid.Cells[_kolMerId, i]    := FieldByName('MERCHAN_ID').AsString;
                strgGrid.Cells[_kolMerCode, i]  := FieldByName('MERCHAN_CODE').AsString;
                strgGrid.Cells[_kolMerNm, i]    := FieldByName('MERCHAN_NAME').AsString;

              end;

            end;
          except
//            CommonDlg.ShowError('Err');
          end;
        end;
        Next;
      end;
    finally
      Free;
    end;
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
var
  SS: TStrings;
  i: Integer;
  iGetTick: Integer;
  sSQL: string;
begin
  inherited;

  iGetTick  := GetTickCount;
  SS        :=TStringList.Create;
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
