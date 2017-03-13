unit ufrmMerk;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterBrowse, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  System.Actions, Vcl.ActnList, cxClasses, ufraFooter4Button, Vcl.StdCtrls,
  cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, Datasnap.DBClient;

type
  TfrmMerk = class(TfrmMasterBrowse)
  private
    FCDS: TClientDataSet;
    property CDS: TClientDataSet read FCDS write FCDS;
    { Private declarations }
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmMerk: TfrmMerk;

implementation

uses
  uDMClient, uDBUtils, uDXUtils;

{$R *.dfm}

procedure TfrmMerk.RefreshData;
var
  DS: TDataSet;
begin
  inherited;
  if not Assigned(FCDS) then FCDS.Free;
  DS := DMClient.DSProviderClient.Merk_GetDSLookUp;
  CDS := TDBUtils.DSToCDS(DS, Self);
  cxGridView.LoadFromCDS(CDS);
end;

end.
