unit ufrmBarcodeRequest;

interface

uses
  SysUtils, Classes, Controls, Forms, ufrmMasterBrowse, StdCtrls, ExtCtrls,
  ActnList, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  cxButtonEdit, System.Actions, ufraFooter4Button, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC, Datasnap.DBClient, uAppUtils, uDXUtils, uModBarang, uModSatuan,
  uModBarcodeRequest, uDBUtils, uDMClient, System.DateUtils, uRetnoUnit,
  cxCurrencyEdit;

type
  TfrmBarcodeRequest = class(TfrmMasterBrowse)
    actAddRow: TAction;
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    cxGridViewColumn4: TcxGridDBColumn;
    cxGridViewColumn5: TcxGridDBColumn;
    cxGridViewColumn6: TcxGridDBColumn;
    cxGridViewColumn7: TcxGridDBColumn;
    cxGridViewColumn8: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure edtSupplierCodeKeyPress(Sender: TObject; var Key: Char);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
    FCDS: TClientDataset;
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmBarcodeRequest: TfrmBarcodeRequest;

implementation
{$R *.dfm}
uses
  ufrmDialogBarcodeRequest, uTSCommonDlg;



procedure TfrmBarcodeRequest.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'BARCODE LABEL REQUESTITION';
end;

procedure TfrmBarcodeRequest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmBarcodeRequest.FormDestroy(Sender: TObject);
begin
  inherited;
  frmBarcodeRequest := nil;
end;

procedure TfrmBarcodeRequest.edtSupplierCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    Key := UpCase(Key);
end;

procedure TfrmBarcodeRequest.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogBarcodeRequest);
end;

procedure TfrmBarcodeRequest.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogBarcodeRequest,
    cxGridView.DS.FieldByName('BARCODEREQUEST_ID').AsString);
end;

procedure TfrmBarcodeRequest.RefreshData;
begin
  inherited;
  cxGridView.PrepareFromCDS(
    TDBUtils.DSToCDS(
      DMClient.DSProviderClient.BarcodeRequest_GetDSOverview(
        dtAwalFilter.Date, dtAkhirFilter.Date, TRetno.UnitStore, ''
      ), Self
    )
  );

//  if Assigned(FCDS) then FreeAndNil(FCDS);
//  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.BarcodeRequest_GetDSOverview(StartOfTheDay(dtAwalFilter.Date), EndOfTheDay(dtAkhirFilter.Date), nil) ,Self );
//  cxGridView.LoadFromCDS(FCDS);
//  cxGridView.SetVisibleColumns(['BR_UNIT_ID','BR_ORGANIZATION_ID','BARCODEREQUEST_ID'],False);
end;

end.


