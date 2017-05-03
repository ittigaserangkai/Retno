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
  uModSO, Datasnap.DBClient, cxCheckBox, cxCurrencyEdit, cxSpinEdit, uInterface;

type
  TfrmDialogSO = class(TfrmMasterDialog, ICRUDAble)
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
    actAddProd: TAction;
    clQTYOrder: TcxGridDBColumn;
    procedure actAddProdExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
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
  private
    FCDS: TClientDataSet;
    FModSO: TModSO;
    procedure AddOtherProduct;
    procedure ClearForm;
    procedure DeleteData;
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
    procedure LoadData(AID: String);
    { Public declarations }
  end;

var
  frmDialogSO: TfrmDialogSO;

implementation

uses
  uDBUtils, uDMClient, uAppUtils, uClientClasses, uModBarang, uModSuplier,
  uModSatuan, uConstanta, ufrmCXLookup;

{$R *.dfm}

procedure TfrmDialogSO.actAddProdExecute(Sender: TObject);
begin
  inherited;
  AddOtherProduct;
end;

procedure TfrmDialogSO.actDeleteExecute(Sender: TObject);
begin
  inherited;
  DeleteData;
end;

procedure TfrmDialogSO.actGenerateExecute(Sender: TObject);
begin
  inherited;
  GenerateSO;
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
    self, False
  );
  frm := TfrmCXLookup.Execute(lCDS, True);
  Try
    frm.ShowFieldsOnly(['BRG_CODE','BRG_NAME','SUP_CODE','SUP_NAME', 'SAT_CODE', 'BUYPRICE'] );
    if frm.ShowModal = mrOk then
    begin
      while not frm.Data.eof do
      begin
        if CDS.Locate('BARANG_ID', frm.Data.FieldByName('BARANG_ID').AsString, [loCaseInsensitive]) then
        begin
          TAppUtils.Warning('Barang : ' + frm.Data.FieldByName('BRG_CODE').AsString + ' - '
            + frm.Data.FieldByName('BRG_NAME').AsString + ' sudah ada di grid' );
        end else
        begin
          CDS.Append;
          CDS.FieldByName('Checked').AsBoolean := True;
          CDS.SetFieldFrom('PLU', frm.Data, 'BRG_CODE');
          CDS.SetFieldFrom('NamaBarang', frm.Data, 'BRG_NAME');
          CDS.SetFieldFrom('UOM', frm.Data, 'SAT_CODE');
          CDS.SetFieldFrom('MinOrder', frm.Data);
          CDS.SetFieldFrom('MaxOrder', frm.Data);
          CDS.SetFieldFrom('Stock', frm.Data);
          CDS.SetFieldFrom('ADS',frm.Data,'ADS');
          CDS.SetFieldFrom('SupplierCode', frm.Data, 'SUP_CODE');
          CDS.SetFieldFrom('SupplierName', frm.Data, 'SUP_NAME');
          CDS.SetFieldFrom('LeadTime', frm.Data, 'LEADTIME');
          CDS.SetFieldFrom('BuyPrice', frm.Data, 'BUYPRICE');
          CDS.SetFieldFrom('Disc1', frm.Data, 'DISC1');
          CDS.SetFieldFrom('Disc2', frm.Data, 'DISC2');
          CDS.SetFieldFrom('Disc3', frm.Data, 'DISC3');
          CDS.SetFieldFrom('NetPrice', frm.Data, 'NETPRICE');
          CDS.SetFieldFrom('BARANG_ID', frm.Data, 'BARANG_ID');
          CDS.SetFieldFrom('SATUAN_ID', frm.Data, 'SATUAN_ID');
          CDS.SetFieldFrom('SUPLIER_MERCHAN_ID', frm.Data, 'SUPLIER_MERCHAN_GRUP_ID');

          CDS.FieldByName('ROP').AsFloat := 0;
          CDS.FieldByName('QTYSO').AsFloat := 0;
          CDS.FieldByName('QTY').AsFloat := 0;
          CDS.Post;

        end;
        frm.Data.Next;
      end;
      cxGridView.ApplyBestFit();

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

