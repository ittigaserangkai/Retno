unit ufrmDialogDOForTrader;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxMemo, cxButtonEdit, cxTextEdit, cxCurrencyEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, Vcl.StdCtrls, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, uRetnoUnit, uModPOTrader, uModelHelper, DateUtils,
  uDXUtils, uDMClient, Datasnap.DBClient, uModDOTrader, uDBUtils, Vcl.Menus,
  uModDNRecv, uAppUtils, uModSatuan, cxLabel, cxGroupBox, cxCalc, uModGudang,
  uModOrganization, uInterface, uDMReport, uConstanta;

type
  TfrmDialogDOForTrader = class(TfrmMasterDialog, ICRUDAble)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lblOrganizasi: TLabel;
    lblDesc: TLabel;
    dtPODate: TcxDateEdit;
    edNoBukti: TcxTextEdit;
    edOrganization: TcxButtonEdit;
    edOrganizationName: TcxButtonEdit;
    memDescription: TcxMemo;
    cxGrid: TcxGrid;
    cxGridDBTableDOTrader: TcxGridDBTableView;
    cxGridColPODKode: TcxGridDBColumn;
    cxGridColPODNama: TcxGridDBColumn;
    cxGridColPODUOM: TcxGridDBColumn;
    cxGridColPODHarga: TcxGridDBColumn;
    cxGridColPODQtyPO: TcxGridDBColumn;
    cxGridColPODDisc: TcxGridDBColumn;
    cxGridColPODPPN: TcxGridDBColumn;
    cxGridColPODTotal: TcxGridDBColumn;
    cxgrdlvlDOTrader: TcxGridLevel;
    edPONo: TcxButtonEdit;
    lblDONo: TLabel;
    lblDODate: TLabel;
    dtDODate: TcxDateEdit;
    lblSubTotal: TLabel;
    lblDisc: TLabel;
    lblPPN: TLabel;
    lblTotal: TLabel;
    edSubTotal: TcxCurrencyEdit;
    edDisc: TcxCurrencyEdit;
    edPPN: TcxCurrencyEdit;
    edTotal: TcxCurrencyEdit;
    cxGridColPODQtyDO: TcxGridDBColumn;
    lblGudang: TLabel;
    cbbGudang: TcxExtLookupComboBox;
    pmItem: TPopupMenu;
    LoadAllItemFromPO1: TMenuItem;
    ClearAllItems1: TMenuItem;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    txtBarCode: TcxTextEdit;
    procedure actDeleteExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure ClearAllItems1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edPONoExit(Sender: TObject);
    procedure edPONoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure InitLookup;
    procedure LoadAllItemFromPO1Click(Sender: TObject);
    procedure txtBarCodeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxGridColPODQtyDOPropertiesEditValueChanged(Sender: TObject);
  private
    FCDS: TClientDataSet;
    FLCDS: TClientDataSet;
    FModPOTrader: TModPOTrader;
    FModDOTrader: TModDOTrader;
    procedure CalculateTotal;
    function GetCDS: TClientDataSet;
    function GetLCDS: TClientDataSet;
    function GetModDOTrader: TModDOTrader;
    function GetPOItemByBarCode(APLUBarCode: String): TMOdPOTraderItem;
    function GetPOItemByPLU(APLU: String): TMOdPOTraderItem;
    procedure LookupPOTrader;
    procedure LoadPOTrader(APOTrader: TModPOTrader);
    procedure LoadPOTraderItems(APOTrader: TModPoTrader);
    procedure UpdateData;
    function ValidateData: Boolean;
    property CDS: TClientDataSet read GetCDS write FCDS;
    property LCDS: TClientDataSet read GetLCDS write FLCDS;
    property ModPOTrader: TModPOTrader read FModPOTrader write FModPOTrader;
    property ModDOTrader: TModDOTrader read GetModDOTrader write FModDOTrader;
    { Private declarations }
  protected
    procedure SetGridByPLU(APLUBarCode: String; AQTY: Double = 1);
  public
    procedure LoadData(AID: String);
    { Public declarations }
  end;

var
  frmDialogDOForTrader: TfrmDialogDOForTrader;

implementation

uses
  ufrmCXLookup, uModBarang;

{$R *.dfm}

procedure TfrmDialogDOForTrader.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm(CONF_VALIDATE_FOR_DELETE) then exit;
  if DMClient.CrudDOTraderClient.DeleteFromDB(ModDOTrader) then
    Self.ModalResult := mrOk;
end;

