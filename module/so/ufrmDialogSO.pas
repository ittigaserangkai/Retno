unit ufrmDialogSO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxDBExtLookupComboBox,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxLookupEdit, cxDBLookupEdit, uDXUtils,
  uModSO, Datasnap.DBClient, cxCheckBox, cxCurrencyEdit, cxSpinEdit;

type
  TfrmDialogSO = class(TfrmMasterDialog)
    pnlTop: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edtNoSO: TEdit;
    dtTgl: TcxDateEdit;
    pnl1: TPanel;
    lbl4: TLabel;
    btnAddOthersProdSO: TcxButton;
    btnToExcel: TcxButton;
    btnAddFromPOTrader: TcxButton;
    btnShow: TcxButton;
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    clNo: TcxGridDBColumn;
    clStatus: TcxGridDBColumn;
    clPLU: TcxGridDBColumn;
    clNamaBarang: TcxGridDBColumn;
    clUOM: TcxGridDBColumn;
    clMinOrder: TcxGridDBColumn;
    clCurrStock: TcxGridDBColumn;
    clQTYSO: TcxGridDBColumn;
    clQTYOrder: TcxGridDBColumn;
    clMaxOrder: TcxGridDBColumn;
    clSuppCode: TcxGridDBColumn;
    clSuppName: TcxGridDBColumn;
    clLeadTime: TcxGridDBColumn;
    clBuyPrice: TcxGridDBColumn;
    clDisc1: TcxGridDBColumn;
    clDisc2: TcxGridDBColumn;
    clDisc3: TcxGridDBColumn;
    clNetPrice: TcxGridDBColumn;
    cxlvMaster: TcxGridLevel;
    cxLookupMerchan: TcxExtLookupComboBox;
    cxLookupSupplierMerchan: TcxExtLookupComboBox;
    lblSuppMerGroup: TLabel;
    lblSuppMerGroupOpsional: TLabel;
    clADS: TcxGridDBColumn;
    clBarangID: TcxGridDBColumn;
    clSupMerchan: TcxGridDBColumn;
    clUOMID: TcxGridDBColumn;
    clROP: TcxGridDBColumn;
    actGenerate: TAction;
    procedure actGenerateExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure clNoGetDisplayText(Sender: TcxCustomGridTableItem; ARecord:
        TcxCustomGridRecord; var AText: string);
    procedure clStatusPropertiesEditValueChanged(Sender: TObject);
    procedure clQTYOrderPropertiesEditValueChanged(Sender: TObject);
    procedure btnToExcelClick(Sender: TObject);
    procedure cxLookupSupplierMerchanPropertiesInitPopup(Sender: TObject);
    procedure cxLookupMerchanPropertiesEditValueChanged(Sender: TObject);
    procedure btnAddOthersProdSOClick(Sender: TObject);
  private
    FCDS: TClientDataSet;
    FModSO: TModSO;
    procedure AddOtherProduct;
    procedure ClearForm;
    procedure GenerateSO;
    function GetCDS: TClientDataSet;
    function GetModSO: TModSO;
    procedure InitView;
    procedure UpdateData;
    function ValidateGenerate: Boolean;
    property CDS: TClientDataSet read GetCDS write FCDS;
    property ModSO: TModSO read GetModSO write FModSO;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialogSO: TfrmDialogSO;

implementation

uses
  uDBUtils, uDMClient, uAppUtils, uClientClasses, uModBarang, uModSuplier,
  uModSatuan, uConstanta, ufrmCXLookup;

{$R *.dfm}

procedure TfrmDialogSO.actGenerateExecute(Sender: TObject);
begin
  inherited;
  GenerateSO;
end;

procedure TfrmDialogSO.btnAddOthersProdSOClick(Sender: TObject);
begin
  AddOtherProduct;
end;

procedure TfrmDialogSO.btnToExcelClick(Sender: TObject);
begin
  inherited;
  cxGridView.ExportToXLS();
