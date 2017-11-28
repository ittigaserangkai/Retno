unit ufrmMasterCustomer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDMClient, ufrmMasterBrowse,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Menus, System.Actions, Vcl.ActnList, ufraFooter4Button,
  Vcl.StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxLabel, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, uDXUtils,
  uDBUtils, ufrmDialogMasterCustomer, uModCustomer;

type
  TfrmMasterCustomer = class(TfrmMasterBrowse)
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    cxGridViewColumn4: TcxGridDBColumn;
    cxGridViewColumn5: TcxGridDBColumn;
    procedure actAddExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmMasterCustomer: TfrmMasterCustomer;

implementation

{$R *.dfm}

procedure TfrmMasterCustomer.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogMasterCustomer);
end;

procedure TfrmMasterCustomer.RefreshData;
begin
  inherited;
  cxGridView.PrepareFromCDS(
    TDBUtils.DSToCDS(DMClient.DSProviderClient.Customer_GetDSOverview(),Self) );
end;

end.
