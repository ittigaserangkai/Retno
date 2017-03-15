unit ufrmAuthor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter5Button, Grids,
  BaseGrid, AdvGrid, AdvCGrid, SUIButton, cbxbase, dblup1a, uSetAdvGrid,
  uNewAuthor, ufrmAuthorDialog;

type
  TfrmAuthor = class(TfrmMaster)
    pnlTop: TPanel;
    btnShow: TsuiButton;
    pnlMain: TPanel;
    fraFooter5Button1: TfraFooter5Button;
    grp1: TGroupBox;
    edtSearchKode: TEdit;
    edtSearchNama: TEdit;
    chkKode: TRadioButton;
    chkNama: TRadioButton;
    strgGrid: TAdvStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fraFooter5Button1btnAddClick(Sender: TObject);
    procedure fraFooter5Button1btnUpdateClick(Sender: TObject);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
  private
    { Private declarations }
    iY          : integer;
    FsetAdvGrd  : TSetAdvGrid;
    FAuth       : TAuthor;
    FfrmAuthDlg : TfrmAuthorDialog;
    procedure GetRec;
  public
    { Public declarations }
  end;

var
  frmAuthor: TfrmAuthor;

implementation

{$R *.dfm}
const
  _kolNo          : integer = 0;
  _kolID          : Integer = 1;
  _kolStatus      : Integer = 17;

procedure TfrmAuthor.GetRec;
var
  i : Integer;
  j : Integer;
begin
//  strgGrid := FsetAdvGrd.GetAdvGrd(FAuth.GetRec(edtSearchNama.Text,
//                      edtSearchKode.Text, chkNama.Checked, chkKode.Checked);
//  strgGrid.SelectRows(iY, 1);
//
//   for i:= strgGrid.FixedRows to strgGrid.RowCount -  1 do
//    begin
//      for j:= strgGrid.FixedCols to strgGrid.ColCount - 1 do
//      begin
//        if j in [_kolStatus] then
//        begin
//          if strgGrid.Ints[j  , i] = 1 then
//            strgGrid.AddCheckBox(j , i, True , False)
//          else
//            strgGrid.AddCheckBox(j, i, False , False);
//          strgGrid.Alignments[j,i]  := taCenter;
//          strgGrid.Cells[j, i]      := '';
//        end;
//      end;
//    end;

end;

procedure TfrmAuthor.FormCreate(Sender: TObject);
begin
  inherited;
  FsetAdvGrd  := TSetAdvGrid.CreateWithAdvGrd(Self, strgGrid);
  FAuth       := TAuthor.Create(nil);
  FfrmAuthDlg := TfrmAuthorDialog.Create(Self);
  iY          := strgGrid.FixedRows;
end;

procedure TfrmAuthor.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FsetAdvGrd.Free;
  FAuth.Free;
  FfrmAuthDlg.Free;
  FfrmAuthDlg:= nil;
  inherited;
end;

procedure TfrmAuthor.fraFooter5Button1btnAddClick(Sender: TObject);
begin
  inherited;
  FfrmAuthDlg.ShowWithAuthId;

end;

procedure TfrmAuthor.fraFooter5Button1btnUpdateClick(Sender: TObject);
begin
  inherited;
  FfrmAuthDlg.ShowWithAuthId(strgGrid.Cells[_kolID, iY]);
end;

procedure TfrmAuthor.strgGridRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  iY:= NewRow;
end;

end.
