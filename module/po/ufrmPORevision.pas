unit ufrmPORevision;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.StdCtrls, cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxCurrencyEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxMaskEdit, cxCalendar, cxTextEdit, uInterface, uModPO, uDMClient,
  dxBarBuiltInMenu, cxPC, uDXUtils, Datasnap.DBClient, uDBUtils, uModelHelper,
  cxCalc, uAppUtils;

type
  TfrmPORevision = class(TfrmMasterDialog,ICRUDAble)
    cxgrdlvlGridPODetil: TcxGridLevel;
    cxGridDBPODetil: TcxGrid;
    pnlPOFooter: TPanel;
    lblSubTotal: TLabel;
    edSubTotal: TcxCurrencyEdit;
    lblDisc1: TLabel;
    edDisc1: TcxCurrencyEdit;
    lblPPN: TLabel;
    edPPN: TcxCurrencyEdit;
    lblTotal: TLabel;
    edTotal: TcxCurrencyEdit;
    cxPCHeader: TcxPageControl;
    cxTSPOHeader: TcxTabSheet;
    lblPOLama: TLabel;
    lblNoPOBaru: TLabel;
    lblPODate: TLabel;
    edPOLama: TcxTextEdit;
    edNoPOBaru: TcxTextEdit;
    lblSupMG: TLabel;
    edPODate: TcxDateEdit;
    cbbSupplier: TcxExtLookupComboBox;
    cbbSupMGNama: TcxExtLookupComboBox;
    lblNoSO: TLabel;
    lblSupplier: TLabel;
    edtop: TcxTextEdit;
    edValidUntil: TcxDateEdit;
    lblTOP: TLabel;
    lblValidUntil: TLabel;
    cbbSO: TcxExtLookupComboBox;
    cxGridTablePODetil: TcxGridTableView;
    cxgrdclmnPODSKU: TcxGridColumn;
    cxgrdclmnPODNama: TcxGridColumn;
    cxgrdclmnPODUOM: TcxGridColumn;
    cxgrdclmnPODJumlah: TcxGridColumn;
    cxgrdclmnPODHarga: TcxGridColumn;
    cxgrdclmnPODDisc1: TcxGridColumn;
    cxgrdclmnPODDisc2: TcxGridColumn;
    cxgrdclmnPODDisc3: TcxGridColumn;
    cxgrdclmnPODTotal: TcxGridColumn;
    cxgrdclmnPODID: TcxGridColumn;
    cxgrdclmnPODUOMID: TcxGridColumn;
    cxgrdclmnPODPPN: TcxGridColumn;
    cxgrdclmnPODPPNBM: TcxGridColumn;
    cxgrdclmnPODTotalDisc: TcxGridColumn;
    cxgrdclmnPODTotalTax: TcxGridColumn;
    cxgrdclmnPODIsBKP: TcxGridColumn;
    cxgrdclmnPODSubTotal: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure cxgrdclmnPODJumlahPropertiesEditValueChanged(Sender: TObject);
    procedure cxGridTablePODetilEditing(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; var AAllow: Boolean);
    procedure cxGridTablePODetilDataControllerAfterPost(
      ADataController: TcxCustomDataController);
  private
    FCDS: TClientDataSet;
    FCDSSO: TClientDataSet;
    FCDSSupMG: TClientDataSet;
    FPOLama: TModPO;
    FPORev: TModPO;
    function GetDCItem: TcxGridDataController;
    function GetPORev: TModPO;
    procedure InisialisasiCBBSO;
    procedure InisialisasiCBBSupMG;
    procedure InisialisasiCBBSupplier;
    procedure UpdateData;
    procedure UpdateEditData;
    property DCItem: TcxGridDataController read GetDCItem;
    property PORev: TModPO read GetPORev write FPORev;
    { Private declarations }
  public
    procedure LoadData(AID : String);
    procedure SimpanData;
    function ValidateData: Boolean;
    { Public declarations }
  end;

var
  frmPORevision: TfrmPORevision;

implementation

uses
  uModBarang;

{$R *.dfm}

procedure TfrmPORevision.cxgrdclmnPODJumlahPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  UpdateEditData;
end;

procedure TfrmPORevision.cxGridTablePODetilDataControllerAfterPost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  cxGridTablePODetil.ApplyBestFit;
end;

