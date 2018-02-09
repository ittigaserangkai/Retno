unit ufrmClaim;

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
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, ufrmDialogClaim,
  Datasnap.DBClient, uAppUtils, uDBUtils, uDXUtils, uDMReport, uClientClasses;

type
  TfrmClaim = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
  private
    FCDS: TClientDataSet;
    property CDS: TClientDataSet read FCDS write FCDS;
    { Private declarations }
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmClaim: TfrmClaim;

implementation

uses
  uModDO, uModelHelper, uDMClient;

{$R *.dfm}

procedure TfrmClaim.actAddExecute(Sender: TObject);
begin
  inherited;
//  TfrmCXMsgInfo.ShowSimpleMsg('Test', CDS);
  ShowDialogForm(TfrmDialogClaim);
end;

procedure TfrmClaim.actEditExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(CDS) then exit;
  if CDS.Eof then exit;
  ShowDialogForm(TfrmDialogClaim, CDS.FieldByName('claimfaktur_id').AsString);
end;

procedure TfrmClaim.actPrintExecute(Sender: TObject);
var
  id: string;
begin
  inherited;
  id:= CDS.FieldByName('claimfaktur_id').AsString;
  DmReport.ExecuteReport(
    'reports/Slip_Claim' ,
    DMReport.ReportClient.Claim_by_Id(id) ,
    []
  );
end;

procedure TfrmClaim.RefreshData;
begin
  inherited;
  try
    TAppUtils.cShowWaitWindow('Mohon Ditunggu');
    if Assigned(FCDS) then FreeAndNil(FCDS);

    CDS := TDBUtils.DSToCDS(
      DMClient.DSProviderClient.Claim_GetDSOverview(dtAwalFilter.Date,dtAkhirFilter.Date),
      Self
    );

    cxGridView.LoadFromCDS(CDS);
    cxGridView.SetVisibleColumns(['claimfaktur_id'],False);
  finally
    TAppUtils.cCloseWaitWindow;
  end;
end;

end.
