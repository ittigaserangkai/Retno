unit ufrmHistoryBarang;

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
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, Datasnap.DBClient, uAppUtils,
  uDBUtils, uDMClient, uDXUtils, System.DateUtils,ufrmDialogHistoryBarang;

type
  TfrmHistoryBarang = class(TfrmMasterBrowse)
    cxPCCheckExternalCode: TcxPageControl;
    cxTSCheckExternalCode: TcxTabSheet;
    lblExternalCode: TLabel;
    edExternalCode: TcxTextEdit;
    lblKodeBarang: TLabel;
    edKodeBarang: TcxTextEdit;
    edNamaBarang: TcxTextEdit;
    lblNamaBarang: TLabel;
    lblUOM: TLabel;
    edUOM: TcxTextEdit;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
    FCDS: TClientDataset;
    { Private declarations }
  protected
    procedure RefreshData; override;
  public
    { Public declarations }
  end;

var
  frmHistoryBarang: TfrmHistoryBarang;

implementation

{$R *.dfm}

procedure TfrmHistoryBarang.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogHistoryBarang);
end;

procedure TfrmHistoryBarang.actEditExecute(Sender: TObject);
begin
  inherited;
  if FCDS = nil then
    Exit;

  ShowDialogForm(TfrmDialogHistoryBarang, FCDS.FieldByName('HISTORYBARANG_ID').AsString);
end;

procedure TfrmHistoryBarang.RefreshData;
begin
  inherited;
  if Assigned(FCDS) then FreeAndNil(FCDS);

  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.HistoryBarang_GetDSOverview(StartOfTheDay(dtAwalFilter.Date), EndOfTheDay(dtAkhirFilter.Date)),Self );
  cxGridView.LoadFromCDS(FCDS);
  cxGridView.SetVisibleColumns(['HISTORYBARANG_ID'],False);
end;

end.