procedure TfrmDialogSO.DeleteData;
var
  i: Integer;
begin
  if not Assigned(ModSO) then
    Raise Exception.Create('Data not Loaded');

  if ModSO.ID = '' then
  begin
    TAppUtils.Error('Tidak ada data yang dihapus');
    exit;
  end;

  for i := 0 to ModSO.SODetails.Count-1 do
  begin
    if ModSO.SODetails[i].SOD_IS_ORDERED = 1 then
    begin
      TAppUtils.Error('SO sudah diproses PO , tidak bisa dihapus');
      exit;
    end;
  end;

  Try
    DMClient.CrudClient.DeleteFromDB(ModSO);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.ModalResult := mrOk;
  except
    TAppUtils.Error(ER_DELETE_FAILED);
    raise;
  End;
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
      CDS.SetFieldFrom('PLU', lCDS, 'KODEBARANG');
      CDS.SetFieldFrom('NamaBarang', lCDS);
      CDS.SetFieldFrom('UOM', lCDS, 'SATUAN');
      CDS.SetFieldFrom('MinOrder', lCDS, 'MINQTY');
      CDS.SetFieldFrom('MaxOrder',  lCDS, 'MAXQTY');
      CDS.SetFieldFrom('STOCK', lCDS);
      CDS.SetFieldFrom('ROP', lCDS);
      CDS.SetFieldFrom('ADS', lCDS);
      CDS.SetFieldFrom('QTYSO', lCDS);
      CDS.SetFieldFrom('QTY', lCDS, 'QTYSO');
      CDS.SetFieldFrom('SupplierCode', lCDS);
      CDS.SetFieldFrom('SupplierName', lCDS);
      CDS.SetFieldFrom('LeadTime', lCDS);
      CDS.SetFieldFrom('BuyPrice', lCDS);
      CDS.SetFieldFrom('Disc1', lCDS);
      CDS.SetFieldFrom('Disc2', lCDS);
      CDS.SetFieldFrom('Disc3', lCDS);
      CDS.SetFieldFrom('NetPrice', lCDS);
      CDS.SetFieldFrom('BARANG_ID', lCDS);
      CDS.SetFieldFrom('SATUAN_ID', lCDS);
      CDS.SetFieldFrom('SUPLIER_MERCHAN_ID', lCDS);
      CDS.SetFieldFrom('IS_BKP', lCDS);
      CDS.SetFieldFrom('IS_REGULAR', lCDS);

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
      'SUPLIER_MERCHAN_GRUP_ID','SUP_NAME', Self);
    cxLookupSupplierMerchan.SetVisibleColumnsOnly(['SUP_CODE', 'SUP_NAME']);

    cxLookupMerchan.LoadFromDS(Merchandise_GetDSLookup,
      'REF$MERCHANDISE_ID','MERCHAN_NAME' ,Self);
  end;

  cxLookupMerchan.SetDefaultValue();
  //debug only
  cxLookupMerchan.DS.Locate('MERCHAN_NAME','DRY FOOD', [loCaseInsensitive]);
  cxLookupMerchan.EditValue := cxLookupMerchan.DS.FieldByName('REF$MERCHANDISE_ID').AsString;

  cxGridView.LoadFromCDS(CDS, False);
  //inisialisasi
end;

procedure TfrmDialogSO.LoadData(AID: String);
var
  i: Integer;
//  lBS: TModBarangSupplier;
  lDetail: TModSODetail;
  lDisc: Double;
  lSupp: TModSuplier;
begin
  If Assigned(FModSO) then FModSO.Free;
  FModSO := DMClient.CrudClient.RetrieveAll(TModSO.ClassName, AID) as TModSO;
  edtNoSo.Text := ModSO.SO_NO;
  dtTgl.Date := ModSO.SO_DATE;
  cxLookupMerchan.EditValue := ModSo.Merchandise.ID;
  cxLookupSupplierMerchan.EditValue := ModSo.SupplierMerchan.ID;

  CDS.DisableControls;
  Try
    for i := 0 to ModSO.SODetails.Count-1 do
    begin
      lDetail := ModSO.SODetails[i];

      //how to reproduce oom :
