unit ufrmInvMovementQTY;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, Mask, DB, Vcl.ComCtrls,
  cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxContainer, dxCore, cxDateUtils, Vcl.Menus, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxButtonEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, System.Actions,
  Vcl.ActnList, ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit,
  cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxPC;


type
  TfrmInvMovementQTY = class(TfrmMasterBrowse)
    Label1: TLabel;
    Panel1: TPanel;
    chkMutasi: TCheckBox;
    GroupBox1: TGroupBox;
    rbAll: TRadioButton;
    rbMerchandise: TRadioButton;
    rbPLU: TRadioButton;
    cbpMerchandise: TcxExtLookupComboBox;
    edtMerchandName: TEdit;
    edProductName: TEdit;
    edPLU: TcxButtonEdit;
    Label2: TLabel;
    btnInitialisasi: TButton;
    btnExport: TcxButton;
    Button2: TButton;
    edtPLU: TcxButtonEdit;
    chkAllUnit: TCheckBox;
    cxcolDate: TcxGridDBColumn;
    cxcolPLU: TcxGridDBColumn;
    cxcolBeginning: TcxGridDBColumn;
    cxcolReceiving: TcxGridDBColumn;
    cxcolRetur: TcxGridDBColumn;
    cxcolSalesPOS: TcxGridDBColumn;
    cxcolSalesKRING: TcxGridDBColumn;
    cxcolAdjustmentIN: TcxGridDBColumn;
    cxcolAdjustmentOUT: TcxGridDBColumn;
    cxcolWastage: TcxGridDBColumn;
    cxcolEnding: TcxGridDBColumn;
    procedure actRefreshExecute(Sender: TObject);
    procedure edtPLUClickBtn(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbpMerchandiseChange(Sender: TObject);
    procedure cbpMerchandiseExit(Sender: TObject);
    procedure edPLUExit(Sender: TObject);
    procedure edPLUClickBtn(Sender: TObject);
    procedure btnInitialisasiClick(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure pnlPageClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
  private
    dtEOD       : TDateTime;
    dtEODLast   : TDateTime;
    FIsStop     : Boolean;
    aPage       : Integer;
//    aCreatePage : Boolean;
    aPageView   : Integer;
    nLoop       : Integer;
    procedure CreatePage;
    procedure DeleteNavigator(aNext: Boolean = False);
    procedure OnNextClick(Sender: TObject);
    procedure OnPrevClick(Sender: TObject);
//    function GetSQLMutasi: string;
//    procedure IsiEnding;
//    procedure LoadDataMuasi;
    procedure ParseComboMerchanGroup;
    procedure RemoveNav;
    procedure SetDataToGrid;
//    procedure DelTemp(TickCount: string);
    { Private declarations }
  public
    function GetSqlInvMov: string;
    procedure IsiBegining;
    procedure IsiTotalBawah;
    procedure SetUpHeaderSGData;
    property IsStop: Boolean read FIsStop write FIsStop;
    { Public declarations }
  end;

var
  frmInvMovementQTY: TfrmInvMovementQTY;

implementation

uses
  uRetnoUnit, Math, StrUtils, dateutils, udmReport, uAppUtils, uTSCommonDlg;

const
  _KolNO                  : Integer = 0;
  _KolTgl                 : Integer = 1;
  _KolPLU                 : Integer = 2;
  _KolNmPLU               : Integer = 3;
  _KolUOM                 : integer = 4;
  _KolBarcode             : Integer = 5;

  _KolBeginning           : Integer = 6;
  _KolBeginning_RP        : Integer = 7;
  _KolReceiving           : Integer = 8;
  _KolReceiving_RP        : Integer = 9;
  _KolReturSupplier       : Integer = 10;
  _KolReturSupplier_RP    : Integer = 11;
  _kolMutasi              : Integer = 12;
  _kolMutasi_Rp           : Integer = 13;
  _KolSalesPOS            : Integer = 14;
  _KolSalesPOS_RP         : Integer = 15;
  _KolSalesKring          : Integer = 16;
  _KolSalesKring_RP       : Integer = 17;
  _KolAdjustmentPlus      : Integer = 18;
  _KolAdjustmentPlus_RP   : Integer = 19;
  _KolAdjustmentMinus     : Integer = 20;
  _KolAdjustmentMinus_RP  : Integer = 21;
  _KolWastage             : Integer = 22;
  _KolWastage_RP          : Integer = 23;
  _KolEnding              : Integer = 24;
  _KolEnding_RP           : Integer = 25;

  _sMutasi    : string = 'MS';
  _MaxRecord  : Integer = 20;
  _MaxPage    : Integer = 10;

{$R *.dfm}

procedure TfrmInvMovementQTY.actRefreshExecute(Sender: TObject);
var
  i: Integer;
  aCount: Integer;
  sSQL: string;
  aPnlPage  : TPanel;
begin
  inherited;
  RemoveNav;
  for i:= 0 to nLoop do
  begin
    aPnlPage := FindComponent('pnl' + IntToStr(i)) as TPanel;
    if aPnlPage <> nil then
    begin
      aPnlPage.Visible := False;
    end;
  end;

  if btnSearch.Tag = 1 then
  begin
    IsStop := True;
    btnSearch.Tag := 0;
    btnSearch.Caption := 'Refresh';
    Exit;
  end;

  aPageView   := 1;


  //hitung smua record
  sSQL := 'select count(*) from tinventorymovementqty a'
        + ' where a.tanggal between ' + TAppUtils.QuotD(dtAwalFilter.Date)
        + ' and ' + TAppUtils.QuotD(dtAkhirFilter.Date);
  if not chkAllUnit.Checked then
     sSQL := sSQL + ' and a.unit_id = ' + IntToStr(MasterNewUnit);
  {
  with cOpenQuery(sSQL)do
  begin
    try
      aCount := Fields[0].AsInteger;
    finally
      free;
    end;
  end;
  }
  nLoop := aCount div _MaxRecord;
  if nLoop > 0 then
  begin
    if (aCount mod _MaxRecord ) > 0 then
      nLoop := nLoop + 1;
  end;

  CreatePage;
  if nLoop > 1 then
    pnlPageClick(FindComponent('pnl' + IntToStr(1)) as TPanel)
  else
  begin
    aPage := 1;
    SetDataToGrid;
  end;


end;

procedure TfrmInvMovementQTY.edtPLUClickBtn(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL:= 'SELECT b.BRG_CODE as PLU, b.BRG_ALIAS as "NAMA BARANG", '
    + ' C.BHJ_SAT_CODE AS UOM, '
    + ' c.BHJ_SELL_PRICE AS "HARGA JUAL" ' //, c.BHJ_DISC_NOMINAL, c.BHJ_SELL_PRICE_DISC '
    + ' FROM BARANG B, BARANG_HARGA_JUAL C '
    + ' WHERE C.BHJ_TPHRG_ID = 2 '
    + ' AND C.BHJ_TPHRG_UNT_ID = ' + IntToStr(MasterNewUnit)
    + ' AND C.BHJ_BRG_CODE = B.BRG_CODE '
    + ' ';
  {
  with cLookUp('DAFTAR BARANG', sSQL, 999, 0) do
  begin
    try
      if Strings[0] <> '' then
      begin
        edtPLU.Text := Strings[0];
        //IsiRow(Strings[0],ARow);
      end;
    finally
    	// free resources
      Free;
    end;  // try/finally
  end;
  }
end;

procedure TfrmInvMovementQTY.btnExportClick(Sender: TObject);
begin
  inherited;
//  if Floor(dtEOD) > Floor(cGetServerTime) then
  begin
    CommonDlg.ShowMessage('Terakhir EOD Tanggal '+ FormatDateTime('DD-MM-YYYY', dtEOD) );
    Exit;
  end;


  {
  with TInventoryMovementQTY.CreateWithUser(Self,FLoginId,MasterNewUnit.ID) do
  begin   
    try
      if not SaveAllJenisTransaksi(GetSqlInvMov, MasterNewUnit.ID, dtEOD) then
      begin
        CommonDlg.ShowError('Gagal Simpan Data');
        exit;
      end;
    finally   
      Free;
    end;
  end;
  }
end;

procedure TfrmInvMovementQTY.ParseComboMerchanGroup;
var
  sSQL: string;
begin
  {cbpMerchandise.ClearGridData;
  cbpMerchandise.AddRow(['Merchan ID', 'Merchandise Code', 'Merchandise Name']);
  cbpMerchandise.FixedRows := 1;
  sSQL := 'select * '
    + 'from ref$merchandise '
    + ' order by merchan_code asc'; 
  with cOpenQuery(sSQL) do
  begin
    try
      if not Eof then
      begin
        Last;
        cbpMerchandise.RowCount := RecordCount + 1;
        First;
      end
      else
      begin
        cbpMerchandise.RowCount := 2;
      end;  

      while not eof do
      begin
        cbpMerchandise.AddRow([
          FieldByName('MERCHAN_ID').AsString,
          FieldByName('MERCHAN_CODE').AsString,
          FieldByName('MERCHAN_NAME').AsString]);
        Next;
      end;
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmInvMovementQTY.FormShow(Sender: TObject);
begin
  inherited;
  SetUpHeaderSGData;
  ParseComboMerchanGroup;

  dtAwalFilter.Date := GetLastEODDate(MasterNewUnit) + 1;
//  dtAkhirFilter.Date     := cGetServerTime;
  if FMasterIsStore=0 then
  begin
     chkAllUnit.Enabled := True;
     btnInitialisasi.Enabled := not chkAllUnit.Enabled;
  end;

end;

procedure TfrmInvMovementQTY.cbpMerchandiseChange(Sender: TObject);
begin
  inherited;
  edtMerchandName.Clear;
//  if cbpMerchandise.Row > 0 then
//    edtMerchandName.Text := cbpMerchandise.Cells[2,cbpMerchandise.Row];
end;

procedure TfrmInvMovementQTY.cbpMerchandiseExit(Sender: TObject);
begin
  inherited;
  if cbpMerchandise.Text = '' then edtMerchandName.Clear;

end;

procedure TfrmInvMovementQTY.edPLUExit(Sender: TObject);
begin
  inherited;
  edProductName.Clear;
  {with TNewBarang.Create(Self) do
  begin
    if LoadByKode(edPLU.Text) then
    begin
      edProductName.Text := Nama;
    end;  
  end;    // with
  }
end;

procedure TfrmInvMovementQTY.edPLUClickBtn(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := 'select brg_code as PLU, brg_alias as nama '
    + 'from barang ';
  {
  with cLookUp('DAFTAR BARANG',sSQL) do
  begin
    try
      if Strings[0] <> '' then
      begin
        edPLU.Text := Strings[0];
        edPLUExit(edPLU);
      end;  
    finally
      Free;
    end;
  end;    // with
  }
end;

procedure TfrmInvMovementQTY.btnInitialisasiClick(Sender: TObject);
var
  dtGetLastEOd: TDateTime;
  sSQL: string;
begin
  inherited;
  {try
    sSQL := 'delete from TINVENTORYMOVEMENTQTY where UNIT_ID=' + IntToStr(MasterNewUnit.ID);
    cExecSQL(sSQL, False,12345);
    SimpanBlob(sSQL, 12345);

    cCommitTrans;
  finally
    cRollbackTrans;
  end;
  }

  dtGetLastEOd  := GetLastEODDate(MasterNewUnit);
  dtEOD         := StartOfAMonth(YearOf(dtGetLastEOd),1);
  dtEODLast     := dtGetLastEOd + 1;

  cShowWaitWindow('Calculating inventory movement');
  try
    while Floor(dtEOD) < Floor(dtEODLast) do
    begin
      dtAwalFilter.Date := dtEOD;
      btnExportClick(nil);
      dtEOD := dtEOD + 1;
    end;
  finally
    dtAwalFilter.Date := StartOfAMonth(YearOf(dtGetLastEOd),1);

    cCloseWaitWindow;
  end;

end;

procedure TfrmInvMovementQTY.IsiBegining;
var
  IsFound: Boolean;
//  Q: TFDQuery;
  i : Integer;
begin
  {Q := GetObjectQueryBegining(MasterNewUnit.ID, dtmTanggal.Date);
  try
    for i := sgData.FixedRows to sgData.RowCount - 1 do
    begin
      sgData.Floats[_KolBeginning,i]    := 0;
      sgData.Floats[_KolBeginning_RP,i] := 0;

      Q.First;
      IsFound := False;
      while (not Q.Eof) and (not IsFound) do
      begin
        if sgData.Cells[_KolPLU,i] = Q.FieldByName('brg_code').asString then
        begin
          sgData.Floats[_KolBeginning,i]    := Q.FieldByName('ending').asFloat;
          sgData.Floats[_KolBeginning_RP,i] := Q.FieldByName('ending_rp').asFloat;
          Break;
        end;

        Q.Next;
      end;

    end;
  finally
    Q.Free;
  end;
  }
end;



procedure TfrmInvMovementQTY.SetUpHeaderSGData;
begin
  {with sgData Do
  begin
    MergeCells(0,0,1,2);
    Cells[_KolNO,0] := 'No';

    MergeCells(_KolTgl,0,1,2);
    Cells[_KolPLU,0] := 'PLU';

    MergeCells(_KolPLU,0,1,2);
    Cells[_KolPLU,0] := 'PLU';

    MergeCells(_KolUOM,0,1,2);
    Cells[_KolUOM,0] := 'UOM';

    MergeCells(_KolNmPLU,0,1,2);
    Cells[_KolNmPLU,0] := 'Nama';

    MergeCells(_KolBarcode,0,1,2);
    Cells[_KolBarcode,0] := 'Barcode';

    MergeCells(_KolBeginning,0,2,1);
    Cells[_KolBeginning,0]          := 'Beginning';
    Cells[_KolBeginning,1]          := 'Qty';
    Cells[_KolBeginning_RP,1]       := 'Rp';

    MergeCells(_KolReceiving,0,2,1);
    Cells[_KolReceiving,0]          := 'Receiving';
    Cells[_KolReceiving,1]          := 'Qty';
    Cells[_KolReceiving_RP,1]       := 'Rp';

    MergeCells(_KolReturSupplier,0,2,1);
    Cells[_KolReturSupplier,0]      := 'Ret Supplier';
    Cells[_KolReturSupplier,1]      := 'Qty';
    Cells[_KolReturSupplier_RP,1]   := 'Rp';

    MergeCells(_kolMutasi,0,2,1);
    Cells[_kolMutasi,0]             := 'Mutasi';
    Cells[_kolMutasi,1]             := 'Qty';
    Cells[_kolMutasi_RP,1]          := 'Rp';

    MergeCells(_KolSalesPOS,0,2,1);
    Cells[_KolSalesPOS,0]           := 'POS';
    Cells[_KolSalesPOS,1]           := 'Qty';
    Cells[_KolSalesPOS_RP,1]        := 'Rp';

    MergeCells(_KolSalesKring,0,2,1);
    Cells[_KolSalesKring,0]         := 'Kring';
    Cells[_KolSalesKring,1]         := 'Qty';
    Cells[_KolSalesKring_RP,1]      := 'Rp';

    MergeCells(_KolAdjustmentPlus,0,2,1);
    Cells[_KolAdjustmentPlus,0]     := 'Adj Plus';
    Cells[_KolAdjustmentPlus,1]     := 'Qty';
    Cells[_KolAdjustmentPlus_RP,1]  := 'Rp';

    MergeCells(_KolAdjustmentMinus,0,2,1);
    Cells[_KolAdjustmentMinus,0]    := 'Adj Minus';
    Cells[_KolAdjustmentMinus,1]    := 'Qty';
    Cells[_KolAdjustmentMinus_RP,1] := 'Rp';

    MergeCells(_KolWastage,0,2,1);
    Cells[_KolWastage,0]            := 'Wastage';
    Cells[_KolWastage,1]            := 'Qty';
    Cells[_KolWastage_RP,1]         := 'Rp';

    MergeCells(_KolEnding,0,2,1);
    Cells[_KolEnding,0]             := 'Ending';
    Cells[_KolEnding,1]             := 'Qty';
    Cells[_KolEnding_RP,1]          := 'Rp';

  end;
  }
end;

procedure TfrmInvMovementQTY.edtSearchChange(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  {for i := sgData.FixedRows to sgData.RowCount - 1 do
  begin
    if Pos(edtSearch.Text, sgData.Cells[_KolPLU,i]) > 0 then
    begin
      sgData.Row := i;
      sgData.Col := _KolPLU;
      Exit;
    end
  end;
  }
end;

procedure TfrmInvMovementQTY.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action            := caFree;
  frmInvMovementQTY := nil;
end;

procedure TfrmInvMovementQTY.IsiTotalBawah;
var
  i: Integer;
begin
//  for i := _KolBeginning to _KolEnding_RP do
//    sgData.Floats[i,sgData.RowCount - 1] := sgData.ColumnSum(i,sgData.FixedRows, sgData.RowCount - sgData.FixedRows);
end;

procedure TfrmInvMovementQTY.Button2Click(Sender: TObject);
var
  iMiliSecondAwal: Integer;
  iMiliSecondAkhir: Integer;
begin
  inherited;
  {
  try

    while dtAwalFilter.Date < cGetServerTime do
    begin

      iMiliSecondAwal := GetTickCount;


      if DoEOD(dtmTanggal.Date,MasterNewUnit.ID,FLoginId) then
      begin
        cCommitTrans;

        dtmTanggal.Date := GetLastEODDate(MasterNewUnit.ID) + 1;
        iMiliSecondAkhir := GetTickCount;
        edProductName.Text :=  'Waktu : [' + FloatToStr((iMiliSecondAkhir - iMiliSecondAwal) / 1000) + ' Detik ]';
      end else begin
        cRollbackTrans;
      end;

      dtmTanggal.Date := GetLastEODDate(MasterNewUnit.ID) + 1
    end;
  finally
    cRollbackTrans;
  end;
   }
end;

function TfrmInvMovementQTY.GetSqlInvMov: string;
var
  sFltr: string;
  sQL: string;
  sMutsi: string;
begin
  if rbMerchandise.Checked then
  begin
//    sFltr := ' and c.BRG_MERCHANGRUP_ID =' + QuotedStr(cbpMerchandise.Cells[0, cbpMerchandise.Row]);
  end
  else if rbPLU.Checked then
  begin
//    sFltr := ' and c.BRG_CODE = '+ QuotedStr(edPLU.Text);
  end
  else if rbAll.Checked then
  begin
    sFltr := '';
  end;    


  if chkMutasi.Checked then
  begin
    sMutsi  := ' and a.BSS_BRG_CODE in (select distinct aa.MSD_BRG_CODE'
            + ' from MUTASI_STOK_DETIL aa'
            + ' and a.BSS_TYPE = '+ QuotedStr(_sMutasi);
  end;

  sQL := 'select a.BSS_BRG_CODE, a.BSS_TYPE,'
    + ' sum(a.BSS_QTY * B.KONVSAT_SCALE) as QTY,'
    + ' sum(a.BSS_QTY * a.BSS_HARGA_TRANSAKSI) as RUPIAH'
    + ' from BARANG_STOK_SIRKULASI a'
    + ' inner join REF$KONVERSI_SATUAN B on A.BSS_BRG_CODE = B.KONVSAT_BRG_CODE'
    + ' AND B.KONVSAT_SAT_CODE_FROM = A.BSS_SAT_CODE'
    + ' inner join barang c on a.BSS_BRG_CODE = c.BRG_CODE'
    + sMutsi
    + sFltr
    + ' and a.bss_date between '+ TAppUtils.QuotD(dtAwalFilter.Date)
    + ' and '+ TAppUtils.QuotD(dtAkhirFilter.Date, True)
    + ' and a.ISBONUSFORBONUS = 0'
    + ' and a.BSS_UNT_ID = '+ IntToStr(MasterNewUnit)
    + ' group by a.BSS_BRG_CODE, a.BSS_TYPE';

  Result := sQL;
end;

procedure TfrmInvMovementQTY.pnlPageClick(Sender: TObject);
var
  aDelta: Integer;
  aNextPage: Integer;
  i: Integer;
  t: Integer;
begin
  inherited;

  t := (Sender as TPanel).Tag ;

  aNextPage :=  aPageView * _MaxPage;

  aDelta   := 1 + (aPageView - 1) * _MaxPage;
  if aNextPage >= nLoop then
    aNextPage := nLoop;

  for i := aDelta to aNextPage do
  begin
    with FindComponent('pnl' + IntToStr(i)) as TPanel do
    begin
      if Tag = t then
        Color := clGreen
      else
        Color := clInfoBk;
    end;
  end;


  aPage := t;
  SetDataToGrid;

end;

procedure TfrmInvMovementQTY.btnNextClick(Sender: TObject);
begin
  inherited;
  if aPage mod _MaxPage = 0 then
  begin
    CreatePage;
  end
  else
  begin
    if aPage < nLoop then
    begin
      Inc(aPage);
      SetDataToGrid;
    end

  end;
end;

procedure TfrmInvMovementQTY.CreatePage;
var
  m: Integer;
  aPageCur: Integer;
  aDelta: Integer;
  aNextPage: Integer;
  i        : Integer;
  aPnlPage : TPanel;
begin
  {

  aNextPage :=  aPageView * _MaxPage;

  aDelta   := 1 + (aPageView - 1) * _MaxPage;
  if aNextPage >= nLoop then
    aNextPage := nLoop;


  aPageCur := (aPageView - 1) * _MaxPage;
  m := 0;

    for i := aDelta to aNextPage do
    begin
      aPnlPage          := FindComponent('pnl' + IntToStr(i)) as TPanel;

      if not assigned(aPnlPage) then
        aPnlPage          := TPanel.Create(self);

      aPnlPage.Name       := 'pnl'+ IntToStr(i);
      aPnlPage.Caption    := IntToStr(i);
      aPnlPage.Top        := pnlPage.Top;
      aPnlPage.Left       := pnlPage.Left  + ( (i - aPageCur)  * (10 + pnlPage.Width )) ;
      aPnlPage.Width      := pnlPage.Width;
      aPnlPage.Height     := pnlPage.Height;
      aPnlPage.Parent     := pnlHeaderData;
      aPnlPage.Visible    := True;
      aPnlPage.Tag        := i ;
      aPnlPage.OnClick    := pnlPageClick;
      if i = aNextPage then
        m := i + 1;
    end;

  if aNextPage >= _MaxPage then
  begin
      aPnlPage  := FindComponent('pnlPrev') as TPanel;
      if not assigned(aPnlPage) then
        aPnlPage := TPanel.Create(self);

      aPnlPage.Name     := 'pnlPrev';
      aPnlPage.Caption  := '<<';
      aPnlPage.Top      := pnlPage.Top;
      aPnlPage.Left     := pnlPage.Left  + ( 0  * (10 + pnlPage.Width )) ;
      aPnlPage.Width    := pnlPage.Width;
      aPnlPage.Height   := pnlPage.Height;
      aPnlPage.Parent   := pnlHeaderData;
      aPnlPage.Visible  := True;
      aPnlPage.OnClick  := OnPrevClick;
  //    aPnlPage.OnMouseMove:= onNavMouseMove;

      aPnlPage  := FindComponent('pnlNext') as TPanel;
      if not assigned(aPnlPage) then
        aPnlPage := TPanel.Create(self);

      aPnlPage.Name     := 'pnlNext';
      aPnlPage.Caption  := '>>';
      aPnlPage.Top      := pnlPage.Top;
      aPnlPage.Left     := pnlPage.Left  + ((m - aPageCur) * (10 + pnlPage.Width )) ;
      aPnlPage.Width    := pnlPage.Width;
      aPnlPage.Height   := pnlPage.Height;
      aPnlPage.Parent   := pnlHeaderData;
      aPnlPage.Visible  := True;
      aPnlPage.OnClick  := OnNextClick;
  end;
   }
end;

procedure TfrmInvMovementQTY.DeleteNavigator(aNext: Boolean = False);
var
  aDelta: Integer;
  i: Integer;
  aNextPage: Integer;
  aPnlPage: TPanel;
begin

  aNextPage :=  aPageView * _MaxPage;

  aDelta   := 1 + (aPageView - 1) * _MaxPage;
  if aNextPage >= nLoop then
    aNextPage := nLoop;

    RemoveNav;

    for i := aDelta to aNextPage  do
    begin
      aPnlPage := FindComponent('pnl' + IntToStr(i)) as TPanel;
      if aPnlPage <> nil then
      begin
        aPnlPage.Visible := False;
      end;
    end;
end;

procedure TfrmInvMovementQTY.OnNextClick(Sender: TObject);
begin
    DeleteNavigator;
    Inc(aPageView);
    CreatePage;
    pnlPageClick(FindComponent('pnl' + IntToStr((aPageView - 1) * _MaxPage + 1 )) as TPanel);

end;

procedure TfrmInvMovementQTY.OnPrevClick(Sender: TObject);
begin
  if aPageView > 1 then
  begin
    DeleteNavigator(True);
    Inc(aPageView, -1);
    CreatePage;
    pnlPageClick(FindComponent('pnl' + IntToStr(aPageView  * _MaxPage )) as TPanel);
  end;
end;

procedure TfrmInvMovementQTY.RemoveNav;
var
  aPnlPage: TPanel;
begin
      aPnlPage := FindComponent('pnlPrev') as TPanel;
      if aPnlPage <> nil then
      begin
        aPnlPage.Visible := False;
      end;
  
      aPnlPage := FindComponent('pnlNext') as TPanel;
      if aPnlPage <> nil then
      begin
        aPnlPage.Visible := False;
      end;
end;

procedure TfrmInvMovementQTY.SetDataToGrid;
var
  sSQL: string;
begin
  sSQL := 'select a.tanggal, a.brg_code as Code,b.BRG_ALIAS as Name,'
          + ' b.BRG_SAT_CODE_STOCK as UOM, b.brg_catalog as Catalog, '
          + ' a.beginning,a.beginning_rp, a.receiving,a.receiving_rp,'
          + ' a.retursupplier,a.retursupplier_rp, a.mutasi, a.mutasi_rp,'
          + ' a.saleskring,a.saleskring_rp,'
          + ' a.SALESPOS, a.SALESPOS_rp, a.adjustmentplus,a.adjustmentplus_rp, a.adjustmentminus,a.adjustmentminus_rp,'
          + ' a.wastage,a.wastage_rp, a.ending, a.ending_rp'
          + ' from tinventorymovementqty a, barang b'
          + ' where a.brg_code = b.brg_code'
          + ' and a.tanggal between ' + TAppUtils.QuotD(dtAwalFilter.Date) + ' and ' + TAppUtils.QuotD(dtAkhirFilter.Date);
  if not chkAllUnit.Checked then
     sSQL := sSQL + ' and a.unit_id = ' + IntToStr(MasterNewUnit);

  sSQL := sSQL + ' rows '+ IntToStr(_MaxRecord * (aPage - 1) + 1)  + ' to '+ IntToStr(_MaxRecord * aPage );
  
//  cQueryToGrid(sSQL, sgData);
//  SetUpHeaderSGData;
//  sgData.AutoSizeColumns(True, 10);
end;

end.
