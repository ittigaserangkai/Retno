unit ufrmStokBarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  dxCore, cxDateUtils, Vcl.Menus, System.Actions, Vcl.ActnList,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  Vcl.ComCtrls, cxButtonEdit;

type
  TfrmStokBarang = class(TfrmMasterBrowse)
    Panel2: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    edtKodeSup: TcxButtonEdit;
    edtKodeBrg: TcxButtonEdit;
    edtNamaSuplier: TEdit;
    edtNamaBrg: TEdit;
    chkSupplier: TCheckBox;
    chkBarang: TCheckBox;
    lbl3: TLabel;
    cbbTipe: TComboBox;
    chkTipe: TCheckBox;
    grp1: TGroupBox;
    chkPODetail: TCheckBox;
    chkHargaJual: TCheckBox;
    chk1: TCheckBox;
    procedure actRefreshExecute(Sender: TObject);
    procedure edtKodeSupKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtKodeBrgKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure sgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    function GetStock(aKodeBrg:String; aUnitID : Integer): Double;
    procedure ParseHeaderGrid;
    { Private declarations }
  public
    function GetHargaJual(aKodeBrg:String; aUnitID : Integer): Double;
    procedure GetPODetil(aKodeBrg:String;aUnitID: Integer; iRow:Integer);
    { Public declarations }
  end;

var
  frmStokBarang: TfrmStokBarang;

implementation

uses uRetnoUnit,  uConstanta, uTSCommonDlg, uAppUtils, DateUtils;

const
  _KolNo            : Integer = 0;
  _KolKodeBarang    : Integer = 1;
  _KolNamaBarang    : Integer = 2;
  _KolKodeSuplier   : Integer = 3;
  _KolQTY           : Integer = 4;
  _KolLastPO        : Integer = 5;
  _KolPriceBuyPO    : Integer = 6;
  _KolValdDatePO    : Integer = 7;
  _KolLastPrice     : Integer = 8;

{$R *.dfm}

procedure TfrmStokBarang.actRefreshExecute(Sender: TObject);
var
  n: Integer;
  i: Integer;
  sSQL: string;
  sFilterSupplier,sFilterTipe: string;
  sFilterBarang: string;
  akdbrg : string;
  anmbrg : string;
  akodesup : string;
  aqty :  string;
begin
  inherited;
  ParseHeaderGrid;
  if (edtKodeSup.Text = '') and (not chkSupplier.Checked) then
  begin
    CommonDlg.ShowError('Supplier Belum Dipilih');
    edtKodeSup.SetFocus;
    Exit;
  end;

  if edtKodeBrg.Text = '' then
  begin
    if not chkBarang.Checked then
    begin
      CommonDlg.ShowError('Kode Barang Belum Dipilih');
      edtKodeBrg.SetFocus;
      Exit;
    end;
  end;


  try
    FormatSettings.DateSeparator:= '/';
    FormatSettings.ShortDateFormat:= 'mm/dd/yyyy';

    sFilterSupplier := '';
    if not chkSupplier.Checked then
    begin
      sFilterSupplier := ' AND UPPER(BS.BRGSUP_SUP_CODE) LIKE UPPER(' + QuotedStr(edtKodeSup.Text) + ')';
    end;

    sFilterBarang := '';
    if not chkBarang.Checked then
    begin
      sFilterBarang := ' AND B.BRG_CODE = ' + QuotedStr(edtKodeBrg.Text) ;

    end;

  if chkTipe.Checked then
  sFilterTipe := ''
  else
  sFilterTipe := ' AND RTB.TPBRG_NAME = ' + QuotedStr(cbbTipe.Text) ;

    cShowWaitWindow();
    sSQL := 'select B.BRG_CODE,B.BRG_ALIAS,BS.BRGSUP_SUP_CODE '
        + ' from BARANG B '
        + ' Inner Join BARANG_SUPLIER BS on B.BRG_CODE = BS.BRGSUP_BRG_CODE '
        + ' Inner Join SUPLIER S On BS.BRGSUP_SUP_CODE = S.SUP_CODE '
        + ' Inner Join REF$TIPE_BARANG RTB on B.BRG_TPBRG_ID = RTB.TPBRG_ID '
        + sFilterSupplier
        + sFilterBarang
        + sFilterTipe
        + ' Order By B.BRG_CODE Asc';

    i     := 0;
    {
    with cOpenQuery(sSQL) do
    begin
      try
        while not Eof do
        begin
          if i > 0 then
            sgGrid.AddRow;

          n := i + sgGrid.FixedRows;
          sgGrid.Cells[_kolNO, n]          := IntToStr(i+1);
          akdbrg    := FieldByName('BRG_CODE').AsString;
          anmbrg    := FieldByName('BRG_ALIAS').AsString;
          akodesup  := FieldByName('BRGSUP_SUP_CODE').AsString;
          aqty      := FloatToStr(GetStock(sgGrid.Cells[_KolKodeBarang,n],MasterNewUnit.ID));
          sgGrid.Cells[_KolKodeBarang, n]  := akdbrg;
          sgGrid.Cells[_KolNamaBarang, n]  := anmbrg;
          sgGrid.Cells[_KolKodeSuplier, n] := akodesup;
          sgGrid.Cells[_KolQTY, n]         := aqty;
          if chkPODetail.Checked then
             GetPODetil(FieldByName('BRG_CODE').AsString,MasterNewUnit.ID,n);
          if chkHargaJual.Checked then
             sgGrid.Cells[_KolLastPrice, n]   := FloatToStr(GetHargaJual(FieldByName('BRG_CODE').AsString, MasterNewUnit.ID));
          Inc(i);
          Next;
        end;
      finally
        Free;
        sgGrid.AutoSize := True;
      end;
    end;
    }

  finally
    cCloseWaitWindow;
  end;

