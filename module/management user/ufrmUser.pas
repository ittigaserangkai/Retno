unit ufrmUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ActnList, ufraFooter5Button,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, System.Actions, cxClasses,
  Datasnap.DBClient, ufrmMasterBrowse, uDMClient, uDBUtils, uClientClasses,
  dxBarBuiltInMenu, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxPC;

type
  TfrmUser = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
    FCDS: TClientDataSet;
    property CDS: TClientDataSet read FCDS write FCDS;
    { Private declarations }
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmUser: TfrmUser;

implementation

uses  uConn, uTSCommonDlg, ufrmDialogUser, uConstanta, uRetnoUnit, uDXUtils;

{$R *.dfm}

procedure TfrmUser.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogUser);
end;

procedure TfrmUser.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogUser, FCDS.FieldByName('AUT$USER_ID').AsString);
end;

procedure TfrmUser.RefreshData;
begin
  inherited;
  if Assigned(FCDS) then FreeAndNil(FCDS);
  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.AutUser_GetDSOverview ,Self );

  cxGridView.LoadFromCDS(CDS);
  cxGridView.SetVisibleColumns(['AUT$USER_ID','usr_password'],False);
end;


end.
