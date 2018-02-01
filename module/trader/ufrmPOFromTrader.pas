unit ufrmPOFromTrader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, ActnList, StdCtrls, ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  cxCurrencyEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  System.Actions, uDBUtils, uDMClient, System.DateUtils, uDXUtils, Datasnap.DBClient;

type
  TfrmPOFromTrader = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actEditExecute(Sender: TObject);
  private
    FCDS: TClientDataset;
  public
    procedure RefreshData; override;
  end;

var
  frmPOFromTrader: TfrmPOFromTrader;

const
  _KolKode        : Integer = 1;
  _KolNama        : Integer = 2;
  _KolUOM         : Integer = 3;
  _KolBarcode     : Integer = 4;
  _KolQTY         : Integer = 5;
  _KolHarga       : Integer = 6;
  _KolDiscMember  : Integer = 7;
  _KolSubTotal    : Integer = 8;

  //  _KolPPN         : Integer = 7;
//  _KolQTY : Integer = 4;
//  _KolHarga : Integer = 5;
//  _KolPPN : Integer = 6;


implementation

uses ufrmDialogPOFromTrader, uTSCommonDlg,
  ufrmSearchPO, ufrmDialogPrintKasirPreview;

{$R *.dfm}

procedure TfrmPOFromTrader.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogPOFromTrader)
end;

procedure TfrmPOFromTrader.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmPOFromTrader.actEditExecute(Sender: TObject);
begin
  inherited;
  if FCDS = nil  then
    Exit;
  ShowDialogForm(TfrmDialogPOFromTrader, FCDS.FieldByName('POTRADER_ID').AsString)
end;

procedure TfrmPOFromTrader.RefreshData;
begin
  inherited;
  if Assigned(FCDS) then FreeAndNil(FCDS);
  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.POTrader_GetDSOverview(StartOfTheDay(dtAwalFilter.Date), EndOfTheDay(dtAkhirFilter.Date)), Self);
  cxGridView.LoadFromCDS(FCDS);
  cxGridView.SetVisibleColumns(['POT_UNIT_ID', 'POT_ORGANIZATION_ID', 'POTRADER_ID'],False);
end;

end.



