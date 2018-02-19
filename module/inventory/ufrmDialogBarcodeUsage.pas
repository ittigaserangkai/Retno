unit ufrmDialogBarcodeUsage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  ufrmMasterDialog, System.Actions, Vcl.ActnList, ufraFooterDialog3Button,
  Vcl.ExtCtrls, uInterface, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls, cxContainer,
  cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxLabel, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Vcl.StdCtrls, cxButtons, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxCheckBox, uDMClient, cxMemo, Datasnap.DBClient,
  uDBUtils, System.DateUtils, cxCurrencyEdit, uDXUtils, uModBarcodeUsage,
  cxButtonEdit, uModOrganization;

type
  TfrmDialogBarcodeUsage = class(TfrmMasterDialog, ICRUDAble)
    pnlFilter: TPanel;
    btnSearch: TcxButton;
    dtAkhirFilter: TcxDateEdit;
    lblFilterData: TcxLabel;
    dtAwalFilter: TcxDateEdit;
    lblsdFilter: TcxLabel;
    cxgrdlvlBarcodeUsage: TcxGridLevel;
    cxgrdBarcodeUsage: TcxGrid;
    pnlHeder: TPanel;
    pnlCaption: TPanel;
    lblNoBukti: TLabel;
    lblTanggal: TLabel;
    lblKeterangan: TLabel;
    edNoBukti: TcxTextEdit;
    dtTanggal: TcxDateEdit;
    memKeterangan: TcxMemo;
    cxGridDBTableBarcodeUsage: TcxGridDBTableView;
    cxGridColSupplier: TcxGridDBColumn;
    cxGridColNo: TcxGridDBColumn;
    cxGridColTgl: TcxGridDBColumn;
    cxGridColNominal: TcxGridDBColumn;
    lblOrganizasi: TLabel;
    edOrganization: TcxButtonEdit;
    edOrganizationName: TcxTextEdit;
    procedure actDeleteExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure edOrganizationPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    FCDSBarcodeReq: TClientDataSet;
    FCDSDetail: TClientDataset;
    FCDSOrganisasi: TClientDataset;
    FModBarcodeUsage: TModBarcodeUsage;
    function GetCDSDetail: TClientDataset;
    function GetCDSOrganisasi: TClientDataset;
    function GetModBarcodeUsage: TModBarcodeUsage;
    function IsValidate: Boolean;
    procedure UpdateData;
    property CDSDetail: TClientDataset read GetCDSDetail write FCDSDetail;
    property CDSOrganisasi: TClientDataset read GetCDSOrganisasi write
        FCDSOrganisasi;
    property ModBarcodeUsage: TModBarcodeUsage read GetModBarcodeUsage write
        FModBarcodeUsage;
  public
    procedure LoadData(AID : String);
  end;

var
  frmDialogBarcodeUsage: TfrmDialogBarcodeUsage;

implementation

uses
  uAppUtils, uConstanta, ufrmCXLookUp, udmReport, uRetnoUnit, uModelHelper,
  uModBarcodeRequest;

{$R *.dfm}

procedure TfrmDialogBarcodeUsage.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if TAppUtils.Confirm(CONF_VALIDATE_FOR_DELETE) then
  begin
    try
      DMClient.CrudClient.DeleteFromDB(ModBarcodeUsage);
      TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
      ModalResult := mrOk;
    except
      TAppUtils.Error(ER_DELETE_FAILED);
      raise;
    end;
  end;
end;

procedure TfrmDialogBarcodeUsage.actPrintExecute(Sender: TObject);
begin
  inherited;
//  DmReport.ExecuteReport(
//    'reports\BarcodeUsage_Slip',
//    DMReport.ReportClient.BarcodeUsage_SlipByID(ModBarcodeUsage.ID),
//    []
//  );
end;

procedure TfrmDialogBarcodeUsage.actSaveExecute(Sender: TObject);
begin
  inherited;
  if IsValidate then
  begin
    Try
      UpdateData;
      DMClient.CrudClient.SaveToDB(ModBarcodeUsage);
      TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
      ModalResult := mrOk;
    except
      TAppUtils.Error(ER_INSERT_FAILED);
      Raise;
    End;
  end;
end;

procedure TfrmDialogBarcodeUsage.FormCreate(Sender: TObject);
begin
  inherited;
  ClearByTag([0,1]);
  dtTanggal.Date := Now;
  cxGridDBTableBarcodeUsage.PrepareFromCDS(CDSDetail);
  cxGridDBTableBarcodeUsage.ApplyBestFit();
end;

procedure TfrmDialogBarcodeUsage.btnSearchClick(Sender: TObject);
var
  iBaris: Integer;
begin
  inherited;
  if Assigned(FCDSDetail) then FreeAndNil(FCDSDetail);
    CDSDetail.EmptyDataSet;

  if not Assigned(ModBarcodeUsage.BU_SUPMG_ID) then
  begin
    TAppUtils.Warning('Organisasi belum diisi');
    exit;
  end;

  FCDSBarcodeReq := TDBUtils.DSToCDS(DMClient.DSProviderClient.BarcodeRequest_GetDSOverview(StartOfTheDay(dtAwalFilter.Date), EndOfTheDay(dtAkhirFilter.Date), TRetno.UnitStore, ModBarcodeUsage.BU_SUPMG_ID.ID) ,Self );

  if FCDSBarcodeReq = nil then
    Exit;

  FCDSBarcodeReq.First;
  while not FCDSBarcodeReq.Eof do
  begin
    CDSDetail.Append;
    CDSDetail.FieldByName('BUI_BARCODEREQUEST').Value := FCDSBarcodeReq.FieldByName('BARCODEREQUEST_ID').AsString;
    CDSDetail.FieldByName('BUI_KETERANGAN').Value     := FCDSBarcodeReq.FieldByName('TANGGAL').AsDateTime;
    CDSDetail.FieldByName('BUI_NOMINAL').Value        := FCDSBarcodeReq.FieldByName('TOTAL').AsFloat;
