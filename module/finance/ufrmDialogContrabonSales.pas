unit ufrmDialogContrabonSales;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, Vcl.StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxGridLevel, cxGrid, cxCurrencyEdit, uDMClient,
  dxBarBuiltInMenu, cxPC, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar,
  Vcl.Menus, cxButtons;

type
  TfrmDialogContrabonSales = class(TfrmMasterDialog)
    pnlHeader: TPanel;
    lblSupMG: TLabel;
    lblAlamat: TLabel;
    lblPostCode: TLabel;
    lblTelp: TLabel;
    lblNPWP: TLabel;
    cbbSupplierMG: TcxExtLookupComboBox;
    edAddress: TcxTextEdit;
    edPostCode: TcxTextEdit;
    edTelp: TcxTextEdit;
    edNPWP: TcxTextEdit;
    cxgrdlvlContrabon: TcxGridLevel;
    cxGridContrabon: TcxGrid;
    cxGridTableContrabonSales: TcxGridTableView;
    cxGridColContDate: TcxGridColumn;
    cxGridColContAmountGross: TcxGridColumn;
    cxGridColContAmountAdj: TcxGridColumn;
    cxGridColContFee: TcxGridColumn;
    cxGridColContPPN: TcxGridColumn;
    cxGridColContAmountNet: TcxGridColumn;
    pnlLoadSales: TPanel;
    pnlHeaderLoad: TPanel;
    lblP1: TLabel;
    lblP2: TLabel;
    edP1: TcxDateEdit;
    edP2: TcxDateEdit;
    btnLoadSales: TcxButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialogContrabonSales: TfrmDialogContrabonSales;

implementation

{$R *.dfm}

end.
