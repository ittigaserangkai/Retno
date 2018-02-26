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
  cxCalc, uAppUtils, uModSuplier, uModSO, uModSatuan;

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
    cxgrdclmnPODBS: TcxGridColumn;
    procedure actSaveExecute(Sender: TObject);
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

procedure TfrmPORevision.actSaveExecute(Sender: TObject);
begin
  inherited;
  SimpanData;
end;

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
  cbbSupMGNama.Properties.LoadFromCDS(FCDSSupMG,'SUPLIER_MERCHAN_GRUP_ID','SUPMG_SUB_CODE',
    ['SUPLIER_MERCHAN_GRUP_ID','REF$MERCHANDISE_ID', 'REF$MERCHANDISE_GRUP_ID'],Self);
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
  SubTotal, Disc1, Disc2, HargaStlDisc, TotalDisc, PPN, PPNBM, TotalTax, Total : Double;
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
        Values[i, cxgrdclmnPODID.Index]     := FPOLama.POItems[i].POD_BARANG.ID;
        Values[i, cxgrdclmnPODSKU.Index]    := FPOLama.POItems[i].POD_BARANG.BRG_CODE;
        Values[i, cxgrdclmnPODNama.Index]   := FPOLama.POItems[i].POD_BARANG.BRG_NAME;
        Values[i, cxgrdclmnPODUOMID.Index]  := FPOLama.POItems[i].POD_UOM.ID;
        Values[i, cxgrdclmnPODUOM.Index]    := FPOLama.POItems[i].POD_UOM.SAT_NAME;
        Values[i, cxgrdclmnPODJumlah.Index] := FPOLama.POItems[i].POD_QTY_ORDER;
        Values[i, cxgrdclmnPODBS.Index]     := FPOLama.POItems[i].POD_BARANG_SUPPLIER.ID;

        lBS := DMClient.CrudClient.Retrieve(TModBarangSupplier.ClassName,
          FPOLama.POItems[i].POD_BARANG_SUPPLIER.ID
        ) as TModBarangSupplier;
        Try
          SubTotal := FPOLama.POItems[i].POD_QTY_ORDER * lBS.BRGSUP_BUY_PRICE;
          Values[i, cxgrdclmnPODHarga.Index]    := lBS.BRGSUP_BUY_PRICE;
          Values[i, cxgrdclmnPODSubTotal.Index] := SubTotal;
          Values[i, cxgrdclmnPODDisc1.Index]    := lBS.BRGSUP_DISC1;
          Values[i, cxgrdclmnPODDisc2.Index]    := lBS.BRGSUP_DISC2;
          Values[i, cxgrdclmnPODDisc3.Index]    := lBS.BRGSUP_DISC3;

          Disc1 := FPOLama.POItems[i].POD_QTY_ORDER
              * (lBS.BRGSUP_DISC1 / 100 * lBS.BRGSUP_BUY_PRICE);

          Disc2 := (SubTotal - Disc1)
              * lBS.BRGSUP_DISC2 / 100
              * lBS.BRGSUP_BUY_PRICE;

          TotalDisc := Disc1 + Disc2
              + (lBS.BRGSUP_DISC3
              * FPOLama.POItems[i].POD_QTY_ORDER);

          HargaStlDisc := (SubTotal - TotalDisc)
              / FPOLama.POItems[i].POD_QTY_ORDER;

          Values[i, cxgrdclmnPODPPN.Index] := lBS.BRGSUP_IS_BKP
              * 10 / 100
              * HargaStlDisc;

          Values[i, cxgrdclmnPODPPNBM.Index] := 0;

          PPN := FPOLama.POItems[i].POD_QTY_ORDER
              * lBS.BRGSUP_IS_BKP * 10 / 100 * HargaStlDisc;

