unit ufrmAPCard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterReport, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxControls, cxContainer,
  cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, Datasnap.DBClient, uDBUtils, uDMClient, uDXUtils,
  uDMReport, uAppUtils, System.DateUtils, uRetnoUnit, cxButtonEdit,
  ufrmCXLookup, uModOrganization;

type
  TfrmAPCard = class(TfrmMasterReport)
    lblFilterData: TcxLabel;
    dtAwalFilter: TcxDateEdit;
    lblsdFilter: TcxLabel;
    dtAkhirFilter: TcxDateEdit;
    lblOrganisasi: TcxLabel;
    edOrganization: TcxButtonEdit;
    edOrganizationName: TcxButtonEdit;
    procedure actPrintExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edOrganizationPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edOrganizationPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    FCDSOrg: TClientDataset;
    FCDSOrganisasi: tclientDataSet;
    FOrganization: TModOrganization;
    function GetCDSOrganisasi: tclientDataSet;
    procedure LoadDataOrganization(AKodeAtauID : String; AIsLoadByKode : Boolean);
    property CDSOrganisasi: tclientDataSet read GetCDSOrganisasi write
        FCDSOrganisasi;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAPCard: TfrmAPCard;

implementation

{$R *.dfm}

procedure TfrmAPCard.actPrintExecute(Sender: TObject);
begin
  inherited;
  TRetno.KartuAP(FOrganization.ID, dtAwalFilter.Date, dtAkhirFilter.Date);
end;

procedure TfrmAPCard.edOrganizationPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  with TfrmCXLookup.Execute(CDSOrganisasi,False, 'Look Up Data') do
  begin
    Try
      HideFields(['V_ORGANIZATION_ID', 'ORG_MerchandiseGroup_id','ORG_Member_ID','ORG_Karyawan_ID','DATE_CREATE','DATE_MODIFY']);
      if ShowModal = mrOK then
      begin
        edOrganization.Text := Data.FieldByName('org_code').AsString;
        LoadDataOrganization(Data.FieldByName('V_ORGANIZATION_ID').AsString, False);
      end;
    Finally
      free;
    End;
  end;
end;

procedure TfrmAPCard.edOrganizationPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  FreeAndNil(FOrganization);
  LoadDataOrganization(VarToStr(DisplayValue), True);
end;

procedure TfrmAPCard.FormCreate(Sender: TObject);
begin
  inherited;
//  InisialisasiOrganisasi;

  dtAwalFilter.Date  := StartOfTheMonth(Now);
  dtAkhirFilter.Date := Now;
end;

function TfrmAPCard.GetCDSOrganisasi: tclientDataSet;
begin
  if FCDSOrganisasi = nil then
    FCDSOrganisasi := TDBUtils.DSToCDS(DMClient.DSProviderClient.Organization_GetDSLookup(), Self);

  Result := FCDSOrganisasi;
end;

procedure TfrmAPCard.LoadDataOrganization(AKodeAtauID : String; AIsLoadByKode :
    Boolean);
begin
  edOrganizationName.Text := '';
  FreeAndNil(FOrganization);

  if AIsLoadByKode then
    FOrganization := DMClient.CrudClient.RetrieveByCode(TModOrganization.ClassName,  AKodeAtauID) as TModOrganization
  else begin
    FOrganization := DMClient.CrudClient.Retrieve(TModOrganization.ClassName,  AKodeAtauID) as TModOrganization;
    if FOrganization <> nil then
    edOrganization.Text := FOrganization.ORG_Code;
  end;

  if FOrganization <> nil then
  begin
    edOrganizationName.Text := FOrganization.ORG_Name;
  end;


end;

end.
