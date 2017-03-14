unit ufrmTipePembayaran;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls,
  ufraFooter5Button, ActnList, uConn, uRetnoUnit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, System.Actions, ufrmMaster, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, ufraFooter4Button, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, DBClient, uClientClasses, uDMClient,
  uDBUtils, uDXUtils, Vcl.Menus, cxButtons, dxBarBuiltInMenu, cxPC;

type
  TfrmTipePembayaran = class(TfrmMasterBrowse)
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
  protected
    procedure RefreshData; override;
  public
    { Public declarations }
  end;

var
  frmTipePembayaran: TfrmTipePembayaran;

implementation

uses uTSCommonDlg, ufrmDialogTipePembayaran,  uConstanta;

{$R *.dfm}

procedure TfrmTipePembayaran.actAddExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogTipePembayaran) then
    Application.CreateForm(TfrmDialogTipePembayaran, frmDialogTipePembayaran);

  RefreshData;
end;

procedure TfrmTipePembayaran.actEditExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogTipePembayaran) then
    Application.CreateForm(TfrmDialogTipePembayaran, frmDialogTipePembayaran);

  frmDialogTipePembayaran.LoadData(
    cxGridView.DS.FieldByName('REF$TIPE_PEMBAYARAN_ID').AsString);
  RefreshData;
end;

procedure TfrmTipePembayaran.RefreshData;
begin
  cxGridView.LoadFromDS(
    DMClient.DSProviderClient.TipePembayaran_GetDSOverview, Self);
end;

end.