procedure TfrmDialogDOForTrader.actPrintExecute(Sender: TObject);
begin
  inherited;
  dmReport.ExecuteReport( 'Reports/Slip_DOTrader' ,
    dmReport.ReportClient.DOTrader_SlipByID(ModDOTrader.ID),[]
  );
end;

procedure TfrmDialogDOForTrader.actSaveExecute(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;

  Try
    ModDOTrader.ID := DMClient.CRUDDOTraderClient.SaveToDBID(ModDOTrader);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    Self.ModalResult := mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  End;
end;

procedure TfrmDialogDOForTrader.CalculateTotal;
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
      lQTY      := lCDS.FieldByName('DOTITEM_QTY').AsFloat;
      lDisc     := lCDS.FieldByName('DOTITEM_DISC').AsFloat;
      lPrice    := lCDS.FieldByName('DOTITEM_SELLPRICE').AsFloat;
      lPPN      := lCDS.FieldByName('DOTITEM_PPN').AsFloat;

      lSubTotal := lQTY * lPrice;
      lDisc     := lDisc/100 * lSubTotal;
      lPPN      := lPPN/100 * (lSubTotal - lDisc);
      lTotal    := lSubTotal - lDisc + lPPN;

      lCDS.Edit;
      lCDS.FieldByName('DOTITEM_TOTAL').AsFloat := lTotal;
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

procedure TfrmDialogDOForTrader.ClearAllItems1Click(Sender: TObject);
begin
  inherited;
  CDS.EmptyDataSet;
end;

procedure TfrmDialogDOForTrader.cxGridColPODQtyDOPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if CDS.State in [dsEdit] then CDS.Post;
  CalculateTotal;
end;

procedure TfrmDialogDOForTrader.FormCreate(Sender: TObject);
begin
  inherited;
  InitLookup;
  LoadData('');
end;

procedure TfrmDialogDOForTrader.edPONoExit(Sender: TObject);
begin
  inherited;
  if Assigned(FModPOTrader) then FreeAndNil(FModPOTrader);
  FModPOTrader := TCRUDObj.RetrieveCode<TModPOTrader>(edPONo.Text);
  LoadPOTrader(FModPOTrader);
end;

procedure TfrmDialogDOForTrader.edPONoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  LookupPOTrader;
end;

function TfrmDialogDOForTrader.GetCDS: TClientDataSet;
begin
  if not Assigned(FCDS) then
  begin
    FCDS := TModDOTraderItem.CreateDataSet(Self, False);
    FCDS.AddField('PLU', ftString);
    FCDS.AddField('NamaBarang', ftString);
    FCDS.AddField('POTITEM_QTY', ftFloat);
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmDialogDOForTrader.GetLCDS: TClientDataSet;
begin
  if not Assigned(FLCDS) then
  begin
    FLCDS := TClientDataSet.Create(Self);
    FLCDS.CloneCursor(CDS, True);
  end;
  Result := FLCDS;
end;

function TfrmDialogDOForTrader.GetModDOTrader: TModDOTrader;
begin
  if not Assigned(FModDOTrader) then
    FModDOTrader := TMODDoTrader.Create;
  Result := FModDOTrader;
end;

procedure TfrmDialogDOForTrader.InitLookup;
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

procedure TfrmDialogDOForTrader.LoadAllItemFromPO1Click(Sender: TObject);
begin
  inherited;
  if Assigned(FMODPOTrader) then
    LoadPOTraderItems(FModPOTrader);
end;

procedure TfrmDialogDOForTrader.LoadData(AID: String);
var
  lItem: TModDOTraderItem;

  function GetQTYPO(ABarangID, AUOMID: String): Double;
  var
    lPOItem: TMOdPOTraderItem;
  begin
    Result := 0;
    if not Assigned(FModPOTrader) then exit;
    for lPOItem in ModPOTrader.POTraderItems do
    begin
      if (lPOItem.POTITEM_BARANG.ID = ABarangID) and (lPOItem.POTITEM_SATUAN.ID = AUOMID) then
      begin
        Result := lPOItem.POTITEM_QTY;
        exit;
      end;
    end;
  end;

begin
  if AID = '' then
  begin
    If Assigned(FMODPOTrader) then FreeAndNil(FMODPOTrader);
    If Assigned(FMODDOTrader) then FreeAndNil(FMODDOTrader);
    edNoBukti.Text  := 'Auto';
    edPONO.Clear;
    edOrganization.Clear;
    edOrganizationName.Clear;
    dtPODate.Clear;
    dtDODate.Date := Now();
    cbbGudang.Clear;
    memDescription.Clear;
  end else
  begin
    if Assigned(FModDOTrader) then FreeAndNil(FModDOTrader);
    FModDOTrader := TCrudObj.Retrieve<TModDOTrader>(AID);

    if ModDOTrader.DOT_POTrader <> nil then
    begin
      ModPOTrader := TModPOTrader.CreateID(ModDOTrader.DOT_POTrader.ID);
      ModPOTrader.Reload(True);
      edPONO.Text               := ModPOTrader.POT_NO;
      dtPODate.Date             := ModPOTrader.POT_DATE
    end;
    if (ModDOTrader.DOT_Organization <> nil) then
    begin
      ModDOTrader.DOT_Organization.Reload();
      edOrganization.Text       := ModDOTrader.DOT_Organization.ORG_Code;
      edOrganizationName.Text   := ModDOTrader.DOT_Organization.ORG_Name;
    end;
    edNoBukti.Text              := ModDOTrader.DOT_NO;
    dtDODate.Date               := ModDOTrader.DOT_DATE;
    if Assigned(ModDOTrader.DOT_GUDANG) then
      cbbGudang.EditValue       := ModDOTrader.DOT_GUDANG.ID;

    memDescription.Text         := ModDOTrader.DOT_DESCRIPTION;

    CDS.EmptyDataSet;
    for lItem in ModDOTrader.DOTraderItems do
    begin
      CDS.Append;
      lItem.UpdateToDataset(CDS);
      lItem.DOTITEM_BARANG.Reload();
      CDS.FieldByName('PLU').AsString         := lItem.DOTITEM_BARANG.BRG_CODE;
      CDS.FieldByName('NamaBarang').AsString  := lItem.DOTITEM_BARANG.BRG_NAME;
      CDS.FieldByName('POTITEM_QTY').AsFloat  := GetQTYPO(lItem.DOTITEM_BARANG.ID, lItem.DOTITEM_SATUAN.ID);
      CDS.Post;
    end;
    CalculateTotal;
  end;
end;

procedure TfrmDialogDOForTrader.LookupPOTrader;
var
  cxLookup: TfrmCXLookup;
begin
  cxLookup := TfrmCXLookup.Execute('Lookup PO Trader', 'TDSProvider.POTrader_GetLookupForDO',
    TRetno.UnitStore.ID, StartOfTheMonth(Now()), EndOfTheMonth(Now()) );
  Try
    if cxLookup.ShowModal = mrOK then
    begin
      if Assigned(FModPOTrader) then FreeAndNil(FModPOTrader);
      FModPOTrader := TCRUDObj.Retrieve<TModPOTrader>(cxLookup.Data.FieldByName('POTRADER_ID').AsString);
      LoadPOTrader(ModPOTrader);
    end;
  Finally
    cxLookup.Free;
  End;
end;

procedure TfrmDialogDOForTrader.LoadPOTrader(APOTrader: TModPOTrader);
begin
  edPONo.Clear;
  dtPODate.Clear;
  if not Assigned(APOTrader) then exit;
  edPONo.Text     := APOTrader.POT_NO;
  dtPODate.Date   := APOTrader.POT_DATE;
  if Assigned(APOTrader.POT_Organization) then
  begin
    APOTrader.POT_Organization.Reload();
    edOrganization.Text := APOTrader.POT_Organization.ORG_Code;
    edOrganizationName.Text := APOTrader.POT_Organization.ORG_Name;
  end;
  LoadPOTraderItems(APOTrader);
end;

procedure TfrmDialogDOForTrader.LoadPOTraderItems(APOTrader: TModPoTrader);
var
  lDOItem: TModDOTraderItem;
  lPOItem: TMOdPOTraderItem;
begin
  CDS.EmptyDataSet;
  for lPOItem in APOTrader.POTraderItems do
  begin
    lDOItem := TModDOTraderItem.Create;
    Try
      CDS.Append;
      lDOItem.DOTITEM_BARANG    := TModBarang.CreateID(lPOItem.POTITEM_BARANG.ID); //cloned
      lDOItem.DOTITEM_SATUAN    := TModSatuan.CreateID(lPOItem.POTITEM_SATUAN.ID);
      lDOItem.DOTITEM_COGS      := lPOItem.POTITEM_COGS;
      lDOItem.DOTITEM_DISC      := lPOItem.POTITEM_DISC;
      lDOItem.DOTITEM_DISCRP    := lPOItem.POTITEM_DISCRP;
      lDOItem.DOTITEM_NETSALE   := lPOItem.POTITEM_NETSALE;
      lDOItem.DOTITEM_QTY       := lPOItem.POTITEM_QTY;
      lDOItem.DOTITEM_PPN       := lPOItem.POTITEM_PPN;
      lDOItem.DOTITEM_PPNRP     := lPOItem.POTITEM_PPNRP;
      lDOItem.DOTITEM_SELLPRICE := lPOItem.POTITEM_SELLPRICE;
      lDOItem.DOTITEM_TOTAL     := lPOItem.POTITEM_TOTAL;
      lDOItem.UpdateToDataset(CDS);
      lDOItem.DOTITEM_BARANG.Reload();
      CDS.FieldByName('PLU').AsString         := lDOItem.DOTITEM_BARANG.BRG_CODE;
      CDS.FieldByName('NamaBarang').AsString  := lDOItem.DOTITEM_BARANG.BRG_NAME;
      CDS.FieldByName('POTITEM_QTY').AsFloat  := lPOItem.POTITEM_QTY;
      CDS.Post;
    Finally
      lDOItem.Free;
    End;
  end;
  CalculateTotal;
end;

function TfrmDialogDOForTrader.GetPOItemByBarCode(APLUBarCode: String):
    TMOdPOTraderItem;
var
  lBrg: TModBarang;
  lKonv: TModKonversi;
  lPOITem: TMOdPOTraderItem;
begin
  Result := nil;
  if APLUBarCode = '' then exit;
  //get by barcode first
  for lPOITem in ModPOTrader.POTraderItems do
  begin
    lBrg := TModBarang.CreateID(lPOItem.POTITEM_BARANG.ID);
    lBrg.Reload(True);
    Try
      lKonv := lBrg.GetKonversiFromUOM(lPOItem.POTITEM_SATUAN.ID);
      if lKonv = nil then continue;
      if UpperCase(lKonv.KONVSAT_BARCODE) = UpperCase(APLUBarCode) then
      begin
        Result := lPOItem;
        exit;
      end;
    Finally
      lBrg.Free;
    End;
  end;
end;

function TfrmDialogDOForTrader.GetPOItemByPLU(APLU: String): TMOdPOTraderItem;
var
  lBrg: TModBarang;
  lPOITem: TMOdPOTraderItem;
begin
  Result := nil;
  if APLU = '' then exit;
  //get by barcode first
  for lPOITem in ModPOTrader.POTraderItems do
  begin
    lBrg := TModBarang.CreateID(lPOItem.POTITEM_BARANG.ID);
    lBrg.Reload(False);
    Try
      if UpperCase(lBrg.BRG_CODE) = UpperCase(APLU) then
      begin
        Result := lPOItem;
        exit;
      end;
    Finally
      lBrg.Free;
    End;
  end;
end;

procedure TfrmDialogDOForTrader.SetGridByPLU(APLUBarCode: String; AQTY: Double
    = 1);
var
  lPOItem: TMOdPOTraderItem;
begin
  if FModPOTrader = nil then
  begin
    TAppUtils.Error('PO Trader belum dipilih');
    exit;
  end;
  lPOItem := GetPOItemByBarCode(APLUBarCode);
  if lPOItem = nil then lPOItem := GetPOItemByPLU(APLUBarCode);
  if lPOItem = nil then
  begin
    TAppUtils.Error('PLU ' + APLUBarCode + ' tidak ditemukan di Item PO');
    exit;
  end;

  //locate first;
  lCDS.Filtered := True;
  lCDS.Filter   := 'DOTITEM_BARANG = ' + QuotedStr(lPOItem.POTITEM_BARANG.ID)
                + ' AND DOTITEM_SATUAN = ' + QuotedStr(lPOItem.POTITEM_SATUAN.ID);
  if lCDS.Eof then
  begin
    lPOItem.POTITEM_BARANG.Reload(False);
    lCDS.Append;
    lCDS.FieldByName('DOTITEM_BARANG').AsString   := lPOItem.POTITEM_BARANG.ID;
    lCDS.FieldByName('DOTITEM_SATUAN').AsString   := lPOItem.POTITEM_SATUAN.ID;
    lCDS.FieldByName('PLU').AsString              := lPOItem.POTITEM_BARANG.BRG_CODE;
    lCDS.FieldByName('NamaBarang').AsString       := lPOItem.POTITEM_BARANG.BRG_NAME;
    lCDS.FieldByName('DOTITEM_COGS').AsFloat      := lPOItem.POTITEM_COGS;
    lCDS.FieldByName('DOTITEM_SELLPRICE').AsFloat := lPOItem.POTITEM_SELLPRICE;
    lCDS.FieldByName('DOTITEM_DISC').AsFloat      := lPOItem.POTITEM_DISC;
    lCDS.FieldByName('DOTITEM_DISCRP').AsFloat    := lPOItem.POTITEM_DISCRP;
    lCDS.FieldByName('DOTITEM_PPN').AsFloat       := lPOItem.POTITEM_PPN;
    lCDS.FieldByName('DOTITEM_PPNRP').AsFloat     := lPOItem.POTITEM_PPNRP;
    lCDS.FieldByName('DOTITEM_NETSALE').AsFloat   := lPOItem.POTITEM_NETSALE;
    lCDS.FieldByName('POTITEM_QTY').AsFloat       := lPOItem.POTITEM_QTY;;
    lCDS.FieldByName('DOTITEM_QTY').AsFloat       := AQTY;
  end else begin
    lCDS.Edit;
    lCDS.FieldByName('DOTITEM_QTY').AsFloat       := lCDS.FieldByName('DOTITEM_QTY').AsFloat + AQTY;
  end;
  lCDS.FieldByName('DOTITEM_TOTAL').AsFloat
    := lCDS.FieldByName('DOTITEM_QTY').AsFloat * lCDS.FieldByName('DOTITEM_NETSALE').AsFloat;

  lCDS.Post;
  CalculateTotal;
end;

procedure TfrmDialogDOForTrader.txtBarCodeKeyDown(Sender: TObject; var Key:
    Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    SetGridByPLU(txtBarCode.Text);
    txtBarCode.Clear;
  end;
end;

procedure TfrmDialogDOForTrader.UpdateData;
var
  lDOItem: TModDOTraderItem;
begin
  if ModDOTrader.ID = '' then
    edNoBukti.Text := DMClient.CrudDOTraderClient.GenerateNo(TModDOTrader.ClassName);

  ModDOTrader.DOT_NO            := edNoBukti.Text;
  ModDOTrader.DOT_POTrader      := TModPOTrader.CreateID(ModPOTrader.ID);
  ModDOTrader.DOT_GUDANG        := TModGudang.CreateID(cbbGudang.EditValue);
  ModDOTrader.DOT_DATE          := dtDODate.Date;
  ModDOTrader.DOT_DESCRIPTION   := memDescription.Text;
  ModDOTrader.DOT_SUBTOTAL      := edSubTotal.Value;
  ModDOTrader.DOT_DISC          := edDisc.Value;
  ModDOTrader.DOT_PPN           := edPPN.Value;
  ModDOTrader.DOT_TOTAL         := edTotal.Value;
  ModDOTrader.DOT_UNIT          := TRetno.UnitStore;
  ModDOTrader.DOT_Organization  := TModOrganization.CreateID(ModPOTrader.POT_Organization.ID);

  ModDOTrader.DOTraderItems.Clear;
  lCDS.Filtered := False;
  lCDS.First;
  while not lCDS.Eof do
  begin
    lDOItem := TModDOTraderItem.Create;
    lDOItem.SetFromDataset(lCDS);
    ModDOTrader.DOTraderItems.Add(lDOItem);
    lCDS.Next;
  end;
end;

function TfrmDialogDOForTrader.ValidateData: Boolean;
var
  i: Integer;
begin
  Result := False;

  if CDS.RecordCount = 0 then
  begin
    TAppUtils.Warning('Tidak ada data yg disimpan');
    exit;
  end;

  if FModPOTrader = nil then
  begin
    TAppUtils.Warning('PO Trader belum dipilih');
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
    if lCDS.FieldByName('DOTITEM_BARANG').AsString = '' then
    begin
      TAppUtils.Warning('Baris ' + inttostr(i) + ' PLU belum dipilih');
      exit;
    end;
    if lCDS.FieldByName('DOTITEM_SATUAN').AsString = '' then
    begin
      TAppUtils.Warning('Baris ' + inttostr(i) + ' Satuan belum dipilih');
      exit;
    end;
    if lCDS.FieldByName('DOTITEM_QTY').AsFloat <= 0 then
    begin
      TAppUtils.Warning('Baris ' + inttostr(i) + ' Qty tidak boleh 0');
      exit;
    end;
    if lCDS.FieldByName('DOTITEM_QTY').AsFloat > lCDS.FieldByName('POTITEM_QTY').AsFloat then
    begin
      TAppUtils.Warning('Baris ' + inttostr(i) + ' Qty tidak melebihi QTY PO');
      exit;
    end;

    lCDS.Next;
  end;

  if not TAppUtils.Confirm(CONF_VALIDATE_FOR_SAVE) then
    exit;

  if not Result then Result := True;
end;

end.
