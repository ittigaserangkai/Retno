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
  uModCustomerInvoice, uAppUtils;

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
    cxGridColARNoBukti: TcxGridColumn;
    cxGridColARTanggal: TcxGridColumn;
    cxGridColARJatuhTempo: TcxGridColumn;
    cxGridColAPRekeningID: TcxGridColumn;
    cxGridColARRekening: TcxGridColumn;
    cxGridColARKeterangan: TcxGridColumn;
    cxGridColARNominal: TcxGridColumn;
    cxGridTableOther: TcxGridTableView;
    cxGridColOtherKode: TcxGridColumn;
    cxGridColOtherNama: TcxGridColumn;
    cxGridColOtherCostCenter: TcxGridColumn;
    cxGridColOtherKeterangan: TcxGridColumn;
    cxGridColOtherBayar: TcxGridColumn;
    cxGridTableCheque: TcxGridTableView;
    cxGridColChequeNo: TcxGridColumn;
    cxGridColChequeJatuhTempo: TcxGridColumn;
    cxGridColChequeKeterangan: TcxGridColumn;
    cxGridColChequeBayar: TcxGridColumn;
    cxgrdlvlAPList: TcxGridLevel;
    cxgrdlvlOther: TcxGridLevel;
    cxgrdlvlCheque: TcxGridLevel;
    edSummaryAll: TcxCurrencyEdit;
    lvSumary: TcxListView;
    memDesc: TcxMemo;
    lblKeteranan: TLabel;
    lblTotal: TLabel;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edOrganizationPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edOrganizationPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridTableARNewDataControllerAfterInsert(
      ADataController: TcxCustomDataController);
  private
    FCDSOrganisasi: tclientDataSet;
    FCI: TModCustomerInvoice;
    FOrganization: TModOrganization;
    function GetCDSOrganisasi: tclientDataSet;
    function GetCI: TModCustomerInvoice;
    function IsBisaHapus: Boolean;
    function IsBisaSimpan: Boolean;
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
begin
  inherited;

  if not IsBisaSimpan then
    Exit;

  CI.CI_NOBUKTI := edNoBukti.Text;
  CI.CI_Description := memDesc.Text;
  CI.CI_ORGANIZATION := TModOrganization.CreateID(FOrganization.ID);
  CI.CI_TRANSDATE := dtTanggal.Date;

  try
    if DMClient.CrudCustomerInvoiceClient.SaveToDB(CI) then
    begin
      TAppUtils.InformationBerhasilSimpan;
    end;
  except
    raise;
  end;

end;

procedure TfrmDialogCustomerInvoice.cxGridTableARNewDataControllerAfterInsert(
  ADataController: TcxCustomDataController);
begin
  inherited;
  ADataController.Values[ADataController.FocusedRecordIndex, cxGridColARNoBukti.Index] := edNoBukti.Text + '-xx';
  ADataController.Values[ADataController.FocusedRecordIndex, cxGridColARTanggal.Index] := dtTanggal.Date;
  ADataController.Values[ADataController.FocusedRecordIndex, cxGridColARJatuhTempo.Index] := dtTanggal.Date + 1;
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
    Exit;
  end else if FOrganization.id = '' then
  begin
    TAppUtils.Warning('Organisasi Belum Dipilih');
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
  LoadDataOrganization(CI.CI_ORGANIZATION.ID, False);
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
