unit ufrmSupplierType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls, ActnList,
  uConn, uRetnoUnit, DB, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, System.Actions, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, ufrmMasterBrowse, DBClient,
  uDMClient, uDBUtils, uDXUtils, dxBarBuiltInMenu, cxContainer, Vcl.ComCtrls,
  dxCore, cxDateUtils, Vcl.Menus, ufraFooter4Button, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxPC;

type
  TfrmSupplierType = class(TfrmMasterBrowse)
  private
    FCDSBrowse: tClientDataset;
    property CDSBrowse: tClientDataset read FCDSBrowse write FCDSBrowse;
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmSupplierType: TfrmSupplierType;

implementation

uses uTSCommonDlg, ufrmDialogSupplierType, Math,  uConstanta;

{$R *.dfm}

procedure TfrmSupplierType.RefreshData;
begin
  CDSBrowse := TDBUtils.DSToCDS(
    DMClient.DSProviderClient.TipeSuplier_GetDSOverview(),self);
  CXGridview.LoadFromCDS(CDSBrowse);
  // TODO -cMM: TfrmSupplierType.RefreshData default body inserted
end;

end.
