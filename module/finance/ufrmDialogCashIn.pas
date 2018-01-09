unit ufrmDialogCashIn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxPCdxBarPopupMenu, cxStyles, Menus, cxContainer,
  cxEdit, cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, ImgList,
  dxBar, cxDBEditRepository, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, DBClient, cxCheckBox,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls, cxLabel,
  cxButtons, cxGridLevel, cxPC, ComCtrls, cxMemo, cxCurrencyEdit, cxButtonEdit,
  cxListView, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  cxSpinEdit, dxCore, cxDateUtils, dxBarBuiltInMenu, cxNavigator, uDMClient;

type
  TfrmDialogCashIn = class(TfrmMasterDialog)
    pnlDetail2: TPanel;
    cbBank: TcxExtLookupComboBox;
    lvSumary: TcxListView;
    lvCheque: TcxListView;
    edRefNum: TcxButtonEdit;
    edReceiveNum: TcxButtonEdit;
    ceNominal: TcxCurrencyEdit;
    ceSummaryDetail: TcxCurrencyEdit;
    beBusinessPartner: TcxButtonEdit;
    deReceiveDate: TcxDateEdit;
    lblRef: TcxLabel;
    lbl12: TcxLabel;
    lblTglBukti: TcxLabel;
    lbl15: TcxLabel;
    lblOrg: TcxLabel;
    lblNoBukti: TcxLabel;
    lbl7: TcxLabel;
    memDesc: TcxMemo;
    cxgrdlvlDetail: TcxGridLevel;
    cxgrdDetail: TcxGrid;
    cxGridTableAR: TcxGridTableView;
    cxgrdlvlNewAP: TcxGridLevel;
    cxGridTableNewAP: TcxGridTableView;
    cxgrdlvlOI: TcxGridLevel;
    cxGridTableOI: TcxGridTableView;
    cxgrdlvlCheque: TcxGridLevel;
    cxGridDBTableCheque: TcxGridDBTableView;
    cxGridColGridTableARColumn1: TcxGridColumn;
    cxGridColGridTableARColumn2: TcxGridColumn;
    cxGridColGridTableARColumn3: TcxGridColumn;
    cxGridColGridTableARColumn4: TcxGridColumn;
    cxGridColGridTableARColumn5: TcxGridColumn;
    cxGridColGridTableARColumn6: TcxGridColumn;
    cxGridColGridTableARColumn7: TcxGridColumn;
    cxGridColGridTableARColumn8: TcxGridColumn;
    cxGridColGridTableNewAPColumn1: TcxGridColumn;
    cxGridColGridTableNewAPColumn2: TcxGridColumn;
    cxGridColGridTableNewAPColumn3: TcxGridColumn;
    cxGridColGridTableNewAPColumn4: TcxGridColumn;
    cxGridColGridTableNewAPColumn5: TcxGridColumn;
    cxGridColGridTableOIColumn1: TcxGridColumn;
    cxGridColGridTableOIColumn2: TcxGridColumn;
    cxGridColGridTableOIColumn3: TcxGridColumn;
    cxGridColGridTableOIColumn4: TcxGridColumn;
    cxGridColGridDBTableChequeColumn1: TcxGridDBColumn;
    cxGridColGridDBTableChequeColumn2: TcxGridDBColumn;
    cxGridColGridDBTableChequeColumn3: TcxGridDBColumn;
    cxGridColGridDBTableChequeColumn4: TcxGridDBColumn;
    edNamaOrganization: TcxButtonEdit;
    cxGridColGridTableNewAPColumn6: TcxGridColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialogCashIn: TfrmDialogCashIn;

implementation

{$R *.dfm}

end.
