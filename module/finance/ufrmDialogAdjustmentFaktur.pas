unit ufrmDialogAdjustmentFaktur;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  Vcl.StdCtrls, Vcl.ComCtrls, dxCore, cxDateUtils, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, cxMaskEdit, cxCalendar, cxLabel,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid,uDMClient, cxCurrencyEdit;

type
  TfrmDialogAdjustmentFaktur = class(TfrmMasterDialog)
    pnlHeader: TPanel;
    cxGridAdjFakturItem: TcxGrid;
    cxGridDBTableAdjFakturItem: TcxGridDBTableView;
    cxgrdlvlAdjFakturItem: TcxGridLevel;
    cxgridColAdjItemProductCode: TcxGridDBColumn;
    cxgridColAdjItemProductName: TcxGridDBColumn;
    cxgridColAdjItemQty: TcxGridDBColumn;
    cxgridColAdjItemUnitPrice: TcxGridDBColumn;
    cxgridColAdjItemDiscount: TcxGridDBColumn;
    cxgridColAdjItemPPN: TcxGridDBColumn;
    cxgridColAdjItemPPNBM: TcxGridDBColumn;
    pnlHeaderSatu: TPanel;
    lblNoBukti: TLabel;
    lblTglBukti: TLabel;
    lblSupplierMG: TLabel;
    lblReferensi: TLabel;
    edNoBukti: TcxTextEdit;
    edTglBukti: TcxDateEdit;
    cbbSupplierMG: TcxExtLookupComboBox;
    lblPO: TcxLabel;
    cbbNP: TcxExtLookupComboBox;
    cbbPO: TcxExtLookupComboBox;
    lblGaring: TcxLabel;
    edReferenei: TcxTextEdit;
    pnlHeaderDua: TPanel;
    pnlDO: TPanel;
    pnlAdj: TPanel;
    lblSubTotal: TLabel;
    lblDiskon: TLabel;
    lblPPN: TLabel;
    lblPPNBM: TLabel;
    lblTotal: TLabel;
    edSubTotal: TcxCurrencyEdit;
    edDiskon: TcxCurrencyEdit;
    edPPN: TcxCurrencyEdit;
    edPPNBM: TcxCurrencyEdit;
    edTotal: TcxCurrencyEdit;
    lblAdjSubTotal: TLabel;
    lblAdjDiskon: TLabel;
    lblAdjPPN: TLabel;
    lblAdjPPNBM: TLabel;
    lblAdjTotal: TLabel;
    edAdjSubTotal: TcxCurrencyEdit;
    edAdjDiskon: TcxCurrencyEdit;
    edAdjPPN: TcxCurrencyEdit;
    edAdjPPNBM: TcxCurrencyEdit;
    edAdjTotal: TcxCurrencyEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialogAdjustmentFaktur: TfrmDialogAdjustmentFaktur;

implementation

{$R *.dfm}

end.
