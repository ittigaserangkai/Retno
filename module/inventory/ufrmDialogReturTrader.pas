unit ufrmDialogReturTrader;

interface

uses
  Windows, SysUtils, Variants, Classes, Controls, Forms, ufrmMasterDialogBrowse,
  ExtCtrls, DateUtils, Mask, jpeg, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, cxLabel, cxButtons,
  cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit, cxButtonEdit,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.StdCtrls, ufrmMasterDialog, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxCurrencyEdit, cxMemo;

type
  TfrmDialogReturTrader = class(TfrmMasterDialog)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lblOrganizasi: TLabel;
    lblDesc: TLabel;
    lblDONo: TLabel;
    lblDODate: TLabel;
    lblSubTotal: TLabel;
    lblDisc: TLabel;
    lblPPN: TLabel;
    lblTotal: TLabel;
    lblGudang: TLabel;
    dtTgl: TcxDateEdit;
    edNoBukti: TcxTextEdit;
    edOrganization: TcxButtonEdit;
    edOrganizationName: TcxButtonEdit;
    memDescription: TcxMemo;
    edDONo: TcxButtonEdit;
    dtDODate: TcxDateEdit;
    edSubTotal: TcxCurrencyEdit;
    edDisc: TcxCurrencyEdit;
    edPPN: TcxCurrencyEdit;
    edTotal: TcxCurrencyEdit;
    cbbGudang: TcxExtLookupComboBox;
    cxGrid: TcxGrid;
    cxGridDBTableDOTrader: TcxGridDBTableView;
    cxGridColPODKode: TcxGridDBColumn;
    cxGridColPODNama: TcxGridDBColumn;
    cxGridColPODUOM: TcxGridDBColumn;
    cxGridColPODHarga: TcxGridDBColumn;
    cxGridColPODQtyPO: TcxGridDBColumn;
    cxGridColPODQtyDO: TcxGridDBColumn;
    cxGridColPODDisc: TcxGridDBColumn;
    cxGridColPODPPN: TcxGridDBColumn;
    cxGridColPODTotal: TcxGridDBColumn;
    cxgrdlvlDOTrader: TcxGridLevel;
  private
//    property IDRetur: Integer read GetIDRetur write SetIDRetur;
  public
    { Public declarations }
  end;

var
  frmDialogReturTrader: TfrmDialogReturTrader;


implementation

uses udmReport,  uRetnoUnit, Math, uTSCommonDlg;


{$R *.dfm}

// penekanan tombol di Key Down
end.






