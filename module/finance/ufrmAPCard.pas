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
  uDMReport, uAppUtils, System.DateUtils, uRetnoUnit;

type
  TfrmAPCard = class(TfrmMasterReport)
    lblFilterData: TcxLabel;
    dtAwalFilter: TcxDateEdit;
    lblsdFilter: TcxLabel;
    dtAkhirFilter: TcxDateEdit;
    lblOrganisasi: TcxLabel;
    cbbOrganisasi: TcxExtLookupComboBox;
    procedure actPrintExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCDSOrg: TClientDataset;
    procedure InisialisasiOrganisasi;
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
  TRetno.KartuAP(cbbOrganisasi.EditValueRest, dtAwalFilter.Date, dtAkhirFilter.Date);
end;

procedure TfrmAPCard.FormCreate(Sender: TObject);
begin
  inherited;
  InisialisasiOrganisasi;

  dtAwalFilter.Date  := StartOfTheMonth(Now);
  dtAkhirFilter.Date := Now;
end;

procedure TfrmAPCard.InisialisasiOrganisasi;
begin
  FreeAndNil(FCDSOrg);


  FCDSOrg := TDBUtils.DSToCDS( DMClient.DSProviderClient.Organization_GetDSLookup, Self );

  cbbOrganisasi.Properties.LoadFromCDS(FCDSOrg,'V_ORGANIZATION_ID','ORG_Name',['V_ORGANIZATION_ID'],Self);
  cbbOrganisasi.Properties.SetMultiPurposeLookup;
end;

end.
