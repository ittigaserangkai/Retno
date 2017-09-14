unit ufrmDialogContrabonSales;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, Vcl.StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxGridLevel, cxGrid, cxCurrencyEdit, uDMClient,
  dxBarBuiltInMenu, cxPC, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar,
  Vcl.Menus, cxButtons, Datasnap.DBClient, uDBUtils,
  uDXUtils,uModOrganization, cxCheckBox,uModContrabonSales,
  System.Generics.Collections, uAppUtils, uModApp, uConstanta;

type
  TfrmDialogContrabonSales = class(TfrmMasterDialog)
    pnlHeader: TPanel;
    lblSupMG: TLabel;
    lblAlamat: TLabel;
    lblPostCode: TLabel;
    lblTelp: TLabel;
    lblNPWP: TLabel;
    cbbOrganisasi: TcxExtLookupComboBox;
    edAddress: TcxTextEdit;
    edPostCode: TcxTextEdit;
    edTelp: TcxTextEdit;
    edNPWP: TcxTextEdit;
    cxgrdlvlContrabon: TcxGridLevel;
    cxGridContrabon: TcxGrid;
    cxGridTableContrabonSales: TcxGridTableView;
    cxGridColContDate: TcxGridColumn;
    cxGridColContAmountGross: TcxGridColumn;
    cxGridColContAmountAdj: TcxGridColumn;
    cxGridColContFee: TcxGridColumn;
    cxGridColContPPN: TcxGridColumn;
    cxGridColContAmountNet: TcxGridColumn;
    pnlLoadSales: TPanel;
    pnlHeaderLoad: TPanel;
    lblP1: TLabel;
    lblP2: TLabel;
    dtP1: TcxDateEdit;
    dtP2: TcxDateEdit;
    btnLoadSales: TcxButton;
    cxGridColContPPNAmount: TcxGridColumn;
    lblPPN: TLabel;
    lblFee: TLabel;
    edPPN: TcxCurrencyEdit;
    edFee: TcxCurrencyEdit;
    cxGridColContIsClaimed: TcxGridColumn;
    cxGridColContID: TcxGridColumn;
    cxGridColContAmountSales: TcxGridColumn;
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbbOrganisasiPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridContrabonEnter(Sender: TObject);
    procedure cxGridTableContrabonSalesDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure cxGridTableContrabonSalesDataControllerAfterInsert(
      ADataController: TcxCustomDataController);
  private
    FCDSOrganisasi: tclientDataSet;
    FOrganization: TModOrganization;
    procedure HitungNilaiContrabon(AFocusedRecordIndex: Integer);
    procedure InisialisasiOrganisasi;
    procedure IsiDataAwalContrabonSales(AFocusedRecordIndex: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialogContrabonSales: TfrmDialogContrabonSales;

implementation

{$R *.dfm}

procedure TfrmDialogContrabonSales.actSaveExecute(Sender: TObject);
var
  I: Integer;
  lCS: TModContrabonSales;
  lListContranbonSales: TObjectList<TModApp>;
begin
  inherited;
  if not ValidateEmptyCtrl([1]) then
    Exit;

  lListContranbonSales := TObjectList<TModApp>.Create();
  try
    for I := 0 to cxGridTableContrabonSales.DataController.RecordCount - 1 do
    begin
      lCS := TModContrabonSales.Create();
      lCS.CONT_ORGANIZATION := TModOrganization.CreateID(cbbOrganisasi.EditValue);
      cxGridTableContrabonSales.LoadObjectData(lCS, i);
      lListContranbonSales.Add(lCS);
    end;

    if DMClient.CrudClient.SaveBatch(lListContranbonSales) then

    FreeAndNil(lListContranbonSales);

    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    ClearByTag([0,1]);
    cxGridTableContrabonSales.ClearRows;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  end;




end;

procedure TfrmDialogContrabonSales.cbbOrganisasiPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  if VarIsNull(DisplayValue) then
    Exit;

  FOrganization := DMClient.CrudClient.Retrieve(TModOrganization.ClassName,cbbOrganisasi.EditValueRest) as TModOrganization;
  if FOrganization <> nil then
  begin
    edAddress.Text  := FOrganization.org_address;
    edPostCode.Text := FOrganization.ORG_PostCode;
    edNPWP.Text     := FOrganization.ORG_NPWP;
    edTelp.Text     := FOrganization.ORG_Telp;
    edFee.Value     := FOrganization.ORG_FEE;
    edPPN.Value     := FOrganization.ORG_PPN;
  end;
end;

procedure TfrmDialogContrabonSales.cxGridContrabonEnter(Sender: TObject);
begin
  inherited;
  if cxGridTableContrabonSales.DataController.RecordCount = 0 then
  begin
    cxGridTableContrabonSales.DataController.AppendRecord;
    cxGridTableContrabonSales.DataController.FocusedRecordIndex := 0;
    IsiDataAwalContrabonSales(cxGridTableContrabonSales.DataController.FocusedRecordIndex);
  end;

end;

procedure TfrmDialogContrabonSales.cxGridTableContrabonSalesDataControllerAfterInsert(
  ADataController: TcxCustomDataController);
begin
  inherited;
  IsiDataAwalContrabonSales(ADataController.FocusedRecordIndex);
end;

procedure TfrmDialogContrabonSales.cxGridTableContrabonSalesDataControllerAfterPost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  HitungNilaiContrabon(ADataController.FocusedRecordIndex);
end;

procedure TfrmDialogContrabonSales.FormCreate(Sender: TObject);
begin
  inherited;
  ClearByTag([0,1]);
  dtP1.Date := Now;
  dtP2.Date := Now;

  cxGridTableContrabonSales.ClearRows;

  InisialisasiOrganisasi;
end;

procedure TfrmDialogContrabonSales.HitungNilaiContrabon(AFocusedRecordIndex:
    Integer);
var
  dDisc: Double;
  dFee: Double;
  dGrosSales: Double;
  dNet: Double;
  dPPN: Double;
  dTotalSales: Double;
begin
  dGrosSales  := cxGridTableContrabonSales.Double(AFocusedRecordIndex, cxGridColContAmountGross.Index);
  dDisc       := cxGridTableContrabonSales.Double(AFocusedRecordIndex, cxGridColContAmountAdj.Index);
  dFee        := cxGridTableContrabonSales.Double(AFocusedRecordIndex, cxGridColContFee.Index);

  dTotalSales := (100 - dFee) / 100 * (dGrosSales - dDisc);
  dPPN        := dTotalSales * (cxGridTableContrabonSales.Double(AFocusedRecordIndex, cxGridColContPPN.Index)) / 100;
  dNet        := dTotalSales - dPPN;

  cxGridTableContrabonSales.SetValue(AFocusedRecordIndex, cxGridColContAmountSales.Index, dTotalSales);
  cxGridTableContrabonSales.SetValue(AFocusedRecordIndex, cxGridColContPPNAmount.Index, dPPN);
  cxGridTableContrabonSales.SetValue(AFocusedRecordIndex, cxGridColContAmountNet.Index, dNet);
end;

procedure TfrmDialogContrabonSales.InisialisasiOrganisasi;
begin
  FreeAndNil(FCDSOrganisasi);

  FCDSOrganisasi          := TDBUtils.DSToCDS( DMClient.DSProviderClient.Organization_GetDSLookup(), Self );
  FCDSOrganisasi.Filter   := ' ORG_IsSupplierMG = 1';
  FCDSOrganisasi.Filtered := True;

  cbbOrganisasi.Properties.LoadFromCDS(FCDSOrganisasi,'V_ORGANIZATION_ID','ORG_Name',['V_ORGANIZATION_ID','ORG_MerchandiseGroup_id','DATE_CREATE','DATE_MODIFY','ORG_Member_ID','ORG_Karyawan_ID','ORG_IsSupplierMG','ORG_IsMember','ORG_IsKaryawan'],Self);
  cbbOrganisasi.Properties.SetMultiPurposeLookup;
end;

procedure TfrmDialogContrabonSales.IsiDataAwalContrabonSales(
    AFocusedRecordIndex: Integer);
begin
  if FOrganization = nil then
    Exit;

  cxGridTableContrabonSales.SetValue(AFocusedRecordIndex, cxGridColContDate.Index, Now);
  cxGridTableContrabonSales.SetValue(AFocusedRecordIndex, cxGridColContFee.Index, FOrganization.ORG_FEE);
  cxGridTableContrabonSales.SetValue(AFocusedRecordIndex, cxGridColContPPN.Index, FOrganization.ORG_PPN);
end;

end.