end;

procedure TfrmDialogSO.FormCreate(Sender: TObject);
begin
  inherited;
  InitView;
  ClearForm;
end;

procedure TfrmDialogSO.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(FModSO) then FModSo.Free;
end;

procedure TfrmDialogSO.actSaveExecute(Sender: TObject);
begin
  inherited;
  if not ValidateEmptyCtrl([1]) then Exit;

  UpdateData;
  Try
    ModSO.ID := DMClient.CrudClient.SaveToDBID(ModSO);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    Self.ModalResult := mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  End;

end;

procedure TfrmDialogSO.AddOtherProduct;
var
  frm: TfrmCXLookup;
  lCDS: TClientDataSet;
begin
  inherited;
  lCDS := TDBUtils.DSToCDS(
    DMClient.DSProviderClient.BarangSupp_GetDSLookup(cxLookupMerchan.EditValue),
    Self
  );
  frm := TfrmCXLookup.Execute(lCDS, True);
  Try
    if frm.ShowModal = mrOk then
    begin
      while not frm.Data.eof do
      begin
        CDS.Append;

        CDS.FieldByName('Checked').AsBoolean := True;
        CDS.FieldByName('PLU').AsString := frm.Data.FieldByName('BRG_CODE').AsString;
        CDS.FieldByName('NamaBarang').AsString := frm.Data.FieldByName('BRG_NAME').AsString;
        CDS.FieldByName('UOM').AsString := frm.Data.FieldByName('SAT_CODE').AsString;
        CDS.FieldByName('MinOrder').AsFloat := frm.Data.FieldByName('MINORDER').AsFloat;
        CDS.FieldByName('MaxOrder').AsFloat :=  frm.Data.FieldByName('MAXORDER').AsFloat;
        CDS.FieldByName('STOCK').AsFloat := frm.Data.FieldByName('STOCK').AsFloat;
        CDS.FieldByName('ROP').AsFloat := 0;
        CDS.FieldByName('ADS').AsFloat := frm.Data.FieldByName('ADS').AsFloat;
        CDS.FieldByName('QTYSO').AsFloat := 0;
        CDS.FieldByName('QTY').AsFloat := 0;
        CDS.FieldByName('SupplierCode').AsString := frm.Data.FieldByName('SUP_CODE').AsString;
        CDS.FieldByName('SupplierName').AsString := frm.Data.FieldByName('SUP_NAME').AsString;
        CDS.FieldByName('LeadTime').AsString := frm.Data.FieldByName('LEADTIME').AsString;
        CDS.FieldByName('BuyPrice').AsFloat := frm.Data.FieldByName('BUYPRICE').AsFloat;
        CDS.FieldByName('Disc1').AsFloat := frm.Data.FieldByName('DISC1').AsFloat;
        CDS.FieldByName('Disc2').AsFloat := frm.Data.FieldByName('DISC2').AsFloat;
        CDS.FieldByName('Disc3').AsFloat := frm.Data.FieldByName('DISC3').AsFloat;
        CDS.FieldByName('NetPrice').AsFloat := frm.Data.FieldByName('NETPRICE').AsFloat;

        CDS.FieldByName('BARANG_ID').AsString := frm.Data.FieldByName('BARANG_ID').AsString;
        CDS.FieldByName('SATUAN_ID').AsString := frm.Data.FieldByName('SATUAN_ID').AsString;
        CDS.FieldByName('SUPLIER_MERCHAN_ID').AsString := frm.Data.FieldByName('SUPLIER_MERCHAN_GRUP_ID').AsString;

        CDS.Post;

        frm.Data.Next;
      end;


    end;
  Finally
    frm.Free;
    lCDS.Free;
  End;
end;

procedure TfrmDialogSO.ClearForm;
begin
  dtTgl.Date := Now();
