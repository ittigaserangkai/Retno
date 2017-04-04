unit ufrmDialogSO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxDBExtLookupComboBox,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxLookupEdit, cxDBLookupEdit;

type
  TfrmDialogSO = class(TfrmMasterDialog)
    pnlTop: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edtNoSO: TEdit;
    dtTgl: TcxDateEdit;
    pnl1: TPanel;
    lbl4: TLabel;
    btnAddOthersProdSO: TcxButton;
    btnToExcel: TcxButton;
    btnAddFromPOTrader: TcxButton;
    btnShow: TcxButton;
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    cxColNo: TcxGridDBColumn;
    cxColStatus: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    cxGridViewColumn4: TcxGridDBColumn;
    cxGridViewColumn5: TcxGridDBColumn;
    cxGridViewColumn7: TcxGridDBColumn;
    cxGridViewColumn8: TcxGridDBColumn;
    cxGridViewColumn9: TcxGridDBColumn;
    cxGridViewColumn11: TcxGridDBColumn;
    cxGridViewColumn12: TcxGridDBColumn;
    cxGridViewColumn13: TcxGridDBColumn;
    cxGridViewColumn14: TcxGridDBColumn;
    cxGridViewColumn15: TcxGridDBColumn;
    cxGridViewColumn16: TcxGridDBColumn;
    cxGridViewColumn17: TcxGridDBColumn;
    cxGridViewColumn18: TcxGridDBColumn;
    cxGridViewColumn19: TcxGridDBColumn;
    cxGridViewColumn20: TcxGridDBColumn;
    cxGridViewColumn31: TcxGridDBColumn;
    cxGridViewColumn32: TcxGridDBColumn;
    cxlvMaster: TcxGridLevel;
    cbbMerchanGroup: TcxExtLookupComboBox;
    cbbSupplierMerchGroup: TcxExtLookupComboBox;
    lblSuppMerGroup: TLabel;
    lblSuppMerGroupOpsional: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialogSO: TfrmDialogSO;

implementation

{$R *.dfm}

end.
