unit ufrmPopupGrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, cxControls, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxButtons;

type
  TfrmPopupGrid = class(TForm)
    PnlFooter: TPanel;
    pnlFooterBtn: TPanel;
    btnClose: TcxButton;
    pnlSortCut: TPanel;
    pnlBody: TPanel;
    pnlHeader: TPanel;
    lblHeader: TLabel;
    lblTopHeader: TLabel;
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    cxlvMaster: TcxGridLevel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure advclmngrdCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
  private
    FSQL: string;
    procedure SetData;
    { Private declarations }
  public
    procedure Init(aSql: string; aCaptionHeader: string='');
    { Public declarations }
  end;

var
  frmPopupGrid: TfrmPopupGrid;

implementation
uses
  uRetnoUnit;

{$R *.dfm}

procedure TfrmPopupGrid.Init(aSql: string; aCaptionHeader: string='');
begin
  FSQL  := aSql;

  if aCaptionHeader = '' then
  begin
    pnlHeader.Visible := False;
  end
  else
    lblHeader.Caption := aCaptionHeader;
end;

procedure TfrmPopupGrid.SetData;
var
  i: Integer;
  aColWidth: Integer;
  aRowHight: integer;
begin
  {cQueryToGrid(FSQL, clmngrd);

  aColWidth := 0;
  //cek apakah ada data
  if advclmngrd.Cells[1, clmngrd.RowCount - 1] <> '' then
  begin
    for i := 0 to  advclmngrd.ColCount - 1 do
    begin
      advclmngrd.AutoSizeCol(i);
      aColWidth := aColWidth + advclmngrd.ColWidths[i];
    end;

    if Self.Width < aColWidth then
    begin
      if Screen.Width - 100 < aColWidth then
        Self.Width := Screen.Width - 100
      else
        Self.Width := aColWidth + 20;
    end;

    aRowHight := 0;
    for i := 0 to advclmngrd.RowCount - 1 do
    begin
      aRowHight := aRowHight + advclmngrd.RowHeights[i];
    end;

    if Self.Height < aRowHight then
    begin
      if Screen.Height - 50 < aRowHight then
        Self.Height := Screen.Height - 50
      else
        Self.Width := aRowHight + 20 + pnlHeader.Height + PnlFooter.Height;
    end;
  end;
  }
end;

procedure TfrmPopupGrid.FormShow(Sender: TObject);
begin
  SetData;
end;

procedure TfrmPopupGrid.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmPopupGrid.FormDestroy(Sender: TObject);
begin
  frmPopupGrid := nil;
end;

procedure TfrmPopupGrid.advclmngrdCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := False;
end;

end.
