unit ufrmDialogPOFromTrader;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxMemo, cxButtonEdit, cxTextEdit, cxCurrencyEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, uDXUtils,
  uModelHelper, uInterface, Datasnap.DBClient, ufrmCXLookup, uDBUtils, uDMClient, uModOrganization;

type
  TfrmDialogPOFromTrader = class(TfrmMasterDialog, ICRUDAble)
    pnl1: TPanel;
    lblPONo: TLabel;
    lblPODate: TLabel;
    lblLeadTime: TLabel;
    lblTOP: TLabel;
    lblIsMember: TLabel;
    lblOrganizasi: TLabel;
    lblDesc: TLabel;
    dtTgl: TcxDateEdit;
    edNoBukti: TcxTextEdit;
    edOrganization: TcxButtonEdit;
    edOrganizationName: TcxButtonEdit;
    edTipeMember: TcxTextEdit;
    edLeadTime: TcxTextEdit;
    edTOP: TcxTextEdit;
    memDescription: TcxMemo;
    cxGrid: TcxGrid;
    cxGridDBTablePOTrader: TcxGridDBTableView;
    cxGridColPODKode: TcxGridDBColumn;
    cxGridColPODNama: TcxGridDBColumn;
    cxGridColPODUOM: TcxGridDBColumn;
    cxGridColPODHarga: TcxGridDBColumn;
    cxGridColPODQty: TcxGridDBColumn;
    cxGridColPODDisc: TcxGridDBColumn;
    cxGridColPODPPN: TcxGridDBColumn;
    cxGridColPODTotal: TcxGridDBColumn;
    cxgrdlvlPOTrader: TcxGridLevel;
    lblSubTotal: TLabel;
    lblDisc: TLabel;
    lblPPN: TLabel;
    lblTotal: TLabel;
    edSubTotal: TcxCurrencyEdit;
    edDisc: TcxCurrencyEdit;
    edPPN: TcxCurrencyEdit;
    edTotal: TcxCurrencyEdit;
    procedure FormCreate(Sender: TObject);
    procedure edOrganizationPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    FCDSOrganisasi: TClientDataset;
    FOrganization: TModOrganization;
    function GetCDSOrganisasi: TClientDataset;
    procedure LoadDataOrganization(AKodeAtauID : String; AIsLoadByKode : Boolean);
    { Private declarations }
  protected
  public
    procedure LoadData(AID : String);
    { Public declarations }
  published
    property CDSOrganisasi: TClientDataset read GetCDSOrganisasi write
        FCDSOrganisasi;
  end;

var
  frmDialogPOFromTrader: TfrmDialogPOFromTrader;

implementation

{$R *.dfm}

procedure TfrmDialogPOFromTrader.edOrganizationPropertiesButtonClick(
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

procedure TfrmDialogPOFromTrader.FormCreate(Sender: TObject);
begin
  inherited;
  ClearByTag([0,1]);
  dtTgl.Date := Now;
end;

function TfrmDialogPOFromTrader.GetCDSOrganisasi: TClientDataset;
begin
  if FCDSOrganisasi = nil then
    FCDSOrganisasi := TDBUtils.DSToCDS(DMClient.DSProviderClient.Organization_Trader_GetDSLookup(), Self);

  Result := FCDSOrganisasi;
end;

procedure TfrmDialogPOFromTrader.LoadData(AID : String);
begin
  ClearByTag([0,1]);
  dtTgl.Date := Now;

  if AID = '' then
    Exit;
end;

procedure TfrmDialogPOFromTrader.LoadDataOrganization(AKodeAtauID : String;
    AIsLoadByKode : Boolean);
begin
  edOrganizationName.Text := '';
  edTipeMember.Text := '';


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
