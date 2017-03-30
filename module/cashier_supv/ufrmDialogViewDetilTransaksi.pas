unit ufrmDialogViewDetilTransaksi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialogBrowse, ExtCtrls, StdCtrls,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid;

type
  TfrmDialogViewDetilTransaksi = class(TfrmMasterDialogBrowse)
    pnl2: TPanel;
    lbl1: TLabel;
    edtProductName: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
  private
    FData: TDataSet;
    procedure ParseDataTransaksiDetil;
  public
    property Data: TDataSet read FData write FData;
  end;

var
  frmDialogViewDetilTransaksi: TfrmDialogViewDetilTransaksi;

implementation

{$R *.dfm}

{
PRODUCT CODE
SELL PRICE
QTY
PPN
T O T A L
}
procedure TfrmDialogViewDetilTransaksi.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogViewDetilTransaksi.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogViewDetilTransaksi := nil;
end;

procedure TfrmDialogViewDetilTransaksi.ParseDataTransaksiDetil;
var i: Integer;
begin
  {with strgGrid do
  begin
    if not Data.IsEmpty then
    begin
      RowCount := Data.RecordCount + 2;
      i := 1;

      while not Data.Eof do
      begin
        Cells[0, i] := Data.fieldbyname('TRANSD_BRG_CODE').AsString;
        Cells[1, i] := Data.fieldbyname('TRANSD_SELL_PRICE').AsString;
        Cells[2, i] := Data.fieldbyname('TRANSD_QTY').AsString;
        Cells[3, i] := Data.fieldbyname('PPN').AsString;
        Cells[4, i] := Data.fieldbyname('TOTAL').AsString;
        Cells[5, i] := Data.fieldbyname('BRG_NAME').AsString;

        Alignments[1, i] := taRightJustify;
        Alignments[2, i] := taRightJustify;
        Alignments[3, i] := taRightJustify;
        Alignments[4, i] := taRightJustify;

        Inc(i);
        Data.Next;
      end;

      Alignments[1, i] := taRightJustify;
      Alignments[2, i] := taRightJustify;
      Alignments[3, i] := taRightJustify;
      Alignments[4, i] := taRightJustify;

      FloatingFooter.ColumnCalc[3] := acSUM;
      FloatingFooter.ColumnCalc[4] := acSUM;
    end
    else
    begin
      RowCount := 3;
      Cells[0, 1] := '';
      Cells[1, 1] := '';
      Cells[2, 1] := '';
      Cells[3, 1] := '';
      Cells[4, 1] := '';
    end;

    FixedRows := 1;
    AutoSize := True;

    edtProductName.Text := Cells[5, 1];
  end;
  }
end;

procedure TfrmDialogViewDetilTransaksi.FormShow(Sender: TObject);
begin
  inherited;
  ParseDataTransaksiDetil;
end;

procedure TfrmDialogViewDetilTransaksi.strgGridRowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
begin
  inherited;
//  edtProductName.Text := strgGrid.Cells[5, NewRow];
end;

end.
