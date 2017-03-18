unit ufrmSupplierType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls, ActnList,
  uConn, uRetnoUnit, DB, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, System.Actions, ufrmMasterBrowse, dxBarBuiltInMenu,
  cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, ufraFooter4Button,
  cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxPC,
  Datasnap.DBClient, uDMClient;

type
  TfrmSupplierType = class(TfrmMasterBrowse)
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    cxGridViewColumn4: TcxGridDBColumn;
    cxGridViewColumn5: TcxGridDBColumn;
    cxGridViewColumn6: TcxGridDBColumn;
    cxGridViewColumn7: TcxGridDBColumn;
    cxGridViewColumn8: TcxGridDBColumn;
    cxGridViewColumn9: TcxGridDBColumn;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
    FCDSBrowse: TClientDataset;
    property CDSBrowse: TClientDataset read FCDSBrowse write FCDSBrowse;
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmSupplierType: TfrmSupplierType;

implementation

uses uTSCommonDlg, Math,  uConstanta, uDXUtils,
  uDBUtils, uModSuplier, ufrmDialogSupplierType;

{$R *.dfm}

procedure TfrmSupplierType.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogSupplierType)
end;

procedure TfrmSupplierType.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogSupplierType,
  cxGridView.DS.FieldByName('REF$TIPE_SUPLIER_ID').AsString)
end;

procedure TfrmSupplierType.RefreshData;
begin
  CDSBrowse := TDBUtils.DSToCDS(
    DMClient.DSProviderClient.TipeSuplier_GetDSOverview(),self);
  cxGridView.LoadFromCDS(CDSBrowse);
end;

end.