//          PPNBM rung digawe, jare pak bagus ora perlu soale ora ono barang mewah

          TotalTax := PPN + PPNBM;

          Values[i, cxgrdclmnPODTotalDisc.Index]  := TotalDisc;
          Values[i, cxgrdclmnPODPPN.Index]        := PPN;
          Values[i, cxgrdclmnPODPPNBM.Index]      := PPNBM;
          Values[i, cxgrdclmnPODTotalTax.Index]   := TotalTax;
          Total                                   := SubTotal - TotalDisc + TotalTax;
          Values[i, cxgrdclmnPODTotal.Index]      := Total;
          Values[i, cxgrdclmnPODIsBKP.Index]      := lBS.BRGSUP_IS_BKP;
        finally
          lBS.Free;
        End;
        Post;
      End;
  end;
  edSubTotal.Value  := vartofloat(cxGridTablePODetil.DataController.GetFooterSummary(cxgrdclmnPODSubTotal));
  edDisc1.Value     := vartofloat(cxGridTablePODetil.DataController.GetFooterSummary(cxgrdclmnPODTotalDisc));
  edPPN.Value       := vartofloat(cxGridTablePODetil.DataController.GetFooterSummary(cxgrdclmnPODTotalTax));
  edTotal.Value     := vartofloat(cxGridTablePODetil.DataController.GetFooterSummary(cxgrdclmnPODTotal));
end;

procedure TfrmPORevision.SimpanData;
begin
  if not ValidateData then exit; //validasi
  UpdateData;

  Try
    if FPOLama = nil then
      raise Exception.Create('FPOLama = nil');

//    if not DMCLient.CrudPOClient.CancelPO(FPOLama.ID) then
//      raise Exception.Create('Gagal Update Status PO Lama');

    PORev.ID := DMClient.CrudPOClient.SaveToDBID(PORev);
    TAppUtils.Information(_MSG_BERHASIL_SIMPAN);
    Self.ModalResult := mrOk;
  except
    TAppUtils.Error(_MSG_GAGAL_SIMPAN);
    raise;
  End;

end;

procedure TfrmPORevision.UpdateData;
var
  i: Integer;
  lItem: TModPOItem;
begin
//  PORev.PO_NO   :=  harus otomatis
  if Assigned(FPORev) then FreeAndNil(FPORev); //mengclear object

  if PORev.ID = '' then
    PORev.PO_NO := DMClient.CrudPOClient.GenerateNo(TModPO.ClassName);


  PORev.PO_DATE                   :=  edPODate.Date;
  PORev.PO_SO                     :=  TModSO.CreateID(cbbSO.EditValue);
  PORev.PO_SUPPLIER_MERCHAN_GRUP  :=  TModSuplierMerchanGroup.CreateID(cbbSupplier.EditValue);
  PORev.PO_SUPPLIER               :=  TModSuplier.CreateID(cbbSupMGNama.EditValue);
  PORev.PO_TOP                    :=  StrToInt(edtop.Text);
  PORev.PO_VALID_DATE             :=  edValidUntil.Date;
  PORev.PO_TOTAL                  :=  edTotal.Value;
  PORev.PO_PPN                    :=  edPPN.Value;
  PORev.PO_DISC                   :=  edDisc1.Value;
  PORev.PO_PPNBM                  :=  cxGridTablePODetil.GetFooterSummary(cxgrdclmnPODPPN);
  PORev.PO_COLIE                  :=  cxGridTablePODetil.GetFooterSummary(cxgrdclmnPODJumlah);
//  PORev.PO_TOP                    :=  edtop.Text;
  PORev.PO_NO_REF                 :=  edPOLama.Text;
  //Deskripsi         ga ada di form
  //service level     ga ada di form
  //deskripsi print   ga ada di form
  //is bonus          ga ada di form
  //gr alamat         ga ada di form
  //print count       ga ada di form
  //disk tambahan     ga ada di form
  //disk promo        ga ada di form
  //disk lain         ga ada di form


  PORev.POItems.Clear;
  // lanjutin ngisi detail


  for i := 0 to cxGridTablePODetil.DataController.RecordCount-1 do
    begin
      lItem := TModPOItem.Create;
      lItem.POD_BARANG          :=  TModBarang.CreateID(cxGridTablePODetil.Values(i,cxgrdclmnPODSKU.Index));
      lItem.POD_UOM             :=  TModSatuan.CreateID(cxGridTablePODetil.Values(i,cxgrdclmnPODUOM.Index));
      lItem.POD_BARANG_SUPPLIER := TModBarangSupplier.CreateID(cxGridTablePODetil.Values(i,cxgrdclmnPODBS.Index));

      //                        Mod Asal              tabel                       kolom
      lItem.POD_QTY_ORDER     :=  VarToFloat(cxGridTablePODetil.Values(i,cxgrdclmnPODJumlah.Index));
      //                        Konversi Varchar ke Double
      lItem.POD_PRICE         :=  cxGridTablePODetil.Values(i,cxgrdclmnPODHarga.Index);
      lItem.POD_DISC1         :=  cxGridTablePODetil.Values(i,cxgrdclmnPODDisc1.Index);
      lItem.POD_DISC2         :=  cxGridTablePODetil.Values(i,cxgrdclmnPODDisc2.Index);
      lItem.POD_DISC3         :=  cxGridTablePODetil.Values(i,cxgrdclmnPODDisc3.Index);
      lItem.POD_PPN           :=  VarToFloat(cxGridTablePODetil.Values(i,cxgrdclmnPODPPN.Index));
      lItem.POD_PPNBM         :=  VarToFloat(cxGridTablePODetil.Values(i,cxgrdclmnPODPPNBM.Index));
      lItem.POD_TOTAL_DISC    :=  VarToFloat(cxGridTablePODetil.Values(i,cxgrdclmnPODTotalDisc.Index));
      lItem.POD_TOTAL_TAX     :=  VarToFloat(cxGridTablePODetil.Values(i,cxgrdclmnPODTotalTax.Index));
      lItem.POD_TOTAL         :=  VarToFloat(cxGridTablePODetil.Values(i,cxgrdclmnPODTotal.Index));

      lItem.POD_BARANG.Reload();
      lItem.POD_BARANG.RefPajak.Reload();
      lItem.POD_BARANG_SUPPLIER.Reload();

      lItem.POD_IS_STOCK      :=  lItem.POD_BARANG.BRG_IS_STOCK;
      lItem.POD_IS_BKP        :=  lItem.POD_BARANG_SUPPLIER.BRGSUP_IS_BKP;

