unit ufrmDialogPOFromTrader;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxMemo, cxButtonEdit, cxTextEdit, cxCurrencyEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls;

type
  TfrmDialogPOFromTrader = class(TfrmMasterDialog)
    pnl1: TPanel;
    lblPONo: TLabel;
    lblPODate: TLabel;
    lblLeadTime: TLabel;
    lblTOP: TLabel;
    lblIsMember: TLabel;
    lblOrganizasi: TLabel;
    lblDesc: TLabel;
    dtTgl: TcxDateEdit;
    edNoBukti: TcxTextEdit;
    edOrganization: TcxButtonEdit;
    edOrganizationName: TcxButtonEdit;
    edTipeMember: TcxTextEdit;
    edLeadTime: TcxTextEdit;
    edTOP: TcxTextEdit;
    memDescription: TcxMemo;
    cxGrid: TcxGrid;
    cxGridDBTablePOTrader: TcxGridDBTableView;
    cxGridColPODKode: TcxGridDBColumn;
    cxGridColPODNama: TcxGridDBColumn;
    cxGridColPODUOM: TcxGridDBColumn;
    cxGridColPODHarga: TcxGridDBColumn;
    cxGridColPODQty: TcxGridDBColumn;
    cxGridColPODDisc: TcxGridDBColumn;
    cxGridColPODPPN: TcxGridDBColumn;
    cxGridColPODTotal: TcxGridDBColumn;
    cxgrdlvlPOTrader: TcxGridLevel;
    lblSubTotal: TLabel;
    lblDisc: TLabel;
    lblPPN: TLabel;
    lblTotal: TLabel;
    edSubTotal: TcxCurrencyEdit;
    edDisc: TcxCurrencyEdit;
    edPPN: TcxCurrencyEdit;
    edTotal: TcxCurrencyEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialogPOFromTrader: TfrmDialogPOFromTrader;

implementation

{$R *.dfm}

end.
