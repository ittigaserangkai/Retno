unit ufrmDialogCustomerInvoice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxLabel,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxDropDownEdit, cxCalendar, cxTextEdit,
  cxMaskEdit, cxButtonEdit, Vcl.StdCtrls, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, cxDBExtLookupComboBox, cxCurrencyEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxGridCustomView, cxGrid, cxMemo, cxListView, uInterface, uDXUtils,
  ufrmCXLookup, uModOrganization, Datasnap.DBClient, uDBUtils,
  uModCustomerInvoice, uAppUtils, uRetnoUnit, cxLookupEdit, cxDBLookupEdit, uModRekening;

type
  TfrmDialogCustomerInvoice = class(TfrmMasterDialog, ICRUDAble)
    pnlHeader: TPanel;
    lblNoBukti: TLabel;
    lblTanggal: TLabel;
    lblOrganizasi: TLabel;
    edOrganizationName: TcxButtonEdit;
    edNoBukti: TcxButtonEdit;
    edOrganization: TcxButtonEdit;
    dtTanggal: TcxDateEdit;
    cxgrdDetail: TcxGrid;
    cxGridTableARNew: TcxGridTableView;
    cxGridColARRekeningNama: TcxGridColumn;
    cxGridColARRekening: TcxGridColumn;
    cxGridColARKeterangan: TcxGridColumn;
    cxGridColARNominal: TcxGridColumn;
    cxgrdlvlAPList: TcxGridLevel;
    memDesc: TcxMemo;
    lblKeteranan: TLabel;
    cbbRekPiutangLain: TcxExtLookupComboBox;
    lblRekening: TLabel;
    edNoRef: TcxButtonEdit;
    lblNoRef: TLabel;
    cbbRekPiutangLainNama: TcxExtLookupComboBox;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edOrganizationPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edOrganizationPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridTableARNewDataControllerAfterInsert(
      ADataController: TcxCustomDataController);
    procedure cbbRekPiutangLainPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridColARRekeningPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridColARRekeningNamaPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    FCDSOrganisasi: tclientDataSet;
    FCDSRekeningPendapatanLain: TClientDataset;
    FCDSRekeningPiutangLain: tclientDataSet;
    FCI: TModCustomerInvoice;
    FOrganization: TModOrganization;
    function GetCDSOrganisasi: tclientDataSet;
    function GetCI: TModCustomerInvoice;
    procedure InisialisasiCBBRekeningPiutang;
    procedure InisialisasiRekeningTagihanDetail;
    function IsBisaHapus: Boolean;
    function IsBisaSimpan: Boolean;
    procedure LoadDataARNew;
    procedure LoadDataOrganization(AKodeAtauID : String; AIsLoadByKode : Boolean);
    property CDSOrganisasi: tclientDataSet read GetCDSOrganisasi write
        FCDSOrganisasi;
    { Private declarations }
  protected
  public
    procedure LoadData(AID : String);
    property CI: TModCustomerInvoice read GetCI write FCI;
    { Public declarations }
  end;

var
  frmDialogCustomerInvoice: TfrmDialogCustomerInvoice;

implementation

{$R *.dfm}

uses uDMClient;

procedure TfrmDialogCustomerInvoice.actDeleteExecute(Sender: TObject);
begin
  inherited;

  if not IsBisaHapus then
    Exit;

  if DMClient.CrudCustomerInvoiceClient.DeleteFromDB(CI) then
  begin
    Self.ModalResult := mrOk;
  end;
end;

procedure TfrmDialogCustomerInvoice.actSaveExecute(Sender: TObject);
var
  I: Integer;
  lModCustomerInvoiceARNew: TModCustomerInvoiceARNew;
begin
  inherited;

  if not IsBisaSimpan then
    Exit;

  CI.CI_NOBUKTI         := edNoBukti.Text;
  CI.CI_Description     := memDesc.Text;
  CI.CI_ORGANIZATION    := TModOrganization.CreateID(FOrganization.ID);
  CI.CI_TRANSDATE       := dtTanggal.Date;
  CI.CI_NOINVOICE       := edNoRef.Text;
  CI.CI_Description     := memDesc.Text;
  CI.CI_REKENING        := TModRekening.CreateID(cbbRekPiutangLain.EditValue);

  try
    CI.CustomerInvoiceARNewItems.Clear;
    for I := 0 to cxGridTableARNew.DataController.RecordCount - 1 do
    begin
      lModCustomerInvoiceARNew := TModCustomerInvoiceARNew.Create;
      cxGridTableARNew.LoadObjectData(lModCustomerInvoiceARNew,i);
      CI.CustomerInvoiceARNewItems.Add(lModCustomerInvoiceARNew);
    end;

    if DMClient.CrudCustomerInvoiceClient.SaveToDB(CI) then
    begin
      TAppUtils.InformationBerhasilSimpan;
      Self.ModalResult := mrOk;
    end;
  except
    raise;
  end;

