unit ufrmMaintenancePassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, ActnList, uConn, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView, System.Actions,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  uClientClasses, uDBUtils, uDXUtils, uDSUtils;

type
  TfrmMaintenancePassword = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
  strict protected
  protected
    procedure RefreshData; override;
  public
    { Public declarations }
  end;

var
  frmMaintenancePassword: TfrmMaintenancePassword;

implementation

uses ufrmDialogMaintenancePassword, uTSCommonDlg, uDMClient;

{$R *.dfm}

procedure TfrmMaintenancePassword.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogMaintenancePassword);
end;

procedure TfrmMaintenancePassword.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogMaintenancePassword, cxGridView.DS.FieldByName('AUT$USER_ID').AsString);
end;

procedure TfrmMaintenancePassword.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmMaintenancePassword.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'CASHIER AND PASSWORD MAINTENANCE';
end;

procedure TfrmMaintenancePassword.RefreshData;
begin
  inherited;
  cxGridView.LoadFromDS(DMClient.DSProviderClient.AutUser_GetDSOverview, SELF);
  cxGridView.SetVisibleColumns(['AUT$USER_ID'], False);
end;

end.




