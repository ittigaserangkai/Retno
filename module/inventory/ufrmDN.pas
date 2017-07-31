unit ufrmDN;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterBrowse, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  System.Actions, Vcl.ActnList, ufraFooter4Button, Vcl.StdCtrls, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, Datasnap.DBClient;

type
  TfrmDN = class(TfrmMasterBrowse)
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
  frmDN: TfrmDN;

implementation

uses uDMClient, uAppUtils, uDBUtils, ufrmDialogDN, uDXUtils;

{$R *.dfm}

procedure TfrmDN.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogDN);
end;

procedure TfrmDN.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogDN, cxGridView.DS.FieldByName('DN_RECV_ID').AsString);
end;

procedure TfrmDN.RefreshData;
begin
  inherited;
  try
    TAppUtils.cShowWaitWindow('Mohon Ditunggu');
    if Assigned(FCDS) then FreeAndNil(FCDS);

    CDS := TDBUtils.DSToCDS(
      DMClient.DSProviderClient.DN_RCV_GetDSOverview(dtAwalFilter.Date,dtAkhirFilter.Date, nil),
      Self
    );
    cxGridView.LoadFromCDS(FCDS);
    cxGridView.SetVisibleColumns(['AUT$UNIT_ID', 'DN_RECV_ID'],False);
  finally
    TAppUtils.cCloseWaitWindow;
  end;
end;

end.
