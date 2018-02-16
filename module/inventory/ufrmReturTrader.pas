unit ufrmReturTrader;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, ufrmMasterBrowse, StdCtrls, ExtCtrls,
  jpeg, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  cxButtonEdit, System.Actions, Vcl.ActnList, ufraFooter4Button,
  cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC, Datasnap.DBClient,
  uDBUtils, uDMClient, uDXUtils, System.DateUtils, ufrmDialogReturTrader;

type
  TfrmReturTrader = class(TfrmMasterBrowse)
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    cxGridViewColumn4: TcxGridDBColumn;
    cxGridViewColumn5: TcxGridDBColumn;
    cxGridViewColumn6: TcxGridDBColumn;
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
  frmReturTrader: TfrmReturTrader;

implementation
{$R *.dfm}
uses  udmReport, uTSCommonDlg;



procedure TfrmReturTrader.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogReturTrader);
end;

procedure TfrmReturTrader.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogReturTrader, FCDS.FieldByName('RETURTRADER_ID').AsString);
end;

procedure TfrmReturTrader.RefreshData;
begin
  inherited;
  if Assigned(FCDS) then FreeAndNil(FCDS);

  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.ReturTrader_GetDSOverview(StartOfTheDay(dtAwalFilter.Date), EndOfTheDay(dtAkhirFilter.Date), nil) ,Self );
  cxGridView.LoadFromCDS(FCDS, False);
end;

end.




