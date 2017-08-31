unit ufrmHistoryAP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterReport, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxControls, cxContainer,
  cxEdit, cxLabel, cxTextEdit, cxMaskEdit, cxButtonEdit, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxDropDownEdit, cxCalendar, cxCurrencyEdit, uClientClasses,
  uDMClient, ufrmCXLookup, uModelHelper, uRetnoUnit;

type
  TfrmHistoryAP = class(TfrmMasterReport)
    lblNoAP: TLabel;
    edNoAP: TcxButtonEdit;
    lblTgl: TcxLabel;
    lblKodeOrg: TcxLabel;
    edKodeOrg: TcxTextEdit;
    edNamaOrg: TcxTextEdit;
    dtTglAP: TcxDateEdit;
    edTotal: TcxCurrencyEdit;
    lblTotal: TcxLabel;
    procedure actPrintExecute(Sender: TObject);
    procedure edNoAPPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    procedure LoadDataAP(ANoAP : String);
    { Public declarations }
  end;

var
  frmHistoryAP: TfrmHistoryAP;

implementation

uses
  uModAP, uModOrganization;

{$R *.dfm}

procedure TfrmHistoryAP.actPrintExecute(Sender: TObject);
begin
  inherited;
  TRetno.LapHistoryAP(edNoAP.Text);
end;

procedure TfrmHistoryAP.edNoAPPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  with TfrmCXLookup.Execute('Look Up PO','TDSProvider.AP_GetDSLookUp') do
  begin
    Try
      HideFields(['AP_ID','AP_ORGANIZATION_ID']);
      if ShowModal = mrOK then
      begin
        edNoAP.Text := Data.FieldByName('AP_REFNUM').AsString;
        LoadDataAP(edNoAP.Text);
      end;
    Finally
      free;
    End;
  end;
end;

procedure TfrmHistoryAP.LoadDataAP(ANoAP : String);
var
  lAP: TModAP;
  lORG: TModOrganization;
begin
  lAP := TModAP(DMClient.CrudClient.RetrieveByCode(TModAP.ClassName, ANoAP));
  try
    lORG := TModOrganization.CreateID(lAP.AP_ORGANIZATION.ID);
    lORG.Reload();

    lAP.AP_ORGANIZATION := lORG;

    edKodeOrg.Text := lAP.AP_ORGANIZATION.ORG_Code;
    edNamaOrg.Text := lAP.AP_ORGANIZATION.ORG_Name;
    dtTglAP.Date   := lAP.AP_TRANSDATE;
    edTotal.Value  := lAP.AP_TOTAL;
  finally
    lAP.Free;
  end;
end;

end.
