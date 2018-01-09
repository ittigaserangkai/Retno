unit ufrmCashIn;

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
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, uDBUtils, uDMClient,
  Datasnap.DBClient, uDXUtils, ufrmDialogCashIn;

type
  TfrmCashIn = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
  private
    FCDS: TClientDataSet;
    property CDS: TClientDataSet read FCDS write FCDS;
    { Private declarations }
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmCashIn: TfrmCashIn;

implementation

{$R *.dfm}

procedure TfrmCashIn.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogCashIn);
end;

procedure TfrmCashIn.RefreshData;
begin
  if Assigned(FCDS) then FreeAndNil(FCDS);
  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.CashIn_GetDSOverview(dtAwalFilter.Date, dtAkhirFilter.Date),Self );
  cxGridView.LoadFromCDS(CDS);
  cxGridView.SetVisibleColumns(['BANKCASHIN_ID'],False);
end;

end.
