unit ufrmBarcodeUsage;

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
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, Datasnap.DBClient, uDBUtils,
  uDXUtils, uDMClient,System.DateUtils, ufrmDialogBarcodeUsage;

type
  TfrmBarcodeUsage = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
    FCDS: TClientDataset;
    { Private declarations }
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmBarcodeUsage: TfrmBarcodeUsage;

implementation

{$R *.dfm}

procedure TfrmBarcodeUsage.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogBarcodeUsage);
end;

procedure TfrmBarcodeUsage.actEditExecute(Sender: TObject);
begin
  inherited;
  if FCDS = nil then
    Exit;

  ShowDialogForm(TfrmDialogBarcodeUsage,FCDS.FieldByName('BARCODEUSAGE_ID').AsString);
end;

procedure TfrmBarcodeUsage.RefreshData;
begin
  inherited;

  if Assigned(FCDS) then FreeAndNil(FCDS);

  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.BarcodeUsage_GetDSOverview(StartOfTheDay(dtAwalFilter.Date), EndOfTheDay(dtAkhirFilter.Date), nil) ,Self );
  cxGridView.LoadFromCDS(FCDS);
  cxGridView.SetVisibleColumns(['BU_AR_ID','BU_UNIT_ID','BU_SUPMG_ID','BARCODEUSAGE_ID'],False);
end;

end.
