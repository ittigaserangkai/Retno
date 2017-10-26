unit ufrmLookupOrganization;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmCXLookup, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, Vcl.Menus, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, Vcl.ExtCtrls, cxGroupBox, cxRadioGroup,
  uModOrganization, Data.SqlExpr;

type
  TfrmLookupOrganization = class(TfrmCXLookup)
    rbOrgType: TcxRadioGroup;
    procedure rbOrgTypePropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetDatasetFromServer: TDataSet; override;
  public
    class function Lookup(DefaultType: Integer = 1): TModOrganization;
    { Public declarations }
  end;

var
  frmLookupOrganization: TfrmLookupOrganization;

implementation

uses
  uDMClient;

{$R *.dfm}

function TfrmLookupOrganization.GetDatasetFromServer: TDataSet;
begin
  FLookupClient.PrepareCommand(Self.CommandName);
  FLookupClient.FLookupCommand.Parameters[0].Value.AsInt32 := rbOrgType.ItemIndex+1;
  FLookupClient.FLookupCommand.Execute;
  Result := TCustomSQLDataSet.Create(nil,
    FLookupClient.FLookupCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
end;

class function TfrmLookupOrganization.Lookup(DefaultType: Integer = 1):
    TModOrganization;
var
  lfrm: TfrmLookupOrganization;
begin
  Result := nil;
  lfrm := TfrmLookupOrganization.Create(DMClient.RestConn, False);
  lfrm.CommandName  := 'TDSProvider.Organization_Lookup';
  lfrm.rbOrgType.ItemIndex := DefaultType-1;
  Try
    lfrm.HideDateParams;
    lfrm.RefreshDataSet;
    lfrm.ShowFieldsOnly(['ORG_CODE', 'ORG_NAME', 'ORG_Address', 'Org_NPWP']);
    if lFrm.ShowModal = mrOk then
    begin
      if lfrm.Data.Eof then exit;

      Result := DMClient.CrudClient.Retrieve(TModOrganization.ClassName,
        lfrm.Data.FieldByName('V_ORGANIZATION_ID').AsString
      ) as TModOrganization;
    end;
  Finally
    lFrm.Free;
  End;
end;

procedure TfrmLookupOrganization.rbOrgTypePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  Self.RefreshDataSet;
end;

end.
