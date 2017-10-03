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
  ufrmCXLookup, uModOrganization, Datasnap.DBClient, uDBUtils;

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
    cxGridTableAPList: TcxGridTableView;
    cxGridColAPAP: TcxGridColumn;
    cxGridColAPTanggal: TcxGridColumn;
    cxGridColAPJatuhTempo: TcxGridColumn;
    cxGridColAPRekeningID: TcxGridColumn;
    cxGridColAPRekening: TcxGridColumn;
    cxGridColAPKeterangan: TcxGridColumn;
    cxGridColAPNominal: TcxGridColumn;
    cxGridColAPSisa: TcxGridColumn;
    cxGridColAPBayar: TcxGridColumn;
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
    procedure FormCreate(Sender: TObject);
    procedure edOrganizationPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edOrganizationPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    FCDSOrganisasi: tclientDataSet;
    FOrganization: TModOrganization;
    function GetCDSOrganisasi: tclientDataSet;
    procedure LoadDataOrganization(AKodeAtauID : String; AIsLoadByKode : Boolean);
    property CDSOrganisasi: tclientDataSet read GetCDSOrganisasi write
        FCDSOrganisasi;
    { Private declarations }
  protected
  public
    procedure LoadData(AID : String);
    { Public declarations }
  end;

var
  frmDialogCustomerInvoice: TfrmDialogCustomerInvoice;

implementation

{$R *.dfm}

uses uDMClient;

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

procedure TfrmDialogCustomerInvoice.LoadData(AID : String);
begin
  ClearByTag([0,1]);
  edNoBukti.Text := 'Otomatis';

  if AID = '' then
    Exit;

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
