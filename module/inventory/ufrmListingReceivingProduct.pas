unit ufrmListingReceivingProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, Mask, ActnList, System.Actions,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  Vcl.Menus, cxButtonEdit, ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  Data.DB, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, Datasnap.DBClient,
  uDBUtils, uDMClient, uDXUtils;


type
  TfrmListingReceivingProduct = class(TfrmMasterBrowse)
    cbbSUpMG: TcxExtLookupComboBox;
    llblSupMG: TcxLabel;
    procedure actAddExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure edtSupCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure edtSupCodeClickBtn(Sender: TObject);
//    procedure btnPrintDetailClick(Sender: TObject);
    procedure dtTglFromKeyPress(Sender: TObject; var Key: Char);
    procedure dtTglToKeyPress(Sender: TObject; var Key: Char);
    procedure edtMerClickBtn(Sender: TObject);
  private
    FCDS: TClientDataSet;
    FCDSSUPMG: TClientDataSet;
    procedure InisialisasiCBBSupMG; overload;
    { Private declarations }
  protected
    procedure RefreshData; override;
  public
    procedure LoadDataSupplier(aKodeSuplier : String; aUnitID : Integer);
    { Public declarations }
  published
  end;

var
  frmListingReceivingProduct: TfrmListingReceivingProduct;

implementation

uses  ufrmSearchSupplier, uDMReport, ufrmDialogPrintPreview, uRetnoUnit,
      ufrmGoodsReceiving, uAppUtils;

{$R *.dfm}

procedure TfrmListingReceivingProduct.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmGoodsReceiving);
end;

procedure TfrmListingReceivingProduct.FormCreate(Sender: TObject);
begin
  inherited;
  InisialisasiCBBSupMG;
end;

procedure TfrmListingReceivingProduct.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmGoodsReceiving, cxGridView.DS.FieldByName('DO_id').AsString);

end;

procedure TfrmListingReceivingProduct.edtSupCodeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F5 then
end;

procedure TfrmListingReceivingProduct.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    Action:= caFree;
end;

procedure TfrmListingReceivingProduct.FormDestroy(Sender: TObject);
begin
  inherited;
    frmListingReceivingProduct:= nil;
end;

procedure TfrmListingReceivingProduct.edtSupCodeClickBtn(Sender: TObject);
var
  sSQL: string;
begin
  sSQL := 'select sup_code as Kode, sup_name as Nama, sup_address as Alamat'
        + ' from suplier';
  {with cLookUp('Daftar Supplier', sSQL) do
  begin
    try
      if Strings[0] = '' then
        Exit;
      LoadDataSupplier(Strings[0], masternewunit.id);
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmListingReceivingProduct.LoadDataSupplier(aKodeSuplier : String;
    aUnitID : Integer);
begin
  {with TNewSupplier.Create(Self) do
  begin
    try
      if LoadByKode(aKodeSuplier) then
      begin
        edtSupName.Text     := Nama;
        edtSupCode.Text     := Kode;
      end
      else
      begin
        edtSupName.Text     := '';
        edtSupCode.Text     := '';
      end;
    finally
      Free;
    end;

  end;
  }
end;

procedure TfrmListingReceivingProduct.dtTglFromKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmListingReceivingProduct.dtTglToKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmListingReceivingProduct.edtMerClickBtn(Sender: TObject);
var
  sSQL: string;
begin
  inherited;

 
end;

procedure TfrmListingReceivingProduct.InisialisasiCBBSupMG;
begin
  FCDSSUPMG := TDBUtils.DSToCDS(DMClient.DSProviderClient.SuplierMerchan_GetDSLookup(), Self);
  cbbSUpMG.Properties.LoadFromCDS(FCDSSUPMG,'SUPLIER_MERCHAN_GRUP_ID','SUPMG_SUB_CODE',['SUPLIER_MERCHAN_GRUP_ID','REF$MERCHANDISE_ID', 'REF$MERCHANDISE_GRUP_ID'],Self);
  cbbSUpMG.Properties.SetMultiPurposeLookup;
end;

procedure TfrmListingReceivingProduct.RefreshData;
var
  sSupMGID: string;
  sUnitID: string;
begin
  inherited;
  if Assigned(FCDS) then FreeAndNil(FCDS);

  if cbbSUpMG.ItemIndex < 0 then
    sSupMGID := ''
  else
    sSupMGID := cbbSUpMG.EditValue;

  if TRetno.UnitStore <> nil then
    sUnitID := TRetno.UnitStore.ID;

  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.DO_GetDSOverview(dtAwalFilter.Date,dtAkhirFilter.Date,sUnitID, sSupMGID),Self );
  cxGridView.LoadFromCDS(FCDS);

  cxGridView.SetVisibleColumns(['DO_ID','AUT$UNIT_ID', 'REF$MERCHANDISE_ID', 'SUPLIER_MERCHAN_GRUP_ID'],False);
end;

end.



