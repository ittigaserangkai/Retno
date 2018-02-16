unit ufrmDOForTrader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, Mask, Grids,
  ActnList, DB, System.Actions, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, ufraFooter4Button, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, System.Generics.Collections, uDXUtils,
  uModDOTrader, uModOrganization, Datasnap.DBClient, uDBUtils, System.DateUtils,
  ufrmDialogDOForTrader;

type
  TfrmDOForTrader = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FCDS: TClientDataset;
  public
    procedure RefreshData; override;
  end;

var
  frmDOForTrader: TfrmDOForTrader;

implementation

uses
  uConstanta, udmReport, Math, uDMClient;

{$R *.dfm}


procedure TfrmDOForTrader.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogDOForTrader)
end;

procedure TfrmDOForTrader.actEditExecute(Sender: TObject);
begin
  inherited;
  if FCDS = nil  then
    Exit;

  ShowDialogForm(TfrmDialogDOForTrader, FCDS.FieldByName('DOTRADER_ID').AsString);
end;

procedure TfrmDOForTrader.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDOForTrader.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'DO FOR ASSGROS';
end;

procedure TfrmDOForTrader.RefreshData;
begin
  inherited;
  if Assigned(FCDS) then FreeAndNil(FCDS);
  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.DOTrader_GetDSOverview(StartOfTheDay(dtAwalFilter.Date), EndOfTheDay(dtAkhirFilter.Date)) ,Self );
  cxGridView.LoadFromCDS(FCDS);
  cxGridView.SetVisibleColumns(['DOTRADER_ID','DOT_ORGANIZATION_ID','DOT_POTRADER_ID','DOT_GUDANG_ID'],False);

end;

end.



