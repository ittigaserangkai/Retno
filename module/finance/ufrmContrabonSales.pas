unit ufrmContrabonSales;

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
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls,ufrmDialogContrabonSales,
  Datasnap.DBClient, uDBUtils,uDMClient, uDXUtils, System.DateUtils;

type
  TfrmContrabonSales = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
    fcds: tclientDataSet;
    { Private declarations }
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmContrabonSales: TfrmContrabonSales;

implementation

{$R *.dfm}

procedure TfrmContrabonSales.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogContrabonSales);
end;

procedure TfrmContrabonSales.actEditExecute(Sender: TObject);
begin
  inherited;
  if FCDS = nil then
    Exit;

  ShowDialogForm(TfrmDialogContrabonSales, FCDS.FieldByName('CONTRABON_SALES_ID').AsString);
end;

procedure TfrmContrabonSales.RefreshData;
begin
  inherited;
  if Assigned(FCDS) then FreeAndNil(FCDS);
  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.Contrabon_GetDSOverview(StartOfTheDay(dtAwalFilter.Date), EndOfTheDay(dtAkhirFilter.Date)) ,Self );
  cxGridView.LoadFromCDS(FCDS);
  cxGridView.SetVisibleColumns(['BANKCASHOUT_ID','BCO_Bank_ID','BCO_Organization_ID',''],False);

end;

end.