//    CDSDetail.FieldByName('BUI_REKENING').Value := '';
    CDSDetail.Post;
    FCDSBarcodeReq.Next;
  end;
end;

procedure TfrmDialogBarcodeUsage.edOrganizationPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  with TfrmCXLookup.Execute(CDSOrganisasi, False, 'Look Up Data') do
  begin
    Try
      HideFields(['V_ORGANIZATION_ID', 'ORG_MerchandiseGroup_id', 'ORG_Member_ID', 'ORG_Karyawan_ID', 'DATE_CREATE', 'DATE_MODIFY']);
      if ShowModal = mrOK then
      begin
        edOrganization.EditValue      := Data.FieldByName('ORG_Code').AsString;
        edOrganizationName.EditValue  := Data.FieldByName('ORG_Name').AsString;
        ModBarcodeUsage.BU_SUPMG_ID   := TModOrganization.CreateID(Data.FieldByName('V_ORGANIZATION_ID').AsString);
      end;
    Finally
      free;
    End;
  end;
end;

function TfrmDialogBarcodeUsage.GetCDSDetail: TClientDataset;
begin
  if not Assigned(FCDSDetail) then
  begin
    FCDSDetail := TDBUtils.CreateObjectDataSet(TModBarcodeUsageItem, Self, False);
    FCDSDetail.AddField('NOBUKTI', ftString);
    FCDSDetail.AddField('TANGGAL', ftDate);
    FCDSDetail.AddField('REKENING', ftString);
    FCDSDetail.CreateDataSet;
  end;

  Result := FCDSDetail;
end;

function TfrmDialogBarcodeUsage.GetCDSOrganisasi: TClientDataset;
begin
  if FCDSOrganisasi = nil then
    FCDSOrganisasi := TDBUtils.DSToCDS(DMClient.DSProviderClient.Organization_Lookup(1), Self);

  Result := FCDSOrganisasi;
end;

function TfrmDialogBarcodeUsage.GetModBarcodeUsage: TModBarcodeUsage;
begin
  if not Assigned(FModBarcodeUsage) then
    FModBarcodeUsage := TModBarcodeUsage.Create;

  Result := FModBarcodeUsage;
end;

function TfrmDialogBarcodeUsage.IsValidate: Boolean;
begin
  Result := False;

  if edNoBukti.EditValue = '' then
  begin
    TAppUtils.Warning('No. Bukti belum diisi');
    Exit;
  end else
    Result := True;
end;

procedure TfrmDialogBarcodeUsage.LoadData(AID : String);
var
  i: Integer;
  lItem: TModBarcodeUsageItem;
begin
  ClearByTag([0,1]);
  dtTanggal.Date := Now;

  if AID = '' then Exit;

  if Assigned(FModBarcodeUsage) then FreeAndNil(FModBarcodeUsage);
  FModBarcodeUsage := DMClient.CrudClient.Retrieve(TModBarcodeUsage.ClassName, AID) as TModBarcodeUsage;
  ModBarcodeUsage.BU_SUPMG_ID.Reload();

  edNoBukti.EditValue          := ModBarcodeUsage.BU_NO;
  dtTanggal.EditValue          := ModBarcodeUsage.BU_TANGGAL;
  edOrganization.EditValue     := ModBarcodeUsage.BU_SUPMG_ID.ORG_Code;
  edOrganizationName.EditValue := ModBarcodeUsage.BU_SUPMG_ID.ORG_Name;
  memKeterangan.EditValue      := ModBarcodeUsage.BU_KETERANGAN;

  for i := 0 to ModBarcodeUsage.BarcodeUsageItems.Count-1 do
  begin
    lItem := ModBarcodeUsage.BarcodeUsageItems[i];

    CDSDetail.Append;
    lItem.UpdateToDataset(CDSDetail);
//    CDSDetail.FieldByName('BRG_KODE').Value := lItem.POTITEM_BARANG.BRG_CODE;
    CDSDetail.Post;
  end;
end;

procedure TfrmDialogBarcodeUsage.UpdateData;
var
  lItem: TModBarcodeUsageItem;
begin
  if ModBarcodeUsage.ID = '' then
  begin
    ModBarcodeUsage.BU_NO := DMClient.CrudClient.GenerateNo(TModBarcodeUsage.ClassName);
  end;

  ModBarcodeUsage.BU_KETERANGAN := VarToStr(memKeterangan.EditValue);
  ModBarcodeUsage.BU_TANGGAL    := dtTanggal.EditValue;
  ModBarcodeUsage.BU_UNIT       := TRetno.UnitStore;
  ModBarcodeUsage.BU_TOTAL      := cxGridDBTableBarcodeUsage.DataController.GetFooterSummary(0);

  ModBarcodeUsage.BarcodeUsageItems.Clear;
  CDSDetail.First;
  while not CDSDetail.Eof do
  begin
    lItem := TModBarcodeUsageItem.Create;
    lItem.SetFromDataset(CDSDetail);
    ModBarcodeUsage.BarcodeUsageItems.Add(lItem);
    CDSDetail.Next;
  end;
end;

end.
