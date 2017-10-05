unit ufrmDialogAdjustmentFaktur;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  Vcl.StdCtrls, Vcl.ComCtrls, dxCore, cxDateUtils, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, cxMaskEdit, cxCalendar, cxLabel,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid,uDMClient, cxCurrencyEdit,
  Vcl.Menus, cxButtons, cxGroupBox, Datasnap.DBClient, cxButtonEdit,
  uModAdjustmentFaktur, uInterface, cxCalc, uDXUtils;

type
  TfrmDialogAdjustmentFaktur = class(TfrmMasterDialog, ICrudAble)
    pnlHeader: TPanel;
    pnlHeaderSatu: TPanel;
    lblNoBukti: TLabel;
    lblTglBukti: TLabel;
    lblReferensi: TLabel;
    edNoBukti: TcxTextEdit;
    edTglBukti: TcxDateEdit;
    cbbSupplierMG: TcxExtLookupComboBox;
    edReferensi: TcxTextEdit;
    pnlHeaderDua: TPanel;
    pnlDetail: TPanel;
    cxGridAdjFakturItem: TcxGrid;
    cxGridDBTableAdjFakturItem: TcxGridDBTableView;
    cxgridColAdjItemProductCode: TcxGridDBColumn;
    cxgridColAdjItemProductName: TcxGridDBColumn;
    cxgridColAdjItemQty: TcxGridDBColumn;
    cxgridColAdjItemUnitPrice: TcxGridDBColumn;
    cxgridColAdjItemDiscount: TcxGridDBColumn;
    cxgridColAdjItemPPN: TcxGridDBColumn;
    cxgridColAdjItemTotal: TcxGridDBColumn;
    cxgrdlvlAdjFakturItem: TcxGridLevel;
    cxGroupBox1: TcxGroupBox;
    edOldSubTotal: TcxCurrencyEdit;
    lblSubTotal: TLabel;
    lblDiskon: TLabel;
    edOldDisc: TcxCurrencyEdit;
    edOldPPN: TcxCurrencyEdit;
    lblPPN: TLabel;
    edOldTotal: TcxCurrencyEdit;
    lblTotal: TLabel;
    cxGroupBox3: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    edNewSubTotal: TcxCurrencyEdit;
    edNewDisc: TcxCurrencyEdit;
    edNewPPN: TcxCurrencyEdit;
    edNewTotal: TcxCurrencyEdit;
    Label4: TLabel;
    edPO: TcxButtonEdit;
    Label6: TLabel;
    edNP: TcxTextEdit;
    ckSupplier: TCheckBox;
    cxgridColAdjItemAdj: TcxGridDBColumn;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure ckSupplierClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edPOPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure btnAddItemClick(Sender: TObject);
    procedure cxgridColAdjItemQtyPropertiesEditValueChanged(Sender: TObject);
    procedure cxgridColAdjItemUnitPricePropertiesEditValueChanged(
      Sender: TObject);
    procedure cxgridColAdjItemDiscountPropertiesEditValueChanged(
      Sender: TObject);
  private
    FCDS: TClientDataSet;
    FModAdj: TModAdjustmentFaktur;
    procedure CalculateAdj;
    procedure DeleteData;
    function GetCDS: TClientDataSet;
    function GetModAdj: TModAdjustmentFaktur;
    procedure initView;
    procedure LoadDetailOrder(IsNewTransaction: Boolean = True);
    procedure LookupPO;
    procedure UpdateData;
    function ValidateData: Boolean;
    property CDS: TClientDataSet read GetCDS write FCDS;
    property ModAdj: TModAdjustmentFaktur read GetModAdj write FModAdj;
    { Private declarations }
  public
    procedure LoadData(aID: String);
    { Public declarations }
  end;

var
  frmDialogAdjustmentFaktur: TfrmDialogAdjustmentFaktur;

implementation

uses
  uDBUtils, ufrmCXLookup, DateUtils, uAppUtils, uModPO, uModDO,
  uModSuplier, uConstanta, uModBarang, uModelHelper;

{$R *.dfm}

procedure TfrmDialogAdjustmentFaktur.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if TAppUtils.Confirm('Anda Yakin Menghapus Data') then DeleteData;
end;