//      lSupp := DMClient.CrudClient.RetrieveAll(TModSuplier.ClassName,
//        lDetail.SupplierMerchan.SUPLIER.ID) as TModSuplier;

      lSupp := DMClient.CrudClient.Retrieve(TModSuplier.ClassName,
        lDetail.SupplierMerchan.SUPLIER.ID) as TModSuplier;

      CDS.Append;
      CDS.FieldByName('Checked').AsBoolean := lDetail.SOD_QTY > 0;
      CDS.FieldByName('PLU').AsString := lDetail.BARANG.BRG_CODE;
      CDS.FieldByName('NamaBarang').AsString := lDetail.BARANG.BRG_NAME;
      CDS.FieldByName('UOM').AsString := lDetail.Satuan.SAT_CODE;
//      CDS.FieldByName('MinOrder').AsFloat :=
//      CDS.FieldByName('MaxOrder').AsFloat :=
      CDS.FieldByName('STOCK').AsFloat := lDetail.SOD_STOCK;
      CDS.FieldByName('ADS').AsFloat := lDetail.SOD_ADS;
      CDS.FieldByName('ROP').AsFloat := lDetail.SOD_ROP;
      CDS.FieldByName('QTYSO').AsFloat := lDetail.SOD_QTYSO;
      CDS.FieldByName('QTY').AsFloat := lDetail.SOD_QTY;
      CDS.FieldByName('SupplierCode').AsString := lSupp.SUP_CODE;
      CDS.FieldByName('SupplierName').AsString := lSupp.SUP_NAME;
      CDS.FieldByName('LeadTime').AsInteger := lDetail.SupplierMerchan.SUPMG_LEAD_TIME;
      CDS.FieldByName('BuyPrice').AsFloat := lDetail.SOD_PRICE;
      CDS.FieldByName('Disc1').AsFloat := lDetail.SOD_DISC1;
      CDS.FieldByName('Disc2').AsFloat := lDetail.SOD_DISC2;
      CDS.FieldByName('Disc3').AsFloat := lDetail.SOD_DISC3;
      CDS.FieldByName('NetPrice').AsFloat := lDetail.SOD_PRICE;
      CDS.FieldByName('Barang_ID').AsString := lDetail.BARANG.ID;
      CDS.FieldByName('Satuan_ID').AsString := lDetail.Satuan.ID;
      CDS.FieldByName('SUPLIER_MERCHAN_ID').AsString := lDetail.SupplierMerchan.ID;
      CDS.FieldByName('IS_BKP').AsInteger := lDetail.SOD_IS_BKP;
      CDS.FieldByName('IS_REGULAR').AsInteger := lDetail.SOD_IS_REGULAR;

      lDisc := (lDetail.SOD_DISC1/100) * lDetail.SOD_PRICE ;
      lDisc := lDisc + ((lDetail.SOD_DISC2/100) * (lDetail.SOD_PRICE-lDisc)) ;
      lDisc := lDisc + lDetail.SOD_DISC3;

      CDS.FieldByName('NetPrice').AsFloat := lDetail.SOD_PRICE - lDisc;


      CDS.Post;

      if lSupp <> nil then lSupp.Free;
    end;

  Finally
    CDS.EnableControls;
    cxGridView.ApplyBestFit();
  End;

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

      lDetail.SOD_QTYSO       := CDS.FieldByName('QTYSO').AsFloat;
      lDetail.SOD_QTY         := CDS.FieldByName('QTY').AsFloat;

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
      lDetail.SOD_TOTAL       := CDS.FieldByName('NetPrice').AsFloat * lDetail.SOD_QTY;

      lDisc := (lDetail.SOD_DISC1/100) * lDetail.SOD_PRICE ;
      lDisc := lDisc + ((lDetail.SOD_DISC2/100) * (lDetail.SOD_PRICE-lDisc)) ;
      lDisc := lDisc + lDetail.SOD_DISC3;

      lDetail.SOD_TOTAL_DISC  := lDetail.SOD_QTY * lDisc;
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
