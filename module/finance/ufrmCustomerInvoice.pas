unit ufrmCustomerInvoice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterBrowse, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  System.Actions, Vcl.ActnList, ufraFooter4Button, Vcl.StdCtrls, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, ufrmDialogCustomerInvoice,
  Datasnap.DBClient, uDBUtils, uDMClient, System.DateUtils, uDXUtils;

type
  TfrmCustomerInvoice = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
    FCDS: TClientDataset;
    { Private declarations }
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmCustomerInvoice: TfrmCustomerInvoice;

implementation

{$R *.dfm}

procedure TfrmCustomerInvoice.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogCustomerInvoice)
end;

procedure TfrmCustomerInvoice.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogCustomerInvoice, FCDS.FieldByName('CustomerInvoice_id').AsString)
end;

procedure TfrmCustomerInvoice.RefreshData;
begin
  inherited;

  if Assigned(FCDS) then FreeAndNil(FCDS);
  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.CustomerInvoice_Overview(StartOfTheDay(dtAwalFilter.Date), EndOfTheDay(dtAkhirFilter.Date)) ,Self );
  cxGridView.LoadFromCDS(FCDS);
  cxGridView.SetVisibleColumns(['CUSTOMERINVOICE_ID', 'ci_organization_id',''],False);

end;

end.
