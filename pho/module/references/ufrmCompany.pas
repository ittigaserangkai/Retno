unit ufrmCompany;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterBrowse, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  System.Actions, Vcl.ActnList, ufraFooter4Button, Vcl.StdCtrls, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, uDXUtils, uDMClient;

type
  TfrmCompany = class(TfrmMasterBrowse)
  private
    { Private declarations }
  protected
    procedure RefreshData; override;
  public
    { Public declarations }
  end;

var
  frmCompany: TfrmCompany;

implementation

{$R *.dfm}

procedure TfrmCompany.RefreshData;
begin
  inherited;
  cxGridView.LoadFromDS(DMClient.DSProviderClient.Company_GetDSOverview(), cxGridView);
  cxGridView.SetVisibleColumns(['COMPANY_ID'], False);
end;

end.
