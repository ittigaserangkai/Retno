unit ufrmCreditCard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Menus, System.Actions, Vcl.ActnList, ufraFooter4Button,
  cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC;

  /// catatan
{
1 ID tidak usah ditapilkan di Grid
2.ID / card code tidak usah ditampilan
3.Ketika selesai simpan / hapus data klik refresh
4.Kredit
}

type
  TfrmCreditCard = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actRefreshCreditCardExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure AdvStrGridRowChanging(Sender: TObject; OldRow,
      NewRow: Integer; var Allow: Boolean);
  private
//    FCC : TCreditCard;
//    FSetAdvGrid : TSetAdvGrid;
    iY  : Integer;
    procedure ParseDataGrid();

  public
    { Public declarations }
  end;

var
  frmCreditCard: TfrmCreditCard;

implementation

uses ufrmDialogCreditCard, uTSCommonDlg, uRetnoUnit;

{$R *.dfm}
const
  _kolCardID      : Integer = 1;
  _kolCardNm      : Integer = 2;
  _kolIsCredit    : Integer = 3;
  _kolIsCashback  : Integer = 4;
  _kolIsActive    : Integer = 8;
  _kolIsKring     : Integer = 9;

procedure TfrmCreditCard.actAddExecute(Sender: TObject);
begin
  inherited;

  if not Assigned(frmDialogCreditCard) then
   frmDialogCreditCard := TfrmDialogCreditCard.Create(Self);

  SetFormPropertyAndShowDialog(frmDialogCreditCard);
end;

procedure TfrmCreditCard.actEditExecute(Sender: TObject);
begin
  inherited;

  if not Assigned(frmDialogCreditCard) then
    frmDialogCreditCard := TfrmDialogCreditCard.Create(Self);

//  frmDialogCreditCard.ShowWithCCId(AdvStrGrid.Ints[_kolCardID, iy]);
  SetFormPropertyAndShowDialog(frmDialogCreditCard);
end;

procedure TfrmCreditCard.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

//  FCC.Free;
//  FSetAdvGrid.Free;

  ////frmMain.DestroyMenu((Sender as TForm));
  Action := caFree;
end;

procedure TfrmCreditCard.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'CREDIT CARD AND DISCOUNT';

//  FSetAdvGrid := TSetAdvGrid.CreateWithAdvGrd(Self, AdvStrGrid);
//  FCC := TCreditCard.CreateWithUser(Self, FLoginId);
  iY := 1;
  ParseDataGrid();

end;

procedure TfrmCreditCard.FormDestroy(Sender: TObject);
begin
  inherited;
  frmCreditCard := nil;
end;

procedure TfrmCreditCard.actRefreshCreditCardExecute(Sender: TObject);
begin
  inherited;
  ParseDataGrid();
end;

procedure TfrmCreditCard.actRefreshExecute(Sender: TObject);
begin
  inherited;
  ParseDataGrid;
end;

procedure TfrmCreditCard.ParseDataGrid;
var
  i, j  : integer;

begin
   {
    AdvStrGrid := FSetAdvGrid.GetAdvGrd(FCC.GetRec(masternewunit.id));
    AdvStrGrid.ColWidths[_kolCardID] := 0;

    for i:= 1 to AdvStrGrid.RowCount -  1 do
    begin
      for j:= 1 to AdvStrGrid.ColCount - 1 do
      begin
        if j in [_kolIsCredit, _kolIsCashback, _kolIsActive, _kolIsKring] then
        begin
          if AdvStrGrid.Ints[j  , i] = 1 then
            AdvStrGrid.AddCheckBox(j , i, True , False)
          else
            AdvStrGrid.AddCheckBox(j, i, False , False);

          AdvStrGrid.Alignments[j,i]  := taCenter;
          AdvStrGrid.Cells[j, i]      := '';
        end;
      end;
    end; 
   }
end;


procedure TfrmCreditCard.AdvStrGridRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  iY := NewRow;

end;

end.



