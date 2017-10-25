unit ufrmCrazyPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Menus, System.Actions, ufraFooter4Button, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, Vcl.ActnList, uDBUtils, uDXUtils,
  Datasnap.DBClient, uDMClient, System.DateUtils, ufrmDialogCrazyPrice;

type
  TfrmCrazyPrice = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    FCDS: TClientDataset;
    { Private declarations }
    //procedure ParseHeaderGrid;
    //procedure GetListAllCrazyPrice;
    //procedure ParseDataGrid(AData: TResultDataSet);
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmCrazyPrice: TfrmCrazyPrice;

implementation

uses uTSCommonDlg, uConstanta, uRetnoUnit, uAppUtils;

{$R *.dfm}

procedure TfrmCrazyPrice.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogCrazyPrice)
end;

procedure TfrmCrazyPrice.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogCrazyPrice, FCDS.FieldByName('CRAZYPRICE_ID').AsString)
end;

procedure TfrmCrazyPrice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmCrazyPrice.FormDestroy(Sender: TObject);
begin
  inherited;
  frmCrazyPrice := nil;
end;

procedure TfrmCrazyPrice.RefreshData;
begin
  inherited;

  if Assigned(FCDS) then FreeAndNil(FCDS);
  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.CrazyPrice_GetDSOverview(StartOfTheDay(dtAwalFilter.Date), EndOfTheDay(dtAkhirFilter.Date)) ,Self );
  cxGridView.LoadFromCDS(FCDS);
  cxGridView.SetVisibleColumns(['CUSTOMERINVOICE_ID', 'ci_organization_id',''],False);

end;

end.


