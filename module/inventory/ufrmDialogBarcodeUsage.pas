unit ufrmDialogBarcodeUsage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, uInterface, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls, cxContainer,
  cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxLabel, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Vcl.StdCtrls, cxButtons, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxCheckBox, uDMClient, cxMemo, Datasnap.DBClient,
  uDBUtils, System.DateUtils, cxCurrencyEdit, uDXUtils;

type
  TfrmDialogBarcodeUsage = class(TfrmMasterDialog, ICRUDAble)
    pnlFilter: TPanel;
    btnSearch: TcxButton;
    dtAkhirFilter: TcxDateEdit;
    lblFilterData: TcxLabel;
    dtAwalFilter: TcxDateEdit;
    lblsdFilter: TcxLabel;
    cxgrdlvlBarcodeReq: TcxGridLevel;
    cxgrdBarcodeReq: TcxGrid;
    pnlHeder: TPanel;
    pnlCaption: TPanel;
    lblNoBukti: TLabel;
    lblTanggal: TLabel;
    lblKeterangan: TLabel;
    edNoBukti: TcxTextEdit;
    dtTanggal: TcxDateEdit;
    memKeterangan: TcxMemo;
    cxGridTableBarcodeReq: TcxGridTableView;
    cxGridColSupplier: TcxGridColumn;
    cxGridColNo: TcxGridColumn;
    cxGridColTanggal: TcxGridColumn;
    cxGridColNominal: TcxGridColumn;
    cxGridColProses: TcxGridColumn;
    cxGridColID: TcxGridColumn;
    procedure btnSearchClick(Sender: TObject);
    procedure cxGridTableBarcodeReqEditing(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; var AAllow: Boolean);
  private
    FCDSBarcodeReq: TClientDataset;
    { Private declarations }
  public
    procedure LoadData(AID : String);
    { Public declarations }
  end;

var
  frmDialogBarcodeUsage: TfrmDialogBarcodeUsage;

implementation

{$R *.dfm}

procedure TfrmDialogBarcodeUsage.btnSearchClick(Sender: TObject);
var
  iBaris: Integer;
begin
  inherited;
  if Assigned(FCDSBarcodeReq) then FreeAndNil(FCDSBarcodeReq);
  cxGridTableBarcodeReq.ClearRows;

  FCDSBarcodeReq := TDBUtils.DSToCDS(DMClient.DSProviderClient.BarcodeRequest_GetDSOverview(StartOfTheDay(dtAwalFilter.Date), EndOfTheDay(dtAkhirFilter.Date), nil) ,Self );

  if FCDSBarcodeReq = nil then
    Exit;

  FCDSBarcodeReq.First;
  while not FCDSBarcodeReq.Eof do
  begin
    iBaris := cxGridTableBarcodeReq.DataController.AppendRecord;

    cxGridTableBarcodeReq.SetValue(iBaris,cxGridColNo.Index, FCDSBarcodeReq.FieldByName('NO').AsString);
    cxGridTableBarcodeReq.SetValue(iBaris,cxGridColTanggal.Index, FCDSBarcodeReq.FieldByName('TANGGAL').AsDateTime);
    cxGridTableBarcodeReq.SetValue(iBaris,cxGridColNominal.Index, FCDSBarcodeReq.FieldByName('TOTAL').AsFloat);
    cxGridTableBarcodeReq.SetValue(iBaris,cxGridColProses.Index, False);
    cxGridTableBarcodeReq.SetValue(iBaris,cxGridColID.Index, FCDSBarcodeReq.FieldByName('BARCODEUSAGE_id').AsString);

    FCDSBarcodeReq.Next;
  end;
end;

procedure TfrmDialogBarcodeUsage.cxGridTableBarcodeReqEditing(Sender:
    TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  inherited;
  AAllow := AItem.Index = cxGridColProses.Index;
end;

procedure TfrmDialogBarcodeUsage.LoadData(AID : String);
begin

end;

end.
