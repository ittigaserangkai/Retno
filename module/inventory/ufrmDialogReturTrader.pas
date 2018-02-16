unit ufrmDialogReturTrader;

interface

uses
  Windows, SysUtils, Variants, Classes, Controls, Forms, ufrmMasterDialogBrowse,
  ExtCtrls, DateUtils, Mask, jpeg, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, cxLabel, cxButtons,
  cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit, cxButtonEdit,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.StdCtrls, ufrmMasterDialog, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxCurrencyEdit, cxMemo, Datasnap.DBClient,
  uModDOTrader, uModReturTrader, uModPOTrader, uAppUtils, uConstanta, uDBUtils,
  uDXUtils, uModBarang, uModSatuan, ufrmCXLookup, uModGudang, uModOrganization;

type
  TfrmDialogReturTrader = class(TfrmMasterDialog)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lblOrganizasi: TLabel;
    lblDesc: TLabel;
    lblDONo: TLabel;
    lblDODate: TLabel;
    lblSubTotal: TLabel;
    lblDisc: TLabel;
    lblPPN: TLabel;
    lblTotal: TLabel;
    lblGudang: TLabel;
    dtTgl: TcxDateEdit;
    edNoBukti: TcxTextEdit;
    edOrganization: TcxButtonEdit;
    edOrganizationName: TcxButtonEdit;
    memDescription: TcxMemo;
    edDONo: TcxButtonEdit;
    dtDODate: TcxDateEdit;
    edSubTotal: TcxCurrencyEdit;
    edDisc: TcxCurrencyEdit;
    edPPN: TcxCurrencyEdit;
    edTotal: TcxCurrencyEdit;
    cbbGudang: TcxExtLookupComboBox;
    cxGrid: TcxGrid;
    cxGridDBTableDOTrader: TcxGridDBTableView;
    cxGridColPODKode: TcxGridDBColumn;
    cxGridColPODNama: TcxGridDBColumn;
    cxGridColPODUOM: TcxGridDBColumn;
    cxGridColPODHarga: TcxGridDBColumn;
    cxGridColPODQtyPO: TcxGridDBColumn;
    cxGridColPODQtyDO: TcxGridDBColumn;
    cxGridColPODDisc: TcxGridDBColumn;
    cxGridColPODPPN: TcxGridDBColumn;
    cxGridColPODTotal: TcxGridDBColumn;
    cxgrdlvlDOTrader: TcxGridLevel;
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InitLookup;
    procedure cxGridColPODQtyDOPropertiesEditValueChanged(Sender: TObject);
    procedure edDONoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    FCDS: TClientDataSet;
    FLCDS: TClientDataSet;
    FModDOTrader: TModDOTrader;
    FModReturTrader: TModReturTrader;
    procedure CalculateTotal;
    function GetCDS: TClientDataSet;
    function GetLCDS: TClientDataSet;
    function GetModReturTrader: TModReturTrader;
    procedure LoadDOTrader(ADOTrader: TModDOTrader);
    procedure LoadDOTraderItems(ADOTrader: TModDOTrader);
    procedure LookupDOTrader;
    procedure UpdateData;
    function ValidateData: Boolean;
    property CDS: TClientDataSet read GetCDS write FCDS;
    property LCDS: TClientDataSet read GetLCDS write FLCDS;
    property ModDOTrader: TModDOTrader read FModDOTrader write FModDOTrader;
    property ModReturTrader: TModReturTrader read GetModReturTrader write
        FModReturTrader;
//    property IDRetur: Integer read GetIDRetur write SetIDRetur;
  public
    procedure LoadData(AID: String);
    { Public declarations }
  end;

var
  frmDialogReturTrader: TfrmDialogReturTrader;


implementation

uses udmReport,  uRetnoUnit, Math, uTSCommonDlg, uDMClient, uModelHelper;


{$R *.dfm}

