unit ufrmCostCenter;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterBrowse, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, cxClasses,
  ufraFooter4Button, Vcl.StdCtrls, cxButtons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, DBClient, ufrmDialogCostCenter,
  dxBarBuiltInMenu, cxPC;

type
  TfrmCostCenter = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
    FCDS: TClientDataSet;
    { Private declarations }
  protected
    procedure RefreshData; override;
  public
    { Public declarations }
  end;

var
  frmCostCenter: TfrmCostCenter;

implementation
uses
  System.DateUtils, uDMClient,uDBUtils, uDXUtils;

{$R *.dfm}

procedure TfrmCostCenter.actAddExecute(Sender: TObject);
begin
  inherited;
  frmDialogCostCenter := TfrmDialogCostCenter.Create(nil);
  try
    frmDialogCostCenter.LoadData('00000000-0000-0000-0000-000000000000');
    frmDialogCostCenter.ShowModal;

    if frmDialogCostCenter.ModalResult = mrOk then
      actRefreshExecute(Sender);
  finally
    frmDialogCostCenter.Free;
  end;
end;

procedure TfrmCostCenter.actEditExecute(Sender: TObject);
begin
  inherited;
  frmDialogCostCenter := TfrmDialogCostCenter.Create(nil);
  try
    frmDialogCostCenter.LoadData(FCDS.FieldByName('COST_CENTER_ID').AsString);
    frmDialogCostCenter.ShowModal;

    if frmDialogCostCenter.ModalResult =mrOk then
      actRefreshExecute(Sender);
  finally
    frmDialogCostCenter.Free;
  end;
end;

procedure TfrmCostCenter.RefreshData;
begin
  if Assigned(FCDS) then FreeAndNil(FCDS);

  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.CostCenter_GetDSLookup(),Self );
  cxGridView.LoadFromCDS(FCDS);
  cxGridView.SetVisibleColumns(['COST_CENTER_ID'],False);
end;

end.
