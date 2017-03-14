unit ufrmDialogPlafonTrader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ExtCtrls, StdCtrls, ComCtrls,
  uRetnoUnit, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit, System.Actions, Vcl.ActnList,
  ufraFooterDialog3Button;

type

  TfrmDialogPlafonTrader = class(TfrmMasterDialog)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edtCode: TEdit;
    edtName: TEdit;
    edtAddress: TEdit;
    bvl1: TBevel;
    Label1: TLabel;
    cbJenis: TComboBox;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edtPlafonEx: TcxCurrencyEdit;
    edtplafonin: TcxCurrencyEdit;
    edtPlafonTot: TcxCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure edtplafoninKeyPress(Sender: TObject; var Key: Char);
    procedure edtplafoninExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FIsProcessSuccessfull: Boolean;
    procedure SetIsProcessSuccessfull(const Value: Boolean);
  public
    TraderID: Integer;
    IDLokal: Integer;
    property IsProcessSuccessfull: Boolean read FIsProcessSuccessfull write
        SetIsProcessSuccessfull;
  published
  end;

var
  frmDialogPlafonTrader: TfrmDialogPlafonTrader;

implementation

uses uTSCommonDlg, DB, ufrmTrader;

const
  BOUND_COMBO_TEXT = 7;

{$R *.dfm}

procedure TfrmDialogPlafonTrader.SetIsProcessSuccessfull(const Value:
    Boolean);
begin
     FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogPlafonTrader.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogPlafonTrader.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogPlafonTrader := nil;
end;

procedure TfrmDialogPlafonTrader.edtplafoninKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = Chr(VK_RETURN)) then
    footerDialogMaster.btnSave.SetFocus;
end;

procedure TfrmDialogPlafonTrader.edtplafoninExit(Sender: TObject);
begin
  inherited;
  edtPlafonTot.Value:=edtPlafonEx.Value+edtplafonin.Value;
end;

procedure TfrmDialogPlafonTrader.FormShow(Sender: TObject);
begin
  inherited;
  edtplafonin.SetFocus;
  edtPlafonTot.Value:=edtPlafonEx.Value;
end;

end.