procedure TfrmDialogReturTrader.actSaveExecute(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  Try
    ModReturTrader.ID := DMClient.CRUDReturTraderClient.SaveToDBID(ModReturTrader);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    Self.ModalResult := mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  End;
end;

procedure TfrmDialogReturTrader.CalculateTotal;
var
  lDisc: Double;
  lPPN: Double;
  lPrice: Double;
  lQTY: Double;
  lSubTotal: Double;
  lTotal: Double;
begin
  edDisc.Value      := 0;
  edTotal.Value     := 0;
  edSubTotal.Value  := 0;
  edPPN.Value       := 0;
  CDS.DisableControls;
  Try
    lCDS.First;
    while not lCDS.eof do
    begin
      lQTY      := lCDS.FieldByName('RETITEM_QTY').AsFloat;
      lDisc     := lCDS.FieldByName('RETITEM_QTY').AsFloat;
      lPrice    := lCDS.FieldByName('RETITEM_SELLPRICE').AsFloat;
      lPPN      := lCDS.FieldByName('RETITEM_PPN').AsFloat;

      lSubTotal := lQTY * lPrice;
      lDisc     := lDisc/100 * lSubTotal;
      lPPN      := lPPN/100 * (lSubTotal - lDisc);
      lTotal    := lSubTotal - lDisc + lPPN;

      lCDS.Edit;
      lCDS.FieldByName('RETITEM_TOTAL').AsFloat := lTotal;
      lCDS.Post;

      edSubTotal.Value  := edSubTotal.Value + lSubTotal;
      edDisc.Value      := edDisc.Value + lDisc;
      edPPN.Value       := edPPN.Value + lPPN;
      edTotal.Value     := edTotal.Value + lTotal;

      lCDS.Next;
    end;
  Finally
    CDS.EnableControls;
  End;
end;

procedure TfrmDialogReturTrader.cxGridColPODQtyDOPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if CDS.State in [dsEdit] then CDS.Post;
  CalculateTotal;
end;

procedure TfrmDialogReturTrader.edDONoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  LookupDOTrader;
end;

procedure TfrmDialogReturTrader.FormCreate(Sender: TObject);
begin
  inherited;
  InitLookup;
  LoadData('');
end;

function TfrmDialogReturTrader.GetCDS: TClientDataSet;
begin
  if not Assigned(FCDS) then
  begin
    FCDS := TModReturTraderItem.CreateDataSet(Self, False);
    FCDS.AddField('PLU', ftString);
    FCDS.AddField('NamaBarang', ftString);
    FCDS.AddField('DOTITEM_QTY', ftFloat);
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmDialogReturTrader.GetLCDS: TClientDataSet;
begin
  if not Assigned(FLCDS) then
  begin
    FLCDS := TClientDataSet.Create(Self);
    FLCDS.CloneCursor(CDS, True);
  end;
  Result := FLCDS;
end;

function TfrmDialogReturTrader.GetModReturTrader: TModReturTrader;
begin
  if not Assigned(FModReturTrader) then
    FModReturTrader := TModReturTrader.Create;
  Result := FModReturTrader;
end;

procedure TfrmDialogReturTrader.InitLookup;
begin
  cbbGudang.Properties.LoadFromDS(
    DMClient.DSProviderClient.Gudang_GetDSLookUp(),
    'GUDANG_ID', 'GUD_NAME', ['GUDANG_ID'], Self
  );

  cxGridDBTableDOTrader.LoadFromCDS(CDS, False, False, False);

  TcxExtLookup(cxGridColPODUOM.Properties).LoadFromDS(
    DMClient.DSProviderClient.Satuan_GetDSLookup(),
    'ref$satuan_id', 'sat_code', ['ref$satuan_id'], Self
  );

end;

procedure TfrmDialogReturTrader.LoadData(AID: String);
var
  lItem: TModReturTraderItem;

  function GetQTYDO(ABarangID, AUOMID: String): Double;
  var
    lDOItem: TMOdDOTraderItem;
  begin
    Result := 0;
    if not Assigned(FModDOTrader) then exit;
    for lDOItem in ModDOTrader.DOTraderItems do
    begin
      if (lDOItem.DOTITEM_BARANG.ID = ABarangID) and (lDOItem.DOTITEM_SATUAN.ID = AUOMID) then
      begin
        Result := lDOItem.DOTITEM_QTY;
        exit;
      end;
    end;
  end;

begin
  if AID = '' then
  begin
    If Assigned(FModReturTrader) then FreeAndNil(FModReturTrader);
    If Assigned(FMODDOTrader) then FreeAndNil(FMODDOTrader);
    edNoBukti.Text  := 'Auto';
    edDONO.Clear;
    edOrganization.Clear;
    edOrganizationName.Clear;
    dtDODate.Clear;
    dtTgl.Date := Now();
    cbbGudang.Clear;
    memDescription.Clear;
  end else
  begin
    if Assigned(FModReturTrader) then FreeAndNil(FModReturTrader);
    FModReturTrader := TCrudObj.Retrieve<TModReturTrader>(AID);

    if ModReturTrader.RET_DOTrader <> nil then
    begin
      ModDOTrader := TModDOTrader.CreateID(ModReturTrader.RET_DOTrader.ID);
      ModDOTrader.Reload(True);
      edDONO.Text               := ModDOTrader.DOT_NO;
      dtDODate.Date             := ModDOTrader.DOT_DATE
    end;
    if (ModReturTrader.RET_Organization <> nil) then
    begin
      ModReturTrader.RET_Organization.Reload();
      edOrganization.Text       := ModReturTrader.RET_Organization.ORG_Code;
      edOrganizationName.Text   := ModReturTrader.RET_Organization.ORG_Name;
    end;
    edNoBukti.Text              := ModReturTrader.RET_NO;
    dtTgl.Date                  := ModReturTrader.RET_DATE;
    if Assigned(ModReturTrader.RET_GUDANG) then
      cbbGudang.EditValue       := ModReturTrader.RET_GUDANG.ID;

    memDescription.Text         := ModReturTrader.RET_DESCRIPTION;

    CDS.EmptyDataSet;
    for lItem in ModReturTrader.ReturTraderItems do
    begin
      CDS.Append;
      lItem.UpdateToDataset(CDS);
      lItem.RETITEM_BARANG.Reload();
      CDS.FieldByName('PLU').AsString         := lItem.RETITEM_BARANG.BRG_CODE;
      CDS.FieldByName('NamaBarang').AsString  := lItem.RETITEM_BARANG.BRG_NAME;
      CDS.FieldByName('POTITEM_QTY').AsFloat  := GetQTYDO(lItem.RETITEM_BARANG.ID, lItem.RETITEM_SATUAN.ID);
      CDS.Post;
    end;
    CalculateTotal;
  end;
end;

procedure TfrmDialogReturTrader.LoadDOTrader(ADOTrader: TModDOTrader);
begin
  edDONo.Clear;
  dtDODate.Clear;
  if not Assigned(ADOTrader) then exit;
  edDONo.Text     := ADOTrader.DOT_NO;
  dtDODate.Date   := ADOTrader.DOT_DATE;
  if Assigned(ADOTrader.DOT_Organization) then
  begin
    ADOTrader.DOT_Organization.Reload();
    edOrganization.Text := ADOTrader.DOT_Organization.ORG_Code;
    edOrganizationName.Text := ADOTrader.DOT_Organization.ORG_Name;
  end;
  LoadDOTraderItems(ADOTrader);
end;

procedure TfrmDialogReturTrader.LoadDOTraderItems(ADOTrader: TModDOTrader);
var
  lRetItem: TModReturTraderItem;
  lDOItem: TMOdDOTraderItem;
begin
  CDS.EmptyDataSet;
  for lDOItem in ADOTrader.DOTraderItems do
  begin
    lRetItem := TModReturTraderItem.Create;
    Try
      CDS.Append;
      lRetItem.RETITEM_BARANG    := TModBarang.CreateID(lDOItem.DOTITEM_BARANG.ID); //cloned
      lRetItem.RETITEM_SATUAN    := TModSatuan.CreateID(lDOItem.DOTITEM_SATUAN.ID);
      lRetItem.RETITEM_COGS      := lDOItem.DOTITEM_COGS;
      lRetItem.RETITEM_DISC      := lDOItem.DOTITEM_DISC;
      lRetItem.RETITEM_DISCRP    := lDOItem.DOTITEM_DISCRP;
      lRetItem.RETITEM_NETSALE   := lDOItem.DOTITEM_NETSALE;
      lRetItem.RETITEM_QTY       := lDOItem.DOTITEM_QTY;
      lRetItem.RETITEM_PPN       := lDOItem.DOTITEM_PPN;
      lRetItem.RETITEM_PPNRP     := lDOItem.DOTITEM_PPNRP;
      lRetItem.RETITEM_SELLPRICE := lDOItem.DOTITEM_SELLPRICE;
      lRetItem.RETITEM_TOTAL     := lDOItem.DOTITEM_TOTAL;
      lRetItem.UpdateToDataset(CDS);
      lRetItem.RETITEM_BARANG.Reload();

      CDS.FieldByName('PLU').AsString         := lRetItem.RETITEM_BARANG.BRG_CODE;
      CDS.FieldByName('NamaBarang').AsString  := lRetItem.RETITEM_BARANG.BRG_NAME;
      CDS.FieldByName('DOTITEM_QTY').AsFloat  := lDOItem.DOTITEM_QTY;
      CDS.Post;
    Finally
      lRetItem.Free;
    End;
  end;
  CalculateTotal;
end;

procedure TfrmDialogReturTrader.LookupDOTrader;
var
  cxLookup: TfrmCXLookup;
begin
  cxLookup := TfrmCXLookup.Execute('Lookup DO Trader', 'TDSProvider.DOTrader_GetLookupForRetur',
    TRetno.UnitStore.ID, StartOfTheMonth(Now()), EndOfTheMonth(Now()) );
  Try
    if cxLookup.ShowModal = mrOK then
    begin
      if Assigned(FModDOTrader) then FreeAndNil(FModDOTrader);
      FModDOTrader := TCRUDObj.Retrieve<TModDOTrader>(cxLookup.Data.FieldByName('DOTRADER_ID').AsString);
      LoadDOTrader(ModDOTrader);
    end;
  Finally
    cxLookup.Free;
  End;
end;

procedure TfrmDialogReturTrader.UpdateData;
var
  lRetItem: TModReturTraderItem;
begin
  if ModReturTrader.ID = '' then
    edNoBukti.Text := DMClient.CrudClient.GenerateNo(TModReturTrader.ClassName);

  ModReturTrader.RET_NO            := edNoBukti.Text;
  ModReturTrader.RET_DOTrader      := TModDOTrader.CreateID(ModDOTrader.ID);
  ModReturTrader.RET_GUDANG        := TModGudang.CreateID(cbbGudang.EditValue);
  ModReturTrader.RET_DATE          := dtTgl.Date;
  ModReturTrader.RET_DESCRIPTION   := memDescription.Text;
  ModReturTrader.RET_SUBTOTAL      := edSubTotal.Value;
  ModReturTrader.RET_DISC          := edDisc.Value;
  ModReturTrader.RET_PPN           := edPPN.Value;
  ModReturTrader.RET_TOTAL         := edTotal.Value;
  ModReturTrader.RET_Organization  := TModOrganization.CreateID(ModReturTrader.RET_Organization.ID);

  ModReturTrader.ReturTraderItems.Clear;
  lCDS.Filtered := False;
  lCDS.First;
  while not lCDS.Eof do
  begin
    lRetItem := TModReturTraderItem.Create;
    lRetItem.SetFromDataset(lCDS);
    ModReturTrader.ReturTraderItems.Add(lRetItem);
    lCDS.Next;
  end;
end;

function TfrmDialogReturTrader.ValidateData: Boolean;
var
  i: Integer;
begin
  Result := False;

  if CDS.RecordCount = 0 then
  begin
    TAppUtils.Warning('Tidak ada data yg disimpan');
    exit;
  end;

  if FModDOTrader = nil then
  begin
    TAppUtils.Warning('DO Trader belum dipilih');
    exit;
  end;

  if VarIsNull(cbbGudang.EditValue) then
  begin
    TAppUtils.Warning('Gudang belum dipilih');
    exit;
  end;

  lCDS.Filtered := False;
  lCDS.First;

  i := 0;
  while not lCDS.Eof do
  begin
    inc(i);
    if lCDS.FieldByName('RETITEM_BARANG').AsString = '' then
    begin
      TAppUtils.Warning('Baris ' + inttostr(i) + ' PLU belum dipilih');
      exit;
    end;
    if lCDS.FieldByName('RETITEM_SATUAN').AsString = '' then
    begin
      TAppUtils.Warning('Baris ' + inttostr(i) + ' Satuan belum dipilih');
      exit;
    end;
    if lCDS.FieldByName('RETITEM_QTY').AsFloat <= 0 then
    begin
      TAppUtils.Warning('Baris ' + inttostr(i) + ' Qty tidak boleh 0');
      exit;
    end;
    if lCDS.FieldByName('RETITEM_QTY').AsFloat > lCDS.FieldByName('DOTITEM_QTY').AsFloat then
    begin
      TAppUtils.Warning('Baris ' + inttostr(i) + ' Qty tidak melebihi QTY DO');
      exit;
    end;

    lCDS.Next;
  end;

  if not TAppUtils.Confirm(CONF_VALIDATE_FOR_SAVE) then
    exit;

  if not Result then Result := True;
end;

// penekanan tombol di Key Down
end.






