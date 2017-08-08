unit ufrmBrowseQuotation;

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
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls;

type
  TfrmBrowseQuotation = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
    { Private declarations }
  protected
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmBrowseQuotation: TfrmBrowseQuotation;

implementation

uses
  ufrmDialogQuotation, uDMClient, uDXUtils;

{$R *.dfm}

procedure TfrmBrowseQuotation.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogQuotation);
end;

procedure TfrmBrowseQuotation.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogQuotation,
    cxGridView.DS.FieldByName('Quotation_ID').AsString);
end;

procedure TfrmBrowseQuotation.RefreshData;
begin
  cxGridView.LoadFromDS(
    DMClient.DSProviderClient.Quotation_GetDSOverview(dtAwalFilter.Date, dtAkhirFilter.Date),
    Self
  );
  cxGridView.SetVisibleColumns(['Quotation_ID'], False);
end;

end.
