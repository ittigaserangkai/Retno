unit ufrmDiscountMember;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, ufraFooter5Button, StdCtrls, ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Menus, System.Actions, Vcl.ActnList, ufraFooter4Button,
  cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC;

type
  TfrmDiscountMember = class(TfrmMasterBrowse)
    fraFooter5Button1: TfraFooter5Button;
    pnlTop: TPanel;
    btnShow: TcxButton;
    grp1: TGroupBox;
    edtSearchKode: TEdit;
    edtSearchNama: TEdit;
    chkKode: TCheckBox;
    chkNama: TCheckBox;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fraFooter5Button1btnCloseClick(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FLoginId    : Integer;
    FUnitID     : Integer;
    iY          : integer;
//    FsetAdvGrd  : TSetAdvGrid;
//    FDiscMem    : TDiscountMember;
    procedure GetRec;
  public
    { Public declarations }
  end;

var
  frmDiscountMember: TfrmDiscountMember;

implementation
uses  uTSCommonDlg, uRetnoUnit, ufrmDialogDiscountMember;
{$R *.dfm}


const
  _KolNo    : Integer = 0;
  _kolId    : Integer = 1;
  _KolNm    : Integer = 2;
  _KolMin   : Integer = 3;
  _KolMax   : Integer = 4;
  _KolDisc  : Integer = 5;

procedure TfrmDiscountMember.actAddExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogDiscountMember) then
  frmDialogDiscountMember   := TfrmDialogDiscountMember.Create(self);

  frmDialogDiscountMember.ShowWithId(FUnitID, FLoginId);
  GetRec;
end;

procedure TfrmDiscountMember.actEditExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogDiscountMember) then
  frmDialogDiscountMember   := TfrmDialogDiscountMember.Create(self);

//  frmDialogDiscountMember.ShowWithId(FUnitID, FLoginId, strgGrid.Ints[_kolId, iY]);
  GetRec;
end;

procedure TfrmDiscountMember.actRefreshExecute(Sender: TObject);
begin
  inherited;
  GetRec;
end;

procedure TfrmDiscountMember.GetRec;
begin
  {
  strgGrid := FsetAdvGrd.GetAdvGrd(FDiscMem.GetRec(edtSearchNama.Text,
                      edtSearchKode.Text, chkNama.Checked, chkKode.Checked, MasterNewUnit.ID));
  strgGrid.SelectRows(iY, 1);
  strgGrid.ColWidths[_KolMin] := 125;
  strgGrid.ColWidths[_KolMax] := 125;
  strgGrid.ColWidths[_KolNm]  := 150;
  strgGrid.ColWidths[_kolId]  := 0;
  }
end;

procedure TfrmDiscountMember.strgGridRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  Iy := newRow;
end;

procedure TfrmDiscountMember.FormDestroy(Sender: TObject);
begin
//  FreeAndNil(FDiscMem);
//  FreeAndNil(FsetAdvGrd);
  frmDiscountMember := nil;
  inherited;
end;

procedure TfrmDiscountMember.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action  := caFree;
end;

procedure TfrmDiscountMember.fraFooter5Button1btnCloseClick(
  Sender: TObject);
begin
  inherited;
  fraFooter5Button1.btnCloseClick(Sender);

end;

procedure TfrmDiscountMember.btnShowClick(Sender: TObject);
begin
  inherited;
  GetRec;
end;

procedure TfrmDiscountMember.FormShow(Sender: TObject);
begin
  inherited;
  FUnitID     := FLoginUnitId;
  FLoginId    := FLoginId;
//  FDiscMem    := TDiscountMember.Create(nil);
//  FsetAdvGrd  := TSetAdvGrid.CreateWithAdvGrd(Self, strgGrid);
//  iY          := strgGrid.FixedRows;
  GetRec;
end;

end.
