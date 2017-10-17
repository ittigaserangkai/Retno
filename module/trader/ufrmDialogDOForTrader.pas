unit ufrmDialogDOForTrader;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxMemo, cxButtonEdit, cxTextEdit, cxCurrencyEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, Vcl.StdCtrls;

type
  TfrmDialogDOForTrader = class(TfrmMasterDialog)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lblOrganizasi: TLabel;
    lblDesc: TLabel;
    dtTgl: TcxDateEdit;
    edNoBukti: TcxTextEdit;
    edOrganization: TcxButtonEdit;
    edOrganizationName: TcxButtonEdit;
    memDescription: TcxMemo;
    cxGrid: TcxGrid;
    cxGridDBTableDOTrader: TcxGridDBTableView;
    cxGridColPODKode: TcxGridDBColumn;
    cxGridColPODNama: TcxGridDBColumn;
    cxGridColPODUOM: TcxGridDBColumn;
    cxGridColPODHarga: TcxGridDBColumn;
    cxGridColPODQtyPO: TcxGridDBColumn;
    cxGridColPODDisc: TcxGridDBColumn;
    cxGridColPODPPN: TcxGridDBColumn;
    cxGridColPODTotal: TcxGridDBColumn;
    cxgrdlvlDOTrader: TcxGridLevel;
    edPONo: TcxButtonEdit;
    lblDONo: TLabel;
    lblDODate: TLabel;
    dtDODate: TcxDateEdit;
    lblSubTotal: TLabel;
    lblDisc: TLabel;
    lblPPN: TLabel;
    lblTotal: TLabel;
    edSubTotal: TcxCurrencyEdit;
    edDisc: TcxCurrencyEdit;
    edPPN: TcxCurrencyEdit;
    edTotal: TcxCurrencyEdit;
    cxGridColPODQtyDO: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialogDOForTrader: TfrmDialogDOForTrader;

implementation

{$R *.dfm}

end.