procedure TfrmPORevision.cxGridTablePODetilEditing(Sender:
    TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  inherited;
  if AItem = cxgrdclmnPODJumlah then AAllow := true else AAllow := False;
end;

procedure TfrmPORevision.FormCreate(Sender: TObject);
begin
  inherited;
  InisialisasiCBBSupMG;
  InisialisasiCBBSupplier;
  InisialisasiCBBSO;
end;

function TfrmPORevision.GetDCItem: TcxGridDataController;
begin
  // TODO -cMM: TfrmPORevision.GetDCItem default body inserted
  Result := cxGridTablePODetil.DataController;
end;

function TfrmPORevision.GetPORev: TModPO;
begin
  if not Assigned(FPORev) then
    FPORev := TModPO.Create;
  Result := FPORev;
end;

procedure TfrmPORevision.InisialisasiCBBSO;
begin
  // SO_ID,SO_NO
  FCDSSO := TDBUtils.DSToCDS(DMClient.DSProviderClient.SO_GetDSOLookUp(nil), Self);
  cbbSO.Properties.LoadFromCDS(FCDSSO,'SO_ID','SO_NO',['SO_ID'],Self);
  cbbSO.Properties.SetMultiPurposeLookup;
end;

procedure TfrmPORevision.InisialisasiCBBSupMG;
var
  FCDSSupMG: TClientDataSet;
begin
  FCDSSupMG := TDBUtils.DSToCDS(DMClient.DSProviderClient.SuplierMerchan_GetDSLookup(), Self);
  cbbSupMGNama.Properties.LoadFromCDS(FCDSSupMG,'SUPLIER_MERCHAN_GRUP_ID','SUPMG_SUB_CODE',['SUPLIER_MERCHAN_GRUP_ID','REF$MERCHANDISE_ID', 'REF$MERCHANDISE_GRUP_ID'],Self);
  cbbSupMGNama.Properties.SetMultiPurposeLookup;
end;

procedure TfrmPORevision.InisialisasiCBBSupplier;
var
  FCDSSupSupplier: TClientDataSet;
begin
  FCDSSupSupplier := TDBUtils.DSToCDS(DMClient.DSProviderClient.Suplier_GetDSLookup(), Self);

  cbbSupplier.Properties.LoadFromCDS(FCDSSupSupplier,'SUPLIER_ID','SUP_NAME',['SUPLIER_ID'],Self);
  cbbSupplier.Properties.SetMultiPurposeLookup;
end;

procedure TfrmPORevision.LoadData(AID : String);
var
  I: Integer;
  lBS: TModBarangSupplier;
  SubTotal, Disc1, Disc2, HargaStlDisc, TotalDisc, TotalTax, Total : Double;
begin
  ClearByTag([0,1]);
  cxGridTablePODetil.ClearRows;

  FPOLama                := DMClient.CrudClient.Retrieve(TModPO.ClassName, AID) as TModPO;
  edPOLama.Text          := FPOLama.PO_NO;
  edPODate.Date          := FPOLama.PO_DATE;
  cbbSO.EditValue        := FPOLama.PO_SO.ID;
  cbbSupMGNama.EditValue := FPOLama.PO_SUPPLIER_MERCHAN_GRUP.ID;
  cbbSupplier.EditValue  := FPOLama.PO_SUPPLIER.ID;
  edValidUntil.Date      := FPOLama.PO_VALID_DATE;

  for I := 0 to FPOLama.POItems.Count - 1 do
  begin
    FPOLama.POItems[i].LoadBarang;
    FPOLama.POItems[i].LoadUOM;
    with cxGridTablePODetil.DataController DO
      Begin
        AppendRecord;
        Values[i, cxgrdclmnPODID.Index] := FPOLama.POItems[i].POD_BARANG.ID;
        Values[i, cxgrdclmnPODSKU.Index] := FPOLama.POItems[i].POD_BARANG.BRG_CODE;
        Values[i, cxgrdclmnPODNama.Index] := FPOLama.POItems[i].POD_BARANG.BRG_NAME;
        Values[i, cxgrdclmnPODUOMID.Index] := FPOLama.POItems[i].POD_UOM.ID;
        Values[i, cxgrdclmnPODUOM.Index] := FPOLama.POItems[i].POD_UOM.SAT_NAME;
        Values[i, cxgrdclmnPODJumlah.Index] := FPOLama.POItems[i].POD_QTY_ORDER;

        lBS := DMClient.CrudClient.Retrieve(TModBarangSupplier.ClassName,
          FPOLama.POItems[i].POD_BARANG_SUPPLIER.ID
        ) as TModBarangSupplier;
        Try
          SubTotal := FPOLama.POItems[i].POD_QTY_ORDER * lBS.BRGSUP_BUY_PRICE;
          Values[i, cxgrdclmnPODHarga.Index] := lBS.BRGSUP_BUY_PRICE;
          Values[i, cxgrdclmnPODSubTotal.Index] := SubTotal;
          Values[i, cxgrdclmnPODDisc1.Index] := lBS.BRGSUP_DISC1;
          Values[i, cxgrdclmnPODDisc2.Index] := lBS.BRGSUP_DISC2;
          Values[i, cxgrdclmnPODDisc3.Index] := lBS.BRGSUP_DISC3;
          Disc1 := FPOLama.POItems[i].POD_QTY_ORDER * (lBS.BRGSUP_DISC1 / 100 * lBS.BRGSUP_BUY_PRICE);
          Disc2 := (SubTotal - Disc1) * lBS.BRGSUP_DISC2 / 100 * lBS.BRGSUP_BUY_PRICE;
          TotalDisc := Disc1 + Disc2 + (lBS.BRGSUP_DISC3 * FPOLama.POItems[i].POD_QTY_ORDER);
          HargaStlDisc := (SubTotal - TotalDisc) / FPOLama.POItems[i].POD_QTY_ORDER;
          Values[i, cxgrdclmnPODPPN.Index] := lBS.BRGSUP_IS_BKP * 10 / 100 * HargaStlDisc;
          Values[i, cxgrdclmnPODPPNBM.Index] := 0;
          TotalTax := FPOLama.POItems[i].POD_QTY_ORDER * lBS.BRGSUP_IS_BKP * 10 / 100 * HargaStlDisc;
          Values[i, cxgrdclmnPODTotalDisc.Index] := TotalDisc;
          Values[i, cxgrdclmnPODTotalTax.Index] := TotalTax;
          Total := SubTotal - TotalDisc + TotalTax;
          Values[i, cxgrdclmnPODTotal.Index] := Total;
          Values[i, cxgrdclmnPODIsBKP.Index] := lBS.BRGSUP_IS_BKP;
        finally
          lBS.Free;
        End;
        Post;
      End;
  end;
  edSubTotal.Value := vartofloat(cxGridTablePODetil.DataController.GetFooterSummary(cxgrdclmnPODSubTotal));
  edDisc1.Value := vartofloat(cxGridTablePODetil.DataController.GetFooterSummary(cxgrdclmnPODTotalDisc));
  edPPN.Value := vartofloat(cxGridTablePODetil.DataController.GetFooterSummary(cxgrdclmnPODTotalTax));
  edTotal.Value := vartofloat(cxGridTablePODetil.DataController.GetFooterSummary(cxgrdclmnPODTotal));
end;

procedure TfrmPORevision.SimpanData;
begin
  if not ValidateData then exit; //validasi
  UpdateData;

  Try
    PORev.ID := DMClient.CrudPOClient.SaveToDBID(PORev);
    TAppUtils.Information(_MSG_BERHASIL_SIMPAN);
    Self.ModalResult := mrOk;
  except
    TAppUtils.Error(_MSG_GAGAL_SIMPAN);
    raise;
  End;

end;

procedure TfrmPORevision.UpdateData;
begin
  //isi form ke object PORev;


end;

procedure TfrmPORevision.UpdateEditData;
var
  Disc1,Disc2,HargaStlDisc, SubTotal,TotalDisc : Double;
begin
  DCItem.Post;
  SubTotal := DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODJumlah.Index] * DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODHarga.Index];
  Disc1 := DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODJumlah.Index] *
    (DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODDisc1.Index] / 100 * DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODHarga.Index]);
  Disc2 := (SubTotal - Disc1) * (DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODDisc2.Index] / 100 * DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODHarga.Index]);
  TotalDisc := Disc1 + Disc2 + (DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODDisc3.Index] * DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODJumlah.Index]);
  HargaStlDisc := (SubTotal - TotalDisc) / DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODJumlah.Index];
  DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODSubTotal.Index] := SubTotal;
  DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODTotalDisc.Index] := TotalDisc;
  DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODIsBKP.Index] := TotalDisc;
  DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODTotal.Index] := SubTotal;


  edSubTotal.Value := DCItem.GetFooterSummary(cxgrdclmnPODSubTotal);
  edDisc1.Value := DCItem.GetFooterSummary(cxgrdclmnPODTotalDisc);
  edPPN.Value := DCItem.GetFooterSummary(cxgrdclmnPODTotalTax);
  edTotal.Value := DCItem.GetFooterSummary(cxgrdclmnPODTotal);
end;

function TfrmPORevision.ValidateData: Boolean;
begin
  Result := False;


  if edsubtotal.value <= 0 then
  begin
    TAppUtils.Error('Subtotal <= 0');
    exit;
  end;

  If not TAppUtils.Confirm('Anda yakin..?') then
    exit;

  Result := True;
end;

end.
