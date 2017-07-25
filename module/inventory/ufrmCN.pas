unit ufrmCN;

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
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, uDXUtils, ufrmDialogCN,
  Datasnap.DBClient;

type
  TfrmCN = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
    FCDS: TClientDataSet;
    property CDS: TClientDataSet read FCDS write FCDS;
    { Private declarations }
  protected
    procedure RefreshData; override;
  public
    { Public declarations }
  end;

var
  frmCN: TfrmCN;

implementation

{$R *.dfm}

uses uDMClient, uAppUtils, uDBUtils;

procedure TfrmCN.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogCN);

end;

procedure TfrmCN.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogCN, cxGridView.DS.FieldByName('CN_RECV_ID').AsString);
end;

procedure TfrmCN.RefreshData;
begin
  inherited;
  try
    TAppUtils.cShowWaitWindow('Mohon Ditunggu');
    if Assigned(FCDS) then FreeAndNil(FCDS);

    CDS := TDBUtils.DSToCDS(
      DMClient.DSProviderClient.CN_RCV_GetDSOverview(dtAwalFilter.Date,dtAkhirFilter.Date, nil),
      Self
    );
    cxGridView.LoadFromCDS(FCDS);
    cxGridView.SetVisibleColumns(['AUT$UNIT_ID', 'CN_RECV_ID'],False);
  finally
    TAppUtils.cCloseWaitWindow;
  end;
end;

end.