//  Self.ClearByTag([2],pnlTop);
  edtNoSo.Text := DMClient.CrudClient.GenerateNo(TModSO.ClassName);
end;

procedure TfrmDialogSO.clNoGetDisplayText(Sender: TcxCustomGridTableItem;
    ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  If Assigned(ARecord) then
    AText := IntToStr(ARecord.RecordIndex +1);
end;

procedure TfrmDialogSO.clQTYOrderPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  cxGridView.DataController.Post();

  CDS.Edit;
  CDS.FieldByName('Checked').AsBoolean := CDS.FieldByName('QTY').AsFloat > 0;
  CDS.Post;

end;

procedure TfrmDialogSO.clStatusPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  cxGridView.DataController.Post;
  CDS.Edit;
  if CDS.FieldByName('Checked').AsBoolean then
    CDS.FieldByName('QTY').AsFloat := CDS.FieldByName('QTYSO').AsFloat
  else
    CDS.FieldByName('QTY').AsFloat := 0;
  CDS.Post;

end;

procedure TfrmDialogSO.cxLookupMerchanPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cxLookupSupplierMerchan.DS.Filtered := True;
  cxLookupSupplierMerchan.DS.Filter := '[REF$MERCHANDISE_ID] = ' + QuotedStr(cxLookupMerchan.EditValue);

end;

procedure TfrmDialogSO.cxLookupSupplierMerchanPropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  if VarIsNull(cxLookupMerchan.EditValue) then
    TAppUtils.Warning('Merchan Grup wajib diisi terlebih dahulu');
end;

procedure TfrmDialogSO.GenerateSO;
var
  lCDS: TClientDataSet;
  lSO: TSuggestionOrderClient;
  SupMerchanID: string;
begin
  if not ValidateGenerate then exit;

  SupMerchanID := '';
  If not VarIsNull(cxLookupSupplierMerchan.EditValue) then
    SupMerchanID := cxLookupSupplierMerchan.EditValue;

  lSO := TSuggestionOrderClient.Create(DMClient.RestConn, False);
  lCDS := TClientDataSet(lSO.GenerateSO(dtTgl.Date, cxLookupMerchan.EditValue, SupMerchanID));
  CDS.DisableControls;
  Try
    CDS.EmptyDataSet;
    while not lCDS.eof do
    begin
      CDS.Append;

      CDS.FieldByName('Checked').AsBoolean := True;
      CDS.FieldByName('PLU').AsString := lCDS.FieldByName('KODEBARANG').AsString;
      CDS.FieldByName('NamaBarang').AsString := lCDS.FieldByName('NAMABARANG').AsString;
      CDS.FieldByName('UOM').AsString := lCDS.FieldByName('SATUAN').AsString;
      CDS.FieldByName('MinOrder').AsFloat := lCDS.FieldByName('MINQTY').AsFloat;
      CDS.FieldByName('MaxOrder').AsFloat :=  lCDS.FieldByName('MAXQTY').AsFloat;
      CDS.FieldByName('STOCK').AsFloat := lCDS.FieldByName('STOCK').AsFloat;
      CDS.FieldByName('ROP').AsFloat := lCDS.FieldByName('ROP').AsFloat;
      CDS.FieldByName('ADS').AsFloat := lCDS.FieldByName('ADS').AsFloat;
      CDS.FieldByName('QTYSO').AsFloat := lCDS.FieldByName('QTYSO').AsFloat;
      CDS.FieldByName('QTY').AsFloat := lCDS.FieldByName('QTYSO').AsFloat;
      CDS.FieldByName('SupplierCode').AsString := lCDS.FieldByName('SupplierCode').AsString;
      CDS.FieldByName('SupplierName').AsString := lCDS.FieldByName('SupplierName').AsString;
      CDS.FieldByName('LeadTime').AsString := lCDS.FieldByName('LEADTIME').AsString;
      CDS.FieldByName('BuyPrice').AsFloat := lCDS.FieldByName('BUYPRICE').AsFloat;
      CDS.FieldByName('Disc1').AsFloat := lCDS.FieldByName('DISC1').AsFloat;
      CDS.FieldByName('Disc2').AsFloat := lCDS.FieldByName('DISC2').AsFloat;
      CDS.FieldByName('Disc3').AsFloat := lCDS.FieldByName('DISC3').AsFloat;
      CDS.FieldByName('NetPrice').AsFloat := lCDS.FieldByName('NETPRICE').AsFloat;

      CDS.FieldByName('BARANG_ID').AsString := lCDS.FieldByName('BARANG_ID').AsString;
      CDS.FieldByName('SATUAN_ID').AsString := lCDS.FieldByName('SATUAN_ID').AsString;
      CDS.FieldByName('SUPLIER_MERCHAN_ID').AsString := lCDS.FieldByName('SUPLIER_MERCHAN_ID').AsString;

      CDS.FieldByName('IS_BKP').AsInteger := lCDS.FieldByName('IS_BKP').AsInteger;
      CDS.FieldByName('IS_REGULAR').AsInteger := lCDS.FieldByName('IS_REGULAR').AsInteger;

      CDS.Post;
      lCDS.Next;
    end;
  Finally
    CDS.EnableControls;
    cxGridView.ApplyBestFit();
    lSO.Free;
    lCDS.Free;
  End;
end;

function TfrmDialogSO.GetCDS: TClientDataSet;
begin
  If not Assigned(FCDS) then
  begin
    FCDS := TClientDataSet.Create(Self);
    FCDS.AddField('No',ftInteger);
    FCDS.AddField('Checked',ftBoolean);
    FCDS.AddField('PLU',ftString);
    FCDS.AddField('NamaBarang',ftString);
    FCDS.AddField('UOM',ftString);
    FCDS.AddField('MinOrder',ftFloat);
    FCDS.AddField('MaxOrder',ftFloat);
    FCDS.AddField('STOCK',ftFloat);
    FCDS.AddField('ADS',ftFloat);
    FCDS.AddField('ROP',ftFloat);
    FCDS.AddField('QTYSO',ftFloat);
    FCDS.AddField('QTY',ftFloat);
    FCDS.AddField('SupplierCode',ftString);
    FCDS.AddField('SupplierName',ftString);
    FCDS.AddField('LeadTime',ftString);
    FCDS.AddField('BuyPrice',ftFloat);
    FCDS.AddField('Disc1',ftFloat);
    FCDS.AddField('Disc2',ftFloat);
    FCDS.AddField('Disc3',ftFloat);
    FCDS.AddField('NetPrice',ftFloat);
    FCDS.AddField('Barang_ID',ftString);
    FCDS.AddField('Satuan_ID',ftString);
    FCDS.AddField('SUPLIER_MERCHAN_ID',ftString);

    FCDS.AddField('IS_BKP',ftInteger);
    FCDS.AddField('IS_REGULAR',ftInteger);

    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmDialogSO.GetModSO: TModSO;
begin
  if not Assigned(FModSO) then
    FModSO := TModSO.Create;
  Result := FModSO;
end;

procedure TfrmDialogSO.InitView;
begin
  With DMClient.DSProviderClient do
  begin
    cxLookupSupplierMerchan.LoadFromDS(SuplierMerchan_GetDSLookup,
      'SUPLIER_MERCHAN_GRUP_ID','SUP_NAME',
      ['SUPLIER_MERCHAN_GRUP_ID','REF$MERCHANDISE_GRUP_ID','REF$MERCHANDISE_ID'],
      Self);

    cxLookupMerchan.LoadFromDS(Merchandise_GetDSLookup,
      'REF$MERCHANDISE_ID','MERCHAN_NAME' ,Self);
  end;

  cxLookupMerchan.SetDefaultValue();
  //debug only
  cxLookupMerchan.DS.Locate('MERCHAN_NAME','DRY FOOD', [loCaseInsensitive]);
  cxLookupMerchan.EditValue := cxLookupMerchan.DS.FieldByName('REF$MERCHANDISE_ID').AsString;

  cxGridView.LoadFromCDS(CDS);
  //inisialisasi
end;

procedure TfrmDialogSO.UpdateData;
var
  lDetail: TModSODetail;
  lDisc: Double;
begin
  ModSO.SO_DATE := dtTgl.Date;
  ModSO.SO_NO := edtNoSO.Text;
  ModSO.Merchandise := TModMerchandise.CreateID(cxLookupMerchan.EditValue);

  If not VarIsNull(cxLookupSupplierMerchan.EditValue) then
    ModSO.SupplierMerchan := TModSuplierMerchanGroup.CreateID(cxLookupSupplierMerchan.EditValue);

  ModSO.AUTUNIT := nil; //diisi apa ya?
  ModSO.SODetails.Clear;

  CDS.DisableControls;
  Try
    CDS.First;
    while not CDS.Eof do
    begin
      lDetail := TModSODetail.Create;
      lDetail.BARANG := TModBarang.CreateID(CDS.FieldByName('Barang_ID').AsString);
      lDetail.Satuan := TModSatuan.CreateID(CDS.FieldByName('Satuan_ID').AsString);
      lDetail.SupplierMerchan :=
        TModSuplierMerchanGroup.CreateID(CDS.FieldByName('SUPLIER_MERCHAN_ID').AsString);

      lDetail.SOD_QTY         := CDS.FieldByName('QTYSO').AsFloat;
      lDetail.SOD_QTY_ORDER   := CDS.FieldByName('QTY').AsFloat;

      lDetail.SOD_ADS         := CDS.FieldByName('ADS').AsFloat;
      lDetail.SOD_STOCK       := CDS.FieldByName('STOCK').AsFloat;
      lDetail.SOD_ROP         := CDS.FieldByName('ROP').AsFloat;

      lDetail.SOD_IS_BKP      := CDS.FieldByName('IS_BKP').AsInteger;
      lDetail.SOD_IS_REGULAR  := CDS.FieldByName('IS_REGULAR').AsInteger;

      lDetail.SOD_PRICE       := CDS.FieldByName('BuyPrice').AsFloat;
      lDetail.SOD_DISC1       := CDS.FieldByName('Disc1').AsFloat;
      lDetail.SOD_DISC2       := CDS.FieldByName('Disc2').AsFloat;
      lDetail.SOD_DISC3       := CDS.FieldByName('Disc3').AsFloat;
      lDetail.SOD_IS_ORDERED  := 0; //diupdate oleh PO
      lDetail.SOD_TOTAL       := CDS.FieldByName('NetPrice').AsFloat * lDetail.SOD_QTY_ORDER;

      lDisc := (lDetail.SOD_DISC1/100) * lDetail.SOD_PRICE ;
      lDisc := lDisc + ((lDetail.SOD_DISC2/100) * (lDetail.SOD_PRICE-lDisc)) ;
      lDisc := lDisc + lDetail.SOD_DISC3;

      lDetail.SOD_TOTAL_DISC  := lDetail.SOD_QTY_ORDER * lDisc;
      ModSO.SODetails.Add(lDetail);
      CDS.Next;
    end;
  Finally
    CDS.EnableControls;
  End;

end;

function TfrmDialogSO.ValidateGenerate: Boolean;
begin
  Result := False;

  if VarIsNull(cxLookupMerchan.EditValue) then
  begin
    TAppUtils.Warning('Merchan Grup wajib diisi');
    cxLookupMerchan.SetFocus;
    exit;
  end;

  if CDS.RecordCount > 0 then
  begin
    if not TAppUtils.Confirm('Grid akan direset, Anda yakin akan generate SO ?') then
      exit;
  end;

  Result := True;
end;

end.
