unit ufrmDialogJurnal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridLevel, cxGrid,
  cxCurrencyEdit, uDMClient, cxContainer, cxLabel, cxTextEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxMemo, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TfrmDialogJurnal = class(TfrmMasterDialog)
    pnlHeader: TPanel;
    cxgrdlvlDetail: TcxGridLevel;
    cxgrdJurnal: TcxGrid;
    cxGridTableJurnal: TcxGridTableView;
    cxGridColJurKode: TcxGridColumn;
    cxGridColJurNama: TcxGridColumn;
    cxGridColJurCostCenter: TcxGridColumn;
    cxGridColJurDescription: TcxGridColumn;
    cxGridColJurDebet: TcxGridColumn;
    cxGridColJurCredit: TcxGridColumn;
    lblNo: TcxLabel;
    lblJurnalDate: TcxLabel;
    lblReferensi: TcxLabel;
    lblDescription: TcxLabel;
    edNo: TcxTextEdit;
    dtTanggal: TcxDateEdit;
    memDesc: TcxMemo;
    edReference: TcxTextEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialogJurnal: TfrmDialogJurnal;

implementation

{$R *.dfm}

end.
