unit ufrmDialogCrazyPrice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, uInterface, uDBUtils,
  uDXUtils, Datasnap.DBClient, System.DateUtils, uModCrazyPrice, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxGridCustomTableView,
  cxGridTableView, cxGridCustomView, cxClasses, cxGridLevel, cxGrid, uDMClient,
  cxCalendar, Vcl.StdCtrls;

type
  TfrmDialogCrazyPrice = class(TfrmMasterDialog, ICRUDAble)
    cxgrdlvlCP: TcxGridLevel;
    cxgrdCP: TcxGrid;
    cxGridTableCP: TcxGridTableView;
    cxGridColCPKode: TcxGridColumn;
    cxGridColCPNama: TcxGridColumn;
    cxGridColCPPLU: TcxGridColumn;
    cxGridColCPNamaBarang: TcxGridColumn;
    cxGridColSatuan: TcxGridColumn;
    cxGridColCOCOGS: TcxGridColumn;
    cxGridColCPDisc: TcxGridColumn;
    cxGridColCPSellpriceDisc: TcxGridColumn;
    cxGridColCPSellPriceDiscPPN: TcxGridColumn;
    cxGridColCPMarkUp: TcxGridColumn;
    cxGridColCPSebelumDisc: TcxGridColumn;
    cxGridColSebelumDiscMarkUp: TcxGridColumn;
    cxGridColCPPPN: TcxGridColumn;
    cxGridColCPTglInput: TcxGridColumn;
    cxGridColCPPeriodeMulai: TcxGridColumn;
    cxGridColCPPeriodeAkhir: TcxGridColumn;
    pnlKeterangan: TPanel;
    lblSebelumDisc: TLabel;
    procedure cxGridTableCPDataControllerNewRecord(
      ADataController: TcxCustomDataController; ARecordIndex: Integer);
  private
    { Private declarations }
  public
    procedure LoadData(AID : String);
    { Public declarations }
  end;

var
  frmDialogCrazyPrice: TfrmDialogCrazyPrice;

implementation

{$R *.dfm}

procedure TfrmDialogCrazyPrice.cxGridTableCPDataControllerNewRecord(
  ADataController: TcxCustomDataController; ARecordIndex: Integer);
begin
  inherited;
  ADataController.Values[ARecordIndex, cxGridColCPTglInput.Index] := Now;

  if ARecordIndex = 0 then
  begin
    ADataController.Values[ARecordIndex, cxGridColCPPeriodeMulai.Index] := StartOfTheDay(Now);
    ADataController.Values[ARecordIndex, cxGridColCPPeriodeAkhir.Index] := EndOfTheDay(Now);
  end else begin
    ADataController.Values[ARecordIndex, cxGridColCPPeriodeMulai.Index] := ADataController.Values[ARecordIndex - 1, cxGridColCPPeriodeMulai.Index];
    ADataController.Values[ARecordIndex, cxGridColCPPeriodeAkhir.Index] := ADataController.Values[ARecordIndex - 1, cxGridColCPPeriodeAkhir.Index];
    ADataController.Values[ARecordIndex, cxGridColCPKode.Index]         := ADataController.Values[ARecordIndex - 1, cxGridColCPKode.Index];
    ADataController.Values[ARecordIndex, cxGridColCPNama.Index]         := ADataController.Values[ARecordIndex - 1, cxGridColCPNama.Index];
  end;
end;

procedure TfrmDialogCrazyPrice.LoadData(AID : String);
begin

end;

end.
