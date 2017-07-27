unit ufrmKartuStock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterReport, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxControls, cxContainer,
  cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxCheckBox, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, cxTextEdit, cxMaskEdit,
  cxCalendar, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxClasses, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridCustomView, cxGridLevel, cxGrid, Data.DB,
  cxDBData, cxGridDBBandedTableView, cxCurrencyEdit, Datasnap.DBClient,
  cxButtonEdit, uModBarang;

type
  TfrmKartuStock = class(TfrmMasterReport)
    Panel2: TPanel;
    dtStart: TcxDateEdit;
    dtEnd: TcxDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    lbUOMStock: TLabel;
    cxLookupGudang: TcxExtLookupComboBox;
    Label5: TLabel;
    cxLookupSatuan: TcxExtLookupComboBox;
    chkGudang: TCheckBox;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxLookupBarang: TcxExtLookupComboBox;
    cxGrid: TcxGrid;
    cxGrdKartok: TcxGridDBBandedTableView;
    clGrdKartokUOM: TcxGridDBBandedColumn;
    clGrdKartokTransaksi: TcxGridDBBandedColumn;
    clGrdKartokNoBukti: TcxGridDBBandedColumn;
    clGrdKartokQTYIN: TcxGridDBBandedColumn;
    clGrdKartokQTYOut: TcxGridDBBandedColumn;
    clGrdKartokSaldo: TcxGridDBBandedColumn;
    clGrdKartokTanggal: TcxGridDBBandedColumn;
    cxlvMaster: TcxGridLevel;
    Label4: TLabel;
    cxLookupGroup: TcxExtLookupComboBox;
    procedure actExportExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure chkGudangClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxLookupGroupPropertiesEditValueChanged(Sender: TObject);
    procedure cxLookupBarangPropertiesEditValueChanged(Sender: TObject);
  private
    FBarang: TModBarang;
    FCDS: TClientDataSet;
    FCDSUOMKonv: TClientDataSet;
    FCDSBarang: TClientDataSet;
    FCDSSatuan: TClientDataSet;
    procedure FetchBarang;
    function GetCDS: TClientDataSet;
    function GetCDSSatuan: TClientDataSet;
    function GetCDSUOMKonv: TClientDataSet;
    procedure initView;
    procedure LoadData;
    property Barang: TModBarang read FBarang write FBarang;
    property CDS: TClientDataSet read GetCDS write FCDS;
    property CDSUOMKonv: TClientDataSet read GetCDSUOMKonv write FCDSUOMKonv;
    property CDSBarang: TClientDataSet read FCDSBarang write FCDSBarang;
    property CDSSatuan: TClientDataSet read GetCDSSatuan write FCDSSatuan;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKartuStock: TfrmKartuStock;

implementation

uses
  uDMClient, uDXUtils, uDBUtils, uAppUtils, DateUtils, uDMReport;

{$R *.dfm}

procedure TfrmKartuStock.actExportExecute(Sender: TObject);
begin
  inherited;
  cxGrdKartok.ExportToXLS();
end;

procedure TfrmKartuStock.actPrintExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmKartuStock.actRefreshExecute(Sender: TObject);
begin
  inherited;
  LoadData;
end;

procedure TfrmKartuStock.chkGudangClick(Sender: TObject);
begin
  inherited;
  cxLookupGudang.Enabled := chkGudang.Checked;
  if not cxLookupGudang.Enabled then cxLookupGudang.EditValue := null;
end;

procedure TfrmKartuStock.FormCreate(Sender: TObject);
begin
  inherited;
  dtStart.Date  := StartOfTheMonth(Now());
  dtEnd.Date    := Now();
  initView;
  chkGudangClick(Self);
end;

procedure TfrmKartuStock.cxLookupBarangPropertiesEditValueChanged(
  Sender: TObject);
var
  i: Integer;
  lKonv: TModKonversi;
begin
  inherited;
  if VarIsNull(cxLookupBarang.EditValue) then exit;

  if Assigned(FBarang) then FreeAndNil(FBarang);

  FBarang := DMClient.CrudClient.Retrieve(TModBarang.ClassName, cxLookupBarang.EditValue) as TModBarang;


  //fetch satuan
  CDSUOMKonv.EmptyDataSet;
  for i := 0 to Barang.Konversi.Count-1 do
  begin
    lKonv := Barang.Konversi[i];
    CDSUOMKonv.Append;
    CDSUOMKonv.FieldByName('UOM_ID').AsString := lKonv.Satuan.ID;
    if CDSSatuan.Locate('Ref$Satuan_ID', lKonv.Satuan.ID, [loCaseInsensitive]) then
      CDSUOMKonv.FieldByName('UOM').AsString := CDSSatuan.FieldByName('SAT_CODE').AsString;
    CDSUOMKonv.FieldByName('Konversi').AsFloat := lKonv.KONVSAT_SCALE;
    CDSUOMKonv.Post;


  end;

  if Assigned(Barang.SATUAN_STOCK) then
    cxLookupSatuan.EditValue := Barang.SATUAN_STOCK.ID;