end;

procedure TfrmDialogCustomerInvoice.cbbRekPiutangLainPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  cbbRekPiutangLainNama.EditValue := FCDSRekeningPiutangLain.FieldByName('rekening_id').AsString;
end;

procedure TfrmDialogCustomerInvoice.cxGridColARRekeningNamaPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  cxGridTableARNew.SetValue(cxGridTableARNew.DataController.FocusedRecordIndex, cxGridColARRekening.Index, FCDSRekeningPendapatanLain.FieldByName('rekening_id').AsString);
end;

procedure TfrmDialogCustomerInvoice.cxGridColARRekeningPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  cxGridTableARNew.SetValue(cxGridTableARNew.DataController.FocusedRecordIndex, cxGridColARRekeningNama.Index, FCDSRekeningPendapatanLain.FieldByName('rekening_id').AsString);
end;

procedure TfrmDialogCustomerInvoice.cxGridTableARNewDataControllerAfterInsert(
  ADataController: TcxCustomDataController);
begin
  inherited;
//  ADataController.Values[ADataController.FocusedRecordIndex, cxGridColARNoBukti.Index] := edNoBukti.Text + '-xx';
//  ADataController.Values[ADataController.FocusedRecordIndex, cxGridColARTanggal.Index] := dtTanggal.Date;
//  ADataController.Values[ADataController.FocusedRecordIndex, cxGridColARJatuhTempo.Index] := dtTanggal.Date + 1;
end;

procedure TfrmDialogCustomerInvoice.edOrganizationPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  with TfrmCXLookup.Execute(CDSOrganisasi,False, 'Look Up Data') do
  begin
    Try
      HideFields(['V_ORGANIZATION_ID', 'ORG_MerchandiseGroup_id','ORG_Member_ID','ORG_Karyawan_ID','DATE_CREATE','DATE_MODIFY']);
      if ShowModal = mrOK then
      begin
        edOrganization.Text := Data.FieldByName('org_code').AsString;
        LoadDataOrganization(edOrganization.Text, True);
      end;
    Finally
      free;
    End;
  end;
end;

procedure TfrmDialogCustomerInvoice.edOrganizationPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  LoadDataOrganization(DisplayValue, True);
end;

procedure TfrmDialogCustomerInvoice.FormCreate(Sender: TObject);
begin
  inherited;
  LoadData('');

  InisialisasiCBBRekeningPiutang;
  InisialisasiRekeningTagihanDetail;
end;

function TfrmDialogCustomerInvoice.GetCDSOrganisasi: tclientDataSet;
begin
  if FCDSOrganisasi = nil then
    FCDSOrganisasi := TDBUtils.DSToCDS(DMClient.DSProviderClient.Organization_GetDSLookup(), Self);

  Result := FCDSOrganisasi;
end;

function TfrmDialogCustomerInvoice.GetCI: TModCustomerInvoice;
begin
  if FCI = nil then
    FCI := TModCustomerInvoice.Create;

  Result := FCI;
end;

procedure TfrmDialogCustomerInvoice.InisialisasiCBBRekeningPiutang;
begin
  FCDSRekeningPiutangLain := TDBUtils.DSToCDS(DMClient.DSProviderClient.Rekening_GetDSLookupFilter(TRetno.SettingApp.REKENING_PIUTANG_LAIN), Self, False);

  cbbRekPiutangLain.LoadFromCDS(FCDSRekeningPiutangLain,'rekening_id','rek_code',['rekening_id','REF$GRUP_REKENING_ID','REK_DESCRIPTION'],Self);
  cbbRekPiutangLain.SetMultiPurposeLookup;

  cbbRekPiutangLainNama.LoadFromCDS(FCDSRekeningPiutangLain,'rekening_id','rek_name',['rekening_id','REF$GRUP_REKENING_ID','REK_DESCRIPTION'],Self);
  cbbRekPiutangLainNama.SetMultiPurposeLookup;

