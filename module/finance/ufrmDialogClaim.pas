unit ufrmDialogClaim;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, Vcl.StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar,
  cxCurrencyEdit, cxMemo, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, uDMClient, cxGridBandedTableView, cxGridDBBandedTableView, Vcl.Menus,
  cxButtons;

type
  TfrmDialogClaim = class(TfrmMasterDialog)
    pnlHeader: TPanel;
    lblSupplier: TLabel;
    cbbSupplierMG: TcxExtLookupComboBox;
    lblTTF: TLabel;
    dtTglClaim: TcxDateEdit;
    edTTFNo: TcxTextEdit;
    lblTgkClaim: TLabel;
    lblDescription: TLabel;
    memDescription: TcxMemo;
    pnlSummary: TPanel;
    lblDO: TLabel;
    lblCN: TLabel;
    edNomGR: TcxCurrencyEdit;
    edCN: TcxCurrencyEdit;
    lblDN: TLabel;
    lblOther: TLabel;
    lblTotal: TLabel;
    edDN: TcxCurrencyEdit;
    edOther: TcxCurrencyEdit;
    edTotal: TcxCurrencyEdit;
    pnlData: TPanel;
    cxgrdClaim: TcxGrid;
    cxGridDBTableCN: TcxGridDBTableView;
    cxGridColCNNP: TcxGridDBColumn;
    cxGridColCNPO: TcxGridDBColumn;
    cxGridColCNTgl: TcxGridDBColumn;
    cxGridColCNNominal: TcxGridDBColumn;
    cxGridDBTableDN: TcxGridDBTableView;
    cxGridColDNNP: TcxGridDBColumn;
    cxGridColDNPO: TcxGridDBColumn;
    cxGridColDNTgl: TcxGridDBColumn;
    cxGridColDNNominal: TcxGridDBColumn;
    cxGridDBTableOther: TcxGridDBTableView;
    cxGridColOtherCostCenter: TcxGridDBColumn;
    cxGridColOtherAccountCode: TcxGridDBColumn;
    cxGridColOtherAccountName: TcxGridDBColumn;
    cxGridColOtherNominal: TcxGridDBColumn;
    cxGridDBTableGR: TcxGridDBBandedTableView;
    cxGridColGRNP: TcxGridDBBandedColumn;
    cxGridColGRPO: TcxGridDBBandedColumn;
    cxGridColGRNoFaktur: TcxGridDBBandedColumn;
    cxGridColGRTglFakturPajak: TcxGridDBBandedColumn;
    cxGridColGRNoFakturPajak: TcxGridDBBandedColumn;
    cxGridColGRNominalFakturPajak: TcxGridDBBandedColumn;
    cxGridColGRTglFaktur: TcxGridDBBandedColumn;
    cxGridColGRNominal: TcxGridDBBandedColumn;
    cxgrdlvlGR: TcxGridLevel;
    cxgrdlvlCN: TcxGridLevel;
    cxgrdlvlDN: TcxGridLevel;
    cxgrdlvlOther: TcxGridLevel;
    pnlButtonData: TPanel;
    bPoDetail: TcxButton;
    bViewAdjustment: TcxButton;
    bAddDN: TcxButton;
    bAddCN: TcxButton;
    actViewPO: TAction;
    actAddCN: TAction;
    actAddDN: TAction;
    actViewAdj: TAction;
    lblTglKembali: TLabel;
    dtReturnDate: TcxDateEdit;
    lblDueDate: TLabel;
    dtDueDate: TcxDateEdit;
    lblAkun: TLabel;
    cbbAccount: TcxExtLookupComboBox;
    edAKunHutang: TcxTextEdit;
    lblNoClaim: TLabel;
    edNoClaim: TcxTextEdit;
    Label1: TLabel;
    edNamaSupplierMG: TcxTextEdit;
    procedure actAddCNExecute(Sender: TObject);
    procedure actAddDNExecute(Sender: TObject);
    procedure actViewAdjExecute(Sender: TObject);
    procedure actViewPOExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialogClaim: TfrmDialogClaim;

implementation

{$R *.dfm}

procedure TfrmDialogClaim.actAddCNExecute(Sender: TObject);
begin
  inherited;
  ShowMessage('Look CN atas Supplier ini + add ke grid');
end;

procedure TfrmDialogClaim.actAddDNExecute(Sender: TObject);
begin
  inherited;
  ShowMessage('Look DN atas Supplier ini + add ke grid');
end;

procedure TfrmDialogClaim.actViewAdjExecute(Sender: TObject);
begin
  inherited;
  ShowMessage('LIhat Adjustment');
end;

procedure TfrmDialogClaim.actViewPOExecute(Sender: TObject);
begin
  inherited;
  ShowMessage('LIhat PO Detail');
end;

end.
