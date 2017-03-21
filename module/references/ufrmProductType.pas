unit ufrmProductType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster,  ufraFooter5Button, StdCtrls, ExtCtrls, ActnList,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, System.Actions, uDMClient,
  uClientClasses, uDBUtils, uDXUtils, DBClient, uAppUtils,
  uModBarang, ufrmMasterBrowse, dxBarBuiltInMenu, cxContainer, Vcl.ComCtrls,
  dxCore, cxDateUtils, Vcl.Menus, ufraFooter4Button, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxPC;

type
  TfrmProductType = class(TfrmMasterBrowse)
    cxGridViewColumn1: TcxGridDBColumn;
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
  frmProductType: TfrmProductType;

implementation

uses ufrmDialogProductType, uTSCommonDlg, Math, uConn, uConstanta, uInterface;

{$R *.dfm}

procedure TfrmProductType.FormCreate(Sender: TObject);
begin
  inherited;
  AutoRefreshData := true;
end;

procedure TfrmProductType.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogProductType);
end;

procedure TfrmProductType.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogProductType, cxGridView.DS.FieldByName('REF$TIPE_BARANG_ID').AsString);
end;

procedure TfrmProductType.RefreshData;
begin
  cxGridView.LoadFromDS(DMClient.DSProviderClient.RefTipeBarang_GetDSOverview, SELF);
  cxGridView.SetVisibleColumns(['REF$TIPE_BARANG_ID'], False);
end;

end.