end;

procedure TfrmDialogCustomerInvoice.InisialisasiRekeningTagihanDetail;
begin
  FCDSRekeningPendapatanLain := TDBUtils.DSToCDS(DMClient.DSProviderClient.Rekening_GetDSLookupFilter(TRetno.SettingApp.REKENING_PENDAPATAN_LAIN), Self, False);

  TcxExtLookupComboBoxProperties(cxGridTableARNew.Columns[cxGridColARRekening.Index].Properties).LoadFromCDS(FCDSRekeningPendapatanLain,'rekening_id', 'rek_code',['rekening_id','REF$GRUP_REKENING_ID','REK_DESCRIPTION'],Self);
  TcxExtLookupComboBoxProperties(cxGridTableARNew.Columns[cxGridColARRekening.Index].Properties).SetMultiPurposeLookup;

  TcxExtLookupComboBoxProperties(cxGridTableARNew.Columns[cxGridColARRekeningNama.Index].Properties).LoadFromCDS(FCDSRekeningPendapatanLain,'rekening_id', 'rek_name',['rekening_id','REF$GRUP_REKENING_ID','REK_DESCRIPTION'],Self);
  TcxExtLookupComboBoxProperties(cxGridTableARNew.Columns[cxGridColARRekeningNama.Index].Properties).SetMultiPurposeLookup;
end;

function TfrmDialogCustomerInvoice.IsBisaHapus: Boolean;
begin
  Result := False;

  if not TAppUtils.Confirm('Anda yakin akan menghapus data ?') then
    Exit;

  Result := True;
end;

function TfrmDialogCustomerInvoice.IsBisaSimpan: Boolean;
begin
  Result := False;

  if not ValidateEmptyCtrl([1]) then
    Exit;

  if FOrganization = nil then
  begin
    TAppUtils.Warning('Organisasi Belum Dipilih');
    edOrganization.SetFocus;
    Exit;
  end else if FOrganization.id = '' then
  begin
    TAppUtils.Warning('Organisasi Belum Dipilih');
    edOrganization.SetFocus;
    Exit;
  end;


  Result := True;
end;

procedure TfrmDialogCustomerInvoice.LoadData(AID : String);
begin
  ClearByTag([0,1]);
  edNoBukti.Text := 'Otomatis';
  FreeAndNil(FCI);

  if AID = '' then
    Exit;

  FCI := TModCustomerInvoice(DMClient.CrudCustomerInvoiceClient.Retrieve(TModCustomerInvoice.ClassName, AID));
  if FCI = nil then
    Exit;

  edNoBukti.Text := CI.CI_NOBUKTI;
  memDesc.Text   := CI.CI_Description;
  dtTanggal.Date := CI.CI_TRANSDATE;
  edNoRef.Text   := CI.CI_NOINVOICE;

  cbbRekPiutangLain.EditValue     := CI.CI_REKENING.ID;
  cbbRekPiutangLainNama.EditValue := CI.CI_REKENING.ID;

  LoadDataOrganization(CI.CI_ORGANIZATION.ID, False);

  LoadDataARNew;
end;

procedure TfrmDialogCustomerInvoice.LoadDataARNew;
var
  I: Integer;
begin
  cxGridTableARNew.ClearRows;
  for I := 0 to CI.CustomerInvoiceARNewItems.Count - 1 do
  begin
    cxGridTableARNew.DataController.AppendRecord;
    cxGridTableARNew.SetObjectData(CI.CustomerInvoiceARNewItems[i], i);

    cxGridTableARNew.SetValue(i, cxGridColARRekeningNama.Index, CI.CustomerInvoiceARNewItems[i].CIPARNEW_REKENING.ID);
  end;
end;

procedure TfrmDialogCustomerInvoice.LoadDataOrganization(AKodeAtauID : String;
    AIsLoadByKode : Boolean);
begin
  edOrganizationName.Text := '';

  if AIsLoadByKode then
    FOrganization := DMClient.CrudClient.RetrieveByCode(TModOrganization.ClassName,  AKodeAtauID) as TModOrganization
  else begin
    FOrganization := DMClient.CrudClient.Retrieve(TModOrganization.ClassName,  AKodeAtauID) as TModOrganization;
    if FOrganization <> nil then
    edOrganization.Text := FOrganization.ORG_Code;
  end;

  if FOrganization <> nil then
    edOrganizationName.Text := FOrganization.ORG_Name;
end;

end.
