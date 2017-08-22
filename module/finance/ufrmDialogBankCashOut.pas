unit ufrmDialogBankCashOut;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxMemo, cxLabel, cxDropDownEdit, cxCalendar,
  cxCurrencyEdit, cxButtonEdit, cxListView, cxTextEdit, cxMaskEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, dxBarBuiltInMenu,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB,
  cxDBData, cxSpinEdit, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxPC, uDMClient;

type
  TfrmDialogBankCashOut = class(TfrmMasterDialog)
    pnlDetail2: TPanel;
    cbBank: TcxExtLookupComboBox;
    lvSumary: TcxListView;
    lvCheque: TcxListView;
    edRefNum: TcxButtonEdit;
    edReceiveNum: TcxButtonEdit;
    ceSummaryDetail: TcxCurrencyEdit;
    beBusinessPartner: TcxButtonEdit;
    deReceiveDate: TcxDateEdit;
    memDesc: TcxMemo;
    lbl24: TcxLabel;
    lbl13: TcxLabel;
    lbl1: TcxLabel;
    lbl17: TcxLabel;
    lbl7: TcxLabel;
    lbl15: TcxLabel;
    lbl12: TcxLabel;
    cxgrdlvlAPList: TcxGridLevel;
    cxgrdDetail: TcxGrid;
    cxGridTableAPList: TcxGridTableView;
    cxgrdlvlOther: TcxGridLevel;
    cxGridTableOther: TcxGridTableView;
    cxgrdlvlCheque: TcxGridLevel;
    cxGridTableCheque: TcxGridTableView;
    cxGridColAPAP: TcxGridColumn;
    cxGridColAPTanggal: TcxGridColumn;
    cxGridColAPJatuhTempo: TcxGridColumn;
    cxGridColAPRekening: TcxGridColumn;
    cxGridColAPNominal: TcxGridColumn;
    cxGridColAPSisa: TcxGridColumn;
    cxGridColAPBayar: TcxGridColumn;
    cxGridColAPKeterangan: TcxGridColumn;
    cxGridColOtherKode: TcxGridColumn;
    cxGridColOtherNama: TcxGridColumn;
    cxGridColOtherBayar: TcxGridColumn;
    cxGridColOtherKeterangan: TcxGridColumn;
    cxGridColChequeNo: TcxGridColumn;
    cxGridColChequeJatuhTempo: TcxGridColumn;
    cxGridColChequeBayar: TcxGridColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialogBankCashOut: TfrmDialogBankCashOut;

implementation

{$R *.dfm}

end.
