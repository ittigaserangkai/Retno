unit ufrmSO;

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
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, uAppUtils,
  uDXUtils, uDBUtils, Datasnap.DBClient, uDMClient, ufrmDialogSO, uInterface;

type
  TfrmSO = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
  private
    FCDS: TClientDataSet;
    property CDS: TClientDataSet read FCDS write FCDS;
    { Private declarations }
  protected
    procedure RefreshData; override;
  public
    destructor Destroy; override;
    { Public declarations }
  end;

var
  frmSO: TfrmSO;

implementation
uses
  System.DateUtils, uDMReport, uClientClasses;


{$R *.dfm}

destructor TfrmSO.Destroy;
begin
  inherited;
//  FreeAndNil(FCDS);
end;

procedure TfrmSO.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogSO);
end;

procedure TfrmSO.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogSO, CDS.FieldByName('SO_ID').AsString);
end;

procedure TfrmSO.actPrintExecute(Sender: TObject);
begin
  inherited;

  with dmReport do
  begin
    ExecuteReport( 'Slip_SO' ,
      ReportClient.SO_ByDateNoBukti(
      dtAwalFilter.Date, dtAkhirFilter.Date,
      CDS.FieldByName('SO_NO').AsString, CDS.FieldByName('SO_NO').AsString)
    );
  end;

end;

procedure TfrmSO.RefreshData;
begin
  inherited;
  try
    TAppUtils.cShowWaitWindow('Mohon Ditunggu');
    if Assigned(FCDS) then FreeAndNil(FCDS);

    CDS := TDBUtils.DSToCDS(
      DMClient.DSProviderClient.SO_GetDSOverview(dtAwalFilter.Date,dtAkhirFilter.Date, nil),
      Self
    );
    cxGridView.LoadFromCDS(FCDS);
    cxGridView.SetVisibleColumns(['AUT$UNIT_ID', 'SO_ID'],False);
  finally
    TAppUtils.cCloseWaitWindow;
  end;
end;

end.
