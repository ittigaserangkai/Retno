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
  dxBarBuiltInMenu, cxPC, uDXUtils, Datasnap.DBClient, uDBUtils;

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
    lblPPNBM: TLabel;
    edPPN: TcxCurrencyEdit;
    edPPNBM: TcxCurrencyEdit;
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
    procedure FormCreate(Sender: TObject);
  private
    FCDS: TClientDataSet;
    FCDSSO: TClientDataSet;
    FCDSSupMG: TClientDataSet;
    FPOLama: TModPO;
    procedure InisialisasiCBBSO;
    procedure InisialisasiCBBSupMG;
    procedure InisialisasiCBBSupplier;
    { Private declarations }
  public
    procedure LoadData(AID : String);
    { Public declarations }
  end;

var
  frmPORevision: TfrmPORevision;

implementation

{$R *.dfm}

procedure TfrmPORevision.FormCreate(Sender: TObject);
begin
  inherited;
  InisialisasiCBBSupMG;
  InisialisasiCBBSupplier;
  InisialisasiCBBSO;
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
    cxGridTablePODetil.DataController.Append;
    cxGridTablePODetil.DataController.Values[i, cxgrdclmnPODSKU.Index] := FPOLama.POItems[i].POD_BARANG.ID;
    cxGridTablePODetil.DataController.Values[i, cxgrdclmnPODUOM.Index] := FPOLama.POItems[i].POD_UOM.ID;
    cxGridTablePODetil.DataController.Values[i, cxgrdclmnPODJumlah.Index] := FPOLama.POItems[i].POD_QTY_ORDER;
  end;
end;

end.
