unit ufrmCreditCard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Menus, System.Actions, Vcl.ActnList, ufraFooter4Button,
  cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC, Datasnap.DBClient;

  /// catatan
{
1 ID tidak usah ditapilkan di Grid
2.ID / card code tidak usah ditampilan
3.Ketika selesai simpan / hapus data klik refresh
4.Kredit
}

type
  TfrmCreditCard = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FCDS: TClientDataSet;
    property CDS: TClientDataSet read FCDS write FCDS;
  public
    procedure RefreshData; override;
  end;

var
  frmCreditCard: TfrmCreditCard;

implementation

uses
  ufrmDialogCreditCard, uDBUtils, uDMCLient, uDXUtils;

{$R *.dfm}

procedure TfrmCreditCard.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogCreditCard);
end;

procedure TfrmCreditCard.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogCreditCard, CDS.FieldByName('REF$CREDIT_CARD_ID').AsString);
end;

procedure TfrmCreditCard.FormDestroy(Sender: TObject);
begin
  inherited;
  frmCreditCard := nil;
end;

procedure TfrmCreditCard.RefreshData;
begin
  if Assigned(FCDS) then FreeAndNil(FCDS);
  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.RefCreditCard_GetDSOverview ,Self );
  cxGridView.LoadFromCDS(CDS);
  cxGridView.SetVisibleColumns(['REF$CREDIT_CARD_ID'],False);
end;

end.