//      lItem.POD_PPN_PERSEN    :=  (lItem.POD_BARANG.RefPajak.PJK_PPN);
      lItem.POD_PPNBM_PERSEN  :=  lItem.POD_BARANG.RefPajak.PJK_PPNBM;

      //cara 1 : ambil master
      //cara 2 : buatkan interface -> di hidden

      //pod_total temp :   baseprice - diskon + ppn + ppnbm (Belum dikali qty)
      //POD_PPN_PERSEN : ambil status di poitem lama
      //POD_PPNBM_PERSEN : ambil status di poitem lama

      PORev.POItems.Add(lItem);
    end;

end;

procedure TfrmPORevision.UpdateEditData;
var
  Disc1, Disc2, HargaStlDisc, SubTotal, Total, TotalDisc, PPN, PPNBM, TotalTax : Double;
  i: Integer;
  lBS: TModBarangSupplier;
begin
  lBS := DMClient.CrudClient.Retrieve(TModBarangSupplier.ClassName,
            FPOLama.POItems[i].POD_BARANG_SUPPLIER.ID
          ) as TModBarangSupplier;
  DCItem.Post;
  SubTotal := DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODJumlah.Index]
      * DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODHarga.Index];

  Disc1 := DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODJumlah.Index]
      * (DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODDisc1.Index] / 100
      * DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODHarga.Index]);

  Disc2 := (SubTotal - Disc1)
      * (DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODDisc2.Index] / 100
      * DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODHarga.Index]);

  TotalDisc := Disc1
      + Disc2
      + (DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODDisc3.Index]
      * DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODJumlah.Index]);

  HargaStlDisc := (SubTotal - TotalDisc)
      / DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODJumlah.Index];

  Total := SubTotal - TotalDisc;

  PPN :=  DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODJumlah.Index]
              * lBS.BRGSUP_IS_BKP
              * 10 / 100 * HargaStlDisc;

//  PPNBM := durung digawe, jare pak bagus kosong terus

  TotalTax := PPN + PPNBM;

  DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODSubTotal.Index]  := SubTotal;
  DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODTotalDisc.Index] := TotalDisc; //iki py?
  DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODPPN.Index]       := PPN;
  DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODPPNBM.Index]     := PPNBM;
  DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODTotalTax.Index]  := TotalTax;
//  DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODIsBKP.Index]     := TotalDisc; //iki py?
  DCItem.values[DCItem.FocusedRecordIndex, cxgrdclmnPODTotal.Index]     := Total;


  edSubTotal.Value  := DCItem.GetFooterSummary(cxgrdclmnPODSubTotal);
  edDisc1.Value     := DCItem.GetFooterSummary(cxgrdclmnPODTotalDisc);
  edPPN.Value       := DCItem.GetFooterSummary(cxgrdclmnPODTotalTax);
  edTotal.Value     := DCItem.GetFooterSummary(cxgrdclmnPODTotal);
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
