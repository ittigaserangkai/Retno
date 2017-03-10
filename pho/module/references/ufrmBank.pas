unit ufrmBank;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls, Grids,
  ActnList, uConn, uRetnoUnit, uTSBaseClass,  System.Actions, DB, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, DBClient, uDMCLient, uClientClasses,
  ufrmMasterBrowse, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel;

type
  TfrmBank = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
    FCDS: TClientDataSet;
  resPoint: TPoint;
    property CDS: TClientDataSet read FCDS write FCDS;
  public
    procedure RefreshData; override;
  end;

var
  frmBank: TfrmBank;

implementation

uses
  uTSCommonDlg, ufrmDialogBank,  uConstanta, uDXUtils, uDBUtils;

{$R *.dfm}

procedure TfrmBank.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogBank);
end;

procedure TfrmBank.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogBank, CDS.FieldByName('Bank_ID').AsString);
end;

procedure TfrmBank.RefreshData;
begin
  if Assigned(FCDS) then FreeAndNil(FCDS);
  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.Bank_GetDSOverview ,Self );
  cxGridView.LoadFromCDS(CDS);
  cxGridView.SetVisibleColumns(['Bank_ID'],False);
end;

end.


