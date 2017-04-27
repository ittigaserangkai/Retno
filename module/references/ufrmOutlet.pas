unit ufrmOutlet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, ufraFooter5Button, StdCtrls, ExtCtrls,
  uConn, uRetnoUnit, System.Actions, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  Vcl.ActnList, uClientClasses, uDMClient, uDXUtils, uDBUtils, DBClient;

type
  TfrmOutlet = class(TfrmMasterBrowse)
    cxgrdbclmnOUTLET_ID: TcxGridDBColumn;
    cxgrdbclmnOUTLET_CODE: TcxGridDBColumn;
    cxgrdbclmnOUTLET_NAME: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
  protected
    procedure RefreshData; override;
  public
    { Public declarations }
  end;

var
  frmOutlet: TfrmOutlet;

implementation

uses uTSCommonDlg, ufrmDialogOutlet, uConstanta, uModOutlet;

{$R *.dfm}

procedure TfrmOutlet.FormCreate(Sender: TObject);
begin
  inherited;
  AutoRefreshData := true;
end;

procedure TfrmOutlet.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogOutlet);
end;

procedure TfrmOutlet.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogOutlet, cxGridView.DS.FieldByName('REF$OUTLET_ID').AsString)
end;

procedure TfrmOutlet.RefreshData;
begin
  inherited;
  cxGridView.LoadFromDS(DMClient.DSProviderClient.Outlet_GetDSLookup(), SELF);
  cxGridView.SetVisibleColumns(['REF$OUTLET_ID'], False);
end;

end.
