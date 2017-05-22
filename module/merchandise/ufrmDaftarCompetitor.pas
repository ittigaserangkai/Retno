unit ufrmDaftarCompetitor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, ActnList, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, System.Actions,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  Datasnap.DBClient, cxCustomData, cxFilter, cxData;

type
  TfrmDaftarCompetitor = class(TfrmMasterBrowse)
    actAddDaftarKompetitor: TAction;
    actDeleteDaftarKompetitor: TAction;
    actEditDaftarKompetitor: TAction;
    actlstDaftarCompetitor: TActionList;
    actRefreshDaftarKompetitor: TAction;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FCDS: TClientDataSet;
    property CDS: TClientDataSet read FCDS write FCDS;
  public
    procedure RefreshData; override;
  end;

var
  frmDaftarCompetitor: TfrmDaftarCompetitor;

implementation

uses
  ufrmDialogDaftarKompetitor, uDBUtils, uDMClient, uDXUtils;

{$R *.dfm}

procedure TfrmDaftarCompetitor.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogDaftarKompetitor);
end;

procedure TfrmDaftarCompetitor.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogDaftarKompetitor, CDS.FieldByName('KOMPETITOR_ID').AsString);
end;

procedure TfrmDaftarCompetitor.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDaftarCompetitor := nil;
end;

procedure TfrmDaftarCompetitor.RefreshData;
begin
  inherited;
  if Assigned(FCDS) then FreeAndNil(FCDS);
  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.Kompetitor_GetDSOverview ,Self );
  cxGridView.LoadFromCDS(CDS);
  cxGridView.SetVisibleColumns(['KOMPETITOR_ID'],False);
end;

end.