procedure TfrmDialogAdjustmentFaktur.actSaveExecute(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  Try
    ModAdj.ID := DMClient.CrudAdjFakClient.SaveToDBID(ModAdj);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    Self.ModalResult := mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  End;
end;

procedure TfrmDialogAdjustmentFaktur.btnAddItemClick(Sender: TObject);
//var
//  lDS: TClientDataSet;
//  lLookup: TfrmCXLookup;
begin
  inherited;
//  if (ModAdj.ADJFAK_DO = nil) then
//  begin
//    TAppUtils.Warning('Nomor PO belum diisi');
//    exit;
//  end;
//
//  lDS := TDBUtils.DSToCDS(
//    DMClient.DSProviderClient.DODetail_LookupAdjFak(ModAdj.ADJFAK_DO.ID), Self);
//
//
//  lLookup := TfrmCXLookup.Execute(lDS,True);
//  Try
//    lLookup.HideFields(['DO_DETAIL_ID', 'BARANG_ID', 'REF$SATUAN_ID']);
//    if lLookup.ShowModal = mrOK then
//    begin
//      while not lLookup.Data.eof do
//      begin
//        lLookup.Data.Next;
//      end;
//    end;
//  Finally
//    lLookup.free;
//  End;


end;

procedure TfrmDialogAdjustmentFaktur.CalculateAdj;
var
  lCDS: TClientDataSet;
  lDisc: Double;
  lGrandDisc: Double;
  lGrandPPN: Double;
  lGrandSub: Double;
  lGrandTotal: Double;
  lOldDisc: Double;
  lOldPPN: Double;
  lOldSubTotal: Double;
  lOldTotal: Double;
  lPPN: Double;
  lSubTotal: Double;
  lTotal: Double;
begin
  lCDS := TClientDataSet.Create(self);
  if CDS.State in [dsEdit] then CDS.Post;
  CDS.DisableControls;

  lGrandSub   := 0;
  lGrandDisc  := 0;
  lGrandPPN   := 0;
  lGrandTotal := 0;
  Try
    lCDS.CloneCursor(CDS, True);
    lCDS.First;
    while not lCDS.Eof do
    begin
      lSubTotal     := lCDS.FieldByName('AFD_QTY').AsFloat * lCDS.FieldByName('AFD_PRICE').AsFloat;
      lDisc         := lCDS.FieldByName('AFD_QTY').AsFloat * lCDS.FieldByName('AFD_DISC').AsFloat;
      lTotal        := lSubTotal - lDisc;
      lPPN          := lCDS.FieldByName('AFD_PPN').AsFloat/100 * lTotal;
      lOldSubTotal  := lCDS.FieldByName('AFD_QTY').AsFloat * lCDS.FieldByName('AFD_OLD_PRICE').AsFloat;
      lOldDisc      := lCDS.FieldByName('AFD_QTY').AsFloat * lCDS.FieldByName('AFD_OLD_DISC').AsFloat;
      lOldTotal     := lOldSubTotal - lOldDisc;
      lOldPPN       := lCDS.FieldByName('AFD_PPN').AsFloat/100 * lOldTotal;
      lGrandSub     := lGrandSub + lSubTotal;
      lGrandDisc    := lGrandDisc + lDisc;
      lGrandPPN     := lGrandPPN + lPPN;
      lGrandTotal   := lGrandTotal + lTotal + lPPN;

      lCDS.Edit;
      lCDS.FieldByName('AFD_VAL_ADJ_DISC').AsFloat := lDisc - lOldDisc;
      lCDS.FieldByName('TOTAL').AsFloat := lTotal + lPPN;
      lCDS.FieldByName('AFD_VAL_ADJ_AFTER_DISC').AsFloat := lTotal - lOldTotal;
      lCDS.FieldByName('AFD_VAL_ADJ_PPN').AsFloat := lPPN - lOldPPN;
      lCDS.FieldByName('AFD_VAL_ADJ_PPNBM').AsFloat := 0;
      lCDS.FieldByName('AFD_VAL_ADJ_TOTAL').AsFloat := lTotal + lPPN - (lOldTotal + lOldPPN);
      lCDS.Post;

      lCDS.Next;
    end;
    edNewSubTotal.EditValue := lGrandSub;
    edNewDisc.EditValue     := lGrandDisc;
    edNewPPN.EditValue      := lGrandPPN;
    edNewTotal.EditValue    := lGrandTotal;
  Finally
    CDS.EnableControls;
    lCDS.Free;
  End;
end;

procedure TfrmDialogAdjustmentFaktur.ckSupplierClick(Sender: TObject);
begin
  inherited;
  cbbSupplierMG.Enabled := ckSupplier.Checked;
end;

procedure TfrmDialogAdjustmentFaktur.cxgridColAdjItemDiscountPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalculateAdj;
end;

procedure TfrmDialogAdjustmentFaktur.cxgridColAdjItemQtyPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalculateAdj;
end;

procedure TfrmDialogAdjustmentFaktur.cxgridColAdjItemUnitPricePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalculateAdj;
end;

procedure TfrmDialogAdjustmentFaktur.DeleteData;
begin
  if not Assigned(ModAdj) then
    Raise Exception.Create('Data not Loaded');

  if ModAdj.ID = '' then
  begin
    TAppUtils.Error('Tidak ada data yang dihapus');
    exit;
  end;

  Try
    DMClient.CrudAdjFakClient.DeleteFromDB(ModAdj);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.ModalResult := mrOk;
  except
    TAppUtils.Error(ER_DELETE_FAILED);
    raise;
  End;
end;

procedure TfrmDialogAdjustmentFaktur.edPOPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  LookupPO;
end;

procedure TfrmDialogAdjustmentFaktur.FormCreate(Sender: TObject);
begin
  inherited;
  initView;
  LoadData('');
end;

function TfrmDialogAdjustmentFaktur.GetCDS: TClientDataSet;
begin
  If not Assigned(FCDS) then
  begin
    FCDS := TDBUtils.CreateObjectDataSet(TModAdjustmentFakturItem, Self, False);
    FCDS.AddField('Brg_Code', ftString);
    FCDS.AddField('Brg_Name', ftString);
    FCDS.AddField('Total', ftFloat);
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmDialogAdjustmentFaktur.GetModAdj: TModAdjustmentFaktur;
begin
  if not Assigned(FModAdj) then
    FModAdj := TModAdjustmentFaktur.Create;
  Result := FModAdj;
end;

procedure TfrmDialogAdjustmentFaktur.initView;
begin
  With DMClient.DSProviderClient do
  begin
    cbbSupplierMG.LoadFromDS(SuplierMerchan_GetDSLookup,
      'SUPLIER_MERCHAN_GRUP_ID' , 'SUP_NAME', Self);
    cbbSupplierMG.SetVisibleColumnsOnly(['SUP_CODE', 'SUP_NAME', 'MERCHANGRUP_NAME']);
    cbbSupplierMG.SetMultiPurposeLookup;

    cxGridDBTableAdjFakturItem.LoadFromCDS(CDS, False, False);
  end;
end;

procedure TfrmDialogAdjustmentFaktur.LoadData(aID: String);
var
  i: Integer;
//  lBarang: TModBarang;
  lItem: TModAdjustmentFakturItem;
begin
  if aID <> '' then
  begin
    FreeAndNil(FModAdj);
    FModAdj := DMClient.CrudClient.Retrieve(TModAdjustmentFaktur.ClassName, aID) as TModAdjustmentFaktur;
    ModAdj.ADJFAK_DO := DMClient.CrudClient.Retrieve(TModDO.ClassName, ModAdj.ADJFAK_DO.ID) as TModDO;
    ModAdj.ADJFAK_PO := DMClient.CrudClient.Retrieve(TModPO.ClassName, ModAdj.ADJFAK_PO.ID) as TModPO;
    edTglBukti.Date         := ModAdj.ADJFAK_DATE;
    cbbSupplierMG.EditValue := ModAdj.ADJFAK_SuplierMerchanGroup.ID;
    edPO.Text               := ModAdj.ADJFAK_PO.PO_NO;
    edNP.Text               := ModAdj.ADJFAK_DO.DO_NP;
    edReferensi.Text        := ModAdj.ADJFAK_REF;
  end else begin
    ModAdj.ADJFAK_NO        := DMClient.CrudClient.GenerateNo(TModAdjustmentFaktur.ClassName);
    edTglBukti.Date         := Now();
    edNoBukti.Text          := '';
    cbbSupplierMG.EditValue := '';
    edPO.Text               := '';
    edNP.Text               := '';
    edReferensi.Text        := '';
  end;
  edNoBukti.Text          := ModAdj.ADJFAK_NO;

  CDS.EmptyDataSet;
  CDS.DisableControls;
  Try
    for i := 0 to ModAdj.AdjustmentFakturItems.Count-1 do
    begin
      CDS.Append;
      lItem := ModAdj.AdjustmentFakturItems[i];
      lItem.UpdateToDataset(CDS);
//      lItem.AFD_Barang.Reload();
//      CDS.FieldByName('BRG_CODE').AsString := lItem.AFD_Barang.BRG_CODE;
//      CDS.FieldByName('BRG_NAME').AsString := lItem.AFD_Barang.BRG_NAME;
      CDS.POST;
    end;
    LoadDetailOrder(False);
    CalculateAdj;
  Finally
    CDS.EnableControls;
  End;
end;

procedure TfrmDialogAdjustmentFaktur.LoadDetailOrder(IsNewTransaction: Boolean
    = True);
var
  lDS: TDataset;
begin
  if not Assigned(ModAdj.ADJFAK_DO) then exit;

  CDS.DisableControls;

  if IsNewTransaction then CDS.EmptyDataSet;
  lDS := DMClient.DSProviderClient.DODetail_LookupAdjFak(ModAdj.ADJFAK_DO.ID);
  Try
    while not lDS.Eof do
    begin
      if IsNewTransaction then
        CDS.Append
      else
      begin
        if CDS.Locate('AFD_DOItem', lDS.FieldByName('DO_DETAIL_ID').AsString, [loCaseInsensitive]) then
          CDS.Edit;
      end;

      if CDS.State in [dsInsert, dsEdit] then
      begin
        CDS.SetFieldFrom('AFD_Barang', lDS, 'BARANG_ID');
        CDS.SetFieldFrom('AFD_DOItem', lDS, 'DO_DETAIL_ID');
        CDS.SetFieldFrom('Brg_Code', lDS, 'Brg_Code');
        CDS.SetFieldFrom('Brg_Name', lDS, 'Brg_Name');
        CDS.SetFieldFrom('Brg_Code', lDS, 'Brg_Code');
        CDS.SetFieldFrom('AFD_QTY', lDS, 'DOD_QTY_ORDER_RECV');
        CDS.SetFieldFrom('AFD_OLD_PRICE', lDS, 'DOD_PRICE');
        CDS.SetFieldFrom('AFD_OLD_DISC', lDS, 'DISC');
        if IsNewTransaction then
        begin
          CDS.SetFieldFrom('AFD_PRICE', lDS, 'DOD_PRICE');
          CDS.SetFieldFrom('AFD_DISC', lDS, 'DISC');
          CDS.SetFieldFrom('AFD_PPN', lDS, 'DOD_PPN_PERSEN');
        end;
        CDS.Post;
      end;
      lDS.Next;
    end;
    edOldSubTotal.Value := ModAdj.ADJFAK_DO.DO_SUBTOTAL;
    edOldDisc.Value     := ModAdj.ADJFAK_DO.DO_DISC;
    edOldPPN.Value      := ModAdj.ADJFAK_DO.DO_PPN;
    edOldTotal.Value    := ModAdj.ADJFAK_DO.DO_TOTAL;
    CalculateAdj;
  Finally
    CDS.EnableControls;
    lDS.Free;
  End;
end;

procedure TfrmDialogAdjustmentFaktur.LookupPO;
var
  lSupplierMg: string;
begin
  inherited;
  lSupplierMg := 'null';
  if ckSupplier.Checked then
    lSupplierMg := cbbSupplierMG.EditValueRest;

  with TfrmCXLookup.Execute('Look Up PO','TDSProvider.PO_GetDSOLookUpForAdj',
    lSupplierMg, StartOfTheYear(Now), EndOfTheYear(Now())) do
  begin
    Try
      HideFields(['DO_ID','PO_ID','SUPLIER_MERCHAN_GRUP_ID']);
      if ShowModal = mrOK then
      begin
        edPo.Text := Data.FieldByName('PO_NO').AsString;
        edNP.Text := Data.FieldByName('DO_NP').AsString;
        cbbSupplierMG.EditValue := Data.FieldByName('SUPLIER_MERCHAN_GRUP_ID').AsString;
        ModAdj.ADJFAK_PO := TModPO.CreateID(Data.FieldByName('PO_ID').AsString);
        ModAdj.ADJFAK_DO := DMClient.CrudClient.Retrieve(TModDO.ClassName,
          Data.FieldByName('DO_ID').AsString) as TModDO;

        LoadDetailOrder();
      end;
    Finally
      free;
    End;
  end;
end;

procedure TfrmDialogAdjustmentFaktur.UpdateData;
var
  lItem: TModAdjustmentFakturItem;
  lModSupGroup: TModSuplierMerchanGroup;
begin
  lModSupGroup := DMClient.CrudClient.Retrieve(
    TModSuplierMerchanGroup.ClassName,cbbSupplierMG.EditValue) as TModSuplierMerchanGroup;
  ModAdj.ADJFAK_Suplier             := TModSuplier.CreateID(lModSupGroup.SUPLIER.ID);
  ModAdj.ADJFAK_SuplierMerchanGroup := lModSupGroup;
  ModAdj.ADJFAK_NO                  := edNoBukti.Text;
  ModAdj.ADJFAK_REF                 := edReferensi.Text;
  ModAdj.ADJFAK_DATE_RCV            := ModAdj.ADJFAK_DO.DO_DATE;
  ModAdj.ADJFAK_DATE                := edTglBukti.Date;
  ModAdj.ADJFAK_PPN                 := edNewPPN.Value;
  ModAdj.ADJFAK_PPNBM               := 0;
  ModAdj.ADJFAK_PPNBM               := 0;

  ModAdj.AdjustmentFakturItems.Clear;

  CDS.DisableControls;
  Try
    ModAdj.ADJFAK_TOTAL_ADJ := 0;
    ModAdj.ADJFAK_PPN_ADJ := 0;
    ModAdj.ADJFAK_TOTAL_AFTER_DISC := 0;
    ModAdj.ADJFAK_DISC_ADJ := 0;

    CDS.First;
    while not CDS.Eof do
    begin
      lItem := TModAdjustmentFakturItem.Create;

      lItem.SetFromDataset(CDS);
      ModAdj.ADJFAK_TOTAL_AFTER_DISC  := ModAdj.ADJFAK_TOTAL_AFTER_DISC + lItem.AFD_VAL_ADJ_AFTER_DISC;
      ModAdj.ADJFAK_TOTAL_ADJ         := ModAdj.ADJFAK_TOTAL_ADJ + lItem.AFD_VAL_ADJ_TOTAL;
      ModAdj.ADJFAK_PPN_ADJ           := ModAdj.ADJFAK_PPN_ADJ + lItem.AFD_VAL_ADJ_PPN;
      ModAdj.ADJFAK_DISC_ADJ          := ModAdj.ADJFAK_DISC_ADJ + lItem.AFD_VAL_ADJ_DISC;

      ModAdj.AdjustmentFakturItems.Add(lItem);

      CDS.Next;
    end;

  Finally
    CDS.EnableControls;
  End;
end;

function TfrmDialogAdjustmentFaktur.ValidateData: Boolean;
begin
  Result := False;

  if VarIsNull(cbbSupplierMG.EditValue) then
  begin
    TAppUtils.Warning('Supplier tidak boleh kosong');
    exit;
  end;

  if not Assigned(ModAdj.ADJFAK_DO) then
  begin
    TAppUtils.Warning('PO/NP wajib dipilih');
    exit;
  end;

  if (Abs(edOldSubTotal.Value - edNewSubTotal.Value)<1)
    and (Abs(edOldDisc.Value - edNewDisc.Value)<1) then
  begin
    TAppUtils.Warning('Nilai Subtotal & Discount sebelum & sesudah adjustment sama');
    exit;
  end;

  if not Result then Result := True;
end;


end.
