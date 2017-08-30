unit ufrmBankCashOut;

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
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, ufrmDialogBankCashOut, uDBUtils,
  Datasnap.DBClient, uClientClasses, uDMClient, System.DateUtils, uDXUtils;

type
  TfrmBankCashOut = class(TfrmMasterBrowse)
    procedure FormDestroy(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
  private
    FCDS: TClientDataset;
    { Private declarations }
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmBankCashOut: TfrmBankCashOut;

implementation

{$R *.dfm}

procedure TfrmBankCashOut.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FCDS);
end;

procedure TfrmBankCashOut.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogBankCashOut)
end;

procedure TfrmBankCashOut.actEditExecute(Sender: TObject);
begin
  inherited;
  if FCDS = nil then
    Exit;

  ShowDialogForm(TfrmDialogBankCashOut, FCDS.FieldByName('BANKCASHOUT_ID').AsString)
end;

procedure TfrmBankCashOut.actPrintExecute(Sender: TObject);
begin
  inherited;
  with TfrmDialogBankCashOut.Create(nil) do
  try
    CetakSlip(dtAwalFilter.Date, dtAkhirFilter.Date, 'null');
  finally
    Free;
  end;
end;

procedure TfrmBankCashOut.RefreshData;
begin
  inherited;

  if Assigned(FCDS) then FreeAndNil(FCDS);
  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.BankCashOut_GetDSByPeriod(StartOfTheDay(dtAwalFilter.Date), EndOfTheDay(dtAkhirFilter.Date)) ,Self );
  cxGridView.LoadFromCDS(FCDS);
  cxGridView.SetVisibleColumns(['BANKCASHOUT_ID','BCO_Bank_ID','BCO_Organization_ID',''],False);

end;

end.
