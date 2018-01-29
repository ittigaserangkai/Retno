unit ufrmDialogTransferBarang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxMaskEdit, cxCalendar, cxTextEdit, Vcl.StdCtrls,uInterface,
  cxMemo, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxButtonEdit, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxGridCustomView, cxGrid;

type
  TfrmDialogTransferBarang = class(TfrmMasterDialog, ICRUDAble)
    pnlHeader: TPanel;
    lblNO: TLabel;
    edNO: TcxTextEdit;
    lblTanggal: TLabel;
    dtTanggal: TcxDateEdit;
    cbbGudang: TcxExtLookupComboBox;
    lblGudang: TLabel;
    cbbGudangTujuan: TcxExtLookupComboBox;
    lblGudangTujuan: TLabel;
    lblKeteranan: TLabel;
    memDesc: TcxMemo;
    cxgrdTransfer: TcxGrid;
    cxGridTableGR: TcxGridTableView;
    cxGridColPLU: TcxGridColumn;
    cxGridColNama: TcxGridColumn;
    cxGridColPLU_ID: TcxGridColumn;
    cxGridColQty: TcxGridColumn;
    cxGridColUOM: TcxGridColumn;
    cxgrdlvlTransfer: TcxGridLevel;
    lblNoRef: TLabel;
    edReferensi: TcxTextEdit;
  private
    { Private declarations }
  public
    procedure LoadData(AID : String);
    { Public declarations }
  end;

var
  frmDialogTransferBarang: TfrmDialogTransferBarang;

implementation

{$R *.dfm}

procedure TfrmDialogTransferBarang.LoadData(AID : String);
begin
  // TODO -cMM: TfrmMasterDialog1.LoadData default body inserted
end;

end.