end;

function TfrmStokBarang.GetStock(aKodeBrg:String; aUnitID : Integer): Double;
var
  ssQL      : string;
  dtAwal    : TDateTime;
  dtAkhir   : TDateTime;
begin
//  dtAwal  := StartOfAMonth(YearOf(cGetServerTime), MonthOf(cGetServerTime));
  dtAkhir := EndOfTheMonth(dtAwal);
  sSQL := 'select SUM(QTY) from SP_KARTOK(' + QuotedStr(aKodeBrg)
                  + ',' + IntToStr(aUnitID) + ',' + TAppUtils.QuotD(dtAwal) + ','
                  + TAppUtils.QuotD(dtAkhir) + ')'
                  + ' where ISBONUSFORBONUS = 0';
  {
  with cOpenQuery(ssQL) do
  begin
    try
      Result   := Fields[0].AsFloat;
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmStokBarang.edtKodeSupKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sSQL: string;
begin
  inherited;
  if (Key = VK_F5) then
  begin
  sSQL := 'select sup_code as Kode,sup_name as Nama'
            + ' from suplier';
  {
  with cLookUp('Daftar Supplier', sSQL) do
  begin
    try
      if Strings[0] = '' then
        Exit
      else
      begin
        edtKodeSup.Text      := Strings[0];
        edtNamaSuplier.Text  := Strings[1];
        edtKodeBrg.Text      := '';
        edtNamaBrg.Text      := '';
        ParseHeaderGrid; 
      end;

    finally
      Free;
    end;
  end;
  }
  end
end;

procedure TfrmStokBarang.edtKodeBrgKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sFilterSup,sFilterTipe: string;
  sSQL: string;
begin
  inherited;
  if (Key = VK_F5) then
  begin
  if chkSupplier.Checked then
  sFilterSup := ''
  else
  sFilterSup := ' AND BS.BRGSUP_SUP_CODE = ' + QuotedStr(edtKodeSup.Text);

  if chkTipe.Checked then
  sFilterTipe := ''
  else
  sFilterTipe := ' AND RTB.TPBRG_NAME = ' + QuotedStr(cbbTipe.Text);

  sSQL := 'select B.BRG_CODE,B.BRG_ALIAS, RTB.TPBRG_NAME, BS.BRGSUP_SUP_CODE '
        + ' from BARANG B '
        + ' Inner Join BARANG_SUPLIER BS on B.BRG_CODE = BS.BRGSUP_BRG_CODE '
        + ' Inner Join REF$TIPE_BARANG RTB on B.BRG_TPBRG_ID = RTB.TPBRG_ID '
        + sFilterSup
        + sFilterTipe;
  {
  with cLookUp('Daftar Barang', sSQL) do
  begin
    try
      if Strings[0] = '' then
        Exit
      else
      begin
        edtKodeBrg.Text      := Strings[0];
        edtNamaBrg.Text      := Strings[1];
        ParseHeaderGrid;
      end;

    finally
      Free;
    end;
  end;
  }
  end
end;

procedure TfrmStokBarang.ParseHeaderGrid;
begin
  {with sgGrid do
  begin
    Clear;
    Cells[_KolNo, 0]              := 'NO';
    Cells[_KolKodeBarang, 0]      := 'Kode Barang';
    Cells[_KolNamaBarang, 0]      := 'Nama Barang';
    Cells[_KolKodeSuplier, 0]     := 'Kode Sup';
    Cells[_KolQTY, 0]             := 'QTY';
    Cells[_KolLastPO,0]           := 'Last PO';
    Cells[_KolPriceBuyPO,0]       := 'Price PO';
    Cells[_KolValdDatePO,0]       := 'Valid Date PO';
    Cells[_KolLastPrice,0]        := 'Sell Price';

    RowCount  := 2;
    FixedRows := 1;
    ColCount  := 9;
    AutoSize  := True;

  end;
  ClearAdvStringGrid(sgGrid);
  }
end;

procedure TfrmStokBarang.FormShow(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := 'Select TPBRG_NAME from REF$TIPE_BARANG ';
//  cQueryToCombo(cbbTipe,sSQL);
  ParseHeaderGrid;
end;

function TfrmStokBarang.GetHargaJual(aKodeBrg:String; aUnitID : Integer):
    Double;
var
  sSQL: string;
begin
  sSQL := 'Select (KONVSAT_SCALE*BHJ_SELL_PRICE) as Price'
        + ' From Barang B '
        + ' Left Join BARANG_HARGA_JUAL BHJ on B.BRG_CODE = BHJ.BHJ_BRG_CODE '
        + ' Left Join REF$KONVERSI_SATUAN RKS on BHJ.BHJ_SAT_CODE = RKS.KONVSAT_SAT_CODE_FROM'
        + ' Where B.BRG_CODE='+QuotedStr(aKodeBrg);
  {with cOpenQuery(sSQL) do
  begin
    try
      if not Eof then
      begin
        Result := fieldbyname('Price').AsFloat;
      end
      else
      begin 
        Result := 0;
      end

    finally
      Free;
    end;
  end;

  }
end;

procedure TfrmStokBarang.GetPODetil(aKodeBrg:String;aUnitID: Integer;
    iRow:Integer);
var
  sSQL: string;
begin
  sSQL := 'select B.BRG_CODE,B.BRG_ALIAS,PO.PO_NO,PO.PO_VALID_DATE,(POD.POD_TOTAL*RKS.KONVSAT_SCALE) as POD_TOTAL'
        + ' from BARANG B'
        + ' Inner Join PO_DETIL POD on B.BRG_CODE = POD.POD_BRG_CODE'
        + ' Inner Join PO PO On POD.POD_PO_NO = PO.PO_NO'
        + ' And POD.POD_PO_UNT_ID = PO.PO_UNT_ID '
        + ' And B.Brg_Code = '+QuotedStr(aKodeBrg)
        + ' Inner Join REF$KONVERSI_SATUAN RKS On RKS.KONVSAT_BRG_CODE = POD.POD_BRG_CODE '
        + ' AND RKS.KONVSAT_SAT_CODE_FROM = POD.POD_SAT_CODE_ORDER '
        + ' order by PO.DATE_MODIFY Desc';
  {
  with cOpenQuery(sSQL) do
  begin
    try
      if not Eof then
      begin
        sgGrid.Cells[_KolLastPO,iRow]    := fieldbyname('PO_NO').AsString;
        sgGrid.Cells[_KolPriceBuyPO,iRow]:= FloatToStr(fieldbyname('POD_TOTAL').AsFloat);
        sgGrid.Cells[_KolValdDatePO,iRow]:= fieldbyname('PO_VALID_DATE').AsString;
      end
      else
      begin
        sgGrid.Cells[_KolLastPO,iRow]    := '';
        sgGrid.Cells[_KolPriceBuyPO,iRow]:= '0';
        sgGrid.Cells[_KolValdDatePO,iRow]:= '';
      end

    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmStokBarang.sgGridGetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  FloatFormat := '%.2n';
  if (ACol in [_KolQTY,_KolPriceBuyPO,_KolLastPrice]) and (ARow <> 0) then
  IsFloat := True
  else
  IsFloat := False;
end;

procedure TfrmStokBarang.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action  := caFree;
end;

procedure TfrmStokBarang.FormDestroy(Sender: TObject);
begin
  inherited;
  frmStokBarang := nil;
end;

end.


