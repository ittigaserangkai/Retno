unit ufrmMerchandiseGroup;

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
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls;

type
  TfrmMerchandiseGroup = class(TfrmMasterBrowse)
  private
    { Private declarations }
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmMerchandiseGroup: TfrmMerchandiseGroup;

implementation

uses
  uDMClient, uDBUtils, uDXUtils, uModBarang;

{$R *.dfm}

procedure TfrmMerchandiseGroup.RefreshData;
begin
  inherited;
  cxGridView.LoadFromDS(DMClient.DSProviderClient.MerchandiseGroup_GetDSLookup, Self);
  cxGridView.SetVisibleColumns(
  ['Ref$Merchandise_ID','Ref$Merchandise_Grup_ID'], False);
end;

end.