end;

procedure TfrmKartuStock.cxLookupGroupPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  FetchBarang;
end;

procedure TfrmKartuStock.FetchBarang;
begin
  if VarIsNull(cxLookupGroup.EditValue) then
  begin
    TAppUtils.Warning('Group Belum Dipilih');
    exit;
  end;

  if Assigned(FCDSBarang) then FreeAndNil(FCDSBarang);
  With DMClient.DSProviderClient do
  begin
    FCDSBarang := TDBUtils.DSToCDS(Barang_GetDSLookup(cxLookupGroup.EditValue),Self);
    cxLookupBarang.LoadFromCDS(FCDSBarang,'Barang_ID','BRG_NAME',['Barang_ID'],Self);
  end;

end;

function TfrmKartuStock.GetCDS: TClientDataSet;
begin
  If not Assigned(FCDS) then
  begin
    FCDS := TClientDataSet.Create(Self);
    FCDS.AddField('TglBukti', ftDateTime);
    FCDS.AddField('Transaksi', ftString);
    FCDS.AddField('NoBukti', ftString);
    FCDS.AddField('QTYIN', ftFloat);
    FCDS.AddField('QTYOut', ftFloat);
    FCDS.AddField('Saldo', ftFloat);
    FCDS.AddField('UOM', ftString);
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmKartuStock.GetCDSSatuan: TClientDataSet;
begin
  if not Assigned(FCDSSatuan) then
  begin
    FCDSSatuan := TDBUtils.DSToCDS(
      DMClient.DSProviderClient.Satuan_GetDSLookup, Self
    );
  end;
  Result := FCDSSatuan;
end;

function TfrmKartuStock.GetCDSUOMKonv: TClientDataSet;
begin
  If not Assigned(FCDSUOMKonv) then
  begin
    FCDSUOMKonv := TClientDataSet.Create(Self);
    FCDSUOMKonv.AddField('UOM_ID', ftString);
    FCDSUOMKonv.AddField('UOM', ftString);
    FCDSUOMKonv.AddField('Konversi', ftFloat);
    FCDSUOMKonv.CreateDataSet;
  end;
  Result := FCDSUOMKonv;
end;

procedure TfrmKartuStock.initView;
begin
  With DMClient.DSProviderClient do
  begin
    cxLookupGroup.LoadFromDS(
      MerchandiseGroup_GetDSLookup, 'REF$MERCHANDISE_GRUP_ID','MERCHANGRUP_NAME' ,
      ['REF$MERCHANDISE_GRUP_ID','REF$MERCHANDISE_ID'], Self
    );

    cxLookupSatuan.LoadFromCDS(CDSUOMKonv, 'UOM_ID','UOM', ['UOM_ID'], Self);
    cxLookupGudang.LoadFromDS(Gudang_GetDSLookUp,'GUDANG_ID','GUD_NAME', [], Self);

  end;
end;

procedure TfrmKartuStock.LoadData;
var
  lDS: TDataSet;
  lKonv: Double;
  lSaldo: Double;
begin
  if VarIsNull(cxLookupBarang.EditValue) then
  begin
    TAppUtils.Warning('Barang belum dipilih');
    exit;
  end;
  lDS     := DMReport.ReportClient.KartuStock_GetDS(
    cxLookupBarang.EditValue, dtStart.Date, dtEnd.Date,
    VarToStr(cxLookupGudang.EditValue)
  );
  lSaldo  := 0;
  lKonv   := CDSUOMKonv.FieldByName('Konversi').AsFloat;

  CDS.EmptyDataSet;
  while not lDS.Eof do
  begin
    CDS.Append;
    CDS.FieldByName('Transaksi').AsString   := lDS.FieldByName('Transaksi').AsString;
    CDS.FieldByName('NoBukti').AsString     := lDS.FieldByName('NoBukti').AsString;
    CDS.FieldByName('TglBukti').AsDateTime  := lDS.FieldByName('TglBukti').AsDateTime;
    CDS.FieldByName('QTYIN').AsFloat        := lDS.FieldByName('Konversi').AsFloat * lDS.FieldByName('QTYIN').AsFloat / lKonv;
    CDS.FieldByName('QTYOUT').AsFloat       := lDS.FieldByName('Konversi').AsFloat * lDS.FieldByName('QTYOUT').AsFloat / lKonv;

    lSaldo := lSaldo + (CDS.FieldByName('QTYIN').AsFloat - CDS.FieldByName('QTYOUT').AsFloat);
    CDS.FieldByName('SALDO').AsFloat  := lSaldo;
    CDS.FieldByName('UOM').AsString  := CDSUOMKonv.FieldByName('UOM').AsString;
    CDS.Post;
    lDS.Next;
  end;

  cxGrdKartok.LoadFromCDS(CDS);
end;

end.
